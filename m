Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B0C990244
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 13:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D3110E9DD;
	Fri,  4 Oct 2024 11:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="L2NAg0c/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72A810E9D0;
 Fri,  4 Oct 2024 11:43:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D00281BF205;
 Fri,  4 Oct 2024 11:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1728042209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JAsMI26L70fEPxGQZmCSTeYbs+xk34pb86ENnB2BI6M=;
 b=L2NAg0c/gDm8Dc80qVwX2XWCLFsrEeP0865dWeWMCOrhrzxKqgnJHbWPOLneG4Su0G6suH
 U+f25KaOKLdAWRz7mFTk+0fEq2zht6eId08Yo5+Vi0nNm4y1DjBIbdHUC19ugKSxlMwLVs
 gMVPFqPy3NSRhgBhJGXmT1eJW9zX0ZRPv5FdQCNQMxXIsB0ULLwGcPW7FH9z8iu+TfazIK
 26bM8y6paQijEXCH5aFwhTFjELUfjouiadl+L7HRtGOJawflGoezmP8OwEoeby3JR5Aa4p
 hFplIo32Tgeozb0QwwAkpKVGqS6eDjwughMdSbGLQaXoOfjLF+J26C5SFtVx3A==
Date: Fri, 4 Oct 2024 13:43:27 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 20/44] drm/tests: Add a few tests around drm_fixed.h
Message-ID: <Zv_U34ZfzP7_lFlQ@louis-chauvet-laptop>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
 <20241003200129.1732122-21-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003200129.1732122-21-harry.wentland@amd.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

Few checkpatch warnings:
- line length of 103 exceeds 100 columns
- Blank lines aren't necessary before a close brace '}'
- adding a line without newline at end of file

With those fixed:
Reviewd-by: Louis Chauvet <louis.chauvet@bootlin.com>

On 03/10/24 - 16:01, Harry Wentland wrote:
> While working on the CTM implementation of VKMS I had to ascertain
> myself of a few assumptions. One of those is whether drm_fixed.h
> treats its numbers using signed-magnitude or twos-complement. It is
> twos-complement.
> 
> In order to make someone else's day easier I am adding the
> drm_test_int2fixp test that validates the above assumption.
> 
> I am also adding a test for the new sm2fixp function that converts
> from a signed-magnitude fixed point to the twos-complement fixed
> point.
> 
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
> 
> v6:
>  - add missing MODULE_DESCRIPTION (Jeff Johnson)
>  - fix buffer overflow
> 
>  drivers/gpu/drm/tests/Makefile        |  3 +-
>  drivers/gpu/drm/tests/drm_fixp_test.c | 70 +++++++++++++++++++++++++++
>  2 files changed, 72 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c
> 
> diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
> index 56dab563abd7..bd69df0eee33 100644
> --- a/drivers/gpu/drm/tests/Makefile
> +++ b/drivers/gpu/drm/tests/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
>  	drm_modes_test.o \
>  	drm_plane_helper_test.o \
>  	drm_probe_helper_test.o \
> -	drm_rect_test.o
> +	drm_rect_test.o	\
> +	drm_fixp_test.o
> 
>  CFLAGS_drm_mm_test.o := $(DISABLE_STRUCTLEAK_PLUGIN)
> diff --git a/drivers/gpu/drm/tests/drm_fixp_test.c b/drivers/gpu/drm/tests/drm_fixp_test.c
> new file mode 100644
> index 000000000000..24a801cf38be
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_fixp_test.c
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2022 Advanced Micro Devices, Inc.
> + */
> +
> +#include <kunit/test.h>
> +#include <drm/drm_fixed.h>
> +
> +static void drm_test_sm2fixp(struct kunit *test)
> +{
> +	KUNIT_EXPECT_EQ(test, 0x7fffffffffffffffll, ((1ull << 63) - 1));
> +
> +	/* 1 */
> +	KUNIT_EXPECT_EQ(test, drm_int2fixp(1), drm_sm2fixp(1ull << DRM_FIXED_POINT));
> +
> +	/* -1 */
> +	KUNIT_EXPECT_EQ(test, drm_int2fixp(-1), drm_sm2fixp((1ull << 63) | (1ull << DRM_FIXED_POINT)));
> +
> +	/* 0.5 */
> +	KUNIT_EXPECT_EQ(test, drm_fixp_from_fraction(1, 2), drm_sm2fixp(1ull << (DRM_FIXED_POINT - 1)));
> +
> +	/* -0.5 */
> +	KUNIT_EXPECT_EQ(test, drm_fixp_from_fraction(-1, 2), drm_sm2fixp((1ull << 63) | (1ull << (DRM_FIXED_POINT - 1))));
> +
> +}
> +
> +static void drm_test_int2fixp(struct kunit *test)
> +{
> +	/* 1 */
> +	KUNIT_EXPECT_EQ(test, 1ll << 32, drm_int2fixp(1));
> +
> +	/* -1 */
> +	KUNIT_EXPECT_EQ(test, -(1ll << 32), drm_int2fixp(-1));
> +
> +	/* 1 + (-1) = 0 */
> +	KUNIT_EXPECT_EQ(test, 0, drm_int2fixp(1) + drm_int2fixp(-1));
> +
> +	/* 1 / 2 */
> +	KUNIT_EXPECT_EQ(test, 1ll << 31, drm_fixp_from_fraction(1, 2));
> +
> +	/* -0.5 */
> +	KUNIT_EXPECT_EQ(test, -(1ll << 31), drm_fixp_from_fraction(-1, 2));
> +
> +	/* (1 / 2) + (-1) = 0.5 */
> +	KUNIT_EXPECT_EQ(test, 1ll << 31, drm_fixp_from_fraction(-1, 2) + drm_int2fixp(1));
> +
> +	/* (1 / 2) - 1) = 0.5 */
> +	KUNIT_EXPECT_EQ(test, -(1ll << 31), drm_fixp_from_fraction(1, 2) + drm_int2fixp(-1));
> +
> +	/* (1 / 2) - 1) = 0.5 */
> +	KUNIT_EXPECT_EQ(test, -(1ll << 31), drm_fixp_from_fraction(1, 2) - drm_int2fixp(1));
> +
> +}
> +
> +static struct kunit_case drm_fixp_tests[] = {
> +	KUNIT_CASE(drm_test_int2fixp),
> +	KUNIT_CASE(drm_test_sm2fixp),
> +	{ }
> +};
> +
> +static struct kunit_suite drm_rect_test_suite = {
> +	.name = "drm_fixp",
> +	.test_cases = drm_fixp_tests,
> +};
> +
> +kunit_test_suite(drm_rect_test_suite);
> +
> +MODULE_AUTHOR("AMD");
> +MODULE_LICENSE("GPL and additional rights");
> +MODULE_DESCRIPTION("Unit tests for drm_fixed.h");
> \ No newline at end of file
> --
> 2.46.2
> 
