Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50408A59D29
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 18:18:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3148310E498;
	Mon, 10 Mar 2025 17:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RlWwPvl+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C96C10E00A;
 Mon, 10 Mar 2025 17:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741627116; x=1773163116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Js3F+xcvqQ/b3H2lkKt5SK4bLmNS8gHwcvM+mikSozk=;
 b=RlWwPvl+0/wXIunNRF+hDgtdFSNsLrg1LAc1DYZu298JMvUeu1FgHGHa
 c1jaMmihZF4wS9baO8ojG2RqikixyzxYJ3zAkdddv3ndjc5FhAgt/4uju
 7Io0W+CwdvJkdoYNoO5o3aQ9Qlrb9WWC/6JE1agk9wNV5VVC3L1ci7SCH
 63Q+OuF4XqcowKJxeyMSFDwrDVhO48ao1zGsw8GhQ7qxyPy2cnB1+wWje
 DfuEbJ4kkwXZhaftYsnu4kHZ3qfx88tBLpFG7/4mNrmnt3Kcl+XuFXxSu
 NSCdu07m8nvbYwixkwDfE2ALjxTFQPpC7JnkdaZwMW7iUhmy2xMIjQtzH g==;
X-CSE-ConnectionGUID: LkXAH32wTPaA4jxSdPVrHQ==
X-CSE-MsgGUID: nUAqcQpzRW+qWAUUv2DlRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42669302"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="42669302"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 10:18:35 -0700
X-CSE-ConnectionGUID: N5cQE5IcT+Cm0I/57EKjcA==
X-CSE-MsgGUID: N6C4bHqBTROEzj2bcFd5Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="125097624"
Received: from dut4432lnl.fm.intel.com ([10.105.10.85])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 10:18:34 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v7 4/6] drm/xe/uapi: Define drm_xe_vm_get_faults
Date: Mon, 10 Mar 2025 17:18:32 +0000
Message-ID: <20250310171834.78299-5-jonathan.cavitt@intel.com>
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

Add initial declarations for the drm_xe_vm_get_faults ioctl.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 include/uapi/drm/xe_drm.h | 49 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 616916985e3f..90c2fcdbd5c1 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -81,6 +81,7 @@ extern "C" {
  *  - &DRM_IOCTL_XE_EXEC
  *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
  *  - &DRM_IOCTL_XE_OBSERVATION
+ *  - %DRM_IOCTL_XE_VM_GET_FAULTS
  */
 
 /*
@@ -102,6 +103,7 @@ extern "C" {
 #define DRM_XE_EXEC			0x09
 #define DRM_XE_WAIT_USER_FENCE		0x0a
 #define DRM_XE_OBSERVATION		0x0b
+#define DRM_XE_VM_GET_FAULTS		0x0c
 
 /* Must be kept compact -- no holes */
 
@@ -117,6 +119,7 @@ extern "C" {
 #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
+#define DRM_IOCTL_XE_VM_GET_FAULTS		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_GET_FAULTS, struct drm_xe_vm_get_faults)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -1189,6 +1192,52 @@ struct drm_xe_vm_bind {
 	__u64 reserved[2];
 };
 
+struct xe_vm_fault {
+	/** @address: Address of the fault, if relevant */
+	__u64 address;
+#define DRM_XE_FAULT_ADDRESS_TYPE_NONE_EXT		0
+#define DRM_XE_FAULT_ADDRESS_TYPE_READ_INVALID_EXT	1
+#define DRM_XE_FAULT_ADDRESS_TYPE_WRITE_INVALID_EXT	2
+	/** @address_type: , if relevant */
+	__u32 address_type;
+	/**
+	 * @address_precision: Precision of faulted address, if relevant.
+	 * Currently only SZ_4K.
+	 */
+	__u32 address_precision;
+	/** @reserved: MBZ */
+	__u64 reserved[3];
+};
+
+/**
+ * struct drm_xe_vm_get_faults - Input of &DRM_IOCTL_XE_VM_GET_FAULTS
+ *
+ * The user provides a VM ID, and the ioctl will
+ *
+ */
+struct drm_xe_vm_get_faults {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @vm_id: The ID of the VM to query the properties of */
+	__u32 vm_id;
+
+	/** @size: Size to allocate for @ptr */
+	__u32 size;
+
+	/** @fault_count: Number of faults to be returned */
+	__u32 fault_count;
+
+	/** @pad: MBZ */
+	__u32 pad;
+
+	/** @reserved: MBZ */
+	__u64 reserved[2];
+
+	/** @faults: Pointer to user-defined array of xe_vm_fault of flexible size */
+	__u64 faults;
+};
+
 /**
  * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
  *
-- 
2.43.0

