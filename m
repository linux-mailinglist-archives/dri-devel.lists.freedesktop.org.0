Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5201F4D5730
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 02:09:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD4C10E612;
	Fri, 11 Mar 2022 01:09:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A8610E5E0;
 Fri, 11 Mar 2022 01:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646960943; x=1678496943;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=8SfgUvi9z7rqdWTypXJxO42LlbenxXJjHZhsi0DTcQ8=;
 b=J1tqH2gQPQDrMBU9d2ZoDM1g2f/MsspENCKfkptPG6FQd/whMccvb6vo
 T5g/qpbD7UbXIupqKRieH/DucIYyGsNm+q39pgVowshZaSeyYuIiGFbXX
 ulX7tDHmks1GA9JshDPBezdEknEs8ZPNtovNeSOjo3AZSXX2WCq2+ggSS
 1UKDPIxy/uPSGK/UDyKVHusdLvPsU4DI0T6ySO0ErOOHOiQEHFV5Z+yo2
 YdQnxDX8CZcyOqNJWCicB7R3TKuMMa4njvmY9xJwFo0YxaxpfltpOpuWh
 7/woUPABvOUOi2P0gzqhg7lTNiaIZHnkWhq+ANHeT1vhNX//xuKmJ/Ty3 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="255196096"
X-IronPort-AV: E=Sophos;i="5.90,172,1643702400"; d="scan'208";a="255196096"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 17:08:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,172,1643702400"; d="scan'208";a="781701083"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by fmsmga006.fm.intel.com with ESMTP; 10 Mar 2022 17:08:41 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [v6 5/5] drm/edid: check for HF-SCDB block
Date: Fri, 11 Mar 2022 09:22:18 +0800
Message-Id: <20220311012218.19025-6-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220311012218.19025-1-shawn.c.lee@intel.com>
References: <20220311012218.19025-1-shawn.c.lee@intel.com>
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
Cc: cooper.chiou@intel.com, william.tseng@intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 Lee Shawn C <shawn.c.lee@intel.com>
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
index eac6ce336507..159e01be6f68 100644
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
@@ -4278,6 +4279,20 @@ static bool cea_db_is_vcdb(const u8 *db)
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
@@ -5273,7 +5288,8 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 
 		if (cea_db_is_hdmi_vsdb(db))
 			drm_parse_hdmi_vsdb_video(connector, db);
-		if (cea_db_is_hdmi_forum_vsdb(db))
+		if (cea_db_is_hdmi_forum_vsdb(db) ||
+		    cea_db_is_hdmi_forum_scdb(db))
 			drm_parse_hdmi_forum_vsdb(connector, db);
 		if (cea_db_is_microsoft_vsdb(db))
 			drm_parse_microsoft_vsdb(connector, db);
-- 
2.17.1

