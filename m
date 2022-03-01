Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7824C97F7
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 22:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7587810E622;
	Tue,  1 Mar 2022 21:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DAE10E622;
 Tue,  1 Mar 2022 21:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646171602; x=1677707602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ML14URIr6uysbUGZe37QLpL9MYR3aHwvz4TsDiwT1Kc=;
 b=k9TLqKmtd/7rZSz/aOAu/A1/VIx7wuO4/UiDEEw4mDF7KjzOF3nuGo5o
 BIKwBZVJ9AauydP13JHV5IMV3jxTyTOZtvIiehDK+mw6XgEHiHAN8FOor
 fe+7SCTtQHz+Ezq13sYteVRP5ij1Bx5RrDm4Q9tdMvfY9yFhO71+sRvwQ
 30vnCfIzOrGzWcrSsVOw8l8sGFKHAfB9xgIzlzkpFRM+bDv/HdaResdBV
 Nw70/OfzLDoLqBz23KR5+drlFnZa/0qulfgQ8OvevoYKFchaJs/REvS4Q
 4YS4Mu9MhlBZl0F1LKXM3mpcz7/BX7EURk5hjHIxPAxFrnayGqB4kSPAj w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="277922716"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="277922716"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 13:53:22 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="510704664"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 13:53:20 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 4/4] drm/i915/migrate: Evict and restore the flatccs
 capable lmem obj
Date: Wed,  2 Mar 2022 03:23:34 +0530
Message-Id: <20220301215334.20543-5-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220301215334.20543-1-ramalingam.c@intel.com>
References: <20220301215334.20543-1-ramalingam.c@intel.com>
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When we are swapping out the local memory obj on flat-ccs capable platform,
we need to capture the ccs data too along with main meory and we need to
restore it when we are swapping in the content.

When lmem object is swapped into a smem obj, smem obj will
have the extra pages required to hold the ccs data corresponding to the
lmem main memory. So main memory of lmem will be copied into the initial
pages of the smem and then ccs data corresponding to the main memory
will be copied to the subsequent pages of smem. ccs data is 1/256 of
lmem size.

Swapin happens exactly in reverse order. First main memory of lmem is
restored from the smem's initial pages and the ccs data will be restored
from the subsequent pages of smem.

Extracting and restoring the CCS data is done through a special cmd called
XY_CTRL_SURF_COPY_BLT

v2: Fixing the ccs handling

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 184 +++++++++++++++++++++---
 1 file changed, 167 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index 330fcdc3e0cf..73ac7382aeb6 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -341,12 +341,9 @@ static int emit_no_arbitration(struct i915_request *rq)
 	return 0;
 }
 
-static int emit_pte(struct i915_request *rq,
-		    struct sgt_dma *it,
+static int emit_pte(struct i915_request *rq, struct sgt_dma *it,
 		    enum i915_cache_level cache_level,
-		    bool is_lmem,
-		    u64 offset,
-		    int length)
+		    bool is_lmem, u64 offset, int length)
 {
 	bool has_64K_pages = HAS_64K_PAGES(rq->engine->i915);
 	const u64 encode = rq->context->vm->pte_encode(0, cache_level,
@@ -573,14 +570,54 @@ static u32 *_i915_ctrl_surf_copy_blt(u32 *cmd, u64 src_addr, u64 dst_addr,
 	return cmd;
 }
 
+static int emit_ccs_copy(struct i915_request *rq,
+			 bool dst_is_lmem, u32 dst_offset,
+			 bool src_is_lmem, u32 src_offset, int size)
+{
+	struct drm_i915_private *i915 = rq->engine->i915;
+	int mocs = rq->engine->gt->mocs.uc_index << 1;
+	u32 num_ccs_blks, ccs_ring_size;
+	u8 src_access, dst_access;
+	u32 *cs;
+
+	GEM_BUG_ON(!(src_is_lmem ^ dst_is_lmem) || !HAS_FLAT_CCS(i915));
+
+	ccs_ring_size = calc_ctrl_surf_instr_size(i915, size);
+	WARN_ON(!ccs_ring_size);
+
+	cs = intel_ring_begin(rq, round_up(ccs_ring_size, 2));
+	if (IS_ERR(cs))
+		return PTR_ERR(cs);
+
+	num_ccs_blks = DIV_ROUND_UP(GET_CCS_BYTES(i915, size),
+				    NUM_CCS_BYTES_PER_BLOCK);
+
+	src_access = !src_is_lmem && dst_is_lmem;
+	dst_access = !src_access;
+
+	cs = i915_flush_dw(cs, MI_FLUSH_LLC | MI_FLUSH_CCS);
+	cs = _i915_ctrl_surf_copy_blt(cs, src_offset, dst_offset,
+				      src_access, dst_access,
+				      mocs, mocs, num_ccs_blks);
+	cs = i915_flush_dw(cs, MI_FLUSH_LLC | MI_FLUSH_CCS);
+	if (ccs_ring_size & 1)
+		*cs++ = MI_NOOP;
+
+	intel_ring_advance(rq, cs);
+
+	return 0;
+}
+
 static int emit_copy(struct i915_request *rq,
-		     u32 dst_offset, u32 src_offset, int size)
+		     bool dst_is_lmem, u32 dst_offset,
+		     bool src_is_lmem, u32 src_offset, int size)
 {
 	const int ver = GRAPHICS_VER(rq->engine->i915);
 	u32 instance = rq->engine->instance;
 	u32 *cs;
 
 	cs = intel_ring_begin(rq, ver >= 8 ? 10 : 6);
+
 	if (IS_ERR(cs))
 		return PTR_ERR(cs);
 
@@ -620,6 +657,18 @@ static int emit_copy(struct i915_request *rq,
 	return 0;
 }
 
+static int scatter_list_length(struct scatterlist *sg)
+{
+	int len = 0;
+
+	while (sg) {
+		len += sg_dma_len(sg);
+		sg = sg_next(sg);
+	};
+
+	return len;
+}
+
 int
 intel_context_migrate_copy(struct intel_context *ce,
 			   const struct i915_deps *deps,
@@ -632,7 +681,10 @@ intel_context_migrate_copy(struct intel_context *ce,
 			   struct i915_request **out)
 {
 	struct sgt_dma it_src = sg_sgt(src), it_dst = sg_sgt(dst);
+	struct drm_i915_private *i915 = ce->engine->i915;
+	u32 src_sz, dst_sz, ccs_bytes = 0, bytes_to_cpy;
 	struct i915_request *rq;
+	bool ccs_copy = false;
 	int err;
 
 	GEM_BUG_ON(ce->vm != ce->engine->gt->migrate.context->vm);
@@ -640,9 +692,28 @@ intel_context_migrate_copy(struct intel_context *ce,
 
 	GEM_BUG_ON(ce->ring->size < SZ_64K);
 
+	if (HAS_FLAT_CCS(i915) && src_is_lmem ^ dst_is_lmem) {
+		src_sz = scatter_list_length(src);
+		dst_sz = scatter_list_length(dst);
+
+		if (src_is_lmem)
+			bytes_to_cpy = src_sz;
+		else if (dst_is_lmem)
+			bytes_to_cpy = dst_sz;
+
+		/*
+		 * When there is a eviction of ccs needed smem will have the
+		 * extra pages for the ccs data
+		 *
+		 * TO-DO: Want to move the size mismatch check to a WARN_ON,
+		 * but still we have some requests of smem->lmem with same size.
+		 * Need to fix it.
+		 */
+		ccs_bytes = src_sz != dst_sz ? GET_CCS_BYTES(i915, bytes_to_cpy) : 0;
+	}
+
 	do {
-		u32 src_offset, dst_offset;
-		int len;
+		u32 src_offset, dst_offset, copy_sz;
 
 		rq = i915_request_create(ce);
 		if (IS_ERR(rq)) {
@@ -682,27 +753,82 @@ intel_context_migrate_copy(struct intel_context *ce,
 				dst_offset = 2 * CHUNK_SZ;
 		}
 
-		len = emit_pte(rq, &it_src, src_cache_level, src_is_lmem,
-			       src_offset, CHUNK_SZ);
-		if (len <= 0) {
-			err = len;
+		if (ccs_copy) {
+			/* Flat-CCS: CCS data copy */
+			if (!src_is_lmem) { /* src is smem */
+				/*
+				 * We can only copy the ccs data corresponding to
+				 * the CHUNK_SZ of lmem which is
+				 * GET_CCS_BYTES(i915, CHUNK_SZ))
+				 */
+				src_sz = min_t(int, bytes_to_cpy,
+					       GET_CCS_BYTES(i915, CHUNK_SZ));
+				dst_sz = CHUNK_SZ;
+			} else {
+				src_sz = CHUNK_SZ;
+				dst_sz = min_t(int, bytes_to_cpy,
+					       GET_CCS_BYTES(i915, CHUNK_SZ));
+			}
+		} else if (!ccs_copy && ccs_bytes) {
+			/* Flat-CCS: Main memory copy */
+			if (!src_is_lmem) {
+				src_sz = min_t(int, bytes_to_cpy, CHUNK_SZ);
+				dst_sz = CHUNK_SZ;
+			} else {
+				dst_sz = min_t(int, bytes_to_cpy, CHUNK_SZ);
+				src_sz = CHUNK_SZ;
+			}
+		} else { /* ccs handling is not required */
+			src_sz = CHUNK_SZ;
+		}
+
+		src_sz = emit_pte(rq, &it_src, src_cache_level, src_is_lmem,
+				  src_offset, src_sz);
+		if (src_sz <= 0) {
+			err = src_sz;
 			goto out_rq;
 		}
 
+		if (!ccs_bytes)
+			dst_sz = src_sz;
+
 		err = emit_pte(rq, &it_dst, dst_cache_level, dst_is_lmem,
-			       dst_offset, len);
+			       dst_offset, dst_sz);
 		if (err < 0)
 			goto out_rq;
-		if (err < len) {
+		if (err < dst_sz && !ccs_bytes) {
 			err = -EINVAL;
 			goto out_rq;
 		}
 
+		dst_sz = err;
+
 		err = rq->engine->emit_flush(rq, EMIT_INVALIDATE);
 		if (err)
 			goto out_rq;
 
-		err = emit_copy(rq, dst_offset, src_offset, len);
+		if (ccs_copy) {
+			/*
+			 * Using max of src_sz and dst_sz, as we need to
+			 * pass the lmem size corresponding to the ccs
+			 * blocks we need to handle.
+			 */
+			copy_sz = max_t(int, src_sz, dst_sz);
+			err = emit_ccs_copy(rq, dst_is_lmem, dst_offset,
+					    src_is_lmem, src_offset,
+					    copy_sz);
+
+			/* Converting back to ccs bytes */
+			copy_sz = GET_CCS_BYTES(i915, copy_sz);
+		} else {
+			WARN(src_sz != dst_sz, "%d != %d", src_sz, dst_sz);
+			copy_sz = src_sz;
+			err = emit_copy(rq, dst_is_lmem, dst_offset,
+					src_is_lmem, src_offset, copy_sz);
+		}
+
+		if (!err && ccs_bytes)
+			bytes_to_cpy -= copy_sz;
 
 		/* Arbitration is re-enabled between requests. */
 out_rq:
@@ -710,9 +836,33 @@ intel_context_migrate_copy(struct intel_context *ce,
 			i915_request_put(*out);
 		*out = i915_request_get(rq);
 		i915_request_add(rq);
-		if (err || !it_src.sg || !sg_dma_len(it_src.sg))
-			break;
 
+		if (err || !it_src.sg || !sg_dma_len(it_src.sg) ||
+		    !it_dst.sg || !sg_dma_len(it_src.sg)) {
+			if (err || !ccs_bytes)
+				break;
+
+			GEM_BUG_ON(bytes_to_cpy);
+			if (ccs_copy) {
+				break;
+			} else if (ccs_bytes) {
+				if (src_is_lmem) {
+					WARN_ON(it_src.sg && sg_dma_len(it_src.sg));
+					it_src = sg_sgt(src);
+				} else {
+					WARN_ON(it_dst.sg && sg_dma_len(it_dst.sg));
+					it_dst = sg_sgt(dst);
+				}
+				bytes_to_cpy = ccs_bytes;
+				ccs_copy = true;
+
+				continue;
+			} else {
+				DRM_ERROR("Invalid state\n");
+				err = -EINVAL;
+				break;
+			}
+		}
 		cond_resched();
 	} while (1);
 
-- 
2.20.1

