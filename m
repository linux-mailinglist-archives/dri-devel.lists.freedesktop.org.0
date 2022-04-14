Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A477501258
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 17:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5168E10FF7E;
	Thu, 14 Apr 2022 15:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390A910FF7D;
 Thu, 14 Apr 2022 15:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649948879; x=1681484879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gnraO2dCuv7+v6vhSze4bgoJU3ziQkKy8SDyC3/QoOM=;
 b=mqgOE9abf3kDWjntFeoU/tSXcdfALXCeCRrbMwmnm7XuSREJ41y8ZJ8g
 Qw1HWEvYml34Lot9hhX++dj+nlVsjs+kYpWUe8hZ73WDv/AP6CHGa8EfJ
 0NMPWSB5hcAfNjxQpmnncsgclQEVn40G5leWsin0jjIqYsVq/tm1RmsU1
 O8VdwkqaUEdue0SzsOBMJmtXs7ohZcoRsGAuMT/McL7PtECJtBMohsrFt
 PmDSrkyqY2iNH8Zke6SVUqse91+58VekfwX/W2yMG11T4/FfVIXrew86a
 qnBZdsXtO2hswS+DHiZf6PzbpoG2kMbq7cSELNk09DmUpgsbyyaP+Sdf1 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="288006843"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="288006843"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:07:47 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="661408656"
Received: from nplaweck-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.149.236])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:07:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/19] drm/edid: convert add_cea_modes() to use cea db iter
Date: Thu, 14 Apr 2022 18:06:50 +0300
Message-Id: <98d48a8c33108ae065944ae70a7f1052967fc8d1.1649948562.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1649948562.git.jani.nikula@intel.com>
References: <cover.1649948562.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Iterate through all CTA EDID extension blocks and DisplayID CTA data
blocks to add CEA modes.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 67 ++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 34897b1417a5..d02588637879 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4713,46 +4713,41 @@ static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
 static int
 add_cea_modes(struct drm_connector *connector, const struct edid *edid)
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
-			if (cea_db_tag(db) == CTA_DB_VIDEO) {
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
+		if (cea_db_tag(db) == CTA_DB_VIDEO) {
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

