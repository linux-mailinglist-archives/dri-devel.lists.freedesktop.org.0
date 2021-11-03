Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4147044408F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 12:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F6173041;
	Wed,  3 Nov 2021 11:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036CA72FF4
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 11:25:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: mwezdeck) with ESMTPSA id 620241F45616
From: Maksym Wezdecki <maksym.wezdecki@collabora.com>
To: David Airlie <airlied@linux.ie>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 1/2] drm/virtio: introduce ioctl for pinning pages
Date: Wed,  3 Nov 2021 12:25:35 +0100
Message-Id: <20211103112536.126855-2-maksym.wezdecki@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211103112536.126855-1-maksym.wezdecki@collabora.com>
References: <20211103112536.126855-1-maksym.wezdecki@collabora.com>
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
Cc: mwezdeck <maksym.wezdecki@collabora.co.uk>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: mwezdeck <maksym.wezdecki@collabora.co.uk>

Pinning pages happens in virtio_gpu_object_shmem_init()
function.

This ioctl allows to pin pages if it was not done earlier.

Signed-off-by: mwezdeck <maksym.wezdecki@collabora.co.uk>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  5 +++-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c  | 11 ++++++++
 drivers/gpu/drm/virtio/virtgpu_object.c | 34 +++++++++++++++++++++++++
 include/uapi/drm/virtgpu_drm.h          |  9 +++++++
 4 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index e0265fe74aa5..232933919b91 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -278,7 +278,7 @@ struct virtio_gpu_fpriv {
 };
 
 /* virtgpu_ioctl.c */
-#define DRM_VIRTIO_NUM_IOCTLS 12
+#define DRM_VIRTIO_NUM_IOCTLS 13
 extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
 void virtio_gpu_create_context(struct drm_device *dev, struct drm_file *file);
 
@@ -455,6 +455,9 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 			     struct virtio_gpu_object **bo_ptr,
 			     struct virtio_gpu_fence *fence);
 
+int virtio_gpu_object_pin(struct drm_file *file, 
+			  struct virtio_gpu_device *vgdev, uint32_t handle);
+
 bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo);
 
 int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev,
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 0007e423d885..f6a3a760c32d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -836,6 +836,14 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 	return ret;
 }
 
+static int virtio_gpu_pin_ioctl(struct drm_device *dev, void *data,
+				struct drm_file *file)
+{
+	struct virtio_gpu_device *vgdev = dev->dev_private;
+	struct drm_virtgpu_pin *virtio_gpu_pin = data;
+	return virtio_gpu_object_pin(file, vgdev, virtio_gpu_pin->handle);
+}
+
 struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
 	DRM_IOCTL_DEF_DRV(VIRTGPU_MAP, virtio_gpu_map_ioctl,
 			  DRM_RENDER_ALLOW),
@@ -875,4 +883,7 @@ struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
 
 	DRM_IOCTL_DEF_DRV(VIRTGPU_CONTEXT_INIT, virtio_gpu_context_init_ioctl,
 			  DRM_RENDER_ALLOW),
+
+	DRM_IOCTL_DEF_DRV(VIRTGPU_PIN, virtio_gpu_pin_ioctl,
+			  DRM_RENDER_ALLOW),
 };
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index f648b0e24447..064c50cb9846 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -280,3 +280,37 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 	drm_gem_shmem_free_object(&shmem_obj->base);
 	return ret;
 }
+
+int virtio_gpu_object_pin(struct drm_file *file, 
+			  struct virtio_gpu_device *vgdev, uint32_t handle)
+{
+	int ret;
+	struct drm_gem_object *gem;
+	struct virtio_gpu_object *bo;
+	struct virtio_gpu_object_shmem *shmem;
+	struct virtio_gpu_mem_entry *ents;
+	unsigned int nents;
+
+	gem = drm_gem_object_lookup(file, handle);
+	if (gem == NULL)
+		return -ENOENT;
+	
+	bo = gem_to_virtio_gpu_obj(gem);
+	if (bo == NULL)
+		return -ENOENT;
+
+	shmem = to_virtio_gpu_shmem(bo);
+	if (shmem == NULL)
+		return -ENOENT;
+
+	if (!shmem->pages) {
+		ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
+		if (ret != 0) {
+			return -EFAULT;
+		}
+
+		virtio_gpu_object_attach(vgdev, bo, ents, nents);
+	}
+
+	return 0;
+}
diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index a13e20cc66b4..bb661d53c0e9 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -48,6 +48,7 @@ extern "C" {
 #define DRM_VIRTGPU_GET_CAPS  0x09
 #define DRM_VIRTGPU_RESOURCE_CREATE_BLOB 0x0a
 #define DRM_VIRTGPU_CONTEXT_INIT 0x0b
+#define DRM_VIRTGPU_PIN 0x0c
 
 #define VIRTGPU_EXECBUF_FENCE_FD_IN	0x01
 #define VIRTGPU_EXECBUF_FENCE_FD_OUT	0x02
@@ -196,6 +197,10 @@ struct drm_virtgpu_context_init {
 	__u64 ctx_set_params;
 };
 
+struct drm_virtgpu_pin {
+	__u32 handle;
+};
+
 #define DRM_IOCTL_VIRTGPU_MAP \
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_MAP, struct drm_virtgpu_map)
 
@@ -239,6 +244,10 @@ struct drm_virtgpu_context_init {
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_CONTEXT_INIT,		\
 		struct drm_virtgpu_context_init)
 
+#define DRM_IOCTL_VIRTGPU_PIN					\
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_PIN,		\
+		struct drm_virtgpu_pin)
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.30.2

