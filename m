Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 696966B0DC7
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 16:55:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5453D10E62B;
	Wed,  8 Mar 2023 15:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53D510E62B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 15:55:40 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4PWxjm1qVdzDr4k;
 Wed,  8 Mar 2023 15:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1678290940; bh=Tz83ZQjt8FrBye0ysrxwnpkehK3rSTcOomNT4SmhE5Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MjShpYxgZ6PzbTshAz5cnvHsnHK52xRtWb9qdF5wf0EvfOE0KK1TvM21yyor1Gkmy
 gfM0poJlxu6bwEf1CzCn//peV+aB9UUsJ8hZGx+qMfTHafDBFLQ8sWHwGXdm8+bjyE
 V1FqE1Xqr9m9tn79tRshrcPWC7VxTQw1KImHzELA=
X-Riseup-User-ID: 508B4FEE875B9176399F6CD58DC30FD31858A48CBCC3F3DA1267BB2CCE97739E
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4PWxjj2RTmz1y8Z;
 Wed,  8 Mar 2023 15:55:37 +0000 (UTC)
Message-ID: <782e6705-9799-b87e-60fd-ad88031ff909@riseup.net>
Date: Wed, 8 Mar 2023 12:55:34 -0300
MIME-Version: 1.0
Subject: Re: [PATCH] drm/format_helper: Add Kunit tests for
 drm_fb_xrgb8888_to_mono()
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org
References: <20230302200131.754154-1-arthurgrillo@riseup.net>
 <87lek81hdq.fsf@minerva.mail-host-address-is-not-set>
 <87mt4ow7ji.fsf@minerva.mail-host-address-is-not-set>
From: Arthur Grillo Queiroz Cabral <arthurgrillo@riseup.net>
In-Reply-To: <87mt4ow7ji.fsf@minerva.mail-host-address-is-not-set>
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
Cc: davidgow@google.com, tales.aparecida@gmail.com, mairacanal@riseup.net,
 tzimmermann@suse.de, jose.exposito89@gmail.com, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 07/03/23 18:55, Javier Martinez Canillas wrote:
> Javier Martinez Canillas <javierm@redhat.com> writes:
> 
> [...]
> 
>>
>>> +static size_t conversion_buf_size_mono(unsigned int dst_pitch, const struct drm_rect *clip)
>>> +{
>>> +	if (!dst_pitch) {
>>> +		unsigned int linepixels = drm_rect_width(clip) * 1;
>>> +
>>> +		dst_pitch = DIV_ROUND_UP(linepixels, 8);
>>> +	}
>>> +
>>> +	return dst_pitch * drm_rect_height(clip);
>>> +}
>>> +
>>
>> I don't think you need a new helper only for this. There are other
>> formats that have sub-byte pixels, so you may want to instead make
>> the existing conversion_buf_size() function more general.
>>
>> Could you please base on the following patch that I just posted?
>>
>> https://lists.freedesktop.org/archives/dri-devel/2023-March/394466.html
>>
> 
> I've posted a v2 since the kernel robot found a build warning on v1:
> 
> https://lists.freedesktop.org/archives/dri-devel/2023-March/394473.html
> 
> This time I have also tested your patch rebased on top of my v2, and
> your tests are passing too:
> 
> [22:46:16] ============== drm_test_fb_xrgb8888_to_mono  ===============
> [22:46:16] [PASSED] single_pixel_source_buffer                                                                         
> [22:46:16] [PASSED] single_pixel_clip_rectangle     
> [22:46:16] [PASSED] well_known_colors                                                                                  
> [22:46:16] [PASSED] destination_pitch
> 
> The version of your patch I that tested is the following:
> 
> From def1b2c04c812d53ebcda17c2d34d16f311ad406 Mon Sep 17 00:00:00 2001
> From: Arthur Grillo <arthurgrillo@riseup.net>
> Date: Thu, 2 Mar 2023 17:01:31 -0300
> Subject: [PATCH] drm/format_helper: Add Kunit tests for
>  drm_fb_xrgb8888_to_mono()
> 
> Extend the existing test cases to test the conversion from XRGB8888 to
> monochromatic.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  .../gpu/drm/tests/drm_format_helper_test.c    | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index 84b5cc29c8fc..c9cd8a7741ee 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -67,6 +67,11 @@ struct convert_to_argb2101010_result {
>  	const u32 expected[TEST_BUF_SIZE];
>  };
>  
> +struct convert_to_mono_result {
> +	unsigned int dst_pitch;
> +	const u8 expected[TEST_BUF_SIZE];
> +};
> +
>  struct convert_xrgb8888_case {
>  	const char *name;
>  	unsigned int pitch;
> @@ -82,6 +87,7 @@ struct convert_xrgb8888_case {
>  	struct convert_to_argb8888_result argb8888_result;
>  	struct convert_to_xrgb2101010_result xrgb2101010_result;
>  	struct convert_to_argb2101010_result argb2101010_result;
> +	struct convert_to_mono_result mono_result;
>  };
>  
>  static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
> @@ -131,6 +137,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
>  			.dst_pitch = 0,
>  			.expected = { 0xFFF00000 },
>  		},
> +		.mono_result = {
> +			.dst_pitch = 0,
> +			.expected = { 0x00 },
> +		},
>  	},
>  	{
>  		.name = "single_pixel_clip_rectangle",
> @@ -181,6 +191,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
>  			.dst_pitch = 0,
>  			.expected = { 0xFFF00000 },
>  		},
> +		.mono_result = {
> +			.dst_pitch = 0,
> +			.expected = { 0x00 },
> +		},
>  	},
>  	{
>  		/* Well known colors: White, black, red, green, blue, magenta,
> @@ -293,6 +307,15 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
>  				0xFFFFFC00, 0xC00FFFFF,
>  			},
>  		},
> +		.mono_result = {
> +			.dst_pitch = 0,
> +			.expected = {
> +				0x01,
> +				0x02,
> +				0x00,
> +				0x03,
> +			},
> +		},
>  	},
>  	{
>  		/* Randomly picked colors. Full buffer within the clip area. */
> @@ -392,6 +415,14 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
>  				0xEA20300C, 0xDB1705CD, 0xC3844672, 0x00000000, 0x00000000,
>  			},
>  		},
> +		.mono_result = {
> +			.dst_pitch = 0,
> +			.expected = {
> +				0x00,
> +				0x00,
> +				0x00,
> +			},
> +		},
>  	},
>  };
>  
> @@ -792,6 +823,37 @@ static void drm_test_fb_xrgb8888_to_argb2101010(struct kunit *test)
>  	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>  }
>  
> +static void drm_test_fb_xrgb8888_to_mono(struct kunit *test)
> +{
> +	const struct convert_xrgb8888_case *params = test->param_value;
> +	const struct convert_to_mono_result *result = &params->mono_result;
> +	size_t dst_size;
> +	u8 *buf = NULL;
> +	__le32 *xrgb8888 = NULL;
> +	struct iosys_map dst, src;
> +
> +	struct drm_framebuffer fb = {
> +		.format = drm_format_info(DRM_FORMAT_XRGB8888),
> +		.pitches = { params->pitch, 0, 0 },
> +	};
> +
> +	dst_size = conversion_buf_size(DRM_FORMAT_C1, result->dst_pitch,
> +				       &params->clip);
> +
> +	KUNIT_ASSERT_GT(test, dst_size, 0);
> +
> +	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
> +	iosys_map_set_vaddr(&dst, buf);
> +
> +	xrgb8888 = cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
> +	iosys_map_set_vaddr(&src, xrgb8888);
> +
> +	drm_fb_xrgb8888_to_mono(&dst, &result->dst_pitch, &src, &fb, &params->clip);
> +	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
> +}
> +
>  static struct kunit_case drm_format_helper_test_cases[] = {
>  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_gray8, convert_xrgb8888_gen_params),
>  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb332, convert_xrgb8888_gen_params),
> @@ -803,6 +865,7 @@ static struct kunit_case drm_format_helper_test_cases[] = {
>  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb8888, convert_xrgb8888_gen_params),
>  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_xrgb2101010, convert_xrgb8888_gen_params),
>  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb2101010, convert_xrgb8888_gen_params),
> +	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_mono, convert_xrgb8888_gen_params),
>  	{}
>  };
>  

Hi Javier. Thank you for your review :)

Thank you for your patch! I too think that a new helper is not needed.
I will send the v2 when your patch is applied.
