Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A5688A4A1
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 15:34:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDD410E91C;
	Mon, 25 Mar 2024 14:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="EnhGXdcv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF9210E91C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 14:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yxec70M6Owd9Eet/5to7veN0GIlFa4kpXrA8JW7agGE=; b=EnhGXdcvH7HJXqrsmXjTITohYC
 9ay5GOTcM5FtgIeFSzHSEgShP3UjFFNM/U6xWNW6JnxedbRNx597nzf1XbYeSlNkqqtMSslGiZBbR
 rIPopUjnUwXvdV6qG4MsNc+PrbsBiOYTN/DW6zSkw8nvcnukisAqrPcoVHEn8XzxtdjBUhlFkUWmn
 FlqTkEz4jxPQJ73e1jXbxFbpqkDQZ9YOKUcsMLoJSlrxeVSnlJheNDxaN5rs9xBGBDY34iWJxyYsw
 IuwGNxCPlkPm6WludJ3FxL0S117HKeWlIN1HzVDbk6OFlGiHV2TgxuN2LPS9Ehs7L1R2SJm9JbDnp
 AFGZ8ZdA==;
Received: from [177.34.169.255] (helo=[192.168.0.139])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rolP7-00F60I-DZ; Mon, 25 Mar 2024 15:34:26 +0100
Message-ID: <89748cd9-286b-4b07-b96b-5167e4b22cd2@igalia.com>
Date: Mon, 25 Mar 2024 11:34:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/16] drm/vkms: Create KUnit tests for YUV conversions
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net,
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-14-e610cbd03f52@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <20240313-yuv-v5-14-e610cbd03f52@bootlin.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/13/24 14:45, Louis Chauvet wrote:
> From: Arthur Grillo <arthurgrillo@riseup.net>
> 
> Create KUnit tests to test the conversion between YUV and RGB. Test each
> conversion and range combination with some common colors.
> 
> The code used to compute the expected result can be found in comment.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> [Louis Chauvet:
> - fix minor formating issues (whitespace, double line)
> - change expected alpha from 0x0000 to 0xffff
> - adapt to the new get_conversion_matrix usage
> - apply the changes from Arthur
> - move struct pixel_yuv_u8 to the test itself]

Again, a Co-developed-by tag might be more proper.

> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   drivers/gpu/drm/vkms/Kconfig                  |  15 ++
>   drivers/gpu/drm/vkms/Makefile                 |   1 +
>   drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
>   drivers/gpu/drm/vkms/tests/Makefile           |   3 +
>   drivers/gpu/drm/vkms/tests/vkms_format_test.c | 230 ++++++++++++++++++++++++++
>   drivers/gpu/drm/vkms/vkms_formats.c           |   7 +-
>   drivers/gpu/drm/vkms/vkms_formats.h           |   4 +
>   7 files changed, 262 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
> index b9ecdebecb0b..9b0e1940c14f 100644
> --- a/drivers/gpu/drm/vkms/Kconfig
> +++ b/drivers/gpu/drm/vkms/Kconfig
> @@ -13,3 +13,18 @@ config DRM_VKMS
>   	  a VKMS.
>   
>   	  If M is selected the module will be called vkms.
> +
> +config DRM_VKMS_KUNIT_TESTS
> +	tristate "Tests for VKMS" if !KUNIT_ALL_TESTS

"KUnit tests for VKMS"

> +	depends on DRM_VKMS && KUNIT
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
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
> index 1b28a6a32948..8d3e46dde635 100644
> --- a/drivers/gpu/drm/vkms/Makefile
> +++ b/drivers/gpu/drm/vkms/Makefile
> @@ -9,3 +9,4 @@ vkms-y := \
>   	vkms_writeback.o
>   
>   obj-$(CONFIG_DRM_VKMS) += vkms.o
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
> index 000000000000..0954d606e44a
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
> @@ -0,0 +1,230 @@
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
> +struct pixel_yuv_u8 {
> +	u8 y, u, v;
> +};
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
> +/*
> + * The YUV color representation were acquired via the colour python framework.
> + * Below are the function calls used for generating each case.
> + *
> + * for more information got to the docs:

s/for/For

> + * https://colour.readthedocs.io/en/master/generated/colour.RGB_to_YCbCr.html
> + */
> +static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
> +	/*
> +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> +	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
> +	 *                     in_bits = 16,
> +	 *                     in_legal = False,
> +	 *                     in_int = True,
> +	 *                     out_bits = 8,
> +	 *                     out_legal = False,
> +	 *                     out_int = True)
> +	 */

I feel that this Python code is kind of poluting the test cases.

> +	{
> +		.encoding = DRM_COLOR_YCBCR_BT601,
> +		.range = DRM_COLOR_YCBCR_FULL_RANGE,
> +		.n_colors = 6,
> +		.colors = {
> +			{ "white", { 0xff, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
> +			{ "gray",  { 0x80, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
> +			{ "black", { 0x00, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
> +			{ "red",   { 0x4c, 0x55, 0xff }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
> +			{ "green", { 0x96, 0x2c, 0x15 }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
> +			{ "blue",  { 0x1d, 0xff, 0x6b }, { 0xffff, 0x0000, 0x0000, 0xffff }},
> +		},
> +	},
> +	/*
> +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> +	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
> +	 *                     in_bits = 16,
> +	 *                     in_legal = False,
> +	 *                     in_int = True,
> +	 *                     out_bits = 8,
> +	 *                     out_legal = True,
> +	 *                     out_int = True)
> +	 */
> +	{
> +		.encoding = DRM_COLOR_YCBCR_BT601,
> +		.range = DRM_COLOR_YCBCR_LIMITED_RANGE,
> +		.n_colors = 6,
> +		.colors = {
> +			{ "white", { 0xeb, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
> +			{ "gray",  { 0x7e, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
> +			{ "black", { 0x10, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
> +			{ "red",   { 0x51, 0x5a, 0xf0 }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
> +			{ "green", { 0x91, 0x36, 0x22 }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
> +			{ "blue",  { 0x29, 0xf0, 0x6e }, { 0xffff, 0x0000, 0x0000, 0xffff }},
> +		},
> +	},
> +	/*
> +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> +	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
> +	 *                     in_bits = 16,
> +	 *                     in_legal = False,
> +	 *                     in_int = True,
> +	 *                     out_bits = 8,
> +	 *                     out_legal = False,
> +	 *                     out_int = True)
> +	 */
> +	{
> +		.encoding = DRM_COLOR_YCBCR_BT709,
> +		.range = DRM_COLOR_YCBCR_FULL_RANGE,
> +		.n_colors = 4,
> +		.colors = {
> +			{ "white", { 0xff, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
> +			{ "gray",  { 0x80, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
> +			{ "black", { 0x00, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
> +			{ "red",   { 0x36, 0x63, 0xff }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
> +			{ "green", { 0xb6, 0x1e, 0x0c }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
> +			{ "blue",  { 0x12, 0xff, 0x74 }, { 0xffff, 0x0000, 0x0000, 0xffff }},
> +		},
> +	},
> +	/*
> +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> +	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
> +	 *                     in_bits = 16,
> +	 *                     int_legal = False,
> +	 *                     in_int = True,
> +	 *                     out_bits = 8,
> +	 *                     out_legal = True,
> +	 *                     out_int = True)
> +	 */
> +	{
> +		.encoding = DRM_COLOR_YCBCR_BT709,
> +		.range = DRM_COLOR_YCBCR_LIMITED_RANGE,
> +		.n_colors = 4,
> +		.colors = {
> +			{ "white", { 0xeb, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
> +			{ "gray",  { 0x7e, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
> +			{ "black", { 0x10, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
> +			{ "red",   { 0x3f, 0x66, 0xf0 }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
> +			{ "green", { 0xad, 0x2a, 0x1a }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
> +			{ "blue",  { 0x20, 0xf0, 0x76 }, { 0xffff, 0x0000, 0x0000, 0xffff }},
> +		},
> +	},
> +	/*
> +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> +	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.2020"],
> +	 *                     in_bits = 16,
> +	 *                     in_legal = False,
> +	 *                     in_int = True,
> +	 *                     out_bits = 8,
> +	 *                     out_legal = False,
> +	 *                     out_int = True)
> +	 */
> +	{
> +		.encoding = DRM_COLOR_YCBCR_BT2020,
> +		.range = DRM_COLOR_YCBCR_FULL_RANGE,
> +		.n_colors = 4,
> +		.colors = {
> +			{ "white", { 0xff, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
> +			{ "gray",  { 0x80, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
> +			{ "black", { 0x00, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
> +			{ "red",   { 0x43, 0x5c, 0xff }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
> +			{ "green", { 0xad, 0x24, 0x0b }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
> +			{ "blue",  { 0x0f, 0xff, 0x76 }, { 0xffff, 0x0000, 0x0000, 0xffff }},
> +		},
> +	},
> +	/*
> +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> +	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.2020"],
> +	 *                     in_bits = 16,
> +	 *                     in_legal = False,
> +	 *                     in_int = True,
> +	 *                     out_bits = 8,
> +	 *                     out_legal = True,
> +	 *                     out_int = True)
> +	 */
> +	{
> +		.encoding = DRM_COLOR_YCBCR_BT2020,
> +		.range = DRM_COLOR_YCBCR_LIMITED_RANGE,
> +		.n_colors = 4,
> +		.colors = {
> +			{ "white", { 0xeb, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
> +			{ "gray",  { 0x7e, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
> +			{ "black", { 0x10, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
> +			{ "red",   { 0x4a, 0x61, 0xf0 }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
> +			{ "green", { 0xa4, 0x2f, 0x19 }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
> +			{ "blue",  { 0x1d, 0xf0, 0x77 }, { 0xffff, 0x0000, 0x0000, 0xffff }},
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
> +		struct conversion_matrix *matrix = get_conversion_matrix_to_argb_u16
> +			(DRM_FORMAT_NV12, param->encoding, param->range);
> +
> +		argb = argb_u16_from_yuv888(color->yuv.y, color->yuv.u, color->yuv.v, matrix);
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
> +		  vkms_format_test_yuv_u8_to_argb_u16_case_desc
> +);
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
> index edbf4b321b91..863fc91d6d48 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -7,6 +7,8 @@
>   #include <drm/drm_rect.h>
>   #include <drm/drm_fixed.h>
>   
> +#include <kunit/visibility.h>
> +
>   #include "vkms_formats.h"
>   
>   /**
> @@ -199,8 +201,8 @@ static struct pixel_argb_u16 argb_u16_from_RGB565(const u16 *pixel)
>   	return out_pixel;
>   }
>   
> -static struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 cb, u8 cr,
> -						  struct conversion_matrix *matrix)
> +VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 cb, u8 cr,
> +							    struct conversion_matrix *matrix)
>   {
>   	u8 r, g, b;
>   	s64 fp_y, fp_cb, fp_cr;
> @@ -234,6 +236,7 @@ static struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 cb, u8 cr,
>   
>   	return argb_u16_from_u8888(255, r, g, b);
>   }
> +EXPORT_SYMBOL_IF_KUNIT(argb_u16_from_yuv888);
>   
>   /*
>    * The following functions are read_line function for each pixel format supported by VKMS.
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
> index e1d324764b17..21e66a0cac16 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.h
> +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> @@ -13,4 +13,8 @@ struct conversion_matrix *
>   get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encoding,
>   				  enum drm_color_range range);
>   
> +#if IS_ENABLED(CONFIG_KUNIT)

What about the CONFIG_DRM_EXPORT_FOR_TESTS?

Best Regards,
- Maíra

> +struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 cb, u8 cr, struct conversion_matrix *matrix);
> +#endif
> +
>   #endif /* _VKMS_FORMATS_H_ */
> 
