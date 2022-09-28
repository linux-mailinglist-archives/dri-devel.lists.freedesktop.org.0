Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC135EE995
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 00:48:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C763610E4A5;
	Wed, 28 Sep 2022 22:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD0110E130
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 22:47:37 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 35A3B47C;
 Thu, 29 Sep 2022 00:47:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664405256;
 bh=ft0Z9waeO1wikVj6uSQpCpbh6WQLfWImmuPXPH0fook=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L2MVpC57F8NqaQCqJNBygX/3Ys9hqMzS1/kymJ4m9dnnDj0vNsSDU02RzBzgyMhyp
 5uVULfSRVv1oVzUDR+HI6PMTH39o1qj9yTOCeP6z8r6QS7MeIHGUWBGvCNCbBNXBTD
 AdzGLNR1HqrUitsDkPYru19uSzGGnBjtwsIJx+Q4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 08/37] drm: xlnx: zynqmp_dpsub: Attach to the next bridge
Date: Thu, 29 Sep 2022 01:46:50 +0300
Message-Id: <20220928224719.3291-9-laurent.pinchart@ideasonboard.com>
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

The next component in the display chain, after the DP encoder, is most
likely a DP connector. The display connector driver registers a bridge
for it. That bridge doesn't need to be controlled, but is needed in
order to use the DRM connector bridge helper. Retrieve it at init time,
and attach to it in the DP bridge attach handler.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 28f92b5d8385..0aa810ebdeca 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -283,6 +283,7 @@ struct zynqmp_dp_config {
  * @reset: reset controller
  * @irq: irq
  * @bridge: DRM bridge for the DP encoder
+ * @next_bridge: The downstream bridge
  * @config: IP core configuration from DTS
  * @aux: aux channel
  * @phy: PHY handles for DP lanes
@@ -305,6 +306,7 @@ struct zynqmp_dp {
 	int irq;
 
 	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
 
 	struct zynqmp_dp_config config;
 	struct drm_dp_aux aux;
@@ -1307,6 +1309,13 @@ static int zynqmp_dp_bridge_attach(struct drm_bridge *bridge,
 	drm_connector_register(connector);
 	drm_connector_attach_encoder(connector, bridge->encoder);
 
+	if (dp->next_bridge) {
+		ret = drm_bridge_attach(bridge->encoder, dp->next_bridge,
+					bridge, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+		if (ret < 0)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -1744,6 +1753,15 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm)
 	if (ret)
 		goto err_reset;
 
+	/*
+	 * Acquire the next bridge in the chain. Ignore errors caused by port@5
+	 * not being connected for backward-compatibility with older DTs.
+	 */
+	ret = drm_of_find_panel_or_bridge(dp->dev->of_node, 5, 0, NULL,
+					  &dp->next_bridge);
+	if (ret < 0 && ret != -ENODEV)
+		goto err_reset;
+
 	/* Initialize the hardware. */
 	zynqmp_dp_write(dp, ZYNQMP_DP_TX_PHY_POWER_DOWN,
 			ZYNQMP_DP_TX_PHY_POWER_DOWN_ALL);
-- 
Regards,

Laurent Pinchart

