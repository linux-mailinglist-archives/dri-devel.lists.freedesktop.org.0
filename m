Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D349615DD
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 19:50:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB65B10E3EA;
	Tue, 27 Aug 2024 17:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KaglfA76";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A907510E3DE
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 17:49:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C38C1BF205;
 Tue, 27 Aug 2024 17:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724780992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gSq5s8qBpms4cNS5jhPENzlemGSo9aX8QmNECeIHnbo=;
 b=KaglfA76X7XapK0ZG/7t/C88g8Jdqi64aPnLDhM4/RBsbAjdWJgyimGtL7nYBHfmbMUboq
 HubZTUNzj+M7rRtBelmUzqR926HQZ5vFZv3LhqbrGlbfqDqN6vk9e0bPGDx4PSR2iKrdFj
 EfAWNpiSD1NaNoTf0sq6IYK7vA35QtGYyNDCP/S0lwOfyvAR7Ze6Y4No5jWvPNvjlwwWdL
 3GYr8EYJXNjNZATOj1Md0OoOcvpq/DQ6LJ8y5x5neWFKdXdFgZI6lsxDHvOgT6zRN5BfaY
 OXWkx3n9CuuK8eB4khHt3w6+WTbN3xaAKiXFfNhxtr8QlbyAG0KuBox5mlBHWg==
Date: Tue, 27 Aug 2024 19:49:50 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 19/44] drm/vkms: add 3x4 matrix in color pipeline
Message-ID: <Zs4RvhVXTg4MFMop@louis-chauvet-laptop>
References: <20240819205714.316380-1-harry.wentland@amd.com>
 <20240819205714.316380-20-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240819205714.316380-20-harry.wentland@amd.com>
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

Is there a reason to use signed-magnitude and not 2s-complement here? I 
did not read the whole amd driver, but it seems that the matrix is always 
converted to fixed point notation (amdgpu_dm_fixpt_from_s3132 in 
amdgpu_dm_color.c). It may reduce the complexity here and in the amd 
driver too.

> 
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  drivers/gpu/drm/vkms/vkms_colorop.c  | 32 +++++++++++++++++++++++++++-
>  drivers/gpu/drm/vkms/vkms_composer.c | 27 +++++++++++++++++++++++
>  2 files changed, 58 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
> index f61dfde47156..adcb08153a09 100644
> --- a/drivers/gpu/drm/vkms/vkms_colorop.c
> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
> @@ -37,7 +37,37 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>  
>  	prev_op = op;
>  
> -	/* 2nd op: 1d curve */
> +	/* 2nd op: 3x4 matrix */
> +	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> +	if (!op) {
> +		DRM_ERROR("KMS: Failed to allocate colorop\n");
> +		return -ENOMEM;
> +	}

Same as before, don't we leak memory/properties here?

> +	ret = drm_colorop_ctm_3x4_init(dev, op, plane);
> +	if (ret)
> +		return ret;
> +
> +	drm_colorop_set_next_property(prev_op, op);
> +
> +	prev_op = op;
> +
> +	/* 3rd op: 3x4 matrix */
> +	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> +	if (!op) {
> +		DRM_ERROR("KMS: Failed to allocate colorop\n");
> +		return -ENOMEM;
> +	}
> +
> +	ret = drm_colorop_ctm_3x4_init(dev, op, plane);
> +	if (ret)
> +		return ret;
> +
> +	drm_colorop_set_next_property(prev_op, op);
> +
> +	prev_op = op;
> +
> +	/* 4th op: 1d curve */
>  	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
>  	if (!op) {
>  		DRM_ERROR("KMS: Failed to allocate colorop\n");
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 6e939d3a6d5c..bd1df06ced85 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -164,6 +164,30 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
>  	}
>  }
>  
> +static void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_color_ctm_3x4 *matrix)
> +{
> +	s64 rf, gf, bf;
> +
> +	rf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[0]), drm_int2fixp(pixel->r)) +
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[1]), drm_int2fixp(pixel->g)) +
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[2]), drm_int2fixp(pixel->b)) +
> +	     drm_sm2fixp(matrix->matrix[3]);
> +
> +	gf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[4]), drm_int2fixp(pixel->r)) +
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[5]), drm_int2fixp(pixel->g)) +
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[6]), drm_int2fixp(pixel->b)) +
> +	     drm_sm2fixp(matrix->matrix[7]);
> +
> +	bf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[8]), drm_int2fixp(pixel->r)) +
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[9]), drm_int2fixp(pixel->g)) +
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[10]), drm_int2fixp(pixel->b)) +
> +	     drm_sm2fixp(matrix->matrix[11]);
> +
> +	pixel->r = drm_fixp2int(rf);
> +	pixel->g = drm_fixp2int(gf);
> +	pixel->b = drm_fixp2int(bf);

There is no need to round here, like done in [1]?

I don't know if the performance improvment is huge, bug maybe you can 
precompute drm_int2fixp(pixel->r/g/b)?

[1]: https://lore.kernel.org/all/20240802-yuv-v9-12-08a706669e16@bootlin.com/

> +}
> +
>  static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colorop)
>  {
>  	struct drm_colorop_state *colorop_state = colorop->state;
> @@ -184,6 +208,9 @@ static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colo
>  				DRM_DEBUG_DRIVER("unkown colorop 1D curve type %d\n", colorop_state->curve_1d_type);
>  				break;
>  		}
> +	} else if (colorop->type == DRM_COLOROP_CTM_3X4) {
> +		if (colorop_state->data)
> +			apply_3x4_matrix(pixel, (struct drm_color_ctm_3x4 *) colorop_state->data->data);
>  	}
>  
>  }
> -- 
> 2.46.0
> 
