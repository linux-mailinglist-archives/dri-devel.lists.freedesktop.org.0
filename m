Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1117D3E3DA4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9A289971;
	Mon,  9 Aug 2021 01:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46AF28991C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:08 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BC5517C7;
 Mon,  9 Aug 2021 03:35:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472906;
 bh=fUy9dtrbrsd6pjRg47feCohuK20ijNYBsyHzdYiFGMw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fwuTBDvuupCGusSfPnjT86O7r/8saANK4ZT+B3q/bwWWPyQIjY8TK+Vrv5Wf5B4Vf
 NOQEF/0TNO2wtiPGaFTZ+XHDbWJOnQ7s0beg1AE4F+IKEW3MUOxyO/jKCcu7FowUKl
 EBFq9zdI31im6IQD7Er73bfE+7eiP911xVS4/JVw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Subject: [PATCH 08/36] drm: xlnx: zynqmp_dpsub: Attach to the next bridge
Date: Mon,  9 Aug 2021 04:34:29 +0300
Message-Id: <20210809013457.11266-9-laurent.pinchart@ideasonboard.com>
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
index 27b5277f8f64..244628497e98 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -282,6 +282,7 @@ struct zynqmp_dp_config {
  * @reset: reset controller
  * @irq: irq
  * @bridge: DRM bridge for the DP encoder
+ * @next_bridge: The downstream bridge
  * @config: IP core configuration from DTS
  * @aux: aux channel
  * @phy: PHY handles for DP lanes
@@ -304,6 +305,7 @@ struct zynqmp_dp {
 	int irq;
 
 	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
 
 	struct zynqmp_dp_config config;
 	struct drm_dp_aux aux;
@@ -1306,6 +1308,13 @@ static int zynqmp_dp_bridge_attach(struct drm_bridge *bridge,
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
 
@@ -1743,6 +1752,15 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm)
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

