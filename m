Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAC24C9F65
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 09:38:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E168110EBEC;
	Wed,  2 Mar 2022 08:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3978310EBB5
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 08:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646210279; x=1677746279;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=mIuhDtlrgen1l9iRAE8No5i7Dyr4qpdBl/nKYxgko7k=;
 b=LTzjrRhxaBSMu81yG9dZ3Vj3HNqkSCFp5WW27sLFn/vumCY+korBvfRZ
 UzbyrElgwmFG83Jq+DTzMR2D8JE6x5O/VIYW5wfexrtZSNyL6tjg+I2/+
 tlAwrW2JXbP21dCdzhC0riJgq5dZF3BeyAU5I+EQ7bUWz7PP5upd0jfv+
 tQaic99000zn+oql7eip0IEELHB7dtY8r/DN+euRWq56i7a9J819bZc9o
 6So0wb0cyQIpXdUgzAWOnHv9D9nFT8PQOAt86uz89rbbZwDSz/dp7D9nQ
 qYqhtuzZrJI75eWl86a0JBrLTgxnCk7kTsYXIiYa77dWAJ0/wj6ejc4h5 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="253539697"
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="253539697"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 00:37:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="508124716"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by orsmga002.jf.intel.com with ESMTP; 02 Mar 2022 00:37:57 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [v3 4/4] drm/edid: parse HF-EEODB CEA extension block
Date: Wed,  2 Mar 2022 16:50:57 +0800
Message-Id: <20220302085057.27317-5-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220302085057.27317-1-shawn.c.lee@intel.com>
References: <20220302085057.27317-1-shawn.c.lee@intel.com>
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
Cc: jani.nikula@intel.com, ankit.k.nautiyal@intel.com,
 Lee Shawn C <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While adding CEA modes, try to get available EEODB block
number. Then based on it to parse numbers of ext blocks,
retrieve CEA information and add more CEA modes.

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 drivers/gpu/drm/drm_displayid.c |  5 ++++-
 drivers/gpu/drm/drm_edid.c      | 35 +++++++++++++++++++--------------
 include/drm/drm_edid.h          |  2 +-
 3 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displayid.c
index 32da557b960f..dc649a9efaa2 100644
--- a/drivers/gpu/drm/drm_displayid.c
+++ b/drivers/gpu/drm/drm_displayid.c
@@ -37,7 +37,10 @@ static const u8 *drm_find_displayid_extension(const struct edid *edid,
 					      int *length, int *idx,
 					      int *ext_index)
 {
-	const u8 *displayid = drm_find_edid_extension(edid, DISPLAYID_EXT, ext_index);
+	const u8 *displayid = drm_find_edid_extension(edid,
+						      DISPLAYID_EXT,
+						      ext_index,
+						      edid->extensions);
 	const struct displayid_header *base;
 	int ret;
 
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index e5ac9ab0b9d0..2b8ddc956ce2 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3360,23 +3360,23 @@ add_detailed_modes(struct drm_connector *connector, struct edid *edid,
  * Search EDID for CEA extension block.
  */
 const u8 *drm_find_edid_extension(const struct edid *edid,
-				  int ext_id, int *ext_index)
+				  int ext_id, int *ext_index, int ext_blk_num)
 {
 	const u8 *edid_ext = NULL;
 	int i;
 
 	/* No EDID or EDID extensions */
-	if (edid == NULL || edid->extensions == 0)
+	if (edid == NULL || edid->extensions == 0 || *ext_index >= ext_blk_num)
 		return NULL;
 
 	/* Find CEA extension */
-	for (i = *ext_index; i < edid->extensions; i++) {
+	for (i = *ext_index; i < ext_blk_num; i++) {
 		edid_ext = (const u8 *)edid + EDID_LENGTH * (i + 1);
 		if (edid_ext[0] == ext_id)
 			break;
 	}
 
-	if (i >= edid->extensions)
+	if (i >= ext_blk_num)
 		return NULL;
 
 	*ext_index = i + 1;
@@ -3384,14 +3384,15 @@ const u8 *drm_find_edid_extension(const struct edid *edid,
 	return edid_ext;
 }
 
-static const u8 *drm_find_cea_extension(const struct edid *edid, int *ext_index)
+static const u8 *drm_find_cea_extension(const struct edid *edid,
+					int *ext_index, int ext_blk_num)
 {
 	const struct displayid_block *block;
 	struct displayid_iter iter;
 	const u8 *cea;
 
 	/* Look for a CEA extension block from ext_index */
-	cea = drm_find_edid_extension(edid, CEA_EXT, ext_index);
+	cea = drm_find_edid_extension(edid, CEA_EXT, ext_index, ext_blk_num);
 	if (cea)
 		return cea;
 
@@ -3675,7 +3676,7 @@ add_alternate_cea_modes(struct drm_connector *connector, struct edid *edid)
 	int modes = 0, ext_index = 0;
 
 	/* Don't add CEA modes if the CEA extension block is missing */
-	if (!drm_find_cea_extension(edid, &ext_index))
+	if (!drm_find_cea_extension(edid, &ext_index, edid->extensions))
 		return 0;
 
 	/*
@@ -4327,7 +4328,7 @@ size_t drm_edid_read_hf_eeodb_blk_count(const struct edid *edid)
 	int i, start, end, ext_index = 0;
 
 	if (edid->extensions) {
-		cea = drm_find_cea_extension(edid, &ext_index);
+		cea = drm_find_cea_extension(edid, &ext_index, edid->extensions);
 
 		if (cea && !cea_db_offsets(cea, &start, &end))
 			for_each_cea_db(cea, i, start, end)
@@ -4386,12 +4387,16 @@ add_cea_modes(struct drm_connector *connector, struct edid *edid)
 	u8 dbl, hdmi_len;
 	int modes = 0, ext_index = 0;
 	int i, start, end;
+	int ext_blk_num = drm_edid_read_hf_eeodb_blk_count(edid);
+
+	if (!ext_blk_num)
+		ext_blk_num = edid->extensions;
 
 	for (;;) {
 		const u8 *hdmi = NULL, *video = NULL;
 		u8 video_len = 0;
 
-		cea = drm_find_cea_extension(edid, &ext_index);
+		cea = drm_find_cea_extension(edid, &ext_index, ext_blk_num);
 		if (!cea)
 			break;
 
@@ -4640,7 +4645,7 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
 	if (!edid)
 		return;
 
-	cea = drm_find_cea_extension(edid, &ext_index);
+	cea = drm_find_cea_extension(edid, &ext_index, edid->extensions);
 	if (!cea) {
 		DRM_DEBUG_KMS("ELD: no CEA Extension found\n");
 		return;
@@ -4728,7 +4733,7 @@ int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads)
 	int i, start, end, dbl;
 	const u8 *cea;
 
-	cea = drm_find_cea_extension(edid, &ext_index);
+	cea = drm_find_cea_extension(edid, &ext_index, edid->extensions);
 	if (!cea) {
 		DRM_DEBUG_KMS("SAD: no CEA Extension found\n");
 		return 0;
@@ -4790,7 +4795,7 @@ int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb)
 	int i, start, end, dbl;
 	const u8 *cea;
 
-	cea = drm_find_cea_extension(edid, &ext_index);
+	cea = drm_find_cea_extension(edid, &ext_index, edid->extensions);
 	if (!cea) {
 		DRM_DEBUG_KMS("SAD: no CEA Extension found\n");
 		return 0;
@@ -4885,7 +4890,7 @@ bool drm_detect_hdmi_monitor(struct edid *edid)
 	int i;
 	int start_offset, end_offset, ext_index = 0;
 
-	edid_ext = drm_find_cea_extension(edid, &ext_index);
+	edid_ext = drm_find_cea_extension(edid, &ext_index, edid->extensions);
 	if (!edid_ext)
 		return false;
 
@@ -4924,7 +4929,7 @@ bool drm_detect_monitor_audio(struct edid *edid)
 	bool has_audio = false;
 	int start_offset, end_offset, ext_index = 0;
 
-	edid_ext = drm_find_cea_extension(edid, &ext_index);
+	edid_ext = drm_find_cea_extension(edid, &ext_index, edid->extensions);
 	if (!edid_ext)
 		goto end;
 
@@ -5248,7 +5253,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 	const u8 *edid_ext;
 	int i, start, end, ext_index = 0;
 
-	edid_ext = drm_find_cea_extension(edid, &ext_index);
+	edid_ext = drm_find_cea_extension(edid, &ext_index, edid->extensions);
 	if (!edid_ext)
 		return;
 
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 5549da7bd7be..5555b27e92f9 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -591,7 +591,7 @@ struct drm_display_mode *
 drm_display_mode_from_cea_vic(struct drm_device *dev,
 			      u8 video_code);
 const u8 *drm_find_edid_extension(const struct edid *edid,
-				  int ext_id, int *ext_index);
+				  int ext_id, int *ext_index, int ext_blk_num);
 size_t drm_edid_read_hf_eeodb_blk_count(const struct edid *edid);
 
 #endif /* __DRM_EDID_H__ */
-- 
2.31.1

