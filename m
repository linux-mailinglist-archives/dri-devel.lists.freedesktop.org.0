Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6109B1894
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 16:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4CF10E2E7;
	Sat, 26 Oct 2024 14:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="PUM6U32j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2C810E2E7
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2024 14:26:36 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4XbMQy5YVzzDrPM;
 Sat, 26 Oct 2024 14:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1729952795; bh=7Kxf3i70mYQtX3kUtNQujwBLI/mXwPQZyjOE9+z3G20=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PUM6U32jG2CSg4+yzJSDVZpPFypWtsWIKKz9y9U/GtP4XlK2PYQQ2hNJXcdCGPxeW
 k2/eqd2EkMT2vRh6B9iP3pX80uS69Q+rlaTzsmQmMFQeQtthTHezkEEWn1aPdYfPzt
 4kBOd5A4ME9aSIO7W9ijaZut+W+/IhMZ4rSo0PIo=
X-Riseup-User-ID: 0E6D8FD7F76131DD1683777247B69959D5EF5220458AAF725EFF97E32529A68E
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4XbMQp66VnzJsFN;
 Sat, 26 Oct 2024 14:26:26 +0000 (UTC)
Message-ID: <be1a9147-efbd-4c98-a0a4-7cf5a730fc70@riseup.net>
Date: Sat, 26 Oct 2024 11:26:24 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v12 08/15] drm/vkms: Re-introduce line-per-line
 composition algorithm
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Simona Vetter <simona@ffwll.ch>, rdunlap@infradead.org,
 arthurgrillo@riseup.net, pekka.paalanen@haloniitty.fi,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20241007-yuv-v12-0-01c1ada6fec8@bootlin.com>
 <20241007-yuv-v12-8-01c1ada6fec8@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20241007-yuv-v12-8-01c1ada6fec8@bootlin.com>
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

On 07/10/24 13:10, Louis Chauvet wrote:
> Re-introduce a line-by-line composition algorithm for each pixel format.
> This allows more performance by not requiring an indirection per pixel
> read. This patch is focused on readability of the code.
> 
> Line-by-line composition was introduced by [1] but rewritten back to
> pixel-by-pixel algorithm in [2]. At this time, nobody noticed the impact
> on performance, and it was merged.
> 
> This patch is almost a revert of [2], but in addition efforts have been
> made to increase readability and maintainability of the rotation handling.
> The blend function is now divided in two parts:
> - Transformation of coordinates from the output referential to the source
> referential
> - Line conversion and blending
> 
> Most of the complexity of the rotation management is avoided by using
> drm_rect_* helpers. The remaining complexity is around the clipping, to
> avoid reading/writing outside source/destination buffers.
> 
> The pixel conversion is now done line-by-line, so the read_pixel_t was
> replaced with read_pixel_line_t callback. This way the indirection is only
> required once per line and per plane, instead of once per pixel and per
> plane.
> 
> The read_line_t callbacks are very similar for most pixel format, but it
> is required to avoid performance impact. Some helpers for color
> conversion were introduced to avoid code repetition:
> - *_to_argb_u16: perform colors conversion. They should be inlined by the
>    compiler, and they are used to avoid repetition between multiple variants
>    of the same format (argb/xrgb and maybe in the future for formats like
>    bgr formats).
> 
> This new algorithm was tested with:
> - kms_plane (for color conversions)
> - kms_rotation_crc (for rotations of planes)
> - kms_cursor_crc (for translations of planes)
> - kms_rotation (for all rotations and formats combinations) [3]
> The performance gain was mesured with kms_fb_stress [4] with some
> modification to fix the writeback format.
> 
> The performance improvement is around 5 to 10%.
> 
> [1]: commit 8ba1648567e2 ("drm: vkms: Refactor the plane composer to accept
>       new formats")
>       https://lore.kernel.org/all/20220905190811.25024-7-igormtorrente@gmail.com/
> [2]: commit 322d716a3e8a ("drm/vkms: isolate pixel conversion
>       functionality")
>       https://lore.kernel.org/all/20230418130525.128733-2-mcanal@igalia.com/
> [3]: https://lore.kernel.org/igt-dev/20240313-new_rotation-v2-0-6230fd5cae59@bootlin.com/
> [4]: https://lore.kernel.org/all/20240422-kms_fb_stress-dev-v5-0-0c577163dc88@riseup.net/
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> 
> # Conflicts:
> #	drivers/gpu/drm/vkms/vkms_composer.c
> ---
>   drivers/gpu/drm/vkms/vkms_composer.c | 234 ++++++++++++++++++++++++++++-------
>   drivers/gpu/drm/vkms/vkms_drv.h      |  28 +++--
>   drivers/gpu/drm/vkms/vkms_formats.c  | 224 ++++++++++++++++++++-------------
>   drivers/gpu/drm/vkms/vkms_formats.h  |   2 +-
>   drivers/gpu/drm/vkms/vkms_plane.c    |   5 +-
>   5 files changed, 344 insertions(+), 149 deletions(-)
> 

[...]

>   
> -static void RGB565_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
> +static struct pixel_argb_u16 argb_u16_from_RGB565(const __le16 *pixel)
>   {
> -	__le16 *pixel = (__le16 *)in_pixel;
> +	struct pixel_argb_u16 out_pixel;
>   
>   	s64 fp_rb_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(31));
>   	s64 fp_g_ratio = drm_fixp_div(drm_int2fixp(65535), drm_int2fixp(63));
> @@ -226,40 +194,120 @@ static void RGB565_to_argb_u16(const u8 *in_pixel, struct pixel_argb_u16 *out_pi
>   	s64 fp_g = drm_int2fixp((rgb_565 >> 5) & 0x3f);
>   	s64 fp_b = drm_int2fixp(rgb_565 & 0x1f);
>   
> -	out_pixel->a = (u16)0xffff;
> -	out_pixel->r = drm_fixp2int_round(drm_fixp_mul(fp_r, fp_rb_ratio));
> -	out_pixel->g = drm_fixp2int_round(drm_fixp_mul(fp_g, fp_g_ratio));
> -	out_pixel->b = drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
> +	out_pixel.a = (u16)0xffff;
> +	out_pixel.r = drm_fixp2int_round(drm_fixp_mul(fp_r, fp_rb_ratio));
> +	out_pixel.g = drm_fixp2int_round(drm_fixp_mul(fp_g, fp_g_ratio));
> +	out_pixel.b = drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
> +
> +	return out_pixel;
>   }
>   
> -/**
> - * vkms_compose_row - compose a single row of a plane
> - * @stage_buffer: output line with the composed pixels
> - * @plane: state of the plane that is being composed
> - * @y: y coordinate of the row
> +/*
> + * The following functions are read_line function for each pixel format supported by VKMS.
> + *
> + * They read a line starting at the point @x_start,@y_start following the @direction. The result
> + * is stored in @out_pixel and in the format ARGB16161616.
> + *
> + * These functions are very repetitive, but the innermost pixel loops must be kept inside these
> + * functions for performance reasons. Some benchmarking was done in [1] where having the innermost
> + * loop factored out of these functions showed a slowdown by a factor of three.
>    *
> - * This function composes a single row of a plane. It gets the source pixels
> - * through the y coordinate (see get_packed_src_addr()) and goes linearly
> - * through the source pixel, reading the pixels and converting it to
> - * ARGB16161616 (see the pixel_read() callback). For rotate-90 and rotate-270,
> - * the source pixels are not traversed linearly. The source pixels are queried
> - * on each iteration in order to traverse the pixels vertically.
> + * [1]: https://lore.kernel.org/dri-devel/d258c8dc-78e9-4509-9037-a98f7f33b3a3@riseup.net/
>    */
> -void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y)
> +
> +static void ARGB8888_read_line(const struct vkms_plane_state *plane, int x_start, int y_start,
> +			       enum pixel_read_direction direction, int count,
> +			       struct pixel_argb_u16 out_pixel[])
>   {
> -	struct pixel_argb_u16 *out_pixels = stage_buffer->pixels;
> -	struct vkms_frame_info *frame_info = plane->frame_info;
> -	u8 *src_pixels = get_packed_src_addr(frame_info, y, 0);
> -	int limit = min_t(size_t, drm_rect_width(&frame_info->dst), stage_buffer->n_pixels);
> +	struct pixel_argb_u16 *end = out_pixel + count;
> +	u8 *src_pixels;
> +
> +	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
> +
> +	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
> +
> +	while (out_pixel < end) {
> +		u8 *px = (u8 *)src_pixels;

Why are you converting u8* to u8*? There are repetitions of this pattern
in this patch.

> +		*out_pixel = argb_u16_from_u8888(px[3], px[2], px[1], px[0]);
> +		out_pixel += 1;
> +		src_pixels += step;
> +	}
> +}
> +
> +static void XRGB8888_read_line(const struct vkms_plane_state *plane, int x_start, int y_start,
> +			       enum pixel_read_direction direction, int count,
> +			       struct pixel_argb_u16 out_pixel[])
> +{
> +	struct pixel_argb_u16 *end = out_pixel + count;
> +	u8 *src_pixels;
> +
> +	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
> +
> +	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
> +
> +	while (out_pixel < end) {
> +		u8 *px = (u8 *)src_pixels;
> +		*out_pixel = argb_u16_from_u8888(255, px[2], px[1], px[0]);
> +		out_pixel += 1;
> +		src_pixels += step;
> +	}
> +}
> +
> +static void ARGB16161616_read_line(const struct vkms_plane_state *plane, int x_start,
> +				   int y_start, enum pixel_read_direction direction, int count,
> +				   struct pixel_argb_u16 out_pixel[])
> +{
> +	struct pixel_argb_u16 *end = out_pixel + count;
> +	u8 *src_pixels;
> +
> +	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
> +
> +	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
> +
> +	while (out_pixel < end) {
> +		u16 *px = (u16 *)src_pixels;
> +		*out_pixel = argb_u16_from_u16161616(px[3], px[2], px[1], px[0]);
> +		out_pixel += 1;
> +		src_pixels += step;
> +	}
> +}
> +
> +static void XRGB16161616_read_line(const struct vkms_plane_state *plane, int x_start,
> +				   int y_start, enum pixel_read_direction direction, int count,
> +				   struct pixel_argb_u16 out_pixel[])
> +{
> +	struct pixel_argb_u16 *end = out_pixel + count;
> +	u8 *src_pixels;
> +
> +	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
> +
> +	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
> +
> +	while (out_pixel < end) {
> +		__le16 *px = (__le16 *)src_pixels;
> +		*out_pixel = argb_u16_from_le16161616(cpu_to_le16(0xFFFF), px[2], px[1], px[0]);
> +		out_pixel += 1;
> +		src_pixels += step;
> +	}
> +}
> +
> +static void RGB565_read_line(const struct vkms_plane_state *plane, int x_start,
> +			     int y_start, enum pixel_read_direction direction, int count,
> +			     struct pixel_argb_u16 out_pixel[])
> +{
> +	struct pixel_argb_u16 *end = out_pixel + count;
> +	u8 *src_pixels;
> +
> +	packed_pixels_addr_1x1(plane->frame_info, x_start, y_start, 0, &src_pixels);
>   
> -	for (size_t x = 0; x < limit; x++, src_pixels += frame_info->fb->format->cpp[0]) {
> -		int x_pos = get_x_position(frame_info, limit, x);
> +	int step = get_block_step_bytes(plane->frame_info->fb, direction, 0);
>   
> -		if (drm_rotation_90_or_270(frame_info->rotation))
> -			src_pixels = get_packed_src_addr(frame_info, x + frame_info->rotated.y1, 0)
> -				+ frame_info->fb->format->cpp[0] * y;
> +	while (out_pixel < end) {
> +		__le16 *px = (__le16 *)src_pixels;
>   
> -		plane->pixel_read(src_pixels, &out_pixels[x_pos]);
> +		*out_pixel = argb_u16_from_RGB565(px);
> +		out_pixel += 1;
> +		src_pixels += step;
>   	}
>   }
>   
> @@ -359,25 +407,25 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
>   }
>   
>   /**
> - * get_pixel_read_function() - Retrieve the correct read_pixel function for a specific
> + * get_pixel_read_line_function() - Retrieve the correct read_line function for a specific
>    * format. The returned pointer is NULL for unsupported pixel formats. The caller must ensure that
>    * the pointer is valid before using it in a vkms_plane_state.
>    *
>    * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
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
>   		/*
>   		 * This is a bug in vkms_plane_atomic_check(). All the supported
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
> index 10e9b23dab28..8875bed76410 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -112,7 +112,6 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
>   	frame_info = vkms_plane_state->frame_info;
>   	memcpy(&frame_info->src, &new_state->src, sizeof(struct drm_rect));
>   	memcpy(&frame_info->dst, &new_state->dst, sizeof(struct drm_rect));
> -	memcpy(&frame_info->rotated, &new_state->dst, sizeof(struct drm_rect));

If you won't use rotated anymore, delete it from the struct.

Best Regards,
- Maíra

>   	frame_info->fb = fb;
>   	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
>   	drm_framebuffer_get(frame_info->fb);
> @@ -122,10 +121,8 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
>   									  DRM_MODE_REFLECT_X |
>   									  DRM_MODE_REFLECT_Y);
>   
> -	drm_rect_rotate(&frame_info->rotated, drm_rect_width(&frame_info->rotated),
> -			drm_rect_height(&frame_info->rotated), frame_info->rotation);
>   
> -	vkms_plane_state->pixel_read = get_pixel_read_function(fmt);
> +	vkms_plane_state->pixel_read_line = get_pixel_read_line_function(fmt);
>   }
>   
>   static int vkms_plane_atomic_check(struct drm_plane *plane,
> 
