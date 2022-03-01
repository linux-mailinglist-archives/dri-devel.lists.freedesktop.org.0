Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5484C85BB
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 08:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF39610E83C;
	Tue,  1 Mar 2022 07:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C9510E5B0
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 07:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646121577; x=1677657577;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=7LTE0WCIr5UA183oMCJs/vDncgnhXwtn6w/e3Lv8xAA=;
 b=j3u7wHD8L990cLeW2LSdGKQTb+tKuiJsC/dJ1f5SBdNZ1eIvoJ+/V8Gb
 lfReQVVvS1toaDUVJvHPTdRngjgN3P4RYNViBq4jfHEjZ6k6rvwCWUmYN
 /lMWjVXDs+DloThPT8x3Rq02swhrS5kwYoJ1RIUqG6hKz6QhM/inolz9W
 9DOf1AW67vKrKzOvtTzWxfBteRDloYef7o9qMU+VqiL1UIoq5QHjgi7YE
 5wqy8FJnNBxCnuCzzw2GsITrPu5yoYSUaEtownJ8VmNxy57pDrZz1FGA/
 vMBzrqpXx6BizsJtk2skOgn6QI0OIAF38iSzr27HM/xFadH5gLsA0nn0s w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="316295308"
X-IronPort-AV: E=Sophos;i="5.90,145,1643702400"; d="scan'208";a="316295308"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 23:59:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,145,1643702400"; d="scan'208";a="593512514"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by fmsmga008.fm.intel.com with ESMTP; 28 Feb 2022 23:59:32 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [v2 2/4] drm/edid: parse multiple CEA extension block
Date: Tue,  1 Mar 2022 16:12:14 +0800
Message-Id: <20220301081216.20368-3-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220301081216.20368-1-shawn.c.lee@intel.com>
References: <20220301081216.20368-1-shawn.c.lee@intel.com>
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
Cc: jani.nikula@intel.com, ankit.k.nautiyal@intel.com,
 Lee Shawn C <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Try to find and parse more CEA ext blocks if edid->extensions
is greater than one.

v2: split prvious patch to two. And do CEA block parsing
    in this one.

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 70 +++++++++++++++++++++-----------------
 1 file changed, 38 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 375e70d9de86..e2cfde02f837 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4319,47 +4319,53 @@ static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
 static int
 add_cea_modes(struct drm_connector *connector, struct edid *edid)
 {
-	const u8 *cea, *db, *hdmi = NULL, *video = NULL;
-	u8 dbl, hdmi_len, video_len = 0;
+	const u8 *cea;
 	int modes = 0, ext_index = 0;
 
-	cea = drm_find_cea_extension(edid, &ext_index);
-	if (cea && cea_revision(cea) >= 3) {
-		int i, start, end;
+	for (;;) {
+		cea = drm_find_cea_extension(edid, &ext_index);
+		if (!cea)
+			break;
 
-		if (cea_db_offsets(cea, &start, &end))
-			return 0;
+		if (cea && cea_revision(cea) >= 3) {
+			const u8 *db, *hdmi = NULL, *video = NULL;
+			u8 dbl, hdmi_len, video_len = 0;
+			int i, start, end;
 
-		for_each_cea_db(cea, i, start, end) {
-			db = &cea[i];
-			dbl = cea_db_payload_len(db);
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
+
+			/*
+			 * We parse the HDMI VSDB after having added the cea modes as we will
+			 * be patching their flags when the sink supports stereo 3D.
+			 */
+			if (hdmi)
+				modes += do_hdmi_vsdb_modes(connector, hdmi, hdmi_len, video,
+							    video_len);
 		}
 	}
 
-	/*
-	 * We parse the HDMI VSDB after having added the cea modes as we will
-	 * be patching their flags when the sink supports stereo 3D.
-	 */
-	if (hdmi)
-		modes += do_hdmi_vsdb_modes(connector, hdmi, hdmi_len, video,
-					    video_len);
-
 	return modes;
 }
 
-- 
2.31.1

