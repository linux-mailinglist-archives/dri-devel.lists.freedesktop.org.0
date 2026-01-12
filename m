Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4595BD152A9
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 21:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28AF510E2C7;
	Mon, 12 Jan 2026 20:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NMAHtRYX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4960810E2B1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 20:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768248876; x=1799784876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Meyr+fNV0dqsjdf0yVayKUwQHikq8StTPpZ2M9D4W50=;
 b=NMAHtRYXGLz1qti38UalMaI5bO9QoRAD2cjB3Me5Rap3GSYqw08AxesP
 JCL8uwZzJGyIuqJs+r7INZ3PP7p07FLQs9SBrADkn59P/pqQIEZvZPb9F
 JC0BnJjQY6J3vYaM3PGEGG+M2+B0N88003kDebp6qsiEpYfi2Megbo5t/
 dJKZfKHRZs4F6n2+yNOSm6UlQExOi6DelrHAD5nFHtnwBwV5/iOt+8UP+
 YYvfxo0XehlGt5/kApZeM7zYQgKNVtLXQ5DiIDWlgruuUihrQTIM0FpRp
 xRE2LcIfSB0SXvKz2ePei7j/7H9mYXazmNCgQIw1zmXIadpBANt6jIk/S A==;
X-CSE-ConnectionGUID: bfwtvg9MTuacxPE1Xy1Uyw==
X-CSE-MsgGUID: iu4r//GZRbOR7J00LTFU4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="68536810"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="68536810"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 12:14:36 -0800
X-CSE-ConnectionGUID: kmjSAuXeS4G4BssxCIqMRw==
X-CSE-MsgGUID: hQUr11VHTlypF8+EI4zCOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="227424204"
Received: from dongwonk-z390-aorus-ultra.fm.intel.com ([10.105.205.222])
 by fmviesa002.fm.intel.com with ESMTP; 12 Jan 2026 12:14:36 -0800
From: dongwon.kim@intel.com
To: dri-devel@lists.freedesktop.org, airlied@redhat.com, kraxel@redhat.com,
 dmitry.osipenko@collabora.com
Cc: nirmoyd@nvidia.com,
	vivek.kasireddy@intel.com
Subject: [PATCH 3/3] drm/virtio: Add PM notifier to restore objects after
 hibernation
Date: Mon, 12 Jan 2026 12:09:44 -0800
Message-Id: <20260112200944.552464-4-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112200944.552464-1-dongwon.kim@intel.com>
References: <20260112200944.552464-1-dongwon.kim@intel.com>
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

Register a PM notifier in virtio-gpu to handle suspend/hibernate
events. On PM_POST_HIBERNATION, restore all GPU objects so that the
driver can properly recover after resume.

v2: Remove unused header - drm_atomic_helper.h
    (Dmitry Osipenko)

v3: Objects for virgl usecase can't be recovered after resume so
    blocking S4 when virgl is enabled
    (Dmitry Osipenko)

v4: Restoring objects in the PM notifier is too late, as virtio-gpu
    message communication begins in virtgpu_restore once virtqueues
    are re-established. To address this, a 'hibernation' flag is set
    during the PM_HIBERNATION_PREPARE phase in the notifier. This flag
    is then used in virtgpu_restore to detect if the system is resuming
    from S4, allowing objects to be recovered immediately after virtqueues
    are reconfigured.

v5: Unreference all objects before hibernation so they can be removed
    on the host side, since they will be fully restored anyway. This
    prevents the situation where host-side hibernation fails (leaving
    all associated resources still alive) while the virtio-gpu driver
    still attempts to restore those objects.
    (Dmitry Osipenko)

Suggested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c    | 12 +++++++++++
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  8 ++++++-
 drivers/gpu/drm/virtio/virtgpu_kms.c    | 28 +++++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_object.c | 17 ++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_prime.c  |  2 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c     | 13 +++++++++---
 drivers/gpu/drm/virtio/virtgpu_vram.c   |  2 +-
 7 files changed, 75 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 397f3d4f5906..bc3c0cc69eae 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -178,6 +178,9 @@ static int virtgpu_freeze(struct virtio_device *vdev)
 		return error;
 	}
 
+	if (vgdev->hibernation)
+		virtio_gpu_object_unref_all(vgdev);
+
 	flush_work(&vgdev->obj_free_work);
 	flush_work(&vgdev->ctrlq.dequeue_work);
 	flush_work(&vgdev->cursorq.dequeue_work);
@@ -210,6 +213,15 @@ static int virtgpu_restore(struct virtio_device *vdev)
 
 	virtio_device_ready(vdev);
 
+	if (vgdev->hibernation) {
+		vgdev->hibernation = false;
+		error = virtio_gpu_object_restore_all(vgdev);
+		if (error) {
+			DRM_ERROR("Failed to recover virtio-gpu objects\n");
+			return error;
+		}
+	}
+
 	error = drm_mode_config_helper_resume(dev);
 	if (error) {
 		DRM_ERROR("resume error %d\n", error);
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 1632d92ee346..ffddaaf9bc76 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -261,6 +261,7 @@ struct virtio_gpu_device {
 	bool has_resource_blob;
 	bool has_host_visible;
 	bool has_context_init;
+	bool hibernation;
 	struct virtio_shm_region host_visible_region;
 	struct drm_mm host_visible_mm;
 
@@ -277,6 +278,8 @@ struct virtio_gpu_device {
 	uint64_t capset_id_mask;
 	struct list_head cap_cache;
 
+	struct notifier_block pm_nb;
+
 	/* protects uuid state when exporting */
 	spinlock_t resource_export_lock;
 	/* protects map state and host_visible_mm */
@@ -341,7 +344,8 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_object_array *objs,
 				    struct virtio_gpu_fence *fence);
 void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
-				   struct virtio_gpu_object *bo);
+				   struct virtio_gpu_object *bo,
+				   int no_cb);
 int virtio_gpu_panic_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 					     uint64_t offset,
 					     uint32_t width, uint32_t height,
@@ -491,6 +495,8 @@ void virtio_gpu_add_object_to_restore_list(struct virtio_gpu_device *vgdev,
 
 int virtio_gpu_object_restore_all(struct virtio_gpu_device *vgdev);
 
+void virtio_gpu_object_unref_all(struct virtio_gpu_device *vgdev);
+
 /* virtgpu_prime.c */
 int virtio_gpu_resource_assign_uuid(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_object *bo);
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 9c2e70e0c8f4..72a991c3b535 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -26,6 +26,8 @@
 #include <linux/virtio.h>
 #include <linux/virtio_config.h>
 #include <linux/virtio_ring.h>
+#include <linux/suspend.h>
+#include <linux/pm_runtime.h>
 
 #include <drm/drm_file.h>
 #include <drm/drm_managed.h>
@@ -134,6 +136,25 @@ int virtio_gpu_find_vqs(struct virtio_gpu_device *vgdev)
 	return 0;
 }
 
+static int virtio_gpu_pm_notifier(struct notifier_block *nb, unsigned long mode,
+				  void *data)
+{
+	struct virtio_gpu_device *vgdev = container_of(nb,
+						struct virtio_gpu_device,
+						pm_nb);
+
+	if (mode == PM_HIBERNATION_PREPARE) {
+		if (vgdev->has_virgl_3d) {
+			DRM_ERROR("S4 not allowed when VIRGL is enabled\n");
+			return notifier_from_errno(-EPERM);
+		}
+
+		vgdev->hibernation = true;
+	}
+
+	return NOTIFY_DONE;
+}
+
 int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 {
 	struct virtio_gpu_device *vgdev;
@@ -270,6 +291,12 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 		wait_event_timeout(vgdev->resp_wq, !vgdev->display_info_pending,
 				   5 * HZ);
 	}
+
+	vgdev->pm_nb.notifier_call = virtio_gpu_pm_notifier;
+	ret = register_pm_notifier(&vgdev->pm_nb);
+	if (ret)
+		goto err_scanouts;
+
 	return 0;
 
 err_scanouts:
@@ -302,6 +329,7 @@ void virtio_gpu_deinit(struct drm_device *dev)
 	virtio_reset_device(vgdev->vdev);
 	vgdev->vdev->config->del_vqs(vgdev->vdev);
 	mutex_destroy(&vgdev->obj_restore_lock);
+	unregister_pm_notifier(&vgdev->pm_nb);
 }
 
 void virtio_gpu_release(struct drm_device *dev)
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 61cbc101eb22..a1b7b8b9f205 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -100,7 +100,7 @@ static void virtio_gpu_free_object(struct drm_gem_object *obj)
 	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
 
 	if (bo->created) {
-		virtio_gpu_cmd_unref_resource(vgdev, bo);
+		virtio_gpu_cmd_unref_resource(vgdev, bo, false);
 		virtio_gpu_notify(vgdev);
 		/* completion handler calls virtio_gpu_cleanup_object() */
 		return;
@@ -339,3 +339,18 @@ int virtio_gpu_object_restore_all(struct virtio_gpu_device *vgdev)
 
 	return ret;
 }
+
+void virtio_gpu_object_unref_all(struct virtio_gpu_device *vgdev)
+{
+	struct virtio_gpu_object *bo, *tmp;
+
+	mutex_lock(&vgdev->obj_restore_lock);
+	list_for_each_entry_safe(bo, tmp, &vgdev->obj_restore_list,
+				 restore_node)
+		if (bo->created) {
+			virtio_gpu_cmd_unref_resource(vgdev, bo, true);
+			virtio_gpu_notify(vgdev);
+		}
+
+	mutex_unlock(&vgdev->obj_restore_lock);
+}
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index a9c698b4eed0..4faac32f402b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -219,7 +219,7 @@ static void virtgpu_dma_buf_free_obj(struct drm_gem_object *obj)
 	}
 
 	if (bo->created) {
-		virtio_gpu_cmd_unref_resource(vgdev, bo);
+		virtio_gpu_cmd_unref_resource(vgdev, bo, false);
 		virtio_gpu_notify(vgdev);
 		return;
 	}
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 0c194b4e9488..e0304ca64d69 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -626,14 +626,21 @@ static void virtio_gpu_cmd_unref_cb(struct virtio_gpu_device *vgdev,
 }
 
 void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
-				   struct virtio_gpu_object *bo)
+				   struct virtio_gpu_object *bo,
+				   int no_cb)
 {
 	struct virtio_gpu_resource_unref *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
 	int ret;
 
-	cmd_p = virtio_gpu_alloc_cmd_cb(vgdev, &vbuf, sizeof(*cmd_p),
-					virtio_gpu_cmd_unref_cb);
+	if (no_cb) {
+		cmd_p = virtio_gpu_alloc_cmd_cb(vgdev, &vbuf, sizeof(*cmd_p),
+						NULL);
+	} else {
+		cmd_p = virtio_gpu_alloc_cmd_cb(vgdev, &vbuf, sizeof(*cmd_p),
+						virtio_gpu_cmd_unref_cb);
+	}
+
 	memset(cmd_p, 0, sizeof(*cmd_p));
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_UNREF);
diff --git a/drivers/gpu/drm/virtio/virtgpu_vram.c b/drivers/gpu/drm/virtio/virtgpu_vram.c
index dffba04849f5..5ec75bf03d0f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vram.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vram.c
@@ -18,7 +18,7 @@ static void virtio_gpu_vram_free(struct drm_gem_object *obj)
 		if (unmap)
 			virtio_gpu_cmd_unmap(vgdev, bo);
 
-		virtio_gpu_cmd_unref_resource(vgdev, bo);
+		virtio_gpu_cmd_unref_resource(vgdev, bo, false);
 		virtio_gpu_notify(vgdev);
 		return;
 	}
-- 
2.34.1

