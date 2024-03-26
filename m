Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F339488C842
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 16:57:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0FF10F0C0;
	Tue, 26 Mar 2024 15:57:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="FYEpoGs/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0AA10F0B2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 15:57:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6ABD61BF206;
 Tue, 26 Mar 2024 15:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1711468625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OXRntzj7Es+y9ihqCPzTjxtBTga+ABDsV5nKLe/E130=;
 b=FYEpoGs/XgK+B6dY1O4BH5OIrvBvFOb5OxJaDHvYHIRp2cp9/tE/H55N5JgjgRBvfdJ119
 PT7tnxlmaONYxL7b4/3t4SdAShIRHnUK+11OkATqqnXxkJI5gV7sU8/NC7ICTcDsaoLEaB
 8s6lnq45+8OcmgNprBwcOUahv92iAFs34bJJYIrWlG1PRy+I0JV6NpuSXKURakuiY6Q/+S
 HEu+rsFjSEGfryXH+EDbb9w0ZQ+xUWNmS2XxRQMvzp1b9pqvUV7jywyhEsz4O7XXzvXHgU
 TbSv9ksbtSmaSBKqEl3r+MTcBq2+agMq/K+IrwWwZrASdQ132qvHr5DxtgZ0hw==
Date: Tue, 26 Mar 2024 16:57:02 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v5 10/16] drm/vkms: Re-introduce line-per-line
 composition algorithm
Message-ID: <ZgLwTvjdzf8KTZsY@localhost.localdomain>
Mail-Followup-To: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-10-e610cbd03f52@bootlin.com>
 <20240325174309.28f91bec.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325174309.28f91bec.pekka.paalanen@collabora.com>
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

[...]

> > @@ -215,34 +188,146 @@ static void blend(struct vkms_writeback_job *wb,
> >  {
> >  	struct vkms_plane_state **plane = crtc_state->active_planes;
> >  	u32 n_active_planes = crtc_state->num_active_planes;
> > -	int y_pos, x_dst, x_limit;
> >  
> >  	const struct pixel_argb_u16 background_color = { .a = 0xffff };
> >  
> > -	size_t crtc_y_limit = crtc_state->base.crtc->mode.vdisplay;
> > +	int crtc_y_limit = crtc_state->base.crtc->mode.vdisplay;
> > +	int crtc_x_limit = crtc_state->base.crtc->mode.hdisplay;
> >  
> >  	/*
> >  	 * The planes are composed line-by-line to avoid heavy memory usage. It is a necessary
> >  	 * complexity to avoid poor blending performance.
> >  	 *
> > -	 * The function vkms_compose_row is used to read a line, pixel-by-pixel, into the staging
> > -	 * buffer.
> > +	 * The function pixel_read_line callback is used to read a line, using an efficient
> > +	 * algorithm for a specific format, into the staging buffer.
> >  	 */
> >  	for (size_t y = 0; y < crtc_y_limit; y++) {
> >  		fill_background(&background_color, output_buffer);
> >  
> >  		/* The active planes are composed associatively in z-order. */
> >  		for (size_t i = 0; i < n_active_planes; i++) {
> > -			x_dst = plane[i]->frame_info->dst.x1;
> > -			x_limit = min_t(size_t, drm_rect_width(&plane[i]->frame_info->dst),
> > -					stage_buffer->n_pixels);
> > -			y_pos = get_y_pos(plane[i]->frame_info, y);
> > +			struct vkms_plane_state *current_plane = plane[i];
> >  
> > -			if (!check_limit(plane[i]->frame_info, y_pos))
> > +			/* Avoid rendering useless lines */
> > +			if (y < current_plane->frame_info->dst.y1 ||
> > +			    y >= current_plane->frame_info->dst.y2)
> >  				continue;
> >  
> > -			vkms_compose_row(stage_buffer, plane[i], y_pos);
> > -			pre_mul_alpha_blend(stage_buffer, output_buffer, x_dst, x_limit);
> > +			/*
> > +			 * dst_line is the line to copy. The initial coordinates are inside the

[...]

> > +				 */
> > +				pixel_count = drm_rect_width(&src_line);
> > +				if (x_start < 0) {
> > +					pixel_count += x_start;
> > +					x_start = 0;
> > +				}
> > +				if (x_start + pixel_count > current_plane->frame_info->fb->width) {
> > +					pixel_count =
> > +						(int)current_plane->frame_info->fb->width - x_start;
> > +				}
> > +			} else {
> > +				/*
> > +				 * In vertical reading, the src_line height is the number of pixel
> > +				 * to read
> > +				 */
> > +				pixel_count = drm_rect_height(&src_line);
> > +				if (y_start < 0) {
> > +					pixel_count += y_start;
> > +					y_start = 0;
> > +				}
> > +				if (y_start + pixel_count > current_plane->frame_info->fb->height) {
> > +					pixel_count =
> > +						(int)current_plane->frame_info->fb->width - y_start;
> > +				}
> 
> When you are clamping x_start or y_start or pixel_count to be inside
> the source FB, should you not equally adjust the destination
> coordinates as well?

I did not think about it. Currently it is not an issue and it will not 
read or write outside a buffer because the pixel count is properly 
limited. But indeed, there is an issue here. I will fix it in the v6.
 
> If we take a step back and look at the UAPI, I believe the answer is
> "no", but it's in no way obvious. It results from the combination of
> several facts:
> 
> - UAPI checks reject any source rectangle that extends outside of the
>   source FB.
> 
> - The source rectangle stretches to fill the destination rectangle
>   exactly.
> 
> - VKMS does not support stretching (scaling), so its UAPI checks reject
>   any commit with source and destination rectangles of different sizes
>   after accounting for rotation. (Right?)

I don't know what are exactly the UAPI contract but as the dst can be 
outside the CRTC, I assumed that the src can be outside the source plane. 
After thinking it doesn't really make sense.

> I think this results in the clamping code being actually dead code.
> However, I would not delete the clamping code, because it is a cheap
> safety net in case something goes wrong.

If UAPI check that the source rectangle is inside the plane, yes it is 
just a safety net. Otherwise, it is required to manage properly the 
userspace requests. In the v6, the outside of a source buffer is 
transparent.

> If you agree that it's just a safety net, then maybe explain that in a
> comment? If the safety net catches anything, the composition result
> will be wrong anyway, so it doesn't matter to adjust the destination
> rectangle to match.

I will extract this whole clamping stuff in a function, is this comment 
enough?

 * This function is mainly a safety net to avoid reading outside the source buffer. As the
 * userspace should never ask to read outside the source plane, all the cases covered here should
 * be dead code.

> When the last point is relaxed and VKMS gains scaling support, I think
> it won't change the fact that the clamping remains as a safety net. It
> just increases the risk of bugs that would be caught by the net.
> 
> Going outside of FB boundaries is a serious bug and deserves to be
> checked. Going outside of the source rectangle would be a bug too,
> assuming that partially included pixels are considered fully included,
> but it's not serious enough to warrant explicit checks. Ideally IGT
> would catch it.

That was exactly the idea behind all those check and clamping: avoid 
access outside the buffers.

> > +			}
> > +
> > +			if (pixel_count <= 0) {
> > +				/* Nothing to read, so avoid multiple function calls for nothing */
> > +				continue;
> > +			}
> > +
> > +			/*
> > +			 * Modify the starting point to take in account the rotation
> > +			 *
> > +			 * src_line is the top-left corner, so when reading READ_RIGHT_TO_LEFT or
> > +			 * READ_BOTTOM_TO_TOP, it must be changed to the top-right/bottom-left
> > +			 * corner.
> > +			 */
> > +			if (direction == READ_RIGHT_TO_LEFT) {
> > +				// x_start is now the right point
> > +				x_start += pixel_count - 1;
> > +			} else if (direction == READ_BOTTOM_TO_TOP) {
> > +				// y_start is now the bottom point
> > +				y_start += pixel_count - 1;
> > +			}
> > +
> > +			/*
> > +			 * Perform the conversion and the blending
> > +			 *
> > +			 * Here we know that the read line (x_start, y_start, pixel_count) is
> > +			 * inside the source buffer [2] and we don't write outside the stage
> > +			 * buffer [1]
> > +			 */
> > +			current_plane->pixel_read_line(
> > +				current_plane, x_start, y_start, direction, pixel_count,
> > +				&stage_buffer->pixels[current_plane->frame_info->dst.x1]);
> > +
> > +			pre_mul_alpha_blend(stage_buffer, output_buffer,
> > +					    current_plane->frame_info->dst.x1,
> > +					    pixel_count);
> >  		}
> >  
> >  		apply_lut(crtc_state, output_buffer);
> > @@ -250,7 +335,7 @@ static void blend(struct vkms_writeback_job *wb,
> >  		*crc32 = crc32_le(*crc32, (void *)output_buffer->pixels, row_size);
> >  
> >  		if (wb)
> > -			vkms_writeback_row(wb, output_buffer, y_pos);
> > +			vkms_writeback_row(wb, output_buffer, y);
> >  	}
> >  }
> >  
> > @@ -261,7 +346,7 @@ static int check_format_funcs(struct vkms_crtc_state *crtc_state,
> >  	u32 n_active_planes = crtc_state->num_active_planes;
> >  
> >  	for (size_t i = 0; i < n_active_planes; i++)
> > -		if (!planes[i]->pixel_read)
> > +		if (!planes[i]->pixel_read_line)
> >  			return -1;
> >  
> >  	if (active_wb && !active_wb->pixel_write)
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> > index 985e7a92b7bc..23e1d247468d 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > @@ -39,7 +39,6 @@
> >  struct vkms_frame_info {
> >  	struct drm_framebuffer *fb;
> >  	struct drm_rect src, dst;
> > -	struct drm_rect rotated;
> >  	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
> >  	unsigned int rotation;
> >  };
> > @@ -80,26 +79,37 @@ enum pixel_read_direction {
> >  	READ_LEFT_TO_RIGHT
> >  };
> >  
> > +struct vkms_plane_state;
> > +
> >  /**
> > - * typedef pixel_read_t - These functions are used to read a pixel in the source frame,
> > + * typedef pixel_read_line_t - These functions are used to read a pixel line in the source frame,
> >   * convert it to `struct pixel_argb_u16` and write it to @out_pixel.
> >   *
> > - * @in_pixel: Pointer to the pixel to read
> > - * @out_pixel: Pointer to write the converted pixel
> > + * @plane: Plane used as source for the pixel value
> > + * @x_start: X (width) coordinate of the first pixel to copy. The caller must ensure that x_start
> > + * is positive and smaller than @plane->frame_info->fb->width.
> > + * @y_start: Y (width) coordinate of the first pixel to copy. The caller must ensure that y_start
> > + * is positive and smaller than @plane->frame_info->fb->height.
> 
> s/positive/non-negative/ because zero is valid too. At least, there is
> debate whether zero is positive or not, but non-negative is clear.

Edited in the v6.

> > + * @direction: Direction to use for the copy, starting at @x_start/@y_start
> > + * @count: Number of pixels to copy
> > + * @out_pixel: Pointer where to write the pixel values. They will be written from @out_pixel[0]
> > + * to @out_pixel[@count]. The caller must ensure that out_pixel have a length of at least @count.
> >   */
> > -typedef void (*pixel_read_t)(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel);
> > +typedef void (*pixel_read_line_t)(const struct vkms_plane_state *plane, int x_start,
> > +				  int y_start, enum pixel_read_direction direction, int count,
> > +				  struct pixel_argb_u16 out_pixel[]);
> >  
> >  /**
> >   * vkms_plane_state - Driver specific plane state
> >   * @base: base plane state
> >   * @frame_info: data required for composing computation
> > - * @pixel_read: function to read a pixel in this plane. The creator of a vkms_plane_state must
> > - * ensure that this pointer is valid
> > + * @pixel_read_line: function to read a pixel line in this plane. The creator of a vkms_plane_state
> > + * must ensure that this pointer is valid
> >   */
> >  struct vkms_plane_state {
> >  	struct drm_shadow_plane_state base;
> >  	struct vkms_frame_info *frame_info;
> > -	pixel_read_t pixel_read;
> > +	pixel_read_line_t pixel_read_line;
> >  };
> >  
> >  struct vkms_plane {
> > @@ -204,7 +214,6 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
> >  /* Composer Support */
> >  void vkms_composer_worker(struct work_struct *work);
> >  void vkms_set_composer(struct vkms_output *out, bool enabled);
> > -void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y);
> >  void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer *src_buffer, int y);
> >  
> >  /* Writeback */
> > diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> > index 743b6fd06db5..1449a0e6c706 100644
> > --- a/drivers/gpu/drm/vkms/vkms_formats.c
> > +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> > @@ -105,77 +105,45 @@ static int get_step_next_block(struct drm_framebuffer *fb, enum pixel_read_direc
> >  	return 0;
> >  }
> >  
> > -static void *get_packed_src_addr(const struct vkms_frame_info *frame_info, int y,
> > -				 int plane_index)
> > -{
> > -	int x_src = frame_info->src.x1 >> 16;
> > -	int y_src = y - frame_info->rotated.y1 + (frame_info->src.y1 >> 16);
> > -	u8 *addr;
> > -	int rem_x, rem_y;
> > -
> > -	packed_pixels_addr(frame_info, x_src, y_src, plane_index, &addr, &rem_x, &rem_y);
> > -	return addr;
> > -}
> > -
> > -static int get_x_position(const struct vkms_frame_info *frame_info, int limit, int x)
> > -{
> > -	if (frame_info->rotation & (DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_270))
> > -		return limit - x - 1;
> > -	return x;
> > -}
> > -
> >  /*
> > - * The following  functions take pixel data from the buffer and convert them to the format
> > + * The following  functions take pixel data (a, r, g, b, pixel, ...), convert them to the format
> >   * ARGB16161616 in out_pixel.
> >   *
> > - * They are used in the `vkms_compose_row` function to handle multiple formats.
> > + * They are used in the `read_line`s functions to avoid duplicate work for some pixel formats.
> >   */
> >  
> > -static void ARGB8888_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
> > +static struct pixel_argb_u16 argb_u16_from_u8888(int a, int r, int g, int b)
> >  {
> > +	struct pixel_argb_u16 out_pixel;
> >  	/*
> >  	 * The 257 is the "conversion ratio". This number is obtained by the
> >  	 * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to get
> >  	 * the best color value in a pixel format with more possibilities.
> >  	 * A similar idea applies to others RGB color conversions.
> >  	 */
> > -	out_pixel->a = (u16)in_pixel[3] * 257;
> > -	out_pixel->r = (u16)in_pixel[2] * 257;
> > -	out_pixel->g = (u16)in_pixel[1] * 257;
> > -	out_pixel->b = (u16)in_pixel[0] * 257;
> > -}
> > +	out_pixel.a = (u16)a * 257;
> > +	out_pixel.r = (u16)r * 257;
> > +	out_pixel.g = (u16)g * 257;
> > +	out_pixel.b = (u16)b * 257;
> >  
> > -static void XRGB8888_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
> > -{
> > -	out_pixel->a = (u16)0xffff;
> > -	out_pixel->r = (u16)in_pixel[2] * 257;
> > -	out_pixel->g = (u16)in_pixel[1] * 257;
> > -	out_pixel->b = (u16)in_pixel[0] * 257;
> > +	return out_pixel;
> >  }
> >  
> > -static void ARGB16161616_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
> > +static struct pixel_argb_u16 argb_u16_from_u16161616(int a, int r, int g, int b)
> >  {
> > -	u16 *pixel = (u16 *)in_pixel;
> > +	struct pixel_argb_u16 out_pixel;
> >  
> > -	out_pixel->a = le16_to_cpu(pixel[3]);
> > -	out_pixel->r = le16_to_cpu(pixel[2]);
> > -	out_pixel->g = le16_to_cpu(pixel[1]);
> > -	out_pixel->b = le16_to_cpu(pixel[0]);
> > -}
> > +	out_pixel.a = le16_to_cpu(a);
> > +	out_pixel.r = le16_to_cpu(r);
> > +	out_pixel.g = le16_to_cpu(g);
> > +	out_pixel.b = le16_to_cpu(b);
> >  
> > -static void XRGB16161616_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
> > -{
> > -	u16 *pixel = (u16 *)in_pixel;
> > -
> > -	out_pixel->a = (u16)0xffff;
> > -	out_pixel->r = le16_to_cpu(pixel[2]);
> > -	out_pixel->g = le16_to_cpu(pixel[1]);
> > -	out_pixel->b = le16_to_cpu(pixel[0]);
> > +	return out_pixel;
> >  }
> >  
> > -static void RGB565_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
> > +static struct pixel_argb_u16 argb_u16_from_RGB565(const u16 *pixel)
> >  {
> > -	u16 *pixel = (u16 *)in_pixel;
> > +	struct pixel_argb_u16 out_pixel;
> >  
> >  	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
> >  	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
> > @@ -185,12 +153,26 @@ static void RGB565_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pi
> >  	s64 fp_g = drm_int2fixp((rgb_565 >> 5) & 0x3f);
> >  	s64 fp_b = drm_int2fixp(rgb_565 & 0x1f);
> >  
> > -	out_pixel->a = (u16)0xffff;
> > -	out_pixel->r = drm_fixp2int_round(drm_fixp_mul(fp_r, fp_rb_ratio));
> > -	out_pixel->g = drm_fixp2int_round(drm_fixp_mul(fp_g, fp_g_ratio));
> > -	out_pixel->b = drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
> > +	out_pixel.a = (u16)0xffff;
> > +	out_pixel.r = drm_fixp2int_round(drm_fixp_mul(fp_r, fp_rb_ratio));
> > +	out_pixel.g = drm_fixp2int_round(drm_fixp_mul(fp_g, fp_g_ratio));
> > +	out_pixel.b = drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
> > +
> > +	return out_pixel;
> >  }
> >  
> > +/*
> > + * The following functions are read_line function for each pixel format supported by VKMS.
> > + *
> > + * They read a line starting at the point @x_start,@y_start following the @direction. The result
> > + * is stored in @out_pixel and in the format ARGB16161616.
> > + *
> > + * Those function are very similar, but it is required for performance reason. In the past, some
> > + * experiment were done, and with a generic loop the performance are very reduced [1].
> 
> The English here feels a bit awkward. How about:
> 
> These functions are very repetitive, but the innermost pixel loops must
> be kept inside these functions for performance reasons. Some
> benchmarking was done in [1] where having the innermost loop factored
> out of these functions showed a slowdown by a factor of three.

It is better, thanks.

> > + *
> > + * [1]: https://lore.kernel.org/dri-devel/d258c8dc-78e9-4509-9037-a98f7f33b3a3@riseup.net/
> > + */
> > +
> >  /**
> >   * black_to_argb_u16() - pixel_read callback which always read black
> >   *
> > @@ -198,42 +180,116 @@ static void RGB565_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pi
> >   * It is used to avoid null pointer to be used as a function. In theory, this function should
> >   * never be called, except if you found a bug in the driver/DRM core.
> >   */
> > +static void black_to_argb_u16(const struct vkms_plane_state *plane, int x_start,
> > +			      int y_start, enum pixel_read_direction direction, int count,
> > +			      struct pixel_argb_u16 out_pixel[])
> >  {
> > +	struct pixel_argb_u16 *end = out_pixel + count;
> > +
> > +	while (out_pixel < end) {
> > +		*out_pixel = argb_u16_from_u8888(255, 0, 0, 0);
> > +		out_pixel += 1;
> > +	}
> >  }
> >  
> > +static void ARGB8888_read_line(const struct vkms_plane_state *plane, int x_start, int y_start,
> > +			       enum pixel_read_direction direction, int count,
> > +			       struct pixel_argb_u16 out_pixel[])
> >  {
> > +	struct pixel_argb_u16 *end = out_pixel + count;
> > +	u8 *src_pixels;
> > +	int rem_x, rem_y;
> > +
> > +	packed_pixels_addr(plane->frame_info, x_start, y_start, 0, &src_pixels, &rem_x, &rem_y);
> > +
> > +	int step = get_step_next_block(plane->frame_info->fb, direction, 0);
> > +
> > +	while (out_pixel < end) {
> > +		u8 *px = (u8 *)src_pixels;
> > +		*out_pixel = argb_u16_from_u8888(px[3], px[2], px[1], px[0]);
> > +		out_pixel += 1;
> > +		src_pixels += step;
> > +	}
> > +}
> > +
> > +static void XRGB8888_read_line(const struct vkms_plane_state *plane, int x_start, int y_start,
> > +			       enum pixel_read_direction direction, int count,
> > +			       struct pixel_argb_u16 out_pixel[])
> > +{
> > +	struct pixel_argb_u16 *end = out_pixel + count;
> > +	u8 *src_pixels;
> > +	int rem_x, rem_y;
> > +
> > +	packed_pixels_addr(plane->frame_info, x_start, y_start, 0, &src_pixels, &rem_x, &rem_y);
> > +
> > +	int step = get_step_next_block(plane->frame_info->fb, direction, 0);
> > +
> > +	while (out_pixel < end) {
> > +		u8 *px = (u8 *)src_pixels;
> > +		*out_pixel = argb_u16_from_u8888(255, px[2], px[1], px[0]);
> > +		out_pixel += 1;
> > +		src_pixels += step;
> > +	}
> > +}
> > +
> > +static void ARGB16161616_read_line(const struct vkms_plane_state *plane, int x_start,
> > +				   int y_start, enum pixel_read_direction direction, int count,
> > +				   struct pixel_argb_u16 out_pixel[])
> > +{
> > +	struct pixel_argb_u16 *end = out_pixel + count;
> > +	u8 *src_pixels;
> > +	int rem_x, rem_y;
> > +
> > +	packed_pixels_addr(plane->frame_info, x_start, y_start, 0, &src_pixels, &rem_x, &rem_y);
> > +
> > +	int step = get_step_next_block(plane->frame_info->fb, direction, 0);
> > +
> > +	while (out_pixel < end) {
> > +		u16 *px = (u16 *)src_pixels;
> > +		*out_pixel = argb_u16_from_u16161616(px[3], px[2], px[1], px[0]);
> > +		out_pixel += 1;
> > +		src_pixels += step;
> > +	}
> > +}
> > +
> > +static void XRGB16161616_read_line(const struct vkms_plane_state *plane, int x_start,
> > +				   int y_start, enum pixel_read_direction direction, int count,
> > +				   struct pixel_argb_u16 out_pixel[])
> > +{
> > +	struct pixel_argb_u16 *end = out_pixel + count;
> > +	u8 *src_pixels;
> > +	int rem_x, rem_y;
> > +
> > +	packed_pixels_addr(plane->frame_info, x_start, y_start, 0, &src_pixels, &rem_x, &rem_y);
> > +
> > +	int step = get_step_next_block(plane->frame_info->fb, direction, 0);
> > +
> > +	while (out_pixel < end) {
> > +		u16 *px = (u16 *)src_pixels;
> > +		*out_pixel = argb_u16_from_u16161616(0xFFFF, px[2], px[1], px[0]);
> > +		out_pixel += 1;
> > +		src_pixels += step;
> > +	}
> > +}
> > +
> > +static void RGB565_read_line(const struct vkms_plane_state *plane, int x_start,
> > +			     int y_start, enum pixel_read_direction direction, int count,
> > +			     struct pixel_argb_u16 out_pixel[])
> > +{
> > +	struct pixel_argb_u16 *end = out_pixel + count;
> > +	u8 *src_pixels;
> > +	int rem_x, rem_y;
> > +
> > +	packed_pixels_addr(plane->frame_info, x_start, y_start, 0, &src_pixels, &rem_x, &rem_y);
> >  
> > +	int step = get_step_next_block(plane->frame_info->fb, direction, 0);
> >  
> > +	while (out_pixel < end) {
> > +		u16 *px = (u16 *)src_pixels;
> >  
> > +		*out_pixel = argb_u16_from_RGB565(px);
> > +		out_pixel += 1;
> > +		src_pixels += step;
> >  	}
> >  }
> >  
> > @@ -343,25 +399,25 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
> >  }
> >  
> >  /**
> > - * Retrieve the correct read_pixel function for a specific format.
> > + * Retrieve the correct read_line function for a specific format.
> >   * If the format is not supported by VKMS a warn is emitted and a dummy "always read black"
> >   * function is returned.
> >   *
> >   * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
> >   */
> > -pixel_read_t get_pixel_read_function(u32 format)
> > +pixel_read_line_t get_pixel_read_line_function(u32 format)
> >  {
> >  	switch (format) {
> >  	case DRM_FORMAT_ARGB8888:
> > -		return &ARGB8888_to_argb_u16;
> > +		return &ARGB8888_read_line;
> >  	case DRM_FORMAT_XRGB8888:
> > -		return &XRGB8888_to_argb_u16;
> > +		return &XRGB8888_read_line;
> >  	case DRM_FORMAT_ARGB16161616:
> > -		return &ARGB16161616_to_argb_u16;
> > +		return &ARGB16161616_read_line;
> >  	case DRM_FORMAT_XRGB16161616:
> > -		return &XRGB16161616_to_argb_u16;
> > +		return &XRGB16161616_read_line;
> >  	case DRM_FORMAT_RGB565:
> > -		return &RGB565_to_argb_u16;
> > +		return &RGB565_read_line;
> >  	default:
> >  		/*
> >  		 * This is a bug in vkms_plane_atomic_check. All the supported
> > diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
> > index 3ecea4563254..8d2bef95ff79 100644
> > --- a/drivers/gpu/drm/vkms/vkms_formats.h
> > +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> > @@ -5,7 +5,7 @@
> >  
> >  #include "vkms_drv.h"
> >  
> > -pixel_read_t get_pixel_read_function(u32 format);
> > +pixel_read_line_t get_pixel_read_line_function(u32 format);
> >  
> >  pixel_write_t get_pixel_write_function(u32 format);
> >  
> > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> > index 10e9b23dab28..8875bed76410 100644
> > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > @@ -112,7 +112,6 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
> >  	frame_info = vkms_plane_state->frame_info;
> >  	memcpy(&frame_info->src, &new_state->src, sizeof(struct drm_rect));
> >  	memcpy(&frame_info->dst, &new_state->dst, sizeof(struct drm_rect));
> > -	memcpy(&frame_info->rotated, &new_state->dst, sizeof(struct drm_rect));
> >  	frame_info->fb = fb;
> >  	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
> >  	drm_framebuffer_get(frame_info->fb);
> > @@ -122,10 +121,8 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
> >  									  DRM_MODE_REFLECT_X |
> >  									  DRM_MODE_REFLECT_Y);
> >  
> > -	drm_rect_rotate(&frame_info->rotated, drm_rect_width(&frame_info->rotated),
> > -			drm_rect_height(&frame_info->rotated), frame_info->rotation);
> >  
> > -	vkms_plane_state->pixel_read = get_pixel_read_function(fmt);
> > +	vkms_plane_state->pixel_read_line = get_pixel_read_line_function(fmt);
> >  }
> >  
> >  static int vkms_plane_atomic_check(struct drm_plane *plane,
> > 
> 
> This is looking good enough that I can give an

Thanks for all your feedback !

> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

As I changed the code, I will not keep it in the commit.

Thanks,
Louis Chauvet

> Thanks,
> pq



-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
