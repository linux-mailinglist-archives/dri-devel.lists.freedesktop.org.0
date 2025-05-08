Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1B7AAF729
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 11:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9475710E383;
	Thu,  8 May 2025 09:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7710810E383
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 09:50:57 +0000 (UTC)
X-CSE-ConnectionGUID: sc8Ay0zRQNO49xFIWixVQw==
X-CSE-MsgGUID: PX9u/21PREeiPjRebf/kqw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 08 May 2025 18:50:49 +0900
Received: from localhost.localdomain (unknown [10.226.92.89])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5264442354C8;
 Thu,  8 May 2025 18:50:45 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: hienhuynh <hien.huynh.px@renesas.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] drm: rz-du: Support panels connected directly to the DPAD
 output
Date: Thu,  8 May 2025 10:50:35 +0100
Message-ID: <20250508095042.25164-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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

From: hienhuynh <hien.huynh.px@renesas.com>

This patch is based on the commit 73eb5476df72 ("drm: rcar-du: Support
panels connected directly to the DPAD outputs").

The RZ DU driver assumes that a bridge is always connected to the DU
output. This is valid for the HDMI output, but the DPAD output can be
connected directly to a panel, in which case no bridge is available.

To support this use case, detect whether the entities connected to the DU
DPAD output is encoders or panels based on the number of ports of their DT
node, and retrieve the corresponding type of DRM objects. For panels,
additionally create panel bridge instances.

Signed-off-by: hienhuynh <hien.huynh.px@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  | 44 +++++++++++++++++--
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
index 564ab4cb3d37..5e6dd16705e6 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
@@ -22,6 +22,26 @@
  * Encoder
  */
 
+static unsigned int rzg2l_du_encoder_count_ports(struct device_node *node)
+{
+	struct device_node *ports;
+	struct device_node *port;
+	unsigned int num_ports = 0;
+
+	ports = of_get_child_by_name(node, "ports");
+	if (!ports)
+		ports = of_node_get(node);
+
+	for_each_child_of_node(ports, port) {
+		if (of_node_name_eq(port, "port"))
+			num_ports++;
+	}
+
+	of_node_put(ports);
+
+	return num_ports;
+}
+
 static const struct drm_encoder_funcs rzg2l_du_encoder_funcs = {
 };
 
@@ -50,10 +70,26 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
 	struct drm_bridge *bridge;
 	int ret;
 
-	/* Locate the DRM bridge from the DT node. */
-	bridge = of_drm_find_bridge(enc_node);
-	if (!bridge)
-		return -EPROBE_DEFER;
+	/*
+	 * Locate the DRM bridge from the DT node. For the DPAD outputs, if the
+	 * DT node has a single port, assume that it describes a panel and
+	 * create a panel bridge.
+	 */
+	if (output == RZG2L_DU_OUTPUT_DPAD0 && rzg2l_du_encoder_count_ports(enc_node) == 1) {
+		struct drm_panel *panel = of_drm_find_panel(enc_node);
+
+		if (IS_ERR(panel))
+			return PTR_ERR(panel);
+
+		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
+							 DRM_MODE_CONNECTOR_DPI);
+		if (IS_ERR(bridge))
+			return PTR_ERR(bridge);
+	} else {
+		bridge = of_drm_find_bridge(enc_node);
+		if (!bridge)
+			return -EPROBE_DEFER;
+	}
 
 	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %s\n",
 		enc_node, rzg2l_du_output_name(output));
-- 
2.43.0

