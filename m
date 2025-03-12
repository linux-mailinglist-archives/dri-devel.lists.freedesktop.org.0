Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2673FA5E623
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 22:06:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6AC10E7CC;
	Wed, 12 Mar 2025 21:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NWqZAmlo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB43210E7D1;
 Wed, 12 Mar 2025 21:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741813551; x=1773349551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/hME9QBqznrSwZL+fAQA9ZIpwxh1UjeE3wyklQNI0IU=;
 b=NWqZAmloqvoV6Pfw9QfuWXu2Yt/VUOl71cw89OPXXtnHOvK3u58f8P1q
 c7IJSNuXfhfP64wm4p1OLA7E4h4JBb11jceWnQsLf5RA5zwHf9bWpGlrN
 TulHHdjwj9f7FCwuG+XX5CyGMzJrTKq9hoqySt8dBSMp4+zj/xzSyW7To
 xUnXCJksuN3J9JuaBW+e4YZOFZfpEkIjQ23jNogs2T9EvnYj4OZ0jsXaw
 Zk0R6cE3dV31cebJhL/GD2RqcymvtPTBBpMdLAcCAqeuvlK3J4GlCAijt
 65fZM2fySPVO+WynvUIEaM+9xiexI6vyEKTpmHY9Ejx25dgMCXrcbQyw0 A==;
X-CSE-ConnectionGUID: f+aGMLCyQmWZy0vz2vplOg==
X-CSE-MsgGUID: dfwNNnAhRcCiiFC2wSGRkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="46562286"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="46562286"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:05:51 -0700
X-CSE-ConnectionGUID: Fi1nsatsTGWnFLsb5N/U5A==
X-CSE-MsgGUID: yZ3hM3ijRIu0ldJNh1SdMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="120791265"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.73])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:05:47 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [RFC PATCH 18/19] drm/xe/uapi: HAX: Add the xe_madvise_prefer_devmem
 IOCTL
Date: Wed, 12 Mar 2025 22:04:15 +0100
Message-ID: <20250312210416.3120-19-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
References: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

As a POC, add an xe_madvise_prefer_devmem IOCTL so that the user
can set the preferred pagemap to migrate to for a given memory
region (in this POC, the memory region is the whole GPU VM).

This is intended to be replaced by a proper madvise IOCTL, probably
with improved functionality

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  2 +
 drivers/gpu/drm/xe/xe_svm.c    | 72 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h    |  9 +++++
 include/uapi/drm/xe_drm.h      | 10 +++++
 4 files changed, 93 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 160b3c189de0..a6ac699e9d12 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -196,6 +196,8 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_DEVMEM_OPEN, xe_devmem_open_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_MADVISE_PREFER_DEVMEM, xe_madvise_prefer_devmem_ioctl,
+			  DRM_RENDER_ALLOW),
 };
 
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index ebdd27b02be7..56c2c731be27 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1338,3 +1338,75 @@ void xe_svm_vma_fini(struct xe_svm_vma *svma)
 		svma->pref_dpagemap = NULL;
 	}
 }
+
+/**
+ * xe_madvise_prefer_devmem_ioctl() - POC IOCTL callback implementing a rudimentary
+ * version of a madvise prefer_devmem() functionality.
+ * @dev: The struct drm_device.
+ * @data: The ioctl argurment.
+ * @file: The drm file.
+ *
+ * For the given gpu vm, look up all SVM gpu vmas and assign the preferred
+ * drm pagemap for migration to the one associated with the file-descriptor
+ * given by this function. If a negative (invalid) file descriptor is given,
+ * the function instead clears the preferred drm pagemap, meaning that at
+ * fault time, the drm pagemap associated with the same tile as the client
+ * is used.
+ *
+ * Return: %0 on success. Negative error code on failure.
+ */
+int xe_madvise_prefer_devmem_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct xe_device *xe = to_xe_device(dev);
+	struct xe_file *xef = to_xe_file(file);
+	struct drm_xe_madvise_prefer_devmem *args = data;
+	struct xe_vm *vm;
+	struct drm_pagemap *dpagemap;
+	struct drm_gpuva *gpuva;
+	struct xe_vma *gvma;
+	int err = 0;
+
+	if (XE_IOCTL_DBG(xe, args->extensions) ||
+	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
+		return -EINVAL;
+
+	vm = xe_vm_lookup(xef, args->vm_id);
+	if (XE_IOCTL_DBG(xe, !vm))
+		return -EINVAL;
+
+	if (args->devmem_fd < 0) {
+		dpagemap = NULL;
+	} else {
+		dpagemap = drm_pagemap_from_fd(args->devmem_fd);
+		if (XE_IOCTL_DBG(xe, IS_ERR(dpagemap))) {
+			err = PTR_ERR(dpagemap);
+			goto out_no_dpagemap;
+		}
+
+		if (XE_IOCTL_DBG(xe, drm_dev_is_unplugged(dpagemap->drm))) {
+			err = -ENODEV;
+			goto out_no_lock;
+		}
+	}
+
+	err = down_write_killable(&vm->lock);
+	if (err)
+		goto out_no_lock;
+
+	drm_gpuvm_for_each_va(gpuva, &vm->gpuvm) {
+		gvma = gpuva_to_vma(gpuva);
+		if (!xe_vma_is_cpu_addr_mirror(gvma))
+			continue;
+
+		if (dpagemap != gvma->svm.pref_dpagemap) {
+			drm_pagemap_put(gvma->svm.pref_dpagemap);
+			gvma->svm.pref_dpagemap = drm_pagemap_get(dpagemap);
+		}
+	}
+	up_write(&vm->lock);
+out_no_lock:
+	drm_pagemap_put(dpagemap);
+out_no_dpagemap:
+	xe_vm_put(vm);
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 4f1a9e410dad..7c076c36c1c5 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -146,6 +146,8 @@ static inline void xe_svm_vma_assign_dpagemap(struct xe_svm_vma *svma,
 	svma->pref_dpagemap = drm_pagemap_get(dpagemap);
 }
 
+int xe_madvise_prefer_devmem_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
+
 #else
 #include <linux/interval_tree.h>
 
@@ -237,6 +239,12 @@ static inline void xe_svm_notifier_unlock(struct xe_vm *vm)
 
 #define xe_svm_vma_assign_dpagemap(...) do {} while (0)
 
+static inline int
+xe_madvise_prefer_devmem_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	return -EOPNOTSUPP;
+}
+
 #endif
 
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
@@ -259,6 +267,7 @@ static inline int xe_devmem_open_ioctl(struct drm_device *dev, void *data, struc
 {
 	return -EOPNOTSUPP;
 }
+
 #endif
 
 #endif
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index bb22413713f0..d9572cfb5a10 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -103,6 +103,7 @@ extern "C" {
 #define DRM_XE_WAIT_USER_FENCE		0x0a
 #define DRM_XE_OBSERVATION		0x0b
 #define DRM_XE_DEVMEM_OPEN		0x0c
+#define DRM_XE_MADVISE_PREFER_DEVMEM    0x0d
 
 /* Must be kept compact -- no holes */
 
@@ -119,6 +120,7 @@ extern "C" {
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
 #define DRM_IOCTL_XE_DEVMEM_OPEN                DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVMEM_OPEN, struct drm_xe_devmem_open)
+#define DRM_IOCTL_XE_MADVISE_PREFER_DEVMEM      DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE_PREFER_DEVMEM, struct drm_xe_madvise_prefer_devmem)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -1990,6 +1992,14 @@ struct drm_xe_devmem_open {
 	__u64 reserved[2];
 };
 
+struct drm_xe_madvise_prefer_devmem {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+	__u32 vm_id;
+	__u32 devmem_fd;
+	__u64 reserved[2];
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.48.1

