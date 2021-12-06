Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE12469729
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 14:32:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD677AA13;
	Mon,  6 Dec 2021 13:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B287A7A494;
 Mon,  6 Dec 2021 13:32:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10189"; a="237537414"
X-IronPort-AV: E=Sophos;i="5.87,291,1631602800"; d="scan'208";a="237537414"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2021 05:32:36 -0800
X-IronPort-AV: E=Sophos;i="5.87,291,1631602800"; d="scan'208";a="514737485"
Received: from bgodonne-mobl1.amr.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.17.226])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2021 05:32:34 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 7/8] drm/i915/migrate: add acceleration support for DG2
Date: Mon,  6 Dec 2021 13:31:39 +0000
Message-Id: <20211206133140.3166205-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211206133140.3166205-1-matthew.auld@intel.com>
References: <20211206133140.3166205-1-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is all kinds of awkward since we now have to contend with using 64K
GTT pages when mapping anything in LMEM(including the page-tables
themselves).

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 189 +++++++++++++++++++-----
 1 file changed, 150 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index 0192b61ab541..fb658ae70a8d 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -33,6 +33,38 @@ static bool engine_supports_migration(struct intel_engine_cs *engine)
 	return true;
 }
 
+static void xehpsdv_toggle_pdes(struct i915_address_space *vm,
+				struct i915_page_table *pt,
+				void *data)
+{
+	struct insert_pte_data *d = data;
+
+	/*
+	 * Insert a dummy PTE into every PT that will map to LMEM to ensure
+	 * we have a correctly setup PDE structure for later use.
+	 */
+	vm->insert_page(vm, 0, d->offset, I915_CACHE_NONE, PTE_LM);
+	GEM_BUG_ON(!pt->is_compact);
+	d->offset += SZ_2M;
+}
+
+static void xehpsdv_insert_pte(struct i915_address_space *vm,
+			       struct i915_page_table *pt,
+			       void *data)
+{
+	struct insert_pte_data *d = data;
+
+	/*
+	 * We are playing tricks here, since the actual pt, from the hw
+	 * pov, is only 256bytes with 32 entries, or 4096bytes with 512
+	 * entries, but we are still guaranteed that the physical
+	 * alignment is 64K underneath for the pt, and we are careful
+	 * not to access the space in the void.
+	 */
+	vm->insert_page(vm, px_dma(pt), d->offset, I915_CACHE_NONE, PTE_LM);
+	d->offset += SZ_64K;
+}
+
 static void insert_pte(struct i915_address_space *vm,
 		       struct i915_page_table *pt,
 		       void *data)
@@ -75,7 +107,12 @@ static struct i915_address_space *migrate_vm(struct intel_gt *gt)
 	 * i.e. within the same non-preemptible window so that we do not switch
 	 * to another migration context that overwrites the PTE.
 	 *
-	 * TODO: Add support for huge LMEM PTEs
+	 * On platforms with HAS_64K_PAGES support we have three windows, and
+	 * dedicate two windows just for mapping lmem pages(smem <-> smem is not
+	 * a thing), since we are forced to use 64K GTT pages underneath which
+	 * requires also modifying the PDE. An alternative might be to instead
+	 * map the PD into the GTT, and then on the fly toggle the 4K/64K mode
+	 * in the PDE from the same batch that also modifies the PTEs.
 	 */
 
 	vm = i915_ppgtt_create(gt, I915_BO_ALLOC_PM_EARLY);
@@ -87,6 +124,9 @@ static struct i915_address_space *migrate_vm(struct intel_gt *gt)
 		goto err_vm;
 	}
 
+	if (HAS_64K_PAGES(gt->i915))
+		stash.pt_sz = I915_GTT_PAGE_SIZE_64K;
+
 	/*
 	 * Each engine instance is assigned its own chunk in the VM, so
 	 * that we can run multiple instances concurrently
@@ -106,14 +146,20 @@ static struct i915_address_space *migrate_vm(struct intel_gt *gt)
 		 * We copy in 8MiB chunks. Each PDE covers 2MiB, so we need
 		 * 4x2 page directories for source/destination.
 		 */
-		sz = 2 * CHUNK_SZ;
+		if (HAS_64K_PAGES(gt->i915))
+			sz = 3 * CHUNK_SZ;
+		else
+			sz = 2 * CHUNK_SZ;
 		d.offset = base + sz;
 
 		/*
 		 * We need another page directory setup so that we can write
 		 * the 8x512 PTE in each chunk.
 		 */
-		sz += (sz >> 12) * sizeof(u64);
+		if (HAS_64K_PAGES(gt->i915))
+			sz += (sz / SZ_2M) * SZ_64K;
+		else
+			sz += (sz >> 12) * sizeof(u64);
 
 		err = i915_vm_alloc_pt_stash(&vm->vm, &stash, sz);
 		if (err)
@@ -134,7 +180,18 @@ static struct i915_address_space *migrate_vm(struct intel_gt *gt)
 			goto err_vm;
 
 		/* Now allow the GPU to rewrite the PTE via its own ppGTT */
-		vm->vm.foreach(&vm->vm, base, d.offset - base, insert_pte, &d);
+		if (HAS_64K_PAGES(gt->i915)) {
+			vm->vm.foreach(&vm->vm, base, d.offset - base,
+				       xehpsdv_insert_pte, &d);
+			d.offset = base + CHUNK_SZ;
+			vm->vm.foreach(&vm->vm,
+				       d.offset,
+				       2 * CHUNK_SZ,
+				       xehpsdv_toggle_pdes, &d);
+		} else {
+			vm->vm.foreach(&vm->vm, base, d.offset - base,
+				       insert_pte, &d);
+		}
 	}
 
 	return &vm->vm;
@@ -272,19 +329,38 @@ static int emit_pte(struct i915_request *rq,
 		    u64 offset,
 		    int length)
 {
+	bool has_64K_pages = HAS_64K_PAGES(rq->engine->i915);
 	const u64 encode = rq->context->vm->pte_encode(0, cache_level,
 						       is_lmem ? PTE_LM : 0);
 	struct intel_ring *ring = rq->ring;
-	int total = 0;
+	int pkt, dword_length;
+	u32 total = 0;
+	u32 page_size;
 	u32 *hdr, *cs;
-	int pkt;
 
 	GEM_BUG_ON(GRAPHICS_VER(rq->engine->i915) < 8);
 
+	page_size = I915_GTT_PAGE_SIZE;
+	dword_length = 0x400;
+
 	/* Compute the page directory offset for the target address range */
-	offset >>= 12;
-	offset *= sizeof(u64);
-	offset += 2 * CHUNK_SZ;
+	if (has_64K_pages) {
+		GEM_BUG_ON(!IS_ALIGNED(offset, SZ_2M));
+
+		offset /= SZ_2M;
+		offset *= SZ_64K;
+		offset += 3 * CHUNK_SZ;
+
+		if (is_lmem) {
+			page_size = I915_GTT_PAGE_SIZE_64K;
+			dword_length = 0x40;
+		}
+	} else {
+		offset >>= 12;
+		offset *= sizeof(u64);
+		offset += 2 * CHUNK_SZ;
+	}
+
 	offset += (u64)rq->engine->instance << 32;
 
 	cs = intel_ring_begin(rq, 6);
@@ -292,7 +368,7 @@ static int emit_pte(struct i915_request *rq,
 		return PTR_ERR(cs);
 
 	/* Pack as many PTE updates as possible into a single MI command */
-	pkt = min_t(int, 0x400, ring->space / sizeof(u32) + 5);
+	pkt = min_t(int, dword_length, ring->space / sizeof(u32) + 5);
 	pkt = min_t(int, pkt, (ring->size - ring->emit) / sizeof(u32) + 5);
 
 	hdr = cs;
@@ -302,6 +378,8 @@ static int emit_pte(struct i915_request *rq,
 
 	do {
 		if (cs - hdr >= pkt) {
+			int dword_rem;
+
 			*hdr += cs - hdr - 2;
 			*cs++ = MI_NOOP;
 
@@ -313,7 +391,18 @@ static int emit_pte(struct i915_request *rq,
 			if (IS_ERR(cs))
 				return PTR_ERR(cs);
 
-			pkt = min_t(int, 0x400, ring->space / sizeof(u32) + 5);
+			dword_rem = dword_length;
+			if (has_64K_pages) {
+				if (IS_ALIGNED(total, SZ_2M)) {
+					offset = round_up(offset, SZ_64K);
+				} else {
+					dword_rem = SZ_2M - (total & (SZ_2M - 1));
+					dword_rem /= page_size;
+					dword_rem *= 2;
+				}
+			}
+
+			pkt = min_t(int, dword_rem, ring->space / sizeof(u32) + 5);
 			pkt = min_t(int, pkt, (ring->size - ring->emit) / sizeof(u32) + 5);
 
 			hdr = cs;
@@ -322,13 +411,15 @@ static int emit_pte(struct i915_request *rq,
 			*cs++ = upper_32_bits(offset);
 		}
 
+		GEM_BUG_ON(!IS_ALIGNED(it->dma, page_size));
+
 		*cs++ = lower_32_bits(encode | it->dma);
 		*cs++ = upper_32_bits(encode | it->dma);
 
 		offset += 8;
-		total += I915_GTT_PAGE_SIZE;
+		total += page_size;
 
-		it->dma += I915_GTT_PAGE_SIZE;
+		it->dma += page_size;
 		if (it->dma >= it->max) {
 			it->sg = __sg_next(it->sg);
 			if (!it->sg || sg_dma_len(it->sg) == 0)
@@ -359,7 +450,8 @@ static bool wa_1209644611_applies(int ver, u32 size)
 	return height % 4 == 3 && height <= 8;
 }
 
-static int emit_copy(struct i915_request *rq, int size)
+static int emit_copy(struct i915_request *rq,
+		     u32 dst_offset, u32 src_offset, int size)
 {
 	const int ver = GRAPHICS_VER(rq->engine->i915);
 	u32 instance = rq->engine->instance;
@@ -374,31 +466,31 @@ static int emit_copy(struct i915_request *rq, int size)
 		*cs++ = BLT_DEPTH_32 | PAGE_SIZE;
 		*cs++ = 0;
 		*cs++ = size >> PAGE_SHIFT << 16 | PAGE_SIZE / 4;
-		*cs++ = CHUNK_SZ; /* dst offset */
+		*cs++ = dst_offset;
 		*cs++ = instance;
 		*cs++ = 0;
 		*cs++ = PAGE_SIZE;
-		*cs++ = 0; /* src offset */
+		*cs++ = src_offset;
 		*cs++ = instance;
 	} else if (ver >= 8) {
 		*cs++ = XY_SRC_COPY_BLT_CMD | BLT_WRITE_RGBA | (10 - 2);
 		*cs++ = BLT_DEPTH_32 | BLT_ROP_SRC_COPY | PAGE_SIZE;
 		*cs++ = 0;
 		*cs++ = size >> PAGE_SHIFT << 16 | PAGE_SIZE / 4;
-		*cs++ = CHUNK_SZ; /* dst offset */
+		*cs++ = dst_offset;
 		*cs++ = instance;
 		*cs++ = 0;
 		*cs++ = PAGE_SIZE;
-		*cs++ = 0; /* src offset */
+		*cs++ = src_offset;
 		*cs++ = instance;
 	} else {
 		GEM_BUG_ON(instance);
 		*cs++ = SRC_COPY_BLT_CMD | BLT_WRITE_RGBA | (6 - 2);
 		*cs++ = BLT_DEPTH_32 | BLT_ROP_SRC_COPY | PAGE_SIZE;
 		*cs++ = size >> PAGE_SHIFT << 16 | PAGE_SIZE;
-		*cs++ = CHUNK_SZ; /* dst offset */
+		*cs++ = dst_offset;
 		*cs++ = PAGE_SIZE;
-		*cs++ = 0; /* src offset */
+		*cs++ = src_offset;
 	}
 
 	intel_ring_advance(rq, cs);
@@ -426,6 +518,7 @@ intel_context_migrate_copy(struct intel_context *ce,
 	GEM_BUG_ON(ce->ring->size < SZ_64K);
 
 	do {
+		u32 src_offset, dst_offset;
 		int len;
 
 		rq = i915_request_create(ce);
@@ -453,15 +546,28 @@ intel_context_migrate_copy(struct intel_context *ce,
 		if (err)
 			goto out_rq;
 
-		len = emit_pte(rq, &it_src, src_cache_level, src_is_lmem, 0,
-			       CHUNK_SZ);
+		src_offset = 0;
+		dst_offset = CHUNK_SZ;
+		if (HAS_64K_PAGES(ce->engine->i915)) {
+			GEM_BUG_ON(!src_is_lmem && !dst_is_lmem);
+
+			src_offset = 0;
+			dst_offset = 0;
+			if (src_is_lmem)
+				src_offset = CHUNK_SZ;
+			if (dst_is_lmem)
+				dst_offset = 2 * CHUNK_SZ;
+		}
+
+		len = emit_pte(rq, &it_src, src_cache_level, src_is_lmem,
+			       src_offset, CHUNK_SZ);
 		if (len <= 0) {
 			err = len;
 			goto out_rq;
 		}
 
 		err = emit_pte(rq, &it_dst, dst_cache_level, dst_is_lmem,
-			       CHUNK_SZ, len);
+			       dst_offset, len);
 		if (err < 0)
 			goto out_rq;
 		if (err < len) {
@@ -473,7 +579,7 @@ intel_context_migrate_copy(struct intel_context *ce,
 		if (err)
 			goto out_rq;
 
-		err = emit_copy(rq, len);
+		err = emit_copy(rq, dst_offset, src_offset, len);
 
 		/* Arbitration is re-enabled between requests. */
 out_rq:
@@ -571,18 +677,20 @@ static u32 *_i915_ctrl_surf_copy_blt(u32 *cmd, u64 src_addr, u64 dst_addr,
 }
 
 static int emit_clear(struct i915_request *rq,
+		      u64 offset,
 		      int size,
 		      u32 value,
 		      bool is_lmem)
 {
-	const int ver = GRAPHICS_VER(rq->engine->i915);
-	u32 instance = rq->engine->instance;
-	u32 *cs;
 	struct drm_i915_private *i915 = rq->engine->i915;
+	const int ver = GRAPHICS_VER(rq->engine->i915);
 	u32 num_ccs_blks, ccs_ring_size;
+	u32 *cs;
 
 	GEM_BUG_ON(size >> PAGE_SHIFT > S16_MAX);
 
+	offset += (u64)rq->engine->instance << 32;
+
 	/* Clear flat css only when value is 0 */
 	ccs_ring_size = (is_lmem && !value) ?
 			 calc_ctrl_surf_instr_size(i915, size)
@@ -597,17 +705,17 @@ static int emit_clear(struct i915_request *rq,
 		*cs++ = BLT_DEPTH_32 | BLT_ROP_COLOR_COPY | PAGE_SIZE;
 		*cs++ = 0;
 		*cs++ = size >> PAGE_SHIFT << 16 | PAGE_SIZE / 4;
-		*cs++ = 0; /* offset */
-		*cs++ = instance;
+		*cs++ = lower_32_bits(offset);
+		*cs++ = upper_32_bits(offset);
 		*cs++ = value;
 		*cs++ = MI_NOOP;
 	} else {
-		GEM_BUG_ON(instance);
+		GEM_BUG_ON(upper_32_bits(offset));
 		*cs++ = XY_COLOR_BLT_CMD | BLT_WRITE_RGBA | (6 - 2);
 		*cs++ = BLT_DEPTH_32 | BLT_ROP_COLOR_COPY | PAGE_SIZE;
 		*cs++ = 0;
 		*cs++ = size >> PAGE_SHIFT << 16 | PAGE_SIZE / 4;
-		*cs++ = 0;
+		*cs++ = lower_32_bits(offset);
 		*cs++ = value;
 	}
 
@@ -623,17 +731,15 @@ static int emit_clear(struct i915_request *rq,
 		 * and use it as a source.
 		 */
 
-		cs = i915_flush_dw(cs, (u64)instance << 32,
-				   MI_FLUSH_LLC | MI_FLUSH_CCS);
+		cs = i915_flush_dw(cs, offset, MI_FLUSH_LLC | MI_FLUSH_CCS);
 		cs = _i915_ctrl_surf_copy_blt(cs,
-					      (u64)instance << 32,
-					      (u64)instance << 32,
+					      offset,
+					      offset,
 					      DIRECT_ACCESS,
 					      INDIRECT_ACCESS,
 					      1, 1,
 					      num_ccs_blks);
-		cs = i915_flush_dw(cs, (u64)instance << 32,
-				   MI_FLUSH_LLC | MI_FLUSH_CCS);
+		cs = i915_flush_dw(cs, offset, MI_FLUSH_LLC | MI_FLUSH_CCS);
 	}
 	intel_ring_advance(rq, cs);
 	return 0;
@@ -658,6 +764,7 @@ intel_context_migrate_clear(struct intel_context *ce,
 	GEM_BUG_ON(ce->ring->size < SZ_64K);
 
 	do {
+		u32 offset;
 		int len;
 
 		rq = i915_request_create(ce);
@@ -685,7 +792,11 @@ intel_context_migrate_clear(struct intel_context *ce,
 		if (err)
 			goto out_rq;
 
-		len = emit_pte(rq, &it, cache_level, is_lmem, 0, CHUNK_SZ);
+		offset = 0;
+		if (HAS_64K_PAGES(ce->engine->i915) && is_lmem)
+			offset = CHUNK_SZ;
+
+		len = emit_pte(rq, &it, cache_level, is_lmem, offset, CHUNK_SZ);
 		if (len <= 0) {
 			err = len;
 			goto out_rq;
@@ -695,7 +806,7 @@ intel_context_migrate_clear(struct intel_context *ce,
 		if (err)
 			goto out_rq;
 
-		err = emit_clear(rq, len, value, is_lmem);
+		err = emit_clear(rq, offset, len, value, is_lmem);
 
 		/* Arbitration is re-enabled between requests. */
 out_rq:
-- 
2.31.1

