Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E671A3353C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 03:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA56210E9D5;
	Thu, 13 Feb 2025 02:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UXEOe0a0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689F610E9CF;
 Thu, 13 Feb 2025 02:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739412619; x=1770948619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BMuMPTp3dYl7ubXo2gZNmPIYpTh8dOL4x02nbFIN4oU=;
 b=UXEOe0a0r0gGUXEvk6x2zTf0c/UNXahShf9YDPZd79KS53P7mxySUrmL
 STPhS4BIVCiE+iRNATpMcp23jrTFB4RgSblZdwlDKv5afYTLvusOcRA0M
 HYo42MxLzbehpILursFQZjsRnt2HgdjMWH4KG+ADumsx4pOfHWB7gExqx
 jvW402bW+jf3h+iJNrsECEDsT1XCI4moJ2ctM+4DBPBKraLBZrx6dZ0vb
 moegO1WrWPBPfYV120scQFAGtab9KcwKyc+DGVKF9pkFb3PvYvDTUfG4s
 fsR8YA45DzekjYxPBnSRAq0X0tIX/uPVHcPpPLY+OREbQXS8CRzr0FCIM Q==;
X-CSE-ConnectionGUID: pC5kGlXERCavbWJH6Z4QFg==
X-CSE-MsgGUID: dZrXN1AJTNahHQJ5wlfQfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="65456030"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="65456030"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:17 -0800
X-CSE-ConnectionGUID: x63ORzviTj24jJhSbnGhFg==
X-CSE-MsgGUID: l7chXu+0RSijRkhgunOnXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117945093"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v5 20/32] drm/xe: Add migrate layer functions for SVM support
Date: Wed, 12 Feb 2025 18:11:00 -0800
Message-Id: <20250213021112.1228481-21-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213021112.1228481-1-matthew.brost@intel.com>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
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

Add functions which migrate to / from VRAM accepting a single DPA
argument (VRAM) and array of dma addresses (SRAM). Used for SVM
migrations.

v2:
 - Don't unlock job_mutex in error path of xe_migrate_vram
v3:
 - Kernel doc (Thomas)
 - Better commit message (Thomas)
 - s/dword/num_dword (Thomas)
 - Return error on to large of migration (Thomas)

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 175 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h |  10 ++
 2 files changed, 185 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 278bc96cf593..df4282c71bf0 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1544,6 +1544,181 @@ void xe_migrate_wait(struct xe_migrate *m)
 		dma_fence_wait(m->fence, false);
 }
 
+static u32 pte_update_cmd_size(u64 size)
+{
+	u32 num_dword;
+	u64 entries = DIV_ROUND_UP(size, XE_PAGE_SIZE);
+
+	XE_WARN_ON(size > MAX_PREEMPTDISABLE_TRANSFER);
+	/*
+	 * MI_STORE_DATA_IMM command is used to update page table. Each
+	 * instruction can update maximumly 0x1ff pte entries. To update
+	 * n (n <= 0x1ff) pte entries, we need:
+	 * 1 dword for the MI_STORE_DATA_IMM command header (opcode etc)
+	 * 2 dword for the page table's physical location
+	 * 2*n dword for value of pte to fill (each pte entry is 2 dwords)
+	 */
+	num_dword = (1 + 2) * DIV_ROUND_UP(entries, 0x1ff);
+	num_dword += entries * 2;
+
+	return num_dword;
+}
+
+static void build_pt_update_batch_sram(struct xe_migrate *m,
+				       struct xe_bb *bb, u32 pt_offset,
+				       dma_addr_t *sram_addr, u32 size)
+{
+	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
+	u32 ptes;
+	int i = 0;
+
+	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
+	while (ptes) {
+		u32 chunk = min(0x1ffU, ptes);
+
+		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
+		bb->cs[bb->len++] = pt_offset;
+		bb->cs[bb->len++] = 0;
+
+		pt_offset += chunk * 8;
+		ptes -= chunk;
+
+		while (chunk--) {
+			u64 addr = sram_addr[i++] & PAGE_MASK;
+
+			xe_tile_assert(m->tile, addr);
+			addr = m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
+								 addr, pat_index,
+								 0, false, 0);
+			bb->cs[bb->len++] = lower_32_bits(addr);
+			bb->cs[bb->len++] = upper_32_bits(addr);
+		}
+	}
+}
+
+enum xe_migrate_copy_dir {
+	XE_MIGRATE_COPY_TO_VRAM,
+	XE_MIGRATE_COPY_TO_SRAM,
+};
+
+static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
+					 unsigned long npages,
+					 dma_addr_t *sram_addr, u64 vram_addr,
+					 const enum xe_migrate_copy_dir dir)
+{
+	struct xe_gt *gt = m->tile->primary_gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	struct dma_fence *fence = NULL;
+	u32 batch_size = 2;
+	u64 src_L0_ofs, dst_L0_ofs;
+	u64 round_update_size;
+	struct xe_sched_job *job;
+	struct xe_bb *bb;
+	u32 update_idx, pt_slot = 0;
+	int err;
+
+	if (npages * PAGE_SIZE > MAX_PREEMPTDISABLE_TRANSFER)
+		return ERR_PTR(-EINVAL);
+
+	round_update_size = npages * PAGE_SIZE;
+	batch_size += pte_update_cmd_size(round_update_size);
+	batch_size += EMIT_COPY_DW;
+
+	bb = xe_bb_new(gt, batch_size, true);
+	if (IS_ERR(bb)) {
+		err = PTR_ERR(bb);
+		return ERR_PTR(err);
+	}
+
+	build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
+				   sram_addr, round_update_size);
+
+	if (dir == XE_MIGRATE_COPY_TO_VRAM) {
+		src_L0_ofs = xe_migrate_vm_addr(pt_slot, 0);
+		dst_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr, false);
+
+	} else {
+		src_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr, false);
+		dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0);
+	}
+
+	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
+	update_idx = bb->len;
+
+	emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, round_update_size,
+		  XE_PAGE_SIZE);
+
+	job = xe_bb_create_migration_job(m->q, bb,
+					 xe_migrate_batch_base(m, true),
+					 update_idx);
+	if (IS_ERR(job)) {
+		err = PTR_ERR(job);
+		goto err;
+	}
+
+	xe_sched_job_add_migrate_flush(job, 0);
+
+	mutex_lock(&m->job_mutex);
+	xe_sched_job_arm(job);
+	fence = dma_fence_get(&job->drm.s_fence->finished);
+	xe_sched_job_push(job);
+
+	dma_fence_put(m->fence);
+	m->fence = dma_fence_get(fence);
+	mutex_unlock(&m->job_mutex);
+
+	xe_bb_free(bb, fence);
+
+	return fence;
+
+err:
+	xe_bb_free(bb, NULL);
+
+	return ERR_PTR(err);
+}
+
+/**
+ * xe_migrate_to_vram() - Migrate to VRAM
+ * @m: The migration context.
+ * @npages: Number of pages to migrate.
+ * @src_addr: Array of dma addresses (source of migrate)
+ * @dst_addr: Device physical address of VRAM (destination of migrate)
+ *
+ * Copy from an array dma addresses to a VRAM device physical address
+ *
+ * Return: dma fence for migrate to signal completion on succees, ERR_PTR on
+ * failure
+ */
+struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
+				     unsigned long npages,
+				     dma_addr_t *src_addr,
+				     u64 dst_addr)
+{
+	return xe_migrate_vram(m, npages, src_addr, dst_addr,
+			       XE_MIGRATE_COPY_TO_VRAM);
+}
+
+/**
+ * xe_migrate_from_vram() - Migrate from VRAM
+ * @m: The migration context.
+ * @npages: Number of pages to migrate.
+ * @src_addr: Device physical address of VRAM (source of migrate)
+ * @dst_addr: Array of dma addresses (destination of migrate)
+ *
+ * Copy from a VRAM device physical address to an array dma addresses
+ *
+ * Return: dma fence for migrate to signal completion on succees, ERR_PTR on
+ * failure
+ */
+struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
+				       unsigned long npages,
+				       u64 src_addr,
+				       dma_addr_t *dst_addr)
+{
+	return xe_migrate_vram(m, npages, dst_addr, src_addr,
+			       XE_MIGRATE_COPY_TO_SRAM);
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_migrate.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 0109866e398a..6ff9a963425c 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -95,6 +95,16 @@ struct xe_migrate_pt_update {
 
 struct xe_migrate *xe_migrate_init(struct xe_tile *tile);
 
+struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
+				     unsigned long npages,
+				     dma_addr_t *src_addr,
+				     u64 dst_addr);
+
+struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
+				       unsigned long npages,
+				       u64 src_addr,
+				       dma_addr_t *dst_addr);
+
 struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 				  struct xe_bo *src_bo,
 				  struct xe_bo *dst_bo,
-- 
2.34.1

