Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDE543D499
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 23:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D3B6E90F;
	Wed, 27 Oct 2021 21:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32CA6E90F;
 Wed, 27 Oct 2021 21:21:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="229020865"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="229020865"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 14:21:10 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="665154154"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 14:21:08 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ramalingam C <ramalingam.c@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 07/17] drm/i915/xehpsdv: implement memory coloring
Date: Thu, 28 Oct 2021 02:53:29 +0530
Message-Id: <20211027212339.29259-8-ramalingam.c@intel.com>
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

The basic idea is that each 2M block(page-table) has a color, depending
on if the page-table is occupied by LMEM objects(64K) or SMEM
objects(4K), where our goal is to prevent mixing 64K and 4K GTT pages in
the page-table, which is not supported by the HW.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c  | 16 ++++++++++
 drivers/gpu/drm/i915/gt/intel_gtt.h   |  6 ++++
 drivers/gpu/drm/i915/i915_gem_evict.c | 17 ++++++++++
 drivers/gpu/drm/i915/i915_vma.c       | 46 +++++++++++++++++++--------
 4 files changed, 71 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index 6b39b1ea0627..c931f3068804 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -463,6 +463,19 @@ gen8_ppgtt_insert_pte(struct i915_ppgtt *ppgtt,
 	return idx;
 }
 
+static void xehpsdv_ppgtt_color_adjust(const struct drm_mm_node *node,
+				       unsigned long color,
+				       u64 *start,
+				       u64 *end)
+{
+	if (i915_node_color_differs(node, color))
+		*start = round_up(*start, SZ_2M);
+
+	node = list_next_entry(node, node_list);
+	if (i915_node_color_differs(node, color))
+		*end = round_down(*end, SZ_2M);
+}
+
 static void
 xehpsdv_ppgtt_insert_huge(struct i915_vma *vma,
 			  struct sgt_dma *iter,
@@ -900,6 +913,9 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt,
 		ppgtt->vm.alloc_scratch_dma = alloc_pt_dma;
 	}
 
+	if (HAS_64K_PAGES(gt->i915))
+		ppgtt->vm.mm.color_adjust = xehpsdv_ppgtt_color_adjust;
+
 	err = gen8_init_scratch(&ppgtt->vm);
 	if (err)
 		goto err_free;
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 20101eef4c95..34696acde342 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -397,6 +397,12 @@ i915_vm_has_cache_coloring(struct i915_address_space *vm)
 	return i915_is_ggtt(vm) && vm->mm.color_adjust;
 }
 
+static inline bool
+i915_vm_has_memory_coloring(struct i915_address_space *vm)
+{
+	return !i915_is_ggtt(vm) && vm->mm.color_adjust;
+}
+
 static inline struct i915_ggtt *
 i915_vm_to_ggtt(struct i915_address_space *vm)
 {
diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
index 2b73ddb11c66..006bf4924c24 100644
--- a/drivers/gpu/drm/i915/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/i915_gem_evict.c
@@ -292,6 +292,13 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
 
 		/* Always look at the page afterwards to avoid the end-of-GTT */
 		end += I915_GTT_PAGE_SIZE;
+	} else if (i915_vm_has_memory_coloring(vm)) {
+		/*
+		 * Expand the search the cover the page-table boundries, in
+		 * case we need to flip the color of the page-table(s).
+		 */
+		start = round_down(start, SZ_2M);
+		end = round_up(end, SZ_2M);
 	}
 	GEM_BUG_ON(start >= end);
 
@@ -321,6 +328,16 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
 				if (node->color == target->color)
 					continue;
 			}
+		} else if (i915_vm_has_memory_coloring(vm)) {
+			if (node->start + node->size <= target->start) {
+				if (node->color == target->color)
+					continue;
+			}
+
+			if (node->start >= target->start + target->size) {
+				if (node->color == target->color)
+					continue;
+			}
 		}
 
 		if (i915_vma_is_pinned(vma)) {
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index c31b4bc8af16..92b124ecc38c 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -585,6 +585,10 @@ bool i915_gem_valid_gtt_space(struct i915_vma *vma, unsigned long color)
 	struct drm_mm_node *node = &vma->node;
 	struct drm_mm_node *other;
 
+	/* Only valid to be called on an already inserted vma */
+	GEM_BUG_ON(!drm_mm_node_allocated(node));
+	GEM_BUG_ON(list_empty(&node->node_list));
+
 	/*
 	 * On some machines we have to be careful when putting differing types
 	 * of snoopable memory together to avoid the prefetcher crossing memory
@@ -592,22 +596,34 @@ bool i915_gem_valid_gtt_space(struct i915_vma *vma, unsigned long color)
 	 * these constraints apply and set the drm_mm.color_adjust
 	 * appropriately.
 	 */
-	if (!i915_vm_has_cache_coloring(vma->vm))
-		return true;
-
-	/* Only valid to be called on an already inserted vma */
-	GEM_BUG_ON(!drm_mm_node_allocated(node));
-	GEM_BUG_ON(list_empty(&node->node_list));
+	if (i915_vm_has_cache_coloring(vma->vm)) {
+		other = list_prev_entry(node, node_list);
+		if (i915_node_color_differs(other, color) &&
+		    !drm_mm_hole_follows(other))
+			return false;
 
-	other = list_prev_entry(node, node_list);
-	if (i915_node_color_differs(other, color) &&
-	    !drm_mm_hole_follows(other))
-		return false;
+		other = list_next_entry(node, node_list);
+		if (i915_node_color_differs(other, color) &&
+		    !drm_mm_hole_follows(node))
+			return false;
+	/*
+	 * On XEHPSDV we need to make sure we are not mixing LMEM and SMEM objects
+	 * in the same page-table, i.e mixing 64K and 4K gtt pages in the same
+	 * page-table.
+	 */
+	} else if (i915_vm_has_memory_coloring(vma->vm)) {
+		other = list_prev_entry(node, node_list);
+		if (i915_node_color_differs(other, color) &&
+		    !drm_mm_hole_follows(other) &&
+		    !IS_ALIGNED(other->start + other->size, SZ_2M))
+			return false;
 
-	other = list_next_entry(node, node_list);
-	if (i915_node_color_differs(other, color) &&
-	    !drm_mm_hole_follows(node))
-		return false;
+		other = list_next_entry(node, node_list);
+		if (i915_node_color_differs(other, color) &&
+		    !drm_mm_hole_follows(node) &&
+		    !IS_ALIGNED(other->start, SZ_2M))
+			return false;
+	}
 
 	return true;
 }
@@ -676,6 +692,8 @@ i915_vma_insert(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
 
 		if (i915_vm_has_cache_coloring(vma->vm))
 			color = vma->obj->cache_level;
+		else if (i915_vm_has_memory_coloring(vma->vm))
+			color = i915_gem_object_is_lmem(vma->obj);
 	}
 
 	if (flags & PIN_OFFSET_FIXED) {
-- 
2.20.1

