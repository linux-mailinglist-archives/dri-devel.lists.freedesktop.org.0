Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB269A488BC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 20:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F164410EB83;
	Thu, 27 Feb 2025 19:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XoU8ojrq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433D010EB6C;
 Thu, 27 Feb 2025 19:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740683703; x=1772219703;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fTT4IDp0eG35YWqJ+9j3q8JrBipHJNMQcOZOdquVIQo=;
 b=XoU8ojrqZfvNmzUiuRaITGlXk7IGJ+Cum8d2faqpypt2YFt6MuT8OGkC
 mfMzjVo3/v0BJ3fFgXAp/YQzODc74USHOb4JxWftNjMOqIVyPMH3QnLoo
 5dK6+wtZfNf3UDrT/43RomFck3F0EJZeaxTBv4ahl3CjIq/gnVle5PAjr
 8BLwd8i4ORxeWH4KOcGwS2fUmwRElKJu8EEIY//kHJmTsjlCu2HOssmab
 2tWNVL3vfrhrG3d3sz24t/fYXYhl0IDnxOWJiPFU+DUgq+yxRpuN/Z94Q
 zSqjwA4e7vUSA6wvnqPxZnGFYQcaEktZK+i+cZS0s3KC778NstTN/nspm Q==;
X-CSE-ConnectionGUID: exKUi9K+RXyJ046ip9Iu9Q==
X-CSE-MsgGUID: 9maAFd/IR/CNpy/2yqatxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41850061"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="41850061"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 11:15:00 -0800
X-CSE-ConnectionGUID: m43/JjTIQoOlXZY/+Jk0zA==
X-CSE-MsgGUID: UBT3wlipRLe3YvivmGY1/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="117775304"
Received: from dut4025lnl.fm.intel.com ([10.105.8.176])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 11:15:00 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 8/8] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Date: Thu, 27 Feb 2025 19:14:57 +0000
Message-ID: <20250227191457.84035-9-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227191457.84035-1-jonathan.cavitt@intel.com>
References: <20250227191457.84035-1-jonathan.cavitt@intel.com>
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
  relevant ones, in total.
- The number of exec queue bans the VM has observed, up to the last 50
  relevant ones, that were caused by faults.

The latter two requests also include information on the exec queue bans
themselves, such as the ID of the banned exec queue and, when relevant,
the faulting address, address type, and address precision.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |   3 +
 drivers/gpu/drm/xe/xe_vm.c     | 102 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h     |   2 +
 3 files changed, 107 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 9454b51f7ad8..43accae152ff 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -193,6 +193,9 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_VM_GET_PROPERTY, xe_vm_get_property_ioctl,
+			  DRM_RENDER_ALLOW),
+
 };
 
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 3e88652670e6..8ac54aaca51a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3258,6 +3258,108 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	return err;
 }
 
+static u32 xe_vm_get_property_size(struct xe_vm *vm, u32 property)
+{
+	u32 size = 0;
+
+	switch (property) {
+	case DRM_XE_VM_GET_PROPERTY_FAULTS:
+		struct xe_exec_queue_ban_entry *entry;
+
+		spin_lock(&vm->bans.lock);
+		list_for_each_entry(entry, &vm->bans.list, list) {
+			struct xe_pagefault *pf = entry->pf;
+
+			size += pf ? sizeof(struct drm_xe_ban) : 0;
+		}
+		spin_unlock(&vm->bans.lock);
+		return size;
+	case DRM_XE_VM_GET_PROPERTY_BANS:
+		spin_lock(&vm->bans.lock);
+		size = vm->bans.len * sizeof(struct drm_xe_ban);
+		spin_unlock(&vm->bans.lock);
+		return size;
+	case DRM_XE_VM_GET_PROPERTY_NUM_RESETS:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int fill_property_bans(struct xe_vm *vm,
+			      struct drm_xe_vm_get_property *args,
+			      u32 size, bool faults_only)
+{
+	struct drm_xe_ban __user *usr_ptr = u64_to_user_ptr(args->ptr);
+	struct drm_xe_ban *ban_list;
+	struct drm_xe_ban *ban;
+	struct xe_exec_queue_ban_entry *entry;
+	int i = 0;
+
+	if (copy_from_user(&ban_list, usr_ptr, size))
+		return -EFAULT;
+
+	spin_lock(&vm->bans.lock);
+	list_for_each_entry(entry, &vm->bans.list, list) {
+		struct xe_pagefault *pf = entry->pf;
+
+		if (!pf && faults_only)
+			continue;
+
+		ban = &ban_list[i++];
+		ban->exec_queue_id = entry->exec_queue_id;
+		ban->faulted = !pf ? 0 : 1;
+		ban->address = pf ? pf->page_addr : 0;
+		ban->address_type = pf ? pf->address_type : 0;
+		ban->address_precision = SZ_4K;
+	}
+	spin_unlock(&vm->bans.lock);
+
+	if (copy_to_user(usr_ptr, &ban_list, size))
+		return -EFAULT;
+
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
+	} else if (args->size != size) {
+		if (args->size)
+			return -EINVAL;
+		args->size = size;
+		return 0;
+	}
+
+	switch (args->property) {
+	case DRM_XE_VM_GET_PROPERTY_FAULTS:
+		return fill_property_bans(vm, args, size, true);
+	case DRM_XE_VM_GET_PROPERTY_BANS:
+		return fill_property_bans(vm, args, size, false);
+	case DRM_XE_VM_GET_PROPERTY_NUM_RESETS:
+		args->data = atomic_read(&vm->reset_count);
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
 /**
  * xe_vm_bind_kernel_bo - bind a kernel BO to a VM
  * @vm: VM to bind the BO to
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 9f8457ceb905..0338f42f7a71 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -184,6 +184,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file);
 int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
 		     struct drm_file *file);
+int xe_vm_get_property_ioctl(struct drm_device *dev, void *data,
+			     struct drm_file *file);
 
 void xe_vm_close_and_put(struct xe_vm *vm);
 
-- 
2.43.0

