Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C2A830EFF
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 23:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C55310E8BB;
	Wed, 17 Jan 2024 22:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9C410E899;
 Wed, 17 Jan 2024 22:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705528907; x=1737064907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r6IXPH8nFmUCtsYlHsaTJevYNgMKhxL2bz4Pqc5NHJM=;
 b=R/bMJ3f7VPMjQ/aOnESWWNpdQsh+5dgENeLqFu3VCeFEvqkSO6HRv1T5
 R6WaTqCJBgh7b1IiyKTXZ1lIf5GGA15y6G00J567qosIdXIKwB99t2Kkf
 FSbC/SnWxCvJwfaW+MYGs3cVv+voP/8wLRGl7/M9kycJ/EsPjoR9SlioF
 XifkW3rHs5WFY/D7GWu7Fg0Wcfp4SRXKhzwyN4ZfS4x8mBCwY3nkgdsr4
 Lvy9qhMYxLPaAgMynh0YvKV/mzuokBB8CYOVHe9LMoHYEtD3LzXWiCQKi
 v4zeiz/DJqXey8y4U2gr3SzqabJnlWMAznYqz7bGKNh2pXyWgHI5ztA81 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7657636"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7657636"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 14:01:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="734089284"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="734089284"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 14:01:46 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 23/23] drm/xe/svm: Add svm memory hints interface
Date: Wed, 17 Jan 2024 17:12:23 -0500
Message-Id: <20240117221223.18540-24-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240117221223.18540-1-oak.zeng@intel.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
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
Cc: matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com, himal.prasad.ghimiray@intel.com,
 krishnaiah.bommu@intel.com, niranjana.vishwanathapura@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 include/uapi/drm/xe_drm.h | 40 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 50bbea0992d9..551ed8706097 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -80,6 +80,7 @@ extern "C" {
  *  - &DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY
  *  - &DRM_IOCTL_XE_EXEC
  *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
+ *  - &DRM_IOCTL_XE_SVM
  */
 
 /*
@@ -100,6 +101,7 @@ extern "C" {
 #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x08
 #define DRM_XE_EXEC			0x09
 #define DRM_XE_WAIT_USER_FENCE		0x0a
+#define DRM_XE_SVM			0x0b
 /* Must be kept compact -- no holes */
 
 #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
@@ -113,6 +115,7 @@ extern "C" {
 #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
 #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
+#define DRM_IOCTL_XE_SVM			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_SVM, struct drm_xe_svm_args)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -1339,6 +1342,43 @@ struct drm_xe_wait_user_fence {
 	__u64 reserved[2];
 };
 
+enum drm_xe_svm_attr_type {
+	DRM_XE_SVM_ATTR_PREFERRED_LOC,
+	DRM_XE_SVM_ATTR_MIGRATION_GRANULARITY,
+	DRM_XE_SVM_ATTR_ATOMIC,
+	DRM_XE_SVM_ATTR_CACHE,
+	DRM_XE_SVM_ATTR_PREFETCH_LOC,
+	DRM_XE_SVM_ATTR_ACCESS_PATTERN,
+};
+
+struct drm_xe_svm_attr {
+	__u32 type;
+	__u32 value;
+};
+
+enum drm_xe_svm_op {
+	DRM_XE_SVM_OP_SET_ATTR,
+	DRM_XE_SVM_OP_GET_ATTR,
+};
+
+/**
+ * struct drm_xe_svm_args - Input of &DRM_IOCTL_XE_SVM
+ *
+ * Set or get memory attributes to a virtual address range
+ */
+struct drm_xe_svm_args {
+	/** @start: start of the virtual address range */
+	__u64 start;
+	/** @size: size of the virtual address range */
+	__u64 size;
+	/** @op: operation, either set or get */
+	__u32 op;
+	/** @nattr: number of attributes */
+	__u32 nattr;
+	/** @attrs: An array of attributes */
+	struct drm_xe_svm_attr attrs[];
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.26.3

