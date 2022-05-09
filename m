Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DC151FC26
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 14:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B66810EF73;
	Mon,  9 May 2022 12:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D9810EF73;
 Mon,  9 May 2022 12:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652097930; x=1683633930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DI5fBZDdIKx36Ze3Wk15+15a+MNShICmOKaTUNzVYtc=;
 b=TvzH4190szalyEhOsdhtZ5t6wGRjzfWKTWMw4cBTUvTwrPTpmOI21OHH
 rG3rm2rzl11YylFShSNVJabmjLupmrZw65yEsloNFzsO4R6TCiWHgW/0e
 FM+okUeoD6aj1vXyhOI7Hhhph5OmqKdV7dOVfaS/yCi/Amv8ys+vMItzV
 L4VTRvlvglaUnt3kNCgD7V47/BLPlpdNbEcJ0iQClpdVp+2JL9/bt6IL3
 /kRYPHsmu9AtIDeuiXakmi47RIhx8Cj3HdkWy+ttIILDaSipuiVmAOKyg
 nrvM/3K2yUK7DzSaCAvx2xLKijGOJYzP9mj6/g9l/gGO2V4605E+cwi/X Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="249566345"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="249566345"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:05:30 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="570130486"
Received: from csawicki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.129.3])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:05:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 24/25] drm/displayid: convert to drm_edid
Date: Mon,  9 May 2022 15:03:23 +0300
Message-Id: <a52a6882e87a4bb6b1670918f3aba13f9b52f6de.1652097712.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1652097712.git.jani.nikula@intel.com>
References: <cover.1652097712.git.jani.nikula@intel.com>
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

We'll need to propagate drm_edid everywhere.

v2: Rebase

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_displayid.c | 16 ++++++++--------
 drivers/gpu/drm/drm_edid.c      | 17 ++++++++++-------
 include/drm/drm_displayid.h     |  6 +++---
 include/drm/drm_edid.h          |  6 ++++--
 4 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displayid.c
index 32da557b960f..38ea8203df45 100644
--- a/drivers/gpu/drm/drm_displayid.c
+++ b/drivers/gpu/drm/drm_displayid.c
@@ -33,11 +33,11 @@ static int validate_displayid(const u8 *displayid, int length, int idx)
 	return 0;
 }
 
-static const u8 *drm_find_displayid_extension(const struct edid *edid,
+static const u8 *drm_find_displayid_extension(const struct drm_edid *drm_edid,
 					      int *length, int *idx,
 					      int *ext_index)
 {
-	const u8 *displayid = drm_find_edid_extension(edid, DISPLAYID_EXT, ext_index);
+	const u8 *displayid = drm_find_edid_extension(drm_edid, DISPLAYID_EXT, ext_index);
 	const struct displayid_header *base;
 	int ret;
 
@@ -58,12 +58,12 @@ static const u8 *drm_find_displayid_extension(const struct edid *edid,
 	return displayid;
 }
 
-void displayid_iter_edid_begin(const struct edid *edid,
+void displayid_iter_edid_begin(const struct drm_edid *drm_edid,
 			       struct displayid_iter *iter)
 {
 	memset(iter, 0, sizeof(*iter));
 
-	iter->edid = edid;
+	iter->drm_edid = drm_edid;
 }
 
 static const struct displayid_block *
@@ -88,7 +88,7 @@ __displayid_iter_next(struct displayid_iter *iter)
 {
 	const struct displayid_block *block;
 
-	if (!iter->edid)
+	if (!iter->drm_edid)
 		return NULL;
 
 	if (iter->section) {
@@ -96,7 +96,7 @@ __displayid_iter_next(struct displayid_iter *iter)
 		block = displayid_iter_block(iter);
 		if (WARN_ON(!block)) {
 			iter->section = NULL;
-			iter->edid = NULL;
+			iter->drm_edid = NULL;
 			return NULL;
 		}
 
@@ -109,12 +109,12 @@ __displayid_iter_next(struct displayid_iter *iter)
 	}
 
 	for (;;) {
-		iter->section = drm_find_displayid_extension(iter->edid,
+		iter->section = drm_find_displayid_extension(iter->drm_edid,
 							     &iter->length,
 							     &iter->idx,
 							     &iter->ext_index);
 		if (!iter->section) {
-			iter->edid = NULL;
+			iter->drm_edid = NULL;
 			return NULL;
 		}
 
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 26ac4d262e31..a44818f44718 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3563,10 +3563,13 @@ static int add_detailed_modes(struct drm_connector *connector,
 
 /*
  * Search EDID for CEA extension block.
+ *
+ * FIXME: Prefer not returning pointers to raw EDID data.
  */
-const u8 *drm_find_edid_extension(const struct edid *edid,
+const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
 				  int ext_id, int *ext_index)
 {
+	const struct edid *edid = drm_edid ? drm_edid->edid : NULL;
 	const u8 *edid_ext = NULL;
 	int i;
 
@@ -3598,11 +3601,11 @@ static bool drm_edid_has_cta_extension(const struct drm_edid *drm_edid)
 	bool found = false;
 
 	/* Look for a top level CEA extension block */
-	if (drm_find_edid_extension(drm_edid->edid, CEA_EXT, &ext_index))
+	if (drm_find_edid_extension(drm_edid, CEA_EXT, &ext_index))
 		return true;
 
 	/* CEA blocks can also be found embedded in a DisplayID block */
-	displayid_iter_edid_begin(drm_edid->edid, &iter);
+	displayid_iter_edid_begin(drm_edid, &iter);
 	displayid_iter_for_each(block, &iter) {
 		if (block->tag == DATA_BLOCK_CTA) {
 			found = true;
@@ -4454,7 +4457,7 @@ static void cea_db_iter_edid_begin(const struct drm_edid *drm_edid,
 	memset(iter, 0, sizeof(*iter));
 
 	drm_edid_iter_begin(drm_edid, &iter->edid_iter);
-	displayid_iter_edid_begin(drm_edid ? drm_edid->edid : NULL, &iter->displayid_iter);
+	displayid_iter_edid_begin(drm_edid, &iter->displayid_iter);
 }
 
 static const struct cea_db *
@@ -5657,7 +5660,7 @@ static void drm_update_mso(struct drm_connector *connector,
 	const struct displayid_block *block;
 	struct displayid_iter iter;
 
-	displayid_iter_edid_begin(drm_edid->edid, &iter);
+	displayid_iter_edid_begin(drm_edid, &iter);
 	displayid_iter_for_each(block, &iter) {
 		if (block->tag == DATA_BLOCK_2_VENDOR_SPECIFIC)
 			drm_parse_vesa_mso_data(connector, block);
@@ -5872,7 +5875,7 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
 	struct displayid_iter iter;
 	int num_modes = 0;
 
-	displayid_iter_edid_begin(drm_edid->edid, &iter);
+	displayid_iter_edid_begin(drm_edid, &iter);
 	displayid_iter_for_each(block, &iter) {
 		if (block->tag == DATA_BLOCK_TYPE_1_DETAILED_TIMING ||
 		    block->tag == DATA_BLOCK_2_TYPE_7_DETAILED_TIMING)
@@ -6372,7 +6375,7 @@ static void _drm_update_tile_info(struct drm_connector *connector,
 
 	connector->has_tile = false;
 
-	displayid_iter_edid_begin(drm_edid ? drm_edid->edid : NULL, &iter);
+	displayid_iter_edid_begin(drm_edid, &iter);
 	displayid_iter_for_each(block, &iter) {
 		if (block->tag == DATA_BLOCK_TILED_DISPLAY)
 			drm_parse_tiled_block(connector, block);
diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h
index 7ffbd9f7bfc7..49649eb8447e 100644
--- a/include/drm/drm_displayid.h
+++ b/include/drm/drm_displayid.h
@@ -25,7 +25,7 @@
 #include <linux/types.h>
 #include <linux/bits.h>
 
-struct edid;
+struct drm_edid;
 
 #define VESA_IEEE_OUI				0x3a0292
 
@@ -141,7 +141,7 @@ struct displayid_vesa_vendor_specific_block {
 
 /* DisplayID iteration */
 struct displayid_iter {
-	const struct edid *edid;
+	const struct drm_edid *drm_edid;
 
 	const u8 *section;
 	int length;
@@ -149,7 +149,7 @@ struct displayid_iter {
 	int ext_index;
 };
 
-void displayid_iter_edid_begin(const struct edid *edid,
+void displayid_iter_edid_begin(const struct drm_edid *drm_edid,
 			       struct displayid_iter *iter);
 const struct displayid_block *
 __displayid_iter_next(struct displayid_iter *iter);
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index c3204a58fb09..c61e75ab8f63 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -28,6 +28,7 @@
 #include <drm/drm_mode.h>
 
 struct drm_device;
+struct drm_edid;
 struct i2c_adapter;
 
 #define EDID_LENGTH 128
@@ -578,8 +579,9 @@ struct drm_display_mode *drm_mode_find_dmt(struct drm_device *dev,
 struct drm_display_mode *
 drm_display_mode_from_cea_vic(struct drm_device *dev,
 			      u8 video_code);
-const u8 *drm_find_edid_extension(const struct edid *edid,
-				  int ext_id, int *ext_index);
 
+/* Interface based on struct drm_edid */
+const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
+				  int ext_id, int *ext_index);
 
 #endif /* __DRM_EDID_H__ */
-- 
2.30.2

