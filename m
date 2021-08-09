Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F603E3D98
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149D489930;
	Mon,  9 Aug 2021 01:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1FF89915
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:07 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5A28E57;
 Mon,  9 Aug 2021 03:35:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472906;
 bh=Ls26ONVkqWfX77xXdzI8voyzQMBLaaTlJn2abUDD9EQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VVdnrSxAbP2OQ/4QywWw1VP4R3uB//0D/xRkpYr7zGhqrND4jEGDo0nVVpsA+TPrY
 3rvb+3YPkG5b4Mw5B2Ybm5LuiuPvZ04Jki5grEBU7kQvC5JhslLB2Mfbxc90S7SeCU
 jLytt8SQ43DxnPDQ0guPAcHKaE+mu89MpYbfIfQE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Subject: [PATCH 06/36] drm: xlnx: zynqmp_dpsub: Move connector registration to
 bridge attach
Date: Mon,  9 Aug 2021 04:34:27 +0300
Message-Id: <20210809013457.11266-7-laurent.pinchart@ideasonboard.com>
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

Connector creation requires the DRM encoder, and it thus typically
performed in the bridge attach operation. Move it there, to prepare for
registration of the DRM bridge. For now the zynqmp_dp_bridge_attach() is
called manually at initialization time.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 37 +++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 689ac157381b..838585bb84ab 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1291,9 +1291,30 @@ static void zynqmp_dp_encoder_mode_set_stream(struct zynqmp_dp *dp,
  * DRM Bridge
  */
 
+static const struct drm_connector_funcs zynqmp_dp_connector_funcs;
+static const struct drm_connector_helper_funcs zynqmp_dp_connector_helper_funcs;
+
 static int zynqmp_dp_bridge_attach(struct drm_bridge *bridge,
 				   enum drm_bridge_attach_flags flags)
 {
+	struct zynqmp_dp *dp = bridge_to_dp(bridge);
+	struct drm_connector *connector = &dp->connector;
+	int ret;
+
+	/* Create the DRM connector. */
+	connector->polled = DRM_CONNECTOR_POLL_HPD;
+	ret = drm_connector_init(dp->drm, connector,
+				 &zynqmp_dp_connector_funcs,
+				 DRM_MODE_CONNECTOR_DisplayPort);
+	if (ret) {
+		dev_err(dp->dev, "failed to create the DRM connector\n");
+		return ret;
+	}
+
+	drm_connector_helper_add(connector, &zynqmp_dp_connector_helper_funcs);
+	drm_connector_register(connector);
+	drm_connector_attach_encoder(connector, bridge->encoder);
+
 	return 0;
 }
 
@@ -1710,7 +1731,6 @@ int zynqmp_dp_drm_init(struct zynqmp_dpsub *dpsub)
 	struct zynqmp_dp *dp = dpsub->dp;
 	struct drm_bridge *bridge = &dp->bridge;
 	struct drm_encoder *encoder = &dp->encoder;
-	struct drm_connector *connector = &dp->connector;
 	int ret;
 
 	dp->config.misc0 &= ~ZYNQMP_DP_MAIN_STREAM_MISC0_SYNC_LOCK;
@@ -1728,23 +1748,14 @@ int zynqmp_dp_drm_init(struct zynqmp_dpsub *dpsub)
 		    | DRM_BRIDGE_OP_HPD;
 	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
 
-	/* Create the DRM encoder and connector. */
+	/* Create the DRM encoder and attach the bridge. */
 	encoder->possible_crtcs |= zynqmp_disp_get_crtc_mask(dpsub->disp);
 	drm_simple_encoder_init(dp->drm, encoder, DRM_MODE_ENCODER_TMDS);
 	drm_encoder_helper_add(encoder, &zynqmp_dp_encoder_helper_funcs);
 
-	connector->polled = DRM_CONNECTOR_POLL_HPD;
-	ret = drm_connector_init(encoder->dev, connector,
-				 &zynqmp_dp_connector_funcs,
-				 DRM_MODE_CONNECTOR_DisplayPort);
-	if (ret) {
-		dev_err(dp->dev, "failed to create the DRM connector\n");
+	ret = zynqmp_dp_bridge_attach(bridge, 0);
+	if (ret < 0)
 		return ret;
-	}
-
-	drm_connector_helper_add(connector, &zynqmp_dp_connector_helper_funcs);
-	drm_connector_register(connector);
-	drm_connector_attach_encoder(connector, encoder);
 
 	/* Initialize and register the AUX adapter. */
 	ret = zynqmp_dp_aux_init(dp);
-- 
Regards,

Laurent Pinchart

