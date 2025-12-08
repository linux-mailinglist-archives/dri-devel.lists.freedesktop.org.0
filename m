Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A270CACCEA
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 11:09:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3327710E425;
	Mon,  8 Dec 2025 10:09:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="C4koiNPF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1D910E416
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 10:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765188537;
 bh=iIVPXoD/DG5qdH3r/CaS/piS2js+RBGiwjc/6oCbraI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C4koiNPF0njji03zaYivdlbxm1uI9ssBpVbCeFYo7s5SWBtEiyjpPg3cL/VJ0OwVY
 ypZ4sXelRTdL61ytBP3GPv9r8x29hZR+VDBpEOMmjJjxtAhTuFP7FrVK/YT383CzHl
 pUFOXBohMjoHkLOrzfny5jo97gTX/xrMId/MTGGsT5ZB5lF5iYAo9EAkAul7RQC29G
 bD/oMW6jZ2xuwUyYjQjXRxlEw6kNjPlndPBV9mKC8w+JuBgHHfmhUABG+fYPUZKWEx
 wPANhYvDuZzhH1DolhLUkd2m84MUr+pT9Wxcsma62+wPLmaRZRzKldBiusRTCR08oa
 L5ry2A8mkzFeQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id ABB5E17E1572;
 Mon,  8 Dec 2025 11:08:56 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v8 10/13] drm/panfrost: Add a PANFROST_SYNC_BO ioctl
Date: Mon,  8 Dec 2025 11:08:37 +0100
Message-ID: <20251208100841.730527-11-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251208100841.730527-1-boris.brezillon@collabora.com>
References: <20251208100841.730527-1-boris.brezillon@collabora.com>
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

From: Faith Ekstrand <faith.ekstrand@collabora.com>

This will be used by the UMD to synchronize CPU-cached mappings when
the UMD can't do it directly (no usermode cache maintenance instruction
on Arm32).

v2:
- Add more to the commit message
- Change the flags to better match the drm_gem_shmem_sync semantics

v3:
- Add Steve's R-b

v4:
- No changes

v5:
- Drop Steve's R-b (semantics changes requiring a new review)

v6:
- Bail out early in panfrost_ioctl_sync_bo() if op_count is zero

v7:
- Hand-roll our own bo_sync() helper

v8:
- Collect R-b

Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 51 +++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gem.c | 84 +++++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gem.h |  2 +
 include/uapi/drm/panfrost_drm.h         | 45 +++++++++++++
 4 files changed, 182 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index d650cd138dad..77b0ae5ef000 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -580,6 +580,56 @@ static int panfrost_ioctl_jm_ctx_destroy(struct drm_device *dev, void *data,
 	return panfrost_jm_ctx_destroy(file, args->handle);
 }
 
+static int panfrost_ioctl_sync_bo(struct drm_device *ddev, void *data,
+				  struct drm_file *file)
+{
+	struct drm_panfrost_sync_bo *args = data;
+	struct drm_panfrost_bo_sync_op *ops;
+	struct drm_gem_object *obj;
+	int ret;
+	u32 i;
+
+	if (args->pad)
+		return -EINVAL;
+
+	if (!args->op_count)
+		return 0;
+
+	ops = kvmalloc_array(args->op_count, sizeof(*ops), GFP_KERNEL);
+	if (!ops) {
+		DRM_DEBUG("Failed to allocate incoming BO sync ops array\n");
+		return -ENOMEM;
+	}
+
+	if (copy_from_user(ops, (void __user *)(uintptr_t)args->ops,
+			   args->op_count * sizeof(*ops))) {
+		DRM_DEBUG("Failed to copy in BO sync ops\n");
+		ret = -EFAULT;
+		goto err_ops;
+	}
+
+	for (i = 0; i < args->op_count; i++) {
+		obj = drm_gem_object_lookup(file, ops[i].handle);
+		if (!obj) {
+			ret = -ENOENT;
+			goto err_ops;
+		}
+
+		ret = panfrost_gem_sync(obj, ops[i].type,
+					ops[i].offset, ops[i].size);
+
+		drm_gem_object_put(obj);
+
+		if (ret)
+			goto err_ops;
+	}
+
+err_ops:
+	kvfree(ops);
+
+	return ret;
+}
+
 int panfrost_unstable_ioctl_check(void)
 {
 	if (!unstable_ioctls)
@@ -649,6 +699,7 @@ static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
 	PANFROST_IOCTL(SET_LABEL_BO,	set_label_bo,	DRM_RENDER_ALLOW),
 	PANFROST_IOCTL(JM_CTX_CREATE,	jm_ctx_create,	DRM_RENDER_ALLOW),
 	PANFROST_IOCTL(JM_CTX_DESTROY,	jm_ctx_destroy,	DRM_RENDER_ALLOW),
+	PANFROST_IOCTL(SYNC_BO,		sync_bo,	DRM_RENDER_ALLOW),
 };
 
 static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 4afd1a7f77d5..8231ae04f54c 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -489,6 +489,90 @@ panfrost_gem_set_label(struct drm_gem_object *obj, const char *label)
 	kfree_const(old_label);
 }
 
+int
+panfrost_gem_sync(struct drm_gem_object *obj, u32 type, u32 offset, u32 size)
+{
+	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
+	struct drm_gem_shmem_object *shmem = &bo->base;
+	const struct drm_device *dev = shmem->base.dev;
+	struct sg_table *sgt;
+	struct scatterlist *sgl;
+	unsigned int count;
+
+	/* Make sure the range is in bounds. */
+	if (offset + size < offset || offset + size > shmem->base.size)
+		return -EINVAL;
+
+	/* Disallow CPU-cache maintenance on imported buffers. */
+	if (drm_gem_is_imported(&shmem->base))
+		return -EINVAL;
+
+	switch (type) {
+	case PANFROST_BO_SYNC_CPU_CACHE_FLUSH:
+	case PANFROST_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE:
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	/* Don't bother if it's WC-mapped */
+	if (shmem->map_wc)
+		return 0;
+
+	/* Nothing to do if the size is zero. */
+	if (size == 0)
+		return 0;
+
+	sgt = drm_gem_shmem_get_pages_sgt(shmem);
+	if (IS_ERR(sgt))
+		return PTR_ERR(sgt);
+
+	for_each_sgtable_dma_sg(sgt, sgl, count) {
+		if (size == 0)
+			break;
+
+		dma_addr_t paddr = sg_dma_address(sgl);
+		size_t len = sg_dma_len(sgl);
+
+		if (len <= offset) {
+			offset -= len;
+			continue;
+		}
+
+		paddr += offset;
+		len -= offset;
+		len = min_t(size_t, len, size);
+		size -= len;
+		offset = 0;
+
+		/* It's unclear whether dma_sync_xxx() is the right API to do CPU
+		 * cache maintenance given an IOMMU can register their own
+		 * implementation doing more than just CPU cache flushes/invalidation,
+		 * and what we really care about here is CPU caches only, but that's
+		 * the best we have that is both arch-agnostic and does at least the
+		 * CPU cache maintenance on a <page,offset,size> tuple.
+		 *
+		 * Also, I wish we could do a single
+		 *
+		 *      dma_sync_single_for_device(BIDIR)
+		 *
+		 * and get a flush+invalidate, but that's not how it's implemented
+		 * in practice (at least on arm64), so we have to make it
+		 *
+		 *      dma_sync_single_for_device(TO_DEVICE)
+		 *      dma_sync_single_for_cpu(FROM_DEVICE)
+		 *
+		 * for the flush+invalidate case.
+		 */
+		dma_sync_single_for_device(dev->dev, paddr, len, DMA_TO_DEVICE);
+		if (type == PANFROST_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE)
+			dma_sync_single_for_cpu(dev->dev, paddr, len, DMA_FROM_DEVICE);
+	}
+
+	return 0;
+}
+
 void
 panfrost_gem_internal_set_label(struct drm_gem_object *obj, const char *label)
 {
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
index 7fec20339354..d61ffe1f6841 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
@@ -151,6 +151,8 @@ int panfrost_gem_shrinker_init(struct drm_device *dev);
 void panfrost_gem_shrinker_cleanup(struct drm_device *dev);
 
 void panfrost_gem_set_label(struct drm_gem_object *obj, const char *label);
+int panfrost_gem_sync(struct drm_gem_object *obj, u32 type,
+		      u32 offset, u32 size);
 void panfrost_gem_internal_set_label(struct drm_gem_object *obj, const char *label);
 
 #ifdef CONFIG_DEBUG_FS
diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index 0c59714ae42b..e194e087a0c8 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -24,6 +24,7 @@ extern "C" {
 #define DRM_PANFROST_SET_LABEL_BO		0x09
 #define DRM_PANFROST_JM_CTX_CREATE		0x0a
 #define DRM_PANFROST_JM_CTX_DESTROY		0x0b
+#define DRM_PANFROST_SYNC_BO			0x0c
 
 #define DRM_IOCTL_PANFROST_SUBMIT		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_SUBMIT, struct drm_panfrost_submit)
 #define DRM_IOCTL_PANFROST_WAIT_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_WAIT_BO, struct drm_panfrost_wait_bo)
@@ -35,6 +36,7 @@ extern "C" {
 #define DRM_IOCTL_PANFROST_SET_LABEL_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_SET_LABEL_BO, struct drm_panfrost_set_label_bo)
 #define DRM_IOCTL_PANFROST_JM_CTX_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_JM_CTX_CREATE, struct drm_panfrost_jm_ctx_create)
 #define DRM_IOCTL_PANFROST_JM_CTX_DESTROY	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_JM_CTX_DESTROY, struct drm_panfrost_jm_ctx_destroy)
+#define DRM_IOCTL_PANFROST_SYNC_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_SYNC_BO, struct drm_panfrost_sync_bo)
 
 /*
  * Unstable ioctl(s): only exposed when the unsafe unstable_ioctls module
@@ -308,6 +310,49 @@ struct drm_panfrost_set_label_bo {
 	__u64 label;
 };
 
+/* Valid flags to pass to drm_panfrost_bo_sync_op */
+#define PANFROST_BO_SYNC_CPU_CACHE_FLUSH			0
+#define PANFROST_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE		1
+
+/**
+ * struct drm_panthor_bo_flush_map_op - BO map sync op
+ */
+struct drm_panfrost_bo_sync_op {
+	/** @handle: Handle of the buffer object to sync. */
+	__u32 handle;
+
+	/** @type: Type of sync operation. */
+	__u32 type;
+
+	/**
+	 * @offset: Offset into the BO at which the sync range starts.
+	 *
+	 * This will be rounded down to the nearest cache line as needed.
+	 */
+	__u32 offset;
+
+	/**
+	 * @size: Size of the range to sync
+	 *
+	 * @size + @offset will be rounded up to the nearest cache line as
+	 * needed.
+	 */
+	__u32 size;
+};
+
+/**
+ * struct drm_panfrost_sync_bo - ioctl argument for syncing BO maps
+ */
+struct drm_panfrost_sync_bo {
+	/** Array of struct drm_panfrost_bo_sync_op */
+	__u64 ops;
+
+	/** Number of BO sync ops */
+	__u32 op_count;
+
+	__u32 pad;
+};
+
 /* Definitions for coredump decoding in user space */
 #define PANFROSTDUMP_MAJOR 1
 #define PANFROSTDUMP_MINOR 0
-- 
2.51.1

