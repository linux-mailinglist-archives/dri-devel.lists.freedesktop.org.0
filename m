Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 188F88A3610
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 20:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF8610F7E1;
	Fri, 12 Apr 2024 18:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="heg5wQ1/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A3510F7ED
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 18:57:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-16-252-nat.elisa-mobile.fi
 [85.76.16.252])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 276E99D5;
 Fri, 12 Apr 2024 20:56:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1712948210;
 bh=EQ6Lmy5pGSwuV/tq+q7lx5fLarfb7SpMCoGAnUzNdmQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=heg5wQ1/OiOxSF4jNQ+5JzQD8R+2hMo3gbGy9lxCC0u/klzDgBZOrGnyLajzoZUSI
 B9zef6hH+nDHEGxBc0fKBKCekVJdQDIM5bZLWbr2ST6XQdeGWGW9uE4aCPFlhXwq5Y
 IDY0aB6mBLXZA/DlumEmhGAqj9sGGOGwDG9XPGtA=
Date: Fri, 12 Apr 2024 21:57:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, deller@gmx.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 28/43] drm/renesas/rcar-du: Use fbdev-dma
Message-ID: <20240412185724.GL31122@pendragon.ideasonboard.com>
References: <20240410130557.31572-1-tzimmermann@suse.de>
 <20240410130557.31572-29-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240410130557.31572-29-tzimmermann@suse.de>
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

On Wed, Apr 10, 2024 at 03:02:24PM +0200, Thomas Zimmermann wrote:
> Implement fbdev emulation with fbdev-dma. Fbdev-dma now supports
> damage handling, which is required by rcar-du. Avoids the overhead of
> fbdev-generic's additional shadow buffering. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

On a side note, I noticed that drm_fbdev_generic_client_funcs and
drm_fbdev_dma_client_funcs point to functions that are identical. Would
there be a way to avoid the code duplication ?

> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> index dee530e4c8b27..fb719d9aff10d 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> @@ -20,7 +20,7 @@
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
> -#include <drm/drm_fbdev_generic.h>
> +#include <drm/drm_fbdev_dma.h>
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_probe_helper.h>
> @@ -716,7 +716,7 @@ static int rcar_du_probe(struct platform_device *pdev)
>  
>  	drm_info(&rcdu->ddev, "Device %s probed\n", dev_name(&pdev->dev));
>  
> -	drm_fbdev_generic_setup(&rcdu->ddev, 32);
> +	drm_fbdev_dma_setup(&rcdu->ddev, 32);
>  
>  	return 0;
>  

-- 
Regards,

Laurent Pinchart
