Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD1BA94049
	for <lists+dri-devel@lfdr.de>; Sat, 19 Apr 2025 01:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE5410E2D4;
	Fri, 18 Apr 2025 23:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NA86FLm4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A638F10E2DA
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 23:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745019057; x=1776555057;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=3RPBGxkm/NWiGcr5hjmNuVGAwF1VifoJ9GnAqI0H2lM=;
 b=NA86FLm4p3vBq/B7l46gM3afFd/7TA0X1PzrtFTakPrwcFl+WQNcvVdM
 N1Oqx6CxePQGTigTggBgmILxNN71lHw+MKeJTQfsoJdsUfJWfOX4KqZEL
 UCmwqX89oZreq0pN8AMcG0KMpO2f6GMb/ZFLMkq9Tv4yiZ/qa6tDqlyUM
 w3l7RaoMuvN7FBavuefrHcS4qzdkjY95Wkee2Pty+yhbOXGKMF96odTEs
 bdyTytwPTpY06sJZkOWickJ2OgR+JkaI8L3wPEyIxS5DTWSaDlU9e5Qwz
 1erY1x6WvwA/XlfYrsmt1XYgWgwBB3RuPIN0xtYzw1AlwsaraocvSFcx2 g==;
X-CSE-ConnectionGUID: gHVhiC/9Q3+AOHod4MRkAQ==
X-CSE-MsgGUID: +GnfWWb1RAG2i9HBLMgdVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="58033863"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="58033863"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 16:30:57 -0700
X-CSE-ConnectionGUID: cb5qRUOARDOVz8UKt8L1Rg==
X-CSE-MsgGUID: oTFphjBkTHChvA01msLfLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="168436931"
Received: from dongwonk-z390-aorus-ultra.fm.intel.com ([10.105.129.124])
 by orviesa001.jf.intel.com with ESMTP; 18 Apr 2025 16:30:57 -0700
From: dongwon.kim@intel.com
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 1/2] drm/virtio: Freeze and restore hooks to support
 suspend and resume
Date: Fri, 18 Apr 2025 16:29:48 -0700
Message-Id: <20250418232949.1032604-2-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418232949.1032604-1-dongwon.kim@intel.com>
References: <20250418232949.1032604-1-dongwon.kim@intel.com>
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

Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 53 +++++++++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_drv.h |  1 +
 drivers/gpu/drm/virtio/virtgpu_kms.c | 23 ++++++++----
 3 files changed, 70 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 2d88e390feb4..1c0e47447cc0 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -155,6 +155,53 @@ static unsigned int features[] = {
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
@@ -162,7 +209,11 @@ static struct virtio_driver virtio_gpu_driver = {
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
index 7dfb2006c561..6c1af77ea083 100644
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

