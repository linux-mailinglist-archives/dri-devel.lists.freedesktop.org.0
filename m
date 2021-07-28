Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA5C3D8F17
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 15:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD6A6E81A;
	Wed, 28 Jul 2021 13:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641226E81A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 13:31:43 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 2ec98f11-efa8-11eb-8d1a-0050568cd888;
 Wed, 28 Jul 2021 13:31:58 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id A1391194BAD;
 Wed, 28 Jul 2021 15:32:00 +0200 (CEST)
Date: Wed, 28 Jul 2021 15:31:37 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 02/14] drm/arm/hdlcd: Convert to Linux IRQ interfaces
Message-ID: <YQFcOU79/lpbt1VW@ravnborg.org>
References: <20210727182721.17981-1-tzimmermann@suse.de>
 <20210727182721.17981-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727182721.17981-3-tzimmermann@suse.de>
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
Cc: airlied@linux.ie, liviu.dudau@arm.com, amd-gfx@lists.freedesktop.org,
 anitha.chrisanthus@intel.com, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, edmund.j.dea@intel.com,
 s.hauer@pengutronix.de, alison.wang@nxp.com, dri-devel@lists.freedesktop.org,
 sean@poorly.run, linux-arm-kernel@lists.infradead.org, tomba@kernel.org,
 bbrezillon@kernel.org, jyri.sarha@iki.fi, nicolas.ferre@microchip.com,
 christian.koenig@amd.com, kernel@pengutronix.de, alexander.deucher@amd.com,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Tue, Jul 27, 2021 at 08:27:09PM +0200, Thomas Zimmermann wrote:
> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
> don't benefit from using it.
> 
> DRM IRQ callbacks are now being called directly or inlined.
> 
> Calls to platform_get_irq() can fail with a negative errno code.
> Abort initialization in this case. The DRM IRQ midlayer does not
> handle this case correctly.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/arm/hdlcd_drv.c | 174 ++++++++++++++++++--------------
>  drivers/gpu/drm/arm/hdlcd_drv.h |   1 +
>  2 files changed, 97 insertions(+), 78 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
> index 81ae92390736..b9998fe3982f 100644
> --- a/drivers/gpu/drm/arm/hdlcd_drv.c
> +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
> @@ -29,7 +29,6 @@
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> -#include <drm/drm_irq.h>
>  #include <drm/drm_modeset_helper.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_probe_helper.h>
> @@ -38,6 +37,94 @@
>  #include "hdlcd_drv.h"
>  #include "hdlcd_regs.h"
>  
> +static irqreturn_t hdlcd_irq(int irq, void *arg)
> +{
> +	struct drm_device *drm = arg;
> +	struct hdlcd_drm_private *hdlcd = drm->dev_private;
> +	unsigned long irq_status;
> +
> +	irq_status = hdlcd_read(hdlcd, HDLCD_REG_INT_STATUS);
> +
> +#ifdef CONFIG_DEBUG_FS
> +	if (irq_status & HDLCD_INTERRUPT_UNDERRUN)
> +		atomic_inc(&hdlcd->buffer_underrun_count);
> +
> +	if (irq_status & HDLCD_INTERRUPT_DMA_END)
> +		atomic_inc(&hdlcd->dma_end_count);
> +
> +	if (irq_status & HDLCD_INTERRUPT_BUS_ERROR)
> +		atomic_inc(&hdlcd->bus_error_count);
> +
> +	if (irq_status & HDLCD_INTERRUPT_VSYNC)
> +		atomic_inc(&hdlcd->vsync_count);
> +
> +#endif
> +	if (irq_status & HDLCD_INTERRUPT_VSYNC)
> +		drm_crtc_handle_vblank(&hdlcd->crtc);
> +
> +	/* acknowledge interrupt(s) */
> +	hdlcd_write(hdlcd, HDLCD_REG_INT_CLEAR, irq_status);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void hdlcd_irq_preinstall(struct drm_device *drm)
> +{
> +	struct hdlcd_drm_private *hdlcd = drm->dev_private;
> +	/* Ensure interrupts are disabled */
> +	hdlcd_write(hdlcd, HDLCD_REG_INT_MASK, 0);
> +	hdlcd_write(hdlcd, HDLCD_REG_INT_CLEAR, ~0);
> +}
> +
> +static void hdlcd_irq_postinstall(struct drm_device *drm)
> +{
> +#ifdef CONFIG_DEBUG_FS
> +	struct hdlcd_drm_private *hdlcd = drm->dev_private;
> +	unsigned long irq_mask = hdlcd_read(hdlcd, HDLCD_REG_INT_MASK);
> +
> +	/* enable debug interrupts */
> +	irq_mask |= HDLCD_DEBUG_INT_MASK;
> +
> +	hdlcd_write(hdlcd, HDLCD_REG_INT_MASK, irq_mask);
> +#endif
> +}
> +
> +static int hdlcd_irq_install(struct drm_device *dev, int irq)
It is inconsistent that the drm_device * is named "dev", as similar
functions in this patch uses the name "drm".

> +{
> +	int ret;
> +
> +	if (irq == IRQ_NOTCONNECTED)
> +		return -ENOTCONN;
The code above is almost redundandt as request_irq has the same check.
The only benefit of this check is that we avoid calling
hdlcd_irq_preinstall().

And IRQ_NOTCONNECTED is only set for PCI devices which this is not.
So I would thing the if () should be dropped here. ??

With the inputs considered/addressed:
Acked-by: Sam Ravnborg <sam@ravnborg.org>


> +
> +	hdlcd_irq_preinstall(dev);
> +
> +	ret = request_irq(irq, hdlcd_irq, 0, dev->driver->name, dev);
> +	if (ret)
> +		return ret;
> +
> +	hdlcd_irq_postinstall(dev);
> +
> +	return 0;
> +}
> +
> +static void hdlcd_irq_uninstall(struct drm_device *drm)
> +{
> +	struct hdlcd_drm_private *hdlcd = drm->dev_private;
> +	/* disable all the interrupts that we might have enabled */
> +	unsigned long irq_mask = hdlcd_read(hdlcd, HDLCD_REG_INT_MASK);
> +
> +#ifdef CONFIG_DEBUG_FS
> +	/* disable debug interrupts */
> +	irq_mask &= ~HDLCD_DEBUG_INT_MASK;
> +#endif
> +
> +	/* disable vsync interrupts */
> +	irq_mask &= ~HDLCD_INTERRUPT_VSYNC;
> +	hdlcd_write(hdlcd, HDLCD_REG_INT_MASK, irq_mask);
> +
> +	free_irq(hdlcd->irq, drm);
> +}
> +
>  static int hdlcd_load(struct drm_device *drm, unsigned long flags)
>  {
>  	struct hdlcd_drm_private *hdlcd = drm->dev_private;
> @@ -90,7 +177,12 @@ static int hdlcd_load(struct drm_device *drm, unsigned long flags)
>  		goto setup_fail;
>  	}
>  
> -	ret = drm_irq_install(drm, platform_get_irq(pdev, 0));
> +	ret = platform_get_irq(pdev, 0);
> +	if (ret < 0)
> +		goto irq_fail;
> +	hdlcd->irq = ret;
> +
> +	ret = hdlcd_irq_install(drm, hdlcd->irq);
>  	if (ret < 0) {
>  		DRM_ERROR("failed to install IRQ handler\n");
>  		goto irq_fail;
> @@ -122,76 +214,6 @@ static void hdlcd_setup_mode_config(struct drm_device *drm)
>  	drm->mode_config.funcs = &hdlcd_mode_config_funcs;
>  }
>  
> -static irqreturn_t hdlcd_irq(int irq, void *arg)
> -{
> -	struct drm_device *drm = arg;
> -	struct hdlcd_drm_private *hdlcd = drm->dev_private;
> -	unsigned long irq_status;
> -
> -	irq_status = hdlcd_read(hdlcd, HDLCD_REG_INT_STATUS);
> -
> -#ifdef CONFIG_DEBUG_FS
> -	if (irq_status & HDLCD_INTERRUPT_UNDERRUN)
> -		atomic_inc(&hdlcd->buffer_underrun_count);
> -
> -	if (irq_status & HDLCD_INTERRUPT_DMA_END)
> -		atomic_inc(&hdlcd->dma_end_count);
> -
> -	if (irq_status & HDLCD_INTERRUPT_BUS_ERROR)
> -		atomic_inc(&hdlcd->bus_error_count);
> -
> -	if (irq_status & HDLCD_INTERRUPT_VSYNC)
> -		atomic_inc(&hdlcd->vsync_count);
> -
> -#endif
> -	if (irq_status & HDLCD_INTERRUPT_VSYNC)
> -		drm_crtc_handle_vblank(&hdlcd->crtc);
> -
> -	/* acknowledge interrupt(s) */
> -	hdlcd_write(hdlcd, HDLCD_REG_INT_CLEAR, irq_status);
> -
> -	return IRQ_HANDLED;
> -}
> -
> -static void hdlcd_irq_preinstall(struct drm_device *drm)
> -{
> -	struct hdlcd_drm_private *hdlcd = drm->dev_private;
> -	/* Ensure interrupts are disabled */
> -	hdlcd_write(hdlcd, HDLCD_REG_INT_MASK, 0);
> -	hdlcd_write(hdlcd, HDLCD_REG_INT_CLEAR, ~0);
> -}
> -
> -static int hdlcd_irq_postinstall(struct drm_device *drm)
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
> -	return 0;
> -}
> -
> -static void hdlcd_irq_uninstall(struct drm_device *drm)
> -{
> -	struct hdlcd_drm_private *hdlcd = drm->dev_private;
> -	/* disable all the interrupts that we might have enabled */
> -	unsigned long irq_mask = hdlcd_read(hdlcd, HDLCD_REG_INT_MASK);
> -
> -#ifdef CONFIG_DEBUG_FS
> -	/* disable debug interrupts */
> -	irq_mask &= ~HDLCD_DEBUG_INT_MASK;
> -#endif
> -
> -	/* disable vsync interrupts */
> -	irq_mask &= ~HDLCD_INTERRUPT_VSYNC;
> -
> -	hdlcd_write(hdlcd, HDLCD_REG_INT_MASK, irq_mask);
> -}
> -
>  #ifdef CONFIG_DEBUG_FS
>  static int hdlcd_show_underrun_count(struct seq_file *m, void *arg)
>  {
> @@ -236,10 +258,6 @@ DEFINE_DRM_GEM_CMA_FOPS(fops);
>  
>  static const struct drm_driver hdlcd_driver = {
>  	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> -	.irq_handler = hdlcd_irq,
> -	.irq_preinstall = hdlcd_irq_preinstall,
> -	.irq_postinstall = hdlcd_irq_postinstall,
> -	.irq_uninstall = hdlcd_irq_uninstall,
>  	DRM_GEM_CMA_DRIVER_OPS,
>  #ifdef CONFIG_DEBUG_FS
>  	.debugfs_init = hdlcd_debugfs_init,
> @@ -316,7 +334,7 @@ static int hdlcd_drm_bind(struct device *dev)
>  err_unload:
>  	of_node_put(hdlcd->crtc.port);
>  	hdlcd->crtc.port = NULL;
> -	drm_irq_uninstall(drm);
> +	hdlcd_irq_uninstall(drm);
>  	of_reserved_mem_device_release(drm->dev);
>  err_free:
>  	drm_mode_config_cleanup(drm);
> @@ -338,7 +356,7 @@ static void hdlcd_drm_unbind(struct device *dev)
>  	hdlcd->crtc.port = NULL;
>  	pm_runtime_get_sync(dev);
>  	drm_atomic_helper_shutdown(drm);
> -	drm_irq_uninstall(drm);
> +	hdlcd_irq_uninstall(drm);
>  	pm_runtime_put(dev);
>  	if (pm_runtime_enabled(dev))
>  		pm_runtime_disable(dev);
> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.h b/drivers/gpu/drm/arm/hdlcd_drv.h
> index fd438d177b64..909c39c28487 100644
> --- a/drivers/gpu/drm/arm/hdlcd_drv.h
> +++ b/drivers/gpu/drm/arm/hdlcd_drv.h
> @@ -11,6 +11,7 @@ struct hdlcd_drm_private {
>  	struct clk			*clk;
>  	struct drm_crtc			crtc;
>  	struct drm_plane		*plane;
> +	unsigned int			irq;
>  #ifdef CONFIG_DEBUG_FS
>  	atomic_t buffer_underrun_count;
>  	atomic_t bus_error_count;
> -- 
> 2.32.0
