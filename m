Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 007E161EDA2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 09:54:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0322010E29E;
	Mon,  7 Nov 2022 08:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7EF910E25D;
 Mon,  7 Nov 2022 08:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667811146; x=1699347146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S47bD9T/8hR9Am2r7r/MtyjO4K2GTSbeFUMPBy0w+x4=;
 b=JZvNP+lVpu0hWaZ4JLATlh0ZtRa6oOKc+0MbZv2IxHziqgRvAuR1Z1MH
 T/dwzFrS9G6o/vPVOHrCkW5C0ZMW0ahEAkTO/XbYEm2nA/tpjn1vJ0b8M
 qc2Xneutvn56TQoC4y3ExdQ/FCiSm+ZjMrLOKx7B6eOw0ZgaKn13qS46D
 y54AynSHbaJwZRZMv2V40nNEerTL7S02LOqQ8ISzbVnIUUQHlk6DaSrYz
 qLDzX8UV22/LNcYY5nfPfFuMycuIuNsg9HEHqVoXtYSkuS/8ZNVzaEXjT
 HEKB403BjiDUmsb/iVmrZyUm7/OU0FKYeMOxYdTUqS3RC1X9TqWCm+pFn A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="312126173"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="312126173"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 00:52:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="880984634"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="880984634"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 00:52:25 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 09/20] drm/i915/vm_bind: Add out fence support
Date: Mon,  7 Nov 2022 00:51:59 -0800
Message-Id: <20221107085210.17221-10-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20221107085210.17221-1-niranjana.vishwanathapura@intel.com>
References: <20221107085210.17221-1-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, lionel.g.landwerlin@intel.com,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for handling out fence for vm_bind call.

v2: Reset vma->vm_bind_fence.syncobj to NULL at the end
    of vm_bind call.
v3: Remove vm_unbind out fence uapi which is not supported yet.
v4: Return error if I915_TIMELINE_FENCE_WAIT fence flag is set.
    Wait for bind to complete iff I915_TIMELINE_FENCE_SIGNAL is
    not specified.
v5: Ensure __I915_TIMELINE_FENCE_UNKNOWN_FLAGS are not set.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   |  4 +
 .../drm/i915/gem/i915_gem_vm_bind_object.c    | 95 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_vma.c               |  7 +-
 drivers/gpu/drm/i915/i915_vma_types.h         |  7 ++
 include/uapi/drm/i915_drm.h                   | 49 +++++++++-
 5 files changed, 159 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
index 36262a6357b5..b70e900e35ab 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
@@ -8,6 +8,7 @@
 
 #include <linux/types.h>
 
+struct dma_fence;
 struct drm_device;
 struct drm_file;
 struct i915_address_space;
@@ -23,4 +24,7 @@ int i915_gem_vm_unbind_ioctl(struct drm_device *dev, void *data,
 
 void i915_gem_vm_unbind_all(struct i915_address_space *vm);
 
+void i915_vm_bind_signal_fence(struct i915_vma *vma,
+			       struct dma_fence * const fence);
+
 #endif /* __I915_GEM_VM_BIND_H */
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
index 8cc78f954b97..6396fd1dc520 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
@@ -7,6 +7,8 @@
 
 #include <linux/interval_tree_generic.h>
 
+#include <drm/drm_syncobj.h>
+
 #include "gem/i915_gem_context.h"
 #include "gem/i915_gem_vm_bind.h"
 
@@ -101,6 +103,77 @@ static void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj)
 		i915_gem_object_put(vma->obj);
 }
 
+static int i915_vm_bind_add_fence(struct drm_file *file, struct i915_vma *vma,
+				  u32 handle, u64 point)
+{
+	struct drm_syncobj *syncobj;
+
+	syncobj = drm_syncobj_find(file, handle);
+	if (!syncobj) {
+		drm_dbg(&vma->vm->i915->drm,
+			"Invalid syncobj handle provided\n");
+		return -ENOENT;
+	}
+
+	/*
+	 * For timeline syncobjs we need to preallocate chains for
+	 * later signaling.
+	 */
+	if (point) {
+		vma->vm_bind_fence.chain_fence = dma_fence_chain_alloc();
+		if (!vma->vm_bind_fence.chain_fence) {
+			drm_syncobj_put(syncobj);
+			return -ENOMEM;
+		}
+	} else {
+		vma->vm_bind_fence.chain_fence = NULL;
+	}
+	vma->vm_bind_fence.syncobj = syncobj;
+	vma->vm_bind_fence.value = point;
+
+	return 0;
+}
+
+static void i915_vm_bind_put_fence(struct i915_vma *vma)
+{
+	if (!vma->vm_bind_fence.syncobj)
+		return;
+
+	drm_syncobj_put(vma->vm_bind_fence.syncobj);
+	dma_fence_chain_free(vma->vm_bind_fence.chain_fence);
+	vma->vm_bind_fence.syncobj = NULL;
+}
+
+/**
+ * i915_vm_bind_signal_fence() - Add fence to vm_bind syncobj
+ * @vma: vma mapping requiring signaling
+ * @fence: fence to be added
+ *
+ * Associate specified @fence with the @vma's syncobj to be
+ * signaled after the @fence work completes.
+ */
+void i915_vm_bind_signal_fence(struct i915_vma *vma,
+			       struct dma_fence * const fence)
+{
+	struct drm_syncobj *syncobj = vma->vm_bind_fence.syncobj;
+
+	if (!syncobj)
+		return;
+
+	if (vma->vm_bind_fence.chain_fence) {
+		drm_syncobj_add_point(syncobj,
+				      vma->vm_bind_fence.chain_fence,
+				      fence, vma->vm_bind_fence.value);
+		/*
+		 * The chain's ownership is transferred to the
+		 * timeline.
+		 */
+		vma->vm_bind_fence.chain_fence = NULL;
+	} else {
+		drm_syncobj_replace_fence(syncobj, fence);
+	}
+}
+
 static int i915_gem_vm_unbind_vma(struct i915_address_space *vm,
 				  struct drm_i915_gem_vm_unbind *va)
 {
@@ -206,6 +279,11 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
 	if (!va->length || !IS_ALIGNED(va->start, I915_GTT_PAGE_SIZE))
 		ret = -EINVAL;
 
+	/* In fences are not supported */
+	if ((va->fence.flags & I915_TIMELINE_FENCE_WAIT) ||
+	    (va->fence.flags & __I915_TIMELINE_FENCE_UNKNOWN_FLAGS))
+		ret = -EINVAL;
+
 	obj = i915_gem_object_lookup(file, va->handle);
 	if (!obj)
 		return -ENOENT;
@@ -238,6 +316,13 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
 		goto unlock_vm;
 	}
 
+	if (va->fence.flags & I915_TIMELINE_FENCE_SIGNAL) {
+		ret = i915_vm_bind_add_fence(file, vma, va->fence.handle,
+					     va->fence.value);
+		if (ret)
+			goto put_vma;
+	}
+
 	pin_flags = va->start | PIN_OFFSET_FIXED | PIN_USER |
 		    PIN_VALIDATE | PIN_NOEVICT;
 
@@ -250,6 +335,13 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
 		if (ret)
 			continue;
 
+		/* If out fence is not requested, wait for bind to complete */
+		if (!(va->fence.flags & I915_TIMELINE_FENCE_SIGNAL)) {
+			ret = i915_vma_wait_for_bind(vma);
+			if (ret)
+				continue;
+		}
+
 		list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
 		i915_vm_bind_it_insert(vma, &vm->va);
 		if (!obj->priv_root)
@@ -260,6 +352,9 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
 		i915_gem_object_get(vma->obj);
 	}
 
+	if (va->fence.flags & I915_TIMELINE_FENCE_SIGNAL)
+		i915_vm_bind_put_fence(vma);
+put_vma:
 	if (ret)
 		i915_vma_destroy(vma);
 unlock_vm:
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 04abdb92c2b2..eaa13e9ba966 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -29,6 +29,7 @@
 #include "display/intel_frontbuffer.h"
 #include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_tiling.h"
+#include "gem/i915_gem_vm_bind.h"
 #include "gt/intel_engine.h"
 #include "gt/intel_engine_heartbeat.h"
 #include "gt/intel_gt.h"
@@ -1567,8 +1568,12 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 err_vma_res:
 	i915_vma_resource_free(vma_res);
 err_fence:
-	if (work)
+	if (work) {
+		if (i915_vma_is_persistent(vma))
+			i915_vm_bind_signal_fence(vma, &work->base.dma);
+
 		dma_fence_work_commit_imm(&work->base);
+	}
 err_rpm:
 	if (wakeref)
 		intel_runtime_pm_put(&vma->vm->i915->runtime_pm, wakeref);
diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
index 61d0ec1a4e18..7c8c293ddfcb 100644
--- a/drivers/gpu/drm/i915/i915_vma_types.h
+++ b/drivers/gpu/drm/i915/i915_vma_types.h
@@ -308,6 +308,13 @@ struct i915_vma {
 	/** @vm_rebind_link: link to vm_rebind_list and protected by vm_rebind_lock */
 	struct list_head vm_rebind_link; /* Link in vm_rebind_list */
 
+	/** Timeline fence for vm_bind completion notification */
+	struct {
+		struct dma_fence_chain *chain_fence;
+		struct drm_syncobj *syncobj;
+		u64 value;
+	} vm_bind_fence;
+
 	/** Interval tree structures for persistent vma */
 
 	/** @rb: node for the interval tree of vm for persistent vmas */
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index d3d709035b0d..9ac913606d40 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -1533,6 +1533,41 @@ struct drm_i915_gem_execbuffer2 {
 #define i915_execbuffer2_get_context_id(eb2) \
 	((eb2).rsvd1 & I915_EXEC_CONTEXT_ID_MASK)
 
+/**
+ * struct drm_i915_gem_timeline_fence - An input or output timeline fence.
+ *
+ * The operation will wait for input fence to signal.
+ *
+ * The returned output fence will be signaled after the completion of the
+ * operation.
+ */
+struct drm_i915_gem_timeline_fence {
+	/** @handle: User's handle for a drm_syncobj to wait on or signal. */
+	__u32 handle;
+
+	/**
+	 * @flags: Supported flags are:
+	 *
+	 * I915_TIMELINE_FENCE_WAIT:
+	 * Wait for the input fence before the operation.
+	 *
+	 * I915_TIMELINE_FENCE_SIGNAL:
+	 * Return operation completion fence as output.
+	 */
+	__u32 flags;
+#define I915_TIMELINE_FENCE_WAIT            (1 << 0)
+#define I915_TIMELINE_FENCE_SIGNAL          (1 << 1)
+#define __I915_TIMELINE_FENCE_UNKNOWN_FLAGS (-(I915_TIMELINE_FENCE_SIGNAL << 1))
+
+	/**
+	 * @value: A point in the timeline.
+	 * Value must be 0 for a binary drm_syncobj. A Value of 0 for a
+	 * timeline drm_syncobj is invalid as it turns a drm_syncobj into a
+	 * binary one.
+	 */
+	__u64 value;
+};
+
 struct drm_i915_gem_pin {
 	/** Handle of the buffer to be pinned. */
 	__u32 handle;
@@ -3807,8 +3842,18 @@ struct drm_i915_gem_vm_bind {
 	/** @rsvd: Reserved, MBZ */
 	__u64 rsvd[3];
 
-	/** @rsvd2: Reserved for timeline fence */
-	__u64 rsvd2[2];
+	/**
+	 * @fence: Timeline fence for bind completion signaling.
+	 *
+	 * Timeline fence is of format struct drm_i915_gem_timeline_fence.
+	 *
+	 * It is an out fence, hence using I915_TIMELINE_FENCE_WAIT flag
+	 * is invalid, and an error will be returned.
+	 *
+	 * If I915_TIMELINE_FENCE_SIGNAL flag is not set, then out fence
+	 * is not requested and binding is completed synchronously.
+	 */
+	struct drm_i915_gem_timeline_fence fence;
 
 	/**
 	 * @extensions: Zero-terminated chain of extensions.
-- 
2.21.0.rc0.32.g243a4c7e27

