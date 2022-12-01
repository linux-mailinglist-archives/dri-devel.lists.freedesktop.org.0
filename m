Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BE763F310
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 15:45:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B8010E05A;
	Thu,  1 Dec 2022 14:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0C710E05A;
 Thu,  1 Dec 2022 14:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669905893; x=1701441893;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0mCXVxXc/7S6z5AMPyPv+GmSs31egbmFUZ3XZwzg2d4=;
 b=Yvzou1CXYLBnti/fefPngtd2ybAGmFCEpLKiyOvtqT6GRqx99/iw3zRP
 s+7bQn6mQeRaD/Qgn96qPyiBs7jY62fGvxsdvYUkBEryKIhprXFNZpRtj
 fOAnCy9JHAAEySQaEcd/aXWqwsYJcgzKrh95WatW+b10yD9AlFLcp574Y
 vWrYyRAMsFe1q3xy3asmBI8F1ihbw+45dSPiwfTDzh89OXu7AdAnG3KJn
 u/I8CYJsoh9ZPPTmzav85q4QMDh9wlqTfjrlbTB6WVbVeBdNEyhqEb6KF
 inVRv5WK4t/V/iSkZY0zwGHU9RPvkVUMTTrqnGf6q5EoryYH4Ux7S8Ula w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="299070430"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="299070430"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 06:44:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="786912835"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="786912835"
Received: from mschmidt-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.212.6])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 06:44:49 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 3/5] drm/i915: Introduce guard pages to i915_vma
Date: Thu,  1 Dec 2022 15:44:46 +0100
Message-Id: <20221201144446.333776-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130235805.221010-4-andi.shyti@linux.intel.com>
References: <20221130235805.221010-4-andi.shyti@linux.intel.com>
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
 Andi Shyti <andi@etezian.org>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Shawn Lee <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Introduce the concept of padding the i915_vma with guard pages before
and after. The major consequence is that all ordinary uses of i915_vma
must use i915_vma_offset/i915_vma_size and not i915_vma.node.start/size
directly, as the drm_mm_node will include the guard pages that surround
our object.

The biggest connundrum is how exactly to mix requesting a fixed address
with guard pages, particularly through the existing uABI. The user does
not know about guard pages, so such must be transparent to the user, and
so the execobj.offset must be that of the object itself excluding the
guard. So a PIN_OFFSET_FIXED must then be exclusive of the guard pages.
The caveat is that some placements will be impossible with guard pages,
as wrap arounds need to be avoided, and the vma itself will require a
larger node. We must not report EINVAL but ENOSPC as these are unavailable
locations within the GTT rather than conflicting user requirements.

In the next patch, we start using guard pages for scanout objects. While
these are limited to GGTT vma, on a few platforms these vma (or at least
an alias of the vma) is shared with userspace, so we may leak the
existence of such guards if we are not careful to ensure that the
execobj.offset is transparent and excludes the guards. (On such platforms
like ivb, without full-ppgtt, userspace has to use relocations so the
presence of more untouchable regions within its GTT such be of no further
issue.)

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
Hi,

this the v5 changelog, the overall changelog is in the v4 cover letter:

v4 -> v5:
 - remove again the GEM_BUG_ON()
 - fix an oversight where the rounding was called without assigning the
   value to the guard.

Thanks Tvrtko for the reviews.

Thanks,
Andi

 drivers/gpu/drm/i915/gt/intel_ggtt.c     | 14 +++++---
 drivers/gpu/drm/i915/i915_gem_gtt.h      |  3 +-
 drivers/gpu/drm/i915/i915_vma.c          | 41 ++++++++++++++++++++----
 drivers/gpu/drm/i915/i915_vma.h          |  5 +--
 drivers/gpu/drm/i915/i915_vma_resource.c |  4 +--
 drivers/gpu/drm/i915/i915_vma_resource.h |  7 +++-
 drivers/gpu/drm/i915/i915_vma_types.h    |  1 +
 7 files changed, 58 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 7644738b9cdbe..784d4a8c43ba9 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -296,8 +296,11 @@ static void gen8_ggtt_insert_entries(struct i915_address_space *vm,
 	 */
 
 	gte = (gen8_pte_t __iomem *)ggtt->gsm;
-	gte += vma_res->start / I915_GTT_PAGE_SIZE;
-	end = gte + vma_res->node_size / I915_GTT_PAGE_SIZE;
+	gte += (vma_res->start - vma_res->guard) / I915_GTT_PAGE_SIZE;
+	end = gte + vma_res->guard / I915_GTT_PAGE_SIZE;
+	while (gte < end)
+		gen8_set_pte(gte++, vm->scratch[0]->encode);
+	end += (vma_res->node_size + vma_res->guard) / I915_GTT_PAGE_SIZE;
 
 	for_each_sgt_daddr(addr, iter, vma_res->bi.pages)
 		gen8_set_pte(gte++, pte_encode | addr);
@@ -347,9 +350,12 @@ static void gen6_ggtt_insert_entries(struct i915_address_space *vm,
 	dma_addr_t addr;
 
 	gte = (gen6_pte_t __iomem *)ggtt->gsm;
-	gte += vma_res->start / I915_GTT_PAGE_SIZE;
-	end = gte + vma_res->node_size / I915_GTT_PAGE_SIZE;
+	gte += (vma_res->start - vma_res->guard) / I915_GTT_PAGE_SIZE;
 
+	end = gte + vma_res->guard / I915_GTT_PAGE_SIZE;
+	while (gte < end)
+		iowrite32(vm->scratch[0]->encode, gte++);
+	end += (vma_res->node_size + vma_res->guard) / I915_GTT_PAGE_SIZE;
 	for_each_sgt_daddr(addr, iter, vma_res->bi.pages)
 		iowrite32(vm->pte_encode(addr, level, flags), gte++);
 	GEM_BUG_ON(gte > end);
diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.h b/drivers/gpu/drm/i915/i915_gem_gtt.h
index 8c2f57eb5ddaa..2434197830523 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.h
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.h
@@ -44,7 +44,8 @@ int i915_gem_gtt_insert(struct i915_address_space *vm,
 #define PIN_HIGH		BIT_ULL(5)
 #define PIN_OFFSET_BIAS		BIT_ULL(6)
 #define PIN_OFFSET_FIXED	BIT_ULL(7)
-#define PIN_VALIDATE		BIT_ULL(8) /* validate placement only, no need to call unpin() */
+#define PIN_OFFSET_GUARD	BIT_ULL(8)
+#define PIN_VALIDATE		BIT_ULL(9) /* validate placement only, no need to call unpin() */
 
 #define PIN_GLOBAL		BIT_ULL(10) /* I915_VMA_GLOBAL_BIND */
 #define PIN_USER		BIT_ULL(11) /* I915_VMA_LOCAL_BIND */
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index fefee5fef38d3..cda90c7818af3 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -419,7 +419,7 @@ i915_vma_resource_init_from_vma(struct i915_vma_resource *vma_res,
 			       obj->mm.rsgt, i915_gem_object_is_readonly(obj),
 			       i915_gem_object_is_lmem(obj), obj->mm.region,
 			       vma->ops, vma->private, __i915_vma_offset(vma),
-			       __i915_vma_size(vma), vma->size);
+			       __i915_vma_size(vma), vma->size, vma->guard);
 }
 
 /**
@@ -677,6 +677,10 @@ bool i915_vma_misplaced(const struct i915_vma *vma,
 	    i915_vma_offset(vma) != (flags & PIN_OFFSET_MASK))
 		return true;
 
+	if (flags & PIN_OFFSET_GUARD &&
+	    vma->guard < (flags & PIN_OFFSET_MASK))
+		return true;
+
 	return false;
 }
 
@@ -749,15 +753,16 @@ static int
 i915_vma_insert(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 		u64 size, u64 alignment, u64 flags)
 {
-	unsigned long color;
+	unsigned long color, guard;
 	u64 start, end;
 	int ret;
 
 	GEM_BUG_ON(i915_vma_is_bound(vma, I915_VMA_GLOBAL_BIND | I915_VMA_LOCAL_BIND));
 	GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
+	GEM_BUG_ON(hweight64(flags & (PIN_OFFSET_GUARD | PIN_OFFSET_FIXED | PIN_OFFSET_BIAS)) > 1);
 
 	size = max(size, vma->size);
-	alignment = max(alignment, vma->display_alignment);
+	alignment = max_t(typeof(alignment), alignment, vma->display_alignment);
 	if (flags & PIN_MAPPABLE) {
 		size = max_t(typeof(size), size, vma->fence_size);
 		alignment = max_t(typeof(alignment),
@@ -768,6 +773,16 @@ i915_vma_insert(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	GEM_BUG_ON(!IS_ALIGNED(alignment, I915_GTT_MIN_ALIGNMENT));
 	GEM_BUG_ON(!is_power_of_2(alignment));
 
+	guard = vma->guard; /* retain guard across rebinds */
+	if (flags & PIN_OFFSET_GUARD) {
+		GEM_BUG_ON(overflows_type(flags & PIN_OFFSET_MASK, u32));
+		guard = max_t(u32, guard, flags & PIN_OFFSET_MASK);
+	}
+	/*
+	 * Be efficient with PTE use by using the native size for the guard.
+	 */
+	guard = roundup(guard, BIT(vma->vm->scratch_order + PAGE_SHIFT));
+
 	start = flags & PIN_OFFSET_BIAS ? flags & PIN_OFFSET_MASK : 0;
 	GEM_BUG_ON(!IS_ALIGNED(start, I915_GTT_PAGE_SIZE));
 
@@ -780,11 +795,12 @@ i915_vma_insert(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 
 	alignment = max(alignment, i915_vm_obj_min_alignment(vma->vm, vma->obj));
 
-	/* If binding the object/GGTT view requires more space than the entire
+	/*
+	 * If binding the object/GGTT view requires more space than the entire
 	 * aperture has, reject it early before evicting everything in a vain
 	 * attempt to find space.
 	 */
-	if (size > end) {
+	if (size > end - 2 * guard) {
 		drm_dbg(&to_i915(vma->obj->base.dev)->drm,
 			"Attempting to bind an object larger than the aperture: request=%llu > %s aperture=%llu\n",
 			size, flags & PIN_MAPPABLE ? "mappable" : "total", end);
@@ -801,13 +817,23 @@ i915_vma_insert(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 		if (!IS_ALIGNED(offset, alignment) ||
 		    range_overflows(offset, size, end))
 			return -EINVAL;
+		/*
+		 * The caller knows not of the guard added by others and
+		 * requests for the offset of the start of its buffer
+		 * to be fixed, which may not be the same as the position
+		 * of the vma->node due to the guard pages.
+		 */
+		if (offset < guard || offset + size > end - guard)
+			return -ENOSPC;
 
 		ret = i915_gem_gtt_reserve(vma->vm, ww, &vma->node,
-					   size, offset, color,
-					   flags);
+					   size + 2 * guard,
+					   offset - guard,
+					   color, flags);
 		if (ret)
 			return ret;
 	} else {
+		size += 2 * guard;
 		/*
 		 * We only support huge gtt pages through the 48b PPGTT,
 		 * however we also don't want to force any alignment for
@@ -855,6 +881,7 @@ i915_vma_insert(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	GEM_BUG_ON(!i915_gem_valid_gtt_space(vma, color));
 
 	list_move_tail(&vma->vm_link, &vma->vm->bound_list);
+	vma->guard = guard;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index 3fd4512b1f65f..ed5c9d682a1b2 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -128,7 +128,7 @@ static inline bool i915_vma_is_closed(const struct i915_vma *vma)
 /* Internal use only. */
 static inline u64 __i915_vma_size(const struct i915_vma *vma)
 {
-	return vma->node.size;
+	return vma->node.size - 2 * vma->guard;
 }
 
 /**
@@ -150,7 +150,8 @@ static inline u64 i915_vma_size(const struct i915_vma *vma)
 /* Internal use only. */
 static inline u64 __i915_vma_offset(const struct i915_vma *vma)
 {
-	return vma->node.start;
+	/* The actual start of the vma->pages is after the guard pages. */
+	return vma->node.start + vma->guard;
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/i915_vma_resource.c b/drivers/gpu/drm/i915/i915_vma_resource.c
index de1342dbfa128..6ba7a7feceba1 100644
--- a/drivers/gpu/drm/i915/i915_vma_resource.c
+++ b/drivers/gpu/drm/i915/i915_vma_resource.c
@@ -34,8 +34,8 @@ static struct kmem_cache *slab_vma_resources;
  * and removal of fences increases as O(ln(pending_unbinds)) instead of
  * O(1) for a single fence without interval tree.
  */
-#define VMA_RES_START(_node) ((_node)->start)
-#define VMA_RES_LAST(_node) ((_node)->start + (_node)->node_size - 1)
+#define VMA_RES_START(_node) ((_node)->start - (_node)->guard)
+#define VMA_RES_LAST(_node) ((_node)->start + (_node)->node_size + (_node)->guard - 1)
 INTERVAL_TREE_DEFINE(struct i915_vma_resource, rb,
 		     u64, __subtree_last,
 		     VMA_RES_START, VMA_RES_LAST, static, vma_res_itree);
diff --git a/drivers/gpu/drm/i915/i915_vma_resource.h b/drivers/gpu/drm/i915/i915_vma_resource.h
index 54edf3739ca0b..c1864e3d0b43e 100644
--- a/drivers/gpu/drm/i915/i915_vma_resource.h
+++ b/drivers/gpu/drm/i915/i915_vma_resource.h
@@ -57,6 +57,7 @@ struct i915_page_sizes {
  * @node_size: Size of the allocated range manager node with padding
  * subtracted.
  * @vma_size: Bind size.
+ * @guard: The size of guard area preceding and trailing the bind.
  * @page_sizes_gtt: Resulting page sizes from the bind operation.
  * @bound_flags: Flags indicating binding status.
  * @allocated: Backend private data. TODO: Should move into @private.
@@ -115,6 +116,7 @@ struct i915_vma_resource {
 	u64 start;
 	u64 node_size;
 	u64 vma_size;
+	u32 guard;
 	u32 page_sizes_gtt;
 
 	u32 bound_flags;
@@ -179,6 +181,7 @@ static inline void i915_vma_resource_put(struct i915_vma_resource *vma_res)
  * @start: Offset into the address space of bind range start after padding.
  * @node_size: Size of the allocated range manager node minus padding.
  * @size: Bind size.
+ * @guard: The size of the guard area preceding and trailing the bind.
  *
  * Initializes a vma resource allocated using i915_vma_resource_alloc().
  * The reason for having separate allocate and initialize function is that
@@ -197,7 +200,8 @@ static inline void i915_vma_resource_init(struct i915_vma_resource *vma_res,
 					  void *private,
 					  u64 start,
 					  u64 node_size,
-					  u64 size)
+					  u64 size,
+					  u32 guard)
 {
 	__i915_vma_resource_init(vma_res);
 	vma_res->vm = vm;
@@ -215,6 +219,7 @@ static inline void i915_vma_resource_init(struct i915_vma_resource *vma_res,
 	vma_res->start = start;
 	vma_res->node_size = node_size;
 	vma_res->vma_size = size;
+	vma_res->guard = guard;
 }
 
 static inline void i915_vma_resource_fini(struct i915_vma_resource *vma_res)
diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
index 0375812792b9c..77fda2244d161 100644
--- a/drivers/gpu/drm/i915/i915_vma_types.h
+++ b/drivers/gpu/drm/i915/i915_vma_types.h
@@ -202,6 +202,7 @@ struct i915_vma {
 	/* mmap-offset associated with fencing for this vma */
 	struct i915_mmap_offset	*mmo;
 
+	u32 guard; /* padding allocated around vma->pages within the node */
 	u32 fence_size;
 	u32 fence_alignment;
 	u32 display_alignment;
-- 
2.38.1

