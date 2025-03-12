Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 102E8A5E622
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 22:05:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06B910E7CF;
	Wed, 12 Mar 2025 21:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YV/kl9wM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68EA610E7CC;
 Wed, 12 Mar 2025 21:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741813548; x=1773349548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hKjlPMs2KQbWgu9vf2Ek3gtZg4TWzzTYkd2gqlXygk4=;
 b=YV/kl9wMLqauKKbRIbLroZPUei62vrHe7piz/dSqilLRLSNodXcDGc65
 b53QWt969c57gRa1ivG+wQnvAcqoljWmfkb5Mz+9RVIGktk52SOMei+cO
 uZo7J2kuaREO18I6BkLnYEj3+EUTylyxRyPvYpVgjiRlbS2MTIdPUKYFM
 SGjqr5lyPdd70vU25DfLIF3k4aKir8u4QYpObCCrGaQdJt8WQ33l7pYhb
 rwq05MuHpLqdqr1qcpWIUpX0xdYbNSmapf5FEAcfWYtXdLvcQOM14QgOQ
 Q1gK3pDc4ER2WPdrqVB7gliN4TvoKfBOKFhLNT4+qcJtYJR1WSJcajrKj g==;
X-CSE-ConnectionGUID: QVYKLgbeQMCgt3sLgadH6w==
X-CSE-MsgGUID: pf33JP79R9+FbZyvt5fPaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="46562275"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="46562275"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:05:48 -0700
X-CSE-ConnectionGUID: VUnBGTpMSk20pQIW1eiT4g==
X-CSE-MsgGUID: gCC8uwxHR++dZH48oFs1sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="120791244"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.73])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:05:44 -0700
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
Subject: [RFC PATCH 17/19] drm/xe/uapi: Add the devmem_open ioctl
Date: Wed, 12 Mar 2025 22:04:14 +0100
Message-ID: <20250312210416.3120-18-thomas.hellstrom@linux.intel.com>
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

Add an IOCTL to get a file descriptor referencing a memory region
for SVM.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  1 +
 drivers/gpu/drm/xe/xe_svm.c    | 50 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h    |  8 ++++++
 include/uapi/drm/xe_drm.h      | 29 ++++++++++++++++++++
 4 files changed, 88 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 68de09db9ad5..160b3c189de0 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -195,6 +195,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_DEVMEM_OPEN, xe_devmem_open_ioctl, DRM_RENDER_ALLOW),
 };
 
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 660fae255a09..ebdd27b02be7 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -6,6 +6,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_pagemap.h>
+#include <drm/drm_pagemap_util.h>
 
 #include "xe_bo.h"
 #include "xe_gt_tlb_invalidation.h"
@@ -1272,6 +1273,55 @@ xe_pagemap_find_or_create(struct xe_device *xe, struct xe_pagemap_cache *cache,
 	return xpagemap;
 }
 
+/**
+ * xe_devmem_open_ioctl() - IOCTL callback implementing the devmem_open functionality
+ * @dev: The struct drm_device.
+ * @data: The ioctl argurment.
+ * @file: The drm file.
+ *
+ * For the given xe device and memory region, open a pagemap and return a
+ * file descriptor that can be used to reference the pagemap. First,
+ * attempt to look up an already used or cached pagemap. If that fails,
+ * create a new one.
+ *
+ * Return: %0 on success. Negative error code on failure.
+ */
+int xe_devmem_open_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	struct xe_device *xe = to_xe_device(dev);
+	struct drm_xe_devmem_open *args = data;
+	struct drm_pagemap *dpagemap;
+	struct xe_pagemap *xpagemap;
+	struct xe_vram_region *vr;
+	u32 tile_id;
+	int fd;
+
+	if (XE_IOCTL_DBG(xe, args->extensions) ||
+	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
+		return -EINVAL;
+
+	tile_id = (u32)args->region_instance - 1;
+	if (XE_IOCTL_DBG(xe, tile_id >= xe->info.tile_count))
+		return -ENOENT;
+
+	if (XE_IOCTL_DBG(xe, !((BIT(tile_id) << 1) & xe->info.mem_region_mask)))
+		return -ENOENT;
+
+	vr = &xe->tiles[tile_id].mem.vram;
+	xpagemap = xe_pagemap_find_or_create(xe, &vr->pagemap_cache, vr);
+	if (XE_IOCTL_DBG(xe, IS_ERR(xpagemap)))
+		return -ENOENT;
+
+	dpagemap = &xpagemap->dpagemap;
+	fd = drm_pagemap_fd(dpagemap);
+	xe_pagemap_put(xpagemap);
+	if (XE_IOCTL_DBG(xe, fd < 0))
+		return fd;
+
+	args->pagemap_fd = fd;
+
+	return 0;
+}
 #endif
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index c5d542567cfc..4f1a9e410dad 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -149,6 +149,8 @@ static inline void xe_svm_vma_assign_dpagemap(struct xe_svm_vma *svma,
 #else
 #include <linux/interval_tree.h>
 
+struct drm_device;
+struct drm_file;
 struct drm_pagemap_device_addr;
 struct xe_bo;
 struct xe_device;
@@ -243,6 +245,8 @@ int xe_pagemap_cache_init(struct drm_device *drm, struct xe_pagemap_cache *cache
 
 void xe_pagemaps_remove(struct xe_device *xe);
 
+int xe_devmem_open_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
+
 #else
 
 #define xe_pagemap_cache_init(...) 0
@@ -251,6 +255,10 @@ static inline void xe_pagemaps_remove(struct xe_device *xe)
 {
 }
 
+static inline int xe_devmem_open_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
+{
+	return -EOPNOTSUPP;
+}
 #endif
 
 #endif
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 616916985e3f..bb22413713f0 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -102,6 +102,7 @@ extern "C" {
 #define DRM_XE_EXEC			0x09
 #define DRM_XE_WAIT_USER_FENCE		0x0a
 #define DRM_XE_OBSERVATION		0x0b
+#define DRM_XE_DEVMEM_OPEN		0x0c
 
 /* Must be kept compact -- no holes */
 
@@ -117,6 +118,7 @@ extern "C" {
 #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
+#define DRM_IOCTL_XE_DEVMEM_OPEN                DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVMEM_OPEN, struct drm_xe_devmem_open)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -1961,6 +1963,33 @@ struct drm_xe_query_eu_stall {
 	__u64 sampling_rates[];
 };
 
+/**
+ * struct drm_xe_devmem_open - Get a file-descriptor representing
+ * device memory on a specific tile on a specific device.
+ */
+struct drm_xe_devmem_open {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @region_instance: The memory region describing the device memory to open. */
+	__u16 region_instance;
+
+	/** @pad: MBZ */
+	__u16 pad;
+
+	/**
+	 * @pagemap_fd: On successful return, a file descriptor
+	 * representing the device memory to open.
+	 * Should be close()d when no longer in use. The file
+	 * descriptor can be used to represent the device memory in
+	 * gpu madvise ioctl and the devmem_allow ioctl.
+	 */
+	__u32 pagemap_fd;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.48.1

