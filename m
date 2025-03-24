Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C66DCA6E5FE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 22:58:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2CBF10E4DE;
	Mon, 24 Mar 2025 21:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bTt+k8wM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E0C10E4D8;
 Mon, 24 Mar 2025 21:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742853476; x=1774389476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p1dIHndRsAlVHjlyCmhSxpBu/UxQO4Gd2uFgdy75F0k=;
 b=bTt+k8wMSJarDDkpjB5T5owNJzNgaLXklFcT+4HnLFUmxu/uaKB4v4+N
 phxwhepfYf3CgDo4xoc/iSCHtG7qxO71M+EXSCHDiuWEsA8wzskkRjztB
 jAqo50KI8KMGtpNgeVpNLQjzRK/eiBIqJwGmCxfDnoVYhypPeISxgqbLU
 P6dScm1ujIHiW/rg5aNFsHYadXJFcArQ9fnFuMBC49vVMHsmMNM+/Ytt2
 X3PEAntpmD2u4DsgZJJs2HQ/c+PRjNWvPadJVSDem6CL8KHMJC1Xkv7EA
 uUhphD8jpPzuo5zmasdPcImLMWLB/JobsmWGRPbPhWdBSfxl20XZQKPDg A==;
X-CSE-ConnectionGUID: vp+V/I05TxOEpQx3G8vk/w==
X-CSE-MsgGUID: pQxhwTggTcmKdrQlOr1cDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="54723281"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="54723281"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 14:57:55 -0700
X-CSE-ConnectionGUID: pbo1TIlyRz+Mrgu/Gfyknw==
X-CSE-MsgGUID: aoIw1+TjSEaL6BL/hdWvHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="129236849"
Received: from dut4419lnl.fm.intel.com ([10.105.10.61])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 14:57:55 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com, raag.jadav@intel.com
Subject: [PATCH v11 3/5] drm/xe/uapi: Define drm_xe_vm_get_property
Date: Mon, 24 Mar 2025 21:57:50 +0000
Message-ID: <20250324215753.70768-4-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250324215753.70768-1-jonathan.cavitt@intel.com>
References: <20250324215753.70768-1-jonathan.cavitt@intel.com>
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

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Zhang Jianxun <jianxun.zhang@intel.com>
---
 include/uapi/drm/xe_drm.h | 79 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 616916985e3f..5817f246e620 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -81,6 +81,7 @@ extern "C" {
  *  - &DRM_IOCTL_XE_EXEC
  *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
  *  - &DRM_IOCTL_XE_OBSERVATION
+ *  - &DRM_IOCTL_XE_VM_GET_PROPERTY
  */
 
 /*
@@ -102,6 +103,7 @@ extern "C" {
 #define DRM_XE_EXEC			0x09
 #define DRM_XE_WAIT_USER_FENCE		0x0a
 #define DRM_XE_OBSERVATION		0x0b
+#define DRM_XE_VM_GET_PROPERTY		0x0c
 
 /* Must be kept compact -- no holes */
 
@@ -117,6 +119,7 @@ extern "C" {
 #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
+#define DRM_IOCTL_XE_VM_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_GET_PROPERTY, struct drm_xe_vm_get_property)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -1189,6 +1192,82 @@ struct drm_xe_vm_bind {
 	__u64 reserved[2];
 };
 
+/** struct xe_vm_fault - Describes faults for %DRM_XE_VM_GET_PROPERTY_FAULTS */
+struct xe_vm_fault {
+	/** @address: Address of the fault */
+	__u64 address;
+	/** @address_precision: Precision of faulted address */
+	__u32 address_precision;
+	/** @access_type: Type of address access that resulted in fault */
+	__u8 access_type;
+	/** @fault_type: Type of fault reported */
+	__u8 fault_type;
+	/** @fault_level: fault level of the fault */
+	__u8 fault_level;
+	/** @engine_class: class of engine fault was reported on */
+	__u8 engine_class;
+	/** @engine_instance: instance of engine fault was reported on */
+	__u8 engine_instance;
+	/** @pad: MBZ */
+	__u8 pad[7];
+	/** @reserved: MBZ */
+	__u64 reserved[3];
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

