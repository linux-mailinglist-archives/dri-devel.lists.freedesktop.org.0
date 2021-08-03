Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9A13DF0F5
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 17:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D836E880;
	Tue,  3 Aug 2021 15:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40676E881
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 15:00:14 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 8b9d7efa-f46b-11eb-8d1a-0050568cd888;
 Tue, 03 Aug 2021 15:00:30 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 05278194B8B;
 Tue,  3 Aug 2021 17:00:36 +0200 (CEST)
Date: Tue, 3 Aug 2021 17:00:08 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, liviu.dudau@arm.com,
 brian.starkey@arm.com, bbrezillon@kernel.org,
 nicolas.ferre@microchip.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, stefan@agner.ch, alison.wang@nxp.com,
 patrik.r.jakobsson@gmail.com, anitha.chrisanthus@intel.com,
 robdclark@gmail.com, edmund.j.dea@intel.com, sean@poorly.run,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 jyri.sarha@iki.fi, tomba@kernel.org, Dan.Sneddon@microchip.com,
 tomi.valkeinen@ideasonboard.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 11/14] drm/tilcdc: Convert to Linux IRQ interfaces
Message-ID: <YQlZ+EQVbO9N3Mla@ravnborg.org>
References: <20210803090704.32152-1-tzimmermann@suse.de>
 <20210803090704.32152-12-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803090704.32152-12-tzimmermann@suse.de>
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

On Tue, Aug 03, 2021 at 11:07:01AM +0200, Thomas Zimmermann wrote:
> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
> don't benefit from using it.
> 
> DRM IRQ callbacks are now being called directly or inlined.
> 
> Calls to platform_get_irq() can fail with a negative errno code.
> Abort initialization in this case. The DRM IRQ midlayer does not
> handle this case correctly.

I cannot see why the irq_enabled flag is needed here, and the changelog
do not help me.
What do I miss?

	Sam


> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c | 51 ++++++++++++++++++++++-------
>  drivers/gpu/drm/tilcdc/tilcdc_drv.h |  3 ++
>  2 files changed, 43 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> index f1d3a9f919fd..6b03f89a98d4 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> @@ -20,7 +20,6 @@
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> -#include <drm/drm_irq.h>
>  #include <drm/drm_mm.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
> @@ -124,6 +123,39 @@ static int cpufreq_transition(struct notifier_block *nb,
>  }
>  #endif
>  
> +static irqreturn_t tilcdc_irq(int irq, void *arg)
> +{
> +	struct drm_device *dev = arg;
> +	struct tilcdc_drm_private *priv = dev->dev_private;
> +
> +	return tilcdc_crtc_irq(priv->crtc);
> +}
> +
> +static int tilcdc_irq_install(struct drm_device *dev, unsigned int irq)
> +{
> +	struct tilcdc_drm_private *priv = dev->dev_private;
> +	int ret;
> +
> +	ret = request_irq(irq, tilcdc_irq, 0, dev->driver->name, dev);
> +	if (ret)
> +		return ret;
> +
> +	priv->irq_enabled = false;
> +
> +	return 0;
> +}
> +
> +static void tilcdc_irq_uninstall(struct drm_device *dev)
> +{
> +	struct tilcdc_drm_private *priv = dev->dev_private;
> +
> +	if (!priv->irq_enabled)
> +		return;
> +
> +	free_irq(priv->irq, dev);
> +	priv->irq_enabled = false;
> +}
> +
>  /*
>   * DRM operations:
>   */
> @@ -145,7 +177,7 @@ static void tilcdc_fini(struct drm_device *dev)
>  		drm_dev_unregister(dev);
>  
>  	drm_kms_helper_poll_fini(dev);
> -	drm_irq_uninstall(dev);
> +	tilcdc_irq_uninstall(dev);
>  	drm_mode_config_cleanup(dev);
>  
>  	if (priv->clk)
> @@ -336,7 +368,12 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
>  		goto init_failed;
>  	}
>  
> -	ret = drm_irq_install(ddev, platform_get_irq(pdev, 0));
> +	ret = platform_get_irq(pdev, 0);
> +	if (ret < 0)
> +		goto init_failed;
> +	priv->irq = ret;
> +
> +	ret = tilcdc_irq_install(ddev, priv->irq);
>  	if (ret < 0) {
>  		dev_err(dev, "failed to install IRQ handler\n");
>  		goto init_failed;
> @@ -360,13 +397,6 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
>  	return ret;
>  }
>  
> -static irqreturn_t tilcdc_irq(int irq, void *arg)
> -{
> -	struct drm_device *dev = arg;
> -	struct tilcdc_drm_private *priv = dev->dev_private;
> -	return tilcdc_crtc_irq(priv->crtc);
> -}
> -
>  #if defined(CONFIG_DEBUG_FS)
>  static const struct {
>  	const char *name;
> @@ -454,7 +484,6 @@ DEFINE_DRM_GEM_CMA_FOPS(fops);
>  
>  static const struct drm_driver tilcdc_driver = {
>  	.driver_features    = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> -	.irq_handler        = tilcdc_irq,
>  	DRM_GEM_CMA_DRIVER_OPS,
>  #ifdef CONFIG_DEBUG_FS
>  	.debugfs_init       = tilcdc_debugfs_init,
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
> index d29806ca8817..b818448c83f6 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
> @@ -46,6 +46,8 @@ struct tilcdc_drm_private {
>  	struct clk *clk;         /* functional clock */
>  	int rev;                 /* IP revision */
>  
> +	unsigned int irq;
> +
>  	/* don't attempt resolutions w/ higher W * H * Hz: */
>  	uint32_t max_bandwidth;
>  	/*
> @@ -82,6 +84,7 @@ struct tilcdc_drm_private {
>  
>  	bool is_registered;
>  	bool is_componentized;
> +	bool irq_enabled;
>  };
>  
>  /* Sub-module for display.  Since we don't know at compile time what panels
> -- 
> 2.32.0
