Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F029C3C3337
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 08:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3537B6EAD9;
	Sat, 10 Jul 2021 06:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9E36EAD9
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 06:33:51 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id c67d0847-e148-11eb-9082-0050568c148b;
 Sat, 10 Jul 2021 06:33:44 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 9852C194B05;
 Sat, 10 Jul 2021 08:33:58 +0200 (CEST)
Date: Sat, 10 Jul 2021 08:33:47 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/ingenic: Convert to Linux IRQ interfaces
Message-ID: <YOk/S1MTPWEbe93Y@ravnborg.org>
References: <20210706074409.8664-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210706074409.8664-1-tzimmermann@suse.de>
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
Cc: paul@crapouillou.net, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Tue, Jul 06, 2021 at 09:44:09AM +0200, Thomas Zimmermann wrote:
> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
> don't benefit from using it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index c296472164d9..a09b7da21b53 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -33,7 +33,6 @@
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> -#include <drm/drm_irq.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
> @@ -799,8 +798,6 @@ static const struct drm_driver ingenic_drm_driver_data = {
>  	.fops			= &ingenic_drm_fops,
>  	.gem_create_object	= ingenic_drm_gem_create_object,
>  	DRM_GEM_CMA_DRIVER_OPS,
> -
> -	.irq_handler		= ingenic_drm_irq_handler,
>  };
>  
>  static const struct drm_plane_funcs ingenic_drm_primary_plane_funcs = {
> @@ -1098,7 +1095,7 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
>  		encoder->possible_clones = clone_mask;
>  	}
>  
> -	ret = drm_irq_install(drm, irq);
> +	ret = request_irq(irq, ingenic_drm_irq_handler, 0, drm->driver->name, drm);
>  	if (ret) {
>  		dev_err(dev, "Unable to install IRQ handler\n");
>  		return ret;
> @@ -1192,14 +1189,18 @@ static void ingenic_drm_unbind(struct device *dev)
>  {
>  	struct ingenic_drm *priv = dev_get_drvdata(dev);
>  	struct clk *parent_clk = clk_get_parent(priv->pix_clk);
> +	struct drm_device *drm = &priv->drm;
> +	struct platform_device *pdev = to_platform_device(drm->dev);
> +
> +	free_irq(platform_get_irq(pdev, 0), drm);

The driver was missing a drm_irq_uninstall() so the above code is
actually a small bug-fix. It should be mentioned in the changelog.
With this fixed:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Note: I expect Paul to review too and apply.

	Sam

>  
>  	clk_notifier_unregister(parent_clk, &priv->clock_nb);
>  	if (priv->lcd_clk)
>  		clk_disable_unprepare(priv->lcd_clk);
>  	clk_disable_unprepare(priv->pix_clk);
>  
> -	drm_dev_unregister(&priv->drm);
> -	drm_atomic_helper_shutdown(&priv->drm);
> +	drm_dev_unregister(drm);
> +	drm_atomic_helper_shutdown(drm);
>  }
>  
>  static const struct component_master_ops ingenic_master_ops = {
> -- 
> 2.32.0
