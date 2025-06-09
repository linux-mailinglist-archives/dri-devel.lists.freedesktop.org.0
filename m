Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F90AD23C0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 18:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF8A10E3D2;
	Mon,  9 Jun 2025 16:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D3410E420;
 Mon,  9 Jun 2025 16:24:36 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 3/3] drm/xe: Rewrite GGTT VF initialisation
Date: Mon,  9 Jun 2025 18:24:16 +0200
Message-ID: <20250609162417.841799-3-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250609162417.841799-1-dev@lankhorst.se>
References: <20250609162417.841799-1-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The previous code was using a complicated system with 2 balloons to
set GGTT size and adjust GGTT offset. While it works, it's overly
complicated.

A better approach is to set the offset and size when initialising GGTT,
this removes the need for adding balloons. The resize function only
needs to re-initialise GGTT at the new offset.

We use the newly created drm_mm_shift to shift the nodes.

This removes the need to manipulate the internals of xe_ggtt outside
of xe_ggtt, and cleans up a lot of now unneeded code.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/Makefile           |   3 +-
 drivers/gpu/drm/xe/xe_ggtt.c          | 144 +++------------
 drivers/gpu/drm/xe/xe_ggtt.h          |   5 +-
 drivers/gpu/drm/xe/xe_sriov_vf.c      |   4 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c | 254 --------------------------
 drivers/gpu/drm/xe/xe_tile_sriov_vf.h |  18 --
 6 files changed, 29 insertions(+), 399 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_vf.c
 delete mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_vf.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index f5f5775acdc00..e4bf484d41216 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -139,8 +139,7 @@ xe-y += \
 	xe_guc_relay.o \
 	xe_memirq.o \
 	xe_sriov.o \
-	xe_sriov_vf.o \
-	xe_tile_sriov_vf.o
+	xe_sriov_vf.o
 
 xe-$(CONFIG_PCI_IOV) += \
 	xe_gt_sriov_pf.o \
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 12c1a9d7944cb..726e6a5d0584b 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -29,7 +29,7 @@
 #include "xe_pm.h"
 #include "xe_res_cursor.h"
 #include "xe_sriov.h"
-#include "xe_tile_sriov_vf.h"
+#include "xe_gt_sriov_vf.h"
 #include "xe_wa.h"
 #include "xe_wopcm.h"
 
@@ -255,7 +255,6 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	unsigned int gsm_size;
 	u64 ggtt_start, wopcm = xe_wopcm_size(xe), ggtt_size;
-	int err;
 
 	if (!IS_SRIOV_VF(xe)) {
 		gsm_size = probe_gsm_size(pdev);
@@ -266,9 +265,15 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 		ggtt_start = wopcm;
 		ggtt_size = (gsm_size / 8) * (u64) XE_PAGE_SIZE - ggtt_start;
 	} else {
-		/* GGTT is expected to be 4GiB */
-		ggtt_start = wopcm;
-		ggtt_size = SZ_4G - ggtt_start;
+		ggtt_start = xe_gt_sriov_vf_ggtt_base(ggtt->tile->primary_gt);
+		ggtt_size = xe_gt_sriov_vf_ggtt(ggtt->tile->primary_gt);
+
+		if (ggtt_start < wopcm || ggtt_start > GUC_GGTT_TOP ||
+		    ggtt_size > GUC_GGTT_TOP - ggtt_start) {
+			drm_err(&xe->drm, "tile%u: Invalid GGTT configuration: %#llx-%#llx\n",
+				     ggtt->tile->id, ggtt_start, ggtt_start + ggtt_size - 1);
+			return -ERANGE;
+		}
 	}
 
 	ggtt->gsm = ggtt->tile->mmio.regs + SZ_8M;
@@ -289,17 +294,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, WQ_MEM_RECLAIM);
 	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size);
 
-	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
-	if (err)
-		return err;
-
-	if (IS_SRIOV_VF(xe)) {
-		err = xe_tile_sriov_vf_prepare_ggtt(ggtt->tile);
-		if (err)
-			return err;
-	}
-
-	return 0;
+	return drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
 }
 ALLOW_ERROR_INJECTION(xe_ggtt_init_early, ERRNO); /* See xe_pci_probe() */
 
@@ -452,84 +447,8 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
 	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
 }
 
-static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
-			      const struct drm_mm_node *node, const char *description)
-{
-	char buf[10];
-
-	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
-		string_get_size(node->size, 1, STRING_UNITS_2, buf, sizeof(buf));
-		xe_gt_dbg(ggtt->tile->primary_gt, "GGTT %#llx-%#llx (%s) %s\n",
-			  node->start, node->start + node->size, buf, description);
-	}
-}
-
-/**
- * xe_ggtt_node_insert_balloon_locked - prevent allocation of specified GGTT addresses
- * @node: the &xe_ggtt_node to hold reserved GGTT node
- * @start: the starting GGTT address of the reserved region
- * @end: then end GGTT address of the reserved region
- *
- * To be used in cases where ggtt->lock is already taken.
- * Use xe_ggtt_node_remove_balloon_locked() to release a reserved GGTT node.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node, u64 start, u64 end)
-{
-	struct xe_ggtt *ggtt = node->ggtt;
-	int err;
-
-	xe_tile_assert(ggtt->tile, start < end);
-	xe_tile_assert(ggtt->tile, IS_ALIGNED(start, XE_PAGE_SIZE));
-	xe_tile_assert(ggtt->tile, IS_ALIGNED(end, XE_PAGE_SIZE));
-	xe_tile_assert(ggtt->tile, !drm_mm_node_allocated(&node->base));
-	lockdep_assert_held(&ggtt->lock);
-
-	node->base.color = 0;
-	node->base.start = start;
-	node->base.size = end - start;
-
-	err = drm_mm_reserve_node(&ggtt->mm, &node->base);
-
-	if (xe_gt_WARN(ggtt->tile->primary_gt, err,
-		       "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
-		       node->base.start, node->base.start + node->base.size, ERR_PTR(err)))
-		return err;
-
-	xe_ggtt_dump_node(ggtt, &node->base, "balloon");
-	return 0;
-}
-
 /**
- * xe_ggtt_node_remove_balloon_locked - release a reserved GGTT region
- * @node: the &xe_ggtt_node with reserved GGTT region
- *
- * To be used in cases where ggtt->lock is already taken.
- * See xe_ggtt_node_insert_balloon_locked() for details.
- */
-void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node)
-{
-	if (!xe_ggtt_node_allocated(node))
-		return;
-
-	lockdep_assert_held(&node->ggtt->lock);
-
-	xe_ggtt_dump_node(node->ggtt, &node->base, "remove-balloon");
-
-	drm_mm_remove_node(&node->base);
-}
-
-static void xe_ggtt_assert_fit(struct xe_ggtt *ggtt, u64 start, u64 size)
-{
-	struct xe_tile *tile = ggtt->tile;
-
-	xe_tile_assert(tile, start >= ggtt->start);
-	xe_tile_assert(tile, start + size <= ggtt->start + ggtt->size);
-}
-
-/**
- * xe_ggtt_shift_nodes_locked - Shift GGTT nodes to adjust for a change in usable address range.
+ * xe_ggtt_shift_nodes - Shift GGTT nodes to adjust for a change in usable address range.
  * @ggtt: the &xe_ggtt struct instance
  * @shift: change to the location of area provisioned for current VF
  *
@@ -543,29 +462,18 @@ static void xe_ggtt_assert_fit(struct xe_ggtt *ggtt, u64 start, u64 size)
  * the list of nodes was either already damaged, or that the shift brings the address range
  * outside of valid bounds. Both cases justify an assert rather than error code.
  */
-void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift)
+void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, s64 shift)
 {
-	struct xe_tile *tile __maybe_unused = ggtt->tile;
-	struct drm_mm_node *node, *tmpn;
-	LIST_HEAD(temp_list_head);
+	s64 new_start;
 
-	lockdep_assert_held(&ggtt->lock);
+	mutex_lock(&ggtt->lock);
 
-	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))
-		drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm)
-			xe_ggtt_assert_fit(ggtt, node->start + shift, node->size);
+	new_start = ggtt->start + shift;
+	xe_tile_assert(ggtt->tile, new_start >= xe_wopcm_size(tile_to_xe(ggtt->tile)));
+	xe_tile_assert(ggtt->tile, new_start + ggtt->size <= GUC_GGTT_TOP);
 
-	drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm) {
-		drm_mm_remove_node(node);
-		list_add(&node->node_list, &temp_list_head);
-	}
-
-	list_for_each_entry_safe(node, tmpn, &temp_list_head, node_list) {
-		list_del(&node->node_list);
-		node->start += shift;
-		drm_mm_reserve_node(&ggtt->mm, node);
-		xe_tile_assert(tile, drm_mm_node_allocated(node));
-	}
+	drm_mm_shift(&ggtt->mm, shift);
+	mutex_unlock(&ggtt->lock);
 }
 
 /**
@@ -617,11 +525,9 @@ int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align)
  * @ggtt: the &xe_ggtt where the new node will later be inserted/reserved.
  *
  * This function will allocate the struct %xe_ggtt_node and return its pointer.
- * This struct will then be freed after the node removal upon xe_ggtt_node_remove()
- * or xe_ggtt_node_remove_balloon_locked().
+ * This struct will then be freed after the node removal upon xe_ggtt_node_remove().
  * Having %xe_ggtt_node struct allocated doesn't mean that the node is already allocated
- * in GGTT. Only the xe_ggtt_node_insert(), xe_ggtt_node_insert_locked(),
- * xe_ggtt_node_insert_balloon_locked() will ensure the node is inserted or reserved in GGTT.
+ * in GGTT. Only xe_ggtt_node_insert() will ensure the node is inserted or reserved in GGTT.
  *
  * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
  **/
@@ -642,9 +548,9 @@ struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
  * xe_ggtt_node_fini - Forcebly finalize %xe_ggtt_node struct
  * @node: the &xe_ggtt_node to be freed
  *
- * If anything went wrong with either xe_ggtt_node_insert(), xe_ggtt_node_insert_locked(),
- * or xe_ggtt_node_insert_balloon_locked(); and this @node is not going to be reused, then,
- * this function needs to be called to free the %xe_ggtt_node struct
+ * If anything went wrong with either xe_ggtt_node_insert() and this @node is
+ * not going to be reused, then this function needs to be called to free the
+ * %xe_ggtt_node struct
  **/
 void xe_ggtt_node_fini(struct xe_ggtt_node *node)
 {
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index fbe1e397d05d6..c00d6c8f687ac 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -18,10 +18,7 @@ int xe_ggtt_init(struct xe_ggtt *ggtt);
 
 struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt);
 void xe_ggtt_node_fini(struct xe_ggtt_node *node);
-int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node,
-				       u64 start, u64 size);
-void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node);
-void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift);
+void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, s64 shift);
 
 int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
 int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 6526fe450e553..59e82124d6507 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -7,6 +7,7 @@
 
 #include "xe_assert.h"
 #include "xe_device.h"
+#include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_gt_sriov_printk.h"
 #include "xe_gt_sriov_vf.h"
@@ -15,7 +16,6 @@
 #include "xe_sriov.h"
 #include "xe_sriov_printk.h"
 #include "xe_sriov_vf.h"
-#include "xe_tile_sriov_vf.h"
 
 /**
  * DOC: VF restore procedure in PF KMD and VF KMD
@@ -212,7 +212,7 @@ static bool vf_post_migration_fixup_ggtt_nodes(struct xe_device *xe)
 		shift = xe_gt_sriov_vf_ggtt_shift(gt);
 		if (shift) {
 			need_fixups = true;
-			xe_tile_sriov_vf_fixup_ggtt_nodes(tile, shift);
+			xe_ggtt_shift_nodes(tile->mem.ggtt, shift);
 		}
 	}
 	return need_fixups;
diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
deleted file mode 100644
index f221dbed16f09..0000000000000
--- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
+++ /dev/null
@@ -1,254 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright © 2025 Intel Corporation
- */
-
-#include <drm/drm_managed.h>
-
-#include "regs/xe_gtt_defs.h"
-
-#include "xe_assert.h"
-#include "xe_ggtt.h"
-#include "xe_gt_sriov_vf.h"
-#include "xe_sriov.h"
-#include "xe_sriov_printk.h"
-#include "xe_tile_sriov_vf.h"
-#include "xe_wopcm.h"
-
-static int vf_init_ggtt_balloons(struct xe_tile *tile)
-{
-	struct xe_ggtt *ggtt = tile->mem.ggtt;
-
-	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
-
-	tile->sriov.vf.ggtt_balloon[0] = xe_ggtt_node_init(ggtt);
-	if (IS_ERR(tile->sriov.vf.ggtt_balloon[0]))
-		return PTR_ERR(tile->sriov.vf.ggtt_balloon[0]);
-
-	tile->sriov.vf.ggtt_balloon[1] = xe_ggtt_node_init(ggtt);
-	if (IS_ERR(tile->sriov.vf.ggtt_balloon[1])) {
-		xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
-		return PTR_ERR(tile->sriov.vf.ggtt_balloon[1]);
-	}
-
-	return 0;
-}
-
-/**
- * xe_tile_sriov_vf_balloon_ggtt_locked - Insert balloon nodes to limit used GGTT address range.
- * @tile: the &xe_tile struct instance
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
-{
-	u64 ggtt_base = xe_gt_sriov_vf_ggtt_base(tile->primary_gt);
-	u64 ggtt_size = xe_gt_sriov_vf_ggtt(tile->primary_gt);
-	struct xe_device *xe = tile_to_xe(tile);
-	u64 wopcm = xe_wopcm_size(xe);
-	u64 start, end;
-	int err;
-
-	xe_tile_assert(tile, IS_SRIOV_VF(xe));
-	xe_tile_assert(tile, ggtt_size);
-	lockdep_assert_held(&tile->mem.ggtt->lock);
-
-	/*
-	 * VF can only use part of the GGTT as allocated by the PF:
-	 *
-	 *      WOPCM                                  GUC_GGTT_TOP
-	 *      |<------------ Total GGTT size ------------------>|
-	 *
-	 *           VF GGTT base -->|<- size ->|
-	 *
-	 *      +--------------------+----------+-----------------+
-	 *      |////////////////////|   block  |\\\\\\\\\\\\\\\\\|
-	 *      +--------------------+----------+-----------------+
-	 *
-	 *      |<--- balloon[0] --->|<-- VF -->|<-- balloon[1] ->|
-	 */
-
-	if (ggtt_base < wopcm || ggtt_base > GUC_GGTT_TOP ||
-	    ggtt_size > GUC_GGTT_TOP - ggtt_base) {
-		xe_sriov_err(xe, "tile%u: Invalid GGTT configuration: %#llx-%#llx\n",
-			     tile->id, ggtt_base, ggtt_base + ggtt_size - 1);
-		return -ERANGE;
-	}
-
-	start = wopcm;
-	end = ggtt_base;
-	if (end != start) {
-		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[0],
-							 start, end);
-		if (err)
-			return err;
-	}
-
-	start = ggtt_base + ggtt_size;
-	end = GUC_GGTT_TOP;
-	if (end != start) {
-		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[1],
-							 start, end);
-		if (err) {
-			xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
-			return err;
-		}
-	}
-
-	return 0;
-}
-
-static int vf_balloon_ggtt(struct xe_tile *tile)
-{
-	struct xe_ggtt *ggtt = tile->mem.ggtt;
-	int err;
-
-	mutex_lock(&ggtt->lock);
-	err = xe_tile_sriov_vf_balloon_ggtt_locked(tile);
-	mutex_unlock(&ggtt->lock);
-
-	return err;
-}
-
-/**
- * xe_tile_sriov_vf_deballoon_ggtt_locked - Remove balloon nodes.
- * @tile: the &xe_tile struct instance
- */
-void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile)
-{
-	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
-
-	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[1]);
-	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
-}
-
-static void vf_deballoon_ggtt(struct xe_tile *tile)
-{
-	mutex_lock(&tile->mem.ggtt->lock);
-	xe_tile_sriov_vf_deballoon_ggtt_locked(tile);
-	mutex_unlock(&tile->mem.ggtt->lock);
-}
-
-static void vf_fini_ggtt_balloons(struct xe_tile *tile)
-{
-	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
-
-	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[1]);
-	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
-}
-
-static void cleanup_ggtt(struct drm_device *drm, void *arg)
-{
-	struct xe_tile *tile = arg;
-
-	vf_deballoon_ggtt(tile);
-	vf_fini_ggtt_balloons(tile);
-}
-
-/**
- * xe_tile_sriov_vf_prepare_ggtt - Prepare a VF's GGTT configuration.
- * @tile: the &xe_tile
- *
- * This function is for VF use only.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile)
-{
-	struct xe_device *xe = tile_to_xe(tile);
-	int err;
-
-	err = vf_init_ggtt_balloons(tile);
-	if (err)
-		return err;
-
-	err = vf_balloon_ggtt(tile);
-	if (err) {
-		vf_fini_ggtt_balloons(tile);
-		return err;
-	}
-
-	return drmm_add_action_or_reset(&xe->drm, cleanup_ggtt, tile);
-}
-
-/**
- * DOC: GGTT nodes shifting during VF post-migration recovery
- *
- * The first fixup applied to the VF KMD structures as part of post-migration
- * recovery is shifting nodes within &xe_ggtt instance. The nodes are moved
- * from range previously assigned to this VF, into newly provisioned area.
- * The changes include balloons, which are resized accordingly.
- *
- * The balloon nodes are there to eliminate unavailable ranges from use: one
- * reserves the GGTT area below the range for current VF, and another one
- * reserves area above.
- *
- * Below is a GGTT layout of example VF, with a certain address range assigned to
- * said VF, and inaccessible areas above and below:
- *
- *  0                                                                        4GiB
- *  |<--------------------------- Total GGTT size ----------------------------->|
- *      WOPCM                                                         GUC_TOP
- *      |<-------------- Area mappable by xe_ggtt instance ---------------->|
- *
- *  +---+---------------------------------+----------+----------------------+---+
- *  |\\\|/////////////////////////////////|  VF mem  |//////////////////////|\\\|
- *  +---+---------------------------------+----------+----------------------+---+
- *
- * Hardware enforced access rules before migration:
- *
- *  |<------- inaccessible for VF ------->|<VF owned>|<-- inaccessible for VF ->|
- *
- * GGTT nodes used for tracking allocations:
- *
- *      |<---------- balloon ------------>|<- nodes->|<----- balloon ------>|
- *
- * After the migration, GGTT area assigned to the VF might have shifted, either
- * to lower or to higher address. But we expect the total size and extra areas to
- * be identical, as migration can only happen between matching platforms.
- * Below is an example of GGTT layout of the VF after migration. Content of the
- * GGTT for VF has been moved to a new area, and we receive its address from GuC:
- *
- *  +---+----------------------+----------+---------------------------------+---+
- *  |\\\|//////////////////////|  VF mem  |/////////////////////////////////|\\\|
- *  +---+----------------------+----------+---------------------------------+---+
- *
- * Hardware enforced access rules after migration:
- *
- *  |<- inaccessible for VF -->|<VF owned>|<------- inaccessible for VF ------->|
- *
- * So the VF has a new slice of GGTT assigned, and during migration process, the
- * memory content was copied to that new area. But the &xe_ggtt nodes are still
- * tracking allocations using the old addresses. The nodes within VF owned area
- * have to be shifted, and balloon nodes need to be resized to properly mask out
- * areas not owned by the VF.
- *
- * Fixed &xe_ggtt nodes used for tracking allocations:
- *
- *     |<------ balloon ------>|<- nodes->|<----------- balloon ----------->|
- *
- * Due to use of GPU profiles, we do not expect the old and new GGTT ares to
- * overlap; but our node shifting will fix addresses properly regardless.
- */
-
-/**
- * xe_tile_sriov_vf_fixup_ggtt_nodes - Shift GGTT allocations to match assigned range.
- * @tile: the &xe_tile struct instance
- * @shift: the shift value
- *
- * Since Global GTT is not virtualized, each VF has an assigned range
- * within the global space. This range might have changed during migration,
- * which requires all memory addresses pointing to GGTT to be shifted.
- */
-void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift)
-{
-	struct xe_ggtt *ggtt = tile->mem.ggtt;
-
-	mutex_lock(&ggtt->lock);
-
-	xe_tile_sriov_vf_deballoon_ggtt_locked(tile);
-	xe_ggtt_shift_nodes_locked(ggtt, shift);
-	xe_tile_sriov_vf_balloon_ggtt_locked(tile);
-
-	mutex_unlock(&ggtt->lock);
-}
diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
deleted file mode 100644
index 93eb043171e83..0000000000000
--- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2025 Intel Corporation
- */
-
-#ifndef _XE_TILE_SRIOV_VF_H_
-#define _XE_TILE_SRIOV_VF_H_
-
-#include <linux/types.h>
-
-struct xe_tile;
-
-int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile);
-int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile);
-void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile);
-void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift);
-
-#endif
-- 
2.45.2

