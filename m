Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CA0AC1239
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 19:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F94C10E907;
	Thu, 22 May 2025 17:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="O0peat//";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3445A10E8F5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 17:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1747935452;
 bh=krxuNyKUAU7m4MQbPEtQDu9z5gQvZzRePFIerYLoPe8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=O0peat//tuaACDXb90elhk0XMExs5yzu984W7bcQoiQlKrjzqd7UBj6ysgqVa00oz
 PS3Udl5RTQ+8RSswTBk9d32IVNkzpdbDCUKkbAitoB7O7hyFXbhrcMDHulDcd3BAjP
 ZQmz1BFr24ooRaUzVoNr1PG/cKF/IEGE87ACI4CZL0WBYv8lcw1qmYd5Jx7q1uw43z
 vOR2mcVzFT5AC3w0eiZo5XN8MKEnjBI/3LGanEp2X6GB4MNL7bSwt6gnEe+KNQhUCh
 yZlAmGEZvyFbedGcf75FiWDZDgJrFezOU09CPwbrzZFpvx6m8FWV+MQZUCrwLqPUXD
 ehVF/rjmdY2jA==
Received: from [192.168.1.90] (unknown [82.76.59.134])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C32B717E157A;
 Thu, 22 May 2025 19:37:31 +0200 (CEST)
Message-ID: <2a8554af-5b5b-4402-a065-a3e765f9ca4f@collabora.com>
Date: Thu, 22 May 2025 20:37:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 23/23] drm/tests: hdmi: Add test for unsupported
 RGB/YUV420 mode
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
 <20250425-hdmi-conn-yuv-v4-23-5e55e2aaa3fa@collabora.com>
 <20250519-classy-millipede-of-competence-4bb6ad@houat>
 <a37b4045-0d94-4148-bb1e-fc08104e6173@collabora.com>
 <20250522-mutant-emu-of-youth-ae70cd@houat>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250522-mutant-emu-of-youth-ae70cd@houat>
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

On 5/22/25 7:16 PM, Maxime Ripard wrote:
> Hi,
> 
> On Mon, May 19, 2025 at 01:55:10PM +0300, Cristian Ciocaltea wrote:
>> On 5/19/25 11:42 AM, Maxime Ripard wrote:
>>> Hi,
>>>
>>> On Fri, Apr 25, 2025 at 01:27:14PM +0300, Cristian Ciocaltea wrote:
>>>> Provide a test to verify that if both driver and screen support RGB and
>>>> YUV420 formats, drm_atomic_helper_connector_hdmi_check() cannot succeed
>>>> when trying to set a mode unsupported by the display.
>>>>
>>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>>> ---
>>>>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 66 ++++++++++++++++++++++
>>>>  1 file changed, 66 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>>>> index d79084cfb516b69c4244098c0767d604ad02f2c3..6337a1c52b86810c638f446c4995e7ee63dbc084 100644
>>>> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>>>> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>>>> @@ -1622,6 +1622,71 @@ static void drm_test_check_driver_unsupported_fallback_yuv420(struct kunit *test
>>>>  	drm_modeset_acquire_fini(&ctx);
>>>>  }
>>>>  
>>>> +/*
>>>> + * Test that if a driver and screen supports RGB and YUV420 formats, but the
>>>> + * chosen mode cannot be supported by the screen, we end up with unsuccessful
>>>> + * fallback attempts.
>>>> + */
>>>> +static void drm_test_check_display_unsupported_fallback_rgb_yuv420(struct kunit *test)
>>>> +{
>>>> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
>>>> +	struct drm_modeset_acquire_ctx ctx;
>>>> +	struct drm_crtc_state *crtc_state;
>>>> +	struct drm_atomic_state *state;
>>>> +	struct drm_display_info *info;
>>>> +	struct drm_display_mode *preferred, *unsupported_mode;
>>>> +	struct drm_connector *conn;
>>>> +	struct drm_device *drm;
>>>> +	struct drm_crtc *crtc;
>>>> +	int ret;
>>>> +
>>>> +	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
>>>> +				BIT(HDMI_COLORSPACE_RGB) |
>>>> +				BIT(HDMI_COLORSPACE_YUV420),
>>>> +				10,
>>>> +				&dummy_connector_hdmi_funcs,
>>>> +				test_edid_hdmi_4k_rgb_yuv420_dc_max_340mhz);
>>>> +	KUNIT_ASSERT_NOT_NULL(test, priv);
>>>> +
>>>> +	drm = &priv->drm;
>>>> +	crtc = priv->crtc;
>>>> +	conn = &priv->connector;
>>>> +	info = &conn->display_info;
>>>> +	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
>>>> +	KUNIT_ASSERT_TRUE(test, conn->ycbcr_420_allowed);
>>>> +
>>>> +	preferred = find_preferred_mode(conn);
>>>> +	KUNIT_ASSERT_NOT_NULL(test, preferred);
>>>> +
>>>> +	unsupported_mode = drm_kunit_display_mode_from_cea_vic(test, drm, 96);
>>>> +	KUNIT_ASSERT_NOT_NULL(test, unsupported_mode);
>>>
>>> I'm not sure what this one is supposed to test. If the mode is
>>> unsupported by the screen, it will be for both YUV and RGB, right? So
>>> what are we testing here?
>>
>> That would be the case suggested at [1]:
>>
>> "We still need to do the same with a driver that supports both, but the
>> monitor doesn't."
>>
>> Should we drop it?
> 
> Ah, I see. I meant that we should normally end up with YUV420 (so mode
> is supported by the monitor, but the resolution is too high for RGB and
> we should pick YUV instead), but the monitor doesn't support it and thus
> we fail.

If I get it right, to verify this scenario we'd need a new test EDID
that basically advertises an RGB mode which is not actually supported by
the screen, i.e. the mode requires a TMDS rate which exceeds the maximum
supported by the display for any of the available color depths.

But that's not something we should encounter in practice, is it?  I mean
the EDID would be wrong, as it doesn't match the hardware capabilities.

Regardless, assuming this is solely for the purpose of testing the
framework, I will try to come up with a test case.  The only problem
is generating the EDID - which is a really annoying process, as I've
already mentioned a while ago [1].  

Hence I'm wondering if we could move on without it for the moment (I'll
get back to it ASAP).

[1] https://lore.kernel.org/all/8b0a8a7a-456a-487f-853e-5ec3e11129d7@collabora.com/

