Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED889BDF874
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 18:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B0410E86C;
	Wed, 15 Oct 2025 16:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="BXf1qEJK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF5210E866
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760544220;
 bh=vDBYvRf5vD15wx+kHgX5NW83BHB7zTxdowtitMoPgCg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BXf1qEJKf/ddiGEsYZymesq2FZXQDf9o7e5yanVCRC7WeoJ7YekCi3eqI7HFCtrIo
 eEZoGNwzp/JktvXOQEmcHtmPNIKtMVbyhILcveGPj+nmeWo0G/ak9ipphIT4iCzjGU
 T/ZxUVq75pfJeGx5CqfkFzpfzdroxJRwhP1SZ5DmzRiADCROp02oX4/NI2EOGTo55B
 j1AechaA98d28oYgJAmZEOhYdX2ODPUEVWwG5Bv7PU3KYFFCZ+dT3yiromU6px4XiB
 Mdv5nGU9hBF7JKgmJ0z2SdAqpwXcnNW6X0V0zUAtlFha9ZZvBRpHoubaOpspokDo7I
 SywQhPEJm+Yrg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D188917E1407;
 Wed, 15 Oct 2025 18:03:39 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v4 06/14] drm/panthor: Add a PANTHOR_BO_SYNC ioctl
Date: Wed, 15 Oct 2025 18:03:18 +0200
Message-ID: <20251015160326.3657287-7-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015160326.3657287-1-boris.brezillon@collabora.com>
References: <20251015160326.3657287-1-boris.brezillon@collabora.com>
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
- Change the flags so they better match the drm_gem_shmem_sync()
  semantics

v3:
- Add Steve's R-b

Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 47 ++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_gem.c | 21 +++++++++
 drivers/gpu/drm/panthor/panthor_gem.h |  3 ++
 include/uapi/drm/panthor_drm.h        | 66 +++++++++++++++++++++++++++
 4 files changed, 136 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index fb4b293f17f0..857954d2ac7b 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -175,7 +175,8 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_sync_op, timeline_value), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
-		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs))
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_bo_sync_op, size))
 
 /**
  * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
@@ -1394,6 +1395,49 @@ static int panthor_ioctl_set_user_mmio_offset(struct drm_device *ddev,
 	return 0;
 }
 
+#define PANTHOR_BO_SYNC_OP_FLAGS                                      \
+	(DRM_PANTHOR_BO_SYNC_FOR_DEV | DRM_PANTHOR_BO_SYNC_FOR_READ | \
+	 DRM_PANTHOR_BO_SYNC_FOR_WRITE)
+
+static int panthor_ioctl_bo_sync(struct drm_device *ddev, void *data,
+				 struct drm_file *file)
+{
+	struct drm_panthor_bo_sync *args = data;
+	struct drm_panthor_bo_sync_op *ops;
+	struct drm_gem_object *obj;
+	int ret = 0;
+
+	ret = PANTHOR_UOBJ_GET_ARRAY(ops, &args->ops);
+	if (ret)
+		return ret;
+
+	for (u32 i = 0; i < args->ops.count; i++) {
+		if (ops[i].flags & ~PANTHOR_BO_SYNC_OP_FLAGS) {
+			ret = -EINVAL;
+			goto err_ops;
+		}
+
+		obj = drm_gem_object_lookup(file, ops[i].handle);
+		if (!obj) {
+			ret = -ENOENT;
+			goto err_ops;
+		}
+
+		ret = panthor_gem_bo_sync(obj, ops[i].flags,
+					  ops[i].offset, ops[i].size);
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
@@ -1468,6 +1512,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
 	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(BO_SET_LABEL, bo_set_label, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(SET_USER_MMIO_OFFSET, set_user_mmio_offset, DRM_RENDER_ALLOW),
+	PANTHOR_IOCTL(BO_SYNC, bo_sync, DRM_RENDER_ALLOW),
 };
 
 static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 156c7a0b62a2..617e04134d30 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -338,6 +338,27 @@ panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label)
 	panthor_gem_bo_set_label(bo->obj, str);
 }
 
+int
+panthor_gem_bo_sync(struct drm_gem_object *obj, u32 flags,
+		    u64 offset, u64 size)
+{
+	enum drm_gem_object_access_flags gem_access_flags = 0;
+	struct panthor_gem_object *bo = to_panthor_bo(obj);
+
+	if (flags & DRM_PANTHOR_BO_SYNC_FOR_DEV)
+		gem_access_flags |= DRM_GEM_OBJECT_DEV_ACCESS;
+	else
+		gem_access_flags |= DRM_GEM_OBJECT_CPU_ACCESS;
+
+	if (flags & DRM_PANTHOR_BO_SYNC_FOR_READ)
+		gem_access_flags |= DRM_GEM_OBJECT_READ_ACCESS;
+
+	if (flags & DRM_PANTHOR_BO_SYNC_FOR_WRITE)
+		gem_access_flags |= DRM_GEM_OBJECT_WRITE_ACCESS;
+
+	return drm_gem_shmem_sync(&bo->base, offset, size, gem_access_flags);
+}
+
 #ifdef CONFIG_DEBUG_FS
 struct gem_size_totals {
 	size_t size;
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 80c6e24112d0..c08c7c066840 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -147,6 +147,9 @@ panthor_gem_create_with_handle(struct drm_file *file,
 void panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *label);
 void panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label);
 
+int panthor_gem_bo_sync(struct drm_gem_object *obj, u32 flags,
+			u64 offset, u64 size);
+
 static inline u64
 panthor_kernel_bo_gpuva(struct panthor_kernel_bo *bo)
 {
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index f0f637e0631d..c484a0204f3b 100644
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
@@ -1073,6 +1076,67 @@ struct drm_panthor_set_user_mmio_offset {
 	__u64 offset;
 };
 
+/**
+ * enum drm_panthor_bo_sync_op_flags - BO sync flags
+ */
+enum drm_panthor_bo_sync_op_flags {
+	/**
+	 * @DRM_PANTHOR_BO_SYNC_FOR_CPU: Sync data for CPU accesses.
+	 */
+	DRM_PANTHOR_BO_SYNC_FOR_CPU = (0 << 0),
+
+	/**
+	 * @DRM_PANTHOR_BO_SYNC_FOR_DEV: Sync data for device accesses.
+	 */
+	DRM_PANTHOR_BO_SYNC_FOR_DEV = (1 << 0),
+
+	/**
+	 * @DRM_PANTHOR_BO_SYNC_FOR_READ: Sync for reads.
+	 */
+	DRM_PANTHOR_BO_SYNC_FOR_READ = (1 << 1),
+
+	/**
+	 * @DRM_PANTHOR_BO_SYNC_FOR_WRITE: Sync for writes.
+	 */
+	DRM_PANTHOR_BO_SYNC_FOR_WRITE = (1 << 2),
+};
+
+/**
+ * struct drm_panthor_bo_sync_op - BO map sync op
+ */
+struct drm_panthor_bo_sync_op {
+	/** @handle: Handle of the buffer object to sync. */
+	__u32 handle;
+
+	/** @flags: Flags controlling the sync operation. */
+	__u32 flags;
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
@@ -1119,6 +1183,8 @@ enum {
 		DRM_IOCTL_PANTHOR(WR, BO_SET_LABEL, bo_set_label),
 	DRM_IOCTL_PANTHOR_SET_USER_MMIO_OFFSET =
 		DRM_IOCTL_PANTHOR(WR, SET_USER_MMIO_OFFSET, set_user_mmio_offset),
+	DRM_IOCTL_PANTHOR_BO_SYNC =
+		DRM_IOCTL_PANTHOR(WR, BO_SYNC, bo_sync),
 };
 
 #if defined(__cplusplus)
-- 
2.51.0

