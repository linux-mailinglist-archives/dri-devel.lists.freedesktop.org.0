Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2B17082DC
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 15:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE4310E0BA;
	Thu, 18 May 2023 13:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435B810E0BA
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 13:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684416967; x=1715952967;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yvf+vlWVhx5tUAMjK//5TvKMoIUHJs2EuFhdoB553JE=;
 b=VkUcxsOV6k6IchD2eM05b06biGZRfixuhCRD5+WAkK256XNb5BQuEcoe
 ztx1ZB9TPYg8knjYF73m0ZtPk0TxYuEdOomqfrt4EyiW/S/DzifODU6S4
 GME7tgxIbJvZVz/vTkZOQ47gHzYxgMJcTI6dvdejZq6Phy/8TdWTnwxNy
 5cv/4LRXI76The6nnGsTJDll2n5hWLNZKJcJqVh7/GFV1rlVlNNm4ESH1
 2AEn/s8FlTMYr8rVmTCUUDtvneoWL/fkhytI8UNHBB9JFBkypcv6re+/Z
 x3HAlt3HpEn18yQOe8Ghi4vq3ihM7fiijZZaN1dOY2S5L+c1n/s664Blz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="355264404"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; d="scan'208";a="355264404"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 06:16:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="767204069"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; d="scan'208";a="767204069"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 06:16:41 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] accel/ivpu: Add MMU support for 4 level page mappings
Date: Thu, 18 May 2023 15:16:02 +0200
Message-Id: <20230518131605.650622-3-stanislaw.gruszka@linux.intel.com>
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
Cc: Raymond Tan <raymond.tan@intel.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Karol Wachowski <karol.wachowski@linux.intel.com>

Program additional fourth level required for mappings with VA above 38bits.

Co-developed-by: Raymond Tan <raymond.tan@intel.com>
Signed-off-by: Raymond Tan <raymond.tan@intel.com>
Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_mmu.c         |  14 ++-
 drivers/accel/ivpu/ivpu_mmu_context.c | 166 ++++++++++++++++++--------
 drivers/accel/ivpu/ivpu_mmu_context.h |   5 +-
 3 files changed, 132 insertions(+), 53 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
index 694e978aba66..fa9a9ad59643 100644
--- a/drivers/accel/ivpu/ivpu_mmu.c
+++ b/drivers/accel/ivpu/ivpu_mmu.c
@@ -143,6 +143,16 @@
 #define IVPU_MMU_CD_0_ASET		BIT(47)
 #define IVPU_MMU_CD_0_ASID		GENMASK_ULL(63, 48)
 
+#define IVPU_MMU_T0SZ_48BIT             16
+#define IVPU_MMU_T0SZ_38BIT             26
+
+#define IVPU_MMU_IPS_48BIT		5
+#define IVPU_MMU_IPS_44BIT		4
+#define IVPU_MMU_IPS_42BIT		3
+#define IVPU_MMU_IPS_40BIT		2
+#define IVPU_MMU_IPS_36BIT		1
+#define IVPU_MMU_IPS_32BIT		0
+
 #define IVPU_MMU_CD_1_TTB0_MASK		GENMASK_ULL(51, 4)
 
 #define IVPU_MMU_STE_0_S1CDMAX		GENMASK_ULL(63, 59)
@@ -622,12 +632,12 @@ static int ivpu_mmu_cd_add(struct ivpu_device *vdev, u32 ssid, u64 cd_dma)
 	entry = cdtab->base + (ssid * IVPU_MMU_CDTAB_ENT_SIZE);
 
 	if (cd_dma != 0) {
-		cd[0] = FIELD_PREP(IVPU_MMU_CD_0_TCR_T0SZ, 26) |
+		cd[0] = FIELD_PREP(IVPU_MMU_CD_0_TCR_T0SZ, IVPU_MMU_T0SZ_48BIT) |
 			FIELD_PREP(IVPU_MMU_CD_0_TCR_TG0, 0) |
 			FIELD_PREP(IVPU_MMU_CD_0_TCR_IRGN0, 0) |
 			FIELD_PREP(IVPU_MMU_CD_0_TCR_ORGN0, 0) |
 			FIELD_PREP(IVPU_MMU_CD_0_TCR_SH0, 0) |
-			FIELD_PREP(IVPU_MMU_CD_0_TCR_IPS, 3) |
+			FIELD_PREP(IVPU_MMU_CD_0_TCR_IPS, IVPU_MMU_IPS_48BIT) |
 			FIELD_PREP(IVPU_MMU_CD_0_ASID, ssid) |
 			IVPU_MMU_CD_0_TCR_EPD1 |
 			IVPU_MMU_CD_0_AA64 |
diff --git a/drivers/accel/ivpu/ivpu_mmu_context.c b/drivers/accel/ivpu/ivpu_mmu_context.c
index 8ce9b12ac356..79820ed2b8f1 100644
--- a/drivers/accel/ivpu/ivpu_mmu_context.c
+++ b/drivers/accel/ivpu/ivpu_mmu_context.c
@@ -11,7 +11,8 @@
 #include "ivpu_mmu.h"
 #include "ivpu_mmu_context.h"
 
-#define IVPU_MMU_PGD_INDEX_MASK          GENMASK(38, 30)
+#define IVPU_MMU_PGD_INDEX_MASK          GENMASK(47, 39)
+#define IVPU_MMU_PUD_INDEX_MASK          GENMASK(38, 30)
 #define IVPU_MMU_PMD_INDEX_MASK          GENMASK(29, 21)
 #define IVPU_MMU_PTE_INDEX_MASK          GENMASK(20, 12)
 #define IVPU_MMU_ENTRY_FLAGS_MASK        GENMASK(11, 0)
@@ -25,6 +26,8 @@
 #define IVPU_MMU_PAGE_SIZE    SZ_4K
 #define IVPU_MMU_PTE_MAP_SIZE (IVPU_MMU_PGTABLE_ENTRIES * IVPU_MMU_PAGE_SIZE)
 #define IVPU_MMU_PMD_MAP_SIZE (IVPU_MMU_PGTABLE_ENTRIES * IVPU_MMU_PTE_MAP_SIZE)
+#define IVPU_MMU_PUD_MAP_SIZE (IVPU_MMU_PGTABLE_ENTRIES * IVPU_MMU_PMD_MAP_SIZE)
+#define IVPU_MMU_PGD_MAP_SIZE (IVPU_MMU_PGTABLE_ENTRIES * IVPU_MMU_PUD_MAP_SIZE)
 #define IVPU_MMU_PGTABLE_SIZE (IVPU_MMU_PGTABLE_ENTRIES * sizeof(u64))
 
 #define IVPU_MMU_DUMMY_ADDRESS 0xdeadb000
@@ -50,25 +53,38 @@ static int ivpu_mmu_pgtable_init(struct ivpu_device *vdev, struct ivpu_mmu_pgtab
 
 static void ivpu_mmu_pgtable_free(struct ivpu_device *vdev, struct ivpu_mmu_pgtable *pgtable)
 {
-	int pgd_index, pmd_index;
+	int pgd_idx, pud_idx, pmd_idx;
 
-	for (pgd_index = 0; pgd_index < IVPU_MMU_PGTABLE_ENTRIES; ++pgd_index) {
-		u64 **pmd_entries = pgtable->pgd_cpu_entries[pgd_index];
-		u64 *pmd = pgtable->pgd_entries[pgd_index];
+	for (pgd_idx = 0; pgd_idx < IVPU_MMU_PGTABLE_ENTRIES; ++pgd_idx) {
+		u64 **pud_entries = pgtable->pgd_cpu_entries[pgd_idx];
+		u64 *pud = pgtable->pgd_entries[pgd_idx];
 
-		if (!pmd_entries)
+		if (!pud_entries)
 			continue;
 
-		for (pmd_index = 0; pmd_index < IVPU_MMU_PGTABLE_ENTRIES; ++pmd_index) {
-			if (pmd_entries[pmd_index])
-				dma_free_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE,
-					    pmd_entries[pmd_index],
-					    pmd[pmd_index] & ~IVPU_MMU_ENTRY_FLAGS_MASK);
+		for (pud_idx = 0; pud_idx < IVPU_MMU_PGTABLE_ENTRIES; ++pud_idx) {
+			u64 **pmd_entries = pgtable->pgd_far_entries[pgd_idx][pud_idx];
+			u64 *pmd = pgtable->pgd_cpu_entries[pgd_idx][pud_idx];
+
+			if (!pmd_entries)
+				continue;
+
+			for (pmd_idx = 0; pmd_idx < IVPU_MMU_PGTABLE_ENTRIES; ++pmd_idx) {
+				if (pmd_entries[pmd_idx])
+					dma_free_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE,
+						    pmd_entries[pmd_idx],
+						    pmd[pmd_idx] & ~IVPU_MMU_ENTRY_FLAGS_MASK);
+			}
+
+			kfree(pmd_entries);
+			dma_free_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE,
+				    pud_entries[pud_idx],
+				    pud[pud_idx] & ~IVPU_MMU_ENTRY_FLAGS_MASK);
 		}
 
-		kfree(pmd_entries);
-		dma_free_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, pgtable->pgd_entries[pgd_index],
-			    pgtable->pgd[pgd_index] & ~IVPU_MMU_ENTRY_FLAGS_MASK);
+		kfree(pud_entries);
+		dma_free_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, pgtable->pgd_entries[pgd_idx],
+			    pgtable->pgd[pgd_idx] & ~IVPU_MMU_ENTRY_FLAGS_MASK);
 	}
 
 	dma_free_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, pgtable->pgd,
@@ -76,14 +92,53 @@ static void ivpu_mmu_pgtable_free(struct ivpu_device *vdev, struct ivpu_mmu_pgta
 }
 
 static u64*
-ivpu_mmu_ensure_pmd(struct ivpu_device *vdev, struct ivpu_mmu_pgtable *pgtable, u64 pgd_index)
+ivpu_mmu_ensure_pud(struct ivpu_device *vdev, struct ivpu_mmu_pgtable *pgtable, int pgd_idx)
+{
+	u64 ***far_pud_entries;
+	u64 **pud_entries;
+	dma_addr_t pud_dma;
+	u64 *pud;
+
+	if (pgtable->pgd_entries[pgd_idx])
+		return pgtable->pgd_entries[pgd_idx];
+
+	pud = dma_alloc_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, &pud_dma, GFP_KERNEL);
+	if (!pud)
+		return NULL;
+
+	pud_entries = kzalloc(IVPU_MMU_PGTABLE_SIZE, GFP_KERNEL);
+	if (!pud_entries)
+		goto err_free_pud;
+
+	far_pud_entries = kzalloc(IVPU_MMU_PGTABLE_SIZE, GFP_KERNEL);
+	if (!far_pud_entries)
+		goto err_free_pud_entries;
+
+	pgtable->pgd[pgd_idx] = pud_dma | IVPU_MMU_ENTRY_VALID;
+	pgtable->pgd_entries[pgd_idx] = pud;
+	pgtable->pgd_cpu_entries[pgd_idx] = pud_entries;
+	pgtable->pgd_far_entries[pgd_idx] = far_pud_entries;
+
+	return pud;
+
+err_free_pud_entries:
+	kfree(pud_entries);
+
+err_free_pud:
+	dma_free_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, pud, pud_dma);
+	return NULL;
+}
+
+static u64*
+ivpu_mmu_ensure_pmd(struct ivpu_device *vdev, struct ivpu_mmu_pgtable *pgtable,
+		    int pgd_idx, int pud_idx)
 {
 	u64 **pmd_entries;
 	dma_addr_t pmd_dma;
 	u64 *pmd;
 
-	if (pgtable->pgd_entries[pgd_index])
-		return pgtable->pgd_entries[pgd_index];
+	if (pgtable->pgd_cpu_entries[pgd_idx][pud_idx])
+		return pgtable->pgd_cpu_entries[pgd_idx][pud_idx];
 
 	pmd = dma_alloc_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, &pmd_dma, GFP_KERNEL);
 	if (!pmd)
@@ -91,35 +146,35 @@ ivpu_mmu_ensure_pmd(struct ivpu_device *vdev, struct ivpu_mmu_pgtable *pgtable,
 
 	pmd_entries = kzalloc(IVPU_MMU_PGTABLE_SIZE, GFP_KERNEL);
 	if (!pmd_entries)
-		goto err_free_pgd;
+		goto err_free_pmd;
 
-	pgtable->pgd_entries[pgd_index] = pmd;
-	pgtable->pgd_cpu_entries[pgd_index] = pmd_entries;
-	pgtable->pgd[pgd_index] = pmd_dma | IVPU_MMU_ENTRY_VALID;
+	pgtable->pgd_entries[pgd_idx][pud_idx] = pmd_dma | IVPU_MMU_ENTRY_VALID;
+	pgtable->pgd_cpu_entries[pgd_idx][pud_idx] = pmd;
+	pgtable->pgd_far_entries[pgd_idx][pud_idx] = pmd_entries;
 
 	return pmd;
 
-err_free_pgd:
+err_free_pmd:
 	dma_free_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, pmd, pmd_dma);
 	return NULL;
 }
 
 static u64*
 ivpu_mmu_ensure_pte(struct ivpu_device *vdev, struct ivpu_mmu_pgtable *pgtable,
-		    int pgd_index, int pmd_index)
+		    int pgd_idx, int pud_idx, int pmd_idx)
 {
 	dma_addr_t pte_dma;
 	u64 *pte;
 
-	if (pgtable->pgd_cpu_entries[pgd_index][pmd_index])
-		return pgtable->pgd_cpu_entries[pgd_index][pmd_index];
+	if (pgtable->pgd_far_entries[pgd_idx][pud_idx][pmd_idx])
+		return pgtable->pgd_far_entries[pgd_idx][pud_idx][pmd_idx];
 
 	pte = dma_alloc_wc(vdev->drm.dev, IVPU_MMU_PGTABLE_SIZE, &pte_dma, GFP_KERNEL);
 	if (!pte)
 		return NULL;
 
-	pgtable->pgd_cpu_entries[pgd_index][pmd_index] = pte;
-	pgtable->pgd_entries[pgd_index][pmd_index] = pte_dma | IVPU_MMU_ENTRY_VALID;
+	pgtable->pgd_cpu_entries[pgd_idx][pud_idx][pmd_idx] = pte_dma | IVPU_MMU_ENTRY_VALID;
+	pgtable->pgd_far_entries[pgd_idx][pud_idx][pmd_idx] = pte;
 
 	return pte;
 }
@@ -129,33 +184,39 @@ ivpu_mmu_context_map_page(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx
 			  u64 vpu_addr, dma_addr_t dma_addr, int prot)
 {
 	u64 *pte;
-	int pgd_index = FIELD_GET(IVPU_MMU_PGD_INDEX_MASK, vpu_addr);
-	int pmd_index = FIELD_GET(IVPU_MMU_PMD_INDEX_MASK, vpu_addr);
-	int pte_index = FIELD_GET(IVPU_MMU_PTE_INDEX_MASK, vpu_addr);
+	int pgd_idx = FIELD_GET(IVPU_MMU_PGD_INDEX_MASK, vpu_addr);
+	int pud_idx = FIELD_GET(IVPU_MMU_PUD_INDEX_MASK, vpu_addr);
+	int pmd_idx = FIELD_GET(IVPU_MMU_PMD_INDEX_MASK, vpu_addr);
+	int pte_idx = FIELD_GET(IVPU_MMU_PTE_INDEX_MASK, vpu_addr);
+
+	/* Allocate PUD - first level page table if needed */
+	if (!ivpu_mmu_ensure_pud(vdev, &ctx->pgtable, pgd_idx))
+		return -ENOMEM;
 
 	/* Allocate PMD - second level page table if needed */
-	if (!ivpu_mmu_ensure_pmd(vdev, &ctx->pgtable, pgd_index))
+	if (!ivpu_mmu_ensure_pmd(vdev, &ctx->pgtable, pgd_idx, pud_idx))
 		return -ENOMEM;
 
 	/* Allocate PTE - third level page table if needed */
-	pte = ivpu_mmu_ensure_pte(vdev, &ctx->pgtable, pgd_index, pmd_index);
+	pte = ivpu_mmu_ensure_pte(vdev, &ctx->pgtable, pgd_idx, pud_idx, pmd_idx);
 	if (!pte)
 		return -ENOMEM;
 
 	/* Update PTE - third level page table with DMA address */
-	pte[pte_index] = dma_addr | prot;
+	pte[pte_idx] = dma_addr | prot;
 
 	return 0;
 }
 
 static void ivpu_mmu_context_unmap_page(struct ivpu_mmu_context *ctx, u64 vpu_addr)
 {
-	int pgd_index = FIELD_GET(IVPU_MMU_PGD_INDEX_MASK, vpu_addr);
-	int pmd_index = FIELD_GET(IVPU_MMU_PMD_INDEX_MASK, vpu_addr);
-	int pte_index = FIELD_GET(IVPU_MMU_PTE_INDEX_MASK, vpu_addr);
+	int pgd_idx = FIELD_GET(IVPU_MMU_PGD_INDEX_MASK, vpu_addr);
+	int pud_idx = FIELD_GET(IVPU_MMU_PUD_INDEX_MASK, vpu_addr);
+	int pmd_idx = FIELD_GET(IVPU_MMU_PMD_INDEX_MASK, vpu_addr);
+	int pte_idx = FIELD_GET(IVPU_MMU_PTE_INDEX_MASK, vpu_addr);
 
 	/* Update PTE with dummy physical address and clear flags */
-	ctx->pgtable.pgd_cpu_entries[pgd_index][pmd_index][pte_index] = IVPU_MMU_ENTRY_INVALID;
+	ctx->pgtable.pgd_far_entries[pgd_idx][pud_idx][pmd_idx][pte_idx] = IVPU_MMU_ENTRY_INVALID;
 }
 
 static void
@@ -166,20 +227,27 @@ ivpu_mmu_context_flush_page_tables(struct ivpu_mmu_context *ctx, u64 vpu_addr, s
 
 	/* Align to PMD entry (2 MB) */
 	vpu_addr &= ~(IVPU_MMU_PTE_MAP_SIZE - 1);
-
 	while (vpu_addr < end_addr) {
-		int pgd_index = FIELD_GET(IVPU_MMU_PGD_INDEX_MASK, vpu_addr);
-		u64 pmd_end = (pgd_index + 1) * (u64)IVPU_MMU_PMD_MAP_SIZE;
-		u64 *pmd = ctx->pgtable.pgd_entries[pgd_index];
-
-		while (vpu_addr < end_addr && vpu_addr < pmd_end) {
-			int pmd_index = FIELD_GET(IVPU_MMU_PMD_INDEX_MASK, vpu_addr);
-			u64 *pte = ctx->pgtable.pgd_cpu_entries[pgd_index][pmd_index];
-
-			clflush_cache_range(pte, IVPU_MMU_PGTABLE_SIZE);
-			vpu_addr += IVPU_MMU_PTE_MAP_SIZE;
+		int pgd_idx = FIELD_GET(IVPU_MMU_PGD_INDEX_MASK, vpu_addr);
+		u64 pud_end = (pgd_idx + 1) * (u64)IVPU_MMU_PUD_MAP_SIZE;
+		u64 *pud = ctx->pgtable.pgd_entries[pgd_idx];
+
+		while (vpu_addr < end_addr && vpu_addr < pud_end) {
+			int pud_idx = FIELD_GET(IVPU_MMU_PUD_INDEX_MASK, vpu_addr);
+			u64 pmd_end = (pud_idx + 1) * (u64)IVPU_MMU_PMD_MAP_SIZE;
+			u64 *pmd = ctx->pgtable.pgd_cpu_entries[pgd_idx][pud_idx];
+
+			while (vpu_addr < end_addr && vpu_addr < pmd_end) {
+				int pmd_idx = FIELD_GET(IVPU_MMU_PMD_INDEX_MASK, vpu_addr);
+				u64 *pte = ctx->pgtable.pgd_far_entries
+					[pgd_idx][pud_idx][pmd_idx];
+
+				clflush_cache_range(pte, IVPU_MMU_PGTABLE_SIZE);
+				vpu_addr += IVPU_MMU_PTE_MAP_SIZE;
+			}
+			clflush_cache_range(pmd, IVPU_MMU_PGTABLE_SIZE);
 		}
-		clflush_cache_range(pmd, IVPU_MMU_PGTABLE_SIZE);
+		clflush_cache_range(pud, IVPU_MMU_PGTABLE_SIZE);
 	}
 	clflush_cache_range(pgd, IVPU_MMU_PGTABLE_SIZE);
 }
diff --git a/drivers/accel/ivpu/ivpu_mmu_context.h b/drivers/accel/ivpu/ivpu_mmu_context.h
index ddf11b95023a..29acc1151569 100644
--- a/drivers/accel/ivpu/ivpu_mmu_context.h
+++ b/drivers/accel/ivpu/ivpu_mmu_context.h
@@ -12,10 +12,11 @@ struct ivpu_device;
 struct ivpu_file_priv;
 struct ivpu_addr_range;
 
-#define IVPU_MMU_PGTABLE_ENTRIES	512
+#define IVPU_MMU_PGTABLE_ENTRIES	512ull
 
 struct ivpu_mmu_pgtable {
-	u64             **pgd_cpu_entries[IVPU_MMU_PGTABLE_ENTRIES];
+	u64		***pgd_far_entries[IVPU_MMU_PGTABLE_ENTRIES];
+	u64		**pgd_cpu_entries[IVPU_MMU_PGTABLE_ENTRIES];
 	u64		*pgd_entries[IVPU_MMU_PGTABLE_ENTRIES];
 	u64		*pgd;
 	dma_addr_t	pgd_dma;
-- 
2.25.1

