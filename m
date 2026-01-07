Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC26CFF768
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 19:32:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9731710E24E;
	Wed,  7 Jan 2026 18:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G611TZHQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255A610E24E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 18:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767810758; x=1799346758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TDQe1aOp16jCKco+91CLZOLcCsMVOcxqdIXjz+BhYCA=;
 b=G611TZHQEzfF6ZlM1jAOMbByILmVsV/Rcd5Soxve3Ty+Q4lCDgW7Y7QB
 C7zUxha6rd0T8iI1RLugnEDDzovrH/IHyvkZYUTMhwMo7yjU0Ina52+cI
 3PGUazinUTiCkzkELSeD3zetHrMhZzHZwgDMMLaQ/P2pwGBkBLIjblElI
 DsScjxp6fQmrAtuW5lDIVU3lplUufspBZ8VQ+ksyeMoTI7E+GlkKXDghP
 7IeGB+uQA26rfuqJvjPLzCcDZ8N5G9VOxeSpUiACLzZJxKXen+N65zY+w
 KZgp0FwP5jMqf8FZZwwuYs7hGavKiep5OdJuYQIc/jQp6acgdRTiiOLt3 w==;
X-CSE-ConnectionGUID: 93iEEL+4SzWISzKbFJchvg==
X-CSE-MsgGUID: bMAw4xw3Q4CGulwrsn2+VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="68923709"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="68923709"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 10:32:37 -0800
X-CSE-ConnectionGUID: iYObkZduRtGci+6/DzfHNw==
X-CSE-MsgGUID: ieE69cqJSjOjHqspzMzMjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="207138305"
Received: from dongwonk-z390-aorus-ultra.fm.intel.com ([10.105.205.222])
 by orviesa003.jf.intel.com with ESMTP; 07 Jan 2026 10:32:37 -0800
From: dongwon.kim@intel.com
To: dri-devel@lists.freedesktop.org, airlied@redhat.com, kraxel@redhat.com,
 dmitry.osipenko@collabora.com
Cc: nirmoyd@nvidia.com,
	vivek.kasireddy@intel.com
Subject: [PATCH v7 3/3] drm/virtio: Add PM notifier to restore objects after
 hibernation
Date: Wed,  7 Jan 2026 10:27:45 -0800
Message-Id: <20260107182745.229481-4-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107182745.229481-1-dongwon.kim@intel.com>
References: <20260107182745.229481-1-dongwon.kim@intel.com>
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
index 039fb8f18ead..268f45f9a573 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -177,6 +177,9 @@ static int virtgpu_freeze(struct virtio_device *vdev)
 		return error;
 	}
 
+	if (vgdev->hibernation)
+		virtio_gpu_object_unref_all(vgdev);
+
 	flush_work(&vgdev->obj_free_work);
 	flush_work(&vgdev->ctrlq.dequeue_work);
 	flush_work(&vgdev->cursorq.dequeue_work);
@@ -209,6 +212,15 @@ static int virtgpu_restore(struct virtio_device *vdev)
 
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
index 8ad79de70d85..cc8aad1b72cd 100644
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
@@ -133,6 +135,25 @@ int virtio_gpu_find_vqs(struct virtio_gpu_device *vgdev)
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
@@ -269,6 +290,12 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
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
@@ -301,6 +328,7 @@ void virtio_gpu_deinit(struct drm_device *dev)
 	virtio_reset_device(vgdev->vdev);
 	vgdev->vdev->config->del_vqs(vgdev->vdev);
 	mutex_destroy(&vgdev->obj_restore_lock);
+	unregister_pm_notifier(&vgdev->pm_nb);
 }
 
 void virtio_gpu_release(struct drm_device *dev)
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 8e8a8ec4a361..7c27c2fcd7ed 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -98,7 +98,7 @@ static void virtio_gpu_free_object(struct drm_gem_object *obj)
 	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
 
 	if (bo->created) {
-		virtio_gpu_cmd_unref_resource(vgdev, bo);
+		virtio_gpu_cmd_unref_resource(vgdev, bo, false);
 		virtio_gpu_notify(vgdev);
 		/* completion handler calls virtio_gpu_cleanup_object() */
 		return;
@@ -337,3 +337,18 @@ int virtio_gpu_object_restore_all(struct virtio_gpu_device *vgdev)
 
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
index 088eaf000a9a..69f2186d0908 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -218,7 +218,7 @@ static void virtgpu_dma_buf_free_obj(struct drm_gem_object *obj)
 	}
 
 	if (bo->created) {
-		virtio_gpu_cmd_unref_resource(vgdev, bo);
+		virtio_gpu_cmd_unref_resource(vgdev, bo, false);
 		virtio_gpu_notify(vgdev);
 		return;
 	}
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 8181b22b9b46..fdd0166584bc 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -625,14 +625,21 @@ static void virtio_gpu_cmd_unref_cb(struct virtio_gpu_device *vgdev,
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

