Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE06948B4CA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 19:03:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C009710E1C3;
	Tue, 11 Jan 2022 18:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC2C10E1C3;
 Tue, 11 Jan 2022 18:03:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 68E531F4472F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641924202;
 bh=7p63ojB7H5HOoFWxuatli4zooOHuGGcMaJB1QJ36ih0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kse4WHsaXmXdUy9zrD9kkXzVbZp1mU4QiUyaEc7anGxdkp58xRuHVfk83v73XTKU4
 oZVbPhEeUz7MxniAjk6xdR4B4VJQI0ia78jWzenFJ7N1D0l0Ba3U73AbtFTpi3bBOs
 Lz67zQohgpE4RJ5nZMuAS4V8TE+UiK8x0zePGwBtQJIz74pGNfZrsjvtGZ0rq1+3Rj
 e4byTzXaad8jZCK2zoawrUdq85+L/+OE9xlhVCNBgwhNgn/YYY7u/2Yd/scPVZp640
 hCGyFRVwOfXChd/fd5ZXv8f3kR8HtHTw3cQcU6fDkvQTdAuoLThJa41ykPEFMKKOf6
 KJd1omlk7r40Q==
From: Robert Beckett <bob.beckett@collabora.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/4] drm/i915: enforce min GTT alignment for discrete cards
Date: Tue, 11 Jan 2022 18:02:35 +0000
Message-Id: <20220111180238.1370631-2-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111180238.1370631-1-bob.beckett@collabora.com>
References: <20220111180238.1370631-1-bob.beckett@collabora.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Auld <matthew.auld@intel.com>

For local-memory objects we need to align the GTT addresses
to 64K, both for the ppgtt and ggtt.

We need to support vm->min_alignment > 4K, depending
on the vm itself and the type of object we are inserting.
With this in mind update the GTT selftests to take this
into account.

For DG2 we further align and pad lmem object GTT addresses
to 2MB to ensure PDEs contain consistent page sizes as
required by the HW.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../i915/gem/selftests/i915_gem_client_blt.c  | 23 +++--
 drivers/gpu/drm/i915/gt/intel_gtt.c           | 14 +++
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  9 ++
 drivers/gpu/drm/i915/i915_vma.c               | 14 +++
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 96 ++++++++++++-------
 5 files changed, 115 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
index c08f766e6e15..7fee95a65414 100644
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
@@ -410,14 +411,21 @@ tiled_blits_create(struct intel_engine_cs *engine, struct rnd_state *prng)
 		goto err_free;
 	}
 
-	hole_size = 2 * PAGE_ALIGN(WIDTH * HEIGHT * 4);
+	t->align = I915_GTT_PAGE_SIZE_2M; /* XXX worst case, derive from vm! */
+	t->align = max(t->align,
+		       i915_vm_min_alignment(t->ce->vm, INTEL_MEMORY_LOCAL));
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
@@ -428,7 +436,7 @@ tiled_blits_create(struct intel_engine_cs *engine, struct rnd_state *prng)
 		goto err_put;
 	}
 
-	t->hole = hole.start + I915_GTT_MIN_ALIGNMENT;
+	t->hole = hole.start + t->align;
 	pr_info("Using hole at %llx\n", t->hole);
 
 	err = tiled_blits_create_buffers(t, WIDTH, HEIGHT, prng);
@@ -455,7 +463,7 @@ static void tiled_blits_destroy(struct tiled_blits *t)
 static int tiled_blits_prepare(struct tiled_blits *t,
 			       struct rnd_state *prng)
 {
-	u64 offset = PAGE_ALIGN(t->width * t->height * 4);
+	u64 offset = round_up(t->width * t->height * 4, t->align);
 	u32 *map;
 	int err;
 	int i;
@@ -486,8 +494,7 @@ static int tiled_blits_prepare(struct tiled_blits *t,
 
 static int tiled_blits_bounce(struct tiled_blits *t, struct rnd_state *prng)
 {
-	u64 offset =
-		round_up(t->width * t->height * 4, 2 * I915_GTT_MIN_ALIGNMENT);
+	u64 offset = round_up(t->width * t->height * 4, 2 * t->align);
 	int err;
 
 	/* We want to check position invariant tiling across GTT eviction */
@@ -500,7 +507,7 @@ static int tiled_blits_bounce(struct tiled_blits *t, struct rnd_state *prng)
 
 	/* Reposition so that we overlap the old addresses, and slightly off */
 	err = tiled_blit(t,
-			 &t->buffers[2], t->hole + I915_GTT_MIN_ALIGNMENT,
+			 &t->buffers[2], t->hole + t->align,
 			 &t->buffers[1], t->hole + 3 * offset / 2);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index a94be0306464..156852dcf33a 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -219,6 +219,20 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
 
 	GEM_BUG_ON(!vm->total);
 	drm_mm_init(&vm->mm, 0, vm->total);
+
+	memset64(vm->min_alignment, I915_GTT_MIN_ALIGNMENT,
+		 ARRAY_SIZE(vm->min_alignment));
+
+	if (HAS_64K_PAGES(vm->i915)) {
+		if (IS_DG2(vm->i915)) {
+			vm->min_alignment[INTEL_MEMORY_LOCAL] = I915_GTT_PAGE_SIZE_2M;
+			vm->min_alignment[INTEL_MEMORY_STOLEN_LOCAL] = I915_GTT_PAGE_SIZE_2M;
+		} else {
+			vm->min_alignment[INTEL_MEMORY_LOCAL] = I915_GTT_PAGE_SIZE_64K;
+			vm->min_alignment[INTEL_MEMORY_STOLEN_LOCAL] = I915_GTT_PAGE_SIZE_64K;
+		}
+	}
+
 	vm->mm.head_node.color = I915_COLOR_UNEVICTABLE;
 
 	INIT_LIST_HEAD(&vm->bound_list);
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 177b42b935a1..b24a496c854e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -28,6 +28,8 @@
 #include "gt/intel_reset.h"
 #include "i915_selftest.h"
 #include "i915_vma_types.h"
+#include "i915_params.h"
+#include "intel_memory_region.h"
 
 #define I915_GFP_ALLOW_FAIL (GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN)
 
@@ -221,6 +223,7 @@ struct i915_address_space {
 	struct device *dma;
 	u64 total;		/* size addr space maps (ex. 2GB for ggtt) */
 	u64 reserved;		/* size addr space reserved */
+	u64 min_alignment[INTEL_MEMORY_STOLEN_LOCAL + 1];
 
 	unsigned int bind_async_flags;
 
@@ -379,6 +382,12 @@ i915_vm_has_scratch_64K(struct i915_address_space *vm)
 	return vm->scratch_order == get_order(I915_GTT_PAGE_SIZE_64K);
 }
 
+static inline u64 i915_vm_min_alignment(struct i915_address_space *vm,
+					enum intel_memory_type type)
+{
+	return vm->min_alignment[type];
+}
+
 static inline bool
 i915_vm_has_cache_coloring(struct i915_address_space *vm)
 {
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index be208a8f1ed0..f354e465a6cd 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -694,6 +694,20 @@ i915_vma_insert(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
 	}
 
 	color = 0;
+
+	if (HAS_64K_PAGES(vma->vm->i915) && i915_gem_object_is_lmem(vma->obj)) {
+		alignment = max(alignment, I915_GTT_PAGE_SIZE_64K);
+		/*
+		 * DG2 can not have different sized pages in any given PDE (2MB range).
+		 * Keeping things simple, we force any lmem object to reserve
+		 * 2MB chunks, preventing any smaller pages being used alongside
+		 */
+		if (IS_DG2(vma->vm->i915)) {
+			alignment = max(alignment, I915_GTT_PAGE_SIZE_2M);
+			size = round_up(size, I915_GTT_PAGE_SIZE_2M);
+		}
+	}
+
 	if (i915_vm_has_cache_coloring(vma->vm))
 		color = vma->obj->cache_level;
 
diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
index 357ced0b88e7..fea031b4ec4f 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -237,6 +237,8 @@ static int lowlevel_hole(struct i915_address_space *vm,
 			 u64 hole_start, u64 hole_end,
 			 unsigned long end_time)
 {
+	const unsigned int min_alignment =
+		i915_vm_min_alignment(vm, INTEL_MEMORY_SYSTEM);
 	I915_RND_STATE(seed_prng);
 	struct i915_vma *mock_vma;
 	unsigned int size;
@@ -250,9 +252,10 @@ static int lowlevel_hole(struct i915_address_space *vm,
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
@@ -273,8 +276,8 @@ static int lowlevel_hole(struct i915_address_space *vm,
 		}
 		GEM_BUG_ON(!order);
 
-		GEM_BUG_ON(count * BIT_ULL(size) > vm->total);
-		GEM_BUG_ON(hole_start + count * BIT_ULL(size) > hole_end);
+		GEM_BUG_ON(count * BIT_ULL(aligned_size) > vm->total);
+		GEM_BUG_ON(hole_start + count * BIT_ULL(aligned_size) > hole_end);
 
 		/* Ignore allocation failures (i.e. don't report them as
 		 * a test failure) as we are purposefully allocating very
@@ -297,10 +300,10 @@ static int lowlevel_hole(struct i915_address_space *vm,
 		}
 
 		for (n = 0; n < count; n++) {
-			u64 addr = hole_start + order[n] * BIT_ULL(size);
+			u64 addr = hole_start + order[n] * BIT_ULL(aligned_size);
 			intel_wakeref_t wakeref;
 
-			GEM_BUG_ON(addr + BIT_ULL(size) > vm->total);
+			GEM_BUG_ON(addr + BIT_ULL(aligned_size) > vm->total);
 
 			if (igt_timeout(end_time,
 					"%s timed out before %d/%d\n",
@@ -343,7 +346,7 @@ static int lowlevel_hole(struct i915_address_space *vm,
 			}
 
 			mock_vma->pages = obj->mm.pages;
-			mock_vma->node.size = BIT_ULL(size);
+			mock_vma->node.size = BIT_ULL(aligned_size);
 			mock_vma->node.start = addr;
 
 			with_intel_runtime_pm(vm->gt->uncore->rpm, wakeref)
@@ -354,7 +357,7 @@ static int lowlevel_hole(struct i915_address_space *vm,
 
 		i915_random_reorder(order, count, &prng);
 		for (n = 0; n < count; n++) {
-			u64 addr = hole_start + order[n] * BIT_ULL(size);
+			u64 addr = hole_start + order[n] * BIT_ULL(aligned_size);
 			intel_wakeref_t wakeref;
 
 			GEM_BUG_ON(addr + BIT_ULL(size) > vm->total);
@@ -398,8 +401,10 @@ static int fill_hole(struct i915_address_space *vm,
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
@@ -440,14 +445,17 @@ static int fill_hole(struct i915_address_space *vm,
 
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
@@ -469,22 +477,25 @@ static int fill_hole(struct i915_address_space *vm,
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
@@ -505,22 +516,25 @@ static int fill_hole(struct i915_address_space *vm,
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
@@ -542,22 +556,25 @@ static int fill_hole(struct i915_address_space *vm,
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
@@ -578,9 +595,9 @@ static int fill_hole(struct i915_address_space *vm,
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
@@ -610,6 +627,7 @@ static int walk_hole(struct i915_address_space *vm,
 	const u64 hole_size = hole_end - hole_start;
 	const unsigned long max_pages =
 		min_t(u64, ULONG_MAX - 1, hole_size >> PAGE_SHIFT);
+	unsigned long min_alignment;
 	unsigned long flags;
 	u64 size;
 
@@ -619,6 +637,8 @@ static int walk_hole(struct i915_address_space *vm,
 	if (i915_is_ggtt(vm))
 		flags |= PIN_GLOBAL;
 
+	min_alignment = i915_vm_min_alignment(vm, INTEL_MEMORY_SYSTEM);
+
 	for_each_prime_number_from(size, 1, max_pages) {
 		struct drm_i915_gem_object *obj;
 		struct i915_vma *vma;
@@ -637,7 +657,7 @@ static int walk_hole(struct i915_address_space *vm,
 
 		for (addr = hole_start;
 		     addr + obj->base.size < hole_end;
-		     addr += obj->base.size) {
+		     addr += round_up(obj->base.size, min_alignment)) {
 			err = i915_vma_pin(vma, 0, 0, addr | flags);
 			if (err) {
 				pr_err("%s bind failed at %llx + %llx [hole %llx- %llx] with err=%d\n",
@@ -689,6 +709,7 @@ static int pot_hole(struct i915_address_space *vm,
 {
 	struct drm_i915_gem_object *obj;
 	struct i915_vma *vma;
+	unsigned int min_alignment;
 	unsigned long flags;
 	unsigned int pot;
 	int err = 0;
@@ -697,6 +718,8 @@ static int pot_hole(struct i915_address_space *vm,
 	if (i915_is_ggtt(vm))
 		flags |= PIN_GLOBAL;
 
+	min_alignment = i915_vm_min_alignment(vm, INTEL_MEMORY_SYSTEM);
+
 	obj = i915_gem_object_create_internal(vm->i915, 2 * I915_GTT_PAGE_SIZE);
 	if (IS_ERR(obj))
 		return PTR_ERR(obj);
@@ -709,13 +732,13 @@ static int pot_hole(struct i915_address_space *vm,
 
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
@@ -760,6 +783,7 @@ static int drunk_hole(struct i915_address_space *vm,
 		      unsigned long end_time)
 {
 	I915_RND_STATE(prng);
+	unsigned int min_alignment;
 	unsigned int size;
 	unsigned long flags;
 
@@ -767,15 +791,18 @@ static int drunk_hole(struct i915_address_space *vm,
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
@@ -815,7 +842,7 @@ static int drunk_hole(struct i915_address_space *vm,
 		GEM_BUG_ON(vma->size != BIT_ULL(size));
 
 		for (n = 0; n < count; n++) {
-			u64 addr = hole_start + order[n] * BIT_ULL(size);
+			u64 addr = hole_start + order[n] * BIT_ULL(aligned_size);
 
 			err = i915_vma_pin(vma, 0, 0, addr | flags);
 			if (err) {
@@ -867,11 +894,14 @@ static int __shrink_hole(struct i915_address_space *vm,
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
@@ -912,7 +942,7 @@ static int __shrink_hole(struct i915_address_space *vm,
 		}
 
 		i915_vma_unpin(vma);
-		addr += size;
+		addr += round_up(size, min_alignment);
 
 		/*
 		 * Since we are injecting allocation faults at random intervals,
-- 
2.25.1

