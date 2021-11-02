Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B9E442CA6
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 12:32:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D8C6E07B;
	Tue,  2 Nov 2021 11:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415256E08C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 11:32:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: mwezdeck) with ESMTPSA id AFC341F4483F
From: Maksym Wezdecki <maksym.wezdecki@collabora.com>
To: David Airlie <airlied@linux.ie>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] drm/virtio: delay pinning the pages till first use
Date: Tue,  2 Nov 2021 12:31:39 +0100
Message-Id: <20211102113139.154140-1-maksym.wezdecki@collabora.com>
X-Mailer: git-send-email 2.30.2
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

The idea behind the commit:
  1. not pin the pages during resource_create ioctl
  2. pin the pages on the first use during:
	- transfer_*_host ioctl
        - map ioctl
  3. introduce new ioctl for pinning pages on demand

This change has no impact on user space.

Signed-off-by: mwezdeck <maksym.wezdecki@collabora.co.uk>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  6 ++-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c  | 65 +++++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_object.c | 42 ++++++++++++----
 include/uapi/drm/virtgpu_drm.h          | 10 ++++
 4 files changed, 113 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index e0265fe74aa5..cf2cad663575 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -278,7 +278,7 @@ struct virtio_gpu_fpriv {
 };
 
 /* virtgpu_ioctl.c */
-#define DRM_VIRTIO_NUM_IOCTLS 12
+#define DRM_VIRTIO_NUM_IOCTLS 13
 extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
 void virtio_gpu_create_context(struct drm_device *dev, struct drm_file *file);
 
@@ -455,6 +455,10 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 			     struct virtio_gpu_object **bo_ptr,
 			     struct virtio_gpu_fence *fence);
 
+int virtio_gpu_object_pin(struct virtio_gpu_device *vgdev,
+			  struct virtio_gpu_object_array *objs,
+			  int num_gem_objects);
+
 bool virtio_gpu_is_shmem(struct virtio_gpu_object *bo);
 
 int virtio_gpu_resource_id_get(struct virtio_gpu_device *vgdev,
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 5618a1d5879c..49bf53f358b5 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -102,6 +102,25 @@ static int virtio_gpu_map_ioctl(struct drm_device *dev, void *data,
 {
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct drm_virtgpu_map *virtio_gpu_map = data;
+	struct virtio_gpu_object_array *objs;
+	struct virtio_gpu_object *bo;
+	struct virtio_gpu_object_shmem *shmem;
+
+	objs = virtio_gpu_array_from_handles(file, &virtio_gpu_map->handle, 1);
+	if (objs == NULL)
+		return -ENOENT;
+
+	bo = gem_to_virtio_gpu_obj(objs->objs[0]);
+	if (bo == NULL)
+		return -ENOENT;
+	
+	shmem = to_virtio_gpu_shmem(bo);
+	if (shmem == NULL)
+		return -ENOENT;
+
+	if (!shmem->pages) {
+		virtio_gpu_object_pin(vgdev, objs, 1);
+	}
 
 	return virtio_gpu_mode_dumb_mmap(file, vgdev->ddev,
 					 virtio_gpu_map->handle,
@@ -292,6 +311,9 @@ static int virtio_gpu_getparam_ioctl(struct drm_device *dev, void *data,
 	case VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs:
 		value = vgdev->capset_id_mask;
 		break;
+	case VIRTGPU_PARAM_PIN_ON_DEMAND:
+		value = 1;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -397,6 +419,7 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 	struct virtio_gpu_object *bo;
 	struct virtio_gpu_object_array *objs;
 	struct virtio_gpu_fence *fence;
+	struct virtio_gpu_object_shmem *shmem;
 	int ret;
 	u32 offset = args->offset;
 
@@ -414,6 +437,11 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 		goto err_put_free;
 	}
 
+	shmem = to_virtio_gpu_shmem(bo);
+	if (!shmem->pages) {
+		virtio_gpu_object_pin(vgdev, objs, 1);
+	}
+
 	if (!bo->host3d_blob && (args->stride || args->layer_stride)) {
 		ret = -EINVAL;
 		goto err_put_free;
@@ -451,6 +479,7 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 	struct drm_virtgpu_3d_transfer_to_host *args = data;
 	struct virtio_gpu_object *bo;
 	struct virtio_gpu_object_array *objs;
+	struct virtio_gpu_object_shmem *shmem;
 	struct virtio_gpu_fence *fence;
 	int ret;
 	u32 offset = args->offset;
@@ -465,6 +494,11 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 		goto err_put_free;
 	}
 
+	shmem = to_virtio_gpu_shmem(bo);
+	if (!shmem->pages) {
+		virtio_gpu_object_pin(vgdev, objs, 1);
+	}
+
 	if (!vgdev->has_virgl_3d) {
 		virtio_gpu_cmd_transfer_to_host_2d
 			(vgdev, offset,
@@ -836,6 +870,34 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 	return ret;
 }
 
+static int virtio_gpu_pin_ioctl(struct drm_device *dev, void *data,
+				struct drm_file *file)
+{
+	struct virtio_gpu_device *vgdev = dev->dev_private;
+	struct drm_virtgpu_pin *virtio_gpu_pin = data;
+	struct virtio_gpu_object_array *objs;
+	struct virtio_gpu_object *bo;
+	struct virtio_gpu_object_shmem *shmem;
+
+	objs = virtio_gpu_array_from_handles(file, &virtio_gpu_pin->handle, 1);
+	if (objs == NULL)
+		return -ENOENT;
+
+	bo = gem_to_virtio_gpu_obj(objs->objs[0]);
+	if (bo == NULL)
+		return -ENOENT;
+	
+	shmem = to_virtio_gpu_shmem(bo);
+	if (shmem == NULL)
+		return -ENOENT;
+
+	if (!shmem->pages) {
+		return virtio_gpu_object_pin(vgdev, objs, 1);
+	}
+
+	return 0;
+}
+
 struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
 	DRM_IOCTL_DEF_DRV(VIRTGPU_MAP, virtio_gpu_map_ioctl,
 			  DRM_RENDER_ALLOW),
@@ -875,4 +937,7 @@ struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
 
 	DRM_IOCTL_DEF_DRV(VIRTGPU_CONTEXT_INIT, virtio_gpu_context_init_ioctl,
 			  DRM_RENDER_ALLOW),
+
+	DRM_IOCTL_DEF_DRV(VIRTGPU_PIN, virtio_gpu_pin_ioctl,
+			  DRM_RENDER_ALLOW),
 };
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index f648b0e24447..ae569003d7bc 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -80,9 +80,9 @@ void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
 			kfree(shmem->pages);
 			shmem->pages = NULL;
 			drm_gem_shmem_unpin(&bo->base.base);
+			drm_gem_shmem_free_object(&bo->base.base);
 		}
 
-		drm_gem_shmem_free_object(&bo->base.base);
 	} else if (virtio_gpu_is_vram(bo)) {
 		struct virtio_gpu_object_vram *vram = to_virtio_gpu_vram(bo);
 
@@ -246,13 +246,6 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 			goto err_put_objs;
 	}
 
-	ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
-	if (ret != 0) {
-		virtio_gpu_array_put_free(objs);
-		virtio_gpu_free_object(&shmem_obj->base);
-		return ret;
-	}
-
 	if (params->blob) {
 		if (params->blob_mem == VIRTGPU_BLOB_MEM_GUEST)
 			bo->guest_blob = true;
@@ -262,8 +255,13 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 	} else if (params->virgl) {
 		virtio_gpu_cmd_resource_create_3d(vgdev, bo, params,
 						  objs, fence);
-		virtio_gpu_object_attach(vgdev, bo, ents, nents);
 	} else {
+		ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
+		if (ret != 0) {
+			virtio_gpu_array_put_free(objs);
+			virtio_gpu_free_object(&shmem_obj->base);
+			return ret;
+		}
 		virtio_gpu_cmd_create_resource(vgdev, bo, params,
 					       objs, fence);
 		virtio_gpu_object_attach(vgdev, bo, ents, nents);
@@ -280,3 +278,29 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 	drm_gem_shmem_free_object(&shmem_obj->base);
 	return ret;
 }
+
+int virtio_gpu_object_pin(struct virtio_gpu_device *vgdev,
+			  struct virtio_gpu_object_array *objs,
+			  int num_gem_objects)
+{
+	int i, ret;
+
+	for (i = 0; i < num_gem_objects; i++) {
+		struct virtio_gpu_mem_entry *ents;
+		unsigned int nents;
+
+		struct virtio_gpu_object *bo =
+			gem_to_virtio_gpu_obj(objs->objs[i]);
+		if (!bo) {
+			return -EFAULT;
+		}
+
+		ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
+		if (ret != 0) {
+			return -EFAULT;
+		}
+
+		virtio_gpu_object_attach(vgdev, bo, ents, nents);
+	}
+	return 0;
+}
diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index a13e20cc66b4..be6e67f1bb7f 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -48,6 +48,7 @@ extern "C" {
 #define DRM_VIRTGPU_GET_CAPS  0x09
 #define DRM_VIRTGPU_RESOURCE_CREATE_BLOB 0x0a
 #define DRM_VIRTGPU_CONTEXT_INIT 0x0b
+#define DRM_VIRTGPU_PIN 0x0c
 
 #define VIRTGPU_EXECBUF_FENCE_FD_IN	0x01
 #define VIRTGPU_EXECBUF_FENCE_FD_OUT	0x02
@@ -82,6 +83,7 @@ struct drm_virtgpu_execbuffer {
 #define VIRTGPU_PARAM_CROSS_DEVICE 5 /* Cross virtio-device resource sharing  */
 #define VIRTGPU_PARAM_CONTEXT_INIT 6 /* DRM_VIRTGPU_CONTEXT_INIT */
 #define VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs 7 /* Bitmask of supported capability set ids */
+#define VIRTGPU_PARAM_PIN_ON_DEMAND 8 /* is pinning on demand available? */
 
 struct drm_virtgpu_getparam {
 	__u64 param;
@@ -196,6 +198,10 @@ struct drm_virtgpu_context_init {
 	__u64 ctx_set_params;
 };
 
+struct drm_virtgpu_pin {
+	__u32 handle;
+};
+
 #define DRM_IOCTL_VIRTGPU_MAP \
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_MAP, struct drm_virtgpu_map)
 
@@ -239,6 +245,10 @@ struct drm_virtgpu_context_init {
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

