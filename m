Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 172B43D8FF7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 16:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A17E6EAD6;
	Wed, 28 Jul 2021 14:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9D96EAD6
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 14:00:27 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 328b63b4-efac-11eb-8d1a-0050568cd888;
 Wed, 28 Jul 2021 14:00:42 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 038DD194BB3;
 Wed, 28 Jul 2021 16:00:45 +0200 (CEST)
Date: Wed, 28 Jul 2021 16:00:23 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>, Dan.Sneddon@microchip.com
Subject: Re: [PATCH 03/14] drm/atmel-hlcdc: Convert to Linux IRQ interfaces
Message-ID: <YQFi96yaYbTG4OO7@ravnborg.org>
References: <20210727182721.17981-1-tzimmermann@suse.de>
 <20210727182721.17981-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727182721.17981-4-tzimmermann@suse.de>
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

Hi Dan,

I hope you can fine to test this patch from Thomas.
If this works then we can forget about my attempt to do the same.

Hi Thomas,

IRQ_NOTCONNECTED check seems redundant, as mentioned in another patch
already.

With that considered:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

We shall wait for testing from Dan before you apply it as I had made a
similar patch that failed to work. I assume my patch was buggy but I
prefer to be sure.

	Sam

On Tue, Jul 27, 2021 at 08:27:10PM +0200, Thomas Zimmermann wrote:
> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
> don't benefit from using it. DRM IRQ callbacks are now being called
> directly or inlined.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 85 ++++++++++++--------
>  1 file changed, 52 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> index f09b6dd8754c..cfa8c2c9c8aa 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> @@ -22,7 +22,6 @@
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> -#include <drm/drm_irq.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
>  
> @@ -557,6 +556,56 @@ static irqreturn_t atmel_hlcdc_dc_irq_handler(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> +static void atmel_hlcdc_dc_irq_postinstall(struct drm_device *dev)
> +{
> +	struct atmel_hlcdc_dc *dc = dev->dev_private;
> +	unsigned int cfg = 0;
> +	int i;
> +
> +	/* Enable interrupts on activated layers */
> +	for (i = 0; i < ATMEL_HLCDC_MAX_LAYERS; i++) {
> +		if (dc->layers[i])
> +			cfg |= ATMEL_HLCDC_LAYER_STATUS(i);
> +	}
> +
> +	regmap_write(dc->hlcdc->regmap, ATMEL_HLCDC_IER, cfg);
> +}
> +
> +static void atmel_hlcdc_dc_irq_disable(struct drm_device *dev)
> +{
> +	struct atmel_hlcdc_dc *dc = dev->dev_private;
> +	unsigned int isr;
> +
> +	regmap_write(dc->hlcdc->regmap, ATMEL_HLCDC_IDR, 0xffffffff);
> +	regmap_read(dc->hlcdc->regmap, ATMEL_HLCDC_ISR, &isr);
> +}
> +
> +static int atmel_hlcdc_dc_irq_install(struct drm_device *dev, unsigned int irq)
> +{
> +	int ret;
> +
> +	if (irq == IRQ_NOTCONNECTED)
> +		return -ENOTCONN;
> +
> +	atmel_hlcdc_dc_irq_disable(dev);
> +
> +	ret = request_irq(irq, atmel_hlcdc_dc_irq_handler, 0, dev->driver->name, dev);
> +	if (ret)
> +		return ret;
> +
> +	atmel_hlcdc_dc_irq_postinstall(dev);
> +
> +	return 0;
> +}
> +
> +static void atmel_hlcdc_dc_irq_uninstall(struct drm_device *dev)
> +{
> +	struct atmel_hlcdc_dc *dc = dev->dev_private;
> +
> +	atmel_hlcdc_dc_irq_disable(dev);
> +	free_irq(dc->hlcdc->irq, dev);
> +}
> +
>  static const struct drm_mode_config_funcs mode_config_funcs = {
>  	.fb_create = drm_gem_fb_create,
>  	.atomic_check = drm_atomic_helper_check,
> @@ -647,7 +696,7 @@ static int atmel_hlcdc_dc_load(struct drm_device *dev)
>  	drm_mode_config_reset(dev);
>  
>  	pm_runtime_get_sync(dev->dev);
> -	ret = drm_irq_install(dev, dc->hlcdc->irq);
> +	ret = atmel_hlcdc_dc_irq_install(dev, dc->hlcdc->irq);
>  	pm_runtime_put_sync(dev->dev);
>  	if (ret < 0) {
>  		dev_err(dev->dev, "failed to install IRQ handler\n");
> @@ -676,7 +725,7 @@ static void atmel_hlcdc_dc_unload(struct drm_device *dev)
>  	drm_mode_config_cleanup(dev);
>  
>  	pm_runtime_get_sync(dev->dev);
> -	drm_irq_uninstall(dev);
> +	atmel_hlcdc_dc_irq_uninstall(dev);
>  	pm_runtime_put_sync(dev->dev);
>  
>  	dev->dev_private = NULL;
> @@ -685,40 +734,10 @@ static void atmel_hlcdc_dc_unload(struct drm_device *dev)
>  	clk_disable_unprepare(dc->hlcdc->periph_clk);
>  }
>  
> -static int atmel_hlcdc_dc_irq_postinstall(struct drm_device *dev)
> -{
> -	struct atmel_hlcdc_dc *dc = dev->dev_private;
> -	unsigned int cfg = 0;
> -	int i;
> -
> -	/* Enable interrupts on activated layers */
> -	for (i = 0; i < ATMEL_HLCDC_MAX_LAYERS; i++) {
> -		if (dc->layers[i])
> -			cfg |= ATMEL_HLCDC_LAYER_STATUS(i);
> -	}
> -
> -	regmap_write(dc->hlcdc->regmap, ATMEL_HLCDC_IER, cfg);
> -
> -	return 0;
> -}
> -
> -static void atmel_hlcdc_dc_irq_uninstall(struct drm_device *dev)
> -{
> -	struct atmel_hlcdc_dc *dc = dev->dev_private;
> -	unsigned int isr;
> -
> -	regmap_write(dc->hlcdc->regmap, ATMEL_HLCDC_IDR, 0xffffffff);
> -	regmap_read(dc->hlcdc->regmap, ATMEL_HLCDC_ISR, &isr);
> -}
> -
>  DEFINE_DRM_GEM_CMA_FOPS(fops);
>  
>  static const struct drm_driver atmel_hlcdc_dc_driver = {
>  	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> -	.irq_handler = atmel_hlcdc_dc_irq_handler,
> -	.irq_preinstall = atmel_hlcdc_dc_irq_uninstall,
> -	.irq_postinstall = atmel_hlcdc_dc_irq_postinstall,
> -	.irq_uninstall = atmel_hlcdc_dc_irq_uninstall,
>  	DRM_GEM_CMA_DRIVER_OPS,
>  	.fops = &fops,
>  	.name = "atmel-hlcdc",
> -- 
> 2.32.0
