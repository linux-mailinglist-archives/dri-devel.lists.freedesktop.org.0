Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1B24DD2E3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 03:11:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE4D10E962;
	Fri, 18 Mar 2022 02:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285BB10E962;
 Fri, 18 Mar 2022 02:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647569513; x=1679105513;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=riStR/wQrtiANxq2/Tqd9az8rpd803VBnSYdg8mR9K0=;
 b=fPHYar7vfA5KBmilhmri1mGNRGcEq9X0s6WdoyfiX/72rucYh2nHQC8l
 XRwg0TQve6TW0EQbDUJBcE4Cr/2c7LVrikt63HDm9owdqGhIYGwNsSmA9
 f3PEff7JwVV3w8itpb+cSddJ9RO4vbsceo+oNu6neeNtnfXREVTsR+8a4
 Yi71zfdzO/69AFNM1LAs4zwW81o91HjX8GMCgobDKqRRkYqeDVeNtAHhH
 B23i55sQn0abMNVUpkhJK7K+JqVzN5kXMJMlh/pkhwD6KIsiS0iOABzHL
 g7kpTUJvvE6pn/MydxRtpTHOtIjKOXsVUyBTToKM/zblFczj2LeNTgNfb A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="257216837"
X-IronPort-AV: E=Sophos;i="5.90,190,1643702400"; d="scan'208";a="257216837"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 19:11:52 -0700
X-IronPort-AV: E=Sophos;i="5.90,190,1643702400"; d="scan'208";a="647275715"
Received: from akramak-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.251.222.144])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 19:11:48 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 4/7] drm/i915/gt: create per-tile sysfs interface
Date: Fri, 18 Mar 2022 04:10:43 +0200
Message-Id: <20220318021046.40348-5-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318021046.40348-1-andi.shyti@linux.intel.com>
References: <20220318021046.40348-1-andi.shyti@linux.intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/i915/Makefile            |   1 +
 drivers/gpu/drm/i915/gt/intel_gt.c       |   2 +
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c | 103 +++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.h |  34 ++++++++
 drivers/gpu/drm/i915/i915_drv.h          |   2 +
 drivers/gpu/drm/i915/i915_sysfs.c        |   7 +-
 drivers/gpu/drm/i915/i915_sysfs.h        |   3 +
 scripts/extract-cert                     | Bin 0 -> 17952 bytes
 8 files changed, 151 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs.h
 create mode 100755 scripts/extract-cert

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 1a771ee5b1d01..181d71d5ba3c0 100644
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
index f66139021049d..a68d3d3c41653 100644
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
index fa2631d9b87cd..62284263cbc52 100644
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
 
diff --git a/scripts/extract-cert b/scripts/extract-cert
new file mode 100755
index 0000000000000000000000000000000000000000..fe0a96aa5eb9288ba52bc056da46daef5befa7b8
GIT binary patch
literal 17952
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

literal 0
HcmV?d00001

-- 
2.35.1

