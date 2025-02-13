Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 928AEA33531
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 03:10:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D9810E9C1;
	Thu, 13 Feb 2025 02:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Um6h1AcV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9063010E397;
 Thu, 13 Feb 2025 02:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739412617; x=1770948617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QWns/RGjTBirmlxxcOcV3vqnZNco/m2w5GKrYU/v8Ns=;
 b=Um6h1AcVIb0XzDO2MAxXWTZQ4e7ImG/vLGAgrmDQRt6Uxk/O/yEoYPm6
 7+A77fBzt1cZbYtD4ua0ACjCKQvEAkxXYWRJjPMIdnJOygourAZYN/OCc
 qkgvCDqqsZec+8bKfRXB8mz2FRsI87GXHtVm2PXMnkdQWmpX07sawDdwa
 ALQZHWSpqaJmt4AQs8Cd2D4o1kxAUU7wZGFPZ7x7qGIZV36Kk0YbvZhLX
 HoYDhBcPyUPJ4UtLy/swK8Kzw2aHmK1NgG+P7bhsstUF3ct9gaF4TmWfq
 iDEgQq/3eK8kW3MR+r39HuJvbQVuuGANOQVDeDXgnLnwn84yUL468KnoK w==;
X-CSE-ConnectionGUID: kFZw7PJeRz6r77K/gsxIlg==
X-CSE-MsgGUID: OAX9/ww3QQi5Yh2ZusL+oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="65455937"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="65455937"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:15 -0800
X-CSE-ConnectionGUID: LPMivRqHQBeHIwhnw7/OsQ==
X-CSE-MsgGUID: GiXPiVBlSTa+l8ikz/YsZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117945048"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v5 05/32] drm/xe/bo: Introduce xe_bo_put_async
Date: Wed, 12 Feb 2025 18:10:45 -0800
Message-Id: <20250213021112.1228481-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213021112.1228481-1-matthew.brost@intel.com>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Introduce xe_bo_put_async to put a bo where the context is such that
the bo destructor can't run due to lockdep problems or atomic context.

If the put is the final put, freeing will be done from a work item.

v5:
 - Kerenl doc for xe_bo_put_async (Thomas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h           | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.c       |  3 +++
 drivers/gpu/drm/xe/xe_device_types.h |  8 ++++++++
 4 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index cd1c693c0b62..a2a924b531e5 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2644,6 +2644,31 @@ void xe_bo_put_commit(struct llist_head *deferred)
 		drm_gem_object_free(&bo->ttm.base.refcount);
 }
 
+static void xe_bo_dev_work_func(struct work_struct *work)
+{
+	struct xe_bo_dev *bo_dev = container_of(work, typeof(*bo_dev), async_free);
+
+	xe_bo_put_commit(&bo_dev->async_list);
+}
+
+/**
+ * xe_bo_dev_init() - Initialize BO dev to manage async BO freeing
+ * @bo_dev: The BO dev structure
+ */
+void xe_bo_dev_init(struct xe_bo_dev *bo_dev)
+{
+	INIT_WORK(&bo_dev->async_free, xe_bo_dev_work_func);
+}
+
+/**
+ * xe_bo_dev_fini() - Finalize BO dev managing async BO freeing
+ * @bo_dev: The BO dev structure
+ */
+void xe_bo_dev_fini(struct xe_bo_dev *bo_dev)
+{
+	flush_work(&bo_dev->async_free);
+}
+
 void xe_bo_put(struct xe_bo *bo)
 {
 	struct xe_tile *tile;
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index f09b9315721b..9dfec438d1c7 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -322,6 +322,25 @@ xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred)
 
 void xe_bo_put_commit(struct llist_head *deferred);
 
+/**
+ * xe_bo_put_async() - Put BO async
+ * @bo: The bo to put.
+ *
+ * Put BO async, the final put is deferred to a worker to exit an IRQ context.
+ */
+static inline void
+xe_bo_put_async(struct xe_bo *bo)
+{
+	struct xe_bo_dev *bo_device = &xe_bo_device(bo)->bo_device;
+
+	if (xe_bo_put_deferred(bo, &bo_device->async_list))
+		schedule_work(&bo_device->async_free);
+}
+
+void xe_bo_dev_init(struct xe_bo_dev *bo_device);
+
+void xe_bo_dev_fini(struct xe_bo_dev *bo_device);
+
 struct sg_table *xe_bo_sg(struct xe_bo *bo);
 
 /*
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 36d7ffb3b4d9..756099e870cd 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -388,6 +388,8 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
 
+	xe_bo_dev_fini(&xe->bo_device);
+
 	if (xe->preempt_fence_wq)
 		destroy_workqueue(xe->preempt_fence_wq);
 
@@ -425,6 +427,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (WARN_ON(err))
 		goto err;
 
+	xe_bo_dev_init(&xe->bo_device);
 	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy, NULL);
 	if (err)
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 833c29fed3a3..6a41f608a7a1 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -525,6 +525,14 @@ struct xe_device {
 		int mode;
 	} wedged;
 
+	/** @bo_device: Struct to control async free of BOs */
+	struct xe_bo_dev {
+		/** @async_free: Free worker */
+		struct work_struct async_free;
+		/** @async_list: List of BOs to be freed */
+		struct llist_head async_list;
+	} bo_device;
+
 	/** @pmu: performance monitoring unit */
 	struct xe_pmu pmu;
 
-- 
2.34.1

