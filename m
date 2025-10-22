Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CF6BFD320
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 18:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0EFB10E803;
	Wed, 22 Oct 2025 16:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="GTGJbVJu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8963910E803
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 16:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761150524;
 bh=Q+AaMNPpBhoLkNmasyi9CSyLqLYIfSX4ogAb6I43G9o=;
 h=From:To:Cc:Subject:Date:From;
 b=GTGJbVJu26FF6/CqoySvn2CI8miap0wKAjsoHPJupckC1VWqevAp95BsxYMyo7cGi
 szIqDIWyQnAi6gQT4S7BvyVWd/zMf3SzAQ000vLqMpIsf6EgetKFnf0dhvhHIbUbuN
 A9EKMGV57eL0jqCkTZq2kzwEpuu/+emqt03Le35b4lxbz71G1qtPPTJsZcwHHLVAOb
 wk13KryGJob+cBhIY4zZiyevTldFn6ipNrhXZIXBmrNr5hVwogVYjbEX4vOqKe2eFY
 ooTYA09QMa5RLj4+YZBmIzpORxbTETpPGtNz+SVGMHBxNHMc8j0eTqwJg+nKZ4HRQ0
 pmvPG11mZ9gqg==
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f08:e41c:5800:ae0b:2cea:42d3:7552])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D5A7117E108C;
 Wed, 22 Oct 2025 18:28:43 +0200 (CEST)
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: dmitry.baryshkov@oss.qualcomm.com, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, tzimmermann@suse.de, simona.vetter@ffwll.ch,
 michel.daenzer@mailbox.org, derek.foreman@collabora.com,
 daniel.stone@collabora.com
Subject: [PATCH v3] drm/connector: hdmi: Add a 'link bpc' property
Date: Wed, 22 Oct 2025 19:28:43 +0300
Message-ID: <20251022162843.1759-1-marius.vlad@collabora.com>
X-Mailer: git-send-email 2.47.2
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

From: Derek Foreman <derek.foreman@collabora.com>

Add a way to know the actual bpc of a running link.

Drivers might change the current bpc link value due to changes in mode
line or refresh rates. An example can be found when switching the color
output format, part of YUV420 fallback.

This means we might be displaying a stale bpc value although it was
modified for different reasons -- like a refresh rate or an output
color format.

Introduces a new property 'link bpc' that user-space can use to get the
current bpc value of a running link while in the same time allow
user-space to set-up bpc using 'max bpc' property.

An implementation for Weston [1] and a simple test for i-g-t [2] have been added.

Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
Signed-off-by: Marius Vlad <marius.vlad@collabora.com>

[1] https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1850
[2] https://lists.freedesktop.org/archives/igt-dev/2025-October/097061.html

Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
---

v1:
- https://lore.kernel.org/dri-devel/20250801101750.1726-1-marius.vlad@collabora.com/T/#u

v2:
- replace return with EBUSY if connector already exists (Dmitry)
- add i-g-t test and an implementation for Weston (Dmitry)
- re-wording patch description (Jani)
- https://lore.kernel.org/dri-devel/20251006083043.3115-1-marius.vlad@collabora.com/

v3:
- remove VRR mention from commit description (Ville)
- add DRM_MODE_PROP_IMMUTABLE to flags (Ville)
- provide helpers functions for drivers to use (can be used by other
  types of connectors, not just HDMI)
- send uevent informating userspace when 'link bpc' connector state
  changed (Daniel @ https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1850)
- added missing doc entry

 .../gpu/drm/display/drm_hdmi_state_helper.c   |   3 +
 drivers/gpu/drm/drm_atomic_uapi.c             |   2 +
 drivers/gpu/drm/drm_connector.c               | 125 ++++++++++++++++++
 include/drm/drm_connector.h                   |  32 +++++
 4 files changed, 162 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index a561f124be99..a728b43bdf05 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -866,6 +866,9 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 		crtc_state->mode_changed = true;
 	}
 
+	drm_connector_update_link_bpc_state(connector,
+					    new_conn_state->hdmi.output_bpc);
+
 	return 0;
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 85dbdaa4a2e2..ab43ffcc6c71 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -865,6 +865,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 		*val = state->privacy_screen_sw_state;
 	} else if (property == connector->broadcast_rgb_property) {
 		*val = state->hdmi.broadcast_rgb;
+	} else if (property == connector->link_bpc_property) {
+		*val = state->link_bpc;
 	} else if (connector->funcs->atomic_get_property) {
 		return connector->funcs->atomic_get_property(connector,
 				state, property, val);
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 272d6254ea47..4eca0d9c0a97 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -87,6 +87,28 @@ struct drm_conn_prop_enum_list {
 	struct ida ida;
 };
 
+static void
+link_bpc_wq_callback(struct work_struct *work)
+{
+	struct delayed_work *dwork;
+	struct link_bpc_wq *link_bpc;
+	struct drm_connector *connector;
+	struct drm_device *drm_dev;
+
+	dwork = to_delayed_work(work);
+	link_bpc = container_of(dwork, struct link_bpc_wq, d_work);
+	connector = container_of(link_bpc, struct drm_connector, link_bpc);
+	drm_dev = connector->dev;
+
+	drm_modeset_lock(&drm_dev->mode_config.connection_mutex, NULL);
+	mutex_lock(&connector->link_bpc.lock);
+
+	drm_connector_update_link_bpc_property(connector);
+
+	mutex_unlock(&connector->link_bpc.lock);
+	drm_modeset_unlock(&drm_dev->mode_config.connection_mutex);
+}
+
 /*
  * Connector and encoder types.
  */
@@ -292,6 +314,14 @@ static int drm_connector_init_only(struct drm_device *dev,
 	connector->display_info.panel_orientation =
 		DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
 
+	mutex_init(&connector->link_bpc.lock);
+	INIT_DELAYED_WORK(&connector->link_bpc.d_work, link_bpc_wq_callback);
+	connector->link_bpc.wq = create_workqueue("link bpc workqueue");
+	if (!connector->link_bpc.wq) {
+		dev_err(dev->dev, "Failed to create work queue\n");
+		return -ENOMEM;
+	}
+
 	drm_connector_get_cmdline_mode(connector);
 
 	if (connector_type != DRM_MODE_CONNECTOR_VIRTUAL &&
@@ -542,6 +572,85 @@ int drmm_connector_init(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drmm_connector_init);
 
+/**
+ * drm_connector_attach_link_bpc_property - create and attach 'link bpc' property
+ * @connector: drm connector
+ * @max_bpc: specify the upper limit, matching  that of 'max bpc' property
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int
+drm_connector_attach_link_bpc_property(struct drm_connector *connector,
+				       unsigned int max_bpc)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_property *prop;
+
+	if (connector->link_bpc_property)
+		return -EBUSY;
+
+	prop = drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE, "link bpc", 8, max_bpc);
+	if (!prop)
+		return -ENOMEM;
+
+	connector->link_bpc_property = prop;
+
+	drm_object_attach_property(&connector->base, prop, max_bpc);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_connector_attach_link_bpc_property);
+
+/**
+ * drm_connector_update_link_bpc_property - update the 'link bpc' property of a connector
+ * @connector: drm connector
+ *
+ * This sends a uevent to userspace to notify about the fact that 'link bpc'
+ * has been updated.
+ */
+void
+drm_connector_update_link_bpc_property(struct drm_connector *connector)
+{
+	struct drm_connector_state *state = connector->state;
+
+	if (!connector->link_bpc_property)
+		return;
+
+	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] Setting state link bpc %u\n",
+				     connector->base.id, connector->name, state->link_bpc);
+	drm_object_property_set_value(&connector->base,
+				      connector->link_bpc_property,
+				      state->link_bpc);
+
+	drm_sysfs_connector_property_event(connector,
+					   connector->link_bpc_property);
+}
+EXPORT_SYMBOL(drm_connector_update_link_bpc_property);
+
+/**
+ * drm_connector_update_link_bpc_state - update the 'link bpc' connector state
+ * @connector: drm connector
+ * @val: new value for the 'link bpc' property
+ *
+ */
+void
+drm_connector_update_link_bpc_state(struct drm_connector *connector, u8 val)
+{
+	struct drm_connector_state *state = connector->state;
+
+	if (!connector->link_bpc_property)
+		return;
+
+	if (state->link_bpc == val)
+		return;
+
+	state->link_bpc = val;
+	queue_delayed_work(connector->link_bpc.wq,
+			   &connector->link_bpc.d_work, msecs_to_jiffies(1000));
+}
+EXPORT_SYMBOL(drm_connector_update_link_bpc_state);
+
 /**
  * drmm_connector_hdmi_init - Init a preallocated HDMI connector
  * @dev: DRM device
@@ -618,6 +727,10 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	drm_connector_attach_max_bpc_property(connector, 8, max_bpc);
 	connector->max_bpc = max_bpc;
 
+	ret = drm_connector_attach_link_bpc_property(connector, max_bpc);
+	if (ret)
+		return ret;
+
 	if (max_bpc > 8)
 		drm_connector_attach_hdr_output_metadata_property(connector);
 
@@ -802,6 +915,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
 	mutex_destroy(&connector->hdmi_audio.lock);
 	mutex_destroy(&connector->hdmi.infoframes.lock);
 	mutex_destroy(&connector->mutex);
+	mutex_destroy(&connector->link_bpc.lock);
+	destroy_workqueue(connector->link_bpc.wq);
 
 	memset(connector, 0, sizeof(*connector));
 
@@ -1699,6 +1814,16 @@ EXPORT_SYMBOL(drm_hdmi_connector_get_output_format_name);
  *	drm_connector_attach_max_bpc_property() to create and attach the
  *	property to the connector during initialization.
  *
+ * link bpc:
+ *	This immutable range property can be used by userspace to determine the
+ *	current link bit depth. Drivers can use
+ *	drm_connector_attach_link_bpc_property() to create and attach the
+ *	property to the connector during initialization and
+ *	drm_connector_update_link_bpc_state() to update the property and to
+ *	queue an uevent with the new 'link bpc' value.
+ *	Userspace can determine if the driver made bpc modifications by
+ *	checking 'max bpc' against the 'link bpc' property.
+ *
  * Connectors also have one standardized atomic property:
  *
  * CRTC_ID:
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 8f34f4b8183d..678875b1441b 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1132,6 +1132,11 @@ struct drm_connector_state {
 	 */
 	u8 max_bpc;
 
+	/*
+	 * @link_bpc: Current link bpc
+	 */
+	u8 link_bpc;
+
 	/**
 	 * @privacy_screen_sw_state: See :ref:`Standard Connector
 	 * Properties<standard_connector_properties>`
@@ -1882,6 +1887,16 @@ struct drm_connector_cec {
 	void *data;
 };
 
+/*
+ * struct link_bpc_wq - holds the necessary bits to queue uevents for
+ * propagating 'link bpc' connector updates
+ */
+struct link_bpc_wq {
+	struct workqueue_struct *wq;
+	struct delayed_work d_work;
+	struct mutex lock;
+};
+
 /**
  * struct drm_connector - central DRM connector control structure
  *
@@ -2079,6 +2094,19 @@ struct drm_connector {
 	 */
 	struct drm_property *max_bpc_property;
 
+	/**
+	 * @link_bpc_property: Current connector link bpc set by the driver
+	 * This property can be used to store the current link bpc.
+	 */
+	struct drm_property *link_bpc_property;
+
+	/**
+	 * @link_bpc_wq: workqueue for sending uevent to userspace with updated
+	 * 'link bpc' value
+	 */
+	struct link_bpc_wq link_bpc;
+
+
 	/** @privacy_screen: drm_privacy_screen for this connector, or NULL. */
 	struct drm_privacy_screen *privacy_screen;
 
@@ -2488,6 +2516,10 @@ void drm_connector_attach_privacy_screen_provider(
 	struct drm_connector *connector, struct drm_privacy_screen *priv);
 void drm_connector_update_privacy_screen(const struct drm_connector_state *connector_state);
 
+int drm_connector_attach_link_bpc_property(struct drm_connector *connector, unsigned int max_bpc);
+void drm_connector_update_link_bpc_property(struct drm_connector *connector);
+void drm_connector_update_link_bpc_state(struct drm_connector *connector, u8 val);
+
 /**
  * struct drm_tile_group - Tile group metadata
  * @refcount: reference count
-- 
2.47.2

