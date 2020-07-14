Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F35D21FF3F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 22:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6389B6E9D7;
	Tue, 14 Jul 2020 20:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5EB6E974;
 Tue, 14 Jul 2020 20:58:35 +0000 (UTC)
IronPort-SDR: CI+do7GN/GDGcF9G9zHu/aoGGE++yrU0qac5KCbyIZgLUywz6JcHF3b+aw8Fi4CqgcAW6D4VXE
 QY+6syUcyF5g==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444581"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444581"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:35 -0700
IronPort-SDR: Z0hAevkB3IUQU2shfrgAiZ2APcpOZnJDwzJCP7qyEFtVwUMWJ4pV1f/RNT2K3Ry4JQjSoUkEBH
 Rv6B+moL192Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504190"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:34 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 31/59] drm/kmb: Cleanup probe functions
Date: Tue, 14 Jul 2020 13:57:17 -0700
Message-Id: <1594760265-11618-32-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 rodrigo.vivi@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Edmund Dea <edmund.j.dea@intel.com>

- Removed deprecated code blocks within probe functions
- In kmb_remove, unregister MIPI DSI host
- In kmb_probe, if kmb_load fails, then unregister MIPI DSI host
- Change kmb_dsi_host_bridge_init to return error codes using ERR_PTR
- Do clock intitialization earlier
- Rename kmb_drm_unbind to kmb_drm_unload.
- Get mmio info from device tree

v2: upclassed dev_private

Signed-off-by: Edmund Dea <edmund.j.dea@intel.com>
Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c | 332 +++++++++++++++++++++++-------------------
 drivers/gpu/drm/kmb/kmb_drv.h |   1 +
 drivers/gpu/drm/kmb/kmb_dsi.c |  85 ++++-------
 3 files changed, 218 insertions(+), 200 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 76f3c43..25daba7 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -30,18 +30,18 @@
 #include "kmb_regs.h"
 
 #define DEBUG
+
 /*IRQ handler*/
 static irqreturn_t kmb_isr(int irq, void *arg);
 
 static struct clk *clk_lcd;
 static struct clk *clk_mipi;
 
-static int probe_deferred;
 struct drm_bridge *adv_bridge;
 
 static int kmb_display_clk_enable(void)
 {
-	int ret;
+	int ret = 0;
 
 	ret = clk_prepare_enable(clk_lcd);
 	if (ret) {
@@ -67,86 +67,142 @@ static int kmb_display_clk_disable(void)
 	return 0;
 }
 
+static void __iomem *kmb_map_mmio(struct platform_device *pdev, char *name)
+{
+	struct resource *res;
+	u32 size;
+	void __iomem *mem;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
+	if (!res) {
+		DRM_ERROR("failed to get resource for %s\n", name);
+		return ERR_PTR(-ENOMEM);
+	}
+	size = resource_size(res);
+	if (!request_mem_region(res->start, size, name)) {
+		DRM_ERROR("failed to reserve %s registers\n", name);
+		return ERR_PTR(-ENOMEM);
+	}
+	mem = ioremap(res->start, size);
+	if (!mem) {
+		DRM_ERROR("failed to ioremap %s registers\n", name);
+		release_mem_region(res->start, size);
+		return ERR_PTR(-ENOMEM);
+	}
+	return mem;
+}
+
 static int kmb_load(struct drm_device *drm, unsigned long flags)
 {
 	struct kmb_drm_private *dev_p = to_kmb(drm);
 	struct platform_device *pdev = to_platform_device(drm->dev);
-/*	struct drm_bridge *bridge;*/
-	/*struct resource *res;*/
 	/*u32 version;*/
-	int ret;
-/*	struct device_node *encoder_node;*/
-
-	/* TBD - not sure if clock_get needs to be called here */
-	/*
-	 *dev_p->clk = devm_clk_get(drm->dev, "pxlclk");
-	 *if (IS_ERR(dev_p->clk))
-	 *	return PTR_ERR(dev_p->clk);
-	 */
-	/*
-	 * TBD call this in the future when device tree is ready,
-	 * use hardcoded value for now
-	 */
-	/*
-	 * res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	 * dev_p->lcd_mmio = devm_ioremap_resource(drm->dev, res);
-
-	 *if (IS_ERR(dev_p->lcd_mmio)) {
-	 *	DRM_ERROR("failed to map control registers area\n");
-	 *	ret = PTR_ERR(dev_p->lcd_mmio);
-	 *	dev_p->lcd_mmio = NULL;
-	 *	return ret;
-	 *}
-	 */
-	/* LCD mmio */
-	probe_deferred = 1;
+	int ret = 0;
 
-	if (!request_mem_region(LCD_BASE_ADDR, LCD_MMIO_SIZE, "kmb-lcd")) {
-		DRM_ERROR("failed to reserve LCD registers\n");
-		return -ENOMEM;
-	}
-	dev_p->lcd_mmio = ioremap_cache(LCD_BASE_ADDR, LCD_MMIO_SIZE);
-	if (!dev_p->lcd_mmio) {
+	/* Map LCD MMIO registers */
+	dev_p->lcd_mmio = kmb_map_mmio(pdev, "lcd_regs");
+	if (IS_ERR(dev_p->lcd_mmio)) {
 		DRM_ERROR("failed to map LCD registers\n");
 		return -ENOMEM;
 	}
-	/* Mipi mmio */
-	if (!request_mem_region(MIPI_BASE_ADDR, MIPI_MMIO_SIZE, "kmb-mipi")) {
-		DRM_ERROR("failed to reserve MIPI registers\n");
+
+	/* Map MIPI MMIO registers */
+	dev_p->mipi_mmio = kmb_map_mmio(pdev, "mipi_regs");
+
+	if (IS_ERR(dev_p->mipi_mmio)) {
+		DRM_ERROR("failed to map MIPI registers\n");
 		iounmap(dev_p->lcd_mmio);
 		return -ENOMEM;
 	}
-	dev_p->mipi_mmio = ioremap_cache(MIPI_BASE_ADDR, MIPI_MMIO_SIZE);
-	if (!dev_p->mipi_mmio) {
-		DRM_ERROR("failed to map MIPI registers\n");
+
+	/* This is only for MIPI_TX_MSS_LCD_MIPI_CFG and MSS_CAM_CLK_CTRL
+	 * register
+	 */
+	dev_p->msscam_mmio = kmb_map_mmio(pdev, "msscam_regs");
+	if (IS_ERR(dev_p->msscam_mmio)) {
+		DRM_ERROR("failed to map MSSCAM registers\n");
 		iounmap(dev_p->lcd_mmio);
+		iounmap(dev_p->mipi_mmio);
 		return -ENOMEM;
 	}
-	/*this is only for MIPI_TX_MSS_LCD_MIPI_CFG register */
-	if (!dev_p->msscam_mmio) {
-		dev_p->msscam_mmio = ioremap_cache(MSS_CAM_BASE_ADDR,
-			MSS_CAM_MMIO_SIZE);
+
+	/* enable display clocks*/
+	clk_lcd = clk_get(&pdev->dev, "clk_lcd");
+	if (!clk_lcd) {
+		DRM_ERROR("clk_get() failed clk_lcd\n");
+		goto setup_fail;
+	}
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
+
+	clk_mipi = clk_get(&pdev->dev, "clk_mipi");
+	if (!clk_mipi) {
+		DRM_ERROR("clk_get() failed clk_mipi\n");
+		goto setup_fail;
 	}
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
+	ret = kmb_display_clk_enable();
 
-	/* register irqs here - section 17.3 in databook
+	/* set LCD clock to 200 Mhz*/
+	DRM_INFO("Get clk_lcd before set = %ld\n", clk_get_rate(clk_lcd));
+	ret = clk_set_rate(clk_lcd, 200000000);
+	DRM_INFO("Setting LCD clock tp 200Mhz ret = %d\n", ret);
+	DRM_INFO("Get clk_lcd after set = %ld\n", clk_get_rate(clk_lcd));
+	/* set MIPI clock to 24 Mhz*/
+	DRM_INFO("Get clk_mipi before set = %ld\n", clk_get_rate(clk_mipi));
+	ret = clk_set_rate(clk_mipi, 24000000);
+	DRM_INFO("Setting MIPI clock tp 24Mhz ret = %d\n", ret);
+	DRM_INFO("Get clk_mipi after set = %ld\n", clk_get_rate(clk_mipi));
+
+#ifdef WIP
+	/* Register irqs here - section 17.3 in databook
 	 * lists LCD at 79 and 82 for MIPI under MSS CPU -
 	 * firmware has to redirect it to A53
 	 */
+	DRM_INFO("platform_get_irq_byname %pOF\n", drm->dev->of_node);
+
+	/* Allocate LCD interrupt resources, enable interrupt line,
+	 * and setup IRQ handling
+	 */
+	irq_lcd = platform_get_irq_byname(pdev, "irq_lcd");
+	if (irq_lcd < 0) {
+		DRM_ERROR("irq_lcd not found");
+		return irq_lcd;
+	}
+
+	pr_info("irq_lcd platform_get_irq = %d\n", irq_lcd);
+
+	ret = request_irq(irq_lcd, kmb_isr, IRQF_SHARED, "irq_lcd", dev_p);
+	dev_p->irq_lcd = irq_lcd;
+
+	/* Allocate MIPI interrupt resources, enable interrupt line,
+	 * and setup IRQ handling
+	 */
+	irq_mipi = platform_get_irq_byname(pdev, "irq_mipi");
+	if (irq_mipi < 0) {
+		DRM_ERROR("irq_mipi not found");
+		return irq_mipi;
+	}
 
-		/*TBD read and check for correct product version here */
+	pr_info("irq_mipi platform_get_irq = %d\n", irq_mipi);
+	ret = request_irq(irq_mipi, kmb_isr, IRQF_SHARED, "irq_mipi", dev_p);
+	dev_p->irq_mipi = irq_mipi;
+#endif
+	/* TBD read and check for correct product version here */
 
-		/* Get the optional framebuffer memory resource */
+	/* Get the optional framebuffer memory resource */
 	ret = of_reserved_mem_device_init(drm->dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
 	spin_lock_init(&dev_p->irq_lock);
+
 	ret = kmb_setup_crtc(drm);
 	if (ret < 0) {
 		DRM_ERROR("failed to create crtc\n");
 		goto setup_fail;
 	}
 
+	/* Initialize MIPI DSI */
 	ret = kmb_dsi_init(drm, adv_bridge);
 	if (ret == -EPROBE_DEFER) {
 		DRM_INFO("%s: wait for external bridge driver DT", __func__);
@@ -155,26 +211,23 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 		DRM_ERROR("failed to initialize DSI\n");
 		goto setup_fail;
 	}
-	/* enable display clocks*/
-	clk_lcd = clk_get(&pdev->dev, "clk_lcd");
-	if (!clk_lcd) {
-		DRM_ERROR("clk_get() failed clk_lcd\n");
-		goto setup_fail;
-	}
+
 	DRM_INFO("%s : %d\n", __func__, __LINE__);
-	clk_mipi = clk_get(&pdev->dev, "clk_mipi");
-	if (!clk_mipi) {
-		DRM_ERROR("clk_get() failed clk_mipi\n");
-		goto setup_fail;
+#ifdef WIP
+	ret = drm_irq_install(drm, platform_get_irq(pdev, 0));
+	if (ret < 0) {
+		DRM_ERROR("failed to install IRQ handler\n");
+		goto irq_fail;
 	}
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
-	ret = kmb_display_clk_enable();
-
-	DRM_INFO("%s : %d clk enabling ret=%d\n", __func__, __LINE__, ret);
+#endif
 	return 0;
 
+#ifdef WIP
+irq_fail:
 	drm_crtc_cleanup(&dev_p->crtc);
+#endif
 setup_fail:
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	of_reserved_mem_device_release(drm->dev);
 
 	return ret;
@@ -285,12 +338,73 @@ static struct drm_driver kmb_driver = {
 	.minor = 0,
 };
 
-static int kmb_drm_bind(struct device *dev)
+static void kmb_drm_unload(struct device *dev)
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+	struct kmb_drm_private *dev_p = to_kmb(drm);
+
+	dump_stack();
+	drm_dev_unregister(drm);
+	drm_kms_helper_poll_fini(drm);
+	of_node_put(dev_p->crtc.port);
+	dev_p->crtc.port = NULL;
+	pm_runtime_get_sync(drm->dev);
+	drm_irq_uninstall(drm);
+	pm_runtime_put_sync(drm->dev);
+	pm_runtime_disable(drm->dev);
+
+	if (dev_p->lcd_mmio) {
+		iounmap(dev_p->lcd_mmio);
+		release_mem_region(LCD_BASE_ADDR, LCD_MMIO_SIZE);
+	}
+
+	if (dev_p->mipi_mmio) {
+		iounmap(dev_p->mipi_mmio);
+		release_mem_region(MIPI_BASE_ADDR, MIPI_MMIO_SIZE);
+	}
+
+	if (dev_p->msscam_mmio)
+		iounmap(dev_p->msscam_mmio);
+
+	of_reserved_mem_device_release(drm->dev);
+	drm_mode_config_cleanup(drm);
+
+	/*release clks */
+	kmb_display_clk_disable();
+	clk_put(clk_lcd);
+	clk_put(clk_mipi);
+
+	drm_dev_put(drm);
+	drm->dev_private = NULL;
+	dev_set_drvdata(dev, NULL);
+
+	/* Unregister DSI host */
+	mipi_dsi_host_unregister(dsi_host);
+}
+
+static int kmb_probe(struct platform_device *pdev)
 {
+	struct device *dev = get_device(&pdev->dev);
 	struct drm_device *drm = NULL;
 	struct kmb_drm_private *lcd;
-	int ret;
+	int ret = 0;
+
+	/* The bridge (ADV 7535) will return -EPROBE_DEFER until it
+	 * has a mipi_dsi_host to register its device to. So, we
+	 * first register the DSI host during probe time, and then return
+	 * -EPROBE_DEFER until the bridge is loaded. Probe will be called again
+	 *  and then the rest of the driver initialization can procees
+	 *  afterwards and the bridge can be successfully attached.
+	 */
+	adv_bridge =  kmb_dsi_host_bridge_init(dev);
+	if (adv_bridge == ERR_PTR(-EPROBE_DEFER))
+		return -EPROBE_DEFER;
+	else if (IS_ERR(adv_bridge)) {
+		DRM_ERROR("probe failed to initialize DSI host bridge\n");
+		return PTR_ERR(adv_bridge);
+	}
 
+	/* Create DRM device */
 	lcd = kzalloc(sizeof(*lcd), GFP_KERNEL);
 	if (!lcd)
 		return -ENOMEM;
@@ -308,40 +422,34 @@ static int kmb_drm_bind(struct device *dev)
 	kmb_setup_mode_config(drm);
 	dev_set_drvdata(dev, drm);
 
-	/* load the driver */
+	/* Load driver */
 	ret = kmb_load(drm, 0);
-	DRM_INFO("%s : %d ret = %d\n", __func__, __LINE__, ret);
 	if (ret == -EPROBE_DEFER) {
-		DRM_INFO("kmb_bind: wait for external bridge driver DT\n");
+		DRM_INFO("wait for external bridge driver DT\n");
 		return -EPROBE_DEFER;
 	} else if (ret)
 		goto err_free;
 
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	/* Set the CRTC's port so that the encoder component can find it */
 	lcd->crtc.port = of_graph_get_port_by_id(dev->of_node, 0);
-	DRM_INFO("crtc port = %pOF\n", lcd->crtc.port);
+
 	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
 	if (ret < 0) {
-		DRM_ERROR("failed to initialise vblank\n");
+		DRM_ERROR("failed to initialize vblank\n");
 		goto err_vblank;
 	}
 
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	drm_mode_config_reset(drm);
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	drm_kms_helper_poll_init(drm);
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
 
+	/* Register graphics device with the kernel */
 	ret = drm_dev_register(drm, 0);
-	DRM_INFO("%s : %d ret = %d\n", __func__, __LINE__, ret);
 
 	lcd->n_layers = KMB_MAX_PLANES;
 	if (ret)
 		goto err_register;
 
 	drm_fbdev_generic_setup(drm, 32);
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
 
 	return 0;
 
@@ -349,86 +457,18 @@ static int kmb_drm_bind(struct device *dev)
 	drm_kms_helper_poll_fini(drm);
 err_vblank:
 	pm_runtime_disable(drm->dev);
-	of_node_put(lcd->crtc.port);
-	lcd->crtc.port = NULL;
-	drm_irq_uninstall(drm);
-	of_reserved_mem_device_release(drm->dev);
 err_free:
 	drm_mode_config_cleanup(drm);
 	dev_set_drvdata(dev, NULL);
 	drm_dev_put(drm);
+	mipi_dsi_host_unregister(dsi_host);
 
 	return ret;
 }
 
-static void kmb_drm_unbind(struct device *dev)
-{
-	struct drm_device *drm = dev_get_drvdata(dev);
-	struct kmb_drm_private *dev_p = to_kmb(drm);
-
-	dump_stack();
-	drm_dev_unregister(drm);
-	drm_kms_helper_poll_fini(drm);
-	of_node_put(dev_p->crtc.port);
-	dev_p->crtc.port = NULL;
-	pm_runtime_get_sync(drm->dev);
-	drm_irq_uninstall(drm);
-	pm_runtime_put_sync(drm->dev);
-	pm_runtime_disable(drm->dev);
-
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
-	if (dev_p->lcd_mmio) {
-		DRM_INFO("%s : %d\n", __func__, __LINE__);
-		iounmap(dev_p->lcd_mmio);
-		release_mem_region(LCD_BASE_ADDR, LCD_MMIO_SIZE);
-	}
-
-	if (dev_p->mipi_mmio) {
-		DRM_INFO("%s : %d\n", __func__, __LINE__);
-		iounmap(dev_p->mipi_mmio);
-		release_mem_region(MIPI_BASE_ADDR, MIPI_MMIO_SIZE);
-	}
-
-	if (dev_p->msscam_mmio)
-		iounmap(dev_p->msscam_mmio);
-
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
-	of_reserved_mem_device_release(drm->dev);
-	drm_mode_config_cleanup(drm);
-
-	/*release clks */
-	kmb_display_clk_disable();
-	clk_put(clk_lcd);
-	clk_put(clk_mipi);
-
-	drm_dev_put(drm);
-	drm->dev_private = NULL;
-	dev_set_drvdata(dev, NULL);
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
-}
-
-static int kmb_probe(struct platform_device *pdev)
-{
-	struct device *device = get_device(&pdev->dev);
-
-	/* there is only one output port inside each device, find it */
-	DRM_DEBUG("%s : ENTER", __func__);
-
-	adv_bridge =  kmb_dsi_host_bridge_init(device);
-	if (adv_bridge == ERR_PTR(-EPROBE_DEFER))
-		return -EPROBE_DEFER;
-	else if (adv_bridge < 0) {
-		DRM_ERROR(" PROBE failed\n");
-		return -EINVAL;
-	}
-
-	return kmb_drm_bind(&pdev->dev);
-}
-
 static int kmb_remove(struct platform_device *pdev)
 {
-//	component_master_del(&pdev->dev, &kmb_master_ops);
-	kmb_drm_unbind(&pdev->dev);
+	kmb_drm_unload(&pdev->dev);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
index 1150505..54780ec 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -11,6 +11,7 @@
 #define KMB_MAX_WIDTH			16384	/*max width in pixels */
 #define KMB_MAX_HEIGHT			16384	/*max height in pixels */
 
+extern struct mipi_dsi_host *dsi_host;
 struct kmb_drm_private {
 	struct drm_device		drm;
 	void __iomem			*lcd_mmio;
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 6e4b8da..70bb231 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -59,7 +59,7 @@
 #define PLL_M_MAX	623
 #define PLL_FVCO_MAX	1250
 
-static struct mipi_dsi_host *dsi_host;
+struct mipi_dsi_host *dsi_host;
 static struct mipi_dsi_device *dsi_device;
 
 /*
@@ -294,10 +294,10 @@ static struct kmb_dsi_host *kmb_dsi_host_init(struct drm_device *drm,
 
 struct drm_bridge *kmb_dsi_host_bridge_init(struct device *dev)
 {
-	int ret;
 	struct device_node *encoder_node;
 	struct drm_bridge *bridge;
 
+	/* Create and register MIPI DSI host */
 	if (!dsi_host) {
 		dsi_host = kzalloc(sizeof(*dsi_host), GFP_KERNEL);
 		if (!dsi_host)
@@ -305,31 +305,27 @@ struct drm_bridge *kmb_dsi_host_bridge_init(struct device *dev)
 
 		dsi_host->ops = &kmb_dsi_host_ops;
 
-		if (!dsi_device)
-			dsi_device = kzalloc(sizeof(*dsi_device), GFP_KERNEL);
 		if (!dsi_device) {
-			kfree(dsi_host);
-			return ERR_PTR(-ENOMEM);
+			dsi_device = kzalloc(sizeof(*dsi_device), GFP_KERNEL);
+			if (!dsi_device) {
+				kfree(dsi_host);
+				return ERR_PTR(-ENOMEM);
+			}
 		}
 
 		dsi_host->dev = dev;
-		ret = mipi_dsi_host_register(dsi_host);
-		if (ret < 0) {
-			DRM_ERROR("failed to register DSI host: %d\n", ret);
-			kfree(dsi_host);
-			kfree(dsi_device);
-			return ERR_PTR(ret);
-		}
+		mipi_dsi_host_register(dsi_host);
 	}
 
 	/* find ADV7535 node and initialize it */
-	DRM_DEBUG("trying to get bridge info %pOF\n", dev->of_node);
+	DRM_INFO("trying to get bridge info %pOF\n", dev->of_node);
 	encoder_node = of_parse_phandle(dev->of_node, "encoder-slave", 0);
-	DRM_DEBUG("encoder node =  %pOF\n", encoder_node);
+	DRM_INFO("encoder node =  %pOF\n", encoder_node);
 	if (!encoder_node) {
 		DRM_ERROR("failed to get bridge info from DT\n");
-		ret = -EINVAL;
+		return ERR_PTR(-EINVAL);
 	}
+
 	/* Locate drm bridge from the hdmi encoder DT node */
 	bridge = of_drm_find_bridge(encoder_node);
 	of_node_put(encoder_node);
@@ -337,6 +333,7 @@ struct drm_bridge *kmb_dsi_host_bridge_init(struct device *dev)
 		DRM_INFO("wait for external bridge driver DT\n");
 		return ERR_PTR(-EPROBE_DEFER);
 	}
+
 	return bridge;
 }
 
@@ -467,9 +464,9 @@ static u32 mipi_tx_fg_section_cfg_regs(struct kmb_drm_private *dev_p,
 	u32 ctrl_no = MIPI_CTRL6;
 	u32 reg_adr;
 
-	/*frame section packet header */
-	/*word count */
-	cfg = (ph_cfg->wc & MIPI_TX_SECT_WC_MASK) << 0;	/* bits [15:0] */
+	/*frame section packet header*/
+	/*word count*/
+	cfg = (ph_cfg->wc & MIPI_TX_SECT_WC_MASK) << 0; /* bits [15:0]*/
 	/*data type */
 	cfg |= ((ph_cfg->data_type & MIPI_TX_SECT_DT_MASK)
 		<< MIPI_TX_SECT_DT_SHIFT);	/* bits [21:16] */
@@ -482,7 +479,6 @@ static u32 mipi_tx_fg_section_cfg_regs(struct kmb_drm_private *dev_p,
 	cfg |= MIPI_TX_SECT_DMA_PACKED;
 	kmb_write_mipi(dev_p, (MIPI_TXm_HS_FGn_SECTo_PH(ctrl_no, frame_id,
 					section)), cfg);
-
 	/*unpacked bytes */
 	/*there are 4 frame generators and each fg has 4 sections
 	 *there are 2 registers for unpacked bytes -
@@ -493,7 +489,7 @@ static u32 mipi_tx_fg_section_cfg_regs(struct kmb_drm_private *dev_p,
 	reg_adr = MIPI_TXm_HS_FGn_SECT_UNPACKED_BYTES0(ctrl_no, frame_id)
 	+ (section/2)*4;
 	kmb_write_bits_mipi(dev_p, reg_adr, (section % 2)*16, 16,
-		unpacked_bytes);
+			unpacked_bytes);
 
 	/* line config */
 	reg_adr = MIPI_TXm_HS_FGn_SECTo_LINE_CFG(ctrl_no, frame_id, section);
@@ -511,10 +507,9 @@ static u32 mipi_tx_fg_section_cfg(struct kmb_drm_private *dev_p, u8 frame_id,
 	struct mipi_data_type_params data_type_parameters;
 	struct mipi_tx_frame_sect_phcfg ph_cfg;
 
-	ret =
-	    mipi_get_datatype_params(frame_scfg->data_type,
-				     frame_scfg->data_mode,
-				     &data_type_parameters);
+	ret = mipi_get_datatype_params(frame_scfg->data_type,
+			frame_scfg->data_mode,
+			&data_type_parameters);
 	if (ret)
 		return ret;
 	/*
@@ -522,7 +517,7 @@ static u32 mipi_tx_fg_section_cfg(struct kmb_drm_private *dev_p, u8 frame_id,
 	 * (in pixels) set for each data type
 	 */
 	if (frame_scfg->width_pixels %
-	    data_type_parameters.size_constraint_pixels != 0)
+		data_type_parameters.size_constraint_pixels != 0)
 		return -EINVAL;
 
 	*wc = compute_wc(frame_scfg->width_pixels,
@@ -538,8 +533,8 @@ static u32 mipi_tx_fg_section_cfg(struct kmb_drm_private *dev_p, u8 frame_id,
 	ph_cfg.vchannel = frame_id;
 
 	mipi_tx_fg_section_cfg_regs(dev_p, frame_id, section,
-			frame_scfg->height_lines,
-			unpacked_bytes, &ph_cfg);
+		frame_scfg->height_lines,
+		unpacked_bytes, &ph_cfg);
 
 	/*caller needs bits_per_clk for additional caluclations */
 	*bits_per_pclk = data_type_parameters.bits_per_pclk;
@@ -700,7 +695,6 @@ static void mipi_tx_ctrl_cfg(struct kmb_drm_private *dev_p, u8 fg_id,
 	u32 sync_cfg = 0, ctrl = 0, fg_en;
 	u32 ctrl_no = MIPI_CTRL6;
 
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	/*MIPI_TX_HS_SYNC_CFG*/
 	if (ctrl_cfg->tx_ctrl_cfg.line_sync_pkt_en)
 		sync_cfg |= LINE_SYNC_PKT_ENABLE;
@@ -712,7 +706,6 @@ static void mipi_tx_ctrl_cfg(struct kmb_drm_private *dev_p, u8 fg_id,
 		sync_cfg |= DSI_V_BLANKING;
 	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->hsa_blanking)
 		sync_cfg |= DSI_HSA_BLANKING;
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->hbp_blanking)
 		sync_cfg |= DSI_HBP_BLANKING;
 	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->hfp_blanking)
@@ -724,7 +717,6 @@ static void mipi_tx_ctrl_cfg(struct kmb_drm_private *dev_p, u8 fg_id,
 	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->lpm_last_vfp_line)
 		sync_cfg |= DSI_LPM_LAST_VFP_LINE;
 	/* enable frame generator */
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	fg_en = 1 << fg_id;
 	sync_cfg |= FRAME_GEN_EN(fg_en);
 	if (ctrl_cfg->tx_ctrl_cfg.tx_always_use_hact)
@@ -743,9 +735,7 @@ static void mipi_tx_ctrl_cfg(struct kmb_drm_private *dev_p, u8 fg_id,
 	/*67 ns stop time */
 	ctrl |= HSEXIT_CNT(0x43);
 
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	kmb_write_mipi(dev_p, MIPI_TXm_HS_SYNC_CFG(ctrl_no), sync_cfg);
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	kmb_write_mipi(dev_p, MIPI_TXm_HS_CTRL(ctrl_no), ctrl);
 }
 
@@ -766,18 +756,20 @@ static u32 mipi_tx_init_cntrl(struct kmb_drm_private *dev_p,
 	 * set mipitxcctrlcfg
 	 */
 
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	for (frame_id = 0; frame_id < 4; frame_id++) {
 		/* find valid frame, assume only one valid frame */
 		if (ctrl_cfg->tx_ctrl_cfg.frames[frame_id] == NULL)
 			continue;
 
+		DRM_INFO("%s : %d\n", __func__, __LINE__);
 		/* Frame Section configuration */
 		/*TODO - assume there is only one valid section in a frame, so
 		 * bits_per_pclk and word_count are only set once
 		 */
 		for (sect = 0; sect < MIPI_CTRL_VIRTUAL_CHANNELS; sect++) {
 			if (ctrl_cfg->tx_ctrl_cfg.frames[frame_id]->sections[sect]
-			    == NULL)
+				== NULL)
 				continue;
 
 			ret = mipi_tx_fg_section_cfg(dev_p, frame_id, sect,
@@ -790,9 +782,9 @@ static u32 mipi_tx_init_cntrl(struct kmb_drm_private *dev_p,
 
 		/* set frame specific parameters */
 		mipi_tx_fg_cfg(dev_p, frame_id, ctrl_cfg->active_lanes,
-				bits_per_pclk,
-				word_count, ctrl_cfg->lane_rate_mbps,
-				ctrl_cfg->tx_ctrl_cfg.frames[frame_id]);
+			bits_per_pclk,
+			word_count, ctrl_cfg->lane_rate_mbps,
+			ctrl_cfg->tx_ctrl_cfg.frames[frame_id]);
 
 		active_vchannels++;
 
@@ -1328,7 +1320,6 @@ void mipi_tx_handle_irqs(struct kmb_drm_private *dev_p)
 }
 
 int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge)
-//int kmb_dsi_init(struct drm_device *dev)
 {
 	struct kmb_dsi *kmb_dsi;
 	struct drm_encoder *encoder;
@@ -1338,7 +1329,6 @@ int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge)
 	struct kmb_drm_private *dev_p = dev->dev_private;
 	int ret = 0;
 
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	kmb_dsi = kzalloc(sizeof(*kmb_dsi), GFP_KERNEL);
 	if (!kmb_dsi) {
 		DRM_ERROR("failed to allocate kmb_dsi\n");
@@ -1352,12 +1342,9 @@ int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge)
 		return -ENOMEM;
 	}
 
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	kmb_dsi->attached_connector = kmb_connector;
 
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	host = kmb_dsi_host_init(dev, kmb_dsi);
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	if (!host) {
 		DRM_ERROR("Faile to allocate host\n");
 //		drm_encoder_cleanup(encoder);
@@ -1366,30 +1353,23 @@ int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge)
 		return -ENOMEM;
 	}
 
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	connector = &kmb_connector->base;
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	encoder = &kmb_dsi->base;
 	encoder->possible_crtcs = 1;
 	encoder->possible_clones = 0;
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	drm_encoder_init(dev, encoder, &kmb_dsi_funcs, DRM_MODE_ENCODER_DSI,
 			"MIPI-DSI");
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
 
 	drm_connector_init(dev, connector, &kmb_dsi_connector_funcs,
 						   DRM_MODE_CONNECTOR_DSI);
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	drm_connector_helper_add(connector, &kmb_dsi_connector_helper_funcs);
 
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
-//	connector->encoder = encoder;
 	DRM_INFO("%s : %d connector = %s encoder = %s\n", __func__,
 			__LINE__, connector->name, encoder->name);
 
 	ret = drm_connector_attach_encoder(connector, encoder);
+
 	/* Link drm_bridge to encoder */
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
 	if (ret) {
 		DRM_ERROR("failed to attach bridge to MIPI\n");
@@ -1397,18 +1377,15 @@ int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge)
 		return ret;
 	}
 
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
+	DRM_INFO("%s : %d Bridge attached : SUCCESS\n", __func__, __LINE__);
 	/* initialize mipi controller */
 	mipi_tx_init_cntrl(dev_p, &mipi_tx_init_cfg);
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
 
 	/*d-phy initialization */
 	mipi_tx_init_dphy(dev_p, &mipi_tx_init_cfg);
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
 
 	/* irq initialization */
 	mipi_tx_init_irqs(dev_p, &int_cfg, &mipi_tx_init_cfg.tx_ctrl_cfg);
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
 
 	return 0;
 }
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
