Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0503327D4
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 14:55:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871FF6E904;
	Tue,  9 Mar 2021 13:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14C76E904;
 Tue,  9 Mar 2021 13:55:00 +0000 (UTC)
IronPort-SDR: IEwAmRhqPPL92JU1hSa1H+Trq2gzzP4J8dGCloHUdLw5XTDc2i/vSXNd9+UmkKQGJk34j5T6nF
 E+a1ODEsKTYw==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="168151631"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; d="scan'208";a="168151631"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 05:55:00 -0800
IronPort-SDR: HH7UaDceu6izhkz73RCLVFhEzhDbok5LCLRQR0Lu69+Zt6NaAOha57Q8hrStUK6i6PJZ9V/3oq
 YpIl/aXLwqww==
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; d="scan'208";a="369792813"
Received: from kjwindec-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.48.180])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 05:54:58 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC v1 6/6] drm/edid: use the new displayid iterator for tile info
Date: Tue,  9 Mar 2021 15:54:14 +0200
Message-Id: <96ad612f337691cc31ab25f6a661bf1d3721fab9.1615297748.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1615297748.git.jani.nikula@intel.com>
References: <cover.1615297748.git.jani.nikula@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Neatly reduce displayid boilerplate in code. Remove excessive debug
logging while at it, no other functional changes.

The old displayid iterator becomes unused; remove it as well as make
drm_find_displayid_extension() static.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_displayid.c |  6 +++---
 drivers/gpu/drm/drm_edid.c      | 37 +++++++--------------------------
 include/drm/drm_displayid.h     | 12 -----------
 3 files changed, 10 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displayid.c
index 88070267aac9..b146f2d0d72a 100644
--- a/drivers/gpu/drm/drm_displayid.c
+++ b/drivers/gpu/drm/drm_displayid.c
@@ -33,9 +33,9 @@ static int validate_displayid(const u8 *displayid, int length, int idx)
 	return 0;
 }
 
-const u8 *drm_find_displayid_extension(const struct edid *edid,
-				       int *length, int *idx,
-				       int *ext_index)
+static const u8 *drm_find_displayid_extension(const struct edid *edid,
+					      int *length, int *idx,
+					      int *ext_index)
 {
 	const u8 *displayid = drm_find_edid_extension(edid, DISPLAYID_EXT, ext_index);
 	const struct displayid_hdr *base;
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 4526e2557dca..81d5f2524246 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5969,43 +5969,20 @@ static void drm_parse_tiled_block(struct drm_connector *connector,
 	}
 }
 
-static void drm_displayid_parse_tiled(struct drm_connector *connector,
-				      const u8 *displayid, int length, int idx)
-{
-	const struct displayid_block *block;
-
-	idx += sizeof(struct displayid_hdr);
-	for_each_displayid_db(displayid, block, idx, length) {
-		DRM_DEBUG_KMS("block id 0x%x, rev %d, len %d\n",
-			      block->tag, block->rev, block->num_bytes);
-
-		switch (block->tag) {
-		case DATA_BLOCK_TILED_DISPLAY:
-			drm_parse_tiled_block(connector, block);
-			break;
-		default:
-			DRM_DEBUG_KMS("found DisplayID tag 0x%x, unhandled\n", block->tag);
-			break;
-		}
-	}
-}
-
 void drm_update_tile_info(struct drm_connector *connector,
 			  const struct edid *edid)
 {
-	const void *displayid = NULL;
-	int ext_index = 0;
-	int length, idx;
+	const struct displayid_block *block;
+	struct displayid_iter iter;
 
 	connector->has_tile = false;
-	for (;;) {
-		displayid = drm_find_displayid_extension(edid, &length, &idx,
-							 &ext_index);
-		if (!displayid)
-			break;
 
-		drm_displayid_parse_tiled(connector, displayid, length, idx);
+	displayid_iter_edid_begin(edid, &iter);
+	displayid_iter_for_each(block, &iter) {
+		if (block->tag == DATA_BLOCK_TILED_DISPLAY)
+			drm_parse_tiled_block(connector, block);
 	}
+	displayid_iter_end(&iter);
 
 	if (!connector->has_tile && connector->tile_group) {
 		drm_mode_put_tile_group(connector->dev, connector->tile_group);
diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h
index 27e06c98db17..10ee863f1734 100644
--- a/include/drm/drm_displayid.h
+++ b/include/drm/drm_displayid.h
@@ -96,18 +96,6 @@ struct displayid_detailed_timing_block {
 	struct displayid_detailed_timings_1 timings[];
 };
 
-#define for_each_displayid_db(displayid, block, idx, length) \
-	for ((block) = (const struct displayid_block *)&(displayid)[idx]; \
-	     (idx) + sizeof(struct displayid_block) <= (length) && \
-	     (idx) + sizeof(struct displayid_block) + (block)->num_bytes <= (length) && \
-	     (block)->num_bytes > 0; \
-	     (idx) += sizeof(struct displayid_block) + (block)->num_bytes, \
-	     (block) = (const struct displayid_block *)&(displayid)[idx])
-
-const u8 *drm_find_displayid_extension(const struct edid *edid,
-				       int *length, int *idx,
-				       int *ext_index);
-
 /* DisplayID iteration */
 struct displayid_iter {
 	const struct edid *edid;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
