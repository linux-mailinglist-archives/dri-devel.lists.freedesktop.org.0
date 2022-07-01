Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2565563C90
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jul 2022 00:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E403112633;
	Fri,  1 Jul 2022 22:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065C911257A;
 Fri,  1 Jul 2022 22:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656715878; x=1688251878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZLH8JQJxcaWCLgK45z0WVd/iCslVI4n3VbS623Y3zCo=;
 b=WfmxbBvIxUTJ0xf6dOjLbFuX8xA36lQ5FoLRcBAiZ0aJjP8zDkKVsUxz
 xrx8vjYN4Y9dr2rUM2ZJmhgkk/FTPtJy6abJdUkFACmRCwqoCFl28yDgU
 RBkVuT/f0b5QleSuCSJGOGsEYyNj8lr9mNtJokqr9MDvTT36fSFsS8H6O
 H5tLo3yBakZ7koMZmzaDmr8erPcb4XUNt75cUkNhNbdlzAtJO1XpQZPVM
 5orO4chu+QGGwGPcHyFa0Og6UL7Y7j6Bh008FwaWkTdvfweLJd/qUKiKk
 mbadHhhevLitTGUbdA2ZgnYNywBnVxJO+GUmrSUSPy0n6O9BGZXOEy6p2 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10395"; a="282789047"
X-IronPort-AV: E=Sophos;i="5.92,238,1650956400"; d="scan'208";a="282789047"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 15:51:17 -0700
X-IronPort-AV: E=Sophos;i="5.92,238,1650956400"; d="scan'208";a="918645086"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 01 Jul 2022 15:51:17 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 01/10] drm/i915/vm_bind: Introduce VM_BIND ioctl
Date: Fri,  1 Jul 2022 15:50:46 -0700
Message-Id: <20220701225055.8204-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
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

Add VM_BIND and VM_UNBIND ioctls to bind/unbind a section of an
object at the specified GPU virtual addresses.

Add I915_PARAM_VM_BIND_VERSION to indicate version of VM_BIND feature
supported and I915_VM_CREATE_FLAGS_USE_VM_BIND for UMDs to select the
vm_bind mode of binding.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c |  20 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.h |  15 ++
 drivers/gpu/drm/i915/gt/intel_gtt.h         |   6 +
 drivers/gpu/drm/i915/i915_driver.c          |  30 +++
 drivers/gpu/drm/i915/i915_getparam.c        |   3 +
 include/uapi/drm/i915_drm.h                 | 192 +++++++++++++++++++-
 6 files changed, 248 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index dabdfe09f5e5..e3f5fbf2ac05 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -81,7 +81,6 @@
 
 #include "pxp/intel_pxp.h"
 
-#include "i915_file_private.h"
 #include "i915_gem_context.h"
 #include "i915_trace.h"
 #include "i915_user_extensions.h"
@@ -346,20 +345,6 @@ static int proto_context_register(struct drm_i915_file_private *fpriv,
 	return ret;
 }
 
-static struct i915_address_space *
-i915_gem_vm_lookup(struct drm_i915_file_private *file_priv, u32 id)
-{
-	struct i915_address_space *vm;
-
-	xa_lock(&file_priv->vm_xa);
-	vm = xa_load(&file_priv->vm_xa, id);
-	if (vm)
-		kref_get(&vm->ref);
-	xa_unlock(&file_priv->vm_xa);
-
-	return vm;
-}
-
 static int set_proto_ctx_vm(struct drm_i915_file_private *fpriv,
 			    struct i915_gem_proto_context *pc,
 			    const struct drm_i915_gem_context_param *args)
@@ -1799,7 +1784,7 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (!HAS_FULL_PPGTT(i915))
 		return -ENODEV;
 
-	if (args->flags)
+	if (args->flags & I915_VM_CREATE_FLAGS_UNKNOWN)
 		return -EINVAL;
 
 	ppgtt = i915_ppgtt_create(to_gt(i915), 0);
@@ -1819,6 +1804,9 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (err)
 		goto err_put;
 
+	if (args->flags & I915_VM_CREATE_FLAGS_USE_VM_BIND)
+		ppgtt->vm.vm_bind_mode = true;
+
 	GEM_BUG_ON(id == 0); /* reserved for invalid/unassigned ppgtt */
 	args->vm_id = id;
 	return 0;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
index e5b0f66ea1fe..723bf446c934 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
@@ -12,6 +12,7 @@
 #include "gt/intel_context.h"
 
 #include "i915_drv.h"
+#include "i915_file_private.h"
 #include "i915_gem.h"
 #include "i915_scheduler.h"
 #include "intel_device_info.h"
@@ -139,6 +140,20 @@ int i915_gem_context_setparam_ioctl(struct drm_device *dev, void *data,
 int i915_gem_context_reset_stats_ioctl(struct drm_device *dev, void *data,
 				       struct drm_file *file);
 
+static inline struct i915_address_space *
+i915_gem_vm_lookup(struct drm_i915_file_private *file_priv, u32 id)
+{
+	struct i915_address_space *vm;
+
+	xa_lock(&file_priv->vm_xa);
+	vm = xa_load(&file_priv->vm_xa, id);
+	if (vm)
+		kref_get(&vm->ref);
+	xa_unlock(&file_priv->vm_xa);
+
+	return vm;
+}
+
 struct i915_gem_context *
 i915_gem_context_lookup(struct drm_i915_file_private *file_priv, u32 id);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index e639434e97fd..c812aa9708ae 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -271,6 +271,12 @@ struct i915_address_space {
 	/* Skip pte rewrite on unbind for suspend. Protected by @mutex */
 	bool skip_pte_rewrite:1;
 
+	/**
+	 * true: allow only vm_bind method of binding.
+	 * false: allow only legacy execbuff method of binding.
+	 */
+	bool vm_bind_mode:1;
+
 	u8 top;
 	u8 pd_shift;
 	u8 scratch_order;
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index deb8a8b76965..ccf990dfd99b 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1778,6 +1778,34 @@ i915_gem_reject_pin_ioctl(struct drm_device *dev, void *data,
 	return -ENODEV;
 }
 
+static int i915_gem_vm_bind_ioctl(struct drm_device *dev, void *data,
+				  struct drm_file *file)
+{
+	struct drm_i915_gem_vm_bind *args = data;
+	struct i915_address_space *vm;
+
+	vm = i915_gem_vm_lookup(file->driver_priv, args->vm_id);
+	if (unlikely(!vm))
+		return -ENOENT;
+
+	i915_vm_put(vm);
+	return -EINVAL;
+}
+
+static int i915_gem_vm_unbind_ioctl(struct drm_device *dev, void *data,
+				    struct drm_file *file)
+{
+	struct drm_i915_gem_vm_unbind *args = data;
+	struct i915_address_space *vm;
+
+	vm = i915_gem_vm_lookup(file->driver_priv, args->vm_id);
+	if (unlikely(!vm))
+		return -ENOENT;
+
+	i915_vm_put(vm);
+	return -EINVAL;
+}
+
 static const struct drm_ioctl_desc i915_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(I915_INIT, drm_noop, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
 	DRM_IOCTL_DEF_DRV(I915_FLUSH, drm_noop, DRM_AUTH),
@@ -1838,6 +1866,8 @@ static const struct drm_ioctl_desc i915_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(I915_QUERY, i915_query_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(I915_GEM_VM_CREATE, i915_gem_vm_create_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(I915_GEM_VM_DESTROY, i915_gem_vm_destroy_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(I915_GEM_VM_BIND, i915_gem_vm_bind_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(I915_GEM_VM_UNBIND, i915_gem_vm_unbind_ioctl, DRM_RENDER_ALLOW),
 };
 
 /*
diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
index 6fd15b39570c..c1d53febc5de 100644
--- a/drivers/gpu/drm/i915/i915_getparam.c
+++ b/drivers/gpu/drm/i915/i915_getparam.c
@@ -175,6 +175,9 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 	case I915_PARAM_PERF_REVISION:
 		value = i915_perf_ioctl_version();
 		break;
+	case I915_PARAM_VM_BIND_VERSION:
+		value = GRAPHICS_VER(i915) >= 12 ? 1 : 0;
+		break;
 	default:
 		DRM_DEBUG("Unknown parameter %d\n", param->param);
 		return -EINVAL;
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 3e78a00220ea..26cca49717f8 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -470,6 +470,8 @@ typedef struct _drm_i915_sarea {
 #define DRM_I915_GEM_VM_CREATE		0x3a
 #define DRM_I915_GEM_VM_DESTROY		0x3b
 #define DRM_I915_GEM_CREATE_EXT		0x3c
+#define DRM_I915_GEM_VM_BIND		0x3d
+#define DRM_I915_GEM_VM_UNBIND		0x3e
 /* Must be kept compact -- no holes */
 
 #define DRM_IOCTL_I915_INIT		DRM_IOW( DRM_COMMAND_BASE + DRM_I915_INIT, drm_i915_init_t)
@@ -534,6 +536,8 @@ typedef struct _drm_i915_sarea {
 #define DRM_IOCTL_I915_QUERY			DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_QUERY, struct drm_i915_query)
 #define DRM_IOCTL_I915_GEM_VM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_CREATE, struct drm_i915_gem_vm_control)
 #define DRM_IOCTL_I915_GEM_VM_DESTROY	DRM_IOW (DRM_COMMAND_BASE + DRM_I915_GEM_VM_DESTROY, struct drm_i915_gem_vm_control)
+#define DRM_IOCTL_I915_GEM_VM_BIND	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_BIND, struct drm_i915_gem_vm_bind)
+#define DRM_IOCTL_I915_GEM_VM_UNBIND	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_UNBIND, struct drm_i915_gem_vm_unbind)
 
 /* Allow drivers to submit batchbuffers directly to hardware, relying
  * on the security mechanisms provided by hardware.
@@ -749,6 +753,25 @@ typedef struct drm_i915_irq_wait {
 /* Query if the kernel supports the I915_USERPTR_PROBE flag. */
 #define I915_PARAM_HAS_USERPTR_PROBE 56
 
+/*
+ * VM_BIND feature version supported.
+ *
+ * The following versions of VM_BIND have been defined:
+ *
+ * 0: No VM_BIND support.
+ *
+ * 1: In VM_UNBIND calls, the UMD must specify the exact mappings created
+ *    previously with VM_BIND, the ioctl will not support unbinding multiple
+ *    mappings or splitting them. Similarly, VM_BIND calls will not replace
+ *    any existing mappings.
+ *
+ * 2: The restrictions on unbinding partial or multiple mappings is
+ *    lifted, Similarly, binding will replace any mappings in the given range.
+ *
+ * See struct drm_i915_gem_vm_bind and struct drm_i915_gem_vm_unbind.
+ */
+#define I915_PARAM_VM_BIND_VERSION	57
+
 /* Must be kept compact -- no holes and well documented */
 
 typedef struct drm_i915_getparam {
@@ -1441,6 +1464,41 @@ struct drm_i915_gem_execbuffer2 {
 #define i915_execbuffer2_get_context_id(eb2) \
 	((eb2).rsvd1 & I915_EXEC_CONTEXT_ID_MASK)
 
+/**
+ * struct drm_i915_gem_timeline_fence - An input or output timeline fence.
+ *
+ * The operation will wait for input fence to signal.
+ *
+ * The returned output fence will be signaled after the completion of the
+ * operation.
+ */
+struct drm_i915_gem_timeline_fence {
+	/** @handle: User's handle for a drm_syncobj to wait on or signal. */
+	__u32 handle;
+
+	/**
+	 * @flags: Supported flags are:
+	 *
+	 * I915_TIMELINE_FENCE_WAIT:
+	 * Wait for the input fence before the operation.
+	 *
+	 * I915_TIMELINE_FENCE_SIGNAL:
+	 * Return operation completion fence as output.
+	 */
+	__u32 flags;
+#define I915_TIMELINE_FENCE_WAIT            (1 << 0)
+#define I915_TIMELINE_FENCE_SIGNAL          (1 << 1)
+#define __I915_TIMELINE_FENCE_UNKNOWN_FLAGS (-(I915_TIMELINE_FENCE_SIGNAL << 1))
+
+	/**
+	 * @value: A point in the timeline.
+	 * Value must be 0 for a binary drm_syncobj. A Value of 0 for a
+	 * timeline drm_syncobj is invalid as it turns a drm_syncobj into a
+	 * binary one.
+	 */
+	__u64 value;
+};
+
 struct drm_i915_gem_pin {
 	/** Handle of the buffer to be pinned. */
 	__u32 handle;
@@ -2397,8 +2455,6 @@ struct drm_i915_gem_context_destroy {
  * The id of new VM (bound to the fd) for use with I915_CONTEXT_PARAM_VM is
  * returned in the outparam @id.
  *
- * No flags are defined, with all bits reserved and must be zero.
- *
  * An extension chain maybe provided, starting with @extensions, and terminated
  * by the @next_extension being 0. Currently, no extensions are defined.
  *
@@ -2410,6 +2466,10 @@ struct drm_i915_gem_context_destroy {
  */
 struct drm_i915_gem_vm_control {
 	__u64 extensions;
+
+#define I915_VM_CREATE_FLAGS_USE_VM_BIND	(1u << 0)
+#define I915_VM_CREATE_FLAGS_UNKNOWN \
+	(-(I915_VM_CREATE_FLAGS_USE_VM_BIND << 1))
 	__u32 flags;
 	__u32 vm_id;
 };
@@ -3602,6 +3662,134 @@ struct drm_i915_gem_create_ext_protected_content {
 /* ID of the protected content session managed by i915 when PXP is active */
 #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
 
+/**
+ * struct drm_i915_gem_vm_bind - VA to object mapping to bind.
+ *
+ * This structure is passed to VM_BIND ioctl and specifies the mapping of GPU
+ * virtual address (VA) range to the section of an object that should be bound
+ * in the device page table of the specified address space (VM).
+ * The VA range specified must be unique (ie., not currently bound) and can
+ * be mapped to whole object or a section of the object (partial binding).
+ * Multiple VA mappings can be created to the same section of the object
+ * (aliasing).
+ *
+ * The @start, @offset and @length must be 4K page aligned. However the DG2
+ * and XEHPSDV has 64K page size for device local memory and has compact page
+ * table. On those platforms, for binding device local-memory objects, the
+ * @start, @offset and @length must be 64K aligned. Also, UMDs should not mix
+ * the local memory 64K page and the system memory 4K page bindings in the same
+ * 2M range.
+ *
+ * Error code -EINVAL will be returned if @start, @offset and @length are not
+ * properly aligned. In version 1 (See I915_PARAM_VM_BIND_VERSION), error code
+ * -ENOSPC will be returned if the VA range specified can't be reserved.
+ *
+ * VM_BIND/UNBIND ioctl calls executed on different CPU threads concurrently
+ * are not ordered. Furthermore, parts of the VM_BIND operation can be done
+ * asynchronously, if valid @fence is specified.
+ */
+struct drm_i915_gem_vm_bind {
+	/** @vm_id: VM (address space) id to bind */
+	__u32 vm_id;
+
+	/** @handle: Object handle */
+	__u32 handle;
+
+	/** @start: Virtual Address start to bind */
+	__u64 start;
+
+	/** @offset: Offset in object to bind */
+	__u64 offset;
+
+	/** @length: Length of mapping to bind */
+	__u64 length;
+
+	/**
+	 * @flags: Currently reserved, MBZ.
+	 *
+	 * Note that @fence carries its own flags.
+	 */
+	__u64 flags;
+
+	/**
+	 * @fence: Timeline fence for bind completion signaling.
+	 *
+	 * Timeline fence is of format struct drm_i915_gem_timeline_fence.
+	 *
+	 * It is an out fence, hence using I915_TIMELINE_FENCE_WAIT flag
+	 * is invalid, and an error will be returned.
+	 *
+	 * If I915_TIMELINE_FENCE_SIGNAL flag is not set, then out fence
+	 * is not requested and binding is completed synchronously.
+	 */
+	struct drm_i915_gem_timeline_fence fence;
+
+	/**
+	 * @extensions: Zero-terminated chain of extensions.
+	 *
+	 * For future extensions. See struct i915_user_extension.
+	 */
+	__u64 extensions;
+};
+
+/**
+ * struct drm_i915_gem_vm_unbind - VA to object mapping to unbind.
+ *
+ * This structure is passed to VM_UNBIND ioctl and specifies the GPU virtual
+ * address (VA) range that should be unbound from the device page table of the
+ * specified address space (VM). VM_UNBIND will force unbind the specified
+ * range from device page table without waiting for any GPU job to complete.
+ * It is UMDs responsibility to ensure the mapping is no longer in use before
+ * calling VM_UNBIND.
+ *
+ * If the specified mapping is not found, the ioctl will simply return without
+ * any error.
+ *
+ * VM_BIND/UNBIND ioctl calls executed on different CPU threads concurrently
+ * are not ordered. Furthermore, parts of the VM_UNBIND operation can be done
+ * asynchronously, if valid @fence is specified.
+ */
+struct drm_i915_gem_vm_unbind {
+	/** @vm_id: VM (address space) id to bind */
+	__u32 vm_id;
+
+	/** @rsvd: Reserved, MBZ */
+	__u32 rsvd;
+
+	/** @start: Virtual Address start to unbind */
+	__u64 start;
+
+	/** @length: Length of mapping to unbind */
+	__u64 length;
+
+	/**
+	 * @flags: Currently reserved, MBZ.
+	 *
+	 * Note that @fence carries its own flags.
+	 */
+	__u64 flags;
+
+	/**
+	 * @fence: Timeline fence for unbind completion signaling.
+	 *
+	 * Timeline fence is of format struct drm_i915_gem_timeline_fence.
+	 *
+	 * It is an out fence, hence using I915_TIMELINE_FENCE_WAIT flag
+	 * is invalid, and an error will be returned.
+	 *
+	 * If I915_TIMELINE_FENCE_SIGNAL flag is not set, then out fence
+	 * is not requested and unbinding is completed synchronously.
+	 */
+	struct drm_i915_gem_timeline_fence fence;
+
+	/**
+	 * @extensions: Zero-terminated chain of extensions.
+	 *
+	 * For future extensions. See struct i915_user_extension.
+	 */
+	__u64 extensions;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.21.0.rc0.32.g243a4c7e27

