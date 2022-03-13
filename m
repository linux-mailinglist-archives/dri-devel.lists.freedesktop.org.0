Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 507C74D7577
	for <lists+dri-devel@lfdr.de>; Sun, 13 Mar 2022 14:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC9710E0EA;
	Sun, 13 Mar 2022 13:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E143910E059;
 Sun, 13 Mar 2022 13:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647178392; x=1678714392;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=vKEZg0+EkVYEaMN4aLC1RwqiZW9Cg/uYRPYdTysJ+KI=;
 b=Z3W+2eESGzcg7M7l1oQZxAKOB9Vsuh2n9A8Qrmpia98kCb6fZMkZv5Zl
 0H713es3RURuFgayK0U/tePvdHN1d7SUcgy+Iux9xoagM9dNVG4+YTzN+
 hxPrJH1uW2Vyc/bGyBBKYFN7UnAM9x7JfdzcOEhK/iQ+L6X8w8mEPQfOE
 IK/tIi/tOhX9wxhPMlHbcPLxojM+4N+dGHDtpIxGqB5JgpBiuz9RMRhJl
 uc699KNvrXrb9JAPuTFNQGonv7j9d0wCjWUfR5vToPVaGbHvJl765kRMX
 TruDmH2qj+9aVVj5bnwCjTHv4H2RJbR9yXExa8TRQhPDjD7m3j/hp8R8R A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10284"; a="255600690"
X-IronPort-AV: E=Sophos;i="5.90,178,1643702400"; d="scan'208";a="255600690"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 06:33:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,178,1643702400"; d="scan'208";a="515101465"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by orsmga006.jf.intel.com with ESMTP; 13 Mar 2022 06:33:11 -0700
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [v7 1/5] drm/edid: seek for available CEA and DisplayID block from
 specific EDID block index
Date: Sun, 13 Mar 2022 21:46:58 +0800
Message-Id: <20220313134702.24175-2-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220313134702.24175-1-shawn.c.lee@intel.com>
References: <20220313134702.24175-1-shawn.c.lee@intel.com>
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
 Drew Davenport <ddavenport@chromium.org>, ankit.k.nautiyal@intel.com,
 Lee Shawn C <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_find_cea_extension() always look for a top level CEA block. Pass
ext_index from caller then this function to search next available
CEA ext block from a specific EDID block pointer.

v2: save proper extension block index if CTA data information
    was found in DispalyID block.
v3: using different parameters to store CEA and DisplayID block index.
    configure DisplayID extansion block index before search available
    DisplayID block.

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Drew Davenport <ddavenport@chromium.org>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 drivers/gpu/drm/drm_displayid.c | 10 +++++--
 drivers/gpu/drm/drm_edid.c      | 53 ++++++++++++++++++---------------
 include/drm/drm_displayid.h     |  4 +--
 3 files changed, 39 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displayid.c
index 32da557b960f..31c3e6d7d549 100644
--- a/drivers/gpu/drm/drm_displayid.c
+++ b/drivers/gpu/drm/drm_displayid.c
@@ -59,11 +59,14 @@ static const u8 *drm_find_displayid_extension(const struct edid *edid,
 }
 
 void displayid_iter_edid_begin(const struct edid *edid,
-			       struct displayid_iter *iter)
+			       struct displayid_iter *iter, int *ext_index)
 {
 	memset(iter, 0, sizeof(*iter));
 
 	iter->edid = edid;
+
+	if (ext_index)
+		iter->ext_index = *ext_index;
 }
 
 static const struct displayid_block *
@@ -126,7 +129,10 @@ __displayid_iter_next(struct displayid_iter *iter)
 	}
 }
 
-void displayid_iter_end(struct displayid_iter *iter)
+void displayid_iter_end(struct displayid_iter *iter, int *ext_index)
 {
+	if (ext_index)
+		*ext_index = iter->ext_index;
+
 	memset(iter, 0, sizeof(*iter));
 }
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 561f53831e29..78c415aa6889 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3353,28 +3353,27 @@ const u8 *drm_find_edid_extension(const struct edid *edid,
 	return edid_ext;
 }
 
-static const u8 *drm_find_cea_extension(const struct edid *edid)
+static const u8 *drm_find_cea_extension(const struct edid *edid,
+					int *cea_ext_index, int *displayid_ext_index)
 {
 	const struct displayid_block *block;
 	struct displayid_iter iter;
 	const u8 *cea;
-	int ext_index = 0;
 
-	/* Look for a top level CEA extension block */
-	/* FIXME: make callers iterate through multiple CEA ext blocks? */
-	cea = drm_find_edid_extension(edid, CEA_EXT, &ext_index);
+	/* Look for a CEA extension block from ext_index */
+	cea = drm_find_edid_extension(edid, CEA_EXT, cea_ext_index);
 	if (cea)
 		return cea;
 
 	/* CEA blocks can also be found embedded in a DisplayID block */
-	displayid_iter_edid_begin(edid, &iter);
+	displayid_iter_edid_begin(edid, &iter, displayid_ext_index);
 	displayid_iter_for_each(block, &iter) {
 		if (block->tag == DATA_BLOCK_CTA) {
 			cea = (const u8 *)block;
 			break;
 		}
 	}
-	displayid_iter_end(&iter);
+	displayid_iter_end(&iter, displayid_ext_index);
 
 	return cea;
 }
@@ -3643,10 +3642,10 @@ add_alternate_cea_modes(struct drm_connector *connector, struct edid *edid)
 	struct drm_device *dev = connector->dev;
 	struct drm_display_mode *mode, *tmp;
 	LIST_HEAD(list);
-	int modes = 0;
+	int modes = 0, cea_ext_index = 0, displayid_ext_index = 0;
 
 	/* Don't add CEA modes if the CEA extension block is missing */
-	if (!drm_find_cea_extension(edid))
+	if (!drm_find_cea_extension(edid, &cea_ext_index, &displayid_ext_index))
 		return 0;
 
 	/*
@@ -4321,11 +4320,11 @@ static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
 static int
 add_cea_modes(struct drm_connector *connector, struct edid *edid)
 {
-	const u8 *cea = drm_find_cea_extension(edid);
-	const u8 *db, *hdmi = NULL, *video = NULL;
+	const u8 *cea, *db, *hdmi = NULL, *video = NULL;
 	u8 dbl, hdmi_len, video_len = 0;
-	int modes = 0;
+	int modes = 0, cea_ext_index = 0, displayid_ext_index = 0;
 
+	cea = drm_find_cea_extension(edid, &cea_ext_index, &displayid_ext_index);
 	if (cea && cea_revision(cea) >= 3) {
 		int i, start, end;
 
@@ -4563,6 +4562,7 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
 	const u8 *cea;
 	const u8 *db;
 	int total_sad_count = 0;
+	int cea_ext_index = 0, displayid_ext_index = 0;
 	int mnl;
 	int dbl;
 
@@ -4571,7 +4571,7 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
 	if (!edid)
 		return;
 
-	cea = drm_find_cea_extension(edid);
+	cea = drm_find_cea_extension(edid, &cea_ext_index, &displayid_ext_index);
 	if (!cea) {
 		DRM_DEBUG_KMS("ELD: no CEA Extension found\n");
 		return;
@@ -4657,9 +4657,10 @@ int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads)
 {
 	int count = 0;
 	int i, start, end, dbl;
+	int cea_ext_index = 0, displayid_ext_index = 0;
 	const u8 *cea;
 
-	cea = drm_find_cea_extension(edid);
+	cea = drm_find_cea_extension(edid, &cea_ext_index, &displayid_ext_index);
 	if (!cea) {
 		DRM_DEBUG_KMS("SAD: no CEA Extension found\n");
 		return 0;
@@ -4719,9 +4720,10 @@ int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb)
 {
 	int count = 0;
 	int i, start, end, dbl;
+	int cea_ext_index = 0, displayid_ext_index = 0;
 	const u8 *cea;
 
-	cea = drm_find_cea_extension(edid);
+	cea = drm_find_cea_extension(edid, &cea_ext_index, &displayid_ext_index);
 	if (!cea) {
 		DRM_DEBUG_KMS("SAD: no CEA Extension found\n");
 		return 0;
@@ -4815,8 +4817,9 @@ bool drm_detect_hdmi_monitor(struct edid *edid)
 	const u8 *edid_ext;
 	int i;
 	int start_offset, end_offset;
+	int cea_ext_index = 0, displayid_ext_index = 0;
 
-	edid_ext = drm_find_cea_extension(edid);
+	edid_ext = drm_find_cea_extension(edid, &cea_ext_index, &displayid_ext_index);
 	if (!edid_ext)
 		return false;
 
@@ -4854,8 +4857,9 @@ bool drm_detect_monitor_audio(struct edid *edid)
 	int i, j;
 	bool has_audio = false;
 	int start_offset, end_offset;
+	int cea_ext_index = 0, displayid_ext_index = 0;
 
-	edid_ext = drm_find_cea_extension(edid);
+	edid_ext = drm_find_cea_extension(edid, &cea_ext_index, &displayid_ext_index);
 	if (!edid_ext)
 		goto end;
 
@@ -5178,8 +5182,9 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 	struct drm_display_info *info = &connector->display_info;
 	const u8 *edid_ext;
 	int i, start, end;
+	int cea_ext_index = 0, displayid_ext_index = 0;
 
-	edid_ext = drm_find_cea_extension(edid);
+	edid_ext = drm_find_cea_extension(edid, &cea_ext_index, &displayid_ext_index);
 	if (!edid_ext)
 		return;
 
@@ -5311,12 +5316,12 @@ static void drm_update_mso(struct drm_connector *connector, const struct edid *e
 	const struct displayid_block *block;
 	struct displayid_iter iter;
 
-	displayid_iter_edid_begin(edid, &iter);
+	displayid_iter_edid_begin(edid, &iter, NULL);
 	displayid_iter_for_each(block, &iter) {
 		if (block->tag == DATA_BLOCK_2_VENDOR_SPECIFIC)
 			drm_parse_vesa_mso_data(connector, block);
 	}
-	displayid_iter_end(&iter);
+	displayid_iter_end(&iter, NULL);
 }
 
 /* A connector has no EDID information, so we've got no EDID to compute quirks from. Reset
@@ -5516,13 +5521,13 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
 	struct displayid_iter iter;
 	int num_modes = 0;
 
-	displayid_iter_edid_begin(edid, &iter);
+	displayid_iter_edid_begin(edid, &iter, NULL);
 	displayid_iter_for_each(block, &iter) {
 		if (block->tag == DATA_BLOCK_TYPE_1_DETAILED_TIMING ||
 		    block->tag == DATA_BLOCK_2_TYPE_7_DETAILED_TIMING)
 			num_modes += add_displayid_detailed_1_modes(connector, block);
 	}
-	displayid_iter_end(&iter);
+	displayid_iter_end(&iter, NULL);
 
 	return num_modes;
 }
@@ -6164,12 +6169,12 @@ void drm_update_tile_info(struct drm_connector *connector,
 
 	connector->has_tile = false;
 
-	displayid_iter_edid_begin(edid, &iter);
+	displayid_iter_edid_begin(edid, &iter, NULL);
 	displayid_iter_for_each(block, &iter) {
 		if (block->tag == DATA_BLOCK_TILED_DISPLAY)
 			drm_parse_tiled_block(connector, block);
 	}
-	displayid_iter_end(&iter);
+	displayid_iter_end(&iter, NULL);
 
 	if (!connector->has_tile && connector->tile_group) {
 		drm_mode_put_tile_group(connector->dev, connector->tile_group);
diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h
index 7ffbd9f7bfc7..15442a161c11 100644
--- a/include/drm/drm_displayid.h
+++ b/include/drm/drm_displayid.h
@@ -150,11 +150,11 @@ struct displayid_iter {
 };
 
 void displayid_iter_edid_begin(const struct edid *edid,
-			       struct displayid_iter *iter);
+			       struct displayid_iter *iter, int *ext_index);
 const struct displayid_block *
 __displayid_iter_next(struct displayid_iter *iter);
 #define displayid_iter_for_each(__block, __iter) \
 	while (((__block) = __displayid_iter_next(__iter)))
-void displayid_iter_end(struct displayid_iter *iter);
+void displayid_iter_end(struct displayid_iter *iter, int *ext_index);
 
 #endif
-- 
2.17.1

