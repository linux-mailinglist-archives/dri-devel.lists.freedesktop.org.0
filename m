Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C581DF065
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 22:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3FD66E0F5;
	Fri, 22 May 2020 20:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E56C6E0F5
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 20:12:53 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 19C22528;
 Fri, 22 May 2020 22:12:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590178372;
 bh=I+wZgpNyVcUimjh6VCYSsmatF8H/txRwMkFNilu6/xA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pl4y4wPCvM0wzr32mkeGQecK3ivGpVncrOxu/JWvZmuDCIASvWImob/z3zdIzztyx
 JC1zgtxonkYg+SsFbRTCdhSQtAsGnQ7dI1ArO30S8hubFKQ5Eh7817Sk5o/0fs09Ww
 ubZXGe+/77HZFnUilfU4RYpFw6ASBDHe3hVm91ZQ=
Date: Fri, 22 May 2020 23:12:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 15/21] drm/rcar-du: Use GEM CMA object functions
Message-ID: <20200522201240.GE5824@pendragon.ideasonboard.com>
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-16-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200522135246.10134-16-tzimmermann@suse.de>
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
Cc: alexandre.belloni@bootlin.com, linux-aspeed@lists.ozlabs.org,
 narmstrong@baylibre.com, airlied@linux.ie, liviu.dudau@arm.com,
 philippe.cornu@st.com, paul@crapouillou.net, mihail.atanassov@arm.com,
 sam@ravnborg.org, alexandre.torgue@st.com, marex@denx.de,
 abrodkin@synopsys.com, ludovic.desroches@microchip.com,
 xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com, tomi.valkeinen@ti.com,
 james.qian.wang@arm.com, joel@jms.id.au, linux-imx@nxp.com,
 puck.chen@hisilicon.com, s.hauer@pengutronix.de, alison.wang@nxp.com,
 jsarha@ti.com, wens@csie.org, vincent.abriou@st.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 bbrezillon@kernel.org, andrew@aj.id.au, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, yannick.fertre@st.com,
 kieran.bingham+renesas@ideasonboard.com, khilman@baylibre.com,
 zourongrong@gmail.com, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Thank you for the patch.

On Fri, May 22, 2020 at 03:52:40PM +0200, Thomas Zimmermann wrote:
> The rcar-du driver uses the default implementation for CMA functions;
> except for the .dumb_create callback. The __DRM_GEM_CMA_DRIVER_OPS macro
> now sets these defaults and .dumb_create in struct drm_driver. All
> remaining operations are provided by CMA GEM object functions.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 3e67cf70f0402..3728038cec1d1 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -476,16 +476,7 @@ DEFINE_DRM_GEM_CMA_FOPS(rcar_du_fops);
>  
>  static struct drm_driver rcar_du_driver = {
>  	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> -	.gem_free_object_unlocked = drm_gem_cma_free_object,
> -	.gem_vm_ops		= &drm_gem_cma_vm_ops,
> -	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
> -	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
> -	.gem_prime_get_sg_table	= drm_gem_cma_prime_get_sg_table,
> -	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
> -	.gem_prime_vmap		= drm_gem_cma_prime_vmap,
> -	.gem_prime_vunmap	= drm_gem_cma_prime_vunmap,
> -	.gem_prime_mmap		= drm_gem_cma_prime_mmap,
> -	.dumb_create		= rcar_du_dumb_create,
> +	__DRM_GEM_CMA_DRIVER_OPS(rcar_du_dumb_create),

Your __DRM_GEM_CMA_DRIVER_OPS is defined as

#define __DRM_GEM_CMA_DRIVER_OPS(__dumb_create) \
        .gem_create_object      = drm_cma_gem_create_object_default_funcs, \
        .dumb_create            = (__dumb_create), \
        .prime_handle_to_fd     = drm_gem_prime_handle_to_fd, \
        .prime_fd_to_handle     = drm_gem_prime_fd_to_handle, \
        .gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table_vmap, \
        .gem_prime_mmap         = drm_gem_prime_mmap

The patch thus introduces several changes:

- drm_gem_cma_prime_import_sg_table_vmap() is used instead of
  drm_gem_cma_prime_import_sg_table() combined with .gem_prime_vmap()
  and .gem_prime_vunmap(). I believe that's fine, but splitting that
  change in a separate commit, or at the very least explaining it in
  details in the commit message, would make review easier.

- .gem_create_object() is now set. That seems to be OK, but I'm not sure
  to grasp all the implications. This should also be explained in the
  commit message, and ideally split to a separate patch.

- drm_gem_cma_prime_mmap() is replaced with drm_gem_prime_mmap(). Same
  comments :-)

This patch hides way too many changes in what is documented as just
innocent refactoring. It seems other drivers are affected too.

>  	.fops			= &rcar_du_fops,
>  	.name			= "rcar-du",
>  	.desc			= "Renesas R-Car Display Unit",

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
