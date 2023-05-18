Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E9E7082E2
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 15:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3844010E526;
	Thu, 18 May 2023 13:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA0310E526
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 13:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684417011; x=1715953011;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VcIPKvOwvyXRXi6XeV7eR5XmuP+AsgTXVNU27C9ygDI=;
 b=eFiTCpcZNbBHLZirrDWFwEFHfS/jRwzLcs7rvV2xmntOxUHPaUZ4oOcn
 GdU/B7/zpY2TzgqR/i8Xd2pNftYy1fMeoRcvnRgibGoOeAYeqBeOaemfF
 GEBDTvI8tcXvx+9GEsch60OwJRAhN0QNOg7cxKlv1ADcotYyI5vIRWIBS
 uovH5t6J8GIyp4zdCyxZIt6P7Abez3vuUJTSW+SJt3gyWFe6iTWto7RY+
 KaNkwz3R6kll4CbWrfvktInaUF/shE8pZl/Hssyz10+MGzWnfKVw9fApL
 DAWrWDvnVSqDYN3cEe/xxRu0lOzM374cFi4YF3XuuTzYLB/URhMox5Jtn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="354381217"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; d="scan'208";a="354381217"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 06:16:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="846474030"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; d="scan'208";a="846474030"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 06:16:48 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] accel/ivpu: Rename and cleanup MMU600 page tables
Date: Thu, 18 May 2023 15:16:04 +0200
Message-Id: <20230518131605.650622-5-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230518131605.650622-1-stanislaw.gruszka@linux.intel.com>
References: <20230518131605.650622-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Karol Wachowski <karol.wachowski@linux.intel.com>

Simplify and unify naming convention in MMU600 page tables
configuration.

All DMA addresses in page tables directly accessed by VPU are called
with _dma sufix and all CPU pointers to those page tables have _ptr
sufix.

Base pointers used to do a page walk on the CPU have corresponding
names:

 pud_ptrs (pointers used to get access to PUD DMA)
 pmd_ptrs (pointers used to get access to PMD DMA)
 pte_ptrs (pointers used to get access to PTE DMA)

with the following convention:

 u64 *pud_dma_ptr = pud_ptrs[pgd_idx];
 *pud_dma_ptr = pud_dma;

 u64 *pmd_dma_ptr = pmd_ptrs[pgd_idx][pud_idx];
 *pmd_dma_ptr = pmd_dma;

 u64 *pte_dma_ptr = pte_ptrs[pgd_idx][pud_idx][pmd_idx];
 *pte_dma_ptr = pte_dma;

On the way change to coherent dma allocation, _wc is only valid on ARM
and was used by mistake.

Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_mmu_context.c | 181 +++++++++++++-------------
 drivers/accel/ivpu/ivpu_mmu_context.h |   8 +-
 2 files changed, 97 insertions(+), 92 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_mmu_context.c b/drivers/accel/ivpu/ivpu_mmu_context.c
index 79820ed2b8f1..6c7a53651075 100644
--- a/drivers/accel/ivpu/ivpu_mmu_context.c
+++ b/drivers/accel/ivpu/ivpu_mmu_context.c
@@ -39,123 +39,125 @@
 static int ivpu_mmu_pgtable_init(struct ivpu_device *vdev, struct ivpu_mmu_pgtable *pgtable)
 {
 	dma_addr_t pgd_dma;
-	u64 *pgd;
 
-	pgd = dma_alloc_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, &pgd_dma, GFP_KERNEL);
-	if (!pgd)
+	pgtable->pgd_dma_ptr = dma_alloc_coherent(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, &pgd_dma,
+						  GFP_KERNEL);
+	if (!pgtable->pgd_dma_ptr)
 		return -ENOMEM;
 
-	pgtable->pgd = pgd;
 	pgtable->pgd_dma = pgd_dma;
 
 	return 0;
 }
 
-static void ivpu_mmu_pgtable_free(struct ivpu_device *vdev, struct ivpu_mmu_pgtable *pgtable)
+static void ivpu_mmu_pgtable_free(struct ivpu_device *vdev, u64 *cpu_addr, dma_addr_t dma_addr)
+{
+	if (cpu_addr)
+		dma_free_coherent(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, cpu_addr,
+				  dma_addr & ~IVPU_MMU_ENTRY_FLAGS_MASK);
+}
+
+static void ivpu_mmu_pgtables_free(struct ivpu_device *vdev, struct ivpu_mmu_pgtable *pgtable)
 {
 	int pgd_idx, pud_idx, pmd_idx;
+	dma_addr_t pud_dma, pmd_dma, pte_dma;
+	u64 *pud_dma_ptr, *pmd_dma_ptr, *pte_dma_ptr;
 
 	for (pgd_idx = 0; pgd_idx < IVPU_MMU_PGTABLE_ENTRIES; ++pgd_idx) {
-		u64 **pud_entries = pgtable->pgd_cpu_entries[pgd_idx];
-		u64 *pud = pgtable->pgd_entries[pgd_idx];
+		pud_dma_ptr = pgtable->pud_ptrs[pgd_idx];
+		pud_dma = pgtable->pgd_dma_ptr[pgd_idx];
 
-		if (!pud_entries)
+		if (!pud_dma_ptr)
 			continue;
 
 		for (pud_idx = 0; pud_idx < IVPU_MMU_PGTABLE_ENTRIES; ++pud_idx) {
-			u64 **pmd_entries = pgtable->pgd_far_entries[pgd_idx][pud_idx];
-			u64 *pmd = pgtable->pgd_cpu_entries[pgd_idx][pud_idx];
+			pmd_dma_ptr = pgtable->pmd_ptrs[pgd_idx][pud_idx];
+			pmd_dma = pgtable->pud_ptrs[pgd_idx][pud_idx];
 
-			if (!pmd_entries)
+			if (!pmd_dma_ptr)
 				continue;
 
 			for (pmd_idx = 0; pmd_idx < IVPU_MMU_PGTABLE_ENTRIES; ++pmd_idx) {
-				if (pmd_entries[pmd_idx])
-					dma_free_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE,
-						    pmd_entries[pmd_idx],
-						    pmd[pmd_idx] & ~IVPU_MMU_ENTRY_FLAGS_MASK);
+				pte_dma_ptr = pgtable->pte_ptrs[pgd_idx][pud_idx][pmd_idx];
+				pte_dma = pgtable->pmd_ptrs[pgd_idx][pud_idx][pmd_idx];
+
+				ivpu_mmu_pgtable_free(vdev, pte_dma_ptr, pte_dma);
 			}
 
-			kfree(pmd_entries);
-			dma_free_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE,
-				    pud_entries[pud_idx],
-				    pud[pud_idx] & ~IVPU_MMU_ENTRY_FLAGS_MASK);
+			kfree(pgtable->pte_ptrs[pgd_idx][pud_idx]);
+			ivpu_mmu_pgtable_free(vdev, pmd_dma_ptr, pmd_dma);
 		}
 
-		kfree(pud_entries);
-		dma_free_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, pgtable->pgd_entries[pgd_idx],
-			    pgtable->pgd[pgd_idx] & ~IVPU_MMU_ENTRY_FLAGS_MASK);
+		kfree(pgtable->pmd_ptrs[pgd_idx]);
+		kfree(pgtable->pte_ptrs[pgd_idx]);
+		ivpu_mmu_pgtable_free(vdev, pud_dma_ptr, pud_dma);
 	}
 
-	dma_free_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, pgtable->pgd,
-		    pgtable->pgd_dma & ~IVPU_MMU_ENTRY_FLAGS_MASK);
+	ivpu_mmu_pgtable_free(vdev, pgtable->pgd_dma_ptr, pgtable->pgd_dma);
 }
 
 static u64*
 ivpu_mmu_ensure_pud(struct ivpu_device *vdev, struct ivpu_mmu_pgtable *pgtable, int pgd_idx)
 {
-	u64 ***far_pud_entries;
-	u64 **pud_entries;
+	u64 *pud_dma_ptr = pgtable->pud_ptrs[pgd_idx];
 	dma_addr_t pud_dma;
-	u64 *pud;
 
-	if (pgtable->pgd_entries[pgd_idx])
-		return pgtable->pgd_entries[pgd_idx];
+	if (pud_dma_ptr)
+		return pud_dma_ptr;
 
-	pud = dma_alloc_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, &pud_dma, GFP_KERNEL);
-	if (!pud)
+	pud_dma_ptr = dma_alloc_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, &pud_dma, GFP_KERNEL);
+	if (!pud_dma_ptr)
 		return NULL;
 
-	pud_entries = kzalloc(IVPU_MMU_PGTABLE_SIZE, GFP_KERNEL);
-	if (!pud_entries)
-		goto err_free_pud;
+	drm_WARN_ON(&vdev->drm, pgtable->pmd_ptrs[pgd_idx]);
+	pgtable->pmd_ptrs[pgd_idx] = kzalloc(IVPU_MMU_PGTABLE_SIZE, GFP_KERNEL);
+	if (!pgtable->pmd_ptrs[pgd_idx])
+		goto err_free_pud_dma_ptr;
 
-	far_pud_entries = kzalloc(IVPU_MMU_PGTABLE_SIZE, GFP_KERNEL);
-	if (!far_pud_entries)
-		goto err_free_pud_entries;
+	drm_WARN_ON(&vdev->drm, pgtable->pte_ptrs[pgd_idx]);
+	pgtable->pte_ptrs[pgd_idx] = kzalloc(IVPU_MMU_PGTABLE_SIZE, GFP_KERNEL);
+	if (!pgtable->pte_ptrs[pgd_idx])
+		goto err_free_pmd_ptrs;
 
-	pgtable->pgd[pgd_idx] = pud_dma | IVPU_MMU_ENTRY_VALID;
-	pgtable->pgd_entries[pgd_idx] = pud;
-	pgtable->pgd_cpu_entries[pgd_idx] = pud_entries;
-	pgtable->pgd_far_entries[pgd_idx] = far_pud_entries;
+	pgtable->pud_ptrs[pgd_idx] = pud_dma_ptr;
+	pgtable->pgd_dma_ptr[pgd_idx] = pud_dma | IVPU_MMU_ENTRY_VALID;
 
-	return pud;
+	return pud_dma_ptr;
 
-err_free_pud_entries:
-	kfree(pud_entries);
+err_free_pmd_ptrs:
+	kfree(pgtable->pmd_ptrs[pgd_idx]);
 
-err_free_pud:
-	dma_free_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, pud, pud_dma);
+err_free_pud_dma_ptr:
+	ivpu_mmu_pgtable_free(vdev, pud_dma_ptr, pud_dma);
 	return NULL;
 }
 
 static u64*
-ivpu_mmu_ensure_pmd(struct ivpu_device *vdev, struct ivpu_mmu_pgtable *pgtable,
-		    int pgd_idx, int pud_idx)
+ivpu_mmu_ensure_pmd(struct ivpu_device *vdev, struct ivpu_mmu_pgtable *pgtable, int pgd_idx,
+		    int pud_idx)
 {
-	u64 **pmd_entries;
+	u64 *pmd_dma_ptr = pgtable->pmd_ptrs[pgd_idx][pud_idx];
 	dma_addr_t pmd_dma;
-	u64 *pmd;
 
-	if (pgtable->pgd_cpu_entries[pgd_idx][pud_idx])
-		return pgtable->pgd_cpu_entries[pgd_idx][pud_idx];
+	if (pmd_dma_ptr)
+		return pmd_dma_ptr;
 
-	pmd = dma_alloc_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, &pmd_dma, GFP_KERNEL);
-	if (!pmd)
+	pmd_dma_ptr = dma_alloc_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, &pmd_dma, GFP_KERNEL);
+	if (!pmd_dma_ptr)
 		return NULL;
 
-	pmd_entries = kzalloc(IVPU_MMU_PGTABLE_SIZE, GFP_KERNEL);
-	if (!pmd_entries)
-		goto err_free_pmd;
+	drm_WARN_ON(&vdev->drm, pgtable->pte_ptrs[pgd_idx][pud_idx]);
+	pgtable->pte_ptrs[pgd_idx][pud_idx] = kzalloc(IVPU_MMU_PGTABLE_SIZE, GFP_KERNEL);
+	if (!pgtable->pte_ptrs[pgd_idx][pud_idx])
+		goto err_free_pmd_dma_ptr;
 
-	pgtable->pgd_entries[pgd_idx][pud_idx] = pmd_dma | IVPU_MMU_ENTRY_VALID;
-	pgtable->pgd_cpu_entries[pgd_idx][pud_idx] = pmd;
-	pgtable->pgd_far_entries[pgd_idx][pud_idx] = pmd_entries;
+	pgtable->pmd_ptrs[pgd_idx][pud_idx] = pmd_dma_ptr;
+	pgtable->pud_ptrs[pgd_idx][pud_idx] = pmd_dma | IVPU_MMU_ENTRY_VALID;
 
-	return pmd;
+	return pmd_dma_ptr;
 
-err_free_pmd:
-	dma_free_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, pmd, pmd_dma);
+err_free_pmd_dma_ptr:
+	ivpu_mmu_pgtable_free(vdev, pmd_dma_ptr, pmd_dma);
 	return NULL;
 }
 
@@ -163,20 +165,20 @@ static u64*
 ivpu_mmu_ensure_pte(struct ivpu_device *vdev, struct ivpu_mmu_pgtable *pgtable,
 		    int pgd_idx, int pud_idx, int pmd_idx)
 {
+	u64 *pte_dma_ptr = pgtable->pte_ptrs[pgd_idx][pud_idx][pmd_idx];
 	dma_addr_t pte_dma;
-	u64 *pte;
 
-	if (pgtable->pgd_far_entries[pgd_idx][pud_idx][pmd_idx])
-		return pgtable->pgd_far_entries[pgd_idx][pud_idx][pmd_idx];
+	if (pte_dma_ptr)
+		return pte_dma_ptr;
 
-	pte = dma_alloc_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, &pte_dma, GFP_KERNEL);
-	if (!pte)
+	pte_dma_ptr = dma_alloc_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, &pte_dma, GFP_KERNEL);
+	if (!pte_dma_ptr)
 		return NULL;
 
-	pgtable->pgd_cpu_entries[pgd_idx][pud_idx][pmd_idx] = pte_dma | IVPU_MMU_ENTRY_VALID;
-	pgtable->pgd_far_entries[pgd_idx][pud_idx][pmd_idx] = pte;
+	pgtable->pte_ptrs[pgd_idx][pud_idx][pmd_idx] = pte_dma_ptr;
+	pgtable->pmd_ptrs[pgd_idx][pud_idx][pmd_idx] = pte_dma | IVPU_MMU_ENTRY_VALID;
 
-	return pte;
+	return pte_dma_ptr;
 }
 
 static int
@@ -189,20 +191,20 @@ ivpu_mmu_context_map_page(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx
 	int pmd_idx = FIELD_GET(IVPU_MMU_PMD_INDEX_MASK, vpu_addr);
 	int pte_idx = FIELD_GET(IVPU_MMU_PTE_INDEX_MASK, vpu_addr);
 
-	/* Allocate PUD - first level page table if needed */
+	/* Allocate PUD - second level page table if needed */
 	if (!ivpu_mmu_ensure_pud(vdev, &ctx->pgtable, pgd_idx))
 		return -ENOMEM;
 
-	/* Allocate PMD - second level page table if needed */
+	/* Allocate PMD - third level page table if needed */
 	if (!ivpu_mmu_ensure_pmd(vdev, &ctx->pgtable, pgd_idx, pud_idx))
 		return -ENOMEM;
 
-	/* Allocate PTE - third level page table if needed */
+	/* Allocate PTE - fourth level page table if needed */
 	pte = ivpu_mmu_ensure_pte(vdev, &ctx->pgtable, pgd_idx, pud_idx, pmd_idx);
 	if (!pte)
 		return -ENOMEM;
 
-	/* Update PTE - third level page table with DMA address */
+	/* Update PTE */
 	pte[pte_idx] = dma_addr | prot;
 
 	return 0;
@@ -216,40 +218,39 @@ static void ivpu_mmu_context_unmap_page(struct ivpu_mmu_context *ctx, u64 vpu_ad
 	int pte_idx = FIELD_GET(IVPU_MMU_PTE_INDEX_MASK, vpu_addr);
 
 	/* Update PTE with dummy physical address and clear flags */
-	ctx->pgtable.pgd_far_entries[pgd_idx][pud_idx][pmd_idx][pte_idx] = IVPU_MMU_ENTRY_INVALID;
+	ctx->pgtable.pte_ptrs[pgd_idx][pud_idx][pmd_idx][pte_idx] = IVPU_MMU_ENTRY_INVALID;
 }
 
 static void
 ivpu_mmu_context_flush_page_tables(struct ivpu_mmu_context *ctx, u64 vpu_addr, size_t size)
 {
+	struct ivpu_mmu_pgtable *pgtable = &ctx->pgtable;
 	u64 end_addr = vpu_addr + size;
-	u64 *pgd = ctx->pgtable.pgd;
 
 	/* Align to PMD entry (2 MB) */
 	vpu_addr &= ~(IVPU_MMU_PTE_MAP_SIZE - 1);
+
 	while (vpu_addr < end_addr) {
 		int pgd_idx = FIELD_GET(IVPU_MMU_PGD_INDEX_MASK, vpu_addr);
 		u64 pud_end = (pgd_idx + 1) * (u64)IVPU_MMU_PUD_MAP_SIZE;
-		u64 *pud = ctx->pgtable.pgd_entries[pgd_idx];
 
 		while (vpu_addr < end_addr && vpu_addr < pud_end) {
 			int pud_idx = FIELD_GET(IVPU_MMU_PUD_INDEX_MASK, vpu_addr);
 			u64 pmd_end = (pud_idx + 1) * (u64)IVPU_MMU_PMD_MAP_SIZE;
-			u64 *pmd = ctx->pgtable.pgd_cpu_entries[pgd_idx][pud_idx];
 
 			while (vpu_addr < end_addr && vpu_addr < pmd_end) {
 				int pmd_idx = FIELD_GET(IVPU_MMU_PMD_INDEX_MASK, vpu_addr);
-				u64 *pte = ctx->pgtable.pgd_far_entries
-					[pgd_idx][pud_idx][pmd_idx];
 
-				clflush_cache_range(pte, IVPU_MMU_PGTABLE_SIZE);
+				clflush_cache_range(pgtable->pte_ptrs[pgd_idx][pud_idx][pmd_idx],
+						    IVPU_MMU_PGTABLE_SIZE);
 				vpu_addr += IVPU_MMU_PTE_MAP_SIZE;
 			}
-			clflush_cache_range(pmd, IVPU_MMU_PGTABLE_SIZE);
+			clflush_cache_range(pgtable->pmd_ptrs[pgd_idx][pud_idx],
+					    IVPU_MMU_PGTABLE_SIZE);
 		}
-		clflush_cache_range(pud, IVPU_MMU_PGTABLE_SIZE);
+		clflush_cache_range(pgtable->pud_ptrs[pgd_idx], IVPU_MMU_PGTABLE_SIZE);
 	}
-	clflush_cache_range(pgd, IVPU_MMU_PGTABLE_SIZE);
+	clflush_cache_range(pgtable->pgd_dma_ptr, IVPU_MMU_PGTABLE_SIZE);
 }
 
 static int
@@ -305,7 +306,7 @@ ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
 	mutex_lock(&ctx->lock);
 
 	for_each_sgtable_dma_sg(sgt, sg, i) {
-		u64 dma_addr = sg_dma_address(sg) - sg->offset;
+		dma_addr_t dma_addr = sg_dma_address(sg) - sg->offset;
 		size_t size = sg_dma_len(sg) + sg->offset;
 
 		ret = ivpu_mmu_context_map_pages(vdev, ctx, vpu_addr, dma_addr, size, prot);
@@ -402,11 +403,15 @@ ivpu_mmu_context_init(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx, u3
 
 static void ivpu_mmu_context_fini(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx)
 {
-	drm_WARN_ON(&vdev->drm, !ctx->pgtable.pgd);
+	if (drm_WARN_ON(&vdev->drm, !ctx->pgtable.pgd_dma_ptr))
+		return;
 
 	mutex_destroy(&ctx->lock);
-	ivpu_mmu_pgtable_free(vdev, &ctx->pgtable);
+	ivpu_mmu_pgtables_free(vdev, &ctx->pgtable);
 	drm_mm_takedown(&ctx->mm);
+
+	ctx->pgtable.pgd_dma_ptr = NULL;
+	ctx->pgtable.pgd_dma = 0;
 }
 
 int ivpu_mmu_global_context_init(struct ivpu_device *vdev)
diff --git a/drivers/accel/ivpu/ivpu_mmu_context.h b/drivers/accel/ivpu/ivpu_mmu_context.h
index 29acc1151569..961a0d6a6c7f 100644
--- a/drivers/accel/ivpu/ivpu_mmu_context.h
+++ b/drivers/accel/ivpu/ivpu_mmu_context.h
@@ -15,10 +15,10 @@ struct ivpu_addr_range;
 #define IVPU_MMU_PGTABLE_ENTRIES	512ull
 
 struct ivpu_mmu_pgtable {
-	u64		***pgd_far_entries[IVPU_MMU_PGTABLE_ENTRIES];
-	u64		**pgd_cpu_entries[IVPU_MMU_PGTABLE_ENTRIES];
-	u64		*pgd_entries[IVPU_MMU_PGTABLE_ENTRIES];
-	u64		*pgd;
+	u64		***pte_ptrs[IVPU_MMU_PGTABLE_ENTRIES];
+	u64		**pmd_ptrs[IVPU_MMU_PGTABLE_ENTRIES];
+	u64		*pud_ptrs[IVPU_MMU_PGTABLE_ENTRIES];
+	u64		*pgd_dma_ptr;
 	dma_addr_t	pgd_dma;
 };
 
-- 
2.25.1

