Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D14BB8699AA
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 16:02:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732F010E8ED;
	Tue, 27 Feb 2024 15:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TIuivmmc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD8C10E7E0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 15:02:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B94001BF210;
 Tue, 27 Feb 2024 15:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709046132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SzXNjEy1KygNfe9B338Kutw8Dkg/ESDdJW91KNPp8G4=;
 b=TIuivmmcgInEXy4np1bHfOLDsVJ/qhx/XAazrewSo4N1v+KBAeOmY8jpAYIG/BXYLhUr8E
 +nHc/Sm2dlWqayclIeOOymrkDNy06h/EgZXU6B2FaKX1zZmixVursldvGs2Mqr1x5k8555
 YmYcSECvYrtaVHJBzHSxDJPFjUbtq86D3wJvYk/IITpDlfcAcmxPV4OM0iKKoUQkRR8fD/
 bWjhr0mgwx48PacWV1PQuYzJZGgutIaZxHrgRzrDnyBpVo4zK+x2pp/up3ftLtHcLcfvkg
 BKLGdI1qhQx+eCVWR72824HLgvjoVMmxAy/pVGEqeWSxb194et0J4+SWRUw4QQ==
Date: Tue, 27 Feb 2024 16:02:09 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v3 5/9] drm/vkms: Re-introduce line-per-line composition
 algorithm
Message-ID: <Zd35ce45h6u8flII@localhost.localdomain>
Mail-Followup-To: Arthur Grillo <arthurgrillo@riseup.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
References: <20240226-yuv-v3-0-ff662f0994db@bootlin.com>
 <20240226-yuv-v3-5-ff662f0994db@bootlin.com>
 <3d34fda7-1a95-472d-b059-eec7cb280c35@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d34fda7-1a95-472d-b059-eec7cb280c35@riseup.net>
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

Le 26/02/24 - 11:14, Arthur Grillo a écrit :
> 
> 
> On 26/02/24 05:46, Louis Chauvet wrote:
> > Re-introduce a line-by-line composition algorithm for each pixel format.
> > This allows more performance by not requiring an indirection per pixel
> > read. This patch is focused on readability of the code.
> > 
> > Line-by-line composition was introduced by [1] but rewritten back to
> > pixel-by-pixel algorithm in [2]. At this time, nobody noticed the impact
> > on performance, and it was merged.
> > 
> > This patch is almost a revert of [2], but in addition efforts have been
> > made to increase readability and maintainability of the rotation handling.
> > The blend function is now divided in two parts:
> > - Transformation of coordinates from the output referential to the source
> > referential
> > - Line conversion and blending
> > 
> > Most of the complexity of the rotation management is avoided by using
> > drm_rect_* helpers. The remaining complexity is around the clipping, to
> > avoid reading/writing outside source/destination buffers.
> > 
> > The pixel conversion is now done line-by-line, so the read_pixel_t was
> > replaced with read_pixel_line_t callback. This way the indirection is only
> > required once per line and per plane, instead of once per pixel and per
> > plane.
> > 
> > The read_line_t callbacks are very similar for most pixel format, but it
> > is required to avoid performance impact. Some helpers were created to
> > avoid code repetition:
> > - get_step_1x1: get the step in byte to reach next pixel block in a
> >   certain direction
> > - *_to_argb_u16: helpers to perform colors conversion. They should be
> >   inlined by the compiler, and they are used to avoid repetition between
> >   multiple variants of the same format (argb/xrgb and maybe in the
> >   future for formats like bgr formats).
> > 
> > This new algorithm was tested with:
> > - kms_plane (for color conversions)
> > - kms_rotation_crc (for rotations of planes)
> > - kms_cursor_crc (for translations of planes)
> > The performance gain was mesured with:
> > - kms_fb_stress
> > 
> > [1]: commit 8ba1648567e2 ("drm: vkms: Refactor the plane composer to accept
> >      new formats")
> >      https://lore.kernel.org/all/20220905190811.25024-7-igormtorrente@gmail.com/
> > [2]: commit 322d716a3e8a ("drm/vkms: isolate pixel conversion
> >      functionality")
> >      https://lore.kernel.org/all/20230418130525.128733-2-mcanal@igalia.com/
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >  drivers/gpu/drm/vkms/vkms_composer.c | 219 +++++++++++++++++++++++-------
> >  drivers/gpu/drm/vkms/vkms_drv.h      |  24 +++-
> >  drivers/gpu/drm/vkms/vkms_formats.c  | 253 ++++++++++++++++++++++-------------
> >  drivers/gpu/drm/vkms/vkms_formats.h  |   2 +-
> >  drivers/gpu/drm/vkms/vkms_plane.c    |   8 +-
> >  5 files changed, 349 insertions(+), 157 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> > index 5b341222d239..e555bf9c1aee 100644
> > --- a/drivers/gpu/drm/vkms/vkms_composer.c
> > +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> > @@ -24,9 +24,10 @@ static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
> >  
> >  /**
> >   * pre_mul_alpha_blend - alpha blending equation
> > - * @frame_info: Source framebuffer's metadata
> >   * @stage_buffer: The line with the pixels from src_plane
> >   * @output_buffer: A line buffer that receives all the blends output
> > + * @x_start: The start offset to avoid useless copy
> > + * @count: The number of byte to copy
> >   *
> >   * Using the information from the `frame_info`, this blends only the
> >   * necessary pixels from the `stage_buffer` to the `output_buffer`
> > @@ -37,51 +38,23 @@ static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
> >   * drm_plane_create_blend_mode_property(). Also, this formula assumes a
> >   * completely opaque background.
> >   */
> > -static void pre_mul_alpha_blend(struct vkms_frame_info *frame_info,
> > -				struct line_buffer *stage_buffer,
> > -				struct line_buffer *output_buffer)
> > +static void pre_mul_alpha_blend(
> > +	struct line_buffer *stage_buffer,
> > +	struct line_buffer *output_buffer,
> > +	int x_start,
> > +	int pixel_count)
> >  {
> > -	int x_dst = frame_info->dst.x1;
> > -	struct pixel_argb_u16 *out = output_buffer->pixels + x_dst;
> > -	struct pixel_argb_u16 *in = stage_buffer->pixels;
> > -	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
> > -			    stage_buffer->n_pixels);
> > -
> > -	for (int x = 0; x < x_limit; x++) {
> > -		out[x].a = (u16)0xffff;
> > -		out[x].r = pre_mul_blend_channel(in[x].r, out[x].r, in[x].a);
> > -		out[x].g = pre_mul_blend_channel(in[x].g, out[x].g, in[x].a);
> > -		out[x].b = pre_mul_blend_channel(in[x].b, out[x].b, in[x].a);
> > +	struct pixel_argb_u16 *out = &output_buffer->pixels[x_start];
> > +	struct pixel_argb_u16 *in = &stage_buffer->pixels[x_start];
> > +
> > +	for (int i = 0; i < pixel_count; i++) {
> > +		out[i].a = (u16)0xffff;
> > +		out[i].r = pre_mul_blend_channel(in[i].r, out[i].r, in[i].a);
> > +		out[i].g = pre_mul_blend_channel(in[i].g, out[i].g, in[i].a);
> > +		out[i].b = pre_mul_blend_channel(in[i].b, out[i].b, in[i].a);
> >  	}
> >  }
> >  
> > -static int get_y_pos(struct vkms_frame_info *frame_info, int y)
> > -{
> > -	if (frame_info->rotation & DRM_MODE_REFLECT_Y)
> > -		return drm_rect_height(&frame_info->rotated) - y - 1;
> > -
> > -	switch (frame_info->rotation & DRM_MODE_ROTATE_MASK) {
> > -	case DRM_MODE_ROTATE_90:
> > -		return frame_info->rotated.x2 - y - 1;
> > -	case DRM_MODE_ROTATE_270:
> > -		return y + frame_info->rotated.x1;
> > -	default:
> > -		return y;
> > -	}
> > -}
> > -
> > -static bool check_limit(struct vkms_frame_info *frame_info, int pos)
> > -{
> > -	if (drm_rotation_90_or_270(frame_info->rotation)) {
> > -		if (pos >= 0 && pos < drm_rect_width(&frame_info->rotated))
> > -			return true;
> > -	} else {
> > -		if (pos >= frame_info->rotated.y1 && pos < frame_info->rotated.y2)
> > -			return true;
> > -	}
> > -
> > -	return false;
> > -}
> >  
> >  static void fill_background(const struct pixel_argb_u16 *background_color,
> >  			    struct line_buffer *output_buffer)
> > @@ -163,6 +136,37 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
> >  	}
> >  }
> >  
> > +/**
> > + * direction_for_rotation() - Helper to get the correct reading direction for a specific rotation
> > + *
> > + * @rotation: rotation to analyze
> > + */
> > +enum pixel_read_direction direction_for_rotation(unsigned int rotation)
> > +{
> > +	if (rotation & DRM_MODE_ROTATE_0) {
> > +		if (rotation & DRM_MODE_REFLECT_X)
> > +			return READ_LEFT;
> > +		else
> > +			return READ_RIGHT;
> > +	} else if (rotation & DRM_MODE_ROTATE_90) {
> > +		if (rotation & DRM_MODE_REFLECT_Y)
> > +			return READ_UP;
> > +		else
> > +			return READ_DOWN;
> > +	} else if (rotation & DRM_MODE_ROTATE_180) {
> > +		if (rotation & DRM_MODE_REFLECT_X)
> > +			return READ_RIGHT;
> > +		else
> > +			return READ_LEFT;
> > +	} else if (rotation & DRM_MODE_ROTATE_270) {
> > +		if (rotation & DRM_MODE_REFLECT_Y)
> > +			return READ_DOWN;
> > +		else
> > +			return READ_UP;
> > +	}
> > +	return READ_RIGHT;
> > +}
> > +
> >  /**
> >   * blend - blend the pixels from all planes and compute crc
> >   * @wb: The writeback frame buffer metadata
> > @@ -183,11 +187,11 @@ static void blend(struct vkms_writeback_job *wb,
> >  {
> >  	struct vkms_plane_state **plane = crtc_state->active_planes;
> >  	u32 n_active_planes = crtc_state->num_active_planes;
> > -	int y_pos;
> >  
> >  	const struct pixel_argb_u16 background_color = { .a = 0xffff };
> >  
> >  	size_t crtc_y_limit = crtc_state->base.crtc->mode.vdisplay;
> > +	size_t crtc_x_limit = crtc_state->base.crtc->mode.hdisplay;
> >  
> >  	/*
> >  	 * The planes are composed line-by-line. It is a necessary complexity to avoid poor
> > @@ -198,22 +202,133 @@ static void blend(struct vkms_writeback_job *wb,
> >  
> >  		/* The active planes are composed associatively in z-order. */
> >  		for (size_t i = 0; i < n_active_planes; i++) {
> > -			y_pos = get_y_pos(plane[i]->frame_info, y);
> > +			struct vkms_plane_state *current_plane = plane[i];
> >  
> > -			if (!check_limit(plane[i]->frame_info, y_pos))
> > +			/* Avoid rendering useless lines */
> > +			if (y < current_plane->frame_info->dst.y1 ||
> > +			    y >= current_plane->frame_info->dst.y2) {
> >  				continue;
> > -
> > -			vkms_compose_row(stage_buffer, plane[i], y_pos);
> > -			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
> > -					    output_buffer);
> > +			}
> > +
> > +			/*
> > +			 * src_px is the line to copy. The initial coordinates are inside the
> 
> So maybe is better to rename to src_line?

Good idea!

Kind regards,
Louis Chauvet

[...]

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
