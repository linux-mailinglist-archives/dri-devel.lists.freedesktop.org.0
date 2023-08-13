Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7A277A687
	for <lists+dri-devel@lfdr.de>; Sun, 13 Aug 2023 15:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62DEA10E02E;
	Sun, 13 Aug 2023 13:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A6B10E02E
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Aug 2023 13:32:03 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4RNz3725SBz9t0j;
 Sun, 13 Aug 2023 13:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1691933523; bh=AslZaOrK9FZVmstoeIAp8MvLDeg+RldAT+4FNsSjf/Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sipr6eWl5G8nDIofY939v4NZYFDzZZiK1czT4aX/RxTSRcN9ATRB6SdibfPKLRwha
 xge2n9TYAlTvf1QlytY5ebu+PMutO0Z7SuKTXHrNH2nlEaAtwX14uehBr0HKQBdaOz
 2nKjj50WOz0Ky7JLmhzYwKOIdqthO8IDkU1BRKc8=
X-Riseup-User-ID: D1EA3B1A78CD6B42CECA90CEEEECE9EE0E06FE8D429B021B4A07C6030AA8788A
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4RNz346JgVzFpwq;
 Sun, 13 Aug 2023 13:32:00 +0000 (UTC)
Message-ID: <ad121cee-dd68-aa58-78fb-1ba306ccd239@riseup.net>
Date: Sun, 13 Aug 2023 10:31:59 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/6] drm/tests: Add KUnit tests for
 drm_fb_build_fourcc_list()
Content-Language: en-US
To: Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org
References: <20230811-gsoc-drm-format-test-v2-v2-0-763b17890644@riseup.net>
 <20230811-gsoc-drm-format-test-v2-v2-4-763b17890644@riseup.net>
From: Maira Canal <mairacanal@riseup.net>
In-Reply-To: <20230811-gsoc-drm-format-test-v2-v2-4-763b17890644@riseup.net>
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



On 8/11/23 15:17, Arthur Grillo wrote:
> Insert parameterized test for the drm_fb_build_fourcc_list() to ensure
> correctness and prevent future regressions.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>   drivers/gpu/drm/tests/drm_format_helper_test.c | 148 +++++++++++++++++++++++++
>   1 file changed, 148 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index 7f24da0b1e00..2b55d9f025f9 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -3,11 +3,13 @@
>   #include <kunit/test.h>
>   
>   #include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
>   #include <drm/drm_file.h>
>   #include <drm/drm_format_helper.h>
>   #include <drm/drm_fourcc.h>
>   #include <drm/drm_framebuffer.h>
>   #include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_kunit_helpers.h>
>   #include <drm/drm_mode.h>
>   #include <drm/drm_print.h>
>   #include <drm/drm_rect.h>
> @@ -1041,6 +1043,151 @@ static void drm_test_fb_clip_offset(struct kunit *test)
>   	KUNIT_EXPECT_EQ(test, offset, params->expected_offset);
>   }
>   
> +struct fb_build_fourcc_list_case {
> +	const char *name;
> +	u32 native_fourccs[TEST_BUF_SIZE];
> +	u32 expected[TEST_BUF_SIZE];
> +	size_t fourccs_size;
> +};
> +
> +static struct fb_build_fourcc_list_case fb_build_fourcc_list_cases[] = {
> +	{
> +		.name = "no native formats",
> +		.native_fourccs = { },
> +		.expected = { DRM_FORMAT_XRGB8888 },
> +		.fourccs_size = 1,
> +	},
> +	{
> +		.name = "XRGB8888 as native format",
> +		.native_fourccs = { DRM_FORMAT_XRGB8888 },
> +		.expected = { DRM_FORMAT_XRGB8888 },
> +		.fourccs_size = 1,
> +	},
> +	{
> +		.name = "remove duplicates",
> +		.native_fourccs = {
> +			DRM_FORMAT_XRGB8888,
> +			DRM_FORMAT_XRGB8888,
> +			DRM_FORMAT_RGB888,
> +			DRM_FORMAT_RGB888,
> +			DRM_FORMAT_RGB888,
> +			DRM_FORMAT_XRGB8888,
> +			DRM_FORMAT_RGB888,
> +			DRM_FORMAT_RGB565,
> +			DRM_FORMAT_RGB888,
> +			DRM_FORMAT_XRGB8888,
> +			DRM_FORMAT_RGB565,
> +			DRM_FORMAT_RGB565,
> +			DRM_FORMAT_XRGB8888,
> +		},
> +		.expected = {
> +			DRM_FORMAT_XRGB8888,
> +			DRM_FORMAT_RGB888,
> +			DRM_FORMAT_RGB565,
> +		},
> +		.fourccs_size = 3,
> +	},
> +	{
> +		.name = "convert alpha formats",
> +		.native_fourccs = {
> +			DRM_FORMAT_ARGB1555,
> +			DRM_FORMAT_ABGR1555,
> +			DRM_FORMAT_RGBA5551,
> +			DRM_FORMAT_BGRA5551,
> +			DRM_FORMAT_ARGB8888,
> +			DRM_FORMAT_ABGR8888,
> +			DRM_FORMAT_RGBA8888,
> +			DRM_FORMAT_BGRA8888,
> +			DRM_FORMAT_ARGB2101010,
> +			DRM_FORMAT_ABGR2101010,
> +			DRM_FORMAT_RGBA1010102,
> +			DRM_FORMAT_BGRA1010102,
> +		},
> +		.expected = {
> +			DRM_FORMAT_XRGB1555,
> +			DRM_FORMAT_XBGR1555,
> +			DRM_FORMAT_RGBX5551,
> +			DRM_FORMAT_BGRX5551,
> +			DRM_FORMAT_XRGB8888,
> +			DRM_FORMAT_XBGR8888,
> +			DRM_FORMAT_RGBX8888,
> +			DRM_FORMAT_BGRX8888,
> +			DRM_FORMAT_XRGB2101010,
> +			DRM_FORMAT_XBGR2101010,
> +			DRM_FORMAT_RGBX1010102,
> +			DRM_FORMAT_BGRX1010102,
> +		},
> +		.fourccs_size = 12,
> +	},
> +	{
> +		.name = "random formats",
> +		.native_fourccs = {
> +			DRM_FORMAT_Y212,
> +			DRM_FORMAT_ARGB1555,
> +			DRM_FORMAT_ABGR16161616F,
> +			DRM_FORMAT_C8,
> +			DRM_FORMAT_BGR888,
> +			DRM_FORMAT_XRGB1555,
> +			DRM_FORMAT_RGBA5551,
> +			DRM_FORMAT_BGR565_A8,
> +			DRM_FORMAT_R10,
> +			DRM_FORMAT_XYUV8888,
> +		},
> +		.expected = {
> +			DRM_FORMAT_Y212,
> +			DRM_FORMAT_XRGB1555,
> +			DRM_FORMAT_ABGR16161616F,
> +			DRM_FORMAT_C8,
> +			DRM_FORMAT_BGR888,
> +			DRM_FORMAT_RGBX5551,
> +			DRM_FORMAT_BGR565_A8,
> +			DRM_FORMAT_R10,
> +			DRM_FORMAT_XYUV8888,
> +			DRM_FORMAT_XRGB8888,
> +		},
> +		.fourccs_size = 10,
> +	},
> +};
> +
> +static void fb_build_fourcc_list_case_desc(struct fb_build_fourcc_list_case *t, char *desc)
> +{
> +	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +KUNIT_ARRAY_PARAM(fb_build_fourcc_list, fb_build_fourcc_list_cases, fb_build_fourcc_list_case_desc);
> +
> +static size_t get_nfourccs(const u32 *fourccs)
> +{
> +	size_t i;
> +
> +	for (i = 0; i < TEST_BUF_SIZE && fourccs[i]; ++i)
> +		;
> +
> +	return i;
> +}
> +
> +static void drm_test_fb_build_fourcc_list(struct kunit *test)
> +{
> +	const struct fb_build_fourcc_list_case *params = test->param_value;
> +	u32 fourccs_out[TEST_BUF_SIZE];
> +	size_t nfourccs_out;
> +	struct drm_device *drm;
> +	struct device *dev;
> +
> +	dev = drm_kunit_helper_alloc_device(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
> +
> +	drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0, DRIVER_MODESET);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
> +
> +	nfourccs_out = drm_fb_build_fourcc_list(drm, params->native_fourccs,
> +						get_nfourccs(params->native_fourccs),

Can we hard-code the number of native fourccs?

Best Regards,
- Maíra

> +						fourccs_out, TEST_BUF_SIZE);
> +
> +	KUNIT_EXPECT_EQ(test, nfourccs_out, params->fourccs_size);
> +	KUNIT_EXPECT_MEMEQ(test, fourccs_out, params->expected, TEST_BUF_SIZE);
> +}
> +
>   static struct kunit_case drm_format_helper_test_cases[] = {
>   	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_gray8, convert_xrgb8888_gen_params),
>   	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb332, convert_xrgb8888_gen_params),
> @@ -1055,6 +1202,7 @@ static struct kunit_case drm_format_helper_test_cases[] = {
>   	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_mono, convert_xrgb8888_gen_params),
>   	KUNIT_CASE_PARAM(drm_test_fb_swab, convert_xrgb8888_gen_params),
>   	KUNIT_CASE_PARAM(drm_test_fb_clip_offset, clip_offset_gen_params),
> +	KUNIT_CASE_PARAM(drm_test_fb_build_fourcc_list, fb_build_fourcc_list_gen_params),
>   	{}
>   };
>   
> 
