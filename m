Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 435CE99D55F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 19:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4E010E493;
	Mon, 14 Oct 2024 17:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 400 seconds by postgrey-1.36 at gabe;
 Mon, 14 Oct 2024 17:14:58 UTC
Received: from erminea.space (erminea.space [51.250.125.203])
 by gabe.freedesktop.org (Postfix) with SMTP id 9AE5710E493
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 17:14:58 +0000 (UTC)
Received: (qmail 16812 invoked from network); 14 Oct 2024 17:08:16 -0000
Received: from localhost. (HELO erminea.space) (127.0.0.1)
 by 0.0.0.0 with SMTP; 14 Oct 2024 17:08:16 -0000
Received: from localhost.localdomain ([37.204.49.201])
 by erminea.space with ESMTPSA id YP79JwBQDWeoQQAAH+dm7w
 (envelope-from <mustela@erminea.space>); Mon, 14 Oct 2024 20:08:16 +0300
From: Peter Shkenev <mustela@erminea.space>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/virtio: use generic dumb_map_offset implementation
Date: Mon, 14 Oct 2024 20:07:58 +0300
Message-ID: <20241014170801.71231-1-mustela@erminea.space>
X-Mailer: git-send-email 2.46.2
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
 drivers/gpu/drm/virtio/virtgpu_drv.c   |  1 -
 drivers/gpu/drm/virtio/virtgpu_gem.c   | 15 ---------------
 drivers/gpu/drm/virtio/virtgpu_ioctl.c |  3 ++-
 3 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index ffca6e2e1c9a..909808398d66 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -184,7 +184,6 @@ static const struct drm_driver driver = {
 	.postclose = virtio_gpu_driver_postclose,
 
 	.dumb_create = virtio_gpu_mode_dumb_create,
-	.dumb_map_offset = virtio_gpu_mode_dumb_mmap,
 
 	DRM_FBDEV_SHMEM_DRIVER_OPS,
 
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
index e4f76f315550..13f3ed60a0e5 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -30,6 +30,7 @@
 #include <linux/uaccess.h>
 
 #include <drm/drm_file.h>
+#include <drm/drm_gem.h>
 #include <drm/virtgpu_drm.h>
 
 #include "virtgpu_drv.h"
@@ -80,7 +81,7 @@ static int virtio_gpu_map_ioctl(struct drm_device *dev, void *data,
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct drm_virtgpu_map *virtio_gpu_map = data;
 
-	return virtio_gpu_mode_dumb_mmap(file, vgdev->ddev,
+	return drm_gem_dumb_map_offset(file, vgdev->ddev,
 					 virtio_gpu_map->handle,
 					 &virtio_gpu_map->offset);
 }
-- 
2.46.2

