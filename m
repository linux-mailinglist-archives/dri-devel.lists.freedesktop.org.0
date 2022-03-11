Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 367A54D5725
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 02:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D90810E5DB;
	Fri, 11 Mar 2022 01:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4894710E57D;
 Fri, 11 Mar 2022 01:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646960916; x=1678496916;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=NRvgZPhYdG4kkfUfUyJG2nmldpukx1uARhvh1ZoH4kI=;
 b=WoW9a26+uv4NGGFPPkshTcpJUouUl3Uo6j+mGKvn0UlLTdxr9SR2eC8K
 XL31GHkzG0Zj/ehaRZ0l4MDpeVkG/dwwICBQ3G6wLmtfaQqJrcF1nLsAj
 vmwUgTMOEsgllkEMh27COf3KRPu+51s7hLw1EWykt7ihZpJWDvYdE6Ro5
 6gaHV0eBEm+62x8lQhaWsO9ITVESq2THF0D5A159MutVfp6rhYq3Oq6R6
 1Au4OPLxoHOdAR7JDWByxSwUnRDgcMa5gHBUZRQUYf4jwOsxPnD01YlFc
 KoKDdmNrbFE9tY+WnhUNhrjZTCoj+HoNV8QVjT8mfOhMA/Uuo+KnGhKpq A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="255196082"
X-IronPort-AV: E=Sophos;i="5.90,172,1643702400"; d="scan'208";a="255196082"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 17:08:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,172,1643702400"; d="scan'208";a="781701033"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by fmsmga006.fm.intel.com with ESMTP; 10 Mar 2022 17:08:34 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [v6 1/5] drm/edid: seek for available CEA block from specific EDID
 block index
Date: Fri, 11 Mar 2022 09:22:14 +0800
Message-Id: <20220311012218.19025-2-shawn.c.lee@intel.com>
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

drm_find_cea_extension() always look for a top level CEA block. Pass
ext_index from caller then this function to search next available
CEA ext block from a specific EDID block pointer.

v2: save proper extension block index if CTA data information
    was found in DispalyID block.

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 43 +++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 561f53831e29..e267d31d5c87 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3353,16 +3353,14 @@ const u8 *drm_find_edid_extension(const struct edid *edid,
 	return edid_ext;
 }
 
-static const u8 *drm_find_cea_extension(const struct edid *edid)
+static const u8 *drm_find_cea_extension(const struct edid *edid, int *ext_index)
 {
 	const struct displayid_block *block;
 	struct displayid_iter iter;
 	const u8 *cea;
-	int ext_index = 0;
 
-	/* Look for a top level CEA extension block */
-	/* FIXME: make callers iterate through multiple CEA ext blocks? */
-	cea = drm_find_edid_extension(edid, CEA_EXT, &ext_index);
+	/* Look for a CEA extension block from ext_index */
+	cea = drm_find_edid_extension(edid, CEA_EXT, ext_index);
 	if (cea)
 		return cea;
 
@@ -3370,6 +3368,7 @@ static const u8 *drm_find_cea_extension(const struct edid *edid)
 	displayid_iter_edid_begin(edid, &iter);
 	displayid_iter_for_each(block, &iter) {
 		if (block->tag == DATA_BLOCK_CTA) {
+			*ext_index = iter.ext_index;
 			cea = (const u8 *)block;
 			break;
 		}
@@ -3643,10 +3642,10 @@ add_alternate_cea_modes(struct drm_connector *connector, struct edid *edid)
 	struct drm_device *dev = connector->dev;
 	struct drm_display_mode *mode, *tmp;
 	LIST_HEAD(list);
-	int modes = 0;
+	int modes = 0, ext_index = 0;
 
 	/* Don't add CEA modes if the CEA extension block is missing */
-	if (!drm_find_cea_extension(edid))
+	if (!drm_find_cea_extension(edid, &ext_index))
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
+	int modes = 0, ext_index = 0;
 
+	cea = drm_find_cea_extension(edid, &ext_index);
 	if (cea && cea_revision(cea) >= 3) {
 		int i, start, end;
 
@@ -4562,7 +4561,7 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
 	uint8_t *eld = connector->eld;
 	const u8 *cea;
 	const u8 *db;
-	int total_sad_count = 0;
+	int total_sad_count = 0, ext_index = 0;
 	int mnl;
 	int dbl;
 
@@ -4571,7 +4570,7 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
 	if (!edid)
 		return;
 
-	cea = drm_find_cea_extension(edid);
+	cea = drm_find_cea_extension(edid, &ext_index);
 	if (!cea) {
 		DRM_DEBUG_KMS("ELD: no CEA Extension found\n");
 		return;
@@ -4655,11 +4654,11 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
  */
 int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads)
 {
-	int count = 0;
+	int count = 0, ext_index = 0;
 	int i, start, end, dbl;
 	const u8 *cea;
 
-	cea = drm_find_cea_extension(edid);
+	cea = drm_find_cea_extension(edid, &ext_index);
 	if (!cea) {
 		DRM_DEBUG_KMS("SAD: no CEA Extension found\n");
 		return 0;
@@ -4717,11 +4716,11 @@ EXPORT_SYMBOL(drm_edid_to_sad);
  */
 int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb)
 {
-	int count = 0;
+	int count = 0, ext_index = 0;
 	int i, start, end, dbl;
 	const u8 *cea;
 
-	cea = drm_find_cea_extension(edid);
+	cea = drm_find_cea_extension(edid, &ext_index);
 	if (!cea) {
 		DRM_DEBUG_KMS("SAD: no CEA Extension found\n");
 		return 0;
@@ -4814,9 +4813,9 @@ bool drm_detect_hdmi_monitor(struct edid *edid)
 {
 	const u8 *edid_ext;
 	int i;
-	int start_offset, end_offset;
+	int start_offset, end_offset, ext_index = 0;
 
-	edid_ext = drm_find_cea_extension(edid);
+	edid_ext = drm_find_cea_extension(edid, &ext_index);
 	if (!edid_ext)
 		return false;
 
@@ -4853,9 +4852,9 @@ bool drm_detect_monitor_audio(struct edid *edid)
 	const u8 *edid_ext;
 	int i, j;
 	bool has_audio = false;
-	int start_offset, end_offset;
+	int start_offset, end_offset, ext_index = 0;
 
-	edid_ext = drm_find_cea_extension(edid);
+	edid_ext = drm_find_cea_extension(edid, &ext_index);
 	if (!edid_ext)
 		goto end;
 
@@ -5177,9 +5176,9 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 {
 	struct drm_display_info *info = &connector->display_info;
 	const u8 *edid_ext;
-	int i, start, end;
+	int i, start, end, ext_index = 0;
 
-	edid_ext = drm_find_cea_extension(edid);
+	edid_ext = drm_find_cea_extension(edid, &ext_index);
 	if (!edid_ext)
 		return;
 
-- 
2.17.1

