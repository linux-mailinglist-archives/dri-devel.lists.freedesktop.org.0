Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E734D4986
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 15:41:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D6110E5E5;
	Thu, 10 Mar 2022 14:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F12F10E59C;
 Thu, 10 Mar 2022 14:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646923253; x=1678459253;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=lVi3/LZhIoiVuRL9lpdIKh/NyprssCzn296KmfFfG+E=;
 b=KWU7ULmibOjgmSpWEYaQ1CvNgwPZnrRyyQayST0kfIq/OSPOjlz2cQx3
 rMdOLoX9iegMRT+KsJvWQxuC2avkD8qUYeNVc3TPLhgCn7FUvJq4gpKIf
 Ymm8Q72ABVmuWnI0+/n7RoyYcxjgahhmnaDbjDLMHkyvMUJrFzsujmSvc
 bxeXacVCcuxqnjMUHYj+E/tqXl+k3zqv822JD8lAKQN9Xp980fv9v6QZH
 uVwlT4xeeGGxoBGWpgEX/HZWEaL81+EVGQbQbJuMEtj8WFdg0dKr8D4Yn
 TrmsXIFNFCLvREklMAOdErBIVVO4KFWiFtQ8kvK9DLaO5ER4frcg9I3y6 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="255000914"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="255000914"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 06:40:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="538477334"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by orsmga007.jf.intel.com with ESMTP; 10 Mar 2022 06:40:51 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [v5 4/5] drm/edid: parse HF-EEODB CEA extension block
Date: Thu, 10 Mar 2022 22:54:23 +0800
Message-Id: <20220310145424.32643-5-shawn.c.lee@intel.com>
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

While adding CEA modes, try to get available EEODB block
number. Then based on it to parse numbers of ext blocks,
retrieve CEA information and add more CEA modes.

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>
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
index 38b041c8b4ad..1da1239c21cb 100644
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
@@ -4383,13 +4384,17 @@ static int
 add_cea_modes(struct drm_connector *connector, struct edid *edid)
 {
 	int modes = 0, ext_index = 0;
+	int ext_blk_num = drm_edid_read_hf_eeodb_blk_count(edid);
+
+	if (!ext_blk_num)
+		ext_blk_num = edid->extensions;
 
 	for (;;) {
 		const u8 *cea, *db, *hdmi = NULL, *video = NULL;
 		u8 dbl, hdmi_len = 0, video_len = 0;
 		int i, start, end;
 
-		cea = drm_find_cea_extension(edid, &ext_index);
+		cea = drm_find_cea_extension(edid, &ext_index, ext_blk_num);
 		if (!cea)
 			break;
 
@@ -4638,7 +4643,7 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
 	if (!edid)
 		return;
 
-	cea = drm_find_cea_extension(edid, &ext_index);
+	cea = drm_find_cea_extension(edid, &ext_index, edid->extensions);
 	if (!cea) {
 		DRM_DEBUG_KMS("ELD: no CEA Extension found\n");
 		return;
@@ -4726,7 +4731,7 @@ int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads)
 	int i, start, end, dbl;
 	const u8 *cea;
 
-	cea = drm_find_cea_extension(edid, &ext_index);
+	cea = drm_find_cea_extension(edid, &ext_index, edid->extensions);
 	if (!cea) {
 		DRM_DEBUG_KMS("SAD: no CEA Extension found\n");
 		return 0;
@@ -4788,7 +4793,7 @@ int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb)
 	int i, start, end, dbl;
 	const u8 *cea;
 
-	cea = drm_find_cea_extension(edid, &ext_index);
+	cea = drm_find_cea_extension(edid, &ext_index, edid->extensions);
 	if (!cea) {
 		DRM_DEBUG_KMS("SAD: no CEA Extension found\n");
 		return 0;
@@ -4883,7 +4888,7 @@ bool drm_detect_hdmi_monitor(struct edid *edid)
 	int i;
 	int start_offset, end_offset, ext_index = 0;
 
-	edid_ext = drm_find_cea_extension(edid, &ext_index);
+	edid_ext = drm_find_cea_extension(edid, &ext_index, edid->extensions);
 	if (!edid_ext)
 		return false;
 
@@ -4922,7 +4927,7 @@ bool drm_detect_monitor_audio(struct edid *edid)
 	bool has_audio = false;
 	int start_offset, end_offset, ext_index = 0;
 
-	edid_ext = drm_find_cea_extension(edid, &ext_index);
+	edid_ext = drm_find_cea_extension(edid, &ext_index, edid->extensions);
 	if (!edid_ext)
 		goto end;
 
@@ -5246,7 +5251,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
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

