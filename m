Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D66D888C845
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 16:57:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF16A10F0BF;
	Tue, 26 Mar 2024 15:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="MGeFeauL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EC510F0B0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 15:57:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B74EC0002;
 Tue, 26 Mar 2024 15:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1711468627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k5k6zlsPQGeew0PrMggR4KbUmKnw3U9EYAk0N55BMMM=;
 b=MGeFeauLOFKPa/AdbJw+QoRbOsm8jWa8Fphert3dII+l1+D/bMbdDYB9X4EFT7yqLOL6g2
 CrML8eWMg7Xx3Dw0dQQJq1gV6ZPh7ZB98OipmWMbTOSbXihsXk8eWHrVkA3ctyUz+p67ch
 mcH01/YY7oYOBMAv1tmAgWEitX5GGrwV3VB8Yv03ALePFodryowJEHDaqctcS4rg423Jx0
 qPrDYheuu2HPuYxh2Zxhx6cLHOvG0mp38ndAKMPYpBlL4ifWG4WNwm1ABkqEjPgtx++iHl
 Tqoy53/w0Skq3Bs9RFX1wieUNd576kPXVHCusSVqPo5ij8XdNI3q5YJJ/ZUgsg==
Date: Tue, 26 Mar 2024 16:57:03 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net,
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com,
 marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v5 14/16] drm/vkms: Create KUnit tests for YUV conversions
Message-ID: <ZgLwT2Pm1DbO2vh2@localhost.localdomain>
Mail-Followup-To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net,
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com,
 marcheu@google.com, nicolejadeyee@google.com
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-14-e610cbd03f52@bootlin.com>
 <89748cd9-286b-4b07-b96b-5167e4b22cd2@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89748cd9-286b-4b07-b96b-5167e4b22cd2@igalia.com>
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

Le 25/03/24 - 11:34, Maíra Canal a écrit :
> On 3/13/24 14:45, Louis Chauvet wrote:
> > From: Arthur Grillo <arthurgrillo@riseup.net>
> > 
> > Create KUnit tests to test the conversion between YUV and RGB. Test each
> > conversion and range combination with some common colors.
> > 
> > The code used to compute the expected result can be found in comment.
> > 
> > Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> > [Louis Chauvet:
> > - fix minor formating issues (whitespace, double line)
> > - change expected alpha from 0x0000 to 0xffff
> > - adapt to the new get_conversion_matrix usage
> > - apply the changes from Arthur
> > - move struct pixel_yuv_u8 to the test itself]
> 
> Again, a Co-developed-by tag might be more proper.

For this patch, my contribution was very minimal (I only add a call to 
get_conversion_matrix_to_argb_u16), so I will not add the Co-developed-by.

> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >   drivers/gpu/drm/vkms/Kconfig                  |  15 ++
> >   drivers/gpu/drm/vkms/Makefile                 |   1 +
> >   drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
> >   drivers/gpu/drm/vkms/tests/Makefile           |   3 +
> >   drivers/gpu/drm/vkms/tests/vkms_format_test.c | 230 ++++++++++++++++++++++++++
> >   drivers/gpu/drm/vkms/vkms_formats.c           |   7 +-
> >   drivers/gpu/drm/vkms/vkms_formats.h           |   4 +
> >   7 files changed, 262 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
> > index b9ecdebecb0b..9b0e1940c14f 100644
> > --- a/drivers/gpu/drm/vkms/Kconfig
> > +++ b/drivers/gpu/drm/vkms/Kconfig
> > @@ -13,3 +13,18 @@ config DRM_VKMS
> >   	  a VKMS.
> >   
> >   	  If M is selected the module will be called vkms.
> > +
> > +config DRM_VKMS_KUNIT_TESTS
> > +	tristate "Tests for VKMS" if !KUNIT_ALL_TESTS
> 
> "KUnit tests for VKMS"

Fixed in v6.

> > +	depends on DRM_VKMS && KUNIT
> > +	default KUNIT_ALL_TESTS
> > +	help
> > +	  This builds unit tests for VKMS. This option is not useful for
> > +	  distributions or general kernels, but only for kernel
> > +	  developers working on VKMS.
> > +
> > +	  For more information on KUnit and unit tests in general,
> > +	  please refer to the KUnit documentation in
> > +	  Documentation/dev-tools/kunit/.
> > +
> > +	  If in doubt, say "N".
> > \ No newline at end of file
> > diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
> > index 1b28a6a32948..8d3e46dde635 100644
> > --- a/drivers/gpu/drm/vkms/Makefile
> > +++ b/drivers/gpu/drm/vkms/Makefile
> > @@ -9,3 +9,4 @@ vkms-y := \
> >   	vkms_writeback.o
> >   
> >   obj-$(CONFIG_DRM_VKMS) += vkms.o
> > +obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += tests/
> > diff --git a/drivers/gpu/drm/vkms/tests/.kunitconfig b/drivers/gpu/drm/vkms/tests/.kunitconfig
> > new file mode 100644
> > index 000000000000..70e378228cbd
> > --- /dev/null
> > +++ b/drivers/gpu/drm/vkms/tests/.kunitconfig
> > @@ -0,0 +1,4 @@
> > +CONFIG_KUNIT=y
> > +CONFIG_DRM=y
> > +CONFIG_DRM_VKMS=y
> > +CONFIG_DRM_VKMS_KUNIT_TESTS=y
> > diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
> > new file mode 100644
> > index 000000000000..2d1df668569e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/vkms/tests/Makefile
> > @@ -0,0 +1,3 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += vkms_format_test.o
> > diff --git a/drivers/gpu/drm/vkms/tests/vkms_format_test.c b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
> > new file mode 100644
> > index 000000000000..0954d606e44a
> > --- /dev/null
> > +++ b/drivers/gpu/drm/vkms/tests/vkms_format_test.c

[...]

> > +/*
> > + * The YUV color representation were acquired via the colour python framework.
> > + * Below are the function calls used for generating each case.
> > + *
> > + * for more information got to the docs:
> 
> s/for/For

Fixed in v6.

> > + * https://colour.readthedocs.io/en/master/generated/colour.RGB_to_YCbCr.html
> > + */
> > +static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
> > +	/*
> > +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> > +	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
> > +	 *                     in_bits = 16,
> > +	 *                     in_legal = False,
> > +	 *                     in_int = True,
> > +	 *                     out_bits = 8,
> > +	 *                     out_legal = False,
> > +	 *                     out_int = True)
> > +	 */
> 
> I feel that this Python code is kind of poluting the test cases.

This python code is needed to understand where the values come from. I 
think we should keep it for future reference (add more cases, test yuv 16 
bits...)

Maybe we can change the array comment to

 /*
  * The yuv color representation were acquired via the colour python framework:
  *
  * colour.RGB_to_YCbCr(<rgb color in 16 bits form>,
  *			K=color.WEIGHTS_YCBCR["<format>"],
  *			[...],
  *			out_legal = <limited or full range>)
  *
  * The exact function call arguments are given for each element of this list.
  *
  * [...]
  */

And above each test case:

 /*
  * format = "ITU-R BT.601"
  * out_legal = False
  */

@Arthur, do you agree with those modifications?

> > +	{
> > +		.encoding = DRM_COLOR_YCBCR_BT601,
> > +		.range = DRM_COLOR_YCBCR_FULL_RANGE,
> > +		.n_colors = 6,
> > +		.colors = {
> > +			{ "white", { 0xff, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
> > +			{ "gray",  { 0x80, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
> > +			{ "black", { 0x00, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
> > +			{ "red",   { 0x4c, 0x55, 0xff }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
> > +			{ "green", { 0x96, 0x2c, 0x15 }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
> > +			{ "blue",  { 0x1d, 0xff, 0x6b }, { 0xffff, 0x0000, 0x0000, 0xffff }},
> > +		},
> > +	},

[...]

> > diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> > index edbf4b321b91..863fc91d6d48 100644
> > --- a/drivers/gpu/drm/vkms/vkms_formats.c
> > +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> > @@ -7,6 +7,8 @@
> >   #include <drm/drm_rect.h>
> >   #include <drm/drm_fixed.h>
> >   
> > +#include <kunit/visibility.h>
> > +
> >   #include "vkms_formats.h"
> >   
> >   /**
> > @@ -199,8 +201,8 @@ static struct pixel_argb_u16 argb_u16_from_RGB565(const u16 *pixel)
> >   	return out_pixel;
> >   }
> >   
> > -static struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 cb, u8 cr,
> > -						  struct conversion_matrix *matrix)
> > +VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 cb, u8 cr,
> > +							    struct conversion_matrix *matrix)
> >   {
> >   	u8 r, g, b;
> >   	s64 fp_y, fp_cb, fp_cr;
> > @@ -234,6 +236,7 @@ static struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 cb, u8 cr,
> >   
> >   	return argb_u16_from_u8888(255, r, g, b);
> >   }
> > +EXPORT_SYMBOL_IF_KUNIT(argb_u16_from_yuv888);
> >   
> >   /*
> >    * The following functions are read_line function for each pixel format supported by VKMS.
> > diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
> > index e1d324764b17..21e66a0cac16 100644
> > --- a/drivers/gpu/drm/vkms/vkms_formats.h
> > +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> > @@ -13,4 +13,8 @@ struct conversion_matrix *
> >   get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encoding,
> >   				  enum drm_color_range range);
> >   
> > +#if IS_ENABLED(CONFIG_KUNIT)
> 
> What about the CONFIG_DRM_EXPORT_FOR_TESTS?

As the documentation for CONFIG_DRM_EXPORT_FOR_TESTS don't exists, I don't 
know what to use. Maybe Arthur knows what to do here? If needed I can 
apply the modifications for the next iteration.

Thanks for all your reviews,
Louis Chauvet
 
[...]

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
