Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D3B6231A8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 18:42:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E35B10E602;
	Wed,  9 Nov 2022 17:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B78610E037;
 Wed,  9 Nov 2022 17:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668015710; x=1699551710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uAGDH9PuqxF6ycW7WSyrsen5/J8zVaN0bhXpH/QU44g=;
 b=QK+OwdVe2VQ0d6dfgzlyXdMh9qlxvupR8EMWY+bB0ox2FeNyIVYLzsGF
 YX8588ojwW+l8TwphfcXkfcWDGjVXlg52CWtXJDHtvBhbWLG+XndeSM1/
 OgIlxu3dHfoN70uvExHL7iBJ3kjRVhXNqSAoqYMjIVDLud9dFbnol3Aat
 sMrTrv1XVP0v/nbniNnMHljlriEZ8IV7mUXGSaqGzCoj49JnXh/mgsqF9
 nQOlsxAvfJOVkapZ6YbhVO+D524gO6049/+AiTOtMS+NQ+bR8WHbt1mPF
 Mr1PTFbIdXAj2NLzMCqrkgBHpZ0NQciCoon9PlM8sFpLJQemDlldUr0VK Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="373196431"
X-IronPort-AV: E=Sophos;i="5.96,151,1665471600"; d="scan'208";a="373196431"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 09:41:45 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="726061740"
X-IronPort-AV: E=Sophos;i="5.96,151,1665471600"; d="scan'208";a="726061740"
Received: from dvorobye-mobl.ccr.corp.intel.com (HELO intel.com)
 ([10.252.32.169])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 09:41:41 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915: Refine VT-d scanout workaround
Date: Wed,  9 Nov 2022 18:40:58 +0100
Message-Id: <20221109174058.912720-4-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221109174058.912720-1-andi.shyti@linux.intel.com>
References: <20221109174058.912720-1-andi.shyti@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

VT-d may cause overfetch of the scanout PTE, both before and after the
vma (depending on the scanout orientation). bspec recommends that we
provide a tile-row in either directions, and suggests using 168 PTE,
warning that the accesses will wrap around the ends of the GGTT.
Currently, we fill the entire GGTT with scratch pages when using VT-d to
always ensure there are valid entries around every vma, including
scanout. However, writing every PTE is slow as on recent devices we
perform 8MiB of uncached writes, incurring an extra 100ms during resume.

If instead we focus on only putting guard pages around scanout, we can
avoid touching the whole GGTT. To avoid having to introduce extra nodes
around each scanout vma, we adjust the scanout drm_mm_node to be smaller
than the allocated space, and fixup the extra PTE during dma binding.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_domain.c | 13 +++++++++++
 drivers/gpu/drm/i915/gt/intel_ggtt.c       | 25 +---------------------
 drivers/gpu/drm/i915/i915_vma.c            |  9 ++++++++
 3 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
index d44a152ce6800..882b91519f92b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
@@ -17,6 +17,8 @@
 #include "i915_gem_object.h"
 #include "i915_vma.h"
 
+#define VTD_GUARD (168u * I915_GTT_PAGE_SIZE) /* 168 or tile-row PTE padding */
+
 static bool gpu_write_needs_clflush(struct drm_i915_gem_object *obj)
 {
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
@@ -424,6 +426,17 @@ i915_gem_object_pin_to_display_plane(struct drm_i915_gem_object *obj,
 	if (ret)
 		return ERR_PTR(ret);
 
+	/* VT-d may overfetch before/after the vma, so pad with scratch */
+	if (intel_scanout_needs_vtd_wa(i915)) {
+		unsigned int guard = VTD_GUARD;
+
+		if (i915_gem_object_is_tiled(obj))
+			guard = max(guard,
+				    i915_gem_object_get_tile_row_size(obj));
+
+		flags |= PIN_OFFSET_GUARD | guard;
+	}
+
 	/*
 	 * As the user may map the buffer once pinned in the display plane
 	 * (e.g. libkms for the bootup splash), we have to ensure that we
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 0dd81b18716c3..b0acb645a6de6 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -367,27 +367,6 @@ static void nop_clear_range(struct i915_address_space *vm,
 {
 }
 
-static void gen8_ggtt_clear_range(struct i915_address_space *vm,
-				  u64 start, u64 length)
-{
-	struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
-	unsigned int first_entry = start / I915_GTT_PAGE_SIZE;
-	unsigned int num_entries = length / I915_GTT_PAGE_SIZE;
-	const gen8_pte_t scratch_pte = vm->scratch[0]->encode;
-	gen8_pte_t __iomem *gtt_base =
-		(gen8_pte_t __iomem *)ggtt->gsm + first_entry;
-	const int max_entries = ggtt_total_entries(ggtt) - first_entry;
-	int i;
-
-	if (WARN(num_entries > max_entries,
-		 "First entry = %d; Num entries = %d (max=%d)\n",
-		 first_entry, num_entries, max_entries))
-		num_entries = max_entries;
-
-	for (i = 0; i < num_entries; i++)
-		gen8_set_pte(&gtt_base[i], scratch_pte);
-}
-
 static void bxt_vtd_ggtt_wa(struct i915_address_space *vm)
 {
 	/*
@@ -959,8 +938,6 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
 	ggtt->vm.cleanup = gen6_gmch_remove;
 	ggtt->vm.insert_page = gen8_ggtt_insert_page;
 	ggtt->vm.clear_range = nop_clear_range;
-	if (intel_scanout_needs_vtd_wa(i915))
-		ggtt->vm.clear_range = gen8_ggtt_clear_range;
 
 	ggtt->vm.insert_entries = gen8_ggtt_insert_entries;
 
@@ -1121,7 +1098,7 @@ static int gen6_gmch_probe(struct i915_ggtt *ggtt)
 	ggtt->vm.alloc_scratch_dma = alloc_pt_dma;
 
 	ggtt->vm.clear_range = nop_clear_range;
-	if (!HAS_FULL_PPGTT(i915) || intel_scanout_needs_vtd_wa(i915))
+	if (!HAS_FULL_PPGTT(i915))
 		ggtt->vm.clear_range = gen6_ggtt_clear_range;
 	ggtt->vm.insert_page = gen6_ggtt_insert_page;
 	ggtt->vm.insert_entries = gen6_ggtt_insert_entries;
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index ff24a654565f6..973abe56cbaa0 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -675,6 +675,10 @@ bool i915_vma_misplaced(const struct i915_vma *vma,
 	    i915_vma_offset(vma) != (flags & PIN_OFFSET_MASK))
 		return true;
 
+	if (flags & PIN_OFFSET_GUARD &&
+	    vma->guard < (flags & PIN_OFFSET_MASK))
+		return true;
+
 	return false;
 }
 
@@ -753,6 +757,7 @@ i915_vma_insert(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 
 	GEM_BUG_ON(i915_vma_is_bound(vma, I915_VMA_GLOBAL_BIND | I915_VMA_LOCAL_BIND));
 	GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
+	GEM_BUG_ON(hweight64(flags & (PIN_OFFSET_GUARD | PIN_OFFSET_FIXED | PIN_OFFSET_BIAS)) > 1);
 
 	size = max(size, vma->size);
 	alignment = max_t(typeof(alignment), alignment, vma->display_alignment);
@@ -767,6 +772,10 @@ i915_vma_insert(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	GEM_BUG_ON(!is_power_of_2(alignment));
 
 	guard = vma->guard; /* retain guard across rebinds */
+	if (flags & PIN_OFFSET_GUARD) {
+		GEM_BUG_ON(overflows_type(flags & PIN_OFFSET_MASK, u32));
+		guard = max_t(u32, guard, flags & PIN_OFFSET_MASK);
+	}
 	guard = ALIGN(guard, alignment);
 
 	start = flags & PIN_OFFSET_BIAS ? flags & PIN_OFFSET_MASK : 0;
-- 
2.37.2

