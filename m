Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE734E4874
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 22:41:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3A710E589;
	Tue, 22 Mar 2022 21:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2EE10E57D;
 Tue, 22 Mar 2022 21:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647985294; x=1679521294;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RZG4yG77fUq6+us6RcWOPjFTEARldNceRdwUlxOuVdU=;
 b=WXaVNKfE22+S60ihi7kGUuPMw/NDZok9aEIienszhcuH7wmaWc/ylRZY
 gg5dcdnBX/K6zWEF4/nCRI7y86YKuaEd8K2CUEIhbZcxZvtSJnmIPqqS4
 8uyYUeTZd0lqpUwHOq2pm0ipdQsILIBTETV0aqImzYgQ/izOOJLi+4v9n
 aZbtIROGzeA0CqOKIRlDPtZrKPyaSk5QLgSt268jKvToXoCTI47ysJVY2
 SZtdVUU2gsVoRQqJCQJYUGQ+lG4hWgo9xPmX8Yv0NxOem45hL1bzXXyOm
 y6T0X/rn/Rz4oL1bMQcbn/q2YZTcKzWGSq5ObnXkyr4METYftifHEr1uX Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="282795420"
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="282795420"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 14:41:33 -0700
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="583448096"
Received: from sburacze-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.58.237])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 14:41:31 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 07/19] drm/edid: convert add_cea_modes() to use cea db iter
Date: Tue, 22 Mar 2022 23:40:36 +0200
Message-Id: <d88761fe8d20b238da7cffad83f1fed17b5efa7c.1647985054.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1647985054.git.jani.nikula@intel.com>
References: <cover.1647985054.git.jani.nikula@intel.com>
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

Iterate through all CEA EDID extension blocks and DisplayID CTA data
blocks to add CEA modes.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 67 ++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index a0a5a7271658..d92ce5d540c3 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4539,46 +4539,41 @@ static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
 static int
 add_cea_modes(struct drm_connector *connector, struct edid *edid)
 {
-	const u8 *cea = drm_find_cea_extension(edid);
-	const u8 *db, *hdmi = NULL, *video = NULL;
-	u8 dbl, hdmi_len, video_len = 0;
+	const struct cea_db *db;
+	struct cea_db_iter iter;
 	int modes = 0;
 
-	if (cea && cea_revision(cea) >= 3) {
-		int i, start, end;
-
-		if (cea_db_offsets(cea, &start, &end))
-			return 0;
-
-		for_each_cea_db(cea, i, start, end) {
-			db = &cea[i];
-			dbl = cea_db_payload_len(db);
-
-			if (cea_db_tag(db) == CEA_DB_VIDEO) {
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
-			}
+	cea_db_iter_edid_begin(edid, &iter);
+	cea_db_iter_for_each(db, &iter) {
+		const u8 *hdmi = NULL, *video = NULL;
+		u8 hdmi_len = 0, video_len = 0;
+
+		if (cea_db_tag(db) == CEA_DB_VIDEO) {
+			video = cea_db_data(db);
+			video_len = cea_db_payload_len(db);
+			modes += do_cea_modes(connector, video, video_len);
+		} else if (cea_db_is_hdmi_vsdb(db)) {
+			/* FIXME: Switch to use cea_db_data() */
+			hdmi = (const u8 *)db;
+			hdmi_len = cea_db_payload_len(db);
+		} else if (cea_db_is_y420vdb(db)) {
+			const u8 *vdb420 = cea_db_data(db) + 1;
+
+			/* Add 4:2:0(only) modes present in EDID */
+			modes += do_y420vdb_modes(connector, vdb420,
+						  cea_db_payload_len(db) - 1);
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
+		 * We parse the HDMI VSDB after having added the cea modes as we
+		 * will be patching their flags when the sink supports stereo
+		 * 3D.
+		 */
+		if (hdmi)
+			modes += do_hdmi_vsdb_modes(connector, hdmi, hdmi_len,
+						    video, video_len);
+	}
+	cea_db_iter_end(&iter);
 
 	return modes;
 }
-- 
2.30.2

