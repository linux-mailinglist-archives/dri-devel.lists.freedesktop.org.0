Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AA22C6514
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:12:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8CE6ECC2;
	Fri, 27 Nov 2020 12:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3D76ECB0;
 Fri, 27 Nov 2020 12:10:44 +0000 (UTC)
IronPort-SDR: uua54Zg3tqOcm+JNWmXpWcQsQYzvxNFt1IX8N61wzEzmfNp1zUSv3/69s2SZU3xgk4G3k/p/WU
 3m5/4tTdfFdQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092779"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092779"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:29 -0800
IronPort-SDR: qHszr7P1UNQn/0Dn305aW62wd7nRVFTtjzeI6hTILhnAJq4Wmi/x5lcrqY9PMwqGl0CN40GBfa
 mrNNZo368L/A==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029367"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:27 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 098/162] drm/i915/gtt: map the PD up front
Date: Fri, 27 Nov 2020 12:06:14 +0000
Message-Id: <20201127120718.454037-99-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We need to general our accessor for the page directories and tables from
using the simple kmap_atomic to support local memory, and this setup
must be done on acquisition of the backing storage prior to entering
fence execution contexts. Here we replace the kmap with the object
maping code that for simple single page shmemfs object will return a
plain kmap, that is then kept for the lifetime of the page directory.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 .../drm/i915/gem/selftests/i915_gem_context.c | 11 +----
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c          | 11 ++---
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 26 ++++------
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |  2 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c           | 48 +++++++++----------
 drivers/gpu/drm/i915/gt/intel_gtt.h           | 11 +++--
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  7 ++-
 drivers/gpu/drm/i915/i915_vma.c               |  3 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 10 ++--
 drivers/gpu/drm/i915/selftests/i915_perf.c    |  3 +-
 10 files changed, 54 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index 5fef592390cb..ce70d0a3afb2 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -1740,7 +1740,6 @@ static int read_from_scratch(struct i915_gem_context *ctx,
 static int check_scratch_page(struct i915_gem_context *ctx, u32 *out)
 {
 	struct i915_address_space *vm;
-	struct page *page;
 	u32 *vaddr;
 	int err = 0;
 
@@ -1748,24 +1747,18 @@ static int check_scratch_page(struct i915_gem_context *ctx, u32 *out)
 	if (!vm)
 		return -ENODEV;
 
-	page = __px_page(vm->scratch[0]);
-	if (!page) {
+	if (!vm->scratch[0]) {
 		pr_err("No scratch page!\n");
 		return -EINVAL;
 	}
 
-	vaddr = kmap(page);
-	if (!vaddr) {
-		pr_err("No (mappable) scratch page!\n");
-		return -EINVAL;
-	}
+	vaddr = __px_vaddr(vm->scratch[0]);
 
 	memcpy(out, vaddr, sizeof(*out));
 	if (memchr_inv(vaddr, *out, PAGE_SIZE)) {
 		pr_err("Inconsistent initial state of scratch page!\n");
 		err = -EINVAL;
 	}
-	kunmap(page);
 
 	return err;
 }
diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
index 680bd9442eb0..78ad7d8a8bcc 100644
--- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
@@ -105,9 +105,8 @@ static void gen6_ppgtt_clear_range(struct i915_address_space *vm,
 		 * entries back to scratch.
 		 */
 
-		vaddr = kmap_atomic_px(pt);
+		vaddr = px_vaddr(pt);
 		memset32(vaddr + pte, scratch_pte, count);
-		kunmap_atomic(vaddr);
 
 		pte = 0;
 	}
@@ -129,7 +128,7 @@ static void gen6_ppgtt_insert_entries(struct i915_address_space *vm,
 
 	GEM_BUG_ON(!pd->entry[act_pt]);
 
-	vaddr = kmap_atomic_px(i915_pt_entry(pd, act_pt));
+	vaddr = px_vaddr(i915_pt_entry(pd, act_pt));
 	do {
 		GEM_BUG_ON(sg_dma_len(iter.sg) < I915_GTT_PAGE_SIZE);
 		vaddr[act_pte] = pte_encode | GEN6_PTE_ADDR_ENCODE(iter.dma);
@@ -145,12 +144,10 @@ static void gen6_ppgtt_insert_entries(struct i915_address_space *vm,
 		}
 
 		if (++act_pte == GEN6_PTES) {
-			kunmap_atomic(vaddr);
-			vaddr = kmap_atomic_px(i915_pt_entry(pd, ++act_pt));
+			vaddr = px_vaddr(i915_pt_entry(pd, ++act_pt));
 			act_pte = 0;
 		}
 	} while (1);
-	kunmap_atomic(vaddr);
 
 	vma->page_sizes.gtt = I915_GTT_PAGE_SIZE;
 }
@@ -244,7 +241,7 @@ static int gen6_ppgtt_init_scratch(struct gen6_ppgtt *ppgtt)
 		goto err_scratch0;
 	}
 
-	ret = pin_pt_dma(vm, vm->scratch[1]);
+	ret = map_pt_dma(vm, vm->scratch[1]);
 	if (ret)
 		goto err_scratch1;
 
diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index a37c968ef8f7..a3093dd4b86d 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -237,11 +237,10 @@ static u64 __gen8_ppgtt_clear(struct i915_address_space * const vm,
 			    atomic_read(&pt->used));
 			GEM_BUG_ON(!count || count >= atomic_read(&pt->used));
 
-			vaddr = kmap_atomic_px(pt);
+			vaddr = px_vaddr(pt);
 			memset64(vaddr + gen8_pd_index(start, 0),
 				 vm->scratch[0]->encode,
 				 count);
-			kunmap_atomic(vaddr);
 
 			atomic_sub(count, &pt->used);
 			start += count;
@@ -370,7 +369,7 @@ gen8_ppgtt_insert_pte(struct i915_ppgtt *ppgtt,
 	gen8_pte_t *vaddr;
 
 	pd = i915_pd_entry(pdp, gen8_pd_index(idx, 2));
-	vaddr = kmap_atomic_px(i915_pt_entry(pd, gen8_pd_index(idx, 1)));
+	vaddr = px_vaddr(i915_pt_entry(pd, gen8_pd_index(idx, 1)));
 	do {
 		GEM_BUG_ON(sg_dma_len(iter->sg) < I915_GTT_PAGE_SIZE);
 		vaddr[gen8_pd_index(idx, 0)] = pte_encode | iter->dma;
@@ -397,12 +396,10 @@ gen8_ppgtt_insert_pte(struct i915_ppgtt *ppgtt,
 			}
 
 			clflush_cache_range(vaddr, PAGE_SIZE);
-			kunmap_atomic(vaddr);
-			vaddr = kmap_atomic_px(i915_pt_entry(pd, gen8_pd_index(idx, 1)));
+			vaddr = px_vaddr(i915_pt_entry(pd, gen8_pd_index(idx, 1)));
 		}
 	} while (1);
 	clflush_cache_range(vaddr, PAGE_SIZE);
-	kunmap_atomic(vaddr);
 
 	return idx;
 }
@@ -437,7 +434,7 @@ static void gen8_ppgtt_insert_huge(struct i915_vma *vma,
 			encode |= GEN8_PDE_PS_2M;
 			page_size = I915_GTT_PAGE_SIZE_2M;
 
-			vaddr = kmap_atomic_px(pd);
+			vaddr = px_vaddr(pd);
 		} else {
 			struct i915_page_table *pt =
 				i915_pt_entry(pd, __gen8_pte_index(start, 1));
@@ -452,7 +449,7 @@ static void gen8_ppgtt_insert_huge(struct i915_vma *vma,
 			     rem >= (I915_PDES - index) * I915_GTT_PAGE_SIZE))
 				maybe_64K = __gen8_pte_index(start, 1);
 
-			vaddr = kmap_atomic_px(pt);
+			vaddr = px_vaddr(pt);
 		}
 
 		do {
@@ -486,7 +483,6 @@ static void gen8_ppgtt_insert_huge(struct i915_vma *vma,
 		} while (rem >= page_size && index < I915_PDES);
 
 		clflush_cache_range(vaddr, PAGE_SIZE);
-		kunmap_atomic(vaddr);
 
 		/*
 		 * Is it safe to mark the 2M block as 64K? -- Either we have
@@ -500,9 +496,8 @@ static void gen8_ppgtt_insert_huge(struct i915_vma *vma,
 		      !iter->sg && IS_ALIGNED(vma->node.start +
 					      vma->node.size,
 					      I915_GTT_PAGE_SIZE_2M)))) {
-			vaddr = kmap_atomic_px(pd);
+			vaddr = px_vaddr(pd);
 			vaddr[maybe_64K] |= GEN8_PDE_IPS_64K;
-			kunmap_atomic(vaddr);
 			page_size = I915_GTT_PAGE_SIZE_64K;
 
 			/*
@@ -518,12 +513,11 @@ static void gen8_ppgtt_insert_huge(struct i915_vma *vma,
 				u16 i;
 
 				encode = vma->vm->scratch[0]->encode;
-				vaddr = kmap_atomic_px(i915_pt_entry(pd, maybe_64K));
+				vaddr = px_vaddr(i915_pt_entry(pd, maybe_64K));
 
 				for (i = 1; i < index; i += 16)
 					memset64(vaddr + i, encode, 15);
 
-				kunmap_atomic(vaddr);
 			}
 		}
 
@@ -592,7 +586,7 @@ static int gen8_init_scratch(struct i915_address_space *vm)
 		if (IS_ERR(obj))
 			goto free_scratch;
 
-		ret = pin_pt_dma(vm, obj);
+		ret = map_pt_dma(vm, obj);
 		if (ret) {
 			i915_gem_object_put(obj);
 			goto free_scratch;
@@ -629,7 +623,7 @@ static int gen8_preallocate_top_level_pdp(struct i915_ppgtt *ppgtt)
 		if (IS_ERR(pde))
 			return PTR_ERR(pde);
 
-		err = pin_pt_dma(vm, pde->pt.base);
+		err = map_pt_dma(vm, pde->pt.base);
 		if (err) {
 			i915_gem_object_put(pde->pt.base);
 			free_pd(vm, pde);
@@ -665,7 +659,7 @@ gen8_alloc_top_pd(struct i915_address_space *vm)
 		goto err_pd;
 	}
 
-	err = pin_pt_dma(vm, pd->pt.base);
+	err = map_pt_dma(vm, pd->pt.base);
 	if (err)
 		goto err_pd;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 17ecaef1834d..4560e03067a7 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -616,7 +616,7 @@ static int init_aliasing_ppgtt(struct i915_ggtt *ggtt)
 		goto err_ppgtt;
 
 	i915_gem_object_lock(ppgtt->vm.scratch[0], NULL);
-	err = i915_vm_pin_pt_stash(&ppgtt->vm, &stash);
+	err = i915_vm_map_pt_stash(&ppgtt->vm, &stash);
 	i915_gem_object_unlock(ppgtt->vm.scratch[0]);
 	if (err)
 		goto err_stash;
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 070d538cdc56..f3a263f09368 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -25,27 +25,25 @@ struct drm_i915_gem_object *alloc_pt_dma(struct i915_address_space *vm, int sz)
 	return obj;
 }
 
-int pin_pt_dma(struct i915_address_space *vm, struct drm_i915_gem_object *obj)
+int map_pt_dma(struct i915_address_space *vm, struct drm_i915_gem_object *obj)
 {
-	int err;
+	void *vaddr;
 
-	i915_gem_object_lock(obj, NULL);
-	err = i915_gem_object_pin_pages(obj);
-	i915_gem_object_unlock(obj);
-	if (err)
-		return err;
+	vaddr = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WB);
+	if (IS_ERR(vaddr))
+		return PTR_ERR(vaddr);
 
 	i915_gem_object_make_unshrinkable(obj);
 	return 0;
 }
 
-int pin_pt_dma_locked(struct i915_address_space *vm, struct drm_i915_gem_object *obj)
+int map_pt_dma_locked(struct i915_address_space *vm, struct drm_i915_gem_object *obj)
 {
-	int err;
+	void *vaddr;
 
-	err = i915_gem_object_pin_pages(obj);
-	if (err)
-		return err;
+	vaddr = i915_gem_object_pin_map(obj, I915_MAP_WB);
+	if (IS_ERR(vaddr))
+		return PTR_ERR(vaddr);
 
 	i915_gem_object_make_unshrinkable(obj);
 	return 0;
@@ -155,6 +153,14 @@ void clear_pages(struct i915_vma *vma)
 	memset(&vma->page_sizes, 0, sizeof(vma->page_sizes));
 }
 
+void *__px_vaddr(struct drm_i915_gem_object *p)
+{
+	enum i915_map_type type;
+
+	GEM_BUG_ON(!i915_gem_object_has_pages(p));
+	return page_unpack_bits(p->mm.mapping, &type);
+}
+
 dma_addr_t __px_dma(struct drm_i915_gem_object *p)
 {
 	GEM_BUG_ON(!i915_gem_object_has_pages(p));
@@ -170,32 +176,22 @@ struct page *__px_page(struct drm_i915_gem_object *p)
 void
 fill_page_dma(struct drm_i915_gem_object *p, const u64 val, unsigned int count)
 {
-	struct page *page = __px_page(p);
-	void *vaddr;
+	void *vaddr = __px_vaddr(p);
 
-	vaddr = kmap(page);
 	memset64(vaddr, val, count);
 	clflush_cache_range(vaddr, PAGE_SIZE);
-	kunmap(page);
 }
 
 static void poison_scratch_page(struct drm_i915_gem_object *scratch)
 {
-	struct sgt_iter sgt;
-	struct page *page;
+	void *vaddr = __px_vaddr(scratch);
 	u8 val;
 
 	val = 0;
 	if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
 		val = POISON_FREE;
 
-	for_each_sgt_page(page, sgt, scratch->mm.pages) {
-		void *vaddr;
-
-		vaddr = kmap(page);
-		memset(vaddr, val, PAGE_SIZE);
-		kunmap(page);
-	}
+	memset(vaddr, val, scratch->base.size);
 }
 
 int setup_scratch_page(struct i915_address_space *vm)
@@ -225,7 +221,7 @@ int setup_scratch_page(struct i915_address_space *vm)
 		if (IS_ERR(obj))
 			goto skip;
 
-		if (pin_pt_dma(vm, obj))
+		if (map_pt_dma(vm, obj))
 			goto skip_obj;
 
 		/* We need a single contiguous page for our scratch */
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 16063b2f0119..5b8ea9c8c654 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -176,6 +176,9 @@ struct page *__px_page(struct drm_i915_gem_object *p);
 dma_addr_t __px_dma(struct drm_i915_gem_object *p);
 #define px_dma(px) (__px_dma(px_base(px)))
 
+void *__px_vaddr(struct drm_i915_gem_object *p);
+#define px_vaddr(px) (__px_vaddr(px_base(px)))
+
 #define px_pt(px) \
 	__px_choose_expr(px, struct i915_page_table *, __x, \
 	__px_choose_expr(px, struct i915_page_directory *, &__x->pt, \
@@ -506,8 +509,6 @@ struct i915_ppgtt *i915_ppgtt_create(struct intel_gt *gt);
 void i915_ggtt_suspend(struct i915_ggtt *gtt);
 void i915_ggtt_resume(struct i915_ggtt *ggtt);
 
-#define kmap_atomic_px(px) kmap_atomic(__px_page(px_base(px)))
-
 void
 fill_page_dma(struct drm_i915_gem_object *p, const u64 val, unsigned int count);
 
@@ -525,8 +526,8 @@ struct i915_page_table *alloc_pt(struct i915_address_space *vm);
 struct i915_page_directory *alloc_pd(struct i915_address_space *vm);
 struct i915_page_directory *__alloc_pd(int npde);
 
-int pin_pt_dma(struct i915_address_space *vm, struct drm_i915_gem_object *obj);
-int pin_pt_dma_locked(struct i915_address_space *vm, struct drm_i915_gem_object *obj);
+int map_pt_dma(struct i915_address_space *vm, struct drm_i915_gem_object *obj);
+int map_pt_dma_locked(struct i915_address_space *vm, struct drm_i915_gem_object *obj);
 
 void free_px(struct i915_address_space *vm,
 	     struct i915_page_table *pt, int lvl);
@@ -573,7 +574,7 @@ void setup_private_pat(struct intel_uncore *uncore);
 int i915_vm_alloc_pt_stash(struct i915_address_space *vm,
 			   struct i915_vm_pt_stash *stash,
 			   u64 size);
-int i915_vm_pin_pt_stash(struct i915_address_space *vm,
+int i915_vm_map_pt_stash(struct i915_address_space *vm,
 			 struct i915_vm_pt_stash *stash);
 void i915_vm_free_pt_stash(struct i915_address_space *vm,
 			   struct i915_vm_pt_stash *stash);
diff --git a/drivers/gpu/drm/i915/gt/intel_ppgtt.c b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
index f3ac47702aee..8e7b77cc4594 100644
--- a/drivers/gpu/drm/i915/gt/intel_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
@@ -85,11 +85,10 @@ write_dma_entry(struct drm_i915_gem_object * const pdma,
 		const unsigned short idx,
 		const u64 encoded_entry)
 {
-	u64 * const vaddr = kmap_atomic(__px_page(pdma));
+	u64 * const vaddr = __px_vaddr(pdma);
 
 	vaddr[idx] = encoded_entry;
 	clflush_cache_range(&vaddr[idx], sizeof(u64));
-	kunmap_atomic(vaddr);
 }
 
 void
@@ -254,7 +253,7 @@ int i915_vm_alloc_pt_stash(struct i915_address_space *vm,
 	return 0;
 }
 
-int i915_vm_pin_pt_stash(struct i915_address_space *vm,
+int i915_vm_map_pt_stash(struct i915_address_space *vm,
 			 struct i915_vm_pt_stash *stash)
 {
 	struct i915_page_table *pt;
@@ -262,7 +261,7 @@ int i915_vm_pin_pt_stash(struct i915_address_space *vm,
 
 	for (n = 0; n < ARRAY_SIZE(stash->pt); n++) {
 		for (pt = stash->pt[n]; pt; pt = pt->stash) {
-			err = pin_pt_dma_locked(vm, pt->base);
+			err = map_pt_dma_locked(vm, pt->base);
 			if (err)
 				return err;
 		}
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 7243ab593aec..82f60cc43a90 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -914,8 +914,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 			if (err)
 				goto err_fence;
 
-			err = i915_vm_pin_pt_stash(vma->vm,
-						   &work->stash);
+			err = i915_vm_map_pt_stash(vma->vm, &work->stash);
 			if (err)
 				goto err_fence;
 		}
diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
index d07dd6780005..9653d7c259a5 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -185,7 +185,7 @@ static int igt_ppgtt_alloc(void *arg)
 		if (err)
 			goto err_ppgtt_cleanup;
 
-		err = i915_vm_pin_pt_stash(&ppgtt->vm, &stash);
+		err = i915_vm_map_pt_stash(&ppgtt->vm, &stash);
 		if (err) {
 			i915_vm_free_pt_stash(&ppgtt->vm, &stash);
 			goto err_ppgtt_cleanup;
@@ -207,7 +207,7 @@ static int igt_ppgtt_alloc(void *arg)
 		if (err)
 			goto err_ppgtt_cleanup;
 
-		err = i915_vm_pin_pt_stash(&ppgtt->vm, &stash);
+		err = i915_vm_map_pt_stash(&ppgtt->vm, &stash);
 		if (err) {
 			i915_vm_free_pt_stash(&ppgtt->vm, &stash);
 			goto err_ppgtt_cleanup;
@@ -324,11 +324,10 @@ static int lowlevel_hole(struct i915_address_space *vm,
 							   BIT_ULL(size)))
 					goto alloc_vm_end;
 
-				err = i915_vm_pin_pt_stash(vm, &stash);
+				err = i915_vm_map_pt_stash(vm, &stash);
 				if (!err)
 					vm->allocate_va_range(vm, &stash,
 							      addr, BIT_ULL(size));
-
 				i915_vm_free_pt_stash(vm, &stash);
 alloc_vm_end:
 				if (err == -EDEADLK) {
@@ -1966,10 +1965,9 @@ static int igt_cs_tlb(void *arg)
 			if (err)
 				goto end_ww;
 
-			err = i915_vm_pin_pt_stash(vm, &stash);
+			err = i915_vm_map_pt_stash(vm, &stash);
 			if (!err)
 				vm->allocate_va_range(vm, &stash, offset, chunk_size);
-
 			i915_vm_free_pt_stash(vm, &stash);
 end_ww:
 			if (err == -EDEADLK) {
diff --git a/drivers/gpu/drm/i915/selftests/i915_perf.c b/drivers/gpu/drm/i915/selftests/i915_perf.c
index debbac660519..6a7abb3e2bb5 100644
--- a/drivers/gpu/drm/i915/selftests/i915_perf.c
+++ b/drivers/gpu/drm/i915/selftests/i915_perf.c
@@ -307,7 +307,7 @@ static int live_noa_gpr(void *arg)
 	}
 
 	/* Poison the ce->vm so we detect writes not to the GGTT gt->scratch */
-	scratch = kmap(__px_page(ce->vm->scratch[0]));
+	scratch = __px_vaddr(ce->vm->scratch[0]);
 	memset(scratch, POISON_FREE, PAGE_SIZE);
 
 	rq = intel_context_create_request(ce);
@@ -405,7 +405,6 @@ static int live_noa_gpr(void *arg)
 out_rq:
 	i915_request_put(rq);
 out_ce:
-	kunmap(__px_page(ce->vm->scratch[0]));
 	intel_context_put(ce);
 out:
 	stream_destroy(stream);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
