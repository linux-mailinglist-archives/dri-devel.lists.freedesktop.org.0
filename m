Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CC6522F59
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 11:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE7510F9CC;
	Wed, 11 May 2022 09:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F5110F9CC;
 Wed, 11 May 2022 09:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652261217; x=1683797217;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+r5rNUXslvdzUPgNH0Dk6zLpT5SLiYPk2uTeM7HdNTY=;
 b=e6HaNjHIrPa5GR3uXTJOhP6+U+cZr16OcK0Eyy1U7VQCq9W3gwZXe1g0
 gb61Fp9kOSfCMu8Wiz9rGxCdGA0nPHlraMKlhJj6ePRsrqAZsLhx+VR5/
 97B/e8g0ispM9qlBeLd6cAsfGHNgg1eReUWmcguJ8doJ2/fl50nHT2pEK
 Ggjnu+SPReqMUswGjDKva4o+tZd7c0hcjrpiXX4snl0DtoScA9xGc5OlO
 h0JHTZqU0kAgnDiz4fSDE7TuQG28RWZU1+jFz2ABdxWIJ88X9p4FppdMS
 DCJkFaMZz1aoydlHbj1W8adOJvYYQJmp0yI0kAQeiZAu5S0rfr3RcD3rm g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="269312850"
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="269312850"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 02:26:57 -0700
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="566091407"
Received: from kniesyn-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.131.79])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 02:26:54 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/edid: convert drm_edid_connector_update() to drm_edid
 fully
Date: Wed, 11 May 2022 12:26:50 +0300
Message-Id: <20220511092650.4193330-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <aa04fb75f0c769122a17ee60dc92c2242983f3b8.1652097712.git.jani.nikula@intel.com>
References: <aa04fb75f0c769122a17ee60dc92c2242983f3b8.1652097712.git.jani.nikula@intel.com>
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

v3: s/edid/drm_edid/ in comment too (Ankit)

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 97 ++++++++++++++++++--------------------
 1 file changed, 47 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 92a65ccbd730..9f1e5856aa77 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3253,16 +3253,16 @@ do_inferred_modes(const struct detailed_timing *timing, void *c)
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
@@ -3312,10 +3312,11 @@ do_established_modes(const struct detailed_timing *timing, void *c)
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
@@ -3338,7 +3339,7 @@ add_established_modes(struct drm_connector *connector, const struct edid *edid)
 	}
 
 	if (version_greater(edid, 1, 0))
-		drm_for_each_detailed_block(edid, do_established_modes,
+		drm_for_each_detailed_block(drm_edid->edid, do_established_modes,
 					    &closure);
 
 	return modes + closure.modes;
@@ -3373,28 +3374,28 @@ do_standard_modes(const struct detailed_timing *timing, void *c)
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
@@ -3466,15 +3467,15 @@ do_cvt_mode(const struct detailed_timing *timing, void *c)
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
 
@@ -3516,25 +3517,24 @@ do_detailed_mode(const struct detailed_timing *timing, void *c)
 /*
  * add_detailed_modes - Add modes from detailed timings
  * @connector: attached connector
- * @edid: EDID block to scan
+ * @drm_edid: EDID block to scan
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
@@ -3588,7 +3588,7 @@ const u8 *drm_find_edid_extension(const struct edid *edid,
 }
 
 /* Return true if the EDID has a CTA extension or a DisplayID CTA data block */
-static bool drm_edid_has_cta_extension(const struct edid *edid)
+static bool drm_edid_has_cta_extension(const struct drm_edid *drm_edid)
 {
 	const struct displayid_block *block;
 	struct displayid_iter iter;
@@ -3596,11 +3596,11 @@ static bool drm_edid_has_cta_extension(const struct edid *edid)
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
@@ -3874,8 +3874,8 @@ static bool drm_valid_hdmi_vic(u8 vic)
 	return vic > 0 && vic < ARRAY_SIZE(edid_4k_modes);
 }
 
-static int
-add_alternate_cea_modes(struct drm_connector *connector, const struct edid *edid)
+static int add_alternate_cea_modes(struct drm_connector *connector,
+				   const struct drm_edid *drm_edid)
 {
 	struct drm_device *dev = connector->dev;
 	struct drm_display_mode *mode, *tmp;
@@ -3883,7 +3883,7 @@ add_alternate_cea_modes(struct drm_connector *connector, const struct edid *edid
 	int modes = 0;
 
 	/* Don't add CTA modes if the CTA extension block is missing */
-	if (!drm_edid_has_cta_extension(edid))
+	if (!drm_edid_has_cta_extension(drm_edid))
 		return 0;
 
 	/*
@@ -4666,14 +4666,14 @@ static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
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
@@ -5824,13 +5824,13 @@ static int add_displayid_detailed_1_modes(struct drm_connector *connector,
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
@@ -5844,7 +5844,6 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
 static int drm_edid_connector_update(struct drm_connector *connector,
 				     const struct drm_edid *drm_edid)
 {
-	const struct edid *edid;
 	int num_modes = 0;
 	u32 quirks;
 
@@ -5854,8 +5853,6 @@ static int drm_edid_connector_update(struct drm_connector *connector,
 		return 0;
 	}
 
-	edid = drm_edid->edid;
-
 	/*
 	 * CEA-861-F adds ycbcr capability map block, for HDMI 2.0 sinks.
 	 * To avoid multiple parsing of same block, lets parse that map
@@ -5880,15 +5877,15 @@ static int drm_edid_connector_update(struct drm_connector *connector,
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

