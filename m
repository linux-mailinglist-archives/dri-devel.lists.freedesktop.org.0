Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E870DA84D1D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 21:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0427010EA57;
	Thu, 10 Apr 2025 19:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mf03T6AU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C3A10EA45;
 Thu, 10 Apr 2025 19:33:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B62D6352;
 Thu, 10 Apr 2025 21:31:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1744313489;
 bh=AfMV5ii+//nrP/aIKkgYKJiqv7uxXU1I8L9vQW3g5Y8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mf03T6AUu9bNuClTNjLUSdSSseK04EU5UuYOgBQ/67vcVoQKh/1YbRGXsfGZ4o0QF
 FAoKhGffntSg0o9ZlBeeMbAKOcPE/fegcFl4w1xUy1nKa1qeoyI0pq80SfqtUIM9JF
 pBGqWzGxbzZWtK68ewosP6sAjqcKPOCYvLimqamk=
Date: Thu, 10 Apr 2025 22:33:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 03/19] drm: Look up the format info earlier
Message-ID: <20250410193302.GC27834@pendragon.ideasonboard.com>
References: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
 <20250410163218.15130-4-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410163218.15130-4-ville.syrjala@linux.intel.com>
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

Hi Ville,

Thank you for the patch.

On Thu, Apr 10, 2025 at 07:32:02PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Looks up the format info in already drm_internal_framebuffer_create()
> so that we can later pass it along to .fb_create(). Currently various
> drivers are doing additional lookups in their .fb_create()
> implementations, and these lookups are rather expensive now (given
> how many different pixel formats we have).

That's a separate issue, but would it be worth using a data structure
that supports more efficient lookup ?

> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_framebuffer.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> index 18a0267e374e..ae09ef6977b2 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -153,18 +153,11 @@ int drm_mode_addfb_ioctl(struct drm_device *dev,
>  }
>  
>  static int framebuffer_check(struct drm_device *dev,
> +			     const struct drm_format_info *info,
>  			     const struct drm_mode_fb_cmd2 *r)
>  {
> -	const struct drm_format_info *info;
>  	int i;
>  
> -	/* check if the format is supported at all */
> -	if (!__drm_format_info(r->pixel_format)) {
> -		drm_dbg_kms(dev, "bad framebuffer format %p4cc\n",
> -			    &r->pixel_format);
> -		return -EINVAL;
> -	}
> -
>  	if (r->width == 0) {
>  		drm_dbg_kms(dev, "bad framebuffer width %u\n", r->width);
>  		return -EINVAL;
> @@ -175,9 +168,6 @@ static int framebuffer_check(struct drm_device *dev,
>  		return -EINVAL;
>  	}
>  
> -	/* now let the driver pick its own format info */
> -	info = drm_get_format_info(dev, r->pixel_format, r->modifier[0]);
> -
>  	for (i = 0; i < info->num_planes; i++) {
>  		unsigned int width = drm_format_info_plane_width(info, r->width, i);
>  		unsigned int height = drm_format_info_plane_height(info, r->height, i);
> @@ -272,6 +262,7 @@ drm_internal_framebuffer_create(struct drm_device *dev,
>  				struct drm_file *file_priv)
>  {
>  	struct drm_mode_config *config = &dev->mode_config;
> +	const struct drm_format_info *info;
>  	struct drm_framebuffer *fb;
>  	int ret;
>  
> @@ -297,7 +288,17 @@ drm_internal_framebuffer_create(struct drm_device *dev,
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> -	ret = framebuffer_check(dev, r);
> +	/* check if the format is supported at all */
> +	if (!__drm_format_info(r->pixel_format)) {
> +		drm_dbg_kms(dev, "bad framebuffer format %p4cc\n",
> +			    &r->pixel_format);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	/* now let the driver pick its own format info */
> +	info = drm_get_format_info(dev, r->pixel_format, r->modifier[0]);
> +
> +	ret = framebuffer_check(dev, info, r);
>  	if (ret)
>  		return ERR_PTR(ret);
>  

-- 
Regards,

Laurent Pinchart
