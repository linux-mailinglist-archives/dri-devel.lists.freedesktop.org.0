Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A05444092
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 12:26:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543C57304F;
	Wed,  3 Nov 2021 11:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF9173041
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 11:25:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: mwezdeck) with ESMTPSA id CF5351F45615
From: Maksym Wezdecki <maksym.wezdecki@collabora.com>
To: David Airlie <airlied@linux.ie>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 2/2] drm/virtio: introduce lazy pinning
Date: Wed,  3 Nov 2021 12:25:36 +0100
Message-Id: <20211103112536.126855-3-maksym.wezdecki@collabora.com>
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

Userspace can opt-in to not pin pages during resource
create ioctl.

In transfer_*_host and map ioctls check if memory is pinned.
If pages are not pinned, pin it. Otherwise, do nothing.

This change is transparent to userspace.
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c  |  9 +++++++++
 drivers/gpu/drm/virtio/virtgpu_object.c | 27 ++++++++++++++++---------
 include/uapi/drm/virtgpu_drm.h          |  9 +++++++++
 3 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index f6a3a760c32d..c01c5c15701c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -103,6 +103,8 @@ static int virtio_gpu_map_ioctl(struct drm_device *dev, void *data,
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct drm_virtgpu_map *virtio_gpu_map = data;
 
+	virtio_gpu_object_pin(file, vgdev, virtio_gpu_map->handle);
+
 	return virtio_gpu_mode_dumb_mmap(file, vgdev->ddev,
 					 virtio_gpu_map->handle,
 					 &virtio_gpu_map->offset);
@@ -292,6 +294,9 @@ static int virtio_gpu_getparam_ioctl(struct drm_device *dev, void *data,
 	case VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs:
 		value = vgdev->capset_id_mask;
 		break;
+	case VIRTGPU_PARAM_PIN_ON_DEMAND:
+		value = 1;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -414,6 +419,8 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 		goto err_put_free;
 	}
 
+	virtio_gpu_object_pin(file, vgdev, args->bo_handle);
+
 	if (!bo->host3d_blob && (args->stride || args->layer_stride)) {
 		ret = -EINVAL;
 		goto err_put_free;
@@ -465,6 +472,8 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 		goto err_put_free;
 	}
 
+	virtio_gpu_object_pin(file, vgdev, args->bo_handle);
+
 	if (!vgdev->has_virgl_3d) {
 		virtio_gpu_cmd_transfer_to_host_2d
 			(vgdev, offset,
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 064c50cb9846..183e57ef10e8 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -219,7 +219,7 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_mem_entry *ents;
 	unsigned int nents;
 	int ret;
-
+	uint32_t backup_flags = params->flags;
 	*bo_ptr = NULL;
 
 	params->size = roundup(params->size, PAGE_SIZE);
@@ -246,13 +246,19 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 			goto err_put_objs;
 	}
 
-	ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
-	if (ret != 0) {
-		virtio_gpu_array_put_free(objs);
-		virtio_gpu_free_object(&shmem_obj->base);
-		return ret;
+	if (!(backup_flags & VIRTGPU_NOT_PIN_FLAG)) {
+		ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
+		if (ret != 0) {
+			virtio_gpu_array_put_free(objs);
+			virtio_gpu_free_object(&shmem_obj->base);
+			return ret;
+		}
 	}
 
+	// turn off these bits, as renderer doesn't support such bits
+	if (params->flags & VIRTGPU_NOT_PIN_FLAG)
+		params->flags &= ~(VIRTGPU_NOT_PIN_FLAG);
+
 	if (params->blob) {
 		if (params->blob_mem == VIRTGPU_BLOB_MEM_GUEST)
 			bo->guest_blob = true;
@@ -262,11 +268,13 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 	} else if (params->virgl) {
 		virtio_gpu_cmd_resource_create_3d(vgdev, bo, params,
 						  objs, fence);
-		virtio_gpu_object_attach(vgdev, bo, ents, nents);
+		if (!(backup_flags & VIRTGPU_NOT_PIN_FLAG))
+			virtio_gpu_object_attach(vgdev, bo, ents, nents);
 	} else {
 		virtio_gpu_cmd_create_resource(vgdev, bo, params,
 					       objs, fence);
-		virtio_gpu_object_attach(vgdev, bo, ents, nents);
+		if (!(backup_flags & VIRTGPU_NOT_PIN_FLAG))
+			virtio_gpu_object_attach(vgdev, bo, ents, nents);
 	}
 
 	*bo_ptr = bo;
@@ -305,9 +313,8 @@ int virtio_gpu_object_pin(struct drm_file *file,
 
 	if (!shmem->pages) {
 		ret = virtio_gpu_object_shmem_init(vgdev, bo, &ents, &nents);
-		if (ret != 0) {
+		if (ret != 0)
 			return -EFAULT;
-		}
 
 		virtio_gpu_object_attach(vgdev, bo, ents, nents);
 	}
diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index bb661d53c0e9..0780234f946f 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -83,12 +83,21 @@ struct drm_virtgpu_execbuffer {
 #define VIRTGPU_PARAM_CROSS_DEVICE 5 /* Cross virtio-device resource sharing  */
 #define VIRTGPU_PARAM_CONTEXT_INIT 6 /* DRM_VIRTGPU_CONTEXT_INIT */
 #define VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs 7 /* Bitmask of supported capability set ids */
+#define VIRTGPU_PARAM_PIN_ON_DEMAND 8 /* is pinning on demand available? */
 
 struct drm_virtgpu_getparam {
 	__u64 param;
 	__u64 value;
 };
 
+/* it is used in resource_create_ioctl as resource
+ * flag.
+ * First 8 bits of uint32_t and 24th bit 
+ * are reserved for user space driver.
+ * Userspace can opt-in to not pin pages.
+ */
+#define VIRTGPU_NOT_PIN_FLAG (1 << 9)
+
 /* NO_BO flags? NO resource flag? */
 /* resource flag for y_0_top */
 struct drm_virtgpu_resource_create {
-- 
2.30.2

