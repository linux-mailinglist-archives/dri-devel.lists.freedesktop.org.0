Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E49D6522F3E
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 11:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0F910F978;
	Wed, 11 May 2022 09:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E9E10F978;
 Wed, 11 May 2022 09:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652260877; x=1683796877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bdhzkTwOGMVsrUBkxTByeIkHZX3ZuqXAJl2bLoVrzA8=;
 b=SCtGNQsUkt8XtD3wfPcGDpfyjbyw3tKsPX9kYFx8NEPsD2gEIpuG6Q3V
 4dgB2vqqqaDeVzmetXU89odIOzLKeZumCMRv+ShBlB6A+P09iJGgUJZGe
 Xt7f6JV5329EunPRKCPTusEfhgAr5g2NydY2fiDeJ0MxBpFWAROBpFS1H
 sAlpBkyQ9WsUjlN0QSxbublKvOe49X63SOrxDj1OmsBY/pYT5e/rhuH/K
 5SLDTil+RnZsQ/UsjDf6Ojox5ARb+F6nGSJWTL6JX+fUts6VvrwlU2GaA
 yjQG0q3644hldjjGL90SntDj9PL6ixQB9WWonYw3OEPKbutt1cBzJ1hsD Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="268482675"
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="268482675"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 02:21:13 -0700
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="697495785"
Received: from kniesyn-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.131.79])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 02:21:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/edid: keep propagating drm_edid to display info
Date: Wed, 11 May 2022 12:21:04 +0300
Message-Id: <20220511092104.4179637-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <5a24629a6788de873c3f01d391b9b2e856d2eb57.1652097712.git.jani.nikula@intel.com>
References: <5a24629a6788de873c3f01d391b9b2e856d2eb57.1652097712.git.jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll need to propagate drm_edid everywhere.

v3: Update comment to refer to update_display_info() (Ankit)

v2: Use drm_edid_legacy_init()

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 50 +++++++++++++++++++++++---------------
 1 file changed, 30 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index f48f1f1a1fa7..e89afa04d5ab 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2437,13 +2437,13 @@ EXPORT_SYMBOL(drm_edid_duplicate);
 
 /**
  * edid_get_quirks - return quirk flags for a given EDID
- * @edid: EDID to process
+ * @drm_edid: EDID to process
  *
  * This tells subsequent routines what fixes they need to apply.
  */
-static u32 edid_get_quirks(const struct edid *edid)
+static u32 edid_get_quirks(const struct drm_edid *drm_edid)
 {
-	u32 panel_id = edid_extract_panel_id(edid);
+	u32 panel_id = edid_extract_panel_id(drm_edid->edid);
 	const struct edid_quirk *quirk;
 	int i;
 
@@ -5466,7 +5466,7 @@ static void drm_parse_microsoft_vsdb(struct drm_connector *connector,
 }
 
 static void drm_parse_cea_ext(struct drm_connector *connector,
-			      const struct edid *edid)
+			      const struct drm_edid *drm_edid)
 {
 	struct drm_display_info *info = &connector->display_info;
 	struct drm_edid_iter edid_iter;
@@ -5474,7 +5474,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 	struct cea_db_iter iter;
 	const u8 *edid_ext;
 
-	drm_edid_iter_begin(edid, &edid_iter);
+	drm_edid_iter_begin(drm_edid->edid, &edid_iter);
 	drm_edid_iter_for_each(edid_ext, &edid_iter) {
 		if (edid_ext[0] != CEA_EXT)
 			continue;
@@ -5495,7 +5495,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 	}
 	drm_edid_iter_end(&edid_iter);
 
-	cea_db_iter_edid_begin(edid, &iter);
+	cea_db_iter_edid_begin(drm_edid->edid, &iter);
 	cea_db_iter_for_each(db, &iter) {
 		/* FIXME: convert parsers to use struct cea_db */
 		const u8 *data = (const u8 *)db;
@@ -5541,16 +5541,15 @@ void get_monitor_range(const struct detailed_timing *timing,
 	monitor_range->max_vfreq = range->max_vfreq;
 }
 
-static
-void drm_get_monitor_range(struct drm_connector *connector,
-			   const struct edid *edid)
+static void drm_get_monitor_range(struct drm_connector *connector,
+				  const struct drm_edid *drm_edid)
 {
 	struct drm_display_info *info = &connector->display_info;
 
-	if (!version_greater(edid, 1, 1))
+	if (!version_greater(drm_edid->edid, 1, 1))
 		return;
 
-	drm_for_each_detailed_block(edid, get_monitor_range,
+	drm_for_each_detailed_block(drm_edid->edid, get_monitor_range,
 				    &info->monitor_range);
 
 	DRM_DEBUG_KMS("Supported Monitor Refresh rate range is %d Hz - %d Hz\n",
@@ -5610,12 +5609,13 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
 		    info->mso_stream_count, info->mso_pixel_overlap);
 }
 
-static void drm_update_mso(struct drm_connector *connector, const struct edid *edid)
+static void drm_update_mso(struct drm_connector *connector,
+			   const struct drm_edid *drm_edid)
 {
 	const struct displayid_block *block;
 	struct displayid_iter iter;
 
-	displayid_iter_edid_begin(edid, &iter);
+	displayid_iter_edid_begin(drm_edid->edid, &iter);
 	displayid_iter_for_each(block, &iter) {
 		if (block->tag == DATA_BLOCK_2_VENDOR_SPECIFIC)
 			drm_parse_vesa_mso_data(connector, block);
@@ -5654,18 +5654,20 @@ drm_reset_display_info(struct drm_connector *connector)
 	info->mso_pixel_overlap = 0;
 }
 
-u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edid)
+static u32 update_display_info(struct drm_connector *connector,
+			       const struct drm_edid *drm_edid)
 {
 	struct drm_display_info *info = &connector->display_info;
+	const struct edid *edid = drm_edid->edid;
 
-	u32 quirks = edid_get_quirks(edid);
+	u32 quirks = edid_get_quirks(drm_edid);
 
 	drm_reset_display_info(connector);
 
 	info->width_mm = edid->width_cm * 10;
 	info->height_mm = edid->height_cm * 10;
 
-	drm_get_monitor_range(connector, edid);
+	drm_get_monitor_range(connector, drm_edid);
 
 	if (edid->revision < 3)
 		goto out;
@@ -5674,7 +5676,7 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
 		goto out;
 
 	info->color_formats |= DRM_COLOR_FORMAT_RGB444;
-	drm_parse_cea_ext(connector, edid);
+	drm_parse_cea_ext(connector, drm_edid);
 
 	/*
 	 * Digital sink with "DFP 1.x compliant TMDS" according to EDID 1.3?
@@ -5727,7 +5729,7 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
 	if (edid->features & DRM_EDID_FEATURE_RGB_YCRCB422)
 		info->color_formats |= DRM_COLOR_FORMAT_YCBCR422;
 
-	drm_update_mso(connector, edid);
+	drm_update_mso(connector, drm_edid);
 
 out:
 	if (quirks & EDID_QUIRK_NON_DESKTOP) {
@@ -5739,6 +5741,14 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
 	return quirks;
 }
 
+u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edid)
+{
+	struct drm_edid drm_edid;
+
+	return update_display_info(connector,
+				   drm_edid_legacy_init(&drm_edid, edid));
+}
+
 static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *dev,
 							    struct displayid_detailed_timings_1 *timings,
 							    bool type_7)
@@ -5851,9 +5861,9 @@ static int drm_edid_connector_update(struct drm_connector *connector,
 	 * To avoid multiple parsing of same block, lets parse that map
 	 * from sink info, before parsing CEA modes.
 	 */
-	quirks = drm_add_display_info(connector, edid);
+	quirks = update_display_info(connector, drm_edid);
 
-	/* Depends on info->cea_rev set by drm_add_display_info() above */
+	/* Depends on info->cea_rev set by update_display_info() above */
 	drm_edid_to_eld(connector, edid);
 
 	/*
-- 
2.30.2

