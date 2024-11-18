Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9D69D1BF9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 00:37:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6A110E5BA;
	Mon, 18 Nov 2024 23:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TXPX2W67";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D0889F4F;
 Mon, 18 Nov 2024 23:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731973051; x=1763509051;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0osXRmnKpiY3+lFHIipsNkgn0vpsvm78bLb55LfZ/Ws=;
 b=TXPX2W67rNSqpNY+C4R0VFEE+bCWAtrgngd2EE6TZueXowa5uTklMYjb
 IMAi9JOgcmwZO6tI6+B/MV2ynK0nDrPGNabKWERjGt0MrQ0LxSDwNoX7N
 HHh3sadLZWw3GZgja2H6Y9NAZcCkhPidZqeBCWEGITp/V6DyvlzXKGSfx
 okGMNX6jucjRuV8PE/BQmzyaGNSVWhthgxAcOfMsXbnEdcADBCVZr6q7F
 5ewIUbvFHrElUHmwyk1vExe6V3PomYU4NmODfYEC5cBSQKSyaVnr7Da10
 o61DQ+eCicwvWAOXpPzMAPpHYtS91JJN5ypVURatk1qcxJ0/tLQpgT2K1 Q==;
X-CSE-ConnectionGUID: 9eK1QwB4TLShL1Qp/ozEPg==
X-CSE-MsgGUID: 55ANa1bgT4uIvWeddDO1TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31879026"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31879026"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:31 -0800
X-CSE-ConnectionGUID: Tom5VpZIQDG9eqGJ34LnpA==
X-CSE-MsgGUID: RkdrvsVOQm2ILJQRG5eHsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89521775"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:31 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, christian.koenig@amd.com, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 27/29] drm/xe: Teach xe_sync layer about drm_xe_semaphore
Date: Mon, 18 Nov 2024 15:37:55 -0800
Message-Id: <20241118233757.2374041-28-matthew.brost@intel.com>
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

Teach xe_sync layer about drm_xe_semaphore which is used import / export
user fences.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c       | 90 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sync.h       |  8 +++
 drivers/gpu/drm/xe/xe_sync_types.h |  5 +-
 3 files changed, 102 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 42f5bebd09e5..ac4510ad52a9 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -6,6 +6,7 @@
 #include "xe_sync.h"
 
 #include <linux/dma-fence-array.h>
+#include <linux/dma-fence-user-fence.h>
 #include <linux/kthread.h>
 #include <linux/sched/mm.h>
 #include <linux/uaccess.h>
@@ -14,11 +15,15 @@
 #include <drm/drm_syncobj.h>
 #include <uapi/drm/xe_drm.h>
 
+#include "xe_bo.h"
 #include "xe_device_types.h"
 #include "xe_exec_queue.h"
+#include "xe_hw_fence.h"
 #include "xe_macros.h"
 #include "xe_sched_job_types.h"
 
+#define IS_UNINSTALLED_HW_FENCE		BIT(31)
+
 struct xe_user_fence {
 	struct xe_device *xe;
 	struct kref refcount;
@@ -211,6 +216,74 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 	return 0;
 }
 
+int xe_sync_semaphore_parse(struct xe_device *xe, struct xe_file *xef,
+			    struct xe_sync_entry *sync,
+			    struct drm_xe_semaphore __user *semaphore_user,
+			    unsigned int flags)
+{
+	struct drm_xe_semaphore semaphore_in;
+	struct drm_gem_object *gem_obj;
+	struct xe_bo *bo;
+
+	if (copy_from_user(&semaphore_in, semaphore_user,
+			   sizeof(*semaphore_user)))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(xe, semaphore_in.offset & 0x7 ||
+			 !semaphore_in.handle || semaphore_in.token ||
+			 semaphore_in.reserved[0] || semaphore_in.reserved[1]))
+		return -EINVAL;
+
+	gem_obj = drm_gem_object_lookup(xef->drm, semaphore_in.handle);
+	if (XE_IOCTL_DBG(xe, !gem_obj))
+		return -ENOENT;
+
+	bo = gem_to_xe_bo(gem_obj);
+
+	if (XE_IOCTL_DBG(xe, bo->size < semaphore_in.offset)) {
+		xe_bo_put(bo);
+		return -EINVAL;
+	}
+
+	if (flags & DRM_XE_SYNC_FLAG_SIGNAL) {
+		struct iosys_map vmap = sync->bo->vmap;
+		struct dma_fence *fence;
+
+		sync->chain_fence = dma_fence_chain_alloc();
+		if (!sync->chain_fence) {
+			xe_bo_put(bo);
+			dma_fence_chain_free(sync->chain_fence);
+			return -ENOMEM;
+		}
+
+		fence = xe_hw_fence_alloc();
+		if (IS_ERR(fence)) {
+			xe_bo_put(bo);
+			return PTR_ERR(fence);
+		}
+
+		vmap = bo->vmap;
+		iosys_map_incr(&vmap, semaphore_in.offset);
+
+		xe_hw_fence_user_init(fence, xe, vmap, semaphore_in.seqno);
+		sync->fence = fence;
+		sync->flags = IS_UNINSTALLED_HW_FENCE;
+	} else {
+		sync->user_fence = dma_fence_user_fence_alloc();
+		if (XE_IOCTL_DBG(xe, !sync->user_fence)) {
+			xe_bo_put(bo);
+			return PTR_ERR(sync->ufence);
+		}
+
+		sync->addr = semaphore_in.offset;
+		sync->timeline_value = semaphore_in.seqno;
+		sync->flags = DRM_XE_SYNC_FLAG_SIGNAL;
+	}
+	sync->bo = bo;
+
+	return 0;
+}
+
 int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct xe_sched_job *job)
 {
 	if (sync->fence)
@@ -249,17 +322,34 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)
 			user_fence_put(sync->ufence);
 			dma_fence_put(fence);
 		}
+	} else if (sync->user_fence) {
+		struct iosys_map vmap = sync->bo->vmap;
+
+		iosys_map_incr(&vmap, sync->addr);
+		dma_fence_user_fence_attach(fence, sync->user_fence,
+					    &vmap, sync->timeline_value);
+		sync->user_fence = NULL;
 	}
 }
 
+void xe_sync_entry_hw_fence_installed(struct xe_sync_entry *sync)
+{
+	sync->flags &= ~IS_UNINSTALLED_HW_FENCE;
+}
+
 void xe_sync_entry_cleanup(struct xe_sync_entry *sync)
 {
 	if (sync->syncobj)
 		drm_syncobj_put(sync->syncobj);
+	xe_bo_put(sync->bo);
+	if (sync->flags & IS_UNINSTALLED_HW_FENCE)
+		dma_fence_set_error(sync->fence, -ECANCELED);
 	dma_fence_put(sync->fence);
 	dma_fence_chain_free(sync->chain_fence);
 	if (sync->ufence)
 		user_fence_put(sync->ufence);
+	if (sync->user_fence)
+		dma_fence_user_fence_free(sync->user_fence);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
index 256ffc1e54dc..fd56929e37cc 100644
--- a/drivers/gpu/drm/xe/xe_sync.h
+++ b/drivers/gpu/drm/xe/xe_sync.h
@@ -8,6 +8,9 @@
 
 #include "xe_sync_types.h"
 
+struct drm_xe_semaphore;
+struct drm_xe_sync;
+
 struct xe_device;
 struct xe_exec_queue;
 struct xe_file;
@@ -22,10 +25,15 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 			struct xe_sync_entry *sync,
 			struct drm_xe_sync __user *sync_user,
 			unsigned int flags);
+int xe_sync_semaphore_parse(struct xe_device *xe, struct xe_file *xef,
+			    struct xe_sync_entry *sync,
+			    struct drm_xe_semaphore __user *semaphore_user,
+			    unsigned int flags);
 int xe_sync_entry_add_deps(struct xe_sync_entry *sync,
 			   struct xe_sched_job *job);
 void xe_sync_entry_signal(struct xe_sync_entry *sync,
 			  struct dma_fence *fence);
+void xe_sync_entry_hw_fence_installed(struct xe_sync_entry *sync);
 void xe_sync_entry_cleanup(struct xe_sync_entry *sync);
 struct dma_fence *
 xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
diff --git a/drivers/gpu/drm/xe/xe_sync_types.h b/drivers/gpu/drm/xe/xe_sync_types.h
index 30ac3f51993b..28e846c29122 100644
--- a/drivers/gpu/drm/xe/xe_sync_types.h
+++ b/drivers/gpu/drm/xe/xe_sync_types.h
@@ -11,14 +11,17 @@
 struct drm_syncobj;
 struct dma_fence;
 struct dma_fence_chain;
-struct drm_xe_sync;
+struct dma_fence_user_fence;
 struct user_fence;
+struct xe_bo;
 
 struct xe_sync_entry {
 	struct drm_syncobj *syncobj;
 	struct dma_fence *fence;
 	struct dma_fence_chain *chain_fence;
 	struct xe_user_fence *ufence;
+	struct dma_fence_user_fence *user_fence;
+	struct xe_bo *bo;
 	u64 addr;
 	u64 timeline_value;
 	u32 type;
-- 
2.34.1

