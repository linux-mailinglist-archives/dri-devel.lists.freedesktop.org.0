Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9B855457C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 12:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726D010E6DE;
	Wed, 22 Jun 2022 10:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 347F010E6DE;
 Wed, 22 Jun 2022 10:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655895580; x=1687431580;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VgBffwn+76T+e+a/Oss/WvpC3Qtc/8jnlhYMnf3aJCM=;
 b=j8pcFSlRiCISrBrGoIyE8rIYXzvA0kIKbcLc/62f4ugH/rIZilYc9K7e
 3fMONVhZzsdxDFFJjfWOkbFMkhU0PK3R5RH9GU1fTlyjL9lZ8OrPwgebg
 rJA0BgP7lAlV+CgGuuSXqNI0mM3unuqmPOT8klIkxQGb6FdN4KSfn9/au
 yTkLtn2xGdViUvq9mWf7DBTVawblBkbpH7d+DRZ1+2JUv/f+KOk+4Vupz
 IpiHCHknBt1k9uE+qBoUNxQkGUtf0YZAJbtJoSPq51RflGIPaYRvQLGYL
 UU95sxKDZJbTmo7OPGB6Fjq6+DPQZnOWLar+GFlbVY8nHkZwL9Tvlw0mE A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="263420357"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="263420357"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 03:59:39 -0700
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="592136757"
Received: from snowacki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.111])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 03:59:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 02/13] drm/edid: convert
 drm_connector_update_edid_property() to struct drm_edid
Date: Wed, 22 Jun 2022 13:59:16 +0300
Message-Id: <32d64f6e47ac761b003711ab5f13c2a9edebfed6.1655895388.git.jani.nikula@intel.com>
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

Make drm_connector_update_edid_property() a thin wrapper around a struct
drm_edid based version of the same.

This lets us remove the legacy drm_update_tile_info() and
drm_add_display_info() functions altogether.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 81 ++++++++++++++++----------------------
 1 file changed, 35 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 36bf7b0fe8d9..62967db78139 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6042,14 +6042,6 @@ static u32 update_display_info(struct drm_connector *connector,
 	return quirks;
 }
 
-static u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edid)
-{
-	struct drm_edid drm_edid;
-
-	return update_display_info(connector,
-				   drm_edid_legacy_init(&drm_edid, edid));
-}
-
 static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *dev,
 							    struct displayid_detailed_timings_1 *timings,
 							    bool type_7)
@@ -6206,38 +6198,19 @@ static int drm_edid_connector_update(struct drm_connector *connector,
 	return num_modes;
 }
 
-static void drm_update_tile_info(struct drm_connector *connector,
-				 const struct edid *edid);
+static void _drm_update_tile_info(struct drm_connector *connector,
+				  const struct drm_edid *drm_edid);
 
-/**
- * drm_connector_update_edid_property - update the edid property of a connector
- * @connector: drm connector
- * @edid: new value of the edid property
- *
- * This function creates a new blob modeset object and assigns its id to the
- * connector's edid property.
- * Since we also parse tile information from EDID's displayID block, we also
- * set the connector's tile property here. See drm_connector_set_tile_property()
- * for more details.
- *
- * Returns:
- * Zero on success, negative errno on failure.
- */
-int drm_connector_update_edid_property(struct drm_connector *connector,
-				       const struct edid *edid)
+static int _drm_connector_update_edid_property(struct drm_connector *connector,
+					       const struct drm_edid *drm_edid)
 {
 	struct drm_device *dev = connector->dev;
-	size_t size = 0;
 	int ret;
-	const struct edid *old_edid;
 
 	/* ignore requests to set edid when overridden */
 	if (connector->override_edid)
 		return 0;
 
-	if (edid)
-		size = EDID_LENGTH * (1 + edid->extensions);
-
 	/*
 	 * Set the display info, using edid if available, otherwise resetting
 	 * the values to defaults. This duplicates the work done in
@@ -6246,17 +6219,18 @@ int drm_connector_update_edid_property(struct drm_connector *connector,
 	 * that it seems better to duplicate it rather than attempt to ensure
 	 * some arbitrary ordering of calls.
 	 */
-	if (edid)
-		drm_add_display_info(connector, edid);
+	if (drm_edid)
+		update_display_info(connector, drm_edid);
 	else
 		drm_reset_display_info(connector);
 
-	drm_update_tile_info(connector, edid);
+	_drm_update_tile_info(connector, drm_edid);
 
 	if (connector->edid_blob_ptr) {
-		old_edid = (const struct edid *)connector->edid_blob_ptr->data;
+		const struct edid *old_edid = connector->edid_blob_ptr->data;
+
 		if (old_edid) {
-			if (!drm_edid_are_equal(edid, old_edid)) {
+			if (!drm_edid_are_equal(drm_edid ? drm_edid->edid : NULL, old_edid)) {
 				DRM_DEBUG_KMS("[CONNECTOR:%d:%s] Edid was changed.\n",
 					      connector->base.id, connector->name);
 
@@ -6273,14 +6247,37 @@ int drm_connector_update_edid_property(struct drm_connector *connector,
 
 	ret = drm_property_replace_global_blob(dev,
 					       &connector->edid_blob_ptr,
-					       size,
-					       edid,
+					       drm_edid ? drm_edid->size : 0,
+					       drm_edid ? drm_edid->edid : NULL,
 					       &connector->base,
 					       dev->mode_config.edid_property);
 	if (ret)
 		return ret;
 	return drm_connector_set_tile_property(connector);
 }
+
+/**
+ * drm_connector_update_edid_property - update the edid property of a connector
+ * @connector: drm connector
+ * @edid: new value of the edid property
+ *
+ * This function creates a new blob modeset object and assigns its id to the
+ * connector's edid property.
+ * Since we also parse tile information from EDID's displayID block, we also
+ * set the connector's tile property here. See drm_connector_set_tile_property()
+ * for more details.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_connector_update_edid_property(struct drm_connector *connector,
+				       const struct edid *edid)
+{
+	struct drm_edid drm_edid;
+
+	return _drm_connector_update_edid_property(connector,
+						   drm_edid_legacy_init(&drm_edid, edid));
+}
 EXPORT_SYMBOL(drm_connector_update_edid_property);
 
 /**
@@ -6720,11 +6717,3 @@ static void _drm_update_tile_info(struct drm_connector *connector,
 		connector->tile_group = NULL;
 	}
 }
-
-static void drm_update_tile_info(struct drm_connector *connector,
-				 const struct edid *edid)
-{
-	struct drm_edid drm_edid;
-
-	_drm_update_tile_info(connector, drm_edid_legacy_init(&drm_edid, edid));
-}
-- 
2.30.2

