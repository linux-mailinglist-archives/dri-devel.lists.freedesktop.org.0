Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1949248B4CF
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 19:03:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05AC010E270;
	Tue, 11 Jan 2022 18:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769AD10E25A;
 Tue, 11 Jan 2022 18:03:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 0B0801F445D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641924205;
 bh=s0+iF2R8Xve2HZae7t6NYVCcOhicc3JQg10VCd07Nt8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZPPPNHFE6+qv06uedocO2OFWokLX2UbE7TAPcSjwlqdX25rJhWiQI8qnYLL4IJsg6
 rhQPM9NSobOVlREfh8snPBKIMVaX1TUQw6uWCLjnUzraZtbL8U0WNJCpSN1L1mcZNE
 DeqsvdDdw/k0GLilmyEtV3auvCUu0CVsDm9SZ1+hEB8QcksBLxYcfLVQC/sPPrjaRO
 8g77x3AT4xfZAMVjk25RPp3d32/DZ9vnVCoghnoyLnWAAI3uT0l8xTimzDrqalNSOX
 /M6ZP9QoHd4UKO2kjJjwSLXBcjZSsbZ/kpb8w33YdLFYMX+Ei5u5HclCMM77WUC8wX
 //wZi+dYYx8Kw==
From: Robert Beckett <bob.beckett@collabora.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/4] drm/i915: support 64K GTT pages for discrete cards
Date: Tue, 11 Jan 2022 18:02:36 +0000
Message-Id: <20220111180238.1370631-3-bob.beckett@collabora.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Auld <matthew.auld@intel.com>

discrete cards optimise 64K GTT pages for local-memory, since everything
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
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  60 ++++++++++
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 109 +++++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_gtt.h           |   3 +
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |   1 +
 4 files changed, 170 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index 11f0aa65f8a3..ef3439b290ca 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -1483,6 +1483,65 @@ static int igt_ppgtt_sanity_check(void *arg)
 	return err;
 }
 
+static int igt_ppgtt_compact(void *arg)
+{
+	struct drm_i915_private *i915 = arg;
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
+	err = igt_write_huge(i915, obj);
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
 	struct drm_i915_private *i915 = arg;
@@ -1740,6 +1799,7 @@ int i915_gem_huge_page_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(igt_tmpfs_fallback),
 		SUBTEST(igt_ppgtt_smoke_huge),
 		SUBTEST(igt_ppgtt_sanity_check),
+		SUBTEST(igt_ppgtt_compact),
 	};
 
 	if (!HAS_PPGTT(i915)) {
diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index b012c50f7ce7..8d081497e87e 100644
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
@@ -453,6 +463,96 @@ gen8_ppgtt_insert_pte(struct i915_ppgtt *ppgtt,
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
+				if (!iter->sg)
+					break;
+
+				rem = sg_dma_len(iter->sg);
+				if (!rem)
+					break;
+
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
@@ -585,7 +685,10 @@ static void gen8_ppgtt_insert(struct i915_address_space *vm,
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
index b24a496c854e..ef6d5c70f4ff 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -91,6 +91,8 @@ typedef u64 gen8_pte_t;
 
 #define GEN12_GGTT_PTE_LM	BIT_ULL(1)
 
+#define GEN12_PDE_64K BIT(6)
+
 /*
  * Cacheability Control is a 4-bit value. The low three bits are stored in bits
  * 3:1 of the PTE, while the fourth bit is stored in bit 11 of the PTE.
@@ -159,6 +161,7 @@ struct i915_page_table {
 		atomic_t used;
 		struct i915_page_table *stash;
 	};
+	bool is_compact;
 };
 
 struct i915_page_directory {
diff --git a/drivers/gpu/drm/i915/gt/intel_ppgtt.c b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
index 083b3090c69c..f4cb6544cfac 100644
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
2.25.1

