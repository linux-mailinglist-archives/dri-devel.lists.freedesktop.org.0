Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9506714C3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 08:16:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF1710E6BB;
	Wed, 18 Jan 2023 07:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE1010E6AF;
 Wed, 18 Jan 2023 07:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674026176; x=1705562176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EfBibRIUPYYOB+EZg7HNp+ggq5NKOLrOcywW4Lq63ME=;
 b=cown0MWjxc32ijxtDUKt7P5p7OpL66VL4G20Kvakb3f9aassZU9RFliP
 poYWQqvUYlpvW3HCybRZq6dzk3NU8WFZMgLF5swSG4D4TcnRsgJXJow3N
 M0y4oQjbBkWnbwsRw5Psf2st4I/n9H2ic8Gts18Rpy1X4UGJQuh6ZQ7ND
 2YKTPQgcHj4oa+1PPLbloOx2N+r2tnnNNlhCymlbEjt2vHV3er58C41dI
 KumWY60ua/lo1Vu4v+plmQeInmkzM1GDnG2V1lXwl9WnKbhlKpDRCPv5y
 q4+VP/dMesgThsuk9oNSSVLN/6En7rIEE1Z4JE07DAU+jQT+YHrZfsvRW g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="308482052"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="308482052"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 23:16:15 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="661609994"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="661609994"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 23:16:14 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v10 10/23] drm/i915/vm_bind: Add out fence support
Date: Tue, 17 Jan 2023 23:15:56 -0800
Message-Id: <20230118071609.17572-11-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230118071609.17572-1-niranjana.vishwanathapura@intel.com>
References: <20230118071609.17572-1-niranjana.vishwanathapura@intel.com>
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
 .../drm/i915/gem/i915_gem_vm_bind_object.c    | 98 ++++++++++++++++++-
 drivers/gpu/drm/i915/i915_vma.c               |  7 +-
 drivers/gpu/drm/i915/i915_vma_types.h         |  7 ++
 include/uapi/drm/i915_drm.h                   | 58 ++++++++++-
 5 files changed, 165 insertions(+), 9 deletions(-)

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
index dc738677466b..fd1d82ce99e6 100644
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
 
@@ -250,10 +335,12 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
 		if (ret)
 			continue;
 
-		/* Wait for bind to complete */
-		ret = i915_vma_wait_for_bind(vma);
-		if (ret)
-			continue;
+		/* If out fence is not requested, wait for bind to complete */
+		if (!(va->fence.flags & I915_TIMELINE_FENCE_SIGNAL)) {
+			ret = i915_vma_wait_for_bind(vma);
+			if (ret)
+				continue;
+		}
 
 		list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
 		i915_vm_bind_it_insert(vma, &vm->va);
@@ -265,6 +352,9 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
 		i915_gem_object_get(vma->obj);
 	}
 
+	if (va->fence.flags & I915_TIMELINE_FENCE_SIGNAL)
+		i915_vm_bind_put_fence(vma);
+put_vma:
 	if (ret)
 		i915_vma_destroy(vma);
 unlock_vm:
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index b44fd5f73b64..763ead20ad55 100644
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
@@ -1599,8 +1600,12 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
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
index 6b1cce537846..4c386473923a 100644
--- a/drivers/gpu/drm/i915/i915_vma_types.h
+++ b/drivers/gpu/drm/i915/i915_vma_types.h
@@ -309,6 +309,13 @@ struct i915_vma {
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
index 683da7099311..f35a9bb35ab3 100644
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
@@ -3785,7 +3820,8 @@ struct drm_i915_gem_create_ext_vm_private {
  * -ENOSPC will be returned if the VA range specified can't be reserved.
  *
  * VM_BIND/UNBIND ioctl calls executed on different CPU threads concurrently
- * are not ordered.
+ * are not ordered. Furthermore, parts of the VM_BIND operation can be done
+ * asynchronously, if valid @fence is specified.
  */
 struct drm_i915_gem_vm_bind {
 	/** @vm_id: VM (address space) id to bind */
@@ -3803,15 +3839,29 @@ struct drm_i915_gem_vm_bind {
 	/** @length: Length of mapping to bind */
 	__u64 length;
 
-	/** @flags: Currently reserved, MBZ. */
+	/**
+	 * @flags: Currently reserved, MBZ.
+	 *
+	 * Note that @fence carries its own flags.
+	 */
 	__u64 flags;
 #define __I915_GEM_VM_BIND_UNKNOWN_FLAGS (~0ull)
 
 	/** @rsvd: Reserved, MBZ */
 	__u64 rsvd[2];
 
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

