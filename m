Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92526A67A7F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 18:12:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E7310E4B2;
	Tue, 18 Mar 2025 17:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PJh6iO8J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4258B10E225;
 Tue, 18 Mar 2025 17:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742317909; x=1773853909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bFUG2ZPWv9rfaht+YtyaX5JTrJM1Fs3NSqgjwKdYZYI=;
 b=PJh6iO8JZ8IggORDxXekaHmeeL2OhGf8ehTxdLoom1K2eWtFiVApFp/P
 374LROV5fpnSFaRYQK6itnK6Hqb9lkubDhpImYffYTlfDNSgferATPZwh
 rM3phItp3s9YKUkZjOrOwG8kCXOd0KAXJGj9e0wM4T7pLRNqHmjRD19+k
 L/8o+emac4k7rFpuo/S1079cCE1HL/glsULyovKswV+xfi8IgDB55z099
 m9svbyk7FT49u6x6828spnMJMQgGp48nPhMd+LSCMeGmy+hE8Mp/hir+6
 gbR48lx5O5NgmGT6vUx64GcVn61/RLc7C5EaCTO5gWy3i9m53nWoKX0wA g==;
X-CSE-ConnectionGUID: b7lIaWIXQUqj3dPawkYcSQ==
X-CSE-MsgGUID: EHiSPbeTSl2PapDaRGWgBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="54854836"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="54854836"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 10:11:49 -0700
X-CSE-ConnectionGUID: mzR0MM/fSaKmsFSXI/Vfqw==
X-CSE-MsgGUID: H1eaNF2BSza4ts336r+8wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="122805744"
Received: from dut4419lnl.fm.intel.com ([10.105.10.214])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 10:11:49 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com
Subject: [PATCH v9 6/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Date: Tue, 18 Mar 2025 17:11:33 +0000
Message-ID: <20250318171146.78571-7-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250318171146.78571-1-jonathan.cavitt@intel.com>
References: <20250318171146.78571-1-jonathan.cavitt@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for userspace to request a list of observed faults
from a specified VM.

v2:
- Only allow querying of failed pagefaults (Matt Brost)

v3:
- Remove unnecessary size parameter from helper function, as it
  is a property of the arguments. (jcavitt)
- Remove unnecessary copy_from_user (Jainxun)
- Set address_precision to 1 (Jainxun)
- Report max size instead of dynamic size for memory allocation
  purposes.  Total memory usage is reported separately.

v4:
- Return int from xe_vm_get_property_size (Shuicheng)
- Fix memory leak (Shuicheng)
- Remove unnecessary size variable (jcavitt)

v5:
- Rename ioctl to xe_vm_get_faults_ioctl (jcavitt)
- Update fill_property_pfs to eliminate need for kzalloc (Jianxun)

v6:
- Repair and move fill_faults break condition (Dan Carpenter)
- Free vm after use (jcavitt)
- Combine assertions (jcavitt)
- Expand size check in xe_vm_get_faults_ioctl (jcavitt)
- Remove return mask from fill_faults, as return is already -EFAULT or 0
  (jcavitt)

v7:
- Revert back to using xe_vm_get_property_ioctl
- Apply better copy_to_user logic (jcavitt)

v8:
- Fix and clean up error value handling in ioctl (jcavitt)
- Reapply return mask for fill_faults (jcavitt)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Jainxun Zhang <jianxun.zhang@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |   3 +
 drivers/gpu/drm/xe/xe_vm.c     | 133 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h     |   2 +
 3 files changed, 138 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b2f656b2a563..74e510cb0e47 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -194,6 +194,9 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_VM_GET_PROPERTY, xe_vm_get_property_ioctl,
+			  DRM_RENDER_ALLOW),
+
 };
 
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index cab9671053ee..6ec112397cf6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -43,6 +43,14 @@
 #include "xe_wa.h"
 #include "xe_hmm.h"
 
+static const u16 xe_to_user_engine_class[] = {
+	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
+	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
+	[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
+	[XE_ENGINE_CLASS_VIDEO_ENHANCE] = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
+	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
+};
+
 static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
 {
 	return vm->gpuvm.r_obj;
@@ -3552,6 +3560,131 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	return err;
 }
 
+static int xe_vm_get_property_size(struct xe_vm *vm, u32 property)
+{
+	int size = -EINVAL;
+
+	switch (property) {
+	case DRM_XE_VM_GET_PROPERTY_FAULTS:
+		spin_lock(&vm->faults.lock);
+		size = vm->faults.len * sizeof(struct xe_vm_fault);
+		spin_unlock(&vm->faults.lock);
+		break;
+	default:
+		break;
+	}
+	return size;
+}
+
+static int xe_vm_get_property_verify_size(struct xe_vm *vm, u32 property,
+					  int expected, int actual)
+{
+	switch (property) {
+	case DRM_XE_VM_GET_PROPERTY_FAULTS:
+		/*
+		 * Number of faults may increase between calls to
+		 * xe_vm_get_property_ioctl, so just report the
+		 * number of faults the user requests if it's less
+		 * than or equal to the number of faults in the VM
+		 * fault array.
+		 */
+		if (actual < expected)
+			return -EINVAL;
+		break;
+	default:
+		if (actual != expected)
+			return -EINVAL;
+		break;
+	}
+	return 0;
+}
+
+static int fill_faults(struct xe_vm *vm,
+		       struct drm_xe_vm_get_property *args)
+{
+	struct xe_vm_fault __user *usr_ptr = u64_to_user_ptr(args->data);
+	struct xe_vm_fault store = { 0 };
+	struct xe_vm_fault_entry *entry;
+	int ret = 0, i = 0, count, entry_size;
+
+	entry_size = sizeof(struct xe_vm_fault);
+	count = args->size / entry_size;
+
+	spin_lock(&vm->faults.lock);
+	list_for_each_entry(entry, &vm->faults.list, list) {
+		if (i++ == count)
+			break;
+
+		memset(&store, 0, entry_size);
+
+		store.address = entry->address;
+		store.address_type = entry->address_type;
+		store.address_precision = entry->address_precision;
+		store.fault_level = entry->fault_level;
+		store.engine_class = xe_to_user_engine_class[entry->engine_class];
+		store.engine_instance = entry->engine_instance;
+
+		ret = copy_to_user(usr_ptr, &store, entry_size);
+		if (ret)
+			break;
+
+		usr_ptr++;
+	}
+	spin_unlock(&vm->faults.lock);
+
+	return ret ? -EFAULT : 0;
+}
+
+static int xe_vm_get_property_fill_data(struct xe_vm *vm,
+					struct drm_xe_vm_get_property *args)
+{
+	switch (args->property) {
+	case DRM_XE_VM_GET_PROPERTY_FAULTS:
+		return fill_faults(vm, args);
+	default:
+		break;
+	}
+	return -EINVAL;
+}
+
+int xe_vm_get_property_ioctl(struct drm_device *drm, void *data,
+			     struct drm_file *file)
+{
+	struct xe_device *xe = to_xe_device(drm);
+	struct xe_file *xef = to_xe_file(file);
+	struct drm_xe_vm_get_property *args = data;
+	struct xe_vm *vm;
+	int size, ret = 0;
+
+	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
+		return -EINVAL;
+
+	vm = xe_vm_lookup(xef, args->vm_id);
+	if (XE_IOCTL_DBG(xe, !vm))
+		return -ENOENT;
+
+	size = xe_vm_get_property_size(vm, args->property);
+
+	if (size < 0) {
+		ret = size;
+		goto put_vm;
+	} else if (!args->size) {
+		args->size = size;
+		goto put_vm;
+	}
+
+	ret = xe_vm_get_property_verify_size(vm, args->property,
+					     args->size, size);
+	if (XE_IOCTL_DBG(xe, ret))
+		goto put_vm;
+
+	ret = xe_vm_get_property_fill_data(vm, args);
+
+put_vm:
+	xe_vm_put(vm);
+	return ret;
+}
+
 /**
  * xe_vm_bind_kernel_bo - bind a kernel BO to a VM
  * @vm: VM to bind the BO to
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 9bd7e93824da..63ec22458e04 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -196,6 +196,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file);
 int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
 		     struct drm_file *file);
+int xe_vm_get_property_ioctl(struct drm_device *dev, void *data,
+			     struct drm_file *file);
 
 void xe_vm_close_and_put(struct xe_vm *vm);
 
-- 
2.43.0

