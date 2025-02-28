Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2F5A4A152
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 19:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F6310E2B9;
	Fri, 28 Feb 2025 18:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L9EHsZxs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E8E10E0D9;
 Fri, 28 Feb 2025 18:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740766891; x=1772302891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5oruXRvzY0MEV/yYjsTCfIjJVQA3U70uEzpaMmt5BiM=;
 b=L9EHsZxsL3usjTHHougyQ3IVpL3hnyw5r0vgwFOEcxx4cYo2YfUe/VGq
 UAk0pqIQUgzBNmyouF2odD9SIP4JkTseB81sfQtLxZFT82QjLnUifQjXh
 q2+g6hU3kJzwkxVc45UTq7fgdqEFDrJQpxZJbVdPbCxDSd5iNbVdzAwux
 sG7aLPOC3M+AVJHGbfs7ssB/skrcDcrCaoQ4i8vNdfrwJIj343nBr7Ksi
 iLzmGucDswrKSxh8jn0sAa9d39LVKnWt5pwSu7gWjVj6/le3eZaDuZiSw
 BlklkIszgoNhDtj1zXU2O15tBYm5IT4TM761wVkDuO6yYJTuVDBIbf6bz Q==;
X-CSE-ConnectionGUID: XaNzz0pqQwu4Pkb/RiQlAQ==
X-CSE-MsgGUID: OFPy8I11TMi6zQ/CmBvBCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41729585"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="41729585"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 10:21:30 -0800
X-CSE-ConnectionGUID: g0zXwNtKTU2TsxYMi4k3QQ==
X-CSE-MsgGUID: R/TVyfRoTcKNzb3lPObRlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="148214532"
Received: from dut4025lnl.fm.intel.com ([10.105.8.176])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 10:21:24 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 6/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Date: Fri, 28 Feb 2025 18:21:22 +0000
Message-ID: <20250228182122.77475-7-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250228182122.77475-1-jonathan.cavitt@intel.com>
References: <20250228182122.77475-1-jonathan.cavitt@intel.com>
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

Add support for userspace to request a list of observed failed
pagefaults from a specified VM.

v2:
- Only allow querying of failed pagefaults (Matt Brost)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  3 ++
 drivers/gpu/drm/xe/xe_vm.c     | 79 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h     |  2 +
 3 files changed, 84 insertions(+)

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
index 6211b971bbbd..00d2c62ccf53 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3234,6 +3234,85 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	return err;
 }
 
+static u32 xe_vm_get_property_size(struct xe_vm *vm, u32 property)
+{
+	u32 size = 0;
+
+	switch (property) {
+	case DRM_XE_VM_GET_PROPERTY_FAULTS:
+		spin_lock(&vm->pfs.lock);
+		size = vm->pfs.len * sizeof(struct drm_xe_pf);
+		spin_unlock(&vm->pfs.lock);
+		return size;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int fill_property_pfs(struct xe_vm *vm,
+			     struct drm_xe_vm_get_property *args,
+			     u32 size)
+{
+	struct drm_xe_pf __user *usr_ptr = u64_to_user_ptr(args->ptr);
+	struct drm_xe_pf *fault_list;
+	struct drm_xe_pf *fault;
+	struct xe_vm_pf_entry *entry;
+	int i = 0;
+
+	if (copy_from_user(&fault_list, usr_ptr, size))
+		return -EFAULT;
+
+	spin_lock(&vm->pfs.lock);
+	list_for_each_entry(entry, &vm->pfs.list, list) {
+		struct xe_pagefault *pf = entry->pf;
+
+		fault = &fault_list[i++];
+		fault->address = pf->page_addr;
+		fault->address_type = pf->address_type;
+		fault->address_precision = SZ_4K;
+	}
+	spin_unlock(&vm->pfs.lock);
+
+	if (copy_to_user(usr_ptr, &fault_list, size))
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
+		return fill_property_pfs(vm, args, size);
+	default:
+		return -EINVAL;
+	}
+}
+
 /**
  * xe_vm_bind_kernel_bo - bind a kernel BO to a VM
  * @vm: VM to bind the BO to
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 4d94ab5c8ea4..bf6604465aa3 100644
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

