Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B16F125FA6
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 11:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507166EB14;
	Thu, 19 Dec 2019 10:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684546EB07
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:45:43 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA5ECFDF;
 Thu, 19 Dec 2019 11:45:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576752341;
 bh=nuLG99OnRBRHtwY/6E254eruC96yQpi7l/zU4ENF3aw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=duqpqjsTQcF+NQISgnxyWr15XXNp6k31KdkPShDMysXKSWThm9Ghz+FGRzDnRx2+/
 Kb29XJlWFhK/1m1lUNhfXKWoHVSkNyvrPE8bcUB8G2loSBhBIzZ2C6EQCiSNrlXcQU
 fgByvMS+QsjYhkpHDP0AO0gqYFVXtJzHX6AAzfI8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 04/51] drm/bridge: Add connector-related bridge operations
 and data
Date: Thu, 19 Dec 2019 12:44:35 +0200
Message-Id: <20191219104522.9379-5-laurent.pinchart@ideasonboard.com>
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

To support implementation of DRM connectors on top of DRM bridges
instead of by bridges, the drm_bridge needs to expose new operations and
data:

- Output detection, hot-plug notification, mode retrieval and EDID
  retrieval operations
- Bitmask of supported operations
- Bridge output type
- I2C adapter for DDC access

Add and document these.

Three new bridge helper functions are also added to handle hot plug
notification in a way that is as transparent as possible for the
bridges.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
Changes since v3:

- Fix typos

Changes since v2:

- Add wrappers around the .detect(), .get_modes() and .get_edid()
  operations
- Warn bridge drivers about valid usage of the connector argument to
  .get_modes() and .get_edid()

Changes since v1:

- Make .hpd_enable() and .hpd_disable() optional
- Rename .lost_hotplug() to .hpd_notify()
- Add ddc field to drm_bridge
---
 drivers/gpu/drm/drm_bridge.c | 162 +++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     | 193 ++++++++++++++++++++++++++++++++++-
 2 files changed, 354 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c2cf0c90fa26..473353bd762f 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -70,6 +70,8 @@ static LIST_HEAD(bridge_list);
  */
 void drm_bridge_add(struct drm_bridge *bridge)
 {
+	mutex_init(&bridge->hpd_mutex);
+
 	mutex_lock(&bridge_lock);
 	list_add_tail(&bridge->list, &bridge_list);
 	mutex_unlock(&bridge_lock);
@@ -86,6 +88,8 @@ void drm_bridge_remove(struct drm_bridge *bridge)
 	mutex_lock(&bridge_lock);
 	list_del_init(&bridge->list);
 	mutex_unlock(&bridge_lock);
+
+	mutex_destroy(&bridge->hpd_mutex);
 }
 EXPORT_SYMBOL(drm_bridge_remove);
 
@@ -516,6 +520,164 @@ void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
 
+/**
+ * drm_bridge_detect - check if anything is attached to the bridge output
+ * @bridge: bridge control structure
+ *
+ * If the bridge supports output detection, as reported by the
+ * DRM_BRIDGE_OP_DETECT bridge ops flag, call &drm_bridge_funcs.detect for the
+ * bridge and return the connection status. Otherwise return
+ * connector_status_unknown.
+ *
+ * RETURNS:
+ * The detection status on success, or connector_status_unknown if the bridge
+ * doesn't support output detection.
+ */
+enum drm_connector_status drm_bridge_detect(struct drm_bridge *bridge)
+{
+	if (!(bridge->ops & DRM_BRIDGE_OP_DETECT))
+		return connector_status_unknown;
+
+	return bridge->funcs->detect(bridge);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_detect);
+
+/**
+ * drm_bridge_get_modes - fill all modes currently valid for the sink into the
+ * @connector
+ * @bridge: bridge control structure
+ * @connector: the connector to fill with modes
+ *
+ * If the bridge supports output modes retrieval, as reported by the
+ * DRM_BRIDGE_OP_MODES bridge ops flag, call &drm_bridge_funcs.get_modes to
+ * fill the connector with all valid modes and return the number of modes
+ * added. Otherwise return 0.
+ *
+ * RETURNS:
+ * The number of modes added to the connector.
+ */
+int drm_bridge_get_modes(struct drm_bridge *bridge,
+			 struct drm_connector *connector)
+{
+	if (!(bridge->ops & DRM_BRIDGE_OP_MODES))
+		return 0;
+
+	return bridge->funcs->get_modes(bridge, connector);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_get_modes);
+
+/**
+ * drm_bridge_get_edid - get the EDID data of the connected display
+ * @bridge: bridge control structure
+ * @connector: the connector to read EDID for
+ *
+ * If the bridge supports output EDID retrieval, as reported by the
+ * DRM_BRIDGE_OP_EDID bridge ops flag, call &drm_bridge_funcs.get_edid to
+ * get the EDID and return it. Otherwise return ERR_PTR(-ENOTSUPP).
+ *
+ * RETURNS:
+ * The retrieved EDID on success, or an error pointer otherwise.
+ */
+struct edid *drm_bridge_get_edid(struct drm_bridge *bridge,
+				 struct drm_connector *connector)
+{
+	if (!(bridge->ops & DRM_BRIDGE_OP_EDID))
+		return ERR_PTR(-ENOTSUPP);
+
+	return bridge->funcs->get_edid(bridge, connector);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_get_edid);
+
+/**
+ * drm_bridge_hpd_enable - enable hot plug detection for the bridge
+ * @bridge: bridge control structure
+ * @cb: hot-plug detection callback
+ * @data: data to be passed to the hot-plug detection callback
+ *
+ * Call &drm_bridge_funcs.hpd_enable if implemented and register the given @cb
+ * and @data as hot plug notification callback. From now on the @cb will be
+ * called with @data when an output status change is detected by the bridge,
+ * until hot plug notification gets disabled with drm_bridge_hpd_disable().
+ *
+ * Hot plug detection is supported only if the DRM_BRIDGE_OP_HPD flag is set in
+ * bridge->ops. This function shall not be called when the flag is not set.
+ *
+ * Only one hot plug detection callback can be registered at a time, it is an
+ * error to call this function when hot plug detection is already enabled for
+ * the bridge.
+ */
+void drm_bridge_hpd_enable(struct drm_bridge *bridge,
+			   void (*cb)(void *data,
+				      enum drm_connector_status status),
+			   void *data)
+{
+	if (!bridge || !(bridge->ops & DRM_BRIDGE_OP_HPD))
+		return;
+
+	mutex_lock(&bridge->hpd_mutex);
+
+	if (WARN(bridge->hpd_cb, "Hot plug detection already enabled\n"))
+		goto unlock;
+
+	bridge->hpd_cb = cb;
+	bridge->hpd_data = data;
+
+	if (bridge->funcs->hpd_enable)
+		bridge->funcs->hpd_enable(bridge);
+
+unlock:
+	mutex_unlock(&bridge->hpd_mutex);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_hpd_enable);
+
+/**
+ * drm_bridge_hpd_disable - disable hot plug detection for the bridge
+ * @bridge: bridge control structure
+ *
+ * Call &drm_bridge_funcs.hpd_disable if implemented and unregister the hot
+ * plug detection callback previously registered with drm_bridge_hpd_enable().
+ * Once this function returns the callback will not be called by the bridge
+ * when an output status change occurs.
+ *
+ * Hot plug detection is supported only if the DRM_BRIDGE_OP_HPD flag is set in
+ * bridge->ops. This function shall not be called when the flag is not set.
+ */
+void drm_bridge_hpd_disable(struct drm_bridge *bridge)
+{
+	if (!bridge || !(bridge->ops & DRM_BRIDGE_OP_HPD))
+		return;
+
+	mutex_lock(&bridge->hpd_mutex);
+	if (bridge->funcs->hpd_disable)
+		bridge->funcs->hpd_disable(bridge);
+
+	bridge->hpd_cb = NULL;
+	bridge->hpd_data = NULL;
+	mutex_unlock(&bridge->hpd_mutex);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_hpd_disable);
+
+/**
+ * drm_bridge_hpd_notify - notify hot plug detection events
+ * @bridge: bridge control structure
+ * @status: output connection status
+ *
+ * Bridge drivers shall call this function to report hot plug events when they
+ * detect a change in the output status, when hot plug detection has been
+ * enabled by drm_bridge_hpd_enable().
+ *
+ * This function shall be called in a context that can sleep.
+ */
+void drm_bridge_hpd_notify(struct drm_bridge *bridge,
+			   enum drm_connector_status status)
+{
+	mutex_lock(&bridge->hpd_mutex);
+	if (bridge->hpd_cb)
+		bridge->hpd_cb(bridge->hpd_data, status);
+	mutex_unlock(&bridge->hpd_mutex);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
+
 #ifdef CONFIG_OF
 /**
  * of_drm_find_bridge - find the bridge corresponding to the device node in
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 694e153a7531..dbaf6a2e7e4e 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -23,15 +23,20 @@
 #ifndef __DRM_BRIDGE_H__
 #define __DRM_BRIDGE_H__
 
-#include <linux/list.h>
 #include <linux/ctype.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+
 #include <drm/drm_encoder.h>
 #include <drm/drm_mode_object.h>
 #include <drm/drm_modes.h>
 
 struct drm_bridge;
 struct drm_bridge_timings;
+struct drm_connector;
 struct drm_panel;
+struct edid;
+struct i2c_adapter;
 
 /**
  * struct drm_bridge_funcs - drm_bridge control functions
@@ -338,6 +343,119 @@ struct drm_bridge_funcs {
 	 */
 	void (*atomic_post_disable)(struct drm_bridge *bridge,
 				    struct drm_atomic_state *old_state);
+
+	/**
+	 * @detect:
+	 *
+	 * Check if anything is attached to the bridge output.
+	 *
+	 * This callback is optional, if not implemented the bridge will be
+	 * considered as always having a component attached to its output.
+	 * Bridges that implement this callback shall set the
+	 * DRM_BRIDGE_OP_DETECT flag in their &drm_bridge->ops.
+	 *
+	 * RETURNS:
+	 *
+	 * drm_connector_status indicating the bridge output status.
+	 */
+	enum drm_connector_status (*detect)(struct drm_bridge *bridge);
+
+	/**
+	 * @get_modes:
+	 *
+	 * Fill all modes currently valid for the sink into the &drm_connector
+	 * with drm_mode_probed_add().
+	 *
+	 * The @get_modes callback is mostly intended to support non-probeable
+	 * displays such as many fixed panels. Bridges that support reading
+	 * EDID shall leave @get_modes unimplemented and implement the
+	 * &drm_bridge_funcs->get_edid callback instead.
+	 *
+	 * This callback is optional. Bridges that implement it shall set the
+	 * DRM_BRIDGE_OP_MODES flag in their &drm_bridge->ops.
+	 *
+	 * The connector parameter shall be used for the sole purpose of
+	 * filling modes, and shall not be stored internally by bridge drivers
+	 * for future usage.
+	 *
+	 * RETURNS:
+	 *
+	 * The number of modes added by calling drm_mode_probed_add().
+	 */
+	int (*get_modes)(struct drm_bridge *bridge,
+			 struct drm_connector *connector);
+
+	/**
+	 * @get_edid:
+	 *
+	 * Read and parse the EDID data of the connected display.
+	 *
+	 * The @get_edid callback is the preferred way of reporting mode
+	 * information for a display connected to the bridge output. Bridges
+	 * that support reading EDID shall implement this callback and leave
+	 * the @get_modes callback unimplemented.
+	 *
+	 * The caller of this operation shall first verify the output
+	 * connection status and refrain from reading EDID from a disconnected
+	 * output.
+	 *
+	 * This callback is optional. Bridges that implement it shall set the
+	 * DRM_BRIDGE_OP_EDID flag in their &drm_bridge->ops.
+	 *
+	 * The connector parameter shall be used for the sole purpose of EDID
+	 * retrieval and parsing, and shall not be stored internally by bridge
+	 * drivers for future usage.
+	 *
+	 * RETURNS:
+	 *
+	 * An edid structure newly allocated with kmalloc() (or similar) on
+	 * success, or NULL otherwise. The caller is responsible for freeing
+	 * the returned edid structure with kfree().
+	 */
+	struct edid *(*get_edid)(struct drm_bridge *bridge,
+				 struct drm_connector *connector);
+
+	/**
+	 * @hpd_notify:
+	 *
+	 * Notify the bridge of hot plug detection.
+	 *
+	 * This callback is optional, it may be implemented by bridges that
+	 * need to be notified of display connection or disconnection for
+	 * internal reasons. One use case is to reset the internal state of CEC
+	 * controllers for HDMI bridges.
+	 */
+	void (*hpd_notify)(struct drm_bridge *bridge,
+			   enum drm_connector_status status);
+
+	/**
+	 * @hpd_enable:
+	 *
+	 * Enable hot plug detection. From now on the bridge shall call
+	 * drm_bridge_hpd_notify() each time a change is detected in the output
+	 * connection status, until hot plug detection gets disabled with
+	 * @hpd_disable.
+	 *
+	 * This callback is optional and shall only be implemented by bridges
+	 * that support hot-plug notification without polling. Bridges that
+	 * implement it shall also implement the @hpd_disable callback and set
+	 * the DRM_BRIDGE_OP_HPD flag in their &drm_bridge->ops.
+	 */
+	void (*hpd_enable)(struct drm_bridge *bridge);
+
+	/**
+	 * @hpd_disable:
+	 *
+	 * Disable hot plug detection. Once this function returns the bridge
+	 * shall not call drm_bridge_hpd_notify() when a change in the output
+	 * connection status occurs.
+	 *
+	 * This callback is optional and shall only be implemented by bridges
+	 * that support hot-plug notification without polling. Bridges that
+	 * implement it shall also implement the @hpd_enable callback and set
+	 * the DRM_BRIDGE_OP_HPD flag in their &drm_bridge->ops.
+	 */
+	void (*hpd_disable)(struct drm_bridge *bridge);
 };
 
 /**
@@ -376,6 +494,39 @@ struct drm_bridge_timings {
 	bool dual_link;
 };
 
+/**
+ * enum drm_bridge_ops - Bitmask of operations supported by the bridge
+ */
+enum drm_bridge_ops {
+	/**
+	 * @DRM_BRIDGE_OP_DETECT: The bridge can detect displays connected to
+	 * its output. Bridges that set this flag shall implement the
+	 * &drm_bridge_funcs->detect callback.
+	 */
+	DRM_BRIDGE_OP_DETECT = BIT(0),
+	/**
+	 * @DRM_BRIDGE_OP_EDID: The bridge can retrieve the EDID of the display
+	 * connected to its output. Bridges that set this flag shall implement
+	 * the &drm_bridge_funcs->get_edid callback.
+	 */
+	DRM_BRIDGE_OP_EDID = BIT(1),
+	/**
+	 * @DRM_BRIDGE_OP_HPD: The bridge can detect hot-plug and hot-unplug
+	 * without requiring polling. Bridges that set this flag shall
+	 * implement the &drm_bridge_funcs->hpd_enable and
+	 * &drm_bridge_funcs->hpd_disable callbacks if they support enabling
+	 * and disabling hot-plug detection dynamically.
+	 */
+	DRM_BRIDGE_OP_HPD = BIT(2),
+	/**
+	 * @DRM_BRIDGE_OP_MODES: The bridge can retrieve the modes supported
+	 * by the display at its output. This does not include reading EDID
+	 * which is separately covered by @DRM_BRIDGE_OP_EDID. Bridges that set
+	 * this flag shall implement the &drm_bridge_funcs->get_modes callback.
+	 */
+	DRM_BRIDGE_OP_MODES = BIT(3),
+};
+
 /**
  * struct drm_bridge - central DRM bridge control structure
  */
@@ -402,6 +553,33 @@ struct drm_bridge {
 	const struct drm_bridge_funcs *funcs;
 	/** @driver_private: pointer to the bridge driver's internal context */
 	void *driver_private;
+	/** @ops: bitmask of operations supported by the bridge */
+	enum drm_bridge_ops ops;
+	/**
+	 * @type: Type of the connection at the bridge output
+	 * (DRM_MODE_CONNECTOR_*). For bridges at the end of this chain this
+	 * identifies the type of connected display.
+	 */
+	int type;
+	/**
+	 * @ddc: Associated I2C adapter for DDC access, if any.
+	 */
+	struct i2c_adapter *ddc;
+	/** private: */
+	/**
+	 * @hpd_mutex: Protects the @hpd_cb and @hpd_data fields.
+	 */
+	struct mutex hpd_mutex;
+	/**
+	 * @hpd_cb: Hot plug detection callback, registered with
+	 * drm_bridge_hpd_enable().
+	 */
+	void (*hpd_cb)(void *data, enum drm_connector_status status);
+	/**
+	 * @hpd_data: Private data passed to the Hot plug detection callback
+	 * @hpd_cb.
+	 */
+	void *hpd_data;
 };
 
 void drm_bridge_add(struct drm_bridge *bridge);
@@ -491,6 +669,19 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
 void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
 				    struct drm_atomic_state *state);
 
+enum drm_connector_status drm_bridge_detect(struct drm_bridge *bridge);
+int drm_bridge_get_modes(struct drm_bridge *bridge,
+			 struct drm_connector *connector);
+struct edid *drm_bridge_get_edid(struct drm_bridge *bridge,
+				 struct drm_connector *connector);
+void drm_bridge_hpd_enable(struct drm_bridge *bridge,
+			   void (*cb)(void *data,
+				      enum drm_connector_status status),
+			   void *data);
+void drm_bridge_hpd_disable(struct drm_bridge *bridge);
+void drm_bridge_hpd_notify(struct drm_bridge *bridge,
+			   enum drm_connector_status status);
+
 #ifdef CONFIG_DRM_PANEL_BRIDGE
 struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel);
 struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
