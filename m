Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A155327F1
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 12:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBCAE10F4C4;
	Tue, 24 May 2022 10:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D9710F4C4;
 Tue, 24 May 2022 10:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653388820; x=1684924820;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GsUMaim2T+SovhWTj3hX2mVZ52nzI/ULIdfwqmT+lmQ=;
 b=eCek2JgJ2tcUcU8YMxcG+cRtyMMznPCWvQp+mx0iHoot7SP4Vi6z6GZA
 w+PTfCDOw6ui/gE8IMzWNfEJmPNAI9YWJku7U69KM79H+W9ZRFywtnjjl
 eKCKav78gAI2uvCDL15ZWy64qI7Gjn2iohUM2jxx/lk1Sa7gwYqeXcQ5z
 kDg8SGVIZcRWZT/slGf4HgaQkgk09DfJa/EZ+80kMTg+n0uMrV+bI30f5
 PVw20qDWVHSuf5Jxsz4O5ovzaoyPJ9N/T02pjg11kGbg00nLR9jLuryFg
 32V3ZPQ+eQLidabq7qbKX7uiYmsH7MFxtXAEfPrgfqnIwu9GJ/ndqpaqh w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="273607261"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="273607261"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 03:40:19 -0700
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="745168492"
Received: from zychseba-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.136.104])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 03:40:16 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v1 04/13] drm/edid: add drm_edid_connector_update()
Date: Tue, 24 May 2022 13:39:26 +0300
Message-Id: <7feaf59054f65ab46644a976984b294b4df02586.1653381821.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1653381821.git.jani.nikula@intel.com>
References: <cover.1653381821.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, David Airlie <airlied@linux.ie>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new function drm_edid_connector_update() to replace the
combination of calls drm_connector_update_edid_property() and
drm_add_edid_modes(). Usually they are called in the drivers in this
order, however the former needs information from the latter.

This is all in drm_edid.c simply to keep struct drm_edid opaque.

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_connector.c |  2 +
 drivers/gpu/drm/drm_edid.c      | 71 +++++++++++++++++++++++++++++++--
 include/drm/drm_edid.h          |  2 +
 3 files changed, 71 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 1c48d162c77e..ae9c640a641a 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2088,6 +2088,8 @@ EXPORT_SYMBOL(drm_connector_set_tile_property);
  * set the connector's tile property here. See drm_connector_set_tile_property()
  * for more details.
  *
+ * This function is deprecated. Use drm_edid_connector_update() instead.
+ *
  * Returns:
  * Zero on success, negative errno on failure.
  */
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 0d640e7dcff7..09328298aabf 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6127,8 +6127,8 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
 	return num_modes;
 }
 
-static int drm_edid_connector_update(struct drm_connector *connector,
-				     const struct drm_edid *drm_edid)
+static int _drm_edid_connector_update(struct drm_connector *connector,
+				      const struct drm_edid *drm_edid)
 {
 	int num_modes = 0;
 	u32 quirks;
@@ -6191,6 +6191,67 @@ static int drm_edid_connector_update(struct drm_connector *connector,
 	return num_modes;
 }
 
+static void _drm_update_tile_info(struct drm_connector *connector,
+				  const struct drm_edid *drm_edid);
+
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
+	struct drm_device *dev = connector->dev;
+	const struct edid *old_edid = connector->edid_blob_ptr ?
+		connector->edid_blob_ptr->data : NULL;
+	const struct edid *edid = drm_edid ? drm_edid->edid : NULL;
+	size_t size = drm_edid ? drm_edid->size : 0;
+	int count, ret;
+
+	count = _drm_edid_connector_update(connector, drm_edid);
+
+	_drm_update_tile_info(connector, drm_edid);
+
+	if (old_edid && !drm_edid_are_equal(edid, old_edid)) {
+		connector->epoch_counter++;
+
+		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] EDID changed, epoch counter %llu\n",
+			    connector->base.id, connector->name,
+			    connector->epoch_counter);
+	}
+
+	ret = drm_property_replace_global_blob(dev, &connector->edid_blob_ptr,
+					       size, edid,
+					       &connector->base,
+					       dev->mode_config.edid_property);
+	if (ret)
+		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] EDID property update failed (%d)\n",
+			    connector->base.id, connector->name, ret);
+
+	ret = drm_object_property_set_value(&connector->base,
+					    dev->mode_config.non_desktop_property,
+					    connector->display_info.non_desktop);
+	if (ret)
+		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Non-desktop property update failed (%d)\n",
+			    connector->base.id, connector->name, ret);
+
+	ret = drm_connector_set_tile_property(connector);
+	if (ret)
+		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Tile property update failed (%d)\n",
+			    connector->base.id, connector->name, ret);
+
+	return count;
+}
+EXPORT_SYMBOL(drm_edid_connector_update);
+
 /**
  * drm_add_edid_modes - add modes from EDID data, if available
  * @connector: connector we're probing
@@ -6200,6 +6261,8 @@ static int drm_edid_connector_update(struct drm_connector *connector,
  * &drm_display_info structure and ELD in @connector with any information which
  * can be derived from the edid.
  *
+ * This function is deprecated. Use drm_edid_connector_update() instead.
+ *
  * Return: The number of modes added or 0 if we couldn't find any.
  */
 int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
@@ -6212,8 +6275,8 @@ int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
 		edid = NULL;
 	}
 
-	return drm_edid_connector_update(connector,
-					 drm_edid_legacy_init(&drm_edid, edid));
+	return _drm_edid_connector_update(connector,
+					  drm_edid_legacy_init(&drm_edid, edid));
 }
 EXPORT_SYMBOL(drm_add_edid_modes);
 
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index b729e18968dd..289b956d31ea 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -590,6 +590,8 @@ const struct drm_edid *drm_edid_read_ddc(struct drm_connector *connector,
 const struct drm_edid *drm_edid_read_custom(struct drm_connector *connector,
 					    int (*read_block)(void *context, u8 *buf, unsigned int block, size_t len),
 					    void *context);
+int drm_edid_connector_update(struct drm_connector *connector,
+			      const struct drm_edid *edid);
 const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
 				  int ext_id, int *ext_index);
 
-- 
2.30.2

