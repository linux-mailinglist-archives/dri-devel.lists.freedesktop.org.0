Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F00D24D4987
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 15:41:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8F310E68C;
	Thu, 10 Mar 2022 14:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F58110E5E3;
 Thu, 10 Mar 2022 14:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646923254; x=1678459254;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=LQJrEnL3/tc58OpLr74freQ+0vVozgeWnkoeKoqw96w=;
 b=lP8P2SBGKPex7Syff9sSW0uuflE4qu0wonwApyUS26TtyGNTj4bFOPst
 Z3sTxTzVrJ0cbo4I/FaAff+k8nG0SkLgMAnkDElTYkH+aOXBes42ZJfdo
 dvHkCDnxgFqoSqz1rgWadpHdCJ9+mi+xaWtuC7Lj59i8MkMobfA1Albnv
 6hbL5u3tNRE96PwkY3q1X7IedSQL4fDqVbSVeM/mVu56XhBxGV88IcvXM
 71hiEi+4o2wvL3W4cB5CNbmVozAe4/JfiOwtkXz+D855m768O2m/fQkTr
 0tSCELC9HsT4PNtp3o5NobE4mY0LnnUwNwS6BieeX+HTGJVAkEYn/go8v A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="255000919"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="255000919"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 06:40:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="538477346"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by orsmga007.jf.intel.com with ESMTP; 10 Mar 2022 06:40:53 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [v5 5/5] drm/edid: check for HF-SCDB block
Date: Thu, 10 Mar 2022 22:54:24 +0800
Message-Id: <20220310145424.32643-6-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220310145424.32643-1-shawn.c.lee@intel.com>
References: <20220310145424.32643-1-shawn.c.lee@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 ankit.k.nautiyal@intel.com, Lee Shawn C <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Find HF-SCDB information in CEA extensions block. And retrieve
Max_TMDS_Character_Rate that support by sink device.

v2: HF-SCDB and HF-VSDBS carry the same SCDS data. Reuse
    drm_parse_hdmi_forum_vsdb() to parse this packet.

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 1da1239c21cb..f1d5180ee5a9 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3350,6 +3350,7 @@ add_detailed_modes(struct drm_connector *connector, struct edid *edid,
 #define EXT_VIDEO_DATA_BLOCK_420	0x0E
 #define EXT_VIDEO_CAP_BLOCK_Y420CMDB	0x0F
 #define EXT_VIDEO_HF_EEODB_DATA_BLOCK	0x78
+#define EXT_VIDEO_HF_SCDB_DATA_BLOCK	0x79
 #define EDID_BASIC_AUDIO	(1 << 6)
 #define EDID_CEA_YCRCB444	(1 << 5)
 #define EDID_CEA_YCRCB422	(1 << 4)
@@ -4277,6 +4278,20 @@ static bool cea_db_is_vcdb(const u8 *db)
 	return true;
 }
 
+static bool cea_db_is_hdmi_forum_scdb(const u8 *db)
+{
+	if (cea_db_tag(db) != USE_EXTENDED_TAG)
+		return false;
+
+	if (cea_db_payload_len(db) < 7)
+		return false;
+
+	if (cea_db_extended_tag(db) != EXT_VIDEO_HF_SCDB_DATA_BLOCK)
+		return false;
+
+	return true;
+}
+
 static bool cea_db_is_y420cmdb(const u8 *db)
 {
 	if (cea_db_tag(db) != USE_EXTENDED_TAG)
@@ -5272,7 +5287,8 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 
 		if (cea_db_is_hdmi_vsdb(db))
 			drm_parse_hdmi_vsdb_video(connector, db);
-		if (cea_db_is_hdmi_forum_vsdb(db))
+		if (cea_db_is_hdmi_forum_vsdb(db) ||
+		    cea_db_is_hdmi_forum_scdb(db))
 			drm_parse_hdmi_forum_vsdb(connector, db);
 		if (cea_db_is_microsoft_vsdb(db))
 			drm_parse_microsoft_vsdb(connector, db);
-- 
2.31.1

