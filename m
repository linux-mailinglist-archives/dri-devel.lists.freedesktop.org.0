Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA7250123B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 17:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8564210FF12;
	Thu, 14 Apr 2022 15:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05C510FEFC;
 Thu, 14 Apr 2022 15:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649948847; x=1681484847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H/Q/dlcDEteB8CMZrTKOJv1LdsBZ/SmvIkg0V/EqLOU=;
 b=ciaVQ4uewpk0jGVKU52/Gz3rGFLksbKJqzogTjFmKrGb7NPRfIcmwj1+
 DavaZZ6OgC+SN2Cwj6eA1JCx7pDnJZ3YLxcYm7BRY5wHg2AMxAORsIZfk
 IDIYkS7LfjpdHhJjOI4ya+b0iMd3ZAweOULsgpCxxrRhjRouXmmraC3A7
 V9Yx5dYm9fvl+AAjyb3HN0ujVyvfzip7unojJtn/5Xbj7pC+eO+C7PIvY
 s4sxTEb/6xw0pyTPOY4YiPecsruKZFt3ePTXm+6NNAqryXQdbBVu8fWW+
 Uo9u4tDACA1vEOTx9uywLZ7DtzUEuZXEEiHrwoKt9WTs+/Qu/xdh/O036 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="250246471"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="250246471"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:07:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="552718886"
Received: from nplaweck-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.149.236])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:07:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/19] drm/edid: clean up CTA data block tag definitions
Date: Thu, 14 Apr 2022 18:06:46 +0300
Message-Id: <ef5d010ad35056f66c3f5a014ad1c280ba0d7f60.1649948562.git.jani.nikula@intel.com>
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

Add prefixed names, group, sort, add references.

v2:
- Updated references to CTA-861-H
- s/CEA/CTA/ in data block macros

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 65 ++++++++++++++++++++------------------
 1 file changed, 35 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 32ece9607b94..18b0ff223885 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3486,16 +3486,21 @@ add_detailed_modes(struct drm_connector *connector, const struct edid *edid,
 	return closure.modes;
 }
 
-#define AUDIO_BLOCK	0x01
-#define VIDEO_BLOCK     0x02
-#define VENDOR_BLOCK    0x03
-#define SPEAKER_BLOCK	0x04
-#define HDR_STATIC_METADATA_BLOCK	0x6
-#define USE_EXTENDED_TAG 0x07
-#define EXT_VIDEO_CAPABILITY_BLOCK 0x00
-#define EXT_VIDEO_DATA_BLOCK_420	0x0E
-#define EXT_VIDEO_CAP_BLOCK_Y420CMDB 0x0F
-#define EXT_VIDEO_HF_SCDB_DATA_BLOCK	0x79
+/* CTA-861-H Table 60 - CTA Tag Codes */
+#define CTA_DB_AUDIO			1
+#define CTA_DB_VIDEO			2
+#define CTA_DB_VENDOR			3
+#define CTA_DB_SPEAKER			4
+#define CTA_DB_EXTENDED_TAG		7
+
+/* CTA-861-H Table 62 - CTA Extended Tag Codes */
+#define CTA_EXT_DB_VIDEO_CAP		0
+#define CTA_EXT_DB_VENDOR		1
+#define CTA_EXT_DB_HDR_STATIC_METADATA	6
+#define CTA_EXT_DB_420_VIDEO_DATA	14
+#define CTA_EXT_DB_420_VIDEO_CAP_MAP	15
+#define CTA_EXT_DB_HF_SCDB		0x79
+
 #define EDID_BASIC_AUDIO	(1 << 6)
 #define EDID_CEA_YCRCB444	(1 << 5)
 #define EDID_CEA_YCRCB422	(1 << 4)
@@ -4382,7 +4387,7 @@ cea_db_offsets(const u8 *cea, int *start, int *end)
 
 static bool cea_db_is_hdmi_vsdb(const u8 *db)
 {
-	if (cea_db_tag(db) != VENDOR_BLOCK)
+	if (cea_db_tag(db) != CTA_DB_VENDOR)
 		return false;
 
 	if (cea_db_payload_len(db) < 5)
@@ -4393,7 +4398,7 @@ static bool cea_db_is_hdmi_vsdb(const u8 *db)
 
 static bool cea_db_is_hdmi_forum_vsdb(const u8 *db)
 {
-	if (cea_db_tag(db) != VENDOR_BLOCK)
+	if (cea_db_tag(db) != CTA_DB_VENDOR)
 		return false;
 
 	if (cea_db_payload_len(db) < 7)
@@ -4404,7 +4409,7 @@ static bool cea_db_is_hdmi_forum_vsdb(const u8 *db)
 
 static bool cea_db_is_microsoft_vsdb(const u8 *db)
 {
-	if (cea_db_tag(db) != VENDOR_BLOCK)
+	if (cea_db_tag(db) != CTA_DB_VENDOR)
 		return false;
 
 	if (cea_db_payload_len(db) != 21)
@@ -4415,13 +4420,13 @@ static bool cea_db_is_microsoft_vsdb(const u8 *db)
 
 static bool cea_db_is_vcdb(const u8 *db)
 {
-	if (cea_db_tag(db) != USE_EXTENDED_TAG)
+	if (cea_db_tag(db) != CTA_DB_EXTENDED_TAG)
 		return false;
 
 	if (cea_db_payload_len(db) != 2)
 		return false;
 
-	if (cea_db_extended_tag(db) != EXT_VIDEO_CAPABILITY_BLOCK)
+	if (cea_db_extended_tag(db) != CTA_EXT_DB_VIDEO_CAP)
 		return false;
 
 	return true;
@@ -4429,13 +4434,13 @@ static bool cea_db_is_vcdb(const u8 *db)
 
 static bool cea_db_is_hdmi_forum_scdb(const u8 *db)
 {
-	if (cea_db_tag(db) != USE_EXTENDED_TAG)
+	if (cea_db_tag(db) != CTA_DB_EXTENDED_TAG)
 		return false;
 
 	if (cea_db_payload_len(db) < 7)
 		return false;
 
-	if (cea_db_extended_tag(db) != EXT_VIDEO_HF_SCDB_DATA_BLOCK)
+	if (cea_db_extended_tag(db) != CTA_EXT_DB_HF_SCDB)
 		return false;
 
 	return true;
@@ -4443,13 +4448,13 @@ static bool cea_db_is_hdmi_forum_scdb(const u8 *db)
 
 static bool cea_db_is_y420cmdb(const u8 *db)
 {
-	if (cea_db_tag(db) != USE_EXTENDED_TAG)
+	if (cea_db_tag(db) != CTA_DB_EXTENDED_TAG)
 		return false;
 
 	if (!cea_db_payload_len(db))
 		return false;
 
-	if (cea_db_extended_tag(db) != EXT_VIDEO_CAP_BLOCK_Y420CMDB)
+	if (cea_db_extended_tag(db) != CTA_EXT_DB_420_VIDEO_CAP_MAP)
 		return false;
 
 	return true;
@@ -4457,13 +4462,13 @@ static bool cea_db_is_y420cmdb(const u8 *db)
 
 static bool cea_db_is_y420vdb(const u8 *db)
 {
-	if (cea_db_tag(db) != USE_EXTENDED_TAG)
+	if (cea_db_tag(db) != CTA_DB_EXTENDED_TAG)
 		return false;
 
 	if (!cea_db_payload_len(db))
 		return false;
 
-	if (cea_db_extended_tag(db) != EXT_VIDEO_DATA_BLOCK_420)
+	if (cea_db_extended_tag(db) != CTA_EXT_DB_420_VIDEO_DATA)
 		return false;
 
 	return true;
@@ -4530,7 +4535,7 @@ add_cea_modes(struct drm_connector *connector, const struct edid *edid)
 			db = &cea[i];
 			dbl = cea_db_payload_len(db);
 
-			if (cea_db_tag(db) == VIDEO_BLOCK) {
+			if (cea_db_tag(db) == CTA_DB_VIDEO) {
 				video = db + 1;
 				video_len = dbl;
 				modes += do_cea_modes(connector, video, dbl);
@@ -4604,10 +4609,10 @@ static void fixup_detailed_cea_mode_clock(struct drm_display_mode *mode)
 
 static bool cea_db_is_hdmi_hdr_metadata_block(const u8 *db)
 {
-	if (cea_db_tag(db) != USE_EXTENDED_TAG)
+	if (cea_db_tag(db) != CTA_DB_EXTENDED_TAG)
 		return false;
 
-	if (db[1] != HDR_STATIC_METADATA_BLOCK)
+	if (db[1] != CTA_EXT_DB_HDR_STATIC_METADATA)
 		return false;
 
 	if (cea_db_payload_len(db) < 3)
@@ -4801,7 +4806,7 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 			dbl = cea_db_payload_len(db);
 
 			switch (cea_db_tag(db)) {
-			case AUDIO_BLOCK:
+			case CTA_DB_AUDIO:
 				/* Audio Data Block, contains SADs */
 				sad_count = min(dbl / 3, 15 - total_sad_count);
 				if (sad_count >= 1)
@@ -4809,12 +4814,12 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 					       &db[1], sad_count * 3);
 				total_sad_count += sad_count;
 				break;
-			case SPEAKER_BLOCK:
+			case CTA_DB_SPEAKER:
 				/* Speaker Allocation Data Block */
 				if (dbl >= 1)
 					eld[DRM_ELD_SPEAKER] = db[1];
 				break;
-			case VENDOR_BLOCK:
+			case CTA_DB_VENDOR:
 				/* HDMI Vendor-Specific Data Block */
 				if (cea_db_is_hdmi_vsdb(db))
 					drm_parse_hdmi_vsdb_audio(connector, db);
@@ -4875,7 +4880,7 @@ int drm_edid_to_sad(const struct edid *edid, struct cea_sad **sads)
 	for_each_cea_db(cea, i, start, end) {
 		const u8 *db = &cea[i];
 
-		if (cea_db_tag(db) == AUDIO_BLOCK) {
+		if (cea_db_tag(db) == CTA_DB_AUDIO) {
 			int j;
 
 			dbl = cea_db_payload_len(db);
@@ -4937,7 +4942,7 @@ int drm_edid_to_speaker_allocation(const struct edid *edid, u8 **sadb)
 	for_each_cea_db(cea, i, start, end) {
 		const u8 *db = &cea[i];
 
-		if (cea_db_tag(db) == SPEAKER_BLOCK) {
+		if (cea_db_tag(db) == CTA_DB_SPEAKER) {
 			dbl = cea_db_payload_len(db);
 
 			/* Speaker Allocation Data Block */
@@ -5068,7 +5073,7 @@ bool drm_detect_monitor_audio(const struct edid *edid)
 		goto end;
 
 	for_each_cea_db(edid_ext, i, start_offset, end_offset) {
-		if (cea_db_tag(&edid_ext[i]) == AUDIO_BLOCK) {
+		if (cea_db_tag(&edid_ext[i]) == CTA_DB_AUDIO) {
 			has_audio = true;
 			for (j = 1; j < cea_db_payload_len(&edid_ext[i]) + 1; j += 3)
 				DRM_DEBUG_KMS("CEA audio format %d\n",
-- 
2.30.2

