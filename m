Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A593A10E87
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 18:58:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DE510E45A;
	Tue, 14 Jan 2025 17:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="RIcucp9f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C7810E45A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 17:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1736877483;
 bh=uI2jVIEACIwlosWoUvhmG7oLqSycVp5dzwis05sLrgA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RIcucp9fVig/9IImlRPr4sRX3wo2aY+6LozDOjzlcSyZOAp/djc8C0WTeZ6WYgCE6
 JpDWmBWfNxLoJINSb3y80BOHRx874GykXOLatXdWinT+vimuCBBqb1oIpNNPw9JLrK
 RxjAI+pV81VMtRDl1+0aV2jMuRvXoalosm2/YdqR5ObVzP2WRpoC/3cLkGquO8OqWV
 tQbJIZAR3VRNj56qEVBLQWhnChbKkWolDc/n9boX5YBsfYjhCo9xA5QzcNtDPDp/0t
 Vz/VEEr7TsndzUHtvW0x4SaIsYvZTKUr8jSP2vGOj/Lc4AR0Y7Zne0TKsryVTlDFeb
 tMfoekKKEGcJQ==
Received: from [192.168.1.90] (unknown [82.76.59.196])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 122F917E0CD2;
 Tue, 14 Jan 2025 18:58:03 +0100 (CET)
Message-ID: <81d36d57-7661-410b-b5e9-bd7af44686f0@collabora.com>
Date: Tue, 14 Jan 2025 19:58:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/tests: hdmi: Add connector's CRTC deactivation
 tests
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250109-hdmi-conn-null-mode-v2-0-9eeaf1109547@collabora.com>
 <20250109-hdmi-conn-null-mode-v2-2-9eeaf1109547@collabora.com>
 <20250114-silky-nippy-woodlouse-0f6d4a@houat>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <20250114-silky-nippy-woodlouse-0f6d4a@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 1/14/25 7:41 PM, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Jan 09, 2025 at 12:03:40AM +0200, Cristian Ciocaltea wrote:
>> Following up a fixed bug in drm_atomic_helper_connector_hdmi_check(),
>> discovered while unloading a DRM module, add a couple of tests to make
>> sure the helper will not exhibit any abnormal behaviour for use cases
>> that involve shutting down the connector's CRTC.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 173 +++++++++++++++++++++
>>  1 file changed, 173 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> index c3b693bb966f1f8b04066d19f520bfa4bf11c23d..98187ecee5d77b5f758af29f4c4bfddbd1f658fd 100644
>> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> @@ -1568,6 +1568,177 @@ static void drm_test_check_output_bpc_format_display_8bpc_only(struct kunit *tes
>>  	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_RGB);
>>  }
>>  
>> +/*
>> + * Test that if we deactivate connector's CRTC, we trigger a mode change
>> + * on that CRTC, along with setting {connectors|active}_changed.
>> + */
>> +static void drm_test_check_crtc_deactivate_mode_changed(struct kunit *test)
>> +{
>> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
>> +	struct drm_modeset_acquire_ctx *ctx;
>> +	struct drm_connector_state *old_conn_state;
>> +	struct drm_connector_state *new_conn_state;
>> +	struct drm_crtc_state *old_crtc_state;
>> +	struct drm_crtc_state *new_crtc_state;
>> +	struct drm_atomic_state *state;
>> +	struct drm_display_mode *preferred;
>> +	struct drm_connector *conn;
>> +	struct drm_device *drm;
>> +	struct drm_crtc *crtc;
>> +	int ret;
>> +
>> +	priv = drm_kunit_helper_connector_hdmi_init(test,
>> +						    BIT(HDMI_COLORSPACE_RGB),
>> +						    8);
>> +	KUNIT_ASSERT_NOT_NULL(test, priv);
>> +
>> +	conn = &priv->connector;
>> +	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
>> +
>> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
>> +
>> +	preferred = find_preferred_mode(conn);
>> +	KUNIT_ASSERT_NOT_NULL(test, preferred);
>> +
>> +	drm = &priv->drm;
>> +	crtc = priv->crtc;
>> +	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>> +	KUNIT_ASSERT_EQ(test, ret, 0);
>> +
>> +	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
>> +
>> +	new_conn_state = drm_atomic_get_connector_state(state, conn);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
>> +
>> +	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
>> +
>> +	new_crtc_state = drm_atomic_get_crtc_state(state, crtc);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_crtc_state);
>> +
>> +	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_crtc_state);
>> +
>> +	ret = drm_atomic_set_mode_for_crtc(new_crtc_state, NULL);
>> +	KUNIT_EXPECT_EQ(test, ret, 0);
>> +	KUNIT_ASSERT_NE(test, old_crtc_state->enable, new_crtc_state->enable);
>> +
>> +	new_crtc_state->active = false;
>> +	KUNIT_ASSERT_NE(test, old_crtc_state->active, new_crtc_state->active);
>> +
>> +	ret = drm_atomic_set_crtc_for_connector(new_conn_state, NULL);
>> +	KUNIT_ASSERT_EQ(test, ret, 0);
>> +
>> +	KUNIT_ASSERT_PTR_NE(test, old_conn_state->crtc, new_conn_state->crtc);
>> +
>> +	ret = drm_atomic_check_only(state);
>> +	KUNIT_ASSERT_EQ(test, ret, 0);
>> +
>> +	new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_crtc_state);
>> +	KUNIT_EXPECT_TRUE(test, new_crtc_state->mode_changed);
>> +	KUNIT_EXPECT_TRUE(test, new_crtc_state->connectors_changed);
>> +	KUNIT_EXPECT_TRUE(test, new_crtc_state->active_changed);
>> +}
> 
> This one looks good to me
> 
>> +/*
>> + * Test that if we deactivate connector's CRTC, while changing the max
>> + * bpc property to a different value, will not have any effect on the
>> + * output bpc property. However, we still trigger a mode change on that
>> + * CRTC, along with setting {connectors|active}_changed.
>> + */
>> +static void drm_test_check_crtc_deactivate_output_bpc_not_changed(struct kunit *test)
>> +{
>> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
>> +	struct drm_modeset_acquire_ctx *ctx;
>> +	struct drm_connector_state *old_conn_state;
>> +	struct drm_connector_state *new_conn_state;
>> +	struct drm_crtc_state *old_crtc_state;
>> +	struct drm_crtc_state *new_crtc_state;
>> +	struct drm_atomic_state *state;
>> +	struct drm_display_mode *preferred;
>> +	struct drm_connector *conn;
>> +	struct drm_device *drm;
>> +	struct drm_crtc *crtc;
>> +	int ret;
>> +
>> +	priv = drm_kunit_helper_connector_hdmi_init(test,
>> +						    BIT(HDMI_COLORSPACE_RGB),
>> +						    10);
>> +	KUNIT_ASSERT_NOT_NULL(test, priv);
>> +
>> +	conn = &priv->connector;
>> +	ret = set_connector_edid(test, conn,
>> +				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
>> +				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
>> +	KUNIT_ASSERT_GT(test, ret, 0);
>> +
>> +	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
>> +
>> +	preferred = find_preferred_mode(conn);
>> +	KUNIT_ASSERT_NOT_NULL(test, preferred);
>> +
>> +	drm = &priv->drm;
>> +	crtc = priv->crtc;
>> +	ret = light_up_connector(test, drm, crtc, conn, preferred, ctx);
>> +	KUNIT_ASSERT_EQ(test, ret, 0);
>> +
>> +	state = drm_kunit_helper_atomic_state_alloc(test, drm, ctx);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
>> +
>> +	new_conn_state = drm_atomic_get_connector_state(state, conn);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
>> +
>> +	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
>> +
>> +	new_conn_state->max_requested_bpc = 8;
>> +
>> +	KUNIT_ASSERT_NE(test,
>> +			old_conn_state->max_requested_bpc,
>> +			new_conn_state->max_requested_bpc);
>> +
>> +	new_crtc_state = drm_atomic_get_crtc_state(state, crtc);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_crtc_state);
>> +
>> +	old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_crtc_state);
>> +
>> +	ret = drm_atomic_set_mode_for_crtc(new_crtc_state, NULL);
>> +	KUNIT_EXPECT_EQ(test, ret, 0);
>> +	KUNIT_ASSERT_NE(test, old_crtc_state->enable, new_crtc_state->enable);
>> +
>> +	new_crtc_state->active = false;
>> +	KUNIT_ASSERT_NE(test, old_crtc_state->active, new_crtc_state->active);
>> +
>> +	ret = drm_atomic_set_crtc_for_connector(new_conn_state, NULL);
>> +	KUNIT_ASSERT_EQ(test, ret, 0);
>> +
>> +	KUNIT_ASSERT_PTR_NE(test, old_conn_state->crtc, new_conn_state->crtc);
>> +
>> +	ret = drm_atomic_check_only(state);
>> +	KUNIT_ASSERT_EQ(test, ret, 0);
>> +
>> +	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
>> +
>> +	new_conn_state = drm_atomic_get_new_connector_state(state, conn);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_conn_state);
>> +
>> +	KUNIT_EXPECT_EQ(test,
>> +			old_conn_state->hdmi.output_bpc,
>> +			new_conn_state->hdmi.output_bpc);
>> +
>> +	new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_crtc_state);
>> +	KUNIT_EXPECT_TRUE(test, new_crtc_state->mode_changed);
>> +	KUNIT_EXPECT_TRUE(test, new_crtc_state->connectors_changed);
>> +	KUNIT_EXPECT_TRUE(test, new_crtc_state->active_changed);
>> +}
>> +
> 
> However, it's not clear to me why changing bpc should change anything,
> or why it's worth testing?

I suppose I may have gone a little too far with all this testing :-) 
Will drop and send v3.

Thanks for reviewing,
Cristian
