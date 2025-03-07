Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 430E7A5750B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 23:41:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E4110EC59;
	Fri,  7 Mar 2025 22:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hpd5KrQe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5901410EC4C;
 Fri,  7 Mar 2025 22:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741387287; x=1772923287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mbWpqtKr6BYO68xlfuvOuVDZGQgsagwKp3nx/d3slJs=;
 b=hpd5KrQeNQolKHMx1Yxk44cHXT/oLo/jdd81pskENV3+OK3rVhYI03oS
 xUoGoPiGOJqYdtJ1O2fHr54iVL+8mfigjZGc7djeHNXvrwHiq76nUIueR
 hB6VVOxoGySpjjQT4TrAv7O5DuLvE+pc+hTmbRUZ9aDe3tuME2hV5hUwR
 v5ILcwhoR0kYmXG98eZBoGjugas0NTVJwA9DNE67e2g98IsAaRXyjaj7n
 pUsDJO9BCCub79fWBZzVs+Cb6U0oQTEfstDjbLVdzSy4ajo4oJltJ+t1i
 20ib84PC8ev2PhC5wt15EQFgLis3hAZucNJ+9cPIl2qaJUdEDEjCjD8wH w==;
X-CSE-ConnectionGUID: gAcow1yuQlCq3Lppol/rJQ==
X-CSE-MsgGUID: MSR4Iv6dR4edEyglvyZxjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="41704522"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="41704522"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 14:41:27 -0800
X-CSE-ConnectionGUID: f4seJWASSNCMFhmqeOa0kA==
X-CSE-MsgGUID: r6pe+WKCRBKhIdHGcuCWqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="124457962"
Received: from dut4440lnl.fm.intel.com ([10.105.10.114])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 14:41:27 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v6 6/6] drm/xe/xe_vm: Implement xe_vm_get_faults_ioctl
Date: Fri,  7 Mar 2025 22:41:24 +0000
Message-ID: <20250307224125.111430-7-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250307224125.111430-1-jonathan.cavitt@intel.com>
References: <20250307224125.111430-1-jonathan.cavitt@intel.com>
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

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
CC: Jainxun Zhang <jianxun.zhang@intel.com>
CC: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  3 ++
 drivers/gpu/drm/xe/xe_vm.c     | 78 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h     |  2 +
 3 files changed, 83 insertions(+)

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
index eada3ecc2364..e24601707f2a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3538,6 +3538,84 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
+
+		if (i == args->fault_count)
+			break;
+	}
+	spin_unlock(&vm->pfs.lock);
+
+	return ret ? -EFAULT : 0;
+}
+
+int xe_vm_get_faults_ioctl(struct drm_device *drm, void *data,
+			   struct drm_file *file)
+{
+	struct xe_device *xe = to_xe_device(drm);
+	struct xe_file *xef = to_xe_file(file);
+	struct drm_xe_vm_get_faults *args = data;
+	struct xe_vm *vm;
+	int size, fault_count;
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
+		return size;
+	} else if (!args->size && !args->fault_count) {
+		args->size = size;
+		args->fault_count = fault_count;
+		return 0;
+	} else if (args->size > size || args->fault_count > fault_count) {
+		return -EINVAL;
+	} else if (args->size / sizeof(struct xe_vm_fault) != args->fault_count) {
+		return -EINVAL;
+	}
+
+	return fill_faults(vm, args);
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

