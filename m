Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D96014C2DD1
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 15:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B9410E36E;
	Thu, 24 Feb 2022 14:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CEFE10E19C
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 14:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645711468; x=1677247468;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=6fxYGnB2YN1YAxdrZZgQJEqUBM8AQclQDXJZSE3++Rg=;
 b=S9c/Uu3GKDSbNOJMd58CzjkdxxH5q0gQCHvir2psdDLGxeuEinCh3epK
 bGtrkbpxYkqv4aY2ii/fAEPy+pYTeeEcbIcTPLxeW9VmB+1/TTz78zOTq
 odXsLaMYwb9dM049v5GGbQYDe/4trQZXG4aUmnb1HRhLMgTDpqP4Kyml3
 vZe3qKO+aqiSLuARe8o45yzjPjkh7QWJ+gPSM4IxAJdver8o6i+rUv23G
 jfnws0aQKdGDOxs2x7zhcY/GicyeuLnwKUJoeFzFW9yE48TO7HBLrMcZA
 1xaL2xYI44ENN7AKlOXNVWKQEtRkRl7gOmDvYIl4F9DiTE4r3mMUWerZc A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="338676178"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="338676178"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 06:04:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="628479293"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Feb 2022 06:04:00 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/edid: parse multiple CEA extension block
Date: Thu, 24 Feb 2022 22:16:23 +0800
Message-Id: <20220224141625.19070-2-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220224141625.19070-1-shawn.c.lee@intel.com>
References: <20220224141625.19070-1-shawn.c.lee@intel.com>
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
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Lee Shawn C <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Try to find and parse more CEA ext blocks if edid->extensions
is greater than one.

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 110 ++++++++++++++++++++-----------------
 1 file changed, 60 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index a504542238ed..19426f28b411 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3353,16 +3353,14 @@ const u8 *drm_find_edid_extension(const struct edid *edid,
 	return edid_ext;
 }
 
-static const u8 *drm_find_cea_extension(const struct edid *edid)
+static const u8 *drm_find_cea_extension(const struct edid *edid, int *ext_index)
 {
 	const struct displayid_block *block;
 	struct displayid_iter iter;
 	const u8 *cea;
-	int ext_index = 0;
 
-	/* Look for a top level CEA extension block */
-	/* FIXME: make callers iterate through multiple CEA ext blocks? */
-	cea = drm_find_edid_extension(edid, CEA_EXT, &ext_index);
+	/* Look for a CEA extension block from ext_index */
+	cea = drm_find_edid_extension(edid, CEA_EXT, ext_index);
 	if (cea)
 		return cea;
 
@@ -3643,10 +3641,10 @@ add_alternate_cea_modes(struct drm_connector *connector, struct edid *edid)
 	struct drm_device *dev = connector->dev;
 	struct drm_display_mode *mode, *tmp;
 	LIST_HEAD(list);
-	int modes = 0;
+	int modes = 0, ext_index = 0;
 
 	/* Don't add CEA modes if the CEA extension block is missing */
-	if (!drm_find_cea_extension(edid))
+	if (!drm_find_cea_extension(edid, &ext_index))
 		return 0;
 
 	/*
@@ -4321,46 +4319,58 @@ static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
 static int
 add_cea_modes(struct drm_connector *connector, struct edid *edid)
 {
-	const u8 *cea = drm_find_cea_extension(edid);
+	const u8 *cea = NULL;
 	const u8 *db, *hdmi = NULL, *video = NULL;
 	u8 dbl, hdmi_len, video_len = 0;
-	int modes = 0;
+	int modes = 0, ext_index = 0;
 
-	if (cea && cea_revision(cea) >= 3) {
-		int i, start, end;
+	for (;;) {
+		cea = drm_find_cea_extension(edid, &ext_index);
 
-		if (cea_db_offsets(cea, &start, &end))
-			return 0;
+		if (!cea)
+			break;
 
-		for_each_cea_db(cea, i, start, end) {
-			db = &cea[i];
-			dbl = cea_db_payload_len(db);
+		if (cea && cea_revision(cea) >= 3) {
+			int i, start, end;
+
+			if (cea_db_offsets(cea, &start, &end))
+				continue;
 
-			if (cea_db_tag(db) == VIDEO_BLOCK) {
-				video = db + 1;
-				video_len = dbl;
-				modes += do_cea_modes(connector, video, dbl);
-			} else if (cea_db_is_hdmi_vsdb(db)) {
-				hdmi = db;
-				hdmi_len = dbl;
-			} else if (cea_db_is_y420vdb(db)) {
-				const u8 *vdb420 = &db[2];
-
-				/* Add 4:2:0(only) modes present in EDID */
-				modes += do_y420vdb_modes(connector,
-							  vdb420,
-							  dbl - 1);
+			for_each_cea_db(cea, i, start, end) {
+				db = &cea[i];
+				dbl = cea_db_payload_len(db);
+
+				if (cea_db_tag(db) == VIDEO_BLOCK) {
+					video = db + 1;
+					video_len = dbl;
+					modes += do_cea_modes(connector, video, dbl);
+				} else if (cea_db_is_hdmi_vsdb(db)) {
+					hdmi = db;
+					hdmi_len = dbl;
+				} else if (cea_db_is_y420vdb(db)) {
+					const u8 *vdb420 = &db[2];
+
+					/* Add 4:2:0(only) modes present in EDID */
+					modes += do_y420vdb_modes(connector,
+								  vdb420,
+								  dbl - 1);
+				}
 			}
 		}
-	}
 
-	/*
-	 * We parse the HDMI VSDB after having added the cea modes as we will
-	 * be patching their flags when the sink supports stereo 3D.
-	 */
-	if (hdmi)
-		modes += do_hdmi_vsdb_modes(connector, hdmi, hdmi_len, video,
-					    video_len);
+		/*
+		 * We parse the HDMI VSDB after having added the cea modes as we will
+		 * be patching their flags when the sink supports stereo 3D.
+		 */
+		if (hdmi) {
+			modes += do_hdmi_vsdb_modes(connector, hdmi, hdmi_len, video,
+						    video_len);
+			hdmi  = NULL;
+			video = NULL;
+			hdmi_len = 0;
+			video_len = 0;
+		}
+	}
 
 	return modes;
 }
@@ -4562,7 +4572,7 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
 	uint8_t *eld = connector->eld;
 	const u8 *cea;
 	const u8 *db;
-	int total_sad_count = 0;
+	int total_sad_count = 0, ext_index = 0;
 	int mnl;
 	int dbl;
 
@@ -4571,7 +4581,7 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
 	if (!edid)
 		return;
 
-	cea = drm_find_cea_extension(edid);
+	cea = drm_find_cea_extension(edid, &ext_index);
 	if (!cea) {
 		DRM_DEBUG_KMS("ELD: no CEA Extension found\n");
 		return;
@@ -4655,11 +4665,11 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
  */
 int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads)
 {
-	int count = 0;
+	int count = 0, ext_index = 0;
 	int i, start, end, dbl;
 	const u8 *cea;
 
-	cea = drm_find_cea_extension(edid);
+	cea = drm_find_cea_extension(edid, &ext_index);
 	if (!cea) {
 		DRM_DEBUG_KMS("SAD: no CEA Extension found\n");
 		return 0;
@@ -4717,11 +4727,11 @@ EXPORT_SYMBOL(drm_edid_to_sad);
  */
 int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb)
 {
-	int count = 0;
+	int count = 0, ext_index = 0;
 	int i, start, end, dbl;
 	const u8 *cea;
 
-	cea = drm_find_cea_extension(edid);
+	cea = drm_find_cea_extension(edid, &ext_index);
 	if (!cea) {
 		DRM_DEBUG_KMS("SAD: no CEA Extension found\n");
 		return 0;
@@ -4813,10 +4823,10 @@ EXPORT_SYMBOL(drm_av_sync_delay);
 bool drm_detect_hdmi_monitor(struct edid *edid)
 {
 	const u8 *edid_ext;
-	int i;
+	int i, ext_index = 0;
 	int start_offset, end_offset;
 
-	edid_ext = drm_find_cea_extension(edid);
+	edid_ext = drm_find_cea_extension(edid, &ext_index);
 	if (!edid_ext)
 		return false;
 
@@ -4851,11 +4861,11 @@ EXPORT_SYMBOL(drm_detect_hdmi_monitor);
 bool drm_detect_monitor_audio(struct edid *edid)
 {
 	const u8 *edid_ext;
-	int i, j;
+	int i, j, ext_index = 0;
 	bool has_audio = false;
 	int start_offset, end_offset;
 
-	edid_ext = drm_find_cea_extension(edid);
+	edid_ext = drm_find_cea_extension(edid, &ext_index);
 	if (!edid_ext)
 		goto end;
 
@@ -5177,9 +5187,9 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 {
 	struct drm_display_info *info = &connector->display_info;
 	const u8 *edid_ext;
-	int i, start, end;
+	int i, start, end, ext_index = 0;
 
-	edid_ext = drm_find_cea_extension(edid);
+	edid_ext = drm_find_cea_extension(edid, &ext_index);
 	if (!edid_ext)
 		return;
 
-- 
2.17.1

