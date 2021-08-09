Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B633E3DB0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290C989A5E;
	Mon,  9 Aug 2021 01:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36AFF8991D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:16 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5B4E466;
 Mon,  9 Aug 2021 03:35:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472914;
 bh=P5AHXfL6ScRebgzfAsWzms7NTl2b6bI+Lk+GgtWILs8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ejO6kJvDB7pLxc346tq61MH7imrt706E+aPdamK4FycWbxD1BGgvbkh9STkcNFN//
 cQh7XeyIe37nzl71NDqRWVT6c5zv0JW3BbAVbbhbwn5ALxWKXHqDuI2cBQyFACL1OM
 CKa9PM01lS4XK438KBmpWycQbx/D4mOd2fpbldkk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Subject: [PATCH 25/36] drm: xlnx: zynqmp_dpsub: Register AUX bus at bridge
 attach time
Date: Mon,  9 Aug 2021 04:34:46 +0300
Message-Id: <20210809013457.11266-26-laurent.pinchart@ideasonboard.com>
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

To prepare for operating as a standalone DP bridge with the DRM device
implemented in the PL, move registration of the AUX bus to bridge attach
time, as that's the earliest point when a DRM device is available.

The DRM device pointer stored in zynqmp_dp isn't used anymore, drop it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 41 +++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 72fe3b7fb78e..e40ddfd27ff0 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -275,7 +275,6 @@ struct zynqmp_dp_config {
  * struct zynqmp_dp - Xilinx DisplayPort core
  * @dev: device structure
  * @dpsub: Display subsystem
- * @drm: DRM core
  * @iomem: device I/O memory for register access
  * @reset: reset controller
  * @irq: irq
@@ -296,7 +295,6 @@ struct zynqmp_dp_config {
 struct zynqmp_dp {
 	struct device *dev;
 	struct zynqmp_dpsub *dpsub;
-	struct drm_device *drm;
 	void __iomem *iomem;
 	struct reset_control *reset;
 	int irq;
@@ -1056,7 +1054,7 @@ static int zynqmp_dp_aux_init(struct zynqmp_dp *dp)
 
 	dp->aux.name = "ZynqMP DP AUX";
 	dp->aux.dev = dp->dev;
-	dp->aux.drm_dev = dp->drm;
+	dp->aux.drm_dev = dp->bridge.dev;
 	dp->aux.transfer = zynqmp_dp_aux_transfer;
 
 	return drm_dp_aux_register(&dp->aux);
@@ -1282,14 +1280,35 @@ static int zynqmp_dp_bridge_attach(struct drm_bridge *bridge,
 	struct zynqmp_dp *dp = bridge_to_dp(bridge);
 	int ret;
 
+	/* Initialize and register the AUX adapter. */
+	ret = zynqmp_dp_aux_init(dp);
+	if (ret) {
+		dev_err(dp->dev, "failed to initialize DP aux\n");
+		return ret;
+	}
+
 	if (dp->next_bridge) {
 		ret = drm_bridge_attach(bridge->encoder, dp->next_bridge,
 					bridge, flags);
 		if (ret < 0)
-			return ret;
+			goto error;
 	}
 
+	/* Now that initialisation is complete, enable interrupts. */
+	zynqmp_dp_write(dp, ZYNQMP_DP_INT_EN, ZYNQMP_DP_INT_ALL);
+
 	return 0;
+
+error:
+	zynqmp_dp_aux_cleanup(dp);
+	return ret;
+}
+
+static void zynqmp_dp_bridge_detach(struct drm_bridge *bridge)
+{
+	struct zynqmp_dp *dp = bridge_to_dp(bridge);
+
+	zynqmp_dp_aux_cleanup(dp);
 }
 
 static int zynqmp_dp_bridge_mode_valid(struct drm_bridge *bridge,
@@ -1494,6 +1513,7 @@ static struct edid *zynqmp_dp_bridge_get_edid(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs zynqmp_dp_bridge_funcs = {
 	.attach = zynqmp_dp_bridge_attach,
+	.detach = zynqmp_dp_bridge_detach,
 	.mode_valid = zynqmp_dp_bridge_mode_valid,
 	.atomic_enable = zynqmp_dp_bridge_atomic_enable,
 	.atomic_disable = zynqmp_dp_bridge_atomic_disable,
@@ -1593,7 +1613,6 @@ int zynqmp_dp_drm_init(struct zynqmp_dpsub *dpsub)
 {
 	struct zynqmp_dp *dp = dpsub->dp;
 	struct drm_bridge *bridge = &dp->bridge;
-	int ret;
 
 	dp->config.misc0 &= ~ZYNQMP_DP_MAIN_STREAM_MISC0_SYNC_LOCK;
 	zynqmp_dp_set_format(dp, NULL, ZYNQMP_DPSUB_FORMAT_RGB, 8);
@@ -1605,16 +1624,6 @@ int zynqmp_dp_drm_init(struct zynqmp_dpsub *dpsub)
 	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
 	dpsub->bridge = bridge;
 
-	/* Initialize and register the AUX adapter. */
-	ret = zynqmp_dp_aux_init(dp);
-	if (ret) {
-		dev_err(dp->dev, "failed to initialize DP aux\n");
-		return ret;
-	}
-
-	/* Now that initialisation is complete, enable interrupts. */
-	zynqmp_dp_write(dp, ZYNQMP_DP_INT_EN, ZYNQMP_DP_INT_ALL);
-
 	return 0;
 }
 
@@ -1632,7 +1641,6 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm)
 	dp->dev = &pdev->dev;
 	dp->dpsub = dpsub;
 	dp->status = connector_status_disconnected;
-	dp->drm = drm;
 
 	INIT_DELAYED_WORK(&dp->hpd_work, zynqmp_dp_hpd_work_func);
 
@@ -1718,7 +1726,6 @@ void zynqmp_dp_remove(struct zynqmp_dpsub *dpsub)
 	disable_irq(dp->irq);
 
 	cancel_delayed_work_sync(&dp->hpd_work);
-	zynqmp_dp_aux_cleanup(dp);
 
 	zynqmp_dp_write(dp, ZYNQMP_DP_TRANSMITTER_ENABLE, 0);
 	zynqmp_dp_write(dp, ZYNQMP_DP_INT_DS, 0xffffffff);
-- 
Regards,

Laurent Pinchart

