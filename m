Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F22D990243
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 13:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B427310E9DB;
	Fri,  4 Oct 2024 11:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="F83c2XgI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965FD10E9D0;
 Fri,  4 Oct 2024 11:43:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1CD9FE0007;
 Fri,  4 Oct 2024 11:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1728042210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t73TyjdYfKpLL0vLqGmQ2NO/lX80RKkRyRMfRcsiMRY=;
 b=F83c2XgIuKLcPatXQaqLp6Pb1Uq123pJmJnaG4rKLRA6HxAwrS9XP1fnuCLhFXXncqSX0u
 fzBJqvmmce350HfWT9fYmRD/O15JhWPooz7RtoiH+cDzCzd29Z5PIzSstciy2+GB21LUaq
 l1100JnnTCW8fCHzGfTq3tJX1zl4GfjaYCdAbsQJ0YZVLgEMiDm4UShJ5b30zcQ1oLb2Zb
 ETz8ReTOJ8ySPhL14J/w6QR8NvTxnz/LKw4v/apGIib9BekmgjaHu24SkTWtQOm6iKpdyc
 s4AVOgZJCgzTbwFK1Y/vLpIOPEn/FSYHw3nDFvUxNMHU6aLUTM1gq4pbXuhL6A==
Date: Fri, 4 Oct 2024 13:43:28 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, Alex Hung <alex.hung@amd.com>
Subject: Re: [PATCH v6 14/44] drm/vkms: Add enumerated 1D curve colorop
Message-ID: <Zv_U4MbmVKdRn4BQ@louis-chauvet-laptop>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
 <20241003200129.1732122-15-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003200129.1732122-15-harry.wentland@amd.com>
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
> This patch introduces a VKMS color pipeline that includes two
> drm_colorops for named transfer functions. For now the only ones
> supported are sRGB EOTF, sRGB Inverse EOTF, and a Linear TF.
> We will expand this in the future but I don't want to do so
> without accompanying IGT tests.
> 
> We introduce a new vkms_luts.c file that hard-codes sRGB EOTF,
> sRGB Inverse EOTF, and a linear EOTF LUT. These have been
> generated with 256 entries each as IGT is currently testing
> only 8 bpc surfaces. We will likely need higher precision
> but I'm reluctant to make that change without clear indication
> that we need it. We'll revisit and, if necessary, regenerate
> the LUTs when we have IGT tests for higher precision buffers.
> 
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
> 
> v6:
>  - drop 'len' var (Louis Chauvet)
>  - cleanup if colorop alloc or init fails (Louis Chauvet)
>  - switch loop in pre_blend_transform (Louis Chauvet)
>  - drop extraneous if (colorop) inside while (colorop) (Louis Chauvet)

thanks!

> v5:
>  - Squash with "Pull apply_colorop out of pre_blend_color_transform"
>    (Sebastian)
>  - Fix warnings
>  - Fix include
>  - Drop TODOs
> 
> v4:
>  - Drop _tf_ from color_pipeline init function
>  - Pass supported TFs into colorop init
>  - Create bypass pipeline in DRM helper (Pekka)
> 
> v2:
>  - Add commit description
>  - Fix sRGB EOTF LUT definition
>  - Add linear and sRGB inverse EOTF LUTs
> 
>  drivers/gpu/drm/vkms/Makefile        |   4 +-
>  drivers/gpu/drm/vkms/vkms_colorop.c  |  81 +++
>  drivers/gpu/drm/vkms/vkms_composer.c |  49 ++
>  drivers/gpu/drm/vkms/vkms_drv.h      |   4 +
>  drivers/gpu/drm/vkms/vkms_luts.c     | 802 +++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_luts.h     |  12 +
>  drivers/gpu/drm/vkms/vkms_plane.c    |   2 +
>  7 files changed, 953 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
> 
> diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
> index 8d3e46dde635..0bf3c116f1ae 100644
> --- a/drivers/gpu/drm/vkms/Makefile
> +++ b/drivers/gpu/drm/vkms/Makefile
> @@ -6,7 +6,9 @@ vkms-y := \
>  	vkms_formats.o \
>  	vkms_crtc.o \
>  	vkms_composer.o \
> -	vkms_writeback.o
> +	vkms_writeback.o \
> +	vkms_colorop.o \
> +	vkms_luts.o
> 
>  obj-$(CONFIG_DRM_VKMS) += vkms.o
>  obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += tests/
> diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
> new file mode 100644
> index 000000000000..aebd467c4e61
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
> @@ -0,0 +1,81 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */

checkpatch: Improper SPDX comment style for 
'drivers/gpu/drm/vkms/vkms_colorop.c', please use '//' instead

> +
> +#include <linux/slab.h>
> +#include <drm/drm_colorop.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_property.h>
> +#include <drm/drm_plane.h>
> +
> +#include "vkms_drv.h"
> +
> +static const u64 supported_tfs =
> +	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
> +	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF);
> +
> +#define MAX_COLOR_PIPELINE_OPS 2
> +
> +static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
> +{
> +	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
> +	struct drm_device *dev = plane->dev;
> +	int ret;
> +	int i = 0;
> +
> +	memset(ops, 0, sizeof(ops));
> +
> +	/* 1st op: 1d curve */
> +	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);

checkpatch: Prefer kzalloc(sizeof(*ops[i])...) over kzalloc(sizeof(struct 
drm_colorop)...)

> +	if (!ops[i]) {
> +		DRM_ERROR("KMS: Failed to allocate colorop\n");
> +		ret = -ENOMEM;
> +		goto cleanup;
> +	}
> +
> +	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs);
> +	if (ret)
> +		goto cleanup;
> +
> +	list->type = ops[i]->base.id;
> +	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[i]->base.id);
> +
> +	i++;
> +
> +	/* 2nd op: 1d curve */
> +	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);

ditto

> +	if (!ops[i]) {
> +		DRM_ERROR("KMS: Failed to allocate colorop\n");
> +		ret = -ENOMEM;
> +		goto cleanup;
> +	}
> +
> +	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs);
> +	if (ret)
> +		goto cleanup;
> +
> +	drm_colorop_set_next_property(ops[i-1], ops[i]);

checkpatch: spaces preferred around that '-' (ctx:VxV)

> +
> +	return 0;
> +
> +cleanup:
> +	for (; i >= 0; i--)
> +		if (ops[i])
> +			kfree(ops[i]);

I think this is not sufficient, drm_colorop_curve_1d_init seems to 
call many drm_* helpers to create properties and store pointers to dev.

Issues I found:

drm_colorop.c:105
	list_add_tail(&colorop->head, &config->colorop_list);
-> here colorop is added to the colorop_list, but in case of error, you 
call kfree on colorop, so colorop_list may allows access to a freed memory

drm_colorop.c:111
	prop = drm_property_create_enum(...)
-> here this property seems to leak in case of error (I don't know if the 
core automatically clean this property if the driver fails to create the 
device), same for bypass_property and next_property

Maybe you should create a "color_cleanup" function?

Also, if you keep the kfree:
checkpatch: kfree(NULL) is safe and this check is probably not required

> +
> +	return ret;
> +}
> +
> +int vkms_initialize_colorops(struct drm_plane *plane)
> +{
> +	struct drm_prop_enum_list pipeline;
> +	int ret;
> +
> +	/* Add color pipeline */
> +	ret = vkms_initialize_color_pipeline(plane, &pipeline);
> +	if (ret)
> +		return ret;
> +
> +	/* Create COLOR_PIPELINE property and attach */
> +	drm_plane_create_color_pipeline_property(plane, &pipeline, 1);

This can fail, can you add a check?

> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 93f4ed5ea52f..a35466e68237 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -14,6 +14,7 @@
>  #include "vkms_drv.h"
>  #include <kunit/visibility.h>
>  #include "vkms_composer.h"
> +#include "vkms_luts.h"
> 
>  static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
>  {
> @@ -167,6 +168,51 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
>  	}
>  }
> 
> +static void apply_colorop(struct pixel_argb_u16 *pixel, struct drm_colorop *colorop)
> +{
> +	struct drm_colorop_state *colorop_state = colorop->state;
> +
> +	if (colorop->type == DRM_COLOROP_1D_CURVE) {
> +		switch (colorop_state->curve_1d_type) {
> +			case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
> +				pixel->r = apply_lut_to_channel_value(&srgb_inv_eotf, pixel->r, LUT_RED);
> +				pixel->g = apply_lut_to_channel_value(&srgb_inv_eotf, pixel->g, LUT_GREEN);
> +				pixel->b = apply_lut_to_channel_value(&srgb_inv_eotf, pixel->b, LUT_BLUE);
> +				break;
> +			case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
> +				pixel->r = apply_lut_to_channel_value(&srgb_eotf, pixel->r, LUT_RED);
> +				pixel->g = apply_lut_to_channel_value(&srgb_eotf, pixel->g, LUT_GREEN);
> +				pixel->b = apply_lut_to_channel_value(&srgb_eotf, pixel->b, LUT_BLUE);
> +				break;
> +			default:
> +				DRM_DEBUG_DRIVER("unkown colorop 1D curve type %d\n", colorop_state->curve_1d_type);

Maybe you can use a _ONCE variant? You don't want to write a line for each 
pixel

checkpatch is not happy about the indentation and line length:
- switch and case should be at the same indent
- line length of .. exceeds 100 columns

> +				break;
> +		}
> +	}
> +

checkpatch: Blank lines aren't necessary before a close brace '}'

> +}
> +
> +static void pre_blend_color_transform(const struct vkms_plane_state *plane_state, struct line_buffer *output_buffer)

checkpatch: line length of 116 exceeds 100 columns

> +{
> +	for (size_t x = 0; x < output_buffer->n_pixels; x++) {
> +		struct drm_colorop *colorop = plane_state->base.base.color_pipeline;
> +
> +		while (colorop) {
> +			struct drm_colorop_state *colorop_state;
> +
> +			colorop_state = colorop->state;
> +
> +			if (!colorop_state)
> +				return;
> +
> +			if (!colorop_state->bypass)
> +				apply_colorop(&output_buffer->pixels[x], colorop);
> +

Just a note for future colorop: it may be interesting to have a 
"specialized" fonction for each colorop, like I proposed for color 
conversion [1] to only check the color operation for each line and 
not each pixel.

Is a plane color conversion considered as a colorop? 

> +			colorop = colorop->next;
> +		}
> +	}
> +}
> +
>  /**
>   * blend - blend the pixels from all planes and compute crc
>   * @wb: The writeback frame buffer metadata
> @@ -204,6 +250,9 @@ static void blend(struct vkms_writeback_job *wb,
>  				continue;
> 
>  			vkms_compose_row(stage_buffer, plane[i], y_pos);
> +
> +			pre_blend_color_transform(plane[i], stage_buffer);
> +
>  			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
>  					    output_buffer);
>  		}
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 5e46ea5b96dc..278cf3533f58 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -169,4 +169,8 @@ void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer
>  /* Writeback */
>  int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
> 
> +/* Colorops */
> +int vkms_initialize_colorops(struct drm_plane *plane);
> +
> +

checkpatch: Please don't use multiple blank lines

>  #endif /* _VKMS_DRV_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_luts.c b/drivers/gpu/drm/vkms/vkms_luts.c
> new file mode 100644
> index 000000000000..6553d6d442b4
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_luts.c
> @@ -0,0 +1,802 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +

checkpatch: Improper SPDX comment style for 
'drivers/gpu/drm/vkms/vkms_luts.c', please use '//' instead

> +#include <drm/drm_mode.h>
> +
> +#include "vkms_drv.h"
> +#include "vkms_luts.h"
> +
> +static struct drm_color_lut linear_array[LUT_SIZE] = {
> +	{ 0x0, 0x0, 0x0, 0 },
> +	{ 0x101, 0x101, 0x101, 0 },

[...]

> +	{ 0xfefe, 0xfefe, 0xfefe, 0 },
> +	{ 0xffff, 0xffff, 0xffff, 0 },
> +};
> +
> +const struct vkms_color_lut linear_eotf = {
> +	.base = linear_array,
> +	.lut_length = LUT_SIZE,
> +	.channel_value2index_ratio = 0xff00ffll
> +};
> +
> +

checkpatch: Please don't use multiple blank lines

> +static struct drm_color_lut srgb_array[LUT_SIZE] = {
> +	{ 0x0, 0x0, 0x0, 0 },
> +	{ 0x13, 0x13, 0x13, 0 },

[...]

> diff --git a/drivers/gpu/drm/vkms/vkms_luts.h b/drivers/gpu/drm/vkms/vkms_luts.h
> new file mode 100644
> index 000000000000..053512a643f7
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_luts.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#ifndef _VKMS_LUTS_H_
> +#define _VKMS_LUTS_H_
> +
> +#define LUT_SIZE 256
> +
> +extern const struct vkms_color_lut linear_eotf;
> +extern const struct vkms_color_lut srgb_eotf;
> +extern const struct vkms_color_lut srgb_inv_eotf;
> +
> +#endif /* _VKMS_LUTS_H_ */
> \ No newline at end of file

checkpatch: adding a line without newline at end of file

> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index e5c625ab8e3e..8520ee0534d1 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -215,5 +215,7 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>  	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
>  					   DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK);
> 
> +	vkms_initialize_colorops(&plane->base);
> +

This can fail, can you add a check and do the proper cleanup?

>  	return plane;
>  }
> --
> 2.46.2
> 
