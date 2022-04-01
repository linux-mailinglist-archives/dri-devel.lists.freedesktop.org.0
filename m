Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DB34EE9C9
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 10:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F8910FE1E;
	Fri,  1 Apr 2022 08:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 563 seconds by postgrey-1.36 at gabe;
 Fri, 01 Apr 2022 08:32:02 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9361C10FE1E
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 08:32:02 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id D3F585C15A9;
 Fri,  1 Apr 2022 10:22:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1648801357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bgsc6ZGcJqmZ1MtFwC7cWHPxkP526MrnPtTG3saf7VE=;
 b=CeJ4ZDh/EkI5EYLZemU9Klh9GE4pQCYhopaCY/qpPFcz0ziC0VcTfrFthDSKz4aw694jcn
 EygE/AHfjpyLCTPPUc+lRapEYZ30gmUDx9HMQ1ZKYmcHwKfdVrtNWPqaesbWZMQINsCssD
 cB7FKIvt+26xJ1P6X0wNYid0xYnuPQQ=
MIME-Version: 1.0
Date: Fri, 01 Apr 2022 10:22:37 +0200
From: Stefan Agner <stefan@agner.ch>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 2/2] drm: lcdif: Add support for i.MX8MP LCDIF variant
In-Reply-To: <20220322142853.125880-2-marex@denx.de>
References: <20220322142853.125880-1-marex@denx.de>
 <20220322142853.125880-2-marex@denx.de>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <4a87d255a7e8e0eb10e16a670f86fdf6@agner.ch>
X-Sender: stefan@agner.ch
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-03-22 15:28, Marek Vasut wrote:
> Add support for i.MX8MP LCDIF variant. This is called LCDIFv3 and is
> completely different from the LCDIFv3 found in i.MX23 in that it has
> a completely scrambled register layout compared to all previous LCDIF
> variants. The new LCDIFv3 also supports 36bit address space.
> 
> Add a separate driver which is really a fork of MXSFB driver with the
> i.MX8MP LCDIF variant handling filled in.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>
> ---
>  drivers/gpu/drm/mxsfb/Kconfig      |  16 +
>  drivers/gpu/drm/mxsfb/Makefile     |   2 +
>  drivers/gpu/drm/mxsfb/lcdif_drv.c  | 367 +++++++++++++++++++++
>  drivers/gpu/drm/mxsfb/lcdif_drv.h  |  48 +++
>  drivers/gpu/drm/mxsfb/lcdif_kms.c  | 492 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/mxsfb/lcdif_regs.h | 243 ++++++++++++++

As this is completely ortogonal to mxsfb driver, shouldn't this live in
its own directory (drivers/gpu/drm/lcdif/)?

--
Stefan

>  6 files changed, 1168 insertions(+)
>  create mode 100644 drivers/gpu/drm/mxsfb/lcdif_drv.c
>  create mode 100644 drivers/gpu/drm/mxsfb/lcdif_drv.h
>  create mode 100644 drivers/gpu/drm/mxsfb/lcdif_kms.c
>  create mode 100644 drivers/gpu/drm/mxsfb/lcdif_regs.h
> 
> diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
> index 987170e16ebd6..deb84f99d2fca 100644
> --- a/drivers/gpu/drm/mxsfb/Kconfig
> +++ b/drivers/gpu/drm/mxsfb/Kconfig
> @@ -19,3 +19,19 @@ config DRM_MXSFB
>  	  i.MX28, i.MX6SX, i.MX7 and i.MX8M).
>  
>  	  If M is selected the module will be called mxsfb.
> +
> +config DRM_LCDIF
> +	tristate "i.MX LCDIFv3 LCD controller"
> +	depends on DRM && OF
> +	depends on COMMON_CLK
> +	select DRM_MXS
> +	select DRM_KMS_HELPER
> +	select DRM_GEM_CMA_HELPER
> +	select DRM_PANEL
> +	select DRM_PANEL_BRIDGE
> +	help
> +	  Choose this option if you have an LCDIFv3 LCD controller.
> +	  Those devices are found in various i.MX SoC (i.MX8MP,
> +	  i.MXRT).
> +
> +	  If M is selected the module will be called lcdif.
> diff --git a/drivers/gpu/drm/mxsfb/Makefile b/drivers/gpu/drm/mxsfb/Makefile
> index 26d153896d720..e57e807d14857 100644
> --- a/drivers/gpu/drm/mxsfb/Makefile
> +++ b/drivers/gpu/drm/mxsfb/Makefile
> @@ -1,3 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  mxsfb-y := mxsfb_drv.o mxsfb_kms.o
>  obj-$(CONFIG_DRM_MXSFB)	+= mxsfb.o
> +lcdif-y := lcdif_drv.o lcdif_kms.o
> +obj-$(CONFIG_DRM_LCDIF)	+= lcdif.o
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> new file mode 100644
> index 0000000000000..00131fd12bdaa
> --- /dev/null
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -0,0 +1,367 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2022 Marek Vasut <marex@denx.de>
> + *
> + * This code is based on drivers/gpu/drm/mxsfb/mxsfb*
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_mode_config.h>
> +#include <drm/drm_module.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
> +
> +#include "lcdif_drv.h"
> +#include "lcdif_regs.h"
> +
> +static struct drm_framebuffer *
> +lcdif_fb_create(struct drm_device *dev, struct drm_file *file_priv,
> +		const struct drm_mode_fb_cmd2 *mode_cmd)
> +{
> +	const struct drm_format_info *info;
> +
> +	info = drm_get_format_info(dev, mode_cmd);
> +	if (!info)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (mode_cmd->width * info->cpp[0] != mode_cmd->pitches[0]) {
> +		dev_dbg(dev->dev, "Invalid pitch: fb width must match pitch\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	return drm_gem_fb_create(dev, file_priv, mode_cmd);
> +}
> +
> +static const struct drm_mode_config_funcs lcdif_mode_config_funcs = {
> +	.fb_create		= lcdif_fb_create,
> +	.atomic_check		= drm_atomic_helper_check,
> +	.atomic_commit		= drm_atomic_helper_commit,
> +};
> +
> +static const struct drm_mode_config_helper_funcs lcdif_mode_config_helpers = {
> +	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
> +};
> +
> +static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
> +{
> +	struct drm_device *drm = lcdif->drm;
> +	struct drm_connector_list_iter iter;
> +	struct drm_panel *panel;
> +	struct drm_bridge *bridge;
> +	int ret;
> +
> +	ret = drm_of_find_panel_or_bridge(drm->dev->of_node, 0, 0, &panel,
> +					  &bridge);
> +	if (ret)
> +		return ret;
> +
> +	if (panel) {
> +		bridge = devm_drm_panel_bridge_add_typed(drm->dev, panel,
> +							 DRM_MODE_CONNECTOR_DPI);
> +		if (IS_ERR(bridge))
> +			return PTR_ERR(bridge);
> +	}
> +
> +	if (!bridge)
> +		return -ENODEV;
> +
> +	ret = drm_bridge_attach(&lcdif->encoder, bridge, NULL, 0);
> +	if (ret)
> +		return dev_err_probe(drm->dev, ret, "Failed to attach bridge\n");
> +
> +	lcdif->bridge = bridge;
> +
> +	/*
> +	 * Get hold of the connector. This is a bit of a hack, until the bridge
> +	 * API gives us bus flags and formats.
> +	 */
> +	drm_connector_list_iter_begin(drm, &iter);
> +	lcdif->connector = drm_connector_list_iter_next(&iter);
> +	drm_connector_list_iter_end(&iter);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t lcdif_irq_handler(int irq, void *data)
> +{
> +	struct drm_device *drm = data;
> +	struct lcdif_drm_private *lcdif = drm->dev_private;
> +	u32 reg;
> +
> +	reg = readl(lcdif->base + LCDC_V8_INT_STATUS_D0);
> +
> +	if (reg & INT_STATUS_D0_VS_BLANK)
> +		drm_crtc_handle_vblank(&lcdif->crtc);
> +
> +	writel(INT_STATUS_D0_VS_BLANK, lcdif->base + LCDC_V8_INT_STATUS_D0);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int lcdif_load(struct drm_device *drm)
> +{
> +	struct platform_device *pdev = to_platform_device(drm->dev);
> +	struct lcdif_drm_private *lcdif;
> +	struct resource *res;
> +	int ret;
> +
> +	lcdif = devm_kzalloc(&pdev->dev, sizeof(*lcdif), GFP_KERNEL);
> +	if (!lcdif)
> +		return -ENOMEM;
> +
> +	lcdif->drm = drm;
> +	drm->dev_private = lcdif;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	lcdif->base = devm_ioremap_resource(drm->dev, res);
> +	if (IS_ERR(lcdif->base))
> +		return PTR_ERR(lcdif->base);
> +
> +	lcdif->clk = devm_clk_get(drm->dev, NULL);
> +	if (IS_ERR(lcdif->clk))
> +		return PTR_ERR(lcdif->clk);
> +
> +	lcdif->clk_axi = devm_clk_get_optional(drm->dev, "axi");
> +	if (IS_ERR(lcdif->clk_axi))
> +		return PTR_ERR(lcdif->clk_axi);
> +
> +	lcdif->clk_disp_axi = devm_clk_get_optional(drm->dev, "disp_axi");
> +	if (IS_ERR(lcdif->clk_disp_axi))
> +		return PTR_ERR(lcdif->clk_disp_axi);
> +
> +	platform_set_drvdata(pdev, drm);
> +
> +	ret = dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(36));
> +	if (ret)
> +		return ret;
> +
> +	/* Modeset init */
> +	drm_mode_config_init(drm);
> +
> +	ret = lcdif_kms_init(lcdif);
> +	if (ret < 0) {
> +		dev_err(drm->dev, "Failed to initialize KMS pipeline\n");
> +		return ret;
> +	}
> +
> +	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
> +	if (ret < 0) {
> +		dev_err(drm->dev, "Failed to initialise vblank\n");
> +		return ret;
> +	}
> +
> +	/* Start with vertical blanking interrupt reporting disabled. */
> +	drm_crtc_vblank_off(&lcdif->crtc);
> +
> +	ret = lcdif_attach_bridge(lcdif);
> +	if (ret)
> +		return dev_err_probe(drm->dev, ret, "Cannot connect bridge\n");
> +
> +	drm->mode_config.min_width	= LCDIF_MIN_XRES;
> +	drm->mode_config.min_height	= LCDIF_MIN_YRES;
> +	drm->mode_config.max_width	= LCDIF_MAX_XRES;
> +	drm->mode_config.max_height	= LCDIF_MAX_YRES;
> +	drm->mode_config.funcs		= &lcdif_mode_config_funcs;
> +	drm->mode_config.helper_private	= &lcdif_mode_config_helpers;
> +
> +	drm_mode_config_reset(drm);
> +
> +	ret = platform_get_irq(pdev, 0);
> +	if (ret < 0)
> +		return ret;
> +	lcdif->irq = ret;
> +
> +	ret = request_irq(lcdif->irq, lcdif_irq_handler, 0,
> +			  drm->driver->name, drm);
> +	if (ret < 0) {
> +		dev_err(drm->dev, "Failed to install IRQ handler\n");
> +		return ret;
> +	}
> +
> +	drm_kms_helper_poll_init(drm);
> +
> +	drm_helper_hpd_irq_event(drm);
> +
> +	pm_runtime_enable(drm->dev);
> +
> +	return 0;
> +}
> +
> +static void lcdif_unload(struct drm_device *drm)
> +{
> +	struct lcdif_drm_private *lcdif = drm->dev_private;
> +
> +	pm_runtime_get_sync(drm->dev);
> +
> +	drm_crtc_vblank_off(&lcdif->crtc);
> +
> +	drm_kms_helper_poll_fini(drm);
> +	drm_mode_config_cleanup(drm);
> +
> +	pm_runtime_put_sync(drm->dev);
> +	pm_runtime_disable(drm->dev);
> +
> +	free_irq(lcdif->irq, drm->dev);
> +
> +	drm->dev_private = NULL;
> +}
> +
> +DEFINE_DRM_GEM_CMA_FOPS(fops);
> +
> +static const struct drm_driver lcdif_driver = {
> +	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> +	DRM_GEM_CMA_DRIVER_OPS,
> +	.fops	= &fops,
> +	.name	= "lcdif",
> +	.desc	= "LCDIF Controller DRM",
> +	.date	= "20220322",
> +	.major	= 1,
> +	.minor	= 0,
> +};
> +
> +static const struct of_device_id lcdif_dt_ids[] = {
> +	{ .compatible = "fsl,imx8mp-lcdif" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, lcdif_dt_ids);
> +
> +static int lcdif_probe(struct platform_device *pdev)
> +{
> +	struct drm_device *drm;
> +	int ret;
> +
> +	if (!pdev->dev.of_node)
> +		return -ENODEV;
> +
> +	drm = drm_dev_alloc(&lcdif_driver, &pdev->dev);
> +	if (IS_ERR(drm))
> +		return PTR_ERR(drm);
> +
> +	ret = lcdif_load(drm);
> +	if (ret)
> +		goto err_free;
> +
> +	ret = drm_dev_register(drm, 0);
> +	if (ret)
> +		goto err_unload;
> +
> +	drm_fbdev_generic_setup(drm, 32);
> +
> +	return 0;
> +
> +err_unload:
> +	lcdif_unload(drm);
> +err_free:
> +	drm_dev_put(drm);
> +
> +	return ret;
> +}
> +
> +static int lcdif_remove(struct platform_device *pdev)
> +{
> +	struct drm_device *drm = platform_get_drvdata(pdev);
> +
> +	drm_dev_unregister(drm);
> +	drm_atomic_helper_shutdown(drm);
> +	lcdif_unload(drm);
> +	drm_dev_put(drm);
> +
> +	return 0;
> +}
> +
> +static void lcdif_shutdown(struct platform_device *pdev)
> +{
> +	struct drm_device *drm = platform_get_drvdata(pdev);
> +
> +	drm_atomic_helper_shutdown(drm);
> +}
> +
> +static int lcdif_rpm_suspend(struct device *dev)
> +{
> +	struct drm_device *drm = dev_get_drvdata(dev);
> +	struct lcdif_drm_private *lcdif = drm->dev_private;
> +
> +	/* These clock supply the DISPLAY CLOCK Domain */
> +	clk_disable_unprepare(lcdif->clk);
> +	/* These clock supply the System Bus, AXI, Write Path, LFIFO */
> +	clk_disable_unprepare(lcdif->clk_disp_axi);
> +	/* These clock supply the Control Bus, APB, APBH Ctrl Registers */
> +	clk_disable_unprepare(lcdif->clk_axi);
> +
> +	return 0;
> +}
> +
> +static int lcdif_rpm_resume(struct device *dev)
> +{
> +	struct drm_device *drm = dev_get_drvdata(dev);
> +	struct lcdif_drm_private *lcdif = drm->dev_private;
> +
> +	/* These clock supply the Control Bus, APB, APBH Ctrl Registers */
> +	clk_prepare_enable(lcdif->clk_axi);
> +	/* These clock supply the System Bus, AXI, Write Path, LFIFO */
> +	clk_prepare_enable(lcdif->clk_disp_axi);
> +	/* These clock supply the DISPLAY CLOCK Domain */
> +	clk_prepare_enable(lcdif->clk);
> +
> +	return 0;
> +}
> +
> +static int lcdif_suspend(struct device *dev)
> +{
> +	struct drm_device *drm = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = drm_mode_config_helper_suspend(drm);
> +	if (ret)
> +		return ret;
> +
> +	return lcdif_rpm_suspend(dev);
> +}
> +
> +static int lcdif_resume(struct device *dev)
> +{
> +	struct drm_device *drm = dev_get_drvdata(dev);
> +
> +	lcdif_rpm_resume(dev);
> +
> +	return drm_mode_config_helper_resume(drm);
> +}
> +
> +static const struct dev_pm_ops lcdif_pm_ops = {
> +	.runtime_suspend = lcdif_rpm_suspend,
> +	.runtime_resume = lcdif_rpm_resume,
> +	SET_SYSTEM_SLEEP_PM_OPS(lcdif_suspend, lcdif_resume)
> +};
> +
> +static struct platform_driver lcdif_platform_driver = {
> +	.probe		= lcdif_probe,
> +	.remove		= lcdif_remove,
> +	.shutdown	= lcdif_shutdown,
> +	.driver	= {
> +		.name		= "lcdif",
> +		.of_match_table	= lcdif_dt_ids,
> +		.pm		= &lcdif_pm_ops,
> +	},
> +};
> +
> +drm_module_platform_driver(lcdif_platform_driver);
> +
> +MODULE_AUTHOR("Marek Vasut <marex@denx.de>");
> +MODULE_DESCRIPTION("Freescale LCDIF DRM/KMS driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.h
> b/drivers/gpu/drm/mxsfb/lcdif_drv.h
> new file mode 100644
> index 0000000000000..865cf5169ca81
> --- /dev/null
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) 2022 Marek Vasut <marex@denx.de>
> + *
> + * i.MX8MP/i.MXRT LCDIFv3 LCD controller driver.
> + */
> +
> +#ifndef __LCDIF_DRV_H__
> +#define __LCDIF_DRV_H__
> +
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_plane.h>
> +
> +struct clk;
> +
> +struct lcdif_drm_private {
> +	void __iomem			*base;	/* registers */
> +	struct clk			*clk;
> +	struct clk			*clk_axi;
> +	struct clk			*clk_disp_axi;
> +
> +	unsigned int			irq;
> +
> +	struct drm_device		*drm;
> +	struct {
> +		struct drm_plane	primary;
> +		/* i.MXRT does support overlay planes, add them here. */
> +	} planes;
> +	struct drm_crtc			crtc;
> +	struct drm_encoder		encoder;
> +	struct drm_connector		*connector;
> +	struct drm_bridge		*bridge;
> +};
> +
> +static inline struct lcdif_drm_private *
> +to_lcdif_drm_private(struct drm_device *drm)
> +{
> +	return drm->dev_private;
> +}
> +
> +void lcdif_enable_axi_clk(struct lcdif_drm_private *lcdif);
> +void lcdif_disable_axi_clk(struct lcdif_drm_private *lcdif);
> +
> +int lcdif_kms_init(struct lcdif_drm_private *lcdif);
> +
> +#endif /* __LCDIF_DRV_H__ */
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> new file mode 100644
> index 0000000000000..9afd3a73dc099
> --- /dev/null
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -0,0 +1,492 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2022 Marek Vasut <marex@denx.de>
> + *
> + * This code is based on drivers/gpu/drm/mxsfb/mxsfb*
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/spinlock.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_plane_helper.h>
> +#include <drm/drm_vblank.h>
> +
> +#include "lcdif_drv.h"
> +#include "lcdif_regs.h"
> +
> +/* 1 second delay should be plenty of time for block reset */
> +#define RESET_TIMEOUT		1000000
> +
> +/*
> -----------------------------------------------------------------------------
> + * CRTC
> + */
> +static dma_addr_t lcdif_get_fb_paddr(struct drm_plane *plane)
> +{
> +	struct drm_framebuffer *fb = plane->state->fb;
> +	struct drm_gem_cma_object *gem;
> +
> +	if (!fb)
> +		return 0;
> +
> +	gem = drm_fb_cma_get_gem_obj(fb, 0);
> +	if (!gem)
> +		return 0;
> +
> +	return gem->paddr;
> +}
> +
> +static void
> +lcdif_update_buffer(struct lcdif_drm_private *lcdif, struct drm_plane *plane)
> +{
> +	dma_addr_t paddr;
> +	u32 reg;
> +
> +	paddr = lcdif_get_fb_paddr(plane);
> +	if (!paddr)
> +		return;
> +
> +	writel(lower_32_bits(paddr),
> +	       lcdif->base + LCDC_V8_CTRLDESCL_LOW0_4);
> +	writel(CTRLDESCL_HIGH0_4_ADDR_HIGH(upper_32_bits(paddr)),
> +	       lcdif->base + LCDC_V8_CTRLDESCL_HIGH0_4);
> +
> +	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +	reg |= CTRLDESCL0_5_SHADOW_LOAD_EN;
> +	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +}
> +
> +static void lcdif_set_formats(struct lcdif_drm_private *lcdif,
> +			      const u32 bus_format)
> +{
> +	struct drm_device *drm = lcdif->drm;
> +	const u32 format = lcdif->crtc.primary->state->fb->format->format;
> +
> +	switch (bus_format) {
> +	case MEDIA_BUS_FMT_RGB565_1X16:
> +		writel(DISP_PARA_LINE_PATTERN_RGB565,
> +		       lcdif->base + LCDC_V8_DISP_PARA);
> +		break;
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +		writel(DISP_PARA_LINE_PATTERN_RGB888,
> +		       lcdif->base + LCDC_V8_DISP_PARA);
> +		break;
> +	default:
> +		dev_err(drm->dev, "Unknown media bus format 0x%x\n", bus_format);
> +		break;
> +	}
> +
> +	switch (format) {
> +	case DRM_FORMAT_RGB565:
> +		writel(CTRLDESCL0_5_BPP_16_RGB565,
> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +		break;
> +	case DRM_FORMAT_RGB888:
> +		writel(CTRLDESCL0_5_BPP_24_RGB888,
> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +		break;
> +	case DRM_FORMAT_XRGB1555:
> +		writel(CTRLDESCL0_5_BPP_16_ARGB1555,
> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +		break;
> +	case DRM_FORMAT_XRGB4444:
> +		writel(CTRLDESCL0_5_BPP_16_ARGB4444,
> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +		break;
> +	case DRM_FORMAT_XBGR8888:
> +		writel(CTRLDESCL0_5_BPP_32_ABGR8888,
> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +		break;
> +	case DRM_FORMAT_XRGB8888:
> +		writel(CTRLDESCL0_5_BPP_32_ARGB8888,
> +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +		break;
> +	default:
> +		dev_err(drm->dev, "Unknown pixel format 0x%x\n", format);
> +		break;
> +	}
> +}
> +
> +static void lcdif_set_mode(struct lcdif_drm_private *lcdif, u32 bus_flags)
> +{
> +	struct drm_display_mode *m = &lcdif->crtc.state->adjusted_mode;
> +	u32 ctrl = 0;
> +
> +	if (m->flags & DRM_MODE_FLAG_PHSYNC)
> +		ctrl |= CTRL_INV_HS;
> +	if (m->flags & DRM_MODE_FLAG_PVSYNC)
> +		ctrl |= CTRL_INV_VS;
> +	/* Make sure Data Enable is high active by default */
> +	if (!(bus_flags & DRM_BUS_FLAG_DE_LOW))
> +		ctrl |= CTRL_INV_DE;
> +	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
> +		ctrl |= CTRL_INV_PXCK;
> +
> +	writel(ctrl, lcdif->base + LCDC_V8_CTRL);
> +
> +	writel(DISP_SIZE_DELTA_Y(m->crtc_vdisplay) |
> +	       DISP_SIZE_DELTA_X(m->crtc_hdisplay),
> +	       lcdif->base + LCDC_V8_DISP_SIZE);
> +
> +	writel(HSYN_PARA_BP_H(m->htotal - m->hsync_end) |
> +	       HSYN_PARA_FP_H(m->hsync_start - m->hdisplay),
> +	       lcdif->base + LCDC_V8_HSYN_PARA);
> +
> +	writel(VSYN_PARA_BP_V(m->vtotal - m->vsync_end) |
> +	       VSYN_PARA_FP_V(m->vsync_start - m->vdisplay),
> +	       lcdif->base + LCDC_V8_VSYN_PARA);
> +
> +	writel(VSYN_HSYN_WIDTH_PW_V(m->vsync_end - m->vsync_start) |
> +	       VSYN_HSYN_WIDTH_PW_H(m->hsync_end - m->hsync_start),
> +	       lcdif->base + LCDC_V8_VSYN_HSYN_WIDTH);
> +
> +	writel(CTRLDESCL0_1_HEIGHT(m->crtc_vdisplay) |
> +	       CTRLDESCL0_1_WIDTH(m->crtc_hdisplay),
> +	       lcdif->base + LCDC_V8_CTRLDESCL0_1);
> +
> +	writel(CTRLDESCL0_3_PITCH(lcdif->crtc.primary->state->fb->pitches[0]),
> +	       lcdif->base + LCDC_V8_CTRLDESCL0_3);
> +}
> +
> +static void lcdif_enable_controller(struct lcdif_drm_private *lcdif)
> +{
> +	u32 reg;
> +
> +	reg = readl(lcdif->base + LCDC_V8_DISP_PARA);
> +	reg |= DISP_PARA_DISP_ON;
> +	writel(reg, lcdif->base + LCDC_V8_DISP_PARA);
> +
> +	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +	reg |= CTRLDESCL0_5_EN;
> +	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +}
> +
> +static void lcdif_disable_controller(struct lcdif_drm_private *lcdif)
> +{
> +	u32 reg;
> +
> +	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +	reg &= ~CTRLDESCL0_5_EN;
> +	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +
> +	reg = readl(lcdif->base + LCDC_V8_DISP_PARA);
> +	reg &= ~DISP_PARA_DISP_ON;
> +	writel(reg, lcdif->base + LCDC_V8_DISP_PARA);
> +}
> +
> +static int lcdif_reset_block(struct lcdif_drm_private *lcdif)
> +{
> +	u32 reg;
> +	int ret;
> +
> +	writel(CTRL_SW_RESET, lcdif->base + LCDC_V8_CTRL + REG_SET);
> +
> +	ret = readl_poll_timeout(lcdif->base + LCDC_V8_CTRL, reg,
> +				 (reg & CTRL_SW_RESET), 0,
> +				 RESET_TIMEOUT);
> +	if (ret)
> +		return ret;
> +
> +	writel(CTRL_SW_RESET, lcdif->base + LCDC_V8_CTRL + REG_CLR);
> +
> +	return readl_poll_timeout(lcdif->base + LCDC_V8_CTRL, reg,
> +				  !(reg & CTRL_SW_RESET), 0,
> +				  RESET_TIMEOUT);
> +}
> +
> +static void lcdif_crtc_mode_set_nofb(struct lcdif_drm_private *lcdif,
> +				     struct drm_bridge_state *bridge_state,
> +				     const u32 bus_format)
> +{
> +	struct drm_device *drm = lcdif->crtc.dev;
> +	struct drm_display_mode *m = &lcdif->crtc.state->adjusted_mode;
> +	u32 bus_flags = lcdif->connector->display_info.bus_flags;
> +	int err;
> +
> +	if (lcdif->bridge && lcdif->bridge->timings)
> +		bus_flags = lcdif->bridge->timings->input_bus_flags;
> +	else if (bridge_state)
> +		bus_flags = bridge_state->input_bus_cfg.flags;
> +
> +	DRM_DEV_DEBUG_DRIVER(drm->dev, "Pixel clock: %dkHz (actual: %dkHz)\n",
> +			     m->crtc_clock,
> +			     (int)(clk_get_rate(lcdif->clk) / 1000));
> +	DRM_DEV_DEBUG_DRIVER(drm->dev, "Connector bus_flags: 0x%08X\n",
> +			     bus_flags);
> +	DRM_DEV_DEBUG_DRIVER(drm->dev, "Mode flags: 0x%08X\n", m->flags);
> +
> +	/* Mandatory eLCDIF reset as per the Reference Manual */
> +	err = lcdif_reset_block(lcdif);
> +	if (err)
> +		return;
> +
> +	lcdif_set_formats(lcdif, bus_format);
> +
> +	lcdif_set_mode(lcdif, bus_flags);
> +}
> +
> +static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
> +				   struct drm_atomic_state *state)
> +{
> +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
> +									  crtc);
> +	bool has_primary = crtc_state->plane_mask &
> +			   drm_plane_mask(crtc->primary);
> +
> +	/* The primary plane has to be enabled when the CRTC is active. */
> +	if (crtc_state->active && !has_primary)
> +		return -EINVAL;
> +
> +	return drm_atomic_add_affected_planes(state, crtc);
> +}
> +
> +static void lcdif_crtc_atomic_flush(struct drm_crtc *crtc,
> +				    struct drm_atomic_state *state)
> +{
> +	struct drm_pending_vblank_event *event;
> +
> +	event = crtc->state->event;
> +	crtc->state->event = NULL;
> +
> +	if (!event)
> +		return;
> +
> +	spin_lock_irq(&crtc->dev->event_lock);
> +	if (drm_crtc_vblank_get(crtc) == 0)
> +		drm_crtc_arm_vblank_event(crtc, event);
> +	else
> +		drm_crtc_send_vblank_event(crtc, event);
> +	spin_unlock_irq(&crtc->dev->event_lock);
> +}
> +
> +static void lcdif_crtc_atomic_enable(struct drm_crtc *crtc,
> +				     struct drm_atomic_state *state)
> +{
> +	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
> +	struct drm_display_mode *m = &lcdif->crtc.state->adjusted_mode;
> +	struct drm_bridge_state *bridge_state = NULL;
> +	struct drm_device *drm = lcdif->drm;
> +	u32 bus_format = 0;
> +
> +	/* If there is a bridge attached to the LCDIF, use its bus format */
> +	if (lcdif->bridge) {
> +		bridge_state =
> +			drm_atomic_get_new_bridge_state(state,
> +							lcdif->bridge);
> +		if (!bridge_state)
> +			bus_format = MEDIA_BUS_FMT_FIXED;
> +		else
> +			bus_format = bridge_state->input_bus_cfg.format;
> +
> +		if (bus_format == MEDIA_BUS_FMT_FIXED) {
> +			dev_warn_once(drm->dev,
> +				      "Bridge does not provide bus format, assuming
> MEDIA_BUS_FMT_RGB888_1X24.\n"
> +				      "Please fix bridge driver by handling atomic_get_input_bus_fmts.\n");
> +			bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> +		}
> +	}
> +
> +	/* If there is no bridge, use bus format from connector */
> +	if (!bus_format && lcdif->connector->display_info.num_bus_formats)
> +		bus_format = lcdif->connector->display_info.bus_formats[0];
> +
> +	/* If all else fails, default to RGB888_1X24 */
> +	if (!bus_format)
> +		bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> +
> +	clk_set_rate(lcdif->clk, m->crtc_clock * 1000);
> +
> +	pm_runtime_get_sync(drm->dev);
> +
> +	lcdif_crtc_mode_set_nofb(lcdif, bridge_state, bus_format);
> +
> +	/* Write cur_buf as well to avoid an initial corrupt frame */
> +	lcdif_update_buffer(lcdif, crtc->primary);
> +	lcdif_enable_controller(lcdif);
> +
> +	drm_crtc_vblank_on(crtc);
> +}
> +
> +static void lcdif_crtc_atomic_disable(struct drm_crtc *crtc,
> +				      struct drm_atomic_state *state)
> +{
> +	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
> +	struct drm_device *drm = lcdif->drm;
> +	struct drm_pending_vblank_event *event;
> +
> +	drm_crtc_vblank_off(crtc);
> +
> +	lcdif_disable_controller(lcdif);
> +
> +	spin_lock_irq(&drm->event_lock);
> +	event = crtc->state->event;
> +	if (event) {
> +		crtc->state->event = NULL;
> +		drm_crtc_send_vblank_event(crtc, event);
> +	}
> +	spin_unlock_irq(&drm->event_lock);
> +
> +	pm_runtime_put_sync(drm->dev);
> +}
> +
> +static int lcdif_crtc_enable_vblank(struct drm_crtc *crtc)
> +{
> +	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
> +
> +	/* Clear and enable VBLANK IRQ */
> +	writel(INT_STATUS_D0_VS_BLANK, lcdif->base + LCDC_V8_INT_STATUS_D0);
> +	writel(INT_ENABLE_D0_VS_BLANK_EN, lcdif->base + LCDC_V8_INT_ENABLE_D0);
> +
> +	return 0;
> +}
> +
> +static void lcdif_crtc_disable_vblank(struct drm_crtc *crtc)
> +{
> +	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
> +
> +	/* Disable and clear VBLANK IRQ */
> +	writel(0, lcdif->base + LCDC_V8_INT_ENABLE_D0);
> +	writel(INT_STATUS_D0_VS_BLANK, lcdif->base + LCDC_V8_INT_STATUS_D0);
> +}
> +
> +static const struct drm_crtc_helper_funcs lcdif_crtc_helper_funcs = {
> +	.atomic_check = lcdif_crtc_atomic_check,
> +	.atomic_flush = lcdif_crtc_atomic_flush,
> +	.atomic_enable = lcdif_crtc_atomic_enable,
> +	.atomic_disable = lcdif_crtc_atomic_disable,
> +};
> +
> +static const struct drm_crtc_funcs lcdif_crtc_funcs = {
> +	.reset = drm_atomic_helper_crtc_reset,
> +	.destroy = drm_crtc_cleanup,
> +	.set_config = drm_atomic_helper_set_config,
> +	.page_flip = drm_atomic_helper_page_flip,
> +	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> +	.enable_vblank = lcdif_crtc_enable_vblank,
> +	.disable_vblank = lcdif_crtc_disable_vblank,
> +};
> +
> +/*
> -----------------------------------------------------------------------------
> + * Encoder
> + */
> +
> +static const struct drm_encoder_funcs lcdif_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
> +/*
> -----------------------------------------------------------------------------
> + * Planes
> + */
> +
> +static int lcdif_plane_atomic_check(struct drm_plane *plane,
> +				    struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state,
> +									     plane);
> +	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(plane->dev);
> +	struct drm_crtc_state *crtc_state;
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state,
> +						   &lcdif->crtc);
> +
> +	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
> +						   DRM_PLANE_HELPER_NO_SCALING,
> +						   DRM_PLANE_HELPER_NO_SCALING,
> +						   false, true);
> +}
> +
> +static void lcdif_plane_primary_atomic_update(struct drm_plane *plane,
> +					      struct drm_atomic_state *state)
> +{
> +	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(plane->dev);
> +
> +	lcdif_update_buffer(lcdif, plane);
> +}
> +
> +static bool lcdif_format_mod_supported(struct drm_plane *plane,
> +				       uint32_t format,
> +				       uint64_t modifier)
> +{
> +	return modifier == DRM_FORMAT_MOD_LINEAR;
> +}
> +
> +static const struct drm_plane_helper_funcs lcdif_plane_primary_helper_funcs = {
> +	.atomic_check = lcdif_plane_atomic_check,
> +	.atomic_update = lcdif_plane_primary_atomic_update,
> +};
> +
> +static const struct drm_plane_funcs lcdif_plane_funcs = {
> +	.format_mod_supported	= lcdif_format_mod_supported,
> +	.update_plane		= drm_atomic_helper_update_plane,
> +	.disable_plane		= drm_atomic_helper_disable_plane,
> +	.destroy		= drm_plane_cleanup,
> +	.reset			= drm_atomic_helper_plane_reset,
> +	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
> +	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
> +};
> +
> +static const uint32_t lcdif_primary_plane_formats[] = {
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_XRGB8888,
> +};
> +
> +static const uint32_t lcdif_overlay_plane_formats[] = {
> +	DRM_FORMAT_XRGB4444,
> +	DRM_FORMAT_ARGB4444,
> +	DRM_FORMAT_XRGB1555,
> +	DRM_FORMAT_ARGB1555,
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_ARGB8888,
> +};
> +
> +static const uint64_t lcdif_modifiers[] = {
> +	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_INVALID
> +};
> +
> +/*
> -----------------------------------------------------------------------------
> + * Initialization
> + */
> +
> +int lcdif_kms_init(struct lcdif_drm_private *lcdif)
> +{
> +	struct drm_encoder *encoder = &lcdif->encoder;
> +	struct drm_crtc *crtc = &lcdif->crtc;
> +	int ret;
> +
> +	drm_plane_helper_add(&lcdif->planes.primary,
> +			     &lcdif_plane_primary_helper_funcs);
> +	ret = drm_universal_plane_init(lcdif->drm, &lcdif->planes.primary, 1,
> +				       &lcdif_plane_funcs,
> +				       lcdif_primary_plane_formats,
> +				       ARRAY_SIZE(lcdif_primary_plane_formats),
> +				       lcdif_modifiers, DRM_PLANE_TYPE_PRIMARY,
> +				       NULL);
> +	if (ret)
> +		return ret;
> +
> +	drm_crtc_helper_add(crtc, &lcdif_crtc_helper_funcs);
> +	ret = drm_crtc_init_with_planes(lcdif->drm, crtc,
> +					&lcdif->planes.primary, NULL,
> +					&lcdif_crtc_funcs, NULL);
> +	if (ret)
> +		return ret;
> +
> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
> +	return drm_encoder_init(lcdif->drm, encoder, &lcdif_encoder_funcs,
> +				DRM_MODE_ENCODER_NONE, NULL);
> +}
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_regs.h
> b/drivers/gpu/drm/mxsfb/lcdif_regs.h
> new file mode 100644
> index 0000000000000..2b8c4d0684836
> --- /dev/null
> +++ b/drivers/gpu/drm/mxsfb/lcdif_regs.h
> @@ -0,0 +1,243 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) 2022 Marek Vasut <marex@denx.de>
> + *
> + * i.MX8MP/i.MXRT LCDIF LCD controller driver.
> + */
> +
> +#ifndef __LCDIF_REGS_H__
> +#define __LCDIF_REGS_H__
> +
> +#define REG_SET	4
> +#define REG_CLR	8
> +
> +/* V8 register set */
> +#define LCDC_V8_CTRL			0x00
> +#define LCDC_V8_DISP_PARA		0x10
> +#define LCDC_V8_DISP_SIZE		0x14
> +#define LCDC_V8_HSYN_PARA		0x18
> +#define LCDC_V8_VSYN_PARA		0x1c
> +#define LCDC_V8_VSYN_HSYN_WIDTH		0x20
> +#define LCDC_V8_INT_STATUS_D0		0x24
> +#define LCDC_V8_INT_ENABLE_D0		0x28
> +#define LCDC_V8_INT_STATUS_D1		0x30
> +#define LCDC_V8_INT_ENABLE_D1		0x34
> +#define LCDC_V8_CTRLDESCL0_1		0x200
> +#define LCDC_V8_CTRLDESCL0_3		0x208
> +#define LCDC_V8_CTRLDESCL_LOW0_4	0x20c
> +#define LCDC_V8_CTRLDESCL_HIGH0_4	0x210
> +#define LCDC_V8_CTRLDESCL0_5		0x214
> +#define LCDC_V8_CSC0_CTRL		0x21c
> +#define LCDC_V8_CSC0_COEF0		0x220
> +#define LCDC_V8_CSC0_COEF1		0x224
> +#define LCDC_V8_CSC0_COEF2		0x228
> +#define LCDC_V8_CSC0_COEF3		0x22c
> +#define LCDC_V8_CSC0_COEF4		0x230
> +#define LCDC_V8_CSC0_COEF5		0x234
> +#define LCDC_V8_PANIC0_THRES		0x238
> +
> +#define CTRL_SFTRST			BIT(31)
> +#define CTRL_CLKGATE			BIT(30)
> +#define CTRL_BYPASS_COUNT		BIT(19)
> +#define CTRL_VSYNC_MODE			BIT(18)
> +#define CTRL_DOTCLK_MODE		BIT(17)
> +#define CTRL_DATA_SELECT		BIT(16)
> +#define CTRL_BUS_WIDTH_16		(0 << 10)
> +#define CTRL_BUS_WIDTH_8		(1 << 10)
> +#define CTRL_BUS_WIDTH_18		(2 << 10)
> +#define CTRL_BUS_WIDTH_24		(3 << 10)
> +#define CTRL_BUS_WIDTH_MASK		(0x3 << 10)
> +#define CTRL_WORD_LENGTH_16		(0 << 8)
> +#define CTRL_WORD_LENGTH_8		(1 << 8)
> +#define CTRL_WORD_LENGTH_18		(2 << 8)
> +#define CTRL_WORD_LENGTH_24		(3 << 8)
> +#define CTRL_MASTER			BIT(5)
> +#define CTRL_DF16			BIT(3)
> +#define CTRL_DF18			BIT(2)
> +#define CTRL_DF24			BIT(1)
> +#define CTRL_RUN			BIT(0)
> +
> +#define CTRL1_RECOVER_ON_UNDERFLOW	BIT(24)
> +#define CTRL1_FIFO_CLEAR		BIT(21)
> +#define CTRL1_SET_BYTE_PACKAGING(x)	(((x) & 0xf) << 16)
> +#define CTRL1_GET_BYTE_PACKAGING(x)	(((x) >> 16) & 0xf)
> +#define CTRL1_CUR_FRAME_DONE_IRQ_EN	BIT(13)
> +#define CTRL1_CUR_FRAME_DONE_IRQ	BIT(9)
> +
> +#define CTRL2_SET_OUTSTANDING_REQS_1	0
> +#define CTRL2_SET_OUTSTANDING_REQS_2	(0x1 << 21)
> +#define CTRL2_SET_OUTSTANDING_REQS_4	(0x2 << 21)
> +#define CTRL2_SET_OUTSTANDING_REQS_8	(0x3 << 21)
> +#define CTRL2_SET_OUTSTANDING_REQS_16	(0x4 << 21)
> +#define CTRL2_SET_OUTSTANDING_REQS_MASK	(0x7 << 21)
> +
> +#define TRANSFER_COUNT_SET_VCOUNT(x)	(((x) & 0xffff) << 16)
> +#define TRANSFER_COUNT_GET_VCOUNT(x)	(((x) >> 16) & 0xffff)
> +#define TRANSFER_COUNT_SET_HCOUNT(x)	((x) & 0xffff)
> +#define TRANSFER_COUNT_GET_HCOUNT(x)	((x) & 0xffff)
> +
> +#define VDCTRL0_ENABLE_PRESENT		BIT(28)
> +#define VDCTRL0_VSYNC_ACT_HIGH		BIT(27)
> +#define VDCTRL0_HSYNC_ACT_HIGH		BIT(26)
> +#define VDCTRL0_DOTCLK_ACT_FALLING	BIT(25)
> +#define VDCTRL0_ENABLE_ACT_HIGH		BIT(24)
> +#define VDCTRL0_VSYNC_PERIOD_UNIT	BIT(21)
> +#define VDCTRL0_VSYNC_PULSE_WIDTH_UNIT	BIT(20)
> +#define VDCTRL0_HALF_LINE		BIT(19)
> +#define VDCTRL0_HALF_LINE_MODE		BIT(18)
> +#define VDCTRL0_SET_VSYNC_PULSE_WIDTH(x) ((x) & 0x3ffff)
> +#define VDCTRL0_GET_VSYNC_PULSE_WIDTH(x) ((x) & 0x3ffff)
> +
> +#define VDCTRL2_SET_HSYNC_PERIOD(x)	((x) & 0x3ffff)
> +#define VDCTRL2_GET_HSYNC_PERIOD(x)	((x) & 0x3ffff)
> +
> +#define VDCTRL3_MUX_SYNC_SIGNALS	BIT(29)
> +#define VDCTRL3_VSYNC_ONLY		BIT(28)
> +#define SET_HOR_WAIT_CNT(x)		(((x) & 0xfff) << 16)
> +#define GET_HOR_WAIT_CNT(x)		(((x) >> 16) & 0xfff)
> +#define SET_VERT_WAIT_CNT(x)		((x) & 0xffff)
> +#define GET_VERT_WAIT_CNT(x)		((x) & 0xffff)
> +
> +#define VDCTRL4_SET_DOTCLK_DLY(x)	(((x) & 0x7) << 29) /* v4 only */
> +#define VDCTRL4_GET_DOTCLK_DLY(x)	(((x) >> 29) & 0x7) /* v4 only */
> +#define VDCTRL4_SYNC_SIGNALS_ON		BIT(18)
> +#define SET_DOTCLK_H_VALID_DATA_CNT(x)	((x) & 0x3ffff)
> +
> +#define DEBUG0_HSYNC			BIT(26)
> +#define DEBUG0_VSYNC			BIT(25)
> +
> +#define AS_CTRL_PS_DISABLE		BIT(23)
> +#define AS_CTRL_ALPHA_INVERT		BIT(20)
> +#define AS_CTRL_ALPHA(a)		(((a) & 0xff) << 8)
> +#define AS_CTRL_FORMAT_RGB565		(0xe << 4)
> +#define AS_CTRL_FORMAT_RGB444		(0xd << 4)
> +#define AS_CTRL_FORMAT_RGB555		(0xc << 4)
> +#define AS_CTRL_FORMAT_ARGB4444		(0x9 << 4)
> +#define AS_CTRL_FORMAT_ARGB1555		(0x8 << 4)
> +#define AS_CTRL_FORMAT_RGB888		(0x4 << 4)
> +#define AS_CTRL_FORMAT_ARGB8888		(0x0 << 4)
> +#define AS_CTRL_ENABLE_COLORKEY		BIT(3)
> +#define AS_CTRL_ALPHA_CTRL_ROP		(3 << 1)
> +#define AS_CTRL_ALPHA_CTRL_MULTIPLY	(2 << 1)
> +#define AS_CTRL_ALPHA_CTRL_OVERRIDE	(1 << 1)
> +#define AS_CTRL_ALPHA_CTRL_EMBEDDED	(0 << 1)
> +#define AS_CTRL_AS_ENABLE		BIT(0)
> +
> +/* V8 register set */
> +#define CTRL_SW_RESET			BIT(31)
> +#define CTRL_FETCH_START_OPTION_FPV	0
> +#define CTRL_FETCH_START_OPTION_PWV	BIT(8)
> +#define CTRL_FETCH_START_OPTION_BPV	BIT(9)
> +#define CTRL_FETCH_START_OPTION_RESV	GENMASK(9, 8)
> +#define CTRL_FETCH_START_OPTION_MASK	GENMASK(9, 8)
> +#define CTRL_NEG				BIT(4)
> +#define CTRL_INV_PXCK			BIT(3)
> +#define CTRL_INV_DE			BIT(2)
> +#define CTRL_INV_VS			BIT(1)
> +#define CTRL_INV_HS			BIT(0)
> +
> +#define DISP_PARA_DISP_ON		BIT(31)
> +#define DISP_PARA_SWAP_EN		BIT(30)
> +#define DISP_PARA_LINE_PATTERN_RGB565	GENMASK(28, 26)
> +#define DISP_PARA_LINE_PATTERN_RGB888	0
> +#define DISP_PARA_LINE_PATTERN_MASK	GENMASK(29, 26)
> +#define DISP_PARA_DISP_MODE_MASK	GENMASK(25, 24)
> +#define DISP_PARA_BGND_R_MASK		GENMASK(23, 16)
> +#define DISP_PARA_BGND_G_MASK		GENMASK(15, 8)
> +#define DISP_PARA_BGND_B_MASK		GENMASK(7, 0)
> +
> +#define DISP_SIZE_DELTA_Y(n)		(((n) & 0xffff) << 16)
> +#define DISP_SIZE_DELTA_Y_MASK		GENMASK(31, 16)
> +#define DISP_SIZE_DELTA_X(n)		((n) & 0xffff)
> +#define DISP_SIZE_DELTA_X_MASK		GENMASK(15, 0)
> +
> +#define HSYN_PARA_BP_H(n)		(((n) & 0xffff) << 16)
> +#define HSYN_PARA_BP_H_MASK		GENMASK(31, 16)
> +#define HSYN_PARA_FP_H(n)		((n) & 0xffff)
> +#define HSYN_PARA_FP_H_MASK		GENMASK(15, 0)
> +
> +#define VSYN_PARA_BP_V(n)		(((n) & 0xffff) << 16)
> +#define VSYN_PARA_BP_V_MASK		GENMASK(31, 16)
> +#define VSYN_PARA_FP_V(n)		((n) & 0xffff)
> +#define VSYN_PARA_FP_V_MASK		GENMASK(15, 0)
> +
> +#define VSYN_HSYN_WIDTH_PW_V(n)		(((n) & 0xffff) << 16)
> +#define VSYN_HSYN_WIDTH_PW_V_MASK	GENMASK(31, 16)
> +#define VSYN_HSYN_WIDTH_PW_H(n)		((n) & 0xffff)
> +#define VSYN_HSYN_WIDTH_PW_H_MASK	GENMASK(15, 0)
> +
> +#define INT_STATUS_D0_FIFO_EMPTY	BIT(24)
> +#define INT_STATUS_D0_DMA_DONE		BIT(16)
> +#define INT_STATUS_D0_DMA_ERR		BIT(8)
> +#define INT_STATUS_D0_VS_BLANK		BIT(2)
> +#define INT_STATUS_D0_UNDERRUN		BIT(1)
> +#define INT_STATUS_D0_VSYNC		BIT(0)
> +
> +#define INT_ENABLE_D0_FIFO_EMPTY_EN	BIT(24)
> +#define INT_ENABLE_D0_DMA_DONE_EN	BIT(16)
> +#define INT_ENABLE_D0_DMA_ERR_EN	BIT(8)
> +#define INT_ENABLE_D0_VS_BLANK_EN	BIT(2)
> +#define INT_ENABLE_D0_UNDERRUN_EN	BIT(1)
> +#define INT_ENABLE_D0_VSYNC_EN		BIT(0)
> +
> +#define INT_STATUS_D1_PLANE_PANIC	BIT(0)
> +
> +#define INT_ENABLE_D1_PLANE_PANIC_EN	BIT(0)
> +
> +#define CTRLDESCL0_1_HEIGHT(n)		(((n) & 0xffff) << 16)
> +#define CTRLDESCL0_1_HEIGHT_MASK		GENMASK(31, 16)
> +#define CTRLDESCL0_1_WIDTH(n)		((n) & 0xffff)
> +#define CTRLDESCL0_1_WIDTH_MASK		GENMASK(15, 0)
> +
> +#define CTRLDESCL0_3_PITCH(n)		((n) & 0xffff)
> +#define CTRLDESCL0_3_PITCH_MASK		GENMASK(15, 0)
> +
> +#define CTRLDESCL_HIGH0_4_ADDR_HIGH(n)	((n) & 0xf)
> +#define CTRLDESCL_HIGH0_4_ADDR_HIGH_MASK	GENMASK(3, 0)
> +
> +#define CTRLDESCL0_5_EN			BIT(31)
> +#define CTRLDESCL0_5_SHADOW_LOAD_EN	BIT(30)
> +#define CTRLDESCL0_5_BPP_16_RGB565	BIT(26)
> +#define CTRLDESCL0_5_BPP_16_ARGB1555	(BIT(26) | BIT(24))
> +#define CTRLDESCL0_5_BPP_16_ARGB4444	(BIT(26) | BIT(25))
> +#define CTRLDESCL0_5_BPP_YCbCr422	(BIT(26) | BIT(25) | BIT(24))
> +#define CTRLDESCL0_5_BPP_24_RGB888	BIT(27)
> +#define CTRLDESCL0_5_BPP_32_ARGB8888	(BIT(27) | BIT(24))
> +#define CTRLDESCL0_5_BPP_32_ABGR8888	(BIT(27) | BIT(25))
> +#define CTRLDESCL0_5_BPP_MASK		GENMASK(27, 24)
> +#define CTRLDESCL0_5_YUV_FORMAT_Y2VY1U	0
> +#define CTRLDESCL0_5_YUV_FORMAT_Y2UY1V	BIT(14)
> +#define CTRLDESCL0_5_YUV_FORMAT_VY2UY1	BIT(15)
> +#define CTRLDESCL0_5_YUV_FORMAT_UY2VY1	(BIT(15) | BIT(14))
> +#define CTRLDESCL0_5_YUV_FORMAT_MASK	GENMASK(15, 14)
> +
> +#define CSC0_CTRL_CSC_MODE_MASK		GENMASK(2, 1)
> +#define CSC0_CTRL_BYPASS		BIT(0)
> +
> +#define CSC0_COEF0_A2_MASK		GENMASK(26, 16)
> +#define CSC0_COEF0_A1_MASK		GENMASK(10, 0)
> +
> +#define CSC0_COEF1_B1_MASK		GENMASK(26, 16)
> +#define CSC0_COEF1_A3_MASK		GENMASK(10, 0)
> +
> +#define CSC0_COEF2_B3_MASK		GENMASK(26, 16)
> +#define CSC0_COEF2_B2_MASK		GENMASK(10, 0)
> +
> +#define CSC0_COEF3_C2_MASK		GENMASK(26, 16)
> +#define CSC0_COEF3_C1_MASK		GENMASK(10, 0)
> +
> +#define CSC0_COEF4_D1_MASK		GENMASK(24, 16)
> +#define CSC0_COEF4_C3_MASK		GENMASK(10, 0)
> +
> +#define CSC0_COEF5_D3_MASK		GENMASK(24, 16)
> +#define CSC0_COEF5_D2_MASK		GENMASK(8, 0)
> +
> +#define PANIC0_THRES_LOW_MASK		GENMASK(24, 16)
> +#define PANIC0_THRES_HIGH_MASK		GENMASK(8, 0)
> +
> +#define LCDIF_MIN_XRES			120
> +#define LCDIF_MIN_YRES			120
> +#define LCDIF_MAX_XRES			0xffff
> +#define LCDIF_MAX_YRES			0xffff
> +
> +#endif /* __LCDIF_REGS_H__ */
