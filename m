Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D64FC08FD5
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 14:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A79010E26C;
	Sat, 25 Oct 2025 12:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C7S0iawR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0734E10E269;
 Sat, 25 Oct 2025 12:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761393885; x=1792929885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WGe93bMtnsLR2EURxdktQsHADFtPMCeLjYKtpxproOg=;
 b=C7S0iawRWe1VM3rourMDGCRdKsW3NZ57r2IsxMg4qDZJfeli+ywUrKNA
 c9tlmw9rEoaIQ+DSBH1HMoPnauAca0/e1JfXaSQJZ6JVlQglfQfuVchcl
 oAdMPbLv0cchRpwAPeH7klHiVyV3uvbQlhvDGfm/PuLB1rbqMgSRbY4Uw
 ydV5BIWSPXkneTmjG71i6hIpSfmN59NR2HN54dIEsooRwFtbGHNyphwua
 g9xs+NM5/KT3pVUhbynlVlcAO5lI0ijqonHOYu7n7L4lmerYji2gojQWh
 suRo0/y1O+5cla/a1DQUICitDsZVo4Q384xl28xWyJ0RefIODtuj/0m/Q g==;
X-CSE-ConnectionGUID: GedIWuiOQFaOu5D7rN/yYw==
X-CSE-MsgGUID: gVynEgLVRSyAL0U94X77QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63590373"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="63590373"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2025 05:04:45 -0700
X-CSE-ConnectionGUID: bgrmSPKKRYmNpCbOIAsbxQ==
X-CSE-MsgGUID: iGU+urBIRDWptNzJseRUhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="189023685"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.168])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2025 05:04:42 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH 03/15] drm/pagemap,
 drm/xe: Manage drm_pagemap provider lifetimes
Date: Sat, 25 Oct 2025 14:04:00 +0200
Message-ID: <20251025120412.12262-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
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

Even if the drm_pagemap provider has released its reference on
the drm_pagemap, references may be held by still active pages.
Ensure that we hold a reference on the provider drm device and
modules for as long as we might need to use the drm_pagemap ops.

Note that in theory, the drm_gpusvm_helper module may be unloaded
as soon as the final module_put() of the provider driver module is
executed, so we need to add a module_exit() function that waits
for the work item executing the module_put() has completed.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 101 ++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_svm.c   |  15 ++++-
 include/drm/drm_pagemap.h     |  10 +++-
 3 files changed, 117 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 173b3ecb07d5..fb18a80d6a1c 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -8,6 +8,7 @@
 #include <linux/pagemap.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_pagemap.h>
+#include <drm/drm_print.h>
 
 /**
  * DOC: Overview
@@ -544,16 +545,92 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
 	return -ENOMEM;
 }
 
+static void drm_pagemap_dev_unhold_work(struct work_struct *work);
+static LLIST_HEAD(drm_pagemap_unhold_list);
+static DECLARE_WORK(drm_pagemap_work, drm_pagemap_dev_unhold_work);
+
+/**
+ * struct drm_pagemap_dev_hold - Struct to aid in drm_device release.
+ * @link: Link into drm_pagemap_unhold_list for deferred reference releases.
+ * @drm: drm device to put.
+ *
+ * When a struct drm_pagemap is released, we also need to release the
+ * reference it holds on the drm device. However, typically that needs
+ * to be done separately from a system-wide workqueue.
+ * Each time a struct drm_pagemap is initialized
+ * (or re-initialized if cached) therefore allocate a separate
+ * drm_pagemap_dev_hold item, from which we put the drm device and
+ * associated module.
+ */
+struct drm_pagemap_dev_hold {
+	struct llist_node link;
+	struct drm_device *drm;
+};
+
 static void drm_pagemap_release(struct kref *ref)
 {
 	struct drm_pagemap *dpagemap = container_of(ref, typeof(*dpagemap), ref);
-
+	struct drm_pagemap_dev_hold *dev_hold = dpagemap->dev_hold;
+
+	/*
+	 * We know the pagemap provider is alive at this point, since
+	 * the struct drm_pagemap_dev_hold holds a reference to the
+	 * pagemap provider drm_device and its module.
+	 */
+	dpagemap->dev_hold = NULL;
 	kfree(dpagemap);
+	llist_add(&dev_hold->link, &drm_pagemap_unhold_list);
+	schedule_work(&drm_pagemap_work);
+	/*
+	 * Here, either the provider device is still alive, since if called from
+	 * page_free(), the caller is holding a reference on the dev_pagemap,
+	 * or if called from drm_pagemap_put(), the direct caller is still alive.
+	 * This ensures we can't race with THIS module unload.
+	 */
+}
+
+static void drm_pagemap_dev_unhold_work(struct work_struct *work)
+{
+	struct llist_node *node = llist_del_all(&drm_pagemap_unhold_list);
+	struct drm_pagemap_dev_hold *dev_hold, *next;
+
+	/*
+	 * Deferred release of drm_pagemap provider device and module.
+	 * THIS module is kept alive during the release by the
+	 * flush_work() in the drm_pagemap_exit() function.
+	 */
+	llist_for_each_entry_safe(dev_hold, next, node, link) {
+		struct drm_device *drm = dev_hold->drm;
+		struct module *module = drm->driver->fops->owner;
+
+		drm_dbg(drm, "Releasing reference on provider device and module.\n");
+		drm_dev_put(drm);
+		module_put(module);
+		kfree(dev_hold);
+	}
+}
+
+static struct drm_pagemap_dev_hold *
+drm_pagemap_dev_hold(struct drm_pagemap *dpagemap)
+{
+	struct drm_pagemap_dev_hold *dev_hold;
+	struct drm_device *drm = dpagemap->drm;
+
+	dev_hold = kzalloc(sizeof(*dev_hold), GFP_KERNEL);
+	if (!dev_hold)
+		return ERR_PTR(-ENOMEM);
+
+	init_llist_node(&dev_hold->link);
+	dev_hold->drm = drm;
+	(void)try_module_get(drm->driver->fops->owner);
+	drm_dev_get(drm);
+
+	return dev_hold;
 }
 
 /**
  * drm_pagemap_create() - Create a struct drm_pagemap.
- * @dev: Pointer to a struct device providing the device-private memory.
+ * @drm: Pointer to a struct drm_device providing the device-private memory.
  * @pagemap: Pointer to a pre-setup struct dev_pagemap providing the struct pages.
  * @ops: Pointer to the struct drm_pagemap_ops.
  *
@@ -563,20 +640,28 @@ static void drm_pagemap_release(struct kref *ref)
  * Error pointer on error.
  */
 struct drm_pagemap *
-drm_pagemap_create(struct device *dev,
+drm_pagemap_create(struct drm_device *drm,
 		   struct dev_pagemap *pagemap,
 		   const struct drm_pagemap_ops *ops)
 {
 	struct drm_pagemap *dpagemap = kzalloc(sizeof(*dpagemap), GFP_KERNEL);
+	struct drm_pagemap_dev_hold *dev_hold;
 
 	if (!dpagemap)
 		return ERR_PTR(-ENOMEM);
 
 	kref_init(&dpagemap->ref);
-	dpagemap->dev = dev;
+	dpagemap->drm = drm;
 	dpagemap->ops = ops;
 	dpagemap->pagemap = pagemap;
 
+	dev_hold = drm_pagemap_dev_hold(dpagemap);
+	if (IS_ERR(dev_hold)) {
+		kfree(dpagemap);
+		return ERR_CAST(dev_hold);
+	}
+	dpagemap->dev_hold = dev_hold;
+
 	return dpagemap;
 }
 EXPORT_SYMBOL(drm_pagemap_create);
@@ -937,3 +1022,11 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 	return err;
 }
 EXPORT_SYMBOL(drm_pagemap_populate_mm);
+
+static void drm_pagemap_exit(void)
+{
+	flush_work(&drm_pagemap_work);
+	if (WARN_ON(!llist_empty(&drm_pagemap_unhold_list)))
+		disable_work_sync(&drm_pagemap_work);
+}
+module_exit(drm_pagemap_exit);
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 6d2c6c144315..f6ee22da2e95 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1437,7 +1437,7 @@ xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
 			  unsigned int order,
 			  enum dma_data_direction dir)
 {
-	struct device *pgmap_dev = dpagemap->dev;
+	struct device *pgmap_dev = dpagemap->drm->dev;
 	enum drm_interconnect_protocol prot;
 	dma_addr_t addr;
 
@@ -1457,6 +1457,14 @@ static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
 	.populate_mm = xe_drm_pagemap_populate_mm,
 };
 
+static void xe_devm_release(void *data)
+{
+	struct xe_vram_region *vr = data;
+
+	drm_pagemap_put(vr->dpagemap);
+	vr->dpagemap = NULL;
+}
+
 /**
  * xe_devm_add: Remap and provide memmap backing for device memory
  * @tile: tile that the memory region belongs to
@@ -1482,7 +1490,7 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
 		return ret;
 	}
 
-	vr->dpagemap = drm_pagemap_create(dev, &vr->pagemap,
+	vr->dpagemap = drm_pagemap_create(&xe->drm, &vr->pagemap,
 					  &xe_drm_pagemap_ops);
 	if (IS_ERR(vr->dpagemap)) {
 		drm_err(&xe->drm, "Failed to create drm_pagemap tile %d memory: %pe\n",
@@ -1490,6 +1498,9 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
 		ret = PTR_ERR(vr->dpagemap);
 		goto out_no_dpagemap;
 	}
+	ret = devm_add_action_or_reset(dev, xe_devm_release, vr);
+	if (ret)
+		goto out_no_dpagemap;
 
 	vr->pagemap.type = MEMORY_DEVICE_PRIVATE;
 	vr->pagemap.range.start = res->start;
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index 2c7de928865b..5cfe54331ba7 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -9,6 +9,7 @@
 #define NR_PAGES(order) (1U << (order))
 
 struct drm_pagemap;
+struct drm_pagemap_dev_hold;
 struct drm_pagemap_zdd;
 struct device;
 
@@ -130,14 +131,17 @@ struct drm_pagemap_ops {
  * used for device p2p handshaking.
  * @ops: The struct drm_pagemap_ops.
  * @ref: Reference count.
- * @dev: The struct drevice owning the device-private memory.
+ * @drm: The struct drm device owning the device-private memory.
  * @pagemap: Pointer to the underlying dev_pagemap.
+ * @dev_hold: Pointer to a struct drm_pagemap_dev_hold for
+ * device referencing.
  */
 struct drm_pagemap {
 	const struct drm_pagemap_ops *ops;
 	struct kref ref;
-	struct device *dev;
+	struct drm_device *drm;
 	struct dev_pagemap *pagemap;
+	struct drm_pagemap_dev_hold *dev_hold;
 };
 
 struct drm_pagemap_devmem;
@@ -206,7 +210,7 @@ struct drm_pagemap_devmem_ops {
 			   unsigned long npages);
 };
 
-struct drm_pagemap *drm_pagemap_create(struct device *dev,
+struct drm_pagemap *drm_pagemap_create(struct drm_device *drm,
 				       struct dev_pagemap *pagemap,
 				       const struct drm_pagemap_ops *ops);
 
-- 
2.51.0

