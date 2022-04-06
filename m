Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 186034F6A06
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 21:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077CB10E00D;
	Wed,  6 Apr 2022 19:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A624010E00D
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 19:33:00 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1ncBOk-0002XZ-Ut; Wed, 06 Apr 2022 21:32:59 +0200
Message-ID: <fe732f785a4c58f6225f72f5c420d4abc611553c.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/7] drm: mxsfb: Simplify LCDIF clock handling
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Wed, 06 Apr 2022 21:32:56 +0200
In-Reply-To: <20220311170601.50995-1-marex@denx.de>
References: <20220311170601.50995-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

Am Freitag, dem 11.03.2022 um 18:05 +0100 schrieb Marek Vasut:
> The current clock handling in the LCDIF driver is a convoluted mess.

Here we agree...

> Implement runtime PM ops which turn the clock ON and OFF and let the
> pm_runtime_get_sync()/pm_runtime_put_sync() calls in .atomic_enable
> and .atomic_disable callbacks turn the clock ON and OFF at the right
> time.
> 
> This requires slight reordering in mxsfb_crtc_atomic_enable() and
> mxsfb_crtc_atomic_disable(), since all the register accesses must
> happen only with clock enabled and clock frequency configuration
> must happen with clock disabled.
> 
... on that one I don't. Please don't move the pixel clock into the RPM
calls. We have a very well defined point between atomic enable/disable
where the pixel clock is actually needed. All the other configuration
accesses don't need the pixel clock to be active.

> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>
> ---
> V2: No change
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 104 +++++++++++++++++-------------
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c |  27 +++-----
>  2 files changed, 67 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index 9d71c55a31c07..c790aeff0a6f0 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -73,18 +73,6 @@ static const struct mxsfb_devdata mxsfb_devdata[] = {
>  	},
>  };
>  
> -void mxsfb_enable_axi_clk(struct mxsfb_drm_private *mxsfb)
> -{
> -	if (mxsfb->clk_axi)
> -		clk_prepare_enable(mxsfb->clk_axi);
> -}
> -
> -void mxsfb_disable_axi_clk(struct mxsfb_drm_private *mxsfb)
> -{
> -	if (mxsfb->clk_axi)
> -		clk_disable_unprepare(mxsfb->clk_axi);
> -}
> -
>  static struct drm_framebuffer *
>  mxsfb_fb_create(struct drm_device *dev, struct drm_file *file_priv,
>  		const struct drm_mode_fb_cmd2 *mode_cmd)
> @@ -173,13 +161,9 @@ static void mxsfb_irq_disable(struct drm_device *drm)
>  {
>  	struct mxsfb_drm_private *mxsfb = drm->dev_private;
>  
> -	mxsfb_enable_axi_clk(mxsfb);
> -
>  	/* Disable and clear VBLANK IRQ */
>  	writel(CTRL1_CUR_FRAME_DONE_IRQ_EN, mxsfb->base + LCDC_CTRL1 + REG_CLR);
>  	writel(CTRL1_CUR_FRAME_DONE_IRQ, mxsfb->base + LCDC_CTRL1 + REG_CLR);
> -
> -	mxsfb_disable_axi_clk(mxsfb);
>  }
>  
>  static int mxsfb_irq_install(struct drm_device *dev, int irq)
> @@ -225,43 +209,41 @@ static int mxsfb_load(struct drm_device *drm,
>  	if (IS_ERR(mxsfb->clk))
>  		return PTR_ERR(mxsfb->clk);
>  
> -	mxsfb->clk_axi = devm_clk_get(drm->dev, "axi");
> +	mxsfb->clk_axi = devm_clk_get_optional(drm->dev, "axi");
>  	if (IS_ERR(mxsfb->clk_axi))
> -		mxsfb->clk_axi = NULL;
> +		return PTR_ERR(mxsfb->clk_axi);
>  
> -	mxsfb->clk_disp_axi = devm_clk_get(drm->dev, "disp_axi");
> +	mxsfb->clk_disp_axi = devm_clk_get_optional(drm->dev, "disp_axi");
>  	if (IS_ERR(mxsfb->clk_disp_axi))
> -		mxsfb->clk_disp_axi = NULL;
> +		return PTR_ERR(mxsfb->clk_disp_axi);
> +
> +	platform_set_drvdata(pdev, drm);
>  
>  	ret = dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32));
>  	if (ret)
>  		return ret;
>  
> -	pm_runtime_enable(drm->dev);
> -
>  	/* Modeset init */
>  	drm_mode_config_init(drm);
>  
>  	ret = mxsfb_kms_init(mxsfb);
>  	if (ret < 0) {
>  		dev_err(drm->dev, "Failed to initialize KMS pipeline\n");
> -		goto err_vblank;
> +		return ret;
>  	}
>  
>  	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
>  	if (ret < 0) {
>  		dev_err(drm->dev, "Failed to initialise vblank\n");
> -		goto err_vblank;
> +		return ret;
>  	}
>  
>  	/* Start with vertical blanking interrupt reporting disabled. */
>  	drm_crtc_vblank_off(&mxsfb->crtc);
>  
>  	ret = mxsfb_attach_bridge(mxsfb);
> -	if (ret) {
> -		dev_err_probe(drm->dev, ret, "Cannot connect bridge\n");
> -		goto err_vblank;
> -	}
> +	if (ret)
> +		return dev_err_probe(drm->dev, ret, "Cannot connect bridge\n");
>  
>  	drm->mode_config.min_width	= MXSFB_MIN_XRES;
>  	drm->mode_config.min_height	= MXSFB_MIN_YRES;
> @@ -274,44 +256,37 @@ static int mxsfb_load(struct drm_device *drm,
>  
>  	ret = platform_get_irq(pdev, 0);
>  	if (ret < 0)
> -		goto err_vblank;
> +		return ret;
>  	mxsfb->irq = ret;
>  
> -	pm_runtime_get_sync(drm->dev);
>  	ret = mxsfb_irq_install(drm, mxsfb->irq);
> -	pm_runtime_put_sync(drm->dev);
> -
Here you do a bunch of stuff resulting in register access without
enabling the clocks. I don't really see how this works, maybe because
the clocks are still on when you run the probe?

Better enable the register access clocks here and then tell RPM about
the fact that the device is running by calling pm_runtime_set_active
before pm_runtime_enable. This way theoretically allows to build a
kernel without CONFIG_PM and things still work, even if the RPM calls
are stubs.

>  	if (ret < 0) {
>  		dev_err(drm->dev, "Failed to install IRQ handler\n");
> -		goto err_vblank;
> +		return ret;
>  	}
>  
>  	drm_kms_helper_poll_init(drm);
>  
> -	platform_set_drvdata(pdev, drm);
> -
>  	drm_helper_hpd_irq_event(drm);
>  
> -	return 0;
> -
> -err_vblank:
> -	pm_runtime_disable(drm->dev);
> +	pm_runtime_enable(drm->dev);
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static void mxsfb_unload(struct drm_device *drm)
>  {
> +	pm_runtime_get_sync(drm->dev);
> +
>  	drm_kms_helper_poll_fini(drm);
>  	drm_mode_config_cleanup(drm);
>  
> -	pm_runtime_get_sync(drm->dev);
>  	mxsfb_irq_uninstall(drm);
> +
>  	pm_runtime_put_sync(drm->dev);
> +	pm_runtime_disable(drm->dev);
>  
>  	drm->dev_private = NULL;
> -
> -	pm_runtime_disable(drm->dev);
>  }
>  
>  DEFINE_DRM_GEM_CMA_FOPS(fops);
> @@ -388,23 +363,60 @@ static void mxsfb_shutdown(struct platform_device *pdev)
>  	drm_atomic_helper_shutdown(drm);
>  }
>  
> -#ifdef CONFIG_PM_SLEEP
> +static int mxsfb_rpm_suspend(struct device *dev)
> +{
> +	struct drm_device *drm = dev_get_drvdata(dev);
> +	struct mxsfb_drm_private *mxsfb = drm->dev_private;
> +
> +	/* These clock supply the DISPLAY CLOCK Domain */
> +	clk_disable_unprepare(mxsfb->clk);
> +	/* These clock supply the System Bus, AXI, Write Path, LFIFO */
> +	clk_disable_unprepare(mxsfb->clk_disp_axi);
> +	/* These clock supply the Control Bus, APB, APBH Ctrl Registers */
> +	clk_disable_unprepare(mxsfb->clk_axi);
> +
> +	return 0;
> +}
> +
> +static int mxsfb_rpm_resume(struct device *dev)
> +{
> +	struct drm_device *drm = dev_get_drvdata(dev);
> +	struct mxsfb_drm_private *mxsfb = drm->dev_private;
> +
> +	/* These clock supply the Control Bus, APB, APBH Ctrl Registers */
> +	clk_prepare_enable(mxsfb->clk_axi);
> +	/* These clock supply the System Bus, AXI, Write Path, LFIFO */
> +	clk_prepare_enable(mxsfb->clk_disp_axi);
> +	/* These clock supply the DISPLAY CLOCK Domain */
> +	clk_prepare_enable(mxsfb->clk);
> +
> +	return 0;
> +}
> +
>  static int mxsfb_suspend(struct device *dev)
>  {
>  	struct drm_device *drm = dev_get_drvdata(dev);
> +	int ret;
>  
> -	return drm_mode_config_helper_suspend(drm);
> +	ret = drm_mode_config_helper_suspend(drm);
> +	if (ret)
> +		return ret;
> +
> +	return mxsfb_rpm_suspend(dev);
>  }
>  
>  static int mxsfb_resume(struct device *dev)
>  {
>  	struct drm_device *drm = dev_get_drvdata(dev);
>  
> +	mxsfb_rpm_resume(dev);
> +
>  	return drm_mode_config_helper_resume(drm);
>  }
> -#endif
>  
>  static const struct dev_pm_ops mxsfb_pm_ops = {
> +	.runtime_suspend = mxsfb_rpm_suspend,
> +	.runtime_resume = mxsfb_rpm_resume,

SET_RUNTIME_PM_OPS(mxsfb_rpm_suspend, mxsfb_rpm_resume, NULL)

>  	SET_SYSTEM_SLEEP_PM_OPS(mxsfb_suspend, mxsfb_resume)
>  };
>  
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index 4cfb6c0016799..657b6afbbf1f9 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -100,10 +100,6 @@ static void mxsfb_enable_controller(struct mxsfb_drm_private *mxsfb)
>  {
>  	u32 reg;
>  
> -	if (mxsfb->clk_disp_axi)
> -		clk_prepare_enable(mxsfb->clk_disp_axi);
> -	clk_prepare_enable(mxsfb->clk);
> -
>  	/* Increase number of outstanding requests on all supported IPs */
>  	if (mxsfb->devdata->has_ctrl2) {
>  		reg = readl(mxsfb->base + LCDC_V4_CTRL2);
> @@ -168,10 +164,6 @@ static void mxsfb_disable_controller(struct mxsfb_drm_private *mxsfb)
>  	reg = readl(mxsfb->base + LCDC_VDCTRL4);
>  	reg &= ~VDCTRL4_SYNC_SIGNALS_ON;
>  	writel(reg, mxsfb->base + LCDC_VDCTRL4);
> -
> -	clk_disable_unprepare(mxsfb->clk);
> -	if (mxsfb->clk_disp_axi)
> -		clk_disable_unprepare(mxsfb->clk_disp_axi);
>  }
>  
>  /*
> @@ -250,8 +242,6 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
>  
>  	mxsfb_set_formats(mxsfb, bus_format);
>  
> -	clk_set_rate(mxsfb->clk, m->crtc_clock * 1000);
> -
>  	if (mxsfb->bridge && mxsfb->bridge->timings)
>  		bus_flags = mxsfb->bridge->timings->input_bus_flags;
>  
> @@ -346,16 +336,12 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
>  				     struct drm_atomic_state *state)
>  {
>  	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
> +	struct drm_display_mode *m = &mxsfb->crtc.state->adjusted_mode;
>  	struct drm_bridge_state *bridge_state;
>  	struct drm_device *drm = mxsfb->drm;
>  	u32 bus_format = 0;
>  	dma_addr_t paddr;
>  
> -	pm_runtime_get_sync(drm->dev);
> -	mxsfb_enable_axi_clk(mxsfb);
> -
> -	drm_crtc_vblank_on(crtc);
> -
>  	/* If there is a bridge attached to the LCDIF, use its bus format */
>  	if (mxsfb->bridge) {
>  		bridge_state =
> @@ -382,6 +368,10 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
>  	if (!bus_format)
>  		bus_format = MEDIA_BUS_FMT_RGB888_1X24;
>  
> +	clk_set_rate(mxsfb->clk, m->crtc_clock * 1000);
> +
> +	pm_runtime_get_sync(drm->dev);
> +
>  	mxsfb_crtc_mode_set_nofb(mxsfb, bus_format);
>  
>  	/* Write cur_buf as well to avoid an initial corrupt frame */
> @@ -392,6 +382,8 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
>  	}
>  
>  	mxsfb_enable_controller(mxsfb);
> +
> +	drm_crtc_vblank_on(crtc);
>  }
>  
>  static void mxsfb_crtc_atomic_disable(struct drm_crtc *crtc,
> @@ -401,6 +393,8 @@ static void mxsfb_crtc_atomic_disable(struct drm_crtc *crtc,
>  	struct drm_device *drm = mxsfb->drm;
>  	struct drm_pending_vblank_event *event;
>  
> +	drm_crtc_vblank_off(crtc);
> +
>  	mxsfb_disable_controller(mxsfb);
>  
>  	spin_lock_irq(&drm->event_lock);
> @@ -411,9 +405,6 @@ static void mxsfb_crtc_atomic_disable(struct drm_crtc *crtc,
>  	}
>  	spin_unlock_irq(&drm->event_lock);
>  
> -	drm_crtc_vblank_off(crtc);
> -
> -	mxsfb_disable_axi_clk(mxsfb);
>  	pm_runtime_put_sync(drm->dev);
> 
Not the fault of your patch, but why is this a _sync call?

Regards,
Lucas

