Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C90085BAC37
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 13:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF45410EBD1;
	Fri, 16 Sep 2022 11:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178B610EBD1;
 Fri, 16 Sep 2022 11:20:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [89.101.193.71])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4ED347C;
 Fri, 16 Sep 2022 13:20:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1663327250;
 bh=2bBPYXQKqkqV3YMm/hqktXNm0FFG8cQdhQqtXYH72r4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GGsyf2/i7va9mwWXnFAcJKyEbiQNaaod1LYrAN7+GR2kz8pmoppZu5AhD5ikYnfsv
 eriM8n1GedVgKPamlPLSkvsYHxuGC27VCxx4BpdxF0DgRAoKZHO0a3rP8Kmm3NZRPV
 C+IyWx1U37B277KfMyErvS3L2XhLqLlvJ8ZNLhXs=
Date: Fri, 16 Sep 2022 14:20:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/4] drm/plane-helper: Warn if atomic drivers call
 non-atomic helpers
Message-ID: <YyRcA/aqx44NvfwT@pendragon.ideasonboard.com>
References: <20220909105947.6487-1-tzimmermann@suse.de>
 <20220909105947.6487-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220909105947.6487-4-tzimmermann@suse.de>
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
Cc: tomba@kernel.org, kherbst@redhat.com, airlied@linux.ie, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com, bskeggs@redhat.com,
 nouveau@lists.freedesktop.org, jyri.sarha@iki.fi
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Thank you for the patch.

On Fri, Sep 09, 2022 at 12:59:46PM +0200, Thomas Zimmermann wrote:
> The plane update and disable helpers are only useful for non-atomic
> drivers. Print a warning if an atomic driver calls them.
> 
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_plane_helper.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
> index c7785967f5bf..1c904fc26a58 100644
> --- a/drivers/gpu/drm/drm_plane_helper.c
> +++ b/drivers/gpu/drm/drm_plane_helper.c
> @@ -30,8 +30,10 @@
>  #include <drm/drm_atomic_uapi.h>
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_plane_helper.h>
> +#include <drm/drm_print.h>
>  #include <drm/drm_rect.h>
>  
>  #define SUBPIXEL_MASK 0xffff
> @@ -195,10 +197,14 @@ int drm_plane_helper_update_primary(struct drm_plane *plane, struct drm_crtc *cr
>  		.x2 = crtc_x + crtc_w,
>  		.y2 = crtc_y + crtc_h,
>  	};
> +	struct drm_device *dev = plane->dev;
>  	struct drm_connector **connector_list;
>  	int num_connectors, ret;
>  	bool visible;
>  
> +	if (drm_WARN_ON_ONCE(dev, drm_drv_uses_atomic_modeset(dev)))
> +		return -EINVAL;
> +
>  	ret = drm_plane_helper_check_update(plane, crtc, fb,
>  					    &src, &dest,
>  					    DRM_MODE_ROTATE_0,
> @@ -260,6 +266,10 @@ EXPORT_SYMBOL(drm_plane_helper_update_primary);
>  int drm_plane_helper_disable_primary(struct drm_plane *plane,
>  				     struct drm_modeset_acquire_ctx *ctx)
>  {
> +	struct drm_device *dev = plane->dev;
> +
> +	drm_WARN_ON_ONCE(dev, drm_drv_uses_atomic_modeset(dev));
> +
>  	return -EINVAL;
>  }
>  EXPORT_SYMBOL(drm_plane_helper_disable_primary);

-- 
Regards,

Laurent Pinchart
