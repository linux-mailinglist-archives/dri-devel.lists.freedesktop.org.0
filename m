Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A33F4C2DD2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 15:04:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E2D10E5CB;
	Thu, 24 Feb 2022 14:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C01B010E36E
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 14:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645711469; x=1677247469;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=tvU3yV9dvhthodmoRskX2LvkZYxvXkcWt0lujCUnpHw=;
 b=A65UKb+CIfntCBMuTFQstCJ9uM/0qTGOAh0cdZmtfzdKxffOwYs0x42Y
 I+vchc2vTyU+3eH8MUY705GNrn2ZIs0hoUiJra79qReXCqzgGP61JspcA
 sdwIj3JwxcnW5Bl53b7xBc5rVWax4Q9OWpNsjUeAWoUH6L3JVGJUH8dIX
 8gOQjhUCHgu7n00jRhzTSML3G9aLuU6PSBIy1qiQkRrNCvzCZT1nO1vwG
 EazbGZOCJauSnLA4r0opeN27qhGp1Cz19n1VAzjCFWdhGSUjEiKQoSk2b
 w/8iPOBglQ/DQ2Zp4EKi9HtBytW1v/0c69w1PzWvZHn1z49gh3Bl9OUqd A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="338676195"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="338676195"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 06:04:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="628479316"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Feb 2022 06:04:02 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/edid: parse HF-EEODB CEA extension block
Date: Thu, 24 Feb 2022 22:16:25 +0800
Message-Id: <20220224141625.19070-4-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220224141625.19070-1-shawn.c.lee@intel.com>
References: <20220224141625.19070-1-shawn.c.lee@intel.com>
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
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
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
 drivers/gpu/drm/drm_edid.c      | 34 ++++++++++++++++++---------------
 include/drm/drm_edid.h          |  2 +-
 3 files changed, 24 insertions(+), 17 deletions(-)

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
index 056e735ef932..5e43d5ac0a5e 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3364,23 +3364,23 @@ add_detailed_modes(struct drm_connector *connector, struct edid *edid,
  * Search EDID for CEA extension block.
  */
 const u8 *drm_find_edid_extension(const struct edid *edid,
-				  int ext_id, int *ext_index)
+				  int ext_id, int *ext_index, int num_ext_blk)
 {
 	const u8 *edid_ext = NULL;
 	int i;
 
 	/* No EDID or EDID extensions */
-	if (edid == NULL || edid->extensions == 0)
+	if (edid == NULL || edid->extensions == 0 || *ext_index >= num_ext_blk)
 		return NULL;
 
 	/* Find CEA extension */
-	for (i = *ext_index; i < edid->extensions; i++) {
+	for (i = *ext_index; i < num_ext_blk; i++) {
 		edid_ext = (const u8 *)edid + EDID_LENGTH * (i + 1);
 		if (edid_ext[0] == ext_id)
 			break;
 	}
 
-	if (i >= edid->extensions)
+	if (i >= num_ext_blk)
 		return NULL;
 
 	*ext_index = i + 1;
@@ -3388,14 +3388,15 @@ const u8 *drm_find_edid_extension(const struct edid *edid,
 	return edid_ext;
 }
 
-static const u8 *drm_find_cea_extension(const struct edid *edid, int *ext_index)
+static const u8 *drm_find_cea_extension(const struct edid *edid,
+					int *ext_index, int num_ext_blk)
 {
 	const struct displayid_block *block;
 	struct displayid_iter iter;
 	const u8 *cea;
 
 	/* Look for a CEA extension block from ext_index */
-	cea = drm_find_edid_extension(edid, CEA_EXT, ext_index);
+	cea = drm_find_edid_extension(edid, CEA_EXT, ext_index, num_ext_blk);
 	if (cea)
 		return cea;
 
@@ -3679,7 +3680,7 @@ add_alternate_cea_modes(struct drm_connector *connector, struct edid *edid)
 	int modes = 0, ext_index = 0;
 
 	/* Don't add CEA modes if the CEA extension block is missing */
-	if (!drm_find_cea_extension(edid, &ext_index))
+	if (!drm_find_cea_extension(edid, &ext_index, edid->extensions))
 		return 0;
 
 	/*
@@ -4387,11 +4388,14 @@ add_cea_modes(struct drm_connector *connector, struct edid *edid)
 {
 	const u8 *cea = NULL;
 	const u8 *db, *hdmi = NULL, *video = NULL;
-	u8 dbl, hdmi_len, video_len = 0;
+	u8 dbl, hdmi_len, video_len = 0, num_ext_blk = edid->extensions;
 	int modes = 0, ext_index = 0;
 
+	if (num_ext_blk && drm_edid_is_hf_eeodb_blk_available(edid))
+		num_ext_blk = drm_edid_read_hf_eeodb_blk_size(edid);
+
 	for (;;) {
-		cea = drm_find_cea_extension(edid, &ext_index);
+		cea = drm_find_cea_extension(edid, &ext_index, num_ext_blk);
 
 		if (!cea)
 			break;
@@ -4647,7 +4651,7 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
 	if (!edid)
 		return;
 
-	cea = drm_find_cea_extension(edid, &ext_index);
+	cea = drm_find_cea_extension(edid, &ext_index, edid->extensions);
 	if (!cea) {
 		DRM_DEBUG_KMS("ELD: no CEA Extension found\n");
 		return;
@@ -4735,7 +4739,7 @@ int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads)
 	int i, start, end, dbl;
 	const u8 *cea;
 
-	cea = drm_find_cea_extension(edid, &ext_index);
+	cea = drm_find_cea_extension(edid, &ext_index, edid->extensions);
 	if (!cea) {
 		DRM_DEBUG_KMS("SAD: no CEA Extension found\n");
 		return 0;
@@ -4797,7 +4801,7 @@ int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb)
 	int i, start, end, dbl;
 	const u8 *cea;
 
-	cea = drm_find_cea_extension(edid, &ext_index);
+	cea = drm_find_cea_extension(edid, &ext_index, edid->extensions);
 	if (!cea) {
 		DRM_DEBUG_KMS("SAD: no CEA Extension found\n");
 		return 0;
@@ -4892,7 +4896,7 @@ bool drm_detect_hdmi_monitor(struct edid *edid)
 	int i, ext_index = 0;
 	int start_offset, end_offset;
 
-	edid_ext = drm_find_cea_extension(edid, &ext_index);
+	edid_ext = drm_find_cea_extension(edid, &ext_index, edid->extensions);
 	if (!edid_ext)
 		return false;
 
@@ -4931,7 +4935,7 @@ bool drm_detect_monitor_audio(struct edid *edid)
 	bool has_audio = false;
 	int start_offset, end_offset;
 
-	edid_ext = drm_find_cea_extension(edid, &ext_index);
+	edid_ext = drm_find_cea_extension(edid, &ext_index, edid->extensions);
 	if (!edid_ext)
 		goto end;
 
@@ -5255,7 +5259,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 	const u8 *edid_ext;
 	int i, start, end, ext_index = 0;
 
-	edid_ext = drm_find_cea_extension(edid, &ext_index);
+	edid_ext = drm_find_cea_extension(edid, &ext_index, edid->extensions);
 	if (!edid_ext)
 		return;
 
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 22872d9731a8..749969ca040a 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -591,7 +591,7 @@ struct drm_display_mode *
 drm_display_mode_from_cea_vic(struct drm_device *dev,
 			      u8 video_code);
 const u8 *drm_find_edid_extension(const struct edid *edid,
-				  int ext_id, int *ext_index);
+				  int ext_id, int *ext_index, int num_ext_blk);
 
 bool drm_edid_is_hf_eeodb_blk_available(const struct edid *edid);
 u8 drm_edid_read_hf_eeodb_blk_size(const struct edid *edid);
-- 
2.17.1

