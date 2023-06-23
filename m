Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 270EE73BD7D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 19:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE8510E689;
	Fri, 23 Jun 2023 17:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA9110E687
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 17:10:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CDF00838;
 Fri, 23 Jun 2023 19:09:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687540196;
 bh=I2KN4Hf4fDd8Jv18KuWnzfsxQ2rtmJLslT8JJroEUoQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gmwktHPIvCPJgpZIruuuJ2XqnTA3ekqhCzMXnoGe02a3FoXcEOIj/hTcRKONue687
 NkpDLiI7LAZfO6vnlGy4noMPAwMI5MWngztEL3Naa5s9S00/+23IHlKHhQiQ9+6bCO
 MgNTvTn6QPYN4CQtXWCWAAOii290hkn4dbCs7fjQ=
Date: Fri, 23 Jun 2023 20:10:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 32/39] drm: renesas: shmobile: Shutdown the display on
 remove
Message-ID: <20230623171031.GJ2112@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <2c28c0a137854d39b6bc997a21bd6d2db1f7a0a5.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2c28c0a137854d39b6bc997a21bd6d2db1f7a0a5.1687423204.git.geert+renesas@glider.be>
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
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Thu, Jun 22, 2023 at 11:21:44AM +0200, Geert Uytterhoeven wrote:
> When the device is unbound from the driver, the display may be active.
> Make sure it gets shut down.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> index a29c0c1093725b6e..636f1888b815579b 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
> @@ -16,6 +16,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/slab.h>
>  
> +#include <drm/drm_crtc_helper.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fbdev_generic.h>
>  #include <drm/drm_gem_dma_helper.h>
> @@ -145,6 +146,7 @@ static int shmob_drm_remove(struct platform_device *pdev)
>  	struct drm_device *ddev = &sdev->ddev;
>  
>  	drm_dev_unregister(ddev);
> +	drm_helper_force_disable_all(ddev);

I assume this will be turned into drm_atomic_helper_shutdown() later.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  	drm_kms_helper_poll_fini(ddev);
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart
