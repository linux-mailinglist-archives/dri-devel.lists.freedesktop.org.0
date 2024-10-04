Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5051F990241
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 13:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD1C10E9D7;
	Fri,  4 Oct 2024 11:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KzRkQSfZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4D110E9D5;
 Fri,  4 Oct 2024 11:43:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 850E360009;
 Fri,  4 Oct 2024 11:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1728042209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VX2XAX/247Vb34Q2Zb0nbFKgOT8PhmoWuMd1pQIcoeo=;
 b=KzRkQSfZ0oUeFRQPNw92g+2aetwnZ7uUmb4yvfIERfizQm29erVHYlFghNKxRXBn+wNC1T
 t8ceFQ7fHTy+dPn3caSjyMG4vyMDmNUuc8p1B7yJgZOdone0p3dSTLdVxFRxvXjZN/DrDl
 EDvcBdDIr/Jj0mIz9c/hSYScrfDMC+F6jRhTAmLlt46W1gC5iiohWhtKk2x9JO/f90PDZB
 qNjDC2fK5pWX2VyWxnQyAblDt4wOObTCoMJcboXAefmTAO+uxMgOzDPKQmRNEDCDrCs0Lq
 0PlpXVkXnSbhxsAcvIsBpUN83tVNZBjEvJd/E+CwoOxuTOnZ0CgdtywkTuwjEw==
Date: Fri, 4 Oct 2024 13:43:28 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 18/44] drm/vkms: Use s32 for internal color pipeline
 precision
Message-ID: <Zv_U4IETaaHbC4F_@louis-chauvet-laptop>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
 <20241003200129.1732122-19-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003200129.1732122-19-harry.wentland@amd.com>
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
> 
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
> v6:
>  - use clamp_val instead of manual clamping (Louis Chauvet)

Perfect!
 
> v4:
>  - Clarify that we're packing 16-bit UNORM into s32, not
>    converting values to a different representation (Pekka)
> 
> v3:
>  - Use new colorop->next pointer
> 
>  drivers/gpu/drm/vkms/vkms_composer.c | 27 +++++++++++++++++++++++++--
>  drivers/gpu/drm/vkms/vkms_drv.h      |  4 ++++
>  2 files changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index b4aaad2bf45f..01fa81ebc93b 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -159,7 +159,7 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
>  	}
>  }
> 
> -static void apply_colorop(struct pixel_argb_u16 *pixel, struct drm_colorop *colorop)
> +static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colorop)

I agree with this change, but I think we may face conversion issues 
in apply_lut_to_channel_value, as it takes u16 and returns u16, but with 
your change, you pass s32 and expect s32.

If it is not an issue: Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

>  {
>  	struct drm_colorop_state *colorop_state = colorop->state;
> 
> @@ -185,9 +185,26 @@ static void apply_colorop(struct pixel_argb_u16 *pixel, struct drm_colorop *colo
> 
>  static void pre_blend_color_transform(const struct vkms_plane_state *plane_state, struct line_buffer *output_buffer)
>  {
> +	struct pixel_argb_s32 pixel;
> +
>  	for (size_t x = 0; x < output_buffer->n_pixels; x++) {
>  		struct drm_colorop *colorop = plane_state->base.base.color_pipeline;
> 
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
> +
>  		while (colorop) {
>  			struct drm_colorop_state *colorop_state;
> 
> @@ -197,10 +214,16 @@ static void pre_blend_color_transform(const struct vkms_plane_state *plane_state
>  				return;
> 
>  			if (!colorop_state->bypass)
> -				apply_colorop(&output_buffer->pixels[x], colorop);
> +				apply_colorop(&pixel, colorop);
> 
>  			colorop = colorop->next;
>  		}
> +
> +		/* clamp values */
> +		output_buffer->pixels[x].a = clamp_val(pixel.a, 0, 0xffff);
> +		output_buffer->pixels[x].r = clamp_val(pixel.r, 0, 0xffff);
> +		output_buffer->pixels[x].g = clamp_val(pixel.g, 0, 0xffff);
> +		output_buffer->pixels[x].b = clamp_val(pixel.b, 0, 0xffff);
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
> 2.46.2
> 
