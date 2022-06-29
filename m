Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8A555FBE7
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 11:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DE411A40D;
	Wed, 29 Jun 2022 09:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B56611A3C8;
 Wed, 29 Jun 2022 09:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656494887; x=1688030887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hmuNGiitVa6cjf/Uxo5Yjtb9f0kESKlRijv2ieic1Uc=;
 b=Ivl/nIzZRVWcLM0O1YTPQkmCmZ+naREInkL/1uiTOOPxy96VqbwxQLNs
 ObXWAIN5wVRGCSvBfqiSEOSDd8rtG4+YBQu/tlmp2IoOzr6pb4isUJeNt
 l2GC5lPgWZCrjZioAiFChxlvqwAMA20cxMIu276K0IssYuslNpVWoPCg3
 mZm6lIgKM3nZiOsDY3Vwl7OGkcjj3D6yxpoav2hjQNahhmjA9gcyoL4HP
 f83cZiuesAGYGSCHPdwJ5PT9aVlvdQNlNRJLgE4a0S3jDxOvY2EY4AmXc
 UnixNL3kxy4zPJJXyuvqQK2CAgubJskbFTwfqASbxgMausJzyijV2ihAO Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="279529190"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="279529190"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 02:28:06 -0700
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="595169731"
Received: from srdoo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.102])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 02:28:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [CI RESEND 01/10] drm/edid: move drm_connector_update_edid_property()
 to drm_edid.c
Date: Wed, 29 Jun 2022 12:27:46 +0300
Message-Id: <cbabce6ffb41fdc903533f21d946e8cae0667be5.1656494768.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1656494768.git.jani.nikula@intel.com>
References: <cover.1656494768.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The function needs access to drm_edid.c internals more than
drm_connector.c. We can make drm_reset_display_info(),
drm_add_display_info() and drm_update_tile_info() static. There will be
more benefits with follow-up struct drm_edid refactoring.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_connector.c     | 74 -------------------------
 drivers/gpu/drm/drm_crtc_internal.h |  3 -
 drivers/gpu/drm/drm_edid.c          | 86 +++++++++++++++++++++++++++--
 3 files changed, 81 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index c7ca435ceb95..7b1b61183747 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2077,80 +2077,6 @@ int drm_connector_set_tile_property(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_connector_set_tile_property);
 
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
-{
-	struct drm_device *dev = connector->dev;
-	size_t size = 0;
-	int ret;
-	const struct edid *old_edid;
-
-	/* ignore requests to set edid when overridden */
-	if (connector->override_edid)
-		return 0;
-
-	if (edid)
-		size = EDID_LENGTH * (1 + edid->extensions);
-
-	/* Set the display info, using edid if available, otherwise
-	 * resetting the values to defaults. This duplicates the work
-	 * done in drm_add_edid_modes, but that function is not
-	 * consistently called before this one in all drivers and the
-	 * computation is cheap enough that it seems better to
-	 * duplicate it rather than attempt to ensure some arbitrary
-	 * ordering of calls.
-	 */
-	if (edid)
-		drm_add_display_info(connector, edid);
-	else
-		drm_reset_display_info(connector);
-
-	drm_update_tile_info(connector, edid);
-
-	if (connector->edid_blob_ptr) {
-		old_edid = (const struct edid *)connector->edid_blob_ptr->data;
-		if (old_edid) {
-			if (!drm_edid_are_equal(edid, old_edid)) {
-				DRM_DEBUG_KMS("[CONNECTOR:%d:%s] Edid was changed.\n",
-					      connector->base.id, connector->name);
-
-				connector->epoch_counter += 1;
-				DRM_DEBUG_KMS("Updating change counter to %llu\n",
-					      connector->epoch_counter);
-			}
-		}
-	}
-
-	drm_object_property_set_value(&connector->base,
-				      dev->mode_config.non_desktop_property,
-				      connector->display_info.non_desktop);
-
-	ret = drm_property_replace_global_blob(dev,
-					       &connector->edid_blob_ptr,
-					       size,
-					       edid,
-					       &connector->base,
-					       dev->mode_config.edid_property);
-	if (ret)
-		return ret;
-	return drm_connector_set_tile_property(connector);
-}
-EXPORT_SYMBOL(drm_connector_update_edid_property);
-
 /**
  * drm_connector_set_link_status_property - Set link status property of a connector
  * @connector: drm connector
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 63279e984342..aecab5308bae 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -286,6 +286,3 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
 
 /* drm_edid.c */
 void drm_mode_fixup_1366x768(struct drm_display_mode *mode);
-void drm_reset_display_info(struct drm_connector *connector);
-u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edid);
-void drm_update_tile_info(struct drm_connector *connector, const struct edid *edid);
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 2bdaf1e34a9d..36bf7b0fe8d9 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5928,8 +5928,7 @@ static void drm_update_mso(struct drm_connector *connector,
 /* A connector has no EDID information, so we've got no EDID to compute quirks from. Reset
  * all of the values which would have been set from EDID
  */
-void
-drm_reset_display_info(struct drm_connector *connector)
+static void drm_reset_display_info(struct drm_connector *connector)
 {
 	struct drm_display_info *info = &connector->display_info;
 
@@ -6043,7 +6042,7 @@ static u32 update_display_info(struct drm_connector *connector,
 	return quirks;
 }
 
-u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edid)
+static u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edid)
 {
 	struct drm_edid drm_edid;
 
@@ -6207,6 +6206,83 @@ static int drm_edid_connector_update(struct drm_connector *connector,
 	return num_modes;
 }
 
+static void drm_update_tile_info(struct drm_connector *connector,
+				 const struct edid *edid);
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
+	struct drm_device *dev = connector->dev;
+	size_t size = 0;
+	int ret;
+	const struct edid *old_edid;
+
+	/* ignore requests to set edid when overridden */
+	if (connector->override_edid)
+		return 0;
+
+	if (edid)
+		size = EDID_LENGTH * (1 + edid->extensions);
+
+	/*
+	 * Set the display info, using edid if available, otherwise resetting
+	 * the values to defaults. This duplicates the work done in
+	 * drm_add_edid_modes, but that function is not consistently called
+	 * before this one in all drivers and the computation is cheap enough
+	 * that it seems better to duplicate it rather than attempt to ensure
+	 * some arbitrary ordering of calls.
+	 */
+	if (edid)
+		drm_add_display_info(connector, edid);
+	else
+		drm_reset_display_info(connector);
+
+	drm_update_tile_info(connector, edid);
+
+	if (connector->edid_blob_ptr) {
+		old_edid = (const struct edid *)connector->edid_blob_ptr->data;
+		if (old_edid) {
+			if (!drm_edid_are_equal(edid, old_edid)) {
+				DRM_DEBUG_KMS("[CONNECTOR:%d:%s] Edid was changed.\n",
+					      connector->base.id, connector->name);
+
+				connector->epoch_counter += 1;
+				DRM_DEBUG_KMS("Updating change counter to %llu\n",
+					      connector->epoch_counter);
+			}
+		}
+	}
+
+	drm_object_property_set_value(&connector->base,
+				      dev->mode_config.non_desktop_property,
+				      connector->display_info.non_desktop);
+
+	ret = drm_property_replace_global_blob(dev,
+					       &connector->edid_blob_ptr,
+					       size,
+					       edid,
+					       &connector->base,
+					       dev->mode_config.edid_property);
+	if (ret)
+		return ret;
+	return drm_connector_set_tile_property(connector);
+}
+EXPORT_SYMBOL(drm_connector_update_edid_property);
+
 /**
  * drm_add_edid_modes - add modes from EDID data, if available
  * @connector: connector we're probing
@@ -6645,8 +6721,8 @@ static void _drm_update_tile_info(struct drm_connector *connector,
 	}
 }
 
-void drm_update_tile_info(struct drm_connector *connector,
-			  const struct edid *edid)
+static void drm_update_tile_info(struct drm_connector *connector,
+				 const struct edid *edid)
 {
 	struct drm_edid drm_edid;
 
-- 
2.30.2

