Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D952BB5F2A
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 07:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F3910E86C;
	Fri,  3 Oct 2025 05:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VVyn2Zn/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3179010E0BB
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 05:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759469645; x=1791005645;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5VWQ50I5mbdaUN0YQXSh9X2+t7N9rdQSILIselP+OY4=;
 b=VVyn2Zn/HubtQsleU+qY1cK64WrhNL6859GBAy96HpH7H9U9FTJCj137
 Ni5ns4PhbkZAIrJcPvBYIO9XUC5bxwAh+F/GNNevdbyB9Wc0vI/s1xClB
 doc2dQz3oEpj2NshM3wH893ZEVZmdeg5wwmDMUW4QiXvcboVwyvmZnanX
 GXAl8ifp2qHym8HXQEXBV3YtlBEca1K1RPSEOvr5SajOpbuk2c+ZktNwU
 wlrZisudQ9nd/ZPELq1worwEpXvMGHyV5HZWKd9oe4pSR5ncuQE/OdTRv
 2+/Pb75F46eB8zSXUQCEpUw+PmNDjcY3dXSFgneokRyoV3UzNSN5AQVyO w==;
X-CSE-ConnectionGUID: M+Lzl/C2Qc++Q2DNzb66jw==
X-CSE-MsgGUID: Zr31pjScRp+ZAiMdUjRRgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="65393218"
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; d="scan'208";a="65393218"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 22:34:04 -0700
X-CSE-ConnectionGUID: 6AIejhdkTYC6r0PXqOgX8g==
X-CSE-MsgGUID: FlQzXWtNRxmvWHz2M/6mBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; d="scan'208";a="179154857"
Received: from dongwonk-z390-aorus-ultra.fm.intel.com ([10.105.205.222])
 by fmviesa006.fm.intel.com with ESMTP; 02 Oct 2025 22:34:03 -0700
From: dongwon.kim@intel.com
To: dri-devel@lists.freedesktop.org
Cc: dmitry.osipenko@collabora.com,
	nirmoyd@nvidia.com
Subject: [PATCH v5 3/3] drm/virtio: Add PM notifier to restore objects after
 hibernation
Date: Thu,  2 Oct 2025 22:34:02 -0700
Message-Id: <20251003053402.732218-4-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251003053402.732218-1-dongwon.kim@intel.com>
References: <20251003053402.732218-1-dongwon.kim@intel.com>
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

Suggested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h |  2 ++
 drivers/gpu/drm/virtio/virtgpu_kms.c | 26 ++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 3ddcf46b35f8..c7b5b4ddc822 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -277,6 +277,8 @@ struct virtio_gpu_device {
 	uint64_t capset_id_mask;
 	struct list_head cap_cache;
 
+	struct notifier_block pm_nb;
+
 	/* protects uuid state when exporting */
 	spinlock_t resource_export_lock;
 	/* protects map state and host_visible_mm */
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 0135d332224b..79ad4da3c8dc 100644
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
@@ -133,6 +135,23 @@ int virtio_gpu_find_vqs(struct virtio_gpu_device *vgdev)
 	return 0;
 }
 
+static int virtio_gpu_pm_notifier(struct notifier_block *nb, unsigned long mode,
+				  void *data)
+{
+	struct virtio_gpu_device *vgdev = container_of(nb, struct virtio_gpu_device, pm_nb);
+	int ret;
+
+	if (mode == PM_POST_HIBERNATION) {
+		ret = virtio_gpu_object_restore_all(vgdev);
+		if (ret) {
+			DRM_ERROR("Failed to recover virtio-gpu objects\n");
+			return notifier_from_errno(ret);
+		}
+	}
+
+	return NOTIFY_DONE;
+}
+
 int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 {
 	struct virtio_gpu_device *vgdev;
@@ -269,6 +288,12 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
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
@@ -300,6 +325,7 @@ void virtio_gpu_deinit(struct drm_device *dev)
 	flush_work(&vgdev->config_changed_work);
 	virtio_reset_device(vgdev->vdev);
 	vgdev->vdev->config->del_vqs(vgdev->vdev);
+	unregister_pm_notifier(&vgdev->pm_nb);
 }
 
 void virtio_gpu_release(struct drm_device *dev)
-- 
2.34.1

