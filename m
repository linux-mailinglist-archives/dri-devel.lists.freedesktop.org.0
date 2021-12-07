Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0F946C103
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 17:52:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9AD2EBEA8;
	Tue,  7 Dec 2021 16:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86A9EBEA7;
 Tue,  7 Dec 2021 16:52:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="224882445"
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="224882445"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 08:52:25 -0800
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="611740141"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 08:52:23 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/i915/gtt/xehpsdv: move scratch page to system memory
Date: Tue,  7 Dec 2021 22:21:55 +0530
Message-Id: <20211207165156.31244-4-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211207165156.31244-1-ramalingam.c@intel.com>
References: <20211207165156.31244-1-ramalingam.c@intel.com>
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>, Andi <andi.shyti@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Chris_intel_ID <chris.p.wilson@intel.com>
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
 drivers/gpu/drm/i915/gt/intel_ggtt.c      |  3 +++
 drivers/gpu/drm/i915/gt/intel_gtt.c       |  2 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h       |  2 ++
 drivers/gpu/drm/i915/selftests/mock_gtt.c |  2 ++
 6 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
index 4a166d25fe60..c0d149f04949 100644
--- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
@@ -454,6 +454,7 @@ struct i915_ppgtt *gen6_ppgtt_create(struct intel_gt *gt)
 	ppgtt->base.vm.cleanup = gen6_ppgtt_cleanup;
 
 	ppgtt->base.vm.alloc_pt_dma = alloc_pt_dma;
+	ppgtt->base.vm.alloc_scratch_dma = alloc_pt_dma;
 	ppgtt->base.vm.pte_encode = ggtt->vm.pte_encode;
 
 	err = gen6_ppgtt_init_scratch(ppgtt);
diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index 95c02096a61b..b012c50f7ce7 100644
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
index cbc6d2b1fd9e..d85a1050f4a8 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -941,6 +941,7 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
 		size = gen8_get_total_gtt_size(snb_gmch_ctl);
 
 	ggtt->vm.alloc_pt_dma = alloc_pt_dma;
+	ggtt->vm.alloc_scratch_dma = alloc_pt_dma;
 	ggtt->vm.lmem_pt_obj_flags = I915_BO_ALLOC_PM_EARLY;
 
 	ggtt->vm.total = (size / sizeof(gen8_pte_t)) * I915_GTT_PAGE_SIZE;
@@ -1094,6 +1095,7 @@ static int gen6_gmch_probe(struct i915_ggtt *ggtt)
 	ggtt->vm.total = (size / sizeof(gen6_pte_t)) * I915_GTT_PAGE_SIZE;
 
 	ggtt->vm.alloc_pt_dma = alloc_pt_dma;
+	ggtt->vm.alloc_scratch_dma = alloc_pt_dma;
 
 	ggtt->vm.clear_range = nop_clear_range;
 	if (!HAS_FULL_PPGTT(i915) || intel_scanout_needs_vtd_wa(i915))
@@ -1146,6 +1148,7 @@ static int i915_gmch_probe(struct i915_ggtt *ggtt)
 		(struct resource)DEFINE_RES_MEM(gmadr_base, ggtt->mappable_end);
 
 	ggtt->vm.alloc_pt_dma = alloc_pt_dma;
+	ggtt->vm.alloc_scratch_dma = alloc_pt_dma;
 
 	if (needs_idle_maps(i915)) {
 		drm_notice(&i915->drm,
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 0dd254cb1f69..1428e2b9075a 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -301,7 +301,7 @@ int setup_scratch_page(struct i915_address_space *vm)
 	do {
 		struct drm_i915_gem_object *obj;
 
-		obj = vm->alloc_pt_dma(vm, size);
+		obj = vm->alloc_scratch_dma(vm, size);
 		if (IS_ERR(obj))
 			goto skip;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 51afe66d00f2..15b98321e89a 100644
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

