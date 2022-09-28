Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DAC5EE99A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 00:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8499D10E5D2;
	Wed, 28 Sep 2022 22:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCDF310E130
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 22:47:34 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 271F76BE;
 Thu, 29 Sep 2022 00:47:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664405253;
 bh=oxR49ze47qNV3zmY5sgvZvZcZd/IVFYOTv17cSeVqac=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hlNK0zmVd0JcwRayVf0ngQ1kCTJNzqk5AZjxuC0kBjvxxRwm1Lj3DKFAH0bPzR4o/
 hups0hlAwZs3KeHJ5YDujByBil3e0QLfzqYUF4gz+j+CMR+e4ASNvjo6noaof4ubUp
 +pMcn2bknSTWP87LfIOFCdtbFHF3T07qx3esJ+5E=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 06/37] drm: xlnx: zynqmp_dpsub: Move connector registration
 to bridge attach
Date: Thu, 29 Sep 2022 01:46:48 +0300
Message-Id: <20220928224719.3291-7-laurent.pinchart@ideasonboard.com>
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

Connector creation requires the DRM encoder, and it thus typically
performed in the bridge attach operation. Move it there, to prepare for
registration of the DRM bridge. For now the zynqmp_dp_bridge_attach() is
called manually at initialization time.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 37 +++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index ca566553e547..65b1ab4e4d2d 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1292,9 +1292,30 @@ static void zynqmp_dp_encoder_mode_set_stream(struct zynqmp_dp *dp,
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
 
@@ -1711,7 +1732,6 @@ int zynqmp_dp_drm_init(struct zynqmp_dpsub *dpsub)
 	struct zynqmp_dp *dp = dpsub->dp;
 	struct drm_bridge *bridge = &dp->bridge;
 	struct drm_encoder *encoder = &dp->encoder;
-	struct drm_connector *connector = &dp->connector;
 	int ret;
 
 	dp->config.misc0 &= ~ZYNQMP_DP_MAIN_STREAM_MISC0_SYNC_LOCK;
@@ -1729,23 +1749,14 @@ int zynqmp_dp_drm_init(struct zynqmp_dpsub *dpsub)
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

