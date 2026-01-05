Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA24CF5935
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 21:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1499310E444;
	Mon,  5 Jan 2026 20:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ioa3DoaO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A828C10E0CA;
 Mon,  5 Jan 2026 20:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767646406; x=1799182406;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wL5EatRmEkWSG6sdPRDcx/B1hbgy4WXd5pgERxkR7Zg=;
 b=ioa3DoaOD5eM4cJjnUg8aEwRvl0ESxiq36mX7wRnYH07xRg9p9J1c0rq
 /EtILupm5W+kpx60h5oHZquTvkErpKDOex7l5zoBXV+wuGLYY5vWoB+Q1
 9IhqCRsKrj9vGCtfCeB0PMMDkBmvehtty3gdAxH8HIhBfhBhgrVFS2Pbe
 9lIFVN4TO5W/RCEXlSBC39wzz62CWp+Bas9hlglMiNfDSTBwVh297PfWn
 KenaV6NpLkzfUGh5Ny+PWKBy1/AXltkc8ibRnO4zC5Na9bonFEFyw376q
 +raVppCJcrOnpZNFrWnZ91aPhFWv2/xI5jFN951tEPbIga8cihPi27F7F w==;
X-CSE-ConnectionGUID: 5AU4tSFbRzCnkLGvwBlxtA==
X-CSE-MsgGUID: P7pWL8+YQzSFOFFH0CQiRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68924226"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="68924226"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 12:53:25 -0800
X-CSE-ConnectionGUID: JychbT4sTt2s4zHcWM1A1A==
X-CSE-MsgGUID: Y1FvP4OlQzWl7qA2MRMrSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="233613801"
Received: from dut4450lnl.fm.intel.com ([10.105.10.103])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 12:53:25 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com, raag.jadav@intel.com, ivan.briano@intel.com,
 matthew.auld@intel.com, dafna.hirschfeld@intel.com
Subject: [PATCH v32 3/5] drm/xe/uapi: Define drm_xe_vm_get_property
Date: Mon,  5 Jan 2026 20:53:27 +0000
Message-ID: <20260105205323.81875-10-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260105205323.81875-7-jonathan.cavitt@intel.com>
References: <20260105205323.81875-7-jonathan.cavitt@intel.com>
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

Add initial declarations for the drm_xe_vm_get_property ioctl.

v2:
- Expand kernel docs for drm_xe_vm_get_property (Jianxun)

v3:
- Remove address type external definitions (Jianxun)
- Add fault type to xe_drm_fault struct (Jianxun)

v4:
- Remove engine class and instance (Ivan)

v5:
- Add declares for fault type, access type, and fault level (Matt Brost,
  Ivan)

v6:
- Fix inconsistent use of whitespace in defines

v7:
- Rebase and refactor (jcavitt)

v8:
- Rebase (jcavitt)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
Acked-by: Matthew Brost <matthew.brost@intel.com>
Acked-by: Ivan Briano <ivan.briano@intel.com>
Cc: Zhang Jianxun <jianxun.zhang@intel.com>
Cc: Ivan Briano <ivan.briano@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 include/uapi/drm/xe_drm.h | 86 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index bb69f9b30c7d..0caef195b240 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -83,6 +83,7 @@ extern "C" {
  *  - &DRM_IOCTL_XE_OBSERVATION
  *  - &DRM_IOCTL_XE_MADVISE
  *  - &DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
+ *  - &DRM_IOCTL_XE_VM_GET_PROPERTY
  */
 
 /*
@@ -107,6 +108,7 @@ extern "C" {
 #define DRM_XE_MADVISE			0x0c
 #define DRM_XE_VM_QUERY_MEM_RANGE_ATTRS	0x0d
 #define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x0e
+#define DRM_XE_VM_GET_PROPERTY		0x0f
 
 /* Must be kept compact -- no holes */
 
@@ -125,6 +127,7 @@ extern "C" {
 #define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
 #define DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_MEM_RANGE_ATTRS, struct drm_xe_vm_query_mem_range_attr)
 #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
+#define DRM_IOCTL_XE_VM_GET_PROPERTY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_GET_PROPERTY, struct drm_xe_vm_get_property)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -1249,6 +1252,89 @@ struct drm_xe_vm_bind {
 	__u64 reserved[2];
 };
 
+/** struct xe_vm_fault - Describes faults for %DRM_XE_VM_GET_PROPERTY_FAULTS */
+struct xe_vm_fault {
+	/** @address: Address of the fault */
+	__u64 address;
+	/** @address_precision: Precision of faulted address */
+	__u32 address_precision;
+	/** @access_type: Type of address access that resulted in fault */
+#define FAULT_ACCESS_TYPE_READ		0
+#define FAULT_ACCESS_TYPE_WRITE		1
+#define FAULT_ACCESS_TYPE_ATOMIC	2
+	__u8 access_type;
+	/** @fault_type: Type of fault reported */
+#define FAULT_TYPE_NOT_PRESENT		0
+#define FAULT_TYPE_WRITE_ACCESS		1
+#define FAULT_TYPE_ATOMIC_ACCESS	2
+	__u8 fault_type;
+	/** @fault_level: fault level of the fault */
+#define FAULT_LEVEL_PTE		0
+#define FAULT_LEVEL_PDE		1
+#define FAULT_LEVEL_PDP		2
+#define FAULT_LEVEL_PML4	3
+#define FAULT_LEVEL_PML5	4
+	__u8 fault_level;
+	/** @pad: MBZ */
+	__u8 pad;
+	/** @reserved: MBZ */
+	__u64 reserved[4];
+};
+
+/**
+ * struct drm_xe_vm_get_property - Input of &DRM_IOCTL_XE_VM_GET_PROPERTY
+ *
+ * The user provides a VM and a property to query among DRM_XE_VM_GET_PROPERTY_*,
+ * and sets the values in the vm_id and property members, respectively.  This
+ * determines both the VM to get the property of, as well as the property to
+ * report.
+ *
+ * If size is set to 0, the driver fills it with the required size for the
+ * requested property.  The user is expected here to allocate memory for the
+ * property structure and to provide a pointer to the allocated memory using the
+ * data member.  For some properties, this may be zero, in which case, the
+ * value of the property will be saved to the value member and size will remain
+ * zero on return.
+ *
+ * If size is not zero, then the IOCTL will attempt to copy the requested
+ * property into the data member.
+ *
+ * The IOCTL will return -ENOENT if the VM could not be identified from the
+ * provided VM ID, or -EINVAL if the IOCTL fails for any other reason, such as
+ * providing an invalid size for the given property or if the property data
+ * could not be copied to the memory allocated to the data member.
+ *
+ * The property member can be:
+ *  - %DRM_XE_VM_GET_PROPERTY_FAULTS
+ */
+struct drm_xe_vm_get_property {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @vm_id: The ID of the VM to query the properties of */
+	__u32 vm_id;
+
+#define DRM_XE_VM_GET_PROPERTY_FAULTS		0
+	/** @property: property to get */
+	__u32 property;
+
+	/** @size: Size to allocate for @data */
+	__u32 size;
+
+	/** @pad: MBZ */
+	__u32 pad;
+
+	union {
+		/** @data: Pointer to user-defined array of flexible size and type */
+		__u64 data;
+		/** @value: Return value for scalar queries */
+		__u64 value;
+	};
+
+	/** @reserved: MBZ */
+	__u64 reserved[3];
+};
+
 /**
  * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
  *
-- 
2.43.0

