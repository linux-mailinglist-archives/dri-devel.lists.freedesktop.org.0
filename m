Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 119756714CE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 08:17:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD99910E6C6;
	Wed, 18 Jan 2023 07:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6B810E69D;
 Wed, 18 Jan 2023 07:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674026176; x=1705562176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qLt+iryDvELJcq0pAKPz4aWxwNwJH3wH26+Yrs+S2xU=;
 b=dUWdkINOzrRW4jLkkmZnJRrMdExlojwwgb+k7CafTKuXqGpp5TIUlkXx
 k5CM2YRqEOZhGb7UOJlDUk21W9r7tmknaJnHgT9NZfC+VHAOLYHGL7vad
 ScPXE6S2516V2Zc2RHOhLnLuCDuQSSRB4DC6EkCZU+owzgh2TIDXN04R3
 3d9jS4RPvQ7172W3WQtScLwIeetIQ+y46OGvphTeLvmznzBGA8QWb5phZ
 rIpXGDc9lowzSWAv9YN0Ox4klNbRsnT62ON8ct2yjP191MsX9EleFhttA
 MAIeZkGytMz2FMlHFJ5xK7WGZfAZXSz5vMvHAVlz4zqhYXLjjNvQxRCYQ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="308482051"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="308482051"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 23:16:15 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="661609991"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="661609991"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 23:16:14 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v10 09/23] drm/i915/vm_bind: Support persistent vma activeness
 tracking
Date: Tue, 17 Jan 2023 23:15:55 -0800
Message-Id: <20230118071609.17572-10-niranjana.vishwanathapura@intel.com>
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

Do not use i915_vma activeness tracking for persistent vmas.

As persistent vmas are part of working set for each execbuf
submission on that address space (VM), a persistent vma is
active if the VM active. As vm->root_obj->base.resv will be
updated for each submission on that VM, it correctly
represent whether the VM is active or not.

Add i915_vm_is_active() and i915_vm_sync() functions based
on vm->root_obj->base.resv with DMA_RESV_USAGE_BOOKKEEP
usage. dma-resv fence list will be updated with this usage
during each submission with this VM in the new execbuf3
ioctl path.

Update i915_vma_is_active(), i915_vma_sync() and the
__i915_vma_unbind_async() functions to properly handle
persistent vmas.

v2: Ensure lvalue of dma_resv_wait_timeout() call is long.
v3: Do not await for purged vmas to become idle during
    async unbind

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/i915/i915_gem_gtt.c | 39 +++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_gem_gtt.h |  3 +++
 drivers/gpu/drm/i915/i915_vma.c     | 28 +++++++++++++++++++++
 drivers/gpu/drm/i915/i915_vma.h     | 25 +++++++++---------
 4 files changed, 83 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
index 7bd1861ddbdf..1d8506548d4a 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
@@ -25,6 +25,45 @@
 #include "i915_trace.h"
 #include "i915_vgpu.h"
 
+/**
+ * i915_vm_sync() - Wait until address space is not in use
+ * @vm: address space
+ *
+ * Waits until all requests using the address space are complete.
+ *
+ * Returns: 0 if success, -ve err code upon failure
+ */
+int i915_vm_sync(struct i915_address_space *vm)
+{
+	long ret;
+
+	/* Wait for all requests under this vm to finish */
+	ret = dma_resv_wait_timeout(vm->root_obj->base.resv,
+				    DMA_RESV_USAGE_BOOKKEEP, false,
+				    MAX_SCHEDULE_TIMEOUT);
+	if (ret < 0)
+		return ret;
+	else if (ret > 0)
+		return 0;
+	else
+		return -ETIMEDOUT;
+}
+
+/**
+ * i915_vm_is_active() - Check if address space is being used
+ * @vm: address space
+ *
+ * Check if any request using the specified address space is
+ * active.
+ *
+ * Returns: true if address space is active, false otherwise.
+ */
+bool i915_vm_is_active(const struct i915_address_space *vm)
+{
+	return !dma_resv_test_signaled(vm->root_obj->base.resv,
+				       DMA_RESV_USAGE_BOOKKEEP);
+}
+
 int i915_gem_gtt_prepare_pages(struct drm_i915_gem_object *obj,
 			       struct sg_table *pages)
 {
diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.h b/drivers/gpu/drm/i915/i915_gem_gtt.h
index 243419783052..e62b52c74586 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.h
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.h
@@ -52,4 +52,7 @@ int i915_gem_gtt_insert(struct i915_address_space *vm,
 
 #define PIN_OFFSET_MASK		I915_GTT_PAGE_MASK
 
+int i915_vm_sync(struct i915_address_space *vm);
+bool i915_vm_is_active(const struct i915_address_space *vm);
+
 #endif
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 353203bd5685..b44fd5f73b64 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -422,6 +422,24 @@ int i915_vma_wait_for_bind(struct i915_vma *vma)
 	return err;
 }
 
+/**
+ * i915_vma_sync() - Wait for the vma to be idle
+ * @vma: vma to be tested
+ *
+ * Returns 0 on success and error code on failure
+ */
+int i915_vma_sync(struct i915_vma *vma)
+{
+	int ret;
+
+	/* Wait for the asynchronous bindings and pending GPU reads */
+	ret = i915_active_wait(&vma->active);
+	if (ret || !i915_vma_is_persistent(vma) || i915_vma_is_purged(vma))
+		return ret;
+
+	return i915_vm_sync(vma->vm);
+}
+
 #if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
 static int i915_vma_verify_bind_complete(struct i915_vma *vma)
 {
@@ -1917,6 +1935,8 @@ int _i915_vma_move_to_active(struct i915_vma *vma,
 	int err;
 
 	assert_object_held(obj);
+	if (i915_vma_is_persistent(vma))
+		return -EINVAL;
 
 	GEM_BUG_ON(!vma->pages);
 
@@ -2131,6 +2151,14 @@ static struct dma_fence *__i915_vma_unbind_async(struct i915_vma *vma)
 		return ERR_PTR(-EBUSY);
 	}
 
+	if (i915_vma_is_persistent(vma) && !i915_vma_is_purged(vma) &&
+	    __i915_sw_fence_await_reservation(&vma->resource->chain,
+					      vma->vm->root_obj->base.resv,
+					      DMA_RESV_USAGE_BOOKKEEP,
+					      i915_fence_timeout(vma->vm->i915),
+					      GFP_NOWAIT | __GFP_NOWARN) < 0)
+		return ERR_PTR(-EBUSY);
+
 	fence = __i915_vma_evict(vma, true);
 
 	drm_mm_remove_node(&vma->node); /* pairs with i915_vma_release() */
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index 7b1bf5ba4f12..de1756e4f638 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -51,12 +51,6 @@ i915_vma_create_persistent(struct drm_i915_gem_object *obj,
 
 void i915_vma_unpin_and_release(struct i915_vma **p_vma, unsigned int flags);
 #define I915_VMA_RELEASE_MAP BIT(0)
-
-static inline bool i915_vma_is_active(const struct i915_vma *vma)
-{
-	return !i915_active_is_idle(&vma->active);
-}
-
 /* do not reserve memory to prevent deadlocks */
 #define __EXEC_OBJECT_NO_RESERVE BIT(31)
 #define __EXEC_OBJECT_NO_REQUEST_AWAIT BIT(30)
@@ -209,6 +203,18 @@ static inline void i915_vma_set_purged(struct i915_vma *vma)
 	set_bit(I915_VMA_PURGED_BIT, __i915_vma_flags(vma));
 }
 
+static inline bool i915_vma_is_active(const struct i915_vma *vma)
+{
+	if (i915_vma_is_persistent(vma)) {
+		if (i915_vma_is_purged(vma))
+			return false;
+
+		return i915_vm_is_active(vma->vm);
+	}
+
+	return !i915_active_is_idle(&vma->active);
+}
+
 static inline struct i915_vma *i915_vma_get(struct i915_vma *vma)
 {
 	i915_gem_object_get(vma->obj);
@@ -480,12 +486,7 @@ void i915_vma_make_shrinkable(struct i915_vma *vma);
 void i915_vma_make_purgeable(struct i915_vma *vma);
 
 int i915_vma_wait_for_bind(struct i915_vma *vma);
-
-static inline int i915_vma_sync(struct i915_vma *vma)
-{
-	/* Wait for the asynchronous bindings and pending GPU reads */
-	return i915_active_wait(&vma->active);
-}
+int i915_vma_sync(struct i915_vma *vma);
 
 /**
  * i915_vma_get_current_resource - Get the current resource of the vma
-- 
2.21.0.rc0.32.g243a4c7e27

