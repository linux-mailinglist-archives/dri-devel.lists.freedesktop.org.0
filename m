Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 217A186756E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 13:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6A310E71E;
	Mon, 26 Feb 2024 12:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="U+ZHKIbv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA2110E716
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 12:44:13 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4Tk0g03Nykz9skq;
 Mon, 26 Feb 2024 12:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1708951453; bh=Olm5WKHxqb6QWM5isUwceIC1qHYorkTL+1j53UzOYwM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=U+ZHKIbv8yeH0OkbgiicBpxM20nR/wWIEK9lHoVwQ9quuV58ENWdTvmBYBB90pIug
 WM0/KhiBqeyD8kdk5UzSV81TmSaAPZZII2wIedU6J8XjzNyimn8M2/m2KkoucbDSQX
 HBKBdU3UmiFFpPx955RkbeOVMrO2GDw6QtRyEDVg=
X-Riseup-User-ID: 68748640731C1B3F7536CAFC2F5550E7BC852D84B3E84E299E7BD83344413D0A
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4Tk0ft1d19zJsBS;
 Mon, 26 Feb 2024 12:44:05 +0000 (UTC)
Message-ID: <848f2690-2f20-4a92-82ff-64cdee8cb2ee@riseup.net>
Date: Mon, 26 Feb 2024 09:44:02 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v3 4/9] drm/vkms: Add typedef and documentation for
 pixel_read and pixel_write functions
Content-Language: en-US
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com
References: <20240226-yuv-v3-0-ff662f0994db@bootlin.com>
 <20240226-yuv-v3-4-ff662f0994db@bootlin.com>
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <20240226-yuv-v3-4-ff662f0994db@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 26/02/24 05:46, Louis Chauvet wrote:
> Introduce two typedefs: pixel_read_t and pixel_write_t. It allows the
> compiler to check if the passed functions take the correct arguments.
> Such typedefs will help ensuring consistency across the code base in
> case of update of these prototypes.
> 
> Introduce a check around the get_pixel_*_functions to avoid using a
> nullptr as a function.
> 
> Document for those typedefs.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.h       | 23 +++++++++++++++++++++--
>  drivers/gpu/drm/vkms/vkms_formats.c   |  8 ++++----
>  drivers/gpu/drm/vkms/vkms_formats.h   |  4 ++--
>  drivers/gpu/drm/vkms/vkms_plane.c     |  9 ++++++++-
>  drivers/gpu/drm/vkms/vkms_writeback.c |  9 ++++++++-
>  5 files changed, 43 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 18086423a3a7..886c885c8cf5 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -53,12 +53,31 @@ struct line_buffer {
>  	struct pixel_argb_u16 *pixels;
>  };
>  
> +/**
> + * typedef pixel_write_t - These functions are used to read a pixel from a
> + * `struct pixel_argb_u16*`, convert it in a specific format and write it in the @dst_pixels
> + * buffer.
> + *
> + * @dst_pixel: destination address to write the pixel
> + * @in_pixel: pixel to write
> + */
> +typedef void (*pixel_write_t)(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel);
> +
>  struct vkms_writeback_job {
>  	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
>  	struct vkms_frame_info wb_frame_info;
> -	void (*pixel_write)(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel);
> +	pixel_write_t pixel_write;
>  };
>  
> +/**
> + * typedef pixel_read_t - These functions are used to read a pixel in the source frame,
> + * convert it to `struct pixel_argb_u16` and write it to @out_pixel.
> + *
> + * @src_pixels: Pointer to the pixel to read
> + * @out_pixel: Pointer to write the converted pixel
> + */
> +typedef void (*pixel_read_t)(u8 *src_pixels, struct pixel_argb_u16 *out_pixel);
> +
>  /**
>   * vkms_plane_state - Driver specific plane state
>   * @base: base plane state
> @@ -69,7 +88,7 @@ struct vkms_writeback_job {
>  struct vkms_plane_state {
>  	struct drm_shadow_plane_state base;
>  	struct vkms_frame_info *frame_info;
> -	void (*pixel_read)(u8 *src_buffer, struct pixel_argb_u16 *out_pixel);
> +	pixel_read_t pixel_read;
>  };
>  
>  struct vkms_plane {
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index cb7a49b7c8e7..1f5aeba57ad6 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -262,7 +262,7 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
>   *
>   * @format: 4cc of the format
>   */
> -void *get_pixel_conversion_function(u32 format)
> +pixel_read_t get_pixel_read_function(u32 format)
>  {
>  	switch (format) {
>  	case DRM_FORMAT_ARGB8888:
> @@ -276,7 +276,7 @@ void *get_pixel_conversion_function(u32 format)
>  	case DRM_FORMAT_RGB565:
>  		return &RGB565_to_argb_u16;
>  	default:
> -		return NULL;
> +		return (pixel_read_t)NULL;
>  	}
>  }
>  
> @@ -287,7 +287,7 @@ void *get_pixel_conversion_function(u32 format)
>   *
>   * @format: 4cc of the format
>   */
> -void *get_pixel_write_function(u32 format)
> +pixel_write_t get_pixel_write_function(u32 format)
>  {
>  	switch (format) {
>  	case DRM_FORMAT_ARGB8888:
> @@ -301,6 +301,6 @@ void *get_pixel_write_function(u32 format)
>  	case DRM_FORMAT_RGB565:
>  		return &argb_u16_to_RGB565;
>  	default:
> -		return NULL;
> +		return (pixel_write_t)NULL;
>  	}
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
> index cf59c2ed8e9a..3ecea4563254 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.h
> +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> @@ -5,8 +5,8 @@
>  
>  #include "vkms_drv.h"
>  
> -void *get_pixel_conversion_function(u32 format);
> +pixel_read_t get_pixel_read_function(u32 format);
>  
> -void *get_pixel_write_function(u32 format);
> +pixel_write_t get_pixel_write_function(u32 format);
>  
>  #endif /* _VKMS_FORMATS_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index d5203f531d96..f68b1b03d632 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -106,6 +106,13 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
>  		return;
>  
>  	fmt = fb->format->format;
> +	pixel_read_t pixel_read = get_pixel_read_function(fmt);
> +
> +	if (!pixel_read) {
> +		DRM_WARN("Pixel format is not supported by VKMS planes. State is inchanged\n");

s/inchanged/unchanged/

> +		return;
> +	}
> +
>  	vkms_plane_state = to_vkms_plane_state(new_state);
>  	shadow_plane_state = &vkms_plane_state->base;
>  
> @@ -124,7 +131,7 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
>  	drm_rect_rotate(&frame_info->rotated, drm_rect_width(&frame_info->rotated),
>  			drm_rect_height(&frame_info->rotated), frame_info->rotation);
>  
> -	vkms_plane_state->pixel_read = get_pixel_conversion_function(fmt);
> +	vkms_plane_state->pixel_read = pixel_read;
>  }
>  
>  static int vkms_plane_atomic_check(struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> index c8582df1f739..c92b9f06c4a4 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -140,6 +140,13 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
>  	if (!conn_state)
>  		return;
>  
> +	pixel_write_t pixel_write = get_pixel_write_function(wb_format);
> +
> +	if (!pixel_write) {
> +		DRM_WARN("Pixel format is not supported by VKMS writeback. State is inchanged\n");

Same here

Best Regards,
~Arthur Grillo

> +		return;
> +	}
> +
>  	vkms_set_composer(&vkmsdev->output, true);
>  
>  	active_wb = conn_state->writeback_job->priv;
> @@ -150,7 +157,7 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
>  	crtc_state->wb_pending = true;
>  	spin_unlock_irq(&output->composer_lock);
>  	drm_writeback_queue_job(wb_conn, connector_state);
> -	active_wb->pixel_write = get_pixel_write_function(wb_format);
> +	active_wb->pixel_write = pixel_write;
>  	drm_rect_init(&wb_frame_info->src, 0, 0, crtc_width, crtc_height);
>  	drm_rect_init(&wb_frame_info->dst, 0, 0, crtc_width, crtc_height);
>  }
> 
