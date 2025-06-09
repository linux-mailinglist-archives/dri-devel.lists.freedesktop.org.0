Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE91AD23BD
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 18:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64CE310E429;
	Mon,  9 Jun 2025 16:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FDD10E429;
 Mon,  9 Jun 2025 16:24:36 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 2/3] drm/xe: Start using ggtt->start in preparation of balloon
 removal
Date: Mon,  9 Jun 2025 18:24:15 +0200
Message-ID: <20250609162417.841799-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250609162417.841799-1-dev@lankhorst.se>
References: <20250609162417.841799-1-dev@lankhorst.se>
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

Instead of having ggtt->size point to the end of ggtt, have ggtt->size
be the actual size of the GGTT, and introduce ggtt->start to point to
the beginning of GGTT.

This will allow a massive cleanup of GGTT in case of SRIOV-VF.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c |  2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                | 55 ++++++++++-----------
 drivers/gpu/drm/xe/xe_ggtt_types.h          |  4 +-
 3 files changed, 30 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
index 537766cdd882e..12a8970a5ca1c 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
@@ -67,7 +67,7 @@ static int guc_buf_test_init(struct kunit *test)
 
 	KUNIT_ASSERT_EQ(test, 0,
 			xe_ggtt_init_kunit(ggtt, DUT_GGTT_START,
-					   DUT_GGTT_START + DUT_GGTT_SIZE));
+					   DUT_GGTT_SIZE));
 
 	kunit_activate_static_stub(test, xe_managed_bo_create_pin_map,
 				   replacement_xe_managed_bo_create_pin_map);
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index be22909592747..12c1a9d7944cb 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -126,7 +126,7 @@ static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
 static void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
-	xe_tile_assert(ggtt->tile, addr < ggtt->size);
+	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
 
 	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
 }
@@ -222,18 +222,18 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 	.ggtt_set_pte = xe_ggtt_set_pte_and_flush,
 };
 
-static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u32 reserved)
+static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
 {
-	drm_mm_init(&ggtt->mm, reserved,
-		    ggtt->size - reserved);
+	ggtt->start = start;
+	ggtt->size = size;
+	drm_mm_init(&ggtt->mm, start, ggtt->size);
 	mutex_init(&ggtt->lock);
 	primelockdep(ggtt);
 }
 
-int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 reserved, u32 size)
+int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
 {
-	ggtt->size = size;
-	__xe_ggtt_init_early(ggtt, reserved);
+	__xe_ggtt_init_early(ggtt, start, size);
 	return 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
@@ -254,26 +254,29 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	unsigned int gsm_size;
+	u64 ggtt_start, wopcm = xe_wopcm_size(xe), ggtt_size;
 	int err;
 
-	if (IS_SRIOV_VF(xe))
-		gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
-	else
+	if (!IS_SRIOV_VF(xe)) {
 		gsm_size = probe_gsm_size(pdev);
-
-	if (gsm_size == 0) {
-		drm_err(&xe->drm, "Hardware reported no preallocated GSM\n");
-		return -ENOMEM;
+		if (gsm_size == 0) {
+			drm_err(&xe->drm, "Hardware reported no preallocated GSM\n");
+			return -ENOMEM;
+		}
+		ggtt_start = wopcm;
+		ggtt_size = (gsm_size / 8) * (u64) XE_PAGE_SIZE - ggtt_start;
+	} else {
+		/* GGTT is expected to be 4GiB */
+		ggtt_start = wopcm;
+		ggtt_size = SZ_4G - ggtt_start;
 	}
 
 	ggtt->gsm = ggtt->tile->mmio.regs + SZ_8M;
-	ggtt->size = (gsm_size / 8) * (u64) XE_PAGE_SIZE;
-
 	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
 		ggtt->flags |= XE_GGTT_FLAGS_64K;
 
-	if (ggtt->size > GUC_GGTT_TOP)
-		ggtt->size = GUC_GGTT_TOP;
+	if (ggtt_size + ggtt_start > GUC_GGTT_TOP)
+		ggtt_size = GUC_GGTT_TOP - ggtt_start;
 
 	if (GRAPHICS_VERx100(xe) >= 1270)
 		ggtt->pt_ops = (ggtt->tile->media_gt &&
@@ -284,7 +287,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 		ggtt->pt_ops = &xelp_pt_ops;
 
 	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, WQ_MEM_RECLAIM);
-	__xe_ggtt_init_early(ggtt, xe_wopcm_size(xe));
+	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size);
 
 	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
 	if (err)
@@ -520,11 +523,9 @@ void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node)
 static void xe_ggtt_assert_fit(struct xe_ggtt *ggtt, u64 start, u64 size)
 {
 	struct xe_tile *tile = ggtt->tile;
-	struct xe_device *xe = tile_to_xe(tile);
-	u64 __maybe_unused wopcm = xe_wopcm_size(xe);
 
-	xe_tile_assert(tile, start >= wopcm);
-	xe_tile_assert(tile, start + size < ggtt->size - wopcm);
+	xe_tile_assert(tile, start >= ggtt->start);
+	xe_tile_assert(tile, start + size <= ggtt->start + ggtt->size);
 }
 
 /**
@@ -830,14 +831,12 @@ u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
 {
 	const struct drm_mm *mm = &ggtt->mm;
 	const struct drm_mm_node *entry;
-	u64 hole_min_start = xe_wopcm_size(tile_to_xe(ggtt->tile));
 	u64 hole_start, hole_end, hole_size;
 	u64 max_hole = 0;
 
 	mutex_lock(&ggtt->lock);
-
 	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
-		hole_start = max(hole_start, hole_min_start);
+		hole_start = max(hole_start, ggtt->start);
 		hole_start = ALIGN(hole_start, alignment);
 		hole_end = ALIGN_DOWN(hole_end, alignment);
 		if (hole_start >= hole_end)
@@ -930,15 +929,13 @@ u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer
 {
 	const struct drm_mm *mm = &ggtt->mm;
 	const struct drm_mm_node *entry;
-	u64 hole_min_start = xe_wopcm_size(tile_to_xe(ggtt->tile));
 	u64 hole_start, hole_end, hole_size;
 	u64 total = 0;
 	char buf[10];
 
 	mutex_lock(&ggtt->lock);
-
 	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
-		hole_start = max(hole_start, hole_min_start);
+		hole_start = max(hole_start, ggtt->start);
 		hole_start = ALIGN(hole_start, alignment);
 		hole_end = ALIGN_DOWN(hole_end, alignment);
 		if (hole_start >= hole_end)
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index c5e999d58ff2a..a27919302d6b2 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -22,7 +22,9 @@ struct xe_gt;
 struct xe_ggtt {
 	/** @tile: Back pointer to tile where this GGTT belongs */
 	struct xe_tile *tile;
-	/** @size: Total size of this GGTT */
+	/** @start: Start offset of GGTT */
+	u64 start;
+	/** @size: Total usable size of this GGTT */
 	u64 size;
 
 #define XE_GGTT_FLAGS_64K BIT(0)
-- 
2.45.2

