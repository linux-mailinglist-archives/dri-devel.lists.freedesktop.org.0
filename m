Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A72904BF20E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 07:26:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973B210F081;
	Tue, 22 Feb 2022 06:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5084B10F085
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 06:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645511163; x=1677047163;
 h=from:to:cc:subject:date:message-id;
 bh=cR9a9aHBQuSXTt6zZucCZ9Lq92M/Yj/ET+NzDaDWk5M=;
 b=LUKsBdgl08P+00mFJb5pYiwHc8QNYbrocuQaSB/ttKiOWoYBAGzdUFA5
 QA0/KSdFjQYmdZKjsw9wnBdl7TjVuFYwyDynIUVqMg6IHghjwvNkmswNj
 q9dh5qwnSvQUyzuSlP5XUyeNJtY9h8ioFHhZ/dM2dDTvCrMSFmpZWF945
 a7u0vLN93tv9ts8aNxpkf4IpXTDOGKfxbw290IUont30Mpxr+7/kkDtp1
 QOc8+MHzFl8qmsVUQY/m99AOrLSYsz7YpKDC6uBfUu2aZP7PCAxKHP3MJ
 zttCTU+un7WdJYTO0Pjtbh1xsQ/SXxhq7r219EkARCjRhXeQPMtP1EIGH A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="250442511"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="250442511"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 22:26:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="706491723"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by orsmga005.jf.intel.com with ESMTP; 21 Feb 2022 22:26:00 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/edid: parse multiple CEA extension block
Date: Tue, 22 Feb 2022 14:38:17 +0800
Message-Id: <20220222063819.5279-1-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
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
 drivers/gpu/drm/drm_edid.c | 75 +++++++++++++++++++++++---------------
 1 file changed, 45 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 12893e7be89b..3d5dbbeca7f9 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4313,43 +4313,58 @@ add_cea_modes(struct drm_connector *connector, struct edid *edid)
 	const u8 *cea = drm_find_cea_extension(edid);
 	const u8 *db, *hdmi = NULL, *video = NULL;
 	u8 dbl, hdmi_len, video_len = 0;
-	int modes = 0;
+	int modes = 0, j;
 
-	if (cea && cea_revision(cea) >= 3) {
-		int i, start, end;
+	if (!cea)
+		return 0;
 
-		if (cea_db_offsets(cea, &start, &end))
-			return 0;
+	for (j = (cea - (u8 *)edid) / EDID_LENGTH; j <= edid->extensions;) {
+		if (cea && cea_revision(cea) >= 3) {
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
+
+		/* move to next CEA extension block */
+		cea = drm_find_edid_extension(edid, CEA_EXT, &j);
+		if (!cea)
+			break;
+	}
 
 	return modes;
 }
-- 
2.17.1

