Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C488E75DF6D
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jul 2023 01:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91AA10E1ED;
	Sat, 22 Jul 2023 23:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994EF10E1A3
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jul 2023 23:53:15 +0000 (UTC)
Received: from workpc.. (109-252-150-127.dynamic.spd-mgts.ru [109.252.150.127])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id F0BBC6607104;
 Sun, 23 Jul 2023 00:53:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690069994;
 bh=TNS6Q8eXGXLjefQiG6GJRsxPR83wbuGQKVUqIJXr7wM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V0QbusmmPRtERnrgM3yYfWh0P8TkqsyKKUJStZ4GIH/BwMFAAM5UdU1gXBPtyKaJi
 EcykoXShmc3rJO08KRrFV/7zcajfpODjLeOgjL59iu3h2ri0kAdPf0aHlAEsGSfVz5
 B+ADixoAZPjJok6uxhWFYodXJFmTTNmueX8ea2NTe5SMzTi+oUmS8HFEweP3lvLiyO
 uyVCTOVXbmAahVg/IPc5C08HNTrTGWh5VmT+kW7l8BsGtraAUsNh4wleA3Map4cvHt
 JxIQBQWfxw6dq951NUIUcA9D6pamJt9Ytas3Xy3rgWInNUBXnK1Wt4wP0e2foGBozd
 Y8MnejpIy/gRg==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>
Subject: [PATCH v14 08/12] drm/virtio: Support memory shrinking
Date: Sun, 23 Jul 2023 02:47:42 +0300
Message-ID: <20230722234746.205949-9-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230722234746.205949-1-dmitry.osipenko@collabora.com>
References: <20230722234746.205949-1-dmitry.osipenko@collabora.com>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support generic drm-shmem memory shrinker and add new madvise IOCTL to
the VirtIO-GPU driver. BO cache manager of Mesa driver will mark BOs as
"don't need" using the new IOCTL to let shrinker purge the marked BOs on
OOM, the shrinker will also evict unpurgeable shmem BOs from memory if
guest supports SWAP file or partition.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  20 +++-
 drivers/gpu/drm/virtio/virtgpu_gem.c    |  72 +++++++++++++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c  |  33 ++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c    |   8 ++
 drivers/gpu/drm/virtio/virtgpu_object.c | 137 +++++++++++++++++++-----
 drivers/gpu/drm/virtio/virtgpu_plane.c  |  17 ++-
 drivers/gpu/drm/virtio/virtgpu_submit.c |  15 ++-
 drivers/gpu/drm/virtio/virtgpu_vq.c     |  40 +++++++
 include/uapi/drm/virtgpu_drm.h          |  14 +++
 9 files changed, 323 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 4126c384286b..ee5c5848edd2 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -89,6 +89,7 @@ struct virtio_gpu_object {
 	uint32_t hw_res_handle;
 	bool dumb;
 	bool created;
+	bool detached;
 	bool host3d_blob, guest_blob;
 	uint32_t blob_mem, blob_flags;
 
@@ -277,7 +278,7 @@ struct virtio_gpu_fpriv {
 };
 
 /* virtgpu_ioctl.c */
-#define DRM_VIRTIO_NUM_IOCTLS 12
+#define DRM_VIRTIO_NUM_IOCTLS 13
 extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
 void virtio_gpu_create_context(struct drm_device *dev, struct drm_file *file);
 
@@ -313,6 +314,12 @@ void virtio_gpu_array_put_free(struct virtio_gpu_object_array *objs);
 void virtio_gpu_array_put_free_delayed(struct virtio_gpu_device *vgdev,
 				       struct virtio_gpu_object_array *objs);
 void virtio_gpu_array_put_free_work(struct work_struct *work);
+int virtio_gpu_array_prepare(struct virtio_gpu_device *vgdev,
+			     struct virtio_gpu_object_array *objs);
+int virtio_gpu_gem_host_mem_release(struct virtio_gpu_object *bo);
+int virtio_gpu_gem_madvise(struct virtio_gpu_object *obj, int madv);
+int virtio_gpu_gem_pin(struct virtio_gpu_object *bo);
+void virtio_gpu_gem_unpin(struct virtio_gpu_object *bo);
 
 /* virtgpu_vq.c */
 int virtio_gpu_alloc_vbufs(struct virtio_gpu_device *vgdev);
@@ -324,6 +331,8 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_fence *fence);
 void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
 				   struct virtio_gpu_object *bo);
+int virtio_gpu_cmd_release_resource(struct virtio_gpu_device *vgdev,
+				    struct virtio_gpu_object *bo);
 void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 					uint64_t offset,
 					uint32_t width, uint32_t height,
@@ -344,6 +353,9 @@ void virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
 			      struct virtio_gpu_object *obj,
 			      struct virtio_gpu_mem_entry *ents,
 			      unsigned int nents);
+void virtio_gpu_object_detach(struct virtio_gpu_device *vgdev,
+			      struct virtio_gpu_object *obj,
+			      struct virtio_gpu_fence *fence);
 int virtio_gpu_attach_status_page(struct virtio_gpu_device *vgdev);
 int virtio_gpu_detach_status_page(struct virtio_gpu_device *vgdev);
 void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,
@@ -456,6 +468,8 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 
 bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo);
 
+int virtio_gpu_reattach_shmem_object(struct virtio_gpu_object *bo);
+
 int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev,
 			       uint32_t *resid);
 /* virtgpu_prime.c */
@@ -490,4 +504,8 @@ void virtio_gpu_vram_unmap_dma_buf(struct device *dev,
 int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 				struct drm_file *file);
 
+/* virtgpu_gem_shrinker.c */
+int virtio_gpu_gem_shrinker_init(struct virtio_gpu_device *vgdev);
+void virtio_gpu_gem_shrinker_fini(struct virtio_gpu_device *vgdev);
+
 #endif
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 7db48d17ee3a..b9ceb0602fd5 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -147,10 +147,20 @@ void virtio_gpu_gem_object_close(struct drm_gem_object *obj,
 	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
 	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
 	struct virtio_gpu_object_array *objs;
+	struct virtio_gpu_object *bo;
 
 	if (!vgdev->has_virgl_3d)
 		return;
 
+	bo = gem_to_virtio_gpu_obj(obj);
+
+	/*
+	 * Purged BO was already detached and released, the resource ID
+	 * is invalid by now.
+	 */
+	if (!virtio_gpu_gem_madvise(bo, VIRTGPU_MADV_WILLNEED))
+		return;
+
 	objs = virtio_gpu_array_alloc(1);
 	if (!objs)
 		return;
@@ -294,3 +304,65 @@ void virtio_gpu_array_put_free_work(struct work_struct *work)
 	}
 	spin_unlock(&vgdev->obj_free_lock);
 }
+
+int virtio_gpu_array_prepare(struct virtio_gpu_device *vgdev,
+			     struct virtio_gpu_object_array *objs)
+{
+	struct virtio_gpu_object *bo;
+	int ret = 0;
+	u32 i;
+
+	for (i = 0; i < objs->nents; i++) {
+		bo = gem_to_virtio_gpu_obj(objs->objs[i]);
+
+		if (virtio_gpu_is_shmem(bo) && bo->detached) {
+			ret = virtio_gpu_reattach_shmem_object(bo);
+			if (ret)
+				break;
+		}
+	}
+
+	return ret;
+}
+
+int virtio_gpu_gem_madvise(struct virtio_gpu_object *bo, int madv)
+{
+	/* only shmem BOs are supported by shrinker */
+	if (!virtio_gpu_is_shmem(bo) || !bo->base.pages_mark_dirty_on_put)
+		return 1;
+
+	return drm_gem_shmem_object_madvise_unlocked(&bo->base.base, madv);
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
+	int ret = 0;
+
+	if (virtio_gpu_is_shmem(bo))
+		ret = drm_gem_shmem_object_pin(&bo->base.base);
+
+	return ret;
+}
+
+void virtio_gpu_gem_unpin(struct virtio_gpu_object *bo)
+{
+	if (virtio_gpu_is_shmem(bo))
+		drm_gem_shmem_object_unpin(&bo->base.base);
+}
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index b24b11f25197..6a41830a06c5 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -246,6 +246,10 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 	if (ret != 0)
 		goto err_put_free;
 
+	ret = virtio_gpu_array_prepare(vgdev, objs);
+	if (ret)
+		goto err_unlock;
+
 	fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context, 0);
 	if (!fence) {
 		ret = -ENOMEM;
@@ -305,6 +309,10 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 		if (ret != 0)
 			goto err_put_free;
 
+		ret = virtio_gpu_array_prepare(vgdev, objs);
+		if (ret)
+			goto err_unlock;
+
 		ret = -ENOMEM;
 		fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context,
 					       0);
@@ -668,6 +676,28 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
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
@@ -707,4 +737,7 @@ struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
 
 	DRM_IOCTL_DEF_DRV(VIRTGPU_CONTEXT_INIT, virtio_gpu_context_init_ioctl,
 			  DRM_RENDER_ALLOW),
+
+	DRM_IOCTL_DEF_DRV(VIRTGPU_MADVISE, virtio_gpu_madvise_ioctl,
+			  DRM_RENDER_ALLOW),
 };
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 5a3b5aaed1f3..43e237082cec 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -245,6 +245,12 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 		goto err_scanouts;
 	}
 
+	ret = drmm_gem_shmem_init(dev);
+	if (ret) {
+		DRM_ERROR("shmem init failed\n");
+		goto err_modeset;
+	}
+
 	virtio_device_ready(vgdev->vdev);
 
 	if (num_capsets)
@@ -259,6 +265,8 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 	}
 	return 0;
 
+err_modeset:
+	virtio_gpu_modeset_fini(vgdev);
 err_scanouts:
 	virtio_gpu_free_vbufs(vgdev);
 err_vbufs:
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index c7e74cf13022..70dcd19266dc 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -97,39 +97,54 @@ static void virtio_gpu_free_object(struct drm_gem_object *obj)
 	virtio_gpu_cleanup_object(bo);
 }
 
-static const struct drm_gem_object_funcs virtio_gpu_shmem_funcs = {
-	.free = virtio_gpu_free_object,
-	.open = virtio_gpu_gem_object_open,
-	.close = virtio_gpu_gem_object_close,
-	.print_info = drm_gem_shmem_object_print_info,
-	.export = virtgpu_gem_prime_export,
-	.pin = drm_gem_shmem_object_pin,
-	.unpin = drm_gem_shmem_object_unpin,
-	.get_sg_table = drm_gem_shmem_object_get_sg_table,
-	.vmap = drm_gem_shmem_object_vmap,
-	.vunmap = drm_gem_shmem_object_vunmap,
-	.mmap = drm_gem_shmem_object_mmap,
-	.vm_ops = &drm_gem_shmem_vm_ops,
-};
-
-bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo)
+static int virtio_gpu_detach_object_fenced(struct virtio_gpu_object *bo)
 {
-	return bo->base.base.funcs == &virtio_gpu_shmem_funcs;
+	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
+	struct virtio_gpu_fence *fence;
+
+	fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context, 0);
+	if (!fence)
+		return -ENOMEM;
+
+	virtio_gpu_object_detach(vgdev, bo, fence);
+	virtio_gpu_notify(vgdev);
+
+	dma_fence_wait(&fence->f, false);
+	dma_fence_put(&fence->f);
+
+	bo->detached = true;
+
+	return 0;
 }
 
-struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
-						size_t size)
+static int virtio_gpu_shmem_evict(struct drm_gem_object *obj)
 {
-	struct virtio_gpu_object_shmem *shmem;
-	struct drm_gem_shmem_object *dshmem;
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
+	int err;
+
+	/*
+	 * At first tell host to stop using guest's memory to ensure that
+	 * host won't touch the released guest's memory once it's gone.
+	 */
+	if (!bo->base.evicted) {
+		err = virtio_gpu_detach_object_fenced(bo);
+		if (err)
+			return err;
+	}
 
-	shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
-	if (!shmem)
-		return ERR_PTR(-ENOMEM);
+	if (drm_gem_shmem_is_purgeable(&bo->base)) {
+		err = virtio_gpu_gem_host_mem_release(bo);
+		if (err) {
+			virtio_gpu_reattach_shmem_object(bo);
+			return err;
+		}
 
-	dshmem = &shmem->base.base;
-	dshmem->base.funcs = &virtio_gpu_shmem_funcs;
-	return &dshmem->base;
+		drm_gem_shmem_purge(&bo->base);
+	} else {
+		drm_gem_shmem_evict(&bo->base);
+	}
+
+	return 0;
 }
 
 static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
@@ -142,7 +157,7 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 	struct sg_table *pages;
 	int si;
 
-	pages = drm_gem_shmem_get_pages_sgt(&bo->base);
+	pages = drm_gem_shmem_get_pages_sgt_locked(&bo->base);
 	if (IS_ERR(pages))
 		return PTR_ERR(pages);
 
@@ -176,6 +191,65 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 	return 0;
 }
 
+int virtio_gpu_reattach_shmem_object(struct virtio_gpu_object *bo)
+{
+	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
+	struct virtio_gpu_mem_entry *ents;
+	unsigned int nents;
+	int err;
+
+	err = drm_gem_shmem_swapin(&bo->base);
+	if (err)
+		return err;
+
+	err = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
+	if (err)
+		return err;
+
+	virtio_gpu_object_attach(vgdev, bo, ents, nents);
+	virtio_gpu_notify(vgdev);
+
+	bo->detached = false;
+
+	return 0;
+}
+
+static const struct drm_gem_object_funcs virtio_gpu_shmem_funcs = {
+	.free = virtio_gpu_free_object,
+	.open = virtio_gpu_gem_object_open,
+	.close = virtio_gpu_gem_object_close,
+	.print_info = drm_gem_shmem_object_print_info,
+	.export = virtgpu_gem_prime_export,
+	.pin = drm_gem_shmem_object_pin,
+	.unpin = drm_gem_shmem_object_unpin,
+	.get_sg_table = drm_gem_shmem_object_get_sg_table,
+	.vmap = drm_gem_shmem_object_vmap,
+	.vunmap = drm_gem_shmem_object_vunmap,
+	.mmap = drm_gem_shmem_object_mmap,
+	.vm_ops = &drm_gem_shmem_vm_ops,
+	.evict = virtio_gpu_shmem_evict,
+};
+
+bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo)
+{
+	return bo->base.base.funcs == &virtio_gpu_shmem_funcs;
+}
+
+struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
+						size_t size)
+{
+	struct virtio_gpu_object_shmem *shmem;
+	struct drm_gem_shmem_object *dshmem;
+
+	shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
+	if (!shmem)
+		return ERR_PTR(-ENOMEM);
+
+	dshmem = &shmem->base.base;
+	dshmem->base.funcs = &virtio_gpu_shmem_funcs;
+	return &dshmem->base;
+}
+
 int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 			     struct virtio_gpu_object_params *params,
 			     struct virtio_gpu_object **bo_ptr,
@@ -202,7 +276,10 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 
 	bo->dumb = params->dumb;
 
+	dma_resv_lock(bo->base.base.resv, NULL);
 	ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
+	dma_resv_unlock(bo->base.base.resv);
+
 	if (ret != 0)
 		goto err_put_id;
 
@@ -228,10 +305,14 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 		virtio_gpu_cmd_resource_create_3d(vgdev, bo, params,
 						  objs, fence);
 		virtio_gpu_object_attach(vgdev, bo, ents, nents);
+
+		shmem_obj->pages_mark_dirty_on_put = 1;
 	} else {
 		virtio_gpu_cmd_create_resource(vgdev, bo, params,
 					       objs, fence);
 		virtio_gpu_object_attach(vgdev, bo, ents, nents);
+
+		shmem_obj->pages_mark_dirty_on_put = 1;
 	}
 
 	*bo_ptr = bo;
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index a2e045f3a000..def57b01a826 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -238,20 +238,28 @@ static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
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
@@ -261,15 +269,20 @@ static void virtio_gpu_plane_cleanup_fb(struct drm_plane *plane,
 					struct drm_plane_state *state)
 {
 	struct virtio_gpu_framebuffer *vgfb;
+	struct virtio_gpu_object *bo;
 
 	if (!state->fb)
 		return;
 
 	vgfb = to_virtio_gpu_framebuffer(state->fb);
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
diff --git a/drivers/gpu/drm/virtio/virtgpu_submit.c b/drivers/gpu/drm/virtio/virtgpu_submit.c
index 1d010c66910d..a88984dd3f2f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_submit.c
+++ b/drivers/gpu/drm/virtio/virtgpu_submit.c
@@ -250,8 +250,19 @@ static void virtio_gpu_install_out_fence_fd(struct virtio_gpu_submit *submit)
 
 static int virtio_gpu_lock_buflist(struct virtio_gpu_submit *submit)
 {
-	if (submit->buflist)
-		return virtio_gpu_array_lock_resv(submit->buflist);
+	int err;
+
+	if (submit->buflist) {
+		err = virtio_gpu_array_lock_resv(submit->buflist);
+		if (err)
+			return err;
+
+		err = virtio_gpu_array_prepare(submit->vgdev, submit->buflist);
+		if (err) {
+			virtio_gpu_array_unlock_resv(submit->buflist);
+			return err;
+		}
+	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index b1a00c0c25a7..14ab470f413a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -545,6 +545,21 @@ void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
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
@@ -645,6 +660,23 @@ virtio_gpu_cmd_resource_attach_backing(struct virtio_gpu_device *vgdev,
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
 }
 
+static void
+virtio_gpu_cmd_resource_detach_backing(struct virtio_gpu_device *vgdev,
+				       u32 resource_id,
+				       struct virtio_gpu_fence *fence)
+{
+	struct virtio_gpu_resource_attach_backing *cmd_p;
+	struct virtio_gpu_vbuffer *vbuf;
+
+	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
+	memset(cmd_p, 0, sizeof(*cmd_p));
+
+	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING);
+	cmd_p->resource_id = cpu_to_le32(resource_id);
+
+	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+}
+
 static void virtio_gpu_cmd_get_display_info_cb(struct virtio_gpu_device *vgdev,
 					       struct virtio_gpu_vbuffer *vbuf)
 {
@@ -1107,6 +1139,14 @@ void virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
 					       ents, nents, NULL);
 }
 
+void virtio_gpu_object_detach(struct virtio_gpu_device *vgdev,
+			      struct virtio_gpu_object *obj,
+			      struct virtio_gpu_fence *fence)
+{
+	virtio_gpu_cmd_resource_detach_backing(vgdev, obj->hw_res_handle,
+					       fence);
+}
+
 void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,
 			    struct virtio_gpu_output *output)
 {
diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index 7b158fcb02b4..9fb38ad16120 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -48,6 +48,7 @@ extern "C" {
 #define DRM_VIRTGPU_GET_CAPS  0x09
 #define DRM_VIRTGPU_RESOURCE_CREATE_BLOB 0x0a
 #define DRM_VIRTGPU_CONTEXT_INIT 0x0b
+#define DRM_VIRTGPU_MADVISE 0x0c
 
 #define VIRTGPU_EXECBUF_FENCE_FD_IN	0x01
 #define VIRTGPU_EXECBUF_FENCE_FD_OUT	0x02
@@ -197,6 +198,15 @@ struct drm_virtgpu_context_init {
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
@@ -247,6 +257,10 @@ struct drm_virtgpu_context_init {
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
2.41.0

