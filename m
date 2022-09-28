Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF15F5EE9B1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 00:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5449710E7C2;
	Wed, 28 Sep 2022 22:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970EC10E502
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 22:48:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A4D847C;
 Thu, 29 Sep 2022 00:48:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664405286;
 bh=o0ICMMfCh4mCUzNGmEBDJxtXe18mjhlChfsoTjzXiHk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wbzGeLvN+NlssMERWx/70P+JEirih15xPGlfHoz2VgNoZrPsSRPr+V2Yc9+9q9yBA
 fRpqsVbuwDHdPDCIVZp9iczvWDQqM0yy6pVPmkXPrBtl6vxMTj0EBreNdJXBJMK3A9
 72hHVTCIK4RYOk71bbC1x9LAiRTsLOvXjbg1igmw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 27/37] drm: xlnx: zynqmp_dpsub: Move DP bridge init to
 zynqmp_dp_probe()
Date: Thu, 29 Sep 2022 01:47:09 +0300
Message-Id: <20220928224719.3291-28-laurent.pinchart@ideasonboard.com>
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

There's no need to delay bridge initialization, move it to
zynqmp_dp_probe() and drop the zynqmp_dp_drm_init() function.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c  | 30 ++++++++++++------------------
 drivers/gpu/drm/xlnx/zynqmp_dp.h  |  1 -
 drivers/gpu/drm/xlnx/zynqmp_kms.c |  6 +-----
 3 files changed, 13 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 544b062ce723..0c7add926da3 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1610,27 +1610,10 @@ static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
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
@@ -1673,6 +1656,14 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm)
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
@@ -1683,6 +1674,9 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm)
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
index 1445337de478..d96544855c14 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -348,7 +348,7 @@ int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub)
 	struct drm_connector *connector;
 	int ret;
 
-	/* Create the planes and the CRTC, and initialize the DP encoder. */
+	/* Create the planes and the CRTC. */
 	ret = zynqmp_dpsub_create_planes(dpsub);
 	if (ret)
 		return ret;
@@ -359,10 +359,6 @@ int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub)
 
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

