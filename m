Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 196815EE9A4
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 00:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB2A10E77A;
	Wed, 28 Sep 2022 22:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B228B10E502
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 22:48:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16D7647C;
 Thu, 29 Sep 2022 00:48:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664405298;
 bh=p1TdI3e0d7cYW/J1/mkCqDSgMgzntqgCTRGmiHqwaoU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R3VvG6cqrJo6PoGfCGhcjm1rgEXaq/MH5uchncJLKW6Xt845o4x7I8ZFJcBJB/EiB
 74voqW7/U2LzPC6fb0P9JBxCiZveUTn3Zt6+UdGxRh8WcJcv8EUq4/nsa8IccnuU4k
 mXDR9sjYWPzW4SFFZAAlkdOkF7ghPwO7dNLJj6o8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 35/37] drm: xlnx: zynqmp_dpsub: Add support for live video
 input
Date: Thu, 29 Sep 2022 01:47:17 +0300
Message-Id: <20220928224719.3291-36-laurent.pinchart@ideasonboard.com>
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

Add partial live video support, with a single video input that bypasses
blending. Skip registration of the DRM device in that case, but register
the DRM bridge instead. The DRM device will be created by the driver for
the display controller in the PL.

Full live video mode with concurrent usage of the video and gfx inputs,
and blending in the DPSUB video pipeline, is currently unsupported.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c    | 55 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 32 +++++++++++++----
 2 files changed, 80 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 5424f955be28..7c9ae167eac7 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -14,6 +14,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_of.h>
 
@@ -1271,6 +1272,55 @@ static void zynqmp_dp_encoder_mode_set_stream(struct zynqmp_dp *dp,
 	zynqmp_dp_write(dp, ZYNQMP_DP_USER_DATA_COUNT_PER_LANE, reg);
 }
 
+/* -----------------------------------------------------------------------------
+ * DISP Configuration
+ */
+
+static void zynqmp_dp_disp_enable(struct zynqmp_dp *dp,
+				  struct drm_bridge_state *old_bridge_state)
+{
+	enum zynqmp_dpsub_layer_id layer_id;
+	struct zynqmp_disp_layer *layer;
+	const struct drm_format_info *info;
+
+	if (dp->dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_LIVE_VIDEO))
+		layer_id = ZYNQMP_DPSUB_LAYER_VID;
+	else if (dp->dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_LIVE_GFX))
+		layer_id = ZYNQMP_DPSUB_LAYER_GFX;
+	else
+		return;
+
+	layer = dp->dpsub->layers[layer_id];
+
+	/* TODO: Make the format configurable. */
+	info = drm_format_info(DRM_FORMAT_YUV422);
+	zynqmp_disp_layer_set_format(layer, info);
+	zynqmp_disp_layer_enable(layer, ZYNQMP_DPSUB_LAYER_LIVE);
+
+	if (layer_id == ZYNQMP_DPSUB_LAYER_GFX)
+		zynqmp_disp_blend_set_global_alpha(dp->dpsub->disp, true, 255);
+	else
+		zynqmp_disp_blend_set_global_alpha(dp->dpsub->disp, false, 0);
+
+	zynqmp_disp_enable(dp->dpsub->disp);
+}
+
+static void zynqmp_dp_disp_disable(struct zynqmp_dp *dp,
+				   struct drm_bridge_state *old_bridge_state)
+{
+	struct zynqmp_disp_layer *layer;
+
+	if (dp->dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_LIVE_VIDEO))
+		layer = dp->dpsub->layers[ZYNQMP_DPSUB_LAYER_VID];
+	else if (dp->dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_LIVE_GFX))
+		layer = dp->dpsub->layers[ZYNQMP_DPSUB_LAYER_GFX];
+	else
+		return;
+
+	zynqmp_disp_disable(dp->dpsub->disp);
+	zynqmp_disp_layer_disable(layer);
+}
+
 /* -----------------------------------------------------------------------------
  * DRM Bridge
  */
@@ -1355,6 +1405,8 @@ static void zynqmp_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 
 	pm_runtime_get_sync(dp->dev);
 
+	zynqmp_dp_disp_enable(dp, old_bridge_state);
+
 	/*
 	 * Retrieve the CRTC mode and adjusted mode. This requires a little
 	 * dance to go from the bridge to the encoder, to the connector and to
@@ -1428,6 +1480,9 @@ static void zynqmp_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 			ZYNQMP_DP_TX_PHY_POWER_DOWN_ALL);
 	if (zynqmp_dpsub_audio_enabled(dp->dpsub))
 		zynqmp_dp_write(dp, ZYNQMP_DP_TX_AUDIO_CONTROL, 0);
+
+	zynqmp_dp_disp_disable(dp, old_bridge_state);
+
 	pm_runtime_put_sync(dp->dev);
 }
 
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index 6e4cd4479de1..bab862484d42 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -19,6 +19,7 @@
 #include <linux/slab.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_module.h>
 
@@ -174,11 +175,22 @@ static int zynqmp_dpsub_parse_dt(struct zynqmp_dpsub *dpsub)
 	}
 
 	/* Sanity checks. */
+	if ((dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_LIVE_VIDEO)) &&
+	    (dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_LIVE_GFX))) {
+		dev_err(dpsub->dev, "only one live video input is supported\n");
+		return -EINVAL;
+	}
+
 	if ((dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_LIVE_VIDEO)) ||
-	    (dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_LIVE_GFX)))
-		dev_warn(dpsub->dev, "live video unsupported, ignoring\n");
-
-	dpsub->dma_enabled = true;
+	    (dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_LIVE_GFX))) {
+		if (dpsub->vid_clk_from_ps) {
+			dev_err(dpsub->dev,
+				"live video input requires PL clock\n");
+			return -EINVAL;
+		}
+	} else {
+		dpsub->dma_enabled = true;
+	}
 
 	if (dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_LIVE_AUDIO))
 		dev_warn(dpsub->dev, "live audio unsupported, ignoring\n");
@@ -242,9 +254,13 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_dp;
 
-	ret = zynqmp_dpsub_drm_init(dpsub);
-	if (ret)
-		goto err_disp;
+	if (dpsub->dma_enabled) {
+		ret = zynqmp_dpsub_drm_init(dpsub);
+		if (ret)
+			goto err_disp;
+	} else {
+		drm_bridge_add(dpsub->bridge);
+	}
 
 	dev_info(&pdev->dev, "ZynqMP DisplayPort Subsystem driver probed");
 
@@ -270,6 +286,8 @@ static int zynqmp_dpsub_remove(struct platform_device *pdev)
 
 	if (dpsub->drm)
 		zynqmp_dpsub_drm_cleanup(dpsub);
+	else
+		drm_bridge_remove(dpsub->bridge);
 
 	zynqmp_disp_remove(dpsub);
 	zynqmp_dp_remove(dpsub);
-- 
Regards,

Laurent Pinchart

