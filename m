Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F688A9B125
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 16:38:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E6D10E814;
	Thu, 24 Apr 2025 14:38:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N5o1PQG6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE27710E46A;
 Thu, 24 Apr 2025 14:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745505494; x=1777041494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0lb8TXk3eQyGephTH3j7miNu/B9hrmE6PUAZ1yT/bi0=;
 b=N5o1PQG6vj1P5VrtZaF6IGNB9lklwI9PxARwIKkQXi7Ev3q7n61h9zgB
 Ac/Uy7+8jQF1gF9jckuKE243yIjZWIFHNeniMhO1U9f68hqE6mg5z7tWq
 wJRIZUqy5omZ2+dpdihnoSjUpw7QD7RCeY92icqEGGirB3PjV61K2IOMH
 QNcVBYcQ2kyvMVH7u6zkaCTirgsrpcYUZC2/X5vJ3qopJvoZqkC4iJ8/z
 GMHhsQt9IcJT4xnPJB4wk0Dv91F8+uGLJ9DE96/R9jTakLjrbNUarg7I0
 SBVrsnFz7AvIWDaMAkAM56IuluQgO6dh9zzU8tnWStP4V09RVWcRR4VEP g==;
X-CSE-ConnectionGUID: hYt9z/3CTBOrA81Q41tcrQ==
X-CSE-MsgGUID: n4v8vQG2T3Si8SIYIk7GCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="50952216"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="50952216"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 07:38:13 -0700
X-CSE-ConnectionGUID: ehh0b34zSUylo0s+MAMmcg==
X-CSE-MsgGUID: QxGBP303QS2oImKaR4A3RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="132615117"
Received: from live-gta-imageloader.fm.intel.com (HELO
 DUT4046PTLH.fm.intel.com) ([10.105.8.85])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 07:38:12 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com, raag.jadav@intel.com, john.c.harrison@intel.com,
 ivan.briano@intel.com, matthew.auld@intel.com
Subject: [PATCH v22 3/5] drm/xe/uapi: Define drm_xe_vm_get_property
Date: Thu, 24 Apr 2025 14:38:08 +0000
Message-ID: <20250424143812.11210-4-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424143812.11210-1-jonathan.cavitt@intel.com>
References: <20250424143812.11210-1-jonathan.cavitt@intel.com>
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

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Zhang Jianxun <jianxun.zhang@intel.com>
Cc: Ivan Briano <ivan.briano@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 include/uapi/drm/xe_drm.h | 86 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 9c08738c3b91..556fc360a076 100644
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
+#define DRM_IOCTL_XE_VM_GET_PROPERTY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_GET_PROPERTY, struct drm_xe_vm_get_property)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -1193,6 +1196,89 @@ struct drm_xe_vm_bind {
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

