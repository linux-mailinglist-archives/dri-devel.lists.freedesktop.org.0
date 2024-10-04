Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA42990248
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 13:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D80B10E9D0;
	Fri,  4 Oct 2024 11:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TluQvSyw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF3310E9D0;
 Fri,  4 Oct 2024 11:43:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B06720002;
 Fri,  4 Oct 2024 11:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1728042212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZNyxjPe5bmwVXHnN5/6cDUzZaZ4XK06ZQMjLOZVU6M0=;
 b=TluQvSywCN7VKBqicPiXP6qgaHPrvkA1x2KeVb9L1p0tjRryJ43nd5O9ZUm7AofW53lA7h
 MdJVwZ/FYX9pS+mb2f67oFID6xGqlb10yQlo+hDnGrp2FTM+2gbVb2r4Juf3K84gKgDkTn
 qnWdhjX/usIgwfolK9DT8c3pN4d/p2VreA6F3gyCYgl+xpNgtbIDCp2xeFMktWXwCDaL38
 eJhf2h3kJjA7DzhSBmHrz6FmZCxZ1tgTXNoohyg/3ExL2VWgRMG+HLwDJXi1GHBtYNxdto
 rC/NMZ5LffQt9Qnn0Dpry2bKv5pvipUaJ6Dje9mNT5Vx1d82gmXInOCFMFUNNg==
Date: Fri, 4 Oct 2024 13:43:30 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org,
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [PATCH v6 03/44] drm/vkms: Add kunit tests for VKMS LUT handling
Message-ID: <Zv_U4leWEz4TVY_t@louis-chauvet-laptop>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
 <20241003200129.1732122-4-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003200129.1732122-4-harry.wentland@amd.com>
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

On 03/10/24 - 16:00, Harry Wentland wrote:
> Debugging LUT math is much easier when we can unit test
> it. Add kunit functionality to VKMS and add tests for
>  - get_lut_index
>  - lerp_u16
> 
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Arthur Grillo <arthurgrillo@riseup.net>
> ---
> v6:
>  - Eliminate need to include test as .c file (Louis Chauvet)

Thanks for the modification!

With the checkpatch warning fixed:
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> v5:
>  - Bring back static for lerp_u16 and get_lut_index (Arthur)
> 
> v4:
>  - Test the critical points of the lerp function (Pekka)
> 
> v3:
>  - Use include way of testing static functions (Arthur)
> 
>  drivers/gpu/drm/vkms/Kconfig                 |  15 ++
>  drivers/gpu/drm/vkms/Makefile                |   1 +
>  drivers/gpu/drm/vkms/tests/.kunitconfig      |   4 +
>  drivers/gpu/drm/vkms/tests/Makefile          |   3 +
>  drivers/gpu/drm/vkms/tests/vkms_color_test.c | 168 +++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_composer.c         |  10 +-
>  drivers/gpu/drm/vkms/vkms_composer.h         |  13 ++
>  7 files changed, 211 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
>  create mode 100644 drivers/gpu/drm/vkms/tests/Makefile
>  create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_test.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_composer.h
> 
> diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
> index b9ecdebecb0b..59c4a32adb9d 100644
> --- a/drivers/gpu/drm/vkms/Kconfig
> +++ b/drivers/gpu/drm/vkms/Kconfig
> @@ -13,3 +13,18 @@ config DRM_VKMS
>  	  a VKMS.
> 
>  	  If M is selected the module will be called vkms.
> +
> +config DRM_VKMS_KUNIT_TESTS
> +	tristate "KUnit tests for VKMS." if !KUNIT_ALL_TESTS
> +	depends on DRM_VKMS=y && KUNIT
> +	default KUNIT_ALL_TESTS
> +	help
> +	  This builds unit tests for VKMS. This option is not useful for
> +	  distributions or general kernels, but only for kernel
> +	  developers working on VKMS.
> +
> +	  For more information on KUnit and unit tests in general,
> +	  please refer to the KUnit documentation in
> +	  Documentation/dev-tools/kunit/.
> +
> +	  If in doubt, say "N".
> diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
> index 1b28a6a32948..8d3e46dde635 100644
> --- a/drivers/gpu/drm/vkms/Makefile
> +++ b/drivers/gpu/drm/vkms/Makefile
> @@ -9,3 +9,4 @@ vkms-y := \
>  	vkms_writeback.o
> 
>  obj-$(CONFIG_DRM_VKMS) += vkms.o
> +obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += tests/
> diff --git a/drivers/gpu/drm/vkms/tests/.kunitconfig b/drivers/gpu/drm/vkms/tests/.kunitconfig
> new file mode 100644
> index 000000000000..70e378228cbd
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/.kunitconfig
> @@ -0,0 +1,4 @@
> +CONFIG_KUNIT=y
> +CONFIG_DRM=y
> +CONFIG_DRM_VKMS=y
> +CONFIG_DRM_VKMS_KUNIT_TESTS=y
> diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
> new file mode 100644
> index 000000000000..7876ca7a3c42
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += vkms_color_test.o
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_test.c b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
> new file mode 100644
> index 000000000000..efe139978860
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
> @@ -0,0 +1,168 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */

checkpatch ask for a // comment here for the SPDX license (If you know, 
why checkpatch ask for a // in .c but /* */ in .h?)

> +
> +#include <kunit/test.h>
> +
> +#include <drm/drm_fixed.h>
> +#include <drm/drm_mode.h>
> +#include "../vkms_drv.h"
> +#include "../vkms_composer.h"
> +
> +#define TEST_LUT_SIZE 16
> +
> +MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
> +
> +static struct drm_color_lut test_linear_array[TEST_LUT_SIZE] = {
> +	{ 0x0, 0x0, 0x0, 0 },
> +	{ 0x1111, 0x1111, 0x1111, 0 },
> +	{ 0x2222, 0x2222, 0x2222, 0 },
> +	{ 0x3333, 0x3333, 0x3333, 0 },
> +	{ 0x4444, 0x4444, 0x4444, 0 },
> +	{ 0x5555, 0x5555, 0x5555, 0 },
> +	{ 0x6666, 0x6666, 0x6666, 0 },
> +	{ 0x7777, 0x7777, 0x7777, 0 },
> +	{ 0x8888, 0x8888, 0x8888, 0 },
> +	{ 0x9999, 0x9999, 0x9999, 0 },
> +	{ 0xaaaa, 0xaaaa, 0xaaaa, 0 },
> +	{ 0xbbbb, 0xbbbb, 0xbbbb, 0 },
> +	{ 0xcccc, 0xcccc, 0xcccc, 0 },
> +	{ 0xdddd, 0xdddd, 0xdddd, 0 },
> +	{ 0xeeee, 0xeeee, 0xeeee, 0 },
> +	{ 0xffff, 0xffff, 0xffff, 0 },
> +};
> +
> +const struct vkms_color_lut test_linear_lut = {
> +	.base = test_linear_array,
> +	.lut_length = TEST_LUT_SIZE,
> +	.channel_value2index_ratio = 0xf000fll
> +};
> +
> +

checkpatch: Please don't use multiple blank lines

> +static void vkms_color_test_get_lut_index(struct kunit *test)
> +{
> +	int i;
> +
> +	KUNIT_EXPECT_EQ(test, drm_fixp2int(get_lut_index(&test_linear_lut, test_linear_array[0].red)), 0);

checkpatch: line length of 106 exceeds 100 columns

	KUNIT_EXPECT_EQ(test, drm_fixp2int(get_lut_index(&test_linear_lut,
							 test_linear_array[0].red)), 0);

> +
> +	for (i = 0; i < TEST_LUT_SIZE; i++)
> +		KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&test_linear_lut, test_linear_array[i].red)), i);

checkpatch: line length of 119 exceeds 100 columns

		KUNIT_EXPECT_EQ(test,
				drm_fixp2int_ceil(get_lut_index(&test_linear_lut,
								test_linear_array[i].red)), i);

> +}
> +
> +static void vkms_color_test_lerp(struct kunit *test)
> +{
> +	/*** half-way round down ***/
> +	s64 t = 0x80000000 - 1;

checkpatch: Missing a blank line after declarations

> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x8);
> +
> +	/* odd a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x8);
> +
> +	/* odd b */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x8);
> +
> +	/* b = a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
> +
> +	/* b = a + 1 */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x10);
> +
> +

checkpatch: Please don't use multiple blank lines

> +	/*** half-way round up ***/
> +	t = 0x80000000;
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x8);
> +
> +	/* odd a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x9);
> +
> +	/* odd b */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x8);
> +
> +	/* b = a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
> +
> +	/* b = a + 1 */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x11);
> +
> +	/*** t = 0.0 ***/
> +	t = 0x0;
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x0);
> +
> +	/* odd a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x1);
> +
> +	/* odd b */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x1);
> +
> +	/* b = a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
> +
> +	/* b = a + 1 */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x10);
> +
> +	/*** t = 1.0 ***/
> +	t = 0x100000000;
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x10);
> +
> +	/* odd a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x10);
> +
> +	/* odd b */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0xf);
> +
> +	/* b = a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
> +
> +	/* b = a + 1 */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x11);
> +
> +

checkpatch: Please don't use multiple blank lines

> +	/*** t = 0.0 + 1 ***/
> +	t = 0x0 + 1;
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x0);
> +
> +	/* odd a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x1);
> +
> +	/* odd b */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0x1);
> +
> +	/* b = a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
> +
> +	/* b = a + 1 */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x10);
> +
> +	/*** t = 1.0 - 1 ***/
> +	t = 0x100000000 - 1;
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, t), 0x10);
> +
> +	/* odd a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0x10, t), 0x10);
> +
> +	/* odd b */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x1, 0xf, t), 0xf);
> +
> +	/* b = a */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x10, t), 0x10);
> +
> +	/* b = a + 1 */
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x10, 0x11, t), 0x11);
> +
> +

checkpatch: Please don't use multiple blank lines

> +	/*** t chosen to verify the flipping point of result a (or b) to a+1 (or b-1) ***/
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x1, 0x80000000 - 1), 0x0);
> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x1, 0x80000000), 0x1);
> +}
> +
> +static struct kunit_case vkms_color_test_cases[] = {
> +	KUNIT_CASE(vkms_color_test_get_lut_index),
> +	KUNIT_CASE(vkms_color_test_lerp),
> +	{}
> +};
> +
> +static struct kunit_suite vkms_color_test_suite = {
> +	.name = "vkms-color",
> +	.test_cases = vkms_color_test_cases,
> +};

checkpatch: Please use a blank line after function/struct/union/enum declarations

> +kunit_test_suite(vkms_color_test_suite);
> +
> +MODULE_LICENSE("GPL");
> \ No newline at end of file

checkpatch: adding a line without newline at end of file

> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 3d6785d081f2..93f4ed5ea52f 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -12,6 +12,8 @@
>  #include <linux/minmax.h>
> 
>  #include "vkms_drv.h"
> +#include <kunit/visibility.h>
> +#include "vkms_composer.h"
> 
>  static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
>  {
> @@ -91,7 +93,7 @@ static void fill_background(const struct pixel_argb_u16 *background_color,
>  }
> 
>  // lerp(a, b, t) = a + (b - a) * t
> -static u16 lerp_u16(u16 a, u16 b, s64 t)
> +VISIBLE_IF_KUNIT u16 lerp_u16(u16 a, u16 b, s64 t)
>  {
>  	s64 a_fp = drm_int2fixp(a);
>  	s64 b_fp = drm_int2fixp(b);
> @@ -100,13 +102,15 @@ static u16 lerp_u16(u16 a, u16 b, s64 t)
> 
>  	return drm_fixp2int_round(a_fp + delta);
>  }
> +EXPORT_SYMBOL_IF_KUNIT(lerp_u16);
> 
> -static s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
> +VISIBLE_IF_KUNIT s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
>  {
>  	s64 color_channel_fp = drm_int2fixp(channel_value);
> 
>  	return drm_fixp_mul(color_channel_fp, lut->channel_value2index_ratio);
>  }
> +EXPORT_SYMBOL_IF_KUNIT(get_lut_index);
> 
>  /*
>   * This enum is related to the positions of the variables inside
> @@ -434,4 +438,4 @@ int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
>  	vkms_set_composer(out, enabled);
> 
>  	return ret;
> -}
> +}
> \ No newline at end of file

checkpatch: adding a line without newline at end of file

> diff --git a/drivers/gpu/drm/vkms/vkms_composer.h b/drivers/gpu/drm/vkms/vkms_composer.h
> new file mode 100644
> index 000000000000..9316a053e7d7
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_composer.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#ifndef _VKMS_COMPOSER_H_
> +#define _VKMS_COMPOSER_H_
> +
> +#include <kunit/visibility.h>
> +
> +#if IS_ENABLED(CONFIG_KUNIT)
> +u16 lerp_u16(u16 a, u16 b, s64 t);
> +s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value);
> +#endif
> +
> +#endif /* _VKMS_COMPOSER_H_ */
> --
> 2.46.2
> 
