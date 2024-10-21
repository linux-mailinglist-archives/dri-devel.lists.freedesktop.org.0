Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B0F9A6707
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 13:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542C910E49E;
	Mon, 21 Oct 2024 11:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from erminea.space (erminea.space [51.250.125.203])
 by gabe.freedesktop.org (Postfix) with SMTP id 3281710E49E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 11:52:29 +0000 (UTC)
Received: (qmail 20491 invoked from network); 21 Oct 2024 11:52:27 -0000
Received: from localhost. (HELO erminea.space) (127.0.0.1)
 by 0.0.0.0 with SMTP; 21 Oct 2024 11:52:27 -0000
Received: from localhost.localdomain ([37.204.49.201])
 by erminea.space with ESMTPSA id h6SSHXtAFmcHUAAAH+dm7w
 (envelope-from <mustela@erminea.space>); Mon, 21 Oct 2024 14:52:27 +0300
From: Peter Shkenev <mustela@erminea.space>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/virtio: use generic dumb_map_offset implementation
Date: Mon, 21 Oct 2024 14:52:05 +0300
Message-ID: <20241021115210.5439-1-mustela@erminea.space>
X-Mailer: git-send-email 2.47.0
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

Currently, virtio uses its own dumb_map_offset implementation,
virtio_gpu_mode_dumb_mmap. It works similarly to generic implementation,
drm_gem_dumb_map_offset, and using the generic implementation is
preferable (and making drivers to do so is a task stated on the DRM
subsystem's TODO list).

Thus, make driver use the generic implementation. This includes
VIRTGPU_MAP ioctl so it cannot be used to circumvent rules imposed by
drm_gem_dumb_map_offset (imported objects cannot be mapped).

Signed-off-by: Peter Shkenev <mustela@erminea.space>
---
Changes in v2:
  - Remove excessive include of drm_gem.h from virtgpu_ioctl.h
  - Remove obsoleted virtio_gpu_mode_dumb_mmap prototype from
    virtgpu_drv.h

 drivers/gpu/drm/virtio/virtgpu_drv.c   |  1 -
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  3 ---
 drivers/gpu/drm/virtio/virtgpu_gem.c   | 15 ---------------
 drivers/gpu/drm/virtio/virtgpu_ioctl.c |  2 +-
 4 files changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index ffca6e2e1c9a..909808398d66 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -184,7 +184,6 @@ static const struct drm_driver driver = {
 	.postclose = virtio_gpu_driver_postclose,
 
 	.dumb_create = virtio_gpu_mode_dumb_create,
-	.dumb_map_offset = virtio_gpu_mode_dumb_mmap,
 
 	DRM_FBDEV_SHMEM_DRIVER_OPS,
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 64c236169db8..76f6f29f819a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -301,9 +301,6 @@ void virtio_gpu_gem_object_close(struct drm_gem_object *obj,
 int virtio_gpu_mode_dumb_create(struct drm_file *file_priv,
 				struct drm_device *dev,
 				struct drm_mode_create_dumb *args);
-int virtio_gpu_mode_dumb_mmap(struct drm_file *file_priv,
-			      struct drm_device *dev,
-			      uint32_t handle, uint64_t *offset_p);
 
 struct virtio_gpu_object_array *virtio_gpu_array_alloc(u32 nents);
 struct virtio_gpu_object_array*
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 7db48d17ee3a..aefbb49481f1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -99,21 +99,6 @@ int virtio_gpu_mode_dumb_create(struct drm_file *file_priv,
 	return ret;
 }
 
-int virtio_gpu_mode_dumb_mmap(struct drm_file *file_priv,
-			      struct drm_device *dev,
-			      uint32_t handle, uint64_t *offset_p)
-{
-	struct drm_gem_object *gobj;
-
-	BUG_ON(!offset_p);
-	gobj = drm_gem_object_lookup(file_priv, handle);
-	if (gobj == NULL)
-		return -ENOENT;
-	*offset_p = drm_vma_node_offset_addr(&gobj->vma_node);
-	drm_gem_object_put(gobj);
-	return 0;
-}
-
 int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
 			       struct drm_file *file)
 {
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index e4f76f315550..112142f4b618 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -80,7 +80,7 @@ static int virtio_gpu_map_ioctl(struct drm_device *dev, void *data,
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct drm_virtgpu_map *virtio_gpu_map = data;
 
-	return virtio_gpu_mode_dumb_mmap(file, vgdev->ddev,
+	return drm_gem_dumb_map_offset(file, vgdev->ddev,
 					 virtio_gpu_map->handle,
 					 &virtio_gpu_map->offset);
 }
-- 
2.47.0

