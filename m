Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A164E486D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 22:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5391110E57A;
	Tue, 22 Mar 2022 21:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A997310E575;
 Tue, 22 Mar 2022 21:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647985275; x=1679521275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pl0LitKoau9L3rmWeDkWAuolUD50oQZTSw+ksNnhMt8=;
 b=DCPfQ/HBHImy6QCYk5QLUG08fuyZNKeTbLuoC3kcSHMWLV76bzCiKtMD
 w3vSiZrasuAAbRRRxX0EaCLzBH50qbVA5aw/+Owh2NCm/3ESa2I+tf9Uu
 Kk7E7+GTgeYiOawbqTTIis3ww5qDH5WBD/Y+KZFNXQhp483C3jSyt0QLf
 p7t2b8NTni/BpppJdZ649DPypgZxPB7EoyCwiiw2KJh8pYxugy3klWVHU
 Zlw6v9kUL1SxRO0QgQ4G8AJD2s7xy2A47KD8aOczZEtEEPKrqlUMeD8KU
 DXYC+2xcIq5iC30TnDzHIhxqIStdnO/kWpM3oGFQkmo34Ly50cbdUuJBC g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="238559520"
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="238559520"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 14:41:14 -0700
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="717135761"
Received: from sburacze-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.58.237])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 14:41:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 03/19] drm/edid: clean up CEA data block tag definitions
Date: Tue, 22 Mar 2022 23:40:32 +0200
Message-Id: <657900c5a984a0bd7a830686cb5f919ae16912f8.1647985054.git.jani.nikula@intel.com>
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

Add prefixed names, group, sort, add references.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 59 +++++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index b96906774433..6c188539493e 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3329,15 +3329,20 @@ add_detailed_modes(struct drm_connector *connector, struct edid *edid,
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
+/* CEA-861-F Table 44 CEA Data Block Tag Codes */
+#define CEA_DB_AUDIO			1
+#define CEA_DB_VIDEO			2
+#define CEA_DB_VENDOR			3
+#define CEA_DB_SPEAKER			4
+#define CEA_DB_EXTENDED_TAG		7
+
+/* CEA-861-F Table 46 CEA Data Block Tag Codes */
+#define CEA_EXT_DB_VIDEO_CAP		0
+#define CEA_EXT_DB_VENDOR		1
+#define CEA_EXT_DB_HDR_STATIC_METADATA	6 /* CEA-861.3 2005 */
+#define CEA_EXT_DB_420_VIDEO_DATA	14
+#define CEA_EXT_DB_420_VIDEO_CAP_MAP	15
+
 #define EDID_BASIC_AUDIO	(1 << 6)
 #define EDID_CEA_YCRCB444	(1 << 5)
 #define EDID_CEA_YCRCB422	(1 << 4)
@@ -4220,7 +4225,7 @@ cea_db_offsets(const u8 *cea, int *start, int *end)
 
 static bool cea_db_is_hdmi_vsdb(const u8 *db)
 {
-	if (cea_db_tag(db) != VENDOR_BLOCK)
+	if (cea_db_tag(db) != CEA_DB_VENDOR)
 		return false;
 
 	if (cea_db_payload_len(db) < 5)
@@ -4231,7 +4236,7 @@ static bool cea_db_is_hdmi_vsdb(const u8 *db)
 
 static bool cea_db_is_hdmi_forum_vsdb(const u8 *db)
 {
-	if (cea_db_tag(db) != VENDOR_BLOCK)
+	if (cea_db_tag(db) != CEA_DB_VENDOR)
 		return false;
 
 	if (cea_db_payload_len(db) < 7)
@@ -4242,7 +4247,7 @@ static bool cea_db_is_hdmi_forum_vsdb(const u8 *db)
 
 static bool cea_db_is_microsoft_vsdb(const u8 *db)
 {
-	if (cea_db_tag(db) != VENDOR_BLOCK)
+	if (cea_db_tag(db) != CEA_DB_VENDOR)
 		return false;
 
 	if (cea_db_payload_len(db) != 21)
@@ -4253,13 +4258,13 @@ static bool cea_db_is_microsoft_vsdb(const u8 *db)
 
 static bool cea_db_is_vcdb(const u8 *db)
 {
-	if (cea_db_tag(db) != USE_EXTENDED_TAG)
+	if (cea_db_tag(db) != CEA_DB_EXTENDED_TAG)
 		return false;
 
 	if (cea_db_payload_len(db) != 2)
 		return false;
 
-	if (cea_db_extended_tag(db) != EXT_VIDEO_CAPABILITY_BLOCK)
+	if (cea_db_extended_tag(db) != CEA_EXT_DB_VIDEO_CAP)
 		return false;
 
 	return true;
@@ -4267,13 +4272,13 @@ static bool cea_db_is_vcdb(const u8 *db)
 
 static bool cea_db_is_y420cmdb(const u8 *db)
 {
-	if (cea_db_tag(db) != USE_EXTENDED_TAG)
+	if (cea_db_tag(db) != CEA_DB_EXTENDED_TAG)
 		return false;
 
 	if (!cea_db_payload_len(db))
 		return false;
 
-	if (cea_db_extended_tag(db) != EXT_VIDEO_CAP_BLOCK_Y420CMDB)
+	if (cea_db_extended_tag(db) != CEA_EXT_DB_420_VIDEO_CAP_MAP)
 		return false;
 
 	return true;
@@ -4281,13 +4286,13 @@ static bool cea_db_is_y420cmdb(const u8 *db)
 
 static bool cea_db_is_y420vdb(const u8 *db)
 {
-	if (cea_db_tag(db) != USE_EXTENDED_TAG)
+	if (cea_db_tag(db) != CEA_DB_EXTENDED_TAG)
 		return false;
 
 	if (!cea_db_payload_len(db))
 		return false;
 
-	if (cea_db_extended_tag(db) != EXT_VIDEO_DATA_BLOCK_420)
+	if (cea_db_extended_tag(db) != CEA_EXT_DB_420_VIDEO_DATA)
 		return false;
 
 	return true;
@@ -4354,7 +4359,7 @@ add_cea_modes(struct drm_connector *connector, struct edid *edid)
 			db = &cea[i];
 			dbl = cea_db_payload_len(db);
 
-			if (cea_db_tag(db) == VIDEO_BLOCK) {
+			if (cea_db_tag(db) == CEA_DB_VIDEO) {
 				video = db + 1;
 				video_len = dbl;
 				modes += do_cea_modes(connector, video, dbl);
@@ -4428,10 +4433,10 @@ static void fixup_detailed_cea_mode_clock(struct drm_display_mode *mode)
 
 static bool cea_db_is_hdmi_hdr_metadata_block(const u8 *db)
 {
-	if (cea_db_tag(db) != USE_EXTENDED_TAG)
+	if (cea_db_tag(db) != CEA_DB_EXTENDED_TAG)
 		return false;
 
-	if (db[1] != HDR_STATIC_METADATA_BLOCK)
+	if (db[1] != CEA_EXT_DB_HDR_STATIC_METADATA)
 		return false;
 
 	if (cea_db_payload_len(db) < 3)
@@ -4622,7 +4627,7 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
 			dbl = cea_db_payload_len(db);
 
 			switch (cea_db_tag(db)) {
-			case AUDIO_BLOCK:
+			case CEA_DB_AUDIO:
 				/* Audio Data Block, contains SADs */
 				sad_count = min(dbl / 3, 15 - total_sad_count);
 				if (sad_count >= 1)
@@ -4630,12 +4635,12 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
 					       &db[1], sad_count * 3);
 				total_sad_count += sad_count;
 				break;
-			case SPEAKER_BLOCK:
+			case CEA_DB_SPEAKER:
 				/* Speaker Allocation Data Block */
 				if (dbl >= 1)
 					eld[DRM_ELD_SPEAKER] = db[1];
 				break;
-			case VENDOR_BLOCK:
+			case CEA_DB_VENDOR:
 				/* HDMI Vendor-Specific Data Block */
 				if (cea_db_is_hdmi_vsdb(db))
 					drm_parse_hdmi_vsdb_audio(connector, db);
@@ -4696,7 +4701,7 @@ int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads)
 	for_each_cea_db(cea, i, start, end) {
 		const u8 *db = &cea[i];
 
-		if (cea_db_tag(db) == AUDIO_BLOCK) {
+		if (cea_db_tag(db) == CEA_DB_AUDIO) {
 			int j;
 
 			dbl = cea_db_payload_len(db);
@@ -4758,7 +4763,7 @@ int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb)
 	for_each_cea_db(cea, i, start, end) {
 		const u8 *db = &cea[i];
 
-		if (cea_db_tag(db) == SPEAKER_BLOCK) {
+		if (cea_db_tag(db) == CEA_DB_SPEAKER) {
 			dbl = cea_db_payload_len(db);
 
 			/* Speaker Allocation Data Block */
@@ -4888,7 +4893,7 @@ bool drm_detect_monitor_audio(struct edid *edid)
 		goto end;
 
 	for_each_cea_db(edid_ext, i, start_offset, end_offset) {
-		if (cea_db_tag(&edid_ext[i]) == AUDIO_BLOCK) {
+		if (cea_db_tag(&edid_ext[i]) == CEA_DB_AUDIO) {
 			has_audio = true;
 			for (j = 1; j < cea_db_payload_len(&edid_ext[i]) + 1; j += 3)
 				DRM_DEBUG_KMS("CEA audio format %d\n",
-- 
2.30.2

