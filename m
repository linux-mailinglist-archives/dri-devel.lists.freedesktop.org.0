Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E08A623074
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 17:49:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FF510E5FD;
	Wed,  9 Nov 2022 16:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEE010E09D;
 Wed,  9 Nov 2022 16:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668012577; x=1699548577;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kFEOIwgD7RASbekl/suH9Lonut7ZCOpxhOMoL101Hjs=;
 b=LFMXN0jll3+kDP1FHONp9OinmA33M+FgpO/dsBd2PbsmIn78RboyIACr
 3g3AgTSkckfoWiHKYxJsNoExpt7twjxFWmEk2crCqcGajLRN5AMXysubw
 fvh7ZWd73cl9ZY8FUSnZXltjJImo96q21b/Mg5mdEobOSWIi5SU11j0dL
 pNpyW7sDZ6tj61oAWm1qaERWYyn1ckQ1iA9wKRucEEmdn5nC6o48+nWsB
 faN+MDVk4tRE1nx6zq7kwflw8xFImuDtMoGQE/8y2kiSE2Va/IeMqg8K4
 6++QvizLbthdQRCMA2ZqjN7bd/bZJmek4f4GDdkrw9vxk382TMk7q0o05 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="337768159"
X-IronPort-AV: E=Sophos;i="5.96,151,1665471600"; d="scan'208";a="337768159"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 08:49:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="670013965"
X-IronPort-AV: E=Sophos;i="5.96,151,1665471600"; d="scan'208";a="670013965"
Received: from dvorobye-mobl.ccr.corp.intel.com (HELO intel.com)
 ([10.252.32.169])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 08:49:32 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915: Wrap all access to i915_vma.node.start|size
Date: Wed,  9 Nov 2022 17:49:11 +0100
Message-Id: <20221109164913.909323-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221109164913.909323-1-andi.shyti@linux.intel.com>
References: <20221109164913.909323-1-andi.shyti@linux.intel.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi@etezian.org>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

We already wrap i915_vma.node.start for use with the GGTT, as there we
can perform additional sanity checks that the node belongs to the GGTT
and fits within the 32b registers. In the next couple of patches, we
will introduce guard pages around the objects _inside_ the drm_mm_node
allocation. That is we will offset the vma->pages so that the first page
is at drm_mm_node.start + vma->guard (not 0 as is currently the case).
All users must then not use i915_vma.node.start directly, but compute
the guard offset, thus all users are converted to use a
i915_vma_offset() wrapper.

The notable exceptions are the selftests that are testing exact
behaviour of i915_vma_pin/i915_vma_insert.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpt.c      |  4 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    |  2 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 37 ++++++++++---------
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c    |  4 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  2 +-
 .../i915/gem/selftests/i915_gem_client_blt.c  | 15 ++++----
 .../drm/i915/gem/selftests/i915_gem_context.c | 19 +++++++---
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  2 +-
 .../drm/i915/gem/selftests/igt_gem_utils.c    |  7 ++--
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |  2 +-
 drivers/gpu/drm/i915/gt/gen7_renderclear.c    |  2 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          |  8 ++--
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |  2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c  |  3 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  7 +++-
 drivers/gpu/drm/i915/gt/intel_renderstate.c   |  2 +-
 .../gpu/drm/i915/gt/intel_ring_submission.c   |  2 +-
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c  | 12 +++---
 drivers/gpu/drm/i915/gt/selftest_execlists.c  | 18 ++++-----
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  | 17 +++++----
 drivers/gpu/drm/i915/gt/selftest_lrc.c        | 16 ++++----
 .../drm/i915/gt/selftest_ring_submission.c    |  2 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c        | 12 +++---
 .../gpu/drm/i915/gt/selftest_workarounds.c    |  8 ++--
 drivers/gpu/drm/i915/i915_cmd_parser.c        |  4 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |  3 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         |  4 +-
 drivers/gpu/drm/i915/i915_perf.c              |  2 +-
 drivers/gpu/drm/i915/i915_vma.c               | 21 ++++++-----
 drivers/gpu/drm/i915/i915_vma.h               | 23 ++++++++++--
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 12 +++++-
 drivers/gpu/drm/i915/selftests/i915_request.c | 20 +++++-----
 drivers/gpu/drm/i915/selftests/igt_spinner.c  | 11 ++++--
 35 files changed, 178 insertions(+), 131 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
index de62bd77b15e6..eb32d7b0d25e9 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.c
+++ b/drivers/gpu/drm/i915/display/intel_dpt.c
@@ -64,7 +64,7 @@ static void dpt_insert_entries(struct i915_address_space *vm,
 	 * not to allow the user to override access to a read only page.
 	 */
 
-	i = vma->node.start / I915_GTT_PAGE_SIZE;
+	i = i915_vma_offset(vma) / I915_GTT_PAGE_SIZE;
 	for_each_sgt_daddr(addr, sgt_iter, vma->pages)
 		gen8_set_pte(&base[i++], pte_encode | addr);
 }
@@ -104,7 +104,7 @@ static void dpt_bind_vma(struct i915_address_space *vm,
 
 static void dpt_unbind_vma(struct i915_address_space *vm, struct i915_vma *vma)
 {
-	vm->clear_range(vm, vma->node.start, vma->size);
+	vm->clear_range(vm, i915_vma_offset(vma), vma->size);
 }
 
 static void dpt_cleanup(struct i915_address_space *vm)
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index adc3a81be9f72..dcd57421749ea 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -261,7 +261,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 
 		/* Our framebuffer is the entirety of fbdev's system memory */
 		info->fix.smem_start =
-			(unsigned long)(ggtt->gmadr.start + vma->node.start);
+			(unsigned long)(ggtt->gmadr.start + i915_ggtt_offset(vma));
 		info->fix.smem_len = vma->node.size;
 	}
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 78ac4ec9f285c..075d4afdd8a85 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -363,22 +363,23 @@ eb_vma_misplaced(const struct drm_i915_gem_exec_object2 *entry,
 		 const struct i915_vma *vma,
 		 unsigned int flags)
 {
-	if (vma->node.size < entry->pad_to_size)
+	const u64 start = i915_vma_offset(vma);
+	const u64 size = i915_vma_size(vma);
+
+	if (size < entry->pad_to_size)
 		return true;
 
-	if (entry->alignment && !IS_ALIGNED(vma->node.start, entry->alignment))
+	if (entry->alignment && !IS_ALIGNED(start, entry->alignment))
 		return true;
 
-	if (flags & EXEC_OBJECT_PINNED &&
-	    vma->node.start != entry->offset)
+	if (flags & EXEC_OBJECT_PINNED && start != entry->offset)
 		return true;
 
-	if (flags & __EXEC_OBJECT_NEEDS_BIAS &&
-	    vma->node.start < BATCH_OFFSET_BIAS)
+	if (flags & __EXEC_OBJECT_NEEDS_BIAS && start < BATCH_OFFSET_BIAS)
 		return true;
 
 	if (!(flags & EXEC_OBJECT_SUPPORTS_48B_ADDRESS) &&
-	    (vma->node.start + vma->node.size + 4095) >> 32)
+	    (start + size + 4095) >> 32)
 		return true;
 
 	if (flags & __EXEC_OBJECT_NEEDS_MAP &&
@@ -424,7 +425,7 @@ eb_pin_vma(struct i915_execbuffer *eb,
 	int err;
 
 	if (vma->node.size)
-		pin_flags = vma->node.start;
+		pin_flags = __i915_vma_offset(vma);
 	else
 		pin_flags = entry->offset & PIN_OFFSET_MASK;
 
@@ -608,8 +609,8 @@ static int eb_reserve_vma(struct i915_execbuffer *eb,
 	if (err)
 		return err;
 
-	if (entry->offset != vma->node.start) {
-		entry->offset = vma->node.start | UPDATE;
+	if (entry->offset != i915_vma_offset(vma)) {
+		entry->offset = i915_vma_offset(vma) | UPDATE;
 		eb->args->flags |= __EXEC_HAS_RELOC;
 	}
 
@@ -952,8 +953,8 @@ static int eb_validate_vmas(struct i915_execbuffer *eb)
 			return err;
 
 		if (!err) {
-			if (entry->offset != vma->node.start) {
-				entry->offset = vma->node.start | UPDATE;
+			if (entry->offset != i915_vma_offset(vma)) {
+				entry->offset = i915_vma_offset(vma) | UPDATE;
 				eb->args->flags |= __EXEC_HAS_RELOC;
 			}
 		} else {
@@ -1034,7 +1035,7 @@ static inline u64
 relocation_target(const struct drm_i915_gem_relocation_entry *reloc,
 		  const struct i915_vma *target)
 {
-	return gen8_canonical_addr((int)reloc->delta + target->node.start);
+	return gen8_canonical_addr((int)reloc->delta + i915_vma_offset(target));
 }
 
 static void reloc_cache_init(struct reloc_cache *cache,
@@ -1190,7 +1191,7 @@ static void *reloc_iomap(struct drm_i915_gem_object *obj,
 			if (err) /* no inactive aperture space, use cpu reloc */
 				return NULL;
 		} else {
-			cache->node.start = vma->node.start;
+			cache->node.start = i915_ggtt_offset(vma);
 			cache->node.mm = (void *)vma;
 		}
 	}
@@ -1284,7 +1285,7 @@ relocate_entry(struct i915_vma *vma,
 		goto repeat;
 	}
 
-	return target->node.start | UPDATE;
+	return i915_vma_offset(target) | UPDATE;
 }
 
 static u64
@@ -1348,7 +1349,7 @@ eb_relocate_entry(struct i915_execbuffer *eb,
 	 * more work needs to be done.
 	 */
 	if (!DBG_FORCE_RELOC &&
-	    gen8_canonical_addr(target->vma->node.start) == reloc->presumed_offset)
+	    gen8_canonical_addr(i915_vma_offset(target->vma)) == reloc->presumed_offset)
 		return 0;
 
 	/* Check that the relocation address is valid... */
@@ -2191,7 +2192,7 @@ static int eb_submit(struct i915_execbuffer *eb, struct i915_vma *batch)
 	}
 
 	err = eb->engine->emit_bb_start(eb->request,
-					batch->node.start +
+					i915_vma_offset(batch) +
 					eb->batch_start_offset,
 					eb->batch_len,
 					eb->batch_flags);
@@ -2201,7 +2202,7 @@ static int eb_submit(struct i915_execbuffer *eb, struct i915_vma *batch)
 	if (eb->trampoline) {
 		GEM_BUG_ON(eb->batch_start_offset);
 		err = eb->engine->emit_bb_start(eb->request,
-						eb->trampoline->node.start +
+						i915_vma_offset(eb->trampoline) +
 						eb->batch_len,
 						0, 0);
 		if (err)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 165746db37a53..fe4e275b88f4b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -378,7 +378,7 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
 	/* Finally, remap it using the new GTT offset */
 	ret = remap_io_mapping(area,
 			       area->vm_start + (vma->ggtt_view.partial.offset << PAGE_SHIFT),
-			       (ggtt->gmadr.start + vma->node.start) >> PAGE_SHIFT,
+			       (ggtt->gmadr.start + i915_ggtt_offset(vma)) >> PAGE_SHIFT,
 			       min_t(u64, vma->size, area->vm_end - area->vm_start),
 			       &ggtt->iomap);
 	if (ret)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index 7af6cbd9ede52..6af7baaf26f8c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -402,7 +402,7 @@ i915_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr
 	mutex_lock(&i915->ggtt.vm.mutex);
 	list_for_each_entry_safe(vma, next,
 				 &i915->ggtt.vm.bound_list, vm_link) {
-		unsigned long count = vma->node.size >> PAGE_SHIFT;
+		unsigned long count = i915_vma_size(vma) >> PAGE_SHIFT;
 
 		if (!vma->iomap || i915_vma_is_active(vma))
 			continue;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_tiling.c b/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
index ef4d0f7dc1186..1e49c7c69d803 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
@@ -166,11 +166,11 @@ static bool i915_vma_fence_prepare(struct i915_vma *vma,
 		return true;
 
 	size = i915_gem_fence_size(i915, vma->size, tiling_mode, stride);
-	if (vma->node.size < size)
+	if (i915_vma_size(vma) < size)
 		return false;
 
 	alignment = i915_gem_fence_alignment(i915, vma->size, tiling_mode, stride);
-	if (!IS_ALIGNED(vma->node.start, alignment))
+	if (!IS_ALIGNED(i915_ggtt_offset(vma), alignment))
 		return false;
 
 	return true;
diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index 149f62221a83c..c77932cb18ad5 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -380,7 +380,7 @@ static int igt_check_page_sizes(struct i915_vma *vma)
 	 * Maintaining alignment is required to utilise huge pages in the ppGGT.
 	 */
 	if (i915_gem_object_is_lmem(obj) &&
-	    IS_ALIGNED(vma->node.start, SZ_2M) &&
+	    IS_ALIGNED(i915_vma_offset(vma), SZ_2M) &&
 	    vma->page_sizes.sg & SZ_2M &&
 	    vma->page_sizes.gtt < SZ_2M) {
 		pr_err("gtt pages mismatch for LMEM, expected 2M GTT pages, sg(%u), gtt(%u)\n",
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
index ecbcbb86ae1e5..2099641aa5151 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
@@ -87,14 +87,14 @@ static int prepare_blit(const struct tiled_blits *t,
 	*cs++ = BLT_DEPTH_32 | BLT_ROP_SRC_COPY | dst_pitch;
 	*cs++ = 0;
 	*cs++ = t->height << 16 | t->width;
-	*cs++ = lower_32_bits(dst->vma->node.start);
+	*cs++ = lower_32_bits(i915_vma_offset(dst->vma));
 	if (use_64b_reloc)
-		*cs++ = upper_32_bits(dst->vma->node.start);
+		*cs++ = upper_32_bits(i915_vma_offset(dst->vma));
 	*cs++ = 0;
 	*cs++ = src_pitch;
-	*cs++ = lower_32_bits(src->vma->node.start);
+	*cs++ = lower_32_bits(i915_vma_offset(src->vma));
 	if (use_64b_reloc)
-		*cs++ = upper_32_bits(src->vma->node.start);
+		*cs++ = upper_32_bits(i915_vma_offset(src->vma));
 
 	*cs++ = MI_BATCH_BUFFER_END;
 
@@ -310,7 +310,7 @@ static int pin_buffer(struct i915_vma *vma, u64 addr)
 {
 	int err;
 
-	if (drm_mm_node_allocated(&vma->node) && vma->node.start != addr) {
+	if (drm_mm_node_allocated(&vma->node) && i915_vma_offset(vma) != addr) {
 		err = i915_vma_unbind(vma);
 		if (err)
 			return err;
@@ -320,6 +320,7 @@ static int pin_buffer(struct i915_vma *vma, u64 addr)
 	if (err)
 		return err;
 
+	GEM_BUG_ON(i915_vma_offset(vma) != addr);
 	return 0;
 }
 
@@ -366,8 +367,8 @@ tiled_blit(struct tiled_blits *t,
 		err = move_to_active(dst->vma, rq, 0);
 	if (!err)
 		err = rq->engine->emit_bb_start(rq,
-						t->batch->node.start,
-						t->batch->node.size,
+						i915_vma_offset(t->batch),
+						i915_vma_size(t->batch),
 						0);
 	i915_request_get(rq);
 	i915_request_add(rq);
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index 8eb5050f8cb3e..b3c3c303f8db7 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -901,8 +901,8 @@ static int rpcs_query_batch(struct drm_i915_gem_object *rpcs, struct i915_vma *v
 
 	*cmd++ = MI_STORE_REGISTER_MEM_GEN8;
 	*cmd++ = i915_mmio_reg_offset(GEN8_R_PWR_CLK_STATE);
-	*cmd++ = lower_32_bits(vma->node.start);
-	*cmd++ = upper_32_bits(vma->node.start);
+	*cmd++ = lower_32_bits(i915_vma_offset(vma));
+	*cmd++ = upper_32_bits(i915_vma_offset(vma));
 	*cmd = MI_BATCH_BUFFER_END;
 
 	__i915_gem_object_flush_map(rpcs, 0, 64);
@@ -990,7 +990,8 @@ emit_rpcs_query(struct drm_i915_gem_object *obj,
 	}
 
 	err = rq->engine->emit_bb_start(rq,
-					batch->node.start, batch->node.size,
+					i915_vma_offset(batch),
+					i915_vma_size(batch),
 					0);
 	if (err)
 		goto skip_request;
@@ -1559,7 +1560,10 @@ static int write_to_scratch(struct i915_gem_context *ctx,
 			goto skip_request;
 	}
 
-	err = engine->emit_bb_start(rq, vma->node.start, vma->node.size, 0);
+	err = engine->emit_bb_start(rq,
+				    i915_vma_offset(vma),
+				    i915_vma_size(vma),
+				    0);
 	if (err)
 		goto skip_request;
 
@@ -1666,7 +1670,7 @@ static int read_from_scratch(struct i915_gem_context *ctx,
 		*cmd++ = offset;
 		*cmd++ = MI_STORE_REGISTER_MEM | MI_USE_GGTT;
 		*cmd++ = reg;
-		*cmd++ = vma->node.start + result;
+		*cmd++ = i915_vma_offset(vma) + result;
 		*cmd = MI_BATCH_BUFFER_END;
 
 		i915_gem_object_flush_map(obj);
@@ -1697,7 +1701,10 @@ static int read_from_scratch(struct i915_gem_context *ctx,
 			goto skip_request;
 	}
 
-	err = engine->emit_bb_start(rq, vma->node.start, vma->node.size, flags);
+	err = engine->emit_bb_start(rq,
+				    i915_vma_offset(vma),
+				    i915_vma_size(vma),
+				    flags);
 	if (err)
 		goto skip_request;
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index bc7922cb41f97..ba135571cfea4 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -1194,7 +1194,7 @@ static int __igt_mmap_gpu(struct drm_i915_private *i915,
 		if (err == 0)
 			err = i915_vma_move_to_active(vma, rq, 0);
 
-		err = engine->emit_bb_start(rq, vma->node.start, 0, 0);
+		err = engine->emit_bb_start(rq, i915_vma_offset(vma), 0, 0);
 		i915_request_get(rq);
 		i915_request_add(rq);
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c b/drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c
index b35c1219c8521..548c5d6cd19d7 100644
--- a/drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c
+++ b/drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c
@@ -61,8 +61,8 @@ igt_emit_store_dw(struct i915_vma *vma,
 		goto err;
 	}
 
-	GEM_BUG_ON(offset + (count - 1) * PAGE_SIZE > vma->node.size);
-	offset += vma->node.start;
+	GEM_BUG_ON(offset + (count - 1) * PAGE_SIZE > i915_vma_size(vma));
+	offset += i915_vma_offset(vma);
 
 	for (n = 0; n < count; n++) {
 		if (ver >= 8) {
@@ -150,7 +150,8 @@ int igt_gpu_fill_dw(struct intel_context *ce,
 		flags |= I915_DISPATCH_SECURE;
 
 	err = rq->engine->emit_bb_start(rq,
-					batch->node.start, batch->node.size,
+					i915_vma_offset(batch),
+					i915_vma_size(batch),
 					flags);
 
 skip_request:
diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
index 890191f286e38..56085778645d4 100644
--- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
@@ -110,7 +110,7 @@ static void gen6_ppgtt_insert_entries(struct i915_address_space *vm,
 {
 	struct i915_ppgtt *ppgtt = i915_vm_to_ppgtt(vm);
 	struct i915_page_directory * const pd = ppgtt->pd;
-	unsigned int first_entry = vma->node.start / I915_GTT_PAGE_SIZE;
+	unsigned int first_entry = i915_vma_offset(vma) / I915_GTT_PAGE_SIZE;
 	unsigned int act_pt = first_entry / GEN6_PTES;
 	unsigned int act_pte = first_entry % GEN6_PTES;
 	const u32 pte_encode = vm->pte_encode(0, cache_level, flags);
diff --git a/drivers/gpu/drm/i915/gt/gen7_renderclear.c b/drivers/gpu/drm/i915/gt/gen7_renderclear.c
index 21f08e53889c3..a14f962aaa85c 100644
--- a/drivers/gpu/drm/i915/gt/gen7_renderclear.c
+++ b/drivers/gpu/drm/i915/gt/gen7_renderclear.c
@@ -105,7 +105,7 @@ static u32 batch_offset(const struct batch_chunk *bc, u32 *cs)
 
 static u32 batch_addr(const struct batch_chunk *bc)
 {
-	return bc->vma->node.start;
+	return i915_vma_offset(bc->vma);
 }
 
 static void batch_add(struct batch_chunk *bc, const u32 d)
diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index da4aa73f46a90..f74e13999402f 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -461,7 +461,7 @@ static void gen8_ppgtt_insert_huge(struct i915_vma *vma,
 {
 	const gen8_pte_t pte_encode = gen8_pte_encode(0, cache_level, flags);
 	unsigned int rem = sg_dma_len(iter->sg);
-	u64 start = vma->node.start;
+	u64 start = i915_vma_offset(vma);
 
 	GEM_BUG_ON(!i915_vm_is_4lvl(vma->vm));
 
@@ -543,8 +543,8 @@ static void gen8_ppgtt_insert_huge(struct i915_vma *vma,
 		if (maybe_64K != -1 &&
 		    (index == I915_PDES ||
 		     (i915_vm_has_scratch_64K(vma->vm) &&
-		      !iter->sg && IS_ALIGNED(vma->node.start +
-					      vma->node.size,
+		      !iter->sg && IS_ALIGNED(i915_vma_offset(vma) +
+					      i915_vma_size(vma),
 					      I915_GTT_PAGE_SIZE_2M)))) {
 			vaddr = px_vaddr(pd);
 			vaddr[maybe_64K] |= GEN8_PDE_IPS_64K;
@@ -586,7 +586,7 @@ static void gen8_ppgtt_insert(struct i915_address_space *vm,
 	if (vma->page_sizes.sg > I915_GTT_PAGE_SIZE) {
 		gen8_ppgtt_insert_huge(vma, &iter, cache_level, flags);
 	} else  {
-		u64 idx = vma->node.start >> GEN8_PTE_SHIFT;
+		u64 idx = i915_vma_offset(vma) >> GEN8_PTE_SHIFT;
 
 		do {
 			struct i915_page_directory * const pdp =
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 71db07144f51a..6549b8e3adbfc 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -661,7 +661,7 @@ static void aliasing_gtt_unbind_vma(struct i915_address_space *vm,
 				    struct i915_vma *vma)
 {
 	if (i915_vma_is_bound(vma, I915_VMA_GLOBAL_BIND))
-		vm->clear_range(vm, vma->node.start, vma->size);
+		vm->clear_range(vm, i915_ggtt_offset(vma), vma->size);
 
 	if (i915_vma_is_bound(vma, I915_VMA_LOCAL_BIND))
 		ppgtt_unbind_vma(&i915_vm_to_ggtt(vm)->alias->vm, vma);
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
index f8948de720360..b6fea674e6a5b 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
@@ -215,7 +215,8 @@ static int fence_update(struct i915_fence_reg *fence,
 				return ret;
 		}
 
-		fence->start = vma->node.start;
+		GEM_BUG_ON(vma->fence_size > i915_vma_size(vma));
+		fence->start = i915_ggtt_offset(vma);
 		fence->size = vma->fence_size;
 		fence->stride = i915_gem_object_get_stride(vma->obj);
 		fence->tiling = i915_gem_object_get_tiling(vma->obj);
diff --git a/drivers/gpu/drm/i915/gt/intel_ppgtt.c b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
index 4396bfd630d89..233e28eb74c36 100644
--- a/drivers/gpu/drm/i915/gt/intel_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
@@ -186,7 +186,10 @@ void ppgtt_bind_vma(struct i915_address_space *vm,
 	u32 pte_flags;
 
 	if (!test_bit(I915_VMA_ALLOC_BIT, __i915_vma_flags(vma))) {
-		vm->allocate_va_range(vm, stash, vma->node.start, vma->size);
+		GEM_BUG_ON(vma->size > i915_vma_size(vma));
+		vm->allocate_va_range(vm, stash,
+				      i915_vma_offset(vma),
+				      vma->size);
 		set_bit(I915_VMA_ALLOC_BIT, __i915_vma_flags(vma));
 	}
 
@@ -204,7 +207,7 @@ void ppgtt_bind_vma(struct i915_address_space *vm,
 void ppgtt_unbind_vma(struct i915_address_space *vm, struct i915_vma *vma)
 {
 	if (test_and_clear_bit(I915_VMA_ALLOC_BIT, __i915_vma_flags(vma)))
-		vm->clear_range(vm, vma->node.start, vma->size);
+		vm->clear_range(vm, i915_vma_offset(vma), vma->size);
 }
 
 static unsigned long pd_count(u64 size, int shift)
diff --git a/drivers/gpu/drm/i915/gt/intel_renderstate.c b/drivers/gpu/drm/i915/gt/intel_renderstate.c
index b575cd6e0b7a8..2630fe6c81428 100644
--- a/drivers/gpu/drm/i915/gt/intel_renderstate.c
+++ b/drivers/gpu/drm/i915/gt/intel_renderstate.c
@@ -61,7 +61,7 @@ static int render_state_setup(struct intel_renderstate *so,
 		u32 s = rodata->batch[i];
 
 		if (i * 4  == rodata->reloc[reloc_index]) {
-			u64 r = s + so->vma->node.start;
+			u64 r = s + i915_vma_offset(so->vma);
 
 			s = lower_32_bits(r);
 			if (HAS_64BIT_RELOC(i915)) {
diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
index dc4d34dc12a26..e5b80b2b723ec 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
@@ -886,7 +886,7 @@ static int clear_residuals(struct i915_request *rq)
 	}
 
 	ret = engine->emit_bb_start(rq,
-				    engine->wa_ctx.vma->node.start, 0,
+				    i915_vma_offset(engine->wa_ctx.vma), 0,
 				    0);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_cs.c b/drivers/gpu/drm/i915/gt/selftest_engine_cs.c
index 64abf5feabfaa..17ab003f905ec 100644
--- a/drivers/gpu/drm/i915/gt/selftest_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/selftest_engine_cs.c
@@ -165,8 +165,8 @@ static int perf_mi_bb_start(void *arg)
 				goto out;
 
 			err = rq->engine->emit_bb_start(rq,
-							batch->node.start, 8,
-							0);
+							i915_vma_offset(batch),
+							8, 0);
 			if (err)
 				goto out;
 
@@ -305,8 +305,8 @@ static int perf_mi_noop(void *arg)
 				goto out;
 
 			err = rq->engine->emit_bb_start(rq,
-							base->node.start, 8,
-							0);
+							i915_vma_offset(base),
+							8, 0);
 			if (err)
 				goto out;
 
@@ -315,8 +315,8 @@ static int perf_mi_noop(void *arg)
 				goto out;
 
 			err = rq->engine->emit_bb_start(rq,
-							nop->node.start,
-							nop->node.size,
+							i915_vma_offset(nop),
+							i915_vma_size(nop),
 							0);
 			if (err)
 				goto out;
diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
index f12ffe7976394..fc23c9a1d7860 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -2732,11 +2732,11 @@ static int create_gang(struct intel_engine_cs *engine,
 		MI_SEMAPHORE_POLL |
 		MI_SEMAPHORE_SAD_EQ_SDD;
 	*cs++ = 0;
-	*cs++ = lower_32_bits(vma->node.start);
-	*cs++ = upper_32_bits(vma->node.start);
+	*cs++ = lower_32_bits(i915_vma_offset(vma));
+	*cs++ = upper_32_bits(i915_vma_offset(vma));
 
 	if (*prev) {
-		u64 offset = (*prev)->batch->node.start;
+		u64 offset = i915_vma_offset((*prev)->batch);
 
 		/* Terminate the spinner in the next lower priority batch. */
 		*cs++ = MI_STORE_DWORD_IMM_GEN4;
@@ -2764,7 +2764,7 @@ static int create_gang(struct intel_engine_cs *engine,
 		err = i915_vma_move_to_active(vma, rq, 0);
 	if (!err)
 		err = rq->engine->emit_bb_start(rq,
-						vma->node.start,
+						i915_vma_offset(vma),
 						PAGE_SIZE, 0);
 	i915_vma_unlock(vma);
 	i915_request_add(rq);
@@ -3092,7 +3092,7 @@ create_gpr_user(struct intel_engine_cs *engine,
 		*cs++ = MI_MATH_ADD;
 		*cs++ = MI_MATH_STORE(MI_MATH_REG(i), MI_MATH_REG_ACCU);
 
-		addr = result->node.start + offset + i * sizeof(*cs);
+		addr = i915_vma_offset(result) + offset + i * sizeof(*cs);
 		*cs++ = MI_STORE_REGISTER_MEM_GEN8;
 		*cs++ = CS_GPR(engine, 2 * i);
 		*cs++ = lower_32_bits(addr);
@@ -3102,8 +3102,8 @@ create_gpr_user(struct intel_engine_cs *engine,
 			MI_SEMAPHORE_POLL |
 			MI_SEMAPHORE_SAD_GTE_SDD;
 		*cs++ = i;
-		*cs++ = lower_32_bits(result->node.start);
-		*cs++ = upper_32_bits(result->node.start);
+		*cs++ = lower_32_bits(i915_vma_offset(result));
+		*cs++ = upper_32_bits(i915_vma_offset(result));
 	}
 
 	*cs++ = MI_BATCH_BUFFER_END;
@@ -3187,7 +3187,7 @@ create_gpr_client(struct intel_engine_cs *engine,
 		err = i915_vma_move_to_active(batch, rq, 0);
 	if (!err)
 		err = rq->engine->emit_bb_start(rq,
-						batch->node.start,
+						i915_vma_offset(batch),
 						PAGE_SIZE, 0);
 	i915_vma_unlock(batch);
 	i915_vma_unpin(batch);
@@ -3519,7 +3519,7 @@ static int smoke_submit(struct preempt_smoke *smoke,
 			err = i915_vma_move_to_active(vma, rq, 0);
 		if (!err)
 			err = rq->engine->emit_bb_start(rq,
-							vma->node.start,
+							i915_vma_offset(vma),
 							PAGE_SIZE, 0);
 		i915_vma_unlock(vma);
 	}
diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
index 8af4f31e55e6f..13734a72e092a 100644
--- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
@@ -94,7 +94,8 @@ static int hang_init(struct hang *h, struct intel_gt *gt)
 static u64 hws_address(const struct i915_vma *hws,
 		       const struct i915_request *rq)
 {
-	return hws->node.start + offset_in_page(sizeof(u32)*rq->fence.context);
+	return (i915_vma_offset(hws) +
+		offset_in_page(sizeof(u32) * rq->fence.context));
 }
 
 static int move_to_active(struct i915_vma *vma,
@@ -194,8 +195,8 @@ hang_create_request(struct hang *h, struct intel_engine_cs *engine)
 
 		*batch++ = MI_NOOP;
 		*batch++ = MI_BATCH_BUFFER_START | 1 << 8 | 1;
-		*batch++ = lower_32_bits(vma->node.start);
-		*batch++ = upper_32_bits(vma->node.start);
+		*batch++ = lower_32_bits(i915_vma_offset(vma));
+		*batch++ = upper_32_bits(i915_vma_offset(vma));
 	} else if (GRAPHICS_VER(gt->i915) >= 6) {
 		*batch++ = MI_STORE_DWORD_IMM_GEN4;
 		*batch++ = 0;
@@ -208,7 +209,7 @@ hang_create_request(struct hang *h, struct intel_engine_cs *engine)
 
 		*batch++ = MI_NOOP;
 		*batch++ = MI_BATCH_BUFFER_START | 1 << 8;
-		*batch++ = lower_32_bits(vma->node.start);
+		*batch++ = lower_32_bits(i915_vma_offset(vma));
 	} else if (GRAPHICS_VER(gt->i915) >= 4) {
 		*batch++ = MI_STORE_DWORD_IMM_GEN4 | MI_USE_GGTT;
 		*batch++ = 0;
@@ -221,7 +222,7 @@ hang_create_request(struct hang *h, struct intel_engine_cs *engine)
 
 		*batch++ = MI_NOOP;
 		*batch++ = MI_BATCH_BUFFER_START | 2 << 6;
-		*batch++ = lower_32_bits(vma->node.start);
+		*batch++ = lower_32_bits(i915_vma_offset(vma));
 	} else {
 		*batch++ = MI_STORE_DWORD_IMM | MI_MEM_VIRTUAL;
 		*batch++ = lower_32_bits(hws_address(hws, rq));
@@ -233,7 +234,7 @@ hang_create_request(struct hang *h, struct intel_engine_cs *engine)
 
 		*batch++ = MI_NOOP;
 		*batch++ = MI_BATCH_BUFFER_START | 2 << 6;
-		*batch++ = lower_32_bits(vma->node.start);
+		*batch++ = lower_32_bits(i915_vma_offset(vma));
 	}
 	*batch++ = MI_BATCH_BUFFER_END; /* not reached */
 	intel_gt_chipset_flush(engine->gt);
@@ -248,7 +249,9 @@ hang_create_request(struct hang *h, struct intel_engine_cs *engine)
 	if (GRAPHICS_VER(gt->i915) <= 5)
 		flags |= I915_DISPATCH_SECURE;
 
-	err = rq->engine->emit_bb_start(rq, vma->node.start, PAGE_SIZE, flags);
+	err = rq->engine->emit_bb_start(rq,
+					i915_vma_offset(vma),
+					PAGE_SIZE, flags);
 
 cancel_rq:
 	if (err) {
diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
index 88c9a02fbb720..b99e6dd0904a3 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -955,8 +955,8 @@ store_context(struct intel_context *ce, struct i915_vma *scratch)
 		while (len--) {
 			*cs++ = MI_STORE_REGISTER_MEM_GEN8;
 			*cs++ = hw[dw];
-			*cs++ = lower_32_bits(scratch->node.start + x);
-			*cs++ = upper_32_bits(scratch->node.start + x);
+			*cs++ = lower_32_bits(i915_vma_offset(scratch) + x);
+			*cs++ = upper_32_bits(i915_vma_offset(scratch) + x);
 
 			dw += 2;
 			x += 4;
@@ -1038,8 +1038,8 @@ record_registers(struct intel_context *ce,
 
 	*cs++ = MI_ARB_ON_OFF | MI_ARB_DISABLE;
 	*cs++ = MI_BATCH_BUFFER_START_GEN8 | BIT(8);
-	*cs++ = lower_32_bits(b_before->node.start);
-	*cs++ = upper_32_bits(b_before->node.start);
+	*cs++ = lower_32_bits(i915_vma_offset(b_before));
+	*cs++ = upper_32_bits(i915_vma_offset(b_before));
 
 	*cs++ = MI_ARB_ON_OFF | MI_ARB_ENABLE;
 	*cs++ = MI_SEMAPHORE_WAIT |
@@ -1054,8 +1054,8 @@ record_registers(struct intel_context *ce,
 
 	*cs++ = MI_ARB_ON_OFF | MI_ARB_DISABLE;
 	*cs++ = MI_BATCH_BUFFER_START_GEN8 | BIT(8);
-	*cs++ = lower_32_bits(b_after->node.start);
-	*cs++ = upper_32_bits(b_after->node.start);
+	*cs++ = lower_32_bits(i915_vma_offset(b_after));
+	*cs++ = upper_32_bits(i915_vma_offset(b_after));
 
 	intel_ring_advance(rq, cs);
 
@@ -1163,8 +1163,8 @@ static int poison_registers(struct intel_context *ce, u32 poison, u32 *sema)
 
 	*cs++ = MI_ARB_ON_OFF | MI_ARB_DISABLE;
 	*cs++ = MI_BATCH_BUFFER_START_GEN8 | BIT(8);
-	*cs++ = lower_32_bits(batch->node.start);
-	*cs++ = upper_32_bits(batch->node.start);
+	*cs++ = lower_32_bits(i915_vma_offset(batch));
+	*cs++ = upper_32_bits(i915_vma_offset(batch));
 
 	*cs++ = MI_STORE_DWORD_IMM_GEN4 | MI_USE_GGTT;
 	*cs++ = i915_ggtt_offset(ce->engine->status_page.vma) +
diff --git a/drivers/gpu/drm/i915/gt/selftest_ring_submission.c b/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
index 041954408d0fd..8d29f6b979bd6 100644
--- a/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
@@ -50,7 +50,7 @@ static struct i915_vma *create_wally(struct intel_engine_cs *engine)
 	} else {
 		*cs++ = MI_STORE_DWORD_IMM | MI_MEM_VIRTUAL;
 	}
-	*cs++ = vma->node.start + 4000;
+	*cs++ = i915_vma_offset(vma) + 4000;
 	*cs++ = STACK_MAGIC;
 
 	*cs++ = MI_BATCH_BUFFER_END;
diff --git a/drivers/gpu/drm/i915/gt/selftest_rps.c b/drivers/gpu/drm/i915/gt/selftest_rps.c
index e2f8a7f12215a..b94587ae54f1f 100644
--- a/drivers/gpu/drm/i915/gt/selftest_rps.c
+++ b/drivers/gpu/drm/i915/gt/selftest_rps.c
@@ -119,14 +119,14 @@ create_spin_counter(struct intel_engine_cs *engine,
 		if (srm) {
 			*cs++ = MI_STORE_REGISTER_MEM_GEN8;
 			*cs++ = i915_mmio_reg_offset(CS_GPR(COUNT));
-			*cs++ = lower_32_bits(vma->node.start + end * sizeof(*cs));
-			*cs++ = upper_32_bits(vma->node.start + end * sizeof(*cs));
+			*cs++ = lower_32_bits(i915_vma_offset(vma) + end * sizeof(*cs));
+			*cs++ = upper_32_bits(i915_vma_offset(vma) + end * sizeof(*cs));
 		}
 	}
 
 	*cs++ = MI_BATCH_BUFFER_START_GEN8;
-	*cs++ = lower_32_bits(vma->node.start + loop * sizeof(*cs));
-	*cs++ = upper_32_bits(vma->node.start + loop * sizeof(*cs));
+	*cs++ = lower_32_bits(i915_vma_offset(vma) + loop * sizeof(*cs));
+	*cs++ = upper_32_bits(i915_vma_offset(vma) + loop * sizeof(*cs));
 	GEM_BUG_ON(cs - base > end);
 
 	i915_gem_object_flush_map(obj);
@@ -654,7 +654,7 @@ int live_rps_frequency_cs(void *arg)
 			err = i915_vma_move_to_active(vma, rq, 0);
 		if (!err)
 			err = rq->engine->emit_bb_start(rq,
-							vma->node.start,
+							i915_vma_offset(vma),
 							PAGE_SIZE, 0);
 		i915_request_add(rq);
 		if (err)
@@ -795,7 +795,7 @@ int live_rps_frequency_srm(void *arg)
 			err = i915_vma_move_to_active(vma, rq, 0);
 		if (!err)
 			err = rq->engine->emit_bb_start(rq,
-							vma->node.start,
+							i915_vma_offset(vma),
 							PAGE_SIZE, 0);
 		i915_request_add(rq);
 		if (err)
diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
index e623ac45f4aa6..b67774f918c90 100644
--- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
@@ -522,7 +522,6 @@ static int check_dirty_whitelist(struct intel_context *ce)
 	for (i = 0; i < engine->whitelist.count; i++) {
 		u32 reg = i915_mmio_reg_offset(engine->whitelist.list[i].reg);
 		struct i915_gem_ww_ctx ww;
-		u64 addr = scratch->node.start;
 		struct i915_request *rq;
 		u32 srm, lrm, rsvd;
 		u32 expect;
@@ -645,7 +644,8 @@ static int check_dirty_whitelist(struct intel_context *ce)
 			goto err_request;
 
 		err = engine->emit_bb_start(rq,
-					    batch->node.start, PAGE_SIZE,
+					    i915_vma_offset(batch),
+					    PAGE_SIZE,
 					    0);
 		if (err)
 			goto err_request;
@@ -877,7 +877,7 @@ static int read_whitelisted_registers(struct intel_context *ce,
 	}
 
 	for (i = 0; i < engine->whitelist.count; i++) {
-		u64 offset = results->node.start + sizeof(u32) * i;
+		u64 offset = i915_vma_offset(results) + sizeof(u32) * i;
 		u32 reg = i915_mmio_reg_offset(engine->whitelist.list[i].reg);
 
 		/* Clear non priv flags */
@@ -951,7 +951,7 @@ static int scrub_whitelisted_registers(struct intel_context *ce)
 		goto err_request;
 
 	/* Perform the writes from an unprivileged "user" batch */
-	err = engine->emit_bb_start(rq, batch->node.start, 0, 0);
+	err = engine->emit_bb_start(rq, i915_vma_offset(batch), 0, 0);
 
 err_request:
 	err = request_add_sync(rq, err);
diff --git a/drivers/gpu/drm/i915/i915_cmd_parser.c b/drivers/gpu/drm/i915/i915_cmd_parser.c
index 20191a32478ad..ff3f2d431cafb 100644
--- a/drivers/gpu/drm/i915/i915_cmd_parser.c
+++ b/drivers/gpu/drm/i915/i915_cmd_parser.c
@@ -1463,8 +1463,8 @@ int intel_engine_cmd_parser(struct intel_engine_cs *engine,
 		/* Defer failure until attempted use */
 		jump_whitelist = alloc_whitelist(batch_length);
 
-	shadow_addr = gen8_canonical_addr(shadow->node.start);
-	batch_addr = gen8_canonical_addr(batch->node.start + batch_offset);
+	shadow_addr = gen8_canonical_addr(i915_vma_offset(shadow));
+	batch_addr = gen8_canonical_addr(i915_vma_offset(batch) + batch_offset);
 
 	/*
 	 * We use the batch length as size because the shadow object is as
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 6bba248efdfc2..37083faa01870 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -168,7 +168,8 @@ i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
 
 		seq_printf(m, " (%s offset: %08llx, size: %08llx, pages: %s",
 			   stringify_vma_type(vma),
-			   vma->node.start, vma->node.size,
+			   i915_vma_offset(vma),
+			   i915_vma_size(vma),
 			   stringify_page_sizes(vma->page_sizes.gtt, NULL, 0));
 		if (i915_vma_is_ggtt(vma) || i915_vma_is_dpt(vma)) {
 			switch (vma->ggtt_view.type) {
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index eb44056d71c9d..1159b8dc51868 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1015,8 +1015,8 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 	strcpy(dst->name, name);
 	dst->next = NULL;
 
-	dst->gtt_offset = vma->node.start;
-	dst->gtt_size = vma->node.size;
+	dst->gtt_offset = i915_vma_offset(vma);
+	dst->gtt_size = i915_vma_size(vma);
 	dst->gtt_page_sizes = vma->page_sizes.gtt;
 	dst->num_pages = num_pages;
 	dst->page_count = 0;
diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index f3c8f87d25ae0..80933688d2ec3 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -2015,7 +2015,7 @@ emit_oa_config(struct i915_perf_stream *stream,
 		goto err_add_request;
 
 	err = rq->engine->emit_bb_start(rq,
-					vma->node.start, 0,
+					i915_vma_offset(vma), 0,
 					I915_DISPATCH_SECURE);
 	if (err)
 		goto err_add_request;
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index dfd20060812bc..4b4a6dcdc676b 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -377,7 +377,7 @@ int i915_vma_bind(struct i915_vma *vma,
 	u32 vma_flags;
 
 	GEM_BUG_ON(!drm_mm_node_allocated(&vma->node));
-	GEM_BUG_ON(vma->size > vma->node.size);
+	GEM_BUG_ON(vma->size > i915_vma_size(vma));
 
 	if (GEM_DEBUG_WARN_ON(range_overflows(vma->node.start,
 					      vma->node.size,
@@ -469,8 +469,8 @@ void __iomem *i915_vma_pin_iomap(struct i915_vma *vma)
 							  vma->obj->base.size);
 		else
 			ptr = io_mapping_map_wc(&i915_vm_to_ggtt(vma->vm)->iomap,
-						vma->node.start,
-						vma->node.size);
+						i915_vma_offset(vma),
+						i915_vma_size(vma));
 		if (ptr == NULL) {
 			err = -ENOMEM;
 			goto err;
@@ -544,22 +544,22 @@ bool i915_vma_misplaced(const struct i915_vma *vma,
 	if (test_bit(I915_VMA_ERROR_BIT, __i915_vma_flags(vma)))
 		return true;
 
-	if (vma->node.size < size)
+	if (i915_vma_size(vma) < size)
 		return true;
 
 	GEM_BUG_ON(alignment && !is_power_of_2(alignment));
-	if (alignment && !IS_ALIGNED(vma->node.start, alignment))
+	if (alignment && !IS_ALIGNED(i915_vma_offset(vma), alignment))
 		return true;
 
 	if (flags & PIN_MAPPABLE && !i915_vma_is_map_and_fenceable(vma))
 		return true;
 
 	if (flags & PIN_OFFSET_BIAS &&
-	    vma->node.start < (flags & PIN_OFFSET_MASK))
+	    i915_vma_offset(vma) < (flags & PIN_OFFSET_MASK))
 		return true;
 
 	if (flags & PIN_OFFSET_FIXED &&
-	    vma->node.start != (flags & PIN_OFFSET_MASK))
+	    i915_vma_offset(vma) != (flags & PIN_OFFSET_MASK))
 		return true;
 
 	return false;
@@ -572,10 +572,11 @@ void __i915_vma_set_map_and_fenceable(struct i915_vma *vma)
 	GEM_BUG_ON(!i915_vma_is_ggtt(vma));
 	GEM_BUG_ON(!vma->fence_size);
 
-	fenceable = (vma->node.size >= vma->fence_size &&
-		     IS_ALIGNED(vma->node.start, vma->fence_alignment));
+	fenceable = (i915_vma_size(vma) >= vma->fence_size &&
+		     IS_ALIGNED(i915_vma_offset(vma), vma->fence_alignment));
 
-	mappable = vma->node.start + vma->fence_size <= i915_vm_to_ggtt(vma->vm)->mappable_end;
+	mappable = (i915_ggtt_offset(vma) + vma->fence_size <=
+		    i915_vm_to_ggtt(vma->vm)->mappable_end);
 
 	if (mappable && fenceable)
 		set_bit(I915_VMA_CAN_FENCE_BIT, __i915_vma_flags(vma));
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index ed69f66c7ab04..caf6e251782d8 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -118,13 +118,30 @@ static inline bool i915_vma_is_closed(const struct i915_vma *vma)
 	return !list_empty(&vma->closed_link);
 }
 
+static inline u64 i915_vma_size(const struct i915_vma *vma)
+{
+	GEM_BUG_ON(!drm_mm_node_allocated(&vma->node));
+	return vma->node.size;
+}
+
+static inline u64 __i915_vma_offset(const struct i915_vma *vma)
+{
+	return vma->node.start;
+}
+
+static inline u64 i915_vma_offset(const struct i915_vma *vma)
+{
+	GEM_BUG_ON(!drm_mm_node_allocated(&vma->node));
+	return __i915_vma_offset(vma);
+}
+
 static inline u32 i915_ggtt_offset(const struct i915_vma *vma)
 {
 	GEM_BUG_ON(!i915_vma_is_ggtt(vma));
 	GEM_BUG_ON(!drm_mm_node_allocated(&vma->node));
-	GEM_BUG_ON(upper_32_bits(vma->node.start));
-	GEM_BUG_ON(upper_32_bits(vma->node.start + vma->node.size - 1));
-	return lower_32_bits(vma->node.start);
+	GEM_BUG_ON(upper_32_bits(i915_vma_offset(vma)));
+	GEM_BUG_ON(upper_32_bits(i915_vma_offset(vma) + i915_vma_size(vma) - 1));
+	return lower_32_bits(i915_vma_offset(vma));
 }
 
 static inline u32 i915_ggtt_pin_bias(struct i915_vma *vma)
diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
index f0645807518e9..288aadbca97f7 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -245,6 +245,10 @@ static int lowlevel_hole(struct i915_address_space *vm,
 	if (!mock_vma)
 		return -ENOMEM;
 
+	__set_bit(DRM_MM_NODE_ALLOCATED_BIT, &mock_vma->node.flags);
+	if (i915_is_ggtt(vm))
+		__set_bit(I915_VMA_GGTT_BIT, __i915_vma_flags(mock_vma));
+
 	/* Keep creating larger objects until one cannot fit into the hole */
 	for (size = 12; (hole_end - hole_start) >> size; size++) {
 		I915_RND_SUBSTATE(prng, seed_prng);
@@ -1982,6 +1986,7 @@ static int igt_cs_tlb(void *arg)
 				goto end;
 
 			/* Prime the TLB with the dummy pages */
+			__set_bit(DRM_MM_NODE_ALLOCATED_BIT, &vma->node.flags);
 			for (i = 0; i < count; i++) {
 				vma->node.start = offset + i * PAGE_SIZE;
 				vm->insert_entries(vm, vma, I915_CACHE_NONE, 0);
@@ -1993,8 +1998,9 @@ static int igt_cs_tlb(void *arg)
 				}
 				i915_request_put(rq);
 			}
-
 			vma->ops->clear_pages(vma);
+			__clear_bit(DRM_MM_NODE_ALLOCATED_BIT,
+				    &vma->node.flags);
 
 			err = context_sync(ce);
 			if (err) {
@@ -2014,6 +2020,7 @@ static int igt_cs_tlb(void *arg)
 				goto end;
 
 			/* Replace the TLB with target batches */
+			__set_bit(DRM_MM_NODE_ALLOCATED_BIT, &vma->node.flags);
 			for (i = 0; i < count; i++) {
 				struct i915_request *rq;
 				u32 *cs = batch + i * 64 / sizeof(*cs);
@@ -2046,8 +2053,9 @@ static int igt_cs_tlb(void *arg)
 				i915_request_put(rq);
 			}
 			end_spin(batch, count - 1);
-
 			vma->ops->clear_pages(vma);
+			__clear_bit(DRM_MM_NODE_ALLOCATED_BIT,
+				    &vma->node.flags);
 
 			err = context_sync(ce);
 			if (err) {
diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index d67710d10615d..4760cba852510 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -869,8 +869,8 @@ empty_request(struct intel_engine_cs *engine,
 		return request;
 
 	err = engine->emit_bb_start(request,
-				    batch->node.start,
-				    batch->node.size,
+				    i915_vma_offset(batch),
+				    i915_vma_size(batch),
 				    I915_DISPATCH_SECURE);
 	if (err)
 		goto out_request;
@@ -990,14 +990,14 @@ static struct i915_vma *recursive_batch(struct drm_i915_private *i915)
 
 	if (ver >= 8) {
 		*cmd++ = MI_BATCH_BUFFER_START | 1 << 8 | 1;
-		*cmd++ = lower_32_bits(vma->node.start);
-		*cmd++ = upper_32_bits(vma->node.start);
+		*cmd++ = lower_32_bits(i915_vma_offset(vma));
+		*cmd++ = upper_32_bits(i915_vma_offset(vma));
 	} else if (ver >= 6) {
 		*cmd++ = MI_BATCH_BUFFER_START | 1 << 8;
-		*cmd++ = lower_32_bits(vma->node.start);
+		*cmd++ = lower_32_bits(i915_vma_offset(vma));
 	} else {
 		*cmd++ = MI_BATCH_BUFFER_START | MI_BATCH_GTT;
-		*cmd++ = lower_32_bits(vma->node.start);
+		*cmd++ = lower_32_bits(i915_vma_offset(vma));
 	}
 	*cmd++ = MI_BATCH_BUFFER_END; /* terminate early in case of error */
 
@@ -1081,8 +1081,8 @@ static int live_all_engines(void *arg)
 		GEM_BUG_ON(err);
 
 		err = engine->emit_bb_start(request[idx],
-					    batch->node.start,
-					    batch->node.size,
+					    i915_vma_offset(batch),
+					    i915_vma_size(batch),
 					    0);
 		GEM_BUG_ON(err);
 		request[idx]->batch = batch;
@@ -1211,8 +1211,8 @@ static int live_sequential_engines(void *arg)
 		GEM_BUG_ON(err);
 
 		err = engine->emit_bb_start(request[idx],
-					    batch->node.start,
-					    batch->node.size,
+					    i915_vma_offset(batch),
+					    i915_vma_size(batch),
 					    0);
 		GEM_BUG_ON(err);
 		request[idx]->batch = batch;
diff --git a/drivers/gpu/drm/i915/selftests/igt_spinner.c b/drivers/gpu/drm/i915/selftests/igt_spinner.c
index 24d87d0fc747e..6bf0b189d69a0 100644
--- a/drivers/gpu/drm/i915/selftests/igt_spinner.c
+++ b/drivers/gpu/drm/i915/selftests/igt_spinner.c
@@ -115,7 +115,7 @@ static unsigned int seqno_offset(u64 fence)
 static u64 hws_address(const struct i915_vma *hws,
 		       const struct i915_request *rq)
 {
-	return hws->node.start + seqno_offset(rq->fence.context);
+	return i915_vma_offset(hws) + seqno_offset(rq->fence.context);
 }
 
 static int move_to_active(struct i915_vma *vma,
@@ -202,8 +202,8 @@ igt_spinner_create_request(struct igt_spinner *spin,
 		*batch++ = MI_BATCH_BUFFER_START;
 	else
 		*batch++ = MI_BATCH_BUFFER_START | MI_BATCH_GTT;
-	*batch++ = lower_32_bits(vma->node.start);
-	*batch++ = upper_32_bits(vma->node.start);
+	*batch++ = lower_32_bits(i915_vma_offset(vma));
+	*batch++ = upper_32_bits(i915_vma_offset(vma));
 
 	*batch++ = MI_BATCH_BUFFER_END; /* not reached */
 
@@ -218,7 +218,10 @@ igt_spinner_create_request(struct igt_spinner *spin,
 	flags = 0;
 	if (GRAPHICS_VER(rq->engine->i915) <= 5)
 		flags |= I915_DISPATCH_SECURE;
-	err = engine->emit_bb_start(rq, vma->node.start, PAGE_SIZE, flags);
+	err = engine->emit_bb_start(rq,
+				    i915_vma_offset(vma),
+				    PAGE_SIZE,
+				    flags);
 
 cancel_rq:
 	if (err) {
-- 
2.37.2

