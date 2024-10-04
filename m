Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1F9990246
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 13:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C5810E9E0;
	Fri,  4 Oct 2024 11:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ZoatB8Oa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3673310E9D7;
 Fri,  4 Oct 2024 11:43:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2CBFE0003;
 Fri,  4 Oct 2024 11:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1728042210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lujbIIvzNu3cW2jKkic0JbokvRrR1GqmjFIiwPByXwc=;
 b=ZoatB8OaadcFKwLwgiuU/2oGqqRHB2nRgg3AzUU1Yraw+/N2nnXZMnrGRVY0HxNZPj7tOH
 7iUWu4FwF73ccPu5hYnvdvwTMtSxbPbi60kEoyGy3+ffi2P7nPwtQ/X3zfPZCNgHajJYVe
 R/+lR1gOwOc/rmG8bSI8WsYrlQt6Aao+qKGI9ASg1DE1jxf5ilsHumRqqNB/JrJSE2dLge
 lbM+miq1FhBBhONaJNik6LVjZcDwVg/dxEMnNF6TUJLSEvLyN0gmLP8qGKINdEtQPftADT
 UU5fPMDFZb8M0fq4LynnC2o8pTWZS8l4Syjpkhkhjyg0mzirakBq425hpWB51g==
Date: Fri, 4 Oct 2024 13:43:29 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 19/44] drm/vkms: add 3x4 matrix in color pipeline
Message-ID: <Zv_U4UMzDdrXXLfa@louis-chauvet-laptop>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
 <20241003200129.1732122-20-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003200129.1732122-20-harry.wentland@amd.com>
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

On 03/10/24 - 16:01, Harry Wentland wrote:
> We add two 3x4 matrices into the VKMS color pipeline. The reason
> we're adding matrices is so that we can test that application
> of a matrix and its inverse yields an output equal to the input
> image.
> 
> One complication with the matrix implementation has to do with
> the fact that the matrix entries are in signed-magnitude fixed
> point, whereas the drm_fixed.h implementation uses 2s-complement.
> The latter one is the one that we want for easy addition and
> subtraction, so we convert all entries to 2s-complement.
> 
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
> 
> v6:
>  - pre-compute colors (Louis Chauvet)
>  - round matrix output (Louis Chauvet)
> 
>  drivers/gpu/drm/vkms/vkms_colorop.c  | 34 +++++++++++++++++++++++++++-
>  drivers/gpu/drm/vkms/vkms_composer.c | 32 ++++++++++++++++++++++++++
>  2 files changed, 65 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
> index aebd467c4e61..f0c264820a81 100644
> --- a/drivers/gpu/drm/vkms/vkms_colorop.c
> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
> @@ -12,7 +12,7 @@ static const u64 supported_tfs =
>  	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
>  	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF);
> 
> -#define MAX_COLOR_PIPELINE_OPS 2
> +#define MAX_COLOR_PIPELINE_OPS 4
> 
>  static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
>  {
> @@ -48,6 +48,38 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>  		goto cleanup;
>  	}
> 
> +	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane);
> +	if (ret)
> +		goto cleanup;
> +
> +	drm_colorop_set_next_property(ops[i-1], ops[i]);

checkpatch: spaces preferred around that '-' (ctx:VxV)

> +
> +	i++;
> +
> +	/* 3rd op: 3x4 matrix */
> +	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);

checkpatch: Prefer kzalloc(sizeof(*ops[i])...) over kzalloc(sizeof(struct 
drm_colorop)...)

> +	if (!ops[i]) {
> +		DRM_ERROR("KMS: Failed to allocate colorop\n");
> +		ret = -ENOMEM;
> +		goto cleanup;
> +	}
> +
> +	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane);
> +	if (ret)
> +		goto cleanup;
> +
> +	drm_colorop_set_next_property(ops[i-1], ops[i]);

checkpatch: preferred around that '-' (ctx:VxV)

> +
> +	i++;
> +
> +	/* 4th op: 1d curve */
> +	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);

checkpatch: Prefer kzalloc(sizeof(*ops[i])...) over kzalloc(sizeof(struct 
drm_colorop)...)

> +	if (!ops[i]) {
> +		DRM_ERROR("KMS: Failed to allocate colorop\n");
> +		ret = -ENOMEM;
> +		goto cleanup;
> +	}
> +
>  	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs);
>  	if (ret)
>  		goto cleanup;
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 01fa81ebc93b..c8b9b9d7f78f 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -159,6 +159,35 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
>  	}
>  }
> 
> +static void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_color_ctm_3x4 *matrix)
> +{
> +	s64 rf, gf, bf;
> +	s64 r, g, b;
> +
> +	r = drm_int2fixp(pixel->r);
> +	g = drm_int2fixp(pixel->g);
> +	b = drm_int2fixp(pixel->b);
> +
> +	rf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[0]), r) +
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[1]), g) +
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[2]), b) +
> +	     drm_sm2fixp(matrix->matrix[3]);
> +
> +	gf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[4]), r) +
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[5]), g) +
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[6]), b) +
> +	     drm_sm2fixp(matrix->matrix[7]);
> +
> +	bf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[8]), r) +
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[9]), g) +
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[10]), b) +
> +	     drm_sm2fixp(matrix->matrix[11]);
> +
> +	pixel->r = drm_fixp2int_round(rf);
> +	pixel->g = drm_fixp2int_round(gf);
> +	pixel->b = drm_fixp2int_round(bf);
> +}
> +
>  static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colorop)
>  {
>  	struct drm_colorop_state *colorop_state = colorop->state;
> @@ -179,6 +208,9 @@ static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colo
>  				DRM_DEBUG_DRIVER("unkown colorop 1D curve type %d\n", colorop_state->curve_1d_type);
>  				break;
>  		}
> +	} else if (colorop->type == DRM_COLOROP_CTM_3X4) {
> +		if (colorop_state->data)
> +			apply_3x4_matrix(pixel, (struct drm_color_ctm_3x4 *) colorop_state->data->data);

checkpatch: line length of 104 exceeds 100 columns

>  	}
> 
>  }
> --
> 2.46.2
> 
