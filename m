Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E93E74BA356
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 15:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9E910E8D9;
	Thu, 17 Feb 2022 14:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A60910E304;
 Thu, 17 Feb 2022 14:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645109050; x=1676645050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yZuJoK3HcLfvvHcIGtlu8BUIHOYTSxgkjoXLx3XGzz0=;
 b=Q/7AXzSYdf6s2urdcuv0qRZDh50Mc9OcD1GDbTqyAYn6lsU/0qT/4BEg
 C/HZilSNxqaVPtkVaH09s9/U7ly53UEVLrCcXM5VjyW1tznyBwstS6ge1
 /t41MJqXvT4pW8WYvWYJAycudNe2NJj3+vWsaX01NPpvjt1datKko6uhf
 zfMOJDzz+501Em8Rvh7gqCmR/MjvNuTWilOZfoVIGOzKmJxxzNuMdBwxr
 OeFTO5mNVgWVuMSwEZrUns89qfEQT3V3/qkaIic6B3k3IJhcmKXE8LKcd
 IIeJaiquVd3Id3RNhuKZVoDVMSrgO9k8I9NUWxOIZQEQiI5tJYhxn4yR4 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="248482548"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="248482548"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:44:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="571843265"
Received: from sewaggon-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.249.33.71])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:44:04 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 6/7] drm/i915/gt: Create per-tile RPS sysfs interfaces
Date: Thu, 17 Feb 2022 15:41:57 +0100
Message-Id: <20220217144158.21555-7-andi.shyti@linux.intel.com>
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

Now tiles have their own sysfs interfaces under the gt/
directory. Because RPS is a property that can be configured on a
tile basis, then each tile should have its own interface

The new sysfs structure will have a similar layout for the 4 tile
case:

/sys/.../card0
         ├── gt
         │   ├── gt0
         │   │   ├── id
         │   │   ├── rc6_enable
         │   │   ├── rc6_residency_ms
         │   │   ├── rps_act_freq_mhz
         │   │   ├── rps_boost_freq_mhz
         │   │   ├── rps_cur_freq_mhz
         │   │   ├── rps_max_freq_mhz
         │   │   ├── rps_min_freq_mhz
         │   │   ├── rps_RP0_freq_mhz
         │   │   ├── rps_RP1_freq_mhz
         │   │   └── rps_RPn_freq_mhz
         .   .
         .   .
         .   .
         │   └── gtN
         │       ├── id
         │       ├── rc6_enable
         │       ├── rc6_residency_ms
         │       ├── rps_act_freq_mhz
         │       ├── rps_boost_freq_mhz
         │       ├── rps_cur_freq_mhz
         │       ├── rps_max_freq_mhz
         │       ├── rps_min_freq_mhz
         │       ├── rps_RP0_freq_mhz
         │       ├── rps_RP1_freq_mhz
         │       └── rps_RPn_freq_mhz
         ├── gt_act_freq_mhz   -+
         ├── gt_boost_freq_mhz  |
         ├── gt_cur_freq_mhz    |    Original interface
         ├── gt_max_freq_mhz    +─-> kept as existing ABI;
         ├── gt_min_freq_mhz    |    it points to gt0/
         ├── gt_RP0_freq_mhz    |
         ├── gt_RP1_freq_mhz    |
         └── gt_RPn_freq_mhz   -+

The existing interfaces have been kept in their original location
to preserve the existing ABI. They act on all the GTs: when
writing they loop through all the GTs and write the information
on each interface. When reading they provide the average value
from all the GTs.

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
---
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 276 ++++++++++++++++++++
 drivers/gpu/drm/i915/i915_sysfs.c           | 177 -------------
 2 files changed, 276 insertions(+), 177 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
index 27d93a36894a..8e86b8f675f1 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
@@ -14,8 +14,33 @@
 #include "intel_gt_sysfs.h"
 #include "intel_gt_sysfs_pm.h"
 #include "intel_rc6.h"
+#include "intel_rps.h"
 
 #ifdef CONFIG_PM
+static int
+sysfs_gt_attribute_w_func(struct device *dev, struct device_attribute *attr,
+			  int (func)(struct intel_gt *gt, u32 val), u32 val)
+{
+	struct intel_gt *gt;
+	int ret;
+
+	if (!is_object_gt(&dev->kobj)) {
+		int i;
+		struct drm_i915_private *i915 = kdev_minor_to_i915(dev);
+
+		for_each_gt(gt, i915, i) {
+			ret = func(gt, val);
+			if (ret)
+				break;
+		}
+	} else {
+		gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
+		ret = func(gt, val);
+	}
+
+	return ret;
+}
+
 static s64
 sysfs_gt_attribute_r_func(struct device *dev, struct device_attribute *attr,
 			  s64 (func)(struct intel_gt *gt))
@@ -214,7 +239,258 @@ static void intel_sysfs_rc6_init(struct intel_gt *gt, struct kobject *kobj)
 }
 #endif /* CONFIG_PM */
 
+static s64 __act_freq_mhz_show(struct intel_gt *gt)
+{
+	return intel_rps_read_actual_frequency(&gt->rps);
+}
+
+static ssize_t act_freq_mhz_show(struct device *dev,
+				 struct device_attribute *attr, char *buff)
+{
+	s64 actual_freq = sysfs_gt_attribute_r_func(dev, attr,
+						    __act_freq_mhz_show);
+
+	return sysfs_emit(buff, "%u\n", (u32) actual_freq);
+}
+
+static s64 __cur_freq_mhz_show(struct intel_gt *gt)
+{
+	return intel_rps_get_requested_frequency(&gt->rps);
+}
+
+static ssize_t cur_freq_mhz_show(struct device *dev,
+				 struct device_attribute *attr, char *buff)
+{
+	s64 cur_freq = sysfs_gt_attribute_r_func(dev, attr,
+						 __cur_freq_mhz_show);
+
+	return sysfs_emit(buff, "%u\n", (u32) cur_freq);
+}
+
+static s64 __boost_freq_mhz_show(struct intel_gt *gt)
+{
+	return intel_rps_get_boost_frequency(&gt->rps);
+}
+
+static ssize_t boost_freq_mhz_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buff)
+{
+	s64 boost_freq = sysfs_gt_attribute_r_func(dev, attr,
+						   __boost_freq_mhz_show);
+
+	return sysfs_emit(buff, "%u\n", (u32) boost_freq);
+}
+
+static int __boost_freq_mhz_store(struct intel_gt *gt, u32 val)
+{
+	struct intel_rps *rps = &gt->rps;
+	bool boost = false;
+
+	/* Validate against (static) hardware limits */
+	val = intel_freq_opcode(rps, val);
+	if (val < rps->min_freq || val > rps->max_freq)
+		return -EINVAL;
+
+	mutex_lock(&rps->lock);
+	if (val != rps->boost_freq) {
+		rps->boost_freq = val;
+		boost = atomic_read(&rps->num_waiters);
+	}
+	mutex_unlock(&rps->lock);
+	if (boost)
+		schedule_work(&rps->work);
+
+	return 0;
+}
+
+static ssize_t boost_freq_mhz_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buff, size_t count)
+{
+	ssize_t ret;
+	u32 val;
+
+	ret = kstrtou32(buff, 0, &val);
+	if (ret)
+		return ret;
+
+	return sysfs_gt_attribute_w_func(dev, attr,
+					 __boost_freq_mhz_store, val) ?: count;
+}
+
+static s64 __vlv_rpe_freq_mhz_show(struct intel_gt *gt)
+{
+	struct intel_rps *rps = &gt->rps;
+
+	return intel_gpu_freq(rps, rps->efficient_freq);
+}
+
+static ssize_t vlv_rpe_freq_mhz_show(struct device *dev,
+				     struct device_attribute *attr, char *buff)
+{
+	s64 rpe_freq = sysfs_gt_attribute_r_func(dev, attr,
+						 __vlv_rpe_freq_mhz_show);
+
+	return sysfs_emit(buff, "%d\n", (int) rpe_freq);
+}
+
+static s64 __max_freq_mhz_show(struct intel_gt *gt)
+{
+	return intel_rps_get_max_frequency(&gt->rps);
+}
+
+static int __set_max_freq(struct intel_gt *gt, u32 val)
+{
+	return intel_rps_set_max_frequency(&gt->rps, val);
+}
+
+static s64 __min_freq_mhz_show(struct intel_gt *gt)
+{
+	return intel_rps_get_min_frequency(&gt->rps);
+}
+
+static int __set_min_freq(struct intel_gt *gt, u32 val)
+{
+	return intel_rps_set_min_frequency(&gt->rps, val);
+}
+
+static ssize_t min_max_freq_mhz_store(struct device *dev,
+                                      struct device_attribute *attr,
+                                      const char *buff, size_t count);
+static ssize_t min_max_freq_mhz_show(struct device *dev,
+				     struct device_attribute *attr, char *buff);
+
+#define INTEL_GT_RPS_SYSFS_ATTR(_name, _mode, _show, _store) \
+	struct device_attribute dev_attr_gt_##_name = __ATTR(gt_##_name, _mode, _show, _store); \
+	struct device_attribute dev_attr_rps_##_name = __ATTR(rps_##_name, _mode, _show, _store)
+
+#define INTEL_GT_RPS_SYSFS_ATTR_RO(_name)				\
+		INTEL_GT_RPS_SYSFS_ATTR(_name, 0444, _name##_show, NULL)
+#define INTEL_GT_RPS_SYSFS_ATTR_RW(_name)				\
+		INTEL_GT_RPS_SYSFS_ATTR(_name, 0644, _name##_show, _name##_store)
+
+static INTEL_GT_RPS_SYSFS_ATTR_RO(act_freq_mhz);
+static INTEL_GT_RPS_SYSFS_ATTR_RO(cur_freq_mhz);
+static INTEL_GT_RPS_SYSFS_ATTR_RW(boost_freq_mhz);
+
+static DEVICE_ATTR_RO(vlv_rpe_freq_mhz);
+
+static ssize_t rps_rp_mhz_show(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buff);
+
+static INTEL_GT_RPS_SYSFS_ATTR(RP0_freq_mhz, 0444, rps_rp_mhz_show, NULL);
+static INTEL_GT_RPS_SYSFS_ATTR(RP1_freq_mhz, 0444, rps_rp_mhz_show, NULL);
+static INTEL_GT_RPS_SYSFS_ATTR(RPn_freq_mhz, 0444, rps_rp_mhz_show, NULL);
+
+INTEL_GT_RPS_SYSFS_ATTR(max_freq_mhz, 0644, min_max_freq_mhz_show, min_max_freq_mhz_store);
+INTEL_GT_RPS_SYSFS_ATTR(min_freq_mhz, 0644, min_max_freq_mhz_show, min_max_freq_mhz_store);
+
+#define GEN6_ATTR(s) { \
+		&dev_attr_##s##_act_freq_mhz.attr, \
+		&dev_attr_##s##_cur_freq_mhz.attr, \
+		&dev_attr_##s##_boost_freq_mhz.attr, \
+		&dev_attr_##s##_max_freq_mhz.attr, \
+		&dev_attr_##s##_min_freq_mhz.attr, \
+		&dev_attr_##s##_RP0_freq_mhz.attr, \
+		&dev_attr_##s##_RP1_freq_mhz.attr, \
+		&dev_attr_##s##_RPn_freq_mhz.attr, \
+		NULL, \
+	}
+
+#define GEN6_RPS_ATTR GEN6_ATTR(rps)
+#define GEN6_GT_ATTR  GEN6_ATTR(gt)
+
+static ssize_t min_max_freq_mhz_store(struct device *dev,
+                                      struct device_attribute *attr,
+                                      const char *buff, size_t count)
+{
+	long ret;
+	u32 val;
+
+	ret = kstrtou32(buff, 0, &val);
+	if (ret)
+		return ret;
+
+	ret = (attr == &dev_attr_gt_min_freq_mhz ||
+	       attr == &dev_attr_rps_min_freq_mhz) ?
+	      sysfs_gt_attribute_w_func(dev, attr, __set_min_freq, val) :
+	      sysfs_gt_attribute_w_func(dev, attr, __set_max_freq, val);
+
+	return ret ?: count;
+}
+
+static ssize_t min_max_freq_mhz_show(struct device *dev,
+				     struct device_attribute *attr, char *buff)
+{
+	s64 val;
+
+	val = (attr == &dev_attr_gt_min_freq_mhz ||
+	       attr == &dev_attr_rps_min_freq_mhz) ?
+	      sysfs_gt_attribute_r_func(dev, attr, __min_freq_mhz_show) :
+	      sysfs_gt_attribute_r_func(dev, attr, __max_freq_mhz_show);
+
+	return sysfs_emit(buff, "%u\n", (u32) val);
+}
+
+/* For now we have a static number of RP states */
+static ssize_t rps_rp_mhz_show(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buff)
+{
+	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
+	struct intel_rps *rps = &gt->rps;
+	u32 val;
+
+	if (attr == &dev_attr_gt_RP0_freq_mhz ||
+	    attr == &dev_attr_rps_RP0_freq_mhz) {
+		val = intel_rps_get_rp0_frequency(rps);
+	} else if (attr == &dev_attr_gt_RP1_freq_mhz ||
+		   attr == &dev_attr_rps_RP1_freq_mhz) {
+		   val = intel_rps_get_rp1_frequency(rps);
+	} else if (attr == &dev_attr_gt_RPn_freq_mhz ||
+		   attr == &dev_attr_rps_RPn_freq_mhz) {
+		   val = intel_rps_get_rpn_frequency(rps);
+	} else {
+		GEM_WARN_ON(1);
+		return -ENODEV;
+	}
+
+	return sysfs_emit(buff, "%d\n", val);
+}
+
+static const struct attribute * const gen6_rps_attrs[] = GEN6_RPS_ATTR;
+static const struct attribute * const gen6_gt_attrs[]  = GEN6_GT_ATTR;
+
+static int intel_sysfs_rps_init(struct intel_gt *gt, struct kobject *kobj,
+				const struct attribute * const *attrs)
+{
+	int ret;
+
+	if (GRAPHICS_VER(gt->i915) < 6)
+		return 0;
+
+	ret = sysfs_create_files(kobj, attrs);
+	if (ret)
+		return ret;
+
+	if (IS_VALLEYVIEW(gt->i915) || IS_CHERRYVIEW(gt->i915))
+		ret = sysfs_create_file(kobj, &dev_attr_vlv_rpe_freq_mhz.attr);
+
+	return ret;
+}
+
 void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj)
 {
+	int ret;
+
 	intel_sysfs_rc6_init(gt, kobj);
+
+	ret = is_object_gt(kobj) ?
+	      intel_sysfs_rps_init(gt, kobj, gen6_rps_attrs) :
+	      intel_sysfs_rps_init(gt, kobj, gen6_gt_attrs);
+	if (ret)
+		drm_warn(&gt->i915->drm,
+			 "failed to create gt%u RPS sysfs files", gt->info.id);
 }
diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
index b08a959e5ccc..0a0057940718 100644
--- a/drivers/gpu/drm/i915/i915_sysfs.c
+++ b/drivers/gpu/drm/i915/i915_sysfs.c
@@ -156,171 +156,6 @@ static const struct bin_attribute dpf_attrs_1 = {
 	.private = (void *)1
 };
 
-static ssize_t gt_act_freq_mhz_show(struct device *kdev,
-				    struct device_attribute *attr, char *buf)
-{
-	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
-	struct intel_rps *rps = &to_gt(i915)->rps;
-
-	return sysfs_emit(buf, "%d\n", intel_rps_read_actual_frequency(rps));
-}
-
-static ssize_t gt_cur_freq_mhz_show(struct device *kdev,
-				    struct device_attribute *attr, char *buf)
-{
-	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
-	struct intel_rps *rps = &to_gt(i915)->rps;
-
-	return sysfs_emit(buf, "%d\n", intel_rps_get_requested_frequency(rps));
-}
-
-static ssize_t gt_boost_freq_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
-{
-	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
-	struct intel_rps *rps = &to_gt(i915)->rps;
-
-	return sysfs_emit(buf, "%d\n", intel_rps_get_boost_frequency(rps));
-}
-
-static ssize_t gt_boost_freq_mhz_store(struct device *kdev,
-				       struct device_attribute *attr,
-				       const char *buf, size_t count)
-{
-	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
-	struct intel_rps *rps = &to_gt(dev_priv)->rps;
-	ssize_t ret;
-	u32 val;
-
-	ret = kstrtou32(buf, 0, &val);
-	if (ret)
-		return ret;
-
-	ret = intel_rps_set_boost_frequency(rps, val);
-
-	return ret ?: count;
-}
-
-static ssize_t vlv_rpe_freq_mhz_show(struct device *kdev,
-				     struct device_attribute *attr, char *buf)
-{
-	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
-	struct intel_rps *rps = &to_gt(dev_priv)->rps;
-
-	return sysfs_emit(buf, "%d\n", intel_gpu_freq(rps, rps->efficient_freq));
-}
-
-static ssize_t gt_max_freq_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
-{
-	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
-	struct intel_gt *gt = to_gt(dev_priv);
-	struct intel_rps *rps = &gt->rps;
-
-	return sysfs_emit(buf, "%d\n", intel_rps_get_max_frequency(rps));
-}
-
-static ssize_t gt_max_freq_mhz_store(struct device *kdev,
-				     struct device_attribute *attr,
-				     const char *buf, size_t count)
-{
-	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
-	struct intel_gt *gt = to_gt(dev_priv);
-	struct intel_rps *rps = &gt->rps;
-	ssize_t ret;
-	u32 val;
-
-	ret = kstrtou32(buf, 0, &val);
-	if (ret)
-		return ret;
-
-	ret = intel_rps_set_max_frequency(rps, val);
-
-	return ret ?: count;
-}
-
-static ssize_t gt_min_freq_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
-{
-	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
-	struct intel_gt *gt = to_gt(i915);
-	struct intel_rps *rps = &gt->rps;
-
-	return sysfs_emit(buf, "%d\n", intel_rps_get_min_frequency(rps));
-}
-
-static ssize_t gt_min_freq_mhz_store(struct device *kdev,
-				     struct device_attribute *attr,
-				     const char *buf, size_t count)
-{
-	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
-	struct intel_rps *rps = &to_gt(i915)->rps;
-	ssize_t ret;
-	u32 val;
-
-	ret = kstrtou32(buf, 0, &val);
-	if (ret)
-		return ret;
-
-	ret = intel_rps_set_min_frequency(rps, val);
-
-	return ret ?: count;
-}
-
-static DEVICE_ATTR_RO(gt_act_freq_mhz);
-static DEVICE_ATTR_RO(gt_cur_freq_mhz);
-static DEVICE_ATTR_RW(gt_boost_freq_mhz);
-static DEVICE_ATTR_RW(gt_max_freq_mhz);
-static DEVICE_ATTR_RW(gt_min_freq_mhz);
-
-static DEVICE_ATTR_RO(vlv_rpe_freq_mhz);
-
-static ssize_t gt_rp_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf);
-static DEVICE_ATTR(gt_RP0_freq_mhz, S_IRUGO, gt_rp_mhz_show, NULL);
-static DEVICE_ATTR(gt_RP1_freq_mhz, S_IRUGO, gt_rp_mhz_show, NULL);
-static DEVICE_ATTR(gt_RPn_freq_mhz, S_IRUGO, gt_rp_mhz_show, NULL);
-
-/* For now we have a static number of RP states */
-static ssize_t gt_rp_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
-{
-	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
-	struct intel_rps *rps = &to_gt(dev_priv)->rps;
-	u32 val;
-
-	if (attr == &dev_attr_gt_RP0_freq_mhz)
-		val = intel_rps_get_rp0_frequency(rps);
-	else if (attr == &dev_attr_gt_RP1_freq_mhz)
-		val = intel_rps_get_rp1_frequency(rps);
-	else if (attr == &dev_attr_gt_RPn_freq_mhz)
-		val = intel_rps_get_rpn_frequency(rps);
-	else
-		BUG();
-
-	return sysfs_emit(buf, "%d\n", val);
-}
-
-static const struct attribute * const gen6_attrs[] = {
-	&dev_attr_gt_act_freq_mhz.attr,
-	&dev_attr_gt_cur_freq_mhz.attr,
-	&dev_attr_gt_boost_freq_mhz.attr,
-	&dev_attr_gt_max_freq_mhz.attr,
-	&dev_attr_gt_min_freq_mhz.attr,
-	&dev_attr_gt_RP0_freq_mhz.attr,
-	&dev_attr_gt_RP1_freq_mhz.attr,
-	&dev_attr_gt_RPn_freq_mhz.attr,
-	NULL,
-};
-
-static const struct attribute * const vlv_attrs[] = {
-	&dev_attr_gt_act_freq_mhz.attr,
-	&dev_attr_gt_cur_freq_mhz.attr,
-	&dev_attr_gt_boost_freq_mhz.attr,
-	&dev_attr_gt_max_freq_mhz.attr,
-	&dev_attr_gt_min_freq_mhz.attr,
-	&dev_attr_gt_RP0_freq_mhz.attr,
-	&dev_attr_gt_RP1_freq_mhz.attr,
-	&dev_attr_gt_RPn_freq_mhz.attr,
-	&dev_attr_vlv_rpe_freq_mhz.attr,
-	NULL,
-};
-
 #if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
 
 static ssize_t error_state_read(struct file *filp, struct kobject *kobj,
@@ -411,14 +246,6 @@ void i915_setup_sysfs(struct drm_i915_private *dev_priv)
 		}
 	}
 
-	ret = 0;
-	if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv))
-		ret = sysfs_create_files(&kdev->kobj, vlv_attrs);
-	else if (GRAPHICS_VER(dev_priv) >= 6)
-		ret = sysfs_create_files(&kdev->kobj, gen6_attrs);
-	if (ret)
-		drm_err(&dev_priv->drm, "RPS sysfs setup failed\n");
-
 	dev_priv->sysfs_gt = i915_setup_gt_sysfs(&kdev->kobj);
 	if (!dev_priv->sysfs_gt)
 		drm_warn(&dev_priv->drm,
@@ -435,10 +262,6 @@ void i915_teardown_sysfs(struct drm_i915_private *dev_priv)
 
 	i915_teardown_error_capture(kdev);
 
-	if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv))
-		sysfs_remove_files(&kdev->kobj, vlv_attrs);
-	else
-		sysfs_remove_files(&kdev->kobj, gen6_attrs);
 	device_remove_bin_file(kdev,  &dpf_attrs_1);
 	device_remove_bin_file(kdev,  &dpf_attrs);
 }
-- 
2.27.0

