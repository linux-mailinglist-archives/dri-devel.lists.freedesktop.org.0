Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F17CC028A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 00:10:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2123410E5D1;
	Mon, 15 Dec 2025 23:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HaBDSWi5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE1C10E59B;
 Mon, 15 Dec 2025 23:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765840195; x=1797376195;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hdp6T7q7JOe0MUoqXPvlsFQGqbr+zKg0701kOmYSSTo=;
 b=HaBDSWi5KH+ezh9ZndlH8MwPiUSTkt5sbHL7X8WgYuDpdKT4y8VnEz14
 /nNEmQCLcrqz7ks/07QY/jND5PFCnd5KEmyGbXbC+H78KOqGmS31Jwn8w
 eU5fVRQr/iBv7O3t6md9MYLskTE305wYvzfAtO9QSKnNMRx08BYMVYMEh
 eX5qZpEaiobq7AoPKEGZDGZojAZRfEsrF9fnQRSIMvnmZx/sFKay1VyjY
 xqirbNNrjnSXf3TEMIjJtkgMCabgt72H9SfWJTALUwp1+PNlFEsZixOxg
 QZfOC49jPepogRZUGUK3kuUTyqNpxL6dhdBisrmagRXRtXpuOmqdSZyNk w==;
X-CSE-ConnectionGUID: 7kkuo5a8T2qwT4Te8bX6JA==
X-CSE-MsgGUID: AClBCC3hQhmVWW4XWxWKTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67790376"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="67790376"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 15:09:53 -0800
X-CSE-ConnectionGUID: zjFfN5INTGqr6EnlkanOtQ==
X-CSE-MsgGUID: Zo++y2HbRseqZG6aBQBslg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="228511076"
Received: from dut4086lnl.fm.intel.com ([10.105.10.207])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 15:09:53 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com, raag.jadav@intel.com, ivan.briano@intel.com,
 matthew.auld@intel.com, dafna.hirschfeld@intel.com
Subject: [PATCH v31 5/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Date: Mon, 15 Dec 2025 23:09:55 +0000
Message-ID: <20251215230949.164845-12-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251215230949.164845-7-jonathan.cavitt@intel.com>
References: <20251215230949.164845-7-jonathan.cavitt@intel.com>
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

v13:
- Remove engine class and instance (Ivan)

v14:
- Map access type, fault type, and fault level to user macros (Matt
  Brost, Ivan)

v15:
- Remove unnecessary size assertion (jcavitt)

v16:
- Nit fixes (Matt Brost)

v17:
- Rebase and refactor (jcavitt)

v18:
- Do not copy_to_user in critical section (Matt Brost)
- Assert args->size is multiple of sizeof(struct xe_vm_fault) (Matt
  Brost)

v19:
- Remove unnecessary memset (Matt Brost)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Cc: Jainxun Zhang <jianxun.zhang@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
Cc: Ivan Briano <ivan.briano@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |   2 +
 drivers/gpu/drm/xe/xe_vm.c     | 117 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h     |   3 +
 3 files changed, 122 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index cdaa1c1e73f5..b616334b8a33 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -214,6 +214,8 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_SET_PROPERTY, xe_exec_queue_set_property_ioctl,
 			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_VM_GET_PROPERTY, xe_vm_get_property_ioctl,
+			  DRM_RENDER_ALLOW),
 };
 
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f50133808e43..3cc5d179fbda 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3857,6 +3857,123 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	return err;
 }
 
+/*
+ * Map access type, fault type, and fault level from current bspec
+ * specification to user spec abstraction.  The current mapping is
+ * 1-to-1, but if there is ever a hardware change, we will need
+ * this abstraction layer to maintain API stability through the
+ * hardware change.
+ */
+static u8 xe_to_user_access_type(u8 access_type)
+{
+	return access_type;
+}
+
+static u8 xe_to_user_fault_type(u8 fault_type)
+{
+	return fault_type;
+}
+
+static u8 xe_to_user_fault_level(u8 fault_level)
+{
+	return fault_level;
+}
+
+static int fill_faults(struct xe_vm *vm,
+		       struct drm_xe_vm_get_property *args)
+{
+	struct xe_vm_fault __user *usr_ptr = u64_to_user_ptr(args->data);
+	struct xe_vm_fault *fault_list, fault_entry = { 0 };
+	struct xe_vm_fault_entry *entry;
+	int ret = 0, i = 0, count, entry_size;
+
+	entry_size = sizeof(struct xe_vm_fault);
+	count = args->size / entry_size;
+
+	fault_list = kcalloc(count, sizeof(struct xe_vm_fault), GFP_KERNEL);
+	if (!fault_list)
+		return -ENOMEM;
+
+	spin_lock(&vm->faults.lock);
+	list_for_each_entry(entry, &vm->faults.list, list) {
+		if (i == count)
+			break;
+
+		fault_entry.address = entry->address;
+		fault_entry.address_precision = entry->address_precision;
+
+		fault_entry.access_type = xe_to_user_access_type(entry->access_type);
+		fault_entry.fault_type = xe_to_user_fault_type(entry->fault_type);
+		fault_entry.fault_level = xe_to_user_fault_level(entry->fault_level);
+
+		memcpy(&fault_list[i], &fault_entry, entry_size);
+
+		i++;
+	}
+	spin_unlock(&vm->faults.lock);
+
+	ret = copy_to_user(usr_ptr, fault_list, args->size);
+
+	kfree(fault_list);
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
+		if (!args->size) {
+			args->size = size;
+			return 0;
+		}
+
+		/*
+		 * Number of faults may increase between calls to
+		 * xe_vm_get_property_ioctl, so just report the number of
+		 * faults the user requests if it's less than or equal to
+		 * the number of faults in the VM fault array.
+		 *
+		 * We should also at least assert that the args->size value
+		 * is a multiple of the xe_vm_fault struct size.
+		 */
+		if (args->size > size || args->size % sizeof(struct xe_vm_fault))
+			return -EINVAL;
+
+		return fill_faults(vm, args);
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
+	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1] ||
+			     args->reserved[2]))
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
index e9f2de4189e0..f2675ec9e8c4 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -210,6 +210,9 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
 		     struct drm_file *file);
 int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
+int xe_vm_get_property_ioctl(struct drm_device *dev, void *data,
+			     struct drm_file *file);
+
 void xe_vm_close_and_put(struct xe_vm *vm);
 
 static inline bool xe_vm_in_fault_mode(struct xe_vm *vm)
-- 
2.43.0

