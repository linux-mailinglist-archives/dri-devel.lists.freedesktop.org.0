Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E25A4CDCD
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 23:00:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3509A10E2E1;
	Mon,  3 Mar 2025 22:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NsRFlFkd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2067C10E235;
 Mon,  3 Mar 2025 22:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741039224; x=1772575224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jW9HCMFaxV+0nZ+HwRtkYtQ0X4X9K64/Sw1hHLBoAeI=;
 b=NsRFlFkdUg2HGVnQP6ANYV4NQhUwb3/5XYvWGMu9RvVZgKOLXbX7pXoS
 masakNvBMPVHmRsejEg9DC8/Bg5MnxWV52XXJjmXzHAO9b64epEt/ia3w
 IX7v60QEUYROP+pqghiRYxvt3c1mXLGabcXZEDG5gWNR3bG+zZKWhWvju
 +naG1c0iz/PIOSWjqZYQcjv7wzi3q4B6lvT/1zKPWt3Z+lAIinelwrA/4
 UAanVifh6XG2wjY1xC9w+jMeOTbYEQYikcT0TBxWLBCxnG5Yd6h56lv97
 Qlc/GGcdpgyK1CBf8wtq5oRnzrrgBxw7nCNhPKEXsfCjsNH4sSgb5SmYS g==;
X-CSE-ConnectionGUID: SzFZtn+KSfaZn+HsWxqdWQ==
X-CSE-MsgGUID: z7HjVHa6RgSExvn7yMjs/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41846107"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41846107"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 14:00:24 -0800
X-CSE-ConnectionGUID: y+SzV5uGS5WNINIyiE56cQ==
X-CSE-MsgGUID: mSorDCYUSxCiSQTxqVukFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118020900"
Received: from dut4025lnl.fm.intel.com ([10.105.8.176])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 14:00:23 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 4/6] drm/xe/uapi: Define drm_xe_vm_get_property
Date: Mon,  3 Mar 2025 22:00:20 +0000
Message-ID: <20250303220022.67200-5-jonathan.cavitt@intel.com>
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

Add initial declarations for the drm_xe_vm_get_property ioctl.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 include/uapi/drm/xe_drm.h | 67 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 76a462fae05f..53617903b5ea 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -81,6 +81,7 @@ extern "C" {
  *  - &DRM_IOCTL_XE_EXEC
  *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
  *  - &DRM_IOCTL_XE_OBSERVATION
+ *  - %DRM_IOCTL_XE_VM_GET_PROPERTY
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
+#define DRM_IOCTL_XE_VM_GET_PROPERTY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_GET_PROPERTY, struct drm_xe_vm_get_property)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -1166,6 +1169,70 @@ struct drm_xe_vm_bind {
 	__u64 reserved[2];
 };
 
+struct drm_xe_pf {
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
+ * struct drm_xe_vm_get_property - Input of &DRM_IOCTL_XE_VM_GET_PROPERTY
+ *
+ * The user provides a VM ID and a property to query to this ioctl,
+ * and the ioctl returns the size of the return value.  Calling the
+ * ioctl again with memory reserved in @data will save the
+ * requested property data to the pointer saved at @data.
+ *
+ * In cases where the requested allocated memory size and the size of
+ * the returned data differ, the number of returned elements will be
+ * saved to @value.
+ *
+ * In the future, some properties may simply be scalar values.  In
+ * such cases, the size field will remain zero, and the value of the
+ * scalar property will be saved to @value.
+ *
+ * The valid properties are:
+ *  - %DRM_XE_VM_GET_PROPERTY_FAULTS : List of all failed pagefaults seen by VM
+ */
+struct drm_xe_vm_get_property {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @vm_id: The ID of the VM to query the properties of */
+	__u32 vm_id;
+
+#define DRM_XE_VM_GET_PROPERTY_FAULTS		0
+	/** @property: The property to get */
+	__u32 property;
+
+	/** @size: Size of returned property @data */
+	__u32 size;
+
+	/** @pad: MBZ */
+	__u32 pad;
+
+	union {
+		/** @value: Return for scalar data values */
+		__u64 value;
+		/** @ptr: Pointer to user structs when required */
+		__u64 ptr;
+	};
+
+	/** @reserved: MBZ */
+	__u64 reserved[2];
+};
+
 /**
  * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
  *
-- 
2.43.0

