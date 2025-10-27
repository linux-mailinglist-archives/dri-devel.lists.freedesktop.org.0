Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19705C11715
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 21:53:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93BC10E17D;
	Mon, 27 Oct 2025 20:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hl+ZSC/O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A106A10E0CB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 20:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761598410; x=1793134410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yQY7c/wd6yMyQ5ZEPZ1Pgmp0+RxGhFwUp7hoaStJ86k=;
 b=Hl+ZSC/OU74T/LsxcT9QjDnxg/AYomnxtal/IdyTh5Rd8mfkoPtNpba1
 Hi2tPmt7BbMzQ/WYbOKBfMTnBQbjDmlhgnoXHi6D29ceP62TSReCq2peJ
 rhPLzVoWZHmUgJUUbtfxZ5rOnO8DBngccs/ACITYkmvxtebx3z2R+m1qT
 5qlzJSW4l+muhqcUBxmUSjZKqWAIRpPsacF8mWPQjMfrOfZp/5xyoYqgj
 HEpzzI3oBN4b8ZZn+j+CfMjEma1sVtVrcsE6qt1H7xR0NYHStxl0JRFxZ
 mSj3fMNxWmDsLQAYY245UbRl4/0DkZZuGUS1HFzfqsR2lLxp5nRQFLOg2 g==;
X-CSE-ConnectionGUID: y1vFTM9lQo6nmiQ6GH26FA==
X-CSE-MsgGUID: 4vQ1oNq+R224yoKNPFk+hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62895991"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="62895991"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 13:53:30 -0700
X-CSE-ConnectionGUID: Nb9aTH9jRdaZ0wN7s7m/QA==
X-CSE-MsgGUID: SZE9fmpnQhaQ4vtQrhz8mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184380557"
Received: from dongwonk-z390-aorus-ultra.fm.intel.com ([10.105.205.222])
 by orviesa010.jf.intel.com with ESMTP; 27 Oct 2025 13:53:31 -0700
From: dongwon.kim@intel.com
To: dri-devel@lists.freedesktop.org
Cc: dmitry.osipenko@collabora.com, airlied@redhat.com, kraxel@redhat.com,
 nirmoyd@nvidia.com
Subject: [PATCH v6 1/3] drm/virtio: Freeze and restore hooks to support
 suspend and resume
Date: Mon, 27 Oct 2025 13:53:21 -0700
Message-Id: <20251027205323.491349-2-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027205323.491349-1-dongwon.kim@intel.com>
References: <20251027205323.491349-1-dongwon.kim@intel.com>
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

From: Dongwon Kim <dongwon.kim@intel.com>

virtio device needs to delete before VM suspend happens
then reinitialize all virtqueues again upon resume

v2: 10ms sleep was added in virtgpu_freeze to avoid the situation
    the driver is locked up during resumption.

v3: Plain 10ms delay was replaced with wait calls which wait until
    the virtio queue is empty.
    (Dmitry Osipenko)

Suggested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 60 +++++++++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_drv.h |  1 +
 drivers/gpu/drm/virtio/virtgpu_kms.c | 23 ++++++++---
 3 files changed, 77 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 71c6ccad4b99..676893e90a9f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -163,6 +163,60 @@ static unsigned int features[] = {
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
+
+	wait_event(vgdev->ctrlq.ack_queue,
+		   vgdev->ctrlq.vq->num_free == vgdev->ctrlq.vq->num_max);
+
+	wait_event(vgdev->cursorq.ack_queue,
+		   vgdev->cursorq.vq->num_free == vgdev->cursorq.vq->num_max);
+
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
@@ -171,7 +225,11 @@ static struct virtio_driver virtio_gpu_driver = {
 	.probe = virtio_gpu_probe,
 	.remove = virtio_gpu_remove,
 	.shutdown = virtio_gpu_shutdown,
-	.config_changed = virtio_gpu_config_changed
+	.config_changed = virtio_gpu_config_changed,
+#ifdef CONFIG_PM_SLEEP
+	.freeze = virtgpu_freeze,
+	.restore = virtgpu_restore,
+#endif
 };
 
 static int __init virtio_gpu_driver_init(void)
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index f17660a71a3e..1279f998c8e0 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -300,6 +300,7 @@ void virtio_gpu_deinit(struct drm_device *dev);
 void virtio_gpu_release(struct drm_device *dev);
 int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file);
 void virtio_gpu_driver_postclose(struct drm_device *dev, struct drm_file *file);
+int virtio_gpu_find_vqs(struct virtio_gpu_device *vgdev);
 
 /* virtgpu_gem.c */
 int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 1c15cbf326b7..cbebe19c3fb3 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -114,15 +114,28 @@ static void virtio_gpu_get_capsets(struct virtio_gpu_device *vgdev,
 	vgdev->num_capsets = num_capsets;
 }
 
-int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
+int virtio_gpu_find_vqs(struct virtio_gpu_device *vgdev)
 {
 	struct virtqueue_info vqs_info[] = {
 		{ "control", virtio_gpu_ctrl_ack },
 		{ "cursor", virtio_gpu_cursor_ack },
 	};
-	struct virtio_gpu_device *vgdev;
-	/* this will expand later */
 	struct virtqueue *vqs[2];
+	int ret;
+
+	ret = virtio_find_vqs(vgdev->vdev, 2, vqs, vqs_info, NULL);
+	if (ret)
+		return ret;
+
+	vgdev->ctrlq.vq = vqs[0];
+	vgdev->cursorq.vq = vqs[1];
+
+	return 0;
+}
+
+int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
+{
+	struct virtio_gpu_device *vgdev;
 	u32 num_scanouts, num_capsets;
 	int ret = 0;
 
@@ -206,13 +219,11 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 	DRM_INFO("features: %ccontext_init\n",
 		 vgdev->has_context_init ? '+' : '-');
 
-	ret = virtio_find_vqs(vgdev->vdev, 2, vqs, vqs_info, NULL);
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
2.34.1

