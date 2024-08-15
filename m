Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A8E953559
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 16:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E7510E44B;
	Thu, 15 Aug 2024 14:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mNR5sZQJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3886D10E44B
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 14:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wIEVspMbU9fqPswpsbQbvg0YjTrVOAC5HuQmag4EBQw=; b=mNR5sZQJzFo/Mhes3Y5WWV2OI+
 rF9/b7M085MxTSLhciN9o+8Vg3Tb+LCRREtIcxb1jTdP6O+KHC3QO6ccc9ZQxIQOC84HoXBuxXSJf
 nkBx//ea7XZRkRf8O0nTzL2ndY/NeVugGllmQhJaSjv/SN85VIQgCY4wkNlHdvBTkCiGth8cELN3I
 ymPqLlLwvnBuOOeD07gm4LYioUzQ0pfW5IzkmZOTtzViYT/d+o1Qheia7ukqUDWy/G2JFVeEDzyLy
 rjzXl0pWuD4WBjVz5nJFGEqtLmJzmhwUPQlfg+bG6ytDLSMsxUjrPezLg60QkXXJflx6MfI6nO6Xj
 9nbmZ7VQ==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sebaa-000eMa-JS; Thu, 15 Aug 2024 16:36:32 +0200
Message-ID: <ddde5dd8-8dac-47e3-a92c-8f97bf6b7bd9@igalia.com>
Date: Thu, 15 Aug 2024 11:36:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/6] drm/vkms: Properly extract vkms_formats header
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
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
References: <20240814-google-split-headers-v1-0-51712f088f5d@bootlin.com>
 <20240814-google-split-headers-v1-1-51712f088f5d@bootlin.com>
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
In-Reply-To: <20240814-google-split-headers-v1-1-51712f088f5d@bootlin.com>
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

Most of the code extracted in this patch was previously introduced by
you in patches that I didn't apply yet. Therefore, I believe you could
just add the code in vkms_formats.c in the original series.

Best Regards,
- Maíra

On 8/14/24 06:08, Louis Chauvet wrote:
> The vkms_format.h header was already separated from vkms_drv.h, but some
> function were missing. Move those function in vkms_format.h.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   drivers/gpu/drm/vkms/vkms_drv.h     | 74 +---------------------------------
>   drivers/gpu/drm/vkms/vkms_formats.c |  3 ++
>   drivers/gpu/drm/vkms/vkms_formats.h | 80 ++++++++++++++++++++++++++++++++++++-
>   3 files changed, 84 insertions(+), 73 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 8f6c9e67e671..0db443924a15 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -12,6 +12,8 @@
>   #include <drm/drm_encoder.h>
>   #include <drm/drm_writeback.h>
>   
> +#include "vkms_formats.h"
> +
>   #define XRES_MIN    10
>   #define YRES_MIN    10
>   
> @@ -43,29 +45,6 @@ struct vkms_frame_info {
>   	unsigned int rotation;
>   };
>   
> -struct pixel_argb_u16 {
> -	u16 a, r, g, b;
> -};
> -
> -struct line_buffer {
> -	size_t n_pixels;
> -	struct pixel_argb_u16 *pixels;
> -};
> -
> -struct vkms_writeback_job;
> -/**
> - * typedef pixel_write_line_t - These functions are used to read a pixel line from a
> - * struct pixel_argb_u16 buffer, convert it and write it in the @wb job.
> - *
> - * @wb: the writeback job to write the output of the conversion
> - * @in_pixels: Source buffer containing the line to convert
> - * @count: The width of a line
> - * @x_start: The x (width) coordinate in the destination plane
> - * @y_start: The y (height) coordinate in the destination plane
> - */
> -typedef void (*pixel_write_line_t)(struct vkms_writeback_job *wb,
> -			      struct pixel_argb_u16 *in_pixels, int count, int x_start,
> -			      int y_start);
>   
>   struct vkms_writeback_job {
>   	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
> @@ -73,53 +52,10 @@ struct vkms_writeback_job {
>   	pixel_write_line_t pixel_write;
>   };
>   
> -/**
> - * enum pixel_read_direction - Enum used internaly by VKMS to represent a reading direction in a
> - * plane.
> - */
> -enum pixel_read_direction {
> -	READ_BOTTOM_TO_TOP,
> -	READ_TOP_TO_BOTTOM,
> -	READ_RIGHT_TO_LEFT,
> -	READ_LEFT_TO_RIGHT
> -};
>   
>   struct vkms_plane_state;
>   
> -/**
> - * typedef pixel_read_line_t - These functions are used to read a pixel line in the source frame,
> - * convert it to `struct pixel_argb_u16` and write it to @out_pixel.
> - *
> - * @plane: plane used as source for the pixel value
> - * @x_start: X (width) coordinate of the first pixel to copy. The caller must ensure that x_start
> - * is non-negative and smaller than @plane->frame_info->fb->width.
> - * @y_start: Y (height) coordinate of the first pixel to copy. The caller must ensure that y_start
> - * is non-negative and smaller than @plane->frame_info->fb->height.
> - * @direction: direction to use for the copy, starting at @x_start/@y_start
> - * @count: number of pixels to copy
> - * @out_pixel: pointer where to write the pixel values. They will be written from @out_pixel[0]
> - * (included) to @out_pixel[@count] (excluded). The caller must ensure that out_pixel have a
> - * length of at least @count.
> - */
> -typedef void (*pixel_read_line_t)(const struct vkms_plane_state *plane, int x_start,
> -				  int y_start, enum pixel_read_direction direction, int count,
> -				  struct pixel_argb_u16 out_pixel[]);
>   
> -/**
> - * struct conversion_matrix - Matrix to use for a specific encoding and range
> - *
> - * @matrix: Conversion matrix from yuv to rgb. The matrix is stored in a row-major manner and is
> - * used to compute rgb values from yuv values:
> - *     [[r],[g],[b]] = @matrix * [[y],[u],[v]]
> - *   OR for yvu formats:
> - *     [[r],[g],[b]] = @matrix * [[y],[v],[u]]
> - *  The values of the matrix are signed fixed-point values with 32 bits fractional part.
> - * @y_offset: Offset to apply on the y value.
> - */
> -struct conversion_matrix {
> -	s64 matrix[3][3];
> -	int y_offset;
> -};
>   
>   /**
>    * struct vkms_plane_state - Driver specific plane state
> @@ -140,12 +76,6 @@ struct vkms_plane {
>   	struct drm_plane base;
>   };
>   
> -struct vkms_color_lut {
> -	struct drm_color_lut *base;
> -	size_t lut_length;
> -	s64 channel_value2index_ratio;
> -};
> -
>   /**
>    * struct vkms_crtc_state - Driver specific CRTC state
>    *
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 65fdd3999441..5ab84801d8da 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -6,9 +6,12 @@
>   #include <drm/drm_blend.h>
>   #include <drm/drm_rect.h>
>   #include <drm/drm_fixed.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_framebuffer.h>
>   
>   #include <kunit/visibility.h>
>   
> +#include "vkms_drv.h"
>   #include "vkms_formats.h"
>   
>   /**
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
> index 852ab9a4cee5..62b06bc26e79 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.h
> +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> @@ -3,7 +3,85 @@
>   #ifndef _VKMS_FORMATS_H_
>   #define _VKMS_FORMATS_H_
>   
> -#include "vkms_drv.h"
> +#include <drm/drm_color_mgmt.h>
> +
> +struct vkms_plane_state;
> +struct vkms_writeback_job;
> +
> +struct pixel_argb_u16 {
> +	u16 a, r, g, b;
> +};
> +
> +/**
> + * typedef pixel_write_line_t - These functions are used to read a pixel line from a
> + * struct pixel_argb_u16 buffer, convert it and write it in the @wb_job.
> + *
> + * @wb: the writeback job to write the output of the conversion
> + * @in_pixels: Source buffer containing the line to convert
> + * @count: The width of a line
> + * @x_start: The x (width) coordinate in the destination plane
> + * @y_start: The y (height) coordinate in the destination plane
> + */
> +typedef void (*pixel_write_line_t)(struct vkms_writeback_job *wb,
> +				   struct pixel_argb_u16 *in_pixels, int count, int x_start,
> +				   int y_start);
> +
> +struct line_buffer {
> +	size_t n_pixels;
> +	struct pixel_argb_u16 *pixels;
> +};
> +
> +/**
> + * enum pixel_read_direction - Enum used internaly by VKMS to represent a reading direction in a
> + * plane.
> + */
> +enum pixel_read_direction {
> +	READ_BOTTOM_TO_TOP,
> +	READ_TOP_TO_BOTTOM,
> +	READ_RIGHT_TO_LEFT,
> +	READ_LEFT_TO_RIGHT
> +};
> +
> +/**
> + * struct conversion_matrix - Matrix to use for a specific encoding and range
> + *
> + * @matrix: Conversion matrix from yuv to rgb. The matrix is stored in a row-major manner and is
> + * used to compute rgb values from yuv values:
> + *     [[r],[g],[b]] = @matrix * [[y],[u],[v]]
> + *   OR for yvu formats:
> + *     [[r],[g],[b]] = @matrix * [[y],[v],[u]]
> + *  The values of the matrix are signed fixed-point values with 32 bits fractional part.
> + * @y_offset: Offset to apply on the y value.
> + */
> +struct conversion_matrix {
> +	s64 matrix[3][3];
> +	int y_offset;
> +};
> +
> +struct vkms_color_lut {
> +	struct drm_color_lut *base;
> +	size_t lut_length;
> +	s64 channel_value2index_ratio;
> +};
> +
> +/**
> + * typedef pixel_read_line_t - These functions are used to read a pixel line in the source frame,
> + * convert it to `struct pixel_argb_u16` and write it to @out_pixel.
> + *
> + * @plane: plane used as source for the pixel value
> + * @x_start: X (width) coordinate of the first pixel to copy. The caller must ensure that x_start
> + * is non-negative and smaller than @plane->frame_info->fb->width.
> + * @y_start: Y (height) coordinate of the first pixel to copy. The caller must ensure that y_start
> + * is non-negative and smaller than @plane->frame_info->fb->height.
> + * @direction: direction to use for the copy, starting at @x_start/@y_start
> + * @count: number of pixels to copy
> + * @out_pixel: pointer where to write the pixel values. They will be written from @out_pixel[0]
> + * (included) to @out_pixel[@count] (excluded). The caller must ensure that out_pixel have a
> + * length of at least @count.
> + */
> +typedef void (*pixel_read_line_t)(const struct vkms_plane_state *plane, int x_start,
> +				  int y_start, enum pixel_read_direction direction, int count,
> +				  struct pixel_argb_u16 out_pixel[]);
>   
>   pixel_read_line_t get_pixel_read_line_function(u32 format);
>   
> 
