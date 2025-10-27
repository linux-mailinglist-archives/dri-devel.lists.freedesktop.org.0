Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E801DC1171B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 21:53:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B85A10E0CB;
	Mon, 27 Oct 2025 20:53:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eBZfwV9D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF8210E0CB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 20:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761598410; x=1793134410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vpy+TCrihnbWUCrCWBGvdVbsakgGjdTjtfFpWiQ2EKg=;
 b=eBZfwV9DSd4SbP8sMeYvJuaC9WAagUbMwZ47a+tPAQkNwJZYRV+V31p9
 XBkmLA2CUQk6DM3iUtP5kBlUR52YTWNkbKwQMmyMssoSL9g/T2YgGkneg
 MmO4TfXvtIuXSRIcZ7kKgUcnFWnq5PN0QjPSahPJw9K2fMDBrOrxMV9wF
 Cqub4FFdFoHTwEOHnddr+KUfu2uH/sURXRQj1c1CAweN+DKpJqQ4i/4zu
 vHq4NS4OU6fV+aPzKULI7uzWKXPhpy83zhFKu+Hj1lCxzVSaLNvJKEYDv
 qvS7hF3RBANpgpsgbG17TnANRpcU6oD9xoCvwKUXH3pGTEe7eNEduMCVR w==;
X-CSE-ConnectionGUID: Om9FFLshTy2R3p9R7pz/og==
X-CSE-MsgGUID: FvuouS9TScm8V74VShv+dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62895993"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="62895993"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 13:53:30 -0700
X-CSE-ConnectionGUID: Jlf/j2OPS5GVPT4HWXYHFQ==
X-CSE-MsgGUID: GvTAeYxbRYK2kSftKbQ0OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184380563"
Received: from dongwonk-z390-aorus-ultra.fm.intel.com ([10.105.205.222])
 by orviesa010.jf.intel.com with ESMTP; 27 Oct 2025 13:53:31 -0700
From: dongwon.kim@intel.com
To: dri-devel@lists.freedesktop.org
Cc: dmitry.osipenko@collabora.com, airlied@redhat.com, kraxel@redhat.com,
 nirmoyd@nvidia.com
Subject: [PATCH v6 3/3] drm/virtio: Add PM notifier to restore objects after
 hibernation
Date: Mon, 27 Oct 2025 13:53:23 -0700
Message-Id: <20251027205323.491349-4-dongwon.kim@intel.com>
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

Suggested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c |  9 +++++++++
 drivers/gpu/drm/virtio/virtgpu_drv.h |  3 +++
 drivers/gpu/drm/virtio/virtgpu_kms.c | 27 +++++++++++++++++++++++++++
 3 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 676893e90a9f..5ff79e3775e8 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -207,6 +207,15 @@ static int virtgpu_restore(struct virtio_device *vdev)
 
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
index db1d4aa6eae8..4eae6e4b4a73 100644
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
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 8ad79de70d85..6cb1ae8de16a 100644
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
@@ -133,6 +135,24 @@ int virtio_gpu_find_vqs(struct virtio_gpu_device *vgdev)
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
+		vgdev->hibernation = true;
+	}
+
+	return NOTIFY_DONE;
+}
+
 int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 {
 	struct virtio_gpu_device *vgdev;
@@ -269,6 +289,12 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
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
@@ -301,6 +327,7 @@ void virtio_gpu_deinit(struct drm_device *dev)
 	virtio_reset_device(vgdev->vdev);
 	vgdev->vdev->config->del_vqs(vgdev->vdev);
 	mutex_destroy(&vgdev->obj_restore_lock);
+	unregister_pm_notifier(&vgdev->pm_nb);
 }
 
 void virtio_gpu_release(struct drm_device *dev)
-- 
2.34.1

