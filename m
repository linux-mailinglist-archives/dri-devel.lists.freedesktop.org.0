Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E41721FF33
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 22:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3F36E9C3;
	Tue, 14 Jul 2020 20:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BCC6E9B6;
 Tue, 14 Jul 2020 20:58:31 +0000 (UTC)
IronPort-SDR: pUXuXgYKq6MSQiUYijXwlkbURLp1ALA9xiFXYeZDeF8ipmWRNTD71KZNemFcQOl1+w/XhAKqAF
 6iHe/JfuYZkw==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444572"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444572"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:30 -0700
IronPort-SDR: /KHdO8QMq9fqpSxiGMZKxkTO4tT3iD6s9gD90xsgdIVSWGGsqRaq9QlKnaisjdLabgSICFP6t7
 AsrSqdLvpWJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504159"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:30 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 24/59] drm/kmb: Add ADV7535 bridge
Date: Tue, 14 Jul 2020 13:57:10 -0700
Message-Id: <1594760265-11618-25-git-send-email-anitha.chrisanthus@intel.com>
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

Find ADV 7535 from the device tree and get the bridge driver and attach
it to the DRM and the MIPI encoder.

v2: check for valid encoder node

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c | 27 ++++++++++++++++++++++++++-
 drivers/gpu/drm/kmb/kmb_dsi.c | 26 +++++++++++++++++++++-----
 drivers/gpu/drm/kmb/kmb_dsi.h |  3 ++-
 3 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index f4553c2..5a2ff9d 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -36,10 +36,12 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 {
 	struct kmb_drm_private *dev_p = to_kmb(drm);
 	struct platform_device *pdev = to_platform_device(drm->dev);
+	struct drm_bridge *bridge;
 	/*struct resource *res;*/
 	/*u32 version;*/
 	int irq_lcd, irq_mipi;
 	int ret;
+	struct device_node *encoder_node;
 
 	/* TBD - not sure if clock_get needs to be called here */
 	/*
@@ -127,7 +129,30 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 		goto setup_fail;
 	}
 
-	kmb_dsi_init(drm);
+	/* find ADV7535 node and initialize it */
+	encoder_node = of_parse_phandle(drm->dev->of_node, "encoder-slave", 0);
+	if (!encoder_node) {
+		DRM_ERROR("failed to get bridge info from DT\n");
+		ret = -EPROBE_DEFER;
+		goto setup_fail;
+	}
+
+	/* Locate drm bridge from the hdmi encoder DT node */
+	bridge = of_drm_find_bridge(encoder_node);
+	if (!bridge) {
+		DRM_ERROR("failed to get bridge driver from DT\n");
+		ret = -EPROBE_DEFER;
+		goto setup_fail;
+	}
+
+	of_node_put(encoder_node);
+
+	ret = kmb_dsi_init(drm, bridge);
+	if (ret) {
+		DRM_ERROR("failed to initialize DSI\n");
+		goto setup_fail;
+	}
+
 	ret = drm_irq_install(drm, platform_get_irq(pdev, 0));
 	if (ret < 0) {
 		DRM_ERROR("failed to install IRQ handler\n");
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 969890b..09d5805 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -7,6 +7,7 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
@@ -1240,7 +1241,6 @@ static void mipi_tx_init_irqs(struct kmb_drm_private *dev_p,
 	spin_unlock_irqrestore(&dev_p->irq_lock, irqflags);
 }
 
-
 void mipi_tx_handle_irqs(struct kmb_drm_private *dev_p)
 {
 	uint32_t irq_ctrl_stat_0, hs_stat, hs_enable;
@@ -1273,7 +1273,7 @@ void mipi_tx_handle_irqs(struct kmb_drm_private *dev_p)
 
 }
 
-void kmb_dsi_init(struct drm_device *dev)
+int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge)
 {
 	struct kmb_dsi *kmb_dsi;
 	struct drm_encoder *encoder;
@@ -1281,21 +1281,27 @@ void kmb_dsi_init(struct drm_device *dev)
 	struct drm_connector *connector;
 	struct kmb_dsi_host *host;
 	struct kmb_drm_private *dev_p = dev->dev_private;
+	int ret = 0;
 
 	kmb_dsi = kzalloc(sizeof(*kmb_dsi), GFP_KERNEL);
-	if (!kmb_dsi)
-		return;
+	if (!kmb_dsi) {
+		DRM_ERROR("failed to allocate kmb_dsi\n");
+		return -ENOMEM;
+	}
 
 	kmb_connector = kzalloc(sizeof(*kmb_connector), GFP_KERNEL);
 	if (!kmb_connector) {
 		kfree(kmb_dsi);
-		return;
+		DRM_ERROR("failed to allocate kmb_connector\n");
+		return -ENOMEM;
 	}
 
 	kmb_dsi->attached_connector = kmb_connector;
 
 	connector = &kmb_connector->base;
 	encoder = &kmb_dsi->base;
+	encoder->possible_crtcs = 1;
+	encoder->possible_clones = 0;
 	drm_encoder_init(dev, encoder, &kmb_dsi_funcs, DRM_MODE_ENCODER_DSI,
 			 "MIPI-DSI");
 
@@ -1313,6 +1319,14 @@ void kmb_dsi_init(struct drm_device *dev)
 	connector->encoder = encoder;
 	drm_connector_attach_encoder(connector, encoder);
 
+	/* Link drm_bridge to encoder */
+	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
+	if (ret) {
+		DRM_ERROR("failed to attach bridge to MIPI\n");
+		drm_encoder_cleanup(encoder);
+		return ret;
+	}
+
 	/* initialize mipi controller */
 	mipi_tx_init_cntrl(dev_p, &mipi_tx_init_cfg);
 
@@ -1321,4 +1335,6 @@ void kmb_dsi_init(struct drm_device *dev)
 
 	/* irq initialization */
 	mipi_tx_init_irqs(dev_p, &int_cfg, &mipi_tx_init_cfg.tx_ctrl_cfg);
+
+	return 0;
 }
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.h b/drivers/gpu/drm/kmb/kmb_dsi.h
index f7e2f9e..702ad58 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.h
+++ b/drivers/gpu/drm/kmb/kmb_dsi.h
@@ -18,6 +18,7 @@ struct kmb_dsi {
 	struct drm_encoder base;
 	struct kmb_connector *attached_connector;
 	struct kmb_dsi_host *dsi_host;
+	struct drm_bridge *bridge;
 };
 
 struct kmb_dsi_host {
@@ -308,7 +309,7 @@ union mipi_irq_cfg {
 	} irq_cfg;
 };
 
-void kmb_dsi_init(struct drm_device *dev);
+int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge);
 void kmb_plane_destroy(struct drm_plane *plane);
 void mipi_tx_handle_irqs(struct kmb_drm_private *dev_p);
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
