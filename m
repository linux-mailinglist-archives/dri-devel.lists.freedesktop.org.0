Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 950D8A9732A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 18:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3DF10E600;
	Tue, 22 Apr 2025 16:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B3PJnQVU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E5410E5E8;
 Tue, 22 Apr 2025 16:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745340966; x=1776876966;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tYgB3akWHDYdca3LJME4ncIGrZYDmBqxmA3A+NDhhCw=;
 b=B3PJnQVUOKPBogO0fap9lk0uwjczLXyEINfML4W0VoSnx3GGf99v6U8x
 jWboSJaoLX3/xFoeOTLAndptapCXHDfflAr7fo/2ld5LD8OA3GS7fBel/
 LUvXn3/F6RBVVUsiX+dEwSuT+R7rYhJMErrlj2S7xmU40bv/itZXbu89S
 QYepvmLwS1SdG6qbYQDQIwnIc2vc3KiFaad3i0c67QMN/O0KeQXrhsX7Y
 53vmjo9N1CBwCMIYv8OuSTnOjVzw+0p62QNkD+RHRtpyxYAf8jaBJvxju
 T5Gx7Us+EKDLAm1J3KGI+ndUUuVEqtlFp5DuziJmS7qPCXYB+ZCO/z252 A==;
X-CSE-ConnectionGUID: y5DbycqbT4+/GjRwdLu/jw==
X-CSE-MsgGUID: TE+W0pgLSiqzrutDL0Uthg==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46613172"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="46613172"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 09:56:05 -0700
X-CSE-ConnectionGUID: 3tGjiza+Q8ucRRq0Oab+ag==
X-CSE-MsgGUID: KgcpOnugRC+FuPZzWIsESA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="136855413"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 09:56:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v3 5/5] drm/xe: Add atomic_svm_timeslice_ms debugfs entry
Date: Tue, 22 Apr 2025 09:57:23 -0700
Message-Id: <20250422165723.584286-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422165723.584286-1-matthew.brost@intel.com>
References: <20250422165723.584286-1-matthew.brost@intel.com>
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

Add some informal control for atomic SVM fault GPU timeslice to be able
to play around with values and tweak performance.

v2:
 - Reduce timeslice default value to 5ms

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c      | 38 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.c       |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  3 +++
 drivers/gpu/drm/xe/xe_svm.c          |  3 ++-
 4 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index d0503959a8ed..d83cd6ed3fa8 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -191,6 +191,41 @@ static const struct file_operations wedged_mode_fops = {
 	.write = wedged_mode_set,
 };
 
+static ssize_t atomic_svm_timeslice_ms_show(struct file *f, char __user *ubuf,
+					    size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	char buf[32];
+	int len = 0;
+
+	len = scnprintf(buf, sizeof(buf), "%d\n", xe->atomic_svm_timeslice_ms);
+
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static ssize_t atomic_svm_timeslice_ms_set(struct file *f,
+					   const char __user *ubuf,
+					   size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	u32 atomic_svm_timeslice_ms;
+	ssize_t ret;
+
+	ret = kstrtouint_from_user(ubuf, size, 0, &atomic_svm_timeslice_ms);
+	if (ret)
+		return ret;
+
+	xe->atomic_svm_timeslice_ms = atomic_svm_timeslice_ms;
+
+	return size;
+}
+
+static const struct file_operations atomic_svm_timeslice_ms_fops = {
+	.owner = THIS_MODULE,
+	.read = atomic_svm_timeslice_ms_show,
+	.write = atomic_svm_timeslice_ms_set,
+};
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
@@ -211,6 +246,9 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("wedged_mode", 0600, root, xe,
 			    &wedged_mode_fops);
 
+	debugfs_create_file("atomic_svm_timeslice_ms", 0600, root, xe,
+			    &atomic_svm_timeslice_ms_fops);
+
 	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
 		man = ttm_manager_type(bdev, mem_type);
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 75e753e0a682..abf3c72baaa6 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -444,6 +444,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	xe->info.devid = pdev->device;
 	xe->info.revid = pdev->revision;
 	xe->info.force_execlist = xe_modparam.force_execlist;
+	xe->atomic_svm_timeslice_ms = 5;
 
 	err = xe_irq_init(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index b9a892c44c67..6f5222f42410 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -567,6 +567,9 @@ struct xe_device {
 	/** @pmu: performance monitoring unit */
 	struct xe_pmu pmu;
 
+	/** @atomic_svm_timeslice_ms: Atomic SVM fault timeslice MS */
+	u32 atomic_svm_timeslice_ms;
+
 #ifdef TEST_VM_OPS_ERROR
 	/**
 	 * @vm_inject_error_position: inject errors at different places in VM
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 3c1dcb6a98e6..10c014f7cfc9 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -784,7 +784,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		.devmem_only = atomic && IS_DGFX(vm->xe) &&
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
 		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
-			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? 5 : 0,
+			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
+			vm->xe->atomic_svm_timeslice_ms : 0,
 	};
 	struct xe_svm_range *range;
 	struct drm_gpusvm_range *r;
-- 
2.34.1

