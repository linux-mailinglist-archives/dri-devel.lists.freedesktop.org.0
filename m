Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F015817B5
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 18:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE5B91DFD;
	Tue, 26 Jul 2022 16:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 739E22BCAA
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 16:42:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.93,194,1654527600"; d="scan'208";a="129198086"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 27 Jul 2022 01:42:22 +0900
Received: from localhost.localdomain (unknown [10.226.92.4])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 72B0B4004CE0;
 Wed, 27 Jul 2022 01:42:19 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 02/10] drm: rcar-du: Add encoder lib support
Date: Tue, 26 Jul 2022 17:42:00 +0100
Message-Id: <20220726164208.1048444-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726164208.1048444-1-biju.das.jz@bp.renesas.com>
References: <20220726164208.1048444-1-biju.das.jz@bp.renesas.com>
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
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
 drivers/gpu/drm/rcar-du/Kconfig               |   5 +
 drivers/gpu/drm/rcar-du/Makefile              |   2 +
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c     | 120 +--------------
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h     |  14 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.c | 138 ++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.h |  30 ++++
 6 files changed, 181 insertions(+), 128 deletions(-)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.h

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 3e59c7c213f5..684462c40ae3 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -71,3 +71,8 @@ config DRM_RCAR_WRITEBACK
 	bool
 	default y if ARM64
 	depends on DRM_RCAR_DU
+
+config DRM_RCAR_LIB
+	bool
+	default y
+	depends on DRM_RCAR_DU
diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
index 14a3fa88cc0b..651da6a7ad67 100644
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
index 60d6be78323b..0aa3108d9483 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
@@ -2,137 +2,25 @@
 /*
  * R-Car Display Unit Encoder
  *
- * Copyright (C) 2013-2014 Renesas Electronics Corporation
+ * Copyright (C) 2013-2022 Renesas Electronics Corporation
  *
  * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  */
 
 #include <linux/export.h>
 #include <linux/of.h>
-#include <linux/slab.h>
-
-#include <drm/drm_bridge.h>
-#include <drm/drm_bridge_connector.h>
-#include <drm/drm_crtc.h>
-#include <drm/drm_managed.h>
-#include <drm/drm_modeset_helper_vtables.h>
-#include <drm/drm_panel.h>
 
 #include "rcar_du_drv.h"
-#include "rcar_du_encoder.h"
-#include "rcar_du_kms.h"
-#include "rcar_lvds.h"
+#include "rcar_du_encoder_lib.h"
 
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
index 000000000000..72d83e02a69f
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
+#include <drm/drm_crtc.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_panel.h>
+
+#include "rcar_du_drv.h"
+#include "rcar_du_encoder.h"
+#include "rcar_du_kms.h"
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

