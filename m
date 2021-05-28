Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CD6394171
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 12:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D546F449;
	Fri, 28 May 2021 10:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174926EE96;
 Fri, 28 May 2021 10:57:58 +0000 (UTC)
IronPort-SDR: NuY6U8dhS7AbBpZN/wmnnr8vhfN8lYRcAuFBCBY5cdk770XEU52gwzyTGfd/cz+cToWlVWpBi6
 pF7MTp7OVv5A==
X-IronPort-AV: E=McAfee;i="6200,9189,9997"; a="266821811"
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; d="scan'208";a="266821811"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2021 03:57:57 -0700
IronPort-SDR: Z9ePqPAqie1Iwh8M6qIqptQq3YmT8zKMauBmtN/519d8tzrlNRc+lCFL0duCy8NWSzqTMf8WFA
 MSaIYh0f4m5w==
X-IronPort-AV: E=Sophos;i="5.83,229,1616482800"; d="scan'208";a="477885187"
Received: from jdahlin-mobl1.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.92])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2021 03:57:56 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 02/15] drm/i915: Don't free shared locks while shared
Date: Fri, 28 May 2021 12:57:31 +0200
Message-Id: <20210528105744.58271-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210528105744.58271-1-thomas.hellstrom@linux.intel.com>
References: <20210528105744.58271-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We are currently sharing the VM reservation locks across a number of
gem objects with page-table memory. Since TTM will individiualize the
reservation locks when freeing objects, including accessing the shared
locks, make sure that the shared locks are not freed until that is done.
For PPGTT we add an additional refcount, for GGTT we take additional
measures to make sure objects sharing the GGTT reservation lock are
freed at GGTT takedown

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
v2: Try harder to make sure objects sharing the GGTT reservation lock are
freed at GGTT takedown.
v3: Use a pointer to the vm to indicate that an object shares a reservation
object from that vm, rather than a pointer to the reservation object itself.
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  3 ++
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  4 ++
 drivers/gpu/drm/i915/gt/intel_ggtt.c          | 19 ++++++--
 drivers/gpu/drm/i915/gt/intel_gtt.c           | 45 +++++++++++++++----
 drivers/gpu/drm/i915/gt/intel_gtt.h           | 28 +++++++++++-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  2 +-
 drivers/gpu/drm/i915/i915_drv.c               |  5 +++
 7 files changed, 93 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 28144410df86..2be6109d0093 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -252,6 +252,9 @@ static void __i915_gem_free_objects(struct drm_i915_private *i915,
 		if (obj->mm.n_placements > 1)
 			kfree(obj->mm.placements);
 
+		if (obj->shares_resv_from)
+			i915_vm_resv_put(obj->shares_resv_from);
+
 		/* But keep the pointer alive for RCU-protected lookups */
 		call_rcu(&obj->rcu, __i915_gem_free_object_rcu);
 		cond_resched();
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 0727d0c76aa0..0415f99b6b95 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -149,6 +149,10 @@ struct drm_i915_gem_object {
 	 * when i915_gem_ww_ctx_backoff() or i915_gem_ww_ctx_fini() are called.
 	 */
 	struct list_head obj_link;
+	/**
+	 * @shared_resv_from: The object shares the resv from this vm.
+	 */
+	struct i915_address_space *shares_resv_from;
 
 	union {
 		struct rcu_head rcu;
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 35069ca5d7de..10c23a749a95 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -746,7 +746,6 @@ static void ggtt_cleanup_hw(struct i915_ggtt *ggtt)
 
 	mutex_unlock(&ggtt->vm.mutex);
 	i915_address_space_fini(&ggtt->vm);
-	dma_resv_fini(&ggtt->vm.resv);
 
 	arch_phys_wc_del(ggtt->mtrr);
 
@@ -768,6 +767,19 @@ void i915_ggtt_driver_release(struct drm_i915_private *i915)
 	ggtt_cleanup_hw(ggtt);
 }
 
+/**
+ * i915_ggtt_driver_late_release - Cleanup of GGTT that needs to be done after
+ * all free objects have been drained.
+ * @i915: i915 device
+ */
+void i915_ggtt_driver_late_release(struct drm_i915_private *i915)
+{
+	struct i915_ggtt *ggtt = &i915->ggtt;
+
+	GEM_WARN_ON(kref_read(&ggtt->vm.resv_ref) != 1);
+	dma_resv_fini(&ggtt->vm._resv);
+}
+
 static unsigned int gen6_get_total_gtt_size(u16 snb_gmch_ctl)
 {
 	snb_gmch_ctl >>= SNB_GMCH_GGMS_SHIFT;
@@ -829,6 +841,7 @@ static int ggtt_probe_common(struct i915_ggtt *ggtt, u64 size)
 		return -ENOMEM;
 	}
 
+	kref_init(&ggtt->vm.resv_ref);
 	ret = setup_scratch_page(&ggtt->vm);
 	if (ret) {
 		drm_err(&i915->drm, "Scratch setup failed\n");
@@ -1135,7 +1148,7 @@ static int ggtt_probe_hw(struct i915_ggtt *ggtt, struct intel_gt *gt)
 	ggtt->vm.gt = gt;
 	ggtt->vm.i915 = i915;
 	ggtt->vm.dma = i915->drm.dev;
-	dma_resv_init(&ggtt->vm.resv);
+	dma_resv_init(&ggtt->vm._resv);
 
 	if (INTEL_GEN(i915) <= 5)
 		ret = i915_gmch_probe(ggtt);
@@ -1144,7 +1157,7 @@ static int ggtt_probe_hw(struct i915_ggtt *ggtt, struct intel_gt *gt)
 	else
 		ret = gen8_gmch_probe(ggtt);
 	if (ret) {
-		dma_resv_fini(&ggtt->vm.resv);
+		dma_resv_fini(&ggtt->vm._resv);
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 9b98f9d9faa3..94849567143d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -22,8 +22,11 @@ struct drm_i915_gem_object *alloc_pt_lmem(struct i915_address_space *vm, int sz)
 	 * object underneath, with the idea that one object_lock() will lock
 	 * them all at once.
 	 */
-	if (!IS_ERR(obj))
-		obj->base.resv = &vm->resv;
+	if (!IS_ERR(obj)) {
+		obj->base.resv = i915_vm_resv_get(vm);
+		obj->shares_resv_from = vm;
+	}
+
 	return obj;
 }
 
@@ -40,8 +43,11 @@ struct drm_i915_gem_object *alloc_pt_dma(struct i915_address_space *vm, int sz)
 	 * object underneath, with the idea that one object_lock() will lock
 	 * them all at once.
 	 */
-	if (!IS_ERR(obj))
-		obj->base.resv = &vm->resv;
+	if (!IS_ERR(obj)) {
+		obj->base.resv = i915_vm_resv_get(vm);
+		obj->shares_resv_from = vm;
+	}
+
 	return obj;
 }
 
@@ -102,7 +108,7 @@ void __i915_vm_close(struct i915_address_space *vm)
 int i915_vm_lock_objects(struct i915_address_space *vm,
 			 struct i915_gem_ww_ctx *ww)
 {
-	if (vm->scratch[0]->base.resv == &vm->resv) {
+	if (vm->scratch[0]->base.resv == &vm->_resv) {
 		return i915_gem_object_lock(vm->scratch[0], ww);
 	} else {
 		struct i915_ppgtt *ppgtt = i915_vm_to_ppgtt(vm);
@@ -118,6 +124,22 @@ void i915_address_space_fini(struct i915_address_space *vm)
 	mutex_destroy(&vm->mutex);
 }
 
+/**
+ * i915_vm_resv_release - Final struct i915_address_space destructor
+ * @kref: Pointer to the &i915_address_space.resv_ref member.
+ *
+ * This function is called when the last lock sharer no longer shares the
+ * &i915_address_space._resv lock.
+ */
+void i915_vm_resv_release(struct kref *kref)
+{
+	struct i915_address_space *vm =
+		container_of(kref, typeof(*vm), resv_ref);
+
+	dma_resv_fini(&vm->_resv);
+	kfree(vm);
+}
+
 static void __i915_vm_release(struct work_struct *work)
 {
 	struct i915_address_space *vm =
@@ -125,9 +147,8 @@ static void __i915_vm_release(struct work_struct *work)
 
 	vm->cleanup(vm);
 	i915_address_space_fini(vm);
-	dma_resv_fini(&vm->resv);
 
-	kfree(vm);
+	i915_vm_resv_put(vm);
 }
 
 void i915_vm_release(struct kref *kref)
@@ -144,6 +165,14 @@ void i915_vm_release(struct kref *kref)
 void i915_address_space_init(struct i915_address_space *vm, int subclass)
 {
 	kref_init(&vm->ref);
+
+	/*
+	 * Special case for GGTT that has already done an early
+	 * kref_init here.
+	 */
+	if (!kref_read(&vm->resv_ref))
+		kref_init(&vm->resv_ref);
+
 	INIT_RCU_WORK(&vm->rcu, __i915_vm_release);
 	atomic_set(&vm->open, 1);
 
@@ -170,7 +199,7 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
 		might_alloc(GFP_KERNEL);
 		mutex_release(&vm->mutex.dep_map, _THIS_IP_);
 	}
-	dma_resv_init(&vm->resv);
+	dma_resv_init(&vm->_resv);
 
 	GEM_BUG_ON(!vm->total);
 	drm_mm_init(&vm->mm, 0, vm->total);
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 50a98ce39f74..edea95b97c36 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -245,7 +245,9 @@ struct i915_address_space {
 	atomic_t open;
 
 	struct mutex mutex; /* protects vma and our lists */
-	struct dma_resv resv; /* reservation lock for all pd objects, and buffer pool */
+
+	struct kref resv_ref; /* kref to keep the reservation lock alive. */
+	struct dma_resv _resv; /* reservation lock for all pd objects, and buffer pool */
 #define VM_CLASS_GGTT 0
 #define VM_CLASS_PPGTT 1
 #define VM_CLASS_DPT 2
@@ -405,13 +407,36 @@ i915_vm_get(struct i915_address_space *vm)
 	return vm;
 }
 
+/**
+ * i915_vm_resv_get - Obtain a reference on the vm's reservation lock
+ * @vm: The vm whose reservation lock we want to share.
+ *
+ * Return: A pointer to the vm's reservation lock.
+ */
+static inline struct dma_resv *i915_vm_resv_get(struct i915_address_space *vm)
+{
+	kref_get(&vm->resv_ref);
+	return &vm->_resv;
+}
+
 void i915_vm_release(struct kref *kref);
 
+void i915_vm_resv_release(struct kref *kref);
+
 static inline void i915_vm_put(struct i915_address_space *vm)
 {
 	kref_put(&vm->ref, i915_vm_release);
 }
 
+/**
+ * i915_vm_resv_put - Release a reference on the vm's reservation lock
+ * @resv: Pointer to a reservation lock obtained from i915_vm_resv_get()
+ */
+static inline void i915_vm_resv_put(struct i915_address_space *vm)
+{
+	kref_put(&vm->resv_ref, i915_vm_resv_release);
+}
+
 static inline struct i915_address_space *
 i915_vm_open(struct i915_address_space *vm)
 {
@@ -507,6 +532,7 @@ void i915_ggtt_enable_guc(struct i915_ggtt *ggtt);
 void i915_ggtt_disable_guc(struct i915_ggtt *ggtt);
 int i915_init_ggtt(struct drm_i915_private *i915);
 void i915_ggtt_driver_release(struct drm_i915_private *i915);
+void i915_ggtt_driver_late_release(struct drm_i915_private *i915);
 
 static inline bool i915_ggtt_has_aperture(const struct i915_ggtt *ggtt)
 {
diff --git a/drivers/gpu/drm/i915/gt/intel_ppgtt.c b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
index 4e3d80c2295c..aee3a8929245 100644
--- a/drivers/gpu/drm/i915/gt/intel_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
@@ -307,7 +307,7 @@ void ppgtt_init(struct i915_ppgtt *ppgtt, struct intel_gt *gt)
 	ppgtt->vm.dma = i915->drm.dev;
 	ppgtt->vm.total = BIT_ULL(INTEL_INFO(i915)->ppgtt_size);
 
-	dma_resv_init(&ppgtt->vm.resv);
+	dma_resv_init(&ppgtt->vm._resv);
 	i915_address_space_init(&ppgtt->vm, VM_CLASS_PPGTT);
 
 	ppgtt->vm.vma_ops.bind_vma    = ppgtt_bind_vma;
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 2f06bb7b3ed2..d82a99e128cf 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -631,6 +631,8 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
 	intel_memory_regions_driver_release(dev_priv);
 err_ggtt:
 	i915_ggtt_driver_release(dev_priv);
+	i915_gem_drain_freed_objects(dev_priv);
+	i915_ggtt_driver_late_release(dev_priv);
 err_perf:
 	i915_perf_fini(dev_priv);
 	return ret;
@@ -880,6 +882,8 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	i915_driver_hw_remove(i915);
 	intel_memory_regions_driver_release(i915);
 	i915_ggtt_driver_release(i915);
+	i915_gem_drain_freed_objects(i915);
+	i915_ggtt_driver_late_release(i915);
 out_cleanup_mmio:
 	i915_driver_mmio_release(i915);
 out_runtime_pm_put:
@@ -936,6 +940,7 @@ static void i915_driver_release(struct drm_device *dev)
 	intel_memory_regions_driver_release(dev_priv);
 	i915_ggtt_driver_release(dev_priv);
 	i915_gem_drain_freed_objects(dev_priv);
+	i915_ggtt_driver_late_release(dev_priv);
 
 	i915_driver_mmio_release(dev_priv);
 
-- 
2.31.1

