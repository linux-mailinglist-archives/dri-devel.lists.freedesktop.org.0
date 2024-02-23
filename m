Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 063E58610C8
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 12:49:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B807410EBD4;
	Fri, 23 Feb 2024 11:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Bl0bQVmS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4221610EBD4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 11:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t89xrhHTUn5yY5JVZ/WdDVMS1poPqyAC61CApewS6SE=; b=Bl0bQVmS2+U+93biw/Z1op2Aad
 L7NPWt+Fsqwab96sqg7IL+JXUvV3Ifi0Hc21KhY2AjGPvnqMp0F9jn5de0kT2ccoetdoB+p1gxd7Y
 ZuqP1VP2U/Fap/4qqXEnxJXr93PY2+jmDd7Se3EVVAbvlTkKSokTouNe352rEka0JtRKOAQFsDsWB
 rO4KRDXpEUjGWJ4bmhQnzcgrabyEorQOfx0LShxG8L+bBvieC9rbI7GYRLt67auDdBCErMiSKVAWu
 qRFu2EsWZPMt/VQsj0I4oO3e87lRKBvjsxGsAoTroO0GDW1jC9FupqWicXHdNKN/8kdp3dKcdnu5t
 0tuMr2LQ==;
Received: from [177.34.169.255] (helo=[192.168.0.139])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rdU3L-002fDb-1b; Fri, 23 Feb 2024 12:49:19 +0100
Message-ID: <2b762879-8d39-4913-8131-8f081a113100@igalia.com>
Date: Fri, 23 Feb 2024 08:49:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] drm/vkms: Re-introduce line-per-line composition
 algorithm
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net,
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com
References: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
 <20240223-yuv-v2-5-aa6be2827bb7@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <20240223-yuv-v2-5-aa6be2827bb7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Louis,

On 2/23/24 08:37, Louis Chauvet wrote:
> Re-introduce a line-by-line composition algorithm for each pixel format.
> This allows more performance by not requiring an indirection per pixel
> read. This patch is focussed on readability of the code.

s/focussed/focused

> 
> Line-by-line composition was introduced by [1] but rewritten back to
> pixel-by-pixel algorithm in [2]. At this time, nobody noticed the impact
> on performance, and it was merged.
> 
> This patch is almost a revert of [2], but in addition efforts have been
> made to increase readability and maintenability of the rotation handling.

s/maintenability/maintainability

> The blend function is now divided in two parts:
> - Transformation of coordinates from the output referential to the source
> referential
> - Line conversion and blending
> 
> Most of the complexity of the rotation management is avoided by using
> drm_rect_* helpers. The remaning complexity is around the clipping, to

s/remaning/remaining

> avoid reading/writing oudside source/destination buffers.

s/oudside/outside

> 
> The pixel conversion is now done line-by-line, so the read_pixel_t was
> replaced with read_pixel_line_t callback. This way the indirection is only
> required once per line and per plane, instead of once per pixel and per
> plane.
> 
> The read_line_t callbacks are very similar for most pixel format, but it
> is required to avoid performance impact. Some helpers were created to
> avoid code repetition:
> - get_step_1x1: get the step in byte to reach next pixel block in a
>    certain direction
> - *_to_argb_u16: helpers to perform colors conversion. They should be
>    inlined by the compiler, and they are used to avoid repetition between
>    multiple variants of the same format (argb/xrgb and maybe in the
>    future for formats like bgr formats).
> 
> This new algorithm was tested with:
> - kms_plane (for color conversions)
> - kms_rotation_crc (for rotations of planes)
> - kms_cursor_crc (for translations of planes)
> The performance gain was mesured with:
> - kms_fb_stress
> 
> [1]: commit 8ba1648567e2 ("drm: vkms: Refactor the plane composer to accept
>       new formats")
>       https://lore.kernel.org/all/20220905190811.25024-7-igormtorrente@gmail.com/
> [2]: commit 322d716a3e8a ("drm/vkms: isolate pixel conversion
>       functionality")
>       https://lore.kernel.org/all/20230418130525.128733-2-mcanal@igalia.com/
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---

[...]

>   
> +enum pixel_read_direction {
> +	READ_UP,
> +	READ_DOWN,
> +	READ_LEFT,
> +	READ_RIGHT
> +};
> +
>   /**
> - * typedef pixel_read_t - These functions are used to read a pixel in the source frame,
> +<<<<<<< HEAD

This doesn't compile.

Best Regards,
- Maíra

> + * typedef pixel_read_line_t - These functions are used to read a pixel line in the source frame,
>    * convert it to `struct pixel_argb_u16` and write it to @out_pixel.
>    *
> - * @src_pixels: Pointer to the pixel to read
> - * @out_pixel: Pointer to write the converted pixel
> + * @frame_info: Frame used as source for the pixel value
> + * @y: Y (height) coordinate in the source buffer
> + * @x_start: X (width) coordinate of the first pixel to copy
> + * @x_end: X (width) coordinate of the last pixel to copy
> + * @out_pixel: Pointer where to write the pixel value. Pixels will be written between x_start and
> + *  x_end.
>    */
> -typedef void (*pixel_read_t)(u8 *src_pixels, struct pixel_argb_u16 *out_pixel);
> +typedef void (*pixel_read_line_t)(struct vkms_frame_info *frame_info, int x_start, int y_start, enum
> +	pixel_read_direction direction, int count, struct pixel_argb_u16 out_pixel[]);
>   
>   /**
>    * vkms_plane_state - Driver specific plane state
> @@ -88,7 +100,7 @@ typedef void (*pixel_read_t)(u8 *src_pixels, struct pixel_argb_u16 *out_pixel);
>   struct vkms_plane_state {
>   	struct drm_shadow_plane_state base;
>   	struct vkms_frame_info *frame_info;
> -	pixel_read_t pixel_read;
> +	pixel_read_line_t pixel_read_line;
>   };
>   
>   struct vkms_plane {
> @@ -193,7 +205,6 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
>   /* Composer Support */
>   void vkms_composer_worker(struct work_struct *work);
>   void vkms_set_composer(struct vkms_output *out, bool enabled);
> -void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y);
>   void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer *src_buffer, int y);
>   
>   /* Writeback */
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 1f5aeba57ad6..46daea6d3ee9 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -11,21 +11,29 @@
>   
>   /**
>    * packed_pixels_offset() - Get the offset of the block containing the pixel at coordinates x/y
> - * in the first plane
>    *
>    * @frame_info: Buffer metadata
>    * @x: The x coordinate of the wanted pixel in the buffer
>    * @y: The y coordinate of the wanted pixel in the buffer
> + * @plane_index: The index of the plane to use
>    *
>    * The caller must be aware that this offset is not always a pointer to a pixel. If individual
>    * pixel values are needed, they have to be extracted from the resulting block.
>    */
> -static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int y)
> +static size_t packed_pixels_offset(const struct vkms_frame_info *frame_info, int x, int y,
> +				   size_t plane_index)
>   {
>   	struct drm_framebuffer *fb = frame_info->fb;
> -
> -	return fb->offsets[0] + (y * fb->pitches[0])
> -			      + (x * fb->format->cpp[0]);
> +	const struct drm_format_info *format = frame_info->fb->format;
> +	/* Directly using x and y to multiply pitches and format->ccp is not sufficient because
> +	 * in some formats a block can represent multiple pixels.
> +	 *
> +	 * Dividing x and y by the block size allows to extract the correct offset of the block
> +	 * containing the pixel.
> +	 */
> +	return fb->offsets[plane_index] +
> +	       (y / drm_format_info_block_width(format, plane_index)) * fb->pitches[plane_index] +
> +	       (x / drm_format_info_block_height(format, plane_index)) * format->char_per_block[plane_index];
>   }
>   
>   /**
> @@ -35,44 +43,56 @@ static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int
>    * @frame_info: Buffer metadata
>    * @x: The x(width) coordinate inside the plane
>    * @y: The y(height) coordinate inside the plane
> + * @plane_index: The index of the plane
>    *
> - * Takes the information stored in the frame_info, a pair of coordinates, and
> - * returns the address of the first color channel.
> - * This function assumes the channels are packed together, i.e. a color channel
> - * comes immediately after another in the memory. And therefore, this function
> - * doesn't work for YUV with chroma subsampling (e.g. YUV420 and NV21).
> + * Takes the information stored in the frame_info, a pair of coordinates, and returns the address
> + * of the block containing this pixel.
> + * The caller must be aware that this pointer is sometimes not directly a pixel, it needs some
> + * additional work to extract pixel color from this block.
>    */
>   static void *packed_pixels_addr(const struct vkms_frame_info *frame_info,
> -				int x, int y)
> +				int x, int y, size_t plane_index)
>   {
> -	size_t offset = pixel_offset(frame_info, x, y);
> -
> -	return (u8 *)frame_info->map[0].vaddr + offset;
> +	return (u8 *)frame_info->map[0].vaddr + packed_pixels_offset(frame_info, x, y, plane_index);
>   }
>   
> -static void *get_packed_src_addr(const struct vkms_frame_info *frame_info, int y)
> +/**
> + * get_step_1x1() - Common helper to compute the correct step value between each pixel to read in a
> + * certain direction.
> + * This must be used only with format where blockh == blockw == 1.
> + * In the case when direction is not a valid pixel_read_direction, the returned step is 0, so you
> + * must not rely on this result to create a loop variant.
> + *
> + * @fb Framebuffer to iter on
> + * @direction Direction of the reading
> + */
> +static int get_step_1x1(struct drm_framebuffer *fb, enum pixel_read_direction direction,
> +			int plane_index)
>   {
> -	int x_src = frame_info->src.x1 >> 16;
> -	int y_src = y - frame_info->rotated.y1 + (frame_info->src.y1 >> 16);
> -
> -	return packed_pixels_addr(frame_info, x_src, y_src);
> +	switch (direction) {
> +	default:
> +		DRM_ERROR("Invalid direction for pixel reading: %d\n", direction);
> +		return 0;
> +	case READ_RIGHT:
> +		return fb->format->char_per_block[plane_index];
> +	case READ_LEFT:
> +		return -fb->format->char_per_block[plane_index];
> +	case READ_DOWN:
> +		return (int)fb->pitches[plane_index];
> +	case READ_UP:
> +		return -(int)fb->pitches[plane_index];
> +	}
>   }
>   
> -static int get_x_position(const struct vkms_frame_info *frame_info, int limit, int x)
> -{
> -	if (frame_info->rotation & (DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_270))
> -		return limit - x - 1;
> -	return x;
> -}
>   
>   /*
> - * The following  functions take pixel data from the buffer and convert them to the format
> + * The following  functions take pixel data (a, r, g, b, pixel, ...), convert them to the format
>    * ARGB16161616 in out_pixel.
>    *
> - * They are used in the `vkms_compose_row` function to handle multiple formats.
> + * They are used in the `read_line`s functions to avoid duplicate work for some pixel formats.
>    */
>   
> -static void ARGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
> +static void ARGB8888_to_argb_u16(struct pixel_argb_u16 *out_pixel, int a, int r, int g, int b)
>   {
>   	/*
>   	 * The 257 is the "conversion ratio". This number is obtained by the
> @@ -80,48 +100,26 @@ static void ARGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixe
>   	 * the best color value in a pixel format with more possibilities.
>   	 * A similar idea applies to others RGB color conversions.
>   	 */
> -	out_pixel->a = (u16)src_pixels[3] * 257;
> -	out_pixel->r = (u16)src_pixels[2] * 257;
> -	out_pixel->g = (u16)src_pixels[1] * 257;
> -	out_pixel->b = (u16)src_pixels[0] * 257;
> -}
> -
> -static void XRGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
> -{
> -	out_pixel->a = (u16)0xffff;
> -	out_pixel->r = (u16)src_pixels[2] * 257;
> -	out_pixel->g = (u16)src_pixels[1] * 257;
> -	out_pixel->b = (u16)src_pixels[0] * 257;
> +	out_pixel->a = (u16)a * 257;
> +	out_pixel->r = (u16)r * 257;
> +	out_pixel->g = (u16)g * 257;
> +	out_pixel->b = (u16)b * 257;
>   }
>   
> -static void ARGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
> +static void ARGB16161616_to_argb_u16(struct pixel_argb_u16 *out_pixel, int a, int r, int g, int b)
>   {
> -	u16 *pixels = (u16 *)src_pixels;
> -
> -	out_pixel->a = le16_to_cpu(pixels[3]);
> -	out_pixel->r = le16_to_cpu(pixels[2]);
> -	out_pixel->g = le16_to_cpu(pixels[1]);
> -	out_pixel->b = le16_to_cpu(pixels[0]);
> -}
> -
> -static void XRGB16161616_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
> -{
> -	u16 *pixels = (u16 *)src_pixels;
> -
> -	out_pixel->a = (u16)0xffff;
> -	out_pixel->r = le16_to_cpu(pixels[2]);
> -	out_pixel->g = le16_to_cpu(pixels[1]);
> -	out_pixel->b = le16_to_cpu(pixels[0]);
> +	out_pixel->a = le16_to_cpu(a);
> +	out_pixel->r = le16_to_cpu(r);
> +	out_pixel->g = le16_to_cpu(g);
> +	out_pixel->b = le16_to_cpu(b);
>   }
>   
> -static void RGB565_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
> +static void RGB565_to_argb_u16(struct pixel_argb_u16 *out_pixel, const u16 *pixel)
>   {
> -	u16 *pixels = (u16 *)src_pixels;
> -
>   	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
>   	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
>   
> -	u16 rgb_565 = le16_to_cpu(*pixels);
> +	u16 rgb_565 = le16_to_cpu(*pixel);
>   	s64 fp_r = drm_int2fixp((rgb_565 >> 11) & 0x1f);
>   	s64 fp_g = drm_int2fixp((rgb_565 >> 5) & 0x3f);
>   	s64 fp_b = drm_int2fixp(rgb_565 & 0x1f);
> @@ -132,34 +130,105 @@ static void RGB565_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
>   	out_pixel->b = drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
>   }
>   
> -/**
> - * vkms_compose_row - compose a single row of a plane
> - * @stage_buffer: output line with the composed pixels
> - * @plane: state of the plane that is being composed
> - * @y: y coordinate of the row
> +/*
> + * The following functions are read_line function for each pixel format supported by VKMS.
>    *
> - * This function composes a single row of a plane. It gets the source pixels
> - * through the y coordinate (see get_packed_src_addr()) and goes linearly
> - * through the source pixel, reading the pixels and converting it to
> - * ARGB16161616 (see the pixel_read() callback). For rotate-90 and rotate-270,
> - * the source pixels are not traversed linearly. The source pixels are queried
> - * on each iteration in order to traverse the pixels vertically.
> + * They read a line starting at the point @x_start,@y_start following the @direction. The result
> + * is stored in @out_pixel and in the format ARGB16161616.
> + *
> + * Those function are very similar, but it is required for performance reason. In the past, some
> + * experiment were done, and with a generic loop the performance are very reduced [1].
> + *
> + * [1]: https://lore.kernel.org/dri-devel/d258c8dc-78e9-4509-9037-a98f7f33b3a3@riseup.net/
>    */
> -void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y)
> +
> +static void ARGB8888_read_line(struct vkms_frame_info *frame_info, int x_start, int y_start,
> +			       enum pixel_read_direction direction, int count,
> +			       struct pixel_argb_u16 out_pixel[])
> +{
> +	u8 *src_pixels = packed_pixels_addr(frame_info, x_start, y_start, 0);
> +
> +	int step = get_step_1x1(frame_info->fb, direction, 0);
> +
> +	while (count) {
> +		u8 *px = (u8 *)src_pixels;
> +
> +		ARGB8888_to_argb_u16(out_pixel, px[3], px[2], px[1], px[0]);
> +		out_pixel += 1;
> +		src_pixels += step;
> +		count--;
> +	}
> +}
> +
> +static void XRGB8888_read_line(struct vkms_frame_info *frame_info, int x_start, int y_start,
> +			       enum pixel_read_direction direction, int count,
> +			       struct pixel_argb_u16 out_pixel[])
> +{
> +	u8 *src_pixels = packed_pixels_addr(frame_info, x_start, y_start, 0);
> +
> +	int step = get_step_1x1(frame_info->fb, direction, 0);
> +
> +	while (count) {
> +		u8 *px = (u8 *)src_pixels;
> +
> +		ARGB8888_to_argb_u16(out_pixel, 255, px[2], px[1], px[0]);
> +		out_pixel += 1;
> +		src_pixels += step;
> +		count--;
> +	}
> +}
> +
> +static void ARGB16161616_read_line(struct vkms_frame_info *frame_info, int x_start, int y_start,
> +				   enum pixel_read_direction direction, int count,
> +				   struct pixel_argb_u16 out_pixel[])
> +{
> +	u8 *src_pixels = packed_pixels_addr(frame_info, x_start, y_start, 0);
> +
> +	int step = get_step_1x1(frame_info->fb, direction, 0);
> +
> +	while (count) {
> +		u16 *px = (u16 *)src_pixels;
> +
> +		ARGB16161616_to_argb_u16(out_pixel, px[3], px[2], px[1], px[0]);
> +		out_pixel += 1;
> +		src_pixels += step;
> +		count--;
> +	}
> +}
> +
> +static void XRGB16161616_read_line(struct vkms_frame_info *frame_info, int x_start, int y_start,
> +				   enum pixel_read_direction direction, int count,
> +				   struct pixel_argb_u16 out_pixel[])
> +{
> +	u8 *src_pixels = packed_pixels_addr(frame_info, x_start, y_start, 0);
> +
> +	int step = get_step_1x1(frame_info->fb, direction, 0);
> +
> +	while (count) {
> +		u16 *px = (u16 *)src_pixels;
> +
> +		ARGB16161616_to_argb_u16(out_pixel, 0xFFFF, px[2], px[1], px[0]);
> +		out_pixel += 1;
> +		src_pixels += step;
> +		count--;
> +	}
> +}
> +
> +static void RGB565_read_line(struct vkms_frame_info *frame_info, int x_start, int y_start,
> +			     enum pixel_read_direction direction, int count,
> +			     struct pixel_argb_u16 out_pixel[])
>   {
> -	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
> -	struct vkms_frame_info *frame_info = plane->frame_info;
> -	u8 *src_pixels = get_packed_src_addr(frame_info, y);
> -	int limit = min_t(size_t, drm_rect_width(&frame_info->dst), stage_buffer->n_pixels);
> +	u8 *src_pixels = packed_pixels_addr(frame_info, x_start, y_start, 0);
>   
> -	for (size_t x = 0; x < limit; x++, src_pixels += frame_info->fb->format->cpp[0]) {
> -		int x_pos = get_x_position(frame_info, limit, x);
> +	int step = get_step_1x1(frame_info->fb, direction, 0);
>   
> -		if (drm_rotation_90_or_270(frame_info->rotation))
> -			src_pixels = get_packed_src_addr(frame_info, x + frame_info->rotated.y1)
> -				+ frame_info->fb->format->cpp[0] * y;
> +	while (count) {
> +		u16 *px = (u16 *)src_pixels;
>   
> -		plane->pixel_read(src_pixels, &out_pixels[x_pos]);
> +		RGB565_to_argb_u16(out_pixel, px);
> +		out_pixel += 1;
> +		src_pixels += step;
> +		count--;
>   	}
>   }
>   
> @@ -247,7 +316,7 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
>   {
>   	struct vkms_frame_info *frame_info = &wb->wb_frame_info;
>   	int x_dst = frame_info->dst.x1;
> -	u8 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
> +	u8 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y, 0);
>   	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
>   	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst), src_buffer->n_pixels);
>   
> @@ -256,27 +325,27 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
>   }
>   
>   /**
> - * Retrieve the correct read_pixel function for a specific format.
> + * Retrieve the correct read_line function for a specific format.
>    * The returned pointer is NULL for unsupported pixel formats. The caller must ensure that the
>    * pointer is valid before using it in a vkms_plane_state.
>    *
>    * @format: 4cc of the format
>    */
> -pixel_read_t get_pixel_read_function(u32 format)
> +pixel_read_line_t get_pixel_read_line_function(u32 format)
>   {
>   	switch (format) {
>   	case DRM_FORMAT_ARGB8888:
> -		return &ARGB8888_to_argb_u16;
> +		return &ARGB8888_read_line;
>   	case DRM_FORMAT_XRGB8888:
> -		return &XRGB8888_to_argb_u16;
> +		return &XRGB8888_read_line;
>   	case DRM_FORMAT_ARGB16161616:
> -		return &ARGB16161616_to_argb_u16;
> +		return &ARGB16161616_read_line;
>   	case DRM_FORMAT_XRGB16161616:
> -		return &XRGB16161616_to_argb_u16;
> +		return &XRGB16161616_read_line;
>   	case DRM_FORMAT_RGB565:
> -		return &RGB565_to_argb_u16;
> +		return &RGB565_read_line;
>   	default:
> -		return (pixel_read_t)NULL;
> +		return (pixel_read_line_t)NULL;
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
> index 3ecea4563254..8d2bef95ff79 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.h
> +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> @@ -5,7 +5,7 @@
>   
>   #include "vkms_drv.h"
>   
> -pixel_read_t get_pixel_read_function(u32 format);
> +pixel_read_line_t get_pixel_read_line_function(u32 format);
>   
>   pixel_write_t get_pixel_write_function(u32 format);
>   
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index f68b1b03d632..58c1c74742b5 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -106,9 +106,9 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
>   		return;
>   
>   	fmt = fb->format->format;
> -	pixel_read_t pixel_read = get_pixel_read_function(fmt);
> +	pixel_read_line_t pixel_read_line = get_pixel_read_line_function(fmt);
>   
> -	if (!pixel_read) {
> +	if (!pixel_read_line) {
>   		DRM_WARN("Pixel format is not supported by VKMS planes. State is inchanged\n");
>   		return;
>   	}
> @@ -128,10 +128,8 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
>   									  DRM_MODE_REFLECT_X |
>   									  DRM_MODE_REFLECT_Y);
>   
> -	drm_rect_rotate(&frame_info->rotated, drm_rect_width(&frame_info->rotated),
> -			drm_rect_height(&frame_info->rotated), frame_info->rotation);
>   
> -	vkms_plane_state->pixel_read = pixel_read;
> +	vkms_plane_state->pixel_read_line = pixel_read_line;
>   }
>   
>   static int vkms_plane_atomic_check(struct drm_plane *plane,
> 
