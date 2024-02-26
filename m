Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3B1867C30
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 17:39:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556F210E238;
	Mon, 26 Feb 2024 16:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="H2p+HbLF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF3C10E238
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 16:39:22 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4Tk5tL19C9zDqLc;
 Mon, 26 Feb 2024 16:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1708965562; bh=9/DoYW84F7UI+Hh7Q7bfBY2sZ83cw2mp2T/o2fkltAA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=H2p+HbLFAR6/3zpb+Jt5bnWnE1CSw03mVCTFYmO1Su6B87iaS0XY8OpDdYutpFUXQ
 7HSbmHiG0NRTnmvuCDqIHN/t2IlwpwXyheqnxvmJpkk5J6kEklV6SWv5vZ65PfvODn
 myHL6BYM5Fykg8hXEh8jU/GXwp5bvRGsNKVYeglw=
X-Riseup-User-ID: 67BBA5A2599F3DC7CC4EF7FE7959CB57C844C3A47FE960AB446AB8892D781C95
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4Tk5tF0PB3zJs4q;
 Mon, 26 Feb 2024 16:39:16 +0000 (UTC)
Message-ID: <4406ec1c-fcfc-4d06-bec2-a428058d32cc@riseup.net>
Date: Mon, 26 Feb 2024 13:39:12 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 9/9] drm/vkms: Create KUnit tests for YUV conversions
Content-Language: en-US
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com
References: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
 <20240223-yuv-v2-9-aa6be2827bb7@bootlin.com>
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <20240223-yuv-v2-9-aa6be2827bb7@bootlin.com>
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



On 23/02/24 08:37, Louis Chauvet wrote:
> From: Arthur Grillo <arthurgrillo@riseup.net>
> 
> Create KUnit tests to test the conversion between YUV and RGB. Test each
> conversion and range combination with some common colors.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> [Louis Chauvet: fix minor formating issues (whitespace, double line)]
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/Makefile                 |   1 +
>  drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
>  drivers/gpu/drm/vkms/tests/Makefile           |   3 +
>  drivers/gpu/drm/vkms/tests/vkms_format_test.c | 155 ++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_formats.c           |   9 +-
>  drivers/gpu/drm/vkms/vkms_formats.h           |   5 +
>  6 files changed, 175 insertions(+), 2 deletions(-)

You need to add the CONFIG_DRM_VKMS_KUNIT_TESTS config to
drivers/gpu/drm/vkms/Kconfig, like my previous patch did.

Best Regards,
~Arthur Grillo

> 
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
> index 000000000000..2d1df668569e
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += vkms_format_test.o
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_format_test.c b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
> new file mode 100644
> index 000000000000..cb6d32ff115d
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
> @@ -0,0 +1,155 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +#include <kunit/test.h>
> +
> +#include <drm/drm_fixed.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_print.h>
> +
> +#include "../../drm_crtc_internal.h"
> +
> +#include "../vkms_drv.h"
> +#include "../vkms_formats.h"
> +
> +#define TEST_BUFF_SIZE 50
> +
> +struct yuv_u8_to_argb_u16_case {
> +	enum drm_color_encoding encoding;
> +	enum drm_color_range range;
> +	size_t n_colors;
> +	struct format_pair {
> +		char *name;
> +		struct pixel_yuv_u8 yuv;
> +		struct pixel_argb_u16 argb;
> +	} colors[TEST_BUFF_SIZE];
> +};
> +
> +static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
> +	{
> +		.encoding = DRM_COLOR_YCBCR_BT601,
> +		.range = DRM_COLOR_YCBCR_FULL_RANGE,
> +		.n_colors = 6,
> +		.colors = {
> +			{"white", {0xff, 0x80, 0x80}, {0x0000, 0xffff, 0xffff, 0xffff}},
> +			{"gray",  {0x80, 0x80, 0x80}, {0x0000, 0x8000, 0x8000, 0x8000}},
> +			{"black", {0x00, 0x80, 0x80}, {0x0000, 0x0000, 0x0000, 0x0000}},
> +			{"red",   {0x4c, 0x55, 0xff}, {0x0000, 0xffff, 0x0000, 0x0000}},
> +			{"green", {0x96, 0x2c, 0x15}, {0x0000, 0x0000, 0xffff, 0x0000}},
> +			{"blue",  {0x1d, 0xff, 0x6b}, {0x0000, 0x0000, 0x0000, 0xffff}},
> +		},
> +	},
> +	{
> +		.encoding = DRM_COLOR_YCBCR_BT601,
> +		.range = DRM_COLOR_YCBCR_LIMITED_RANGE,
> +		.n_colors = 6,
> +		.colors = {
> +			{"white", {0xeb, 0x80, 0x80}, {0x0000, 0xffff, 0xffff, 0xffff}},
> +			{"gray",  {0x7e, 0x80, 0x80}, {0x0000, 0x8000, 0x8000, 0x8000}},
> +			{"black", {0x10, 0x80, 0x80}, {0x0000, 0x0000, 0x0000, 0x0000}},
> +			{"red",   {0x51, 0x5a, 0xf0}, {0x0000, 0xffff, 0x0000, 0x0000}},
> +			{"green", {0x91, 0x36, 0x22}, {0x0000, 0x0000, 0xffff, 0x0000}},
> +			{"blue",  {0x29, 0xf0, 0x6e}, {0x0000, 0x0000, 0x0000, 0xffff}},
> +		},
> +	},
> +	{
> +		.encoding = DRM_COLOR_YCBCR_BT709,
> +		.range = DRM_COLOR_YCBCR_FULL_RANGE,
> +		.n_colors = 4,
> +		.colors = {
> +			{"white", {0xff, 0x80, 0x80}, {0x0000, 0xffff, 0xffff, 0xffff}},
> +			{"gray",  {0x80, 0x80, 0x80}, {0x0000, 0x8000, 0x8000, 0x8000}},
> +			{"black", {0x00, 0x80, 0x80}, {0x0000, 0x0000, 0x0000, 0x0000}},
> +			{"red",   {0x35, 0x63, 0xff}, {0x0000, 0xffff, 0x0000, 0x0000}},
> +			{"green", {0xb6, 0x1e, 0x0c}, {0x0000, 0x0000, 0xffff, 0x0000}},
> +			{"blue",  {0x12, 0xff, 0x74}, {0x0000, 0x0000, 0x0000, 0xffff}},
> +		},
> +	},
> +	{
> +		.encoding = DRM_COLOR_YCBCR_BT709,
> +		.range = DRM_COLOR_YCBCR_LIMITED_RANGE,
> +		.n_colors = 4,
> +		.colors = {
> +			{"white", {0xeb, 0x80, 0x80}, {0x0000, 0xffff, 0xffff, 0xffff}},
> +			{"gray",  {0x7e, 0x80, 0x80}, {0x0000, 0x8000, 0x8000, 0x8000}},
> +			{"black", {0x10, 0x80, 0x80}, {0x0000, 0x0000, 0x0000, 0x0000}},
> +			{"red",   {0x3f, 0x66, 0xf0}, {0x0000, 0xffff, 0x0000, 0x0000}},
> +			{"green", {0xad, 0x2a, 0x1a}, {0x0000, 0x0000, 0xffff, 0x0000}},
> +			{"blue",  {0x20, 0xf0, 0x76}, {0x0000, 0x0000, 0x0000, 0xffff}},
> +		},
> +	},
> +	{
> +		.encoding = DRM_COLOR_YCBCR_BT2020,
> +		.range = DRM_COLOR_YCBCR_FULL_RANGE,
> +		.n_colors = 4,
> +		.colors = {
> +			{"white", {0xff, 0x80, 0x80}, {0x0000, 0xffff, 0xffff, 0xffff}},
> +			{"gray",  {0x80, 0x80, 0x80}, {0x0000, 0x8000, 0x8000, 0x8000}},
> +			{"black", {0x00, 0x80, 0x80}, {0x0000, 0x0000, 0x0000, 0x0000}},
> +			{"red",   {0x43, 0x5c, 0xff}, {0x0000, 0xffff, 0x0000, 0x0000}},
> +			{"green", {0xad, 0x24, 0x0b}, {0x0000, 0x0000, 0xffff, 0x0000}},
> +			{"blue",  {0x0f, 0xff, 0x76}, {0x0000, 0x0000, 0x0000, 0xffff}},
> +		},
> +	},
> +	{
> +		.encoding = DRM_COLOR_YCBCR_BT2020,
> +		.range = DRM_COLOR_YCBCR_LIMITED_RANGE,
> +		.n_colors = 4,
> +		.colors = {
> +			{"white", {0xeb, 0x80, 0x80}, {0x0000, 0xffff, 0xffff, 0xffff}},
> +			{"gray",  {0x7e, 0x80, 0x80}, {0x0000, 0x8000, 0x8000, 0x8000}},
> +			{"black", {0x10, 0x80, 0x80}, {0x0000, 0x0000, 0x0000, 0x0000}},
> +			{"red",   {0x4a, 0x61, 0xf0}, {0x0000, 0xffff, 0x0000, 0x0000}},
> +			{"green", {0xa4, 0x2f, 0x19}, {0x0000, 0x0000, 0xffff, 0x0000}},
> +			{"blue",  {0x1d, 0xf0, 0x77}, {0x0000, 0x0000, 0x0000, 0xffff}},
> +		},
> +	},
> +};
> +
> +static void vkms_format_test_yuv_u8_to_argb_u16(struct kunit *test)
> +{
> +	const struct yuv_u8_to_argb_u16_case *param = test->param_value;
> +	struct pixel_argb_u16 argb;
> +
> +	for (size_t i = 0; i < param->n_colors; i++) {
> +		const struct format_pair *color = &param->colors[i];
> +
> +		yuv_u8_to_argb_u16(&argb, &color->yuv, param->encoding, param->range);
> +
> +		KUNIT_EXPECT_LE_MSG(test, abs_diff(argb.a, color->argb.a), 257,
> +				    "On the A channel of the color %s expected 0x%04x, got 0x%04x",
> +				    color->name, color->argb.a, argb.a);
> +		KUNIT_EXPECT_LE_MSG(test, abs_diff(argb.r, color->argb.r), 257,
> +				    "On the R channel of the color %s expected 0x%04x, got 0x%04x",
> +				    color->name, color->argb.r, argb.r);
> +		KUNIT_EXPECT_LE_MSG(test, abs_diff(argb.g, color->argb.g), 257,
> +				    "On the G channel of the color %s expected 0x%04x, got 0x%04x",
> +				    color->name, color->argb.g, argb.g);
> +		KUNIT_EXPECT_LE_MSG(test, abs_diff(argb.b, color->argb.b), 257,
> +				    "On the B channel of the color %s expected 0x%04x, got 0x%04x",
> +				    color->name, color->argb.b, argb.b);
> +	}
> +}
> +
> +static void vkms_format_test_yuv_u8_to_argb_u16_case_desc(struct yuv_u8_to_argb_u16_case *t,
> +							  char *desc)
> +{
> +	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s - %s",
> +		 drm_get_color_encoding_name(t->encoding), drm_get_color_range_name(t->range));
> +}
> +
> +KUNIT_ARRAY_PARAM(yuv_u8_to_argb_u16, yuv_u8_to_argb_u16_cases,
> +		  vkms_format_test_yuv_u8_to_argb_u16_case_desc);
> +
> +static struct kunit_case vkms_format_test_cases[] = {
> +	KUNIT_CASE_PARAM(vkms_format_test_yuv_u8_to_argb_u16, yuv_u8_to_argb_u16_gen_params),
> +	{}
> +};
> +
> +static struct kunit_suite vkms_format_test_suite = {
> +	.name = "vkms-format",
> +	.test_cases = vkms_format_test_cases,
> +};
> +
> +kunit_test_suite(vkms_format_test_suite);
> +
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 515c80866a58..20dd23ce9051 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -7,6 +7,8 @@
>  #include <drm/drm_rect.h>
>  #include <drm/drm_fixed.h>
>  
> +#include <kunit/visibility.h>
> +
>  #include "vkms_formats.h"
>  
>  /**
> @@ -175,8 +177,10 @@ static void ycbcr2rgb(const s16 m[3][3], u8 y, u8 cb, u8 cr, u8 y_offset, u8 *r,
>  	*b = clamp(b_16, 0, 0xffff) >> 8;
>  }
>  
> -static void yuv_u8_to_argb_u16(struct pixel_argb_u16 *argb_u16, const struct pixel_yuv_u8 *yuv_u8,
> -			       enum drm_color_encoding encoding, enum drm_color_range range)
> +VISIBLE_IF_KUNIT void yuv_u8_to_argb_u16(struct pixel_argb_u16 *argb_u16,
> +					 const struct pixel_yuv_u8 *yuv_u8,
> +					 enum drm_color_encoding encoding,
> +					 enum drm_color_range range)
>  {
>  	static const s16 bt601_full[3][3] = {
>  		{ 256, 0,   359 },
> @@ -237,6 +241,7 @@ static void yuv_u8_to_argb_u16(struct pixel_argb_u16 *argb_u16, const struct pix
>  	argb_u16->g = g * 257;
>  	argb_u16->b = b * 257;
>  }
> +EXPORT_SYMBOL_IF_KUNIT(yuv_u8_to_argb_u16);
>  
>  /*
>   * The following functions are read_line function for each pixel format supported by VKMS.
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
> index 5a3a9e1328d8..4245a5c5e956 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.h
> +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> @@ -13,4 +13,9 @@ struct pixel_yuv_u8 {
>  	u8 y, u, v;
>  };
>  
> +#if IS_ENABLED(CONFIG_KUNIT)
> +void yuv_u8_to_argb_u16(struct pixel_argb_u16 *argb_u16, const struct pixel_yuv_u8 *yuv_u8,
> +			enum drm_color_encoding encoding, enum drm_color_range range);
> +#endif
> +
>  #endif /* _VKMS_FORMATS_H_ */
> 
