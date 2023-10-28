Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC737DA7E9
	for <lists+dri-devel@lfdr.de>; Sat, 28 Oct 2023 18:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C5910E14F;
	Sat, 28 Oct 2023 16:00:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FDB10E0DA
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Oct 2023 16:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698508801; x=1730044801;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QBwuKIqWMcgXU8Iv2ElOHI6ks5tx0MSF2W+nRIXom6s=;
 b=FlslgpO+XmfTljmdxl4y9YLKqHOgOnNcgEhC3sy/ejo08NdFCCYzretu
 iRqoZYTcuKGg84jhwqDk3Y9OmqptGdFdL/reIkvP6dV1O5UQyz2ju2ErW
 XyDSxCFTzAKrbLdFBqP5zLkS9euYGOC/WZUaFdDHRpdlpCoZ/jkrC36D/
 7dWBuYTOKMuGu6KBKJfZu4G+n6LILMOVjT9BMkJJFGD2+GeAKBmXMYLPH
 F98WH3K+rcFna3JRnNygjl45WlvnRZg8g3Wx8dYEi2b22AusBlGhvJlOU
 +T0QHy1ERGBsQAyZvEwUnKKE3WLVjAlYCOZgFH4ft4ByXmML8ON03y9TF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="452152671"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; d="scan'208";a="452152671"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 09:00:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="763516415"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; d="scan'208";a="763516415"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 08:59:59 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/8] accel/ivpu: Make DMA allocations for MMU600 write combined
Date: Sat, 28 Oct 2023 17:59:34 +0200
Message-Id: <20231028155936.1183342-7-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231028155936.1183342-1-stanislaw.gruszka@linux.intel.com>
References: <20231028155936.1183342-1-stanislaw.gruszka@linux.intel.com>
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

Previously using dma_alloc_wc() API we created cache coherent
(mapped as write-back) mappings.

Because we disable MMU600 snooping it was required to do costly
page walk and cache flushes after each page table modification.

With write-combined buffers it's possible to do a single write memory
barrier to flush write-combined buffer to memory which simplifies the
driver and significantly reduce time of map/unmap operations.

Mapping time of 255 MB is reduced from 2.5 ms to 500 us.

Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_mmu_context.c | 115 ++++++++++++++------------
 1 file changed, 63 insertions(+), 52 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_mmu_context.c b/drivers/accel/ivpu/ivpu_mmu_context.c
index 0c8c65351919..7d8005bc78d2 100644
--- a/drivers/accel/ivpu/ivpu_mmu_context.c
+++ b/drivers/accel/ivpu/ivpu_mmu_context.c
@@ -5,6 +5,9 @@
 
 #include <linux/bitfield.h>
 #include <linux/highmem.h>
+#include <linux/set_memory.h>
+
+#include <drm/drm_cache.h>
 
 #include "ivpu_drv.h"
 #include "ivpu_hw.h"
@@ -38,12 +41,57 @@
 #define IVPU_MMU_ENTRY_MAPPED  (IVPU_MMU_ENTRY_FLAG_AF | IVPU_MMU_ENTRY_FLAG_USER | \
 				IVPU_MMU_ENTRY_FLAG_NG | IVPU_MMU_ENTRY_VALID)
 
+static void *ivpu_pgtable_alloc_page(struct ivpu_device *vdev, dma_addr_t *dma)
+{
+	dma_addr_t dma_addr;
+	struct page *page;
+	void *cpu;
+
+	page = alloc_page(GFP_KERNEL | __GFP_HIGHMEM | __GFP_ZERO);
+	if (!page)
+		return NULL;
+
+	set_pages_array_wc(&page, 1);
+
+	dma_addr = dma_map_page(vdev->drm.dev, page, 0, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	if (dma_mapping_error(vdev->drm.dev, dma_addr))
+		goto err_free_page;
+
+	cpu = vmap(&page, 1, VM_MAP, pgprot_writecombine(PAGE_KERNEL));
+	if (!cpu)
+		goto err_dma_unmap_page;
+
+
+	*dma = dma_addr;
+	return cpu;
+
+err_dma_unmap_page:
+	dma_unmap_page(vdev->drm.dev, dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+
+err_free_page:
+	put_page(page);
+	return NULL;
+}
+
+static void ivpu_pgtable_free_page(struct ivpu_device *vdev, u64 *cpu_addr, dma_addr_t dma_addr)
+{
+	struct page *page;
+
+	if (cpu_addr) {
+		page = vmalloc_to_page(cpu_addr);
+		vunmap(cpu_addr);
+		dma_unmap_page(vdev->drm.dev, dma_addr & ~IVPU_MMU_ENTRY_FLAGS_MASK, PAGE_SIZE,
+			       DMA_BIDIRECTIONAL);
+		set_pages_array_wb(&page, 1);
+		put_page(page);
+	}
+}
+
 static int ivpu_mmu_pgtable_init(struct ivpu_device *vdev, struct ivpu_mmu_pgtable *pgtable)
 {
 	dma_addr_t pgd_dma;
 
-	pgtable->pgd_dma_ptr = dma_alloc_coherent(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, &pgd_dma,
-						  GFP_KERNEL);
+	pgtable->pgd_dma_ptr = ivpu_pgtable_alloc_page(vdev, &pgd_dma);
 	if (!pgtable->pgd_dma_ptr)
 		return -ENOMEM;
 
@@ -52,13 +100,6 @@ static int ivpu_mmu_pgtable_init(struct ivpu_device *vdev, struct ivpu_mmu_pgtab
 	return 0;
 }
 
-static void ivpu_mmu_pgtable_free(struct ivpu_device *vdev, u64 *cpu_addr, dma_addr_t dma_addr)
-{
-	if (cpu_addr)
-		dma_free_coherent(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, cpu_addr,
-				  dma_addr & ~IVPU_MMU_ENTRY_FLAGS_MASK);
-}
-
 static void ivpu_mmu_pgtables_free(struct ivpu_device *vdev, struct ivpu_mmu_pgtable *pgtable)
 {
 	int pgd_idx, pud_idx, pmd_idx;
@@ -83,19 +124,19 @@ static void ivpu_mmu_pgtables_free(struct ivpu_device *vdev, struct ivpu_mmu_pgt
 				pte_dma_ptr = pgtable->pte_ptrs[pgd_idx][pud_idx][pmd_idx];
 				pte_dma = pgtable->pmd_ptrs[pgd_idx][pud_idx][pmd_idx];
 
-				ivpu_mmu_pgtable_free(vdev, pte_dma_ptr, pte_dma);
+				ivpu_pgtable_free_page(vdev, pte_dma_ptr, pte_dma);
 			}
 
 			kfree(pgtable->pte_ptrs[pgd_idx][pud_idx]);
-			ivpu_mmu_pgtable_free(vdev, pmd_dma_ptr, pmd_dma);
+			ivpu_pgtable_free_page(vdev, pmd_dma_ptr, pmd_dma);
 		}
 
 		kfree(pgtable->pmd_ptrs[pgd_idx]);
 		kfree(pgtable->pte_ptrs[pgd_idx]);
-		ivpu_mmu_pgtable_free(vdev, pud_dma_ptr, pud_dma);
+		ivpu_pgtable_free_page(vdev, pud_dma_ptr, pud_dma);
 	}
 
-	ivpu_mmu_pgtable_free(vdev, pgtable->pgd_dma_ptr, pgtable->pgd_dma);
+	ivpu_pgtable_free_page(vdev, pgtable->pgd_dma_ptr, pgtable->pgd_dma);
 }
 
 static u64*
@@ -107,7 +148,7 @@ ivpu_mmu_ensure_pud(struct ivpu_device *vdev, struct ivpu_mmu_pgtable *pgtable,
 	if (pud_dma_ptr)
 		return pud_dma_ptr;
 
-	pud_dma_ptr = dma_alloc_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, &pud_dma, GFP_KERNEL);
+	pud_dma_ptr = ivpu_pgtable_alloc_page(vdev, &pud_dma);
 	if (!pud_dma_ptr)
 		return NULL;
 
@@ -130,7 +171,7 @@ ivpu_mmu_ensure_pud(struct ivpu_device *vdev, struct ivpu_mmu_pgtable *pgtable,
 	kfree(pgtable->pmd_ptrs[pgd_idx]);
 
 err_free_pud_dma_ptr:
-	ivpu_mmu_pgtable_free(vdev, pud_dma_ptr, pud_dma);
+	ivpu_pgtable_free_page(vdev, pud_dma_ptr, pud_dma);
 	return NULL;
 }
 
@@ -144,7 +185,7 @@ ivpu_mmu_ensure_pmd(struct ivpu_device *vdev, struct ivpu_mmu_pgtable *pgtable,
 	if (pmd_dma_ptr)
 		return pmd_dma_ptr;
 
-	pmd_dma_ptr = dma_alloc_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, &pmd_dma, GFP_KERNEL);
+	pmd_dma_ptr = ivpu_pgtable_alloc_page(vdev, &pmd_dma);
 	if (!pmd_dma_ptr)
 		return NULL;
 
@@ -159,7 +200,7 @@ ivpu_mmu_ensure_pmd(struct ivpu_device *vdev, struct ivpu_mmu_pgtable *pgtable,
 	return pmd_dma_ptr;
 
 err_free_pmd_dma_ptr:
-	ivpu_mmu_pgtable_free(vdev, pmd_dma_ptr, pmd_dma);
+	ivpu_pgtable_free_page(vdev, pmd_dma_ptr, pmd_dma);
 	return NULL;
 }
 
@@ -173,7 +214,7 @@ ivpu_mmu_ensure_pte(struct ivpu_device *vdev, struct ivpu_mmu_pgtable *pgtable,
 	if (pte_dma_ptr)
 		return pte_dma_ptr;
 
-	pte_dma_ptr = dma_alloc_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, &pte_dma, GFP_KERNEL);
+	pte_dma_ptr = ivpu_pgtable_alloc_page(vdev, &pte_dma);
 	if (!pte_dma_ptr)
 		return NULL;
 
@@ -248,38 +289,6 @@ static void ivpu_mmu_context_unmap_page(struct ivpu_mmu_context *ctx, u64 vpu_ad
 	ctx->pgtable.pte_ptrs[pgd_idx][pud_idx][pmd_idx][pte_idx] = IVPU_MMU_ENTRY_INVALID;
 }
 
-static void
-ivpu_mmu_context_flush_page_tables(struct ivpu_mmu_context *ctx, u64 vpu_addr, size_t size)
-{
-	struct ivpu_mmu_pgtable *pgtable = &ctx->pgtable;
-	u64 end_addr = vpu_addr + size;
-
-	/* Align to PMD entry (2 MB) */
-	vpu_addr &= ~(IVPU_MMU_PTE_MAP_SIZE - 1);
-
-	while (vpu_addr < end_addr) {
-		int pgd_idx = FIELD_GET(IVPU_MMU_PGD_INDEX_MASK, vpu_addr);
-		u64 pud_end = (pgd_idx + 1) * (u64)IVPU_MMU_PUD_MAP_SIZE;
-
-		while (vpu_addr < end_addr && vpu_addr < pud_end) {
-			int pud_idx = FIELD_GET(IVPU_MMU_PUD_INDEX_MASK, vpu_addr);
-			u64 pmd_end = (pud_idx + 1) * (u64)IVPU_MMU_PMD_MAP_SIZE;
-
-			while (vpu_addr < end_addr && vpu_addr < pmd_end) {
-				int pmd_idx = FIELD_GET(IVPU_MMU_PMD_INDEX_MASK, vpu_addr);
-
-				clflush_cache_range(pgtable->pte_ptrs[pgd_idx][pud_idx][pmd_idx],
-						    IVPU_MMU_PGTABLE_SIZE);
-				vpu_addr += IVPU_MMU_PTE_MAP_SIZE;
-			}
-			clflush_cache_range(pgtable->pmd_ptrs[pgd_idx][pud_idx],
-					    IVPU_MMU_PGTABLE_SIZE);
-		}
-		clflush_cache_range(pgtable->pud_ptrs[pgd_idx], IVPU_MMU_PGTABLE_SIZE);
-	}
-	clflush_cache_range(pgtable->pgd_dma_ptr, IVPU_MMU_PGTABLE_SIZE);
-}
-
 static int
 ivpu_mmu_context_map_pages(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
 			   u64 vpu_addr, dma_addr_t dma_addr, size_t size, u64 prot)
@@ -352,10 +361,11 @@ ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
 			mutex_unlock(&ctx->lock);
 			return ret;
 		}
-		ivpu_mmu_context_flush_page_tables(ctx, vpu_addr, size);
 		vpu_addr += size;
 	}
 
+	/* Ensure page table modifications are flushed from wc buffers to memory */
+	wmb();
 	mutex_unlock(&ctx->lock);
 
 	ret = ivpu_mmu_invalidate_tlb(vdev, ctx->id);
@@ -381,10 +391,11 @@ ivpu_mmu_context_unmap_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ct
 		size_t size = sg_dma_len(sg) + sg->offset;
 
 		ivpu_mmu_context_unmap_pages(ctx, vpu_addr, size);
-		ivpu_mmu_context_flush_page_tables(ctx, vpu_addr, size);
 		vpu_addr += size;
 	}
 
+	/* Ensure page table modifications are flushed from wc buffers to memory */
+	wmb();
 	mutex_unlock(&ctx->lock);
 
 	ret = ivpu_mmu_invalidate_tlb(vdev, ctx->id);
-- 
2.25.1

