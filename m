Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1407964EE5A
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 17:01:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F30310E5E7;
	Fri, 16 Dec 2022 16:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7246D10E5E8;
 Fri, 16 Dec 2022 16:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671206439; x=1702742439;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bBMu0KzQWqmwsgptPv56CfJDfXUKdi3QxQAB0vrg5xY=;
 b=SWHY5uwoWeRYmw7NsJ8c7vajW0zGtoApL+dbgENFxvv1lLQ+G+ZZ1wtd
 LgggatFDbJpEatmQJlGSjfHvGnT4dua9qH6rPDHL9QuLaNY7/0f9wWjKg
 a1cKLnRHVWb2DX6oM7xb1BGyGsuipycnnxt6epdQxIKBmPLHu0T0+rO6m
 8KyEg75ehhMUGBsBtQzHDqcValDHz7JKVZWo3aqskbD+0+JQkzj0TGMsA
 wAkhoZQOXS4PHBAnnPLMUxhaSkPtluMbIGeVY9iw60kqXgrSrYv8LpWvE
 iXBUFBNNTuZ3iMz6NFTxWx4Nzud6iPHWVlfCnzOkLM2Pas0kjj4eZUlyK A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="383327006"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="383327006"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 08:00:37 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="738576202"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="738576202"
Received: from fbielich-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.62.38])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 08:00:35 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 01/12] drm/edid: store quirks in display info
Date: Fri, 16 Dec 2022 18:00:15 +0200
Message-Id: <e27f24729dae8c05a0b6608c22a85bdee0d008bb.1671206131.git.jani.nikula@intel.com>
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

Although the quirks are internal to EDID parsing, it'll be helpful to
store them in display info to avoid having to pass them around.

This will also help separate adding probed modes (which needs the
quirks) from updating display info.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c  | 41 ++++++++++++++++++-------------------
 include/drm/drm_connector.h |  5 +++++
 2 files changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 3841aba17abd..1df337b207f2 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6374,18 +6374,19 @@ static void drm_reset_display_info(struct drm_connector *connector)
 	info->mso_stream_count = 0;
 	info->mso_pixel_overlap = 0;
 	info->max_dsc_bpp = 0;
+	info->quirks = 0;
 }
 
-static u32 update_display_info(struct drm_connector *connector,
-			       const struct drm_edid *drm_edid)
+static void update_display_info(struct drm_connector *connector,
+				const struct drm_edid *drm_edid)
 {
 	struct drm_display_info *info = &connector->display_info;
 	const struct edid *edid = drm_edid->edid;
 
-	u32 quirks = edid_get_quirks(drm_edid);
-
 	drm_reset_display_info(connector);
 
+	info->quirks = edid_get_quirks(drm_edid);
+
 	info->width_mm = edid->width_cm * 10;
 	info->height_mm = edid->height_cm * 10;
 
@@ -6456,17 +6457,15 @@ static u32 update_display_info(struct drm_connector *connector,
 	drm_update_mso(connector, drm_edid);
 
 out:
-	if (quirks & EDID_QUIRK_NON_DESKTOP) {
+	if (info->quirks & EDID_QUIRK_NON_DESKTOP) {
 		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] Non-desktop display%s\n",
 			    connector->base.id, connector->name,
 			    info->non_desktop ? " (redundant quirk)" : "");
 		info->non_desktop = true;
 	}
 
-	if (quirks & EDID_QUIRK_CAP_DSC_15BPP)
+	if (info->quirks & EDID_QUIRK_CAP_DSC_15BPP)
 		info->max_dsc_bpp = 15;
-
-	return quirks;
 }
 
 static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *dev,
@@ -6564,8 +6563,8 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
 static int _drm_edid_connector_update(struct drm_connector *connector,
 				      const struct drm_edid *drm_edid)
 {
+	struct drm_display_info *info = &connector->display_info;
 	int num_modes = 0;
-	u32 quirks;
 
 	if (!drm_edid) {
 		drm_reset_display_info(connector);
@@ -6578,7 +6577,7 @@ static int _drm_edid_connector_update(struct drm_connector *connector,
 	 * To avoid multiple parsing of same block, lets parse that map
 	 * from sink info, before parsing CEA modes.
 	 */
-	quirks = update_display_info(connector, drm_edid);
+	update_display_info(connector, drm_edid);
 
 	/* Depends on info->cea_rev set by update_display_info() above */
 	drm_edid_to_eld(connector, drm_edid);
@@ -6597,7 +6596,7 @@ static int _drm_edid_connector_update(struct drm_connector *connector,
 	 *
 	 * XXX order for additional mode types in extension blocks?
 	 */
-	num_modes += add_detailed_modes(connector, drm_edid, quirks);
+	num_modes += add_detailed_modes(connector, drm_edid, info->quirks);
 	num_modes += add_cvt_modes(connector, drm_edid);
 	num_modes += add_standard_modes(connector, drm_edid);
 	num_modes += add_established_modes(connector, drm_edid);
@@ -6607,20 +6606,20 @@ static int _drm_edid_connector_update(struct drm_connector *connector,
 	if (drm_edid->edid->features & DRM_EDID_FEATURE_CONTINUOUS_FREQ)
 		num_modes += add_inferred_modes(connector, drm_edid);
 
-	if (quirks & (EDID_QUIRK_PREFER_LARGE_60 | EDID_QUIRK_PREFER_LARGE_75))
-		edid_fixup_preferred(connector, quirks);
+	if (info->quirks & (EDID_QUIRK_PREFER_LARGE_60 | EDID_QUIRK_PREFER_LARGE_75))
+		edid_fixup_preferred(connector, info->quirks);
 
-	if (quirks & EDID_QUIRK_FORCE_6BPC)
-		connector->display_info.bpc = 6;
+	if (info->quirks & EDID_QUIRK_FORCE_6BPC)
+		info->bpc = 6;
 
-	if (quirks & EDID_QUIRK_FORCE_8BPC)
-		connector->display_info.bpc = 8;
+	if (info->quirks & EDID_QUIRK_FORCE_8BPC)
+		info->bpc = 8;
 
-	if (quirks & EDID_QUIRK_FORCE_10BPC)
-		connector->display_info.bpc = 10;
+	if (info->quirks & EDID_QUIRK_FORCE_10BPC)
+		info->bpc = 10;
 
-	if (quirks & EDID_QUIRK_FORCE_12BPC)
-		connector->display_info.bpc = 12;
+	if (info->quirks & EDID_QUIRK_FORCE_12BPC)
+		info->bpc = 12;
 
 	return num_modes;
 }
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 9037f1317aee..35e659d1851a 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -721,6 +721,11 @@ struct drm_display_info {
 	 * monitor's default value is used instead.
 	 */
 	u32 max_dsc_bpp;
+
+	/**
+	 * @quirks: EDID based quirks. Internal to EDID parsing.
+	 */
+	u32 quirks;
 };
 
 int drm_display_info_set_bus_formats(struct drm_display_info *info,
-- 
2.34.1

