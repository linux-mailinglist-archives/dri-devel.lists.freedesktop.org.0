Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD84321FF49
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 23:00:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B016E9E3;
	Tue, 14 Jul 2020 20:59:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671796E876;
 Tue, 14 Jul 2020 20:58:34 +0000 (UTC)
IronPort-SDR: LtEk/a0qccqyYSbgpHxdaNOd7rovSYEk1Sl04/B8A1qk7xm046Nsc/enGblqc6w/YT3JMONbEn
 cEkJVyzr1MOw==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444580"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444580"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:34 -0700
IronPort-SDR: A1D8Ro6IKx7UWwtPrWIjZTRMJwZIzdRJUGfnEkRO7QlsH4UtSKuH1k6gq+BZP2pzaEjdVQRjb+
 p1QyVDwtzfxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504185"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:33 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 30/59] drm/kmb: call bridge init in the very beginning
Date: Tue, 14 Jul 2020 13:57:16 -0700
Message-Id: <1594760265-11618-31-git-send-email-anitha.chrisanthus@intel.com>
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

of probe and return probe_defer early on, so that all the other
initializations can be done after adv driver is loaded successfully.

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c |  74 +++++++++++++---------
 drivers/gpu/drm/kmb/kmb_dsi.c | 144 ++++++++++++++++++++++++++----------------
 drivers/gpu/drm/kmb/kmb_dsi.h |   6 +-
 3 files changed, 138 insertions(+), 86 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 36edfbf..76f3c43 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -37,11 +37,24 @@ static struct clk *clk_lcd;
 static struct clk *clk_mipi;
 
 static int probe_deferred;
+struct drm_bridge *adv_bridge;
 
 static int kmb_display_clk_enable(void)
 {
-	clk_prepare_enable(clk_lcd);
-	clk_prepare_enable(clk_mipi);
+	int ret;
+
+	ret = clk_prepare_enable(clk_lcd);
+	if (ret) {
+		DRM_ERROR("Failed to enable LCD clock: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(clk_mipi);
+	if (ret) {
+		DRM_ERROR("Failed to enable MIPI clock: %d\n", ret);
+		return ret;
+	}
+	DRM_INFO("SUCCESS : enabled LCD MIPI clocks\n");
 	return 0;
 }
 
@@ -86,8 +99,7 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 	 *}
 	 */
 	/* LCD mmio */
-	if (!probe_deferred) {
-		probe_deferred = 1;
+	probe_deferred = 1;
 
 	if (!request_mem_region(LCD_BASE_ADDR, LCD_MMIO_SIZE, "kmb-lcd")) {
 		DRM_ERROR("failed to reserve LCD registers\n");
@@ -120,9 +132,10 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 	 * lists LCD at 79 and 82 for MIPI under MSS CPU -
 	 * firmware has to redirect it to A53
 	 */
-/*TBD read and check for correct product version here */
 
-	/* Get the optional framebuffer memory resource */
+		/*TBD read and check for correct product version here */
+
+		/* Get the optional framebuffer memory resource */
 	ret = of_reserved_mem_device_init(drm->dev);
 	if (ret && ret != -ENODEV)
 		return ret;
@@ -134,8 +147,7 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 		goto setup_fail;
 	}
 
-/*	ret = kmb_dsi_init(drm, bridge);*/
-	ret = kmb_dsi_init(drm);
+	ret = kmb_dsi_init(drm, adv_bridge);
 	if (ret == -EPROBE_DEFER) {
 		DRM_INFO("%s: wait for external bridge driver DT", __func__);
 		return -EPROBE_DEFER;
@@ -143,7 +155,6 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 		DRM_ERROR("failed to initialize DSI\n");
 		goto setup_fail;
 	}
-}
 	/* enable display clocks*/
 	clk_lcd = clk_get(&pdev->dev, "clk_lcd");
 	if (!clk_lcd) {
@@ -157,10 +168,9 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 		goto setup_fail;
 	}
 	DRM_INFO("%s : %d\n", __func__, __LINE__);
-	kmb_display_clk_enable();
-
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
+	ret = kmb_display_clk_enable();
 
+	DRM_INFO("%s : %d clk enabling ret=%d\n", __func__, __LINE__, ret);
 	return 0;
 
 	drm_crtc_cleanup(&dev_p->crtc);
@@ -268,7 +278,7 @@ static struct drm_driver kmb_driver = {
 	.gem_prime_vunmap = drm_gem_cma_prime_vunmap,
 	.gem_prime_mmap = drm_gem_cma_prime_mmap,
 	.fops = &fops,
-	.name = "kmb",
+	.name = "kmb_display",
 	.desc = "KEEMBAY DISPLAY DRIVER ",
 	.date = "20190122",
 	.major = 1,
@@ -277,7 +287,7 @@ static struct drm_driver kmb_driver = {
 
 static int kmb_drm_bind(struct device *dev)
 {
-	struct drm_device *drm;
+	struct drm_device *drm = NULL;
 	struct kmb_drm_private *lcd;
 	int ret;
 
@@ -296,7 +306,9 @@ static int kmb_drm_bind(struct device *dev)
 	dev_set_drvdata(dev, drm);
 
 	kmb_setup_mode_config(drm);
-	DRM_DEBUG("kmb_bind : after kmb_setup_mode_config\n");
+	dev_set_drvdata(dev, drm);
+
+	/* load the driver */
 	ret = kmb_load(drm, 0);
 	DRM_INFO("%s : %d ret = %d\n", __func__, __LINE__, ret);
 	if (ret == -EPROBE_DEFER) {
@@ -337,7 +349,6 @@ static int kmb_drm_bind(struct device *dev)
 	drm_kms_helper_poll_fini(drm);
 err_vblank:
 	pm_runtime_disable(drm->dev);
-	component_unbind_all(dev, drm);
 	of_node_put(lcd->crtc.port);
 	lcd->crtc.port = NULL;
 	drm_irq_uninstall(drm);
@@ -355,9 +366,9 @@ static void kmb_drm_unbind(struct device *dev)
 	struct drm_device *drm = dev_get_drvdata(dev);
 	struct kmb_drm_private *dev_p = to_kmb(drm);
 
+	dump_stack();
 	drm_dev_unregister(drm);
 	drm_kms_helper_poll_fini(drm);
-	component_unbind_all(dev, drm);
 	of_node_put(dev_p->crtc.port);
 	dev_p->crtc.port = NULL;
 	pm_runtime_get_sync(drm->dev);
@@ -365,12 +376,15 @@ static void kmb_drm_unbind(struct device *dev)
 	pm_runtime_put_sync(drm->dev);
 	pm_runtime_disable(drm->dev);
 
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	if (dev_p->lcd_mmio) {
+		DRM_INFO("%s : %d\n", __func__, __LINE__);
 		iounmap(dev_p->lcd_mmio);
 		release_mem_region(LCD_BASE_ADDR, LCD_MMIO_SIZE);
 	}
 
 	if (dev_p->mipi_mmio) {
+		DRM_INFO("%s : %d\n", __func__, __LINE__);
 		iounmap(dev_p->mipi_mmio);
 		release_mem_region(MIPI_BASE_ADDR, MIPI_MMIO_SIZE);
 	}
@@ -378,6 +392,7 @@ static void kmb_drm_unbind(struct device *dev)
 	if (dev_p->msscam_mmio)
 		iounmap(dev_p->msscam_mmio);
 
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	of_reserved_mem_device_release(drm->dev);
 	drm_mode_config_cleanup(drm);
 
@@ -389,32 +404,31 @@ static void kmb_drm_unbind(struct device *dev)
 	drm_dev_put(drm);
 	drm->dev_private = NULL;
 	dev_set_drvdata(dev, NULL);
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 }
 
-static const struct component_master_ops kmb_master_ops = {
-	.bind = kmb_drm_bind,
-	.unbind = kmb_drm_unbind,
-};
-
 static int kmb_probe(struct platform_device *pdev)
 {
-	struct device_node *port;
-	int ret = 0;
+	struct device *device = get_device(&pdev->dev);
 
 	/* there is only one output port inside each device, find it */
 	DRM_DEBUG("%s : ENTER", __func__);
 
-	port = of_graph_get_remote_node(pdev->dev.of_node, 0, 0);
-	DRM_DEBUG("%s : port = 0x%pOF\n", __func__, port);
-	if (!port)
-		return -ENODEV;
-	DRM_DEBUG("%s : EXIT ret=%d\n", __func__, ret);
+	adv_bridge =  kmb_dsi_host_bridge_init(device);
+	if (adv_bridge == ERR_PTR(-EPROBE_DEFER))
+		return -EPROBE_DEFER;
+	else if (adv_bridge < 0) {
+		DRM_ERROR(" PROBE failed\n");
+		return -EINVAL;
+	}
+
 	return kmb_drm_bind(&pdev->dev);
 }
 
 static int kmb_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &kmb_master_ops);
+//	component_master_del(&pdev->dev, &kmb_master_ops);
+	kmb_drm_unbind(&pdev->dev);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 2bc63e2..6e4b8da 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -59,6 +59,9 @@
 #define PLL_M_MAX	623
 #define PLL_FVCO_MAX	1250
 
+static struct mipi_dsi_host *dsi_host;
+static struct mipi_dsi_device *dsi_device;
+
 /*
  * These are added here only temporarily for testing,
  * these will eventually go to the device tree sections,
@@ -273,33 +276,68 @@ static struct kmb_dsi_host *kmb_dsi_host_init(struct drm_device *drm,
 		struct kmb_dsi *kmb_dsi)
 {
 	struct kmb_dsi_host *host;
-	struct mipi_dsi_device *device;
-	int err;
 
 	host = kzalloc(sizeof(*host), GFP_KERNEL);
 	if (!host)
 		return NULL;
 
-	host->base.ops = &kmb_dsi_host_ops;
+	host->base = dsi_host;
+	host->base->ops = &kmb_dsi_host_ops;
 	host->kmb_dsi = kmb_dsi;
 
-	device = kzalloc(sizeof(*device), GFP_KERNEL);
-	if (!device) {
-		kfree(host);
-		return NULL;
-	}
+	host->base->dev = drm->dev;
+
+	dsi_device->host = host->base;
+	host->device = dsi_device;
+	return host;
+}
 
-	host->base.dev = drm->dev;
-	err = mipi_dsi_host_register(&host->base);
-	if (err < 0) {
-		DRM_ERROR("failed to register DSI host: %d\n", err);
-		kfree(host);
-		kfree(device);
+struct drm_bridge *kmb_dsi_host_bridge_init(struct device *dev)
+{
+	int ret;
+	struct device_node *encoder_node;
+	struct drm_bridge *bridge;
+
+	if (!dsi_host) {
+		dsi_host = kzalloc(sizeof(*dsi_host), GFP_KERNEL);
+		if (!dsi_host)
+			return ERR_PTR(-ENOMEM);
+
+		dsi_host->ops = &kmb_dsi_host_ops;
+
+		if (!dsi_device)
+			dsi_device = kzalloc(sizeof(*dsi_device), GFP_KERNEL);
+		if (!dsi_device) {
+			kfree(dsi_host);
+			return ERR_PTR(-ENOMEM);
+		}
+
+		dsi_host->dev = dev;
+		ret = mipi_dsi_host_register(dsi_host);
+		if (ret < 0) {
+			DRM_ERROR("failed to register DSI host: %d\n", ret);
+			kfree(dsi_host);
+			kfree(dsi_device);
+			return ERR_PTR(ret);
+		}
 	}
 
-	device->host = &host->base;
-	host->device = device;
-	return host;
+	/* find ADV7535 node and initialize it */
+	DRM_DEBUG("trying to get bridge info %pOF\n", dev->of_node);
+	encoder_node = of_parse_phandle(dev->of_node, "encoder-slave", 0);
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
+		return ERR_PTR(-EPROBE_DEFER);
+	}
+	return bridge;
 }
 
 u32 mipi_get_datatype_params(u32 data_type, u32 data_mode,
@@ -662,7 +700,8 @@ static void mipi_tx_ctrl_cfg(struct kmb_drm_private *dev_p, u8 fg_id,
 	u32 sync_cfg = 0, ctrl = 0, fg_en;
 	u32 ctrl_no = MIPI_CTRL6;
 
-	/*MIPI_TX_HS_SYNC_CFG */
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
+	/*MIPI_TX_HS_SYNC_CFG*/
 	if (ctrl_cfg->tx_ctrl_cfg.line_sync_pkt_en)
 		sync_cfg |= LINE_SYNC_PKT_ENABLE;
 	if (ctrl_cfg->tx_ctrl_cfg.frame_counter_active)
@@ -673,6 +712,7 @@ static void mipi_tx_ctrl_cfg(struct kmb_drm_private *dev_p, u8 fg_id,
 		sync_cfg |= DSI_V_BLANKING;
 	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->hsa_blanking)
 		sync_cfg |= DSI_HSA_BLANKING;
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->hbp_blanking)
 		sync_cfg |= DSI_HBP_BLANKING;
 	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->hfp_blanking)
@@ -684,6 +724,7 @@ static void mipi_tx_ctrl_cfg(struct kmb_drm_private *dev_p, u8 fg_id,
 	if (ctrl_cfg->tx_ctrl_cfg.tx_dsi_cfg->lpm_last_vfp_line)
 		sync_cfg |= DSI_LPM_LAST_VFP_LINE;
 	/* enable frame generator */
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	fg_en = 1 << fg_id;
 	sync_cfg |= FRAME_GEN_EN(fg_en);
 	if (ctrl_cfg->tx_ctrl_cfg.tx_always_use_hact)
@@ -702,7 +743,9 @@ static void mipi_tx_ctrl_cfg(struct kmb_drm_private *dev_p, u8 fg_id,
 	/*67 ns stop time */
 	ctrl |= HSEXIT_CNT(0x43);
 
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	kmb_write_mipi(dev_p, MIPI_TXm_HS_SYNC_CFG(ctrl_no), sync_cfg);
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	kmb_write_mipi(dev_p, MIPI_TXm_HS_CTRL(ctrl_no), ctrl);
 }
 
@@ -1284,8 +1327,8 @@ void mipi_tx_handle_irqs(struct kmb_drm_private *dev_p)
 
 }
 
-//int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge)
-int kmb_dsi_init(struct drm_device *dev)
+int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge)
+//int kmb_dsi_init(struct drm_device *dev)
 {
 	struct kmb_dsi *kmb_dsi;
 	struct drm_encoder *encoder;
@@ -1293,10 +1336,9 @@ int kmb_dsi_init(struct drm_device *dev)
 	struct drm_connector *connector;
 	struct kmb_dsi_host *host;
 	struct kmb_drm_private *dev_p = dev->dev_private;
-	struct device_node *encoder_node;
-	struct drm_bridge *bridge;
 	int ret = 0;
 
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	kmb_dsi = kzalloc(sizeof(*kmb_dsi), GFP_KERNEL);
 	if (!kmb_dsi) {
 		DRM_ERROR("failed to allocate kmb_dsi\n");
@@ -1310,52 +1352,44 @@ int kmb_dsi_init(struct drm_device *dev)
 		return -ENOMEM;
 	}
 
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	kmb_dsi->attached_connector = kmb_connector;
 
-	connector = &kmb_connector->base;
-	encoder = &kmb_dsi->base;
-	encoder->possible_crtcs = 1;
-	encoder->possible_clones = 0;
-	drm_encoder_init(dev, encoder, &kmb_dsi_funcs, DRM_MODE_ENCODER_DSI,
-			 "MIPI-DSI");
-
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	host = kmb_dsi_host_init(dev, kmb_dsi);
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	if (!host) {
-		drm_encoder_cleanup(encoder);
+		DRM_ERROR("Faile to allocate host\n");
+//		drm_encoder_cleanup(encoder);
 		kfree(kmb_dsi);
 		kfree(kmb_connector);
+		return -ENOMEM;
 	}
 
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
+	connector = &kmb_connector->base;
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
+	encoder = &kmb_dsi->base;
+	encoder->possible_crtcs = 1;
+	encoder->possible_clones = 0;
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
+	drm_encoder_init(dev, encoder, &kmb_dsi_funcs, DRM_MODE_ENCODER_DSI,
+			"MIPI-DSI");
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
+
 	drm_connector_init(dev, connector, &kmb_dsi_connector_funcs,
-			   DRM_MODE_CONNECTOR_DSI);
+						   DRM_MODE_CONNECTOR_DSI);
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	drm_connector_helper_add(connector, &kmb_dsi_connector_helper_funcs);
 
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 //	connector->encoder = encoder;
-	DRM_INFO("%s : %d connector = %s encoder = %s\n", __func__, __LINE__,
-			connector->name, encoder->name);
-	DRM_INFO("%s : %d connector->encoder = 0x%p\n", __func__, __LINE__,
-			connector->encoder);
+	DRM_INFO("%s : %d connector = %s encoder = %s\n", __func__,
+			__LINE__, connector->name, encoder->name);
 
 	ret = drm_connector_attach_encoder(connector, encoder);
-	DRM_INFO("%s : %d ret = %d\n", __func__, __LINE__, ret);
-
-	/* find ADV7535 node and initialize it */
-	DRM_DEBUG("trying to get bridge info %pOF\n", dev->dev->of_node);
-	encoder_node = of_parse_phandle(dev->dev->of_node, "encoder-slave", 0);
-	DRM_DEBUG("encoder node =  %pOF\n", encoder_node);
-	if (!encoder_node) {
-		DRM_ERROR("failed to get bridge info from DT\n");
-		ret = -EINVAL;
-	}
-	/* Locate drm bridge from the hdmi encoder DT node */
-	bridge = of_drm_find_bridge(encoder_node);
-	of_node_put(encoder_node);
-	if (!bridge) {
-		DRM_INFO("wait for external bridge driver DT\n");
-		return -EPROBE_DEFER;
-	}
-
 	/* Link drm_bridge to encoder */
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
 	if (ret) {
 		DRM_ERROR("failed to attach bridge to MIPI\n");
@@ -1363,14 +1397,18 @@ int kmb_dsi_init(struct drm_device *dev)
 		return ret;
 	}
 
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	/* initialize mipi controller */
 	mipi_tx_init_cntrl(dev_p, &mipi_tx_init_cfg);
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 
 	/*d-phy initialization */
 	mipi_tx_init_dphy(dev_p, &mipi_tx_init_cfg);
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 
 	/* irq initialization */
 	mipi_tx_init_irqs(dev_p, &int_cfg, &mipi_tx_init_cfg.tx_ctrl_cfg);
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.h b/drivers/gpu/drm/kmb/kmb_dsi.h
index 5fc1547..e9bcc7e 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.h
+++ b/drivers/gpu/drm/kmb/kmb_dsi.h
@@ -22,7 +22,7 @@ struct kmb_dsi {
 };
 
 struct kmb_dsi_host {
-	struct mipi_dsi_host base;
+	struct mipi_dsi_host *base;
 	struct kmb_dsi *kmb_dsi;
 	struct mipi_dsi_device *device;
 };
@@ -309,8 +309,8 @@ union mipi_irq_cfg {
 	} irq_cfg;
 };
 
-//int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge);
-int kmb_dsi_init(struct drm_device *dev);
+struct drm_bridge *kmb_dsi_host_bridge_init(struct device *dev);
+int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge);
 void kmb_plane_destroy(struct drm_plane *plane);
 void mipi_tx_handle_irqs(struct kmb_drm_private *dev_p);
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
