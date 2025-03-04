Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 150B1A4E7B4
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 18:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F237D10E668;
	Tue,  4 Mar 2025 17:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jEhKNwhz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1526310E673;
 Tue,  4 Mar 2025 17:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741108139; x=1772644139;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KdnhfwyWohLw6HAA2L8UgdQYZiSZwDR412bDcRBey/E=;
 b=jEhKNwhzjsz9gLa4c/Z49GCSDVHGvYXxO4rL0zMBYj22STTK7keSl4mM
 FZf9qDymAWR8T1QWJ+DARyuyJKpAf5lsIP3qdkR1ZsMXX86Jr6DoPBjy2
 echQVSv60h/c1h3r1oQkOJWIPtslazCfDOe6JUV598KYfEPm8pXLH2KAG
 wMgWsDApbsoGpPSLxd5dPOPwSezJFNn1ru3OeFbb0APwZipUFEHHrktgo
 5pxTNhfaKaR2X6/LmUJn31qNBa6rF2ilsjTQpTcDDwtHavAASFhk01kwy
 A6xkPkHsV8tnSnivSgNG4CZYkWmyOKlREEVaS/Y96I8t5cuan1hnDqRzv A==;
X-CSE-ConnectionGUID: OETusArHSUy1DaDP3mIh4A==
X-CSE-MsgGUID: SastkfLZRCi5kF7R3tG5aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="44847575"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="44847575"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 09:08:58 -0800
X-CSE-ConnectionGUID: pUwgQf+8TpGchvwQyOUf6g==
X-CSE-MsgGUID: LYQNed2cTtizrGWkWUzfyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="123036943"
Received: from dut4025lnl.fm.intel.com ([10.105.8.176])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 09:08:58 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 6/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Date: Tue,  4 Mar 2025 17:08:54 +0000
Message-ID: <20250304170854.67195-7-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304170854.67195-1-jonathan.cavitt@intel.com>
References: <20250304170854.67195-1-jonathan.cavitt@intel.com>
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

v4:
- Return int from xe_vm_get_property_size (Shuicheng)
- Fix memory leak (Shuicheng)
- Remove unnecessary size variable (jcavitt)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
CC: Jainxun Zhang <jianxun.zhang@intel.com>
CC: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  3 ++
 drivers/gpu/drm/xe/xe_vm.c     | 75 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h     |  2 +
 3 files changed, 80 insertions(+)

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
index 6211b971bbbd..1e78103fb0f6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3234,6 +3234,81 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	return err;
 }
 
+static int xe_vm_get_property_size(struct xe_vm *vm, u32 property)
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
+	int ret, i = 0;
+
+	fault_list = kzalloc(args->size, GFP_KERNEL);
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
+	ret = copy_to_user(usr_ptr, &fault_list, args->size);
+	kfree(fault_list);
+
+	return ret ? -EFAULT : 0;
+}
+
+int xe_vm_get_property_ioctl(struct drm_device *drm, void *data,
+			     struct drm_file *file)
+{
+	struct xe_device *xe = to_xe_device(drm);
+	struct xe_file *xef = to_xe_file(file);
+	struct drm_xe_vm_get_property *args = data;
+	struct xe_vm *vm;
+	int size;
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

