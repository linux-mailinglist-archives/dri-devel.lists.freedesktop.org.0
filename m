Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC150A766BF
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 15:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E5210E408;
	Mon, 31 Mar 2025 13:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VkCE6Kwl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4147710E3FD
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 13:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743427276; x=1774963276;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xPMSA26/AJ4mJU/8i67xTY6M7wt3xCf2SLNJByBr75Y=;
 b=VkCE6KwlXOo2IXaa+3IpDjUWC573Mg95d8u8WF6OuEE5fokE08LojROJ
 OYv1AOwzxGIH5ihfzskLe0prUoLyed+HY7AoIp+mcQyXEm5pqeO1/J4Ad
 2PZc6iN+TJlH+98OLHm33logyQVPqMu+5VWHrcEcFiDlrFIubwsbb4tAa
 Pyfy/mr94o9DQE8fjAwRd5XxUYaZlzT+p+xIZLIs3S0ishNjYRj2M6a8b
 /oVUsXLmNr95Z+QfbIwCibdUV8rW5g9VfdO9EMvPB4JgL9FPwDQPjRPP2
 o1cwhKO3jC6wO+ap43YVjPf4zI5oY5ARKITyNWi0S83OxMI8G5onE+kIa g==;
X-CSE-ConnectionGUID: x2UNXbfySnK3Y9wvtmhY4g==
X-CSE-MsgGUID: vBjX6b7cT8qQthNOw53c6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44425979"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="44425979"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 06:21:15 -0700
X-CSE-ConnectionGUID: Pn6PRdKNTguZdS+muOvkZQ==
X-CSE-MsgGUID: mjCV9AbqTzegEzqvx0ubIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="130792678"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa005.fm.intel.com with ESMTP; 31 Mar 2025 06:21:13 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v6 2/4] drm/xe/sriov: Shifting GGTT area post migration
Date: Mon, 31 Mar 2025 15:21:05 +0200
Message-Id: <20250331132107.1242954-3-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250331132107.1242954-1-tomasz.lis@intel.com>
References: <20250331132107.1242954-1-tomasz.lis@intel.com>
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

We have only one GGTT for all IOV functions, with each VF having assigned
a range of addresses for its use. After migration, a VF can receive a
different range of addresses than it had initially.

This implements shifting GGTT addresses within drm_mm nodes, so that
VMAs stay valid after migration. This will make the driver use new
addresses when accessing GGTT from the moment the shifting ends.

By taking the ggtt->lock for the period of VMA fixups, this change
also adds constraint on that mutex. Any locks used during the recovery
cannot ever wait for hardware response - because after migration,
the hardware will not do anything until fixups are finished.

v2: Moved some functs to xe_ggtt.c; moved shift computation to just
  after querying; improved documentation; switched some warns to asserts;
  skipping fixups when GGTT shift eq 0; iterating through tiles (Michal)
v3: Updated kerneldocs, removed unused funct, properly allocate
  balloning nodes if non existent
v4: Re-used ballooning functions from VF init, used bool in place of
  standard error codes
v5: Renamed one function

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c              | 33 +++++++++
 drivers/gpu/drm/xe/xe_ggtt.h              |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 83 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  2 +
 drivers/gpu/drm/xe/xe_sriov_vf.c          | 17 +++++
 6 files changed, 137 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 2d7456e37ef4..b13c4a12393e 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -482,6 +482,39 @@ void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node)
 	drm_mm_remove_node(&node->base);
 }
 
+/**
+ * xe_ggtt_shift_mm_nodes - Shift GGTT nodes to adjust for a change in usable address range.
+ * @ggtt: the &xe_ggtt struct instance
+ * @shift: change to the location of area provisioned for current VF
+ */
+void xe_ggtt_shift_mm_nodes(struct xe_ggtt *ggtt, s64 shift)
+{
+	struct drm_mm_node *node, *tmpn;
+	LIST_HEAD(temp_list_head);
+	int err;
+
+	lockdep_assert_held(&ggtt->lock);
+
+	/*
+	 * Move nodes, from range previously assigned to this VF, to a temp list.
+	 */
+	drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm) {
+		drm_mm_remove_node(node);
+		list_add(&node->node_list, &temp_list_head);
+	}
+
+	/*
+	 * Now the GGTT VM contains no nodes. We can re-add all VF nodes with
+	 * shifted offsets.
+	 */
+	list_for_each_entry_safe(node, tmpn, &temp_list_head, node_list) {
+		list_del(&node->node_list);
+		node->start += shift;
+		err = drm_mm_reserve_node(&ggtt->mm, node);
+		xe_tile_assert(ggtt->tile, !err);
+	}
+}
+
 /**
  * xe_ggtt_node_insert_locked - Locked version to insert a &xe_ggtt_node into the GGTT
  * @node: the &xe_ggtt_node to be inserted
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 27e7d67de004..a07194cd3724 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -18,6 +18,7 @@ void xe_ggtt_node_fini(struct xe_ggtt_node *node);
 int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node,
 				u64 start, u64 size);
 void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node);
+void xe_ggtt_shift_mm_nodes(struct xe_ggtt *ggtt, s64 shift);
 
 int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
 int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 9edbe34f45f4..e9e7ddeb4254 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -415,6 +415,7 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
 	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
 				start, start + size - 1, size / SZ_1K);
 
+	config->ggtt_shift = start - (s64)config->ggtt_base;
 	config->ggtt_base = start;
 	config->ggtt_size = size;
 
@@ -972,6 +973,88 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt)
 	return err;
 }
 
+/**
+ * xe_gt_sriov_vf_fixup_ggtt_nodes - Shift GGTT allocations to match assigned range.
+ * @gt: the &xe_gt struct instance
+ * Return: True if fixups are necessary
+ *
+ * Since Global GTT is not virtualized, each VF has an assigned range
+ * within the global space. This range might have changed during migration,
+ * which requires all memory addresses pointing to GGTT to be shifted.
+ */
+bool xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt)
+{
+	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_ggtt *ggtt = tile->mem.ggtt;
+	s64 ggtt_shift;
+
+	mutex_lock(&ggtt->lock);
+	ggtt_shift = config->ggtt_shift;
+	/*
+	 * Move nodes, including balloons, from range previously assigned to this VF,
+	 * into newly provisioned area.
+	 *
+	 * The balloon nodes are there to eliminate unavailable ranges from use: one
+	 * reserves the GGTT area below the range for current VF, and another one
+	 * reserves area above.
+	 *
+	 * Below is a GGTT layout of example VF, with a certain address range assigned to
+	 * said VF, and inaccessible areas above and below:
+	 *
+	 *  0                                                                        4GiB
+	 *  |<--------------------------- Total GGTT size ----------------------------->|
+	 *      WOPCM                                                         GUC_TOP
+	 *      |<-------------- Area mappable by xe_ggtt instance ---------------->|
+	 *
+	 *  +---+---------------------------------+----------+----------------------+---+
+	 *  |\\\|/////////////////////////////////|  VF mem  |//////////////////////|\\\|
+	 *  +---+---------------------------------+----------+----------------------+---+
+	 *
+	 * Hardware enforced access rules before migration:
+	 *
+	 *  |<------- inaccessible for VF ------->|<VF owned>|<-- inaccessible for VF ->|
+	 *
+	 * drm_mm nodes used for tracking allocations:
+	 *
+	 *     |<----------- balloon ------------>|<- nodes->|<----- balloon ------>|
+	 *
+	 * After the migration, GGTT area assigned to the VF might have shifted, either
+	 * to lower or to higher address. But we expect the total size and extra areas to
+	 * be identical, as migration can only happen between matching platforms.
+	 * Below is an example of GGTT layout of the VF after migration. Content of the
+	 * GGTT for VF has been moved to a new area, and we receive its address from GuC:
+	 *
+	 *  +---+----------------------+----------+---------------------------------+---+
+	 *  |\\\|//////////////////////|  VF mem  |/////////////////////////////////|\\\|
+	 *  +---+----------------------+----------+---------------------------------+---+
+	 *
+	 * Hardware enforced access rules after migration:
+	 *
+	 *  |<- inaccessible for VF -->|<VF owned>|<------- inaccessible for VF ------->|
+	 *
+	 * So the VF has a new slice of GGTT assigned, and during migration process, the
+	 * memory content was copied to that new area. But the drm_mm nodes within xe kmd
+	 * are still tracking allocations using the old addresses. The nodes within VF
+	 * owned area have to be shifted, and balloon nodes need to be resized to
+	 * properly mask out areas not owned by the VF.
+	 *
+	 * Fixed drm_mm nodes used for tracking allocations:
+	 *
+	 *     |<------ balloon ------>|<- nodes->|<----------- balloon ----------->|
+	 *
+	 * Due to use of GPU profiles, we do not expect the old and new GGTT ares to
+	 * overlap; but our node shifting will fix addresses properly regardless.
+	 */
+	if (ggtt_shift) {
+		xe_gt_sriov_vf_deballoon_ggtt(gt);
+		xe_ggtt_shift_mm_nodes(ggtt, ggtt_shift);
+		xe_gt_sriov_vf_balloon_ggtt(gt);
+	}
+	mutex_unlock(&ggtt->lock);
+	return ggtt_shift != 0;
+}
+
 static int vf_runtime_reg_cmp(const void *a, const void *b)
 {
 	const struct vf_runtime_reg *ra = a;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index c87b0e9c7ebc..13c04e313aa6 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -20,6 +20,7 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
 int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
 int xe_gt_sriov_vf_balloon_ggtt(struct xe_gt *gt);
 void xe_gt_sriov_vf_deballoon_ggtt(struct xe_gt *gt);
+bool xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt);
 int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
 void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index a57f13b5afcd..5ccbdf8d08b6 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -40,6 +40,8 @@ struct xe_gt_sriov_vf_selfconfig {
 	u64 ggtt_base;
 	/** @ggtt_size: assigned size of the GGTT region. */
 	u64 ggtt_size;
+	/** @ggtt_shift: difference in ggtt_base on last migration */
+	s64 ggtt_shift;
 	/** @lmem_size: assigned size of the LMEM. */
 	u64 lmem_size;
 	/** @num_ctxs: assigned number of GuC submission context IDs. */
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index c1275e64aa9c..2eb6b8d8a217 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -7,6 +7,7 @@
 
 #include "xe_assert.h"
 #include "xe_device.h"
+#include "xe_gt.h"
 #include "xe_gt_sriov_printk.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_pm.h"
@@ -170,6 +171,20 @@ static bool vf_post_migration_imminent(struct xe_device *xe)
 	work_pending(&xe->sriov.vf.migration.worker);
 }
 
+static bool vf_post_migration_fixup_ggtt_nodes(struct xe_device *xe)
+{
+	struct xe_tile *tile;
+	unsigned int id;
+	bool need_fixups = false;
+
+	for_each_tile(tile, xe, id) {
+		struct xe_gt *gt = tile->primary_gt;
+
+		need_fixups |= xe_gt_sriov_vf_fixup_ggtt_nodes(gt);
+	}
+	return need_fixups;
+}
+
 /*
  * Notify all GuCs about resource fixups apply finished.
  */
@@ -191,6 +206,7 @@ static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
 
 static void vf_post_migration_recovery(struct xe_device *xe)
 {
+	bool need_fixups;
 	int err;
 
 	drm_dbg(&xe->drm, "migration recovery in progress\n");
@@ -201,6 +217,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 	if (unlikely(err))
 		goto fail;
 
+	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
 	/* FIXME: add the recovery steps */
 	vf_post_migration_notify_resfix_done(xe);
 	xe_pm_runtime_put(xe);
-- 
2.25.1

