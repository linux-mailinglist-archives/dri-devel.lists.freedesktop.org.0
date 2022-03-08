Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 688EF4D18F8
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 14:17:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B9810E591;
	Tue,  8 Mar 2022 13:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6072D10E591
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 13:17:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 377FE1F44061
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646745463;
 bh=CZcOHsTEykVl4TEPEeyh/37cRqwt0VULoatnRfJJdw8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LeMI4L+Ggvv8SJP1BfDAyhcHJYlFCYvavBTbtahUn7M2itDo7jcxwG2PrKQ2YVDih
 Z7RVmbWob+EZisrwDVvEyWRWl7WDJltb9tbFbanQ92va9TjfojAZ3m/kZbKGvzNR6D
 blNMq7UbkTjDdwkvgiptdUEybmtIUEiEz+ozuG4ar1RTw6NAZS3NY6+vaQGzhJ0OOo
 dl1Qhie+hKbwN3EX+0V//0LQxTwS7fXc9wosc5LZT625Gj8ijqx3UcOxpcusjpUPLn
 LznaRYxD7z2ZQikptC7BRyoWanYt+1udhDAENUU3MBufUfDLKC+pNjj7A1GQIwACAR
 saPwJGmGqOCjg==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>
Subject: [PATCH v1 5/5] drm/virtio: Add memory shrinker
Date: Tue,  8 Mar 2022 16:17:25 +0300
Message-Id: <20220308131725.60607-6-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308131725.60607-1-dmitry.osipenko@collabora.com>
References: <20220308131725.60607-1-dmitry.osipenko@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 dri-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add memory shrinker and new madvise IOCTL to the VirtIO-GPU driver.
Userspace (BO cache manager of Mesa driver) will mark BOs as "don't need"
using the new IOCTL to let shrinker purge the marked BOs on OOM, thus
shrinker will lower memory pressure and prevent OOM kills.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/Makefile               |   3 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h          |  26 +++-
 drivers/gpu/drm/virtio/virtgpu_gem.c          |  84 ++++++++++++
 drivers/gpu/drm/virtio/virtgpu_gem_shrinker.c | 124 ++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c        |  37 ++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c          |  10 ++
 drivers/gpu/drm/virtio/virtgpu_object.c       |   7 +
 drivers/gpu/drm/virtio/virtgpu_plane.c        |  17 ++-
 drivers/gpu/drm/virtio/virtgpu_vq.c           |  15 +++
 include/uapi/drm/virtgpu_drm.h                |  14 ++
 10 files changed, 333 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/virtio/virtgpu_gem_shrinker.c

diff --git a/drivers/gpu/drm/virtio/Makefile b/drivers/gpu/drm/virtio/Makefile
index b99fa4a73b68..e1715ae02a2d 100644
--- a/drivers/gpu/drm/virtio/Makefile
+++ b/drivers/gpu/drm/virtio/Makefile
@@ -6,6 +6,7 @@
 virtio-gpu-y := virtgpu_drv.o virtgpu_kms.o virtgpu_gem.o virtgpu_vram.o \
 	virtgpu_display.o virtgpu_vq.o \
 	virtgpu_fence.o virtgpu_object.o virtgpu_debugfs.o virtgpu_plane.o \
-	virtgpu_ioctl.o virtgpu_prime.o virtgpu_trace_points.o
+	virtgpu_ioctl.o virtgpu_prime.o virtgpu_trace_points.o \
+	virtgpu_gem_shrinker.o
 
 obj-$(CONFIG_DRM_VIRTIO_GPU) += virtio-gpu.o
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index b2d93cb12ebf..f907fcd81a24 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -94,6 +94,8 @@ struct virtio_gpu_object {
 
 	int uuid_state;
 	uuid_t uuid;
+
+	refcount_t pin_count;
 };
 #define gem_to_virtio_gpu_obj(gobj) \
 	container_of((gobj), struct virtio_gpu_object, base.base)
@@ -211,6 +213,11 @@ struct virtio_gpu_drv_cap_cache {
 	atomic_t is_valid;
 };
 
+struct virtio_gpu_shrinker {
+	struct shrinker shrinker;
+	struct list_head list;
+};
+
 struct virtio_gpu_device {
 	struct drm_device *ddev;
 
@@ -261,6 +268,11 @@ struct virtio_gpu_device {
 	spinlock_t resource_export_lock;
 	/* protects map state and host_visible_mm */
 	spinlock_t host_visible_lock;
+
+	struct virtio_gpu_shrinker vgshrinker;
+
+	/* protects all memory management operations */
+	struct mutex mm_lock;
 };
 
 struct virtio_gpu_fpriv {
@@ -274,7 +286,7 @@ struct virtio_gpu_fpriv {
 };
 
 /* virtgpu_ioctl.c */
-#define DRM_VIRTIO_NUM_IOCTLS 12
+#define DRM_VIRTIO_NUM_IOCTLS 13
 extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
 void virtio_gpu_create_context(struct drm_device *dev, struct drm_file *file);
 
@@ -310,6 +322,12 @@ void virtio_gpu_array_put_free(struct virtio_gpu_object_array *objs);
 void virtio_gpu_array_put_free_delayed(struct virtio_gpu_device *vgdev,
 				       struct virtio_gpu_object_array *objs);
 void virtio_gpu_array_put_free_work(struct work_struct *work);
+int virtio_gpu_array_validate(struct virtio_gpu_device *vgdev,
+			      struct virtio_gpu_object_array *objs);
+bool virtio_gpu_gem_madvise(struct virtio_gpu_object *obj, int madv);
+int virtio_gpu_gem_host_mem_release(struct virtio_gpu_object *bo);
+int virtio_gpu_gem_pin(struct virtio_gpu_object *bo);
+void virtio_gpu_gem_unpin(struct virtio_gpu_object *bo);
 
 /* virtgpu_vq.c */
 int virtio_gpu_alloc_vbufs(struct virtio_gpu_device *vgdev);
@@ -321,6 +339,8 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_fence *fence);
 void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
 				   struct virtio_gpu_object *bo);
+int virtio_gpu_cmd_release_resource(struct virtio_gpu_device *vgdev,
+				    struct virtio_gpu_object *bo);
 void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 					uint64_t offset,
 					uint32_t width, uint32_t height,
@@ -483,4 +503,8 @@ void virtio_gpu_vram_unmap_dma_buf(struct device *dev,
 				   struct sg_table *sgt,
 				   enum dma_data_direction dir);
 
+/* virtgpu_gem_shrinker.c */
+int virtio_gpu_gem_shrinker_init(struct virtio_gpu_device *vgdev);
+void virtio_gpu_gem_shrinker_fini(struct virtio_gpu_device *vgdev);
+
 #endif
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 48d3c9955f0d..dbe5b8fa8285 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -282,3 +282,87 @@ void virtio_gpu_array_put_free_work(struct work_struct *work)
 	}
 	spin_unlock(&vgdev->obj_free_lock);
 }
+
+int virtio_gpu_array_validate(struct virtio_gpu_device *vgdev,
+			      struct virtio_gpu_object_array *objs)
+{
+	struct drm_gem_shmem_object *shmem;
+	int ret = 0;
+	u32 i;
+
+	mutex_lock(&vgdev->mm_lock);
+
+	for (i = 0; i < objs->nents; i++) {
+		shmem = to_drm_gem_shmem_obj(objs->objs[i]);
+		if (shmem->madv) {
+			ret = -ENOMEM;
+			break;
+		}
+	}
+
+	mutex_unlock(&vgdev->mm_lock);
+
+	return ret;
+}
+
+bool virtio_gpu_gem_madvise(struct virtio_gpu_object *bo, int madv)
+{
+	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
+	bool retained;
+
+	/* we care only about purging BOs that are backed by guest's memory */
+	if (!virtio_gpu_is_shmem(bo))
+		return true;
+
+	mutex_lock(&vgdev->mm_lock);
+
+	retained = drm_gem_shmem_madvise(&bo->base, madv);
+
+	if (retained && madv == VIRTGPU_MADV_DONTNEED)
+		list_move_tail(&bo->base.madv_list, &vgdev->vgshrinker.list);
+	else
+		list_del_init(&bo->base.madv_list);
+
+	mutex_unlock(&vgdev->mm_lock);
+
+	return retained;
+}
+
+int virtio_gpu_gem_host_mem_release(struct virtio_gpu_object *bo)
+{
+	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
+	int err;
+
+	if (bo->created) {
+		err = virtio_gpu_cmd_release_resource(vgdev, bo);
+		if (err)
+			return err;
+
+		virtio_gpu_notify(vgdev);
+		bo->created = false;
+	}
+
+	return 0;
+}
+
+int virtio_gpu_gem_pin(struct virtio_gpu_object *bo)
+{
+	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
+	int ret = 0;
+
+	mutex_lock(&vgdev->mm_lock);
+
+	if (bo->base.madv == VIRTGPU_MADV_WILLNEED)
+		refcount_inc(&bo->pin_count);
+	else
+		ret = -ENOMEM;
+
+	mutex_unlock(&vgdev->mm_lock);
+
+	return ret;
+}
+
+void virtio_gpu_gem_unpin(struct virtio_gpu_object *bo)
+{
+	refcount_dec(&bo->pin_count);
+}
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem_shrinker.c b/drivers/gpu/drm/virtio/virtgpu_gem_shrinker.c
new file mode 100644
index 000000000000..39eb9a3e7e4a
--- /dev/null
+++ b/drivers/gpu/drm/virtio/virtgpu_gem_shrinker.c
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022 Collabora Ltd.
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/shmem_fs.h>
+
+#include "virtgpu_drv.h"
+
+static unsigned long
+virtio_gpu_gem_shrinker_count_objects(struct shrinker *shrinker,
+				      struct shrink_control *sc)
+{
+	struct drm_gem_shmem_object *shmem;
+	struct virtio_gpu_device *vgdev;
+	unsigned long count = 0;
+	bool empty = true;
+
+	vgdev = container_of(shrinker, struct virtio_gpu_device,
+			     vgshrinker.shrinker);
+
+	if (!mutex_trylock(&vgdev->mm_lock))
+		return 0;
+
+	list_for_each_entry(shmem, &vgdev->vgshrinker.list, madv_list) {
+		empty = false;
+
+		if (!mutex_trylock(&shmem->pages_lock))
+			continue;
+
+		if (drm_gem_shmem_is_purgeable(shmem))
+			count += shmem->base.size >> PAGE_SHIFT;
+
+		mutex_unlock(&shmem->pages_lock);
+	}
+
+	mutex_unlock(&vgdev->mm_lock);
+
+	return empty ? SHRINK_EMPTY : count;
+}
+
+static bool virtio_gpu_gem_shrinker_purge(struct virtio_gpu_device *vgdev,
+					  struct drm_gem_object *obj)
+{
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
+	struct drm_gem_shmem_object *shmem = &bo->base;
+	int err;
+
+	if (!dma_resv_test_signaled(obj->resv, true) ||
+	    !drm_gem_shmem_is_purgeable(shmem) ||
+	    refcount_read(&bo->pin_count))
+		return false;
+
+	/*
+	 * Release host's memory before guest's memory is gone to ensure that
+	 * host won't touch released memory of the guest.
+	 */
+	err = virtio_gpu_gem_host_mem_release(bo);
+	if (err)
+		return false;
+
+	list_del_init(&shmem->madv_list);
+	drm_gem_shmem_purge_locked(shmem);
+
+	return true;
+}
+
+static unsigned long
+virtio_gpu_gem_shrinker_scan_objects(struct shrinker *shrinker,
+				     struct shrink_control *sc)
+{
+	struct drm_gem_shmem_object *shmem, *tmp;
+	struct virtio_gpu_device *vgdev;
+	unsigned long freed = 0;
+
+	vgdev = container_of(shrinker, struct virtio_gpu_device,
+			     vgshrinker.shrinker);
+
+	if (!mutex_trylock(&vgdev->mm_lock))
+		return SHRINK_STOP;
+
+	list_for_each_entry_safe(shmem, tmp, &vgdev->vgshrinker.list, madv_list) {
+		if (freed >= sc->nr_to_scan)
+			break;
+
+		if (!dma_resv_trylock(shmem->base.resv))
+			continue;
+
+		if (!mutex_trylock(&shmem->pages_lock))
+			goto resv_unlock;
+
+		if (virtio_gpu_gem_shrinker_purge(vgdev, &shmem->base))
+			freed += shmem->base.size >> PAGE_SHIFT;
+
+		mutex_unlock(&shmem->pages_lock);
+resv_unlock:
+		dma_resv_unlock(shmem->base.resv);
+	}
+
+	mutex_unlock(&vgdev->mm_lock);
+
+	return freed;
+}
+
+int virtio_gpu_gem_shrinker_init(struct virtio_gpu_device *vgdev)
+{
+	struct shrinker *shrinker = &vgdev->vgshrinker.shrinker;
+
+	shrinker->count_objects = virtio_gpu_gem_shrinker_count_objects;
+	shrinker->scan_objects = virtio_gpu_gem_shrinker_scan_objects;
+	shrinker->seeks = DEFAULT_SEEKS;
+
+	INIT_LIST_HEAD(&vgdev->vgshrinker.list);
+
+	return register_shrinker(shrinker);
+}
+
+void virtio_gpu_gem_shrinker_fini(struct virtio_gpu_device *vgdev)
+{
+	struct shrinker *shrinker = &vgdev->vgshrinker.shrinker;
+
+	unregister_shrinker(shrinker);
+}
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index c708bab555c6..bb5369eee425 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -217,6 +217,10 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 		ret = virtio_gpu_array_lock_resv(buflist);
 		if (ret)
 			goto out_memdup;
+
+		ret = virtio_gpu_array_validate(vgdev, buflist);
+		if (ret)
+			goto out_unresv;
 	}
 
 	out_fence = virtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);
@@ -423,6 +427,10 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 	if (ret != 0)
 		goto err_put_free;
 
+	ret = virtio_gpu_array_validate(vgdev, objs);
+	if (ret)
+		goto err_unlock;
+
 	fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context, 0);
 	if (!fence) {
 		ret = -ENOMEM;
@@ -482,6 +490,10 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 		if (ret != 0)
 			goto err_put_free;
 
+		ret = virtio_gpu_array_validate(vgdev, objs);
+		if (ret)
+			goto err_unlock;
+
 		ret = -ENOMEM;
 		fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context,
 					       0);
@@ -836,6 +848,28 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 	return ret;
 }
 
+static int virtio_gpu_madvise_ioctl(struct drm_device *dev,
+				    void *data,
+				    struct drm_file *file)
+{
+	struct drm_virtgpu_madvise *args = data;
+	struct virtio_gpu_object *bo;
+	struct drm_gem_object *obj;
+
+	if (args->madv > VIRTGPU_MADV_DONTNEED)
+		return -EOPNOTSUPP;
+
+	obj = drm_gem_object_lookup(file, args->bo_handle);
+	if (!obj)
+		return -ENOENT;
+
+	bo = gem_to_virtio_gpu_obj(obj);
+	args->retained = virtio_gpu_gem_madvise(bo, args->madv);
+	drm_gem_object_put(obj);
+
+	return 0;
+}
+
 struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
 	DRM_IOCTL_DEF_DRV(VIRTGPU_MAP, virtio_gpu_map_ioctl,
 			  DRM_RENDER_ALLOW),
@@ -875,4 +909,7 @@ struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
 
 	DRM_IOCTL_DEF_DRV(VIRTGPU_CONTEXT_INIT, virtio_gpu_context_init_ioctl,
 			  DRM_RENDER_ALLOW),
+
+	DRM_IOCTL_DEF_DRV(VIRTGPU_MADVISE, virtio_gpu_madvise_ioctl,
+			  DRM_RENDER_ALLOW),
 };
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 0d1e3eb61bee..0a8c7cc64da9 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -134,6 +134,7 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 	dev->dev_private = vgdev;
 	vgdev->vdev = vdev;
 
+	mutex_init(&vgdev->mm_lock);
 	spin_lock_init(&vgdev->display_info_lock);
 	spin_lock_init(&vgdev->resource_export_lock);
 	spin_lock_init(&vgdev->host_visible_lock);
@@ -238,6 +239,12 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 		goto err_scanouts;
 	}
 
+	ret = virtio_gpu_gem_shrinker_init(vgdev);
+	if (ret) {
+		DRM_ERROR("shrinker init failed\n");
+		goto err_modeset;
+	}
+
 	virtio_device_ready(vgdev->vdev);
 
 	if (num_capsets)
@@ -250,6 +257,8 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 			   5 * HZ);
 	return 0;
 
+err_modeset:
+	virtio_gpu_modeset_fini(vgdev);
 err_scanouts:
 	virtio_gpu_free_vbufs(vgdev);
 err_vbufs:
@@ -289,6 +298,7 @@ void virtio_gpu_release(struct drm_device *dev)
 	if (!vgdev)
 		return;
 
+	virtio_gpu_gem_shrinker_fini(vgdev);
 	virtio_gpu_modeset_fini(vgdev);
 	virtio_gpu_free_vbufs(vgdev);
 	virtio_gpu_cleanup_cap_cache(vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 1964c0d8b51f..696bb31fc626 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -88,6 +88,13 @@ static void virtio_gpu_free_object(struct drm_gem_object *obj)
 	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
 	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
 
+	/*
+	 * Prevent racing with the memory shrinker during BO's cleanup
+	 * by taking out BO from the shrinker's purge list if BO is on
+	 * the list, otherwise this is a no-op if BO is already purged.
+	 */
+	virtio_gpu_gem_madvise(bo, VIRTGPU_MADV_WILLNEED);
+
 	if (bo->created) {
 		virtio_gpu_cmd_unref_resource(vgdev, bo);
 		virtio_gpu_notify(vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 6d3cc9e238a4..597ef1645bf2 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -246,20 +246,28 @@ static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_framebuffer *vgfb;
 	struct virtio_gpu_object *bo;
+	int err;
 
 	if (!new_state->fb)
 		return 0;
 
 	vgfb = to_virtio_gpu_framebuffer(new_state->fb);
 	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
-	if (!bo || (plane->type == DRM_PLANE_TYPE_PRIMARY && !bo->guest_blob))
+
+	err = virtio_gpu_gem_pin(bo);
+	if (err)
+		return err;
+
+	if (plane->type == DRM_PLANE_TYPE_PRIMARY && !bo->guest_blob)
 		return 0;
 
 	if (bo->dumb && (plane->state->fb != new_state->fb)) {
 		vgfb->fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context,
 						     0);
-		if (!vgfb->fence)
+		if (!vgfb->fence) {
+			virtio_gpu_gem_unpin(bo);
 			return -ENOMEM;
+		}
 	}
 
 	return 0;
@@ -269,15 +277,20 @@ static void virtio_gpu_plane_cleanup_fb(struct drm_plane *plane,
 					struct drm_plane_state *old_state)
 {
 	struct virtio_gpu_framebuffer *vgfb;
+	struct virtio_gpu_object *bo;
 
 	if (!plane->state->fb)
 		return;
 
 	vgfb = to_virtio_gpu_framebuffer(plane->state->fb);
+	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
+
 	if (vgfb->fence) {
 		dma_fence_put(&vgfb->fence->f);
 		vgfb->fence = NULL;
 	}
+
+	virtio_gpu_gem_unpin(bo);
 }
 
 static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 06566e44307d..c55c2fc8ecc0 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -536,6 +536,21 @@ void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
 		virtio_gpu_cleanup_object(bo);
 }
 
+int virtio_gpu_cmd_release_resource(struct virtio_gpu_device *vgdev,
+				    struct virtio_gpu_object *bo)
+{
+	struct virtio_gpu_resource_unref *cmd_p;
+	struct virtio_gpu_vbuffer *vbuf;
+
+	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
+	memset(cmd_p, 0, sizeof(*cmd_p));
+
+	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_UNREF);
+	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
+
+	return virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+}
+
 void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
 				uint32_t scanout_id, uint32_t resource_id,
 				uint32_t width, uint32_t height,
diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index 0512fde5e697..12197d8e9759 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -48,6 +48,7 @@ extern "C" {
 #define DRM_VIRTGPU_GET_CAPS  0x09
 #define DRM_VIRTGPU_RESOURCE_CREATE_BLOB 0x0a
 #define DRM_VIRTGPU_CONTEXT_INIT 0x0b
+#define DRM_VIRTGPU_MADVISE 0x0c
 
 #define VIRTGPU_EXECBUF_FENCE_FD_IN	0x01
 #define VIRTGPU_EXECBUF_FENCE_FD_OUT	0x02
@@ -196,6 +197,15 @@ struct drm_virtgpu_context_init {
 	__u64 ctx_set_params;
 };
 
+#define VIRTGPU_MADV_WILLNEED 0
+#define VIRTGPU_MADV_DONTNEED 1
+struct drm_virtgpu_madvise {
+	__u32 bo_handle;
+	__u32 retained; /* out, non-zero if BO can be used */
+	__u32 madv;
+	__u32 pad;
+};
+
 /*
  * Event code that's given when VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK is in
  * effect.  The event size is sizeof(drm_event), since there is no additional
@@ -246,6 +256,10 @@ struct drm_virtgpu_context_init {
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_CONTEXT_INIT,		\
 		struct drm_virtgpu_context_init)
 
+#define DRM_IOCTL_VIRTGPU_MADVISE \
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_MADVISE, \
+		 struct drm_virtgpu_madvise)
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.35.1

