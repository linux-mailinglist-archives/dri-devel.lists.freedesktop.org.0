Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B435B5ED4CA
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 08:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9CFD10E2E0;
	Wed, 28 Sep 2022 06:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CB510E26E;
 Wed, 28 Sep 2022 06:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664345989; x=1695881989;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ybd+i7xvPCdnLno0clVUde+Xkl/8BAphUovd0RD2GRA=;
 b=IB+ideFvSYfI0Bp0+PcR6U+Bt9rule5ENDXSewFWaGEVM1G1nvnjuBjX
 VMjT0wW94xRtzKMbW442fHquu/DJrYEQtK5Bl4/4ovS52xPjcfrpte/G5
 BAN4QIITtJ3ge0TNG8aAq4balb1rjH4PyJrKHyI9LTfA3uK6uiRqpuaIS
 FYm+6/45MwEvQQMBhQc4u0tKAVE/f2zUjcfoBD/3psfJeXcpWKrJNQUAZ
 nRoGKm8QCe7J2/EjeMXF/xVgEI6wWNAwwbQmJzELzpDvyh8teZ+nW5sf0
 AahU6IryUaf1DA78OMeU1LrvHtJDYBmpQTU2IWd1B7JnPGyCsrWo0ryUR Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="299115508"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; d="scan'208";a="299115508"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 23:19:47 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="866849195"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; d="scan'208";a="866849195"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 27 Sep 2022 23:19:47 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 07/16] drm/i915/vm_bind: Add support to handle object evictions
Date: Tue, 27 Sep 2022 23:19:09 -0700
Message-Id: <20220928061918.6340-8-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20220928061918.6340-1-niranjana.vishwanathapura@intel.com>
References: <20220928061918.6340-1-niranjana.vishwanathapura@intel.com>
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

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 .../drm/i915/gem/i915_gem_vm_bind_object.c    |  6 ++++++
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  2 ++
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  4 ++++
 drivers/gpu/drm/i915/i915_vma.c               | 19 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_vma.h               | 10 ++++++++++
 drivers/gpu/drm/i915/i915_vma_types.h         | 10 ++++++++++
 6 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
index 809c78455d2e..958139ed6da3 100644
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
index da4f9dee0397..6db31197fa87 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -296,6 +296,8 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
 	INIT_LIST_HEAD(&vm->non_priv_vm_bind_list);
 	vm->root_obj = i915_gem_object_create_internal(vm->i915, PAGE_SIZE);
 	GEM_BUG_ON(IS_ERR(vm->root_obj));
+	INIT_LIST_HEAD(&vm->vm_rebind_list);
+	spin_lock_init(&vm->vm_rebind_lock);
 }
 
 void *__px_vaddr(struct drm_i915_gem_object *p)
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 3f2e87d3bf34..b73d35b4e05d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -273,6 +273,10 @@ struct i915_address_space {
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
index 89c276163916..84ed3d1a17a6 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -241,6 +241,7 @@ vma_create(struct drm_i915_gem_object *obj,
 
 	INIT_LIST_HEAD(&vma->vm_bind_link);
 	INIT_LIST_HEAD(&vma->non_priv_vm_bind_link);
+	INIT_LIST_HEAD(&vma->vm_rebind_link);
 	return vma;
 
 err_unlock:
@@ -1686,6 +1687,14 @@ static void force_unbind(struct i915_vma *vma)
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
@@ -2048,6 +2057,16 @@ int __i915_vma_unbind(struct i915_vma *vma)
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
 
diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
index 51e712de380a..48731855b5b0 100644
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
index 3d5ffc3e666b..75b8af608ddb 100644
--- a/drivers/gpu/drm/i915/i915_vma_types.h
+++ b/drivers/gpu/drm/i915/i915_vma_types.h
@@ -267,9 +267,17 @@ struct i915_vma {
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
+
 #define I915_VMA_PERSISTENT	((int)BIT(I915_VMA_PERSISTENT_BIT))
+#define I915_VMA_PURGED		((int)BIT(I915_VMA_PURGED_BIT))
 
 	struct i915_active active;
 
@@ -300,6 +308,8 @@ struct i915_vma {
 	struct list_head vm_bind_link;
 	/* @non_priv_vm_bind_link: Link in non-private persistent VMA list */
 	struct list_head non_priv_vm_bind_link;
+	/* @vm_rebind_link: link to vm_rebind_list and protected by vm_rebind_lock */
+	struct list_head vm_rebind_link; /* Link in vm_rebind_list */
 
 	/** Interval tree structures for persistent vma */
 
-- 
2.21.0.rc0.32.g243a4c7e27

