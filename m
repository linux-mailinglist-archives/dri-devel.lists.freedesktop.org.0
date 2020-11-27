Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 535592C6520
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:12:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE3B6ECD2;
	Fri, 27 Nov 2020 12:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1999B6ECC8;
 Fri, 27 Nov 2020 12:10:47 +0000 (UTC)
IronPort-SDR: wRbWTWhp883a5JQ1gupnZTMTcO7wPhtVMYIDvgYkPNbMt4+U3eP/+3s3ix3tQWprP+tNNz6nJP
 dwJ8oBjOOhjg==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092785"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092785"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:31 -0800
IronPort-SDR: 3tBJ/ApMSaLex4087EGFuy4hDXLk+cpNmQHZOeNrc/8yswnfQ+n0IDw/duL/YNob7U6dWetZNn
 BoZpFWHPeGuw==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029378"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:30 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 100/162] drm/i915/gtt: make flushing conditional
Date: Fri, 27 Nov 2020 12:06:16 +0000
Message-Id: <20201127120718.454037-101-matthew.auld@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that PDs can also be mapped as WC, we can forgo all the flushing for
such mappings.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 .../drm/i915/gem/selftests/i915_gem_context.c |  2 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |  6 ++---
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 26 ++++++++++++-------
 drivers/gpu/drm/i915/gt/intel_gtt.c           | 20 ++++++++++----
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  4 +--
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  6 +++--
 drivers/gpu/drm/i915/selftests/i915_perf.c    |  2 +-
 7 files changed, 42 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index ce70d0a3afb2..e52cc74db2b1 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -1752,7 +1752,7 @@ static int check_scratch_page(struct i915_gem_context *ctx, u32 *out)
 		return -EINVAL;
 	}
 
-	vaddr = __px_vaddr(vm->scratch[0]);
+	vaddr = __px_vaddr(vm->scratch[0], NULL);
 
 	memcpy(out, vaddr, sizeof(*out));
 	if (memchr_inv(vaddr, *out, PAGE_SIZE)) {
diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
index 78ad7d8a8bcc..8d12e9334861 100644
--- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
@@ -105,7 +105,7 @@ static void gen6_ppgtt_clear_range(struct i915_address_space *vm,
 		 * entries back to scratch.
 		 */
 
-		vaddr = px_vaddr(pt);
+		vaddr = px_vaddr(pt, NULL);
 		memset32(vaddr + pte, scratch_pte, count);
 
 		pte = 0;
@@ -128,7 +128,7 @@ static void gen6_ppgtt_insert_entries(struct i915_address_space *vm,
 
 	GEM_BUG_ON(!pd->entry[act_pt]);
 
-	vaddr = px_vaddr(i915_pt_entry(pd, act_pt));
+	vaddr = px_vaddr(i915_pt_entry(pd, act_pt), NULL);
 	do {
 		GEM_BUG_ON(sg_dma_len(iter.sg) < I915_GTT_PAGE_SIZE);
 		vaddr[act_pte] = pte_encode | GEN6_PTE_ADDR_ENCODE(iter.dma);
@@ -144,7 +144,7 @@ static void gen6_ppgtt_insert_entries(struct i915_address_space *vm,
 		}
 
 		if (++act_pte == GEN6_PTES) {
-			vaddr = px_vaddr(i915_pt_entry(pd, ++act_pt));
+			vaddr = px_vaddr(i915_pt_entry(pd, ++act_pt), NULL);
 			act_pte = 0;
 		}
 	} while (1);
diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index f67e0332ccbc..e2f1dfc48d43 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -237,7 +237,7 @@ static u64 __gen8_ppgtt_clear(struct i915_address_space * const vm,
 			    atomic_read(&pt->used));
 			GEM_BUG_ON(!count || count >= atomic_read(&pt->used));
 
-			vaddr = px_vaddr(pt);
+			vaddr = px_vaddr(pt, NULL);
 			memset64(vaddr + gen8_pd_index(start, 0),
 				 vm->scratch[0]->encode,
 				 count);
@@ -367,9 +367,10 @@ gen8_ppgtt_insert_pte(struct i915_ppgtt *ppgtt,
 	struct i915_page_directory *pd;
 	const gen8_pte_t pte_encode = gen8_pte_encode(0, cache_level, flags);
 	gen8_pte_t *vaddr;
+	bool needs_flush;
 
 	pd = i915_pd_entry(pdp, gen8_pd_index(idx, 2));
-	vaddr = px_vaddr(i915_pt_entry(pd, gen8_pd_index(idx, 1)));
+	vaddr = px_vaddr(i915_pt_entry(pd, gen8_pd_index(idx, 1)), &needs_flush);
 	do {
 		GEM_BUG_ON(sg_dma_len(iter->sg) < I915_GTT_PAGE_SIZE);
 		vaddr[gen8_pd_index(idx, 0)] = pte_encode | iter->dma;
@@ -395,11 +396,14 @@ gen8_ppgtt_insert_pte(struct i915_ppgtt *ppgtt,
 				pd = pdp->entry[gen8_pd_index(idx, 2)];
 			}
 
-			clflush_cache_range(vaddr, PAGE_SIZE);
-			vaddr = px_vaddr(i915_pt_entry(pd, gen8_pd_index(idx, 1)));
+			if (needs_flush)
+				clflush_cache_range(vaddr, PAGE_SIZE);
+			vaddr = px_vaddr(i915_pt_entry(pd, gen8_pd_index(idx, 1)),
+					 &needs_flush);
 		}
 	} while (1);
-	clflush_cache_range(vaddr, PAGE_SIZE);
+	if (needs_flush)
+		clflush_cache_range(vaddr, PAGE_SIZE);
 
 	return idx;
 }
@@ -412,6 +416,7 @@ static void gen8_ppgtt_insert_huge(struct i915_vma *vma,
 	const gen8_pte_t pte_encode = gen8_pte_encode(0, cache_level, flags);
 	unsigned int rem = sg_dma_len(iter->sg);
 	u64 start = vma->node.start;
+	bool needs_flush;
 
 	GEM_BUG_ON(!i915_vm_is_4lvl(vma->vm));
 
@@ -434,7 +439,7 @@ static void gen8_ppgtt_insert_huge(struct i915_vma *vma,
 			encode |= GEN8_PDE_PS_2M;
 			page_size = I915_GTT_PAGE_SIZE_2M;
 
-			vaddr = px_vaddr(pd);
+			vaddr = px_vaddr(pd, &needs_flush);
 		} else {
 			struct i915_page_table *pt =
 				i915_pt_entry(pd, __gen8_pte_index(start, 1));
@@ -449,7 +454,7 @@ static void gen8_ppgtt_insert_huge(struct i915_vma *vma,
 			     rem >= (I915_PDES - index) * I915_GTT_PAGE_SIZE))
 				maybe_64K = __gen8_pte_index(start, 1);
 
-			vaddr = px_vaddr(pt);
+			vaddr = px_vaddr(pt, &needs_flush);
 		}
 
 		do {
@@ -482,7 +487,8 @@ static void gen8_ppgtt_insert_huge(struct i915_vma *vma,
 			}
 		} while (rem >= page_size && index < I915_PDES);
 
-		clflush_cache_range(vaddr, PAGE_SIZE);
+		if (needs_flush)
+			clflush_cache_range(vaddr, PAGE_SIZE);
 
 		/*
 		 * Is it safe to mark the 2M block as 64K? -- Either we have
@@ -496,7 +502,7 @@ static void gen8_ppgtt_insert_huge(struct i915_vma *vma,
 		      !iter->sg && IS_ALIGNED(vma->node.start +
 					      vma->node.size,
 					      I915_GTT_PAGE_SIZE_2M)))) {
-			vaddr = px_vaddr(pd);
+			vaddr = px_vaddr(pd, NULL);
 			vaddr[maybe_64K] |= GEN8_PDE_IPS_64K;
 			page_size = I915_GTT_PAGE_SIZE_64K;
 
@@ -513,7 +519,7 @@ static void gen8_ppgtt_insert_huge(struct i915_vma *vma,
 				u16 i;
 
 				encode = vma->vm->scratch[0]->encode;
-				vaddr = px_vaddr(i915_pt_entry(pd, maybe_64K));
+				vaddr = px_vaddr(i915_pt_entry(pd, maybe_64K), NULL);
 
 				for (i = 1; i < index; i += 16)
 					memset64(vaddr + i, encode, 15);
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 2605bfd39a15..eee8338e330b 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -176,12 +176,19 @@ void clear_pages(struct i915_vma *vma)
 	memset(&vma->page_sizes, 0, sizeof(vma->page_sizes));
 }
 
-void *__px_vaddr(struct drm_i915_gem_object *p)
+void *__px_vaddr(struct drm_i915_gem_object *p, bool *needs_flush)
 {
 	enum i915_map_type type;
+	void *vaddr;
 
 	GEM_BUG_ON(!i915_gem_object_has_pages(p));
-	return page_unpack_bits(p->mm.mapping, &type);
+
+	vaddr = page_unpack_bits(p->mm.mapping, &type);
+
+	if (needs_flush)
+		*needs_flush = type != I915_MAP_WC;
+
+	return vaddr;
 }
 
 dma_addr_t __px_dma(struct drm_i915_gem_object *p)
@@ -199,15 +206,18 @@ struct page *__px_page(struct drm_i915_gem_object *p)
 void
 fill_page_dma(struct drm_i915_gem_object *p, const u64 val, unsigned int count)
 {
-	void *vaddr = __px_vaddr(p);
+	bool needs_flush;
+	void *vaddr;
 
+	vaddr = __px_vaddr(p, &needs_flush);
 	memset64(vaddr, val, count);
-	clflush_cache_range(vaddr, PAGE_SIZE);
+	if (needs_flush)
+		clflush_cache_range(vaddr, PAGE_SIZE);
 }
 
 static void poison_scratch_page(struct drm_i915_gem_object *scratch)
 {
-	void *vaddr = __px_vaddr(scratch);
+	void *vaddr = __px_vaddr(scratch, NULL);
 	u8 val;
 
 	val = 0;
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index bdbdfded60cc..d96bd19d1b47 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -176,8 +176,8 @@ struct page *__px_page(struct drm_i915_gem_object *p);
 dma_addr_t __px_dma(struct drm_i915_gem_object *p);
 #define px_dma(px) (__px_dma(px_base(px)))
 
-void *__px_vaddr(struct drm_i915_gem_object *p);
-#define px_vaddr(px) (__px_vaddr(px_base(px)))
+void *__px_vaddr(struct drm_i915_gem_object *p, bool *needs_flush);
+#define px_vaddr(px, needs_flush) (__px_vaddr(px_base(px), needs_flush))
 
 #define px_pt(px) \
 	__px_choose_expr(px, struct i915_page_table *, __x, \
diff --git a/drivers/gpu/drm/i915/gt/intel_ppgtt.c b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
index 8e7b77cc4594..2d74ae950e4b 100644
--- a/drivers/gpu/drm/i915/gt/intel_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
@@ -85,10 +85,12 @@ write_dma_entry(struct drm_i915_gem_object * const pdma,
 		const unsigned short idx,
 		const u64 encoded_entry)
 {
-	u64 * const vaddr = __px_vaddr(pdma);
+	bool needs_flush;
+	u64 * const vaddr = __px_vaddr(pdma, &needs_flush);
 
 	vaddr[idx] = encoded_entry;
-	clflush_cache_range(&vaddr[idx], sizeof(u64));
+	if (needs_flush)
+		clflush_cache_range(&vaddr[idx], sizeof(u64));
 }
 
 void
diff --git a/drivers/gpu/drm/i915/selftests/i915_perf.c b/drivers/gpu/drm/i915/selftests/i915_perf.c
index 6a7abb3e2bb5..6698750ffe8d 100644
--- a/drivers/gpu/drm/i915/selftests/i915_perf.c
+++ b/drivers/gpu/drm/i915/selftests/i915_perf.c
@@ -307,7 +307,7 @@ static int live_noa_gpr(void *arg)
 	}
 
 	/* Poison the ce->vm so we detect writes not to the GGTT gt->scratch */
-	scratch = __px_vaddr(ce->vm->scratch[0]);
+	scratch = __px_vaddr(ce->vm->scratch[0], NULL);
 	memset(scratch, POISON_FREE, PAGE_SIZE);
 
 	rq = intel_context_create_request(ce);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
