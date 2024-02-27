Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 064F48699A3
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 16:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3EB10E594;
	Tue, 27 Feb 2024 15:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="diNZSy5K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 386C010E8A6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 15:02:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9EBC1C000D;
 Tue, 27 Feb 2024 15:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709046132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cSPIgy5ZLAAph4I+ucMZFPlBwAOTdwPUUj4AQgnmTI0=;
 b=diNZSy5KjtViPMLnJqwpqtE3cZI7sHCKibOLBjKyMkuO8Bu1cUn+xg1mygjgwlBm/FNtDS
 hGXQzdBuWOZARW7u93DDDY/xqmqiryXMZ52ZRFZaCoGsNRpbwpKSQaqEob4c7iHAbNKxmI
 7/zxehU79WF0y6vGRO+arBiObqymtifcKpXFlcudKv3LMODALlO55M+3671D+OEKcUER98
 fl2weKGsDTUTlkoTpZYAZ2mBT9CwPyIkiKDJ/ZNldzdZRxFdYKgPjPweUpRRm3+Hzv9FIK
 13y2PV0dgFZfsHKSeSPIPNp8RuuiAsU5KRfiT0qNW4TRK/oRpcxEdvVC8mcE+g==
Date: Tue, 27 Feb 2024 16:02:09 +0100
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
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH v2 5/9] drm/vkms: Re-introduce line-per-line composition
 algorithm
Message-ID: <Zd35cY6uxP7akjw8@localhost.localdomain>
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
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com
References: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
 <20240223-yuv-v2-5-aa6be2827bb7@bootlin.com>
 <20240226133706.281deb59.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226133706.281deb59.pekka.paalanen@collabora.com>
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
> 
> Input buffers and pointers should be const.

They will be const in v4.
 
> > +
> > +	for (int i = 0; i < pixel_count; i++) {
> > +		out[i].a = (u16)0xffff;
> > +		out[i].r = pre_mul_blend_channel(in[i].r, out[i].r, in[i].a);
> > +		out[i].g = pre_mul_blend_channel(in[i].g, out[i].g, in[i].a);
> > +		out[i].b = pre_mul_blend_channel(in[i].b, out[i].b, in[i].a);
> >  	}
> >  }
> 
> Somehow the hunk above does not feel like it is part of "re-introduce
> line-per-line composition algorithm". This function was already running
> line-by-line. Would it be easy enough to collect this and directly
> related changes into a separate patch?

It is not directly related to the reintroduction of line-by-line 
algorithm, but in the simplification and maintenability effort, I 
changed a bit the function to avoid having multiple place computing the 
x_start/pixel_count values. I don't see an interrest to extract it, it 
will be just a translation of the few lines into the calling place.

[...]

> > +/**
> > + * direction_for_rotation() - Helper to get the correct reading direction for a specific rotation
> > + *
> > + * @rotation: rotation to analyze
> 
> This is KMS plane rotation property, right?
> 
> So the KMS plane has been rotated by this, and what we want to find is
> the read direction on the attached FB so that reading returns pixels in
> the CRTC line/scanout order, right?
> 
> Maybe extend the doc to explain that.

Is it better?

 * direction_for_rotation() - Get the correct reading direction for a given rotation
 *
 * This function will use the @rotation parameter to compute the correct reading direction to read
 * a line from the source buffer.
 * For example, if the buffer is reflected on X axis, the pixel must be read from right to left.
 * @rotation: Rotation to analyze. It correspond the the field @frame_info.rotation.

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
> 
> Wonder why these were size_t, causing needs to cast below...

For crtc_x_limit I just copied the crtc_y_limit. I will change both to u16 
(the type of h/vdisplay).

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
> > +			 * destination framebuffer, and then drm_rect_* helpers are used to
> > +			 * compute the correct position into the source framebuffer.
> > +			 */
> > +			struct drm_rect src_px = DRM_RECT_INIT(
> > +				current_plane->frame_info->dst.x1, y,
> > +				drm_rect_width(&current_plane->frame_info->dst), 1);
> > +			struct drm_rect tmp_src;
> > +
> > +			drm_rect_fp_to_int(&tmp_src, &current_plane->frame_info->src);
> > +
> > +			/*
> > +			 * [1]: Clamping src_px to the crtc_x_limit to avoid writing outside of the
> > +			 * destination buffer
> > +			 */
> > +			src_px.x2 = min_t(int, src_px.x2, (int)crtc_x_limit);
> 
> Up to and including this point, it would be better if src_px was called
> dst_px, because only the below computation converts it into actual
> src_px.

I agree, it will be changed for the v4. I will also change the name to 
`dst_line` and `src_line`.
 
> > +
> > +			/*
> > +			 * Transform the coordinate x/y from the crtc to coordinates into
> > +			 * coordinates for the src buffer.
> > +			 *
> > +			 * - Cancel the offset of the dst buffer.
> > +			 * - Invert the rotation. This assumes that
> > +			 *   dst = drm_rect_rotate(src, rotation) (dst and src have the
> > +			 *   same size, but can be rotated).
> > +			 * - Apply the offset of the source rectangle to the coordinate.
> > +			 */
> > +			drm_rect_translate(&src_px, -current_plane->frame_info->dst.x1,
> > +					   -current_plane->frame_info->dst.y1);
> > +			drm_rect_rotate_inv(&src_px,
> > +					    drm_rect_width(&tmp_src),
> > +					    drm_rect_height(&tmp_src),
> > +					    current_plane->frame_info->rotation);
> > +			drm_rect_translate(&src_px, tmp_src.x1, tmp_src.y1);
> > +
> > +			/* Get the correct reading direction in the source buffer. */
> > +
> > +			enum pixel_read_direction direction =
> > +				direction_for_rotation(current_plane->frame_info->rotation);
> > +
> > +			int x_start = src_px.x1;
> > +			int y_start = src_px.y1;
> > +			int pixel_count;
> > +			/* [2]: Compute and clamp the number of pixel to read */
> > +			if (direction == READ_RIGHT || direction == READ_LEFT) {
> > +				/*
> > +				 * In horizontal reading, the src_px width is the number of pixel to
> > +				 * read
> > +				 */
> > +				pixel_count = drm_rect_width(&src_px);
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
> > +				 * In vertical reading, the src_px height is the number of pixel to
> > +				 * read
> > +				 */
> > +				pixel_count = drm_rect_height(&src_px);
> > +				if (y_start < 0) {
> > +					pixel_count += y_start;
> > +					y_start = 0;
> > +				}
> > +				if (y_start + pixel_count > current_plane->frame_info->fb->height) {
> > +					pixel_count =
> > +						(int)current_plane->frame_info->fb->width - y_start;
> > +				}
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
> > +			 * src_px is the top-left corner, so when reading READ_LEFT or READ_TOP, it
> > +			 * must be changed to the top-right/bottom-left corner.
> > +			 */
> > +			if (direction == READ_LEFT) {
> > +				// x_start is now the right point
> > +				x_start += pixel_count - 1;
> > +			} else if (direction == READ_UP) {
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
> > +				current_plane->frame_info,
> > +				x_start,
> > +				y_start,
> > +				direction,
> > +				pixel_count,
> > +				&stage_buffer->pixels[current_plane->frame_info->dst.x1]);
> > +
> > +			pre_mul_alpha_blend(stage_buffer, output_buffer,
> > +					    current_plane->frame_info->dst.x1,
> > +					    pixel_count);
> >  		}
> 
> I stared at the above algorithm for a while, and I couldn't find
> anything obviously wrong, so good work.

Thinks for your review, I spend a lot of time writing this and thinking to 
all the edge cases.

One thing I forgot is to clamp dst.x1 of the destination buffer. It will 
be fixed in my v4.

[...]

> > +enum pixel_read_direction {
> > +	READ_UP,
> > +	READ_DOWN,
> > +	READ_LEFT,
> > +	READ_RIGHT
> 
> When I saw these in code, I got a little confused. Does READ_LEFT mean
> read towards left, or read starting from left? It's very common to
> express reading directions as left-to-right and right-to-left rather
> than "left arrow".
> 
> There are many choices how to improve this, e.g. upward, leftward,
> right-to-left, positive-x, negative-y.

I will change it to: READ_LEFT_TO_RIGHT, READ_RIGHT_TO_LEFT, ...

> > +};
> > +
> >  /**
> > - * typedef pixel_read_t - These functions are used to read a pixel in the source frame,
> > +<<<<<<< HEAD
> > + * typedef pixel_read_line_t - These functions are used to read a pixel line in the source frame,
> >   * convert it to `struct pixel_argb_u16` and write it to @out_pixel.
> >   *
> > - * @src_pixels: Pointer to the pixel to read
> > - * @out_pixel: Pointer to write the converted pixel
> > + * @frame_info: Frame used as source for the pixel value
> > + * @y: Y (height) coordinate in the source buffer
> > + * @x_start: X (width) coordinate of the first pixel to copy
> > + * @x_end: X (width) coordinate of the last pixel to copy
> > + * @out_pixel: Pointer where to write the pixel value. Pixels will be written between x_start and
> > + *  x_end.
> >   */
> > -typedef void (*pixel_read_t)(u8 *src_pixels, struct pixel_argb_u16 *out_pixel);
> > +typedef void (*pixel_read_line_t)(struct vkms_frame_info *frame_info, int x_start, int y_start, enum
> 
> const frame_info I presume.

I agree.

> > +	pixel_read_direction direction, int count, struct pixel_argb_u16 out_pixel[]);
> >  
> >  /**
> >   * vkms_plane_state - Driver specific plane state
> > @@ -88,7 +100,7 @@ typedef void (*pixel_read_t)(u8 *src_pixels, struct pixel_argb_u16 *out_pixel);
> >  struct vkms_plane_state {
> >  	struct drm_shadow_plane_state base;
> >  	struct vkms_frame_info *frame_info;
> > -	pixel_read_t pixel_read;
> > +	pixel_read_line_t pixel_read_line;
> >  };
> >  
> >  struct vkms_plane {
> > @@ -193,7 +205,6 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
> >  /* Composer Support */
> >  void vkms_composer_worker(struct work_struct *work);
> >  void vkms_set_composer(struct vkms_output *out, bool enabled);
> > -void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y);
> >  void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer *src_buffer, int y);
> >  
> >  /* Writeback */
> > diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> > index 1f5aeba57ad6..46daea6d3ee9 100644
> > --- a/drivers/gpu/drm/vkms/vkms_formats.c
> > +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> > @@ -11,21 +11,29 @@
> >  
> >  /**
> >   * packed_pixels_offset() - Get the offset of the block containing the pixel at coordinates x/y
> > - * in the first plane
> >   *
> >   * @frame_info: Buffer metadata
> >   * @x: The x coordinate of the wanted pixel in the buffer
> >   * @y: The y coordinate of the wanted pixel in the buffer
> > + * @plane_index: The index of the plane to use
> >   *
> >   * The caller must be aware that this offset is not always a pointer to a pixel. If individual
> >   * pixel values are needed, they have to be extracted from the resulting block.
> >   */
> > -static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int y)
> > +static size_t packed_pixels_offset(const struct vkms_frame_info *frame_info, int x, int y,
> > +				   size_t plane_index)
> >  {
> >  	struct drm_framebuffer *fb = frame_info->fb;
> > -
> > -	return fb->offsets[0] + (y * fb->pitches[0])
> > -			      + (x * fb->format->cpp[0]);
> > +	const struct drm_format_info *format = frame_info->fb->format;
> > +	/* Directly using x and y to multiply pitches and format->ccp is not sufficient because
> > +	 * in some formats a block can represent multiple pixels.
> > +	 *
> > +	 * Dividing x and y by the block size allows to extract the correct offset of the block
> > +	 * containing the pixel.
> > +	 */
> > +	return fb->offsets[plane_index] +
> > +	       (y / drm_format_info_block_width(format, plane_index)) * fb->pitches[plane_index] +
> > +	       (x / drm_format_info_block_height(format, plane_index)) * format->char_per_block[plane_index];
> 
> These changes do not seem like they belong with "re-introduce
> line-per-line composition algorithm" but some other patch.

I will extract this change and the next change in an other commit: 
"drm/vkms: Update pixel accessors to support packed pixel formats and 
multi-plane"

> >  }
> >  
> >  /**
> > @@ -35,44 +43,56 @@ static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int
> >   * @frame_info: Buffer metadata
> >   * @x: The x(width) coordinate inside the plane
> >   * @y: The y(height) coordinate inside the plane
> > + * @plane_index: The index of the plane
> >   *
> > - * Takes the information stored in the frame_info, a pair of coordinates, and
> > - * returns the address of the first color channel.
> > - * This function assumes the channels are packed together, i.e. a color channel
> > - * comes immediately after another in the memory. And therefore, this function
> > - * doesn't work for YUV with chroma subsampling (e.g. YUV420 and NV21).
> > + * Takes the information stored in the frame_info, a pair of coordinates, and returns the address
> > + * of the block containing this pixel.
> > + * The caller must be aware that this pointer is sometimes not directly a pixel, it needs some
> > + * additional work to extract pixel color from this block.
> >   */
> >  static void *packed_pixels_addr(const struct vkms_frame_info *frame_info,
> > -				int x, int y)
> > +				int x, int y, size_t plane_index)
> >  {
> > -	size_t offset = pixel_offset(frame_info, x, y);
> > -
> > -	return (u8 *)frame_info->map[0].vaddr + offset;
> > +	return (u8 *)frame_info->map[0].vaddr + packed_pixels_offset(frame_info, x, y, plane_index);
> 
> This too.

It will be in the same commit as above.

> >  }
> >  
> > -static void *get_packed_src_addr(const struct vkms_frame_info *frame_info, int y)
> > +/**
> > + * get_step_1x1() - Common helper to compute the correct step value between each pixel to read in a
> > + * certain direction.
> > + * This must be used only with format where blockh == blockw == 1.
> > + * In the case when direction is not a valid pixel_read_direction, the returned step is 0, so you
> > + * must not rely on this result to create a loop variant.
> > + *
> > + * @fb Framebuffer to iter on
> > + * @direction Direction of the reading
> > + */
> > +static int get_step_1x1(struct drm_framebuffer *fb, enum pixel_read_direction direction,
> > +			int plane_index)
> >  {
> > -	int x_src = frame_info->src.x1 >> 16;
> > -	int y_src = y - frame_info->rotated.y1 + (frame_info->src.y1 >> 16);
> > -
> > -	return packed_pixels_addr(frame_info, x_src, y_src);
> > +	switch (direction) {
> > +	default:
> > +		DRM_ERROR("Invalid direction for pixel reading: %d\n", direction);
> > +		return 0;
> 
> What I'd do here is move the default: section outside of the switch
> completely. Then the compiler can warn if any enum value is not handled
> here. Since every case in the switch is a return statement, falling out
> of the switch block is the default case.

Hoo, I did not know that gcc can warn when using enums, I will definitly 
do it for the v4.
 
> Maybe the enum variable containing an illegal value could be handled
> more harshly so that callers could rely on this function always
> returning a good value?
> 
> Just like passing in fb=NULL is handled by the kernel as an OOPS.

I don't think it's a good idea to OOPS inside a driver. An error here is 
maybe dangerous, but is not fatal to the kernel. Maybe you know how to do 
a "local" OOPS to break only this driver and not the whole kernel?

For the v4 I will keep a DRM_ERROR and return 0.

> > +	case READ_RIGHT:
> > +		return fb->format->char_per_block[plane_index];
> > +	case READ_LEFT:
> > +		return -fb->format->char_per_block[plane_index];
> > +	case READ_DOWN:
> > +		return (int)fb->pitches[plane_index];
> > +	case READ_UP:
> > +		return -(int)fb->pitches[plane_index];
> > +	}
> >  }
> >  
> > -static int get_x_position(const struct vkms_frame_info *frame_info, int limit, int x)
> > -{
> > -	if (frame_info->rotation & (DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_270))
> > -		return limit - x - 1;
> > -	return x;
> > -}
> >  
> >  /*
> > - * The following  functions take pixel data from the buffer and convert them to the format
> > + * The following  functions take pixel data (a, r, g, b, pixel, ...), convert them to the format
> >   * ARGB16161616 in out_pixel.
> >   *
> > - * They are used in the `vkms_compose_row` function to handle multiple formats.
> > + * They are used in the `read_line`s functions to avoid duplicate work for some pixel formats.
> >   */
> >  
> > -static void ARGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
> > +static void ARGB8888_to_argb_u16(struct pixel_argb_u16 *out_pixel, int a, int r, int g, int b)
> 
> The function name ARGB8888_to_argb_u16() is confusing. It's not taking
> in ARGB8888 pixels but separate a,r,g,b ints. The only assumption it
> needs from the pixel format is the 8888 part.

I don't realy know how to name it. What I like with ARGB8888 is that it's 
clear that the values are 8 bits and in argb format.
Do you think that `argb_u8_to_argb_u16`, with a new structure 
pixel_argb_u8 will be better? (like PATCH 6/9 with pixel_yuv_u8).

If so, I will introduce the argb_u8 structure in an other commit.

[...]

> > + * The following functions are read_line function for each pixel format supported by VKMS.
> >   *
> > - * This function composes a single row of a plane. It gets the source pixels
> > - * through the y coordinate (see get_packed_src_addr()) and goes linearly
> > - * through the source pixel, reading the pixels and converting it to
> > - * ARGB16161616 (see the pixel_read() callback). For rotate-90 and rotate-270,
> > - * the source pixels are not traversed linearly. The source pixels are queried
> > - * on each iteration in order to traverse the pixels vertically.
> > + * They read a line starting at the point @x_start,@y_start following the @direction. The result
> > + * is stored in @out_pixel and in the format ARGB16161616.
> > + *
> > + * Those function are very similar, but it is required for performance reason. In the past, some
> > + * experiment were done, and with a generic loop the performance are very reduced [1].
> > + *
> > + * [1]: https://lore.kernel.org/dri-devel/d258c8dc-78e9-4509-9037-a98f7f33b3a3@riseup.net/
> >   */
> > -void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y)
> > +
> > +static void ARGB8888_read_line(struct vkms_frame_info *frame_info, int x_start, int y_start,
> > +			       enum pixel_read_direction direction, int count,
> > +			       struct pixel_argb_u16 out_pixel[])
> > +{
> > +	u8 *src_pixels = packed_pixels_addr(frame_info, x_start, y_start, 0);
> > +
> > +	int step = get_step_1x1(frame_info->fb, direction, 0);
> > +
> > +	while (count) {
> > +		u8 *px = (u8 *)src_pixels;
> > +
> > +		ARGB8888_to_argb_u16(out_pixel, px[3], px[2], px[1], px[0]);
> > +		out_pixel += 1;
> > +		src_pixels += step;
> > +		count--;
> 
> btw. you could eliminate decrementing 'count' if you computed end
> address and used while (out_pixel < end).

Yes, you are right, but after thinking about it, neither out_pixel < end 
and while (count) are conveying "this loop will copy `count` pixels. I 
think a for-loop here is more understandable. There is no ambiguity in the 
number of pixels written and less error-prone. I will replace
	while (count) 
by
	for(int i = 0; i < count; i++)

Kind regards,
Louis Chauvet

[...]

--
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
