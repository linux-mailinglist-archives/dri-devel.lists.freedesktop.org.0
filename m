Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 700D49559C5
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 23:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFEE10E10C;
	Sat, 17 Aug 2024 21:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="liwhxYAl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0254410E10C;
 Sat, 17 Aug 2024 21:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723928518; x=1755464518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wIFId5pp1jNYbY1a9rImTmXAne/K5pRvevxYFOVM2V4=;
 b=liwhxYAl1lh6vIa2cpdhYUogS6XZygxkSuCXdu03AAfR5i4miQsKWVQ4
 fm+yY+f2Y8RGMiKdasOyQYRr1VnJzdJng0oVV4zd91IJMCkrzBkgA9R+r
 rGRg5YD7mUfKOPIVeTfO8Dp0JEYlRgwPP9/RxR0B6lgVdj/mf4EzOrPJc
 0tf+6C97ZiI/F3IFjuEX7WMf/A94yx5kkIYaZzHXpr8kyYsx6lCkbqaqY
 PAvi6vG7BKVDmzuS2fWnrCyaNeYx15E/x7ldcU2blSt3bdrNWdec0NGAp
 XoYHeXZ8UuuNADTNHX6Ve21KfuqXBnLcCavIqWlqtlTXQkJZ0D85GwYrB Q==;
X-CSE-ConnectionGUID: eRGrGx45Tn2vyxOe86CY4Q==
X-CSE-MsgGUID: kL2sT4u7TV+jh3yT4Q7fdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="25997146"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="25997146"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 14:01:57 -0700
X-CSE-ConnectionGUID: oG3bBlsFQRif2nubi48UFA==
X-CSE-MsgGUID: JLiBBVSdRbiuegsBLiYCuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="97489209"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.11])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 14:01:54 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [RFC PATCH v2 11/11] drm/i915/gt: Allow the user to change the CCS
 mode through sysfs
Date: Sat, 17 Aug 2024 23:00:26 +0200
Message-ID: <20240817210026.310645-12-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240817210026.310645-1-andi.shyti@linux.intel.com>
References: <20240817210026.310645-1-andi.shyti@linux.intel.com>
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

Create the 'ccs_mode' file under

/sys/class/drm/cardX/gt/gt0/ccs_mode

This file allows the user to read and set the current CCS mode.

 - Reading: The user can read the current CCS mode, which can be
   1, 2, or 4. This value is derived from the current engine
   mask.

 - Writing: The user can set the CCS mode to 1, 2, or 4,
   depending on the desired number of exposed engines and the
   required load balancing.

The interface will return -EBUSY if other clients are connected
to i915, or -EINVAL if an invalid value is set.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c | 74 +++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
index b1c3c9d9bb4f..30393009bc43 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
@@ -5,6 +5,7 @@
 
 #include "i915_drv.h"
 #include "intel_gt_ccs_mode.h"
+#include "intel_gt_pm.h"
 #include "intel_gt_print.h"
 #include "intel_gt_regs.h"
 #include "intel_gt_sysfs.h"
@@ -206,6 +207,68 @@ static ssize_t num_cslices_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(num_cslices);
 
+static ssize_t ccs_mode_show(struct device *dev,
+			     struct device_attribute *attr, char *buff)
+{
+	struct intel_gt *gt = kobj_to_gt(&dev->kobj);
+	u32 ccs_mode;
+
+	ccs_mode = hweight32(gt->ccs.ccs_mask);
+
+	return sysfs_emit(buff, "%u\n", ccs_mode);
+}
+
+static ssize_t ccs_mode_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buff, size_t count)
+{
+	struct intel_gt *gt = kobj_to_gt(&dev->kobj);
+	int num_cslices = hweight32(CCS_MASK(gt));
+	int ccs_mode = hweight32(gt->ccs.ccs_mask);
+	ssize_t ret;
+	u32 val;
+
+	ret = kstrtou32(buff, 0, &val);
+	if (ret)
+		return ret;
+
+	/*
+	 * As of now possible values to be set are 1, 2, 4,
+	 * up to the maximum number of available slices
+	 */
+	if ((!val) || (val > num_cslices) || (num_cslices % val))
+		return -EINVAL;
+
+	/*
+	 * We don't want to change the CCS
+	 * mode while someone is using the GT
+	 */
+	if (intel_gt_pm_is_awake(gt))
+		return -EBUSY;
+
+	mutex_lock(&gt->wakeref.mutex);
+	mutex_lock(&gt->ccs.mutex);
+
+	/*
+	 * Nothing to do if the requested setting
+	 * is the same as the current one
+	 */
+	if (val == ccs_mode)
+		return count;
+	else if (val > ccs_mode)
+		add_uabi_ccs_engines(gt, val);
+	else
+		remove_uabi_ccs_engines(gt, val);
+
+	intel_gt_apply_ccs_mode(gt, val);
+
+	mutex_unlock(&gt->ccs.mutex);
+	mutex_unlock(&gt->wakeref.mutex);
+
+	return count;
+}
+static DEVICE_ATTR_RW(ccs_mode);
+
 void intel_gt_sysfs_ccs_init(struct intel_gt *gt)
 {
 	int err;
@@ -213,4 +276,15 @@ void intel_gt_sysfs_ccs_init(struct intel_gt *gt)
 	err = sysfs_create_file(&gt->sysfs_gt, &dev_attr_num_cslices.attr);
 	if (err)
 		gt_dbg(gt, "failed to create sysfs num_cslices files\n");
+
+	/*
+	 * Do not create the ccs_mode file for non DG2 platforms
+	 * because they don't need it as they have only one CCS engine
+	 */
+	if (!IS_DG2(gt->i915))
+		return;
+
+	err = sysfs_create_file(&gt->sysfs_gt, &dev_attr_ccs_mode.attr);
+	if (err)
+		gt_dbg(gt, "failed to create sysfs ccs_mode files\n");
 }
-- 
2.45.2

