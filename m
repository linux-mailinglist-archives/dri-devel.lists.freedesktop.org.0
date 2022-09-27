Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F8B5ECC0A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 20:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BEA410E06A;
	Tue, 27 Sep 2022 18:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B2910E04E
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 18:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664302683; x=1695838683;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+Bf0JUa6Lu9/rb/AWYv9dFfcX/hyGgE5f6wBInJxRUo=;
 b=O6viuMPlN3+doMAUVGgMOvfggLQqs6TYiCWMjqzICURrmNzWnUJuZtJC
 L8LvSaNX1q/IwGtOUHWdsxqZDi55++g5ZovAmqiY+h7CC4A/8P4yPYBbo
 rpe7cD5nHeyNrvcmtGdcD+53QmZYCKhKo8xqWxGf7CyeK0rwoSpXPIrgG
 mt5r1DUpezM14vvuYvGpkpkdABqXxSEwWV/eqLAXcSl4+1QTltqjfuy/U
 niA86eymPLkWVEIe83MkCOsz+KDP1KTNA1lf95jcexRUfznQPzBT4aMEf
 zseMqug/ClAh23Ja9kTj4N4ClukQJXxvESMRk/HcvA2FatGgJVPO0dzOh g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="281762896"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; d="scan'208";a="281762896"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 11:18:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="623849335"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; d="scan'208";a="623849335"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by fmsmga007.fm.intel.com with ESMTP; 27 Sep 2022 11:18:02 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 1/2] drm/virtio: freeze and restore hooks to support
 suspend and resume
Date: Tue, 27 Sep 2022 11:07:26 -0700
Message-Id: <20220927180727.5323-2-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220927180727.5323-1-dongwon.kim@intel.com>
References: <20220927180727.5323-1-dongwon.kim@intel.com>
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
Cc: dongwon.kim@intel.com, kraxel@redhat.com, vivek.kasireddy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

virtqueue needs to be flushed and removed before VM goes into sleep or
hibernation then should be reinitialized again upon wake-up.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 53 +++++++++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_drv.h |  1 +
 drivers/gpu/drm/virtio/virtgpu_kms.c | 22 ++++++++----
 3 files changed, 69 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 0035affc3e59..2738589a04e4 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -148,6 +148,53 @@ static unsigned int features[] = {
 	VIRTIO_GPU_F_RESOURCE_BLOB,
 	VIRTIO_GPU_F_CONTEXT_INIT,
 };
+
+#ifdef CONFIG_PM_SLEEP
+static int virtgpu_freeze(struct virtio_device *vdev)
+{
+	struct drm_device *dev = vdev->priv;
+	struct virtio_gpu_device *vgdev = dev->dev_private;
+	int error;
+
+	error = drm_mode_config_helper_suspend(dev);
+	if (error) {
+		DRM_ERROR("suspend error %d\n", error);
+		return error;
+	}
+
+	flush_work(&vgdev->obj_free_work);
+	flush_work(&vgdev->ctrlq.dequeue_work);
+	flush_work(&vgdev->cursorq.dequeue_work);
+	flush_work(&vgdev->config_changed_work);
+	vdev->config->del_vqs(vdev);
+
+	return 0;
+}
+
+static int virtgpu_restore(struct virtio_device *vdev)
+{
+	struct drm_device *dev = vdev->priv;
+	struct virtio_gpu_device *vgdev = dev->dev_private;
+	int error;
+
+	error = virtio_gpu_find_vqs(vgdev);
+	if (error) {
+		DRM_ERROR("failed to find virt queues\n");
+		return error;
+	}
+
+	virtio_device_ready(vdev);
+
+	error = drm_mode_config_helper_resume(dev);
+	if (error) {
+		DRM_ERROR("resume error %d\n", error);
+		return error;
+	}
+
+	return 0;
+}
+#endif
+
 static struct virtio_driver virtio_gpu_driver = {
 	.feature_table = features,
 	.feature_table_size = ARRAY_SIZE(features),
@@ -156,7 +203,11 @@ static struct virtio_driver virtio_gpu_driver = {
 	.id_table = id_table,
 	.probe = virtio_gpu_probe,
 	.remove = virtio_gpu_remove,
-	.config_changed = virtio_gpu_config_changed
+	.config_changed = virtio_gpu_config_changed,
+#ifdef CONFIG_PM_SLEEP
+	.freeze = virtgpu_freeze,
+	.restore = virtgpu_restore,
+#endif
 };
 
 module_virtio_driver(virtio_gpu_driver);
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 20a418f64533..646f7674a496 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -292,6 +292,7 @@ void virtio_gpu_deinit(struct drm_device *dev);
 void virtio_gpu_release(struct drm_device *dev);
 int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file);
 void virtio_gpu_driver_postclose(struct drm_device *dev, struct drm_file *file);
+int virtio_gpu_find_vqs(struct virtio_gpu_device *vgdev);
 
 /* virtgpu_gem.c */
 int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 27b7f14dae89..3a1d164eaf10 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -112,16 +112,28 @@ static void virtio_gpu_get_capsets(struct virtio_gpu_device *vgdev,
 	vgdev->num_capsets = num_capsets;
 }
 
-int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
+int virtio_gpu_find_vqs(struct virtio_gpu_device *vgdev)
 {
 	static vq_callback_t *callbacks[] = {
 		virtio_gpu_ctrl_ack, virtio_gpu_cursor_ack
 	};
 	static const char * const names[] = { "control", "cursor" };
+	struct virtqueue *vqs[2];
+	int ret;
+
+	ret = virtio_find_vqs(vgdev->vdev, 2, vqs, callbacks, names, NULL);
+	if (ret)
+		return ret;
+
+	vgdev->ctrlq.vq = vqs[0];
+	vgdev->cursorq.vq = vqs[1];
+
+	return 0;
+}
 
+int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
+{
 	struct virtio_gpu_device *vgdev;
-	/* this will expand later */
-	struct virtqueue *vqs[2];
 	u32 num_scanouts, num_capsets;
 	int ret = 0;
 
@@ -205,13 +217,11 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 	DRM_INFO("features: %ccontext_init\n",
 		 vgdev->has_context_init ? '+' : '-');
 
-	ret = virtio_find_vqs(vgdev->vdev, 2, vqs, callbacks, names, NULL);
+	ret = virtio_gpu_find_vqs(vgdev);
 	if (ret) {
 		DRM_ERROR("failed to find virt queues\n");
 		goto err_vqs;
 	}
-	vgdev->ctrlq.vq = vqs[0];
-	vgdev->cursorq.vq = vqs[1];
 	ret = virtio_gpu_alloc_vbufs(vgdev);
 	if (ret) {
 		DRM_ERROR("failed to alloc vbufs\n");
-- 
2.20.1

