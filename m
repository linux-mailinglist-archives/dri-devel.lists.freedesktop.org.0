Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 887F2602559
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 09:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF30410EEA9;
	Tue, 18 Oct 2022 07:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F10110EC06;
 Tue, 18 Oct 2022 07:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666077399; x=1697613399;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I4ErehlwVwPKUkQuKfFrWSOdfeg9ePkMT6W/uDLU3lM=;
 b=LJENMp3tosOVtj/yrcmXBcFl7sH4jiRjeS0jPn2A9VcCT5pkzeHvq0qp
 o0z4VDkrzTs56pyj5If/sDodXzpVVHUZdIiODPlX4550Gb1LU5d6G3o1e
 AkWVKBVD1p/3JBL+EoTxz/tPOdKagMRjJZkfZndTm9gsAHYgpAoEYdCuV
 /dyhoC8Vu0bwrct+5j6lKmMs6oPHe2s6FM+dBE5bC8YOPA2cfjLRLQZhw
 csG4Pzh1jJ2EWeC10j0gpwno9g4wLpaouUfRqPmJGTxq0NRXFhRryjR6M
 SZooDLM55M+XyTyoNEhZ41m2gCcYTznPD0dCngS5N5sVSHZgmySmikwcC Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="370221330"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="370221330"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 00:16:39 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="661783479"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="661783479"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 00:16:38 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 07/17] drm/i915/vm_bind: Add support to handle object
 evictions
Date: Tue, 18 Oct 2022 00:16:20 -0700
Message-Id: <20221018071630.3831-8-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20221018071630.3831-1-niranjana.vishwanathapura@intel.com>
References: <20221018071630.3831-1-niranjana.vishwanathapura@intel.com>
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
 drivers/gpu/drm/i915/i915_vma.c               | 31 +++++++++++++++++--
 drivers/gpu/drm/i915/i915_vma.h               | 10 ++++++
 drivers/gpu/drm/i915/i915_vma_types.h         |  8 +++++
 6 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
index 05e8d3d14894..3ea3cb3ed97e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
@@ -85,6 +85,12 @@ static void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj)
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
index 74c3557e5bc4..ebf8fc3a4603 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -290,6 +290,8 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
 	INIT_LIST_HEAD(&vm->vm_bound_list);
 	mutex_init(&vm->vm_bind_lock);
 	INIT_LIST_HEAD(&vm->non_priv_vm_bind_list);
+	INIT_LIST_HEAD(&vm->vm_rebind_list);
+	spin_lock_init(&vm->vm_rebind_lock);
 }
 
 void *__px_vaddr(struct drm_i915_gem_object *p)
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 36791503fe86..384d1ee7c68d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -266,6 +266,10 @@ struct i915_address_space {
 	struct list_head vm_bind_list;
 	/** @vm_bound_list: List of vm_binding completed */
 	struct list_head vm_bound_list;
+	/* @vm_rebind_list: list of vmas to be rebinded */
+	struct list_head vm_rebind_list;
+	/* @vm_rebind_lock: protects vm_rebound_list */
+	spinlock_t vm_rebind_lock;
 	/* @va: tree of persistent vmas */
 	struct rb_root_cached va;
 	struct list_head non_priv_vm_bind_list;
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 0ffa24bc0954..249697ae1186 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -241,6 +241,7 @@ vma_create(struct drm_i915_gem_object *obj,
 
 	INIT_LIST_HEAD(&vma->vm_bind_link);
 	INIT_LIST_HEAD(&vma->non_priv_vm_bind_link);
+	INIT_LIST_HEAD(&vma->vm_rebind_link);
 	return vma;
 
 err_unlock:
@@ -1681,6 +1682,14 @@ static void force_unbind(struct i915_vma *vma)
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
@@ -2042,6 +2051,16 @@ int __i915_vma_unbind(struct i915_vma *vma)
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
 
@@ -2054,8 +2073,7 @@ static struct dma_fence *__i915_vma_unbind_async(struct i915_vma *vma)
 	if (!drm_mm_node_allocated(&vma->node))
 		return NULL;
 
-	if (i915_vma_is_pinned(vma) ||
-	    &vma->obj->mm.rsgt->table != vma->resource->bi.pages)
+	if (i915_vma_is_pinned(vma))
 		return ERR_PTR(-EAGAIN);
 
 	/*
@@ -2077,6 +2095,15 @@ static struct dma_fence *__i915_vma_unbind_async(struct i915_vma *vma)
 
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
index c5378ec2f70a..9a4a7a8dfe5b 100644
--- a/drivers/gpu/drm/i915/i915_vma.h
+++ b/drivers/gpu/drm/i915/i915_vma.h
@@ -152,6 +152,16 @@ static inline void i915_vma_set_persistent(struct i915_vma *vma)
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
index b8176cca58c0..d32c72e8d242 100644
--- a/drivers/gpu/drm/i915/i915_vma_types.h
+++ b/drivers/gpu/drm/i915/i915_vma_types.h
@@ -267,8 +267,14 @@ struct i915_vma {
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
 
@@ -299,6 +305,8 @@ struct i915_vma {
 	struct list_head vm_bind_link;
 	/* @non_priv_vm_bind_link: Link in non-private persistent VMA list */
 	struct list_head non_priv_vm_bind_link;
+	/* @vm_rebind_link: link to vm_rebind_list and protected by vm_rebind_lock */
+	struct list_head vm_rebind_link; /* Link in vm_rebind_list */
 
 	/** Interval tree structures for persistent vma */
 
-- 
2.21.0.rc0.32.g243a4c7e27

