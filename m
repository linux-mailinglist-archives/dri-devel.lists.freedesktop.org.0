Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B756DA5D2AB
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 23:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3BD10E159;
	Tue, 11 Mar 2025 22:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="n8VvlI74";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B95410E159
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 22:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741733068;
 bh=rumNZz+nbkwUqosYZDH87JxuURktvLmlm42+WewyqgY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=n8VvlI74ynV7LINmJ/MoFt1sEtTI7kVyUkKfbM+3UymvHUsVo+WKA4NsPMLeSR2sM
 yUt2/CMSfz37R1DVNDnfBuSIjGZjULzFdD19ooFCUVBN51/hjaO0lKZy2+NzL/sQYg
 YHTu3A6YeGqPL8Dp7sbBvLMiH1CcfYrbKyhy7t+aSc3HEjcfhZ1x7v6bfb1ydCR/tD
 TY9MytIcq2CggJZHJfpqIU/EthcMllPvwhj9nYsAqOjcuGil1JRET2V9WDyrAvKHiB
 Sw7AZ47Me685rJs/MqylE+MCSOPKYVeA33ZHfEzT3ZmHUtwXFIGCwkQkztqM4myq5o
 IX3LoGxq2P4dA==
Received: from [192.168.1.90] (unknown [84.232.140.93])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BF68817E0B25;
 Tue, 11 Mar 2025 23:44:27 +0100 (CET)
Message-ID: <a91cabd5-f0af-42a3-95b5-de68e30f7f23@collabora.com>
Date: Wed, 12 Mar 2025 00:44:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] drm/tests: hdmi: Add macros to simplify EDID setup
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250311-hdmi-conn-yuv-v2-0-fbdb94f02562@collabora.com>
 <20250311-hdmi-conn-yuv-v2-5-fbdb94f02562@collabora.com>
 <20250311-spiritual-hornet-of-prestige-ef4132@houat>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <20250311-spiritual-hornet-of-prestige-ef4132@houat>
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

On 3/11/25 6:12 PM, Maxime Ripard wrote:
> On Tue, Mar 11, 2025 at 12:57:37PM +0200, Cristian Ciocaltea wrote:
>> Introduce a few macros to facilitate setting custom (i.e. non-default)
>> EDID data during connector initialization.
>>
>> This helps reducing boilerplate code while also drops some redundant
>> calls to set_connector_edid().
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 245 ++++++++-------------
>>  1 file changed, 93 insertions(+), 152 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> index e97efd3af9ed18e6cf8ee66b4923dfc805b34e19..a3f7f3ce31c73335c2c2643bdc5395b6ceb6f071 100644
>> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> @@ -183,10 +183,12 @@ static const struct drm_connector_funcs dummy_connector_funcs = {
>>  
>>  static
>>  struct drm_atomic_helper_connector_hdmi_priv *
>> -drm_kunit_helper_connector_hdmi_init_funcs(struct kunit *test,
>> -					   unsigned int formats,
>> -					   unsigned int max_bpc,
>> -					   const struct drm_connector_hdmi_funcs *hdmi_funcs)
>> +connector_hdmi_init_funcs_set_edid(struct kunit *test,
>> +				   unsigned int formats,
>> +				   unsigned int max_bpc,
>> +				   const struct drm_connector_hdmi_funcs *hdmi_funcs,
>> +				   const char *edid_data,
>> +				   size_t edid_len)
>>  {
>>  	struct drm_atomic_helper_connector_hdmi_priv *priv;
>>  	struct drm_connector *conn;
>> @@ -240,30 +242,27 @@ drm_kunit_helper_connector_hdmi_init_funcs(struct kunit *test,
>>  
>>  	drm_mode_config_reset(drm);
>>  
>> +	if (edid_data && edid_len) {
>> +		ret = set_connector_edid(test, &priv->connector, edid_data, edid_len);
>> +		KUNIT_ASSERT_GT(test, ret, 0);
>> +	}
>> +
>>  	return priv;
>>  }
>>  
>> -static
>> -struct drm_atomic_helper_connector_hdmi_priv *
>> -drm_kunit_helper_connector_hdmi_init(struct kunit *test,
>> -				     unsigned int formats,
>> -				     unsigned int max_bpc)
>> -{
>> -	struct drm_atomic_helper_connector_hdmi_priv *priv;
>> -	int ret;
>> +#define drm_kunit_helper_connector_hdmi_init_funcs_set_edid(test, formats, max_bpc, funcs, edid) \
>> +	connector_hdmi_init_funcs_set_edid(test, formats, max_bpc, funcs, edid, ARRAY_SIZE(edid))
>>  
>> -	priv = drm_kunit_helper_connector_hdmi_init_funcs(test,
>> -							  formats, max_bpc,
>> -							  &dummy_connector_hdmi_funcs);
>> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
>> +#define drm_kunit_helper_connector_hdmi_init_funcs(test, formats, max_bpc, funcs)		\
>> +	connector_hdmi_init_funcs_set_edid(test, formats, max_bpc, funcs, NULL, 0)
>>  
>> -	ret = set_connector_edid(test, &priv->connector,
>> -				 test_edid_hdmi_1080p_rgb_max_200mhz,
>> -				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
>> -	KUNIT_ASSERT_GT(test, ret, 0);
>> +#define drm_kunit_helper_connector_hdmi_init_set_edid(test, formats, max_bpc, edid)		\
>> +	drm_kunit_helper_connector_hdmi_init_funcs_set_edid(test, formats, max_bpc,		\
>> +							    &dummy_connector_hdmi_funcs, edid)
>>  
>> -	return priv;
>> -}
>> +#define drm_kunit_helper_connector_hdmi_init(test, formats, max_bpc)				\
>> +	drm_kunit_helper_connector_hdmi_init_set_edid(test, formats, max_bpc,			\
>> +						      test_edid_hdmi_1080p_rgb_max_200mhz)
> 
> I'd really prefer to have functions to macros here. They are easier to
> read, extend, and don't have any particular drawbacks.

Yeah, the main reason I opted for macros was to allow dropping
ARRAY_SIZE(edid) from the caller side, hence making the API as simple as
possible.

> I also don't think we need that many, looking at the tests:
> 
>   - We need drm_kunit_helper_connector_hdmi_init() to setup a connector
>     with test_edid_hdmi_1080p_rgb_max_200mhz and
>     dummy_connector_hdmi_funcs()

Correct.

>   - We need to create a
>     drm_kunit_helper_connector_hdmi_init_with_edid_funcs() to pass both
>     the funcs and edid pointers

That's drm_kunit_helper_connector_hdmi_init_funcs_set_edid(), but I can
rename it if you prefer - I've just tried to keep the name length under
control, as there are already some indentation challenges when calling
the helpers.

Currently it's only used to implement
drm_kunit_helper_connector_hdmi_init_set_edid() by passing
&dummy_connector_hdmi_funcs, but there are a few test cases that can
benefit of it and help extend the cleanup - will do for v3.

drm_kunit_helper_connector_hdmi_init_set_edid() should also stay as it's
already being used to drop boilerplate code from a lot of places.

> And that's it, right?

There's also drm_kunit_helper_connector_hdmi_init_funcs() which has been
used for a few times, but it can be further optimized out via
drm_kunit_helper_connector_hdmi_init_funcs_set_edid(), so I'll drop it.

That means we could end up with just the following:

- drm_kunit_helper_connector_hdmi_init()
- drm_kunit_helper_connector_hdmi_init_set_edid()
- drm_kunit_helper_connector_hdmi_init_funcs_set_edid()

>>  /*
>>   * Test that if we change the RGB quantization property to a different
>> @@ -771,19 +770,15 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
>>  	struct drm_crtc *crtc;
>>  	int ret;
>>  
>> -	priv = drm_kunit_helper_connector_hdmi_init(test,
>> -						    BIT(HDMI_COLORSPACE_RGB),
>> -						    10);
>> +	priv = drm_kunit_helper_connector_hdmi_init_set_edid(test,
>> +				BIT(HDMI_COLORSPACE_RGB),
>> +				10,
>> +				test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz);
> 
> I think that convertion should be part of another patch.

Ack, will move all conversions to a dedicated patch.

Thanks,
Cristian
