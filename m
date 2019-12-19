Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4509D125FC6
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 11:47:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2985D6EB33;
	Thu, 19 Dec 2019 10:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0F76EB04
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:45:54 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 173FD12E5;
 Thu, 19 Dec 2019 11:45:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576752352;
 bh=jguE7Om4g9zzHao/FKeiOwt//jEah462xTUfRPHiU2U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PWlwqzaDEdem65pCbK/Ry8xBe3BSw1DN0Ip2Hn6+LoUA6HGuYGQHS1PWdRZZbU6Fj
 290KRda+J7WYDEotPTiTzruZbV4ycU0gouycD42u5ObRfiju1pr+JUD8UD2S5sZx8D
 4UW1gvlDek5XgUr+/DE+kzgA84eDID6xXafregcs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 16/51] drm: Add helper to create a connector for a chain of
 bridges
Date: Thu, 19 Dec 2019 12:44:47 +0200
Message-Id: <20191219104522.9379-17-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191219104522.9379-1-laurent.pinchart@ideasonboard.com>
References: <20191219104522.9379-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Most bridge drivers create a DRM connector to model the connector at the
output of the bridge. This model is historical and has worked pretty
well so far, but causes several issues:

- It prevents supporting more complex display pipelines where DRM
connector operations are split over multiple components. For instance a
pipeline with a bridge connected to the DDC signals to read EDID data,
and another one connected to the HPD signal to detect connection and
disconnection, will not be possible to support through this model.

- It requires every bridge driver to implement similar connector
handling code, resulting in code duplication.

- It assumes that a bridge will either be wired to a connector or to
another bridge, but doesn't support bridges that can be used in both
positions very well (although there is some ad-hoc support for this in
the analogix_dp bridge driver).

In order to solve these issues, ownership of the connector needs to be
moved to the display controller driver.

To avoid code duplication in display controller drivers, add a new
helper to create and manage a DRM connector backed by a chain of
bridges. All connector operations are delegating to the appropriate
bridge in the chain.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
Changes since v2:

- Fixed typo in documentation
- Rebased on top of Boris' drm_bridge chaining rework
- Pass drm_encoder instead of brm_bridge to drm_bridge_connector_init()

Changes since v1:

- Removed the unused MAX_EDID macro
- Removed the unused drm_bridge_connector.hdmi_mode field
- Use drm_connector_init_with_ddc()
---
 drivers/gpu/drm/Makefile               |   3 +-
 drivers/gpu/drm/drm_bridge_connector.c | 373 +++++++++++++++++++++++++
 include/drm/drm_bridge_connector.h     |  18 ++
 3 files changed, 393 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/drm_bridge_connector.c
 create mode 100644 include/drm/drm_bridge_connector.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 6493088a0fdd..ec946856a27f 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -39,7 +39,8 @@ obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
 drm_ttm_helper-y := drm_gem_ttm_helper.o
 obj-$(CONFIG_DRM_TTM_HELPER) += drm_ttm_helper.o
 
-drm_kms_helper-y := drm_crtc_helper.o drm_dp_helper.o drm_dsc.o drm_probe_helper.o \
+drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o drm_dp_helper.o \
+		drm_dsc.o drm_probe_helper.o \
 		drm_plane_helper.o drm_dp_mst_topology.o drm_atomic_helper.o \
 		drm_kms_helper_common.o drm_dp_dual_mode_helper.o \
 		drm_simple_kms_helper.o drm_modeset_helper.o \
diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
new file mode 100644
index 000000000000..c033a343844f
--- /dev/null
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -0,0 +1,373 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2019 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_device.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_probe_helper.h>
+
+/**
+ * DOC: overview
+ *
+ * The DRM bridge connector helper object provides a DRM connector
+ * implementation that wraps a chain of &struct drm_bridge. The connector
+ * operations are fully implemented based on the operations of the bridges in
+ * the chain, and don't require any intervention from the display controller
+ * driver at runtime.
+ *
+ * To use the helper, display controller drivers create a bridge connector with
+ * a call to drm_bridge_connector_init(). This associates the newly created
+ * connector with the chain of bridges passed to the function and registers it
+ * with the DRM device. At that point the connector becomes fully usable, no
+ * further operation is needed.
+ *
+ * The DRM bridge connector operations are implemented based on the operations
+ * provided by the bridges in the chain. Each connector operation is delegated
+ * to the bridge closest to the connector (at the end of the chain) that
+ * provides the relevant functionality.
+ *
+ * To make use of this helper, all bridges in the chain shall report bridge
+ * operation flags (&drm_bridge->ops) and bridge output type
+ * (&drm_bridge->type), and none of them may create a DRM connector directly.
+ */
+
+/**
+ * struct drm_bridge_connector - A connector backed by a chain of bridges
+ */
+struct drm_bridge_connector {
+	/**
+	 * @base: The base DRM connector
+	 */
+	struct drm_connector base;
+	/**
+	 * @encoder:
+	 *
+	 * The encoder at the start of the bridges chain.
+	 */
+	struct drm_encoder *encoder;
+	/**
+	 * @bridge_edid:
+	 *
+	 * The last bridge in the chain (closest to the connector) that provides
+	 * EDID read support, if any (see &DRM_BRIDGE_OP_EDID).
+	 */
+	struct drm_bridge *bridge_edid;
+	/**
+	 * @bridge_hpd:
+	 *
+	 * The last bridge in the chain (closest to the connector) that provides
+	 * hot-plug detection notification, if any (see &DRM_BRIDGE_OP_HPD).
+	 */
+	struct drm_bridge *bridge_hpd;
+	/**
+	 * @bridge_detect:
+	 *
+	 * The last bridge in the chain (closest to the connector) that provides
+	 * connector detection, if any (see &DRM_BRIDGE_OP_DETECT).
+	 */
+	struct drm_bridge *bridge_detect;
+	/**
+	 * @bridge_modes:
+	 *
+	 * The last bridge in the chain (closest to the connector) that provides
+	 * connector modes detection, if any (see &DRM_BRIDGE_OP_MODES).
+	 */
+	struct drm_bridge *bridge_modes;
+};
+
+#define to_drm_bridge_connector(x) \
+	container_of(x, struct drm_bridge_connector, base)
+
+/* -----------------------------------------------------------------------------
+ * Bridge Connector Hot-Plug Handling
+ */
+
+static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
+					    enum drm_connector_status status)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	/* Notify all bridges in the pipeline of hotplug events. */
+	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge) {
+		if (bridge->funcs->hpd_notify)
+			bridge->funcs->hpd_notify(bridge, status);
+	}
+}
+
+static void drm_bridge_connector_hpd_cb(void *cb_data,
+					enum drm_connector_status status)
+{
+	struct drm_bridge_connector *drm_bridge_connector = cb_data;
+	struct drm_connector *connector = &drm_bridge_connector->base;
+	struct drm_device *dev = connector->dev;
+	enum drm_connector_status old_status;
+
+	mutex_lock(&dev->mode_config.mutex);
+	old_status = connector->status;
+	connector->status = status;
+	mutex_unlock(&dev->mode_config.mutex);
+
+	if (old_status == status)
+		return;
+
+	drm_bridge_connector_hpd_notify(connector, status);
+
+	drm_kms_helper_hotplug_event(dev);
+}
+
+/**
+ * drm_bridge_connector_enable_hpd - Enable hot-plug detection for the connector
+ * @connector: The DRM bridge connector
+ *
+ * This function enables hot-plug detection for the given bridge connector.
+ * This is typically used by display drivers in their resume handler.
+ */
+void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *hpd = bridge_connector->bridge_hpd;
+
+	if (hpd)
+		drm_bridge_hpd_enable(hpd, drm_bridge_connector_hpd_cb,
+				      bridge_connector);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_connector_enable_hpd);
+
+/**
+ * drm_bridge_connector_disable_hpd - Disable hot-plug detection for the
+ * connector
+ * @connector: The DRM bridge connector
+ *
+ * This function disables hot-plug detection for the given bridge connector.
+ * This is typically used by display drivers in their suspend handler.
+ */
+void drm_bridge_connector_disable_hpd(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *hpd = bridge_connector->bridge_hpd;
+
+	if (hpd)
+		drm_bridge_hpd_disable(hpd);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_connector_disable_hpd);
+
+/* -----------------------------------------------------------------------------
+ * Bridge Connector Functions
+ */
+
+static enum drm_connector_status
+drm_bridge_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *detect = bridge_connector->bridge_detect;
+	enum drm_connector_status status;
+
+	if (detect) {
+		status = detect->funcs->detect(detect);
+
+		drm_bridge_connector_hpd_notify(connector, status);
+	} else {
+		switch (connector->connector_type) {
+		case DRM_MODE_CONNECTOR_DPI:
+		case DRM_MODE_CONNECTOR_LVDS:
+		case DRM_MODE_CONNECTOR_DSI:
+			status = connector_status_connected;
+			break;
+		default:
+			status = connector_status_unknown;
+			break;
+		}
+	}
+
+	return status;
+}
+
+static void drm_bridge_connector_destroy(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+
+	if (bridge_connector->bridge_hpd) {
+		struct drm_bridge *hpd = bridge_connector->bridge_hpd;
+
+		drm_bridge_hpd_disable(hpd);
+	}
+
+	drm_connector_unregister(connector);
+	drm_connector_cleanup(connector);
+
+	kfree(bridge_connector);
+}
+
+static const struct drm_connector_funcs drm_bridge_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.detect = drm_bridge_connector_detect,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_bridge_connector_destroy,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+/* -----------------------------------------------------------------------------
+ * Bridge Connector Helper Functions
+ */
+
+static int drm_bridge_connector_get_modes_edid(struct drm_connector *connector,
+					       struct drm_bridge *bridge)
+{
+	enum drm_connector_status status;
+	struct edid *edid;
+	int n;
+
+	status = drm_bridge_connector_detect(connector, false);
+	if (status != connector_status_connected)
+		goto no_edid;
+
+	edid = bridge->funcs->get_edid(bridge, connector);
+	if (!edid || !drm_edid_is_valid(edid)) {
+		kfree(edid);
+		goto no_edid;
+	}
+
+	drm_connector_update_edid_property(connector, edid);
+	n = drm_add_edid_modes(connector, edid);
+
+	kfree(edid);
+	return n;
+
+no_edid:
+	drm_connector_update_edid_property(connector, NULL);
+	return 0;
+}
+
+static int drm_bridge_connector_get_modes(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	/*
+	 * If display exposes EDID, then we parse that in the normal way to
+	 * build table of supported modes.
+	 */
+	bridge = bridge_connector->bridge_edid;
+	if (bridge)
+		return drm_bridge_connector_get_modes_edid(connector, bridge);
+
+	/*
+	 * Otherwise if the display pipeline reports modes (e.g. with a fixed
+	 * resolution panel or an analog TV output), query it.
+	 */
+	bridge = bridge_connector->bridge_modes;
+	if (bridge)
+		return bridge->funcs->get_modes(bridge, connector);
+
+	/*
+	 * We can't retrieve modes, which can happen for instance for a DVI or
+	 * VGA output with the DDC bus unconnected. The KMS core will add the
+	 * default modes.
+	 */
+	return 0;
+}
+
+static const struct drm_connector_helper_funcs drm_bridge_connector_helper_funcs = {
+	.get_modes = drm_bridge_connector_get_modes,
+	/* No need for .mode_valid(), the bridges are checked by the core. */
+};
+
+/* -----------------------------------------------------------------------------
+ * Bridge Connector Initialisation
+ */
+
+/**
+ * drm_bridge_connector_init - Initialise a connector for a chain of bridges
+ * @drm: the DRM device
+ * @encoder: the encoder where the bridge chain starts
+ *
+ * Allocate, initialise and register a &drm_bridge_connector with the @drm
+ * device. The connector is associated with a chain of bridges that starts at
+ * the @encoder. All bridges in the chain shall report bridge operation flags
+ * (&drm_bridge->ops) and bridge output type (&drm_bridge->type), and none of
+ * them may create a DRM connector directly.
+ *
+ * Returns a pointer to the new connector on success, or a negative error
+ * pointer otherwise.
+ */
+struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
+						struct drm_encoder *encoder)
+{
+	struct drm_bridge_connector *bridge_connector;
+	struct drm_connector *connector;
+	struct i2c_adapter *ddc = NULL;
+	struct drm_bridge *bridge;
+	int connector_type;
+
+	bridge_connector = kzalloc(sizeof(*bridge_connector), GFP_KERNEL);
+	if (!bridge_connector)
+		return ERR_PTR(-ENOMEM);
+
+	bridge_connector->encoder = encoder;
+
+	/*
+	 * Initialise connector status handling. First locate the furthest
+	 * bridges in the pipeline that support HPD and output detection. Then
+	 * initialise the connector polling mode, using HPD if available and
+	 * falling back to polling if supported. If neither HPD nor output
+	 * detection are available, we don't support hotplug detection at all.
+	 */
+	connector_type = DRM_MODE_CONNECTOR_Unknown;
+	drm_for_each_bridge_in_chain(encoder, bridge) {
+		if (bridge->ops & DRM_BRIDGE_OP_EDID)
+			bridge_connector->bridge_edid = bridge;
+		if (bridge->ops & DRM_BRIDGE_OP_HPD)
+			bridge_connector->bridge_hpd = bridge;
+		if (bridge->ops & DRM_BRIDGE_OP_DETECT)
+			bridge_connector->bridge_detect = bridge;
+		if (bridge->ops & DRM_BRIDGE_OP_MODES)
+			bridge_connector->bridge_modes = bridge;
+
+		if (!drm_bridge_get_next_bridge(bridge))
+			connector_type = bridge->type;
+
+		if (bridge->ddc)
+			ddc = bridge->ddc;
+	}
+
+	if (connector_type == DRM_MODE_CONNECTOR_Unknown) {
+		kfree(bridge_connector);
+		return ERR_PTR(-EINVAL);
+	}
+
+	/*
+	 * TODO: Handle interlace_allowed, doublescan_allowed, stereo_allowed
+	 * and ycbcr_420_allowed.
+	 */
+	connector = &bridge_connector->base;
+	drm_connector_init_with_ddc(drm, connector, &drm_bridge_connector_funcs,
+				    connector_type, ddc);
+	drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
+
+	if (bridge_connector->bridge_hpd)
+		connector->polled = DRM_CONNECTOR_POLL_HPD;
+	else if (bridge_connector->bridge_detect)
+		connector->polled = DRM_CONNECTOR_POLL_CONNECT
+				  | DRM_CONNECTOR_POLL_DISCONNECT;
+
+	return connector;
+}
+EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
diff --git a/include/drm/drm_bridge_connector.h b/include/drm/drm_bridge_connector.h
new file mode 100644
index 000000000000..33f6c3bbdb4a
--- /dev/null
+++ b/include/drm/drm_bridge_connector.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2019 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ */
+
+#ifndef __DRM_BRIDGE_CONNECTOR_H__
+#define __DRM_BRIDGE_CONNECTOR_H__
+
+struct drm_connector;
+struct drm_device;
+struct drm_encoder;
+
+void drm_bridge_connector_enable_hpd(struct drm_connector *connector);
+void drm_bridge_connector_disable_hpd(struct drm_connector *connector);
+struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
+						struct drm_encoder *encoder);
+
+#endif /* __DRM_BRIDGE_CONNECTOR_H__ */
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
