Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 492AB955ED2
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 22:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9572E10E15D;
	Sun, 18 Aug 2024 20:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="C9vVDF75";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D1910E11F;
 Sun, 18 Aug 2024 20:13:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8523B8A9;
 Sun, 18 Aug 2024 22:12:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1724011944;
 bh=spm+vGN5EQwtcVCujDzNDZ7flxfLEHLbATgJd0V/Lak=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C9vVDF75BUE5ZLkO/xuAvAQWELzrAqkTOiHzLi6osl3dBZAu9oZiZo28SGbCiHPuu
 73xgjo292b0Nv4TVLOT23T8louYR2JIVQpsxBDZVTIBjgooefFcYwADUJuhYpq6JWU
 ZZkB5gVoEFzMCTgYaHuA2JtOT1aMcpd54BdNgpHA=
Date: Sun, 18 Aug 2024 23:12:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH 34/86] drm/renesas/rcar-du: Run DRM default client setup
Message-ID: <20240818201258.GG29465@pendragon.ideasonboard.com>
References: <20240816125408.310253-1-tzimmermann@suse.de>
 <20240816125408.310253-35-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240816125408.310253-35-tzimmermann@suse.de>
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

On Fri, Aug 16, 2024 at 02:23:00PM +0200, Thomas Zimmermann wrote:
> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
> 
> The rcar-du driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> index fb719d9aff10..4e0bafc86f50 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> @@ -19,6 +19,7 @@
>  #include <linux/wait.h>
>  
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_client_setup.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fbdev_dma.h>
>  #include <drm/drm_gem_dma_helper.h>
> @@ -606,6 +607,7 @@ static const struct drm_driver rcar_du_driver = {
>  	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.dumb_create		= rcar_du_dumb_create,
>  	.gem_prime_import_sg_table = rcar_du_gem_prime_import_sg_table,
> +	DRM_FBDEV_DMA_DRIVER_OPS,
>  	.fops			= &rcar_du_fops,
>  	.name			= "rcar-du",
>  	.desc			= "Renesas R-Car Display Unit",
> @@ -716,7 +718,7 @@ static int rcar_du_probe(struct platform_device *pdev)
>  
>  	drm_info(&rcdu->ddev, "Device %s probed\n", dev_name(&pdev->dev));
>  
> -	drm_fbdev_dma_setup(&rcdu->ddev, 32);
> +	drm_client_setup(&rcdu->ddev, NULL);
>  
>  	return 0;
>  

-- 
Regards,

Laurent Pinchart
