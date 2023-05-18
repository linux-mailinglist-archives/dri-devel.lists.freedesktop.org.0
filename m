Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1017082E3
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 15:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC1210E528;
	Thu, 18 May 2023 13:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B191110E528
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 13:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684417019; x=1715953019;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jl7H9fwLkM/ELpGRgUchdoHhfESDONoTcKgJARijXy0=;
 b=UDEaB1DB++tmQ5rCdrMfGMxv5tSIQCufsNmsScWtqQuGt8Ogzf4x5UQc
 /JLEdDG8XVwcELZUonZTBDxuAb6me6vOcCnVduhl7ggwZ3751B5M1640K
 27MHipVPVafq7pIsuyXRoglTFU2wInb3xso5Tg2kLS04wXr5qof9XCkF3
 9tuaZ64yDsohcVq8ix5pGb6b/B7q4VPS8o0cWRPGaHvDFolwPQ+5Zcj6H
 yEZdXdwgvU+pO0zRupehD/al1muDiGAoDy8iQBCu7s+btnwaBVHVWUYy4
 dXDkwNGqfCPwDliCUylnx5CNQoxK6+hPmKfhv1saZCrMNC9JmwS44c5IN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="354381285"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; d="scan'208";a="354381285"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 06:16:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="846474036"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; d="scan'208";a="846474036"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 06:16:51 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] accel/ivpu: Mark 64 kB contiguous areas as contiguous in
 PTEs
Date: Thu, 18 May 2023 15:16:05 +0200
Message-Id: <20230518131605.650622-6-stanislaw.gruszka@linux.intel.com>
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

Whenever KMD maps region larger than 64kB that is both aligned and
contiguous, set contiguous bit (52) in MMU PTE descriptor for each page
in that region.

This allows to treat 16 contiguous pages as one and reduce
number of MMU page walks required what results in lower latency.

Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c         |  4 ++
 drivers/accel/ivpu/ivpu_drv.h         |  1 +
 drivers/accel/ivpu/ivpu_mmu_context.c | 75 +++++++++++++++++++++------
 3 files changed, 64 insertions(+), 16 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 21a5a0d63241..2df7643b843d 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -50,6 +50,10 @@ u8 ivpu_pll_max_ratio = U8_MAX;
 module_param_named(pll_max_ratio, ivpu_pll_max_ratio, byte, 0644);
 MODULE_PARM_DESC(pll_max_ratio, "Maximum PLL ratio used to set VPU frequency");
 
+bool ivpu_disable_mmu_cont_pages;
+module_param_named(disable_mmu_cont_pages, ivpu_disable_mmu_cont_pages, bool, 0644);
+MODULE_PARM_DESC(disable_mmu_cont_pages, "Disable MMU contiguous pages optimization");
+
 struct ivpu_file_priv *ivpu_file_priv_get(struct ivpu_file_priv *file_priv)
 {
 	struct ivpu_device *vdev = file_priv->vdev;
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index d3013fbd13b3..315180dd72ce 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -131,6 +131,7 @@ struct ivpu_file_priv {
 extern int ivpu_dbg_mask;
 extern u8 ivpu_pll_min_ratio;
 extern u8 ivpu_pll_max_ratio;
+extern bool ivpu_disable_mmu_cont_pages;
 
 #define IVPU_TEST_MODE_DISABLED  0
 #define IVPU_TEST_MODE_FW_TEST   1
diff --git a/drivers/accel/ivpu/ivpu_mmu_context.c b/drivers/accel/ivpu/ivpu_mmu_context.c
index 6c7a53651075..465a82298476 100644
--- a/drivers/accel/ivpu/ivpu_mmu_context.c
+++ b/drivers/accel/ivpu/ivpu_mmu_context.c
@@ -15,7 +15,8 @@
 #define IVPU_MMU_PUD_INDEX_MASK          GENMASK(38, 30)
 #define IVPU_MMU_PMD_INDEX_MASK          GENMASK(29, 21)
 #define IVPU_MMU_PTE_INDEX_MASK          GENMASK(20, 12)
-#define IVPU_MMU_ENTRY_FLAGS_MASK        GENMASK(11, 0)
+#define IVPU_MMU_ENTRY_FLAGS_MASK        (BIT(52) | GENMASK(11, 0))
+#define IVPU_MMU_ENTRY_FLAG_CONT         BIT(52)
 #define IVPU_MMU_ENTRY_FLAG_NG           BIT(11)
 #define IVPU_MMU_ENTRY_FLAG_AF           BIT(10)
 #define IVPU_MMU_ENTRY_FLAG_USER         BIT(6)
@@ -23,12 +24,13 @@
 #define IVPU_MMU_ENTRY_FLAG_TYPE_PAGE    BIT(1)
 #define IVPU_MMU_ENTRY_FLAG_VALID        BIT(0)
 
-#define IVPU_MMU_PAGE_SIZE    SZ_4K
-#define IVPU_MMU_PTE_MAP_SIZE (IVPU_MMU_PGTABLE_ENTRIES * IVPU_MMU_PAGE_SIZE)
-#define IVPU_MMU_PMD_MAP_SIZE (IVPU_MMU_PGTABLE_ENTRIES * IVPU_MMU_PTE_MAP_SIZE)
-#define IVPU_MMU_PUD_MAP_SIZE (IVPU_MMU_PGTABLE_ENTRIES * IVPU_MMU_PMD_MAP_SIZE)
-#define IVPU_MMU_PGD_MAP_SIZE (IVPU_MMU_PGTABLE_ENTRIES * IVPU_MMU_PUD_MAP_SIZE)
-#define IVPU_MMU_PGTABLE_SIZE (IVPU_MMU_PGTABLE_ENTRIES * sizeof(u64))
+#define IVPU_MMU_PAGE_SIZE       SZ_4K
+#define IVPU_MMU_CONT_PAGES_SIZE (IVPU_MMU_PAGE_SIZE * 16)
+#define IVPU_MMU_PTE_MAP_SIZE    (IVPU_MMU_PGTABLE_ENTRIES * IVPU_MMU_PAGE_SIZE)
+#define IVPU_MMU_PMD_MAP_SIZE    (IVPU_MMU_PGTABLE_ENTRIES * IVPU_MMU_PTE_MAP_SIZE)
+#define IVPU_MMU_PUD_MAP_SIZE    (IVPU_MMU_PGTABLE_ENTRIES * IVPU_MMU_PMD_MAP_SIZE)
+#define IVPU_MMU_PGD_MAP_SIZE    (IVPU_MMU_PGTABLE_ENTRIES * IVPU_MMU_PUD_MAP_SIZE)
+#define IVPU_MMU_PGTABLE_SIZE    (IVPU_MMU_PGTABLE_ENTRIES * sizeof(u64))
 
 #define IVPU_MMU_DUMMY_ADDRESS 0xdeadb000
 #define IVPU_MMU_ENTRY_VALID   (IVPU_MMU_ENTRY_FLAG_TYPE_PAGE | IVPU_MMU_ENTRY_FLAG_VALID)
@@ -183,7 +185,7 @@ ivpu_mmu_ensure_pte(struct ivpu_device *vdev, struct ivpu_mmu_pgtable *pgtable,
 
 static int
 ivpu_mmu_context_map_page(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
-			  u64 vpu_addr, dma_addr_t dma_addr, int prot)
+			  u64 vpu_addr, dma_addr_t dma_addr, u64 prot)
 {
 	u64 *pte;
 	int pgd_idx = FIELD_GET(IVPU_MMU_PGD_INDEX_MASK, vpu_addr);
@@ -210,6 +212,31 @@ ivpu_mmu_context_map_page(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx
 	return 0;
 }
 
+static int
+ivpu_mmu_context_map_cont_64k(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx, u64 vpu_addr,
+			      dma_addr_t dma_addr, u64 prot)
+{
+	size_t size = IVPU_MMU_CONT_PAGES_SIZE;
+
+	drm_WARN_ON(&vdev->drm, !IS_ALIGNED(vpu_addr, size));
+	drm_WARN_ON(&vdev->drm, !IS_ALIGNED(dma_addr, size));
+
+	prot |= IVPU_MMU_ENTRY_FLAG_CONT;
+
+	while (size) {
+		int ret = ivpu_mmu_context_map_page(vdev, ctx, vpu_addr, dma_addr, prot);
+
+		if (ret)
+			return ret;
+
+		size -= IVPU_MMU_PAGE_SIZE;
+		vpu_addr += IVPU_MMU_PAGE_SIZE;
+		dma_addr += IVPU_MMU_PAGE_SIZE;
+	}
+
+	return 0;
+}
+
 static void ivpu_mmu_context_unmap_page(struct ivpu_mmu_context *ctx, u64 vpu_addr)
 {
 	int pgd_idx = FIELD_GET(IVPU_MMU_PGD_INDEX_MASK, vpu_addr);
@@ -255,17 +282,27 @@ ivpu_mmu_context_flush_page_tables(struct ivpu_mmu_context *ctx, u64 vpu_addr, s
 
 static int
 ivpu_mmu_context_map_pages(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
-			   u64 vpu_addr, dma_addr_t dma_addr, size_t size, int prot)
+			   u64 vpu_addr, dma_addr_t dma_addr, size_t size, u64 prot)
 {
+	int map_size;
+	int ret;
+
 	while (size) {
-		int ret = ivpu_mmu_context_map_page(vdev, ctx, vpu_addr, dma_addr, prot);
+		if (!ivpu_disable_mmu_cont_pages && size >= IVPU_MMU_CONT_PAGES_SIZE &&
+		    IS_ALIGNED(vpu_addr | dma_addr, IVPU_MMU_CONT_PAGES_SIZE)) {
+			ret = ivpu_mmu_context_map_cont_64k(vdev, ctx, vpu_addr, dma_addr, prot);
+			map_size = IVPU_MMU_CONT_PAGES_SIZE;
+		} else {
+			ret = ivpu_mmu_context_map_page(vdev, ctx, vpu_addr, dma_addr, prot);
+			map_size = IVPU_MMU_PAGE_SIZE;
+		}
 
 		if (ret)
 			return ret;
 
-		vpu_addr += IVPU_MMU_PAGE_SIZE;
-		dma_addr += IVPU_MMU_PAGE_SIZE;
-		size -= IVPU_MMU_PAGE_SIZE;
+		vpu_addr += map_size;
+		dma_addr += map_size;
+		size -= map_size;
 	}
 
 	return 0;
@@ -285,8 +322,8 @@ ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
 			 u64 vpu_addr, struct sg_table *sgt,  bool llc_coherent)
 {
 	struct scatterlist *sg;
-	int prot;
 	int ret;
+	u64 prot;
 	u64 i;
 
 	if (!IS_ALIGNED(vpu_addr, IVPU_MMU_PAGE_SIZE))
@@ -362,8 +399,14 @@ ivpu_mmu_context_insert_node_locked(struct ivpu_mmu_context *ctx,
 {
 	lockdep_assert_held(&ctx->lock);
 
-	return drm_mm_insert_node_in_range(&ctx->mm, node, size, IVPU_MMU_PAGE_SIZE,
-					  0, range->start, range->end, DRM_MM_INSERT_BEST);
+	if (!ivpu_disable_mmu_cont_pages && size >= IVPU_MMU_CONT_PAGES_SIZE) {
+		if (!drm_mm_insert_node_in_range(&ctx->mm, node, size, IVPU_MMU_CONT_PAGES_SIZE, 0,
+						 range->start, range->end, DRM_MM_INSERT_BEST))
+			return 0;
+	}
+
+	return drm_mm_insert_node_in_range(&ctx->mm, node, size, IVPU_MMU_PAGE_SIZE, 0,
+					   range->start, range->end, DRM_MM_INSERT_BEST);
 }
 
 void
-- 
2.25.1

