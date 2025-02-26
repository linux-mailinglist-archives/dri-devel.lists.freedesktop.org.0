Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBADFA46ED9
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 23:56:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998E810EA04;
	Wed, 26 Feb 2025 22:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eyi+nwG+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F6110E9F5;
 Wed, 26 Feb 2025 22:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740610560; x=1772146560;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z6Hc159zCmfly6F0ovZoPCRKFCnECewKarPQa+TpW6k=;
 b=eyi+nwG+QroGY86ypXJ3y1q1MELRxBl0Kr8ZiqyoiHelxpdDhRTx1WlA
 6416+W7AlW4xYiBgieXsPCCgFLC5gv336cID5QtAmd5yXecU5hV5eYEPb
 yF6jBq8Ll9ZgChU3VQHK7MkahVPm8IcGCw1i4pykLjx2eck0lFLyLVp7Z
 rFU/filAP6YwdrjZe10dssdt1WGHwj0HRjmwu0jqD012b3G0MBQaEvmMk
 oyeQrSkC0eM3meoSFW5Z0aisDPLa+mUayNCfIrKkzF8F5m8cjVmUj8ccV
 LINu5Ik6U2/hnwCG9UPBW0uAu8n7CpWQxEOs/wzlVwnE7AAmYbOH5n0QG A==;
X-CSE-ConnectionGUID: BwlAgtnvQLmO5TwNUrQLSw==
X-CSE-MsgGUID: jW8KHelgSkGJNRZctS3cZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="44308778"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="44308778"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 14:55:59 -0800
X-CSE-ConnectionGUID: 1n+3YZxgR0SamkvtswDMnQ==
X-CSE-MsgGUID: ulFhaef0TsuanClako0BPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="117326783"
Received: from dut4025lnl.fm.intel.com ([10.105.10.92])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 14:55:58 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 6/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Date: Wed, 26 Feb 2025 22:55:56 +0000
Message-ID: <20250226225557.133076-7-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226225557.133076-1-jonathan.cavitt@intel.com>
References: <20250226225557.133076-1-jonathan.cavitt@intel.com>
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

Add support for userspace to get various properties from a specified VM.
The currently supported properties are:

- The number of engine resets the VM has observed
- The number of exec queue bans the VM has observed, up to the last 50
  relevant ones, and how many of those were caused by faults.

The latter request also includes information on the exec queue bans,
such as the ID of the banned exec queue, whether the ban was caused by a
pagefault or not, and the address and address type of the associated
fault (if one exists).

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |   2 +
 drivers/gpu/drm/xe/xe_vm.c     | 106 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h     |   2 +
 include/uapi/drm/xe_drm.h      |  73 +++++++++++++++++++++++
 4 files changed, 183 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 9454b51f7ad8..3a509a69062c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -193,6 +193,8 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_VM_GET_PROPERTY, xe_vm_get_property_ioctl,
+			  DRM_RENDER_ALLOW),
 };
 
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 3e88652670e6..047908eb9ff7 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3258,6 +3258,112 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	return err;
 }
 
+static u32 xe_vm_get_property_size(struct xe_vm *vm, u32 property)
+{
+	u32 size = -EINVAL;
+
+	switch (property) {
+	case DRM_XE_VM_GET_PROPERTY_FAULTS:
+		spin_lock(&vm->bans.lock);
+		size = vm->bans.len * sizeof(struct drm_xe_ban);
+		spin_unlock(&vm->bans.lock);
+		size += sizeof(struct drm_xe_faults);
+		break;
+	case DRM_XE_VM_GET_PROPERTY_NUM_RESETS:
+		size = sizeof(u64);
+		break;
+	default:
+		break;
+	}
+
+	return size;
+}
+
+static enum drm_xe_fault_address_type
+xe_pagefault_access_type_to_address_type(struct xe_vm *vm, struct xe_pagefault *pf)
+{
+	if (!pf)
+		return 0;
+
+	vma = lookup_vma(vm, pf->page_addr);
+	if (!vma)
+		return DRM_XE_FAULT_ADDRESS_TYPE_NONE_EXT;
+	if (xe_vma_read_only(vma) && pf->access_type != XE_PAGEFAULT_ACCESS_TYPE_READ)
+		return DRM_XE_FAULT_ADDRESS_TYPE_WRITE_INVALID_EXT;
+	return 0;
+}
+
+int xe_vm_get_property_ioctl(struct drm_device *drm, void *data,
+			     struct drm_file *file)
+{
+	struct xe_device *xe = to_xe_device(drm);
+	struct xe_file *xef = to_xe_file(file);
+	struct drm_xe_vm_get_property *args = data;
+	struct xe_vm *vm;
+	u32 size;
+
+	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
+		return -EINVAL;
+
+	vm = xe_vm_lookup(xef, args->vm_id);
+	if (XE_IOCTL_DBG(xe, !vm))
+		return -ENOENT;
+
+	size = xe_vm_get_property_size(vm, args->property);
+	if (size < 0) {
+		return size;
+	} else if (!args->size) {
+		args->size = size;
+		return 0;
+	} else if (args->size != size) {
+		return -EINVAL;
+	}
+
+	if (args->property == DRM_XE_VM_GET_PROPERTY_FAULTS) {
+		struct drm_xe_faults __user *usr_ptr = u64_to_user_ptr(args->data);
+		struct drm_xe_faults fault_list;
+		struct drm_xe_ban *ban;
+		struct xe_exec_queue_ban_entry *entry;
+		int i = 0;
+
+		if (copy_from_user(&fault_list, usr_ptr, size))
+			return -EFAULT;
+
+		fault_list.num_faults = 0;
+
+		spin_lock(&vm->bans.lock);
+		list_for_each_entry(entry, &vm->bans.list, list) {
+			struct xe_pagefault *pf = entry->pf;
+
+			ban = &fault_list.list[i++];
+			ban->exec_queue_id = entry->exec_queue_id;
+			ban->faulted = !!pf ? 1 : 0;
+			ban->address = pf ? pf->page_addr : 0;
+			ban->address_type = xe_pagefault_access_type_to_address_type(vm, pf);
+			ban->address_type = pf ? pf->fault_type : 0;
+			fault_list.num_faults += ban->faulted;
+		}
+		spin_unlock(&vm->bans.lock);
+
+		fault_list.num_bans = i;
+
+		if (copy_to_user(usr_ptr, &fault_list, size))
+			return -EFAULT;
+
+	} else if (args->property == DRM_XE_VM_GET_PROPERTY_NUM_RESETS) {
+		u64 __user *usr_ptr = u64_to_user_ptr(args->data);
+		u64 num_resets = atomic_read(&vm->reset_count);
+
+		if (copy_to_user(usr_ptr, &num_resets, size))
+			return -EFAULT;
+
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /**
  * xe_vm_bind_kernel_bo - bind a kernel BO to a VM
  * @vm: VM to bind the BO to
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 78dbc5d57cd3..84653539d8db 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -184,6 +184,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file);
 int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
 		     struct drm_file *file);
+int xe_vm_get_property_ioctl(struct drm_device *dev, void *data,
+			     struct drm_file *file);
 
 void xe_vm_close_and_put(struct xe_vm *vm);
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 76a462fae05f..00328d8a15dd 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -81,6 +81,7 @@ extern "C" {
  *  - &DRM_IOCTL_XE_EXEC
  *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
  *  - &DRM_IOCTL_XE_OBSERVATION
+ *  - &DRM_IOCTL_XE_VM_GET_BANS
  */
 
 /*
@@ -102,6 +103,7 @@ extern "C" {
 #define DRM_XE_EXEC			0x09
 #define DRM_XE_WAIT_USER_FENCE		0x0a
 #define DRM_XE_OBSERVATION		0x0b
+#define DRM_XE_VM_GET_PROPERTY		0x0c
 
 /* Must be kept compact -- no holes */
 
@@ -117,6 +119,7 @@ extern "C" {
 #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
+#define DRM_IOCTL_XE_VM_GET_PROPERTY		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_GET_PROPERTY, struct drm_xe_vm_get_property)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -1166,6 +1169,76 @@ struct drm_xe_vm_bind {
 	__u64 reserved[2];
 };
 
+/** Types of fault address */
+enum drm_xe_fault_address_type {
+	DRM_XE_FAULT_ADDRESS_TYPE_NONE_EXT,
+	DRM_XE_FAULT_ADDRESS_TYPE_READ_INVALID_EXT,
+	DRM_XE_FAULT_ADDRESS_TYPE_WRITE_INVALID_EXT,
+};
+
+struct drm_xe_ban {
+	/** @exec_queue_id: ID of banned exec queue */
+	__u32 exec_queue_id;
+	/** @faulted: Whether or not the ban has an associated pagefault.  0 is no, 1 is yes */
+	__u32 faulted;
+	/** @address: Address of the fault, if relevant */
+	__u64 address;
+	/** @address_type: enum drm_xe_fault_address_type, if relevant */
+	__u32 address_type;
+	/** @pad: MBZ */
+	__u32 pad;
+	/** @reserved: MBZ */
+	__u64 reserved[3];
+};
+
+struct drm_xe_faults {
+	/** @num_faults: Number of faults observed on the VM */
+	__u32 num_faults;
+	/** @num_bans: Number of bans observed on the VM */
+	__u32 num_bans;
+	/** @reserved: MBZ */
+	__u64 reserved[2];
+	/** @list: Dynamic sized array of drm_xe_ban bans */
+	struct drm_xe_ban list[];
+};
+
+/**
+ * struct drm_xe_vm_get_property - Input of &DRM_IOCTL_XE_VM_GET_PROPERTY
+ *
+ * The user provides a VM ID and a property to query to this ioctl,
+ * and the ioctl returns the size of the return value.  Calling the
+ * ioctl again with memory reserved for the data will save the
+ * requested property data to the data pointer.
+ *
+ * The valid properties are:
+ *  - %DRM_XE_VM_GET_PROPERTY_FAULTS : Property is a drm_xe_faults struct of dynamic size
+ *  - %DRM_XE_VM_GET_PROPERTY_NUM_RESETS: Property is a scalar
+ */
+struct drm_xe_vm_get_property {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @vm_id: The ID of the VM to query the properties of */
+	__u32 vm_id;
+
+#define DRM_XE_VM_GET_PROPERTY_FAULTS		0
+#define DRM_XE_VM_GET_PROPERTY_NUM_RESETS	1
+	/** @property: The property to get */
+	__u32 property;
+
+	/** @size: Size of returned property @data */
+	__u32 size;
+
+	/** @pad: MBZ */
+	__u32 pad;
+
+	/** @reserved: MBZ */
+	__u64 reserved[2];
+
+	/** @data: Pointer storing return data */
+	__u64 data;
+};
+
 /**
  * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
  *
-- 
2.43.0

