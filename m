Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 515FB6ED2DE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 18:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C24B10E1BA;
	Mon, 24 Apr 2023 16:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4245B10E1B9;
 Mon, 24 Apr 2023 16:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682355181; x=1713891181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/3FRMSd3zoY82jBNEtKq63QyfFCqUUwC7FNNLVgIxTY=;
 b=nhn+++ZW0UhM9MrdwHZTSbwrfiVH+oU4zWNE02O/LU0owwGaIqELxfQh
 juDfk7R4g2kQQZsKvZB8lqwhZPdTnD3EcrZDNtC1rcLjHgElJpYNSF+1L
 pV2EUarj5PXl0z4ISybFoN+un6DRsrMWe/Xt26xUEeVvF15UXdCDXGhXN
 SHLpyX3RA1Yb96Ao/vFYrhaWoF+ENyYei/IXU3wuOon8wnjicHCsJ3BCM
 HFBlCHCiLq6e+aWOhy+9TUdc7zoTuccJrXPuVld1pWp+GjKXR4yyTOAk2
 vPW3KwI0t+QtRsXinEoC25DsJIwvpFIxzvn8/Isbq4mOGZBoJHdcfcByS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="335392400"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="335392400"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 09:52:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="695836564"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="695836564"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 09:52:58 -0700
From: fei.yang@intel.com
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/mtl: Add PTE encode function
Date: Mon, 24 Apr 2023 09:54:06 -0700
Message-Id: <20230424165407.3584612-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230424165407.3584612-1-fei.yang@intel.com>
References: <20230424165407.3584612-1-fei.yang@intel.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Fei Yang <fei.yang@intel.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

PTE encode functions are platform dependent. This patch implements
PTE functions for MTL, and ensures the correct PTE encode function
is used by calling pte_encode function pointer instead of the
hardcoded gen8 version of PTE encode.

Fixes: b76c0deef627 ("drm/i915/mtl: Define MOCS and PAT tables for MTL")
Signed-off-by: Fei Yang <fei.yang@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Acked-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpt.c |  2 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c     | 45 ++++++++++++++++++++----
 drivers/gpu/drm/i915/gt/intel_ggtt.c     | 36 +++++++++++++++++--
 drivers/gpu/drm/i915/gt/intel_gtt.h      | 13 +++++--
 4 files changed, 83 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
index b8027392144d..c5eacfdba1a5 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.c
+++ b/drivers/gpu/drm/i915/display/intel_dpt.c
@@ -300,7 +300,7 @@ intel_dpt_create(struct intel_framebuffer *fb)
 	vm->vma_ops.bind_vma    = dpt_bind_vma;
 	vm->vma_ops.unbind_vma  = dpt_unbind_vma;
 
-	vm->pte_encode = gen8_ggtt_pte_encode;
+	vm->pte_encode = vm->gt->ggtt->vm.pte_encode;
 
 	dpt->obj = dpt_obj;
 	dpt->obj->is_dpt = true;
diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index 4daaa6f55668..11b91e0453c8 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -55,6 +55,34 @@ static u64 gen8_pte_encode(dma_addr_t addr,
 	return pte;
 }
 
+static u64 mtl_pte_encode(dma_addr_t addr,
+			  enum i915_cache_level level,
+			  u32 flags)
+{
+	gen8_pte_t pte = addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
+
+	if (unlikely(flags & PTE_READ_ONLY))
+		pte &= ~GEN8_PAGE_RW;
+
+	if (flags & PTE_LM)
+		pte |= GEN12_PPGTT_PTE_LM | GEN12_PPGTT_PTE_NC;
+
+	switch (level) {
+	case I915_CACHE_NONE:
+		pte |= GEN12_PPGTT_PTE_PAT1;
+		break;
+	case I915_CACHE_LLC:
+	case I915_CACHE_L3_LLC:
+		pte |= GEN12_PPGTT_PTE_PAT0 | GEN12_PPGTT_PTE_PAT1;
+		break;
+	case I915_CACHE_WT:
+		pte |= GEN12_PPGTT_PTE_PAT0;
+		break;
+	}
+
+	return pte;
+}
+
 static void gen8_ppgtt_notify_vgt(struct i915_ppgtt *ppgtt, bool create)
 {
 	struct drm_i915_private *i915 = ppgtt->vm.i915;
@@ -427,7 +455,7 @@ gen8_ppgtt_insert_pte(struct i915_ppgtt *ppgtt,
 		      u32 flags)
 {
 	struct i915_page_directory *pd;
-	const gen8_pte_t pte_encode = gen8_pte_encode(0, cache_level, flags);
+	const gen8_pte_t pte_encode = ppgtt->vm.pte_encode(0, cache_level, flags);
 	gen8_pte_t *vaddr;
 
 	pd = i915_pd_entry(pdp, gen8_pd_index(idx, 2));
@@ -580,7 +608,7 @@ static void gen8_ppgtt_insert_huge(struct i915_address_space *vm,
 				   enum i915_cache_level cache_level,
 				   u32 flags)
 {
-	const gen8_pte_t pte_encode = gen8_pte_encode(0, cache_level, flags);
+	const gen8_pte_t pte_encode = vm->pte_encode(0, cache_level, flags);
 	unsigned int rem = sg_dma_len(iter->sg);
 	u64 start = vma_res->start;
 
@@ -743,7 +771,7 @@ static void gen8_ppgtt_insert_entry(struct i915_address_space *vm,
 	GEM_BUG_ON(pt->is_compact);
 
 	vaddr = px_vaddr(pt);
-	vaddr[gen8_pd_index(idx, 0)] = gen8_pte_encode(addr, level, flags);
+	vaddr[gen8_pd_index(idx, 0)] = vm->pte_encode(addr, level, flags);
 	drm_clflush_virt_range(&vaddr[gen8_pd_index(idx, 0)], sizeof(*vaddr));
 }
 
@@ -773,7 +801,7 @@ static void __xehpsdv_ppgtt_insert_entry_lm(struct i915_address_space *vm,
 	}
 
 	vaddr = px_vaddr(pt);
-	vaddr[gen8_pd_index(idx, 0) / 16] = gen8_pte_encode(addr, level, flags);
+	vaddr[gen8_pd_index(idx, 0) / 16] = vm->pte_encode(addr, level, flags);
 }
 
 static void xehpsdv_ppgtt_insert_entry(struct i915_address_space *vm,
@@ -820,8 +848,8 @@ static int gen8_init_scratch(struct i915_address_space *vm)
 		pte_flags |= PTE_LM;
 
 	vm->scratch[0]->encode =
-		gen8_pte_encode(px_dma(vm->scratch[0]),
-				I915_CACHE_NONE, pte_flags);
+		vm->pte_encode(px_dma(vm->scratch[0]),
+			       I915_CACHE_NONE, pte_flags);
 
 	for (i = 1; i <= vm->top; i++) {
 		struct drm_i915_gem_object *obj;
@@ -963,7 +991,10 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt,
 	 */
 	ppgtt->vm.alloc_scratch_dma = alloc_pt_dma;
 
-	ppgtt->vm.pte_encode = gen8_pte_encode;
+	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
+		ppgtt->vm.pte_encode = mtl_pte_encode;
+	else
+		ppgtt->vm.pte_encode = gen8_pte_encode;
 
 	ppgtt->vm.bind_async_flags = I915_VMA_LOCAL_BIND;
 	ppgtt->vm.insert_entries = gen8_ppgtt_insert;
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 3c7f1ed92f5b..20915edc8bd9 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -220,6 +220,33 @@ static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)
 	}
 }
 
+static u64 mtl_ggtt_pte_encode(dma_addr_t addr,
+			       enum i915_cache_level level,
+			       u32 flags)
+{
+	gen8_pte_t pte = addr | GEN8_PAGE_PRESENT;
+
+	WARN_ON_ONCE(addr & ~GEN12_GGTT_PTE_ADDR_MASK);
+
+	if (flags & PTE_LM)
+		pte |= GEN12_GGTT_PTE_LM;
+
+	switch (level) {
+	case I915_CACHE_NONE:
+		pte |= MTL_GGTT_PTE_PAT1;
+		break;
+	case I915_CACHE_LLC:
+	case I915_CACHE_L3_LLC:
+		pte |= MTL_GGTT_PTE_PAT0 | MTL_GGTT_PTE_PAT1;
+		break;
+	case I915_CACHE_WT:
+		pte |= MTL_GGTT_PTE_PAT0;
+		break;
+	}
+
+	return pte;
+}
+
 u64 gen8_ggtt_pte_encode(dma_addr_t addr,
 			 enum i915_cache_level level,
 			 u32 flags)
@@ -247,7 +274,7 @@ static void gen8_ggtt_insert_page(struct i915_address_space *vm,
 	gen8_pte_t __iomem *pte =
 		(gen8_pte_t __iomem *)ggtt->gsm + offset / I915_GTT_PAGE_SIZE;
 
-	gen8_set_pte(pte, gen8_ggtt_pte_encode(addr, level, flags));
+	gen8_set_pte(pte, ggtt->vm.pte_encode(addr, level, flags));
 
 	ggtt->invalidate(ggtt);
 }
@@ -257,8 +284,8 @@ static void gen8_ggtt_insert_entries(struct i915_address_space *vm,
 				     enum i915_cache_level level,
 				     u32 flags)
 {
-	const gen8_pte_t pte_encode = gen8_ggtt_pte_encode(0, level, flags);
 	struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
+	const gen8_pte_t pte_encode = ggtt->vm.pte_encode(0, level, flags);
 	gen8_pte_t __iomem *gte;
 	gen8_pte_t __iomem *end;
 	struct sgt_iter iter;
@@ -981,7 +1008,10 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
 	ggtt->vm.vma_ops.bind_vma    = intel_ggtt_bind_vma;
 	ggtt->vm.vma_ops.unbind_vma  = intel_ggtt_unbind_vma;
 
-	ggtt->vm.pte_encode = gen8_ggtt_pte_encode;
+	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
+		ggtt->vm.pte_encode = mtl_ggtt_pte_encode;
+	else
+		ggtt->vm.pte_encode = gen8_ggtt_pte_encode;
 
 	return ggtt_probe_common(ggtt, size);
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index ea17849e7a5c..009968808730 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -88,9 +88,18 @@ typedef u64 gen8_pte_t;
 #define BYT_PTE_SNOOPED_BY_CPU_CACHES	REG_BIT(2)
 #define BYT_PTE_WRITEABLE		REG_BIT(1)
 
+#define MTL_PPGTT_PTE_PAT3	BIT_ULL(62)
 #define GEN12_PPGTT_PTE_LM	BIT_ULL(11)
-
-#define GEN12_GGTT_PTE_LM	BIT_ULL(1)
+#define GEN12_PPGTT_PTE_PAT2	BIT_ULL(7)
+#define GEN12_PPGTT_PTE_NC	BIT_ULL(5)
+#define GEN12_PPGTT_PTE_PAT1	BIT_ULL(4)
+#define GEN12_PPGTT_PTE_PAT0	BIT_ULL(3)
+
+#define GEN12_GGTT_PTE_LM		BIT_ULL(1)
+#define MTL_GGTT_PTE_PAT0		BIT_ULL(52)
+#define MTL_GGTT_PTE_PAT1		BIT_ULL(53)
+#define GEN12_GGTT_PTE_ADDR_MASK	GENMASK_ULL(45, 12)
+#define MTL_GGTT_PTE_PAT_MASK		GENMASK_ULL(53, 52)
 
 #define GEN12_PDE_64K BIT(6)
 #define GEN12_PTE_PS64 BIT(8)
-- 
2.25.1

