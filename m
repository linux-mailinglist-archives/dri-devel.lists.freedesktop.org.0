Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC3A554582
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 12:59:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A7110EA0C;
	Wed, 22 Jun 2022 10:59:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FEBA10EA0C;
 Wed, 22 Jun 2022 10:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655895593; x=1687431593;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mwfybLQMLtpuXJqeAbBImixuHJEQufml4EzhgfCsPs4=;
 b=MzXUqVfg0qOxE6li44O8VkS0TLXFAlVVIwje8Hbajk4WeFpPB5JblWwc
 2g449wdD5pZo7b8oV50cgqPSxZrpQHOK2CvNTcorkQoRttkMbUlazu57d
 G6RquK58YW3o8WuFrqy6T+UDJqnSt5aaitJQAv/9oZ9rxapy3LMFKQzz0
 Ud3I2jBw9bDzg3KpxR0pZkys1IuvpuL+Iw7j6VKwpiYvBTZrUfXkP0OE5
 fmU4/8g3RTH9OqsZKp8bV1jbwOwqW50hVWlfo0NXGcRXi5bJR3TJxPl8d
 5R9U+7nFOf77b4/yw5OSo0AYSrHDYEApGpuVSvOSJUnhoHFU1TgeHnDs+ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="269105972"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="269105972"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 03:59:52 -0700
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="834059677"
Received: from snowacki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.111])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 03:59:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 05/13] drm/edid: add drm_edid_connector_update()
Date: Wed, 22 Jun 2022 13:59:19 +0300
Message-Id: <bcdc925d3a50a40714637c9bf7c71e4c534bd223.1655895388.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1655895388.git.jani.nikula@intel.com>
References: <cover.1655895388.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new function drm_edid_connector_update() to replace the
combination of calls drm_connector_update_edid_property() and
drm_add_edid_modes(). Usually they are called in the drivers in this
order, however the former needs information from the latter.

Since the new drm_edid_read*() functions no longer call the connector
updates directly, and the read and update are separated, we'll need this
new function for the connector update.

This is all in drm_edid.c simply to keep struct drm_edid opaque.

v2:
- Share code with drm_connector_update_edid_property() (Ville)
- Add comment about override EDID handling

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 103 ++++++++++++++++++++++++++++---------
 include/drm/drm_edid.h     |   2 +
 2 files changed, 81 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index c3f0f0a5a8a9..41b3de52b8f1 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6160,8 +6160,8 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
 	return num_modes;
 }
 
-static int drm_edid_connector_update(struct drm_connector *connector,
-				     const struct drm_edid *drm_edid)
+static int _drm_edid_connector_update(struct drm_connector *connector,
+				      const struct drm_edid *drm_edid)
 {
 	int num_modes = 0;
 	u32 quirks;
@@ -6227,31 +6227,12 @@ static int drm_edid_connector_update(struct drm_connector *connector,
 static void _drm_update_tile_info(struct drm_connector *connector,
 				  const struct drm_edid *drm_edid);
 
-static int _drm_connector_update_edid_property(struct drm_connector *connector,
+static int _drm_edid_connector_property_update(struct drm_connector *connector,
 					       const struct drm_edid *drm_edid)
 {
 	struct drm_device *dev = connector->dev;
 	int ret;
 
-	/* ignore requests to set edid when overridden */
-	if (connector->override_edid)
-		return 0;
-
-	/*
-	 * Set the display info, using edid if available, otherwise resetting
-	 * the values to defaults. This duplicates the work done in
-	 * drm_add_edid_modes, but that function is not consistently called
-	 * before this one in all drivers and the computation is cheap enough
-	 * that it seems better to duplicate it rather than attempt to ensure
-	 * some arbitrary ordering of calls.
-	 */
-	if (drm_edid)
-		update_display_info(connector, drm_edid);
-	else
-		drm_reset_display_info(connector);
-
-	_drm_update_tile_info(connector, drm_edid);
-
 	if (connector->edid_blob_ptr) {
 		const struct edid *old_edid = connector->edid_blob_ptr->data;
 
@@ -6297,6 +6278,76 @@ static int _drm_connector_update_edid_property(struct drm_connector *connector,
 	return ret;
 }
 
+/**
+ * drm_edid_connector_update - Update connector information from EDID
+ * @connector: Connector
+ * @drm_edid: EDID
+ *
+ * Update the connector mode list, display info, ELD, HDR metadata, relevant
+ * properties, etc. from the passed in EDID.
+ *
+ * If EDID is NULL, reset the information.
+ *
+ * Return: The number of modes added or 0 if we couldn't find any.
+ */
+int drm_edid_connector_update(struct drm_connector *connector,
+			      const struct drm_edid *drm_edid)
+{
+	int count;
+
+	/*
+	 * FIXME: Reconcile the differences in override_edid handling between
+	 * this and drm_connector_update_edid_property().
+	 *
+	 * If override_edid is set, and the EDID passed in here originates from
+	 * drm_edid_read() and friends, it will be the override EDID, and there
+	 * are no issues. drm_connector_update_edid_property() ignoring requests
+	 * to set the EDID dates back to a time when override EDID was not
+	 * handled at the low level EDID read.
+	 *
+	 * The only way the EDID passed in here can be different from the
+	 * override EDID is when a driver passes in an EDID that does *not*
+	 * originate from drm_edid_read() and friends, or passes in a stale
+	 * cached version. This, in turn, is a question of when an override EDID
+	 * set via debugfs should take effect.
+	 */
+
+	count = _drm_edid_connector_update(connector, drm_edid);
+
+	_drm_update_tile_info(connector, drm_edid);
+
+	/* Note: Ignore errors for now. */
+	_drm_edid_connector_property_update(connector, drm_edid);
+
+	return count;
+}
+EXPORT_SYMBOL(drm_edid_connector_update);
+
+static int _drm_connector_update_edid_property(struct drm_connector *connector,
+					       const struct drm_edid *drm_edid)
+{
+	/* ignore requests to set edid when overridden */
+	if (connector->override_edid)
+		return 0;
+
+	/*
+	 * Set the display info, using edid if available, otherwise resetting
+	 * the values to defaults. This duplicates the work done in
+	 * drm_add_edid_modes, but that function is not consistently called
+	 * before this one in all drivers and the computation is cheap enough
+	 * that it seems better to duplicate it rather than attempt to ensure
+	 * some arbitrary ordering of calls.
+	 */
+	if (drm_edid)
+		update_display_info(connector, drm_edid);
+	else
+		drm_reset_display_info(connector);
+
+	_drm_update_tile_info(connector, drm_edid);
+
+	return _drm_edid_connector_property_update(connector, drm_edid);
+}
+
 /**
  * drm_connector_update_edid_property - update the edid property of a connector
  * @connector: drm connector
@@ -6308,6 +6359,8 @@ static int _drm_connector_update_edid_property(struct drm_connector *connector,
  * set the connector's tile property here. See drm_connector_set_tile_property()
  * for more details.
  *
+ * This function is deprecated. Use drm_edid_connector_update() instead.
+ *
  * Returns:
  * Zero on success, negative errno on failure.
  */
@@ -6330,6 +6383,8 @@ EXPORT_SYMBOL(drm_connector_update_edid_property);
  * &drm_display_info structure and ELD in @connector with any information which
  * can be derived from the edid.
  *
+ * This function is deprecated. Use drm_edid_connector_update() instead.
+ *
  * Return: The number of modes added or 0 if we couldn't find any.
  */
 int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
@@ -6342,8 +6397,8 @@ int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
 		edid = NULL;
 	}
 
-	return drm_edid_connector_update(connector,
-					 drm_edid_legacy_init(&drm_edid, edid));
+	return _drm_edid_connector_update(connector,
+					  drm_edid_legacy_init(&drm_edid, edid));
 }
 EXPORT_SYMBOL(drm_add_edid_modes);
 
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 9d2d78135dee..aeb2fa95bc04 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -603,6 +603,8 @@ const struct drm_edid *drm_edid_read_ddc(struct drm_connector *connector,
 const struct drm_edid *drm_edid_read_custom(struct drm_connector *connector,
 					    int (*read_block)(void *context, u8 *buf, unsigned int block, size_t len),
 					    void *context);
+int drm_edid_connector_update(struct drm_connector *connector,
+			      const struct drm_edid *edid);
 const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
 				  int ext_id, int *ext_index);
 
-- 
2.30.2

