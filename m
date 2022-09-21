Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AD45BF728
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 09:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E40010E86B;
	Wed, 21 Sep 2022 07:10:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F223910E862;
 Wed, 21 Sep 2022 07:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663744213; x=1695280213;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tb0q0Pmhn3IImMt+LiIui6eBOupn/dp0a0VO/xdREoA=;
 b=RaTG90GwQ9GXDN/QDcYbsdigAgUi/mzDdDiShiu9PqwhZMnRbePJ5WP1
 XpqpESfK0ZfqXb0JP0M255E1ET2MkPtdQW0zoVmbLnLSQFbk6YoiJHoVh
 IQwn+aP7YJh6aC8t7XXgyOE3aDMEWufM0sJwERrpOdk7AynWGrZcTTs0J
 Fa6gtP3ApHv3isFeCLTQrBKynqfENbkX4/CDsGHpBVo0tSkzmiatsF7YJ
 YlVNHqJXdz4Qv28WZPg9wli13M2owtYDMjCPbB93xJ9ZrC03D3VoPr41k
 muN55Zexi5W5ziWwvG/9MsDzjp5RQ49+wr5GYznjfpyeoMQT4GCCyb5mi g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="386208177"
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; d="scan'208";a="386208177"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 00:10:12 -0700
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; d="scan'208";a="948022823"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 21 Sep 2022 00:10:11 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC v4 07/14] drm/i915/vm_bind: Add out fence support
Date: Wed, 21 Sep 2022 00:09:38 -0700
Message-Id: <20220921070945.27764-8-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20220921070945.27764-1-niranjana.vishwanathapura@intel.com>
References: <20220921070945.27764-1-niranjana.vishwanathapura@intel.com>
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
 lionel.g.landwerlin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, jason@jlekstrand.net, daniel.vetter@intel.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for handling out fence for vm_bind call.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   |  4 +
 .../drm/i915/gem/i915_gem_vm_bind_object.c    | 81 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_vma.c               |  6 +-
 drivers/gpu/drm/i915/i915_vma_types.h         |  7 ++
 4 files changed, 97 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
index 4f3cfa1f6ef6..facba29ead04 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
@@ -6,6 +6,7 @@
 #ifndef __I915_GEM_VM_BIND_H
 #define __I915_GEM_VM_BIND_H
 
+#include <linux/dma-fence.h>
 #include <linux/types.h>
 
 #include <drm/drm_file.h>
@@ -24,4 +25,7 @@ int i915_gem_vm_unbind_ioctl(struct drm_device *dev, void *data,
 
 void i915_gem_vm_unbind_all(struct i915_address_space *vm);
 
+void i915_vm_bind_signal_fence(struct i915_vma *vma,
+			       struct dma_fence * const fence);
+
 #endif /* __I915_GEM_VM_BIND_H */
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
index 236f901b8b9c..5cd788404ee7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
@@ -7,6 +7,8 @@
 
 #include <linux/interval_tree_generic.h>
 
+#include <drm/drm_syncobj.h>
+
 #include "gem/i915_gem_context.h"
 #include "gem/i915_gem_vm_bind.h"
 
@@ -106,6 +108,75 @@ static void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj)
 		i915_gem_object_put(vma->obj);
 }
 
+static int i915_vm_bind_add_fence(struct drm_file *file, struct i915_vma *vma,
+				  u32 handle, u64 point)
+{
+	struct drm_syncobj *syncobj;
+
+	syncobj = drm_syncobj_find(file, handle);
+	if (!syncobj) {
+		DRM_DEBUG("Invalid syncobj handle provided\n");
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
@@ -233,6 +304,13 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
 		goto unlock_vm;
 	}
 
+	if (va->fence.flags & I915_TIMELINE_FENCE_SIGNAL) {
+		ret = i915_vm_bind_add_fence(file, vma, va->fence.handle,
+					     va->fence.value);
+		if (ret)
+			goto put_vma;
+	}
+
 	pin_flags = va->start | PIN_OFFSET_FIXED | PIN_USER;
 
 	for_i915_gem_ww(&ww, ret, true) {
@@ -257,6 +335,9 @@ static int i915_gem_vm_bind_obj(struct i915_address_space *vm,
 		i915_gem_object_get(vma->obj);
 	}
 
+	if (va->fence.flags & I915_TIMELINE_FENCE_SIGNAL)
+		i915_vm_bind_put_fence(vma);
+put_vma:
 	if (ret)
 		i915_vma_destroy(vma);
 unlock_vm:
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index ff216e9a2c8d..f7d711e675d6 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1540,8 +1540,12 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
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
index d21bf97febaa..7fdbf73666e9 100644
--- a/drivers/gpu/drm/i915/i915_vma_types.h
+++ b/drivers/gpu/drm/i915/i915_vma_types.h
@@ -311,6 +311,13 @@ struct i915_vma {
 	/* @vm_rebind_link: link to vm_rebind_list and protected by vm_rebind_lock */
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
-- 
2.21.0.rc0.32.g243a4c7e27

