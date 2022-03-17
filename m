Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E454DC5D5
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 13:28:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF8F10EB7B;
	Thu, 17 Mar 2022 12:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5458910EB78;
 Thu, 17 Mar 2022 12:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647520080; x=1679056080;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=fkHc+eb18+fpeiLlGNG3wuNa3lL0tLfnqQPAES0M5mQ=;
 b=LcRHzniTjWW+jYCs2V7rMCZOoTO0v0qK2kvbQHt//WgC25KMY4klpaUz
 pL/jaiilw6jasgAQHtaRDE73zC7zjEqnq7cQ96OZIdgiR/7RYIJFvwQ3R
 4ug9iocW0x+9/Y9Jzw2bXsYdH3fzKEzaUkVU27osoABOfiguoWhj+u0EQ
 P3cLm4HsIuFfjxJQEz4Jt1+KkuEM9CDl2o8W9k0pec+LmBGbqNtYabL9K
 424AO4s+BiWGU3/uuWiu5saBjhSOvsJvHAtGOlA7hFwCX/AFXweSMQvG3
 lAhddKtgDmBQEAyC8/vLyH8j1WopHZQHKJSs2+Kv5ROUqANHDAr7eR93+ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="237463799"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="237463799"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 05:27:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="581276720"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by orsmga001.jf.intel.com with ESMTP; 17 Mar 2022 05:27:58 -0700
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [v8 5/5] drm/edid: check for HF-SCDB block
Date: Thu, 17 Mar 2022 20:42:02 +0800
Message-Id: <20220317124202.14189-6-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220317124202.14189-1-shawn.c.lee@intel.com>
References: <20220317124202.14189-1-shawn.c.lee@intel.com>
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
index 40c192587f0a..64d13ba0f701 100644
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
@@ -5274,7 +5289,8 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 
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

