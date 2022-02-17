Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 288EB4BA34E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 15:43:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B5D10E89B;
	Thu, 17 Feb 2022 14:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7406710E89B;
 Thu, 17 Feb 2022 14:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645109030; x=1676645030;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4hT+sYVRAJR9QwyOmLLtzkT/yVda9lS5QB5fYpnvLCo=;
 b=hd/6xjhLCbCZ/vCmd0iT3vqv8H9LWtYFFFdgSmeNfLvXZHcETpBjQati
 rChRAbmJ9ZeXRqUO2R0hJvR17NpJ/Y6lywfANV97vF2EHp7Y6CVeYYBw0
 QRR4Bg8EQqis5lAak/SELJJLARkQbKeapU8ALNs2F3oS+tjd92g4TXmya
 qqiZxxcJRsIKzib+Bxoe0xMBlaH8O1WVsRTSoB9ppFp02mm1T0ro0eA7v
 +VLMMZRq7ozbk1YHfWJlFXCxM/+PsFI9mSbxYJloybvXUNamPoVZN0JRB
 RYn+/iHHMJlaAntu2yt7xcVa4tbKBhndGqcuav78FZb7Mh5hq9cX5bA1r w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="230849719"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="230849719"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:43:50 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="488321740"
Received: from sewaggon-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.249.33.71])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:43:44 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 4/7] drm/i915/gt: create per-tile sysfs interface
Date: Thu, 17 Feb 2022 15:41:55 +0100
Message-Id: <20220217144158.21555-5-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217144158.21555-1-andi.shyti@linux.intel.com>
References: <20220217144158.21555-1-andi.shyti@linux.intel.com>
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
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, Andi Shyti <andi@etezian.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we have tiles we want each of them to have its own
interface. A directory "gt/" is created under "cardN/" that will
contain as many diroctories as the tiles.

In the coming patches tile related interfaces will be added. For
now the sysfs gt structure simply has an id interface related
to the current tile count.

The directory structure will follow this scheme:

    /sys/.../card0
             └── gt
                 ├── gt0
                 │   └── id
                 :
		 :
		 └─- gtN
                     └── id

This new set of interfaces will be a basic tool for system
managers and administrators when using i915.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/i915/Makefile            |   1 +
 drivers/gpu/drm/i915/gt/intel_gt.c       |   2 +
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c | 118 +++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.h |  34 +++++++
 drivers/gpu/drm/i915/i915_drv.h          |   2 +
 drivers/gpu/drm/i915/i915_sysfs.c        |  12 ++-
 drivers/gpu/drm/i915/i915_sysfs.h        |   3 +
 7 files changed, 171 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 9d588d936e3d..277064b00afd 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -105,6 +105,7 @@ gt-y += \
 	gt/intel_gt_pm_debugfs.o \
 	gt/intel_gt_pm_irq.o \
 	gt/intel_gt_requests.o \
+	gt/intel_gt_sysfs.o \
 	gt/intel_gtt.o \
 	gt/intel_llc.o \
 	gt/intel_lrc.o \
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 8c64b81e9ec9..0f080bbad043 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -26,6 +26,7 @@
 #include "intel_rc6.h"
 #include "intel_renderstate.h"
 #include "intel_rps.h"
+#include "intel_gt_sysfs.h"
 #include "intel_uncore.h"
 #include "shmem_utils.h"
 
@@ -458,6 +459,7 @@ void intel_gt_driver_register(struct intel_gt *gt)
 	intel_rps_driver_register(&gt->rps);
 
 	intel_gt_debugfs_register(gt);
+	intel_gt_sysfs_register(gt);
 }
 
 static int intel_gt_init_scratch(struct intel_gt *gt, unsigned int size)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
new file mode 100644
index 000000000000..0206e9aa4867
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#include <drm/drm_device.h>
+#include <linux/device.h>
+#include <linux/kobject.h>
+#include <linux/printk.h>
+#include <linux/sysfs.h>
+
+#include "i915_drv.h"
+#include "i915_sysfs.h"
+#include "intel_gt.h"
+#include "intel_gt_sysfs.h"
+#include "intel_gt_types.h"
+#include "intel_rc6.h"
+
+bool is_object_gt(struct kobject *kobj)
+{
+	return !strncmp(kobj->name, "gt", 2);
+}
+
+static struct intel_gt *kobj_to_gt(struct kobject *kobj)
+{
+	return container_of(kobj, struct kobj_gt, base)->gt;
+}
+
+struct intel_gt *intel_gt_sysfs_get_drvdata(struct device *dev,
+					    const char *name)
+{
+	struct kobject *kobj = &dev->kobj;
+
+	/*
+	 * We are interested at knowing from where the interface
+	 * has been called, whether it's called from gt/ or from
+	 * the parent directory.
+	 * From the interface position it depends also the value of
+	 * the private data.
+	 * If the interface is called from gt/ then private data is
+	 * of the "struct intel_gt *" type, otherwise it's * a
+	 * "struct drm_i915_private *" type.
+	 */
+	if (!is_object_gt(kobj)) {
+		struct drm_i915_private *i915 = kdev_minor_to_i915(dev);
+
+		pr_devel_ratelimited(DEPRECATED
+			"%s (pid %d) is accessing deprecated %s "
+			"sysfs control, please use gt/gt<n>/%s instead\n",
+			current->comm, task_pid_nr(current), name, name);
+		return to_gt(i915);
+	}
+
+	return kobj_to_gt(kobj);
+}
+
+static ssize_t id_show(struct device *dev,
+		       struct device_attribute *attr,
+		       char *buf)
+{
+	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
+
+	return sysfs_emit(buf, "%u\n", gt->info.id);
+}
+static DEVICE_ATTR_RO(id);
+
+static struct attribute *id_attrs[] = {
+	&dev_attr_id.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(id);
+
+static void kobj_gt_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
+static struct kobj_type kobj_gt_type = {
+	.release = kobj_gt_release,
+	.sysfs_ops = &kobj_sysfs_ops,
+	.default_groups = id_groups,
+};
+
+struct kobject *
+intel_gt_create_kobj(struct intel_gt *gt, struct kobject *dir, const char *name)
+{
+	struct kobj_gt *kg;
+
+	kg = kzalloc(sizeof(*kg), GFP_KERNEL);
+	if (!kg)
+		return NULL;
+
+	kobject_init(&kg->base, &kobj_gt_type);
+	kg->gt = gt;
+
+	/* xfer ownership to sysfs tree */
+	if (kobject_add(&kg->base, dir, "%s", name)) {
+		kobject_put(&kg->base);
+		return NULL;
+	}
+
+	return &kg->base; /* borrowed ref */
+}
+
+void intel_gt_sysfs_register(struct intel_gt *gt)
+{
+	struct kobject *dir;
+	char name[80];
+
+	snprintf(name, sizeof(name), "gt%d", gt->info.id);
+
+	dir = intel_gt_create_kobj(gt, gt->i915->sysfs_gt, name);
+	if (!dir) {
+		drm_warn(&gt->i915->drm,
+			 "failed to initialize %s sysfs root\n", name);
+		return;
+	}
+}
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs.h b/drivers/gpu/drm/i915/gt/intel_gt_sysfs.h
new file mode 100644
index 000000000000..9471b26752cf
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef __SYSFS_GT_H__
+#define __SYSFS_GT_H__
+
+#include <linux/ctype.h>
+#include <linux/kobject.h>
+
+#include "i915_gem.h" /* GEM_BUG_ON() */
+
+struct intel_gt;
+
+struct kobj_gt {
+	struct kobject base;
+	struct intel_gt *gt;
+};
+
+bool is_object_gt(struct kobject *kobj);
+
+struct drm_i915_private *kobj_to_i915(struct kobject *kobj);
+
+struct kobject *
+intel_gt_create_kobj(struct intel_gt *gt,
+		     struct kobject *dir,
+		     const char *name);
+
+void intel_gt_sysfs_register(struct intel_gt *gt);
+struct intel_gt *intel_gt_sysfs_get_drvdata(struct device *dev,
+					    const char *name);
+
+#endif /* SYSFS_GT_H */
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 88a83cd81ddd..e8c729f2ae00 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -811,6 +811,8 @@ struct drm_i915_private {
 #define I915_MAX_GT 4
 	struct intel_gt *gt[I915_MAX_GT];
 
+	struct kobject *sysfs_gt;
+
 	struct {
 		struct i915_gem_contexts {
 			spinlock_t lock; /* locks list */
diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
index a4d1759375b9..3643efde52ca 100644
--- a/drivers/gpu/drm/i915/i915_sysfs.c
+++ b/drivers/gpu/drm/i915/i915_sysfs.c
@@ -39,7 +39,7 @@
 #include "i915_sysfs.h"
 #include "intel_pm.h"
 
-static inline struct drm_i915_private *kdev_minor_to_i915(struct device *kdev)
+struct drm_i915_private *kdev_minor_to_i915(struct device *kdev)
 {
 	struct drm_minor *minor = dev_get_drvdata(kdev);
 	return to_i915(minor->dev);
@@ -487,6 +487,11 @@ static void i915_setup_error_capture(struct device *kdev) {}
 static void i915_teardown_error_capture(struct device *kdev) {}
 #endif
 
+static struct kobject *i915_setup_gt_sysfs(struct kobject *parent)
+{
+	return kobject_create_and_add("gt", parent);
+}
+
 void i915_setup_sysfs(struct drm_i915_private *dev_priv)
 {
 	struct device *kdev = dev_priv->drm.primary->kdev;
@@ -538,6 +543,11 @@ void i915_setup_sysfs(struct drm_i915_private *dev_priv)
 	if (ret)
 		drm_err(&dev_priv->drm, "RPS sysfs setup failed\n");
 
+	dev_priv->sysfs_gt = i915_setup_gt_sysfs(&kdev->kobj);
+	if (!dev_priv->sysfs_gt)
+		drm_warn(&dev_priv->drm,
+			 "failed to register GT sysfs directory\n");
+
 	i915_setup_error_capture(kdev);
 
 	intel_engines_add_sysfs(dev_priv);
diff --git a/drivers/gpu/drm/i915/i915_sysfs.h b/drivers/gpu/drm/i915/i915_sysfs.h
index 41afd4366416..243a17741e3f 100644
--- a/drivers/gpu/drm/i915/i915_sysfs.h
+++ b/drivers/gpu/drm/i915/i915_sysfs.h
@@ -6,8 +6,11 @@
 #ifndef __I915_SYSFS_H__
 #define __I915_SYSFS_H__
 
+struct device;
 struct drm_i915_private;
 
+struct drm_i915_private *kdev_minor_to_i915(struct device *kdev);
+
 void i915_setup_sysfs(struct drm_i915_private *i915);
 void i915_teardown_sysfs(struct drm_i915_private *i915);
 
-- 
2.27.0

