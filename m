Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3D6206D29
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 08:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24AF6E7F1;
	Wed, 24 Jun 2020 06:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EAF188AA0;
 Wed, 24 Jun 2020 06:58:05 +0000 (UTC)
IronPort-SDR: nIsaUiaKiaFteosNwrCPiE7QnwtJZBMNc/IxtIxAZR3N4RkJPvk6DkVNwRojJxeGCs4O2HN0PO
 9W5eEESuCKzA==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="132782661"
X-IronPort-AV: E=Sophos;i="5.75,274,1589266800"; d="scan'208";a="132782661"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 23:58:04 -0700
IronPort-SDR: Fs6Uac2YMqtx5YMLNsgvAIMEvm2DBTRQaCzDjPg+uXuWZ4kK8CdLX4tuZpJboA89fduKWo8WCD
 moUQmkdSM9+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,274,1589266800"; d="scan'208";a="301525073"
Received: from unknown (HELO joshikun.iind.intel.com) ([10.223.74.209])
 by fmsmga004.fm.intel.com with ESMTP; 23 Jun 2020 23:58:02 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 2/3] drm: Introduce epoch counter to drm_connector
Date: Wed, 24 Jun 2020 00:27:55 +0530
Message-Id: <20200623185756.19502-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623185756.19502-1-kunal1.joshi@intel.com>
References: <20200623185756.19502-1-kunal1.joshi@intel.com>
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
Cc: stanislav.lisovskiy@intel.com, daniel.vetter@intel.com,
 arkadiusz.hiler@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

This counter will be used by drm_helper_probe_detect caller to determine
if anything had changed(including edid, connection status and etc).
Hardware specific driver detect hooks are responsible for updating this
counter when some change is detected to notify the drm part,
which can trigger for example hotplug event.

Also now call drm_connector_update_edid_property
right after we get edid always to make sure there is a
unified way to handle edid change, without having to
change tons of source code as currently
drm_connector_update_edid_property is called only in
certain cases like reprobing and not right after edid is
actually updated.

v2: Added documentation for the new counter. Rename change_counter to
    epoch_counter.

Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=105540

Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 drivers/gpu/drm/drm_connector.c    | 16 +++++++++++++
 drivers/gpu/drm/drm_edid.c         |  6 ++++-
 drivers/gpu/drm/drm_probe_helper.c | 38 ++++++++++++++++++++++++++----
 include/drm/drm_connector.h        |  2 ++
 4 files changed, 56 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index b7bd46033807..332686297e45 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -269,6 +269,7 @@ int drm_connector_init(struct drm_device *dev,
 	INIT_LIST_HEAD(&connector->modes);
 	mutex_init(&connector->mutex);
 	connector->edid_blob_ptr = NULL;
+	connector->epoch_counter = 0;
 	connector->tile_blob_ptr = NULL;
 	connector->status = connector_status_unknown;
 	connector->display_info.panel_orientation =
@@ -1979,6 +1980,7 @@ int drm_connector_update_edid_property(struct drm_connector *connector,
 	struct drm_device *dev = connector->dev;
 	size_t size = 0;
 	int ret;
+	const struct edid *old_edid;
 
 	/* ignore requests to set edid when overridden */
 	if (connector->override_edid)
@@ -2002,6 +2004,20 @@ int drm_connector_update_edid_property(struct drm_connector *connector,
 
 	drm_update_tile_info(connector, edid);
 
+	if (connector->edid_blob_ptr) {
+		old_edid = (const struct edid *)connector->edid_blob_ptr->data;
+		if (old_edid) {
+			if (!drm_edid_are_equal(edid, old_edid)) {
+				DRM_DEBUG_KMS("[CONNECTOR:%d:%s] Edid was changed.\n",
+				    connector->base.id, connector->name);
+
+				connector->epoch_counter += 1;
+				DRM_DEBUG_KMS("Updating change counter to %llu\n",
+				    connector->epoch_counter);
+			}
+		}
+	}
+
 	drm_object_property_set_value(&connector->base,
 				      dev->mode_config.non_desktop_property,
 				      connector->display_info.non_desktop);
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 34cabfddcdd3..d029cbd5d037 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2050,13 +2050,17 @@ EXPORT_SYMBOL(drm_probe_ddc);
 struct edid *drm_get_edid(struct drm_connector *connector,
 			  struct i2c_adapter *adapter)
 {
+	struct edid *edid;
+
 	if (connector->force == DRM_FORCE_OFF)
 		return NULL;
 
 	if (connector->force == DRM_FORCE_UNSPECIFIED && !drm_probe_ddc(adapter))
 		return NULL;
 
-	return drm_do_get_edid(connector, drm_do_probe_ddc_edid, adapter);
+	edid = drm_do_get_edid(connector, drm_do_probe_ddc_edid, adapter);
+	drm_connector_update_edid_property(connector, edid);
+	return edid;
 }
 EXPORT_SYMBOL(drm_get_edid);
 
diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 26e997f1524f..1d5f319d6213 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -290,6 +290,9 @@ drm_helper_probe_detect_ctx(struct drm_connector *connector, bool force)
 	if (WARN_ON(ret < 0))
 		ret = connector_status_unknown;
 
+	if (ret != connector->status)
+		connector->epoch_counter += 1;
+
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
 
@@ -323,11 +326,16 @@ drm_helper_probe_detect(struct drm_connector *connector,
 		return ret;
 
 	if (funcs->detect_ctx)
-		return funcs->detect_ctx(connector, ctx, force);
+		ret = funcs->detect_ctx(connector, ctx, force);
 	else if (connector->funcs->detect)
-		return connector->funcs->detect(connector, force);
+		ret = connector->funcs->detect(connector, force);
 	else
-		return connector_status_connected;
+		ret = connector_status_connected;
+
+	if (ret != connector->status)
+		connector->epoch_counter += 1;
+
+	return ret;
 }
 EXPORT_SYMBOL(drm_helper_probe_detect);
 
@@ -777,6 +785,7 @@ bool drm_helper_hpd_irq_event(struct drm_device *dev)
 	struct drm_connector_list_iter conn_iter;
 	enum drm_connector_status old_status;
 	bool changed = false;
+	uint64_t old_epoch_counter;
 
 	if (!dev->mode_config.poll_enabled)
 		return false;
@@ -790,20 +799,39 @@ bool drm_helper_hpd_irq_event(struct drm_device *dev)
 
 		old_status = connector->status;
 
+		old_epoch_counter = connector->epoch_counter;
+
+		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] Old epoch counter %llu\n", connector->base.id,
+			      connector->name,
+			      old_epoch_counter);
+
 		connector->status = drm_helper_probe_detect(connector, NULL, false);
 		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] status updated from %s to %s\n",
 			      connector->base.id,
 			      connector->name,
 			      drm_get_connector_status_name(old_status),
 			      drm_get_connector_status_name(connector->status));
-		if (old_status != connector->status)
+
+		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] New epoch counter %llu\n",
+			      connector->base.id,
+			      connector->name,
+			      connector->epoch_counter);
+
+		/*
+		 * Check if epoch counter had changed, meaning that we need
+		 * to send a uevent.
+		 */
+		if (old_epoch_counter != connector->epoch_counter) {
 			changed = true;
+		}
 	}
 	drm_connector_list_iter_end(&conn_iter);
 	mutex_unlock(&dev->mode_config.mutex);
 
-	if (changed)
+	if (changed) {
 		drm_kms_helper_hotplug_event(dev);
+		DRM_DEBUG_KMS("Sent hotplug event\n");
+	}
 
 	return changed;
 }
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index fd543d1db9b2..20bdc16eefe2 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1329,6 +1329,8 @@ struct drm_connector {
 	enum drm_connector_force force;
 	/** @override_edid: has the EDID been overwritten through debugfs for testing? */
 	bool override_edid;
+        /** @epoch_counter: used to detect any other changes in connector, besides status */
+        uint64_t epoch_counter;
 
 	/**
 	 * @possible_encoders: Bit mask of encoders that can drive this
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
