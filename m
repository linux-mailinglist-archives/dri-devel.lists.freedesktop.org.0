Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF9BA6E600
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 22:58:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D5710E4E1;
	Mon, 24 Mar 2025 21:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OB1UuaDE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F54410E4DB;
 Mon, 24 Mar 2025 21:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742853476; x=1774389476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XtcGNQ8/miOWQ6hHAPAyTsZfVPBvOKqwNX6p9MwG9W0=;
 b=OB1UuaDEXEvwQnE9I7ET3Q91rvuDLCV+xzY8wja/3SqfO+DilZfYk5uY
 X3Sp3qWZAMulIGAHvzrywOaw8iaGx6xefBUtWl8MuK5BsGvDds2KtD3wD
 YQI8ZvqucLwhz22HJm7Dz0UWx2O8lHV67ql6RY6RNAsJlv4cVCFiFSNRW
 9Y6zED9737Y7IJZCVQdNBgjgyOiViULfrFWAShkgACiv8CQ0PiQXockcN
 8PfFIz5UJ2mkSwzlZklA7VIhWVpfklN/Tv419m+Vd/V+S4iPlKZzJgeuO
 5PbCgXTJc5v2gVzr8hkM7YKNoY0aivuKM0Oz9qStjl7wICw0QfX6IPlyy A==;
X-CSE-ConnectionGUID: XNKlDKAoQBm5XWoGwJsOFQ==
X-CSE-MsgGUID: Uc32bIOYTLi9Bs5n4HLckQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="54723284"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="54723284"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 14:57:56 -0700
X-CSE-ConnectionGUID: e0zUPSTrRg+Dm/SJrz7SKQ==
X-CSE-MsgGUID: niI4HxoNTUqC1YS/QXG/Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="129236855"
Received: from dut4419lnl.fm.intel.com ([10.105.10.61])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 14:57:55 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com, raag.jadav@intel.com
Subject: [PATCH v11 5/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Date: Mon, 24 Mar 2025 21:57:52 +0000
Message-ID: <20250324215753.70768-6-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250324215753.70768-1-jonathan.cavitt@intel.com>
References: <20250324215753.70768-1-jonathan.cavitt@intel.com>
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

v9:
- Future-proof size logic for zero-size properties (jcavitt)
- Add access and fault types (Jianxun)
- Remove address type (Jianxun)

v10:
- Remove unnecessary switch case logic (Raag)
- Compress size get, size validation, and property fill functions into a
  single helper function (jcavitt)
- Assert valid size (jcavitt)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Jainxun Zhang <jianxun.zhang@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  3 ++
 drivers/gpu/drm/xe/xe_vm.c     | 97 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h     |  2 +
 3 files changed, 102 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1ffb7d1f6be6..02f84a855502 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -195,6 +195,9 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_VM_GET_PROPERTY, xe_vm_get_property_ioctl,
+			  DRM_RENDER_ALLOW),
+
 };
 
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 9a627ba17f55..384595cd0589 100644
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
@@ -3553,6 +3561,95 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	return err;
 }
 
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
+		store.address_precision = entry->address_precision;
+		store.access_type = entry->access_type;
+		store.fault_type = entry->fault_type;
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
+static int xe_vm_get_property_helper(struct xe_vm *vm,
+				     struct drm_xe_vm_get_property *args)
+{
+	int size;
+
+	switch (args->property) {
+	case DRM_XE_VM_GET_PROPERTY_FAULTS:
+		spin_lock(&vm->faults.lock);
+		size = size_mul(sizeof(struct xe_vm_fault), vm->faults.len);
+		spin_unlock(&vm->faults.lock);
+
+		if (args->size)
+			/*
+			 * Number of faults may increase between calls to
+			 * xe_vm_get_property_ioctl, so just report the
+			 * number of faults the user requests if it's less
+			 * than or equal to the number of faults in the VM
+			 * fault array.
+			 */
+			return args->size <= size ? -EINVAL : fill_faults(vm, args);
+		else
+			args->size = size;
+
+		return 0;
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
+	int ret = 0;
+
+	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
+		return -EINVAL;
+	if (XE_IOCTL_DBG(xe, args->size < 0))
+		return -EINVAL;
+
+	vm = xe_vm_lookup(xef, args->vm_id);
+	if (XE_IOCTL_DBG(xe, !vm))
+		return -ENOENT;
+
+	ret = xe_vm_get_property_helper(vm, args);
+
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

