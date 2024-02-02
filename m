Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 072A8847ADF
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 22:00:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0715A10E0D9;
	Fri,  2 Feb 2024 21:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="WDn0CIZX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8B410E0C6
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 20:59:57 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4TRSp438vTzDqQ6;
 Fri,  2 Feb 2024 20:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1706907596; bh=ge9WmExw3RYtr47lcMES3xw541P+2RTLYMoq4ZWA3M4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WDn0CIZXXkpAYI365jt8RJMpj6sA8NTH9JM2nq6NTxHIil5aIOQghOt5lo+sotJ/B
 wvcVfAScYOFf5UL9UvufcO0shV4HvNOxVBQxMhhod69+0h4zUmYZ12G3U3RTYGGPER
 dPC4QTFdt8nU/79b8RrzLg8B4Ihxz7iFEUHY3Sb0=
X-Riseup-User-ID: 8D545961835A176C093ABDD1C101A5788877D082A0844039CD0237B84AD211E3
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4TRSnx4ww1zJp0l;
 Fri,  2 Feb 2024 20:59:49 +0000 (UTC)
Message-ID: <40287e9a-efb8-480a-bb50-85361feb44a4@riseup.net>
Date: Fri, 2 Feb 2024 17:59:46 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] drm/vkms: Create a type to check a function pointer
 validity
Content-Language: en-US
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, marcheu@google.com, seanpaul@google.com,
 nicolejadeyee@google.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, miquel.raynal@bootlin.com
References: <20240201-yuv-v1-0-3ca376f27632@bootlin.com>
 <20240201-yuv-v1-1-3ca376f27632@bootlin.com>
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <20240201-yuv-v1-1-3ca376f27632@bootlin.com>
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



On 01/02/24 14:31, Louis Chauvet wrote:
> Add the pixel_read_t type to check function prototype in structures
> and functions.
> It avoids casting to (void *) and at the same occasion allows the
> compiler to check the type properly.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.h     | 17 +++++++++++++++--
>  drivers/gpu/drm/vkms/vkms_formats.c |  4 ++--
>  drivers/gpu/drm/vkms/vkms_formats.h |  2 +-
>  3 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 51349a0c32d8..cb20bab26cae 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -48,6 +48,20 @@ struct vkms_writeback_job {
>  	void (*pixel_write)(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel);
>  };
>  
> +/**
> + * typedef pixel_read_t - These functions are used to read the pixels in the source frame, convert
> + * them to argb16 and write them to out_pixel.
> + * It assumes that src_pixels point to a valid pixel (not a block, or a block of 1x1 pixel)
> + *
> + * @src_pixels: Source pointer to a pixel
> + * @out_pixel: Pointer where to write the pixel value
> + * @encoding: Color encoding to use (mainly used for YUV formats)
> + * @range: Color range to use (mainly used for YUV formats)
> + */
> +typedef void (*pixel_read_t)(u8 **src_pixels, int y,
> +			     struct pixel_argb_u16 *out_pixel, enum drm_color_encoding enconding,
> +			     enum drm_color_range range);
> +
>  /**
>   * vkms_plane_state - Driver specific plane state
>   * @base: base plane state
> @@ -56,8 +70,7 @@ struct vkms_writeback_job {
>  struct vkms_plane_state {
>  	struct drm_shadow_plane_state base;
>  	struct vkms_frame_info *frame_info;
> -	void (*pixel_read)(u8 **src_buffer, struct pixel_argb_u16 *out_pixel,
> -			   enum drm_color_encoding enconding, enum drm_color_range range);
> +	pixel_read_t pixel_read;

Hi,

Please Cc me on the next versions,

You added the argument 'y' to the function but did not change the calls
to it, resulting in a compiler error. I think this argument addition
would be better on patch #2.

Best Regards,
~Arthur Grillo

>  };
>  
>  struct vkms_plane {
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index e06bbd7c0a67..c6376db58d38 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -390,7 +390,7 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
>  		wb->pixel_write(dst_pixels, &in_pixels[x]);
>  }
>  
> -void *get_pixel_conversion_function(u32 format)
> +pixel_read_t get_pixel_conversion_function(u32 format)
>  {
>  	switch (format) {
>  	case DRM_FORMAT_ARGB8888:
> @@ -420,7 +420,7 @@ void *get_pixel_conversion_function(u32 format)
>  	case DRM_FORMAT_YVU444:
>  		return &planar_yvu_to_argb_u16;
>  	default:
> -		return NULL;
> +		return (pixel_read_t)NULL;
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
> index 0cf835292cec..04e31e126ab1 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.h
> +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> @@ -5,7 +5,7 @@
>  
>  #include "vkms_drv.h"
>  
> -void *get_pixel_conversion_function(u32 format);
> +pixel_read_t get_pixel_conversion_function(u32 format);
>  
>  void *get_pixel_write_function(u32 format);
>  
> 
