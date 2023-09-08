Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7082D79914A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 22:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1932010E95B;
	Fri,  8 Sep 2023 20:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5545D10E95A
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 20:52:17 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4Rj7b5038bz9scb;
 Fri,  8 Sep 2023 20:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1694206337; bh=2Y/kMyD/z9pXU7s6HkrEXYDIlqypOuBOVO8Uu8nZ41M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eer7x/sxK4RH7m/Z/iw5XLy02G3x35Uz3cXOkuegmj/juwx9w3Z3ObUH3vDzknBiM
 V8K9hjYmygtPjP++3nDk0SQPhcsw63kPpvMiFdW/at1hyWTqtDdeqNsPERwGe++6Ip
 EonXaVJnlsddfL3MZP7YKf0pcoxTjFinu/QuVVtE=
X-Riseup-User-ID: 312483AA142EEE3508F02C1A56B8C2911D0784095B4F6D6D9164640054B6E0C4
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4Rj7Zp722dzJqBr;
 Fri,  8 Sep 2023 20:52:02 +0000 (UTC)
Message-ID: <4a1d5042-e698-6657-61a0-bb2f61468231@riseup.net>
Date: Fri, 8 Sep 2023 17:52:05 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] drm/tests: Add new format conversion tests to
 better cover drm_fb_blit()
Content-Language: en-US
To: Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
References: <20230905-final-gsoc-v2-0-b52e8cb068ea@riseup.net>
 <20230905-final-gsoc-v2-2-b52e8cb068ea@riseup.net>
From: Maira Canal <mairacanal@riseup.net>
In-Reply-To: <20230905-final-gsoc-v2-2-b52e8cb068ea@riseup.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, tales.aparecida@gmail.com,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arthur,

On 9/5/23 18:27, Arthur Grillo wrote:
> To fully cover drm_fb_blit(), add format conversion tests that are only
> supported through drm_fb_blit().
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>

Reviewed-by: Maíra Canal <mairacanal@riseup.net>

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/tests/drm_format_helper_test.c | 142 +++++++++++++++++++++++++
>   1 file changed, 142 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index b888f7334510..889287245b1e 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -81,6 +81,16 @@ struct fb_swab_result {
>   	const u32 expected[TEST_BUF_SIZE];
>   };
>   
> +struct convert_to_xbgr8888_result {
> +	unsigned int dst_pitch;
> +	const u32 expected[TEST_BUF_SIZE];
> +};
> +
> +struct convert_to_abgr8888_result {
> +	unsigned int dst_pitch;
> +	const u32 expected[TEST_BUF_SIZE];
> +};
> +
>   struct convert_xrgb8888_case {
>   	const char *name;
>   	unsigned int pitch;
> @@ -98,6 +108,8 @@ struct convert_xrgb8888_case {
>   	struct convert_to_argb2101010_result argb2101010_result;
>   	struct convert_to_mono_result mono_result;
>   	struct fb_swab_result swab_result;
> +	struct convert_to_xbgr8888_result xbgr8888_result;
> +	struct convert_to_abgr8888_result abgr8888_result;
>   };
>   
>   static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
> @@ -155,6 +167,14 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
>   			.dst_pitch =  TEST_USE_DEFAULT_PITCH,
>   			.expected = { 0x0000FF01 },
>   		},
> +		.xbgr8888_result = {
> +			.dst_pitch =  TEST_USE_DEFAULT_PITCH,
> +			.expected = { 0x010000FF },
> +		},
> +		.abgr8888_result = {
> +			.dst_pitch =  TEST_USE_DEFAULT_PITCH,
> +			.expected = { 0xFF0000FF },
> +		},
>   	},
>   	{
>   		.name = "single_pixel_clip_rectangle",
> @@ -213,6 +233,14 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
>   			.dst_pitch =  TEST_USE_DEFAULT_PITCH,
>   			.expected = { 0x0000FF10 },
>   		},
> +		.xbgr8888_result = {
> +			.dst_pitch =  TEST_USE_DEFAULT_PITCH,
> +			.expected = { 0x100000FF },
> +		},
> +		.abgr8888_result = {
> +			.dst_pitch =  TEST_USE_DEFAULT_PITCH,
> +			.expected = { 0xFF0000FF },
> +		},
>   	},
>   	{
>   		/* Well known colors: White, black, red, green, blue, magenta,
> @@ -343,6 +371,24 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
>   				0x00FFFF77, 0xFFFF0088,
>   			},
>   		},
> +		.xbgr8888_result = {
> +			.dst_pitch =  TEST_USE_DEFAULT_PITCH,
> +			.expected = {
> +				0x11FFFFFF, 0x22000000,
> +				0x330000FF, 0x4400FF00,
> +				0x55FF0000, 0x66FF00FF,
> +				0x7700FFFF, 0x88FFFF00,
> +			},
> +		},
> +		.abgr8888_result = {
> +			.dst_pitch =  TEST_USE_DEFAULT_PITCH,
> +			.expected = {
> +				0xFFFFFFFF, 0xFF000000,
> +				0xFF0000FF, 0xFF00FF00,
> +				0xFFFF0000, 0xFFFF00FF,
> +				0xFF00FFFF, 0xFFFFFF00,
> +			},
> +		},
>   	},
>   	{
>   		/* Randomly picked colors. Full buffer within the clip area. */
> @@ -458,6 +504,22 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
>   				0x0303A8C2, 0x73F06CD2, 0x9C440EA3, 0x00000000, 0x00000000,
>   			},
>   		},
> +		.xbgr8888_result = {
> +			.dst_pitch =  20,
> +			.expected = {
> +				0xA19C440E, 0xB1054D11, 0xC103F3A8, 0x00000000, 0x00000000,
> +				0xD173F06C, 0xA29C440E, 0xB2054D11, 0x00000000, 0x00000000,
> +				0xC20303A8, 0xD273F06C, 0xA39C440E, 0x00000000, 0x00000000,
> +			},
> +		},
> +		.abgr8888_result = {
> +			.dst_pitch =  20,
> +			.expected = {
> +				0xFF9C440E, 0xFF054D11, 0xFF03F3A8, 0x00000000, 0x00000000,
> +				0xFF73F06C, 0xFF9C440E, 0xFF054D11, 0x00000000, 0x00000000,
> +				0xFF0303A8, 0xFF73F06C, 0xFF9C440E, 0x00000000, 0x00000000,
> +			},
> +		},
>   	},
>   };
>   
> @@ -1082,6 +1144,84 @@ static void drm_test_fb_swab(struct kunit *test)
>   	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>   }
>   
> +static void drm_test_fb_xrgb8888_to_abgr8888(struct kunit *test)
> +{
> +	const struct convert_xrgb8888_case *params = test->param_value;
> +	const struct convert_to_abgr8888_result *result = &params->abgr8888_result;
> +	size_t dst_size;
> +	u32 *buf = NULL;
> +	__le32 *xrgb8888 = NULL;
> +	struct iosys_map dst, src;
> +
> +	struct drm_framebuffer fb = {
> +		.format = drm_format_info(DRM_FORMAT_XRGB8888),
> +		.pitches = { params->pitch, 0, 0 },
> +	};
> +
> +	dst_size = conversion_buf_size(DRM_FORMAT_XBGR8888, result->dst_pitch, &params->clip, 0);
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
> +	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
> +		NULL : &result->dst_pitch;
> +
> +	int blit_result = 0;
> +
> +	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_ABGR8888, &src, &fb, &params->clip);
> +
> +	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
> +
> +	KUNIT_EXPECT_FALSE(test, blit_result);
> +	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
> +}
> +
> +static void drm_test_fb_xrgb8888_to_xbgr8888(struct kunit *test)
> +{
> +	const struct convert_xrgb8888_case *params = test->param_value;
> +	const struct convert_to_xbgr8888_result *result = &params->xbgr8888_result;
> +	size_t dst_size;
> +	u32 *buf = NULL;
> +	__le32 *xrgb8888 = NULL;
> +	struct iosys_map dst, src;
> +
> +	struct drm_framebuffer fb = {
> +		.format = drm_format_info(DRM_FORMAT_XRGB8888),
> +		.pitches = { params->pitch, 0, 0 },
> +	};
> +
> +	dst_size = conversion_buf_size(DRM_FORMAT_XBGR8888, result->dst_pitch, &params->clip, 0);
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
> +	const unsigned int *dst_pitch = (result->dst_pitch == TEST_USE_DEFAULT_PITCH) ?
> +		NULL : &result->dst_pitch;
> +
> +	int blit_result = 0;
> +
> +	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XBGR8888, &src, &fb, &params->clip);
> +
> +	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
> +
> +	KUNIT_EXPECT_FALSE(test, blit_result);
> +	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
> +}
> +
>   struct clip_offset_case {
>   	const char *name;
>   	unsigned int pitch;
> @@ -1700,6 +1840,8 @@ static struct kunit_case drm_format_helper_test_cases[] = {
>   	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb2101010, convert_xrgb8888_gen_params),
>   	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_mono, convert_xrgb8888_gen_params),
>   	KUNIT_CASE_PARAM(drm_test_fb_swab, convert_xrgb8888_gen_params),
> +	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_xbgr8888, convert_xrgb8888_gen_params),
> +	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_abgr8888, convert_xrgb8888_gen_params),
>   	KUNIT_CASE_PARAM(drm_test_fb_clip_offset, clip_offset_gen_params),
>   	KUNIT_CASE_PARAM(drm_test_fb_build_fourcc_list, fb_build_fourcc_list_gen_params),
>   	KUNIT_CASE_PARAM(drm_test_fb_memcpy, fb_memcpy_gen_params),
> 
