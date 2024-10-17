Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F3F9A25BE
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 16:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116AF10E852;
	Thu, 17 Oct 2024 14:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d6XLbaPz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD7F10E348
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 14:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729177105; x=1760713105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aTH8l0K+0PqdN5/ytscRQtm1bo0iS8qsiANn+09ZHpQ=;
 b=d6XLbaPztBOyXBwYMZbnDjajXNIbjbTVNazZSfra7PJJuZXVaSJ9GK2R
 32/jFFv5RhFR3kcrP+DaDy0beX1xwKjmMuvLdSSzyrPHSvBe2qhu/aFY2
 Ac5hClBNWbWKSYTf99IA2zji4IN+eWQvpkwTUGxJZMR7CMvy7cXd9qD5W
 cCPR0h7z+h0geh78l7rs0v/PSq/6vu5wLf8pz7pv7/Z4hJDLFfTvF1vjb
 kGJuc73MeTac1nLkpFMrsRoQBJVz0zQP29X2Bl3XhGXQE9RcBP1rdst9E
 zwXtMukw+/jCIvHPNlksjJo3HFP1L6+5gGcknrXhVl4IWQdhw4SUrNsYm g==;
X-CSE-ConnectionGUID: ShwpPHJLTgW+QEpWu7Fopg==
X-CSE-MsgGUID: qXAw3zHQR0mLz2BMhLBlEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39790319"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39790319"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:58:25 -0700
X-CSE-ConnectionGUID: BmAN+VthRxuDsBNNWqP7yg==
X-CSE-MsgGUID: epUS1hpDTNihTvEnpu35Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="109374494"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:58:23 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 02/11] accel/ivpu: Defer MMU root page table allocation
Date: Thu, 17 Oct 2024 16:58:08 +0200
Message-ID: <20241017145817.121590-3-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241017145817.121590-1-jacek.lawrynowicz@linux.intel.com>
References: <20241017145817.121590-1-jacek.lawrynowicz@linux.intel.com>
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

From: Karol Wachowski <karol.wachowski@intel.com>

Defer root page table allocation and unify context init/fini functions.
Move allocation of the root page table from the file_priv_open function to
perform a lazy allocation approach during ivpu_bo_pin().

By doing so, we avoid the overhead of allocating page tables for simple
operations like GET_PARAM that do not require them.
Additionally, the MMU context descriptor table initialization has been
moved to the ivpu_mmu_context_map_page function.

This change streamlines the process and ensures that the descriptor table
is only initialized when it is actually needed.
Refactor init/fini functions to remove redundant code and make the context
management more straightforward.

Overall, these changes lead to a reduction in the time taken by the file
descriptor open operation, as the costly root page table allocation is now
avoided for operations that do not require it.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c         |  12 +--
 drivers/accel/ivpu/ivpu_mmu.c         |  94 ++++++-----------
 drivers/accel/ivpu/ivpu_mmu.h         |   4 +-
 drivers/accel/ivpu/ivpu_mmu_context.c | 145 +++++++++++++-------------
 drivers/accel/ivpu/ivpu_mmu_context.h |   9 +-
 5 files changed, 115 insertions(+), 149 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index e7d8967c02f29..34e3e9b1c3f23 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -86,7 +86,7 @@ static void file_priv_unbind(struct ivpu_device *vdev, struct ivpu_file_priv *fi
 
 		ivpu_cmdq_release_all_locked(file_priv);
 		ivpu_bo_unbind_all_bos_from_context(vdev, &file_priv->ctx);
-		ivpu_mmu_user_context_fini(vdev, &file_priv->ctx);
+		ivpu_mmu_context_fini(vdev, &file_priv->ctx);
 		file_priv->bound = false;
 		drm_WARN_ON(&vdev->drm, !xa_erase_irq(&vdev->context_xa, file_priv->ctx.id));
 	}
@@ -254,9 +254,7 @@ static int ivpu_open(struct drm_device *dev, struct drm_file *file)
 		goto err_unlock;
 	}
 
-	ret = ivpu_mmu_user_context_init(vdev, &file_priv->ctx, ctx_id);
-	if (ret)
-		goto err_xa_erase;
+	ivpu_mmu_context_init(vdev, &file_priv->ctx, ctx_id);
 
 	file_priv->default_job_limit.min = FIELD_PREP(IVPU_JOB_ID_CONTEXT_MASK,
 						      (file_priv->ctx.id - 1));
@@ -273,8 +271,6 @@ static int ivpu_open(struct drm_device *dev, struct drm_file *file)
 
 	return 0;
 
-err_xa_erase:
-	xa_erase_irq(&vdev->context_xa, ctx_id);
 err_unlock:
 	mutex_unlock(&vdev->context_list_lock);
 	mutex_destroy(&file_priv->ms_lock);
@@ -652,9 +648,7 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 	if (ret)
 		goto err_shutdown;
 
-	ret = ivpu_mmu_global_context_init(vdev);
-	if (ret)
-		goto err_shutdown;
+	ivpu_mmu_global_context_init(vdev);
 
 	ret = ivpu_mmu_init(vdev);
 	if (ret)
diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
index c078e214b2212..4ff0d7a519859 100644
--- a/drivers/accel/ivpu/ivpu_mmu.c
+++ b/drivers/accel/ivpu/ivpu_mmu.c
@@ -696,7 +696,7 @@ int ivpu_mmu_invalidate_tlb(struct ivpu_device *vdev, u16 ssid)
 	return ret;
 }
 
-static int ivpu_mmu_cd_add(struct ivpu_device *vdev, u32 ssid, u64 cd_dma)
+static int ivpu_mmu_cdtab_entry_set(struct ivpu_device *vdev, u32 ssid, u64 cd_dma, bool valid)
 {
 	struct ivpu_mmu_info *mmu = vdev->mmu;
 	struct ivpu_mmu_cdtab *cdtab = &mmu->cdtab;
@@ -708,30 +708,29 @@ static int ivpu_mmu_cd_add(struct ivpu_device *vdev, u32 ssid, u64 cd_dma)
 		return -EINVAL;
 
 	entry = cdtab->base + (ssid * IVPU_MMU_CDTAB_ENT_SIZE);
-
-	if (cd_dma != 0) {
-		cd[0] = FIELD_PREP(IVPU_MMU_CD_0_TCR_T0SZ, IVPU_MMU_T0SZ_48BIT) |
-			FIELD_PREP(IVPU_MMU_CD_0_TCR_TG0, 0) |
-			FIELD_PREP(IVPU_MMU_CD_0_TCR_IRGN0, 0) |
-			FIELD_PREP(IVPU_MMU_CD_0_TCR_ORGN0, 0) |
-			FIELD_PREP(IVPU_MMU_CD_0_TCR_SH0, 0) |
-			FIELD_PREP(IVPU_MMU_CD_0_TCR_IPS, IVPU_MMU_IPS_48BIT) |
-			FIELD_PREP(IVPU_MMU_CD_0_ASID, ssid) |
-			IVPU_MMU_CD_0_TCR_EPD1 |
-			IVPU_MMU_CD_0_AA64 |
-			IVPU_MMU_CD_0_R |
-			IVPU_MMU_CD_0_ASET |
-			IVPU_MMU_CD_0_V;
-		cd[1] = cd_dma & IVPU_MMU_CD_1_TTB0_MASK;
-		cd[2] = 0;
-		cd[3] = 0x0000000000007444;
-
-		/* For global context generate memory fault on VPU */
-		if (ssid == IVPU_GLOBAL_CONTEXT_MMU_SSID)
-			cd[0] |= IVPU_MMU_CD_0_A;
-	} else {
-		memset(cd, 0, sizeof(cd));
-	}
+	drm_WARN_ON(&vdev->drm, (entry[0] & IVPU_MMU_CD_0_V) == valid);
+
+	cd[0] = FIELD_PREP(IVPU_MMU_CD_0_TCR_T0SZ, IVPU_MMU_T0SZ_48BIT) |
+		FIELD_PREP(IVPU_MMU_CD_0_TCR_TG0, 0) |
+		FIELD_PREP(IVPU_MMU_CD_0_TCR_IRGN0, 0) |
+		FIELD_PREP(IVPU_MMU_CD_0_TCR_ORGN0, 0) |
+		FIELD_PREP(IVPU_MMU_CD_0_TCR_SH0, 0) |
+		FIELD_PREP(IVPU_MMU_CD_0_TCR_IPS, IVPU_MMU_IPS_48BIT) |
+		FIELD_PREP(IVPU_MMU_CD_0_ASID, ssid) |
+		IVPU_MMU_CD_0_TCR_EPD1 |
+		IVPU_MMU_CD_0_AA64 |
+		IVPU_MMU_CD_0_R |
+		IVPU_MMU_CD_0_ASET;
+	cd[1] = cd_dma & IVPU_MMU_CD_1_TTB0_MASK;
+	cd[2] = 0;
+	cd[3] = 0x0000000000007444;
+
+	/* For global context generate memory fault on VPU */
+	if (ssid == IVPU_GLOBAL_CONTEXT_MMU_SSID)
+		cd[0] |= IVPU_MMU_CD_0_A;
+
+	if (valid)
+		cd[0] |= IVPU_MMU_CD_0_V;
 
 	WRITE_ONCE(entry[1], cd[1]);
 	WRITE_ONCE(entry[2], cd[2]);
@@ -741,8 +740,8 @@ static int ivpu_mmu_cd_add(struct ivpu_device *vdev, u32 ssid, u64 cd_dma)
 	if (!ivpu_is_force_snoop_enabled(vdev))
 		clflush_cache_range(entry, IVPU_MMU_CDTAB_ENT_SIZE);
 
-	ivpu_dbg(vdev, MMU, "CDTAB %s entry (SSID=%u, dma=%pad): 0x%llx, 0x%llx, 0x%llx, 0x%llx\n",
-		 cd_dma ? "write" : "clear", ssid, &cd_dma, cd[0], cd[1], cd[2], cd[3]);
+	ivpu_dbg(vdev, MMU, "CDTAB set %s entry (SSID=%u, dma=%pad): 0x%llx, 0x%llx, 0x%llx, 0x%llx\n",
+		 valid ? "valid" : "invalid", ssid, &cd_dma, cd[0], cd[1], cd[2], cd[3]);
 
 	mutex_lock(&mmu->lock);
 	if (!mmu->on)
@@ -758,33 +757,6 @@ static int ivpu_mmu_cd_add(struct ivpu_device *vdev, u32 ssid, u64 cd_dma)
 	return ret;
 }
 
-static int ivpu_mmu_cd_add_gbl(struct ivpu_device *vdev)
-{
-	int ret;
-
-	ret = ivpu_mmu_cd_add(vdev, 0, vdev->gctx.pgtable.pgd_dma);
-	if (ret)
-		ivpu_err(vdev, "Failed to add global CD entry: %d\n", ret);
-
-	return ret;
-}
-
-static int ivpu_mmu_cd_add_user(struct ivpu_device *vdev, u32 ssid, dma_addr_t cd_dma)
-{
-	int ret;
-
-	if (ssid == 0) {
-		ivpu_err(vdev, "Invalid SSID: %u\n", ssid);
-		return -EINVAL;
-	}
-
-	ret = ivpu_mmu_cd_add(vdev, ssid, cd_dma);
-	if (ret)
-		ivpu_err(vdev, "Failed to add CD entry SSID=%u: %d\n", ssid, ret);
-
-	return ret;
-}
-
 int ivpu_mmu_init(struct ivpu_device *vdev)
 {
 	struct ivpu_mmu_info *mmu = vdev->mmu;
@@ -808,12 +780,6 @@ int ivpu_mmu_init(struct ivpu_device *vdev)
 		return ret;
 	}
 
-	ret = ivpu_mmu_cd_add_gbl(vdev);
-	if (ret) {
-		ivpu_err(vdev, "Failed to initialize strtab: %d\n", ret);
-		return ret;
-	}
-
 	ret = ivpu_mmu_enable(vdev);
 	if (ret) {
 		ivpu_err(vdev, "Failed to resume MMU: %d\n", ret);
@@ -966,12 +932,12 @@ void ivpu_mmu_irq_gerr_handler(struct ivpu_device *vdev)
 	REGV_WR32(IVPU_MMU_REG_GERRORN, gerror_val);
 }
 
-int ivpu_mmu_set_pgtable(struct ivpu_device *vdev, int ssid, struct ivpu_mmu_pgtable *pgtable)
+int ivpu_mmu_cd_set(struct ivpu_device *vdev, int ssid, struct ivpu_mmu_pgtable *pgtable)
 {
-	return ivpu_mmu_cd_add_user(vdev, ssid, pgtable->pgd_dma);
+	return ivpu_mmu_cdtab_entry_set(vdev, ssid, pgtable->pgd_dma, true);
 }
 
-void ivpu_mmu_clear_pgtable(struct ivpu_device *vdev, int ssid)
+void ivpu_mmu_cd_clear(struct ivpu_device *vdev, int ssid)
 {
-	ivpu_mmu_cd_add_user(vdev, ssid, 0); /* 0 will clear CD entry */
+	ivpu_mmu_cdtab_entry_set(vdev, ssid, 0, false);
 }
diff --git a/drivers/accel/ivpu/ivpu_mmu.h b/drivers/accel/ivpu/ivpu_mmu.h
index 6fa35c2407106..7afea9cd8731d 100644
--- a/drivers/accel/ivpu/ivpu_mmu.h
+++ b/drivers/accel/ivpu/ivpu_mmu.h
@@ -40,8 +40,8 @@ struct ivpu_mmu_info {
 int ivpu_mmu_init(struct ivpu_device *vdev);
 void ivpu_mmu_disable(struct ivpu_device *vdev);
 int ivpu_mmu_enable(struct ivpu_device *vdev);
-int ivpu_mmu_set_pgtable(struct ivpu_device *vdev, int ssid, struct ivpu_mmu_pgtable *pgtable);
-void ivpu_mmu_clear_pgtable(struct ivpu_device *vdev, int ssid);
+int ivpu_mmu_cd_set(struct ivpu_device *vdev, int ssid, struct ivpu_mmu_pgtable *pgtable);
+void ivpu_mmu_cd_clear(struct ivpu_device *vdev, int ssid);
 int ivpu_mmu_invalidate_tlb(struct ivpu_device *vdev, u16 ssid);
 
 void ivpu_mmu_irq_evtq_handler(struct ivpu_device *vdev);
diff --git a/drivers/accel/ivpu/ivpu_mmu_context.c b/drivers/accel/ivpu/ivpu_mmu_context.c
index bbe652a7019d0..8992fe93b679a 100644
--- a/drivers/accel/ivpu/ivpu_mmu_context.c
+++ b/drivers/accel/ivpu/ivpu_mmu_context.c
@@ -90,19 +90,6 @@ static void ivpu_pgtable_free_page(struct ivpu_device *vdev, u64 *cpu_addr, dma_
 	}
 }
 
-static int ivpu_mmu_pgtable_init(struct ivpu_device *vdev, struct ivpu_mmu_pgtable *pgtable)
-{
-	dma_addr_t pgd_dma;
-
-	pgtable->pgd_dma_ptr = ivpu_pgtable_alloc_page(vdev, &pgd_dma);
-	if (!pgtable->pgd_dma_ptr)
-		return -ENOMEM;
-
-	pgtable->pgd_dma = pgd_dma;
-
-	return 0;
-}
-
 static void ivpu_mmu_pgtables_free(struct ivpu_device *vdev, struct ivpu_mmu_pgtable *pgtable)
 {
 	int pgd_idx, pud_idx, pmd_idx;
@@ -140,6 +127,27 @@ static void ivpu_mmu_pgtables_free(struct ivpu_device *vdev, struct ivpu_mmu_pgt
 	}
 
 	ivpu_pgtable_free_page(vdev, pgtable->pgd_dma_ptr, pgtable->pgd_dma);
+	pgtable->pgd_dma_ptr = NULL;
+	pgtable->pgd_dma = 0;
+}
+
+static u64*
+ivpu_mmu_ensure_pgd(struct ivpu_device *vdev, struct ivpu_mmu_pgtable *pgtable)
+{
+	u64 *pgd_dma_ptr = pgtable->pgd_dma_ptr;
+	dma_addr_t pgd_dma;
+
+	if (pgd_dma_ptr)
+		return pgd_dma_ptr;
+
+	pgd_dma_ptr = ivpu_pgtable_alloc_page(vdev, &pgd_dma);
+	if (!pgd_dma_ptr)
+		return NULL;
+
+	pgtable->pgd_dma_ptr = pgd_dma_ptr;
+	pgtable->pgd_dma = pgd_dma;
+
+	return pgd_dma_ptr;
 }
 
 static u64*
@@ -237,6 +245,12 @@ ivpu_mmu_context_map_page(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx
 	int pmd_idx = FIELD_GET(IVPU_MMU_PMD_INDEX_MASK, vpu_addr);
 	int pte_idx = FIELD_GET(IVPU_MMU_PTE_INDEX_MASK, vpu_addr);
 
+	drm_WARN_ON(&vdev->drm, ctx->id == IVPU_RESERVED_CONTEXT_MMU_SSID);
+
+	/* Allocate PGD - first level page table if needed */
+	if (!ivpu_mmu_ensure_pgd(vdev, &ctx->pgtable))
+		return -ENOMEM;
+
 	/* Allocate PUD - second level page table if needed */
 	if (!ivpu_mmu_ensure_pud(vdev, &ctx->pgtable, pgd_idx))
 		return -ENOMEM;
@@ -448,12 +462,21 @@ ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
 		ret = ivpu_mmu_context_map_pages(vdev, ctx, vpu_addr, dma_addr, size, prot);
 		if (ret) {
 			ivpu_err(vdev, "Failed to map context pages\n");
-			mutex_unlock(&ctx->lock);
-			return ret;
+			goto err_unlock;
 		}
 		vpu_addr += size;
 	}
 
+	if (!ctx->is_cd_valid) {
+		ret = ivpu_mmu_cd_set(vdev, ctx->id, &ctx->pgtable);
+		if (ret) {
+			ivpu_err(vdev, "Failed to set context descriptor for context %u: %d\n",
+				 ctx->id, ret);
+			goto err_unlock;
+		}
+		ctx->is_cd_valid = true;
+	}
+
 	/* Ensure page table modifications are flushed from wc buffers to memory */
 	wmb();
 
@@ -463,6 +486,11 @@ ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
 	if (ret)
 		ivpu_err(vdev, "Failed to invalidate TLB for ctx %u: %d\n", ctx->id, ret);
 	return ret;
+
+err_unlock:
+	mutex_unlock(&ctx->lock);
+	return ret;
+
 }
 
 void
@@ -530,20 +558,12 @@ ivpu_mmu_context_remove_node(struct ivpu_mmu_context *ctx, struct drm_mm_node *n
 	mutex_unlock(&ctx->lock);
 }
 
-static int
-ivpu_mmu_context_init(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx, u32 context_id)
+void ivpu_mmu_context_init(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx, u32 context_id)
 {
 	u64 start, end;
-	int ret;
 
 	mutex_init(&ctx->lock);
 
-	ret = ivpu_mmu_pgtable_init(vdev, &ctx->pgtable);
-	if (ret) {
-		ivpu_err(vdev, "Failed to initialize pgtable for ctx %u: %d\n", context_id, ret);
-		return ret;
-	}
-
 	if (!context_id) {
 		start = vdev->hw->ranges.global.start;
 		end = vdev->hw->ranges.shave.end;
@@ -554,41 +574,59 @@ ivpu_mmu_context_init(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx, u3
 
 	drm_mm_init(&ctx->mm, start, end - start);
 	ctx->id = context_id;
-
-	return 0;
 }
 
-static void ivpu_mmu_context_fini(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx)
+void ivpu_mmu_context_fini(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx)
 {
-	if (drm_WARN_ON(&vdev->drm, !ctx->pgtable.pgd_dma_ptr))
-		return;
+	if (ctx->is_cd_valid) {
+		ivpu_mmu_cd_clear(vdev, ctx->id);
+		ctx->is_cd_valid = false;
+	}
 
 	mutex_destroy(&ctx->lock);
 	ivpu_mmu_pgtables_free(vdev, &ctx->pgtable);
 	drm_mm_takedown(&ctx->mm);
-
-	ctx->pgtable.pgd_dma_ptr = NULL;
-	ctx->pgtable.pgd_dma = 0;
 }
 
-int ivpu_mmu_global_context_init(struct ivpu_device *vdev)
+void ivpu_mmu_global_context_init(struct ivpu_device *vdev)
 {
-	return ivpu_mmu_context_init(vdev, &vdev->gctx, IVPU_GLOBAL_CONTEXT_MMU_SSID);
+	ivpu_mmu_context_init(vdev, &vdev->gctx, IVPU_GLOBAL_CONTEXT_MMU_SSID);
 }
 
 void ivpu_mmu_global_context_fini(struct ivpu_device *vdev)
 {
-	return ivpu_mmu_context_fini(vdev, &vdev->gctx);
+	ivpu_mmu_context_fini(vdev, &vdev->gctx);
 }
 
 int ivpu_mmu_reserved_context_init(struct ivpu_device *vdev)
 {
-	return ivpu_mmu_user_context_init(vdev, &vdev->rctx, IVPU_RESERVED_CONTEXT_MMU_SSID);
+	int ret;
+
+	ivpu_mmu_context_init(vdev, &vdev->rctx, IVPU_RESERVED_CONTEXT_MMU_SSID);
+
+	mutex_lock(&vdev->rctx.lock);
+
+	if (!ivpu_mmu_ensure_pgd(vdev, &vdev->rctx.pgtable)) {
+		ivpu_err(vdev, "Failed to allocate root page table for reserved context\n");
+		ret = -ENOMEM;
+		goto unlock;
+	}
+
+	ret = ivpu_mmu_cd_set(vdev, vdev->rctx.id, &vdev->rctx.pgtable);
+	if (ret) {
+		ivpu_err(vdev, "Failed to set context descriptor for reserved context\n");
+		goto unlock;
+	}
+
+unlock:
+	mutex_unlock(&vdev->rctx.lock);
+	return ret;
 }
 
 void ivpu_mmu_reserved_context_fini(struct ivpu_device *vdev)
 {
-	return ivpu_mmu_user_context_fini(vdev, &vdev->rctx);
+	ivpu_mmu_cd_clear(vdev, vdev->rctx.id);
+	ivpu_mmu_context_fini(vdev, &vdev->rctx);
 }
 
 void ivpu_mmu_user_context_mark_invalid(struct ivpu_device *vdev, u32 ssid)
@@ -603,36 +641,3 @@ void ivpu_mmu_user_context_mark_invalid(struct ivpu_device *vdev, u32 ssid)
 
 	xa_unlock(&vdev->context_xa);
 }
-
-int ivpu_mmu_user_context_init(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx, u32 ctx_id)
-{
-	int ret;
-
-	drm_WARN_ON(&vdev->drm, !ctx_id);
-
-	ret = ivpu_mmu_context_init(vdev, ctx, ctx_id);
-	if (ret) {
-		ivpu_err(vdev, "Failed to initialize context %u: %d\n", ctx_id, ret);
-		return ret;
-	}
-
-	ret = ivpu_mmu_set_pgtable(vdev, ctx_id, &ctx->pgtable);
-	if (ret) {
-		ivpu_err(vdev, "Failed to set page table for context %u: %d\n", ctx_id, ret);
-		goto err_context_fini;
-	}
-
-	return 0;
-
-err_context_fini:
-	ivpu_mmu_context_fini(vdev, ctx);
-	return ret;
-}
-
-void ivpu_mmu_user_context_fini(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx)
-{
-	drm_WARN_ON(&vdev->drm, !ctx->id);
-
-	ivpu_mmu_clear_pgtable(vdev, ctx->id);
-	ivpu_mmu_context_fini(vdev, ctx);
-}
diff --git a/drivers/accel/ivpu/ivpu_mmu_context.h b/drivers/accel/ivpu/ivpu_mmu_context.h
index 7f9aaf3d10c2f..8042fc0670622 100644
--- a/drivers/accel/ivpu/ivpu_mmu_context.h
+++ b/drivers/accel/ivpu/ivpu_mmu_context.h
@@ -23,19 +23,20 @@ struct ivpu_mmu_pgtable {
 };
 
 struct ivpu_mmu_context {
-	struct mutex lock; /* Protects: mm, pgtable */
+	struct mutex lock; /* Protects: mm, pgtable, is_cd_valid */
 	struct drm_mm mm;
 	struct ivpu_mmu_pgtable pgtable;
+	bool is_cd_valid;
 	u32 id;
 };
 
-int ivpu_mmu_global_context_init(struct ivpu_device *vdev);
+void ivpu_mmu_context_init(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx, u32 context_id);
+void ivpu_mmu_context_fini(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx);
+void ivpu_mmu_global_context_init(struct ivpu_device *vdev);
 void ivpu_mmu_global_context_fini(struct ivpu_device *vdev);
 int ivpu_mmu_reserved_context_init(struct ivpu_device *vdev);
 void ivpu_mmu_reserved_context_fini(struct ivpu_device *vdev);
 
-int ivpu_mmu_user_context_init(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx, u32 ctx_id);
-void ivpu_mmu_user_context_fini(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx);
 void ivpu_mmu_user_context_mark_invalid(struct ivpu_device *vdev, u32 ssid);
 
 int ivpu_mmu_context_insert_node(struct ivpu_mmu_context *ctx, const struct ivpu_addr_range *range,
-- 
2.45.1

