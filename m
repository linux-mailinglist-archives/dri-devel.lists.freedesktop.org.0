Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D01BEA4CDD1
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 23:00:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1304610E4E2;
	Mon,  3 Mar 2025 22:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BT7LVy97";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CCA10E235;
 Mon,  3 Mar 2025 22:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741039225; x=1772575225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lHwPBZU9aKV2X113eOYO0nvEsFC2XVqWIAMVWthByPQ=;
 b=BT7LVy97KTstB4NMELdbF8A6iDRKQrbFrUeyiZ6OsdsWwgEWHl2v17mA
 Am706n6H2VSCNwwp/bYj8agdpAl3UkezQwj+L/EPt+mF5iMrJwxhK4VSH
 46qikDzIvAVX1NGytcuBH32jFFD7FFwInisgI5SwfPQV83OWDBho54lJ0
 HTOkbdOle7wpH/tFFI5fgtORi9GrSXkR4+Bx+3cY/at3a9oIxGK4p8CJ6
 16LzH5Qu3Gw/utAHFpRHYBK5zzmo3gKSqhvT1U/+nMq1yRFP4FXcC2pkZ
 24EDLBwYZrkVZFgzqSL9Cqj98LNn59lMpwaJwzx3hCpexMPXL2BIQVdGy g==;
X-CSE-ConnectionGUID: F117q73YRIaO3YNFr/9viA==
X-CSE-MsgGUID: pO8OGBYWR1ehkV4j0grWOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41846109"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41846109"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 14:00:25 -0800
X-CSE-ConnectionGUID: ZeBQ1HcFQtSuQg74KiLzoQ==
X-CSE-MsgGUID: RtxNwbLtQ0mFXNcAvN5thg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118020907"
Received: from dut4025lnl.fm.intel.com ([10.105.8.176])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 14:00:24 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 6/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Date: Mon,  3 Mar 2025 22:00:22 +0000
Message-ID: <20250303220022.67200-7-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303220022.67200-1-jonathan.cavitt@intel.com>
References: <20250303220022.67200-1-jonathan.cavitt@intel.com>
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

v3:
- Remove unnecessary size parameter from helper function, as it
  is a property of the arguments. (jcavitt)
- Remove unnecessary copy_from_user (Jainxun)
- Set address_precision to 1 (Jainxun)
- Report max size instead of dynamic size for memory allocation
  purposes.  Total memory usage is reported separately.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
CC: Jainxun Zhang <jianxun.zhang@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  3 ++
 drivers/gpu/drm/xe/xe_vm.c     | 77 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h     |  2 +
 3 files changed, 82 insertions(+)

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
index 6211b971bbbd..139fcecf56c6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3234,6 +3234,83 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	return err;
 }
 
+static u32 xe_vm_get_property_size(struct xe_vm *vm, u32 property)
+{
+	switch (property) {
+	case DRM_XE_VM_GET_PROPERTY_FAULTS:
+		return MAX_PFS * sizeof(struct drm_xe_pf);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int fill_property_pfs(struct xe_vm *vm,
+			     struct drm_xe_vm_get_property *args)
+{
+	struct drm_xe_pf __user *usr_ptr = u64_to_user_ptr(args->ptr);
+	struct drm_xe_pf *fault_list;
+	struct drm_xe_pf *fault;
+	struct xe_vm_pf_entry *entry;
+	u32 size = args->size;
+	int i = 0;
+
+	fault_list = kzalloc(size, GFP_KERNEL);
+	if (!fault_list)
+		return -ENOMEM;
+
+	spin_lock(&vm->pfs.lock);
+	list_for_each_entry(entry, &vm->pfs.list, list) {
+		struct xe_pagefault *pf = entry->pf;
+
+		fault = &fault_list[i++];
+		fault->address = pf->page_addr;
+		fault->address_type = pf->address_type;
+		fault->address_precision = 1;
+	}
+	args->value = vm->pfs.len;
+	spin_unlock(&vm->pfs.lock);
+
+	if (copy_to_user(usr_ptr, &fault_list, size))
+		return -EFAULT;
+	kfree(fault_list);
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
+		return fill_property_pfs(vm, args);
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

