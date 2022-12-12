Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE2664AB57
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 00:17:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CE710E2BF;
	Mon, 12 Dec 2022 23:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44FC210E2AC;
 Mon, 12 Dec 2022 23:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670886935; x=1702422935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t+xAGG1Szpp0XaQXYpBGNPv0fcsTXdItwpv3llBArAU=;
 b=oKzygUq9FivOOl/RVYq+OmovOVPScEh8vnc6wjQi+pqSdtaCq9G//x/2
 np6ExorTsZhh4YR3vy/w4vy+nFKF5M7nLnBvseqcUQlHhHDU+1+IjQdw+
 26mT8EkMOKYJap4rwUyGZsL5eLJISUGQf2o3NdWv6VKKfGGRoO/RvAeq2
 o0JlCLOLieEjYXNDRiQwxuFPPi3WM8zkhNFvKRCDZyWAgAp9iIr4eKsHr
 SxElalCmcGtxZl1uVgQXOmDfQlG+DgmfnDS+g3gOkAAgTwc+TVFAc7Bib
 1aaoX9Dpfe/XreN9ict6DMUbeTUgVyePxnPNGpi/MT5nYt2t4qkNhjNaO w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="380196368"
X-IronPort-AV: E=Sophos;i="5.96,239,1665471600"; d="scan'208";a="380196368"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2022 15:15:35 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="679090324"
X-IronPort-AV: E=Sophos;i="5.96,239,1665471600"; d="scan'208";a="679090324"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2022 15:15:34 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v9 08/23] drm/i915/vm_bind: Add support to handle object
 evictions
Date: Mon, 12 Dec 2022 15:15:12 -0800
Message-Id: <20221212231527.2384-9-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20221212231527.2384-1-niranjana.vishwanathapura@intel.com>
References: <20221212231527.2384-1-niranjana.vishwanathapura@intel.com>
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

Support eviction by maintaining a list of evicted persistent vmas
for rebinding during next submission. Ensure the list do not
include persistent vmas that are being purged.

v2: Remove unused I915_VMA_PURGED definition.
v3: Properly handle __i915_vma_unbind_async() case.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 .../drm/i915/gem/i915_gem_vm_bind_object.c    |  6 ++++
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  2 ++
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  4 +++
 drivers/gpu/drm/i915/i915_vma.c               | 28 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_vma.h               | 10 +++++++
 drivers/gpu/drm/i915/i915_vma_types.h         |  8 ++++++
 6 files changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
index 4f9df4b756d2..dc738677466b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
@@ -86,6 +86,12 @@ static void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj)
 {
 	lockdep_assert_held(&vma->vm->vm_bind_lock);
 
+	spin_lock(&vma->vm->vm_rebind_lock);
+	if (!list_empty(&vma->vm_rebind_link))
+		list_del_init(&vma->vm_rebind_link);
+	i915_vma_set_purged(vma);
+	spin_unlock(&vma->vm->vm_rebind_lock);
+
 	list_del_init(&vma->vm_bind_link);
 	list_del_init(&vma->non_priv_vm_bind_link);
 	i915_vm_bind_it_remove(vma, &vma->vm->va);
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 7ce0237d664f..4f91857dca46 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -291,6 +291,8 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
 	INIT_LIST_HEAD(&vm->vm_bound_list);
 	mutex_init(&vm->vm_bind_lock);
 	INIT_LIST_HEAD(&vm->non_priv_vm_bind_list);
+	INIT_LIST_HEAD(&vm->vm_rebind_list);
+	spin_lock_init(&vm->vm_rebind_lock);
 }
 
 void *__px_vaddr(struct drm_i915_gem_object *p)
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index cb87d0e925c7..dbe6792df3e5 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -266,6 +266,10 @@ struct i915_address_space {
 	struct list_head vm_bind_list;
 	/** @vm_bound_list: List of vm_binding completed */
 	struct list_head vm_bound_list;
+	/** @vm_rebind_list: list of vmas to be rebinded */
+	struct list_head vm_rebind_list;
+	/** @vm_rebind_lock: protects vm_rebound_list */
+	spinlock_t vm_rebind_lock;
 	/** @va: tree of persistent vmas */
 	struct rb_root_cached va;
 	/** @non_priv_vm_bind_list: list of non-private object mappings */
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 30f0c0aca007..353203bd5685 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -243,6 +243,7 @@ vma_create(struct drm_i915_gem_object *obj,
 
 	INIT_LIST_HEAD(&vma->vm_bind_link);
 	INIT_LIST_HEAD(&vma->non_priv_vm_bind_link);
+	INIT_LIST_HEAD(&vma->vm_rebind_link);
 	return vma;
 
 err_unlock:
@@ -1716,6 +1717,14 @@ static void force_unbind(struct i915_vma *vma)
 	if (!drm_mm_node_allocated(&vma->node))
 		return;
 
+	/*
+	 * Persistent vma should have been purged by now.
+	 * If not, issue a warning and purge it.
+	 */
+	if (GEM_WARN_ON(i915_vma_is_persistent(vma) &&
+			!i915_vma_is_purged(vma)))
+		i915_vma_set_purged(vma);
+
 	atomic_and(~I915_VMA_PIN_MASK, &vma->flags);
 	WARN_ON(__i915_vma_unbind(vma));
 	GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
@@ -2082,6 +2091,16 @@ int __i915_vma_unbind(struct i915_vma *vma)
 	__i915_vma_evict(vma, false);
 
 	drm_mm_remove_node(&vma->node); /* pairs with i915_vma_release() */
+
+	if (i915_vma_is_persistent(vma)) {
+		spin_lock(&vma->vm->vm_rebind_lock);
+		if (list_empty(&vma->vm_rebind_link) &&
+		    !i915_vma_is_purged(vma))
+			list_add_tail(&vma->vm_rebind_link,
+				      &vma->vm->vm_rebind_list);
+		spin_unlock(&vma->vm->vm_rebind_lock);
+	}
+
 	return 0;
 }
 
@@ -2116,6 +2135,15 @@ static struct dma_fence *__i915_vma_unbind_async(struct i915_vma *vma)
 
 	drm_mm_remove_node(&vma->node); /* pairs with i915_vma_release() */
 
+	if (i915_vma_is_persistent(vma)) {
+		spin_lock(&vma->vm->vm_rebind_lock);
+		if (list_empty(&vma->vm_rebind_link) &&
+		    !i915_vma_is_purged(vma))
+			list_add_tail(&vma->vm_rebind_link,
+				      &vma->vm->vm_rebind_list);
+		spin_unlock(&vma->vm->vm_rebind_lock);
+	}
+
 	return fence;
 }
 
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index dd9951a41ff3..7b1bf5ba4f12 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -199,6 +199,16 @@ static inline void i915_vma_set_persistent(struct i915_vma *vma)
 	set_bit(I915_VMA_PERSISTENT_BIT, __i915_vma_flags(vma));
 }
 
+static inline bool i915_vma_is_purged(const struct i915_vma *vma)
+{
+	return test_bit(I915_VMA_PURGED_BIT, __i915_vma_flags(vma));
+}
+
+static inline void i915_vma_set_purged(struct i915_vma *vma)
+{
+	set_bit(I915_VMA_PURGED_BIT, __i915_vma_flags(vma));
+}
+
 static inline struct i915_vma *i915_vma_get(struct i915_vma *vma)
 {
 	i915_gem_object_get(vma->obj);
diff --git a/drivers/gpu/drm/i915/i915_vma_types.h b/drivers/gpu/drm/i915/i915_vma_types.h
index e081ffcb3250..6b1cce537846 100644
--- a/drivers/gpu/drm/i915/i915_vma_types.h
+++ b/drivers/gpu/drm/i915/i915_vma_types.h
@@ -268,8 +268,14 @@ struct i915_vma {
 /**
  * I915_VMA_PERSISTENT_BIT:
  * The vma is persistent (created with VM_BIND call).
+ *
+ * I915_VMA_PURGED_BIT:
+ * The persistent vma is force unbound either due to VM_UNBIND call
+ * from UMD or VM is released. Do not check/wait for VM activeness
+ * in i915_vma_is_active() and i915_vma_sync() calls.
  */
 #define I915_VMA_PERSISTENT_BIT	19
+#define I915_VMA_PURGED_BIT	20
 
 	struct i915_active active;
 
@@ -300,6 +306,8 @@ struct i915_vma {
 	struct list_head vm_bind_link;
 	/** @non_priv_vm_bind_link: Link in non-private persistent VMA list */
 	struct list_head non_priv_vm_bind_link;
+	/** @vm_rebind_link: link to vm_rebind_list and protected by vm_rebind_lock */
+	struct list_head vm_rebind_link; /* Link in vm_rebind_list */
 
 	/** Interval tree structures for persistent vma */
 
-- 
2.21.0.rc0.32.g243a4c7e27

