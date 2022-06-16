Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B8254DFA8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 13:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756FC10E55F;
	Thu, 16 Jun 2022 11:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2715510E55F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 11:04:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A379012FC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 04:04:49 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4B3C63F792
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 04:04:49 -0700 (PDT)
Date: Thu, 16 Jun 2022 12:04:47 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] drm/arm/hdlcd: Simplify IRQ install/uninstall
Message-ID: <YqsOTxOubhaXMaH8@e110455-lin.cambridge.arm.com>
References: <65cf7818b23c1a8629dc851f1d058ecb8a14849e.1655309413.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65cf7818b23c1a8629dc851f1d058ecb8a14849e.1655309413.git.robin.murphy@arm.com>
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 15, 2022 at 05:11:09PM +0100, Robin Murphy wrote:
> Since we no longer need to conform to the structure of the various DRM
> IRQ callbacks, we can streamline the code by consolidating the piecemeal
> functions and passing around our private data structure directly. We're
> also a platform device so should never see IRQ_NOTCONNECTED either.
> 
> Furthermore we can also get rid of all the unnecesary read-modify-write
> operations, since on install we know we cleared the whole interrupt mask
> before enabling the debug IRQs, and thus on uninstall we're always
> clearing everything as well.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Thanks for the cleanup!

Best regards,
Liviu

> ---
>  drivers/gpu/drm/arm/hdlcd_drv.c | 62 +++++++++------------------------
>  1 file changed, 16 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
> index 1f1171f2f16a..7d6aa9b3b577 100644
> --- a/drivers/gpu/drm/arm/hdlcd_drv.c
> +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
> @@ -41,8 +41,7 @@
>  
>  static irqreturn_t hdlcd_irq(int irq, void *arg)
>  {
> -	struct drm_device *drm = arg;
> -	struct hdlcd_drm_private *hdlcd = drm->dev_private;
> +	struct hdlcd_drm_private *hdlcd = arg;
>  	unsigned long irq_status;
>  
>  	irq_status = hdlcd_read(hdlcd, HDLCD_REG_INT_STATUS);
> @@ -70,61 +69,32 @@ static irqreturn_t hdlcd_irq(int irq, void *arg)
>  	return IRQ_HANDLED;
>  }
>  
> -static void hdlcd_irq_preinstall(struct drm_device *drm)
> -{
> -	struct hdlcd_drm_private *hdlcd = drm->dev_private;
> -	/* Ensure interrupts are disabled */
> -	hdlcd_write(hdlcd, HDLCD_REG_INT_MASK, 0);
> -	hdlcd_write(hdlcd, HDLCD_REG_INT_CLEAR, ~0);
> -}
> -
> -static void hdlcd_irq_postinstall(struct drm_device *drm)
> -{
> -#ifdef CONFIG_DEBUG_FS
> -	struct hdlcd_drm_private *hdlcd = drm->dev_private;
> -	unsigned long irq_mask = hdlcd_read(hdlcd, HDLCD_REG_INT_MASK);
> -
> -	/* enable debug interrupts */
> -	irq_mask |= HDLCD_DEBUG_INT_MASK;
> -
> -	hdlcd_write(hdlcd, HDLCD_REG_INT_MASK, irq_mask);
> -#endif
> -}
> -
> -static int hdlcd_irq_install(struct drm_device *drm, int irq)
> +static int hdlcd_irq_install(struct hdlcd_drm_private *hdlcd)
>  {
>  	int ret;
>  
> -	if (irq == IRQ_NOTCONNECTED)
> -		return -ENOTCONN;
> +	/* Ensure interrupts are disabled */
> +	hdlcd_write(hdlcd, HDLCD_REG_INT_MASK, 0);
> +	hdlcd_write(hdlcd, HDLCD_REG_INT_CLEAR, ~0);
>  
> -	hdlcd_irq_preinstall(drm);
> -
> -	ret = request_irq(irq, hdlcd_irq, 0, drm->driver->name, drm);
> +	ret = request_irq(hdlcd->irq, hdlcd_irq, 0, "hdlcd", hdlcd);
>  	if (ret)
>  		return ret;
>  
> -	hdlcd_irq_postinstall(drm);
> +#ifdef CONFIG_DEBUG_FS
> +	/* enable debug interrupts */
> +	hdlcd_write(hdlcd, HDLCD_REG_INT_MASK, HDLCD_DEBUG_INT_MASK);
> +#endif
>  
>  	return 0;
>  }
>  
> -static void hdlcd_irq_uninstall(struct drm_device *drm)
> +static void hdlcd_irq_uninstall(struct hdlcd_drm_private *hdlcd)
>  {
> -	struct hdlcd_drm_private *hdlcd = drm->dev_private;
>  	/* disable all the interrupts that we might have enabled */
> -	unsigned long irq_mask = hdlcd_read(hdlcd, HDLCD_REG_INT_MASK);
> +	hdlcd_write(hdlcd, HDLCD_REG_INT_MASK, 0);
>  
> -#ifdef CONFIG_DEBUG_FS
> -	/* disable debug interrupts */
> -	irq_mask &= ~HDLCD_DEBUG_INT_MASK;
> -#endif
> -
> -	/* disable vsync interrupts */
> -	irq_mask &= ~HDLCD_INTERRUPT_VSYNC;
> -	hdlcd_write(hdlcd, HDLCD_REG_INT_MASK, irq_mask);
> -
> -	free_irq(hdlcd->irq, drm);
> +	free_irq(hdlcd->irq, hdlcd);
>  }
>  
>  static int hdlcd_load(struct drm_device *drm, unsigned long flags)
> @@ -184,7 +154,7 @@ static int hdlcd_load(struct drm_device *drm, unsigned long flags)
>  		goto irq_fail;
>  	hdlcd->irq = ret;
>  
> -	ret = hdlcd_irq_install(drm, hdlcd->irq);
> +	ret = hdlcd_irq_install(hdlcd);
>  	if (ret < 0) {
>  		DRM_ERROR("failed to install IRQ handler\n");
>  		goto irq_fail;
> @@ -342,7 +312,7 @@ static int hdlcd_drm_bind(struct device *dev)
>  err_unload:
>  	of_node_put(hdlcd->crtc.port);
>  	hdlcd->crtc.port = NULL;
> -	hdlcd_irq_uninstall(drm);
> +	hdlcd_irq_uninstall(hdlcd);
>  	of_reserved_mem_device_release(drm->dev);
>  err_free:
>  	drm_mode_config_cleanup(drm);
> @@ -364,7 +334,7 @@ static void hdlcd_drm_unbind(struct device *dev)
>  	hdlcd->crtc.port = NULL;
>  	pm_runtime_get_sync(dev);
>  	drm_atomic_helper_shutdown(drm);
> -	hdlcd_irq_uninstall(drm);
> +	hdlcd_irq_uninstall(hdlcd);
>  	pm_runtime_put(dev);
>  	if (pm_runtime_enabled(dev))
>  		pm_runtime_disable(dev);
> -- 
> 2.36.1.dirty
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
