Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BB53E3DA2
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B4E8996F;
	Mon,  9 Aug 2021 01:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98348991C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:08 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27914466;
 Mon,  9 Aug 2021 03:35:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472907;
 bh=GBuHfnPGGEWRCQD621QKzu8LgJ5lQu1znnM9RmHxGM0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vm7cm6ybyz+RkwsKGq0uIwcXdfrVWcDi+cYSTOt2Kh5OLtKQQK2REbpgiXGfQdXnz
 YOFOiVSgx+IBg7VeCsT25e6KhetFtEtqyvoPIsoNMwkXfC3rl5ZqpxqlZRXRDNZH/F
 gdMIfsQkjFMkwb2Q7rWkif4+klxH0G3i63B+tF9k=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Subject: [PATCH 09/36] drm: xlnx: zynqmp_dpsub: Use DRM connector bridge helper
Date: Mon,  9 Aug 2021 04:34:30 +0300
Message-Id: <20210809013457.11266-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809013457.11266-1-laurent.pinchart@ideasonboard.com>
References: <20210809013457.11266-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Replace the manual connector implementation and registration in the DP
encoder with the DRM connector bridge helper. This removes boilerplate
code and simplifies the driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c    | 90 +----------------------------
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 26 ++++++++-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h |  2 +
 3 files changed, 28 insertions(+), 90 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 244628497e98..eb05feef5d30 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -10,7 +10,6 @@
  */
 
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_dp_helper.h>
@@ -274,7 +273,6 @@ struct zynqmp_dp_config {
 
 /**
  * struct zynqmp_dp - Xilinx DisplayPort core
- * @connector: the drm connector structure
  * @dev: device structure
  * @dpsub: Display subsystem
  * @drm: DRM core
@@ -296,7 +294,6 @@ struct zynqmp_dp_config {
  * @train_set: set of training data
  */
 struct zynqmp_dp {
-	struct drm_connector connector;
 	struct device *dev;
 	struct zynqmp_dpsub *dpsub;
 	struct drm_device *drm;
@@ -321,11 +318,6 @@ struct zynqmp_dp {
 	u8 train_set[ZYNQMP_DP_MAX_LANES];
 };
 
-static inline struct zynqmp_dp *connector_to_dp(struct drm_connector *connector)
-{
-	return container_of(connector, struct zynqmp_dp, connector);
-}
-
 static inline struct zynqmp_dp *bridge_to_dp(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct zynqmp_dp, bridge);
@@ -1284,33 +1276,15 @@ static void zynqmp_dp_encoder_mode_set_stream(struct zynqmp_dp *dp,
  * DRM Bridge
  */
 
-static const struct drm_connector_funcs zynqmp_dp_connector_funcs;
-static const struct drm_connector_helper_funcs zynqmp_dp_connector_helper_funcs;
-
 static int zynqmp_dp_bridge_attach(struct drm_bridge *bridge,
 				   enum drm_bridge_attach_flags flags)
 {
 	struct zynqmp_dp *dp = bridge_to_dp(bridge);
-	struct drm_connector *connector = &dp->connector;
 	int ret;
 
-	/* Create the DRM connector. */
-	connector->polled = DRM_CONNECTOR_POLL_HPD;
-	ret = drm_connector_init(dp->drm, connector,
-				 &zynqmp_dp_connector_funcs,
-				 DRM_MODE_CONNECTOR_DisplayPort);
-	if (ret) {
-		dev_err(dp->dev, "failed to create the DRM connector\n");
-		return ret;
-	}
-
-	drm_connector_helper_add(connector, &zynqmp_dp_connector_helper_funcs);
-	drm_connector_register(connector);
-	drm_connector_attach_encoder(connector, bridge->encoder);
-
 	if (dp->next_bridge) {
 		ret = drm_bridge_attach(bridge->encoder, dp->next_bridge,
-					bridge, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+					bridge, flags);
 		if (ret < 0)
 			return ret;
 	}
@@ -1531,68 +1505,6 @@ static const struct drm_bridge_funcs zynqmp_dp_bridge_funcs = {
 	.get_edid = zynqmp_dp_bridge_get_edid,
 };
 
-/* -----------------------------------------------------------------------------
- * DRM Connector
- */
-
-static enum drm_connector_status
-zynqmp_dp_connector_detect(struct drm_connector *connector, bool force)
-{
-	struct zynqmp_dp *dp = connector_to_dp(connector);
-
-	return zynqmp_dp_bridge_detect(&dp->bridge);
-}
-
-static int zynqmp_dp_connector_get_modes(struct drm_connector *connector)
-{
-	struct zynqmp_dp *dp = connector_to_dp(connector);
-	struct edid *edid;
-	int ret;
-
-	edid = zynqmp_dp_bridge_get_edid(&dp->bridge, connector);
-	if (!edid)
-		return 0;
-
-	drm_connector_update_edid_property(connector, edid);
-	ret = drm_add_edid_modes(connector, edid);
-	kfree(edid);
-
-	return ret;
-}
-
-static struct drm_encoder *
-zynqmp_dp_connector_best_encoder(struct drm_connector *connector)
-{
-	struct zynqmp_dp *dp = connector_to_dp(connector);
-
-	return &dp->dpsub->encoder;
-}
-
-static int zynqmp_dp_connector_mode_valid(struct drm_connector *connector,
-					  struct drm_display_mode *mode)
-{
-	struct zynqmp_dp *dp = connector_to_dp(connector);
-
-	return zynqmp_dp_bridge_mode_valid(&dp->bridge, &connector->display_info,
-					   mode);
-}
-
-static const struct drm_connector_funcs zynqmp_dp_connector_funcs = {
-	.detect			= zynqmp_dp_connector_detect,
-	.fill_modes		= drm_helper_probe_single_connector_modes,
-	.destroy		= drm_connector_cleanup,
-	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
-	.reset			= drm_atomic_helper_connector_reset,
-};
-
-static const struct drm_connector_helper_funcs
-zynqmp_dp_connector_helper_funcs = {
-	.get_modes	= zynqmp_dp_connector_get_modes,
-	.best_encoder	= zynqmp_dp_connector_best_encoder,
-	.mode_valid	= zynqmp_dp_connector_mode_valid,
-};
-
 /* -----------------------------------------------------------------------------
  * Interrupt Handling
  */
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index 3a3a85821e99..a7a80c435fa9 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -18,6 +18,8 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
+#include <drm/drm_connector.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
@@ -96,6 +98,7 @@ static const struct drm_driver zynqmp_dpsub_drm_driver = {
 static int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
 {
 	struct drm_encoder *encoder = &dpsub->encoder;
+	struct drm_connector *connector;
 	struct drm_device *drm = &dpsub->drm;
 	int ret;
 
@@ -132,12 +135,30 @@ static int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
 	encoder->possible_crtcs |= zynqmp_disp_get_crtc_mask(dpsub->disp);
 	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_NONE);
 
-	ret = drm_bridge_attach(encoder, dpsub->bridge, NULL, 0);
+	ret = drm_bridge_attach(encoder, dpsub->bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret) {
 		dev_err(dpsub->dev, "failed to attach bridge to encoder\n");
 		goto err_poll_fini;
 	}
 
+	/* Create the connector for the chain of bridges. */
+	connector = drm_bridge_connector_init(drm, encoder);
+	if (IS_ERR(connector)) {
+		dev_err(dpsub->dev, "failed to created connector\n");
+		ret = PTR_ERR(connector);
+		goto err_poll_fini;
+	}
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret < 0) {
+		dev_err(dpsub->dev, "failed to attach connector to encoder\n");
+		goto err_poll_fini;
+	}
+
+	drm_bridge_connector_enable_hpd(connector);
+	dpsub->connector = connector;
+
 	/* Reset all components and register the DRM device. */
 	drm_mode_config_reset(drm);
 
@@ -260,6 +281,9 @@ static int zynqmp_dpsub_remove(struct platform_device *pdev)
 	struct zynqmp_dpsub *dpsub = platform_get_drvdata(pdev);
 	struct drm_device *drm = &dpsub->drm;
 
+	if (dpsub->connector)
+		drm_bridge_connector_disable_hpd(dpsub->connector);
+
 	drm_dev_unregister(drm);
 	drm_atomic_helper_shutdown(drm);
 	drm_kms_helper_poll_fini(drm);
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
index 66820bbc4507..82a7ce136c2c 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
@@ -34,6 +34,7 @@ enum zynqmp_dpsub_format {
  * @dev: The physical device
  * @apb_clk: The APB clock
  * @encoder: The dummy DRM encoder
+ * @connector: The DP connector
  * @bridge: The DP encoder bridge
  * @disp: The display controller
  * @dp: The DisplayPort controller
@@ -46,6 +47,7 @@ struct zynqmp_dpsub {
 	struct clk *apb_clk;
 
 	struct drm_encoder encoder;
+	struct drm_connector *connector;
 	struct drm_bridge *bridge;
 
 	struct zynqmp_disp *disp;
-- 
Regards,

Laurent Pinchart

