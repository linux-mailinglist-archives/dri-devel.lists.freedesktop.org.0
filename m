Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A49B9D1BED
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 00:37:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03D910E58E;
	Mon, 18 Nov 2024 23:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dXPwISic";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3CD210E190;
 Mon, 18 Nov 2024 23:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731973045; x=1763509045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Lyjhcqd14IudQ/k5R2F8mmgWywuiWlj1+zwobOgdLs=;
 b=dXPwISicNXXwNetCxtPovmkF9y9JBWGDJKXrqbmZfOogpo5vwpwSaqOH
 4IXACjTHW0/FBM+C1xfN7f55UYHgfbpthXmuQXnGWxk5Kns9Z3OP7KLzG
 rW+kHXVlSCVSib0cscJ6qhiRqljYaosAM4WkmIpmo0oBO/usuvmnGWjXA
 b2LT/xJcq0/h/nYgh2PWYq/49s+F+DejFEnxi8wDAmupMUo4bsxISNOtM
 nlvY+GfIcEwrFaMdiQqAKEsZ2XGMnmXDyr1qCl7t8cqZ8jsA19PW4D5kj
 1y/9Z7cdq09JgdwqQoK2M8NfFvwwB4+fr9ea2wATll0oI8jwAXYGcaBx+ A==;
X-CSE-ConnectionGUID: yGd0FRflSf6U2iEFCZXcdw==
X-CSE-MsgGUID: b2Jbe5bjTzm0nlL9A2Zssw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31878884"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31878884"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:24 -0800
X-CSE-ConnectionGUID: 4O5S4E3eTTWvAAVaoy3WFA==
X-CSE-MsgGUID: OFMKX57MRl6PoeO0mR4z+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89521689"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:24 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, christian.koenig@amd.com, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 06/29] drm/xe: Break submission ring out into its own BO
Date: Mon, 18 Nov 2024 15:37:34 -0800
Message-Id: <20241118233757.2374041-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118233757.2374041-1-matthew.brost@intel.com>
References: <20241118233757.2374041-1-matthew.brost@intel.com>
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

Start laying the ground work for UMD submission. This will allow mmaping
the submission ring to user space.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c       | 38 +++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_lrc_types.h |  9 ++++++--
 2 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 22e58c6e2a35..758648b6a711 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -632,7 +632,7 @@ static inline u32 __xe_lrc_ring_offset(struct xe_lrc *lrc)
 
 u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
 {
-	return lrc->ring.size;
+	return 0;
 }
 
 /* Make the magic macros work */
@@ -712,7 +712,21 @@ static inline u32 __maybe_unused __xe_lrc_##elem##_ggtt_addr(struct xe_lrc *lrc)
 	return xe_bo_ggtt_addr(lrc->bo) + __xe_lrc_##elem##_offset(lrc); \
 } \
 
-DECL_MAP_ADDR_HELPERS(ring)
+#define DECL_MAP_RING_ADDR_HELPERS(elem) \
+static inline struct iosys_map __xe_lrc_##elem##_map(struct xe_lrc *lrc) \
+{ \
+	struct iosys_map map = lrc->submission_ring->vmap; \
+\
+	xe_assert(lrc_to_xe(lrc), !iosys_map_is_null(&map));  \
+	iosys_map_incr(&map, __xe_lrc_##elem##_offset(lrc)); \
+	return map; \
+} \
+static inline u32 __maybe_unused __xe_lrc_##elem##_ggtt_addr(struct xe_lrc *lrc) \
+{ \
+	return xe_bo_ggtt_addr(lrc->submission_ring) + __xe_lrc_##elem##_offset(lrc); \
+} \
+
+DECL_MAP_RING_ADDR_HELPERS(ring)
 DECL_MAP_ADDR_HELPERS(pphwsp)
 DECL_MAP_ADDR_HELPERS(seqno)
 DECL_MAP_ADDR_HELPERS(regs)
@@ -722,6 +736,7 @@ DECL_MAP_ADDR_HELPERS(ctx_timestamp)
 DECL_MAP_ADDR_HELPERS(parallel)
 DECL_MAP_ADDR_HELPERS(indirect_ring)
 
+#undef DECL_RING_MAP_ADDR_HELPERS
 #undef DECL_MAP_ADDR_HELPERS
 
 /**
@@ -866,10 +881,8 @@ static void xe_lrc_set_ppgtt(struct xe_lrc *lrc, struct xe_vm *vm)
 static void xe_lrc_finish(struct xe_lrc *lrc)
 {
 	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
-	xe_bo_lock(lrc->bo, false);
-	xe_bo_unpin(lrc->bo);
-	xe_bo_unlock(lrc->bo);
-	xe_bo_put(lrc->bo);
+	xe_bo_unpin_map_no_vm(lrc->bo);
+	xe_bo_unpin_map_no_vm(lrc->submission_ring);
 }
 
 #define PVC_CTX_ASID		(0x2e + 1)
@@ -889,7 +902,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 
 	kref_init(&lrc->refcount);
 	lrc->flags = 0;
-	lrc_size = ring_size + xe_gt_lrc_size(gt, hwe->class);
+	lrc_size = xe_gt_lrc_size(gt, hwe->class);
 	if (xe_gt_has_indirect_ring_state(gt))
 		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
 
@@ -905,6 +918,17 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	if (IS_ERR(lrc->bo))
 		return PTR_ERR(lrc->bo);
 
+	lrc->submission_ring = xe_bo_create_pin_map(xe, tile, vm, ring_size,
+						    ttm_bo_type_kernel,
+						    XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+						    XE_BO_FLAG_GGTT |
+						    XE_BO_FLAG_GGTT_INVALIDATE);
+	if (IS_ERR(lrc->submission_ring)) {
+		err = PTR_ERR(lrc->submission_ring);
+		lrc->submission_ring = NULL;
+		goto err_lrc_finish;
+	}
+
 	lrc->size = lrc_size;
 	lrc->tile = gt_to_tile(hwe->gt);
 	lrc->ring.size = ring_size;
diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
index 71ecb453f811..3ad9ac2d644f 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -17,11 +17,16 @@ struct xe_bo;
  */
 struct xe_lrc {
 	/**
-	 * @bo: buffer object (memory) for logical ring context, per process HW
-	 * status page, and submission ring.
+	 * @bo: buffer object (memory) for logical ring context and per process
+	 * HW status page.
 	 */
 	struct xe_bo *bo;
 
+	/**
+	 * @submission_ring: buffer object (memory) for submission_ring
+	 */
+	struct xe_bo *submission_ring;
+
 	/** @size: size of lrc including any indirect ring state page */
 	u32 size;
 
-- 
2.34.1

