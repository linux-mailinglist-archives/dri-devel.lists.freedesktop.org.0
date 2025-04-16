Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6450CA90AF2
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 20:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6CA10E9A1;
	Wed, 16 Apr 2025 18:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T1XNsq7g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D913510E994;
 Wed, 16 Apr 2025 18:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744826992; x=1776362992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jOgEMl8Vm4W2wLHdgcXRexS5KOev+FD23As4Ol6eNjk=;
 b=T1XNsq7gOS/MJ6T6hLk0wFnP3IDWvSN2+eNMr6YImW23B9S/C6JL7cec
 QyJ6TbkmGkWQOMVE1MwRPWWePgs8eCvNLrF3cGHE3AEIaxyl5hsW6xP0J
 cdZYPuFL5HQI/MQRabhryKGIfx1ev+XavHNOe7ZeyxWBzzdajglHnh+UC
 6MA+cLPLSUtuqm4PVwGyjY4GvHQDrlage7x9JjkraUYxwHIbpEfdO0Am/
 luazlaMeUH3e2WOQnLILdnW/Xe5PKPYl8l/VUx0shJSktHCH5DYbL1+P+
 Le+qgYunJNORbzIgsPycTCeDDTr1itTI28ioAqBrJdh3W0+jvanZI8z52 w==;
X-CSE-ConnectionGUID: vAOrAXLsTaCZggbYqw+KYA==
X-CSE-MsgGUID: +C77Cfy/TpuaR4UOOmzzgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="63799690"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="63799690"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 11:09:51 -0700
X-CSE-ConnectionGUID: 3lJ9sJ2RTy+L+/R+8u7FPg==
X-CSE-MsgGUID: AMI9MCSUSJO/L1kxeeE++Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="131468167"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 11:09:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [RFC PATCH 4/4] drm/xe: Add atomic_svm_timeslice_ms debugfs entry
Date: Wed, 16 Apr 2025 11:11:07 -0700
Message-Id: <20250416181107.409538-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250416181107.409538-1-matthew.brost@intel.com>
References: <20250416181107.409538-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c      | 38 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.c       |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  3 +++
 drivers/gpu/drm/xe/xe_svm.c          |  2 +-
 4 files changed, 43 insertions(+), 1 deletion(-)

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
index 75e753e0a682..7e620b11a9af 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -444,6 +444,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	xe->info.devid = pdev->device;
 	xe->info.revid = pdev->revision;
 	xe->info.force_execlist = xe_modparam.force_execlist;
+	xe->atomic_svm_timeslice_ms = 10;
 
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
index 121e39a2dd38..92aebb6b0902 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -780,7 +780,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		.check_pages_threshold = IS_DGFX(vm->xe) &&
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
 		.vram_only = atomic,
-		.timeslice_ms = atomic ? 10 : 0,
+		.timeslice_ms = atomic ? vm->xe->atomic_svm_timeslice_ms : 0,
 	};
 	struct xe_svm_range *range;
 	struct drm_gpusvm_range *r;
-- 
2.34.1

