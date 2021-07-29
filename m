Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D87683D9F99
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 10:30:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446586ECE8;
	Thu, 29 Jul 2021 08:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35C76ECA0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 08:29:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="276612153"
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="276612153"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 01:29:50 -0700
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="507013891"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 01:29:50 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC v1 4/4] drm/virtio: Probe and implement VIRTIO_GPU_F_OUT_FENCE
 feature
Date: Thu, 29 Jul 2021 01:16:59 -0700
Message-Id: <20210729081659.2255499-5-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
References: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If this feature is available, the virtio-gpu driver will take
ownership of signalling the OUT_FENCE instead of drm core. As
a result, the OUT_FENCE will no longer be signalled along with
pageflip completion but at a later time.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_debugfs.c |  1 +
 drivers/gpu/drm/virtio/virtgpu_drv.c     |  1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  2 ++
 drivers/gpu/drm/virtio/virtgpu_fence.c   |  9 +++++
 drivers/gpu/drm/virtio/virtgpu_kms.c     | 10 ++++--
 drivers/gpu/drm/virtio/virtgpu_plane.c   | 44 +++++++++++++++++++++++-
 6 files changed, 64 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
index c2b20e0ee030..7e3b519c8126 100644
--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
@@ -52,6 +52,7 @@ static int virtio_gpu_features(struct seq_file *m, void *data)
 			    vgdev->has_resource_assign_uuid);
 
 	virtio_gpu_add_bool(m, "blob resources", vgdev->has_resource_blob);
+	virtio_gpu_add_bool(m, "resource out fence", vgdev->has_out_fence);
 	virtio_gpu_add_int(m, "cap sets", vgdev->num_capsets);
 	virtio_gpu_add_int(m, "scanouts", vgdev->num_scanouts);
 	if (vgdev->host_visible_region.len) {
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index ed85a7863256..9490d0756285 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -172,6 +172,7 @@ static unsigned int features[] = {
 	VIRTIO_GPU_F_EDID,
 	VIRTIO_GPU_F_RESOURCE_UUID,
 	VIRTIO_GPU_F_RESOURCE_BLOB,
+	VIRTIO_GPU_F_OUT_FENCE,
 };
 static struct virtio_driver virtio_gpu_driver = {
 	.feature_table = features,
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 3c43856d4768..11b040adb609 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -139,6 +139,7 @@ struct virtio_gpu_fence {
 	uint64_t fence_id;
 	struct virtio_gpu_fence_driver *drv;
 	struct list_head node;
+	struct dma_fence *out_fence;
 };
 
 struct virtio_gpu_vbuffer {
@@ -233,6 +234,7 @@ struct virtio_gpu_device {
 	bool has_resource_assign_uuid;
 	bool has_resource_blob;
 	bool has_host_visible;
+	bool has_out_fence;
 	struct virtio_shm_region host_visible_region;
 	struct drm_mm host_visible_mm;
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index d28e25e8409b..5f64f1c14439 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -134,6 +134,9 @@ void virtio_gpu_fence_event_process(struct virtio_gpu_device *vgdev,
 			if (signaled->f.context != curr->f.context)
 				continue;
 
+			if (curr->out_fence)
+				continue;
+
 			if (!dma_fence_is_later(&signaled->f, &curr->f))
 				continue;
 
@@ -142,6 +145,12 @@ void virtio_gpu_fence_event_process(struct virtio_gpu_device *vgdev,
 			dma_fence_put(&curr->f);
 		}
 
+		if (signaled->out_fence) {
+			dma_fence_signal(signaled->out_fence);
+			dma_fence_put(signaled->out_fence);
+			signaled->out_fence = NULL;
+		}
+
 		dma_fence_signal_locked(&signaled->f);
 		list_del(&signaled->node);
 		dma_fence_put(&signaled->f);
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index f3379059f324..610003d4752d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -156,6 +156,10 @@ int virtio_gpu_init(struct drm_device *dev)
 	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_BLOB)) {
 		vgdev->has_resource_blob = true;
 	}
+	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_OUT_FENCE)) {
+		vgdev->has_out_fence = true;
+		vgdev->ddev->mode_config.deferred_out_fence = true;
+	}
 	if (virtio_get_shm_region(vgdev->vdev, &vgdev->host_visible_region,
 				  VIRTIO_GPU_SHM_ID_HOST_VISIBLE)) {
 		if (!devm_request_mem_region(&vgdev->vdev->dev,
@@ -176,11 +180,13 @@ int virtio_gpu_init(struct drm_device *dev)
 			    (unsigned long)vgdev->host_visible_region.len);
 	}
 
-	DRM_INFO("features: %cvirgl %cedid %cresource_blob %chost_visible\n",
+	DRM_INFO("features: %cvirgl %cedid %cresource_blob %chost_visible \
+		 %cout_fence\n",
 		 vgdev->has_virgl_3d    ? '+' : '-',
 		 vgdev->has_edid        ? '+' : '-',
 		 vgdev->has_resource_blob ? '+' : '-',
-		 vgdev->has_host_visible ? '+' : '-');
+		 vgdev->has_host_visible ? '+' : '-',
+		 vgdev->has_out_fence ? '+' : '-');
 
 	ret = virtio_find_vqs(vgdev->vdev, 2, vqs, callbacks, names, NULL);
 	if (ret) {
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index a49fd9480381..1be60516a632 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -27,6 +27,7 @@
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_plane_helper.h>
+#include <drm/drm_vblank.h>
 
 #include "virtgpu_drv.h"
 
@@ -129,6 +130,45 @@ static void virtio_gpu_update_dumb_bo(struct virtio_gpu_device *vgdev,
 					   objs, NULL);
 }
 
+static void virtio_gpu_resource_add_out_fence(struct drm_plane *plane,
+					      struct virtio_gpu_output *output)
+{
+	struct drm_device *dev = plane->dev;
+	struct drm_crtc_state *crtc_state;
+	struct drm_pending_event *e;
+	struct virtio_gpu_device *vgdev = dev->dev_private;
+	struct virtio_gpu_framebuffer *vgfb;
+	struct virtio_gpu_object_array *objs;
+	struct virtio_gpu_fence *fence;
+
+	crtc_state = output->crtc.state;
+	if (!crtc_state || !crtc_state->event)
+		return;
+
+	e = &crtc_state->event->base;
+	if (!e->fence)
+		return;
+
+	vgfb = to_virtio_gpu_framebuffer(plane->state->fb);
+	if (!vgfb->fence) {
+		dma_fence_signal(e->fence);
+		return;
+	}
+
+	fence = virtio_gpu_fence_alloc(vgdev);
+	if (!fence)
+		return;
+
+	objs = virtio_gpu_array_alloc(1);
+	if (!objs)
+		return;
+
+	fence->out_fence = dma_fence_get(e->fence);
+	virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
+	virtio_gpu_array_lock_resv(objs);
+	virtio_gpu_cmd_resource_out_fence(vgdev, objs, fence);
+}
+
 static void virtio_gpu_resource_flush(struct drm_plane *plane,
 				      uint32_t x, uint32_t y,
 				      uint32_t width, uint32_t height)
@@ -151,7 +191,6 @@ static void virtio_gpu_resource_flush(struct drm_plane *plane,
 		virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle, x, y,
 					      width, height, objs, vgfb->fence);
 		virtio_gpu_notify(vgdev);
-
 		dma_fence_wait_timeout(&vgfb->fence->f, true,
 				       msecs_to_jiffies(50));
 		dma_fence_put(&vgfb->fence->f);
@@ -232,6 +271,9 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 		}
 	}
 
+	if (vgdev->has_out_fence && bo->guest_blob)
+		virtio_gpu_resource_add_out_fence(plane, output);
+
 	virtio_gpu_resource_flush(plane,
 				  rect.x1,
 				  rect.y1,
-- 
2.30.2

