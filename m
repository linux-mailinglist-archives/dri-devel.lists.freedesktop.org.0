Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 990B34BF9CC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 14:50:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F10C10E789;
	Tue, 22 Feb 2022 13:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F7A010E789
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 13:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645537832; x=1677073832;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=08KbeMavnA4WOllxm9COqLEDvv+REX8WTcFM6xAqA/Q=;
 b=N1b9Fby1MHgo9QmfWFkNIC9QBa2yUhcVo21NOjaB9O+XSc6xLISuRn2n
 2SKVILEdDtFE2VWs5bLmYpfuYVTto7qWTUbrn4dA9ofGNOF802j5iEGVC
 uKmDQi+HOLf9PBbvWmh0C2699UD6qtx18JXONemO9KkEQvx1+yjHXfvJj
 3c+VRKz8VECQ8T+ZkymZqIcN6UMtGtmD7PO6FcFfYlY8m1o5joVifleC+
 VdbQS9bX6z+zPnMOxvQF6qlqZbtKt73Au5xUZlEi/dKnCyD2GIkxLt6gt
 FqzD9r/c1Fgyhr1xpSa2wv5ym53x22wK0OZuyMyC2WwFiD9dwWoea/8zZ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="338138781"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="338138781"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 05:50:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="638907933"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by orsmga004.jf.intel.com with ESMTP; 22 Feb 2022 05:50:31 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [v2 3/3] drm/edid: parse HF-EEODB CEA extension block
Date: Tue, 22 Feb 2022 22:02:36 +0800
Message-Id: <20220222140236.6751-3-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220222140236.6751-1-shawn.c.lee@intel.com>
References: <20220222063819.5279-1-shawn.c.lee@intel.com>
 <20220222140236.6751-1-shawn.c.lee@intel.com>
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
Cc: Lee Shawn C <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While adding CEA modes, try to get available EEODB block
number. Then based on it to parse numbers of ext blocks,
retrieve CEA information and add more CEA modes.

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
index f8514783d089..bb050d171bb8 100644
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
@@ -4376,11 +4377,14 @@ add_cea_modes(struct drm_connector *connector, struct edid *edid)
 {
 	const u8 *cea = NULL;
 	const u8 *db, *hdmi = NULL, *video = NULL;
-	u8 dbl, hdmi_len, video_len = 0;
+	u8 dbl, hdmi_len, video_len = 0, num_ext_blk = edid->extensions;
 	int modes = 0, j = 0;
 
+	if (num_ext_blk && drm_edid_is_hf_eeodb_blk_available(edid))
+		num_ext_blk = drm_edid_read_hf_eeodb_blk_size(edid);
+
 	for (;;) {
-		cea = drm_find_cea_extension(edid, &j);
+		cea = drm_find_cea_extension(edid, &j, num_ext_blk);
 
 		if (!cea)
 			break;
@@ -4636,7 +4640,7 @@ static void drm_edid_to_eld(struct drm_connector *connector, struct edid *edid)
 	if (!edid)
 		return;
 
-	cea = drm_find_cea_extension(edid, &ext_index);
+	cea = drm_find_cea_extension(edid, &ext_index, edid->extensions);
 	if (!cea) {
 		DRM_DEBUG_KMS("ELD: no CEA Extension found\n");
 		return;
@@ -4724,7 +4728,7 @@ int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads)
 	int i, start, end, dbl;
 	const u8 *cea;
 
-	cea = drm_find_cea_extension(edid, &ext_index);
+	cea = drm_find_cea_extension(edid, &ext_index, edid->extensions);
 	if (!cea) {
 		DRM_DEBUG_KMS("SAD: no CEA Extension found\n");
 		return 0;
@@ -4786,7 +4790,7 @@ int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb)
 	int i, start, end, dbl;
 	const u8 *cea;
 
-	cea = drm_find_cea_extension(edid, &ext_index);
+	cea = drm_find_cea_extension(edid, &ext_index, edid->extensions);
 	if (!cea) {
 		DRM_DEBUG_KMS("SAD: no CEA Extension found\n");
 		return 0;
@@ -4881,7 +4885,7 @@ bool drm_detect_hdmi_monitor(struct edid *edid)
 	int i, ext_index = 0;
 	int start_offset, end_offset;
 
-	edid_ext = drm_find_cea_extension(edid, &ext_index);
+	edid_ext = drm_find_cea_extension(edid, &ext_index, edid->extensions);
 	if (!edid_ext)
 		return false;
 
@@ -4920,7 +4924,7 @@ bool drm_detect_monitor_audio(struct edid *edid)
 	bool has_audio = false;
 	int start_offset, end_offset;
 
-	edid_ext = drm_find_cea_extension(edid, &ext_index);
+	edid_ext = drm_find_cea_extension(edid, &ext_index, edid->extensions);
 	if (!edid_ext)
 		goto end;
 
@@ -5232,7 +5236,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 	const u8 *edid_ext;
 	int i, start, end, ext_index = 0;
 
-	edid_ext = drm_find_cea_extension(edid, &ext_index);
+	edid_ext = drm_find_cea_extension(edid, &ext_index, edid->extensions);
 	if (!edid_ext)
 		return;
 
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index ba2812432ead..4dbfbb531dfd 100644
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
2.31.1

