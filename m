Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CF234F744
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 05:15:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D5206E9D4;
	Wed, 31 Mar 2021 03:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E84E06E9D0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 03:15:34 +0000 (UTC)
IronPort-SDR: la60M3lKuiYnEHntnpinOf8ObyyiktdSUFrYP1yj8bZKsfYueLisb29xLzbAms2MP9yfiAUURT
 9wwmY44/+usg==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="171315581"
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="171315581"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 20:15:33 -0700
IronPort-SDR: qfd3Gs7E37/Ll5G6lWV5gUSkGGvUpCgeOxD/YzkXJeQwmDUedfAG696aqH/L2TSHyHI704i9jA
 Dwl4HgndTn7A==
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="455292435"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 20:15:33 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/virtio: Create Dumb BOs as guest Blobs
Date: Tue, 30 Mar 2021 20:04:38 -0700
Message-Id: <20210331030439.1564032-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If support for Blob resources is available, then dumb BOs created
by the driver can be considered as guest Blobs. And, for guest
Blobs, there is no need to do any transfers or flushes but we do
need to do set_scanout even if the FB has not changed as part of
plane updates.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_gem.c    |  8 ++++++++
 drivers/gpu/drm/virtio/virtgpu_object.c |  3 +++
 drivers/gpu/drm/virtio/virtgpu_plane.c  | 18 +++++++++++-------
 3 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 8502400b2f9c..5f49fb1cce65 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -64,6 +64,7 @@ int virtio_gpu_mode_dumb_create(struct drm_file *file_priv,
 {
 	struct drm_gem_object *gobj;
 	struct virtio_gpu_object_params params = { 0 };
+	struct virtio_gpu_device *vgdev = dev->dev_private;
 	int ret;
 	uint32_t pitch;
 
@@ -79,6 +80,13 @@ int virtio_gpu_mode_dumb_create(struct drm_file *file_priv,
 	params.height = args->height;
 	params.size = args->size;
 	params.dumb = true;
+
+	if (vgdev->has_resource_blob) {
+		params.blob_mem = VIRTGPU_BLOB_MEM_GUEST;
+		params.blob_flags = VIRTGPU_BLOB_FLAG_USE_SHAREABLE;
+		params.blob = true;
+	}
+
 	ret = virtio_gpu_gem_create(file_priv, dev, &params, &gobj,
 				    &args->handle);
 	if (ret)
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 4ff1ec28e630..f648b0e24447 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -254,6 +254,9 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 	}
 
 	if (params->blob) {
+		if (params->blob_mem == VIRTGPU_BLOB_MEM_GUEST)
+			bo->guest_blob = true;
+
 		virtio_gpu_cmd_resource_create_blob(vgdev, bo, params,
 						    ents, nents);
 	} else if (params->virgl) {
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 4e1b17548007..3731f1a6477d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -161,10 +161,11 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 		return;
 
 	bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
-	if (bo->dumb)
+	if (bo->dumb && !bo->guest_blob)
 		virtio_gpu_update_dumb_bo(vgdev, plane->state, &rect);
 
-	if (plane->state->fb != old_state->fb ||
+	if ((bo->dumb && bo->guest_blob) ||
+	    plane->state->fb != old_state->fb ||
 	    plane->state->src_w != old_state->src_w ||
 	    plane->state->src_h != old_state->src_h ||
 	    plane->state->src_x != old_state->src_x ||
@@ -198,11 +199,14 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 		}
 	}
 
-	virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle,
-				      rect.x1,
-				      rect.y1,
-				      rect.x2 - rect.x1,
-				      rect.y2 - rect.y1);
+	if (!bo->guest_blob) {
+		virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle,
+					      rect.x1,
+				              rect.y1,
+				              rect.x2 - rect.x1,
+				              rect.y2 - rect.y1);
+	}
+
 	virtio_gpu_notify(vgdev);
 }
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
