Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FB5955EDB
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 22:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95D410E161;
	Sun, 18 Aug 2024 20:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kvXAvYz3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4D510E072;
 Sun, 18 Aug 2024 20:17:32 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF2021BA;
 Sun, 18 Aug 2024 22:16:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1724012190;
 bh=cABIjGnHzMEjY+dT+o/26NPhOjhR+aSTa9r+OXW9U9w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kvXAvYz3REWYb8JAXBxnD7SD2sZXnaXbOk9/4yUlMOzRuVP5yThBr+P1s7dhNDwIn
 JpYBNlyPAbMIR45rw9uWUDBsgls4oZke805HU8AXpD392Mq+k9teVFGX7c5wBtD5dG
 MVPRWimlKUnE2X8oCjiTPa7+Gk4H42QXAs8U1DAI=
Date: Sun, 18 Aug 2024 23:17:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 36/86] drm/renesas/shmobile: Run DRM default client setup
Message-ID: <20240818201704.GH29465@pendragon.ideasonboard.com>
References: <20240816125408.310253-1-tzimmermann@suse.de>
 <20240816125408.310253-37-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240816125408.310253-37-tzimmermann@suse.de>
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

On Fri, Aug 16, 2024 at 02:23:02PM +0200, Thomas Zimmermann wrote:
> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> index ff2883c7fd46..e82624836c97 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> @@ -18,8 +18,10 @@
>  #include <linux/slab.h>
>  
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_client_setup.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fbdev_dma.h>
> +#include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_modeset_helper.h>
>  #include <drm/drm_module.h>
> @@ -101,6 +103,7 @@ DEFINE_DRM_GEM_DMA_FOPS(shmob_drm_fops);
>  static const struct drm_driver shmob_drm_driver = {
>  	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	DRM_GEM_DMA_DRIVER_OPS,
> +	DRM_FBDEV_DMA_DRIVER_OPS,
>  	.fops			= &shmob_drm_fops,
>  	.name			= "shmob-drm",
>  	.desc			= "Renesas SH Mobile DRM",
> @@ -257,7 +260,7 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto err_modeset_cleanup;
>  
> -	drm_fbdev_dma_setup(ddev, 16);
> +	drm_client_setup(ddev, drm_format_info(DRM_FORMAT_RGB565));
>  
>  	return 0;
>  

-- 
Regards,

Laurent Pinchart
