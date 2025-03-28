Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F974A75037
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 19:12:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6265410EA8B;
	Fri, 28 Mar 2025 18:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="diKJ/8SA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A760610EA8B
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 18:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743185525; x=1774721525;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T53QCUqkXcX9lHjwShX9lvvpE3mUBzCddMQKa6FhvsI=;
 b=diKJ/8SAOr0Rm0aMRdVFn4UsBF34ywdRANIdS/l7vZWUQuH+R7WqeA10
 X7h4oHB0l5flNKOphjan3Kdo5S5ptQPTyULUlFLHLk5nUHz8O/9sOig+Q
 i+F5pVk9TXT7TMmK3EKfOibQFIXuZ5u6DPKD4t6STUYfc3VhUmFuNV9dH
 FY7A+XxX+RifcJdQVLfl1Y20IDXuA/lkaXNgcZwYVD+H6I1qEU0X0NxW6
 fJK8u78XmXcQwDYWYMZeGyutBDlCBNIH3h3M1ZmkT//7EohbRKr8eKmq7
 lnOMwXv0+8ahDvT29mXujDx8w6p6v9ZPajmmNVV8Roe0OKA/GNPQ7L3VI w==;
X-CSE-ConnectionGUID: uQH/7wZ2RW2xFDSIq6OkUQ==
X-CSE-MsgGUID: 6vb0Dg+/SuaPd0CTXGKVdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="48338806"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="48338806"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 11:12:05 -0700
X-CSE-ConnectionGUID: QOQbcTgKQw62id9ZW8Yr3Q==
X-CSE-MsgGUID: uy5ziifzTbm+0JRH8SpK1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="130616373"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa004.fm.intel.com with ESMTP; 28 Mar 2025 11:12:03 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v5 1/4] drm/xe/vf: Divide ballooning into allocation and
 insertion
Date: Fri, 28 Mar 2025 19:11:57 +0100
Message-Id: <20250328181200.1011623-2-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250328181200.1011623-1-tomasz.lis@intel.com>
References: <20250328181200.1011623-1-tomasz.lis@intel.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The balloon nodes used to fill areas of GGTT inaccessible for
a specific VF, were allocaten and inserted into GGTT within
one function. This disallowed re-using the insertion part
during VF migration recovery.

This patch separates allocation (init/fini functs) from the insertion
of balloons (balloon/deballoon functs). Locks are also moved to ensure
calls from post-migration recovery worker will not cause a deadlock.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c        |  9 +---
 drivers/gpu/drm/xe/xe_ggtt.h        |  2 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 64 ++++++++++++++++++++++-------
 3 files changed, 52 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 5fcb2b4c2c13..2d7456e37ef4 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -452,9 +452,7 @@ int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node, u64 start, u64 end)
 	node->base.start = start;
 	node->base.size = end - start;
 
-	mutex_lock(&ggtt->lock);
 	err = drm_mm_reserve_node(&ggtt->mm, &node->base);
-	mutex_unlock(&ggtt->lock);
 
 	if (xe_gt_WARN(ggtt->tile->primary_gt, err,
 		       "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
@@ -477,16 +475,11 @@ void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node)
 		return;
 
 	if (!drm_mm_node_allocated(&node->base))
-		goto free_node;
+		return;
 
 	xe_ggtt_dump_node(node->ggtt, &node->base, "remove-balloon");
 
-	mutex_lock(&node->ggtt->lock);
 	drm_mm_remove_node(&node->base);
-	mutex_unlock(&node->ggtt->lock);
-
-free_node:
-	xe_ggtt_node_fini(node);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 27e7d67de004..fddb68f309d9 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -18,6 +18,8 @@ void xe_ggtt_node_fini(struct xe_ggtt_node *node);
 int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node,
 				u64 start, u64 size);
 void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node);
+int xe_gt_sriov_vf_balloon_ggtt(struct xe_gt *gt);
+void xe_gt_sriov_vf_deballoon_ggtt(struct xe_gt *gt);
 
 int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
 int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index a439261bf4d7..9edbe34f45f4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -560,26 +560,33 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
 	return gt->sriov.vf.self_config.lmem_size;
 }
 
-static struct xe_ggtt_node *
-vf_balloon_ggtt_node(struct xe_ggtt *ggtt, u64 start, u64 end)
+static int
+vf_balloon_ggtt_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+		     u64 start, u64 end)
 {
-	struct xe_ggtt_node *node;
 	int err;
 
-	node = xe_ggtt_node_init(ggtt);
 	if (IS_ERR(node))
-		return node;
+		return PTR_ERR(node);
 
 	err = xe_ggtt_node_insert_balloon(node, start, end);
 	if (err) {
-		xe_ggtt_node_fini(node);
-		return ERR_PTR(err);
+		return err;
 	}
 
-	return node;
+	return 0;
 }
 
-static int vf_balloon_ggtt(struct xe_gt *gt)
+static void xe_gt_sriov_vf_balloon_init(struct xe_gt *gt)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_ggtt *ggtt = tile->mem.ggtt;
+
+	tile->sriov.vf.ggtt_balloon[0] = xe_ggtt_node_init(ggtt);
+	tile->sriov.vf.ggtt_balloon[1] = xe_ggtt_node_init(ggtt);
+}
+
+int xe_gt_sriov_vf_balloon_ggtt(struct xe_gt *gt)
 {
 	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -589,6 +596,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 
 	xe_gt_assert(gt, IS_SRIOV_VF(xe));
 	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
+	lockdep_assert_held(&tile->mem.ggtt->lock);
 
 	if (!config->ggtt_size)
 		return -ENODATA;
@@ -611,7 +619,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	start = xe_wopcm_size(xe);
 	end = config->ggtt_base;
 	if (end != start) {
-		tile->sriov.vf.ggtt_balloon[0] = vf_balloon_ggtt_node(ggtt, start, end);
+		vf_balloon_ggtt_node(ggtt, tile->sriov.vf.ggtt_balloon[0], start, end);
 		if (IS_ERR(tile->sriov.vf.ggtt_balloon[0]))
 			return PTR_ERR(tile->sriov.vf.ggtt_balloon[0]);
 	}
@@ -619,7 +627,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	start = config->ggtt_base + config->ggtt_size;
 	end = GUC_GGTT_TOP;
 	if (end != start) {
-		tile->sriov.vf.ggtt_balloon[1] = vf_balloon_ggtt_node(ggtt, start, end);
+		vf_balloon_ggtt_node(ggtt, tile->sriov.vf.ggtt_balloon[1], start, end);
 		if (IS_ERR(tile->sriov.vf.ggtt_balloon[1])) {
 			xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[0]);
 			return PTR_ERR(tile->sriov.vf.ggtt_balloon[1]);
@@ -629,15 +637,34 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	return 0;
 }
 
-static void deballoon_ggtt(struct drm_device *drm, void *arg)
+void xe_gt_sriov_vf_deballoon_ggtt(struct xe_gt *gt)
 {
-	struct xe_tile *tile = arg;
+	struct xe_tile *tile = gt_to_tile(gt);
 
 	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
+	lockdep_assert_held(&tile->mem.ggtt->lock);
 	xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[1]);
 	xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[0]);
 }
 
+static void xe_gt_sriov_vf_balloon_fini(struct xe_gt *gt)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+
+	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[1]);
+	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
+}
+
+static void deballoon_ggtt(struct drm_device *drm, void *arg)
+{
+	struct xe_tile *tile = arg;
+
+	mutex_lock(&tile->mem.ggtt->lock);
+	xe_gt_sriov_vf_deballoon_ggtt(tile->primary_gt);
+	mutex_unlock(&tile->mem.ggtt->lock);
+	xe_gt_sriov_vf_balloon_fini(tile->primary_gt);
+}
+
 /**
  * xe_gt_sriov_vf_prepare_ggtt - Prepare a VF's GGTT configuration.
  * @gt: the &xe_gt
@@ -650,14 +677,21 @@ int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_ggtt *ggtt = tile->mem.ggtt;
 	int err;
 
 	if (xe_gt_is_media_type(gt))
 		return 0;
 
-	err = vf_balloon_ggtt(gt);
-	if (err)
+	xe_gt_sriov_vf_balloon_init(gt);
+
+	mutex_lock(&ggtt->lock);
+	err = xe_gt_sriov_vf_balloon_ggtt(gt);
+	mutex_unlock(&ggtt->lock);
+	if (err) {
+		xe_gt_sriov_vf_balloon_fini(gt);
 		return err;
+	}
 
 	return drmm_add_action_or_reset(&xe->drm, deballoon_ggtt, tile);
 }
-- 
2.25.1

