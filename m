Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF173A37FB
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 01:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B70F6EE1D;
	Thu, 10 Jun 2021 23:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D046EE28
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 23:37:30 +0000 (UTC)
IronPort-SDR: epILgRn5an1+0oUydF49gSaawBdjW81kWcbmdciKadMbInZ7liOBnvXnnY63iyqI5a2ppiALdJ
 7mY6aCZRL34w==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="291059222"
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="291059222"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 16:37:29 -0700
IronPort-SDR: ipYU73yIYAh5AhO9jNa1cmhjPbBlsAgs/vNbBgyQYtwpEvJx3m+crat2nav67mQBJzIW8fI0+O
 E1YYRhV5jgmg==
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="414275084"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 16:37:29 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 3/3] drm/virtio: Add the fence in resource_flush if present
Date: Thu, 10 Jun 2021 16:24:56 -0700
Message-Id: <20210610232456.671905-4-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210610232456.671905-1-vivek.kasireddy@intel.com>
References: <20210610232456.671905-1-vivek.kasireddy@intel.com>
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

If the framebuffer associated with the plane contains a fence, then
it is added to resource_flush and will be waited upon for a max of
50 msecs or until it is signalled by the Host.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 45 ++++++++++++++++++++++----
 1 file changed, 39 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index dd7a1f2db9ad..a49fd9480381 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -129,6 +129,40 @@ static void virtio_gpu_update_dumb_bo(struct virtio_gpu_device *vgdev,
 					   objs, NULL);
 }
 
+static void virtio_gpu_resource_flush(struct drm_plane *plane,
+				      uint32_t x, uint32_t y,
+				      uint32_t width, uint32_t height)
+{
+	struct drm_device *dev = plane->dev;
+	struct virtio_gpu_device *vgdev = dev->dev_private;
+	struct virtio_gpu_framebuffer *vgfb;
+	struct virtio_gpu_object *bo;
+
+	vgfb = to_virtio_gpu_framebuffer(plane->state->fb);
+	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
+	if (vgfb->fence) {
+		struct virtio_gpu_object_array *objs;
+
+		objs = virtio_gpu_array_alloc(1);
+		if (!objs)
+			return;
+		virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
+		virtio_gpu_array_lock_resv(objs);
+		virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle, x, y,
+					      width, height, objs, vgfb->fence);
+		virtio_gpu_notify(vgdev);
+
+		dma_fence_wait_timeout(&vgfb->fence->f, true,
+				       msecs_to_jiffies(50));
+		dma_fence_put(&vgfb->fence->f);
+		vgfb->fence = NULL;
+	} else {
+		virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle, x, y,
+					      width, height, NULL, NULL);
+		virtio_gpu_notify(vgdev);
+	}
+}
+
 static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 					    struct drm_atomic_state *state)
 {
@@ -198,12 +232,11 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 		}
 	}
 
-	virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle,
-				      rect.x1,
-				      rect.y1,
-				      rect.x2 - rect.x1,
-				      rect.y2 - rect.y1);
-	virtio_gpu_notify(vgdev);
+	virtio_gpu_resource_flush(plane,
+				  rect.x1,
+				  rect.y1,
+				  rect.x2 - rect.x1,
+				  rect.y2 - rect.y1);
 }
 
 static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
-- 
2.30.2

