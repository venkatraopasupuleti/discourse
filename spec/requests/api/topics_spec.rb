# frozen_string_literal: true
require 'swagger_helper'

describe 'posts' do

  let(:'Api-Key') { Fabricate(:api_key).key }
  let(:'Api-Username') { 'system' }

  path '/t/{id}/posts.json' do
    get 'Get specific posts from a topic' do
      tags 'Topics'
      consumes 'application/json'
      parameter name: 'Api-Key', in: :header, type: :string, required: true
      parameter name: 'Api-Username', in: :header, type: :string, required: true
      parameter name: :id, in: :path, schema: { type: :string }

      parameter name: :post_body, in: :body, schema: {
        type: :object,
        properties: {
          'post_ids[]': { type: :integer}
        }, required: [ 'post_ids[]' ]
      }

      produces 'application/json'
      response '200', 'specific posts' do
        schema type: :object, properties: {
          post_stream: {
            type: :object,
            properties: {
              posts: {
                type: :array,
                items: {
                  type: :object,
                  properties: {
                    id: { type: :integer },
                    name: { type: :string, nullable: true },
                    username: { type: :string },
                    avatar_template: { type: :string },
                    created_at: { type: :string },
                    cooked: { type: :string },
                    post_number: { type: :integer },
                    post_type: { type: :integer },
                    updated_at: { type: :string },
                    reply_count: { type: :integer },
                    reply_to_post_number: { type: :string, nullable: true },
                    quote_count: { type: :integer },
                    incoming_link_count: { type: :integer },
                    reads: { type: :integer },
                    readers_count: { type: :integer },
                    score: { type: :integer },
                    yours: { type: :boolean },
                    topic_id: { type: :integer },
                    topic_slug: { type: :string },
                    display_username: { type: :string, nullable: true },
                    primary_group_name: { type: :string, nullable: true },
                    primary_group_flair_url: { type: :string, nullable: true },
                    primary_group_flair_bg_color: { type: :string, nullable: true },
                    primary_group_flair_color: { type: :string, nullable: true },
                    version: { type: :integer },
                    can_edit: { type: :boolean },
                    can_delete: { type: :boolean },
                    can_recover: { type: :boolean },
                    can_wiki: { type: :boolean },
                    read: { type: :boolean },
                    user_title: { type: :string, nullable: true },
                    actions_summary: {
                      type: :array,
                      items: {
                        type: :object,
                        properties: {
                          id: { type: :integer },
                          can_act: { type: :boolean },
                        }
                      },
                    },
                    moderator: { type: :boolean },
                    admin: { type: :boolean },
                    staff: { type: :boolean },
                    user_id: { type: :integer },
                    hidden: { type: :boolean },
                    trust_level: { type: :integer },
                    deleted_at: { type: :string, nullable: true },
                    user_deleted: { type: :boolean },
                    edit_reason: { type: :string, nullable: true },
                    can_view_edit_history: { type: :boolean },
                    wiki: { type: :boolean },
                    reviewable_id: { type: :integer },
                    reviewable_score_count: { type: :integer },
                    reviewable_score_pending_count: { type: :integer },
                  }
                },
              },
            }
          },
          id: { type: :integer },
        }

        let(:post_body) { { 'post_ids[]': 1 } }
        let(:id) { Fabricate(:topic).id }

        run_test!
      end
    end
  end

end
