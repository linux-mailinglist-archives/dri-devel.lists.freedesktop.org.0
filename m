Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 838451EF2FA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 10:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 675FE6E8B3;
	Fri,  5 Jun 2020 08:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A46D6E8B3
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 08:21:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FB9727C;
 Fri,  5 Jun 2020 10:20:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1591345260;
 bh=0cyIgC4IjixPMi3lMu+OWHjlihDlgkF27Lc4nUgZHG8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ttG10UHqRtqI4l7rdt8oKRF/ytPrZ0J0CE2+xY6UcJel9kj8yux9qYLRWlR7SExUU
 8ZBxUuf/3NaOGton7EWaXEQvQGfdF7B/R0DhuFZCWakywJ93E1EBGpqtQdWU7RLxKF
 GpURVRU0hpQOD0ndUC+7AsLwzx0RlMXP/bX+gB+M=
Date: Fri, 5 Jun 2020 11:20:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 31/43] drm/shmobile: Use GEM CMA object functions
Message-ID: <20200605082040.GB9325@pendragon.ideasonboard.com>
References: <20200605073247.4057-1-tzimmermann@suse.de>
 <20200605073247.4057-32-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200605073247.4057-32-tzimmermann@suse.de>
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
 james.qian.wang@arm.com, joel@jms.id.au,
 Emil Velikov <emil.velikov@collabora.com>, linux-imx@nxp.com,
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

On Fri, Jun 05, 2020 at 09:32:35AM +0200, Thomas Zimmermann wrote:
> Create GEM objects with drm_gem_cma_create_object_default_funcs(), which
> allocates the object and sets CMA's default object functions. Corresponding
> callbacks in struct drm_driver are cleared. No functional changes are made.
> 
> Driver and object-function instances use the same callback functions, with
> the exception of vunmap. The implementation of vunmap is empty and left out
> in CMA's default object functions.
> 
> v3:
> 	* convert to DRIVER_OPS macro in a separate patch
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Emil Velikov <emil.velikov@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> index ae9d6b8d3ca87..e209610d4b8a1 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> @@ -131,14 +131,10 @@ DEFINE_DRM_GEM_CMA_FOPS(shmob_drm_fops);
>  static struct drm_driver shmob_drm_driver = {
>  	.driver_features	= DRIVER_GEM | DRIVER_MODESET,
>  	.irq_handler		= shmob_drm_irq,
> -	.gem_free_object_unlocked = drm_gem_cma_free_object,
> -	.gem_vm_ops		= &drm_gem_cma_vm_ops,
> +	.gem_create_object	= drm_gem_cma_create_object_default_funcs,
>  	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
> -	.gem_prime_get_sg_table	= drm_gem_cma_prime_get_sg_table,
>  	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
> -	.gem_prime_vmap		= drm_gem_cma_prime_vmap,
> -	.gem_prime_vunmap	= drm_gem_cma_prime_vunmap,
>  	.gem_prime_mmap		= drm_gem_cma_prime_mmap,
>  	.dumb_create		= drm_gem_cma_dumb_create,
>  	.fops			= &shmob_drm_fops,
> -- 
> 2.26.2
> 

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
