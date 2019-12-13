Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 020B511ED7F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 23:08:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248C26EDFC;
	Fri, 13 Dec 2019 22:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F556EDF4;
 Fri, 13 Dec 2019 22:07:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 14:07:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,311,1571727600"; d="scan'208";a="216558930"
Received: from nvishwa1-desk.sc.intel.com ([10.3.160.185])
 by orsmga006.jf.intel.com with ESMTP; 13 Dec 2019 14:07:34 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC v2 11/12] drm/i915/svm: Add support to en/disable SVM
Date: Fri, 13 Dec 2019 13:56:13 -0800
Message-Id: <20191213215614.24558-12-niranjana.vishwanathapura@intel.com>
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

Add SVM as a capability and allow user to enable/disable SVM
functionality on a per context basis.

Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sudeep Dutt <sudeep.dutt@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 95 ++++++++++++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_context.h   |  2 +
 .../gpu/drm/i915/gem/i915_gem_context_types.h |  1 +
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  6 ++
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 11 +++
 drivers/gpu/drm/i915/i915_drv.c               |  4 +-
 drivers/gpu/drm/i915/i915_drv.h               | 10 ++
 drivers/gpu/drm/i915/i915_getparam.c          |  3 +
 include/uapi/drm/i915_drm.h                   | 17 ++++
 9 files changed, 145 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index d91975efc940..7db09c8bacb5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -77,6 +77,7 @@
 
 #include "i915_gem_context.h"
 #include "i915_globals.h"
+#include "i915_svm.h"
 #include "i915_trace.h"
 #include "i915_user_extensions.h"
 #include "i915_gem_ioctls.h"
@@ -961,6 +962,78 @@ int i915_gem_vm_destroy_ioctl(struct drm_device *dev, void *data,
 	return 0;
 }
 
+static int i915_gem_vm_setparam_ioctl(struct drm_device *dev, void *data,
+				      struct drm_file *file)
+{
+	struct drm_i915_file_private *file_priv = file->driver_priv;
+	struct drm_i915_gem_vm_param *args = data;
+	struct i915_address_space *vm;
+	int err = 0;
+	u32 id;
+
+	id = args->vm_id;
+	if (!id)
+		return -ENOENT;
+
+	err = mutex_lock_interruptible(&file_priv->vm_idr_lock);
+	if (err)
+		return err;
+
+	vm = idr_find(&file_priv->vm_idr, id);
+
+	mutex_unlock(&file_priv->vm_idr_lock);
+	if (!vm)
+		return -ENOENT;
+
+	switch (lower_32_bits(args->param)) {
+	case I915_GEM_VM_PARAM_SVM:
+		/* FIXME: Ensure ppgtt is empty before switching */
+		if (!i915_has_svm(file_priv->dev_priv))
+			err = -ENOTSUPP;
+		else if (args->value)
+			err = i915_svm_bind_mm(vm);
+		else
+			i915_svm_unbind_mm(vm);
+		break;
+	default:
+		err = -EINVAL;
+	}
+	return err;
+}
+
+static int i915_gem_vm_getparam_ioctl(struct drm_device *dev, void *data,
+				      struct drm_file *file)
+{
+	struct drm_i915_file_private *file_priv = file->driver_priv;
+	struct drm_i915_gem_vm_param *args = data;
+	struct i915_address_space *vm;
+	int err = 0;
+	u32 id;
+
+	id = args->vm_id;
+	if (!id)
+		return -ENOENT;
+
+	err = mutex_lock_interruptible(&file_priv->vm_idr_lock);
+	if (err)
+		return err;
+
+	vm = idr_find(&file_priv->vm_idr, id);
+
+	mutex_unlock(&file_priv->vm_idr_lock);
+	if (!vm)
+		return -ENOENT;
+
+	switch (lower_32_bits(args->param)) {
+	case I915_GEM_VM_PARAM_SVM:
+		args->value = i915_vm_is_svm_enabled(vm);
+		break;
+	default:
+		err = -EINVAL;
+	}
+	return err;
+}
+
 struct context_barrier_task {
 	struct i915_active base;
 	void (*task)(void *data);
@@ -2382,6 +2455,21 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
 	return ret;
 }
 
+int i915_gem_getparam_ioctl(struct drm_device *dev, void *data,
+			    struct drm_file *file)
+{
+	struct drm_i915_gem_context_param *args = data;
+	u32 class = upper_32_bits(args->param);
+
+	switch (class) {
+	case 0:
+		return i915_gem_context_getparam_ioctl(dev, data, file);
+	case 2:
+		return i915_gem_vm_getparam_ioctl(dev, data, file);
+	}
+	return -EINVAL;
+}
+
 int i915_gem_context_setparam_ioctl(struct drm_device *dev, void *data,
 				    struct drm_file *file)
 {
@@ -2404,14 +2492,15 @@ int i915_gem_setparam_ioctl(struct drm_device *dev, void *data,
 			    struct drm_file *file)
 {
 	struct drm_i915_gem_context_param *args = data;
-	u32 object_class = upper_32_bits(args->param);
+	u32 class = upper_32_bits(args->param);
 
-	switch (object_class) {
+	switch (class) {
 	case 0:
 		return i915_gem_context_setparam_ioctl(dev, data, file);
 	case 1:
 		return i915_gem_object_setparam_ioctl(dev, data, file);
-
+	case 2:
+		return i915_gem_vm_setparam_ioctl(dev, data, file);
 	}
 	return -EINVAL;
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
index 0b17636cfea2..59eedb9e8ae5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
@@ -175,6 +175,8 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
 				    struct drm_file *file_priv);
 int i915_gem_context_setparam_ioctl(struct drm_device *dev, void *data,
 				    struct drm_file *file_priv);
+int i915_gem_getparam_ioctl(struct drm_device *dev, void *data,
+			    struct drm_file *file);
 int i915_gem_setparam_ioctl(struct drm_device *dev, void *data,
 			    struct drm_file *file);
 int i915_gem_context_reset_stats_ioctl(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index 69df5459c350..edda953a4d96 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -129,6 +129,7 @@ struct i915_gem_context {
 #define UCONTEXT_BANNABLE		2
 #define UCONTEXT_RECOVERABLE		3
 #define UCONTEXT_PERSISTENCE		4
+#define UCONTEXT_SVM_ENABLED		5
 
 	/**
 	 * @flags: small set of booleans
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index af360238a392..a7ac24de2017 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -25,6 +25,7 @@
 #include "i915_gem_clflush.h"
 #include "i915_gem_context.h"
 #include "i915_gem_ioctls.h"
+#include "i915_svm.h"
 #include "i915_trace.h"
 
 enum {
@@ -443,6 +444,11 @@ eb_validate_vma(struct i915_execbuffer *eb,
 	if (unlikely(entry->alignment && !is_power_of_2(entry->alignment)))
 		return -EINVAL;
 
+	/* Only allow user PINNED addresses for SVM enabled contexts */
+	if (unlikely(i915_vm_is_svm_enabled(eb->gem_context->vm) &&
+		     !(entry->flags & EXEC_OBJECT_PINNED)))
+		return -EINVAL;
+
 	/*
 	 * Offset can be used as input (EXEC_OBJECT_PINNED), reject
 	 * any non-page-aligned or non-canonical addresses.
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index f868a301fc04..cfad5b9f9bb9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -36,6 +36,7 @@
 #include "i915_gem_object_blt.h"
 #include "i915_gem_region.h"
 #include "i915_globals.h"
+#include "i915_svm.h"
 #include "i915_trace.h"
 
 static struct i915_global_object {
@@ -507,6 +508,16 @@ int __init i915_global_objects_init(void)
 bool
 i915_gem_object_svm_mapped(struct drm_i915_gem_object *obj)
 {
+	struct i915_vma *vma;
+
+	spin_lock(&obj->vma.lock);
+	list_for_each_entry(vma, &obj->vma.list, obj_link)
+		if (i915_vm_is_svm_enabled(vma->vm)) {
+			spin_unlock(&obj->vma.lock);
+			return true;
+		}
+
+	spin_unlock(&obj->vma.lock);
 	return false;
 }
 
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index f1b92fd3d234..e6b826e80d55 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -2692,6 +2692,8 @@ static int i915_gem_vm_bind_ioctl(struct drm_device *dev, void *data,
 	vm = i915_gem_address_space_lookup(file->driver_priv, args->vm_id);
 	if (unlikely(!vm))
 		return -ENOENT;
+	if (unlikely(!i915_vm_is_svm_enabled(vm)))
+		return -ENOTSUPP;
 
 	switch (args->type) {
 	case I915_GEM_VM_BIND_SVM_OBJ:
@@ -2756,7 +2758,7 @@ static const struct drm_ioctl_desc i915_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(I915_REG_READ, i915_reg_read_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(I915_GET_RESET_STATS, i915_gem_context_reset_stats_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(I915_GEM_USERPTR, i915_gem_userptr_ioctl, DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(I915_GEM_CONTEXT_GETPARAM, i915_gem_context_getparam_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(I915_GEM_CONTEXT_GETPARAM, i915_gem_getparam_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(I915_GEM_CONTEXT_SETPARAM, i915_gem_setparam_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(I915_PERF_OPEN, i915_perf_open_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(I915_PERF_ADD_CONFIG, i915_perf_add_config_ioctl, DRM_RENDER_ALLOW),
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 2d0a7cd2dc44..365f67a77171 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -38,6 +38,7 @@
 #include <linux/i2c-algo-bit.h>
 #include <linux/backlight.h>
 #include <linux/hash.h>
+#include <linux/hmm.h>
 #include <linux/intel-iommu.h>
 #include <linux/kref.h>
 #include <linux/mm_types.h>
@@ -1736,6 +1737,15 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 /* Only valid when HAS_DISPLAY() is true */
 #define INTEL_DISPLAY_ENABLED(dev_priv) (WARN_ON(!HAS_DISPLAY(dev_priv)), !i915_modparams.disable_display)
 
+static inline bool i915_has_svm(struct drm_i915_private *dev_priv)
+{
+#ifdef CONFIG_DRM_I915_SVM
+	return INTEL_GEN(dev_priv) >= 8;
+#else
+	return false;
+#endif
+}
+
 static inline bool intel_vtd_active(void)
 {
 #ifdef CONFIG_INTEL_IOMMU
diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
index 54fce81d5724..c35402103e0f 100644
--- a/drivers/gpu/drm/i915/i915_getparam.c
+++ b/drivers/gpu/drm/i915/i915_getparam.c
@@ -161,6 +161,9 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 	case I915_PARAM_PERF_REVISION:
 		value = i915_perf_ioctl_version();
 		break;
+	case I915_PARAM_HAS_SVM:
+		value = i915_has_svm(i915);
+		break;
 	default:
 		DRM_DEBUG("Unknown parameter %d\n", param->param);
 		return -EINVAL;
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index f49e29716460..1ebcba014908 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -360,6 +360,8 @@ typedef struct _drm_i915_sarea {
 #define DRM_I915_GEM_VM_CREATE		0x3a
 #define DRM_I915_GEM_VM_DESTROY		0x3b
 #define DRM_I915_GEM_OBJECT_SETPARAM	DRM_I915_GEM_CONTEXT_SETPARAM
+#define DRM_I915_GEM_VM_GETPARAM        DRM_I915_GEM_CONTEXT_GETPARAM
+#define DRM_I915_GEM_VM_SETPARAM        DRM_I915_GEM_CONTEXT_SETPARAM
 #define DRM_I915_GEM_VM_BIND		0x3c
 #define DRM_I915_GEM_VM_PREFETCH	0x3d
 /* Must be kept compact -- no holes */
@@ -426,6 +428,8 @@ typedef struct _drm_i915_sarea {
 #define DRM_IOCTL_I915_GEM_VM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_CREATE, struct drm_i915_gem_vm_control)
 #define DRM_IOCTL_I915_GEM_VM_DESTROY	DRM_IOW (DRM_COMMAND_BASE + DRM_I915_GEM_VM_DESTROY, struct drm_i915_gem_vm_control)
 #define DRM_IOCTL_I915_GEM_OBJECT_SETPARAM	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_OBJECT_SETPARAM, struct drm_i915_gem_object_param)
+#define DRM_IOCTL_I915_GEM_VM_GETPARAM		DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_GETPARAM, struct drm_i915_gem_vm_param)
+#define DRM_IOCTL_I915_GEM_VM_SETPARAM		DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_SETPARAM, struct drm_i915_gem_vm_param)
 #define DRM_IOCTL_I915_GEM_VM_BIND		DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_BIND, struct drm_i915_gem_vm_bind)
 #define DRM_IOCTL_I915_GEM_VM_PREFETCH		DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_PREFETCH, struct drm_i915_gem_vm_prefetch)
 
@@ -625,6 +629,8 @@ typedef struct drm_i915_irq_wait {
  */
 #define I915_PARAM_PERF_REVISION	54
 
+/* Shared Virtual Memory (SVM) support capability */
+#define I915_PARAM_HAS_SVM	55
 /* Must be kept compact -- no holes and well documented */
 
 typedef struct drm_i915_getparam {
@@ -1851,6 +1857,17 @@ struct drm_i915_gem_vm_control {
 	__u32 vm_id;
 };
 
+struct drm_i915_gem_vm_param {
+	__u32 vm_id;
+	__u32 rsvd;
+
+#define I915_VM_PARAM     (2ull << 32)
+#define I915_GEM_VM_PARAM_SVM   0x1
+	__u64 param;
+
+	__u64 value;
+};
+
 struct drm_i915_reg_read {
 	/*
 	 * Register offset.
-- 
2.21.0.rc0.32.g243a4c7e27

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
