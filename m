Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C13C1DEFA4
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 21:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEDBA6EA33;
	Fri, 22 May 2020 19:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693EE6EA2F
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 19:03:32 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 479FB2003F;
 Fri, 22 May 2020 21:03:21 +0200 (CEST)
Date: Fri, 22 May 2020 21:03:19 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 21/21] drm/zte: Use GEM CMA object functions
Message-ID: <20200522190319.GA1516455@ravnborg.org>
References: <20200522135246.10134-1-tzimmermann@suse.de>
 <20200522135246.10134-22-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200522135246.10134-22-tzimmermann@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=psi0o7j7SJAdWKNW5w4A:9 a=CjuIK1q_8ugA:10
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
 philippe.cornu@st.com, paul@crapouillou.net, laurent.pinchart@ideasonboard.com,
 mihail.atanassov@arm.com, alexandre.torgue@st.com, marex@denx.de,
 khilman@baylibre.com, abrodkin@synopsys.com, ludovic.desroches@microchip.com,
 xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com, tomi.valkeinen@ti.com,
 james.qian.wang@arm.com, joel@jms.id.au, linux-imx@nxp.com,
 puck.chen@hisilicon.com, s.hauer@pengutronix.de, alison.wang@nxp.com,
 jsarha@ti.com, wens@csie.org, vincent.abriou@st.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 bbrezillon@kernel.org, andrew@aj.id.au, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, yannick.fertre@st.com,
 kieran.bingham+renesas@ideasonboard.com, zourongrong@gmail.com,
 shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

On Fri, May 22, 2020 at 03:52:46PM +0200, Thomas Zimmermann wrote:
> The zte driver uses the default implementation for CMA functions. The
> DRM_GEM_CMA_DRIVER_OPS macro now sets these defaults in struct drm_driver.
> All remaining operations are provided by CMA GEM object functions.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/zte/zx_drm_drv.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/zte/zx_drm_drv.c b/drivers/gpu/drm/zte/zx_drm_drv.c
> index 1141c1ed1ed04..42c59eae0ea03 100644
> --- a/drivers/gpu/drm/zte/zx_drm_drv.c
> +++ b/drivers/gpu/drm/zte/zx_drm_drv.c
> @@ -36,16 +36,7 @@ DEFINE_DRM_GEM_CMA_FOPS(zx_drm_fops);
>  
>  static struct drm_driver zx_drm_driver = {
>  	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> -	.gem_free_object_unlocked = drm_gem_cma_free_object,
> -	.gem_vm_ops = &drm_gem_cma_vm_ops,
> -	.dumb_create = drm_gem_cma_dumb_create,
> -	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
> -	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> -	.gem_prime_get_sg_table = drm_gem_cma_prime_get_sg_table,
> -	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
> -	.gem_prime_vmap = drm_gem_cma_prime_vmap,
> -	.gem_prime_vunmap = drm_gem_cma_prime_vunmap,
> -	.gem_prime_mmap = drm_gem_cma_prime_mmap,
> +	DRM_GEM_CMA_VMAP_DRIVER_OPS,
s/_VMAP// as pointed out by Emil.

	Sam

>  	.fops = &zx_drm_fops,
>  	.name = "zx-vou",
>  	.desc = "ZTE VOU Controller DRM",
> -- 
> 2.26.2
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
