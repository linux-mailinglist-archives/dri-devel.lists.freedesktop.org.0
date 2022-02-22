Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1682B4BF9CB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 14:50:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC4D10E765;
	Tue, 22 Feb 2022 13:50:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD45D10E73C
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 13:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645537828; x=1677073828;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=BU60NPUuZiKpLW5U7IFwfgS4NrXz5xDQi7nQuqV0MV8=;
 b=YCzEnUPtiyxGm+4FO2Xe99BFu39n7TDCgsXBA33cIOH7BtIp8CiXONpU
 grCP08jU0qfYKpH+rWDeZqF941Rl17vObf02W/aPqmKiCboOLWuTZrZwA
 ag1RS/qUtlhsaiKfhTqb/X3hHoydrMSXkiAONbtsCKO7zaHdi0UncI9tt
 /QkMOx3j964L0K42+UaIRD2xh0f2FNOqpaUeBRTiuzzfn3Y+5iyq2mcy1
 qoJZKzymU53Xt4jxGbdIcbeT1hHMrpoG/trVYKAi8BGaTD/PVSiq5TZEq
 AJqVMCNbOJ7aWJdG5ufZzXa1wXOsyn4Wd+tmgB1DWKSmDZ8PhSzL20XJF A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="338138768"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="338138768"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 05:50:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="638907917"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by orsmga004.jf.intel.com with ESMTP; 22 Feb 2022 05:50:27 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [v2 1/3] drm/edid: parse multiple CEA extension block
Date: Tue, 22 Feb 2022 22:02:34 +0800
Message-Id: <20220222140236.6751-1-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220222063819.5279-1-shawn.c.lee@intel.com>
References: <20220222063819.5279-1-shawn.c.lee@intel.com>
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

v2: add ext_index and look for available CEA block from
    ext_index in drm_find_cea_extension().

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 110 ++++++++++++++++++++-----------------
 1 file changed, 60 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 12893e7be89b..c83ef23757bd 100644
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
@@ -4310,46 +4308,58 @@ static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
 static int
 add_cea_modes(struct drm_connector *connector, struct edid *edid)
 {
-	const u8 *cea = drm_find_cea_extension(edid);
+	const u8 *cea = NULL;
 	const u8 *db, *hdmi = NULL, *video = NULL;
 	u8 dbl, hdmi_len, video_len = 0;
-	int modes = 0;
+	int modes = 0, j = 0;
 
-	if (cea && cea_revision(cea) >= 3) {
-		int i, start, end;
+	for (;;) {
+		cea = drm_find_cea_extension(edid, &j);
 
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
@@ -4551,7 +4561,7 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
 	uint8_t *eld = connector->eld;
 	const u8 *cea;
 	const u8 *db;
-	int total_sad_count = 0;
+	int total_sad_count = 0, ext_index = 0;
 	int mnl;
 	int dbl;
 
@@ -4560,7 +4570,7 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
 	if (!edid)
 		return;
 
-	cea = drm_find_cea_extension(edid);
+	cea = drm_find_cea_extension(edid, &ext_index);
 	if (!cea) {
 		DRM_DEBUG_KMS("ELD: no CEA Extension found\n");
 		return;
@@ -4644,11 +4654,11 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
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
@@ -4706,11 +4716,11 @@ EXPORT_SYMBOL(drm_edid_to_sad);
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
@@ -4802,10 +4812,10 @@ EXPORT_SYMBOL(drm_av_sync_delay);
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
 
@@ -4840,11 +4850,11 @@ EXPORT_SYMBOL(drm_detect_hdmi_monitor);
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
 
@@ -5154,9 +5164,9 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
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
2.31.1

