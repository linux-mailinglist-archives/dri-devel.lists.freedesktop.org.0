Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C3B955EAF
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 21:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE9110E11B;
	Sun, 18 Aug 2024 19:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jXD+lLeN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC4610E07E;
 Sun, 18 Aug 2024 19:22:59 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33FEE541;
 Sun, 18 Aug 2024 21:21:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1724008917;
 bh=CvpF9Axts1Rhln4SlNgoaOVrEnnikVcpPooqmvH2aOc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jXD+lLeNzoANdptO6sQa7HndAyTGFbRvmHM9vtoxOjybatIzk+GJKYK0yH5yDlgHP
 A8QB2Gh2TsQvcxXkWzljdPtQlgc7jt75KYB5WSJvnENpYBab1/56dZIzescjTNPeas
 7MTsC0CLobC0VWhhn2sQUkRuFrzcXmVIQlZ5/+eY=
Date: Sun, 18 Aug 2024 22:22:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH 01/86] drm/fbdev-helper: Move color-mode lookup into 4CC
 format helper
Message-ID: <20240818192230.GA729@pendragon.ideasonboard.com>
References: <20240816125408.310253-1-tzimmermann@suse.de>
 <20240816125408.310253-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240816125408.310253-2-tzimmermann@suse.de>
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

Hi Thomas,

Thank you for the patch.

On Fri, Aug 16, 2024 at 02:22:27PM +0200, Thomas Zimmermann wrote:
> The color mode specified on the kernel command line gives the user's
> preferred color depth and number of bits per pixel. Move the
> color-mode-to-format conversion form fbdev helpers into a 4CC helper,

s/form/from/

> so that is can be shared among DRM clients.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_fb_helper.c | 70 +++++++--------------------------
>  drivers/gpu/drm/drm_fourcc.c    | 30 +++++++++++++-
>  include/drm/drm_fourcc.h        |  1 +
>  3 files changed, 45 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 29c53f9f449c..af1fe79c701d 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -1441,67 +1441,27 @@ int drm_fb_helper_pan_display(struct fb_var_screeninfo *var,
>  EXPORT_SYMBOL(drm_fb_helper_pan_display);
>  
>  static uint32_t drm_fb_helper_find_format(struct drm_fb_helper *fb_helper, const uint32_t *formats,
> -					  size_t format_count, uint32_t bpp, uint32_t depth)
> +					  size_t format_count, unsigned int color_mode)
>  {
>  	struct drm_device *dev = fb_helper->dev;
>  	uint32_t format;
>  	size_t i;
>  
> -	/*
> -	 * Do not consider YUV or other complicated formats
> -	 * for framebuffers. This means only legacy formats
> -	 * are supported (fmt->depth is a legacy field), but
> -	 * the framebuffer emulation can only deal with such
> -	 * formats, specifically RGB/BGA formats.
> -	 */
> -	format = drm_mode_legacy_fb_format(bpp, depth);
> -	if (!format)
> -		goto err;
> +	format = drm_driver_color_mode_format(dev, color_mode);
> +	if (!format) {
> +		drm_info(dev, "unsupported color mode of %d\n", color_mode);
> +		return DRM_FORMAT_INVALID;
> +	}
>  
>  	for (i = 0; i < format_count; ++i) {
>  		if (formats[i] == format)
>  			return format;
>  	}
> -
> -err:
> -	/* We found nothing. */
> -	drm_warn(dev, "bpp/depth value of %u/%u not supported\n", bpp, depth);
> +	drm_warn(dev, "format %p4cc not supported\n", &format);
>  
>  	return DRM_FORMAT_INVALID;
>  }
>  
> -static uint32_t drm_fb_helper_find_color_mode_format(struct drm_fb_helper *fb_helper,
> -						     const uint32_t *formats, size_t format_count,
> -						     unsigned int color_mode)
> -{
> -	struct drm_device *dev = fb_helper->dev;
> -	uint32_t bpp, depth;
> -
> -	switch (color_mode) {
> -	case 1:
> -	case 2:
> -	case 4:
> -	case 8:
> -	case 16:
> -	case 24:
> -		bpp = depth = color_mode;
> -		break;
> -	case 15:
> -		bpp = 16;
> -		depth = 15;
> -		break;
> -	case 32:
> -		bpp = 32;
> -		depth = 24;
> -		break;
> -	default:
> -		drm_info(dev, "unsupported color mode of %d\n", color_mode);
> -		return DRM_FORMAT_INVALID;
> -	}
> -
> -	return drm_fb_helper_find_format(fb_helper, formats, format_count, bpp, depth);
> -}
> -
>  static int __drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper,
>  				      struct drm_fb_helper_surface_size *sizes)
>  {
> @@ -1531,10 +1491,10 @@ static int __drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper,
>  			if (!cmdline_mode->bpp_specified)
>  				continue;
>  
> -			surface_format = drm_fb_helper_find_color_mode_format(fb_helper,
> -									      plane->format_types,
> -									      plane->format_count,
> -									      cmdline_mode->bpp);
> +			surface_format = drm_fb_helper_find_format(fb_helper,
> +								   plane->format_types,
> +								   plane->format_count,
> +								   cmdline_mode->bpp);
>  			if (surface_format != DRM_FORMAT_INVALID)
>  				break; /* found supported format */
>  		}
> @@ -1544,10 +1504,10 @@ static int __drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper,
>  			break; /* found supported format */
>  
>  		/* try preferred color mode */
> -		surface_format = drm_fb_helper_find_color_mode_format(fb_helper,
> -								      plane->format_types,
> -								      plane->format_count,
> -								      fb_helper->preferred_bpp);
> +		surface_format = drm_fb_helper_find_format(fb_helper,
> +							   plane->format_types,
> +							   plane->format_count,
> +							   fb_helper->preferred_bpp);
>  		if (surface_format != DRM_FORMAT_INVALID)
>  			break; /* found supported format */
>  	}
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index 193cf8ed7912..3a94ca211f9c 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -36,7 +36,6 @@
>   * @depth: bit depth per pixel
>   *
>   * Computes a drm fourcc pixel format code for the given @bpp/@depth values.
> - * Useful in fbdev emulation code, since that deals in those values.
>   */
>  uint32_t drm_mode_legacy_fb_format(uint32_t bpp, uint32_t depth)
>  {
> @@ -140,6 +139,35 @@ uint32_t drm_driver_legacy_fb_format(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(drm_driver_legacy_fb_format);
>  
> +/**
> + * drm_driver_color_mode_format - Compute DRM 4CC code from color mode
> + * @dev: DRM device
> + * @color_mode: command-line color mode
> + *
> + * Computes a DRM 4CC pixel format code for the given color mode using
> + * drm_driver_color_mode(). The color mode is in the format used and the
> + * kernel command line. It specifies the number of bits per pixel
> + * and color depth in a single value.
> + *
> + * Useful in fbdev emulation code, since that deals in those values. The
> + * helper does not consider YUV or other complicated formats. This means
> + * only legacy formats are supported (fmt->depth is a legacy field), but
> + * the framebuffer emulation can only deal with such formats, specifically
> + * RGB/BGA formats.
> + */
> +uint32_t drm_driver_color_mode_format(struct drm_device *dev, unsigned int color_mode)
> +{
> +	switch (color_mode) {
> +	case 15:
> +		return drm_driver_legacy_fb_format(dev, 16, 15);
> +	case 32:
> +		return drm_driver_legacy_fb_format(dev, 32, 24);
> +	default:
> +		return drm_driver_legacy_fb_format(dev, color_mode, color_mode);
> +	}
> +}
> +EXPORT_SYMBOL(drm_driver_color_mode_format);
> +
>  /*
>   * Internal function to query information for a given format. See
>   * drm_format_info() for the public API.
> diff --git a/include/drm/drm_fourcc.h b/include/drm/drm_fourcc.h
> index ccf91daa4307..c3f4405d6662 100644
> --- a/include/drm/drm_fourcc.h
> +++ b/include/drm/drm_fourcc.h
> @@ -313,6 +313,7 @@ drm_get_format_info(struct drm_device *dev,
>  uint32_t drm_mode_legacy_fb_format(uint32_t bpp, uint32_t depth);
>  uint32_t drm_driver_legacy_fb_format(struct drm_device *dev,
>  				     uint32_t bpp, uint32_t depth);
> +uint32_t drm_driver_color_mode_format(struct drm_device *dev, unsigned int color_mode);
>  unsigned int drm_format_info_block_width(const struct drm_format_info *info,
>  					 int plane);
>  unsigned int drm_format_info_block_height(const struct drm_format_info *info,
> -- 
> 2.46.0
> 

-- 
Regards,

Laurent Pinchart
