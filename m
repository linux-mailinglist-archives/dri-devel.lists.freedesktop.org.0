Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2425F2877
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 08:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA6810E22A;
	Mon,  3 Oct 2022 06:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D1A10E20A;
 Mon,  3 Oct 2022 06:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664777599; x=1696313599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eiX2K850zqHeF7cw/jaCuBgez489V0BBdOkVDuujkl0=;
 b=W3t3QKKhzTgpBQA18RqvSV7uaSLWcPkdI8yqv5St24D8tEkX8wHCc2aB
 OL9bJd72N4H/N6n4QY73GyGP73p0aQEr4A9W0h8tlvGx3Tdza1H/OnDA4
 NjCiBmrm2CKp3ea/udB0yqCQqWKwMIDEzc+d/1kdhUn5+kcXVeNjRS/LK
 rnnhnplUvifWIcv5lfpUPWsaYOWvZd3GeZ4T1EAVDIr43vkYMZ+Kx3B/D
 cxLfe6tSHEKwO721hSe4myth8ni6uZwvslzh8rCyNEqLTbSWCGHFj3iM9
 H7qzUYSmBirY9lgVH75DUZntQY6HcR+mlm7Qnx9wXQUR27kiVeDPE2Cvo A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="300159068"
X-IronPort-AV: E=Sophos;i="5.93,364,1654585200"; d="scan'208";a="300159068"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2022 23:13:18 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="574516827"
X-IronPort-AV: E=Sophos;i="5.93,364,1654585200"; d="scan'208";a="574516827"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 02 Oct 2022 23:13:18 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 08/17] drm/i915/vm_bind: Support persistent vma activeness
 tracking
Date: Sun,  2 Oct 2022 23:12:36 -0700
Message-Id: <20221003061245.12716-9-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20221003061245.12716-1-niranjana.vishwanathapura@intel.com>
References: <20221003061245.12716-1-niranjana.vishwanathapura@intel.com>
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

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/i915/i915_gem_gtt.c | 39 +++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_gem_gtt.h |  3 +++
 drivers/gpu/drm/i915/i915_vma.c     | 28 +++++++++++++++++++++
 drivers/gpu/drm/i915/i915_vma.h     | 25 +++++++++---------
 4 files changed, 83 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
index 329ff75b80b9..b7d0844de561 100644
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
+	int ret;
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
index 8c2f57eb5dda..a5bbdc59d9df 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.h
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.h
@@ -51,4 +51,7 @@ int i915_gem_gtt_insert(struct i915_address_space *vm,
 
 #define PIN_OFFSET_MASK		I915_GTT_PAGE_MASK
 
+int i915_vm_sync(struct i915_address_space *vm);
+bool i915_vm_is_active(const struct i915_address_space *vm);
+
 #endif
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 4c0e933a7ea5..abf9ca4267cf 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -420,6 +420,24 @@ int i915_vma_wait_for_bind(struct i915_vma *vma)
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
@@ -1887,6 +1905,8 @@ int _i915_vma_move_to_active(struct i915_vma *vma,
 	int err;
 
 	assert_object_held(obj);
+	if (i915_vma_is_persistent(vma))
+		return -EINVAL;
 
 	GEM_BUG_ON(!vma->pages);
 
@@ -2097,6 +2117,14 @@ static struct dma_fence *__i915_vma_unbind_async(struct i915_vma *vma)
 		return ERR_PTR(-EBUSY);
 	}
 
+	if (i915_vma_is_persistent(vma) &&
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
index 9a4a7a8dfe5b..1cadbf8fdedf 100644
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
 
@@ -162,6 +156,18 @@ static inline void i915_vma_set_purged(struct i915_vma *vma)
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
@@ -433,12 +439,7 @@ void i915_vma_make_shrinkable(struct i915_vma *vma);
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

