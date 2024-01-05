Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCE5825A86
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 19:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F0B10E68F;
	Fri,  5 Jan 2024 18:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F3310E67C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 18:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1704480451;
 bh=hRe/SQ0383HRKfSN7DEdQARJEA4/ceuvyt426OOpxLY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PttLRenqpput2D4w6qSyiD5TUaDNxQsucFKn3dHxXeRRz0+TKVRI/bTi/bnjtq9xe
 80g86TTpyBVoseXy6nLP+8f8C2bspZm679hkCgZLH39B0Uat6D/h6Xt7zt/IiY645m
 n/C6NSpaEAe8DKm7MkJtVftNNqzkk3cRgQ0M1A/B4o05UB8IfcMkiB6NrLRI+UYVA3
 5PIhRQZTQ/xgmPGi81tlDzUG6o1St0f0qBWYDhkRhzoLfS9IjxM2ZgBfcuiQbQv45P
 v5QB5QQkaGlQyS/Jz4RBZT13PJ4/hEselBS7Zc7vX65rVTquqTK6WqioLXNPGAaQJG
 zvxfPFcbcVOUw==
Received: from workpc.. (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id F12703782053;
 Fri,  5 Jan 2024 18:47:29 +0000 (UTC)
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
Subject: [PATCH v19 29/30] drm/virtio: Support shmem shrinking
Date: Fri,  5 Jan 2024 21:46:23 +0300
Message-ID: <20240105184624.508603-30-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
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

Link: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15278
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    | 13 +++++-
 drivers/gpu/drm/virtio/virtgpu_gem.c    | 48 +++++++++++++++++--
 drivers/gpu/drm/virtio/virtgpu_ioctl.c  | 25 ++++++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c    |  8 ++++
 drivers/gpu/drm/virtio/virtgpu_object.c | 61 +++++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_vq.c     | 40 ++++++++++++++++
 include/uapi/drm/virtgpu_drm.h          | 14 ++++++
 7 files changed, 204 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 1837dc7ea9fb..37188c00e161 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -283,7 +283,7 @@ struct virtio_gpu_fpriv {
 };
 
 /* virtgpu_ioctl.c */
-#define DRM_VIRTIO_NUM_IOCTLS 12
+#define DRM_VIRTIO_NUM_IOCTLS 13
 extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
 void virtio_gpu_create_context(struct drm_device *dev, struct drm_file *file);
 
@@ -321,6 +321,8 @@ void virtio_gpu_array_put_free_delayed(struct virtio_gpu_device *vgdev,
 void virtio_gpu_array_put_free_work(struct work_struct *work);
 int virtio_gpu_array_prepare(struct virtio_gpu_device *vgdev,
 			     struct virtio_gpu_object_array *objs);
+int virtio_gpu_gem_host_mem_release(struct virtio_gpu_object *bo);
+int virtio_gpu_gem_madvise(struct virtio_gpu_object *obj, int madv);
 int virtio_gpu_gem_pin(struct virtio_gpu_object *bo);
 void virtio_gpu_gem_unpin(struct virtio_gpu_object *bo);
 
@@ -334,6 +336,8 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_fence *fence);
 void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
 				   struct virtio_gpu_object *bo);
+int virtio_gpu_cmd_release_resource(struct virtio_gpu_device *vgdev,
+				    struct virtio_gpu_object *bo);
 void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 					uint64_t offset,
 					uint32_t width, uint32_t height,
@@ -354,6 +358,9 @@ void virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
 			      struct virtio_gpu_object *obj,
 			      struct virtio_gpu_mem_entry *ents,
 			      unsigned int nents);
+void virtio_gpu_object_detach(struct virtio_gpu_device *vgdev,
+			      struct virtio_gpu_object *obj,
+			      struct virtio_gpu_fence *fence);
 void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,
 			    struct virtio_gpu_output *output);
 int virtio_gpu_cmd_get_display_info(struct virtio_gpu_device *vgdev);
@@ -497,4 +504,8 @@ void virtio_gpu_vram_unmap_dma_buf(struct device *dev,
 int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 				struct drm_file *file);
 
+/* virtgpu_gem_shrinker.c */
+int virtio_gpu_gem_shrinker_init(struct virtio_gpu_device *vgdev);
+void virtio_gpu_gem_shrinker_fini(struct virtio_gpu_device *vgdev);
+
 #endif
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 97e67064c97e..68d27ae582ba 100644
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
@@ -305,16 +315,46 @@ int virtio_gpu_array_prepare(struct virtio_gpu_device *vgdev,
 	for (i = 0; i < objs->nents; i++) {
 		bo = gem_to_virtio_gpu_obj(objs->objs[i]);
 
-		if (virtio_gpu_is_shmem(bo) && bo->detached) {
-			ret = virtio_gpu_reattach_shmem_object_locked(bo);
-			if (ret)
-				break;
+		if (virtio_gpu_is_shmem(bo)) {
+			if (bo->base.madv)
+				return -EINVAL;
+
+			if (bo->detached) {
+				ret = virtio_gpu_reattach_shmem_object_locked(bo);
+				if (ret)
+					break;
+			}
 		}
 	}
 
 	return ret;
 }
 
+int virtio_gpu_gem_madvise(struct virtio_gpu_object *bo, int madv)
+{
+	if (virtio_gpu_is_shmem(bo))
+		return drm_gem_shmem_object_madvise(&bo->base.base, madv);
+
+	return 1;
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
 int virtio_gpu_gem_pin(struct virtio_gpu_object *bo)
 {
 	int err;
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index c7da22006149..a42799146090 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -701,6 +701,28 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
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
@@ -740,4 +762,7 @@ struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
 
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
index de347aa3b9a8..86888c1ae5d4 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -98,6 +98,60 @@ static void virtio_gpu_free_object(struct drm_gem_object *obj)
 	virtio_gpu_cleanup_object(bo);
 }
 
+static int virtio_gpu_detach_object_fenced(struct virtio_gpu_object *bo)
+{
+	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
+	struct virtio_gpu_fence *fence;
+
+	if (bo->detached)
+		return 0;
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
+}
+
+static int virtio_gpu_shmem_evict(struct drm_gem_object *obj)
+{
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
+	int err;
+
+	/* blob is not movable, it's impossible to detach it from host */
+	if (bo->blob_mem)
+		return -EBUSY;
+
+	/*
+	 * At first tell host to stop using guest's memory to ensure that
+	 * host won't touch the released guest's memory once it's gone.
+	 */
+	err = virtio_gpu_detach_object_fenced(bo);
+	if (err)
+		return err;
+
+	if (drm_gem_shmem_is_purgeable(&bo->base)) {
+		err = virtio_gpu_gem_host_mem_release(bo);
+		if (err)
+			return err;
+
+		drm_gem_shmem_purge_locked(&bo->base);
+	} else {
+		bo->base.pages_mark_dirty_on_put = 1;
+		drm_gem_shmem_evict_locked(&bo->base);
+	}
+
+	return 0;
+}
+
 static const struct drm_gem_object_funcs virtio_gpu_shmem_funcs = {
 	.free = virtio_gpu_free_object,
 	.open = virtio_gpu_gem_object_open,
@@ -111,6 +165,7 @@ static const struct drm_gem_object_funcs virtio_gpu_shmem_funcs = {
 	.vunmap = drm_gem_shmem_object_vunmap,
 	.mmap = drm_gem_shmem_object_mmap,
 	.vm_ops = &drm_gem_shmem_vm_ops,
+	.evict = virtio_gpu_shmem_evict,
 };
 
 bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo)
@@ -187,6 +242,10 @@ int virtio_gpu_reattach_shmem_object_locked(struct virtio_gpu_object *bo)
 	if (!bo->detached)
 		return 0;
 
+	err = drm_gem_shmem_swapin_locked(&bo->base);
+	if (err)
+		return err;
+
 	err = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
 	if (err)
 		return err;
@@ -240,6 +299,8 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 		goto err_put_pages;
 
 	bo->dumb = params->dumb;
+	bo->blob_mem = params->blob_mem;
+	bo->blob_flags = params->blob_flags;
 
 	if (bo->blob_mem == VIRTGPU_BLOB_MEM_GUEST)
 		bo->guest_blob = true;
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
index c2ce71987e9b..78255060bc9a 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -48,6 +48,7 @@ extern "C" {
 #define DRM_VIRTGPU_GET_CAPS  0x09
 #define DRM_VIRTGPU_RESOURCE_CREATE_BLOB 0x0a
 #define DRM_VIRTGPU_CONTEXT_INIT 0x0b
+#define DRM_VIRTGPU_MADVISE 0x0c
 
 #define VIRTGPU_EXECBUF_FENCE_FD_IN	0x01
 #define VIRTGPU_EXECBUF_FENCE_FD_OUT	0x02
@@ -213,6 +214,15 @@ struct drm_virtgpu_context_init {
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
@@ -263,6 +273,10 @@ struct drm_virtgpu_context_init {
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
2.43.0

