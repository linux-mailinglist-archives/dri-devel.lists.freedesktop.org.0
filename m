Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1FE61ED97
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 09:53:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB9810E28D;
	Mon,  7 Nov 2022 08:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222E010E259;
 Mon,  7 Nov 2022 08:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667811148; x=1699347148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YsDc97ujg96Uo2mrDm3TCgiGlaNpzslQpF2maW8nLlQ=;
 b=FXsMopCMMe7ampu/WWQwZQM5v7UhQ7LRsngyZsZfxj3NkPpI16BDUc7Z
 RkmedrSBammpgsFHgVUfscrWPghS1rtupGwV/8ZNBGdJ/WbX4ZrSNrBhW
 Gl+QPW0zPLSsfWq6mdnreDeMYMKtJSvEAS6QNU6ITcClo4VUbq3pTdobA
 ZP+kra8p/6kxfUvTkrKzxkKB/wBtUqc4EkpmgebraGx02rCAzuHEkjXva
 +s4JdcAQJr5+yA5hPVm5Vnic8dQmM3fXMmYi9j+uDg27xpJ2fErFFrqGD
 zqoJg4MRARVjrnubGXQDxXq0s+y5l9fqKrRUJqqnDj1VuxA76csHUKDTS w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="374613952"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="374613952"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 00:52:27 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="880984672"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="880984672"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 00:52:27 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 20/20] drm/i915/vm_bind: Async vm_unbind support
Date: Mon,  7 Nov 2022 00:52:10 -0800
Message-Id: <20221107085210.17221-21-niranjana.vishwanathapura@intel.com>
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

Asynchronously unbind the vma upon vm_unbind call.
Fall back to synchronous unbind if backend doesn't support
async unbind or if async unbind fails.

No need for vm_unbind out fence support as i915 will internally
handle all sequencing and user need not try to sequence any
operation with the unbind completion.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/i915/i915_vma.c | 51 ++++++++++++++++++++++++++++++---
 drivers/gpu/drm/i915/i915_vma.h |  1 +
 2 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 08218e3a2f12..03c966fad87b 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -42,6 +42,8 @@
 #include "i915_vma.h"
 #include "i915_vma_resource.h"
 
+static struct dma_fence *__i915_vma_unbind_async(struct i915_vma *vma);
+
 static inline void assert_vma_held_evict(const struct i915_vma *vma)
 {
 	/*
@@ -1711,7 +1713,7 @@ void i915_vma_reopen(struct i915_vma *vma)
 	spin_unlock_irq(&gt->closed_lock);
 }
 
-static void force_unbind(struct i915_vma *vma)
+static void force_unbind(struct i915_vma *vma, bool async)
 {
 	if (!drm_mm_node_allocated(&vma->node))
 		return;
@@ -1725,7 +1727,21 @@ static void force_unbind(struct i915_vma *vma)
 		i915_vma_set_purged(vma);
 
 	atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
-	WARN_ON(__i915_vma_unbind(vma));
+	if (async) {
+		struct dma_fence *fence;
+
+		fence = __i915_vma_unbind_async(vma);
+		if (IS_ERR_OR_NULL(fence)) {
+			async = false;
+		} else {
+			dma_resv_add_fence(vma->obj->base.resv, fence,
+					   DMA_RESV_USAGE_READ);
+			dma_fence_put(fence);
+		}
+	}
+
+	if (!async)
+		WARN_ON(__i915_vma_unbind(vma));
 	GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
 }
 
@@ -1785,7 +1801,7 @@ void i915_vma_destroy_locked(struct i915_vma *vma)
 {
 	lockdep_assert_held(&vma->vm->mutex);
 
-	force_unbind(vma);
+	force_unbind(vma, false);
 	list_del_init(&vma->vm_link);
 	release_references(vma, vma->vm->gt, false);
 }
@@ -1796,7 +1812,34 @@ void i915_vma_destroy(struct i915_vma *vma)
 	bool vm_ddestroy;
 
 	mutex_lock(&vma->vm->mutex);
-	force_unbind(vma);
+	force_unbind(vma, false);
+	list_del_init(&vma->vm_link);
+	vm_ddestroy = vma->vm_ddestroy;
+	vma->vm_ddestroy = false;
+
+	/* vma->vm may be freed when releasing vma->vm->mutex. */
+	gt = vma->vm->gt;
+	mutex_unlock(&vma->vm->mutex);
+	release_references(vma, gt, vm_ddestroy);
+}
+
+void i915_vma_destroy_async(struct i915_vma *vma)
+{
+	bool vm_ddestroy, async = vma->obj->mm.rsgt;
+	struct intel_gt *gt;
+
+	if (dma_resv_reserve_fences(vma->obj->base.resv, 1))
+		async = false;
+
+	mutex_lock(&vma->vm->mutex);
+	/*
+	 * Ensure any asynchronous binding is complete while using
+	 * async unbind as we will be releasing the vma here.
+	 */
+	if (async && i915_active_wait(&vma->active))
+		async = false;
+
+	force_unbind(vma, async);
 	list_del_init(&vma->vm_link);
 	vm_ddestroy = vma->vm_ddestroy;
 	vma->vm_ddestroy = false;
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index 737ef310d046..25f15965dab8 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -272,6 +272,7 @@ void i915_vma_reopen(struct i915_vma *vma);
 
 void i915_vma_destroy_locked(struct i915_vma *vma);
 void i915_vma_destroy(struct i915_vma *vma);
+void i915_vma_destroy_async(struct i915_vma *vma);
 
 #define assert_vma_held(vma) dma_resv_assert_held((vma)->obj->base.resv)
 
-- 
2.21.0.rc0.32.g243a4c7e27

