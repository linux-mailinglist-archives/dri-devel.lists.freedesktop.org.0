Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 098074DE49B
	for <lists+dri-devel@lfdr.de>; Sat, 19 Mar 2022 00:40:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6080B10E56B;
	Fri, 18 Mar 2022 23:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87BEB10E56B;
 Fri, 18 Mar 2022 23:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647646855; x=1679182855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oYO+wAt4+zN2cFwvas06ga/h3QJ68q193Z9mFzIJm6A=;
 b=c1xIeHDVQORgilfNVZpn2SMWwBq0EoEWAo2WffMwM6RaSIgT/ukxEhH+
 yPxuHZP5G+Pm42kKaPC7GIqOWQjYK2cZM/QV7ZPHJvuuXzrAcaukHDU8O
 WJ55pud6jiZq6mzbhwHDwcUZp67l/rJOMCuD3l+iNZZRvY0Nlvau8350Y
 tYcoLtk69xAnHXqp2YTUhewojBcY3vl1wltLHD/PbbLg5+wQrk8q2tLuO
 6ISaqme+U/ceMuTOd/UZ9xtKqq1ST2TK33hFFayo9yMzWFNV/71gnkBFn
 GKWW3fCZxNDml+HhrNuSbGJEPEteU3qjn9estIelsKjOoYAHaAyzWNR7f w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="317961666"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="317961666"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 16:40:55 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="517463539"
Received: from bradocaj-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.39.168])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 16:40:49 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 7/7] drm/i915/gt: Add sysfs throttle frequency interfaces
Date: Sat, 19 Mar 2022 01:39:37 +0200
Message-Id: <20220318233938.149744-8-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318233938.149744-1-andi.shyti@linux.intel.com>
References: <20220318233938.149744-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
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

From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>

Throttling here refers to the GT frequency being clipped. Each of
the throttle reason attributes will have a 0 or 1 value depending
upon whether there is throttling and also the specific reason for
it.

The following is a brief description of the sysfs throttle
frequency attributes added:

 - throttle_reason_status: when set indicates that there is GT
   frequency clipping.

 - throttle_reason_pl1: when set indicates that PBM PL1 (platform
   or package PL1) has caused GT frequency clipping.

 - throttle_reason_pl2: when set indicates that PBM PL2 or PL3
   (platform or package PL2 or PL3) has caused GT frequency
   clipping.

 - throttle_reason_pl4: when set indicates that PL4 or IccMax has
   caused GT frequency clipping.

 - throttle_reason_thermal: when set indicates that Thermal event
   has caused GT frequency clipping.

 - throttle_reason_prochot: when set indicates that PROCHOT# has
   caused GT frequency clipping.

 - throttle_reason_ratl: when set indicates that Running Average
   Thermal Limit has caused GT frequency clipping.

 - throttle_reason_vr_thermalert: when set indicates that Hot VR
   (any processor VR)  has caused GT frequency clipping.

 - throttle_reason_vr_tdc: when set indicates that VR TDC
   (Thermal Design Current)  has caused GT frequency clipping.

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Dale B Stimson <dale.b.stimson@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 74 +++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_rps.c         | 18 +++++
 drivers/gpu/drm/i915/gt/intel_rps.h         |  4 ++
 drivers/gpu/drm/i915/i915_reg.h             | 11 +++
 4 files changed, 107 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
index b0a1ea95d028e..26cbfa6477d12 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
@@ -8,6 +8,7 @@
 #include <linux/printk.h>
 
 #include "i915_drv.h"
+#include "i915_reg.h"
 #include "i915_sysfs.h"
 #include "intel_gt.h"
 #include "intel_gt_regs.h"
@@ -493,6 +494,69 @@ static DEVICE_ATTR_RO(vlv_rpe_freq_mhz);
 static const struct attribute * const gen6_rps_attrs[] = GEN6_RPS_ATTR;
 static const struct attribute * const gen6_gt_attrs[]  = GEN6_GT_ATTR;
 
+static ssize_t punit_req_freq_mhz_show(struct device *dev,
+				       struct device_attribute *attr,
+				       char *buff)
+{
+	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
+	u32 preq = intel_rps_read_punit_req_frequency(&gt->rps);
+
+	return sysfs_emit(buff, "%u\n", preq);
+}
+
+struct intel_gt_bool_throttle_attr {
+	struct attribute attr;
+	ssize_t (*show)(struct device *dev, struct device_attribute *attr,
+			char *buf);
+	i915_reg_t reg32;
+	u32 mask;
+};
+
+static ssize_t throttle_reason_bool_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buff)
+{
+	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
+	struct intel_gt_bool_throttle_attr *t_attr =
+				(struct intel_gt_bool_throttle_attr *) attr;
+	bool val = rps_read_mask_mmio(&gt->rps, t_attr->reg32, t_attr->mask);
+
+	return sysfs_emit(buff, "%u\n", val);
+}
+
+#define INTEL_GT_RPS_BOOL_ATTR_RO(sysfs_func__, mask__) \
+struct intel_gt_bool_throttle_attr attr_##sysfs_func__ = { \
+	.attr = { .name = __stringify(sysfs_func__), .mode = 0444 }, \
+	.show = throttle_reason_bool_show, \
+	.reg32 = GT0_PERF_LIMIT_REASONS, \
+	.mask = mask__, \
+}
+
+static DEVICE_ATTR_RO(punit_req_freq_mhz);
+static INTEL_GT_RPS_BOOL_ATTR_RO(throttle_reason_status, GT0_PERF_LIMIT_REASONS_MASK);
+static INTEL_GT_RPS_BOOL_ATTR_RO(throttle_reason_pl1, POWER_LIMIT_1_MASK);
+static INTEL_GT_RPS_BOOL_ATTR_RO(throttle_reason_pl2, POWER_LIMIT_2_MASK);
+static INTEL_GT_RPS_BOOL_ATTR_RO(throttle_reason_pl4, POWER_LIMIT_4_MASK);
+static INTEL_GT_RPS_BOOL_ATTR_RO(throttle_reason_thermal, THERMAL_LIMIT_MASK);
+static INTEL_GT_RPS_BOOL_ATTR_RO(throttle_reason_prochot, PROCHOT_MASK);
+static INTEL_GT_RPS_BOOL_ATTR_RO(throttle_reason_ratl, RATL_MASK);
+static INTEL_GT_RPS_BOOL_ATTR_RO(throttle_reason_vr_thermalert, VR_THERMALERT_MASK);
+static INTEL_GT_RPS_BOOL_ATTR_RO(throttle_reason_vr_tdc, VR_TDC_MASK);
+
+static const struct attribute *freq_attrs[] = {
+	&dev_attr_punit_req_freq_mhz.attr,
+	&attr_throttle_reason_status.attr,
+	&attr_throttle_reason_pl1.attr,
+	&attr_throttle_reason_pl2.attr,
+	&attr_throttle_reason_pl4.attr,
+	&attr_throttle_reason_thermal.attr,
+	&attr_throttle_reason_prochot.attr,
+	&attr_throttle_reason_ratl.attr,
+	&attr_throttle_reason_vr_thermalert.attr,
+	&attr_throttle_reason_vr_tdc.attr,
+	NULL
+};
+
 static int intel_sysfs_rps_init(struct intel_gt *gt, struct kobject *kobj,
 				const struct attribute * const *attrs)
 {
@@ -524,4 +588,14 @@ void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj)
 		drm_warn(&gt->i915->drm,
 			 "failed to create gt%u RPS sysfs files (%pe)",
 			 gt->info.id, ERR_PTR(ret));
+
+	/* end of the legacy interfaces */
+	if (!is_object_gt(kobj))
+		return;
+
+	ret = sysfs_create_files(kobj, freq_attrs);
+	if (ret)
+		drm_warn(&gt->i915->drm,
+			 "failed to create gt%u throttle sysfs files (%pe)",
+			 gt->info.id, ERR_PTR(ret));
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index a9c13b1a30181..6c9fdf7906c50 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -2291,6 +2291,24 @@ void intel_rps_lower_unslice(struct intel_rps *rps)
 	mutex_unlock(&rps->lock);
 }
 
+static u32 rps_read_mmio(struct intel_rps *rps, i915_reg_t reg32)
+{
+	struct intel_gt *gt = rps_to_gt(rps);
+	intel_wakeref_t wakeref;
+	u32 val;
+
+	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
+		val = intel_uncore_read(gt->uncore, reg32);
+
+	return val;
+}
+
+bool rps_read_mask_mmio(struct intel_rps *rps,
+			i915_reg_t reg32, u32 mask)
+{
+	return rps_read_mmio(rps, reg32) & mask;
+}
+
 /* External interface for intel_ips.ko */
 
 static struct drm_i915_private __rcu *ips_mchdev;
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
index c6d76a3d13314..ba1ed9f7ecdab 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.h
+++ b/drivers/gpu/drm/i915/gt/intel_rps.h
@@ -7,6 +7,7 @@
 #define INTEL_RPS_H
 
 #include "intel_rps_types.h"
+#include "i915_reg_defs.h"
 
 struct i915_request;
 
@@ -48,6 +49,9 @@ u32 intel_rps_read_state_cap(struct intel_rps *rps);
 void intel_rps_raise_unslice(struct intel_rps *rps);
 void intel_rps_lower_unslice(struct intel_rps *rps);
 
+u32 intel_rps_read_throttle_reason(struct intel_rps *rps);
+bool rps_read_mask_mmio(struct intel_rps *rps, i915_reg_t reg32, u32 mask);
+
 void gen5_rps_irq_handler(struct intel_rps *rps);
 void gen6_rps_irq_handler(struct intel_rps *rps, u32 pm_iir);
 void gen11_rps_irq_handler(struct intel_rps *rps, u32 pm_iir);
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 2acebd5236913..a0d652f19ff93 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -1837,6 +1837,17 @@
 #define GEN9_RP_STATE_LIMITS	_MMIO(0x138148)
 #define XEHPSDV_RP_STATE_CAP	_MMIO(0x250014)
 
+#define GT0_PERF_LIMIT_REASONS		_MMIO(0x1381a8)
+#define   GT0_PERF_LIMIT_REASONS_MASK	0xde3
+#define   PROCHOT_MASK			REG_BIT(1)
+#define   THERMAL_LIMIT_MASK		REG_BIT(2)
+#define   RATL_MASK			REG_BIT(6)
+#define   VR_THERMALERT_MASK		REG_BIT(7)
+#define   VR_TDC_MASK			REG_BIT(8)
+#define   POWER_LIMIT_4_MASK		REG_BIT(9)
+#define   POWER_LIMIT_1_MASK		REG_BIT(11)
+#define   POWER_LIMIT_2_MASK		REG_BIT(12)
+
 #define CHV_CLK_CTL1			_MMIO(0x101100)
 #define VLV_CLK_CTL2			_MMIO(0x101104)
 #define   CLK_CTL2_CZCOUNT_30NS_SHIFT	28
-- 
2.35.1

