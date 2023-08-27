Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF8C78A0BA
	for <lists+dri-devel@lfdr.de>; Sun, 27 Aug 2023 19:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F21410E1FE;
	Sun, 27 Aug 2023 17:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA9110E1E0;
 Sun, 27 Aug 2023 17:56:30 +0000 (UTC)
Received: from workpc.. (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9953866072E0;
 Sun, 27 Aug 2023 18:56:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693158989;
 bh=a9exc1odr2ZjcAOVqsqj9AwrRzi7iQXeLcKoEkRBekQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rt0ugOM3yY9K8YcgpAA/1TXi0d0JUi8W9Xj8HarHo58LEJ7M7iR54xiDWNUM17Wg3
 8mgoX+NDE68Z+ZWuzXgeFlqhuuZOoGIFpIqViCAHBSj4ASsKccqJZJjdiCibEYcXI4
 /bR5AJWnteJO2qWfQLTIbj3Aw0kWT6dtTvAfCAXWd9xLoMMXiNrwxZeFLoDZmStpTj
 FT+3SFfjm/BmGtRoYevGzBCmvfKyv+HegtewG/hcEYlJA5ppz2N2BlK1XbdXaoyZ+y
 jbw5BKN/CngK1kompuzsnselBRA2j5xEmc+4cb1KZ1IsNad2MunQ0zU6Ugdi5m5w1l
 OSke+H5fn/y5A==
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
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v15 22/23] drm/virtio: Support memory shrinking
Date: Sun, 27 Aug 2023 20:54:48 +0300
Message-ID: <20230827175449.1766701-23-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230827175449.1766701-1-dmitry.osipenko@collabora.com>
References: <20230827175449.1766701-1-dmitry.osipenko@collabora.com>
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
Cc: intel-gfx@lists.freedesktop.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
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
 drivers/gpu/drm/virtio/virtgpu_drv.h    | 13 +++++-
 drivers/gpu/drm/virtio/virtgpu_gem.c    | 35 ++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c  | 25 ++++++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c    |  8 ++++
 drivers/gpu/drm/virtio/virtgpu_object.c | 61 +++++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_vq.c     | 40 ++++++++++++++++
 include/uapi/drm/virtgpu_drm.h          | 14 ++++++
 7 files changed, 195 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 8c82530eae82..a34da2036221 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -278,7 +278,7 @@ struct virtio_gpu_fpriv {
 };
 
 /* virtgpu_ioctl.c */
-#define DRM_VIRTIO_NUM_IOCTLS 12
+#define DRM_VIRTIO_NUM_IOCTLS 13
 extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
 void virtio_gpu_create_context(struct drm_device *dev, struct drm_file *file);
 
@@ -316,6 +316,8 @@ void virtio_gpu_array_put_free_delayed(struct virtio_gpu_device *vgdev,
 void virtio_gpu_array_put_free_work(struct work_struct *work);
 int virtio_gpu_array_prepare(struct virtio_gpu_device *vgdev,
 			     struct virtio_gpu_object_array *objs);
+int virtio_gpu_gem_host_mem_release(struct virtio_gpu_object *bo);
+int virtio_gpu_gem_madvise(struct virtio_gpu_object *obj, int madv);
 int virtio_gpu_gem_pin(struct virtio_gpu_object *bo);
 void virtio_gpu_gem_unpin(struct virtio_gpu_object *bo);
 
@@ -329,6 +331,8 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_fence *fence);
 void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
 				   struct virtio_gpu_object *bo);
+int virtio_gpu_cmd_release_resource(struct virtio_gpu_device *vgdev,
+				    struct virtio_gpu_object *bo);
 void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 					uint64_t offset,
 					uint32_t width, uint32_t height,
@@ -349,6 +353,9 @@ void virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
 			      struct virtio_gpu_object *obj,
 			      struct virtio_gpu_mem_entry *ents,
 			      unsigned int nents);
+void virtio_gpu_object_detach(struct virtio_gpu_device *vgdev,
+			      struct virtio_gpu_object *obj,
+			      struct virtio_gpu_fence *fence);
 int virtio_gpu_attach_status_page(struct virtio_gpu_device *vgdev);
 int virtio_gpu_detach_status_page(struct virtio_gpu_device *vgdev);
 void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,
@@ -499,4 +506,8 @@ void virtio_gpu_vram_unmap_dma_buf(struct device *dev,
 int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 				struct drm_file *file);
 
+/* virtgpu_gem_shrinker.c */
+int virtio_gpu_gem_shrinker_init(struct virtio_gpu_device *vgdev);
+void virtio_gpu_gem_shrinker_fini(struct virtio_gpu_device *vgdev);
+
 #endif
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 97e67064c97e..748f7bbb0e6d 100644
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
@@ -315,6 +325,31 @@ int virtio_gpu_array_prepare(struct virtio_gpu_device *vgdev,
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
index 070c29cea26a..44a99166efdc 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -676,6 +676,28 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
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
@@ -715,4 +737,7 @@ struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
 
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
index 044b08aa78ac..dc4df8f2d89c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -97,6 +97,60 @@ static void virtio_gpu_free_object(struct drm_gem_object *obj)
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
@@ -110,6 +164,7 @@ static const struct drm_gem_object_funcs virtio_gpu_shmem_funcs = {
 	.vunmap = drm_gem_shmem_object_vunmap_locked,
 	.mmap = drm_gem_shmem_object_mmap,
 	.vm_ops = &drm_gem_shmem_vm_ops,
+	.evict = virtio_gpu_shmem_evict,
 };
 
 bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo)
@@ -189,6 +244,10 @@ int virtio_gpu_reattach_shmem_object_locked(struct virtio_gpu_object *bo)
 	if (!bo->detached)
 		return 0;
 
+	err = drm_gem_shmem_swapin_locked(&bo->base);
+	if (err)
+		return err;
+
 	err = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
 	if (err)
 		return err;
@@ -238,6 +297,8 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 		goto err_free_gem;
 
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
index b1d0e56565bc..4caba71b2740 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -48,6 +48,7 @@ extern "C" {
 #define DRM_VIRTGPU_GET_CAPS  0x09
 #define DRM_VIRTGPU_RESOURCE_CREATE_BLOB 0x0a
 #define DRM_VIRTGPU_CONTEXT_INIT 0x0b
+#define DRM_VIRTGPU_MADVISE 0x0c
 
 #define VIRTGPU_EXECBUF_FENCE_FD_IN	0x01
 #define VIRTGPU_EXECBUF_FENCE_FD_OUT	0x02
@@ -211,6 +212,15 @@ struct drm_virtgpu_context_init {
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
@@ -261,6 +271,10 @@ struct drm_virtgpu_context_init {
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

