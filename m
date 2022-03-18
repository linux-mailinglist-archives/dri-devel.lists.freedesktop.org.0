Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6344DE496
	for <lists+dri-devel@lfdr.de>; Sat, 19 Mar 2022 00:40:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F3410E504;
	Fri, 18 Mar 2022 23:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFAD10E504;
 Fri, 18 Mar 2022 23:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647646837; x=1679182837;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TpVKJbSEO62+eub2lf8YpPl1GfVzo2T81bnq9Xgtv8g=;
 b=OcDnswQ2TKHOaZ7I73SJ899agsjb/GD+I2Af34kvnqRkx6hgTZuvFTZY
 EsQf5hGGLFZapakuITCSOYdy8N3JulZO2V6sQAI5syltHzBLo8BfPPJuF
 2Vtx7viPIS8csCxednjdIclD+SfYdRlTYW//a1AiADdVgauYuJEww5tNw
 9QR75k8JWriDpfBClKC8DJjyRbcH1Gd3vO7PO9DpZoAIfn1gLkEZNaiQW
 iIixWPhUf/JjKIeHG9AZ4vY9RYstW/3CKl88l2qSKBO7uhAUq5/gg4PgT
 t/jeSrj+a2AC4um3QUWCBFAU1giyS34Y8/FzwFq8DuTdAcmN9c9cjR56u Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="320458294"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="320458294"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 16:40:37 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="558717857"
Received: from bradocaj-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.39.168])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 16:40:31 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 5/7] drm/i915/gt: Create per-tile RC6 sysfs interface
Date: Sat, 19 Mar 2022 01:39:35 +0200
Message-Id: <20220318233938.149744-6-andi.shyti@linux.intel.com>
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

Now tiles have their own sysfs interfaces under the gt/
directory. Because RC6 is a property that can be configured on a
tile basis, then each tile should have its own interface

The new sysfs structure will have a similar layout for the 4 tile
case:

/sys/.../card0
         ├── gt
         │   ├── gt0
         │   │   ├── id
         │   │   ├── rc6_enable
         │   │   ├── rc6_residency_ms
         .   .   .
         .   .   .
         .   .
         │   └── gtN
         │       ├── id
         │       ├── rc6_enable
         │       ├── rc6_residency_ms
         │       .
         │       .
         │
         └── power/                -+
              ├── rc6_enable        |    Original interface
              ├── rc6_residency_ms  +->  kept as existing ABI;
              .                     |    it multiplexes over
              .                     |    the GTs
                                   -+

The existing interfaces have been kept in their original location
to preserve the existing ABI. They act on all the GTs: when
reading they provide the average value from all the GTs.

This patch is not really adding exposing new interfaces (new
ABI) other than adapting the existing one to more tiles. In any
case this new set of interfaces will be a basic tool for system
managers and administrators when using i915.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/Makefile               |   1 +
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c    |  19 ++
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 244 ++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.h |  15 ++
 drivers/gpu/drm/i915/i915_sysfs.c           | 128 ----------
 5 files changed, 279 insertions(+), 128 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 29523848396e4..46af9379803d8 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -106,6 +106,7 @@ gt-y += \
 	gt/intel_gt_pm_irq.o \
 	gt/intel_gt_requests.o \
 	gt/intel_gt_sysfs.o \
+	gt/intel_gt_sysfs_pm.o \
 	gt/intel_gtt.o \
 	gt/intel_llc.o \
 	gt/intel_lrc.o \
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
index d508319612944..8ec8bc660c8c2 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
@@ -13,6 +13,7 @@
 #include "i915_sysfs.h"
 #include "intel_gt.h"
 #include "intel_gt_sysfs.h"
+#include "intel_gt_sysfs_pm.h"
 #include "intel_gt_types.h"
 #include "intel_rc6.h"
 
@@ -50,6 +51,11 @@ struct intel_gt *intel_gt_sysfs_get_drvdata(struct device *dev,
 	return kobj_to_gt(kobj);
 }
 
+static struct kobject *gt_get_parent_obj(struct intel_gt *gt)
+{
+	return &gt->i915->drm.primary->kdev->kobj;
+}
+
 static ssize_t id_show(struct device *dev,
 		       struct device_attribute *attr,
 		       char *buf)
@@ -81,6 +87,17 @@ void intel_gt_sysfs_register(struct intel_gt *gt)
 {
 	struct kobj_gt *kg;
 
+	/*
+	 * We need to make things right with the
+	 * ABI compatibility. The files were originally
+	 * generated under the parent directory.
+	 *
+	 * We generate the files only for gt 0
+	 * to avoid duplicates.
+	 */
+	if (gt_is_root(gt))
+		intel_gt_sysfs_pm_init(gt, gt_get_parent_obj(gt));
+
 	kg = kzalloc(sizeof(*kg), GFP_KERNEL);
 	if (!kg)
 		goto exit_fail;
@@ -92,6 +109,8 @@ void intel_gt_sysfs_register(struct intel_gt *gt)
 	if (kobject_add(&kg->base, gt->i915->sysfs_gt, "gt%d", gt->info.id))
 		goto exit_kobj_put;
 
+	intel_gt_sysfs_pm_init(gt, &kg->base);
+
 	return;
 
 exit_kobj_put:
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
new file mode 100644
index 0000000000000..144b004e4de82
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
@@ -0,0 +1,244 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#include <drm/drm_device.h>
+#include <linux/sysfs.h>
+#include <linux/printk.h>
+
+#include "i915_drv.h"
+#include "i915_sysfs.h"
+#include "intel_gt.h"
+#include "intel_gt_regs.h"
+#include "intel_gt_sysfs.h"
+#include "intel_gt_sysfs_pm.h"
+#include "intel_rc6.h"
+
+#ifdef CONFIG_PM
+enum intel_gt_sysfs_op {
+	INTEL_GT_SYSFS_MIN = 0,
+	INTEL_GT_SYSFS_MAX,
+};
+
+static u32
+sysfs_gt_attribute_r_func(struct device *dev, struct device_attribute *attr,
+			  u32 (func)(struct intel_gt *gt),
+			  enum intel_gt_sysfs_op op)
+{
+	struct intel_gt *gt;
+	u32 ret;
+
+	ret = (op == INTEL_GT_SYSFS_MAX) ? 0 : (u32) -1;
+
+	if (!is_object_gt(&dev->kobj)) {
+		int i;
+		struct drm_i915_private *i915 = kdev_minor_to_i915(dev);
+
+		for_each_gt(gt, i915, i) {
+			u32 val = func(gt);
+
+			switch (op) {
+			case INTEL_GT_SYSFS_MIN:
+				if (val < ret)
+					ret = val;
+				break;
+
+			case INTEL_GT_SYSFS_MAX:
+				if (val > ret)
+					ret = val;
+				break;
+			}
+		}
+	} else {
+		gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
+		ret = func(gt);
+	}
+
+	return ret;
+}
+
+/* RC6 interfaces will show the minimum RC6 residency value */
+#define sysfs_gt_attribute_r_min_func(d, a, f) \
+		sysfs_gt_attribute_r_func(d, a, f, INTEL_GT_SYSFS_MIN)
+
+#define sysfs_gt_attribute_r_max_func(d, a, f) \
+		sysfs_gt_attribute_r_func(d, a, f, INTEL_GT_SYSFS_MAX)
+
+static u32 get_residency(struct intel_gt *gt, i915_reg_t reg)
+{
+	intel_wakeref_t wakeref;
+	u64 res = 0;
+
+	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
+		res = intel_rc6_residency_us(&gt->rc6, reg);
+
+	return DIV_ROUND_CLOSEST_ULL(res, 1000);
+}
+
+static ssize_t rc6_enable_show(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buff)
+{
+	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
+	u8 mask = 0;
+
+	if (HAS_RC6(gt->i915))
+		mask |= BIT(0);
+	if (HAS_RC6p(gt->i915))
+		mask |= BIT(1);
+	if (HAS_RC6pp(gt->i915))
+		mask |= BIT(2);
+
+	return sysfs_emit(buff, "%x\n", mask);
+}
+
+static u32 __rc6_residency_ms_show(struct intel_gt *gt)
+{
+	return get_residency(gt, GEN6_GT_GFX_RC6);
+}
+
+static ssize_t rc6_residency_ms_show(struct device *dev,
+				     struct device_attribute *attr,
+				     char *buff)
+{
+	u32 rc6_residency = sysfs_gt_attribute_r_min_func(dev, attr,
+						      __rc6_residency_ms_show);
+
+	return sysfs_emit(buff, "%u\n", rc6_residency);
+}
+
+static u32 __rc6p_residency_ms_show(struct intel_gt *gt)
+{
+	return get_residency(gt, GEN6_GT_GFX_RC6p);
+}
+
+static ssize_t rc6p_residency_ms_show(struct device *dev,
+				      struct device_attribute *attr,
+				      char *buff)
+{
+	u32 rc6p_residency = sysfs_gt_attribute_r_min_func(dev, attr,
+						__rc6p_residency_ms_show);
+
+	return sysfs_emit(buff, "%u\n", rc6p_residency);
+}
+
+static u32 __rc6pp_residency_ms_show(struct intel_gt *gt)
+{
+	return get_residency(gt, GEN6_GT_GFX_RC6pp);
+}
+
+static ssize_t rc6pp_residency_ms_show(struct device *dev,
+				       struct device_attribute *attr,
+				       char *buff)
+{
+	u32 rc6pp_residency = sysfs_gt_attribute_r_min_func(dev, attr,
+						__rc6pp_residency_ms_show);
+
+	return sysfs_emit(buff, "%u\n", rc6pp_residency);
+}
+
+static u32 __media_rc6_residency_ms_show(struct intel_gt *gt)
+{
+	return get_residency(gt, VLV_GT_MEDIA_RC6);
+}
+
+static ssize_t media_rc6_residency_ms_show(struct device *dev,
+					   struct device_attribute *attr,
+					   char *buff)
+{
+	u32 rc6_residency = sysfs_gt_attribute_r_min_func(dev, attr,
+						__media_rc6_residency_ms_show);
+
+	return sysfs_emit(buff, "%u\n", rc6_residency);
+}
+
+static DEVICE_ATTR_RO(rc6_enable);
+static DEVICE_ATTR_RO(rc6_residency_ms);
+static DEVICE_ATTR_RO(rc6p_residency_ms);
+static DEVICE_ATTR_RO(rc6pp_residency_ms);
+static DEVICE_ATTR_RO(media_rc6_residency_ms);
+
+static struct attribute *rc6_attrs[] = {
+	&dev_attr_rc6_enable.attr,
+	&dev_attr_rc6_residency_ms.attr,
+	NULL
+};
+
+static struct attribute *rc6p_attrs[] = {
+	&dev_attr_rc6p_residency_ms.attr,
+	&dev_attr_rc6pp_residency_ms.attr,
+	NULL
+};
+
+static struct attribute *media_rc6_attrs[] = {
+	&dev_attr_media_rc6_residency_ms.attr,
+	NULL
+};
+
+static const struct attribute_group rc6_attr_group[] = {
+	{ .attrs = rc6_attrs, },
+	{ .name = power_group_name, .attrs = rc6_attrs, },
+};
+
+static const struct attribute_group rc6p_attr_group[] = {
+	{ .attrs = rc6p_attrs, },
+	{ .name = power_group_name, .attrs = rc6p_attrs, },
+};
+
+static const struct attribute_group media_rc6_attr_group[] = {
+	{ .attrs = media_rc6_attrs, },
+	{ .name = power_group_name, .attrs = media_rc6_attrs, },
+};
+
+static int __intel_gt_sysfs_create_group(struct kobject *kobj,
+					 const struct attribute_group *grp)
+{
+	return is_object_gt(kobj) ?
+	       sysfs_create_group(kobj, &grp[0]) :
+	       sysfs_merge_group(kobj, &grp[1]);
+}
+
+static void intel_sysfs_rc6_init(struct intel_gt *gt, struct kobject *kobj)
+{
+	int ret;
+
+	if (!HAS_RC6(gt->i915))
+		return;
+
+	ret = __intel_gt_sysfs_create_group(kobj, rc6_attr_group);
+	if (ret)
+		drm_warn(&gt->i915->drm,
+			 "failed to create gt%u RC6 sysfs files (%pe)\n",
+			 gt->info.id, ERR_PTR(ret));
+
+	/*
+	 * cannot use the is_visible() attribute because
+	 * the upper object inherits from the parent group.
+	 */
+	if (HAS_RC6p(gt->i915)) {
+		ret = __intel_gt_sysfs_create_group(kobj, rc6p_attr_group);
+		if (ret)
+			drm_warn(&gt->i915->drm,
+				 "failed to create gt%u RC6p sysfs files (%pe)\n",
+				 gt->info.id, ERR_PTR(ret));
+	}
+
+	if (IS_VALLEYVIEW(gt->i915) || IS_CHERRYVIEW(gt->i915)) {
+		ret = __intel_gt_sysfs_create_group(kobj, media_rc6_attr_group);
+		if (ret)
+			drm_warn(&gt->i915->drm,
+				 "failed to create media %u RC6 sysfs files (%pe)\n",
+				 gt->info.id, ERR_PTR(ret));
+	}
+}
+#else
+static void intel_sysfs_rc6_init(struct intel_gt *gt, struct kobject *kobj)
+{
+}
+#endif /* CONFIG_PM */
+
+void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj)
+{
+	intel_sysfs_rc6_init(gt, kobj);
+}
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.h
new file mode 100644
index 0000000000000..f567105a4a89a
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef __SYSFS_GT_PM_H__
+#define __SYSFS_GT_PM_H__
+
+#include <linux/kobject.h>
+
+#include "intel_gt_types.h"
+
+void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj);
+
+#endif /* SYSFS_RC6_H */
diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
index 5ff915b93c21a..2c5d62a521f64 100644
--- a/drivers/gpu/drm/i915/i915_sysfs.c
+++ b/drivers/gpu/drm/i915/i915_sysfs.c
@@ -45,107 +45,6 @@ struct drm_i915_private *kdev_minor_to_i915(struct device *kdev)
 	return to_i915(minor->dev);
 }
 
-#ifdef CONFIG_PM
-static u32 calc_residency(struct drm_i915_private *dev_priv,
-			  i915_reg_t reg)
-{
-	intel_wakeref_t wakeref;
-	u64 res = 0;
-
-	with_intel_runtime_pm(&dev_priv->runtime_pm, wakeref)
-		res = intel_rc6_residency_us(&to_gt(dev_priv)->rc6, reg);
-
-	return DIV_ROUND_CLOSEST_ULL(res, 1000);
-}
-
-static ssize_t rc6_enable_show(struct device *kdev,
-			       struct device_attribute *attr, char *buf)
-{
-	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
-	unsigned int mask;
-
-	mask = 0;
-	if (HAS_RC6(dev_priv))
-		mask |= BIT(0);
-	if (HAS_RC6p(dev_priv))
-		mask |= BIT(1);
-	if (HAS_RC6pp(dev_priv))
-		mask |= BIT(2);
-
-	return sysfs_emit(buf, "%x\n", mask);
-}
-
-static ssize_t rc6_residency_ms_show(struct device *kdev,
-				     struct device_attribute *attr, char *buf)
-{
-	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
-	u32 rc6_residency = calc_residency(dev_priv, GEN6_GT_GFX_RC6);
-	return sysfs_emit(buf, "%u\n", rc6_residency);
-}
-
-static ssize_t rc6p_residency_ms_show(struct device *kdev,
-				      struct device_attribute *attr, char *buf)
-{
-	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
-	u32 rc6p_residency = calc_residency(dev_priv, GEN6_GT_GFX_RC6p);
-	return sysfs_emit(buf, "%u\n", rc6p_residency);
-}
-
-static ssize_t rc6pp_residency_ms_show(struct device *kdev,
-				       struct device_attribute *attr, char *buf)
-{
-	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
-	u32 rc6pp_residency = calc_residency(dev_priv, GEN6_GT_GFX_RC6pp);
-	return sysfs_emit(buf, "%u\n", rc6pp_residency);
-}
-
-static ssize_t media_rc6_residency_ms_show(struct device *kdev,
-					   struct device_attribute *attr, char *buf)
-{
-	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
-	u32 rc6_residency = calc_residency(dev_priv, VLV_GT_MEDIA_RC6);
-	return sysfs_emit(buf, "%u\n", rc6_residency);
-}
-
-static DEVICE_ATTR_RO(rc6_enable);
-static DEVICE_ATTR_RO(rc6_residency_ms);
-static DEVICE_ATTR_RO(rc6p_residency_ms);
-static DEVICE_ATTR_RO(rc6pp_residency_ms);
-static DEVICE_ATTR_RO(media_rc6_residency_ms);
-
-static struct attribute *rc6_attrs[] = {
-	&dev_attr_rc6_enable.attr,
-	&dev_attr_rc6_residency_ms.attr,
-	NULL
-};
-
-static const struct attribute_group rc6_attr_group = {
-	.name = power_group_name,
-	.attrs =  rc6_attrs
-};
-
-static struct attribute *rc6p_attrs[] = {
-	&dev_attr_rc6p_residency_ms.attr,
-	&dev_attr_rc6pp_residency_ms.attr,
-	NULL
-};
-
-static const struct attribute_group rc6p_attr_group = {
-	.name = power_group_name,
-	.attrs =  rc6p_attrs
-};
-
-static struct attribute *media_rc6_attrs[] = {
-	&dev_attr_media_rc6_residency_ms.attr,
-	NULL
-};
-
-static const struct attribute_group media_rc6_attr_group = {
-	.name = power_group_name,
-	.attrs =  media_rc6_attrs
-};
-#endif
-
 static int l3_access_valid(struct drm_i915_private *i915, loff_t offset)
 {
 	if (!HAS_L3_DPF(i915))
@@ -492,29 +391,6 @@ void i915_setup_sysfs(struct drm_i915_private *dev_priv)
 	struct device *kdev = dev_priv->drm.primary->kdev;
 	int ret;
 
-#ifdef CONFIG_PM
-	if (HAS_RC6(dev_priv)) {
-		ret = sysfs_merge_group(&kdev->kobj,
-					&rc6_attr_group);
-		if (ret)
-			drm_err(&dev_priv->drm,
-				"RC6 residency sysfs setup failed\n");
-	}
-	if (HAS_RC6p(dev_priv)) {
-		ret = sysfs_merge_group(&kdev->kobj,
-					&rc6p_attr_group);
-		if (ret)
-			drm_err(&dev_priv->drm,
-				"RC6p residency sysfs setup failed\n");
-	}
-	if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) {
-		ret = sysfs_merge_group(&kdev->kobj,
-					&media_rc6_attr_group);
-		if (ret)
-			drm_err(&dev_priv->drm,
-				"Media RC6 residency sysfs setup failed\n");
-	}
-#endif
 	if (HAS_L3_DPF(dev_priv)) {
 		ret = device_create_bin_file(kdev, &dpf_attrs);
 		if (ret)
@@ -560,8 +436,4 @@ void i915_teardown_sysfs(struct drm_i915_private *dev_priv)
 		sysfs_remove_files(&kdev->kobj, gen6_attrs);
 	device_remove_bin_file(kdev,  &dpf_attrs_1);
 	device_remove_bin_file(kdev,  &dpf_attrs);
-#ifdef CONFIG_PM
-	sysfs_unmerge_group(&kdev->kobj, &rc6_attr_group);
-	sysfs_unmerge_group(&kdev->kobj, &rc6p_attr_group);
-#endif
 }
-- 
2.35.1

