Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1785356A7
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 01:55:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2BD10FCF9;
	Thu, 26 May 2022 23:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A6810FCF9;
 Thu, 26 May 2022 23:55:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 628F81F459F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653609313;
 bh=85TXlmrEL16nPSy0z9qeQV9GmylBOH57/JI7RTS4oZE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U6CL5hilbtGR359+F9u18dTMEGE69Hb3z9NVkPH4IcNe+kLbos+XUddme3uu4DlEA
 4RXJ5C0B/6R10cJzDLN2+7ABqMJRt8fsJ5VTiq+Tv4JNgntkiK58kPP9qvLxkDUyA7
 EaGaL+QG7IffkwkPeKy65RFSiHsVqIeKBZllweMjKAINYc1UsXnxoS3xlNW7yhoQJg
 id+AIXMBRctGi1NPyNSK5mbfl6RIIKYtYjwDpKbOd/m9xp+k9c7TArKtyQdas2C+3t
 D1p1RU3HxUAmPWT8hKejm4CkplAbagBhlys60ohKVGBl5eswpAcwV7Bs2j/1m0pfh/
 liX5Ge0qOsdTA==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Qiang Yu <yuq825@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH v6 19/22] drm/virtio: Support memory shrinking
Date: Fri, 27 May 2022 02:50:37 +0300
Message-Id: <20220526235040.678984-20-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
References: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support generic drm-shmem memory shrinker and add new madvise IOCTL to
the VirtIO-GPU driver. BO cache manager of Mesa driver will mark BOs as
"don't need" using the new IOCTL to let shrinker purge the marked BOs on
OOM, the shrinker will also evict unpurgeable shmem BOs from memory if
guest supports SWAP file or partition. Altogether this allows to prevent
OOM kills of guest applications that use VirGL by lowering memory pressure.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  15 ++-
 drivers/gpu/drm/virtio/virtgpu_gem.c    |  55 ++++++++++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c  |  37 +++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c    |   9 ++
 drivers/gpu/drm/virtio/virtgpu_object.c | 138 +++++++++++++++++++-----
 drivers/gpu/drm/virtio/virtgpu_plane.c  |  22 +++-
 drivers/gpu/drm/virtio/virtgpu_vq.c     |  40 +++++++
 include/uapi/drm/virtgpu_drm.h          |  14 +++
 8 files changed, 300 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 81bacc7e1873..26b570029940 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -275,7 +275,7 @@ struct virtio_gpu_fpriv {
 };
 
 /* virtgpu_ioctl.c */
-#define DRM_VIRTIO_NUM_IOCTLS 12
+#define DRM_VIRTIO_NUM_IOCTLS 13
 extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
 void virtio_gpu_create_context(struct drm_device *dev, struct drm_file *file);
 
@@ -311,6 +311,10 @@ void virtio_gpu_array_put_free(struct virtio_gpu_object_array *objs);
 void virtio_gpu_array_put_free_delayed(struct virtio_gpu_device *vgdev,
 				       struct virtio_gpu_object_array *objs);
 void virtio_gpu_array_put_free_work(struct work_struct *work);
+int virtio_gpu_array_prepare(struct virtio_gpu_device *vgdev,
+			     struct virtio_gpu_object_array *objs);
+int virtio_gpu_gem_host_mem_release(struct virtio_gpu_object *bo);
+int virtio_gpu_gem_madvise(struct virtio_gpu_object *obj, int madv);
 
 /* virtgpu_vq.c */
 int virtio_gpu_alloc_vbufs(struct virtio_gpu_device *vgdev);
@@ -322,6 +326,8 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_fence *fence);
 void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
 				   struct virtio_gpu_object *bo);
+int virtio_gpu_cmd_release_resource(struct virtio_gpu_device *vgdev,
+				    struct virtio_gpu_object *bo);
 void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 					uint64_t offset,
 					uint32_t width, uint32_t height,
@@ -342,6 +348,9 @@ void virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
 			      struct virtio_gpu_object *obj,
 			      struct virtio_gpu_mem_entry *ents,
 			      unsigned int nents);
+void virtio_gpu_object_detach(struct virtio_gpu_device *vgdev,
+			      struct virtio_gpu_object *obj,
+			      struct virtio_gpu_fence *fence);
 int virtio_gpu_attach_status_page(struct virtio_gpu_device *vgdev);
 int virtio_gpu_detach_status_page(struct virtio_gpu_device *vgdev);
 void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,
@@ -486,4 +495,8 @@ void virtio_gpu_vram_unmap_dma_buf(struct device *dev,
 				   struct sg_table *sgt,
 				   enum dma_data_direction dir);
 
+/* virtgpu_gem_shrinker.c */
+int virtio_gpu_gem_shrinker_init(struct virtio_gpu_device *vgdev);
+void virtio_gpu_gem_shrinker_fini(struct virtio_gpu_device *vgdev);
+
 #endif
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 7db48d17ee3a..6c5d98e0f071 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -294,3 +294,58 @@ void virtio_gpu_array_put_free_work(struct work_struct *work)
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
+	int ret;
+
+	/*
+	 * For now we support only purging BOs that are backed by guest's
+	 * memory.
+	 */
+	if (!virtio_gpu_is_shmem(bo))
+		return true;
+
+	dma_resv_lock(bo->base.base.resv, NULL);
+	ret = drm_gem_shmem_madvise(&bo->base, madv);
+	dma_resv_unlock(bo->base.base.resv);
+
+	return ret;
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
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index f8d83358d2a0..55ee9bd2098e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -217,6 +217,10 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 		ret = virtio_gpu_array_lock_resv(buflist);
 		if (ret)
 			goto out_memdup;
+
+		ret = virtio_gpu_array_prepare(vgdev, buflist);
+		if (ret)
+			goto out_unresv;
 	}
 
 	out_fence = virtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);
@@ -423,6 +427,10 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 	if (ret != 0)
 		goto err_put_free;
 
+	ret = virtio_gpu_array_prepare(vgdev, objs);
+	if (ret)
+		goto err_unlock;
+
 	fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context, 0);
 	if (!fence) {
 		ret = -ENOMEM;
@@ -482,6 +490,10 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 		if (ret != 0)
 			goto err_put_free;
 
+		ret = virtio_gpu_array_prepare(vgdev, objs);
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
index 0d1e3eb61bee..1175999acea1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -238,6 +238,12 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 		goto err_scanouts;
 	}
 
+	ret = drm_gem_shmem_shrinker_register(dev);
+	if (ret) {
+		DRM_ERROR("shrinker init failed\n");
+		goto err_modeset;
+	}
+
 	virtio_device_ready(vgdev->vdev);
 
 	if (num_capsets)
@@ -250,6 +256,8 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 			   5 * HZ);
 	return 0;
 
+err_modeset:
+	virtio_gpu_modeset_fini(vgdev);
 err_scanouts:
 	virtio_gpu_free_vbufs(vgdev);
 err_vbufs:
@@ -289,6 +297,7 @@ void virtio_gpu_release(struct drm_device *dev)
 	if (!vgdev)
 		return;
 
+	drm_gem_shmem_shrinker_unregister(dev);
 	virtio_gpu_modeset_fini(vgdev);
 	virtio_gpu_free_vbufs(vgdev);
 	virtio_gpu_cleanup_cap_cache(vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 8d7728181de0..ddae4f9402f7 100644
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
+static int virtio_gpu_shmem_evict(struct drm_gem_shmem_object *shmem)
 {
-	struct virtio_gpu_object_shmem *shmem;
-	struct drm_gem_shmem_object *dshmem;
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(&shmem->base);
+	int err;
+
+	/*
+	 * At first tell host to stop using guest's memory to ensure that
+	 * host won't touch the released guest's memory once it's gone.
+	 */
+	if (!shmem->evicted) {
+		err = virtio_gpu_detach_object_fenced(bo);
+		if (err)
+			return err;
+	}
 
-	shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
-	if (!shmem)
-		return ERR_PTR(-ENOMEM);
+	if (drm_gem_shmem_is_purgeable(shmem)) {
+		err = virtio_gpu_gem_host_mem_release(bo);
+		if (err) {
+			virtio_gpu_reattach_shmem_object(bo);
+			return err;
+		}
 
-	dshmem = &shmem->base.base;
-	dshmem->base.funcs = &virtio_gpu_shmem_funcs;
-	return &dshmem->base;
+		drm_gem_shmem_purge(shmem);
+	} else {
+		drm_gem_shmem_evict(shmem);
+	}
+
+	return 0;
 }
 
 static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
@@ -176,6 +191,64 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 	return 0;
 }
 
+int virtio_gpu_reattach_shmem_object(struct virtio_gpu_object *bo)
+{
+	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
+	struct virtio_gpu_mem_entry *ents;
+	unsigned int nents;
+	int err;
+
+	err = drm_gem_shmem_swap_in(&bo->base);
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
@@ -201,6 +274,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 		goto err_free_gem;
 
 	bo->dumb = params->dumb;
+	bo->base.evict = virtio_gpu_shmem_evict;
 
 	ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
 	if (ret != 0)
@@ -228,10 +302,20 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 		virtio_gpu_cmd_resource_create_3d(vgdev, bo, params,
 						  objs, fence);
 		virtio_gpu_object_attach(vgdev, bo, ents, nents);
+
+		shmem_obj->pages_mark_dirty_on_put = 1;
+
+		drm_gem_shmem_set_evictable(shmem_obj);
+		drm_gem_shmem_set_purgeable(shmem_obj);
 	} else {
 		virtio_gpu_cmd_create_resource(vgdev, bo, params,
 					       objs, fence);
 		virtio_gpu_object_attach(vgdev, bo, ents, nents);
+
+		shmem_obj->pages_mark_dirty_on_put = 1;
+
+		drm_gem_shmem_set_evictable(shmem_obj);
+		drm_gem_shmem_set_purgeable(shmem_obj);
 	}
 
 	*bo_ptr = bo;
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 7148f3813d8b..246bf0c54996 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -246,20 +246,32 @@ static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
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
+	if (virtio_gpu_is_shmem(bo)) {
+		err = drm_gem_pin_unlocked(&bo->base.base);
+		if (err)
+			return err;
+	}
+
+	if (plane->type == DRM_PLANE_TYPE_PRIMARY && !bo->guest_blob)
 		return 0;
 
 	if (bo->dumb && (plane->state->fb != new_state->fb)) {
 		vgfb->fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context,
 						     0);
-		if (!vgfb->fence)
+		if (!vgfb->fence) {
+			if (virtio_gpu_is_shmem(bo))
+				drm_gem_unpin_unlocked(&bo->base.base);
+
 			return -ENOMEM;
+		}
 	}
 
 	return 0;
@@ -269,15 +281,21 @@ static void virtio_gpu_plane_cleanup_fb(struct drm_plane *plane,
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
+	if (virtio_gpu_is_shmem(bo))
+		drm_gem_unpin_unlocked(&bo->base.base);
 }
 
 static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 06566e44307d..2a04dad1ae89 100644
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
@@ -636,6 +651,23 @@ virtio_gpu_cmd_resource_attach_backing(struct virtio_gpu_device *vgdev,
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
@@ -1099,6 +1131,14 @@ void virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
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
2.35.3

