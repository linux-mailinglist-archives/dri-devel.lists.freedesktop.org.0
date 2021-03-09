Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 947023327CA
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 14:54:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793A76E8F7;
	Tue,  9 Mar 2021 13:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2146E8F7;
 Tue,  9 Mar 2021 13:54:35 +0000 (UTC)
IronPort-SDR: ycC7NE3SKvorsIR4tfUonsbSD1Zbe36wCLVMtvTuM5F7Mv1iTyrteVYPiOEuKXrtU5E11KpmUl
 Fs+vBJN2Ra6w==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="252258567"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; d="scan'208";a="252258567"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 05:54:35 -0800
IronPort-SDR: yTkuoRG9ZUBSDlRF0PITdCsz/RIYWLAtdOk+L1uy6t7UrnEdysordNQs+GnCIqomzzXaHPUtFe
 CVHEyQn3veig==
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; d="scan'208";a="403238698"
Received: from kjwindec-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.48.180])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 05:54:33 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC v1 1/6] drm/edid: make a number of functions,
 parameters and variables const
Date: Tue,  9 Mar 2021 15:54:09 +0200
Message-Id: <23463d5d4c75291d0665a23c91160e38cf6dbe5d.1615297748.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1615297748.git.jani.nikula@intel.com>
References: <cover.1615297748.git.jani.nikula@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If there's no need to change it, it should be const. There's more to be
done, but start off with changes that make follow-up work easier. No
functional changes.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c  | 58 ++++++++++++++++++-------------------
 include/drm/drm_displayid.h |  4 +--
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index c2bbe7bee7b6..d510b827a1f8 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1585,7 +1585,7 @@ module_param_named(edid_fixup, edid_fixup, int, 0400);
 MODULE_PARM_DESC(edid_fixup,
 		 "Minimum number of valid EDID header bytes (0-8, default 6)");
 
-static int validate_displayid(u8 *displayid, int length, int idx);
+static int validate_displayid(const u8 *displayid, int length, int idx);
 
 static int drm_edid_block_checksum(const u8 *raw_edid)
 {
@@ -3241,10 +3241,10 @@ add_detailed_modes(struct drm_connector *connector, struct edid *edid,
 /*
  * Search EDID for CEA extension block.
  */
-static u8 *drm_find_edid_extension(const struct edid *edid,
-				   int ext_id, int *ext_index)
+static const u8 *drm_find_edid_extension(const struct edid *edid,
+					 int ext_id, int *ext_index)
 {
-	u8 *edid_ext = NULL;
+	const u8 *edid_ext = NULL;
 	int i;
 
 	/* No EDID or EDID extensions */
@@ -3253,7 +3253,7 @@ static u8 *drm_find_edid_extension(const struct edid *edid,
 
 	/* Find CEA extension */
 	for (i = *ext_index; i < edid->extensions; i++) {
-		edid_ext = (u8 *)edid + EDID_LENGTH * (i + 1);
+		edid_ext = (const u8 *)edid + EDID_LENGTH * (i + 1);
 		if (edid_ext[0] == ext_id)
 			break;
 	}
@@ -3267,12 +3267,12 @@ static u8 *drm_find_edid_extension(const struct edid *edid,
 }
 
 
-static u8 *drm_find_displayid_extension(const struct edid *edid,
-					int *length, int *idx,
-					int *ext_index)
+static const u8 *drm_find_displayid_extension(const struct edid *edid,
+					      int *length, int *idx,
+					      int *ext_index)
 {
-	u8 *displayid = drm_find_edid_extension(edid, DISPLAYID_EXT, ext_index);
-	struct displayid_hdr *base;
+	const u8 *displayid = drm_find_edid_extension(edid, DISPLAYID_EXT, ext_index);
+	const struct displayid_hdr *base;
 	int ret;
 
 	if (!displayid)
@@ -3286,18 +3286,18 @@ static u8 *drm_find_displayid_extension(const struct edid *edid,
 	if (ret)
 		return NULL;
 
-	base = (struct displayid_hdr *)&displayid[*idx];
+	base = (const struct displayid_hdr *)&displayid[*idx];
 	*length = *idx + sizeof(*base) + base->bytes;
 
 	return displayid;
 }
 
-static u8 *drm_find_cea_extension(const struct edid *edid)
+static const u8 *drm_find_cea_extension(const struct edid *edid)
 {
 	int length, idx;
-	struct displayid_block *block;
-	u8 *cea;
-	u8 *displayid;
+	const struct displayid_block *block;
+	const u8 *cea;
+	const u8 *displayid;
 	int ext_index;
 
 	/* Look for a top level CEA extension block */
@@ -3318,7 +3318,7 @@ static u8 *drm_find_cea_extension(const struct edid *edid)
 		idx += sizeof(struct displayid_hdr);
 		for_each_displayid_db(displayid, block, idx, length) {
 			if (block->tag == DATA_BLOCK_CTA)
-				return (u8 *)block;
+				return (const u8 *)block;
 		}
 	}
 
@@ -4503,8 +4503,8 @@ static void clear_eld(struct drm_connector *connector)
 static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
 {
 	uint8_t *eld = connector->eld;
-	u8 *cea;
-	u8 *db;
+	const u8 *cea;
+	const u8 *db;
 	int total_sad_count = 0;
 	int mnl;
 	int dbl;
@@ -4600,7 +4600,7 @@ int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads)
 {
 	int count = 0;
 	int i, start, end, dbl;
-	u8 *cea;
+	const u8 *cea;
 
 	cea = drm_find_cea_extension(edid);
 	if (!cea) {
@@ -4619,7 +4619,7 @@ int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads)
 	}
 
 	for_each_cea_db(cea, i, start, end) {
-		u8 *db = &cea[i];
+		const u8 *db = &cea[i];
 
 		if (cea_db_tag(db) == AUDIO_BLOCK) {
 			int j;
@@ -4631,7 +4631,7 @@ int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads)
 			if (!*sads)
 				return -ENOMEM;
 			for (j = 0; j < count; j++) {
-				u8 *sad = &db[1 + j * 3];
+				const u8 *sad = &db[1 + j * 3];
 
 				(*sads)[j].format = (sad[0] & 0x78) >> 3;
 				(*sads)[j].channels = sad[0] & 0x7;
@@ -4755,7 +4755,7 @@ EXPORT_SYMBOL(drm_av_sync_delay);
  */
 bool drm_detect_hdmi_monitor(struct edid *edid)
 {
-	u8 *edid_ext;
+	const u8 *edid_ext;
 	int i;
 	int start_offset, end_offset;
 
@@ -4793,7 +4793,7 @@ EXPORT_SYMBOL(drm_detect_hdmi_monitor);
  */
 bool drm_detect_monitor_audio(struct edid *edid)
 {
-	u8 *edid_ext;
+	const u8 *edid_ext;
 	int i, j;
 	bool has_audio = false;
 	int start_offset, end_offset;
@@ -5287,13 +5287,13 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
 	return quirks;
 }
 
-static int validate_displayid(u8 *displayid, int length, int idx)
+static int validate_displayid(const u8 *displayid, int length, int idx)
 {
 	int i, dispid_length;
 	u8 csum = 0;
-	struct displayid_hdr *base;
+	const struct displayid_hdr *base;
 
-	base = (struct displayid_hdr *)&displayid[idx];
+	base = (const struct displayid_hdr *)&displayid[idx];
 
 	DRM_DEBUG_KMS("base revision 0x%x, length %d, %d %d\n",
 		      base->rev, base->bytes, base->prod_id, base->ext_count);
@@ -5359,7 +5359,7 @@ static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *d
 }
 
 static int add_displayid_detailed_1_modes(struct drm_connector *connector,
-					  struct displayid_block *block)
+					  const struct displayid_block *block)
 {
 	struct displayid_detailed_timing_block *det = (struct displayid_detailed_timing_block *)block;
 	int i;
@@ -5387,9 +5387,9 @@ static int add_displayid_detailed_1_modes(struct drm_connector *connector,
 static int add_displayid_detailed_modes(struct drm_connector *connector,
 					struct edid *edid)
 {
-	u8 *displayid;
+	const u8 *displayid;
 	int length, idx;
-	struct displayid_block *block;
+	const struct displayid_block *block;
 	int num_modes = 0;
 	int ext_index = 0;
 
diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h
index 77941efb5426..f141c0eff083 100644
--- a/include/drm/drm_displayid.h
+++ b/include/drm/drm_displayid.h
@@ -93,11 +93,11 @@ struct displayid_detailed_timing_block {
 };
 
 #define for_each_displayid_db(displayid, block, idx, length) \
-	for ((block) = (struct displayid_block *)&(displayid)[idx]; \
+	for ((block) = (const struct displayid_block *)&(displayid)[idx]; \
 	     (idx) + sizeof(struct displayid_block) <= (length) && \
 	     (idx) + sizeof(struct displayid_block) + (block)->num_bytes <= (length) && \
 	     (block)->num_bytes > 0; \
 	     (idx) += sizeof(struct displayid_block) + (block)->num_bytes, \
-	     (block) = (struct displayid_block *)&(displayid)[idx])
+	     (block) = (const struct displayid_block *)&(displayid)[idx])
 
 #endif
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
