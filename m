Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A53EE51FC00
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 14:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2210610EE73;
	Mon,  9 May 2022 12:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED66D10EE6E;
 Mon,  9 May 2022 12:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652097835; x=1683633835;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wi7m8l6GUkj+rtNVLqCc8oY+HOk9xGMs6NxEDFvyn0c=;
 b=k3VKRnxefcfbfHySp66VxVTkcQTFNSr412cvjUJLq6ou9d+XhwaZjrUl
 dPf0IHa5HyepEUcxnqYOXz5MwzoUPb/aQNq+MrpJD+C1mXx9m1loMiBGp
 8u7zGjdzOQQUgjfpMjy/Ja1QDPFiaKoqDNyGtTeUhbxkCopwKXUKhSO67
 c8dvUrX2zzdXDbOucn5kCVvNZ4Oje6XGkObHskeGtBSVGRrjsQS1YdFAQ
 RlYHhAgxaClSRwdUE0ARARxNDTn3pXhkxTWEz8tX294OAK8v70mJe9KJW
 tYrWH98keyVaQndQ1RyZh9WwsrQdvjenrK3EIpX4E/DuUTv9MdhX534jt g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="269167447"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="269167447"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:03:54 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="738134608"
Received: from csawicki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.129.3])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:03:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 05/25] drm/edid: keep propagating drm_edid to display info
Date: Mon,  9 May 2022 15:03:04 +0300
Message-Id: <5a24629a6788de873c3f01d391b9b2e856d2eb57.1652097712.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1652097712.git.jani.nikula@intel.com>
References: <cover.1652097712.git.jani.nikula@intel.com>
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

We'll need to propagate drm_edid everywhere.

v2: Use drm_edid_legacy_init()

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 48 +++++++++++++++++++++++---------------
 1 file changed, 29 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index f48f1f1a1fa7..96e3f9327044 100644
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
@@ -5851,7 +5861,7 @@ static int drm_edid_connector_update(struct drm_connector *connector,
 	 * To avoid multiple parsing of same block, lets parse that map
 	 * from sink info, before parsing CEA modes.
 	 */
-	quirks = drm_add_display_info(connector, edid);
+	quirks = update_display_info(connector, drm_edid);
 
 	/* Depends on info->cea_rev set by drm_add_display_info() above */
 	drm_edid_to_eld(connector, edid);
-- 
2.30.2

