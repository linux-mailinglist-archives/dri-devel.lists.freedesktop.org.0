Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB5E4DE495
	for <lists+dri-devel@lfdr.de>; Sat, 19 Mar 2022 00:40:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B712410E492;
	Fri, 18 Mar 2022 23:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 407A510E492;
 Fri, 18 Mar 2022 23:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647646828; x=1679182828;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j3ybRp+Y97nR4mtjpF8kkLBdVbg9LWgarOncWXqnOlY=;
 b=iRu7CZFutthi3Tn0twcaR03hyGD254DCD8C4HyNrgp+iJq6Q73B1LjTd
 ZPCvU09qAGUiJSG5kqiTmB83aPPUTHa1eGukMKwp8XN0oIjeIwMI+8GJn
 +ujHiOJP73yDsrnymZ4j1bbHWtdnq29zP3u/NCqV21jOfzdWiY2uMbuc7
 qWrwYcMbHBotOTYiJdBmm95oLXohVuKTod90iXUoefAyCRd0GUicqItwX
 j+1O0wjA1MyDbOp+kZRs8k71bCrYP5vMJ0j9IxZDPAiICVcVZDQqMTm/D
 lhtOmLR1+mMss7bIsYLsCHSAuSyE9sqWqr8PUD08owMA208TweBYzddLm w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="256975039"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="256975039"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 16:40:27 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="647687579"
Received: from bradocaj-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.39.168])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 16:40:22 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 4/7] drm/i915/gt: create per-tile sysfs interface
Date: Sat, 19 Mar 2022 01:39:34 +0200
Message-Id: <20220318233938.149744-5-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318233938.149744-1-andi.shyti@linux.intel.com>
References: <20220318233938.149744-1-andi.shyti@linux.intel.com>
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
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 Dale B Stimson <dale.b.stimson@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/Makefile            |   1 +
 drivers/gpu/drm/i915/gt/intel_gt.c       |   2 +
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c | 103 +++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.h |  34 ++++++++
 drivers/gpu/drm/i915/i915_drv.h          |   2 +
 drivers/gpu/drm/i915/i915_sysfs.c        |   7 +-
 drivers/gpu/drm/i915/i915_sysfs.h        |   3 +
 7 files changed, 151 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index a54e84e054660..29523848396e4 100644
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
index cfac4a913642e..5001a6168d566 100644
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
index 0000000000000..d508319612944
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
@@ -0,0 +1,103 @@
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
+void intel_gt_sysfs_register(struct intel_gt *gt)
+{
+	struct kobj_gt *kg;
+
+	kg = kzalloc(sizeof(*kg), GFP_KERNEL);
+	if (!kg)
+		goto exit_fail;
+
+	kobject_init(&kg->base, &kobj_gt_type);
+	kg->gt = gt;
+
+	/* xfer ownership to sysfs tree */
+	if (kobject_add(&kg->base, gt->i915->sysfs_gt, "gt%d", gt->info.id))
+		goto exit_kobj_put;
+
+	return;
+
+exit_kobj_put:
+	kobject_put(&kg->base);
+
+exit_fail:
+	drm_warn(&gt->i915->drm,
+		 "failed to initialize gt%d sysfs root\n", gt->info.id);
+}
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs.h b/drivers/gpu/drm/i915/gt/intel_gt_sysfs.h
new file mode 100644
index 0000000000000..9471b26752cfc
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
index 8e4083d413592..dc3369188f96f 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -783,6 +783,8 @@ struct drm_i915_private {
 #define I915_MAX_GT 4
 	struct intel_gt *gt[I915_MAX_GT];
 
+	struct kobject *sysfs_gt;
+
 	struct {
 		struct i915_gem_contexts {
 			spinlock_t lock; /* locks list */
diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
index a4d1759375b9d..5ff915b93c21a 100644
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
@@ -538,6 +538,11 @@ void i915_setup_sysfs(struct drm_i915_private *dev_priv)
 	if (ret)
 		drm_err(&dev_priv->drm, "RPS sysfs setup failed\n");
 
+	dev_priv->sysfs_gt = kobject_create_and_add("gt", &kdev->kobj);
+	if (!dev_priv->sysfs_gt)
+		drm_warn(&dev_priv->drm,
+			 "failed to register GT sysfs directory\n");
+
 	i915_setup_error_capture(kdev);
 
 	intel_engines_add_sysfs(dev_priv);
diff --git a/drivers/gpu/drm/i915/i915_sysfs.h b/drivers/gpu/drm/i915/i915_sysfs.h
index 41afd4366416a..243a17741e3f1 100644
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
2.35.1

