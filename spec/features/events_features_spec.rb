require 'spec_helper'

describe "Events" do

  context "When API fully functional" do
    before :all do
      load "#{Rails.root}/db/seeds.rb" 
    end

    before :each do
      user = FactoryGirl.create(:user)
      user.add_role :admin
      sign_in_user(user)
      mock_api
    end

    it "should successfully connect to the api" do
      VCR.use_cassette('api') do
        visit '/api/setup'
        page.should have_content("Test API")
        click_button "Test API"
      end
    end

    it "should show the events page" do
    end
  end

end
