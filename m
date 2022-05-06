Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A05851D547
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 734DD10F9FB;
	Fri,  6 May 2022 10:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1535810F9FB;
 Fri,  6 May 2022 10:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651831878; x=1683367878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IoSDLzBTa2/QUIbk8yCBUY1bLvYBKnTZaY+d/gxRa3Q=;
 b=Quj7/ig/GLvgUh6yY3/9j7C28r9Cy2eiRP+SGlmVnDT9auw6l5w/IVFE
 dKayRGoB722f/+HVzHrV1UkL6r6/YSscYnOfQ4TTTf0tl/QDh7Htux8v7
 xMzUwukqTacAsOT0r8szCM9B0s3o97cxEwX32IhRGD3Dpu9GqW6u6Zbh6
 9THMCQz+YTNmiN3uQyjfgoE4v/B38N2M1urHJeIVCBxI+1YvYyMLDFHPd
 YF3XEvA2+DOV9c0IzReOXhrFPsge8SFB0gx2JYsDcQckTBBMx9l81PbH5
 gIywi7OuwpeGFcNmLhtirvFEOV4L0vE9kDPhP7rjJb7+euUMNsnArY4d5 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="293631437"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="293631437"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:11:17 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="517968165"
Received: from psikora-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.157.88])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:11:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/25] drm/edid: convert drm_edid_connector_update() to
 drm_edid fully
Date: Fri,  6 May 2022 13:10:14 +0300
Message-Id: <f6a68b3b19b5197700dddc432d700c198ece377e.1651830938.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651830938.git.jani.nikula@intel.com>
References: <cover.1651830938.git.jani.nikula@intel.com>
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

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 95 ++++++++++++++++++--------------------
 1 file changed, 46 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 74038be72ad3..fdc6ad651d3f 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3235,16 +3235,16 @@ do_inferred_modes(const struct detailed_timing *timing, void *c)
 	}
 }
 
-static int
-add_inferred_modes(struct drm_connector *connector, const struct edid *edid)
+static int add_inferred_modes(struct drm_connector *connector,
+			      const struct drm_edid *drm_edid)
 {
 	struct detailed_mode_closure closure = {
 		.connector = connector,
-		.edid = edid,
+		.edid = drm_edid->edid,
 	};
 
-	if (version_greater(edid, 1, 0))
-		drm_for_each_detailed_block(edid, do_inferred_modes, &closure);
+	if (version_greater(drm_edid->edid, 1, 0))
+		drm_for_each_detailed_block(drm_edid->edid, do_inferred_modes, &closure);
 
 	return closure.modes;
 }
@@ -3294,10 +3294,11 @@ do_established_modes(const struct detailed_timing *timing, void *c)
  * bitmap of the supported "established modes" list (defined above). Tease them
  * out and add them to the global modes list.
  */
-static int
-add_established_modes(struct drm_connector *connector, const struct edid *edid)
+static int add_established_modes(struct drm_connector *connector,
+				 const struct drm_edid *drm_edid)
 {
 	struct drm_device *dev = connector->dev;
+	const struct edid *edid = drm_edid->edid;
 	unsigned long est_bits = edid->established_timings.t1 |
 		(edid->established_timings.t2 << 8) |
 		((edid->established_timings.mfg_rsvd & 0x80) << 9);
@@ -3320,7 +3321,7 @@ add_established_modes(struct drm_connector *connector, const struct edid *edid)
 	}
 
 	if (version_greater(edid, 1, 0))
-		drm_for_each_detailed_block(edid, do_established_modes,
+		drm_for_each_detailed_block(drm_edid->edid, do_established_modes,
 					    &closure);
 
 	return modes + closure.modes;
@@ -3355,28 +3356,28 @@ do_standard_modes(const struct detailed_timing *timing, void *c)
  * using the appropriate standard (DMT, GTF, or CVT). Grab them from EDID and
  * add them to the list.
  */
-static int
-add_standard_modes(struct drm_connector *connector, const struct edid *edid)
+static int add_standard_modes(struct drm_connector *connector,
+			      const struct drm_edid *drm_edid)
 {
 	int i, modes = 0;
 	struct detailed_mode_closure closure = {
 		.connector = connector,
-		.edid = edid,
+		.edid = drm_edid->edid,
 	};
 
 	for (i = 0; i < EDID_STD_TIMINGS; i++) {
 		struct drm_display_mode *newmode;
 
-		newmode = drm_mode_std(connector, edid,
-				       &edid->standard_timings[i]);
+		newmode = drm_mode_std(connector, drm_edid->edid,
+				       &drm_edid->edid->standard_timings[i]);
 		if (newmode) {
 			drm_mode_probed_add(connector, newmode);
 			modes++;
 		}
 	}
 
-	if (version_greater(edid, 1, 0))
-		drm_for_each_detailed_block(edid, do_standard_modes,
+	if (version_greater(drm_edid->edid, 1, 0))
+		drm_for_each_detailed_block(drm_edid->edid, do_standard_modes,
 					    &closure);
 
 	/* XXX should also look for standard codes in VTB blocks */
@@ -3448,15 +3449,15 @@ do_cvt_mode(const struct detailed_timing *timing, void *c)
 }
 
 static int
-add_cvt_modes(struct drm_connector *connector, const struct edid *edid)
+add_cvt_modes(struct drm_connector *connector, const struct drm_edid *drm_edid)
 {
 	struct detailed_mode_closure closure = {
 		.connector = connector,
-		.edid = edid,
+		.edid = drm_edid->edid,
 	};
 
-	if (version_greater(edid, 1, 2))
-		drm_for_each_detailed_block(edid, do_cvt_mode, &closure);
+	if (version_greater(drm_edid->edid, 1, 2))
+		drm_for_each_detailed_block(drm_edid->edid, do_cvt_mode, &closure);
 
 	/* XXX should also look for CVT codes in VTB blocks */
 
@@ -3501,22 +3502,21 @@ do_detailed_mode(const struct detailed_timing *timing, void *c)
  * @edid: EDID block to scan
  * @quirks: quirks to apply
  */
-static int
-add_detailed_modes(struct drm_connector *connector, const struct edid *edid,
-		   u32 quirks)
+static int add_detailed_modes(struct drm_connector *connector,
+			      const struct drm_edid *drm_edid, u32 quirks)
 {
 	struct detailed_mode_closure closure = {
 		.connector = connector,
-		.edid = edid,
+		.edid = drm_edid->edid,
 		.preferred = true,
 		.quirks = quirks,
 	};
 
-	if (closure.preferred && !version_greater(edid, 1, 3))
+	if (closure.preferred && !version_greater(drm_edid->edid, 1, 3))
 		closure.preferred =
-		    (edid->features & DRM_EDID_FEATURE_PREFERRED_TIMING);
+		    (drm_edid->edid->features & DRM_EDID_FEATURE_PREFERRED_TIMING);
 
-	drm_for_each_detailed_block(edid, do_detailed_mode, &closure);
+	drm_for_each_detailed_block(drm_edid->edid, do_detailed_mode, &closure);
 
 	return closure.modes;
 }
@@ -3570,7 +3570,7 @@ const u8 *drm_find_edid_extension(const struct edid *edid,
 }
 
 /* Return true if the EDID has a CTA extension or a DisplayID CTA data block */
-static bool drm_edid_has_cta_extension(const struct edid *edid)
+static bool drm_edid_has_cta_extension(const struct drm_edid *drm_edid)
 {
 	const struct displayid_block *block;
 	struct displayid_iter iter;
@@ -3578,11 +3578,11 @@ static bool drm_edid_has_cta_extension(const struct edid *edid)
 	bool found = false;
 
 	/* Look for a top level CEA extension block */
-	if (drm_find_edid_extension(edid, CEA_EXT, &ext_index))
+	if (drm_find_edid_extension(drm_edid->edid, CEA_EXT, &ext_index))
 		return true;
 
 	/* CEA blocks can also be found embedded in a DisplayID block */
-	displayid_iter_edid_begin(edid, &iter);
+	displayid_iter_edid_begin(drm_edid->edid, &iter);
 	displayid_iter_for_each(block, &iter) {
 		if (block->tag == DATA_BLOCK_CTA) {
 			found = true;
@@ -3856,8 +3856,8 @@ static bool drm_valid_hdmi_vic(u8 vic)
 	return vic > 0 && vic < ARRAY_SIZE(edid_4k_modes);
 }
 
-static int
-add_alternate_cea_modes(struct drm_connector *connector, const struct edid *edid)
+static int add_alternate_cea_modes(struct drm_connector *connector,
+				   const struct drm_edid *drm_edid)
 {
 	struct drm_device *dev = connector->dev;
 	struct drm_display_mode *mode, *tmp;
@@ -3865,7 +3865,7 @@ add_alternate_cea_modes(struct drm_connector *connector, const struct edid *edid
 	int modes = 0;
 
 	/* Don't add CTA modes if the CTA extension block is missing */
-	if (!drm_edid_has_cta_extension(edid))
+	if (!drm_edid_has_cta_extension(drm_edid))
 		return 0;
 
 	/*
@@ -4648,14 +4648,14 @@ static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
 	hdmi->y420_cmdb_map = map;
 }
 
-static int
-add_cea_modes(struct drm_connector *connector, const struct edid *edid)
+static int add_cea_modes(struct drm_connector *connector,
+			 const struct drm_edid *drm_edid)
 {
 	const struct cea_db *db;
 	struct cea_db_iter iter;
 	int modes = 0;
 
-	cea_db_iter_edid_begin(edid, &iter);
+	cea_db_iter_edid_begin(drm_edid->edid, &iter);
 	cea_db_iter_for_each(db, &iter) {
 		const u8 *hdmi = NULL, *video = NULL;
 		u8 hdmi_len = 0, video_len = 0;
@@ -5808,13 +5808,13 @@ static int add_displayid_detailed_1_modes(struct drm_connector *connector,
 }
 
 static int add_displayid_detailed_modes(struct drm_connector *connector,
-					const struct edid *edid)
+					const struct drm_edid *drm_edid)
 {
 	const struct displayid_block *block;
 	struct displayid_iter iter;
 	int num_modes = 0;
 
-	displayid_iter_edid_begin(edid, &iter);
+	displayid_iter_edid_begin(drm_edid->edid, &iter);
 	displayid_iter_for_each(block, &iter) {
 		if (block->tag == DATA_BLOCK_TYPE_1_DETAILED_TIMING ||
 		    block->tag == DATA_BLOCK_2_TYPE_7_DETAILED_TIMING)
@@ -5828,7 +5828,6 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
 static int drm_edid_connector_update(struct drm_connector *connector,
 				     const struct drm_edid *drm_edid)
 {
-	const struct edid *edid;
 	int num_modes = 0;
 	u32 quirks;
 
@@ -5838,8 +5837,6 @@ static int drm_edid_connector_update(struct drm_connector *connector,
 		return 0;
 	}
 
-	edid = drm_edid->edid;
-
 	/*
 	 * CEA-861-F adds ycbcr capability map block, for HDMI 2.0 sinks.
 	 * To avoid multiple parsing of same block, lets parse that map
@@ -5864,15 +5861,15 @@ static int drm_edid_connector_update(struct drm_connector *connector,
 	 *
 	 * XXX order for additional mode types in extension blocks?
 	 */
-	num_modes += add_detailed_modes(connector, edid, quirks);
-	num_modes += add_cvt_modes(connector, edid);
-	num_modes += add_standard_modes(connector, edid);
-	num_modes += add_established_modes(connector, edid);
-	num_modes += add_cea_modes(connector, edid);
-	num_modes += add_alternate_cea_modes(connector, edid);
-	num_modes += add_displayid_detailed_modes(connector, edid);
-	if (edid->features & DRM_EDID_FEATURE_DEFAULT_GTF)
-		num_modes += add_inferred_modes(connector, edid);
+	num_modes += add_detailed_modes(connector, drm_edid, quirks);
+	num_modes += add_cvt_modes(connector, drm_edid);
+	num_modes += add_standard_modes(connector, drm_edid);
+	num_modes += add_established_modes(connector, drm_edid);
+	num_modes += add_cea_modes(connector, drm_edid);
+	num_modes += add_alternate_cea_modes(connector, drm_edid);
+	num_modes += add_displayid_detailed_modes(connector, drm_edid);
+	if (drm_edid->edid->features & DRM_EDID_FEATURE_DEFAULT_GTF)
+		num_modes += add_inferred_modes(connector, drm_edid);
 
 	if (quirks & (EDID_QUIRK_PREFER_LARGE_60 | EDID_QUIRK_PREFER_LARGE_75))
 		edid_fixup_preferred(connector, quirks);
-- 
2.30.2

