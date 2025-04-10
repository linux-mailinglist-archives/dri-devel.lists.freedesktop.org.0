Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3220EA84254
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 14:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B7B10E966;
	Thu, 10 Apr 2025 12:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="h04eL3i7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C1C10E966
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 12:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744286435;
 bh=KgypfoACOuD9xYQPK0dUJ2M7WGpHbH1s3oc8ogE1pOU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=h04eL3i7BdMl3SldCVQ4cjZNK9C46fTfkNJk3kXvXZcai8Zldn1+xPCRO/WNl41oX
 Pdp4Vswz5W7TT95HYhw3QjOiuoM9MmZi9ImlqpOhGHQaSIPpF16pX0BFfexFGaUCD6
 p6yyOkArcEQPyIVtI/o1ObwHCTKhsoaTttmemhnLaWUa5aTH2G62LxNt0/LbVVM4yf
 FgGBI+k3Mnf3TnmMPZAhaZWedqXkxk1qCfNVhmwzBPm7C5nEO/4BLoTAi+n8k7MbUj
 BrC46C33J6AeqFPJ0W2U6BfwoQeJtJjeRMsuP9lXir6fEeu2IxUW7jXPYRUAK48mmU
 7FNsGb3cyDmdA==
Received: from [192.168.1.90] (unknown [82.79.138.25])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 00C3B17E0904;
 Thu, 10 Apr 2025 14:00:34 +0200 (CEST)
Message-ID: <8b0a8a7a-456a-487f-853e-5ec3e11129d7@collabora.com>
Date: Thu, 10 Apr 2025 15:00:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/15] drm/tests: hdmi: Add max TMDS rate fallback
 tests for YUV420 mode
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
 <20250326-hdmi-conn-yuv-v3-14-294d3ebbb4b2@collabora.com>
 <20250410-cyan-smilodon-of-courtesy-38766c@houat>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250410-cyan-smilodon-of-courtesy-38766c@houat>
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

On 4/10/25 11:35 AM, Maxime Ripard wrote:
> On Wed, Mar 26, 2025 at 12:20:03PM +0200, Cristian Ciocaltea wrote:
>> Provide tests to verify drm_atomic_helper_connector_hdmi_check() helper
>> fallback behavior when using YUV420 output.
>>
>> Also rename drm_test_check_max_tmds_rate_{bpc|format}_fallback() to
>> better differentiate from the newly introduced *_yuv420() variants.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 152 ++++++++++++++++++++-
>>  drivers/gpu/drm/tests/drm_kunit_edid.h             | 110 +++++++++++++++
>>  2 files changed, 258 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> index 3fae7ccf65309a1d8a4acf12de961713b9163096..99bedb2d6f555b3b140256000dfa7491d2a8f515 100644
>> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> @@ -1224,7 +1224,7 @@ static void drm_test_check_hdmi_funcs_reject_rate(struct kunit *test)
>>   * Then we will pick the latter, and the computed TMDS character rate
>>   * will be equal to 1.25 times the mode pixel clock.
>>   */
>> -static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
>> +static void drm_test_check_max_tmds_rate_bpc_fallback_rgb(struct kunit *test)
>>  {
>>  	struct drm_atomic_helper_connector_hdmi_priv *priv;
>>  	struct drm_modeset_acquire_ctx ctx;
>> @@ -1279,6 +1279,75 @@ static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
>>  	drm_modeset_acquire_fini(&ctx);
>>  }
>>  
>> +/*
>> + * Test that if:
>> + * - We have an HDMI connector supporting both RGB and YUV420
> 
> I assume the monitor also supports both?

Yes, I will improve the comment a bit.

>> + * - The chosen mode can be supported in YUV420 output format only
>> + * - The chosen mode has a TMDS character rate higher than the display
>> + *   supports in YUV420/12bpc
>> + * - The chosen mode has a TMDS character rate lower than the display
>> + *   supports in YUV420/10bpc.
>> + *
>> + * Then we will pick the latter, and the computed TMDS character rate
>> + * will be equal to 1.25 * 0.5 times the mode pixel clock.
>> + */
>> +static void drm_test_check_max_tmds_rate_bpc_fallback_yuv420(struct kunit *test)
>> +{
>> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
>> +	struct drm_modeset_acquire_ctx ctx;
>> +	struct drm_connector_state *conn_state;
>> +	struct drm_display_info *info;
>> +	struct drm_display_mode *yuv420_only_mode;
>> +	unsigned long long rate;
>> +	struct drm_connector *conn;
>> +	struct drm_device *drm;
>> +	struct drm_crtc *crtc;
>> +	int ret;
>> +
>> +	priv = drm_kunit_helper_connector_hdmi_init_with_edid(test,
>> +				BIT(HDMI_COLORSPACE_RGB) |
>> +				BIT(HDMI_COLORSPACE_YUV420),
>> +				12,
>> +				test_edid_hdmi_1080p_rgb_yuv_4k_yuv420_dc_max_200mhz);
>> +	KUNIT_ASSERT_NOT_NULL(test, priv);
>> +
>> +	drm = &priv->drm;
>> +	crtc = priv->crtc;
>> +	conn = &priv->connector;
>> +	info = &conn->display_info;
>> +	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
>> +	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
>> +	KUNIT_ASSERT_TRUE(test, conn->ycbcr_420_allowed);
>> +
>> +	yuv420_only_mode = drm_kunit_display_mode_from_cea_vic(test, drm, 95);
>> +	KUNIT_ASSERT_NOT_NULL(test, yuv420_only_mode);
>> +	KUNIT_ASSERT_TRUE(test, drm_mode_is_420_only(info, yuv420_only_mode));
>> +
>> +	rate = drm_hdmi_compute_mode_clock(yuv420_only_mode, 12, HDMI_COLORSPACE_YUV420);
>> +	KUNIT_ASSERT_GT(test, rate, info->max_tmds_clock * 1000);
>> +
>> +	rate = drm_hdmi_compute_mode_clock(yuv420_only_mode, 10, HDMI_COLORSPACE_YUV420);
>> +	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
>> +
>> +	drm_modeset_acquire_init(&ctx, 0);
>> +
>> +	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
>> +						     crtc, conn,
>> +						     yuv420_only_mode,
>> +						     &ctx);
>> +	KUNIT_EXPECT_EQ(test, ret, 0);
> 
> We need to handle EDEADLK

Yeah, that's the open disscussion in the previous patch.

>> +
>> +	conn_state = conn->state;
>> +	KUNIT_ASSERT_NOT_NULL(test, conn_state);
>> +
>> +	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_bpc, 10);
>> +	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_YUV420);
>> +	KUNIT_EXPECT_EQ(test, conn_state->hdmi.tmds_char_rate, yuv420_only_mode->clock * 625);
>> +
>> +	drm_modeset_drop_locks(&ctx);
>> +	drm_modeset_acquire_fini(&ctx);
>> +}
>> +
>>  /*
>>   * Test that if:
>>   * - We have an HDMI connector supporting both RGB and YUV422 and up to
>> @@ -1292,7 +1361,7 @@ static void drm_test_check_max_tmds_rate_bpc_fallback(struct kunit *test)
>>   * Then we will prefer to keep the RGB format with a lower bpc over
>>   * picking YUV422.
>>   */
>> -static void drm_test_check_max_tmds_rate_format_fallback(struct kunit *test)
>> +static void drm_test_check_max_tmds_rate_format_fallback_yuv422(struct kunit *test)
>>  {
>>  	struct drm_atomic_helper_connector_hdmi_priv *priv;
>>  	struct drm_modeset_acquire_ctx ctx;
>> @@ -1351,6 +1420,79 @@ static void drm_test_check_max_tmds_rate_format_fallback(struct kunit *test)
>>  	drm_modeset_acquire_fini(&ctx);
>>  }
>>  
>> +/*
>> + * Test that if:
>> + * - We have an HDMI connector supporting both RGB and YUV420 and up to
>> + *   12 bpc
>> + * - The chosen mode has a TMDS character rate higher than the display
>> + *   supports in RGB/10bpc but lower than the display supports in
>> + *   RGB/8bpc
>> + * - The chosen mode has a TMDS character rate lower than the display
>> + *   supports in YUV420/12bpc.
>> + *
>> + * Then we will prefer to keep the RGB format with a lower bpc over
>> + * picking YUV420.
>> + */
>> +static void drm_test_check_max_tmds_rate_format_fallback_yuv420(struct kunit *test)
> 
> Are you sure about the name here? It looks like we're not testing the
> YUV420 fallback at all?

The name is indead missleading, the '_yuv420' suffix is mainly used to
differentiate this test case from the above using '_yuv422' - both keep
RGB format eventually.

What about replacing '_format_fallback_' with '_bpc_fallback_ignore_' in
both cases?  E.g.:

  drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv422()
  drm_test_check_max_tmds_rate_bpc_fallback_ignore_yuv420()

> 
>> +{
>> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
>> +	struct drm_modeset_acquire_ctx ctx;
>> +	struct drm_connector_state *conn_state;
>> +	struct drm_display_info *info;
>> +	struct drm_display_mode *preferred;
>> +	unsigned long long rate;
>> +	struct drm_connector *conn;
>> +	struct drm_device *drm;
>> +	struct drm_crtc *crtc;
>> +	int ret;
>> +
>> +	priv = drm_kunit_helper_connector_hdmi_init_with_edid(test,
>> +				BIT(HDMI_COLORSPACE_RGB) |
>> +				BIT(HDMI_COLORSPACE_YUV420),
>> +				12,
>> +				test_edid_hdmi_4k_rgb_yuv420_dc_max_340mhz);
>> +	KUNIT_ASSERT_NOT_NULL(test, priv);
>> +
>> +	drm = &priv->drm;
>> +	crtc = priv->crtc;
>> +	conn = &priv->connector;
>> +	info = &conn->display_info;
>> +	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
>> +	KUNIT_ASSERT_GT(test, info->max_tmds_clock, 0);
>> +	KUNIT_ASSERT_TRUE(test, conn->ycbcr_420_allowed);
>> +
>> +	preferred = find_preferred_mode(conn);
>> +	KUNIT_ASSERT_NOT_NULL(test, preferred);
>> +	KUNIT_ASSERT_FALSE(test, preferred->flags & DRM_MODE_FLAG_DBLCLK);
>> +	KUNIT_ASSERT_TRUE(test, drm_mode_is_420_also(info, preferred));
>> +
>> +	rate = drm_hdmi_compute_mode_clock(preferred, 8, HDMI_COLORSPACE_RGB);
>> +	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
>> +
>> +	rate = drm_hdmi_compute_mode_clock(preferred, 10, HDMI_COLORSPACE_RGB);
>> +	KUNIT_ASSERT_GT(test, rate, info->max_tmds_clock * 1000);
>> +
>> +	rate = drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV420);
>> +	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
>> +
>> +	drm_modeset_acquire_init(&ctx, 0);
>> +
>> +	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
>> +						     crtc, conn,
>> +						     preferred,
>> +						     &ctx);
>> +	KUNIT_EXPECT_EQ(test, ret, 0);
>> +
>> +	conn_state = conn->state;
>> +	KUNIT_ASSERT_NOT_NULL(test, conn_state);
>> +
>> +	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_bpc, 8);
>> +	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_RGB);
>> +
>> +	drm_modeset_drop_locks(&ctx);
>> +	drm_modeset_acquire_fini(&ctx);
>> +}
> 
>>  /*
>>   * Test that if a driver and screen supports RGB and YUV formats, and we
>>   * try to set the VIC 1 mode, we end up with 8bpc RGB even if we could
>> @@ -1738,8 +1880,10 @@ static struct kunit_case drm_atomic_helper_connector_hdmi_check_tests[] = {
>>  	KUNIT_CASE(drm_test_check_broadcast_rgb_crtc_mode_not_changed),
>>  	KUNIT_CASE(drm_test_check_disable_connector),
>>  	KUNIT_CASE(drm_test_check_hdmi_funcs_reject_rate),
>> -	KUNIT_CASE(drm_test_check_max_tmds_rate_bpc_fallback),
>> -	KUNIT_CASE(drm_test_check_max_tmds_rate_format_fallback),
> 
> These name changes belong in a separate patch

Ack.

>> +	KUNIT_CASE(drm_test_check_max_tmds_rate_bpc_fallback_rgb),
>> +	KUNIT_CASE(drm_test_check_max_tmds_rate_bpc_fallback_yuv420),
>> +	KUNIT_CASE(drm_test_check_max_tmds_rate_format_fallback_yuv422),
>> +	KUNIT_CASE(drm_test_check_max_tmds_rate_format_fallback_yuv420),
> 
> We should also test what happens when the monitor or connector doesn't
> support YUV420, and we'd still need to fallback. In such a case, we
> should return an error.

Ack.

>>  	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_changed),
>>  	KUNIT_CASE(drm_test_check_output_bpc_crtc_mode_not_changed),
>>  	KUNIT_CASE(drm_test_check_output_bpc_dvi),
>> diff --git a/drivers/gpu/drm/tests/drm_kunit_edid.h b/drivers/gpu/drm/tests/drm_kunit_edid.h
>> index ff316e6114d65c96b1338cd83bc0d8d9e6e143e9..8e9086df20c690f34623d7858c716032d77d0c26 100644
>> --- a/drivers/gpu/drm/tests/drm_kunit_edid.h
>> +++ b/drivers/gpu/drm/tests/drm_kunit_edid.h
>> @@ -695,4 +695,114 @@ static const unsigned char test_edid_hdmi_1080p_rgb_yuv_4k_yuv420_dc_max_200mhz[
>>  	0x00, 0x00, 0x00, 0xca
>>  };
>>  
>> +/*
>> + * edid-decode (hex):
>> + *
>> + * 00 ff ff ff ff ff ff 00 31 d8 34 00 00 00 00 00
>> + * ff 23 01 03 80 60 36 78 0f ee 91 a3 54 4c 99 26
>> + * 0f 50 54 20 00 00 01 01 01 01 01 01 01 01 01 01
>> + * 01 01 01 01 01 01 04 74 00 30 f2 70 5a 80 b0 58
>> + * 8a 00 40 84 63 00 00 1e 00 00 00 fc 00 54 65 73
>> + * 74 20 45 44 49 44 0a 20 20 20 00 00 00 fd 00 18
>> + * 55 18 5e 22 00 0a 20 20 20 20 20 20 00 00 00 10
>> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 ce
>> + *
>> + * 02 03 27 31 41 5f 6c 03 0c 00 10 00 78 44 20 00
>> + * 00 01 03 6d d8 5d c4 01 44 80 07 00 00 00 00 00
>> + * 00 e3 0f 01 00 e1 0e 00 00 00 00 00 00 00 00 00
>> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> + * 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 84
>> + *
>> + * ----------------
>> + *
>> + * Block 0, Base EDID:
>> + *   EDID Structure Version & Revision: 1.3
>> + *   Vendor & Product Identification:
>> + *     Manufacturer: LNX
>> + *     Model: 52
>> + *     Model year: 2025
>> + *   Basic Display Parameters & Features:
>> + *     Digital display
>> + *     Maximum image size: 96 cm x 54 cm
>> + *     Gamma: 2.20
>> + *     RGB color display
>> + *     Default (sRGB) color space is primary color space
>> + *     First detailed timing is the preferred timing
>> + *     Supports GTF timings within operating range
>> + *   Color Characteristics:
>> + *     Red  : 0.6396, 0.3300
>> + *     Green: 0.2998, 0.5996
>> + *     Blue : 0.1503, 0.0595
>> + *     White: 0.3125, 0.3291
>> + *   Established Timings I & II:
>> + *     DMT 0x04:   640x480    59.940476 Hz   4:3     31.469 kHz     25.175000 MHz
>> + *   Standard Timings: none
>> + *   Detailed Timing Descriptors:
>> + *     DTD 1:  3840x2160   30.000000 Hz  16:9     67.500 kHz    297.000000 MHz (1600 mm x 900 mm)
>> + *                  Hfront  176 Hsync  88 Hback  296 Hpol P
>> + *                  Vfront    8 Vsync  10 Vback   72 Vpol P
>> + *     Display Product Name: 'Test EDID'
>> + *     Display Range Limits:
>> + *       Monitor ranges (GTF): 24-85 Hz V, 24-94 kHz H, max dotclock 340 MHz
>> + *     Dummy Descriptor:
>> + *   Extension blocks: 1
>> + * Checksum: 0xce
>> + *
>> + * ----------------
>> + *
>> + * Block 1, CTA-861 Extension Block:
>> + *   Revision: 3
>> + *   Supports YCbCr 4:4:4
>> + *   Supports YCbCr 4:2:2
>> + *   Native detailed modes: 1
>> + *   Video Data Block:
>> + *     VIC  95:  3840x2160   30.000000 Hz  16:9     67.500 kHz    297.000000 MHz
>> + *   Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
>> + *     Source physical address: 1.0.0.0
>> + *     DC_48bit
>> + *     DC_36bit
>> + *     DC_30bit
>> + *     DC_Y444
>> + *     Maximum TMDS clock: 340 MHz
>> + *     Extended HDMI video details:
>> + *   Vendor-Specific Data Block (HDMI Forum), OUI C4-5D-D8:
>> + *     Version: 1
>> + *     Maximum TMDS Character Rate: 340 MHz
>> + *     SCDC Present
>> + *     Supports 16-bits/component Deep Color 4:2:0 Pixel Encoding
>> + *     Supports 12-bits/component Deep Color 4:2:0 Pixel Encoding
>> + *     Supports 10-bits/component Deep Color 4:2:0 Pixel Encoding
>> + *   YCbCr 4:2:0 Capability Map Data Block:
>> + *     VIC  95:  3840x2160   30.000000 Hz  16:9     67.500 kHz    297.000000 MHz
>> + *   YCbCr 4:2:0 Video Data Block:
>> + * Checksum: 0x84
>> + */
>> +static const unsigned char test_edid_hdmi_4k_rgb_yuv420_dc_max_340mhz[] = {
>> +	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x31, 0xd8, 0x34, 0x00,
>> +	0x00, 0x00, 0x00, 0x00, 0xff, 0x23, 0x01, 0x03, 0x80, 0x60, 0x36, 0x78,
>> +	0x0f, 0xee, 0x91, 0xa3, 0x54, 0x4c, 0x99, 0x26, 0x0f, 0x50, 0x54, 0x20,
>> +	0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
>> +	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x04, 0x74, 0x00, 0x30, 0xf2, 0x70,
>> +	0x5a, 0x80, 0xb0, 0x58, 0x8a, 0x00, 0x40, 0x84, 0x63, 0x00, 0x00, 0x1e,
>> +	0x00, 0x00, 0x00, 0xfc, 0x00, 0x54, 0x65, 0x73, 0x74, 0x20, 0x45, 0x44,
>> +	0x49, 0x44, 0x0a, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xfd, 0x00, 0x18,
>> +	0x55, 0x18, 0x5e, 0x22, 0x00, 0x0a, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
>> +	0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0xce, 0x02, 0x03, 0x27, 0x31,
>> +	0x41, 0x5f, 0x6c, 0x03, 0x0c, 0x00, 0x10, 0x00, 0x78, 0x44, 0x20, 0x00,
>> +	0x00, 0x01, 0x03, 0x6d, 0xd8, 0x5d, 0xc4, 0x01, 0x44, 0x80, 0x07, 0x00,
>> +	0x00, 0x00, 0x00, 0x00, 0x00, 0xe3, 0x0f, 0x01, 0x00, 0xe1, 0x0e, 0x00,
>> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>> +	0x00, 0x00, 0x00, 0x84
>> +};
> 
> This should be a separate patch as well, but most importantly it's
> pretty hard to know the difference with the one you introduced in a
> previous patch. We should document it better than just with edid-decode.

Ack.

> Also, how did you generate it?

Oh, that was a quite painful experience :-(.  Started from a full
feature EDID (grabbed from real HW), then used wxedid to drop unneeded
stuff up to the bare minimum (while also trying to deal with some
crashes or unexpected behavior of the tool).  And finally raw editing
the hex data since wxedid is currently not able to handle
'Vendor-Specific Data Block (HDMI Forum), OUI C4-5D-D8'.
