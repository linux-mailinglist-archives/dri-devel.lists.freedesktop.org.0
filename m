Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB929D1BE8
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 00:37:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC7B10E584;
	Mon, 18 Nov 2024 23:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W3VOVwfJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE2A10E57A;
 Mon, 18 Nov 2024 23:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731973048; x=1763509048;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gNdp0QyGV4i1yaEhzaz39MS69VT1BTl28gqiah5Po/o=;
 b=W3VOVwfJBN6J76Y/Nyd5x8/epHY+Ona0XQMNYzzOpxdVWaSovTZSTcnE
 AQ/UxwgqXQj1fn/ueMB+PCpvWWmFGJMYbIzCqO/oeqy/9+a4VlHvicDZH
 H1rilTYZO9Mv+3Ov3scNd+qPdn1mdcyJt/HSYSo4ZPSlchqpQ0NLmr6rv
 2jtQ/vwXyJpItWrwcuZ0gE+p//ShzyTwUfLZ4cx60X8QwxZYcjmr9nkZ9
 Fb2nmboQQZV8wJgezTKUGQwrxJVWAa8mAVWjYSeTiK5Q0n35laR6JA7z4
 1Cd30hzMsiBYlhctG9sUY21GqUnz07ivR1FcPdXOn2T4QmyDGDVmCn1um A==;
X-CSE-ConnectionGUID: JEF8QO7sQzGrRW2K2XGV3g==
X-CSE-MsgGUID: ztXMgF0rR3SrV2KGSd/82g==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31878956"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31878956"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:28 -0800
X-CSE-ConnectionGUID: QNIgtjt/THizqv1WLVDANA==
X-CSE-MsgGUID: r2gxfw5ZQDOKgSot8h/NWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89521731"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:28 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, christian.koenig@amd.com, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 17/29] drm/xe: Add usermap exec queue extension
Date: Mon, 18 Nov 2024 15:37:45 -0800
Message-Id: <20241118233757.2374041-18-matthew.brost@intel.com>
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

Implement uAPI which maps submit rings, indirect LRC state, and
doorbells to user space. This is required for UMD direction submission.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 125 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  13 +++
 drivers/gpu/drm/xe/xe_execlist.c         |   2 +-
 drivers/gpu/drm/xe/xe_lrc.c              |  59 +++++++----
 drivers/gpu/drm/xe/xe_lrc.h              |   2 +-
 5 files changed, 176 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index aef5b130e7f8..c8d45133eb59 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -11,6 +11,7 @@
 #include <drm/drm_file.h>
 #include <uapi/drm/xe_drm.h>
 
+#include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_hw_engine_class_sysfs.h"
@@ -38,12 +39,18 @@ static int exec_queue_user_extensions_post_init(struct xe_device *xe, struct xe_
 
 static void __xe_exec_queue_free(struct xe_exec_queue *q)
 {
+	struct xe_device *xe = q->vm ? q->vm->xe : NULL;
+
 	if (q->vm)
 		xe_vm_put(q->vm);
 
 	if (q->xef)
 		xe_file_put(q->xef);
 
+	if (q->usermap)
+		xe_pm_runtime_put(xe);
+
+	kfree(q->usermap);
 	kfree(q);
 }
 
@@ -110,6 +117,8 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 static int __xe_exec_queue_init(struct xe_exec_queue *q)
 {
 	struct xe_vm *vm = q->vm;
+	u64 ring_addr = q->usermap ? q->usermap->ring_addr : 0;
+	u32 ring_size = q->usermap ? q->usermap->ring_size : SZ_16K;
 	int i, err;
 
 	if (vm) {
@@ -119,7 +128,8 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 	}
 
 	for (i = 0; i < q->width; ++i) {
-		q->lrc[i] = xe_lrc_create(q, q->hwe, q->vm, SZ_16K);
+		q->lrc[i] = xe_lrc_create(q, q->hwe, q->vm, ring_size,
+					  ring_addr);
 		if (IS_ERR(q->lrc[i])) {
 			err = PTR_ERR(q->lrc[i]);
 			goto err_unlock;
@@ -444,12 +454,125 @@ typedef int (*xe_exec_queue_user_extension_fn)(struct xe_device *xe,
 					       struct xe_exec_queue *q,
 					       u64 extension);
 
+static int exec_queue_user_ext_usermap(struct xe_device *xe,
+				       struct xe_exec_queue *q,
+				       u64 extension)
+{
+	u64 __user *address = u64_to_user_ptr(extension);
+	struct drm_xe_exec_queue_ext_usermap ext;
+	int err;
+
+	/* Just parse args and make sure they are sane */
+
+	if (XE_IOCTL_DBG(xe, !xe_gt_has_indirect_ring_state(q->gt)))
+		return -EOPNOTSUPP;
+
+	if (XE_IOCTL_DBG(xe, q->width != 1))
+		return -EOPNOTSUPP;
+
+	if (XE_IOCTL_DBG(xe, q->flags & (EXEC_QUEUE_FLAG_KERNEL |
+					 EXEC_QUEUE_FLAG_PERMANENT |
+					 EXEC_QUEUE_FLAG_VM |
+					 EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD)))
+		return -EOPNOTSUPP;
+
+	if (XE_IOCTL_DBG(xe, q->width != 1))
+		return -EOPNOTSUPP;
+
+	/*
+	 * XXX: More or less free to support this but targeting Mesa for now as
+	 * LR mode has ULLS.
+	 */
+	if (XE_IOCTL_DBG(xe, xe_vm_in_lr_mode(q->vm)))
+		return -EOPNOTSUPP;
+
+	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_UMD_SUBMISSION))
+		return -EINVAL;
+
+	err = __copy_from_user(&ext, address, sizeof(ext));
+	if (XE_IOCTL_DBG(xe, err))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(xe, ext.reserved[0] || ext.reserved[1]))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, ext.pad))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, ext.flags))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, ext.ring_size < SZ_4K ||
+			 ext.ring_size > SZ_2M ||
+			 ext.ring_size & ~PAGE_MASK))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, ext.version !=
+			 DRM_XE_EXEC_QUEUE_USERMAP_VERSION_XE2_REV0))
+		return -EINVAL;
+
+	q->usermap = kzalloc(sizeof(struct xe_exec_queue_usermap), GFP_KERNEL);
+	if (!q->usermap)
+		return -ENOMEM;
+
+	q->usermap->ring_size = ext.ring_size;
+	q->usermap->ring_addr = ext.ring_addr;
+
+	xe_pm_runtime_get_noresume(xe);
+	q->flags |= EXEC_QUEUE_FLAG_UMD_SUBMISSION;
+
+	return 0;
+}
+
+static int exec_queue_user_ext_post_init_usermap(struct xe_device *xe,
+						 struct xe_exec_queue *q,
+						 u64 extension)
+{
+	struct drm_xe_exec_queue_ext_usermap ext;
+	struct xe_lrc *lrc = q->lrc[0];
+	u64 __user *address = u64_to_user_ptr(extension);
+	u32 indirect_ring_state_handle;
+	int err;
+
+	err = __copy_from_user(&ext, address, sizeof(ext));
+	if (XE_IOCTL_DBG(xe, err))
+		return -EFAULT;
+
+	err = drm_gem_handle_create(q->xef->drm,
+				    &lrc->indirect_state->ttm.base,
+				    &indirect_ring_state_handle);
+	if (err)
+		return err;
+
+	ext.indirect_ring_state_offset =
+		drm_vma_node_offset_addr(&lrc->indirect_state->ttm.base.vma_node);
+	ext.indirect_ring_state_handle = indirect_ring_state_handle;
+	ext.doorbell_offset = XE_MMIO_DOORBELL_MMAP_OFFSET +
+		SZ_4K * q->guc->db.id;
+	ext.doorbell_page_offset = 0;
+
+	err = copy_to_user(address, &ext, sizeof(ext));
+	if (XE_IOCTL_DBG(xe, err)) {
+		err = -EFAULT;
+		goto close_handles;
+	}
+
+	return 0;
+
+close_handles:
+	drm_gem_handle_delete(q->xef->drm, indirect_ring_state_handle);
+
+	return err;
+}
+
 static const xe_exec_queue_user_extension_fn exec_queue_user_extension_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY] = exec_queue_user_ext_set_property,
+	[DRM_XE_EXEC_QUEUE_EXTENSION_USERMAP] = exec_queue_user_ext_usermap,
 };
 
 static const xe_exec_queue_user_extension_fn exec_queue_user_extension_post_init_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY] = NULL,
+	[DRM_XE_EXEC_QUEUE_EXTENSION_USERMAP] = exec_queue_user_ext_post_init_usermap,
 };
 
 #define MAX_USER_EXTENSIONS	16
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 7f68587d4021..b30b5ee910fa 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -31,6 +31,16 @@ enum xe_exec_queue_priority {
 	XE_EXEC_QUEUE_PRIORITY_COUNT
 };
 
+/**
+ * struct xe_exec_queue_usermap - Execution queue usermap (UMD submission)
+ */
+struct xe_exec_queue_usermap {
+	/** @ring_addr: ring address (PPGTT) */
+	u64 ring_addr;
+	/** @ring_size: ring size */
+	u32 ring_size;
+};
+
 /**
  * struct xe_exec_queue - Execution queue
  *
@@ -130,6 +140,9 @@ struct xe_exec_queue {
 		struct list_head link;
 	} lr;
 
+	/** @usermap: user map interface */
+	struct xe_exec_queue_usermap *usermap;
+
 	/** @ops: submission backend exec queue operations */
 	const struct xe_exec_queue_ops *ops;
 
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 93f76280d453..803c84b2e4ed 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -265,7 +265,7 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
 
 	port->hwe = hwe;
 
-	port->lrc = xe_lrc_create(NULL, hwe, NULL, SZ_16K);
+	port->lrc = xe_lrc_create(NULL, hwe, NULL, SZ_16K, 0);
 	if (IS_ERR(port->lrc)) {
 		err = PTR_ERR(port->lrc);
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 8a79470b52ae..8d5a65724c04 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -903,7 +903,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
 
 static int xe_lrc_init(struct xe_lrc *lrc, struct xe_exec_queue *q,
 		       struct xe_hw_engine *hwe, struct xe_vm *vm,
-		       u32 ring_size)
+		       u32 ring_size, u64 ring_addr)
 {
 	struct xe_gt *gt = hwe->gt;
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -919,6 +919,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_exec_queue *q,
 		XE_BO_FLAG_USER : 0;
 	int err;
 
+	xe_assert(xe, (!user_queue && !ring_addr) || (user_queue && ring_addr));
+
 	kref_init(&lrc->refcount);
 	lrc->flags = 0;
 	lrc_size = xe_gt_lrc_size(gt, hwe->class);
@@ -935,16 +937,18 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_exec_queue *q,
 	if (IS_ERR(lrc->bo))
 		return PTR_ERR(lrc->bo);
 
-	lrc->submission_ring = xe_bo_create_pin_map(xe, tile, vm, SZ_32K,
-						    submit_type,
-						    submit_flags |
-						    XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-						    XE_BO_FLAG_GGTT |
-						    XE_BO_FLAG_GGTT_INVALIDATE);
-	if (IS_ERR(lrc->submission_ring)) {
-		err = PTR_ERR(lrc->submission_ring);
-		lrc->submission_ring = NULL;
-		goto err_lrc_finish;
+	if (!user_queue) {
+		lrc->submission_ring = xe_bo_create_pin_map(xe, tile, vm, SZ_32K,
+							    submit_type,
+							    submit_flags |
+							    XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+							    XE_BO_FLAG_GGTT |
+							    XE_BO_FLAG_GGTT_INVALIDATE);
+		if (IS_ERR(lrc->submission_ring)) {
+			err = PTR_ERR(lrc->submission_ring);
+			lrc->submission_ring = NULL;
+			goto err_lrc_finish;
+		}
 	}
 
 	if (xe_gt_has_indirect_ring_state(gt)) {
@@ -1018,12 +1022,19 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_exec_queue *q,
 	}
 
 	if (xe_gt_has_indirect_ring_state(gt)) {
-		xe_lrc_write_ctx_reg(lrc, CTX_INDIRECT_RING_STATE,
-				     __xe_lrc_indirect_ring_ggtt_addr(lrc));
-
-		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_START,
-					      __xe_lrc_ring_ggtt_addr(lrc));
-		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_START_UDW, 0);
+		if (ring_addr) {	/* PPGTT */
+			xe_lrc_write_ctx_reg(lrc, CTX_INDIRECT_RING_STATE,
+					     __xe_lrc_indirect_ring_ggtt_addr(lrc) | BIT(0));
+			xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_START,
+						      ring_addr);
+		} else {
+			xe_lrc_write_ctx_reg(lrc, CTX_INDIRECT_RING_STATE,
+					     __xe_lrc_indirect_ring_ggtt_addr(lrc));
+			xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_START,
+						      __xe_lrc_ring_ggtt_addr(lrc));
+		}
+		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_START_UDW,
+					      ring_addr >> 32);
 		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_HEAD, 0);
 		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_TAIL, lrc->ring.tail);
 		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_CTL,
@@ -1056,8 +1067,10 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_exec_queue *q,
 		lrc->desc |= FIELD_PREP(LRC_ENGINE_CLASS, hwe->class);
 	}
 
-	arb_enable = MI_ARB_ON_OFF | MI_ARB_ENABLE;
-	xe_lrc_write_ring(lrc, &arb_enable, sizeof(arb_enable));
+	if (lrc->submission_ring) {
+		arb_enable = MI_ARB_ON_OFF | MI_ARB_ENABLE;
+		xe_lrc_write_ring(lrc, &arb_enable, sizeof(arb_enable));
+	}
 
 	map = __xe_lrc_seqno_map(lrc);
 	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
@@ -1078,6 +1091,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_exec_queue *q,
  * @hwe: Hardware Engine
  * @vm: The VM (address space)
  * @ring_size: LRC ring size
+ * @ring_addr: LRC ring address, only valid for usermap queues
  *
  * Allocate and initialize the Logical Ring Context (LRC).
  *
@@ -1085,7 +1099,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_exec_queue *q,
  * upon failure.
  */
 struct xe_lrc *xe_lrc_create(struct xe_exec_queue *q, struct xe_hw_engine *hwe,
-			     struct xe_vm *vm, u32 ring_size)
+			     struct xe_vm *vm, u32 ring_size, u64 ring_addr)
 {
 	struct xe_lrc *lrc;
 	int err;
@@ -1094,7 +1108,7 @@ struct xe_lrc *xe_lrc_create(struct xe_exec_queue *q, struct xe_hw_engine *hwe,
 	if (!lrc)
 		return ERR_PTR(-ENOMEM);
 
-	err = xe_lrc_init(lrc, q, hwe, vm, ring_size);
+	err = xe_lrc_init(lrc, q, hwe, vm, ring_size, ring_addr);
 	if (err) {
 		kfree(lrc);
 		return ERR_PTR(err);
@@ -1717,7 +1731,8 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 		xe_vm_get(lrc->bo->vm);
 
 	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
-	snapshot->ring_addr = __xe_lrc_ring_ggtt_addr(lrc);
+	snapshot->ring_addr = lrc->submission_ring ?
+		__xe_lrc_ring_ggtt_addr(lrc) : 0;
 	snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
 	snapshot->head = xe_lrc_ring_head(lrc);
 	snapshot->tail.internal = lrc->ring.tail;
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 23d71283c79d..a7facfa8bf51 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -42,7 +42,7 @@ struct xe_lrc_snapshot {
 #define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
 
 struct xe_lrc *xe_lrc_create(struct xe_exec_queue *q, struct xe_hw_engine *hwe,
-			     struct xe_vm *vm, u32 ring_size);
+			     struct xe_vm *vm, u32 ring_size, u64 ring_addr);
 void xe_lrc_destroy(struct kref *ref);
 
 /**
-- 
2.34.1

