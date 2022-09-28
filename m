Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6385EE9B4
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 00:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A989610E7C8;
	Wed, 28 Sep 2022 22:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A5F10E502
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 22:48:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5BC7A6BE;
 Thu, 29 Sep 2022 00:48:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664405284;
 bh=Af0lNuwnq1XzwYkN+FgLe3zUj4BwxuOm5FLB5rhXA/Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F/e7t7WTerhXCC1fwlwJgcNzI3JMZEgcGklVo6h65w5WioZT8zzX8iLa1BjVUV7GJ
 wadvs02YEOIYzY3/I5Ze+aTcTSTtzylMj6cb4c/XBBfaRif5Hw9gpi1h/9ZEMahda4
 IM313bPIXxSkLSZpS8f+CoY2nUYvqiPqAtbRwzIA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 26/37] drm: xlnx: zynqmp_dpsub: Register AUX bus at bridge
 attach time
Date: Thu, 29 Sep 2022 01:47:08 +0300
Message-Id: <20220928224719.3291-27-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928224719.3291-1-laurent.pinchart@ideasonboard.com>
References: <20220928224719.3291-1-laurent.pinchart@ideasonboard.com>
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
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
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
index 7ad6a5d96c5f..544b062ce723 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -276,7 +276,6 @@ struct zynqmp_dp_config {
  * struct zynqmp_dp - Xilinx DisplayPort core
  * @dev: device structure
  * @dpsub: Display subsystem
- * @drm: DRM core
  * @iomem: device I/O memory for register access
  * @reset: reset controller
  * @irq: irq
@@ -297,7 +296,6 @@ struct zynqmp_dp_config {
 struct zynqmp_dp {
 	struct device *dev;
 	struct zynqmp_dpsub *dpsub;
-	struct drm_device *drm;
 	void __iomem *iomem;
 	struct reset_control *reset;
 	int irq;
@@ -1057,7 +1055,7 @@ static int zynqmp_dp_aux_init(struct zynqmp_dp *dp)
 
 	dp->aux.name = "ZynqMP DP AUX";
 	dp->aux.dev = dp->dev;
-	dp->aux.drm_dev = dp->drm;
+	dp->aux.drm_dev = dp->bridge.dev;
 	dp->aux.transfer = zynqmp_dp_aux_transfer;
 
 	return drm_dp_aux_register(&dp->aux);
@@ -1283,14 +1281,35 @@ static int zynqmp_dp_bridge_attach(struct drm_bridge *bridge,
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
@@ -1495,6 +1514,7 @@ static struct edid *zynqmp_dp_bridge_get_edid(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs zynqmp_dp_bridge_funcs = {
 	.attach = zynqmp_dp_bridge_attach,
+	.detach = zynqmp_dp_bridge_detach,
 	.mode_valid = zynqmp_dp_bridge_mode_valid,
 	.atomic_enable = zynqmp_dp_bridge_atomic_enable,
 	.atomic_disable = zynqmp_dp_bridge_atomic_disable,
@@ -1594,7 +1614,6 @@ int zynqmp_dp_drm_init(struct zynqmp_dpsub *dpsub)
 {
 	struct zynqmp_dp *dp = dpsub->dp;
 	struct drm_bridge *bridge = &dp->bridge;
-	int ret;
 
 	dp->config.misc0 &= ~ZYNQMP_DP_MAIN_STREAM_MISC0_SYNC_LOCK;
 	zynqmp_dp_set_format(dp, NULL, ZYNQMP_DPSUB_FORMAT_RGB, 8);
@@ -1606,16 +1625,6 @@ int zynqmp_dp_drm_init(struct zynqmp_dpsub *dpsub)
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
 
@@ -1633,7 +1642,6 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm)
 	dp->dev = &pdev->dev;
 	dp->dpsub = dpsub;
 	dp->status = connector_status_disconnected;
-	dp->drm = drm;
 
 	INIT_DELAYED_WORK(&dp->hpd_work, zynqmp_dp_hpd_work_func);
 
@@ -1719,7 +1727,6 @@ void zynqmp_dp_remove(struct zynqmp_dpsub *dpsub)
 	disable_irq(dp->irq);
 
 	cancel_delayed_work_sync(&dp->hpd_work);
-	zynqmp_dp_aux_cleanup(dp);
 
 	zynqmp_dp_write(dp, ZYNQMP_DP_TRANSMITTER_ENABLE, 0);
 	zynqmp_dp_write(dp, ZYNQMP_DP_INT_DS, 0xffffffff);
-- 
Regards,

Laurent Pinchart

