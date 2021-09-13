Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9E940A1B6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 01:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9C66E2D7;
	Mon, 13 Sep 2021 23:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E306E2C8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 23:48:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="285516273"
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="285516273"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 16:48:39 -0700
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="543534430"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 16:48:38 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [RFC v1 4/6] drm/virtio: Probe and implement
 VIRTIO_GPU_F_RELEASE_FENCE feature
Date: Mon, 13 Sep 2021 16:35:27 -0700
Message-Id: <20210913233529.3194401-5-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913233529.3194401-1-vivek.kasireddy@intel.com>
References: <20210913233529.3194401-1-vivek.kasireddy@intel.com>
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

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_debugfs.c | 1 +
 drivers/gpu/drm/virtio/virtgpu_drv.c     | 1 +
 drivers/gpu/drm/virtio/virtgpu_drv.h     | 1 +
 drivers/gpu/drm/virtio/virtgpu_fence.c   | 9 +++++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c     | 9 +++++++--
 include/uapi/linux/virtio_gpu.h          | 2 ++
 6 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
index c2b20e0ee030..15d2cb89ff18 100644
--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
@@ -52,6 +52,7 @@ static int virtio_gpu_features(struct seq_file *m, void *data)
 			    vgdev->has_resource_assign_uuid);
 
 	virtio_gpu_add_bool(m, "blob resources", vgdev->has_resource_blob);
+	virtio_gpu_add_bool(m, "release fence", vgdev->ddev->mode_config.release_fence);
 	virtio_gpu_add_int(m, "cap sets", vgdev->num_capsets);
 	virtio_gpu_add_int(m, "scanouts", vgdev->num_scanouts);
 	if (vgdev->host_visible_region.len) {
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index ed85a7863256..29cb2c355587 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -172,6 +172,7 @@ static unsigned int features[] = {
 	VIRTIO_GPU_F_EDID,
 	VIRTIO_GPU_F_RESOURCE_UUID,
 	VIRTIO_GPU_F_RESOURCE_BLOB,
+	VIRTIO_GPU_F_RELEASE_FENCE,
 };
 static struct virtio_driver virtio_gpu_driver = {
 	.feature_table = features,
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 0c4810982530..9126bca47c6d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -140,6 +140,7 @@ struct virtio_gpu_fence {
 	uint64_t fence_id;
 	struct virtio_gpu_fence_driver *drv;
 	struct list_head node;
+	struct dma_fence *release_fence;
 };
 
 struct virtio_gpu_vbuffer {
diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index d28e25e8409b..d1c36b5fa8ef 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -134,6 +134,9 @@ void virtio_gpu_fence_event_process(struct virtio_gpu_device *vgdev,
 			if (signaled->f.context != curr->f.context)
 				continue;
 
+			if (curr->release_fence)
+				continue;
+
 			if (!dma_fence_is_later(&signaled->f, &curr->f))
 				continue;
 
@@ -142,6 +145,12 @@ void virtio_gpu_fence_event_process(struct virtio_gpu_device *vgdev,
 			dma_fence_put(&curr->f);
 		}
 
+		if (signaled->release_fence) {
+			dma_fence_signal(signaled->release_fence);
+			dma_fence_put(signaled->release_fence);
+			signaled->release_fence = NULL;
+		}
+
 		dma_fence_signal_locked(&signaled->f);
 		list_del(&signaled->node);
 		dma_fence_put(&signaled->f);
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index f3379059f324..5706703eb676 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -156,6 +156,9 @@ int virtio_gpu_init(struct drm_device *dev)
 	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_BLOB)) {
 		vgdev->has_resource_blob = true;
 	}
+	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RELEASE_FENCE)) {
+		vgdev->ddev->mode_config.release_fence = true;
+	}
 	if (virtio_get_shm_region(vgdev->vdev, &vgdev->host_visible_region,
 				  VIRTIO_GPU_SHM_ID_HOST_VISIBLE)) {
 		if (!devm_request_mem_region(&vgdev->vdev->dev,
@@ -176,11 +179,13 @@ int virtio_gpu_init(struct drm_device *dev)
 			    (unsigned long)vgdev->host_visible_region.len);
 	}
 
-	DRM_INFO("features: %cvirgl %cedid %cresource_blob %chost_visible\n",
+	DRM_INFO("features: %cvirgl %cedid %cresource_blob %chost_visible \
+		 %crelease_fence\n",
 		 vgdev->has_virgl_3d    ? '+' : '-',
 		 vgdev->has_edid        ? '+' : '-',
 		 vgdev->has_resource_blob ? '+' : '-',
-		 vgdev->has_host_visible ? '+' : '-');
+		 vgdev->has_host_visible ? '+' : '-',
+		 vgdev->ddev->mode_config.release_fence ? '+' : '-');
 
 	ret = virtio_find_vqs(vgdev->vdev, 2, vqs, callbacks, names, NULL);
 	if (ret) {
diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index 97523a95781d..9468e17a3c13 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -60,6 +60,8 @@
  */
 #define VIRTIO_GPU_F_RESOURCE_BLOB       3
 
+#define VIRTIO_GPU_F_RELEASE_FENCE	 4
+
 enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_UNDEFINED = 0,
 
-- 
2.30.2

