Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DD843D494
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 23:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF6A6E90A;
	Wed, 27 Oct 2021 21:21:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48FE56E909;
 Wed, 27 Oct 2021 21:21:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="229020851"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="229020851"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 14:21:05 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="665154136"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 14:21:02 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ramalingam C <ramalingam.c@intel.com>
Subject: [PATCH v3 05/17] drm/i915/gtt/xehpsdv: move scratch page to system
 memory
Date: Thu, 28 Oct 2021 02:53:27 +0530
Message-Id: <20211027212339.29259-6-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027212339.29259-1-ramalingam.c@intel.com>
References: <20211027212339.29259-1-ramalingam.c@intel.com>
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

From: Matthew Auld <matthew.auld@intel.com>

On some platforms the hw has dropped support for 4K GTT pages when
dealing with LMEM, and due to the design of 64K GTT pages in the hw, we
can only mark the *entire* page-table as operating in 64K GTT mode,
since the enable bit is still on the pde, and not the pte. And since we
we still need to allow 4K GTT pages for SMEM objects, we can't have a
"normal" 4K page-table with scratch pointing to LMEM, since that's
undefined from the hw pov. The simplest solution is to just move the 64K
scratch page to SMEM on such platforms and call it a day, since that
should work for all configurations.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c      |  1 +
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c      | 23 +++++++++++++++++++++--
 drivers/gpu/drm/i915/gt/intel_ggtt.c      |  2 ++
 drivers/gpu/drm/i915/gt/intel_gtt.c       |  2 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h       |  2 ++
 drivers/gpu/drm/i915/selftests/mock_gtt.c |  2 ++
 6 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
index baea9770200a..d410a7bf5add 100644
--- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
@@ -439,6 +439,7 @@ struct i915_ppgtt *gen6_ppgtt_create(struct intel_gt *gt)
 	ppgtt->base.vm.cleanup = gen6_ppgtt_cleanup;
 
 	ppgtt->base.vm.alloc_pt_dma = alloc_pt_dma;
+	ppgtt->base.vm.alloc_scratch_dma = alloc_pt_dma;
 	ppgtt->base.vm.pte_encode = ggtt->vm.pte_encode;
 
 	ppgtt->base.pd = __alloc_pd(I915_PDES);
diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index 8af2f709571c..4333652d8906 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -776,10 +776,29 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt,
 	 */
 	ppgtt->vm.has_read_only = !IS_GRAPHICS_VER(gt->i915, 11, 12);
 
-	if (HAS_LMEM(gt->i915))
+	if (HAS_LMEM(gt->i915)) {
 		ppgtt->vm.alloc_pt_dma = alloc_pt_lmem;
-	else
+
+		/*
+		 * On some platforms the hw has dropped support for 4K GTT pages
+		 * when dealing with LMEM, and due to the design of 64K GTT
+		 * pages in the hw, we can only mark the *entire* page-table as
+		 * operating in 64K GTT mode, since the enable bit is still on
+		 * the pde, and not the pte. And since we still need to allow
+		 * 4K GTT pages for SMEM objects, we can't have a "normal" 4K
+		 * page-table with scratch pointing to LMEM, since that's
+		 * undefined from the hw pov. The simplest solution is to just
+		 * move the 64K scratch page to SMEM on such platforms and call
+		 * it a day, since that should work for all configurations.
+		 */
+		if (HAS_64K_PAGES(gt->i915))
+			ppgtt->vm.alloc_scratch_dma = alloc_pt_dma;
+		else
+			ppgtt->vm.alloc_scratch_dma = alloc_pt_lmem;
+	} else {
 		ppgtt->vm.alloc_pt_dma = alloc_pt_dma;
+		ppgtt->vm.alloc_scratch_dma = alloc_pt_dma;
+	}
 
 	err = gen8_init_scratch(&ppgtt->vm);
 	if (err)
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index f17383e76eb7..289316007029 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -1077,6 +1077,7 @@ static int gen6_gmch_probe(struct i915_ggtt *ggtt)
 	ggtt->vm.total = (size / sizeof(gen6_pte_t)) * I915_GTT_PAGE_SIZE;
 
 	ggtt->vm.alloc_pt_dma = alloc_pt_dma;
+	ggtt->vm.alloc_scratch_dma = alloc_pt_dma;
 
 	ggtt->vm.clear_range = nop_clear_range;
 	if (!HAS_FULL_PPGTT(i915) || intel_scanout_needs_vtd_wa(i915))
@@ -1129,6 +1130,7 @@ static int i915_gmch_probe(struct i915_ggtt *ggtt)
 		(struct resource)DEFINE_RES_MEM(gmadr_base, ggtt->mappable_end);
 
 	ggtt->vm.alloc_pt_dma = alloc_pt_dma;
+	ggtt->vm.alloc_scratch_dma = alloc_pt_dma;
 
 	if (needs_idle_maps(i915)) {
 		drm_notice(&i915->drm,
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index d05f762c50d8..4743921b7638 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -307,7 +307,7 @@ int setup_scratch_page(struct i915_address_space *vm)
 	do {
 		struct drm_i915_gem_object *obj;
 
-		obj = vm->alloc_pt_dma(vm, size);
+		obj = vm->alloc_scratch_dma(vm, size);
 		if (IS_ERR(obj))
 			goto skip;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 094bee934740..180da7c7f3f9 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -268,6 +268,8 @@ struct i915_address_space {
 
 	struct drm_i915_gem_object *
 		(*alloc_pt_dma)(struct i915_address_space *vm, int sz);
+	struct drm_i915_gem_object *
+		(*alloc_scratch_dma)(struct i915_address_space *vm, int sz);
 
 	u64 (*pte_encode)(dma_addr_t addr,
 			  enum i915_cache_level level,
diff --git a/drivers/gpu/drm/i915/selftests/mock_gtt.c b/drivers/gpu/drm/i915/selftests/mock_gtt.c
index cc047ec594f9..32ca8962d0ab 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gtt.c
@@ -78,6 +78,7 @@ struct i915_ppgtt *mock_ppgtt(struct drm_i915_private *i915, const char *name)
 	i915_address_space_init(&ppgtt->vm, VM_CLASS_PPGTT);
 
 	ppgtt->vm.alloc_pt_dma = alloc_pt_dma;
+	ppgtt->vm.alloc_scratch_dma = alloc_pt_dma;
 
 	ppgtt->vm.clear_range = mock_clear_range;
 	ppgtt->vm.insert_page = mock_insert_page;
@@ -118,6 +119,7 @@ void mock_init_ggtt(struct drm_i915_private *i915, struct i915_ggtt *ggtt)
 	ggtt->vm.total = 4096 * PAGE_SIZE;
 
 	ggtt->vm.alloc_pt_dma = alloc_pt_dma;
+	ggtt->vm.alloc_scratch_dma = alloc_pt_dma;
 
 	ggtt->vm.clear_range = mock_clear_range;
 	ggtt->vm.insert_page = mock_insert_page;
-- 
2.20.1

