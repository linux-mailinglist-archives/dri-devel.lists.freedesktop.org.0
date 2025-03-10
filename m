Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1F6A59D30
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 18:18:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E1710E4A7;
	Mon, 10 Mar 2025 17:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="khwuD2Hy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD3B910E00A;
 Mon, 10 Mar 2025 17:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741627116; x=1773163116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rdxUWk0TJfpRrdmuoEWtEcmjJVbHsqXF1zZtM3otraQ=;
 b=khwuD2HyMR3dc/xp8FCBilXstcwI4qSKo2VaIrPXg85m8XsBRLE5vpch
 +pt0KDGjYr8SGtcmiYdY7LHhSEKGWn2qLFUhB2FUmRCVmfZBAqIOmlgWL
 GGCSAcReYkWu2nC2Wa4fdKc8fl5ewAoFvKioIXt+9EL23RnlqoBFExIoZ
 Q3fMO9lJQG5evAkwV8D1w7wCuLiDTo6lFdJzGOMDAldaIkepMHm3LnGJE
 Ed3oJeWB/Mg9Fdg2PcXPcnavoFL+W9vhr0BbzUg2xq+nySyKVXiEnWJ3P
 AnFPizNHgeg8vjR62ZP99RbeCE3M0lGUaFB9p+opqzW8TGMnli1n5KfKK g==;
X-CSE-ConnectionGUID: 59fxC6MyR1WR43547at6NQ==
X-CSE-MsgGUID: i4Y3n2S+R1Wg6MyT8tpLxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42669305"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="42669305"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 10:18:35 -0700
X-CSE-ConnectionGUID: PLjnNUosQC+ycaWZC9lIrg==
X-CSE-MsgGUID: NSRSsDWCTYuVDNFU6gi4UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="125097630"
Received: from dut4432lnl.fm.intel.com ([10.105.10.85])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 10:18:34 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v7 6/6] drm/xe/xe_vm: Implement xe_vm_get_faults_ioctl
Date: Mon, 10 Mar 2025 17:18:34 +0000
Message-ID: <20250310171834.78299-7-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250310171834.78299-1-jonathan.cavitt@intel.com>
References: <20250310171834.78299-1-jonathan.cavitt@intel.com>
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

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
CC: Jainxun Zhang <jianxun.zhang@intel.com>
CC: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  3 ++
 drivers/gpu/drm/xe/xe_vm.c     | 87 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h     |  2 +
 3 files changed, 92 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5d79b439dd62..2d22b3c2df09 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -194,6 +194,9 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_VM_GET_FAULTS, xe_vm_get_faults_ioctl,
+			  DRM_RENDER_ALLOW),
+
 };
 
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ff79ba8d3794..cb86be26bce2 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3528,6 +3528,93 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	return err;
 }
 
+static int xe_vm_get_faults_size(struct xe_vm *vm)
+{
+	int size;
+
+	spin_lock(&vm->pfs.lock);
+	size = vm->pfs.len * sizeof(struct xe_vm_fault);
+	spin_unlock(&vm->pfs.lock);
+
+	return size;
+}
+
+static int fill_faults(struct xe_vm *vm,
+		       struct drm_xe_vm_get_faults *args)
+{
+	struct xe_vm_fault __user *usr_ptr = u64_to_user_ptr(args->faults);
+	struct xe_vm_pf_entry *entry;
+	int ret = 0, i = 0;
+
+	spin_lock(&vm->pfs.lock);
+	list_for_each_entry(entry, &vm->pfs.list, list) {
+		struct xe_pagefault *pf = entry->pf;
+
+		if (i++ == args->fault_count)
+			break;
+
+		ret = put_user(pf->page_addr, &usr_ptr->address);
+		if (ret)
+			break;
+
+		ret = put_user(pf->address_type, &usr_ptr->address_type);
+		if (ret)
+			break;
+
+		ret = put_user(1, &usr_ptr->address_precision);
+		if (ret)
+			break;
+
+		usr_ptr++;
+	}
+	spin_unlock(&vm->pfs.lock);
+
+	return ret;
+}
+
+int xe_vm_get_faults_ioctl(struct drm_device *drm, void *data,
+			   struct drm_file *file)
+{
+	struct xe_device *xe = to_xe_device(drm);
+	struct xe_file *xef = to_xe_file(file);
+	struct drm_xe_vm_get_faults *args = data;
+	struct xe_vm *vm;
+	int size, fault_count, ret = 0;
+
+	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
+		return -EINVAL;
+
+	vm = xe_vm_lookup(xef, args->vm_id);
+	if (XE_IOCTL_DBG(xe, !vm))
+		return -ENOENT;
+
+	size = xe_vm_get_faults_size(vm);
+	fault_count = size / sizeof(struct xe_vm_fault);
+
+	if (size < 0) {
+		ret = size;
+		goto put_vm;
+	} else if (!args->size && !args->fault_count) {
+		args->size = size;
+		args->fault_count = fault_count;
+		goto put_vm;
+	}
+
+	if (XE_IOCTL_DBG(xe, args->size > size) ||
+	    XE_IOCTL_DBG(xe, args->fault_count > fault_count) ||
+	    XE_IOCTL_DBG(xe, args->size % sizeof(struct xe_vm_fault)) ||
+	    XE_IOCTL_DBG(xe, args->size / sizeof(struct xe_vm_fault) != args->fault_count)) {
+		ret = -EINVAL;
+		goto put_vm;
+	}
+
+	ret = fill_faults(vm, args);
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
index fe068e4448a6..c48bd6e6fe34 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -191,6 +191,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file);
 int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
 		     struct drm_file *file);
+int xe_vm_get_faults_ioctl(struct drm_device *dev, void *data,
+			   struct drm_file *file);
 
 void xe_vm_close_and_put(struct xe_vm *vm);
 
-- 
2.43.0

