Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D13F58CB194
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 17:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D4810E5FB;
	Tue, 21 May 2024 15:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="awYxVSfE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1ED110E534;
 Tue, 21 May 2024 15:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sqzO+6kH/hrUG8CFIhUap8sPxkj+44OFM44G9epZwfM=; b=awYxVSfEYxaHWHef6Jmrxz5N6Y
 vwflBT9KJyToYRfUA5vtav+bVAkYJz3Kyicohl0Bnno3+PCQTMCppzhyqCvTUy8joUNVM0nG++Knb
 hpC6QEpGN88Z+w41fYcoA/UYsw9Agi3hS6AN5UQ0gy5gnlbmQpmLExjyMaVk+9/ennfOegtLWGAiX
 AtjZXrUNTxQgaKN7D2gfIuH00mh76wMSpDqHKND7OeF7XWjA7/i8RmF93Ii/mjuHCREupsWQNCB3q
 DVC4/htXSl+xjTKeErICHf4OlkrtOdREtz/2kCakehChpmzDEIpY0g17beuks50j0dzvLPzubj7dz
 L17ynZ2Q==;
Received: from [192.168.13.219] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s9RgC-00AiAh-AT; Tue, 21 May 2024 17:45:32 +0200
Date: Tue, 21 May 2024 17:45:20 +0200
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, Alex Hung <alex.hung@amd.com>
Subject: Re: [RFC PATCH v4 31/42] drm/amd/display: Add support for sRGB EOTF
 in DEGAM block
Message-ID: <irl6ryufwrzapa4beqqixx33bedzsev35spj6rh2ln54vhi25f@haapi627kfyl>
References: <20240226211100.100108-1-harry.wentland@amd.com>
 <20240226211100.100108-32-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226211100.100108-32-harry.wentland@amd.com>
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

On 02/26, Harry Wentland wrote:
> From: Alex Hung <alex.hung@amd.com>
> 
> Expose one 1D curve colorop with support for
> DRM_COLOROP_1D_CURVE_SRGB_EOTF and program HW to perform
> the sRGB transform when the colorop is not in bypass.
> 
> With this change the following IGT test passes:
> kms_colorop --run plane-XR30-XR30-srgb_eotf
> 
> The color pipeline now consists of a single colorop:
> 1. 1D curve colorop w/ sRGB EOTF
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Co-developed-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/Makefile    |  3 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 88 +++++++++++++++++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 58 ++++++++++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h | 34 +++++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 10 +++
>  5 files changed, 192 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>  create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> index ab2a97e354da..46158d67ab12 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
> @@ -38,7 +38,8 @@ AMDGPUDM = \
>  	amdgpu_dm_pp_smu.o \
>  	amdgpu_dm_psr.o \
>  	amdgpu_dm_replay.o \
> -	amdgpu_dm_wb.o
> +	amdgpu_dm_wb.o \
> +	amdgpu_dm_colorop.o
>  
>  ifdef CONFIG_DRM_AMD_DC_FP
>  AMDGPUDM += dc_fpu.o
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index 9b527bffe11a..3ec759934669 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -668,6 +668,19 @@ amdgpu_tf_to_dc_tf(enum amdgpu_transfer_function tf)
>  	}
>  }
>  
> +static enum dc_transfer_func_predefined
> +amdgpu_colorop_tf_to_dc_tf(enum drm_colorop_curve_1d_type tf)
> +{
> +	switch (tf)
> +	{
> +	case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
> +	case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
> +		return TRANSFER_FUNCTION_SRGB;
> +	default:
> +		return TRANSFER_FUNCTION_LINEAR;;
> +	}
> +}
> +
>  static void __to_dc_lut3d_color(struct dc_rgb *rgb,
>  				const struct drm_color_lut lut,
>  				int bit_precision)
> @@ -1137,6 +1150,59 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
>  	return 0;
>  }
>  
> +static int
> +__set_colorop_in_tf_1d_curve(struct dc_plane_state *dc_plane_state,
> +		       struct drm_colorop_state *colorop_state)
> +{
> +	struct dc_transfer_func *tf = dc_plane_state->in_transfer_func;

For this patch and the next two, it ^ should be:
`&dc_plane_state->in_transfer_func` (same for shape and blend), right?

> +	struct drm_colorop *colorop = colorop_state->colorop;
> +	struct drm_device *drm = colorop->dev;
> +
> +	if (colorop->type != DRM_COLOROP_1D_CURVE &&
> +	    colorop_state->curve_1d_type != DRM_COLOROP_1D_CURVE_SRGB_EOTF)
> +		return -EINVAL;
> +
> +	if (colorop_state->bypass) {
> +		tf->type = TF_TYPE_BYPASS;
> +		tf->tf = TRANSFER_FUNCTION_LINEAR;
> +		return 0;
> +	}
> +
> +	drm_dbg(drm, "Degamma colorop with ID: %d\n", colorop->base.id);
> +
> +	tf->type = TF_TYPE_PREDEFINED;
> +	tf->tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
> +
> +	return 0;
> +}
> +
> +static int
> +__set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
> +			       struct dc_plane_state *dc_plane_state,
> +			       struct drm_colorop *colorop)
> +{
> +	struct drm_colorop *old_colorop;
> +	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
> +	struct drm_atomic_state *state = plane_state->state;
> +	int i = 0;
> +
> +	old_colorop = colorop;
> +
> +	/* 1st op: 1d curve - degamma */
> +	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
> +		if (new_colorop_state->colorop == old_colorop &&
> +		    new_colorop_state->curve_1d_type == DRM_COLOROP_1D_CURVE_SRGB_EOTF) {
> +			colorop_state = new_colorop_state;
> +			break;
> +		}
> +	}
> +
> +	if (!colorop_state)
> +		return -EINVAL;
> +
> +	return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state);
> +}
> +
>  static int
>  amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
>  				     struct dc_plane_state *dc_plane_state)
> @@ -1187,6 +1253,25 @@ amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
>  	return 0;
>  }
>  
> +static int
> +amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
> +		       struct dc_plane_state *dc_plane_state)
> +{
> +	struct drm_colorop *colorop = plane_state->color_pipeline;
> +	int ret;
> +
> +	/* 1D Curve - DEGAM TF */
> +	if (!colorop) {
> +		return -EINVAL;
> +	}
> +
> +	ret = __set_dm_plane_colorop_degamma(plane_state, dc_plane_state, colorop);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  /**
>   * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to DC plane.
>   * @crtc: amdgpu_dm crtc state
> @@ -1283,5 +1368,8 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  		dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
>  	}
>  
> +	if (!amdgpu_dm_plane_set_colorop_properties(plane_state, dc_plane_state))
> +		return 0;
> +
>  	return amdgpu_dm_plane_set_color_properties(plane_state, dc_plane_state);
>  }
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> new file mode 100644
> index 000000000000..e8b7fc8bb0f1
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> @@ -0,0 +1,58 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2023 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: AMD
> + *
> + */
> +
> +#include <drm/drm_print.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_property.h>
> +#include <drm/drm_colorop.h>
> +
> +#include "amdgpu_dm_colorop.h"
> +
> +const u64 amdgpu_dm_supported_degam_tfs =
> +	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF);
> +
> +int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
> +{
> +	struct drm_colorop *op;
> +	struct drm_device *dev = plane->dev;
> +	int ret;
> +
> +	/* 1D curve - DEGAM TF */
> +	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> +	if (!op) {
> +		DRM_ERROR("KMS: Failed to allocate colorop\n");
> +		return -ENOMEM;
> +	}
> +
> +	ret = drm_colorop_curve_1d_init(dev, op, plane, amdgpu_dm_supported_degam_tfs);
> +	if (ret)
> +		return ret;
> +
> +	list->type = op->base.id;
> +	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", op->base.id);
> +
> +	return 0;
> +}
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
> new file mode 100644
> index 000000000000..f16de6a9fbde
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
> @@ -0,0 +1,34 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2023 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: AMD
> + *
> + */
> +
> +#ifndef __AMDGPU_DM_COLOROP_H__
> +#define __AMDGPU_DM_COLOROP_H__
> +
> +extern const u64 amdgpu_dm_supported_degam_tfs;
> +
> +int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list);
> +
> +#endif /* __AMDGPU_DM_COLOROP_H__*/
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index d3f64f586243..3adab18332d8 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -35,6 +35,7 @@
>  #include "amdgpu_display.h"
>  #include "amdgpu_dm_trace.h"
>  #include "amdgpu_dm_plane.h"
> +#include "amdgpu_dm_colorop.h"
>  #include "gc/gc_11_0_0_offset.h"
>  #include "gc/gc_11_0_0_sh_mask.h"
>  
> @@ -1658,10 +1659,19 @@ dm_plane_init_colorops(struct drm_plane *plane)
>  {
>  	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
>  	int len = 0;
> +	int ret;
>  
>  	if (plane->type == DRM_PLANE_TYPE_CURSOR)
>  		return 0;
>  
> +	/* initialize default pipeline */
> +	ret = amdgpu_dm_initialize_default_pipeline(plane, &(pipelines[len]));
> +	if (ret) {
> +		DRM_ERROR("Failed to create color pipeline for plane %d: %d\n", plane->base.id, ret);
> +		return ret;
> +	}
> +	len++;
> +
>  	/* Create COLOR_PIPELINE property and attach */
>  	drm_plane_create_color_pipeline_property(plane, pipelines, len);
>  
> -- 
> 2.44.0
> 
