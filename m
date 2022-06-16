Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E077354ED97
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 00:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B7310E11F;
	Thu, 16 Jun 2022 22:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B826610E11F;
 Thu, 16 Jun 2022 22:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655419759; x=1686955759;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mxrBcqL5ryBYnia3NkIWViraipvqU+3e8yxjazTsvfU=;
 b=P7kLQjumeN4kgxmXWWDqgVKhD9951qRi81ouAMmv24EChXHsPnGio5tb
 DPV5XlHd7uEMkVetLTCg2XMgyQ1FYdcSlt1ZdSiBq1ws/juImt0UM98xN
 o4gra4AMQ5AnxNqoQVqYVawlcdlYgzPxaGKvDM5jdna9BUbNpJ537jVZm
 BTEEl0uoJD2IkGN9ibc+LCscxFn5IbBfBhB9geTvi+oy7bnP95LqzIPoZ
 HwPtjSOaiFnY2pFbbZJcY1X+uFdOKHFhTR5+Fs9t3CzJxcA8yrxDKagnj
 96DcxazW51pTQyFnuCMb30TuPF7L0Doky0kG5N0vgu570r2PmcQNXA0NT w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="278165974"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="278165974"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 15:49:19 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="713537569"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 15:49:18 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] agp/intel: Rename intel-gtt symbols
Date: Thu, 16 Jun 2022 15:49:42 -0700
Message-Id: <20220616224943.830393-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.36.1
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
Cc: David Airlie <airlied@linux.ie>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Exporting the symbols like intel_gtt_* creates some confusion inside
i915 that has symbols named similarly. In an attempt to isolate
platforms needing intel-gtt.ko, commit 7a5c922377b4 ("drm/i915/gt: Split
intel-gtt functions by arch") moved way too much
inside gt/intel_gt_gmch.c, even the functions that don't callout to this
module. Rename the symbols to make the separation clear.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/char/agp/intel-gtt.c            | 58 ++++++++++++-------------
 drivers/gpu/drm/i915/gt/intel_gt_gmch.c | 16 +++----
 include/drm/intel-gtt.h                 | 24 +++++-----
 3 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/drivers/char/agp/intel-gtt.c b/drivers/char/agp/intel-gtt.c
index 79a1b65527c2..fe7e2105e766 100644
--- a/drivers/char/agp/intel-gtt.c
+++ b/drivers/char/agp/intel-gtt.c
@@ -744,7 +744,7 @@ static void i830_write_entry(dma_addr_t addr, unsigned int entry,
 	writel_relaxed(addr | pte_flags, intel_private.gtt + entry);
 }
 
-bool intel_enable_gtt(void)
+bool intel_gmch_enable_gtt(void)
 {
 	u8 __iomem *reg;
 
@@ -787,7 +787,7 @@ bool intel_enable_gtt(void)
 
 	return true;
 }
-EXPORT_SYMBOL(intel_enable_gtt);
+EXPORT_SYMBOL(intel_gmch_enable_gtt);
 
 static int i830_setup(void)
 {
@@ -821,8 +821,8 @@ static int intel_fake_agp_free_gatt_table(struct agp_bridge_data *bridge)
 
 static int intel_fake_agp_configure(void)
 {
-	if (!intel_enable_gtt())
-	    return -EIO;
+	if (!intel_gmch_enable_gtt())
+		return -EIO;
 
 	intel_private.clear_fake_agp = true;
 	agp_bridge->gart_bus_addr = intel_private.gma_bus_addr;
@@ -844,20 +844,20 @@ static bool i830_check_flags(unsigned int flags)
 	return false;
 }
 
-void intel_gtt_insert_page(dma_addr_t addr,
-			   unsigned int pg,
-			   unsigned int flags)
+void intel_gmch_gtt_insert_page(dma_addr_t addr,
+				unsigned int pg,
+				unsigned int flags)
 {
 	intel_private.driver->write_entry(addr, pg, flags);
 	readl(intel_private.gtt + pg);
 	if (intel_private.driver->chipset_flush)
 		intel_private.driver->chipset_flush();
 }
-EXPORT_SYMBOL(intel_gtt_insert_page);
+EXPORT_SYMBOL(intel_gmch_gtt_insert_page);
 
-void intel_gtt_insert_sg_entries(struct sg_table *st,
-				 unsigned int pg_start,
-				 unsigned int flags)
+void intel_gmch_gtt_insert_sg_entries(struct sg_table *st,
+				      unsigned int pg_start,
+				      unsigned int flags)
 {
 	struct scatterlist *sg;
 	unsigned int len, m;
@@ -879,13 +879,13 @@ void intel_gtt_insert_sg_entries(struct sg_table *st,
 	if (intel_private.driver->chipset_flush)
 		intel_private.driver->chipset_flush();
 }
-EXPORT_SYMBOL(intel_gtt_insert_sg_entries);
+EXPORT_SYMBOL(intel_gmch_gtt_insert_sg_entries);
 
 #if IS_ENABLED(CONFIG_AGP_INTEL)
-static void intel_gtt_insert_pages(unsigned int first_entry,
-				   unsigned int num_entries,
-				   struct page **pages,
-				   unsigned int flags)
+static void intel_gmch_gtt_insert_pages(unsigned int first_entry,
+					unsigned int num_entries,
+					struct page **pages,
+					unsigned int flags)
 {
 	int i, j;
 
@@ -905,7 +905,7 @@ static int intel_fake_agp_insert_entries(struct agp_memory *mem,
 	if (intel_private.clear_fake_agp) {
 		int start = intel_private.stolen_size / PAGE_SIZE;
 		int end = intel_private.gtt_mappable_entries;
-		intel_gtt_clear_range(start, end - start);
+		intel_gmch_gtt_clear_range(start, end - start);
 		intel_private.clear_fake_agp = false;
 	}
 
@@ -934,12 +934,12 @@ static int intel_fake_agp_insert_entries(struct agp_memory *mem,
 		if (ret != 0)
 			return ret;
 
-		intel_gtt_insert_sg_entries(&st, pg_start, type);
+		intel_gmch_gtt_insert_sg_entries(&st, pg_start, type);
 		mem->sg_list = st.sgl;
 		mem->num_sg = st.nents;
 	} else
-		intel_gtt_insert_pages(pg_start, mem->page_count, mem->pages,
-				       type);
+		intel_gmch_gtt_insert_pages(pg_start, mem->page_count, mem->pages,
+					    type);
 
 out:
 	ret = 0;
@@ -949,7 +949,7 @@ static int intel_fake_agp_insert_entries(struct agp_memory *mem,
 }
 #endif
 
-void intel_gtt_clear_range(unsigned int first_entry, unsigned int num_entries)
+void intel_gmch_gtt_clear_range(unsigned int first_entry, unsigned int num_entries)
 {
 	unsigned int i;
 
@@ -959,7 +959,7 @@ void intel_gtt_clear_range(unsigned int first_entry, unsigned int num_entries)
 	}
 	wmb();
 }
-EXPORT_SYMBOL(intel_gtt_clear_range);
+EXPORT_SYMBOL(intel_gmch_gtt_clear_range);
 
 #if IS_ENABLED(CONFIG_AGP_INTEL)
 static int intel_fake_agp_remove_entries(struct agp_memory *mem,
@@ -968,7 +968,7 @@ static int intel_fake_agp_remove_entries(struct agp_memory *mem,
 	if (mem->page_count == 0)
 		return 0;
 
-	intel_gtt_clear_range(pg_start, mem->page_count);
+	intel_gmch_gtt_clear_range(pg_start, mem->page_count);
 
 	if (intel_private.needs_dmar) {
 		intel_gtt_unmap_memory(mem->sg_list, mem->num_sg);
@@ -1431,22 +1431,22 @@ int intel_gmch_probe(struct pci_dev *bridge_pdev, struct pci_dev *gpu_pdev,
 }
 EXPORT_SYMBOL(intel_gmch_probe);
 
-void intel_gtt_get(u64 *gtt_total,
-		   phys_addr_t *mappable_base,
-		   resource_size_t *mappable_end)
+void intel_gmch_gtt_get(u64 *gtt_total,
+			phys_addr_t *mappable_base,
+			resource_size_t *mappable_end)
 {
 	*gtt_total = intel_private.gtt_total_entries << PAGE_SHIFT;
 	*mappable_base = intel_private.gma_bus_addr;
 	*mappable_end = intel_private.gtt_mappable_entries << PAGE_SHIFT;
 }
-EXPORT_SYMBOL(intel_gtt_get);
+EXPORT_SYMBOL(intel_gmch_gtt_get);
 
-void intel_gtt_chipset_flush(void)
+void intel_gmch_gtt_flush(void)
 {
 	if (intel_private.driver->chipset_flush)
 		intel_private.driver->chipset_flush();
 }
-EXPORT_SYMBOL(intel_gtt_chipset_flush);
+EXPORT_SYMBOL(intel_gmch_gtt_flush);
 
 void intel_gmch_remove(void)
 {
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_gmch.c b/drivers/gpu/drm/i915/gt/intel_gt_gmch.c
index 18e488672d1b..b1a6ff4c9377 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_gmch.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_gmch.c
@@ -134,7 +134,7 @@ static void gen5_ggtt_insert_page(struct i915_address_space *vm,
 	unsigned int flags = (cache_level == I915_CACHE_NONE) ?
 		AGP_USER_MEMORY : AGP_USER_CACHED_MEMORY;
 
-	intel_gtt_insert_page(addr, offset >> PAGE_SHIFT, flags);
+	intel_gmch_gtt_insert_page(addr, offset >> PAGE_SHIFT, flags);
 }
 
 static void gen6_ggtt_insert_page(struct i915_address_space *vm,
@@ -175,8 +175,8 @@ static void gen5_ggtt_insert_entries(struct i915_address_space *vm,
 	unsigned int flags = (cache_level == I915_CACHE_NONE) ?
 		AGP_USER_MEMORY : AGP_USER_CACHED_MEMORY;
 
-	intel_gtt_insert_sg_entries(vma_res->bi.pages, vma_res->start >> PAGE_SHIFT,
-				    flags);
+	intel_gmch_gtt_insert_sg_entries(vma_res->bi.pages, vma_res->start >> PAGE_SHIFT,
+					 flags);
 }
 
 /*
@@ -306,18 +306,18 @@ static void bxt_vtd_ggtt_insert_entries__BKL(struct i915_address_space *vm,
 
 void intel_gt_gmch_gen5_chipset_flush(struct intel_gt *gt)
 {
-	intel_gtt_chipset_flush();
+	intel_gmch_gtt_flush();
 }
 
 static void gmch_ggtt_invalidate(struct i915_ggtt *ggtt)
 {
-	intel_gtt_chipset_flush();
+	intel_gmch_gtt_flush();
 }
 
 static void gen5_ggtt_clear_range(struct i915_address_space *vm,
 					 u64 start, u64 length)
 {
-	intel_gtt_clear_range(start >> PAGE_SHIFT, length >> PAGE_SHIFT);
+	intel_gmch_gtt_clear_range(start >> PAGE_SHIFT, length >> PAGE_SHIFT);
 }
 
 static void gen6_ggtt_clear_range(struct i915_address_space *vm,
@@ -494,7 +494,7 @@ int intel_gt_gmch_gen5_probe(struct i915_ggtt *ggtt)
 		return -EIO;
 	}
 
-	intel_gtt_get(&ggtt->vm.total, &gmadr_base, &ggtt->mappable_end);
+	intel_gmch_gtt_get(&ggtt->vm.total, &gmadr_base, &ggtt->mappable_end);
 
 	ggtt->gmadr =
 		(struct resource)DEFINE_RES_MEM(gmadr_base, ggtt->mappable_end);
@@ -647,7 +647,7 @@ int intel_gt_gmch_gen8_probe(struct i915_ggtt *ggtt)
 
 int intel_gt_gmch_gen5_enable_hw(struct drm_i915_private *i915)
 {
-	if (GRAPHICS_VER(i915) < 6 && !intel_enable_gtt())
+	if (GRAPHICS_VER(i915) < 6 && !intel_gmch_enable_gtt())
 		return -EIO;
 
 	return 0;
diff --git a/include/drm/intel-gtt.h b/include/drm/intel-gtt.h
index 67530bfef129..cb0d5b7200c7 100644
--- a/include/drm/intel-gtt.h
+++ b/include/drm/intel-gtt.h
@@ -10,24 +10,24 @@ struct agp_bridge_data;
 struct pci_dev;
 struct sg_table;
 
-void intel_gtt_get(u64 *gtt_total,
-		   phys_addr_t *mappable_base,
-		   resource_size_t *mappable_end);
+void intel_gmch_gtt_get(u64 *gtt_total,
+			phys_addr_t *mappable_base,
+			resource_size_t *mappable_end);
 
 int intel_gmch_probe(struct pci_dev *bridge_pdev, struct pci_dev *gpu_pdev,
 		     struct agp_bridge_data *bridge);
 void intel_gmch_remove(void);
 
-bool intel_enable_gtt(void);
+bool intel_gmch_enable_gtt(void);
 
-void intel_gtt_chipset_flush(void);
-void intel_gtt_insert_page(dma_addr_t addr,
-			   unsigned int pg,
-			   unsigned int flags);
-void intel_gtt_insert_sg_entries(struct sg_table *st,
-				 unsigned int pg_start,
-				 unsigned int flags);
-void intel_gtt_clear_range(unsigned int first_entry, unsigned int num_entries);
+void intel_gmch_gtt_flush(void);
+void intel_gmch_gtt_insert_page(dma_addr_t addr,
+				unsigned int pg,
+				unsigned int flags);
+void intel_gmch_gtt_insert_sg_entries(struct sg_table *st,
+				      unsigned int pg_start,
+				      unsigned int flags);
+void intel_gmch_gtt_clear_range(unsigned int first_entry, unsigned int num_entries);
 
 /* Special gtt memory types */
 #define AGP_DCACHE_MEMORY	1
-- 
2.36.1

