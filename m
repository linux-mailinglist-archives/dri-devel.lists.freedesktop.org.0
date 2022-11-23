Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8A363670C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 18:29:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E779B10E5C6;
	Wed, 23 Nov 2022 17:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id B361710E5C5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 17:29:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.96,187,1665414000"; d="scan'208";a="140988264"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 24 Nov 2022 02:29:16 +0900
Received: from localhost.localdomain (unknown [10.226.92.61])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id AA27540ADCCF;
 Thu, 24 Nov 2022 02:29:13 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v6 01/19] drm: rcar-du: Add encoder lib support
Date: Wed, 23 Nov 2022 17:28:48 +0000
Message-Id: <20221123172906.2919734-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221123172906.2919734-1-biju.das.jz@bp.renesas.com>
References: <20221123172906.2919734-1-biju.das.jz@bp.renesas.com>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add RCar DU encoder lib support by moving rcar_du_encoder_count_ports()
and rcar_du_encoder_funcs to the lib file and added
rcar_du_encoder_funcs() to share the common code between RCar and
RZ/G2L DU encoder drivers.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6:
 * Updated rcar_du_encoder_init() to take care of DSI outputs.
v1->v2:
 * Rebased on drm-misc-next and DU-next.
 * Fixed the warning reported by bot.
---
 drivers/gpu/drm/rcar-du/Kconfig               |   5 +
 drivers/gpu/drm/rcar-du/Makefile              |   2 +
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c     | 117 +--------------
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h     |  14 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.c | 138 ++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.h |  30 ++++
 6 files changed, 180 insertions(+), 126 deletions(-)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.h

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index b2bddbeca878..94a7abd5d499 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -74,3 +74,8 @@ config DRM_RCAR_WRITEBACK
 	bool
 	default y if ARM64
 	depends on DRM_RCAR_DU
+
+config DRM_RCAR_LIB
+	bool
+	default y
+	depends on DRM_RCAR_DU
diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
index b8f2c82651d9..479c8eebba5a 100644
--- a/drivers/gpu/drm/rcar-du/Makefile
+++ b/drivers/gpu/drm/rcar-du/Makefile
@@ -6,6 +6,8 @@ rcar-du-drm-y := rcar_du_crtc.o \
 		 rcar_du_kms.o \
 		 rcar_du_plane.o \
 
+rcar-du-drm-$(CONFIG_DRM_RCAR_LIB) += rcar_du_encoder_lib.o
+
 rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
 rcar-du-drm-$(CONFIG_DRM_RCAR_WRITEBACK) += rcar_du_writeback.o
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
index b1787be31e92..444cc956f692 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -2,7 +2,7 @@
 /*
  * R-Car Display Unit Encoder
  *
- * Copyright (C) 2013-2014 Renesas Electronics Corporation
+ * Copyright (C) 2013-2022 Renesas Electronics Corporation
  *
  * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  */
@@ -10,128 +10,17 @@
 #include <linux/export.h>
 #include <linux/of.h>
 
-#include <drm/drm_bridge.h>
-#include <drm/drm_bridge_connector.h>
-#include <drm/drm_panel.h>
-
 #include "rcar_du_drv.h"
 #include "rcar_du_encoder.h"
-#include "rcar_lvds.h"
 
 /* -----------------------------------------------------------------------------
  * Encoder
  */
 
-static unsigned int rcar_du_encoder_count_ports(struct device_node *node)
-{
-	struct device_node *ports;
-	struct device_node *port;
-	unsigned int num_ports = 0;
-
-	ports = of_get_child_by_name(node, "ports");
-	if (!ports)
-		ports = of_node_get(node);
-
-	for_each_child_of_node(ports, port) {
-		if (of_node_name_eq(port, "port"))
-			num_ports++;
-	}
-
-	of_node_put(ports);
-
-	return num_ports;
-}
-
-static const struct drm_encoder_funcs rcar_du_encoder_funcs = {
-};
-
 int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 			 enum rcar_du_output output,
 			 struct device_node *enc_node)
 {
-	struct rcar_du_encoder *renc;
-	struct drm_connector *connector;
-	struct drm_bridge *bridge;
-	int ret;
-
-	/*
-	 * Locate the DRM bridge from the DT node. For the DPAD outputs, if the
-	 * DT node has a single port, assume that it describes a panel and
-	 * create a panel bridge.
-	 */
-	if ((output == RCAR_DU_OUTPUT_DPAD0 ||
-	     output == RCAR_DU_OUTPUT_DPAD1) &&
-	    rcar_du_encoder_count_ports(enc_node) == 1) {
-		struct drm_panel *panel = of_drm_find_panel(enc_node);
-
-		if (IS_ERR(panel))
-			return PTR_ERR(panel);
-
-		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
-							 DRM_MODE_CONNECTOR_DPI);
-		if (IS_ERR(bridge))
-			return PTR_ERR(bridge);
-	} else {
-		bridge = of_drm_find_bridge(enc_node);
-		if (!bridge)
-			return -EPROBE_DEFER;
-
-		if (output == RCAR_DU_OUTPUT_LVDS0 ||
-		    output == RCAR_DU_OUTPUT_LVDS1)
-			rcdu->lvds[output - RCAR_DU_OUTPUT_LVDS0] = bridge;
-
-		if (output == RCAR_DU_OUTPUT_DSI0 ||
-		    output == RCAR_DU_OUTPUT_DSI1)
-			rcdu->dsi[output - RCAR_DU_OUTPUT_DSI0] = bridge;
-	}
-
-	/*
-	 * Create and initialize the encoder. On Gen3, skip the LVDS1 output if
-	 * the LVDS1 encoder is used as a companion for LVDS0 in dual-link
-	 * mode, or any LVDS output if it isn't connected. The latter may happen
-	 * on D3 or E3 as the LVDS encoders are needed to provide the pixel
-	 * clock to the DU, even when the LVDS outputs are not used.
-	 */
-	if (rcdu->info->gen >= 3) {
-		if (output == RCAR_DU_OUTPUT_LVDS1 &&
-		    rcar_lvds_dual_link(bridge))
-			return -ENOLINK;
-
-		if ((output == RCAR_DU_OUTPUT_LVDS0 ||
-		     output == RCAR_DU_OUTPUT_LVDS1) &&
-		    !rcar_lvds_is_connected(bridge))
-			return -ENOLINK;
-	}
-
-	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %s\n",
-		enc_node, rcar_du_output_name(output));
-
-	renc = drmm_encoder_alloc(&rcdu->ddev, struct rcar_du_encoder, base,
-				  &rcar_du_encoder_funcs, DRM_MODE_ENCODER_NONE,
-				  NULL);
-	if (!renc)
-		return -ENOMEM;
-
-	renc->output = output;
-
-	/* Attach the bridge to the encoder. */
-	ret = drm_bridge_attach(&renc->base, bridge, NULL,
-				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-	if (ret) {
-		dev_err(rcdu->dev,
-			"failed to attach bridge %pOF for output %s (%d)\n",
-			bridge->of_node, rcar_du_output_name(output), ret);
-		return ret;
-	}
-
-	/* Create the connector for the chain of bridges. */
-	connector = drm_bridge_connector_init(&rcdu->ddev, &renc->base);
-	if (IS_ERR(connector)) {
-		dev_err(rcdu->dev,
-			"failed to created connector for output %s (%ld)\n",
-			rcar_du_output_name(output), PTR_ERR(connector));
-		return PTR_ERR(connector);
-	}
-
-	return drm_connector_attach_encoder(connector, &renc->base);
+	return rcar_du_lib_encoder_init(rcdu, output, enc_node,
+					rcar_du_output_name(output));
 }
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
index e5ec8fbb3979..d33b684fe93f 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
@@ -2,7 +2,7 @@
 /*
  * R-Car Display Unit Encoder
  *
- * Copyright (C) 2013-2014 Renesas Electronics Corporation
+ * Copyright (C) 2013-2022 Renesas Electronics Corporation
  *
  * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  */
@@ -10,17 +10,7 @@
 #ifndef __RCAR_DU_ENCODER_H__
 #define __RCAR_DU_ENCODER_H__
 
-#include <drm/drm_encoder.h>
-
-struct rcar_du_device;
-
-struct rcar_du_encoder {
-	struct drm_encoder base;
-	enum rcar_du_output output;
-};
-
-#define to_rcar_encoder(e) \
-	container_of(e, struct rcar_du_encoder, base)
+#include "rcar_du_encoder_lib.h"
 
 int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 			 enum rcar_du_output output,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.c
new file mode 100644
index 000000000000..534d357cfbe2
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * R-Car Display Unit Encoder Lib
+ *
+ * Copyright (C) 2013-2022 Renesas Electronics Corporation
+ *
+ * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
+ */
+
+#include <linux/export.h>
+#include <linux/of.h>
+
+#include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
+#include <drm/drm_panel.h>
+
+#include "rcar_du_drv.h"
+#include "rcar_du_encoder.h"
+#include "rcar_lvds.h"
+
+/* -----------------------------------------------------------------------------
+ * Encoder
+ */
+
+static unsigned int rcar_du_encoder_count_ports(struct device_node *node)
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
+static const struct drm_encoder_funcs rcar_du_encoder_funcs = {
+};
+
+int rcar_du_lib_encoder_init(struct rcar_du_device *rcdu,
+			     enum rcar_du_output output,
+			     struct device_node *enc_node,
+			     const char *output_name)
+{
+	struct rcar_du_encoder *renc;
+	struct drm_connector *connector;
+	struct drm_bridge *bridge;
+	int ret;
+
+	/*
+	 * Locate the DRM bridge from the DT node. For the DPAD outputs, if the
+	 * DT node has a single port, assume that it describes a panel and
+	 * create a panel bridge.
+	 */
+	if ((output == RCAR_DU_OUTPUT_DPAD0 ||
+	     output == RCAR_DU_OUTPUT_DPAD1) &&
+	    rcar_du_encoder_count_ports(enc_node) == 1) {
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
+
+		if (output == RCAR_DU_OUTPUT_LVDS0 ||
+		    output == RCAR_DU_OUTPUT_LVDS1)
+			rcdu->lvds[output - RCAR_DU_OUTPUT_LVDS0] = bridge;
+
+		if (output == RCAR_DU_OUTPUT_DSI0 ||
+		    output == RCAR_DU_OUTPUT_DSI1)
+			rcdu->dsi[output - RCAR_DU_OUTPUT_DSI0] = bridge;
+	}
+
+	/*
+	 * Create and initialize the encoder. On Gen3, skip the LVDS1 output if
+	 * the LVDS1 encoder is used as a companion for LVDS0 in dual-link
+	 * mode, or any LVDS output if it isn't connected. The latter may happen
+	 * on D3 or E3 as the LVDS encoders are needed to provide the pixel
+	 * clock to the DU, even when the LVDS outputs are not used.
+	 */
+	if (rcdu->info->gen >= 3) {
+		if (output == RCAR_DU_OUTPUT_LVDS1 &&
+		    rcar_lvds_dual_link(bridge))
+			return -ENOLINK;
+
+		if ((output == RCAR_DU_OUTPUT_LVDS0 ||
+		     output == RCAR_DU_OUTPUT_LVDS1) &&
+		    !rcar_lvds_is_connected(bridge))
+			return -ENOLINK;
+	}
+
+	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %s\n",
+		enc_node, rcar_du_output_name(output));
+
+	renc = drmm_encoder_alloc(&rcdu->ddev, struct rcar_du_encoder, base,
+				  &rcar_du_encoder_funcs, DRM_MODE_ENCODER_NONE,
+				  NULL);
+	if (!renc)
+		return -ENOMEM;
+
+	renc->output = output;
+
+	/* Attach the bridge to the encoder. */
+	ret = drm_bridge_attach(&renc->base, bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret) {
+		dev_err(rcdu->dev,
+			"failed to attach bridge %pOF for output %s (%d)\n",
+			bridge->of_node, output_name, ret);
+		return ret;
+	}
+
+	/* Create the connector for the chain of bridges. */
+	connector = drm_bridge_connector_init(&rcdu->ddev, &renc->base);
+	if (IS_ERR(connector)) {
+		dev_err(rcdu->dev,
+			"failed to created connector for output %s (%ld)\n",
+			output_name, PTR_ERR(connector));
+		return PTR_ERR(connector);
+	}
+
+	return drm_connector_attach_encoder(connector, &renc->base);
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.h
new file mode 100644
index 000000000000..29fcc7cc12db
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * R-Car Display Unit Encoder Lib
+ *
+ * Copyright (C) 2013-2022 Renesas Electronics Corporation
+ *
+ * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
+ */
+
+#ifndef __RCAR_DU_ENCODER_LIB_H__
+#define __RCAR_DU_ENCODER_LIB_H__
+
+#include <drm/drm_encoder.h>
+
+struct rcar_du_device;
+
+struct rcar_du_encoder {
+	struct drm_encoder base;
+	enum rcar_du_output output;
+};
+
+#define to_rcar_encoder(e) \
+	container_of(e, struct rcar_du_encoder, base)
+
+int rcar_du_lib_encoder_init(struct rcar_du_device *rcdu,
+			     enum rcar_du_output output,
+			     struct device_node *enc_node,
+			     const char *output_name);
+
+#endif /* __RCAR_DU_ENCODER_LIB_H__ */
-- 
2.25.1

