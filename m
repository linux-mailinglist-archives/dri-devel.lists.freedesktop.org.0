Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D9A43D495
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 23:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739676E90C;
	Wed, 27 Oct 2021 21:21:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5754A6E90A;
 Wed, 27 Oct 2021 21:21:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="229020859"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="229020859"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 14:21:07 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="665154147"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 14:21:05 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ramalingam C <ramalingam.c@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 06/17] drm/i915/xehpsdv: support 64K GTT pages
Date: Thu, 28 Oct 2021 02:53:28 +0530
Message-Id: <20211027212339.29259-7-ramalingam.c@intel.com>
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

XEHPSDV optimises 64K GTT pages for local-memory, since everything
should be allocated at 64K granularity. We say goodbye to sparse
entries, and instead get a compact 256B page-table for 64K pages,
which should be more cache friendly. 4K pages for local-memory
are no longer supported by the HW.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  61 ++++++++++
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 106 +++++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_gtt.h           |   3 +
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |   1 +
 4 files changed, 168 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index b2003133deaf..eb581f5acae2 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -1456,6 +1456,66 @@ static int igt_ppgtt_sanity_check(void *arg)
 	return err;
 }
 
+static int igt_ppgtt_compact(void *arg)
+{
+	struct i915_gem_context *ctx = arg;
+	struct drm_i915_private *i915 = ctx->i915;
+	struct drm_i915_gem_object *obj;
+	int err;
+
+	/*
+	 * Simple test to catch issues with compact 64K pages -- since the pt is
+	 * compacted to 256B that gives us 32 entries per pt, however since the
+	 * backing page for the pt is 4K, any extra entries we might incorrectly
+	 * write out should be ignored by the HW. If ever hit such a case this
+	 * test should catch it since some of our writes would land in scratch.
+	 */
+
+	if (!HAS_64K_PAGES(i915)) {
+		pr_info("device lacks compact 64K page support, skipping\n");
+		return 0;
+	}
+
+	if (!HAS_LMEM(i915)) {
+		pr_info("device lacks LMEM support, skipping\n");
+		return 0;
+	}
+
+	/* We want the range to cover multiple page-table boundaries. */
+	obj = i915_gem_object_create_lmem(i915, SZ_4M, 0);
+	if (IS_ERR(obj))
+		return err;
+
+	err = i915_gem_object_pin_pages_unlocked(obj);
+	if (err)
+		goto out_put;
+
+	if (obj->mm.page_sizes.phys < I915_GTT_PAGE_SIZE_64K) {
+		pr_info("LMEM compact unable to allocate huge-page(s)\n");
+		goto out_unpin;
+	}
+
+	/*
+	 * Disable 2M GTT pages by forcing the page-size to 64K for the GTT
+	 * insertion.
+	 */
+	obj->mm.page_sizes.sg = I915_GTT_PAGE_SIZE_64K;
+
+	err = igt_write_huge(ctx, obj);
+	if (err)
+		pr_err("LMEM compact write-huge failed\n");
+
+out_unpin:
+	i915_gem_object_unpin_pages(obj);
+out_put:
+	i915_gem_object_put(obj);
+
+	if (err == -ENOMEM)
+		err = 0;
+
+	return err;
+}
+
 static int igt_tmpfs_fallback(void *arg)
 {
 	struct i915_gem_context *ctx = arg;
@@ -1686,6 +1746,7 @@ int i915_gem_huge_page_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(igt_tmpfs_fallback),
 		SUBTEST(igt_ppgtt_smoke_huge),
 		SUBTEST(igt_ppgtt_sanity_check),
+		SUBTEST(igt_ppgtt_compact),
 	};
 	struct i915_gem_context *ctx;
 	struct i915_address_space *vm;
diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index 4333652d8906..6b39b1ea0627 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -233,6 +233,8 @@ static u64 __gen8_ppgtt_clear(struct i915_address_space * const vm,
 						   start, end, lvl);
 		} else {
 			unsigned int count;
+			unsigned int pte = gen8_pd_index(start, 0);
+			unsigned int num_ptes;
 			u64 *vaddr;
 
 			count = gen8_pt_count(start, end);
@@ -242,10 +244,18 @@ static u64 __gen8_ppgtt_clear(struct i915_address_space * const vm,
 			    atomic_read(&pt->used));
 			GEM_BUG_ON(!count || count >= atomic_read(&pt->used));
 
+			num_ptes = count;
+			if (pt->is_compact) {
+				GEM_BUG_ON(num_ptes % 16);
+				GEM_BUG_ON(pte % 16);
+				num_ptes /= 16;
+				pte /= 16;
+			}
+
 			vaddr = px_vaddr(pt);
-			memset64(vaddr + gen8_pd_index(start, 0),
+			memset64(vaddr + pte,
 				 vm->scratch[0]->encode,
-				 count);
+				 num_ptes);
 
 			atomic_sub(count, &pt->used);
 			start += count;
@@ -453,6 +463,93 @@ gen8_ppgtt_insert_pte(struct i915_ppgtt *ppgtt,
 	return idx;
 }
 
+static void
+xehpsdv_ppgtt_insert_huge(struct i915_vma *vma,
+			  struct sgt_dma *iter,
+			  enum i915_cache_level cache_level,
+			  u32 flags)
+{
+	const gen8_pte_t pte_encode = vma->vm->pte_encode(0, cache_level, flags);
+	unsigned int rem = sg_dma_len(iter->sg);
+	u64 start = vma->node.start;
+
+	GEM_BUG_ON(!i915_vm_is_4lvl(vma->vm));
+
+	do {
+		struct i915_page_directory * const pdp =
+			gen8_pdp_for_page_address(vma->vm, start);
+		struct i915_page_directory * const pd =
+			i915_pd_entry(pdp, __gen8_pte_index(start, 2));
+		struct i915_page_table *pt =
+			i915_pt_entry(pd, __gen8_pte_index(start, 1));
+		gen8_pte_t encode = pte_encode;
+		unsigned int page_size;
+		gen8_pte_t *vaddr;
+		u16 index, max;
+
+		max = I915_PDES;
+
+		if (vma->page_sizes.sg & I915_GTT_PAGE_SIZE_2M &&
+		    IS_ALIGNED(iter->dma, I915_GTT_PAGE_SIZE_2M) &&
+		    rem >= I915_GTT_PAGE_SIZE_2M &&
+		    !__gen8_pte_index(start, 0)) {
+			index = __gen8_pte_index(start, 1);
+			encode |= GEN8_PDE_PS_2M;
+			page_size = I915_GTT_PAGE_SIZE_2M;
+
+			vaddr = px_vaddr(pd);
+		} else {
+			if (encode & GEN12_PPGTT_PTE_LM) {
+				GEM_BUG_ON(!i915_gem_object_is_lmem(vma->obj));
+				GEM_BUG_ON(__gen8_pte_index(start, 0) % 16);
+				GEM_BUG_ON(rem < I915_GTT_PAGE_SIZE_64K);
+				GEM_BUG_ON(!IS_ALIGNED(iter->dma,
+						       I915_GTT_PAGE_SIZE_64K));
+
+				index = __gen8_pte_index(start, 0) / 16;
+				page_size = I915_GTT_PAGE_SIZE_64K;
+
+				max /= 16;
+
+				vaddr = px_vaddr(pd);
+				vaddr[__gen8_pte_index(start, 1)] |= GEN12_PDE_64K;
+
+				pt->is_compact = true;
+			} else {
+				GEM_BUG_ON(i915_gem_object_is_lmem(vma->obj));
+				GEM_BUG_ON(pt->is_compact);
+				index =  __gen8_pte_index(start, 0);
+				page_size = I915_GTT_PAGE_SIZE;
+			}
+
+			vaddr = px_vaddr(pt);
+		}
+
+		do {
+			GEM_BUG_ON(rem < page_size);
+			vaddr[index++] = encode | iter->dma;
+
+			start += page_size;
+			iter->dma += page_size;
+			rem -= page_size;
+			if (iter->dma >= iter->max) {
+				iter->sg = __sg_next(iter->sg);
+				GEM_BUG_ON(!iter->sg);
+
+				rem = sg_dma_len(iter->sg);
+				GEM_BUG_ON(!rem);
+				iter->dma = sg_dma_address(iter->sg);
+				iter->max = iter->dma + rem;
+
+				if (unlikely(!IS_ALIGNED(iter->dma, page_size)))
+					break;
+			}
+		} while (rem >= page_size && index < max);
+
+		vma->page_sizes.gtt |= page_size;
+	} while (iter->sg && sg_dma_len(iter->sg));
+}
+
 static void gen8_ppgtt_insert_huge(struct i915_vma *vma,
 				   struct sgt_dma *iter,
 				   enum i915_cache_level cache_level,
@@ -585,7 +682,10 @@ static void gen8_ppgtt_insert(struct i915_address_space *vm,
 	struct sgt_dma iter = sgt_dma(vma);
 
 	if (vma->page_sizes.sg > I915_GTT_PAGE_SIZE) {
-		gen8_ppgtt_insert_huge(vma, &iter, cache_level, flags);
+		if (HAS_64K_PAGES(vm->i915))
+			xehpsdv_ppgtt_insert_huge(vma, &iter, cache_level, flags);
+		else
+			gen8_ppgtt_insert_huge(vma, &iter, cache_level, flags);
 	} else  {
 		u64 idx = vma->node.start >> GEN8_PTE_SHIFT;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 180da7c7f3f9..20101eef4c95 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -91,6 +91,8 @@ typedef u64 gen8_pte_t;
 
 #define GEN12_GGTT_PTE_LM	BIT_ULL(1)
 
+#define GEN12_PDE_64K BIT(6)
+
 /*
  * Cacheability Control is a 4-bit value. The low three bits are stored in bits
  * 3:1 of the PTE, while the fourth bit is stored in bit 11 of the PTE.
@@ -156,6 +158,7 @@ struct i915_page_table {
 		atomic_t used;
 		struct i915_page_table *stash;
 	};
+	bool is_compact;
 };
 
 struct i915_page_directory {
diff --git a/drivers/gpu/drm/i915/gt/intel_ppgtt.c b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
index 4396bfd630d8..b8238f5bc8b1 100644
--- a/drivers/gpu/drm/i915/gt/intel_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
@@ -26,6 +26,7 @@ struct i915_page_table *alloc_pt(struct i915_address_space *vm)
 		return ERR_PTR(-ENOMEM);
 	}
 
+	pt->is_compact = false;
 	atomic_set(&pt->used, 0);
 	return pt;
 }
-- 
2.20.1

