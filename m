Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA9EA224B4
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 20:51:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03B710E898;
	Wed, 29 Jan 2025 19:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WcbEYXBy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E13610E177;
 Wed, 29 Jan 2025 19:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738180282; x=1769716282;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4X8ziIGruEyNhl9ir8GSvUPy/jIB7BtZq/tf7YsJVTo=;
 b=WcbEYXByNKT68sCr0i0Snpq4NhezzhOcn1vzM+gchdbzJJl7fZAChchy
 bYX//uZLktyjqiyZ/ydN0OrgX4sBPzcfFAfbARtYd4BEr7YJeKBRK4s93
 wZw3eVUueECZbwRUjumSqAQtTKBNzyVtAahVmyEGgTctR2avHt5CLlhgE
 muCVCy7qnQnmfXClNCFu2zuwN/mDZWe+3rM0J0AWtG9aLmKZycdI2ZUkD
 MVxyNNI33KuPVpgop+UJqnRBBmg8HA8NhG2V7jPcEzBC7NtFWkl/bI4va
 c3J3KoD7BljypmoLBb/VhLIcEa7GJsF4FKs8gFN350wtp5+5ZBmBLtdrl w==;
X-CSE-ConnectionGUID: kQCAkuXjQLue0rFJ7lTRuw==
X-CSE-MsgGUID: jhO5sKTISZSuPFPVTkF4XA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50132735"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50132735"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:21 -0800
X-CSE-ConnectionGUID: poJfbbzlRQyJIwgOClDmWQ==
X-CSE-MsgGUID: o1Lz8rRCTt+6q55lEmQq5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132392115"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v4 05/33] drm/xe/bo: Introduce xe_bo_put_async
Date: Wed, 29 Jan 2025 11:51:44 -0800
Message-Id: <20250129195212.745731-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250129195212.745731-1-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h           | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_device.c       |  3 +++
 drivers/gpu/drm/xe/xe_device_types.h |  8 ++++++++
 4 files changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index fb1629d9d566..e914a60b8afc 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2544,6 +2544,31 @@ void xe_bo_put_commit(struct llist_head *deferred)
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
index 04995c5ced32..ce55a2bb13f6 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -317,6 +317,19 @@ xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred)
 
 void xe_bo_put_commit(struct llist_head *deferred);
 
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
index 8fedc72e9db4..5fac3d40cc8e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -387,6 +387,8 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
 
+	xe_bo_dev_fini(&xe->bo_device);
+
 	if (xe->preempt_fence_wq)
 		destroy_workqueue(xe->preempt_fence_wq);
 
@@ -424,6 +426,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (WARN_ON(err))
 		goto err;
 
+	xe_bo_dev_init(&xe->bo_device);
 	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy, NULL);
 	if (err)
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 89f532b67bc4..71151532e28f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -519,6 +519,14 @@ struct xe_device {
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

