Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 085B0845ECD
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 18:44:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15AC10EE0D;
	Thu,  1 Feb 2024 17:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="cF+cIyUk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D9910EAD0
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 17:44:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B0F9240002;
 Thu,  1 Feb 2024 17:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1706809447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zih9+WdolofxIdtK1mOeeY5rlakpVPHBzMF2MAMbfZM=;
 b=cF+cIyUk/lPcDN6GzreJj/4JeGVhE7MofYm9DoJ5vSGYXH7XCqt/oXgTrQ/jl5Lqi6EmrG
 yAakz+bwIXNXmZzCMbX5fcWMN0QqDsf4nJ+t0aCR2dAJCFWu2ggvPAVu9C5CscHk2cDHU/
 eoaxvMrYwblqq1IuYiVqNt2ZfmXOCLsqiJ0/kpvP9uneVBQAUTyl8aVCDIIO4gbx51yA/w
 WWe0kEt8ynnaHfAEYsgbVQUGpzPneXvd5Ghh+BOQCHseC++ARdjeeNDKw+kE0U2v/ybQhJ
 IvJjMf66D/I9myWbDHvsl1dOpl3LBDCRjvu32P4YMsDDkCK3fi+SDu6y50RwUQ==
Date: Thu, 1 Feb 2024 18:44:04 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/7] drm/vkms: Add range and encoding properties to
 pixel_read function
Message-ID: <ZbvYZHCt6ynnWkoP@localhost.localdomain>
Mail-Followup-To: Arthur Grillo <arthurgrillo@riseup.net>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
References: <20240110-vkms-yuv-v2-0-952fcaa5a193@riseup.net>
 <20240110-vkms-yuv-v2-3-952fcaa5a193@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240110-vkms-yuv-v2-3-952fcaa5a193@riseup.net>
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

Le 10/01/24 - 14:44, Arthur Grillo a écrit :
> Create range and encoding properties. This should be noop, as none of
> the conversion functions need those properties.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.h     |  3 ++-
>  drivers/gpu/drm/vkms/vkms_formats.c | 20 ++++++++++++++------
>  drivers/gpu/drm/vkms/vkms_plane.c   |  9 +++++++++
>  3 files changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index c38590562e4b..51349a0c32d8 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -56,7 +56,8 @@ struct vkms_writeback_job {
>  struct vkms_plane_state {
>  	struct drm_shadow_plane_state base;
>  	struct vkms_frame_info *frame_info;
> -	void (*pixel_read)(u8 **src_buffer, struct pixel_argb_u16 *out_pixel);
> +	void (*pixel_read)(u8 **src_buffer, struct pixel_argb_u16 *out_pixel,
> +			   enum drm_color_encoding enconding, enum drm_color_range range);
>  };
>  
>  struct vkms_plane {
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 5566a7cd7bb4..0156372aa1ef 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -51,7 +51,8 @@ static int get_x_position(const struct vkms_frame_info *frame_info, int limit, i
>  	return x;
>  }
>  
> -static void ARGB8888_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel)
> +static void ARGB8888_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel,
> +				 enum drm_color_encoding encoding, enum drm_color_range range)
>  {
>  	/*
>  	 * The 257 is the "conversion ratio". This number is obtained by the
> @@ -65,7 +66,8 @@ static void ARGB8888_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pix
>  	out_pixel->b = (u16)src_pixels[0][0] * 257;
>  }
>  
> -static void XRGB8888_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel)
> +static void XRGB8888_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel,
> +				 enum drm_color_encoding encoding, enum drm_color_range range)
>  {
>  	out_pixel->a = (u16)0xffff;
>  	out_pixel->r = (u16)src_pixels[0][2] * 257;
> @@ -73,7 +75,8 @@ static void XRGB8888_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pix
>  	out_pixel->b = (u16)src_pixels[0][0] * 257;
>  }
>  
> -static void ARGB16161616_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel)
> +static void ARGB16161616_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel,
> +				     enum drm_color_encoding encoding, enum drm_color_range range)
>  {
>  	u16 *pixels = (u16 *)src_pixels[0];
>  
> @@ -83,7 +86,8 @@ static void ARGB16161616_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out
>  	out_pixel->b = le16_to_cpu(pixels[0]);
>  }
>  
> -static void XRGB16161616_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel)
> +static void XRGB16161616_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel,
> +				     enum drm_color_encoding encoding, enum drm_color_range range)
>  {
>  	u16 *pixels = (u16 *)src_pixels[0];
>  
> @@ -93,7 +97,8 @@ static void XRGB16161616_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out
>  	out_pixel->b = le16_to_cpu(pixels[0]);
>  }
>  
> -static void RGB565_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel)
> +static void RGB565_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel,
> +			       enum drm_color_encoding encoding, enum drm_color_range range)
>  {
>  	u16 *pixels = (u16 *)src_pixels[0];
>  
> @@ -132,6 +137,9 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
>  	int limit = min_t(size_t, drm_rect_width(&frame_info->dst), stage_buffer->n_pixels);
>  	u8 *src_pixels[DRM_FORMAT_MAX_PLANES];
>  
> +	enum drm_color_encoding encoding = plane->base.base.color_encoding;
> +	enum drm_color_range range = plane->base.base.color_range;
> +
>  	for (size_t i = 0; i < frame_format->num_planes; i++)
>  		src_pixels[i] = get_packed_src_addr(frame_info, y, i);
>  
> @@ -146,7 +154,7 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
>  			}
>  		}
>  
> -		plane->pixel_read(src_pixels, &out_pixels[x_pos]);
> +		plane->pixel_read(src_pixels, &out_pixels[x_pos], encoding, range);
>  
>  		for (size_t i = 0; i < frame_format->num_planes; i++)
>  			src_pixels[i] += frame_format->cpp[i];
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index 8f2c6ea419a3..e87c80575b7d 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -212,5 +212,14 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>  	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
>  					   DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK);
>  
> +	drm_plane_create_color_properties(&plane->base,
> +					  BIT(DRM_COLOR_YCBCR_BT601) |
> +					  BIT(DRM_COLOR_YCBCR_BT709) |
> +					  BIT(DRM_COLOR_YCBCR_BT2020),
> +					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> +					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
> +					  DRM_COLOR_YCBCR_BT601,
> +					  DRM_COLOR_YCBCR_FULL_RANGE);
> +
>  	return plane;
>  }
> 
> -- 
> 2.43.0
> 

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
