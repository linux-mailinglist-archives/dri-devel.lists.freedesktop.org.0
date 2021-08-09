Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 808143E3DA8
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BF1899C7;
	Mon,  9 Aug 2021 01:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A104489954
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:16 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1953F15AD;
 Mon,  9 Aug 2021 03:35:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472915;
 bh=uPTqI+wt42NxiDt0epVcyDyxExLe/uUbaEMPLoiYNrI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TVYrXZAseb8wysgEspFkDzzMT9/fQFqq+QeYG2mI7f0bcG0ogC8EeEyS6qew3xAqo
 eek+8wHj8Rjp3KaxdN69pY8fa+PAi2gnX4KA3i2/MEiEzKOxgjmU7Rg1BJbh5P4TPe
 TtCM8JJ08p8kCsxWAyJ4qnZlv3xvLwEOz/1Mc19M=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Subject: [PATCH 26/36] drm: xlnx: zynqmp_dpsub: Move DP bridge init to
 zynqmp_dp_probe()
Date: Mon,  9 Aug 2021 04:34:47 +0300
Message-Id: <20210809013457.11266-27-laurent.pinchart@ideasonboard.com>
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

There's no need to delay bridge initialization, move it to
zynqmp_dp_probe() and drop the zynqmp_dp_drm_init() function.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c  | 30 ++++++++++++------------------
 drivers/gpu/drm/xlnx/zynqmp_dp.h  |  1 -
 drivers/gpu/drm/xlnx/zynqmp_kms.c |  6 +-----
 3 files changed, 13 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index e40ddfd27ff0..360175b8fc1f 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1609,27 +1609,10 @@ static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
  * Initialization & Cleanup
  */
 
-int zynqmp_dp_drm_init(struct zynqmp_dpsub *dpsub)
-{
-	struct zynqmp_dp *dp = dpsub->dp;
-	struct drm_bridge *bridge = &dp->bridge;
-
-	dp->config.misc0 &= ~ZYNQMP_DP_MAIN_STREAM_MISC0_SYNC_LOCK;
-	zynqmp_dp_set_format(dp, NULL, ZYNQMP_DPSUB_FORMAT_RGB, 8);
-
-	/* Initialize the bridge. */
-	bridge->funcs = &zynqmp_dp_bridge_funcs;
-	bridge->ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
-		    | DRM_BRIDGE_OP_HPD;
-	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
-	dpsub->bridge = bridge;
-
-	return 0;
-}
-
 int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm)
 {
 	struct platform_device *pdev = to_platform_device(dpsub->dev);
+	struct drm_bridge *bridge;
 	struct zynqmp_dp *dp;
 	struct resource *res;
 	int ret;
@@ -1672,6 +1655,14 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm)
 	if (ret)
 		goto err_reset;
 
+	/* Initialize the bridge. */
+	bridge = &dp->bridge;
+	bridge->funcs = &zynqmp_dp_bridge_funcs;
+	bridge->ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
+		    | DRM_BRIDGE_OP_HPD;
+	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
+	dpsub->bridge = bridge;
+
 	/*
 	 * Acquire the next bridge in the chain. Ignore errors caused by port@5
 	 * not being connected for backward-compatibility with older DTs.
@@ -1682,6 +1673,9 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm)
 		goto err_reset;
 
 	/* Initialize the hardware. */
+	dp->config.misc0 &= ~ZYNQMP_DP_MAIN_STREAM_MISC0_SYNC_LOCK;
+	zynqmp_dp_set_format(dp, NULL, ZYNQMP_DPSUB_FORMAT_RGB, 8);
+
 	zynqmp_dp_write(dp, ZYNQMP_DP_TX_PHY_POWER_DOWN,
 			ZYNQMP_DP_TX_PHY_POWER_DOWN_ALL);
 	zynqmp_dp_set(dp, ZYNQMP_DP_PHY_RESET, ZYNQMP_DP_PHY_RESET_ALL_RESET);
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.h b/drivers/gpu/drm/xlnx/zynqmp_dp.h
index 4507740093f6..736d810fa16f 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.h
@@ -20,7 +20,6 @@ struct zynqmp_dpsub;
 void zynqmp_dp_enable_vblank(struct zynqmp_dp *dp);
 void zynqmp_dp_disable_vblank(struct zynqmp_dp *dp);
 
-int zynqmp_dp_drm_init(struct zynqmp_dpsub *dpsub);
 int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm);
 void zynqmp_dp_remove(struct zynqmp_dpsub *dpsub);
 
diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index 54358f1f51e5..51903bc1de2b 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -347,7 +347,7 @@ int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub)
 	struct drm_connector *connector;
 	int ret;
 
-	/* Create the planes and the CRTC, and nitialize the DP encoder. */
+	/* Create the planes and the CRTC. */
 	ret = zynqmp_dpsub_create_planes(dpsub);
 	if (ret)
 		return ret;
@@ -358,10 +358,6 @@ int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub)
 
 	zynqmp_dpsub_map_crtc_to_plane(dpsub);
 
-	ret = zynqmp_dp_drm_init(dpsub);
-	if (ret)
-		return ret;
-
 	/* Create the encoder and attach the bridge. */
 	encoder->possible_crtcs |= drm_crtc_mask(&dpsub->crtc);
 	drm_simple_encoder_init(&dpsub->drm, encoder, DRM_MODE_ENCODER_NONE);
-- 
Regards,

Laurent Pinchart

