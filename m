Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF45664EE75
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 17:02:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0172710E5FD;
	Fri, 16 Dec 2022 16:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF0010E5F1;
 Fri, 16 Dec 2022 16:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671206486; x=1702742486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4oJOE1duKyaPfojj2u9q/LqljUlzPFTIIfR6eL5/2K4=;
 b=OPYt0ID16pHaUqxUEJSC6Gb0a/Yne0rQIRwbonweuu751cmoic2zUcL9
 iNbqz8rrxa6lCM0z7kJObiNJfEAHY77vE5WVtNUBALIgjy1dftNFNYJ26
 aDZQxquVASA26kHImtbhhtVskmy447nLYnrphFaSKtHL6YYceAX+xc8v+
 LCOHDQ7bPf07LFuEFA9rscvay1xztzmos1flJDXmrqDxPdTSFDzIHxPGc
 0AIyZ7uijSSF9bSHniaRRvw70TpvutQEMjy79FBcFSN2+7yvBU4DeFEwH
 WbFWng4L8IUrXvdkqtDpDU2qBL12Rd8jThtUN9nWlGeykTgdDsuhYvjqR g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="298665600"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="298665600"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 08:01:04 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="718399833"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="718399833"
Received: from fbielich-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.62.38])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 08:01:02 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 07/12] drm/edid: add separate drm_edid_connector_add_modes()
Date: Fri, 16 Dec 2022 18:00:21 +0200
Message-Id: <370b44e4fee1759bbbb706fc47eefda746c3f510.1671206131.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1671206131.git.jani.nikula@intel.com>
References: <cover.1671206131.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The original goal with drm_edid_connector_update() was to have a single
call for updating the connector and adding probed modes, in this order,
but that turned out to be problematic. Drivers that need to update the
connector in the .detect() callback would end up updating the probed
modes as well. Turns out the callback may be called so many times that
the probed mode list fills up without bounds, and this is amplified by
add_alternate_cea_modes() duplicating the CEA modes on every call,
actually running out of memory on some machines.

Kudos to Imre Deak <imre.deak@intel.com> for explaining this to me.

Go back to having separate drm_edid_connector_update() and
drm_edid_connector_add_modes() calls. The former may be called from
.detect(), .force(), or .get_modes(), but the latter only from
.get_modes().

Unlike drm_add_edid_modes(), have drm_edid_connector_add_modes() update
the probed modes from the EDID property instead of the passed in
EDID. This is mainly to enforce two things:

1) drm_edid_connector_update() must be called before
   drm_edid_connector_add_modes().

   Display info and quirks are needed for parsing the modes, and we
   don't want to call update_display_info() again to ensure the info is
   available, like drm_add_edid_modes() does.

2) The same EDID is used for both updating the connector and adding the
   probed modes.

Fortunately, the change is easy, because no driver has actually adopted
drm_edid_connector_update(). Not even i915, and that's mainly because of
the problem described above.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c         | 44 +++++++++++++++++++++++-------
 drivers/gpu/drm/drm_probe_helper.c |  4 ++-
 include/drm/drm_edid.h             |  2 ++
 3 files changed, 39 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 4ebfd7212bce..8bbd4662468e 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6673,30 +6673,54 @@ static int _drm_edid_connector_property_update(struct drm_connector *connector,
  * @connector: Connector
  * @drm_edid: EDID
  *
- * Update the connector mode list, display info, ELD, HDR metadata, relevant
- * properties, etc. from the passed in EDID.
+ * Update the connector display info, ELD, HDR metadata, relevant properties,
+ * etc. from the passed in EDID.
  *
  * If EDID is NULL, reset the information.
  *
- * Return: The number of modes added or 0 if we couldn't find any.
+ * Must be called before calling drm_edid_connector_add_modes().
+ *
+ * Return: 0 on success, negative error on errors.
  */
 int drm_edid_connector_update(struct drm_connector *connector,
 			      const struct drm_edid *drm_edid)
 {
+	update_display_info(connector, drm_edid);
+
+	_drm_update_tile_info(connector, drm_edid);
+
+	return _drm_edid_connector_property_update(connector, drm_edid);
+}
+EXPORT_SYMBOL(drm_edid_connector_update);
+
+/**
+ * drm_edid_connector_add_modes - Update probed modes from the EDID property
+ * @connector: Connector
+ *
+ * Add the modes from the previously updated EDID property to the connector
+ * probed modes list.
+ *
+ * drm_edid_connector_update() must have been called before this to update the
+ * EDID property.
+ *
+ * Return: The number of modes added, or 0 if we couldn't find any.
+ */
+int drm_edid_connector_add_modes(struct drm_connector *connector)
+{
+	const struct drm_edid *drm_edid = NULL;
 	int count;
 
-	update_display_info(connector, drm_edid);
+	if (connector->edid_blob_ptr)
+		drm_edid = drm_edid_alloc(connector->edid_blob_ptr->data,
+					  connector->edid_blob_ptr->length);
 
 	count = _drm_edid_connector_add_modes(connector, drm_edid);
 
-	_drm_update_tile_info(connector, drm_edid);
-
-	/* Note: Ignore errors for now. */
-	_drm_edid_connector_property_update(connector, drm_edid);
+	drm_edid_free(drm_edid);
 
 	return count;
 }
-EXPORT_SYMBOL(drm_edid_connector_update);
+EXPORT_SYMBOL(drm_edid_connector_add_modes);
 
 static int _drm_connector_update_edid_property(struct drm_connector *connector,
 					       const struct drm_edid *drm_edid)
@@ -6751,7 +6775,7 @@ EXPORT_SYMBOL(drm_connector_update_edid_property);
  * &drm_display_info structure and ELD in @connector with any information which
  * can be derived from the edid.
  *
- * This function is deprecated. Use drm_edid_connector_update() instead.
+ * This function is deprecated. Use drm_edid_connector_add_modes() instead.
  *
  * Return: The number of modes added or 0 if we couldn't find any.
  */
diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 1ea053cef557..26844befc6f5 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -1139,7 +1139,9 @@ int drm_connector_helper_get_modes(struct drm_connector *connector)
 	 * EDID. Otherwise, if the EDID is NULL, clear the connector
 	 * information.
 	 */
-	count = drm_edid_connector_update(connector, drm_edid);
+	drm_edid_connector_update(connector, drm_edid);
+
+	count = drm_edid_connector_add_modes(connector);
 
 	drm_edid_free(drm_edid);
 
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 372963600f1d..70ae6c290bdc 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -609,6 +609,8 @@ const struct drm_edid *drm_edid_read_custom(struct drm_connector *connector,
 					    void *context);
 int drm_edid_connector_update(struct drm_connector *connector,
 			      const struct drm_edid *edid);
+int drm_edid_connector_add_modes(struct drm_connector *connector);
+
 const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
 				  int ext_id, int *ext_index);
 
-- 
2.34.1

