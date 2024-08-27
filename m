Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9019615DA
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 19:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B2310E3E7;
	Tue, 27 Aug 2024 17:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="f3vNWGov";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5DD710E3DE
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 17:49:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 47770C0008;
 Tue, 27 Aug 2024 17:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724780991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3H2WPWkNT8YwJoB3rQQUrmG/jzIk8glHUz3AHflT+RQ=;
 b=f3vNWGovhzRvwqr8s6tqw86OJ7RdtUPfmsO8LYhGE/XLhxDvwzU9ui7NjcLJ0L6QM1Roiv
 XUMoDzWbVjvEOjM6rxDX8dx3hZP2rcr1TKVj9wuMgKPmPNv8vqNqwWXWDqZ6B9gBQydEwh
 Sm6eI01WC3A13FKJ13RFrjXsAjG3pvzW4blVqSDsZgH5Ef7wowcpB8PHOxODUjFhGKOG/O
 v/xqEh4tVgj3lFH6zdBprV6BPEChw5nvwC5kG2DqW32hwuCcQdqIJJwXG7uc+wtcnmp8HI
 azY12hh5pOKoZ6SGDi3Ut752JjyQbJzeBCQ+pxQ/bYqTIN/nEaUFw+SFgGMAGA==
Date: Tue, 27 Aug 2024 19:49:50 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 18/44] drm/vkms: Use s32 for internal color pipeline
 precision
Message-ID: <Zs4RvolD01BudT4M@louis-chauvet-laptop>
References: <20240819205714.316380-1-harry.wentland@amd.com>
 <20240819205714.316380-19-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240819205714.316380-19-harry.wentland@amd.com>
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
> Certain operations require us to preserve values below 0.0 and
> above 1.0 (0x0 and 0xffff respectively in 16 bpc unorm). One
> such operation is a BT709 encoding operation followed by its
> decoding operation, or the reverse.
> 
> We'll use s32 values as intermediate in and outputs of our
> color operations, for the operations where it matters.
>
> For now this won't apply to LUT operations. We might want to
> update those to work on s32 as well, but it's unclear how
> that should work for unorm LUT definitions. We'll revisit
> that once we add LUT + CTM tests.
> 
> In order to allow for this we'll also invert the nesting of our
> colorop processing loops. We now use the pixel iteration loop
> on the outside and the colorop iteration on the inside.

Maybe you can do this inversion on your first commit so it will reduce the 
code change here?

> v4:
>  - Clarify that we're packing 16-bit UNORM into s32, not
>    converting values to a different representation (Pekka)
> 
> v3:
>  - Use new colorop->next pointer
> 
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 55 ++++++++++++++++++++++------
>  drivers/gpu/drm/vkms/vkms_drv.h      |  4 ++
>  2 files changed, 47 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index bc116d16e378..6e939d3a6d5c 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -164,7 +164,7 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
>  	}
>  }
>  
> -static void apply_colorop(struct pixel_argb_u16 *pixel, struct drm_colorop *colorop)
> +static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colorop)
>  {
>  	struct drm_colorop_state *colorop_state = colorop->state;
>  
> @@ -190,24 +190,55 @@ static void apply_colorop(struct pixel_argb_u16 *pixel, struct drm_colorop *colo
>  
>  static void pre_blend_color_transform(const struct vkms_plane_state *plane_state, struct line_buffer *output_buffer)
>  {
> -	struct drm_colorop *colorop = plane_state->base.base.color_pipeline;
> +	struct drm_colorop *colorop;
> +	struct pixel_argb_s32 pixel;
>  
> -	while (colorop) {
> -		struct drm_colorop_state *colorop_state;
> +	for (size_t x = 0; x < output_buffer->n_pixels; x++) {
>  
> -		if (!colorop)
> -			return;
> +		/*
> +		 * Some operations, such as applying a BT709 encoding matrix,
> +		 * followed by a decoding matrix, require that we preserve
> +		 * values above 1.0 and below 0.0 until the end of the pipeline.
> +		 *
> +		 * Pack the 16-bit UNORM values into s32 to give us head-room to
> +		 * avoid clipping until we're at the end of the pipeline. Clip
> +		 * intentionally at the end of the pipeline before packing
> +		 * UNORM values back into u16.
> +		 */
> +		pixel.a = output_buffer->pixels[x].a;
> +		pixel.r = output_buffer->pixels[x].r;
> +		pixel.g = output_buffer->pixels[x].g;
> +		pixel.b = output_buffer->pixels[x].b;
>
> -		colorop_state = colorop->state;
> +		colorop = plane_state->base.base.color_pipeline;
> +		while (colorop) {
> +			struct drm_colorop_state *colorop_state;
>  
> -		if (!colorop_state)
> -			return;
> +			if (!colorop)
> +				return;

I think this is useless, the while should be sufficient.

> +
> +			colorop_state = colorop->state;
> +
> +			if (!colorop_state)
> +				return;
>  
> -		for (size_t x = 0; x < output_buffer->n_pixels; x++)
>  			if (!colorop_state->bypass)
> -				apply_colorop(&output_buffer->pixels[x], colorop);
> +				apply_colorop(&pixel, colorop);
>  
> -		colorop = colorop->next;
> +			colorop = colorop->next;
> +		}
> +
> +		/* clamp pixel */
> +		pixel.a = max(min(pixel.a, 0xffff), 0x0);
> +		pixel.r = max(min(pixel.r, 0xffff), 0x0);
> +		pixel.g = max(min(pixel.g, 0xffff), 0x0);
> +		pixel.b = max(min(pixel.b, 0xffff), 0x0);

clamp can't be used here? And can't we store the result directly in 
output_buffer?

> +
> +		/* put back to output_buffer */
> +		output_buffer->pixels[x].a = pixel.a;
> +		output_buffer->pixels[x].r = pixel.r;
> +		output_buffer->pixels[x].g = pixel.g;
> +		output_buffer->pixels[x].b = pixel.b;
>
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 278cf3533f58..b78bc2611746 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -36,6 +36,10 @@ struct vkms_frame_info {
>  	unsigned int cpp;
>  };
>  
> +struct pixel_argb_s32 {
> +	s32 a, r, g, b;
> +};
> +
>  struct pixel_argb_u16 {
>  	u16 a, r, g, b;
>  };
> -- 
> 2.46.0
> 
