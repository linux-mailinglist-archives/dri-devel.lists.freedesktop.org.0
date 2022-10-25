Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AD560C489
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 09:00:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B9B10E1F3;
	Tue, 25 Oct 2022 06:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3724B10E184;
 Tue, 25 Oct 2022 06:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666681156; x=1698217156;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vd1wKHWfdbambfh+et494LFmQgEqcsffcM2k9OqCC9I=;
 b=jurvd5qD4Y67Mr5Jc/1qHUY02o8TT/y8h//IUhkRkKq5BbFjRgaqgDlR
 PmOMz0+JJy7Y0BRzCYqV7Usnt8qsRxNT5sFX5tt0bKtwXdvGfNxIG2AcY
 QMdMUkd0SBW3u/jqbWD/qu7xOXwXtR+pzVkwqxZvDWIIfkku2GMgbhfKz
 Gjg/wtQVp7MpOtPUqkJ7slq+afQEyAxD1EIxNFg00EYMIjrnLT6/NdxZ9
 vLFv3nOq1PnWQAaFqb5bSKfC3IDFNq7S/eKr+wiP4aETTtXfjG1+c8CIz
 nR5bgJkWEse/GmdDmYouHyzWp0YbdKbZdHyAfdE3FQ5l+jIWos5UPhjKz A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="308697611"
X-IronPort-AV: E=Sophos;i="5.95,211,1661842800"; d="scan'208";a="308697611"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 23:59:16 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="806564445"
X-IronPort-AV: E=Sophos;i="5.95,211,1661842800"; d="scan'208";a="806564445"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 23:59:15 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 18/19] drm/i915/vm_bind: Add uapi for user to enable
 vm_bind_mode
Date: Mon, 24 Oct 2022 23:59:04 -0700
Message-Id: <20221025065905.13325-19-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20221025065905.13325-1-niranjana.vishwanathapura@intel.com>
References: <20221025065905.13325-1-niranjana.vishwanathapura@intel.com>
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

Add getparam support for VM_BIND capability version.
Add VM creation time flag to enable vm_bind_mode for the VM.

v2: update kernel-doc
v3: create vm->root_obj only upon I915_VM_CREATE_FLAGS_USE_VM_BIND
v4: replace vm->vm_bind_mode check with i915_gem_vm_is_vm_bind_mode()

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 25 ++++++++++++++++++--
 drivers/gpu/drm/i915/gem/i915_gem_context.h |  3 +--
 drivers/gpu/drm/i915/gt/intel_gtt.c         |  2 ++
 drivers/gpu/drm/i915/i915_drv.h             |  2 ++
 drivers/gpu/drm/i915/i915_getparam.c        |  3 +++
 include/uapi/drm/i915_drm.h                 | 26 ++++++++++++++++++++-
 6 files changed, 56 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 9a7eaa574966..072efb32892c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1809,9 +1809,13 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (!HAS_FULL_PPGTT(i915))
 		return -ENODEV;
 
-	if (args->flags)
+	if (args->flags & I915_VM_CREATE_FLAGS_UNKNOWN)
 		return -EINVAL;
 
+	if ((args->flags & I915_VM_CREATE_FLAGS_USE_VM_BIND) &&
+	    !HAS_VM_BIND(i915))
+		return -EOPNOTSUPP;
+
 	ppgtt = i915_ppgtt_create(to_gt(i915), 0);
 	if (IS_ERR(ppgtt))
 		return PTR_ERR(ppgtt);
@@ -1824,15 +1828,32 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev, void *data,
 			goto err_put;
 	}
 
+	if (args->flags & I915_VM_CREATE_FLAGS_USE_VM_BIND) {
+		struct drm_i915_gem_object *obj;
+
+		obj = i915_gem_object_create_internal(i915, PAGE_SIZE);
+		if (IS_ERR(obj)) {
+			err = PTR_ERR(obj);
+			goto err_put;
+		}
+
+		ppgtt->vm.root_obj = obj;
+	}
+
 	err = xa_alloc(&file_priv->vm_xa, &id, &ppgtt->vm,
 		       xa_limit_32b, GFP_KERNEL);
 	if (err)
-		goto err_put;
+		goto err_root_obj_put;
 
 	GEM_BUG_ON(id == 0); /* reserved for invalid/unassigned ppgtt */
 	args->vm_id = id;
 	return 0;
 
+err_root_obj_put:
+	if (ppgtt->vm.root_obj) {
+		i915_gem_object_put(ppgtt->vm.root_obj);
+		ppgtt->vm.root_obj = NULL;
+	}
 err_put:
 	i915_vm_put(&ppgtt->vm);
 	return err;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
index e8b41aa8f8c4..b53aef2853cb 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
@@ -150,8 +150,7 @@ int i915_gem_context_reset_stats_ioctl(struct drm_device *dev, void *data,
  */
 static inline bool i915_gem_vm_is_vm_bind_mode(struct i915_address_space *vm)
 {
-	/* No support to enable vm_bind mode yet */
-	return false;
+	return !!vm->root_obj;
 }
 
 struct i915_address_space *
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index 50648ab9214a..ae66fdd4bce9 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -178,6 +178,8 @@ int i915_vm_lock_objects(struct i915_address_space *vm,
 void i915_address_space_fini(struct i915_address_space *vm)
 {
 	drm_mm_takedown(&vm->mm);
+	if (vm->root_obj)
+		i915_gem_object_put(vm->root_obj);
 	GEM_BUG_ON(!RB_EMPTY_ROOT(&vm->va.rb_root));
 	mutex_destroy(&vm->vm_bind_lock);
 }
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index d7b8eb9d4117..481590dffbce 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -972,6 +972,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define HAS_LMEMBAR_SMEM_STOLEN(i915) (!HAS_LMEM(i915) && \
 				       GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
 
+#define HAS_VM_BIND(i915) (GRAPHICS_VER(i915) >= 12)
+
 /* intel_device_info.c */
 static inline struct intel_device_info *
 mkwrite_device_info(struct drm_i915_private *dev_priv)
diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
index 342c8ca6414e..f45b3c684bcf 100644
--- a/drivers/gpu/drm/i915/i915_getparam.c
+++ b/drivers/gpu/drm/i915/i915_getparam.c
@@ -175,6 +175,9 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 	case I915_PARAM_PERF_REVISION:
 		value = i915_perf_ioctl_version();
 		break;
+	case I915_PARAM_VM_BIND_VERSION:
+		value = HAS_VM_BIND(i915);
+		break;
 	default:
 		DRM_DEBUG("Unknown parameter %d\n", param->param);
 		return -EINVAL;
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 26eef1a24052..743888b3f0f0 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -771,6 +771,22 @@ typedef struct drm_i915_irq_wait {
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
+ * See struct drm_i915_gem_vm_bind and struct drm_i915_gem_vm_unbind.
+ */
+#define I915_PARAM_VM_BIND_VERSION	57
+
 /* Must be kept compact -- no holes and well documented */
 
 /**
@@ -2638,7 +2654,15 @@ struct drm_i915_gem_vm_control {
 	/** @extensions: Zero-terminated chain of extensions. */
 	__u64 extensions;
 
-	/** @flags: reserved for future usage, currently MBZ */
+	/**
+	 * @flags: Supported flags are,
+	 *
+	 * I915_VM_CREATE_FLAGS_USE_VM_BIND:
+	 *
+	 * VM created will work in VM_BIND mode.
+	 */
+#define I915_VM_CREATE_FLAGS_USE_VM_BIND	(1u << 0)
+#define I915_VM_CREATE_FLAGS_UNKNOWN	(-(I915_VM_CREATE_FLAGS_USE_VM_BIND << 1))
 	__u32 flags;
 
 	/** @vm_id: Id of the VM created or to be destroyed */
-- 
2.21.0.rc0.32.g243a4c7e27

