Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DF0AD8E7F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 16:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524FB10E9D3;
	Fri, 13 Jun 2025 14:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fK1gLCpJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28AA010E9D1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 14:03:25 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so1664431f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 07:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749823404; x=1750428204; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GhaX4dEGrck4BMe7tJh9Tq+4ea/G/rPaVpndQoIE1mk=;
 b=fK1gLCpJbHg3wniBmJybeP0xw8OKtg1g2nohIqcrcn8CIFHs0ZxVKKLugbzy79c4l+
 5oE9bbN1XMXLFauz27dfS7qoCXLQM3xLNs+8NXET7eneXNtur32jWnoV0WvATCSvN9wh
 wfFKGoAMmorGJHRPjYTiYd3J9e5mLk9rl4ZlLBWv5h1pcxI8v3UXylVdLZs+nO/DJJvS
 rC4gOBxr+CYEQqvEtIiAmcmu2q0CxtM0oUadHOdXjW0KRYIeNbVpmCa4Ri5Oi96KkBTH
 rVHb1kJvQFj+vEvljith3i6FjevVM5Rdbfrew4zzMjAMn8LEpYs5qVHIQc9yO4RWeN1p
 pMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749823404; x=1750428204;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GhaX4dEGrck4BMe7tJh9Tq+4ea/G/rPaVpndQoIE1mk=;
 b=tlYeWvyYTZvzaRsr+U54TH7hmv/Y90Ulaxd2ClWbtrgHA6pKWp+Onj4fBWtUGNzs+3
 m9dQEDagI24Lm4Mk1W2wnVILE+2o0Qz1UKlUJeeqj73DhD0xNudRu2CX+LUxIEbAlaiv
 eBYBv+dMjhrRToBNj1YtwRccZQlkcK9XtjdfsHtyhcgaN3y9xELKAqW9E1Pdf0OL111z
 O4ZAC5fC0rMku5G7iVBJQuxrR7HbPts3x5jnLf8Oq2IkI/yqGqDYscmvWnPACAr0yEDC
 uR52QbWr0fA3Q6Lh9606g0GSQSddyi0ASTr6T3+J0vkCI/HpSQzEIqjrCawdVVy2uwMc
 w/Ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmX731e0wjT2RfR2B8FO5HZuvJFKGGlYtckYw6CQJRepfbb0uRAtIRcE6emR+q7GMVuk198m7sySc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOjbJwcmr3MShQ0u3hXpeJclz1oDzyx3+AoltY0lcyhr/CepX9
 W27JWVsv4/ldJ6E/iyds+dDWDej3QkNJ+wG7FH8aJq8TeAwiIG+2ehxy
X-Gm-Gg: ASbGncsOcVIABxHzYdxTJRWdr1mXUv+Lzo47ydgloG9mXuFwCJEiEJEXYjm83O6xsc/
 3RpK03SvMWg2UJjgN3h3lNgSbMMomYr9zooCpyCAuV6oExo84H6t2fRFuzARCWcu4Bd1mRsh9CX
 QesIKNOGvd2mZ6LFmr7iEKCK3hwoo1R9rj5nRjPFeNpZZqnrIm1Pb6ivehTCceAvqI7kBwX4110
 a6riAfHwuiIAJcPzA5Xp50sossk14+3E6LlsCAlA/fsiYRKL+qfwqJ+MxHmgWkpuhaO7JtS4YTm
 /oHwSFWZ9KnxwgQ04ksqSoqauw7S9dFIxUHVt2hOJdzWKLHZ6o6ip3E54EA=
X-Google-Smtp-Source: AGHT+IG3OlAzfb909APCYBaULHgBbfJthYReQz97u1+noxK81jbxVTiOB8nttq1SPdge33GnqnYZSg==
X-Received: by 2002:a05:6000:1ac7:b0:3a5:2b1d:7889 with SMTP id
 ffacd0b85a97d-3a568772357mr3373337f8f.43.1749823402579; 
 Fri, 13 Jun 2025 07:03:22 -0700 (PDT)
Received: from fedora ([94.73.34.56]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e261ebdsm55571155e9.39.2025.06.13.07.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 07:03:22 -0700 (PDT)
Date: Fri, 13 Jun 2025 16:03:20 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: arthurgrillo@riseup.net, javierm@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/3] drm/tests: Test drm_fb_build_fourcc_list() in
 separate test suite
Message-ID: <aEwvqLRHoXjRhJmN@fedora>
References: <20250612135658.232535-1-tzimmermann@suse.de>
 <20250612135658.232535-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250612135658.232535-3-tzimmermann@suse.de>
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

On Thu, Jun 12, 2025 at 03:52:23PM +0200, Thomas Zimmermann wrote:
> Only sysfb drivers use drm_fb_build_fourcc_list(). The helper will
> be moved from format helpers to sysfb helpers. Moving the related
> tests to their own test suite.
> 
> v2:
> - rename filename to match tested code (Maxime)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/Makefile                |   3 +-
>  .../gpu/drm/tests/drm_format_helper_test.c    | 142 ---------------
>  .../gpu/drm/tests/drm_sysfb_modeset_test.c    | 166 ++++++++++++++++++
>  3 files changed, 168 insertions(+), 143 deletions(-)
>  create mode 100644 drivers/gpu/drm/tests/drm_sysfb_modeset_test.c
> 
> diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
> index 3afd6587df08..c0e952293ad0 100644
> --- a/drivers/gpu/drm/tests/Makefile
> +++ b/drivers/gpu/drm/tests/Makefile
> @@ -23,6 +23,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
>  	drm_modes_test.o \
>  	drm_plane_helper_test.o \
>  	drm_probe_helper_test.o \
> -	drm_rect_test.o
> +	drm_rect_test.o \
> +	drm_sysfb_modeset_test.o
>  
>  CFLAGS_drm_mm_test.o := $(DISABLE_STRUCTLEAK_PLUGIN)
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index 8aacc1ffa93a..ef1cc3b28f1b 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -1335,147 +1335,6 @@ static void drm_test_fb_clip_offset(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, offset, params->expected_offset);
>  }
>  
> -struct fb_build_fourcc_list_case {
> -	const char *name;
> -	u32 native_fourccs[TEST_BUF_SIZE];
> -	size_t native_fourccs_size;
> -	u32 expected[TEST_BUF_SIZE];
> -	size_t expected_fourccs_size;
> -};
> -
> -static struct fb_build_fourcc_list_case fb_build_fourcc_list_cases[] = {
> -	{
> -		.name = "no native formats",
> -		.native_fourccs = { },
> -		.native_fourccs_size = 0,
> -		.expected = { DRM_FORMAT_XRGB8888 },
> -		.expected_fourccs_size = 1,
> -	},
> -	{
> -		.name = "XRGB8888 as native format",
> -		.native_fourccs = { DRM_FORMAT_XRGB8888 },
> -		.native_fourccs_size = 1,
> -		.expected = { DRM_FORMAT_XRGB8888 },
> -		.expected_fourccs_size = 1,
> -	},
> -	{
> -		.name = "remove duplicates",
> -		.native_fourccs = {
> -			DRM_FORMAT_XRGB8888,
> -			DRM_FORMAT_XRGB8888,
> -			DRM_FORMAT_RGB888,
> -			DRM_FORMAT_RGB888,
> -			DRM_FORMAT_RGB888,
> -			DRM_FORMAT_XRGB8888,
> -			DRM_FORMAT_RGB888,
> -			DRM_FORMAT_RGB565,
> -			DRM_FORMAT_RGB888,
> -			DRM_FORMAT_XRGB8888,
> -			DRM_FORMAT_RGB565,
> -			DRM_FORMAT_RGB565,
> -			DRM_FORMAT_XRGB8888,
> -		},
> -		.native_fourccs_size = 11,
> -		.expected = {
> -			DRM_FORMAT_XRGB8888,
> -			DRM_FORMAT_RGB888,
> -			DRM_FORMAT_RGB565,
> -		},
> -		.expected_fourccs_size = 3,
> -	},
> -	{
> -		.name = "convert alpha formats",
> -		.native_fourccs = {
> -			DRM_FORMAT_ARGB1555,
> -			DRM_FORMAT_ABGR1555,
> -			DRM_FORMAT_RGBA5551,
> -			DRM_FORMAT_BGRA5551,
> -			DRM_FORMAT_ARGB8888,
> -			DRM_FORMAT_ABGR8888,
> -			DRM_FORMAT_RGBA8888,
> -			DRM_FORMAT_BGRA8888,
> -			DRM_FORMAT_ARGB2101010,
> -			DRM_FORMAT_ABGR2101010,
> -			DRM_FORMAT_RGBA1010102,
> -			DRM_FORMAT_BGRA1010102,
> -		},
> -		.native_fourccs_size = 12,
> -		.expected = {
> -			DRM_FORMAT_XRGB1555,
> -			DRM_FORMAT_XBGR1555,
> -			DRM_FORMAT_RGBX5551,
> -			DRM_FORMAT_BGRX5551,
> -			DRM_FORMAT_XRGB8888,
> -			DRM_FORMAT_XBGR8888,
> -			DRM_FORMAT_RGBX8888,
> -			DRM_FORMAT_BGRX8888,
> -			DRM_FORMAT_XRGB2101010,
> -			DRM_FORMAT_XBGR2101010,
> -			DRM_FORMAT_RGBX1010102,
> -			DRM_FORMAT_BGRX1010102,
> -		},
> -		.expected_fourccs_size = 12,
> -	},
> -	{
> -		.name = "random formats",
> -		.native_fourccs = {
> -			DRM_FORMAT_Y212,
> -			DRM_FORMAT_ARGB1555,
> -			DRM_FORMAT_ABGR16161616F,
> -			DRM_FORMAT_C8,
> -			DRM_FORMAT_BGR888,
> -			DRM_FORMAT_XRGB1555,
> -			DRM_FORMAT_RGBA5551,
> -			DRM_FORMAT_BGR565_A8,
> -			DRM_FORMAT_R10,
> -			DRM_FORMAT_XYUV8888,
> -		},
> -		.native_fourccs_size = 10,
> -		.expected = {
> -			DRM_FORMAT_Y212,
> -			DRM_FORMAT_XRGB1555,
> -			DRM_FORMAT_ABGR16161616F,
> -			DRM_FORMAT_C8,
> -			DRM_FORMAT_BGR888,
> -			DRM_FORMAT_RGBX5551,
> -			DRM_FORMAT_BGR565_A8,
> -			DRM_FORMAT_R10,
> -			DRM_FORMAT_XYUV8888,
> -			DRM_FORMAT_XRGB8888,
> -		},
> -		.expected_fourccs_size = 10,
> -	},
> -};
> -
> -static void fb_build_fourcc_list_case_desc(struct fb_build_fourcc_list_case *t, char *desc)
> -{
> -	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
> -}
> -
> -KUNIT_ARRAY_PARAM(fb_build_fourcc_list, fb_build_fourcc_list_cases, fb_build_fourcc_list_case_desc);
> -
> -static void drm_test_fb_build_fourcc_list(struct kunit *test)
> -{
> -	const struct fb_build_fourcc_list_case *params = test->param_value;
> -	u32 fourccs_out[TEST_BUF_SIZE] = {0};
> -	size_t nfourccs_out;
> -	struct drm_device *drm;
> -	struct device *dev;
> -
> -	dev = drm_kunit_helper_alloc_device(test);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
> -
> -	drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0, DRIVER_MODESET);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
> -
> -	nfourccs_out = drm_fb_build_fourcc_list(drm, params->native_fourccs,
> -						params->native_fourccs_size,
> -						fourccs_out, TEST_BUF_SIZE);
> -
> -	KUNIT_EXPECT_EQ(test, nfourccs_out, params->expected_fourccs_size);
> -	KUNIT_EXPECT_MEMEQ(test, fourccs_out, params->expected, TEST_BUF_SIZE);
> -}
> -
>  struct fb_memcpy_case {
>  	const char *name;
>  	u32 format;
> @@ -1864,7 +1723,6 @@ static struct kunit_case drm_format_helper_test_cases[] = {
>  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_xbgr8888, convert_xrgb8888_gen_params),
>  	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_abgr8888, convert_xrgb8888_gen_params),
>  	KUNIT_CASE_PARAM(drm_test_fb_clip_offset, clip_offset_gen_params),
> -	KUNIT_CASE_PARAM(drm_test_fb_build_fourcc_list, fb_build_fourcc_list_gen_params),
>  	KUNIT_CASE_PARAM(drm_test_fb_memcpy, fb_memcpy_gen_params),
>  	{}
>  };
> diff --git a/drivers/gpu/drm/tests/drm_sysfb_modeset_test.c b/drivers/gpu/drm/tests/drm_sysfb_modeset_test.c
> new file mode 100644
> index 000000000000..88a4bf28c745
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_sysfb_modeset_test.c
> @@ -0,0 +1,166 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +#include <kunit/test.h>
> +
> +#include <drm/drm_format_helper.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_kunit_helpers.h>
> +
> +#define TEST_BUF_SIZE 50
> +
> +struct fb_build_fourcc_list_case {
> +	const char *name;
> +	u32 native_fourccs[TEST_BUF_SIZE];
> +	size_t native_fourccs_size;
> +	u32 expected[TEST_BUF_SIZE];
> +	size_t expected_fourccs_size;
> +};
> +
> +static struct fb_build_fourcc_list_case fb_build_fourcc_list_cases[] = {
> +	{
> +		.name = "no native formats",
> +		.native_fourccs = { },
> +		.native_fourccs_size = 0,
> +		.expected = { DRM_FORMAT_XRGB8888 },
> +		.expected_fourccs_size = 1,
> +	},
> +	{
> +		.name = "XRGB8888 as native format",
> +		.native_fourccs = { DRM_FORMAT_XRGB8888 },
> +		.native_fourccs_size = 1,
> +		.expected = { DRM_FORMAT_XRGB8888 },
> +		.expected_fourccs_size = 1,
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
> +		.native_fourccs_size = 11,
> +		.expected = {
> +			DRM_FORMAT_XRGB8888,
> +			DRM_FORMAT_RGB888,
> +			DRM_FORMAT_RGB565,
> +		},
> +		.expected_fourccs_size = 3,
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
> +		.native_fourccs_size = 12,
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
> +		.expected_fourccs_size = 12,
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
> +		.native_fourccs_size = 10,
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
> +		.expected_fourccs_size = 10,
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
> +static void drm_test_fb_build_fourcc_list(struct kunit *test)
> +{
> +	const struct fb_build_fourcc_list_case *params = test->param_value;
> +	u32 fourccs_out[TEST_BUF_SIZE] = {0};
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
> +						params->native_fourccs_size,
> +						fourccs_out, TEST_BUF_SIZE);
> +
> +	KUNIT_EXPECT_EQ(test, nfourccs_out, params->expected_fourccs_size);
> +	KUNIT_EXPECT_MEMEQ(test, fourccs_out, params->expected, TEST_BUF_SIZE);
> +}
> +
> +static struct kunit_case drm_sysfb_helper_test_cases[] = {
> +	KUNIT_CASE_PARAM(drm_test_fb_build_fourcc_list, fb_build_fourcc_list_gen_params),
> +	{}
> +};
> +
> +static struct kunit_suite drm_sysfb_helper_test_suite = {
> +	.name = "drm_sysfb_helper_test",

Other tests use the same name as the file live in, dropping or not
the "_test" suffix.

Is this a missing change from the rename in v1?

Other than that:

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

> +	.test_cases = drm_sysfb_helper_test_cases,
> +};
> +
> +kunit_test_suite(drm_sysfb_helper_test_suite);
> +
> +MODULE_DESCRIPTION("KUnit tests for the drm_sysfb_helper APIs");
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("José Expósito <jose.exposito89@gmail.com>");
> -- 
> 2.49.0
> 
