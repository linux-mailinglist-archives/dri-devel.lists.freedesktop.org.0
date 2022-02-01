Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8984A63B5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 19:24:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15FB010E19A;
	Tue,  1 Feb 2022 18:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4AA10E157;
 Tue,  1 Feb 2022 18:24:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 16F8F1F42ED5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643739881;
 bh=0ojd4SVy8qdJBnBcPiDcPIT6pJ+fY2sgE6R0Yfongjw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g50/57XzYmcIyKjzCIuwOo/h10+U/ZcXKHhfJkZnzwh+V2xRJCt5W1I1jdI5Xc53T
 k8K9CqlyKlznRxspa/yfHarVg4/Qxvh5ZxxNCbb6o1FK2oRTIG1sj36YWYL46Dis63
 4HntVNXQNSgIiFVcjPu+miKOSCDaHQiA30M2Xijlhif1PeBK7X184Xudz5NDTkvw10
 tn/uNDHQZKfGVm/+vlPaYYf5MjMLdW2U1J04QqUUzSCJZ7iDlaV4IRZB7qUlKcGAex
 igzjVquszcR9JRrryyH7N425INxwC4/Cx+6Ro+q2s3MFh4Ko6e4GEg4A4ct0fR8NJK
 XBF66NJDcmBWg==
From: Robert Beckett <bob.beckett@collabora.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v7 2/5] drm/i915: enforce min GTT alignment for discrete cards
Date: Tue,  1 Feb 2022 18:24:18 +0000
Message-Id: <20220201182422.1548863-3-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201182422.1548863-1-bob.beckett@collabora.com>
References: <20220201182422.1548863-1-bob.beckett@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Auld <matthew.auld@intel.com>

For local-memory objects we need to align the GTT addresses
to 64K, both for the ppgtt and ggtt.

We need to support vm->min_alignment > 4K, depending
on the vm itself and the type of object we are inserting.
With this in mind update the GTT selftests to take this
into account.

For compact-pt we further align and pad lmem object GTT addresses
to 2MB to ensure PDEs contain consistent page sizes as
required by the HW.

v3:
	* use needs_compact_pt flag to discriminate between
	  64K and 64K with compact-pt
	* add i915_vm_obj_min_alignment
	* use i915_vm_obj_min_alignment to round up vma reservation
	  if compact-pt instead of hard coding
v5:
	* fix i915_vm_obj_min_alignment for internal objects which
	  have no memory region
v6:
	* tiled_blits_create correctly pick largest required alignment

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../i915/gem/selftests/i915_gem_client_blt.c  | 21 ++--
 drivers/gpu/drm/i915/gt/intel_gtt.c           | 12 +++
 drivers/gpu/drm/i915/gt/intel_gtt.h           | 18 ++++
 drivers/gpu/drm/i915/i915_vma.c               |  9 ++
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 96 ++++++++++++-------
 5 files changed, 115 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
index c8ff8bf0986d..3675d12a7d9a 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
@@ -39,6 +39,7 @@ struct tiled_blits {
 	struct blit_buffer scratch;
 	struct i915_vma *batch;
 	u64 hole;
+	u64 align;
 	u32 width;
 	u32 height;
 };
@@ -410,14 +411,19 @@ tiled_blits_create(struct intel_engine_cs *engine, struct rnd_state *prng)
 		goto err_free;
 	}
 
-	hole_size = 2 * PAGE_ALIGN(WIDTH * HEIGHT * 4);
+	t->align = i915_vm_min_alignment(t->ce->vm, INTEL_MEMORY_LOCAL);
+	t->align = max(t->align,
+		       i915_vm_min_alignment(t->ce->vm, INTEL_MEMORY_SYSTEM));
+
+	hole_size = 2 * round_up(WIDTH * HEIGHT * 4, t->align);
 	hole_size *= 2; /* room to maneuver */
-	hole_size += 2 * I915_GTT_MIN_ALIGNMENT;
+	hole_size += 2 * t->align; /* padding on either side */
 
 	mutex_lock(&t->ce->vm->mutex);
 	memset(&hole, 0, sizeof(hole));
 	err = drm_mm_insert_node_in_range(&t->ce->vm->mm, &hole,
-					  hole_size, 0, I915_COLOR_UNEVICTABLE,
+					  hole_size, t->align,
+					  I915_COLOR_UNEVICTABLE,
 					  0, U64_MAX,
 					  DRM_MM_INSERT_BEST);
 	if (!err)
@@ -428,7 +434,7 @@ tiled_blits_create(struct intel_engine_cs *engine, struct rnd_state *prng)
 		goto err_put;
 	}
 
-	t->hole = hole.start + I915_GTT_MIN_ALIGNMENT;
+	t->hole = hole.start + t->align;
 	pr_info("Using hole at %llx\n", t->hole);
 
 	err = tiled_blits_create_buffers(t, WIDTH, HEIGHT, prng);
@@ -455,7 +461,7 @@ static void tiled_blits_destroy(struct tiled_blits *t)
 static int tiled_blits_prepare(struct tiled_blits *t,
 			       struct rnd_state *prng)
 {
-	u64 offset = PAGE_ALIGN(t->width * t->height * 4);
+	u64 offset = round_up(t->width * t->height * 4, t->align);
 	u32 *map;
 	int err;
 	int i;
@@ -486,8 +492,7 @@ static int tiled_blits_prepare(struct tiled_blits *t,
 
 static int tiled_blits_bounce(struct tiled_blits *t, struct rnd_state *prng)
 {
-	u64 offset =
-		round_up(t->width * t->height * 4, 2 * I915_GTT_MIN_ALIGNMENT);
+	u64 offset = round_up(t->width * t->height * 4, 2 * t->align);
 	int err;
 
 	/* We want to check position invariant tiling across GTT eviction */
@@ -500,7 +505,7 @@ static int tiled_blits_bounce(struct tiled_blits *t, struct rnd_state *prng)
 
 	/* Reposition so that we overlap the old addresses, and slightly off */
 	err = tiled_blit(t,
-			 &t->buffers[2], t->hole + I915_GTT_MIN_ALIGNMENT,
+			 &t->buffers[2], t->hole + t->align,
 			 &t->buffers[1], t->hole + 3 * offset / 2);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 46be4197b93f..df23ebdfc994 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -223,6 +223,18 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
 
 	GEM_BUG_ON(!vm->total);
 	drm_mm_init(&vm->mm, 0, vm->total);
+
+	memset64(vm->min_alignment, I915_GTT_MIN_ALIGNMENT,
+		 ARRAY_SIZE(vm->min_alignment));
+
+	if (HAS_64K_PAGES(vm->i915) && NEEDS_COMPACT_PT(vm->i915)) {
+		vm->min_alignment[INTEL_MEMORY_LOCAL] = I915_GTT_PAGE_SIZE_2M;
+		vm->min_alignment[INTEL_MEMORY_STOLEN_LOCAL] = I915_GTT_PAGE_SIZE_2M;
+	} else if (HAS_64K_PAGES(vm->i915)) {
+		vm->min_alignment[INTEL_MEMORY_LOCAL] = I915_GTT_PAGE_SIZE_64K;
+		vm->min_alignment[INTEL_MEMORY_STOLEN_LOCAL] = I915_GTT_PAGE_SIZE_64K;
+	}
+
 	vm->mm.head_node.color = I915_COLOR_UNEVICTABLE;
 
 	INIT_LIST_HEAD(&vm->bound_list);
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 8073438b67c8..ba9f040f8606 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -29,6 +29,8 @@
 #include "i915_selftest.h"
 #include "i915_vma_resource.h"
 #include "i915_vma_types.h"
+#include "i915_params.h"
+#include "intel_memory_region.h"
 
 #define I915_GFP_ALLOW_FAIL (GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN)
 
@@ -223,6 +225,7 @@ struct i915_address_space {
 	struct device *dma;
 	u64 total;		/* size addr space maps (ex. 2GB for ggtt) */
 	u64 reserved;		/* size addr space reserved */
+	u64 min_alignment[INTEL_MEMORY_STOLEN_LOCAL + 1];
 
 	unsigned int bind_async_flags;
 
@@ -384,6 +387,21 @@ i915_vm_has_scratch_64K(struct i915_address_space *vm)
 	return vm->scratch_order == get_order(I915_GTT_PAGE_SIZE_64K);
 }
 
+static inline u64 i915_vm_min_alignment(struct i915_address_space *vm,
+					enum intel_memory_type type)
+{
+	return vm->min_alignment[type];
+}
+
+static inline u64 i915_vm_obj_min_alignment(struct i915_address_space *vm,
+					    struct drm_i915_gem_object  *obj)
+{
+	struct intel_memory_region *mr = READ_ONCE(obj->mm.region);
+	enum intel_memory_type type = mr ? mr->type : INTEL_MEMORY_SYSTEM;
+
+	return i915_vm_min_alignment(vm, type);
+}
+
 static inline bool
 i915_vm_has_cache_coloring(struct i915_address_space *vm)
 {
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 845cd88f8313..3558b16a929c 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -757,6 +757,14 @@ i915_vma_insert(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 		end = min_t(u64, end, (1ULL << 32) - I915_GTT_PAGE_SIZE);
 	GEM_BUG_ON(!IS_ALIGNED(end, I915_GTT_PAGE_SIZE));
 
+	alignment = max(alignment, i915_vm_obj_min_alignment(vma->vm, vma->obj));
+	/*
+	 * for compact-pt we round up the reservation to prevent
+	 * any smaller pages being used within the same PDE
+	 */
+	if (NEEDS_COMPACT_PT(vma->vm->i915))
+		size = round_up(size, alignment);
+
 	/* If binding the object/GGTT view requires more space than the entire
 	 * aperture has, reject it early before evicting everything in a vain
 	 * attempt to find space.
@@ -769,6 +777,7 @@ i915_vma_insert(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 	}
 
 	color = 0;
+
 	if (i915_vm_has_cache_coloring(vma->vm))
 		color = vma->obj->cache_level;
 
diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
index fba1c8be1649..b80788a2b7f9 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -238,6 +238,8 @@ static int lowlevel_hole(struct i915_address_space *vm,
 			 u64 hole_start, u64 hole_end,
 			 unsigned long end_time)
 {
+	const unsigned int min_alignment =
+		i915_vm_min_alignment(vm, INTEL_MEMORY_SYSTEM);
 	I915_RND_STATE(seed_prng);
 	struct i915_vma_resource *mock_vma_res;
 	unsigned int size;
@@ -251,9 +253,10 @@ static int lowlevel_hole(struct i915_address_space *vm,
 		I915_RND_SUBSTATE(prng, seed_prng);
 		struct drm_i915_gem_object *obj;
 		unsigned int *order, count, n;
-		u64 hole_size;
+		u64 hole_size, aligned_size;
 
-		hole_size = (hole_end - hole_start) >> size;
+		aligned_size = max_t(u32, ilog2(min_alignment), size);
+		hole_size = (hole_end - hole_start) >> aligned_size;
 		if (hole_size > KMALLOC_MAX_SIZE / sizeof(u32))
 			hole_size = KMALLOC_MAX_SIZE / sizeof(u32);
 		count = hole_size >> 1;
@@ -274,8 +277,8 @@ static int lowlevel_hole(struct i915_address_space *vm,
 		}
 		GEM_BUG_ON(!order);
 
-		GEM_BUG_ON(count * BIT_ULL(size) > vm->total);
-		GEM_BUG_ON(hole_start + count * BIT_ULL(size) > hole_end);
+		GEM_BUG_ON(count * BIT_ULL(aligned_size) > vm->total);
+		GEM_BUG_ON(hole_start + count * BIT_ULL(aligned_size) > hole_end);
 
 		/* Ignore allocation failures (i.e. don't report them as
 		 * a test failure) as we are purposefully allocating very
@@ -298,10 +301,10 @@ static int lowlevel_hole(struct i915_address_space *vm,
 		}
 
 		for (n = 0; n < count; n++) {
-			u64 addr = hole_start + order[n] * BIT_ULL(size);
+			u64 addr = hole_start + order[n] * BIT_ULL(aligned_size);
 			intel_wakeref_t wakeref;
 
-			GEM_BUG_ON(addr + BIT_ULL(size) > vm->total);
+			GEM_BUG_ON(addr + BIT_ULL(aligned_size) > vm->total);
 
 			if (igt_timeout(end_time,
 					"%s timed out before %d/%d\n",
@@ -344,7 +347,7 @@ static int lowlevel_hole(struct i915_address_space *vm,
 			}
 
 			mock_vma_res->bi.pages = obj->mm.pages;
-			mock_vma_res->node_size = BIT_ULL(size);
+			mock_vma_res->node_size = BIT_ULL(aligned_size);
 			mock_vma_res->start = addr;
 
 			with_intel_runtime_pm(vm->gt->uncore->rpm, wakeref)
@@ -355,7 +358,7 @@ static int lowlevel_hole(struct i915_address_space *vm,
 
 		i915_random_reorder(order, count, &prng);
 		for (n = 0; n < count; n++) {
-			u64 addr = hole_start + order[n] * BIT_ULL(size);
+			u64 addr = hole_start + order[n] * BIT_ULL(aligned_size);
 			intel_wakeref_t wakeref;
 
 			GEM_BUG_ON(addr + BIT_ULL(size) > vm->total);
@@ -399,8 +402,10 @@ static int fill_hole(struct i915_address_space *vm,
 {
 	const u64 hole_size = hole_end - hole_start;
 	struct drm_i915_gem_object *obj;
+	const unsigned int min_alignment =
+		i915_vm_min_alignment(vm, INTEL_MEMORY_SYSTEM);
 	const unsigned long max_pages =
-		min_t(u64, ULONG_MAX - 1, hole_size/2 >> PAGE_SHIFT);
+		min_t(u64, ULONG_MAX - 1, (hole_size / 2) >> ilog2(min_alignment));
 	const unsigned long max_step = max(int_sqrt(max_pages), 2UL);
 	unsigned long npages, prime, flags;
 	struct i915_vma *vma;
@@ -441,14 +446,17 @@ static int fill_hole(struct i915_address_space *vm,
 
 				offset = p->offset;
 				list_for_each_entry(obj, &objects, st_link) {
+					u64 aligned_size = round_up(obj->base.size,
+								    min_alignment);
+
 					vma = i915_vma_instance(obj, vm, NULL);
 					if (IS_ERR(vma))
 						continue;
 
 					if (p->step < 0) {
-						if (offset < hole_start + obj->base.size)
+						if (offset < hole_start + aligned_size)
 							break;
-						offset -= obj->base.size;
+						offset -= aligned_size;
 					}
 
 					err = i915_vma_pin(vma, 0, 0, offset | flags);
@@ -470,22 +478,25 @@ static int fill_hole(struct i915_address_space *vm,
 					i915_vma_unpin(vma);
 
 					if (p->step > 0) {
-						if (offset + obj->base.size > hole_end)
+						if (offset + aligned_size > hole_end)
 							break;
-						offset += obj->base.size;
+						offset += aligned_size;
 					}
 				}
 
 				offset = p->offset;
 				list_for_each_entry(obj, &objects, st_link) {
+					u64 aligned_size = round_up(obj->base.size,
+								    min_alignment);
+
 					vma = i915_vma_instance(obj, vm, NULL);
 					if (IS_ERR(vma))
 						continue;
 
 					if (p->step < 0) {
-						if (offset < hole_start + obj->base.size)
+						if (offset < hole_start + aligned_size)
 							break;
-						offset -= obj->base.size;
+						offset -= aligned_size;
 					}
 
 					if (!drm_mm_node_allocated(&vma->node) ||
@@ -506,22 +517,25 @@ static int fill_hole(struct i915_address_space *vm,
 					}
 
 					if (p->step > 0) {
-						if (offset + obj->base.size > hole_end)
+						if (offset + aligned_size > hole_end)
 							break;
-						offset += obj->base.size;
+						offset += aligned_size;
 					}
 				}
 
 				offset = p->offset;
 				list_for_each_entry_reverse(obj, &objects, st_link) {
+					u64 aligned_size = round_up(obj->base.size,
+								    min_alignment);
+
 					vma = i915_vma_instance(obj, vm, NULL);
 					if (IS_ERR(vma))
 						continue;
 
 					if (p->step < 0) {
-						if (offset < hole_start + obj->base.size)
+						if (offset < hole_start + aligned_size)
 							break;
-						offset -= obj->base.size;
+						offset -= aligned_size;
 					}
 
 					err = i915_vma_pin(vma, 0, 0, offset | flags);
@@ -543,22 +557,25 @@ static int fill_hole(struct i915_address_space *vm,
 					i915_vma_unpin(vma);
 
 					if (p->step > 0) {
-						if (offset + obj->base.size > hole_end)
+						if (offset + aligned_size > hole_end)
 							break;
-						offset += obj->base.size;
+						offset += aligned_size;
 					}
 				}
 
 				offset = p->offset;
 				list_for_each_entry_reverse(obj, &objects, st_link) {
+					u64 aligned_size = round_up(obj->base.size,
+								    min_alignment);
+
 					vma = i915_vma_instance(obj, vm, NULL);
 					if (IS_ERR(vma))
 						continue;
 
 					if (p->step < 0) {
-						if (offset < hole_start + obj->base.size)
+						if (offset < hole_start + aligned_size)
 							break;
-						offset -= obj->base.size;
+						offset -= aligned_size;
 					}
 
 					if (!drm_mm_node_allocated(&vma->node) ||
@@ -579,9 +596,9 @@ static int fill_hole(struct i915_address_space *vm,
 					}
 
 					if (p->step > 0) {
-						if (offset + obj->base.size > hole_end)
+						if (offset + aligned_size > hole_end)
 							break;
-						offset += obj->base.size;
+						offset += aligned_size;
 					}
 				}
 			}
@@ -611,6 +628,7 @@ static int walk_hole(struct i915_address_space *vm,
 	const u64 hole_size = hole_end - hole_start;
 	const unsigned long max_pages =
 		min_t(u64, ULONG_MAX - 1, hole_size >> PAGE_SHIFT);
+	unsigned long min_alignment;
 	unsigned long flags;
 	u64 size;
 
@@ -620,6 +638,8 @@ static int walk_hole(struct i915_address_space *vm,
 	if (i915_is_ggtt(vm))
 		flags |= PIN_GLOBAL;
 
+	min_alignment = i915_vm_min_alignment(vm, INTEL_MEMORY_SYSTEM);
+
 	for_each_prime_number_from(size, 1, max_pages) {
 		struct drm_i915_gem_object *obj;
 		struct i915_vma *vma;
@@ -638,7 +658,7 @@ static int walk_hole(struct i915_address_space *vm,
 
 		for (addr = hole_start;
 		     addr + obj->base.size < hole_end;
-		     addr += obj->base.size) {
+		     addr += round_up(obj->base.size, min_alignment)) {
 			err = i915_vma_pin(vma, 0, 0, addr | flags);
 			if (err) {
 				pr_err("%s bind failed at %llx + %llx [hole %llx- %llx] with err=%d\n",
@@ -690,6 +710,7 @@ static int pot_hole(struct i915_address_space *vm,
 {
 	struct drm_i915_gem_object *obj;
 	struct i915_vma *vma;
+	unsigned int min_alignment;
 	unsigned long flags;
 	unsigned int pot;
 	int err = 0;
@@ -698,6 +719,8 @@ static int pot_hole(struct i915_address_space *vm,
 	if (i915_is_ggtt(vm))
 		flags |= PIN_GLOBAL;
 
+	min_alignment = i915_vm_min_alignment(vm, INTEL_MEMORY_SYSTEM);
+
 	obj = i915_gem_object_create_internal(vm->i915, 2 * I915_GTT_PAGE_SIZE);
 	if (IS_ERR(obj))
 		return PTR_ERR(obj);
@@ -710,13 +733,13 @@ static int pot_hole(struct i915_address_space *vm,
 
 	/* Insert a pair of pages across every pot boundary within the hole */
 	for (pot = fls64(hole_end - 1) - 1;
-	     pot > ilog2(2 * I915_GTT_PAGE_SIZE);
+	     pot > ilog2(2 * min_alignment);
 	     pot--) {
 		u64 step = BIT_ULL(pot);
 		u64 addr;
 
-		for (addr = round_up(hole_start + I915_GTT_PAGE_SIZE, step) - I915_GTT_PAGE_SIZE;
-		     addr <= round_down(hole_end - 2*I915_GTT_PAGE_SIZE, step) - I915_GTT_PAGE_SIZE;
+		for (addr = round_up(hole_start + min_alignment, step) - min_alignment;
+		     addr <= round_down(hole_end - (2 * min_alignment), step) - min_alignment;
 		     addr += step) {
 			err = i915_vma_pin(vma, 0, 0, addr | flags);
 			if (err) {
@@ -761,6 +784,7 @@ static int drunk_hole(struct i915_address_space *vm,
 		      unsigned long end_time)
 {
 	I915_RND_STATE(prng);
+	unsigned int min_alignment;
 	unsigned int size;
 	unsigned long flags;
 
@@ -768,15 +792,18 @@ static int drunk_hole(struct i915_address_space *vm,
 	if (i915_is_ggtt(vm))
 		flags |= PIN_GLOBAL;
 
+	min_alignment = i915_vm_min_alignment(vm, INTEL_MEMORY_SYSTEM);
+
 	/* Keep creating larger objects until one cannot fit into the hole */
 	for (size = 12; (hole_end - hole_start) >> size; size++) {
 		struct drm_i915_gem_object *obj;
 		unsigned int *order, count, n;
 		struct i915_vma *vma;
-		u64 hole_size;
+		u64 hole_size, aligned_size;
 		int err = -ENODEV;
 
-		hole_size = (hole_end - hole_start) >> size;
+		aligned_size = max_t(u32, ilog2(min_alignment), size);
+		hole_size = (hole_end - hole_start) >> aligned_size;
 		if (hole_size > KMALLOC_MAX_SIZE / sizeof(u32))
 			hole_size = KMALLOC_MAX_SIZE / sizeof(u32);
 		count = hole_size >> 1;
@@ -816,7 +843,7 @@ static int drunk_hole(struct i915_address_space *vm,
 		GEM_BUG_ON(vma->size != BIT_ULL(size));
 
 		for (n = 0; n < count; n++) {
-			u64 addr = hole_start + order[n] * BIT_ULL(size);
+			u64 addr = hole_start + order[n] * BIT_ULL(aligned_size);
 
 			err = i915_vma_pin(vma, 0, 0, addr | flags);
 			if (err) {
@@ -868,11 +895,14 @@ static int __shrink_hole(struct i915_address_space *vm,
 {
 	struct drm_i915_gem_object *obj;
 	unsigned long flags = PIN_OFFSET_FIXED | PIN_USER;
+	unsigned int min_alignment;
 	unsigned int order = 12;
 	LIST_HEAD(objects);
 	int err = 0;
 	u64 addr;
 
+	min_alignment = i915_vm_min_alignment(vm, INTEL_MEMORY_SYSTEM);
+
 	/* Keep creating larger objects until one cannot fit into the hole */
 	for (addr = hole_start; addr < hole_end; ) {
 		struct i915_vma *vma;
@@ -913,7 +943,7 @@ static int __shrink_hole(struct i915_address_space *vm,
 		}
 
 		i915_vma_unpin(vma);
-		addr += size;
+		addr += round_up(size, min_alignment);
 
 		/*
 		 * Since we are injecting allocation faults at random intervals,
-- 
2.25.1

