Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D9E9615DB
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 19:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B400510E3E9;
	Tue, 27 Aug 2024 17:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="nVoZZsZH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F94110E3E2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 17:49:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2045F1BF204;
 Tue, 27 Aug 2024 17:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724780990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u5q0y7fToY6OMlSwCG8TbyhC7D8/eMx2WkhxHEyhXg8=;
 b=nVoZZsZHOZ8WekKHyQsOZJh3EXqGf/3iNva+qdXRJnN6iBSrHDDBz/3DzvHMXPuoHy8i64
 SEuPQ5s668VMLctK2TqSIrqhtRcEzo50w1kGDgzWFiTGYKtkKkztWypFCBRphj4Pk8rmnn
 OueWq39xf/UH9Io6AXSx527Cse76rmJHpq/qTeyN7rsvGIq/wvRcjLci/xJeXGH31+hxG7
 p51hWfIS7CLFgVuu3+DY3/KEH38SIXqcE2MId5858boJ4uUoesB+2PHjkL5YAVaDtL5Fag
 9RglBSkGzU4tbHiVGXB2YXecExTv3IKWMd96wCs9wWotFdroj9UrpHSjN3oJpg==
Date: Tue, 27 Aug 2024 19:49:48 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, Alex Hung <alex.hung@amd.com>
Subject: Re: [PATCH v5 14/44] drm/vkms: Add enumerated 1D curve colorop
Message-ID: <Zs4RvNMce3rdgO2O@louis-chauvet-laptop>
References: <20240819205714.316380-1-harry.wentland@amd.com>
 <20240819205714.316380-15-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240819205714.316380-15-harry.wentland@amd.com>
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

Le 19/08/24 - 16:56, Harry Wentland a écrit :

> +static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
> +{
> +
> +	struct drm_colorop *op, *prev_op;
> +	struct drm_device *dev = plane->dev;
> +	int ret;
> +
> +	/* 1st op: 1d curve */
> +	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> +	if (!op) {
> +		DRM_ERROR("KMS: Failed to allocate colorop\n");
> +		return -ENOMEM;
> +	}
> +
> +	ret = drm_colorop_curve_1d_init(dev, op, plane, supported_tfs);
> +	if (ret)
> +		return ret;
> +
> +	list->type = op->base.id;
> +	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", op->base.id);
> +
> +	prev_op = op;
> +
> +	/* 2nd op: 1d curve */
> +	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> +	if (!op) {
> +		DRM_ERROR("KMS: Failed to allocate colorop\n");
> +		return -ENOMEM;
> +	}

There is no need to cleanup previously created colorop here?

> +	ret = drm_colorop_curve_1d_init(dev, op, plane, supported_tfs);
> +	if (ret)
> +		return ret;

ditto?

> +	drm_colorop_set_next_property(prev_op, op);
> +
> +	return 0;
> +}
> +
> +int vkms_initialize_colorops(struct drm_plane *plane)
> +{
> +	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
> +	int len = 0;
> +	int ret;
> +
> +	/* Add color pipeline */
> +	ret = vkms_initialize_color_pipeline(plane, &(pipelines[len]));
> +	if (ret)
> +		return ret;
> +	len++;

The usage of len is not very clear, can you maybe remove it? Or do you 
plan to use it for instanciating multiple pipelines?

	struct drm_prop_enum_list pipeline;
	ret = vkms_initialize_color_pipeline(plane, &pipeline);
	drm_plane_create_color_pipeline_property(plane, &pipeline, 1);

> +	/* Create COLOR_PIPELINE property and attach */
> +	drm_plane_create_color_pipeline_property(plane, pipelines, len);

This function can fail, can you also test the result here?

> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 3ecda70c2b55..bc116d16e378 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -12,6 +12,7 @@
>  #include <linux/minmax.h>
>  
>  #include "vkms_drv.h"
> +#include "vkms_luts.h"
>  
>  static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
>  {
> @@ -163,6 +164,53 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
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

Maybe add a ONCE/RATELIMITED here, this function is called for every 
pixel.

> +				break;
> +		}
> +	}
> +
> +}
> +
> +static void pre_blend_color_transform(const struct vkms_plane_state *plane_state, struct line_buffer *output_buffer)
> +{
> +	struct drm_colorop *colorop = plane_state->base.base.color_pipeline;
> +
> +	while (colorop) {
> +		struct drm_colorop_state *colorop_state;
> +
> +		if (!colorop)
> +			return;
> +
> +		colorop_state = colorop->state;
> +
> +		if (!colorop_state)
> +			return;
> +
> +		for (size_t x = 0; x < output_buffer->n_pixels; x++)
> +			if (!colorop_state->bypass)

Maybe we can swap the for and the if? I don't know the performance impact 
is huge, but it feel more logical to check bypass before iterating.

> +				apply_colorop(&output_buffer->pixels[x], colorop);
> +
> +		colorop = colorop->next;
> +	}
> +}
> +
>  /**
>   * blend - blend the pixels from all planes and compute crc
>   * @wb: The writeback frame buffer metadata
> @@ -200,6 +248,9 @@ static void blend(struct vkms_writeback_job *wb,
>  				continue;
>  
>  			vkms_compose_row(stage_buffer, plane[i], y_pos);
> +
> +			pre_blend_color_transform(plane[i], stage_buffer);
> +
>  			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
>  					    output_buffer);
>  		}

[...]

> diff --git a/drivers/gpu/drm/vkms/vkms_luts.c b/drivers/gpu/drm/vkms/vkms_luts.c
> new file mode 100644
> index 000000000000..6553d6d442b4
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_luts.c
> @@ -0,0 +1,802 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#include <drm/drm_mode.h>
> +
> +#include "vkms_drv.h"
> +#include "vkms_luts.h"
> +
> +static struct drm_color_lut linear_array[LUT_SIZE] = {
> +	{ 0x0, 0x0, 0x0, 0 },
> +	{ 0x101, 0x101, 0x101, 0 },
> +	{ 0x202, 0x202, 0x202, 0 },
> +	{ 0x303, 0x303, 0x303, 0 },
> +	{ 0x404, 0x404, 0x404, 0 },

For this LUT and the other, can you add a comment to explain how the 
values were generated/found?

[...]

Thanks,
Louis Chauvet
