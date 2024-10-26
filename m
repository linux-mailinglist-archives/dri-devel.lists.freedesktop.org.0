Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A70379B18EB
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 17:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFB310E097;
	Sat, 26 Oct 2024 15:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="j1pZB425";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE65A10E097
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2024 15:05:26 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4XbNHp1cTCz9vwF;
 Sat, 26 Oct 2024 15:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1729955126; bh=IypF3NOPiKhQ1YuxtYCPA4MMD41cNf0A1OJufEY4B2Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=j1pZB425CfSQM7+IWNctiJP4gTyXK89Ngopp9EuPoFiMSS54ASnQqTJ6rDebsiLuc
 OQRj5f5o9DYGYv4O5injV1Cbh4gJqGEWkI34z2hJpNq8I9cIHVOrJ+PUzhPjJ66XXj
 +ihl26VNmyebiu105KWkyTy/8xhSvX0hw7/bopZY=
X-Riseup-User-ID: B06695D6E0EC1F560E2AC7B8C8A38E197645929805C9F4A71653C6F3CBA49945
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4XbNHT4D42zFv6B;
 Sat, 26 Oct 2024 15:05:09 +0000 (UTC)
Message-ID: <107a8f2b-9bdc-435c-a6f0-c427a4b79579@riseup.net>
Date: Sat, 26 Oct 2024 12:05:06 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/3] drm/vkms: Re-introduce line-by-line algorithm for
 writeback
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com
References: <20240814-writeback_line_by_line-v2-0-36541c717569@bootlin.com>
 <20240814-writeback_line_by_line-v2-1-36541c717569@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20240814-writeback_line_by_line-v2-1-36541c717569@bootlin.com>
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

On 14/08/24 05:42, Louis Chauvet wrote:
> Re-introduce a line-by-line writeback algorithm for each pixel format.
> This allows more performance by not requiring an indirection per pixel
> write.
> 
> Line-by-line writeback was introduced by [1] but rewritten back to
> pixel-by-pixel algorithm in [2]. At this time, nobody noticed the impact
> on performance, and it was merged.
> 
> This patch is almost a revert of [2], but with some effort to avoid code
> duplication. Now only the loop is repeated, but it is required to have
> good performances.
> 
> The performance gain is around 5 to 10%.
> 
> [1]: https://lore.kernel.org/all/20211005201637.58563-7-igormtorrente@gmail.com/
> [2]: https://lore.kernel.org/all/20230515135204.115393-4-mcanal@igalia.com/
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   drivers/gpu/drm/vkms/vkms_composer.c  |  17 +++++
>   drivers/gpu/drm/vkms/vkms_drv.h       |  20 +++---
>   drivers/gpu/drm/vkms/vkms_formats.c   | 117 +++++++++++++++++++++++++++-------
>   drivers/gpu/drm/vkms/vkms_formats.h   |   2 +-
>   drivers/gpu/drm/vkms/vkms_writeback.c |   2 +-
>   5 files changed, 124 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 76d4aa8a0ef6..f0cae142ac22 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -176,6 +176,23 @@ static enum pixel_read_direction direction_for_rotation(unsigned int rotation)
>   	return READ_LEFT_TO_RIGHT;
>   }
>   
> +/**
> + * Write a line to the writeback buffer > + *
> + * @wb: Job where to insert the final image
> + * @src_buffer: Line to write
> + * @y: Row to write in the writeback buffer
> + */

Please, review the documentation using the kernel-doc format.

> +static void vkms_writeback_row(struct vkms_writeback_job *wb,
> +			       const struct line_buffer *src_buffer, size_t y_start)
> +{
> +	struct vkms_frame_info *frame_info = &wb->wb_frame_info;
> +	int x_start = frame_info->dst.x1;
> +	int count = min_t(size_t, drm_rect_width(&frame_info->dst), src_buffer->n_pixels);
> +
> +	wb->pixel_write(wb, src_buffer->pixels, count, x_start, y_start);
> +}
> +
>   /**
>    * clamp_line_coordinates() - Compute and clamp the coordinate to read and write during the blend
>    * process.
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 3870e825da81..526bf5207524 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -52,20 +52,25 @@ struct line_buffer {
>   	struct pixel_argb_u16 *pixels;
>   };
>   
> +struct vkms_writeback_job;
>   /**
> - * typedef pixel_write_t - These functions are used to read a pixel from a
> - * &struct pixel_argb_u16, convert it in a specific format and write it in the @dst_pixels
> - * buffer.
> + * typedef pixel_write_line_t - These functions are used to read a pixel line from a
> + * struct pixel_argb_u16 buffer, convert it and write it in the @wb job.
>    *
> - * @out_pixel: destination address to write the pixel
> - * @in_pixel: pixel to write
> + * @wb: the writeback job to write the output of the conversion
> + * @in_pixels: Source buffer containing the line to convert
> + * @count: The width of a line
> + * @x_start: The x (width) coordinate in the destination plane
> + * @y_start: The y (height) coordinate in the destination plane
>    */
> -typedef void (*pixel_write_t)(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel);
> +typedef void (*pixel_write_line_t)(struct vkms_writeback_job *wb,
> +			      struct pixel_argb_u16 *in_pixels, int count, int x_start,
> +			      int y_start);
>   
>   struct vkms_writeback_job {
>   	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
>   	struct vkms_frame_info wb_frame_info;
> -	pixel_write_t pixel_write;
> +	pixel_write_line_t pixel_write;
>   };
>   
>   /**
> @@ -232,7 +237,6 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
>   /* Composer Support */
>   void vkms_composer_worker(struct work_struct *work);
>   void vkms_set_composer(struct vkms_output *out, bool enabled);
> -void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer *src_buffer, int y);
>   
>   /* Writeback */
>   int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index d1abfb1c3e3c..d1309f6d307f 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -587,7 +587,7 @@ static void planar_yuv_read_line(const struct vkms_plane_state *plane, int x_sta
>    * The following functions take one &struct pixel_argb_u16 and convert it to a specific format.
>    * The result is stored in @out_pixel.
>    *
> - * They are used in vkms_writeback_row() to convert and store a pixel from the src_buffer to
> + * They are used in the `write_line` functions to convert and store a pixel from the src_buffer to
>    * the writeback buffer.
>    */
>   static void argb_u16_to_ARGB8888(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel)
> @@ -654,28 +654,97 @@ static void argb_u16_to_RGB565(u8 *out_pixel, const struct pixel_argb_u16 *in_pi
>   	*pixel = cpu_to_le16(r << 11 | g << 5 | b);
>   }
>   
> -/**
> - * vkms_writeback_row() - Generic loop for all supported writeback format. It is executed just
> - * after the blending to write a line in the writeback buffer.
> +/*
> + * The following functions are write_line function for each pixel format supported by VKMS.
> + *
> + * They write a full line at index y. They must read data from the line src_pixels.
> + *
> + * The caller must ensure that count is not larger than the framebuffer and the src_pixels.
> + *
> + * Those function are very similar, but it is required for performance reason. In the past, some
> + * experiment were done, and with a generic loop the performance are very reduced [1].
>    *
> - * @wb: Job where to insert the final image
> - * @src_buffer: Line to write
> - * @y: Row to write in the writeback buffer
> + * [1]: https://lore.kernel.org/dri-devel/d258c8dc-78e9-4509-9037-a98f7f33b3a3@riseup.net/

I'm not sure if a link is approriate here.

>    */
> -void vkms_writeback_row(struct vkms_writeback_job *wb,
> -			const struct line_buffer *src_buffer, int y)
> +
> +static void ARGB8888_write_line(struct vkms_writeback_job *wb,
> +				struct pixel_argb_u16 *src_pixels, int count, int x_start,
> +				int y_start)
>   {
> -	struct vkms_frame_info *frame_info = &wb->wb_frame_info;
> -	int x_dst = frame_info->dst.x1;
>   	u8 *dst_pixels;
> -	int rem_x, rem_y;
>   
> -	packed_pixels_addr(frame_info, x_dst, y, 0, &dst_pixels, &rem_x, &rem_y);
> -	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
> -	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst), src_buffer->n_pixels);
> +	packed_pixels_addr_1x1(&wb->wb_frame_info, x_start, y_start, 0, &dst_pixels);
>   
> -	for (size_t x = 0; x < x_limit; x++, dst_pixels += frame_info->fb->format->cpp[0])
> -		wb->pixel_write(dst_pixels, &in_pixels[x]);
> +	while (count) {
> +		argb_u16_to_ARGB8888(dst_pixels, src_pixels);
> +		dst_pixels += wb->wb_frame_info.fb->format->char_per_block[0];
> +		src_pixels += 1;
> +		count--;
> +	}
> +}
> +
> +static void XRGB8888_write_line(struct vkms_writeback_job *wb,
> +				struct pixel_argb_u16 *src_pixels, int count, int x_start,
> +				int y_start)
> +{
> +	u8 *dst_pixels;
> +
> +	packed_pixels_addr_1x1(&wb->wb_frame_info, x_start, y_start, 0, &dst_pixels);
> +
> +	while (count) {
> +		argb_u16_to_XRGB8888(dst_pixels, src_pixels);
> +		dst_pixels += wb->wb_frame_info.fb->format->char_per_block[0];
> +		src_pixels += 1;
> +		count--;
> +	}
> +}
> +
> +static void ARGB16161616_write_line(struct vkms_writeback_job *wb,
> +				    struct pixel_argb_u16 *src_pixels, int count, int x_start,
> +				    int y_start)
> +{
> +	u8 *dst_pixels;
> +
> +	packed_pixels_addr_1x1(&wb->wb_frame_info, x_start, y_start, 0, &dst_pixels);
> +
> +	while (count) {
> +		argb_u16_to_ARGB16161616(dst_pixels, src_pixels);
> +		dst_pixels += wb->wb_frame_info.fb->format->char_per_block[0];
> +		src_pixels += 1;
> +		count--;
> +	}
> +}
> +
> +static void XRGB16161616_write_line(struct vkms_writeback_job *wb,
> +				    struct pixel_argb_u16 *src_pixels, int count, int x_start,
> +				    int y_start)
> +{
> +	u8 *dst_pixels;
> +
> +	packed_pixels_addr_1x1(&wb->wb_frame_info, x_start, y_start, 0, &dst_pixels);
> +
> +	while (count) {
> +		argb_u16_to_XRGB16161616(dst_pixels, src_pixels);
> +		dst_pixels += wb->wb_frame_info.fb->format->char_per_block[0];
> +		src_pixels += 1;
> +		count--;
> +	}
> +}
> +
> +static void RGB565_write_line(struct vkms_writeback_job *wb,
> +			      struct pixel_argb_u16 *src_pixels, int count, int x_start,
> +			      int y_start)
> +{
> +	u8 *dst_pixels;
> +
> +	packed_pixels_addr_1x1(&wb->wb_frame_info, x_start, y_start, 0, &dst_pixels);
> +
> +	while (count) {
> +		argb_u16_to_RGB565(dst_pixels, src_pixels);
> +		dst_pixels += wb->wb_frame_info.fb->format->char_per_block[0];
> +		src_pixels += 1;
> +		count--;
> +	}
>   }
>   
>   /**
> @@ -936,25 +1005,25 @@ void get_conversion_matrix_to_argb_u16(u32 format,
>   }
>   
>   /**
> - * get_pixel_write_function() - Retrieve the correct write_pixel function for a specific format.
> + * get_pixel_write_function() - Retrieve the correct write_line function for a specific format.

Correct the docs.

Best Regards,
- Maíra

>    * The returned pointer is NULL for unsupported pixel formats. The caller must ensure that the
>    * pointer is valid before using it in a vkms_writeback_job.
>    *
>    * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
>    */
> -pixel_write_t get_pixel_write_function(u32 format)
> +pixel_write_line_t get_pixel_write_line_function(u32 format) >   {
>   	switch (format) {
>   	case DRM_FORMAT_ARGB8888:
> -		return &argb_u16_to_ARGB8888;
> +		return &ARGB8888_write_line;
>   	case DRM_FORMAT_XRGB8888:
> -		return &argb_u16_to_XRGB8888;
> +		return &XRGB8888_write_line;
>   	case DRM_FORMAT_ARGB16161616:
> -		return &argb_u16_to_ARGB16161616;
> +		return &ARGB16161616_write_line;
>   	case DRM_FORMAT_XRGB16161616:
> -		return &argb_u16_to_XRGB16161616;
> +		return &XRGB16161616_write_line;
>   	case DRM_FORMAT_RGB565:
> -		return &argb_u16_to_RGB565;
> +		return &RGB565_write_line;
>   	default:
>   		/*
>   		 * This is a bug in vkms_writeback_atomic_check. All the supported
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
> index eeb208cdd6b1..852ab9a4cee5 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.h
> +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> @@ -7,7 +7,7 @@
>   
>   pixel_read_line_t get_pixel_read_line_function(u32 format);
>   
> -pixel_write_t get_pixel_write_function(u32 format);
> +pixel_write_line_t get_pixel_write_line_function(u32 format);
>   
>   void get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encoding,
>   				       enum drm_color_range range,
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> index c8582df1f739..f6ed3aa69af8 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -150,7 +150,7 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
>   	crtc_state->wb_pending = true;
>   	spin_unlock_irq(&output->composer_lock);
>   	drm_writeback_queue_job(wb_conn, connector_state);
> -	active_wb->pixel_write = get_pixel_write_function(wb_format);
> +	active_wb->pixel_write = get_pixel_write_line_function(wb_format);
>   	drm_rect_init(&wb_frame_info->src, 0, 0, crtc_width, crtc_height);
>   	drm_rect_init(&wb_frame_info->dst, 0, 0, crtc_width, crtc_height);
>   }
> 
