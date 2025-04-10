Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D734A841AA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 13:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50F710E109;
	Thu, 10 Apr 2025 11:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jpYt/8HD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F68E10E109
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 11:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744284235;
 bh=H1MOL01bOC2XjD4KcBtXBweTCA9sLh6CPjez1MjmAig=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jpYt/8HD2/WtWOcV0oU0Wb11l8Fv2FAQTVcngbdOaIGWPbIHRZo/hazauwrl2D3ib
 SexCDU6OQM6EtTtaM4s4/86NW6BOy4TLvTYRxKcYl7W+/gWD9keqemLv8K2jNwNoQJ
 UTwzS7kKKqevgQ/y+2KqbQ8dIoed2QoB5D7GicR21rCEw1rDaf4oUIuIdbALRsDxRn
 FaYGpULlCPf+aaXHPM7VqdZIzt7W/gsCnf86figZYmaSjYElE0VRmUAu+HKdFIq/+d
 8Heu11Hq5cjkawRTIJPAI277esX/OE6UKPtmz6mJb5IdRoL52Jb72Ky6oc3jIRcmLs
 /i7uh10znjs3A==
Received: from [192.168.1.90] (unknown [82.79.138.25])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 229BF17E0B2D;
 Thu, 10 Apr 2025 13:23:55 +0200 (CEST)
Message-ID: <4df10482-2082-4542-912f-c9ebc3803b6f@collabora.com>
Date: Thu, 10 Apr 2025 14:23:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/15] drm/tests: hdmi: Add limited range tests for
 YUV420 mode
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
 <20250326-hdmi-conn-yuv-v3-13-294d3ebbb4b2@collabora.com>
 <20250410-daffodil-toucanet-of-effort-b4dcbd@houat>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250410-daffodil-toucanet-of-effort-b4dcbd@houat>
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

On 4/10/25 10:18 AM, Maxime Ripard wrote:
> On Wed, Mar 26, 2025 at 12:20:02PM +0200, Cristian Ciocaltea wrote:
>> Provide tests to verify that drm_atomic_helper_connector_hdmi_check()
>> helper behaviour when using YUV420 output format is to always set the
>> limited RGB quantization range to 'limited', no matter what the value of
>> Broadcast RGB property is.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  89 +++++++++++++++-
>>  drivers/gpu/drm/tests/drm_kunit_edid.h             | 112 +++++++++++++++++++++
>>  2 files changed, 196 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> index 6897515189a0649a267196b246944efc92ace336..3fae7ccf65309a1d8a4acf12de961713b9163096 100644
>> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> @@ -731,6 +731,88 @@ static void drm_test_check_broadcast_rgb_limited_cea_mode_vic_1(struct kunit *te
>>  	drm_modeset_acquire_fini(&ctx);
>>  }
>>  
>> +/*
>> + * Test that for an HDMI connector, with an HDMI monitor, we will
>> + * get a limited RGB Quantization Range with a YUV420 mode, no
>> + * matter what the value of the Broadcast RGB property is set to.
>> + */
>> +static void drm_test_check_broadcast_rgb_cea_mode_yuv420(struct kunit *test)
>> +{
>> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
>> +	enum drm_hdmi_broadcast_rgb broadcast_rgb;
>> +	struct drm_modeset_acquire_ctx ctx;
>> +	struct drm_connector_state *conn_state;
>> +	struct drm_atomic_state *state;
>> +	struct drm_display_mode *mode;
>> +	struct drm_connector *conn;
>> +	struct drm_device *drm;
>> +	struct drm_crtc *crtc;
>> +	int ret;
>> +
>> +	broadcast_rgb = *(enum drm_hdmi_broadcast_rgb *)test->param_value;
>> +
>> +	priv = drm_kunit_helper_connector_hdmi_init_with_edid(test,
>> +				BIT(HDMI_COLORSPACE_RGB) |
>> +				BIT(HDMI_COLORSPACE_YUV420),
>> +				8,
>> +				test_edid_hdmi_1080p_rgb_yuv_4k_yuv420_dc_max_200mhz);
>> +	KUNIT_ASSERT_NOT_NULL(test, priv);
>> +
>> +	drm = &priv->drm;
>> +	crtc = priv->crtc;
>> +	conn = &priv->connector;
>> +	KUNIT_ASSERT_TRUE(test, conn->display_info.is_hdmi);
>> +
>> +	mode = drm_kunit_display_mode_from_cea_vic(test, drm, 95);
>> +	KUNIT_ASSERT_NOT_NULL(test, mode);
>> +
>> +	drm_modeset_acquire_init(&ctx, 0);
>> +
>> +	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
>> +						     crtc, conn,
>> +						     mode, &ctx);
>> +	KUNIT_ASSERT_EQ(test, ret, 0);
> 
> drm_kunit_helper_enable_crtc_connector() can return EDEADLK, so you need
> to handle it and restart the sequence if it happens.

Right, there are actually many users of the helper since

6a5c0ad7e08e ("drm/tests: hdmi_state_helpers: Switch to new helper")

Probably a stupid question, as I haven't checked which are the mandatory
operations of the restart sequence, but I wonder if this could be
handled inside the helper instead of trying to fix all test cases.
>> +	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
>> +
>> +	conn_state = drm_atomic_get_connector_state(state, conn);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
> 
> Ditto.
> 
>> +	conn_state->hdmi.broadcast_rgb = broadcast_rgb;
>> +
>> +	ret = drm_atomic_check_only(state);
>> +	KUNIT_ASSERT_EQ(test, ret, 0);
>> +
>> +	conn_state = drm_atomic_get_connector_state(state, conn);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
> 
> Ditto, but I'm not sure you need drm_atomic_get_connector_state() here.
> We know at this point that the state is there and we don't need to
> allocate it anymore. drm_atomic_get_new_connector_state() will probably
> be enough 

Will check.

> and that one can't return EDEADLK.

Same question as above, could we handle EDEADLK at helper(s) level to
avoid open coding the restart sequence?

Thanks,
Cristian
