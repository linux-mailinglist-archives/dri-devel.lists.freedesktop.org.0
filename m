Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA5E501238
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 17:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F6910FEF8;
	Thu, 14 Apr 2022 15:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B858910FEEE;
 Thu, 14 Apr 2022 15:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649948838; x=1681484838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V16ETtYrck/lMi1WGBWuU2OSKOcUPf6yBHPnd+cGtko=;
 b=iWebrxEd/sr7yCMIgraVu6FR7+PQ+9UFPZ3lSaSNgE//ElRKqOPPzRCU
 nP/7jROFyes2LOqTY72ff79ceRZ25nXM7hUCgD2hpX41K6ANsMQYhPiV4
 6AYJnwwYviE4Og9Rfp/ow/r5CarVwxgoA4GkU2co76LKW3vE9UAWxJgwR
 VAl/lqT4+4y8rW9IichSr/W12xeHPdP1l6AIbjKyMLHkM2ETKnt8imDrS
 hCpFESuNfEU2n6ycGsqyeW+pe0zcf0xsU3f2RleNlvrpS+qkYItw2kZ3a
 7iRJHw5DF8j7oij6jA7q3AS+e9HfxAJ3M8VMsQPP5Bo/pCMZz6tOm7szK w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="323394527"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="323394527"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:07:18 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="573840042"
Received: from nplaweck-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.149.236])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:07:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/19] drm/edid: check for HF-SCDB block
Date: Thu, 14 Apr 2022 18:06:45 +0300
Message-Id: <a372cec9ce98438a963d199ebb04c2de56152513.1649948562.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1649948562.git.jani.nikula@intel.com>
References: <cover.1649948562.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Lee Shawn C <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lee Shawn C <shawn.c.lee@intel.com>

Find HF-SCDB information in CEA extensions block. And retrieve
Max_TMDS_Character_Rate that support by sink device.

v2: HF-SCDB and HF-VSDBS carry the same SCDS data. Reuse
    drm_parse_hdmi_forum_vsdb() to parse this packet.

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 4758e78fad82..32ece9607b94 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3495,6 +3495,7 @@ add_detailed_modes(struct drm_connector *connector, const struct edid *edid,
 #define EXT_VIDEO_CAPABILITY_BLOCK 0x00
 #define EXT_VIDEO_DATA_BLOCK_420	0x0E
 #define EXT_VIDEO_CAP_BLOCK_Y420CMDB 0x0F
+#define EXT_VIDEO_HF_SCDB_DATA_BLOCK	0x79
 #define EDID_BASIC_AUDIO	(1 << 6)
 #define EDID_CEA_YCRCB444	(1 << 5)
 #define EDID_CEA_YCRCB422	(1 << 4)
@@ -4426,6 +4427,20 @@ static bool cea_db_is_vcdb(const u8 *db)
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
@@ -5387,7 +5402,8 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 
 		if (cea_db_is_hdmi_vsdb(db))
 			drm_parse_hdmi_vsdb_video(connector, db);
-		if (cea_db_is_hdmi_forum_vsdb(db))
+		if (cea_db_is_hdmi_forum_vsdb(db) ||
+		    cea_db_is_hdmi_forum_scdb(db))
 			drm_parse_hdmi_forum_vsdb(connector, db);
 		if (cea_db_is_microsoft_vsdb(db))
 			drm_parse_microsoft_vsdb(connector, db);
-- 
2.30.2

