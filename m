Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CB6C3A1C4
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 11:11:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C127A10E879;
	Thu,  6 Nov 2025 10:11:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VwKj0yJ8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C12610E878
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 10:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762423868; x=1793959868;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FeKreRzpTf4oUVOJN00C52acwIvKWUx/DaXpk6X5XN8=;
 b=VwKj0yJ8w4v7+w94a4xH2oYZ1lk812qvzwarQTsBbs/LoLdEgTeqmg8X
 HBEkUL78NjlKyA6LLIHrVhJ0bRTDMNgLTNnwz89SsYxTRykYUgs0Cgxoi
 80PyUXXE/K931drIrOB6QoIGlDvMszl/55T97B0rDbZiJ+YPGVt9rYxrf
 /BnBZE5L02JoJVG3mcQcadp9NLsiZOFmmTc8uCDcAjRJECQY6WPYwzEGR
 ta3oken+Q0KiuYveEeLSDxl8r9CYYMckuqtsb9gbYGo/ObJZcDiBqpUaf
 Hzl3IlkdLkxbuAlKrgmCt4OX6tK5IHjasUbDVespL1k/v7cwqkNWh2Z4z w==;
X-CSE-ConnectionGUID: 6DOhdLX5TDyAMk2qArQXeQ==
X-CSE-MsgGUID: EwQ5gjzgQcq7dido1BKLDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="81959757"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="81959757"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:11:08 -0800
X-CSE-ConnectionGUID: Tvn9hG7QTOqGy+F6WnG1nw==
X-CSE-MsgGUID: ajSUi699TIio5sSYhx9gmg==
X-ExtLoop1: 1
Received: from pl-npu-pc-kwachow.igk.intel.com ([10.91.220.239])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:11:06 -0800
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Subject: [PATCH 1/2] accel/ivpu: Add fdinfo support for memory statistics
Date: Thu,  6 Nov 2025 11:10:51 +0100
Message-ID: <20251106101052.1050348-2-karol.wachowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106101052.1050348-1-karol.wachowski@linux.intel.com>
References: <20251106101052.1050348-1-karol.wachowski@linux.intel.com>
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

Implement DRM fdinfo interface to expose memory usage statistics
for NPU device file descriptors. Exclude unpinned and imported
buffers from resident memory calculations to provide accurate
memory usage reporting.

Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c |  6 ++++++
 drivers/accel/ivpu/ivpu_gem.c | 12 ++++++++++++
 drivers/accel/ivpu/ivpu_gem.h |  5 +++++
 3 files changed, 23 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index b305effcf003..ce7dbd473059 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -455,6 +455,9 @@ int ivpu_shutdown(struct ivpu_device *vdev)
 static const struct file_operations ivpu_fops = {
 	.owner		= THIS_MODULE,
 	DRM_ACCEL_FOPS,
+#if CONFIG_PROC_FS
+	.show_fdinfo = drm_show_fdinfo,
+#endif
 };
 
 static const struct drm_driver driver = {
@@ -469,6 +472,9 @@ static const struct drm_driver driver = {
 	.ioctls = ivpu_drm_ioctls,
 	.num_ioctls = ARRAY_SIZE(ivpu_drm_ioctls),
 	.fops = &ivpu_fops,
+#if CONFIG_PROC_FS
+	.show_fdinfo = drm_show_memory_stats,
+#endif
 
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index 03d39615ad37..a460cef4e0a0 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -335,6 +335,17 @@ static void ivpu_gem_bo_free(struct drm_gem_object *obj)
 	drm_gem_shmem_free(&bo->base);
 }
 
+static enum drm_gem_object_status ivpu_gem_status(struct drm_gem_object *obj)
+{
+	struct ivpu_bo *bo = to_ivpu_bo(obj);
+	enum drm_gem_object_status status = 0;
+
+	if (ivpu_bo_is_resident(bo))
+		status |= DRM_GEM_OBJECT_RESIDENT;
+
+	return status;
+}
+
 static const struct drm_gem_object_funcs ivpu_gem_funcs = {
 	.free = ivpu_gem_bo_free,
 	.open = ivpu_gem_bo_open,
@@ -345,6 +356,7 @@ static const struct drm_gem_object_funcs ivpu_gem_funcs = {
 	.vmap = drm_gem_shmem_object_vmap,
 	.vunmap = drm_gem_shmem_object_vunmap,
 	.mmap = drm_gem_shmem_object_mmap,
+	.status = ivpu_gem_status,
 	.vm_ops = &drm_gem_shmem_vm_ops,
 };
 
diff --git a/drivers/accel/ivpu/ivpu_gem.h b/drivers/accel/ivpu/ivpu_gem.h
index 2dcd7eba9cb7..0c3350f22b55 100644
--- a/drivers/accel/ivpu/ivpu_gem.h
+++ b/drivers/accel/ivpu/ivpu_gem.h
@@ -82,6 +82,11 @@ static inline bool ivpu_bo_is_read_only(struct ivpu_bo *bo)
 	return bo->flags & DRM_IVPU_BO_READ_ONLY;
 }
 
+static inline bool ivpu_bo_is_resident(struct ivpu_bo *bo)
+{
+	return !!bo->base.pages;
+}
+
 static inline void *ivpu_to_cpu_addr(struct ivpu_bo *bo, u32 vpu_addr)
 {
 	if (vpu_addr < bo->vpu_addr)
-- 
2.43.0

