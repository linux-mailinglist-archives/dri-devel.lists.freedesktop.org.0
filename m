Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8B1C4F16A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 17:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6947610E60E;
	Tue, 11 Nov 2025 16:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y8e1XF+C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51D510E60E;
 Tue, 11 Nov 2025 16:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762879486; x=1794415486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BIynSYkfaAXSJCD4jZ05V+vI66cpJ56URCa/Jwacpy0=;
 b=Y8e1XF+Cm80hx4JEFE8vh8XWd/JL3J/fQmiyRyA0n0JfNKQ+2QowpQOe
 oT5gEZyUYXP0b1dkj9461UyqkJz8tWEkGhninYCLd7FvuE7hugrKTb5iL
 Ib+233HtpyMBZ96f+TwWW8ZjF0OiSKsgRtMPk6ZW2OPtd1gNFsjIYhDOF
 saqcud33EEo5oR09AxBMsw1Qki+lAgmxips5E3zAWCFE+gwzENEuOb9UQ
 Q1A0ZTmMtO2K1UaRSuu53EyoBPnIhU78B2i2PH8+XZot+bn7jwdixmcSm
 8XLJezPkBQnjfmGTEeOBAZ4U3YhPDkCgxdaWkoWA8PhVjZqneUQZYDFbi A==;
X-CSE-ConnectionGUID: WPpEwBtMRWOeN8cu4mZPVg==
X-CSE-MsgGUID: SuYGDum0R4S0y3RiSzdVSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75244643"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; d="scan'208";a="75244643"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 08:44:45 -0800
X-CSE-ConnectionGUID: 9EUJ4PssRTmQbiE0l20JQQ==
X-CSE-MsgGUID: e8HykW0SQZWZYUVO5C/KrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; d="scan'208";a="188646784"
Received: from rvuia-mobl.ger.corp.intel.com (HELO fedora) ([10.245.244.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 08:44:42 -0800
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
Subject: [PATCH v2 04/17] drm/pagemap,
 drm/xe: Manage drm_pagemap provider lifetimes
Date: Tue, 11 Nov 2025 17:43:54 +0100
Message-ID: <20251111164408.113070-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251111164408.113070-1-thomas.hellstrom@linux.intel.com>
References: <20251111164408.113070-1-thomas.hellstrom@linux.intel.com>
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

If a device holds a reference on a foregin device's drm_pagemap,
and a device unbind is executed on the foreign device,
Typically that foreign device would evict its device-private
pages and then continue its device-managed cleanup eventually
releasing its drm device and possibly allow for module unload.
However, since we're still holding a reference on a drm_pagemap,
when that reference is released and the provider module is
unloaded we'd execute out of undefined memory.

Therefore keep a reference on the provider device and module until
the last drm_pagemap reference is gone.

Note that in theory, the drm_gpusvm_helper module may be unloaded
as soon as the final module_put() of the provider driver module is
executed, so we need to add a module_exit() function that waits
for the work item executing the module_put() has completed.

v2:
- Better commit message (Matt Brost)

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
index a3f97cf9c254..aab939fbcf80 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1436,7 +1436,7 @@ xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
 			  unsigned int order,
 			  enum dma_data_direction dir)
 {
-	struct device *pgmap_dev = dpagemap->dev;
+	struct device *pgmap_dev = dpagemap->drm->dev;
 	enum drm_interconnect_protocol prot;
 	dma_addr_t addr;
 
@@ -1456,6 +1456,14 @@ static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
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
@@ -1481,7 +1489,7 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
 		return ret;
 	}
 
-	vr->dpagemap = drm_pagemap_create(dev, &vr->pagemap,
+	vr->dpagemap = drm_pagemap_create(&xe->drm, &vr->pagemap,
 					  &xe_drm_pagemap_ops);
 	if (IS_ERR(vr->dpagemap)) {
 		drm_err(&xe->drm, "Failed to create drm_pagemap tile %d memory: %pe\n",
@@ -1489,6 +1497,9 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
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
2.51.1

