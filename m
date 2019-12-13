Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E0811ED72
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 23:07:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF1D6EDED;
	Fri, 13 Dec 2019 22:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938E06EDE7;
 Fri, 13 Dec 2019 22:07:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 14:07:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,311,1571727600"; d="scan'208";a="216558874"
Received: from nvishwa1-desk.sc.intel.com ([10.3.160.185])
 by orsmga006.jf.intel.com with ESMTP; 13 Dec 2019 14:07:28 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC v2 03/12] drm/i915/svm: Implicitly migrate BOs upon CPU access
Date: Fri, 13 Dec 2019 13:56:05 -0800
Message-Id: <20191213215614.24558-4-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20191213215614.24558-1-niranjana.vishwanathapura@intel.com>
References: <20191213215614.24558-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
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
Cc: kenneth.w.graunke@intel.com, sanjay.k.kumar@intel.com,
 sudeep.dutt@intel.com, dri-devel@lists.freedesktop.org,
 jason.ekstrand@intel.com, dave.hansen@intel.com, jglisse@redhat.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, dan.j.williams@intel.com,
 ira.weiny@intel.com, jgg@mellanox.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>

As PCIe is non-coherent link, do not allow direct access to buffer
objects across the PCIe link for SVM case. Upon CPU accesses (mmap, pread),
migrate buffer object to host memory.

Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sudeep Dutt <sudeep.dutt@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c   | 10 ++++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 29 +++++++++++++++++-----
 drivers/gpu/drm/i915/gem/i915_gem_object.h |  3 +++
 drivers/gpu/drm/i915/intel_memory_region.c |  4 ---
 drivers/gpu/drm/i915/intel_memory_region.h |  4 +++
 5 files changed, 40 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 879fff8adc48..fc1a11f0bec9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -14,6 +14,7 @@
 #include "i915_drv.h"
 #include "i915_gem_gtt.h"
 #include "i915_gem_ioctls.h"
+#include "i915_gem_lmem.h"
 #include "i915_gem_object.h"
 #include "i915_gem_mman.h"
 #include "i915_trace.h"
@@ -295,6 +296,15 @@ static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
 	if (i915_gem_object_is_readonly(obj) && write)
 		return VM_FAULT_SIGBUS;
 
+	/* Implicitly migrate BO to SMEM if it is SVM mapped */
+	if (i915_gem_object_svm_mapped(obj) && i915_gem_object_is_lmem(obj)) {
+		u32 regions[] = { REGION_MAP(INTEL_MEMORY_SYSTEM, 0) };
+
+		ret = i915_gem_object_migrate_region(obj, regions, 1);
+		if (ret)
+			goto err;
+	}
+
 	/* We don't use vmf->pgoff since that has the fake offset */
 	page_offset = (vmf->address - area->vm_start) >> PAGE_SHIFT;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 025c26266801..003d81c171d2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -517,12 +517,17 @@ __region_id(u32 region)
 	return INTEL_REGION_UNKNOWN;
 }
 
+bool
+i915_gem_object_svm_mapped(struct drm_i915_gem_object *obj)
+{
+	return false;
+}
+
 static int i915_gem_object_region_select(struct drm_i915_private *dev_priv,
 					 struct drm_i915_gem_object_param *args,
 					 struct drm_file *file,
 					 struct drm_i915_gem_object *obj)
 {
-	struct intel_context *ce = dev_priv->engine[BCS0]->kernel_context;
 	u32 __user *uregions = u64_to_user_ptr(args->data);
 	u32 uregions_copy[INTEL_REGION_UNKNOWN];
 	int i, ret;
@@ -542,16 +547,28 @@ static int i915_gem_object_region_select(struct drm_i915_private *dev_priv,
 		++uregions;
 	}
 
+	ret = i915_gem_object_migrate_region(obj, uregions_copy,
+					     args->size);
+
+	return ret;
+}
+
+int i915_gem_object_migrate_region(struct drm_i915_gem_object *obj,
+				   u32 *regions, int size)
+{
+	struct drm_i915_private *dev_priv = to_i915(obj->base.dev);
+	struct intel_context *ce = dev_priv->engine[BCS0]->kernel_context;
+	int i, ret;
+
 	mutex_lock(&dev_priv->drm.struct_mutex);
 	ret = i915_gem_object_prepare_move(obj);
 	if (ret) {
 		DRM_ERROR("Cannot set memory region, object in use\n");
-	        goto err;
+		goto err;
 	}
 
-	for (i = 0; i < args->size; i++) {
-		u32 region = uregions_copy[i];
-		enum intel_region_id id = __region_id(region);
+	for (i = 0; i < size; i++) {
+		enum intel_region_id id = __region_id(regions[i]);
 
 		if (id == INTEL_REGION_UNKNOWN) {
 			ret = -EINVAL;
@@ -561,7 +578,7 @@ static int i915_gem_object_region_select(struct drm_i915_private *dev_priv,
 		ret = i915_gem_object_migrate(obj, ce, id);
 		if (!ret) {
 			if (!i915_gem_object_has_pages(obj) &&
-			    MEMORY_TYPE_FROM_REGION(region) ==
+			    MEMORY_TYPE_FROM_REGION(regions[i]) ==
 			    INTEL_MEMORY_LOCAL) {
 				/*
 				 * TODO: this should be part of get_pages(),
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 87e6b6f18d91..6d8ca3f0ccf7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -47,6 +47,9 @@ int i915_gem_object_prepare_move(struct drm_i915_gem_object *obj);
 int i915_gem_object_migrate(struct drm_i915_gem_object *obj,
 			    struct intel_context *ce,
 			    enum intel_region_id id);
+bool i915_gem_object_svm_mapped(struct drm_i915_gem_object *obj);
+int i915_gem_object_migrate_region(struct drm_i915_gem_object *obj,
+				   u32 *uregions, int size);
 
 void i915_gem_flush_free_objects(struct drm_i915_private *i915);
 
diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index baaeaecc64af..049a1b482d9d 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -6,10 +6,6 @@
 #include "intel_memory_region.h"
 #include "i915_drv.h"
 
-/* XXX: Hysterical raisins. BIT(inst) needs to just be (inst) at some point. */
-#define REGION_MAP(type, inst) \
-	BIT((type) + INTEL_MEMORY_TYPE_SHIFT) | BIT(inst)
-
 const u32 intel_region_map[] = {
 	[INTEL_REGION_SMEM] = REGION_MAP(INTEL_MEMORY_SYSTEM, 0),
 	[INTEL_REGION_LMEM] = REGION_MAP(INTEL_MEMORY_LOCAL, 0),
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index 238722009677..e3e8ab946d78 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -44,6 +44,10 @@ enum intel_region_id {
 #define MEMORY_TYPE_FROM_REGION(r) (ilog2((r) >> INTEL_MEMORY_TYPE_SHIFT))
 #define MEMORY_INSTANCE_FROM_REGION(r) (ilog2((r) & 0xffff))
 
+/* XXX: Hysterical raisins. BIT(inst) needs to just be (inst) at some point. */
+#define REGION_MAP(type, inst) \
+	BIT((type) + INTEL_MEMORY_TYPE_SHIFT) | BIT(inst)
+
 #define I915_ALLOC_MIN_PAGE_SIZE  BIT(0)
 #define I915_ALLOC_CONTIGUOUS     BIT(1)
 
-- 
2.21.0.rc0.32.g243a4c7e27

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
