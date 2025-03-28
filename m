Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C8DA75182
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 21:40:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0460B10E1D1;
	Fri, 28 Mar 2025 20:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CI6hYOP+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014C610E1D1;
 Fri, 28 Mar 2025 20:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743194448; x=1774730448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0QzjC/BecaEtblTqHXxTnec26yjsbzAPfdrQtDeJ8u4=;
 b=CI6hYOP+Sk1kfzXDAkXJgsN1sFx6p2EBH5fRb8h0a55XHhS+HjjMiHDD
 2X5xnJi7DmS0GgwXi1V7vespSz7mnaz3bnAUiviOoqCrEVimYlMqDWQ2F
 pePJ3G2mSN5WPiy/8QRRtAqZsifmR/1mRRti6RG/VRUvvkg4uPJfxI4Z2
 owvmsDIML+w6+W2y7gppjX1Oakc6A7y0B1qP1QHdOeiSn3HHE5Bw8pRPU
 zocxvY5VXav49TgrrFIhWZ2a5vngk5oHhK7Py6YejwmAOoIRH2MaDPAfz
 oZKxNe+EVK+FuySOjN4jS4mOrzK67+5Qaaf0FN4a6XAG/yHFM7wutO75s g==;
X-CSE-ConnectionGUID: w2kv7tPDSYGcDOOyfy5PyA==
X-CSE-MsgGUID: Q8VNkJbWQ9KYBboNz5nwOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55230031"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="55230031"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 13:40:46 -0700
X-CSE-ConnectionGUID: GVWAF52gS+meLJ+sH55rfw==
X-CSE-MsgGUID: SMh7SzebTa+QhLmQzDsvPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="129673624"
Received: from dut4086lnl.fm.intel.com ([10.105.10.92])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 13:40:47 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com, raag.jadav@intel.com, john.c.harrison@intel.com
Subject: [PATCH v15 6/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Date: Fri, 28 Mar 2025 20:40:43 +0000
Message-ID: <20250328204045.157914-7-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328204045.157914-1-jonathan.cavitt@intel.com>
References: <20250328204045.157914-1-jonathan.cavitt@intel.com>
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

v11:
- Remove unnecessary else condition
- Correct backwards helper function size logic (jcavitt)

v12:
- Use size_t instead of int (Raag)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Jainxun Zhang <jianxun.zhang@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  3 ++
 drivers/gpu/drm/xe/xe_vm.c     | 88 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h     |  2 +
 3 files changed, 93 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d8e227ddf255..0b579ba9c3f4 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -196,6 +196,9 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_VM_GET_PROPERTY, xe_vm_get_property_ioctl,
+			  DRM_RENDER_ALLOW),
+
 };
 
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ed42ed7b9e51..6b0b8e0ce225 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3582,6 +3582,94 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
+	size_t size;
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
+			return args->size <= size ? fill_faults(vm, args) : -EINVAL;
+
+		args->size = size;
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

