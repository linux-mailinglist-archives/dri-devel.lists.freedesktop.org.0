Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C51D937A278
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 10:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30336E9FD;
	Tue, 11 May 2021 08:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40CD6E9FB
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 08:48:22 +0000 (UTC)
IronPort-SDR: 55BW1ion8rHjjdhWs5hJQIRrjW+2c4jMtc00aSvOuDe/BnZpJDt62074HfoVzeCvRs/zve2nyT
 9HbatgXsYQ9A==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="199458709"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="199458709"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:48:22 -0700
IronPort-SDR: JKSVpW1egDva0LGrXVttET2vp8GqtqhOhwEW9uN1LPkvV/3rXyCEOQbwn9iBpNqyNuiOQ6Lqcq
 XGqmSxNQPTKQ==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="541571692"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:48:22 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/virtio: Probe and implement
 VIRTIO_GPU_F_EXPLICIT_FLUSH feature
Date: Tue, 11 May 2021 01:36:10 -0700
Message-Id: <20210511083610.367541-3-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511083610.367541-1-vivek.kasireddy@intel.com>
References: <20210511083610.367541-1-vivek.kasireddy@intel.com>
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

If this feature is available, a fence will be associated with the
scanout buffer and a dma_fence_wait will be performed as part of
plane update.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_debugfs.c |  1 +
 drivers/gpu/drm/virtio/virtgpu_drv.c     |  1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  1 +
 drivers/gpu/drm/virtio/virtgpu_kms.c     |  9 ++++-
 drivers/gpu/drm/virtio/virtgpu_plane.c   | 51 ++++++++++++++++++++----
 5 files changed, 53 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
index c2b20e0ee030..4c258299752b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
@@ -52,6 +52,7 @@ static int virtio_gpu_features(struct seq_file *m, void *data)
 			    vgdev->has_resource_assign_uuid);
 
 	virtio_gpu_add_bool(m, "blob resources", vgdev->has_resource_blob);
+	virtio_gpu_add_bool(m, "explicit flush", vgdev->has_explicit_flush);
 	virtio_gpu_add_int(m, "cap sets", vgdev->num_capsets);
 	virtio_gpu_add_int(m, "scanouts", vgdev->num_scanouts);
 	if (vgdev->host_visible_region.len) {
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index a21dc3ad6f88..b003523e876e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -166,6 +166,7 @@ static unsigned int features[] = {
 	VIRTIO_GPU_F_EDID,
 	VIRTIO_GPU_F_RESOURCE_UUID,
 	VIRTIO_GPU_F_RESOURCE_BLOB,
+	VIRTIO_GPU_F_EXPLICIT_FLUSH,
 };
 static struct virtio_driver virtio_gpu_driver = {
 	.feature_table = features,
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index f77d196ccc8f..72552618d3c3 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -233,6 +233,7 @@ struct virtio_gpu_device {
 	bool has_resource_assign_uuid;
 	bool has_resource_blob;
 	bool has_host_visible;
+	bool has_explicit_flush;
 	struct virtio_shm_region host_visible_region;
 	struct drm_mm host_visible_mm;
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index b375394193be..d6ff9cb8f97e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -156,6 +156,9 @@ int virtio_gpu_init(struct drm_device *dev)
 	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_BLOB)) {
 		vgdev->has_resource_blob = true;
 	}
+	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_EXPLICIT_FLUSH)) {
+		vgdev->has_explicit_flush = true;
+	}
 	if (virtio_get_shm_region(vgdev->vdev, &vgdev->host_visible_region,
 				  VIRTIO_GPU_SHM_ID_HOST_VISIBLE)) {
 		if (!devm_request_mem_region(&vgdev->vdev->dev,
@@ -176,11 +179,13 @@ int virtio_gpu_init(struct drm_device *dev)
 			    (unsigned long)vgdev->host_visible_region.len);
 	}
 
-	DRM_INFO("features: %cvirgl %cedid %cresource_blob %chost_visible\n",
+	DRM_INFO("features: %cvirgl %cedid %cresource_blob %chost_visible\
+		 %cexplicit_flush\n",
 		 vgdev->has_virgl_3d    ? '+' : '-',
 		 vgdev->has_edid        ? '+' : '-',
 		 vgdev->has_resource_blob ? '+' : '-',
-		 vgdev->has_host_visible ? '+' : '-');
+		 vgdev->has_host_visible ? '+' : '-',
+		 vgdev->has_explicit_flush ? '+' : '-');
 
 	ret = virtio_find_vqs(vgdev->vdev, 2, vqs, callbacks, names, NULL);
 	if (ret) {
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 4e1b17548007..9ae2ec2e9da7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -129,6 +129,30 @@ static void virtio_gpu_update_dumb_bo(struct virtio_gpu_device *vgdev,
 					   objs, NULL);
 }
 
+static void virtio_gpu_fb_wait_flush(struct drm_plane *plane)
+{
+	struct drm_device *dev = plane->dev;
+	struct virtio_gpu_device *vgdev = dev->dev_private;
+	struct virtio_gpu_framebuffer *vgfb;
+
+	vgfb = to_virtio_gpu_framebuffer(plane->state->fb);
+	if (vgfb && vgfb->fence) {
+		struct virtio_gpu_object_array *objs;
+
+		objs = virtio_gpu_array_alloc(1);
+		if (!objs)
+			return;
+		virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
+		virtio_gpu_array_lock_resv(objs);
+		virtio_gpu_cmd_wait_flush(vgdev, objs, vgfb->fence);
+		virtio_gpu_notify(vgdev);
+
+		dma_fence_wait(&vgfb->fence->f, true);
+		dma_fence_put(&vgfb->fence->f);
+		vgfb->fence = NULL;
+	}
+}
+
 static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 					    struct drm_atomic_state *state)
 {
@@ -204,17 +228,22 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 				      rect.x2 - rect.x1,
 				      rect.y2 - rect.y1);
 	virtio_gpu_notify(vgdev);
+
+	if (vgdev->has_explicit_flush && bo->guest_blob)
+		virtio_gpu_fb_wait_flush(plane);
 }
 
-static int virtio_gpu_cursor_prepare_fb(struct drm_plane *plane,
-					struct drm_plane_state *new_state)
+static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
+				       struct drm_plane_state *new_state)
 {
 	struct drm_device *dev = plane->dev;
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_framebuffer *vgfb;
 	struct virtio_gpu_object *bo;
 
-	if (!new_state->fb)
+	if (!new_state->fb ||
+	    (plane->type == DRM_PLANE_TYPE_PRIMARY &&
+	    !vgdev->has_explicit_flush))
 		return 0;
 
 	vgfb = to_virtio_gpu_framebuffer(new_state->fb);
@@ -228,12 +257,16 @@ static int virtio_gpu_cursor_prepare_fb(struct drm_plane *plane,
 	return 0;
 }
 
-static void virtio_gpu_cursor_cleanup_fb(struct drm_plane *plane,
-					 struct drm_plane_state *old_state)
+static void virtio_gpu_plane_cleanup_fb(struct drm_plane *plane,
+					struct drm_plane_state *old_state)
 {
+	struct drm_device *dev = plane->dev;
+	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_framebuffer *vgfb;
 
-	if (!plane->state->fb)
+	if (!plane->state->fb ||
+	    (plane->type == DRM_PLANE_TYPE_PRIMARY &&
+	    !vgdev->has_explicit_flush))
 		return;
 
 	vgfb = to_virtio_gpu_framebuffer(plane->state->fb);
@@ -321,13 +354,15 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 }
 
 static const struct drm_plane_helper_funcs virtio_gpu_primary_helper_funcs = {
+	.prepare_fb		= virtio_gpu_plane_prepare_fb,
+	.cleanup_fb		= virtio_gpu_plane_cleanup_fb,
 	.atomic_check		= virtio_gpu_plane_atomic_check,
 	.atomic_update		= virtio_gpu_primary_plane_update,
 };
 
 static const struct drm_plane_helper_funcs virtio_gpu_cursor_helper_funcs = {
-	.prepare_fb		= virtio_gpu_cursor_prepare_fb,
-	.cleanup_fb		= virtio_gpu_cursor_cleanup_fb,
+	.prepare_fb		= virtio_gpu_plane_prepare_fb,
+	.cleanup_fb		= virtio_gpu_plane_cleanup_fb,
 	.atomic_check		= virtio_gpu_plane_atomic_check,
 	.atomic_update		= virtio_gpu_cursor_plane_update,
 };
-- 
2.30.2

