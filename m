Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4719B668994
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 03:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE2310E974;
	Fri, 13 Jan 2023 02:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A798D10E973;
 Fri, 13 Jan 2023 02:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673576844; x=1705112844;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PYgY6k1kTTStNwoUMDiYP1M83i0HrE0B+rIMCGib/b0=;
 b=C8eLFbhMK5hDMAj6osfY6OoJOHda5UftINGMNELnpgfkdKb/QJH5cRaQ
 yofGDest37Ml2kh/spS+VmT+igAHAE46ja/fihrmJlLKBC20n3js6xabA
 +vDF17aK40yMEooYt2scB/Lgv8qxSkj6iKb7i5ccsJg/2WC4AjhWb4wOW
 W7sJqeYSAmmHFYe9io+Khm08uR8dy3ueqdnLJjSuhdObmKvM6xAjO6kxv
 IqROSyBEf7nKbWLAn/IqN4lJDWTfjAIwU3WA9hJTBjOfFfZ3h8MX1rbeF
 RSteriCjGB/HS9OvlxknDcsS1cahzX/RD9+/uNABadivfuFSQtx7HHwBZ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="322591934"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; d="scan'208";a="322591934"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 18:27:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="746777726"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; d="scan'208";a="746777726"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Jan 2023 18:27:23 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/mtl: Connect root sysfs entries to GT0
Date: Thu, 12 Jan 2023 18:27:52 -0800
Message-Id: <20230113022752.3151066-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reading current root sysfs entries gives a min/max of all
GTs. Updating this so we return default (GT0) values when root
level sysfs entries are accessed, instead of min/max for the card.
Tests that are not multi GT capable will read incorrect sysfs
values without this change on multi-GT platforms like MTL.

Fixes: a8a4f0467d70 ("drm/i915: Fix CFI violations in gt_sysfs")

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 47 +++------------------
 1 file changed, 6 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
index cf71305ad586..395ae47483a7 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
@@ -28,77 +28,42 @@ sysfs_gt_attribute_w_func(struct kobject *kobj, struct attribute *attr,
 			  int (func)(struct intel_gt *gt, u32 val), u32 val)
 {
 	struct intel_gt *gt;
-	int ret;
 
 	if (!is_object_gt(kobj)) {
-		int i;
 		struct device *dev = kobj_to_dev(kobj);
 		struct drm_i915_private *i915 = kdev_minor_to_i915(dev);
 
-		for_each_gt(gt, i915, i) {
-			ret = func(gt, val);
-			if (ret)
-				break;
-		}
+		gt = to_gt(i915);
 	} else {
 		gt = intel_gt_sysfs_get_drvdata(kobj, attr->name);
-		ret = func(gt, val);
 	}
 
-	return ret;
+	return func(gt, val);
 }
 
 static u32
 sysfs_gt_attribute_r_func(struct kobject *kobj, struct attribute *attr,
-			  u32 (func)(struct intel_gt *gt),
-			  enum intel_gt_sysfs_op op)
+			  u32 (func)(struct intel_gt *gt))
 {
 	struct intel_gt *gt;
-	u32 ret;
-
-	ret = (op == INTEL_GT_SYSFS_MAX) ? 0 : (u32) -1;
 
 	if (!is_object_gt(kobj)) {
-		int i;
 		struct device *dev = kobj_to_dev(kobj);
 		struct drm_i915_private *i915 = kdev_minor_to_i915(dev);
 
-		for_each_gt(gt, i915, i) {
-			u32 val = func(gt);
-
-			switch (op) {
-			case INTEL_GT_SYSFS_MIN:
-				if (val < ret)
-					ret = val;
-				break;
-
-			case INTEL_GT_SYSFS_MAX:
-				if (val > ret)
-					ret = val;
-				break;
-			}
-		}
+		gt = to_gt(i915);
 	} else {
 		gt = intel_gt_sysfs_get_drvdata(kobj, attr->name);
-		ret = func(gt);
 	}
 
-	return ret;
+	return func(gt);
 }
 
-/* RC6 interfaces will show the minimum RC6 residency value */
-#define sysfs_gt_attribute_r_min_func(d, a, f) \
-		sysfs_gt_attribute_r_func(d, a, f, INTEL_GT_SYSFS_MIN)
-
-/* Frequency interfaces will show the maximum frequency value */
-#define sysfs_gt_attribute_r_max_func(d, a, f) \
-		sysfs_gt_attribute_r_func(d, a, f, INTEL_GT_SYSFS_MAX)
-
 #define INTEL_GT_SYSFS_SHOW(_name, _attr_type)							\
 	static ssize_t _name##_show_common(struct kobject *kobj,				\
 					   struct attribute *attr, char *buff)			\
 	{											\
-		u32 val = sysfs_gt_attribute_r_##_attr_type##_func(kobj, attr,			\
+		u32 val = sysfs_gt_attribute_r_func(kobj, attr,			\
 								   __##_name##_show);		\
 												\
 		return sysfs_emit(buff, "%u\n", val);						\
-- 
2.38.1

