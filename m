Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9755D51D56D
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:12:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C75A10FC3C;
	Fri,  6 May 2022 10:12:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C2410FC1E;
 Fri,  6 May 2022 10:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651831966; x=1683367966;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tr1WOKSfMnZb8vTGF1B93nLohLKoxj6pw4+1BYhwWH0=;
 b=h/qXYSci14Eprvv2nGt8yHBM2Kvf1XYHm2ohTsgIvcLiWCx23Wa9S3LP
 OWBJ2+uFSMmAQHBYH8vnR7+iBMhJReAM7clil0X5Gw2rAuTUribJqXe/z
 147ihWu5k+WZ3LCIDLNFSK6Kk4gSC/shbnq9NX7a4S1Z0HlbjoyQEoMj4
 kFXONrfkoQ/BVkKM4EAWEbwzH+mw30B7JYnwdQtgtp1OqCfwYsXkTjequ
 CiR0t1uIrJ2yBHatqsRsp2gvuelTRW7s2JVijCgPGzrmJkWsXFf0XuU2C
 AerHqUv3LxBBEhPcO3+E+8smD7wXwrHyoc0kE/xKB2wGXWQjtjMChs/li Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="354859623"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="354859623"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:12:45 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="709399643"
Received: from psikora-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.157.88])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:12:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 24/25] drm/displayid: convert to drm_edid
Date: Fri,  6 May 2022 13:10:31 +0300
Message-Id: <33195130ab9336d1a2ffc5cedac93e3f2868204b.1651830939.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651830938.git.jani.nikula@intel.com>
References: <cover.1651830938.git.jani.nikula@intel.com>
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
index 82db7afb4f8e..bc64837ad706 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3545,10 +3545,13 @@ static int add_detailed_modes(struct drm_connector *connector,
 
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
 
@@ -3580,11 +3583,11 @@ static bool drm_edid_has_cta_extension(const struct drm_edid *drm_edid)
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
@@ -4436,7 +4439,7 @@ static void cea_db_iter_edid_begin(const struct drm_edid *drm_edid,
 	memset(iter, 0, sizeof(*iter));
 
 	drm_edid_iter_begin(drm_edid, &iter->edid_iter);
-	displayid_iter_edid_begin(drm_edid->edid, &iter->displayid_iter);
+	displayid_iter_edid_begin(drm_edid, &iter->displayid_iter);
 }
 
 static const struct cea_db *
@@ -5650,7 +5653,7 @@ static void drm_update_mso(struct drm_connector *connector,
 	const struct displayid_block *block;
 	struct displayid_iter iter;
 
-	displayid_iter_edid_begin(drm_edid->edid, &iter);
+	displayid_iter_edid_begin(drm_edid, &iter);
 	displayid_iter_for_each(block, &iter) {
 		if (block->tag == DATA_BLOCK_2_VENDOR_SPECIFIC)
 			drm_parse_vesa_mso_data(connector, block);
@@ -5867,7 +5870,7 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
 	struct displayid_iter iter;
 	int num_modes = 0;
 
-	displayid_iter_edid_begin(drm_edid->edid, &iter);
+	displayid_iter_edid_begin(drm_edid, &iter);
 	displayid_iter_for_each(block, &iter) {
 		if (block->tag == DATA_BLOCK_TYPE_1_DETAILED_TIMING ||
 		    block->tag == DATA_BLOCK_2_TYPE_7_DETAILED_TIMING)
@@ -6371,7 +6374,7 @@ static void _drm_update_tile_info(struct drm_connector *connector,
 
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

