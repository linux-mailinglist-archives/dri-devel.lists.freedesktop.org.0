Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 939654BF210
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 07:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8006E10F099;
	Tue, 22 Feb 2022 06:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3444810F099
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 06:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645511173; x=1677047173;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=TH8Hbq9EYHyJ5Hi2T5Xx80eYeiqxmTInsMyi7wo8Lmk=;
 b=QVfLO+6zmL3qIRoRYLnQspYeM24ug8e3YGSFfq/LbcH6gBu8U+TsrHs5
 FHPHtipCHdupW8RrEz1b/D+wsnHOWlXqubXeoWDZjRTgiJcQF7o3jXCZs
 RLLIj3Ivy3x10tQZnOAdKD9iuMDm1S/+mH3lAH8QC8n54BkgcJiuqJGdf
 l9xrtmUYk8mPdb60NnFo65AiYc0OEPULO503Z9FYW2e0+BljyvS2zCj1R
 bxZy8UPfurQw3Ko2qJJ2ZfGQSERVOsms01Fj8Ok5PBq48Rcj8oW+nkrlp
 DO2EKTUnPQE50RttT8tCzCWAFsa20t92Dnz9K3ZtbxvznPdqgZvB+2jnP w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="249201346"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="249201346"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 22:26:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="706491783"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by orsmga005.jf.intel.com with ESMTP; 21 Feb 2022 22:26:08 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/edid: parse HF-EEODB CEA extension block
Date: Tue, 22 Feb 2022 14:38:19 +0800
Message-Id: <20220222063819.5279-3-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220222063819.5279-1-shawn.c.lee@intel.com>
References: <20220222063819.5279-1-shawn.c.lee@intel.com>
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
 drivers/gpu/drm/drm_displayid.c |  2 +-
 drivers/gpu/drm/drm_edid.c      | 19 +++++++++++--------
 include/drm/drm_edid.h          |  2 +-
 3 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displayid.c
index 32da557b960f..ef0dfc9fa6f9 100644
--- a/drivers/gpu/drm/drm_displayid.c
+++ b/drivers/gpu/drm/drm_displayid.c
@@ -37,7 +37,7 @@ static const u8 *drm_find_displayid_extension(const struct edid *edid,
 					      int *length, int *idx,
 					      int *ext_index)
 {
-	const u8 *displayid = drm_find_edid_extension(edid, DISPLAYID_EXT, ext_index);
+	const u8 *displayid = drm_find_edid_extension(edid, edid->extensions, DISPLAYID_EXT, ext_index);
 	const struct displayid_header *base;
 	int ret;
 
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index a7391e427d69..9a987c77f203 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3364,23 +3364,23 @@ add_detailed_modes(struct drm_connector *connector, struct edid *edid,
  * Search EDID for CEA extension block.
  */
 const u8 *drm_find_edid_extension(const struct edid *edid,
-				  int ext_id, int *ext_index)
+				  int num_ext_blk, int ext_id, int *ext_index)
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
@@ -3397,7 +3397,7 @@ static const u8 *drm_find_cea_extension(const struct edid *edid)
 
 	/* Look for a top level CEA extension block */
 	/* FIXME: make callers iterate through multiple CEA ext blocks? */
-	cea = drm_find_edid_extension(edid, CEA_EXT, &ext_index);
+	cea = drm_find_edid_extension(edid, edid->extensions, CEA_EXT, &ext_index);
 	if (cea)
 		return cea;
 
@@ -4378,13 +4378,16 @@ add_cea_modes(struct drm_connector *connector, struct edid *edid)
 {
 	const u8 *cea = drm_find_cea_extension(edid);
 	const u8 *db, *hdmi = NULL, *video = NULL;
-	u8 dbl, hdmi_len, video_len = 0;
+	u8 dbl, hdmi_len, video_len = 0, num_ext_blk = edid->extensions;
 	int modes = 0, j;
 
 	if (!cea)
 		return 0;
 
-	for (j = (cea - (u8 *)edid) / EDID_LENGTH; j <= edid->extensions;) {
+	if (num_ext_blk && drm_edid_is_hf_eeodb_blk_available(edid))
+		num_ext_blk = drm_edid_read_hf_eeodb_blk_size(edid);
+
+	for (j = (cea - (u8 *)edid) / EDID_LENGTH; j <= num_ext_blk;) {
 		if (cea && cea_revision(cea) >= 3) {
 			int i, start, end;
 
@@ -4427,7 +4430,7 @@ add_cea_modes(struct drm_connector *connector, struct edid *edid)
 		}
 
 		/* move to next CEA extension block */
-		cea = drm_find_edid_extension(edid, CEA_EXT, &j);
+		cea = drm_find_edid_extension(edid, num_ext_blk, CEA_EXT, &j);
 		if (!cea)
 			break;
 	}
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index ba2812432ead..a9c2708b63a1 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -591,7 +591,7 @@ struct drm_display_mode *
 drm_display_mode_from_cea_vic(struct drm_device *dev,
 			      u8 video_code);
 const u8 *drm_find_edid_extension(const struct edid *edid,
-				  int ext_id, int *ext_index);
+				  int num_ext_blk, int ext_id, int *ext_index);
 
 bool drm_edid_is_hf_eeodb_blk_available(const struct edid *edid);
 u8 drm_edid_read_hf_eeodb_blk_size(const struct edid *edid);
-- 
2.17.1

