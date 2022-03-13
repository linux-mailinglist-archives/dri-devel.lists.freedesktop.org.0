Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 035C74D757E
	for <lists+dri-devel@lfdr.de>; Sun, 13 Mar 2022 14:33:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5E010E22E;
	Sun, 13 Mar 2022 13:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E74410E1B7;
 Sun, 13 Mar 2022 13:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647178398; x=1678714398;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=fgoTOWqbhDYeNck02jVw8B3hsujgoFe72W50Hl5St3I=;
 b=PK4VJhfp5xO7qcT1q9M4z7BJaPGrn7fPwUkmIgWHuBGTMVyvaW53rU97
 J8X0jzpugIqeN3d9lsRDInfWKTb8Hb+bH4u9fRX0wF/MfUWmTk8sopTjv
 oCUgaRN5E6lUmLgT+WH7eqsqpopjuDyZhHMmLV4cu5BdlowlWrsilV84G
 gdC00JJvh6ZMyDBdRUB8KYv1N4be+Z6V+6asye5RD8Jjx+0fp+wKOLren
 znH9gbviityKo6ovVDiN8CGulVfQLI+ed2MK6qY40m02jz/ki22JFCRGN
 niOd//dDJKMXdtWfdFG7FQnBg80XStaIVuhWVfBtAPwsZcQN3h4tXOstq w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10284"; a="255600698"
X-IronPort-AV: E=Sophos;i="5.90,178,1643702400"; d="scan'208";a="255600698"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 06:33:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,178,1643702400"; d="scan'208";a="515101487"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by orsmga006.jf.intel.com with ESMTP; 13 Mar 2022 06:33:16 -0700
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [v7 4/5] drm/edid: parse HF-EEODB CEA extension block
Date: Sun, 13 Mar 2022 21:47:01 +0800
Message-Id: <20220313134702.24175-5-shawn.c.lee@intel.com>
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

While adding CEA modes, try to get available EEODB block
number. Then based on it to parse numbers of ext blocks,
retrieve CEA information and add more CEA modes.

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Drew Davenport <ddavenport@chromium.org>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 drivers/gpu/drm/drm_displayid.c |  5 ++-
 drivers/gpu/drm/drm_edid.c      | 68 +++++++++++++++++++++++++--------
 include/drm/drm_edid.h          |  2 +-
 3 files changed, 58 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displayid.c
index 31c3e6d7d549..a769c55146f4 100644
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
index 5ae4e83fa5e3..5de85ba20bdf 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3360,23 +3360,25 @@ add_detailed_modes(struct drm_connector *connector, struct edid *edid,
  * Search EDID for CEA extension block.
  */
 const u8 *drm_find_edid_extension(const struct edid *edid,
-				  int ext_id, int *ext_index)
+				  int ext_id,
+				  int *ext_index,
+				  int ext_blk_num)
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
@@ -3385,14 +3387,19 @@ const u8 *drm_find_edid_extension(const struct edid *edid,
 }
 
 static const u8 *drm_find_cea_extension(const struct edid *edid,
-					int *cea_ext_index, int *displayid_ext_index)
+					int *cea_ext_index,
+					int *displayid_ext_index,
+					int ext_blk_num)
 {
 	const struct displayid_block *block;
 	struct displayid_iter iter;
 	const u8 *cea;
 
 	/* Look for a CEA extension block from ext_index */
-	cea = drm_find_edid_extension(edid, CEA_EXT, cea_ext_index);
+	cea = drm_find_edid_extension(edid,
+				      CEA_EXT,
+				      cea_ext_index,
+				      ext_blk_num);
 	if (cea)
 		return cea;
 
@@ -3676,7 +3683,10 @@ add_alternate_cea_modes(struct drm_connector *connector, struct edid *edid)
 	int modes = 0, cea_ext_index = 0, displayid_ext_index = 0;
 
 	/* Don't add CEA modes if the CEA extension block is missing */
-	if (!drm_find_cea_extension(edid, &cea_ext_index, &displayid_ext_index))
+	if (!drm_find_cea_extension(edid,
+				    &cea_ext_index,
+				    &displayid_ext_index,
+				    edid->extensions))
 		return 0;
 
 	/*
@@ -4328,7 +4338,10 @@ size_t drm_edid_read_hf_eeodb_blk_count(const struct edid *edid)
 	int i, start, end, cea_ext_index = 0, displayid_ext_index = 0;
 
 	if (edid->extensions) {
-		cea = drm_find_cea_extension(edid, &cea_ext_index, &displayid_ext_index);
+		cea = drm_find_cea_extension(edid,
+					     &cea_ext_index,
+					     &displayid_ext_index,
+					     edid->extensions);
 
 		if (cea && !cea_db_offsets(cea, &start, &end))
 			for_each_cea_db(cea, i, start, end)
@@ -4384,13 +4397,20 @@ static int
 add_cea_modes(struct drm_connector *connector, struct edid *edid)
 {
 	int modes = 0, cea_ext_index = 0, displayid_ext_index = 0;
+	int ext_blk_num = drm_edid_read_hf_eeodb_blk_count(edid);
+
+	if (!ext_blk_num)
+		ext_blk_num = edid->extensions;
 
 	for (;;) {
 		const u8 *cea, *db, *hdmi = NULL, *video = NULL;
 		u8 dbl, hdmi_len = 0, video_len = 0;
 		int i, start, end;
 
-		cea = drm_find_cea_extension(edid, &cea_ext_index, &displayid_ext_index);
+		cea = drm_find_cea_extension(edid,
+					     &cea_ext_index,
+					     &displayid_ext_index,
+					     ext_blk_num);
 		if (!cea)
 			break;
 
@@ -4640,7 +4660,10 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
 	if (!edid)
 		return;
 
-	cea = drm_find_cea_extension(edid, &cea_ext_index, &displayid_ext_index);
+	cea = drm_find_cea_extension(edid,
+				     &cea_ext_index,
+				     &displayid_ext_index,
+				     edid->extensions);
 	if (!cea) {
 		DRM_DEBUG_KMS("ELD: no CEA Extension found\n");
 		return;
@@ -4729,7 +4752,10 @@ int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads)
 	int cea_ext_index = 0, displayid_ext_index = 0;
 	const u8 *cea;
 
-	cea = drm_find_cea_extension(edid, &cea_ext_index, &displayid_ext_index);
+	cea = drm_find_cea_extension(edid,
+				     &cea_ext_index,
+				     &displayid_ext_index,
+				     edid->extensions);
 	if (!cea) {
 		DRM_DEBUG_KMS("SAD: no CEA Extension found\n");
 		return 0;
@@ -4792,7 +4818,10 @@ int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb)
 	int cea_ext_index = 0, displayid_ext_index = 0;
 	const u8 *cea;
 
-	cea = drm_find_cea_extension(edid, &cea_ext_index, &displayid_ext_index);
+	cea = drm_find_cea_extension(edid,
+				     &cea_ext_index,
+				     &displayid_ext_index,
+				     edid->extensions);
 	if (!cea) {
 		DRM_DEBUG_KMS("SAD: no CEA Extension found\n");
 		return 0;
@@ -4888,7 +4917,10 @@ bool drm_detect_hdmi_monitor(struct edid *edid)
 	int start_offset, end_offset;
 	int cea_ext_index = 0, displayid_ext_index = 0;
 
-	edid_ext = drm_find_cea_extension(edid, &cea_ext_index, &displayid_ext_index);
+	edid_ext = drm_find_cea_extension(edid,
+					  &cea_ext_index,
+					  &displayid_ext_index,
+					  edid->extensions);
 	if (!edid_ext)
 		return false;
 
@@ -4928,7 +4960,10 @@ bool drm_detect_monitor_audio(struct edid *edid)
 	int start_offset, end_offset;
 	int cea_ext_index = 0, displayid_ext_index = 0;
 
-	edid_ext = drm_find_cea_extension(edid, &cea_ext_index, &displayid_ext_index);
+	edid_ext = drm_find_cea_extension(edid,
+					  &cea_ext_index,
+					  &displayid_ext_index,
+					  edid->extensions);
 	if (!edid_ext)
 		goto end;
 
@@ -5253,7 +5288,10 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 	int i, start, end;
 	int cea_ext_index = 0, displayid_ext_index = 0;
 
-	edid_ext = drm_find_cea_extension(edid, &cea_ext_index, &displayid_ext_index);
+	edid_ext = drm_find_cea_extension(edid,
+					  &cea_ext_index,
+					  &displayid_ext_index,
+					  edid->extensions);
 	if (!edid_ext)
 		return;
 
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 585f0ed932d4..fa06f9a468c4 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -591,7 +591,7 @@ struct drm_display_mode *
 drm_display_mode_from_cea_vic(struct drm_device *dev,
 			      u8 video_code);
 const u8 *drm_find_edid_extension(const struct edid *edid,
-				  int ext_id, int *ext_index);
+				  int ext_id, int *ext_index, int ext_blk_num);
 
 size_t drm_edid_read_hf_eeodb_blk_count(const struct edid *edid);
 
-- 
2.17.1

