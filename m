Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCF5CACCD2
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 11:09:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F35610E413;
	Mon,  8 Dec 2025 10:08:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="HMb3EKY2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4969C10E412
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 10:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765188533;
 bh=RsuR0vgUXBqUNzFadirZPWnLUP2K6yf9FQ/mtb8G9yM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HMb3EKY2D5Me5moI1wM+YgxNdBWNFo2WCTj1vZVYCqDXX1Zkoy4TzmUzL08sHBxEr
 W+2ZijO8Yc7kKn0gfzgxku3wtr1kmTPDTTtwrZhegKXtoWpJ7KX84oM4ypPfxDP2Gj
 gCepgmociowLtLCL9+3RncaOKqPw0K91nRdunWmHzNibG6fShqO8996m8VNI/YOO7b
 Jd/rKSHPoZie3rsMhKFAqRFKjfcIN4t6IVWrbH6zobrGg3XuzZoG5+owpBpg1CGIR4
 XARR3fZSGkP9NWFboaLu/Xdf6H5yLj1CpkfzdTUSHilrcc9V44cMwNncDdr9nsqK9O
 /iEhtYDdxgdDw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 816EE17E35CB;
 Mon,  8 Dec 2025 11:08:53 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com
Subject: [PATCH v8 04/13] drm/panthor: Add a PANTHOR_BO_SYNC ioctl
Date: Mon,  8 Dec 2025 11:08:31 +0100
Message-ID: <20251208100841.730527-5-boris.brezillon@collabora.com>
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

This will be used by the UMD to synchronize CPU-cached mappings when
the UMD can't do it directly (no usermode cache maintenance instruction
on Arm32).

v2:
- Change the flags so they better match the drm_gem_shmem_sync()
  semantics

v3:
- Add Steve's R-b

v4:
- No changes

v5:
- Drop Steve's R-b (the semantics changes call for a new review)

v6:
- Drop ret initialization in panthor_ioctl_bo_sync()
- Bail out early in panthor_ioctl_bo_sync() if ops.count is zero
- Drop unused PANTHOR_BO_SYNC_OP_FLAGS definition

v7:
- Hand-roll the sync logic (was previously provided by gem_shmem)

v8:
- Collect R-b

Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 41 ++++++++++++-
 drivers/gpu/drm/panthor/panthor_gem.c | 85 +++++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_gem.h |  2 +
 include/uapi/drm/panthor_drm.h        | 52 ++++++++++++++++
 4 files changed, 179 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index f962e4c3de88..cc873f2d824c 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -177,7 +177,8 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_sync_op, timeline_value), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
-		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs))
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_bo_sync_op, size))
 
 /**
  * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
@@ -1396,6 +1397,43 @@ static int panthor_ioctl_set_user_mmio_offset(struct drm_device *ddev,
 	return 0;
 }
 
+static int panthor_ioctl_bo_sync(struct drm_device *ddev, void *data,
+				 struct drm_file *file)
+{
+	struct drm_panthor_bo_sync *args = data;
+	struct drm_panthor_bo_sync_op *ops;
+	struct drm_gem_object *obj;
+	int ret;
+
+	if (!args->ops.count)
+		return 0;
+
+	ret = PANTHOR_UOBJ_GET_ARRAY(ops, &args->ops);
+	if (ret)
+		return ret;
+
+	for (u32 i = 0; i < args->ops.count; i++) {
+		obj = drm_gem_object_lookup(file, ops[i].handle);
+		if (!obj) {
+			ret = -ENOENT;
+			goto err_ops;
+		}
+
+		ret = panthor_gem_sync(obj, ops[i].type, ops[i].offset,
+				       ops[i].size);
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
 static int
 panthor_open(struct drm_device *ddev, struct drm_file *file)
 {
@@ -1470,6 +1508,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
 	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(BO_SET_LABEL, bo_set_label, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(SET_USER_MMIO_OFFSET, set_user_mmio_offset, DRM_RENDER_ALLOW),
+	PANTHOR_IOCTL(BO_SYNC, bo_sync, DRM_RENDER_ALLOW),
 };
 
 static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 173d42d65000..4be32fc1732b 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -447,6 +447,91 @@ panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label)
 	panthor_gem_bo_set_label(bo->obj, str);
 }
 
+int
+panthor_gem_sync(struct drm_gem_object *obj, u32 type,
+		 u64 offset, u64 size)
+{
+	struct panthor_gem_object *bo = to_panthor_bo(obj);
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
+	case DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH:
+	case DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE:
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
+		if (type == DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE)
+			dma_sync_single_for_cpu(dev->dev, paddr, len, DMA_FROM_DEVICE);
+	}
+
+	return 0;
+}
+
 #ifdef CONFIG_DEBUG_FS
 struct gem_size_totals {
 	size_t size;
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 91d1880f8a5d..bbf9ae75c360 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -146,6 +146,8 @@ panthor_gem_create_with_handle(struct drm_file *file,
 
 void panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *label);
 void panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label);
+int panthor_gem_sync(struct drm_gem_object *obj,
+		     u32 type, u64 offset, u64 size);
 
 struct drm_gem_object *
 panthor_gem_prime_import(struct drm_device *dev,
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 28cf9e878db6..9f810305db6e 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -144,6 +144,9 @@ enum drm_panthor_ioctl_id {
 	 * pgoff_t size.
 	 */
 	DRM_PANTHOR_SET_USER_MMIO_OFFSET,
+
+	/** @DRM_PANTHOR_BO_SYNC: Sync BO data to/from the device */
+	DRM_PANTHOR_BO_SYNC,
 };
 
 /**
@@ -1073,6 +1076,53 @@ struct drm_panthor_set_user_mmio_offset {
 	__u64 offset;
 };
 
+/**
+ * enum drm_panthor_bo_sync_op_type - BO sync type
+ */
+enum drm_panthor_bo_sync_op_type {
+	/** @DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH: Flush CPU caches. */
+	DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH = 0,
+
+	/** @DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE: Flush and invalidate CPU caches. */
+	DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE = 1,
+};
+
+/**
+ * struct drm_panthor_bo_sync_op - BO map sync op
+ */
+struct drm_panthor_bo_sync_op {
+	/** @handle: Handle of the buffer object to sync. */
+	__u32 handle;
+
+	/** @type: Type of operation. */
+	__u32 type;
+
+	/**
+	 * @offset: Offset into the BO at which the sync range starts.
+	 *
+	 * This will be rounded down to the nearest cache line as needed.
+	 */
+	__u64 offset;
+
+	/**
+	 * @size: Size of the range to sync
+	 *
+	 * @size + @offset will be rounded up to the nearest cache line as
+	 * needed.
+	 */
+	__u64 size;
+};
+
+/**
+ * struct drm_panthor_bo_sync - BO map sync request
+ */
+struct drm_panthor_bo_sync {
+	/**
+	 * @ops: Array of struct drm_panthor_bo_sync_op sync operations.
+	 */
+	struct drm_panthor_obj_array ops;
+};
+
 /**
  * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
  * @__access: Access type. Must be R, W or RW.
@@ -1119,6 +1169,8 @@ enum {
 		DRM_IOCTL_PANTHOR(WR, BO_SET_LABEL, bo_set_label),
 	DRM_IOCTL_PANTHOR_SET_USER_MMIO_OFFSET =
 		DRM_IOCTL_PANTHOR(WR, SET_USER_MMIO_OFFSET, set_user_mmio_offset),
+	DRM_IOCTL_PANTHOR_BO_SYNC =
+		DRM_IOCTL_PANTHOR(WR, BO_SYNC, bo_sync),
 };
 
 #if defined(__cplusplus)
-- 
2.51.1

