Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3794B9BC4A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 21:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD1410E7C9;
	Wed, 24 Sep 2025 19:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mu0WVX9h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE00F10E071
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 19:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758743469; x=1790279469;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KXyIT0TAnzNBFAQ8QZ7Cb+2hLdJPO07PDMHlQiV3sCI=;
 b=mu0WVX9hwfg78Zb/uW+9HRo2XcSOfpOQCyjmNXU8Qn0DtYQZV//mCKta
 MdVS93y36/3aiKcF0ChP3QrtMhv/m6dZkXIZ1tZNn/XizvABmbbWRE12b
 QJcvoYlneZJEwpiyt+AxoypW7i6YT6as/ctBhM32tpxXgf9HP1h8aOK9F
 plgU7WducuOMf2bbp2UKwZHtWCPxrwbVh5dx9l8A+WGsnXqPMTWlbvXT4
 cXzWOXsv+n5mbtam7F+CVPgGG2wSfYl4X94gGVKxwbb6pt2aaBLxS7Mcm
 hMLdd6Re3wjTJE3yAQP4x2oSbTxbuya6sQYyOiwYuDj45xArHBl+7WLJb Q==;
X-CSE-ConnectionGUID: XALOeXnDSjSNkOdoJ/N/NA==
X-CSE-MsgGUID: 09YD1le6TWis9uNt/9b6Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="64889877"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="64889877"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 12:51:08 -0700
X-CSE-ConnectionGUID: tyc41xlYShGX7v0J4hTI+A==
X-CSE-MsgGUID: 1779drxwTim3clOw7D7pBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="176966248"
Received: from dongwonk-z390-aorus-ultra.fm.intel.com ([10.105.205.222])
 by orviesa007.jf.intel.com with ESMTP; 24 Sep 2025 12:51:08 -0700
From: dongwon.kim@intel.com
To: dri-devel@lists.freedesktop.org
Cc: dmitry.osipenko@collabora.com
Subject: [PATCH v4 3/3] drm/virtio: Restore Virt-GPU res on hibernation resume
 via PM notifier
Date: Wed, 24 Sep 2025 12:47:55 -0700
Message-Id: <20250924194755.1265531-4-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924194755.1265531-1-dongwon.kim@intel.com>
References: <20250924194755.1265531-1-dongwon.kim@intel.com>
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
events. On PM_POST_HIBERNATION, it resubmits all GPU objects
so that resources can properly recovered in QEMU after resume.

Suggested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h |  2 ++
 drivers/gpu/drm/virtio/virtgpu_kms.c | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 55f836378237..88a94e974088 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -278,6 +278,8 @@ struct virtio_gpu_device {
 	uint64_t capset_id_mask;
 	struct list_head cap_cache;
 
+	struct notifier_block pm_nb;
+
 	/* protects uuid state when exporting */
 	spinlock_t resource_export_lock;
 	/* protects map state and host_visible_mm */
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 08f8e71a7072..e1b2cee30fa3 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -26,9 +26,12 @@
 #include <linux/virtio.h>
 #include <linux/virtio_config.h>
 #include <linux/virtio_ring.h>
+#include <linux/suspend.h>
+#include <linux/pm_runtime.h>
 
 #include <drm/drm_file.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_atomic_helper.h>
 
 #include "virtgpu_drv.h"
 
@@ -133,6 +136,21 @@ int virtio_gpu_find_vqs(struct virtio_gpu_device *vgdev)
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
+		if (ret)
+			DRM_ERROR("Failed to resubmit virtio-gpu objects\n");
+	}
+
+	return NOTIFY_DONE;
+}
+
 int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 {
 	struct virtio_gpu_device *vgdev;
@@ -268,6 +286,12 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
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
@@ -299,6 +323,7 @@ void virtio_gpu_deinit(struct drm_device *dev)
 	flush_work(&vgdev->config_changed_work);
 	virtio_reset_device(vgdev->vdev);
 	vgdev->vdev->config->del_vqs(vgdev->vdev);
+	unregister_pm_notifier(&vgdev->pm_nb);
 }
 
 void virtio_gpu_release(struct drm_device *dev)
-- 
2.34.1

