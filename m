Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E90BBA53FD1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 02:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D0410E89C;
	Thu,  6 Mar 2025 01:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZFIxRn6q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3177F10E88C;
 Thu,  6 Mar 2025 01:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741224359; x=1772760359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EkrpNVZhmWl40v+Syj4m7DWzVzOgvYTYjLVUrJoNIn8=;
 b=ZFIxRn6qDMPutgN8zZ4VKgG+FtuTj7GCyCgvGfmnPE7OQs6AqEk3g99L
 iq0WiTtR5/PZc2qtD9R2dSaAa6PaIA91Gaw//H/CWXhW5QXAcOdZtSlLC
 UTljpGGhMLnr2RYh4Siq2Soh7k1dPua9+ZpJSo+9MFZJvacKtzGPfXVkP
 ZrxyXxAkOi50yPRvaIKDpAq/eYj5yZ8BAYojGadk57+Uj2Lh0ValDZjnf
 sKFNratl+uerjPr3cmWgnGZuL4/NUKT1HcPT/SCKRvDMHrwZPrxScq/oJ
 uapv+tTF7NAyOirWNCrmORTuG4BQWN5b7f0AYI1X3gt8DdP6OLSAQiT4W A==;
X-CSE-ConnectionGUID: emScMRfuTBuX3rIF/rb9jQ==
X-CSE-MsgGUID: z67hfIYoTOGdtIgzIdY4tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52427296"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="52427296"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:25:53 -0800
X-CSE-ConnectionGUID: axl5jHg5Q3mHCNcjest/ng==
X-CSE-MsgGUID: SfMR6oETQbCjH/vPoCu3Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124063248"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:25:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v7 05/32] drm/xe/bo: Introduce xe_bo_put_async
Date: Wed,  5 Mar 2025 17:26:30 -0800
Message-Id: <20250306012657.3505757-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306012657.3505757-1-matthew.brost@intel.com>
References: <20250306012657.3505757-1-matthew.brost@intel.com>
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
v7:
 - Fix kernel doc (CI)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Tested-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h           | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.c       |  3 +++
 drivers/gpu/drm/xe/xe_device_types.h |  8 ++++++++
 4 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d6f44540820d..0305e4bdb18c 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2828,6 +2828,31 @@ void xe_bo_put_commit(struct llist_head *deferred)
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
index 2a7240c45511..b128becbe8cc 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -345,6 +345,25 @@ xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred)
 
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
index 539da525aa14..5d79b439dd62 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -388,6 +388,8 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
 
+	xe_bo_dev_fini(&xe->bo_device);
+
 	if (xe->preempt_fence_wq)
 		destroy_workqueue(xe->preempt_fence_wq);
 
@@ -428,6 +430,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (WARN_ON(err))
 		goto err;
 
+	xe_bo_dev_init(&xe->bo_device);
 	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy, NULL);
 	if (err)
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 604a69c494e5..2f2a51fd9516 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -527,6 +527,14 @@ struct xe_device {
 		int mode;
 	} wedged;
 
+	/** @bo_device: Struct to control async free of BOs */
+	struct xe_bo_dev {
+		/** @bo_device.async_free: Free worker */
+		struct work_struct async_free;
+		/** @bo_device.async_list: List of BOs to be freed */
+		struct llist_head async_list;
+	} bo_device;
+
 	/** @pmu: performance monitoring unit */
 	struct xe_pmu pmu;
 
-- 
2.34.1

