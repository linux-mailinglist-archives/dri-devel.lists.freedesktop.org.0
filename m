Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5269421FF77
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 23:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A405E6EA10;
	Tue, 14 Jul 2020 20:59:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6B66E876;
 Tue, 14 Jul 2020 20:58:33 +0000 (UTC)
IronPort-SDR: QF8I8iod0CHuQzkeQ4mwGEoaHHr/G6GeFrmRIWszYd34yZg2IgOvkQ2g8M4NNcUzsAXqgTDi1+
 39AV83etc89Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444579"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444579"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:33 -0700
IronPort-SDR: 9NSMnEUjIkXHj6/oAQzBzBKfT/5Fa485TC3k3M5ARrqhkq1UvE6uNNerOlOQTWvCR3V0Oo3C8S
 OTviXMo5uPow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504181"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:33 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 29/59] drm/kmb: Defer Probe
Date: Tue, 14 Jul 2020 13:57:15 -0700
Message-Id: <1594760265-11618-30-git-send-email-anitha.chrisanthus@intel.com>
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

Register DSI host first and then defer probe until ADV bridge is
initialized.

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c | 144 ++++++++++++++----------------------------
 drivers/gpu/drm/kmb/kmb_dsi.c |  46 ++++++++++++--
 drivers/gpu/drm/kmb/kmb_dsi.h |   3 +-
 3 files changed, 89 insertions(+), 104 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index d13552a..36edfbf 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -36,6 +36,8 @@ static irqreturn_t kmb_isr(int irq, void *arg);
 static struct clk *clk_lcd;
 static struct clk *clk_mipi;
 
+static int probe_deferred;
+
 static int kmb_display_clk_enable(void)
 {
 	clk_prepare_enable(clk_lcd);
@@ -56,12 +58,11 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 {
 	struct kmb_drm_private *dev_p = to_kmb(drm);
 	struct platform_device *pdev = to_platform_device(drm->dev);
-	struct drm_bridge *bridge;
+/*	struct drm_bridge *bridge;*/
 	/*struct resource *res;*/
 	/*u32 version;*/
-	int irq_lcd, irq_mipi;
 	int ret;
-	struct device_node *encoder_node;
+/*	struct device_node *encoder_node;*/
 
 	/* TBD - not sure if clock_get needs to be called here */
 	/*
@@ -73,9 +74,10 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 	 * TBD call this in the future when device tree is ready,
 	 * use hardcoded value for now
 	 */
-	/*res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	 *dev_p->lcd_mmio = devm_ioremap_resource(drm->dev, res);
-	 *
+	/*
+	 * res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	 * dev_p->lcd_mmio = devm_ioremap_resource(drm->dev, res);
+
 	 *if (IS_ERR(dev_p->lcd_mmio)) {
 	 *	DRM_ERROR("failed to map control registers area\n");
 	 *	ret = PTR_ERR(dev_p->lcd_mmio);
@@ -83,7 +85,10 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 	 *	return ret;
 	 *}
 	 */
-	 /* LCD mmio */
+	/* LCD mmio */
+	if (!probe_deferred) {
+		probe_deferred = 1;
+
 	if (!request_mem_region(LCD_BASE_ADDR, LCD_MMIO_SIZE, "kmb-lcd")) {
 		DRM_ERROR("failed to reserve LCD registers\n");
 		return -ENOMEM;
@@ -93,7 +98,6 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 		DRM_ERROR("failed to map LCD registers\n");
 		return -ENOMEM;
 	}
-
 	/* Mipi mmio */
 	if (!request_mem_region(MIPI_BASE_ADDR, MIPI_MMIO_SIZE, "kmb-mipi")) {
 		DRM_ERROR("failed to reserve MIPI registers\n");
@@ -106,35 +110,16 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 		iounmap(dev_p->lcd_mmio);
 		return -ENOMEM;
 	}
-
 	/*this is only for MIPI_TX_MSS_LCD_MIPI_CFG register */
-	dev_p->msscam_mmio = ioremap_cache(MSS_CAM_BASE_ADDR,
+	if (!dev_p->msscam_mmio) {
+		dev_p->msscam_mmio = ioremap_cache(MSS_CAM_BASE_ADDR,
 			MSS_CAM_MMIO_SIZE);
+	}
 
 	/* register irqs here - section 17.3 in databook
 	 * lists LCD at 79 and 82 for MIPI under MSS CPU -
 	 * firmware has to redirect it to A53
 	 */
-	irq_lcd = platform_get_irq_byname(pdev, "irq_lcd");
-	if (irq_lcd < 0) {
-		DRM_ERROR("irq_lcd not found");
-		return irq_lcd;
-	}
-	pr_info("irq_lcd platform_get_irq = %d\n", irq_lcd);
-	ret = request_irq(irq_lcd, kmb_isr, IRQF_SHARED, "irq_lcd", dev_p);
-	dev_p->irq_lcd = irq_lcd;
-
-	irq_mipi = platform_get_irq_byname(pdev, "irq_mipi");
-	if (irq_mipi < 0) {
-		DRM_ERROR("irq_mipi not found");
-		return irq_mipi;
-	}
-	pr_info("irq_mipi platform_get_irq = %d\n", irq_mipi);
-	ret = request_irq(irq_mipi, kmb_isr, IRQF_SHARED, "irq_mipi", dev_p);
-	dev_p->irq_mipi = irq_mipi;
-
-
-
 /*TBD read and check for correct product version here */
 
 	/* Get the optional framebuffer memory resource */
@@ -149,52 +134,35 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 		goto setup_fail;
 	}
 
-	/* find ADV7535 node and initialize it */
-	encoder_node = of_parse_phandle(drm->dev->of_node, "encoder-slave", 0);
-	if (!encoder_node) {
-		DRM_ERROR("failed to get bridge info from DT\n");
-		ret = -EPROBE_DEFER;
-		goto setup_fail;
-	}
-
-	/* Locate drm bridge from the hdmi encoder DT node */
-	bridge = of_drm_find_bridge(encoder_node);
-	if (!bridge) {
-		DRM_ERROR("failed to get bridge driver from DT\n");
-		ret = -EPROBE_DEFER;
-		goto setup_fail;
-	}
-
-	of_node_put(encoder_node);
-
-	ret = kmb_dsi_init(drm, bridge);
-	if (ret) {
+/*	ret = kmb_dsi_init(drm, bridge);*/
+	ret = kmb_dsi_init(drm);
+	if (ret == -EPROBE_DEFER) {
+		DRM_INFO("%s: wait for external bridge driver DT", __func__);
+		return -EPROBE_DEFER;
+	} else if (ret) {
 		DRM_ERROR("failed to initialize DSI\n");
 		goto setup_fail;
 	}
-
+}
 	/* enable display clocks*/
 	clk_lcd = clk_get(&pdev->dev, "clk_lcd");
 	if (!clk_lcd) {
 		DRM_ERROR("clk_get() failed clk_lcd\n");
 		goto setup_fail;
 	}
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	clk_mipi = clk_get(&pdev->dev, "clk_mipi");
 	if (!clk_mipi) {
 		DRM_ERROR("clk_get() failed clk_mipi\n");
 		goto setup_fail;
 	}
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	kmb_display_clk_enable();
 
-	ret = drm_irq_install(drm, platform_get_irq(pdev, 0));
-	if (ret < 0) {
-		DRM_ERROR("failed to install IRQ handler\n");
-		goto irq_fail;
-	}
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 
 	return 0;
 
-irq_fail:
 	drm_crtc_cleanup(&dev_p->crtc);
 setup_fail:
 	of_reserved_mem_device_release(drm->dev);
@@ -330,40 +298,38 @@ static int kmb_drm_bind(struct device *dev)
 	kmb_setup_mode_config(drm);
 	DRM_DEBUG("kmb_bind : after kmb_setup_mode_config\n");
 	ret = kmb_load(drm, 0);
-	if (ret)
+	DRM_INFO("%s : %d ret = %d\n", __func__, __LINE__, ret);
+	if (ret == -EPROBE_DEFER) {
+		DRM_INFO("kmb_bind: wait for external bridge driver DT\n");
+		return -EPROBE_DEFER;
+	} else if (ret)
 		goto err_free;
 
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	/* Set the CRTC's port so that the encoder component can find it */
 	lcd->crtc.port = of_graph_get_port_by_id(dev->of_node, 0);
-
-	ret = component_bind_all(dev, drm);
-	if (ret) {
-		DRM_ERROR("Failed to bind all components\n");
-		goto err_unload;
-	}
-
-	ret = pm_runtime_set_active(dev);
-	if (ret)
-		goto err_pm_active;
-
-	pm_runtime_enable(dev);
-
+	DRM_INFO("crtc port = %pOF\n", lcd->crtc.port);
 	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
 	if (ret < 0) {
 		DRM_ERROR("failed to initialise vblank\n");
 		goto err_vblank;
 	}
 
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	drm_mode_config_reset(drm);
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	drm_kms_helper_poll_init(drm);
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 
 	ret = drm_dev_register(drm, 0);
+	DRM_INFO("%s : %d ret = %d\n", __func__, __LINE__, ret);
 
 	lcd->n_layers = KMB_MAX_PLANES;
 	if (ret)
 		goto err_register;
 
 	drm_fbdev_generic_setup(drm, 32);
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 
 	return 0;
 
@@ -371,9 +337,7 @@ static int kmb_drm_bind(struct device *dev)
 	drm_kms_helper_poll_fini(drm);
 err_vblank:
 	pm_runtime_disable(drm->dev);
-err_pm_active:
 	component_unbind_all(dev, drm);
-err_unload:
 	of_node_put(lcd->crtc.port);
 	lcd->crtc.port = NULL;
 	drm_irq_uninstall(drm);
@@ -432,16 +396,10 @@ static const struct component_master_ops kmb_master_ops = {
 	.unbind = kmb_drm_unbind,
 };
 
-static int compare_dev(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
 static int kmb_probe(struct platform_device *pdev)
 {
 	struct device_node *port;
-	struct component_match *match = NULL;
-	int ret;
+	int ret = 0;
 
 	/* there is only one output port inside each device, find it */
 	DRM_DEBUG("%s : ENTER", __func__);
@@ -450,18 +408,8 @@ static int kmb_probe(struct platform_device *pdev)
 	DRM_DEBUG("%s : port = 0x%pOF\n", __func__, port);
 	if (!port)
 		return -ENODEV;
-
-	DRM_DEBUG("%s : after get_remote", __func__);
-	DRM_DEBUG("Adding component %pOF\n", port);
-	drm_of_component_match_add(&pdev->dev, &match, compare_dev, port);
-	DRM_DEBUG("%s : after get_match", __func__);
-	of_node_put(port);
-
-	 ret = component_master_add_with_match(&pdev->dev, &kmb_master_ops,
-					match);
-
 	DRM_DEBUG("%s : EXIT ret=%d\n", __func__, ret);
-	return ret;
+	return kmb_drm_bind(&pdev->dev);
 }
 
 static int kmb_remove(struct platform_device *pdev)
@@ -513,13 +461,13 @@ static int __maybe_unused kmb_pm_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(kmb_pm_ops, kmb_pm_suspend, kmb_pm_resume);
 
 static struct platform_driver kmb_platform_driver = {
-	.probe = kmb_probe,
-	.remove = kmb_remove,
-	.driver = {
-		   .name = "Keembay_Display",
-		   .pm = &kmb_pm_ops,
-		   .of_match_table = kmb_of_match,
-		   },
+	.probe		= kmb_probe,
+	.remove		= kmb_remove,
+	.driver	= {
+		.name = "kmb_display",
+		.pm = &kmb_pm_ops,
+		.of_match_table	= kmb_of_match,
+	},
 };
 
 module_platform_driver(kmb_platform_driver);
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 09d5805..2bc63e2 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -269,10 +269,12 @@ static const struct mipi_dsi_host_ops kmb_dsi_host_ops = {
 	.transfer = kmb_dsi_host_transfer,
 };
 
-static struct kmb_dsi_host *kmb_dsi_host_init(struct kmb_dsi *kmb_dsi)
+static struct kmb_dsi_host *kmb_dsi_host_init(struct drm_device *drm,
+		struct kmb_dsi *kmb_dsi)
 {
 	struct kmb_dsi_host *host;
 	struct mipi_dsi_device *device;
+	int err;
 
 	host = kzalloc(sizeof(*host), GFP_KERNEL);
 	if (!host)
@@ -286,6 +288,15 @@ static struct kmb_dsi_host *kmb_dsi_host_init(struct kmb_dsi *kmb_dsi)
 		kfree(host);
 		return NULL;
 	}
+
+	host->base.dev = drm->dev;
+	err = mipi_dsi_host_register(&host->base);
+	if (err < 0) {
+		DRM_ERROR("failed to register DSI host: %d\n", err);
+		kfree(host);
+		kfree(device);
+	}
+
 	device->host = &host->base;
 	host->device = device;
 	return host;
@@ -1273,7 +1284,8 @@ void mipi_tx_handle_irqs(struct kmb_drm_private *dev_p)
 
 }
 
-int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge)
+//int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge)
+int kmb_dsi_init(struct drm_device *dev)
 {
 	struct kmb_dsi *kmb_dsi;
 	struct drm_encoder *encoder;
@@ -1281,6 +1293,8 @@ int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge)
 	struct drm_connector *connector;
 	struct kmb_dsi_host *host;
 	struct kmb_drm_private *dev_p = dev->dev_private;
+	struct device_node *encoder_node;
+	struct drm_bridge *bridge;
 	int ret = 0;
 
 	kmb_dsi = kzalloc(sizeof(*kmb_dsi), GFP_KERNEL);
@@ -1305,7 +1319,7 @@ int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge)
 	drm_encoder_init(dev, encoder, &kmb_dsi_funcs, DRM_MODE_ENCODER_DSI,
 			 "MIPI-DSI");
 
-	host = kmb_dsi_host_init(kmb_dsi);
+	host = kmb_dsi_host_init(dev, kmb_dsi);
 	if (!host) {
 		drm_encoder_cleanup(encoder);
 		kfree(kmb_dsi);
@@ -1316,8 +1330,30 @@ int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge)
 			   DRM_MODE_CONNECTOR_DSI);
 	drm_connector_helper_add(connector, &kmb_dsi_connector_helper_funcs);
 
-	connector->encoder = encoder;
-	drm_connector_attach_encoder(connector, encoder);
+//	connector->encoder = encoder;
+	DRM_INFO("%s : %d connector = %s encoder = %s\n", __func__, __LINE__,
+			connector->name, encoder->name);
+	DRM_INFO("%s : %d connector->encoder = 0x%p\n", __func__, __LINE__,
+			connector->encoder);
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	DRM_INFO("%s : %d ret = %d\n", __func__, __LINE__, ret);
+
+	/* find ADV7535 node and initialize it */
+	DRM_DEBUG("trying to get bridge info %pOF\n", dev->dev->of_node);
+	encoder_node = of_parse_phandle(dev->dev->of_node, "encoder-slave", 0);
+	DRM_DEBUG("encoder node =  %pOF\n", encoder_node);
+	if (!encoder_node) {
+		DRM_ERROR("failed to get bridge info from DT\n");
+		ret = -EINVAL;
+	}
+	/* Locate drm bridge from the hdmi encoder DT node */
+	bridge = of_drm_find_bridge(encoder_node);
+	of_node_put(encoder_node);
+	if (!bridge) {
+		DRM_INFO("wait for external bridge driver DT\n");
+		return -EPROBE_DEFER;
+	}
 
 	/* Link drm_bridge to encoder */
 	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.h b/drivers/gpu/drm/kmb/kmb_dsi.h
index 702ad58..5fc1547 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.h
+++ b/drivers/gpu/drm/kmb/kmb_dsi.h
@@ -309,7 +309,8 @@ union mipi_irq_cfg {
 	} irq_cfg;
 };
 
-int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge);
+//int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge);
+int kmb_dsi_init(struct drm_device *dev);
 void kmb_plane_destroy(struct drm_plane *plane);
 void mipi_tx_handle_irqs(struct kmb_drm_private *dev_p);
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
