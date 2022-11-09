Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CED576231AC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 18:42:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0060010E60D;
	Wed,  9 Nov 2022 17:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E9B10E608;
 Wed,  9 Nov 2022 17:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668015722; x=1699551722;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=17chd3dxzX9c0QyeVs94jy7wF8hwsrps37+zwaoqB6k=;
 b=lLSLa0BtZ7q4KJkrPbftfigtBeGz1x9G8srlaR45ON3mJmypFFlo3ift
 YtpoF/mzu1FpvMmdcu/6AM38UtEELt9jQ5PTBYraP2HpBiX4XhkYVUfP4
 wJnoNBJM+fxgIA+636MeoUyxqpuHxDp8jQoQhXY7dVRscRBrTzLJXKD34
 bNhG9MSS2BnemNiXVqYBI7Yr1mkF62QDTHdZei9JTSRwyXotK+W3waI6b
 N5iEXEcv5WHucz/R7/++oytpDNY5bjcBqYsZQ1fC7fmP6u4KeodjotXoa
 QAtEqFjc07kMK1FugYxw46GgTP3lA5bgGXhzrYXJXRKOk1p8tKmCUMd+2 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="309761537"
X-IronPort-AV: E=Sophos;i="5.96,151,1665471600"; d="scan'208";a="309761537"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 09:41:30 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="726061664"
X-IronPort-AV: E=Sophos;i="5.96,151,1665471600"; d="scan'208";a="726061664"
Received: from dvorobye-mobl.ccr.corp.intel.com (HELO intel.com)
 ([10.252.32.169])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 09:41:25 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915: Wrap all access to i915_vma.node.start|size
Date: Wed,  9 Nov 2022 18:40:56 +0100
Message-Id: <20221109174058.912720-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221109174058.912720-1-andi.shyti@linux.intel.com>
References: <20221109174058.912720-1-andi.shyti@linux.intel.com>
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
 Andi Shyti <andi.shyti@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi@etezian.org>
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
Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c    |  2 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 33 ++++++------
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c    |  4 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  2 +-
 .../i915/gem/selftests/i915_gem_client_blt.c  | 23 +++++----
 .../drm/i915/gem/selftests/i915_gem_context.c | 15 +++---
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  2 +-
 .../drm/i915/gem/selftests/igt_gem_utils.c    |  7 +--
 drivers/gpu/drm/i915/gt/gen7_renderclear.c    |  2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c  |  3 +-
 drivers/gpu/drm/i915/gt/intel_renderstate.c   |  2 +-
 .../gpu/drm/i915/gt/intel_ring_submission.c   |  2 +-
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c  |  8 +--
 drivers/gpu/drm/i915/gt/selftest_execlists.c  | 18 +++----
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  | 15 +++---
 drivers/gpu/drm/i915/gt/selftest_lrc.c        | 16 +++---
 .../drm/i915/gt/selftest_ring_submission.c    |  2 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c        | 12 ++---
 .../gpu/drm/i915/gt/selftest_workarounds.c    |  8 +--
 drivers/gpu/drm/i915/i915_cmd_parser.c        |  4 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |  2 +-
 drivers/gpu/drm/i915/i915_perf.c              |  2 +-
 drivers/gpu/drm/i915/i915_vma.c               | 25 ++++-----
 drivers/gpu/drm/i915/i915_vma.h               | 51 +++++++++++++++++--
 drivers/gpu/drm/i915/i915_vma_resource.h      | 10 ++--
 drivers/gpu/drm/i915/selftests/i915_request.c | 20 ++++----
 drivers/gpu/drm/i915/selftests/igt_spinner.c  |  8 +--
 29 files changed, 180 insertions(+), 122 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 5575d7abdc092..03ed4607a46d2 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -286,7 +286,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 
 		/* Our framebuffer is the entirety of fbdev's system memory */
 		info->fix.smem_start =
-			(unsigned long)(ggtt->gmadr.start + vma->node.start);
+			(unsigned long)(ggtt->gmadr.start + i915_ggtt_offset(vma));
 		info->fix.smem_len = vma->size;
 	}
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 1160723c9d2d9..5f09d33f1c836 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -378,22 +378,25 @@ eb_vma_misplaced(const struct drm_i915_gem_exec_object2 *entry,
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
 
 	if (flags & EXEC_OBJECT_PINNED &&
-	    vma->node.start != entry->offset)
+	    start != entry->offset)
 		return true;
 
 	if (flags & __EXEC_OBJECT_NEEDS_BIAS &&
-	    vma->node.start < BATCH_OFFSET_BIAS)
+	    start < BATCH_OFFSET_BIAS)
 		return true;
 
 	if (!(flags & EXEC_OBJECT_SUPPORTS_48B_ADDRESS) &&
-	    (vma->node.start + vma->node.size + 4095) >> 32)
+	    (start + size + 4095) >> 32)
 		return true;
 
 	if (flags & __EXEC_OBJECT_NEEDS_MAP &&
@@ -439,7 +442,7 @@ eb_pin_vma(struct i915_execbuffer *eb,
 	int err;
 
 	if (vma->node.size)
-		pin_flags = vma->node.start;
+		pin_flags =  __i915_vma_offset(vma);
 	else
 		pin_flags = entry->offset & PIN_OFFSET_MASK;
 
@@ -662,8 +665,8 @@ static int eb_reserve_vma(struct i915_execbuffer *eb,
 	if (err)
 		return err;
 
-	if (entry->offset != vma->node.start) {
-		entry->offset = vma->node.start | UPDATE;
+	if (entry->offset != i915_vma_offset(vma)) {
+		entry->offset = i915_vma_offset(vma) | UPDATE;
 		eb->args->flags |= __EXEC_HAS_RELOC;
 	}
 
@@ -983,8 +986,8 @@ static int eb_validate_vmas(struct i915_execbuffer *eb)
 			return err;
 
 		if (!err) {
-			if (entry->offset != vma->node.start) {
-				entry->offset = vma->node.start | UPDATE;
+			if (entry->offset != i915_vma_offset(vma)) {
+				entry->offset = i915_vma_offset(vma) | UPDATE;
 				eb->args->flags |= __EXEC_HAS_RELOC;
 			}
 		} else {
@@ -1065,7 +1068,7 @@ static inline u64
 relocation_target(const struct drm_i915_gem_relocation_entry *reloc,
 		  const struct i915_vma *target)
 {
-	return gen8_canonical_addr((int)reloc->delta + target->node.start);
+	return gen8_canonical_addr((int)reloc->delta + i915_vma_offset(target));
 }
 
 static void reloc_cache_init(struct reloc_cache *cache,
@@ -1274,7 +1277,7 @@ static void *reloc_iomap(struct i915_vma *batch,
 			if (err) /* no inactive aperture space, use cpu reloc */
 				return NULL;
 		} else {
-			cache->node.start = vma->node.start;
+			cache->node.start = i915_ggtt_offset(vma);
 			cache->node.mm = (void *)vma;
 		}
 	}
@@ -1437,7 +1440,7 @@ eb_relocate_entry(struct i915_execbuffer *eb,
 	 * more work needs to be done.
 	 */
 	if (!DBG_FORCE_RELOC &&
-	    gen8_canonical_addr(target->vma->node.start) == reloc->presumed_offset)
+	    gen8_canonical_addr(i915_vma_offset(target->vma)) == reloc->presumed_offset)
 		return 0;
 
 	/* Check that the relocation address is valid... */
@@ -2365,7 +2368,7 @@ static int eb_request_submit(struct i915_execbuffer *eb,
 	}
 
 	err = rq->context->engine->emit_bb_start(rq,
-						 batch->node.start +
+						 i915_vma_offset(batch) +
 						 eb->batch_start_offset,
 						 batch_len,
 						 eb->batch_flags);
@@ -2376,7 +2379,7 @@ static int eb_request_submit(struct i915_execbuffer *eb,
 		GEM_BUG_ON(intel_context_is_parallel(rq->context));
 		GEM_BUG_ON(eb->batch_start_offset);
 		err = rq->context->engine->emit_bb_start(rq,
-							 eb->trampoline->node.start +
+							 i915_vma_offset(eb->trampoline) +
 							 batch_len, 0, 0);
 		if (err)
 			return err;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index c29efdef8313a..d73ba0f5c4c52 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -395,7 +395,7 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
 	/* Finally, remap it using the new GTT offset */
 	ret = remap_io_mapping(area,
 			       area->vm_start + (vma->gtt_view.partial.offset << PAGE_SHIFT),
-			       (ggtt->gmadr.start + vma->node.start) >> PAGE_SHIFT,
+			       (ggtt->gmadr.start + i915_ggtt_offset(vma)) >> PAGE_SHIFT,
 			       min_t(u64, vma->size, area->vm_end - area->vm_start),
 			       &ggtt->iomap);
 	if (ret)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index 8dc5c8874d8a2..b1672e054b21e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -400,7 +400,7 @@ i915_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr
 	mutex_lock(&to_gt(i915)->ggtt->vm.mutex);
 	list_for_each_entry_safe(vma, next,
 				 &to_gt(i915)->ggtt->vm.bound_list, vm_link) {
-		unsigned long count = vma->node.size >> PAGE_SHIFT;
+		unsigned long count = i915_vma_size(vma) >> PAGE_SHIFT;
 		struct drm_i915_gem_object *obj = vma->obj;
 
 		if (!vma->iomap || i915_vma_is_active(vma))
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_tiling.c b/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
index fd42b89b7162b..04bb909acdec8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
@@ -168,11 +168,11 @@ static bool i915_vma_fence_prepare(struct i915_vma *vma,
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
index beaf27e09e8a9..e0c2ac9c8053a 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -400,7 +400,7 @@ static int igt_check_page_sizes(struct i915_vma *vma)
 	 * Maintaining alignment is required to utilise huge pages in the ppGGT.
 	 */
 	if (i915_gem_object_is_lmem(obj) &&
-	    IS_ALIGNED(vma->node.start, SZ_2M) &&
+	    IS_ALIGNED(i915_vma_offset(vma), SZ_2M) &&
 	    vma->page_sizes.sg & SZ_2M &&
 	    vma->resource->page_sizes_gtt < SZ_2M) {
 		pr_err("gtt pages mismatch for LMEM, expected 2M GTT pages, sg(%u), gtt(%u)\n",
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
index 9a6a6b5b722b6..0650137a1509c 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
@@ -193,12 +193,12 @@ static int prepare_blit(const struct tiled_blits *t,
 		*cs++ = src_4t | dst_4t | BLT_DEPTH_32 | dst_pitch;
 		*cs++ = 0;
 		*cs++ = t->height << 16 | t->width;
-		*cs++ = lower_32_bits(dst->vma->node.start);
-		*cs++ = upper_32_bits(dst->vma->node.start);
+		*cs++ = lower_32_bits(i915_vma_offset(dst->vma));
+		*cs++ = upper_32_bits(i915_vma_offset(dst->vma));
 		*cs++ = 0;
 		*cs++ = src_pitch;
-		*cs++ = lower_32_bits(src->vma->node.start);
-		*cs++ = upper_32_bits(src->vma->node.start);
+		*cs++ = lower_32_bits(i915_vma_offset(src->vma));
+		*cs++ = upper_32_bits(i915_vma_offset(src->vma));
 	} else {
 		if (ver >= 6) {
 			*cs++ = MI_LOAD_REGISTER_IMM(1);
@@ -239,14 +239,14 @@ static int prepare_blit(const struct tiled_blits *t,
 		*cs++ = BLT_DEPTH_32 | BLT_ROP_SRC_COPY | dst_pitch;
 		*cs++ = 0;
 		*cs++ = t->height << 16 | t->width;
-		*cs++ = lower_32_bits(dst->vma->node.start);
+		*cs++ = lower_32_bits(i915_vma_offset(dst->vma));
 		if (use_64b_reloc)
-			*cs++ = upper_32_bits(dst->vma->node.start);
+			*cs++ = upper_32_bits(i915_vma_offset(dst->vma));
 		*cs++ = 0;
 		*cs++ = src_pitch;
-		*cs++ = lower_32_bits(src->vma->node.start);
+		*cs++ = lower_32_bits(i915_vma_offset(src->vma));
 		if (use_64b_reloc)
-			*cs++ = upper_32_bits(src->vma->node.start);
+			*cs++ = upper_32_bits(i915_vma_offset(src->vma));
 	}
 
 	*cs++ = MI_BATCH_BUFFER_END;
@@ -476,7 +476,7 @@ static int pin_buffer(struct i915_vma *vma, u64 addr)
 {
 	int err;
 
-	if (drm_mm_node_allocated(&vma->node) && vma->node.start != addr) {
+	if (drm_mm_node_allocated(&vma->node) && i915_vma_offset(vma) != addr) {
 		err = i915_vma_unbind_unlocked(vma);
 		if (err)
 			return err;
@@ -486,6 +486,7 @@ static int pin_buffer(struct i915_vma *vma, u64 addr)
 	if (err)
 		return err;
 
+	GEM_BUG_ON(i915_vma_offset(vma) != addr);
 	return 0;
 }
 
@@ -532,8 +533,8 @@ tiled_blit(struct tiled_blits *t,
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
index d8864444432b7..8affd535a0e82 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -914,8 +914,8 @@ static int rpcs_query_batch(struct drm_i915_gem_object *rpcs,
 
 	*cmd++ = MI_STORE_REGISTER_MEM_GEN8;
 	*cmd++ = i915_mmio_reg_offset(GEN8_R_PWR_CLK_STATE(engine->mmio_base));
-	*cmd++ = lower_32_bits(vma->node.start);
-	*cmd++ = upper_32_bits(vma->node.start);
+	*cmd++ = lower_32_bits(i915_vma_offset(vma));
+	*cmd++ = upper_32_bits(i915_vma_offset(vma));
 	*cmd = MI_BATCH_BUFFER_END;
 
 	__i915_gem_object_flush_map(rpcs, 0, 64);
@@ -1003,7 +1003,8 @@ emit_rpcs_query(struct drm_i915_gem_object *obj,
 	}
 
 	err = rq->engine->emit_bb_start(rq,
-					batch->node.start, batch->node.size,
+					i915_vma_offset(batch),
+					i915_vma_size(batch),
 					0);
 	if (err)
 		goto skip_request;
@@ -1566,7 +1567,8 @@ static int write_to_scratch(struct i915_gem_context *ctx,
 			goto skip_request;
 	}
 
-	err = engine->emit_bb_start(rq, vma->node.start, vma->node.size, 0);
+	err = engine->emit_bb_start(rq, i915_vma_offset(vma),
+				    i915_vma_size(vma), 0);
 	if (err)
 		goto skip_request;
 
@@ -1671,7 +1673,7 @@ static int read_from_scratch(struct i915_gem_context *ctx,
 		*cmd++ = offset;
 		*cmd++ = MI_STORE_REGISTER_MEM | MI_USE_GGTT;
 		*cmd++ = reg;
-		*cmd++ = vma->node.start + result;
+		*cmd++ = i915_vma_offset(vma) + result;
 		*cmd = MI_BATCH_BUFFER_END;
 
 		i915_gem_object_flush_map(obj);
@@ -1702,7 +1704,8 @@ static int read_from_scratch(struct i915_gem_context *ctx,
 			goto skip_request;
 	}
 
-	err = engine->emit_bb_start(rq, vma->node.start, vma->node.size, flags);
+	err = engine->emit_bb_start(rq, i915_vma_offset(vma),
+				    i915_vma_size(vma), flags);
 	if (err)
 		goto skip_request;
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index 1cae24349a96f..472145182ece7 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -1612,7 +1612,7 @@ static int __igt_mmap_gpu(struct drm_i915_private *i915,
 		if (err == 0)
 			err = i915_vma_move_to_active(vma, rq, 0);
 
-		err = engine->emit_bb_start(rq, vma->node.start, 0, 0);
+		err = engine->emit_bb_start(rq, i915_vma_offset(vma), 0, 0);
 		i915_request_get(rq);
 		i915_request_add(rq);
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c b/drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c
index 3c55e77b0f1b0..c23899646b117 100644
--- a/drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c
+++ b/drivers/gpu/drm/i915/gem/selftests/igt_gem_utils.c
@@ -62,8 +62,8 @@ igt_emit_store_dw(struct i915_vma *vma,
 		goto err;
 	}
 
-	GEM_BUG_ON(offset + (count - 1) * PAGE_SIZE > vma->node.size);
-	offset += vma->node.start;
+	GEM_BUG_ON(offset + (count - 1) * PAGE_SIZE > i915_vma_size(vma));
+	offset += i915_vma_offset(vma);
 
 	for (n = 0; n < count; n++) {
 		if (ver >= 8) {
@@ -151,7 +151,8 @@ int igt_gpu_fill_dw(struct intel_context *ce,
 		flags |= I915_DISPATCH_SECURE;
 
 	err = rq->engine->emit_bb_start(rq,
-					batch->node.start, batch->node.size,
+					i915_vma_offset(batch),
+					i915_vma_size(batch),
 					flags);
 
 skip_request:
diff --git a/drivers/gpu/drm/i915/gt/gen7_renderclear.c b/drivers/gpu/drm/i915/gt/gen7_renderclear.c
index 317efb145787e..d38b914d12069 100644
--- a/drivers/gpu/drm/i915/gt/gen7_renderclear.c
+++ b/drivers/gpu/drm/i915/gt/gen7_renderclear.c
@@ -106,7 +106,7 @@ static u32 batch_offset(const struct batch_chunk *bc, u32 *cs)
 
 static u32 batch_addr(const struct batch_chunk *bc)
 {
-	return bc->vma->node.start;
+	return i915_vma_offset(bc->vma);
 }
 
 static void batch_add(struct batch_chunk *bc, const u32 d)
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
index ea775e601686d..fe2b9a9fd7c18 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
@@ -220,7 +220,8 @@ static int fence_update(struct i915_fence_reg *fence,
 				return ret;
 		}
 
-		fence->start = vma->node.start;
+		GEM_BUG_ON(vma->fence_size > i915_vma_size(vma));
+		fence->start = i915_ggtt_offset(vma);
 		fence->size = vma->fence_size;
 		fence->stride = i915_gem_object_get_stride(vma->obj);
 		fence->tiling = i915_gem_object_get_tiling(vma->obj);
diff --git a/drivers/gpu/drm/i915/gt/intel_renderstate.c b/drivers/gpu/drm/i915/gt/intel_renderstate.c
index 5121e6dc2fa53..e3af081c41342 100644
--- a/drivers/gpu/drm/i915/gt/intel_renderstate.c
+++ b/drivers/gpu/drm/i915/gt/intel_renderstate.c
@@ -63,7 +63,7 @@ static int render_state_setup(struct intel_renderstate *so,
 		u32 s = rodata->batch[i];
 
 		if (i * 4  == rodata->reloc[reloc_index]) {
-			u64 r = s + so->vma->node.start;
+			u64 r = s + i915_vma_offset(so->vma);
 
 			s = lower_32_bits(r);
 			if (HAS_64BIT_RELOC(i915)) {
diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
index d5d6f1fadcae3..7d6db5fc92451 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
@@ -895,7 +895,7 @@ static int clear_residuals(struct i915_request *rq)
 	}
 
 	ret = engine->emit_bb_start(rq,
-				    engine->wa_ctx.vma->node.start, 0,
+				    i915_vma_offset(engine->wa_ctx.vma), 0,
 				    0);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_cs.c b/drivers/gpu/drm/i915/gt/selftest_engine_cs.c
index 881b64f3e7b99..542ce6d2de192 100644
--- a/drivers/gpu/drm/i915/gt/selftest_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/selftest_engine_cs.c
@@ -178,7 +178,7 @@ static int perf_mi_bb_start(void *arg)
 				goto out;
 
 			err = rq->engine->emit_bb_start(rq,
-							batch->node.start, 8,
+							i915_vma_offset(batch), 8,
 							0);
 			if (err)
 				goto out;
@@ -321,7 +321,7 @@ static int perf_mi_noop(void *arg)
 				goto out;
 
 			err = rq->engine->emit_bb_start(rq,
-							base->node.start, 8,
+							i915_vma_offset(base), 8,
 							0);
 			if (err)
 				goto out;
@@ -331,8 +331,8 @@ static int perf_mi_noop(void *arg)
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
index 2c7c053a88081..667c49c20e719 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -2737,11 +2737,11 @@ static int create_gang(struct intel_engine_cs *engine,
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
@@ -2769,7 +2769,7 @@ static int create_gang(struct intel_engine_cs *engine,
 		err = i915_vma_move_to_active(vma, rq, 0);
 	if (!err)
 		err = rq->engine->emit_bb_start(rq,
-						vma->node.start,
+						i915_vma_offset(vma),
 						PAGE_SIZE, 0);
 	i915_vma_unlock(vma);
 	i915_request_add(rq);
@@ -3097,7 +3097,7 @@ create_gpr_user(struct intel_engine_cs *engine,
 		*cs++ = MI_MATH_ADD;
 		*cs++ = MI_MATH_STORE(MI_MATH_REG(i), MI_MATH_REG_ACCU);
 
-		addr = result->node.start + offset + i * sizeof(*cs);
+		addr = i915_vma_offset(result) + offset + i * sizeof(*cs);
 		*cs++ = MI_STORE_REGISTER_MEM_GEN8;
 		*cs++ = CS_GPR(engine, 2 * i);
 		*cs++ = lower_32_bits(addr);
@@ -3107,8 +3107,8 @@ create_gpr_user(struct intel_engine_cs *engine,
 			MI_SEMAPHORE_POLL |
 			MI_SEMAPHORE_SAD_GTE_SDD;
 		*cs++ = i;
-		*cs++ = lower_32_bits(result->node.start);
-		*cs++ = upper_32_bits(result->node.start);
+		*cs++ = lower_32_bits(i915_vma_offset(result));
+		*cs++ = upper_32_bits(i915_vma_offset(result));
 	}
 
 	*cs++ = MI_BATCH_BUFFER_END;
@@ -3192,7 +3192,7 @@ create_gpr_client(struct intel_engine_cs *engine,
 		err = i915_vma_move_to_active(batch, rq, 0);
 	if (!err)
 		err = rq->engine->emit_bb_start(rq,
-						batch->node.start,
+						i915_vma_offset(batch),
 						PAGE_SIZE, 0);
 	i915_vma_unlock(batch);
 	i915_vma_unpin(batch);
@@ -3526,7 +3526,7 @@ static int smoke_submit(struct preempt_smoke *smoke,
 			err = i915_vma_move_to_active(vma, rq, 0);
 		if (!err)
 			err = rq->engine->emit_bb_start(rq,
-							vma->node.start,
+							i915_vma_offset(vma),
 							PAGE_SIZE, 0);
 		i915_vma_unlock(vma);
 	}
diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
index 71263058a7b05..74f740fda0c89 100644
--- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
@@ -96,7 +96,8 @@ static int hang_init(struct hang *h, struct intel_gt *gt)
 static u64 hws_address(const struct i915_vma *hws,
 		       const struct i915_request *rq)
 {
-	return hws->node.start + offset_in_page(sizeof(u32)*rq->fence.context);
+	return i915_vma_offset(hws) +
+	       offset_in_page(sizeof(u32) * rq->fence.context);
 }
 
 static int move_to_active(struct i915_vma *vma,
@@ -196,8 +197,8 @@ hang_create_request(struct hang *h, struct intel_engine_cs *engine)
 
 		*batch++ = MI_NOOP;
 		*batch++ = MI_BATCH_BUFFER_START | 1 << 8 | 1;
-		*batch++ = lower_32_bits(vma->node.start);
-		*batch++ = upper_32_bits(vma->node.start);
+		*batch++ = lower_32_bits(i915_vma_offset(vma));
+		*batch++ = upper_32_bits(i915_vma_offset(vma));
 	} else if (GRAPHICS_VER(gt->i915) >= 6) {
 		*batch++ = MI_STORE_DWORD_IMM_GEN4;
 		*batch++ = 0;
@@ -210,7 +211,7 @@ hang_create_request(struct hang *h, struct intel_engine_cs *engine)
 
 		*batch++ = MI_NOOP;
 		*batch++ = MI_BATCH_BUFFER_START | 1 << 8;
-		*batch++ = lower_32_bits(vma->node.start);
+		*batch++ = lower_32_bits(i915_vma_offset(vma));
 	} else if (GRAPHICS_VER(gt->i915) >= 4) {
 		*batch++ = MI_STORE_DWORD_IMM_GEN4 | MI_USE_GGTT;
 		*batch++ = 0;
@@ -223,7 +224,7 @@ hang_create_request(struct hang *h, struct intel_engine_cs *engine)
 
 		*batch++ = MI_NOOP;
 		*batch++ = MI_BATCH_BUFFER_START | 2 << 6;
-		*batch++ = lower_32_bits(vma->node.start);
+		*batch++ = lower_32_bits(i915_vma_offset(vma));
 	} else {
 		*batch++ = MI_STORE_DWORD_IMM | MI_MEM_VIRTUAL;
 		*batch++ = lower_32_bits(hws_address(hws, rq));
@@ -235,7 +236,7 @@ hang_create_request(struct hang *h, struct intel_engine_cs *engine)
 
 		*batch++ = MI_NOOP;
 		*batch++ = MI_BATCH_BUFFER_START | 2 << 6;
-		*batch++ = lower_32_bits(vma->node.start);
+		*batch++ = lower_32_bits(i915_vma_offset(vma));
 	}
 	*batch++ = MI_BATCH_BUFFER_END; /* not reached */
 	intel_gt_chipset_flush(engine->gt);
@@ -250,7 +251,7 @@ hang_create_request(struct hang *h, struct intel_engine_cs *engine)
 	if (GRAPHICS_VER(gt->i915) <= 5)
 		flags |= I915_DISPATCH_SECURE;
 
-	err = rq->engine->emit_bb_start(rq, vma->node.start, PAGE_SIZE, flags);
+	err = rq->engine->emit_bb_start(rq, i915_vma_offset(vma), PAGE_SIZE, flags);
 
 cancel_rq:
 	if (err) {
diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
index 82d3f8058995a..735eb557ec8c0 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -1034,8 +1034,8 @@ store_context(struct intel_context *ce, struct i915_vma *scratch)
 		while (len--) {
 			*cs++ = MI_STORE_REGISTER_MEM_GEN8;
 			*cs++ = hw[dw];
-			*cs++ = lower_32_bits(scratch->node.start + x);
-			*cs++ = upper_32_bits(scratch->node.start + x);
+			*cs++ = lower_32_bits(i915_vma_offset(scratch) + x);
+			*cs++ = upper_32_bits(i915_vma_offset(scratch) + x);
 
 			dw += 2;
 			x += 4;
@@ -1117,8 +1117,8 @@ record_registers(struct intel_context *ce,
 
 	*cs++ = MI_ARB_ON_OFF | MI_ARB_DISABLE;
 	*cs++ = MI_BATCH_BUFFER_START_GEN8 | BIT(8);
-	*cs++ = lower_32_bits(b_before->node.start);
-	*cs++ = upper_32_bits(b_before->node.start);
+	*cs++ = lower_32_bits(i915_vma_offset(b_before));
+	*cs++ = upper_32_bits(i915_vma_offset(b_before));
 
 	*cs++ = MI_ARB_ON_OFF | MI_ARB_ENABLE;
 	*cs++ = MI_SEMAPHORE_WAIT |
@@ -1133,8 +1133,8 @@ record_registers(struct intel_context *ce,
 
 	*cs++ = MI_ARB_ON_OFF | MI_ARB_DISABLE;
 	*cs++ = MI_BATCH_BUFFER_START_GEN8 | BIT(8);
-	*cs++ = lower_32_bits(b_after->node.start);
-	*cs++ = upper_32_bits(b_after->node.start);
+	*cs++ = lower_32_bits(i915_vma_offset(b_after));
+	*cs++ = upper_32_bits(i915_vma_offset(b_after));
 
 	intel_ring_advance(rq, cs);
 
@@ -1255,8 +1255,8 @@ static int poison_registers(struct intel_context *ce, u32 poison, u32 *sema)
 
 	*cs++ = MI_ARB_ON_OFF | MI_ARB_DISABLE;
 	*cs++ = MI_BATCH_BUFFER_START_GEN8 | BIT(8);
-	*cs++ = lower_32_bits(batch->node.start);
-	*cs++ = upper_32_bits(batch->node.start);
+	*cs++ = lower_32_bits(i915_vma_offset(batch));
+	*cs++ = upper_32_bits(i915_vma_offset(batch));
 
 	*cs++ = MI_STORE_DWORD_IMM_GEN4 | MI_USE_GGTT;
 	*cs++ = i915_ggtt_offset(ce->engine->status_page.vma) +
diff --git a/drivers/gpu/drm/i915/gt/selftest_ring_submission.c b/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
index 70f9ac1ec2c76..87ceb0f374b67 100644
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
index 99a372486fb7f..eb33ba0351443 100644
--- a/drivers/gpu/drm/i915/gt/selftest_rps.c
+++ b/drivers/gpu/drm/i915/gt/selftest_rps.c
@@ -122,14 +122,14 @@ create_spin_counter(struct intel_engine_cs *engine,
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
@@ -657,7 +657,7 @@ int live_rps_frequency_cs(void *arg)
 			err = i915_vma_move_to_active(vma, rq, 0);
 		if (!err)
 			err = rq->engine->emit_bb_start(rq,
-							vma->node.start,
+							i915_vma_offset(vma),
 							PAGE_SIZE, 0);
 		i915_request_add(rq);
 		if (err)
@@ -798,7 +798,7 @@ int live_rps_frequency_srm(void *arg)
 			err = i915_vma_move_to_active(vma, rq, 0);
 		if (!err)
 			err = rq->engine->emit_bb_start(rq,
-							vma->node.start,
+							i915_vma_offset(vma),
 							PAGE_SIZE, 0);
 		i915_request_add(rq);
 		if (err)
diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
index 21b1edc052f88..1c949d32f10eb 100644
--- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
@@ -523,7 +523,7 @@ static int check_dirty_whitelist(struct intel_context *ce)
 	for (i = 0; i < engine->whitelist.count; i++) {
 		u32 reg = i915_mmio_reg_offset(engine->whitelist.list[i].reg);
 		struct i915_gem_ww_ctx ww;
-		u64 addr = scratch->node.start;
+		u64 addr = i915_vma_offset(scratch);
 		struct i915_request *rq;
 		u32 srm, lrm, rsvd;
 		u32 expect;
@@ -646,7 +646,7 @@ static int check_dirty_whitelist(struct intel_context *ce)
 			goto err_request;
 
 		err = engine->emit_bb_start(rq,
-					    batch->node.start, PAGE_SIZE,
+					    i915_vma_offset(batch), PAGE_SIZE,
 					    0);
 		if (err)
 			goto err_request;
@@ -878,7 +878,7 @@ static int read_whitelisted_registers(struct intel_context *ce,
 	}
 
 	for (i = 0; i < engine->whitelist.count; i++) {
-		u64 offset = results->node.start + sizeof(u32) * i;
+		u64 offset = i915_vma_offset(results) + sizeof(u32) * i;
 		u32 reg = i915_mmio_reg_offset(engine->whitelist.list[i].reg);
 
 		/* Clear non priv flags */
@@ -952,7 +952,7 @@ static int scrub_whitelisted_registers(struct intel_context *ce)
 		goto err_request;
 
 	/* Perform the writes from an unprivileged "user" batch */
-	err = engine->emit_bb_start(rq, batch->node.start, 0, 0);
+	err = engine->emit_bb_start(rq, i915_vma_offset(batch), 0, 0);
 
 err_request:
 	err = request_add_sync(rq, err);
diff --git a/drivers/gpu/drm/i915/i915_cmd_parser.c b/drivers/gpu/drm/i915/i915_cmd_parser.c
index f93e6122f2478..ddf49c2dbb917 100644
--- a/drivers/gpu/drm/i915/i915_cmd_parser.c
+++ b/drivers/gpu/drm/i915/i915_cmd_parser.c
@@ -1471,8 +1471,8 @@ int intel_engine_cmd_parser(struct intel_engine_cs *engine,
 		/* Defer failure until attempted use */
 		jump_whitelist = alloc_whitelist(batch_length);
 
-	shadow_addr = gen8_canonical_addr(shadow->node.start);
-	batch_addr = gen8_canonical_addr(batch->node.start + batch_offset);
+	shadow_addr = gen8_canonical_addr(i915_vma_offset(shadow));
+	batch_addr = gen8_canonical_addr(i915_vma_offset(batch) + batch_offset);
 
 	/*
 	 * We use the batch length as size because the shadow object is as
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index ae987e92251dd..dcc2663d47064 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -183,7 +183,7 @@ i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
 
 		seq_printf(m, " (%s offset: %08llx, size: %08llx, pages: %s",
 			   stringify_vma_type(vma),
-			   vma->node.start, vma->node.size,
+			   i915_vma_offset(vma), i915_vma_size(vma),
 			   stringify_page_sizes(vma->resource->page_sizes_gtt,
 						NULL, 0));
 		if (i915_vma_is_ggtt(vma) || i915_vma_is_dpt(vma)) {
diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 0dd597a7a11f5..e10d1723d8186 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -2258,7 +2258,7 @@ emit_oa_config(struct i915_perf_stream *stream,
 		goto err_add_request;
 
 	err = rq->engine->emit_bb_start(rq,
-					vma->node.start, 0,
+					i915_vma_offset(vma), 0,
 					I915_DISPATCH_SECURE);
 	if (err)
 		goto err_add_request;
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index c39488eb9eeba..2be43885a2b5d 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -416,8 +416,8 @@ i915_vma_resource_init_from_vma(struct i915_vma_resource *vma_res,
 	i915_vma_resource_init(vma_res, vma->vm, vma->pages, &vma->page_sizes,
 			       obj->mm.rsgt, i915_gem_object_is_readonly(obj),
 			       i915_gem_object_is_lmem(obj), obj->mm.region,
-			       vma->ops, vma->private, vma->node.start,
-			       vma->node.size, vma->size);
+			       vma->ops, vma->private, __i915_vma_offset(vma),
+			       __i915_vma_size(vma), vma->size);
 }
 
 /**
@@ -445,7 +445,7 @@ int i915_vma_bind(struct i915_vma *vma,
 
 	lockdep_assert_held(&vma->vm->mutex);
 	GEM_BUG_ON(!drm_mm_node_allocated(&vma->node));
-	GEM_BUG_ON(vma->size > vma->node.size);
+	GEM_BUG_ON(vma->size > i915_vma_size(vma));
 
 	if (GEM_DEBUG_WARN_ON(range_overflows(vma->node.start,
 					      vma->node.size,
@@ -567,8 +567,8 @@ void __iomem *i915_vma_pin_iomap(struct i915_vma *vma)
 							  vma->obj->base.size);
 		} else if (i915_vma_is_map_and_fenceable(vma)) {
 			ptr = io_mapping_map_wc(&i915_vm_to_ggtt(vma->vm)->iomap,
-						vma->node.start,
-						vma->node.size);
+						i915_vma_offset(vma),
+						i915_vma_size(vma));
 		} else {
 			ptr = (void __iomem *)
 				i915_gem_object_pin_map(vma->obj, I915_MAP_WC);
@@ -657,22 +657,22 @@ bool i915_vma_misplaced(const struct i915_vma *vma,
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
@@ -685,10 +685,11 @@ void __i915_vma_set_map_and_fenceable(struct i915_vma *vma)
 	GEM_BUG_ON(!i915_vma_is_ggtt(vma));
 	GEM_BUG_ON(!vma->fence_size);
 
-	fenceable = (vma->node.size >= vma->fence_size &&
-		     IS_ALIGNED(vma->node.start, vma->fence_alignment));
+	fenceable = (i915_vma_size(vma) >= vma->fence_size &&
+		     IS_ALIGNED(i915_vma_offset(vma), vma->fence_alignment));
 
-	mappable = vma->node.start + vma->fence_size <= i915_vm_to_ggtt(vma->vm)->mappable_end;
+	mappable = i915_ggtt_offset(vma) + vma->fence_size <=
+		   i915_vm_to_ggtt(vma->vm)->mappable_end;
 
 	if (mappable && fenceable)
 		set_bit(I915_VMA_CAN_FENCE_BIT, __i915_vma_flags(vma));
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index aecd9c64486b2..0954f8a933869 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -124,13 +124,58 @@ static inline bool i915_vma_is_closed(const struct i915_vma *vma)
 	return !list_empty(&vma->closed_link);
 }
 
+/* Internal use only. */
+static inline u64 __i915_vma_size(const struct i915_vma *vma)
+{
+	return vma->node.size;
+}
+
+/**
+ * i915_vma_offset - Obtain the va range size of the vma
+ * @vma: The vma
+ *
+ * GPU virtual address space may be allocated with padding. This
+ * function returns the effective virtual address range size
+ * with padding subtracted.
+ *
+ * Return: The effective virtual address range size.
+ */
+static inline u64 i915_vma_size(const struct i915_vma *vma)
+{
+	GEM_BUG_ON(!drm_mm_node_allocated(&vma->node));
+	return __i915_vma_size(vma);
+}
+
+/* Internal use only. */
+static inline u64 __i915_vma_offset(const struct i915_vma *vma)
+{
+	return vma->node.start;
+}
+
+/**
+ * i915_vma_offset - Obtain the va offset of the vma
+ * @vma: The vma
+ *
+ * GPU virtual address space may be allocated with padding. This
+ * function returns the effective virtual address offset the gpu
+ * should use to access the bound data.
+ *
+ * Return: The effective virtual address offset.
+ */
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
+	GEM_BUG_ON(upper_32_bits(i915_vma_offset(vma) +
+				 i915_vma_size(vma) - 1));
+	return lower_32_bits(i915_vma_offset(vma));
 }
 
 static inline u32 i915_ggtt_pin_bias(struct i915_vma *vma)
diff --git a/drivers/gpu/drm/i915/i915_vma_resource.h b/drivers/gpu/drm/i915/i915_vma_resource.h
index 06923d1816e7e..54edf3739ca0b 100644
--- a/drivers/gpu/drm/i915/i915_vma_resource.h
+++ b/drivers/gpu/drm/i915/i915_vma_resource.h
@@ -52,8 +52,10 @@ struct i915_page_sizes {
  * @mr: The memory region of the object pointed to by the vma.
  * @ops: Pointer to the backend i915_vma_ops.
  * @private: Bind backend private info.
- * @start: Offset into the address space of bind range start.
- * @node_size: Size of the allocated range manager node.
+ * @start: Offset into the address space of bind range start. Note that
+ * this is after any padding that might have been allocated.
+ * @node_size: Size of the allocated range manager node with padding
+ * subtracted.
  * @vma_size: Bind size.
  * @page_sizes_gtt: Resulting page sizes from the bind operation.
  * @bound_flags: Flags indicating binding status.
@@ -174,8 +176,8 @@ static inline void i915_vma_resource_put(struct i915_vma_resource *vma_res)
  * @mr: The memory region of the object the vma points to.
  * @ops: The backend ops.
  * @private: Bind backend private info.
- * @start: Offset into the address space of bind range start.
- * @node_size: Size of the allocated range manager node.
+ * @start: Offset into the address space of bind range start after padding.
+ * @node_size: Size of the allocated range manager node minus padding.
  * @size: Bind size.
  *
  * Initializes a vma resource allocated using i915_vma_resource_alloc().
diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index 4380473ceb986..3db386e6bafdf 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -1017,8 +1017,8 @@ empty_request(struct intel_engine_cs *engine,
 		return request;
 
 	err = engine->emit_bb_start(request,
-				    batch->node.start,
-				    batch->node.size,
+				    i915_vma_offset(batch),
+				    i915_vma_size(batch),
 				    I915_DISPATCH_SECURE);
 	if (err)
 		goto out_request;
@@ -1138,14 +1138,14 @@ static struct i915_vma *recursive_batch(struct drm_i915_private *i915)
 
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
 
@@ -1229,8 +1229,8 @@ static int live_all_engines(void *arg)
 		GEM_BUG_ON(err);
 
 		err = engine->emit_bb_start(request[idx],
-					    batch->node.start,
-					    batch->node.size,
+					    i915_vma_offset(batch),
+					    i915_vma_size(batch),
 					    0);
 		GEM_BUG_ON(err);
 		request[idx]->batch = batch;
@@ -1359,8 +1359,8 @@ static int live_sequential_engines(void *arg)
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
index 0c22594ae2746..4b8dc72d499f3 100644
--- a/drivers/gpu/drm/i915/selftests/igt_spinner.c
+++ b/drivers/gpu/drm/i915/selftests/igt_spinner.c
@@ -116,7 +116,7 @@ static unsigned int seqno_offset(u64 fence)
 static u64 hws_address(const struct i915_vma *hws,
 		       const struct i915_request *rq)
 {
-	return hws->node.start + seqno_offset(rq->fence.context);
+	return i915_vma_offset(hws) + seqno_offset(rq->fence.context);
 }
 
 static int move_to_active(struct i915_vma *vma,
@@ -203,8 +203,8 @@ igt_spinner_create_request(struct igt_spinner *spin,
 		*batch++ = MI_BATCH_BUFFER_START;
 	else
 		*batch++ = MI_BATCH_BUFFER_START | MI_BATCH_GTT;
-	*batch++ = lower_32_bits(vma->node.start);
-	*batch++ = upper_32_bits(vma->node.start);
+	*batch++ = lower_32_bits(i915_vma_offset(vma));
+	*batch++ = upper_32_bits(i915_vma_offset(vma));
 
 	*batch++ = MI_BATCH_BUFFER_END; /* not reached */
 
@@ -219,7 +219,7 @@ igt_spinner_create_request(struct igt_spinner *spin,
 	flags = 0;
 	if (GRAPHICS_VER(rq->engine->i915) <= 5)
 		flags |= I915_DISPATCH_SECURE;
-	err = engine->emit_bb_start(rq, vma->node.start, PAGE_SIZE, flags);
+	err = engine->emit_bb_start(rq, i915_vma_offset(vma), PAGE_SIZE, flags);
 
 cancel_rq:
 	if (err) {
-- 
2.37.2

