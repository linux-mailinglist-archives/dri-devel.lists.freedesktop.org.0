Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C28B18A361D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 21:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104D010F7F3;
	Fri, 12 Apr 2024 19:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TYYdscFp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FE910F7F3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 19:03:37 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-16-252-nat.elisa-mobile.fi
 [85.76.16.252])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0831FA12;
 Fri, 12 Apr 2024 21:02:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1712948573;
 bh=6g9XhBGjy70BDzvLkZAGHtJoeYxS5XtLt0x8Yh43ilQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TYYdscFpu7/f3LnYDyFlGz5JyIBCNIP0uljw9ZxKLy/zX+BLkGClUv+SgUX+7Lumy
 xdkFayltMVlv02fyUxegYqVjTJR2brY8Er3ol7EDFEWi1cyykk3Fk97TIUu8qVGgbe
 r4dlGm4uRdx3NQdYv1ESxJD0/EdASToUvJoaCvuI=
Date: Fri, 12 Apr 2024 22:03:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, deller@gmx.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 30/43] drm/renesas/shmobile: Use fbdev-dma
Message-ID: <20240412185856.GM31122@pendragon.ideasonboard.com>
References: <20240410130557.31572-1-tzimmermann@suse.de>
 <20240410130557.31572-31-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240410130557.31572-31-tzimmermann@suse.de>
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

On Wed, Apr 10, 2024 at 03:02:26PM +0200, Thomas Zimmermann wrote:
> Implement fbdev emulation with fbdev-dma. Fbdev-dma now supports
> damage handling, which is required by shmobile. Avoids the overhead of
> fbdev-generic's additional shadow buffering. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> index e83c3e52251de..890cc2f6408d6 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> @@ -19,7 +19,7 @@
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
> -#include <drm/drm_fbdev_generic.h>
> +#include <drm/drm_fbdev_dma.h>
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_modeset_helper.h>
>  #include <drm/drm_module.h>
> @@ -250,7 +250,7 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto err_modeset_cleanup;
>  
> -	drm_fbdev_generic_setup(ddev, 16);
> +	drm_fbdev_dma_setup(ddev, 16);
>  
>  	return 0;
>  

-- 
Regards,

Laurent Pinchart
