Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 861395F2884
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 08:15:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6016010E37E;
	Mon,  3 Oct 2022 06:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7A810E211;
 Mon,  3 Oct 2022 06:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664777601; x=1696313601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YWgJeQgWBcNXPOuajZKvFMPzzkL45HrffaJKznRQSb0=;
 b=N6jLOLmHx+2LR2kNHuY/WFFT79GAaEoydursGtypgUjExio6tS/dEuGl
 HzeGkT0gkPEv0prJzUcwJFBEk2/L9hp3uzvWloL3zQ2gNbIBf3Ka3c8ew
 RTQMmrMet2ZS55ZJHYNtgCT8nrjlneb4T5AReZlm1QIr7wFz7ovXrMFus
 oe9czXnaiPxtbkw3ztZpGJqaQmVtkoAG25Ciuor5p4EDs1eYR5TRhOddg
 AUatCSsApYhgbeS4Z+VQTdSqW+Ns9X313IZ9S6gg4SUejfrZnjiqqfWCP
 5yJbPylM/O9SOY9TLVnHVYoDBX3RC8+LrPWgJguac7OvdPGOW1xE3vYL6 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="300159085"
X-IronPort-AV: E=Sophos;i="5.93,364,1654585200"; d="scan'208";a="300159085"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2022 23:13:21 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="574516859"
X-IronPort-AV: E=Sophos;i="5.93,364,1654585200"; d="scan'208";a="574516859"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 02 Oct 2022 23:13:21 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 17/17] drm/i915/vm_bind: Add uapi for user to enable
 vm_bind_mode
Date: Sun,  2 Oct 2022 23:12:45 -0700
Message-Id: <20221003061245.12716-18-niranjana.vishwanathapura@intel.com>
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

Add getparam support for VM_BIND capability version.
Add VM creation time flag to enable vm_bind_mode for the VM.

v2: update kernel-doc

Acked-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c |  9 ++++++++-
 drivers/gpu/drm/i915/i915_drv.h             |  2 ++
 drivers/gpu/drm/i915/i915_getparam.c        |  3 +++
 include/uapi/drm/i915_drm.h                 | 22 ++++++++++++++++++++-
 4 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index f4e648ec01ed..c20bd6e8aaf8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1808,9 +1808,13 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev, void *data,
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
@@ -1828,6 +1832,9 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (err)
 		goto err_put;
 
+	if (args->flags & I915_VM_CREATE_FLAGS_USE_VM_BIND)
+		ppgtt->vm.vm_bind_mode = true;
+
 	GEM_BUG_ON(id == 0); /* reserved for invalid/unassigned ppgtt */
 	args->vm_id = id;
 	return 0;
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 90ed8e6db2fe..826b0f90879f 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -977,6 +977,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define HAS_BAR2_SMEM_STOLEN(i915) (!HAS_LMEM(i915) && \
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
index 6e0f6b8d66a3..4ed170b8bae7 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -755,6 +755,22 @@ typedef struct drm_i915_irq_wait {
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
@@ -2606,6 +2622,9 @@ struct drm_i915_gem_context_destroy {
  * on the same file. Extensions can be provided to configure exactly how the
  * address space is setup upon creation.
  *
+ * If I915_VM_CREATE_FLAGS_USE_VM_BIND flag is set, VM created will work in
+ * VM_BIND mode.
+ *
  * The id of new VM (bound to the fd) for use with I915_CONTEXT_PARAM_VM is
  * returned in the outparam @id.
  *
@@ -2622,7 +2641,8 @@ struct drm_i915_gem_vm_control {
 	/** @extensions: Zero-terminated chain of extensions. */
 	__u64 extensions;
 
-	/** @flags: reserved for future usage, currently MBZ */
+#define I915_VM_CREATE_FLAGS_USE_VM_BIND	(1u << 0)
+#define I915_VM_CREATE_FLAGS_UNKNOWN	(-(I915_VM_CREATE_FLAGS_USE_VM_BIND << 1))
 	__u32 flags;
 
 	/** @vm_id: Id of the VM created or to be destroyed */
-- 
2.21.0.rc0.32.g243a4c7e27

