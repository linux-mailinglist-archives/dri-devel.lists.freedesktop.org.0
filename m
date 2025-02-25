Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCDAA43440
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 05:42:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C403710E555;
	Tue, 25 Feb 2025 04:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IBGDM8Eu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C26810E533;
 Tue, 25 Feb 2025 04:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740458531; x=1771994531;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pv2DGp++HeW6ZoNDWt8axM7203GDpR650ogKhQ3qc4I=;
 b=IBGDM8EuMK11+eItdT6GSCM1dPmdAoOHh/FOmvn6jzHxm31Se7h9rlTZ
 Xoy0J/XO/eZWJdh1AMjCRSX7WgcgR+0uqBL5k9sknGeALn47uZ3a8ofSa
 0Sng3c+/IW+B+KT4/3wS02xJiT/Noic/nbv6xWmlgN8sQeqkI59GUoHgw
 0OHeQc9J0ib/+A4DEeJynNW44XVa7+JlUMHoCDPvNBzhV1FFnIQHpiB5a
 b/G4jtOAhPLjRRGNaerEoOHr3vCEcgVCbxiPtY6rAzVerKX7Q0ZXd9TaF
 mC6kYyW4lEK+/+2rpytudKE2+BbKUoKr1Xl80pm5sCeAeiR4ljoplflBj g==;
X-CSE-ConnectionGUID: LPg2ixrjRuOZdUjlIOQZOg==
X-CSE-MsgGUID: DXHVmh+qQbKbPETYE1yhQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51884928"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="51884928"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:10 -0800
X-CSE-ConnectionGUID: ieuOjagnRryN6ozIbbfnpA==
X-CSE-MsgGUID: ql2Qqy5dQk6Tx5Yfo3OYuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="116290259"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v6 05/32] drm/xe/bo: Introduce xe_bo_put_async
Date: Mon, 24 Feb 2025 20:42:44 -0800
Message-Id: <20250225044311.3178695-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225044311.3178695-1-matthew.brost@intel.com>
References: <20250225044311.3178695-1-matthew.brost@intel.com>
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
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Tested-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com
---
 drivers/gpu/drm/xe/xe_bo.c           | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h           | 19 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.c       |  3 +++
 drivers/gpu/drm/xe/xe_device_types.h |  8 ++++++++
 4 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 9adc63175e69..51cd22695592 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2660,6 +2660,31 @@ void xe_bo_put_commit(struct llist_head *deferred)
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
index a25340949415..9cab686dc872 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -323,6 +323,25 @@ xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred)
 
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
index 64d3a26ad4a3..03094a46f26c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -394,6 +394,8 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
 
+	xe_bo_dev_fini(&xe->bo_device);
+
 	if (xe->preempt_fence_wq)
 		destroy_workqueue(xe->preempt_fence_wq);
 
@@ -431,6 +433,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (WARN_ON(err))
 		goto err;
 
+	xe_bo_dev_init(&xe->bo_device);
 	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy, NULL);
 	if (err)
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 4656305dd45a..b171050eed50 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -539,6 +539,14 @@ struct xe_device {
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

