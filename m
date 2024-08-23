Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2181A95CD5C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 15:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D98B10E7A8;
	Fri, 23 Aug 2024 13:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SkPCeoiJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D898E10E7D4;
 Fri, 23 Aug 2024 13:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724418648; x=1755954648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cz4MLsNxdEVm31jcygokO3wgjvaSo4pRbLsggfLiaeM=;
 b=SkPCeoiJ+VSVDGNQa/gA693OlJe4EjFKyAOvPNEF1rr2C4fIfGhGAxfZ
 LesKguP63jDFTXpJeaHa9FTEOFl/OMJi01/7vojbP7NNg8ECwSz5Ja9bp
 Zs0DcH1qmPCZV3uJKH6Vs4AoGfJZJrOM8WFfXCmhVr46BKVne8oWMqvWA
 E2xeEVepxIEdP8WVAE2Dd5NWs2+8qgLjx8Z7Er1x9eMZ7gCX2I+jdNfBp
 sxj4Sg8sxhBM2dbLccq02wXoM2xjch0HNKvkY4mwm/IHn3gwkZYJ4qaDx
 VPH53wG+Arig3/akGkYywn7H/m22z4nKotKJtxsfH1VgYS4/tdzQ8uA5N w==;
X-CSE-ConnectionGUID: cImFXoxTQF2vI/dfgYYu3g==
X-CSE-MsgGUID: /DwT/F2VTKqqBsp/1LvKbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23055312"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="23055312"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 06:10:47 -0700
X-CSE-ConnectionGUID: 7/1CnSf9SjeYgn0q81Qpeg==
X-CSE-MsgGUID: R1/9VtwKS/iBJIhTU3W1Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="65999459"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.236])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 06:10:45 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v3 15/15] drm/i915/gt: Allow the user to change the CCS mode
 through sysfs
Date: Fri, 23 Aug 2024 15:08:55 +0200
Message-ID: <20240823130855.72436-16-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240823130855.72436-1-andi.shyti@linux.intel.com>
References: <20240823130855.72436-1-andi.shyti@linux.intel.com>
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
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c | 82 ++++++++++++++++++++-
 1 file changed, 80 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
index cc46ee9dea3f..1ed6153ff8cf 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
@@ -6,6 +6,7 @@
 #include "i915_drv.h"
 #include "intel_engine_user.h"
 #include "intel_gt_ccs_mode.h"
+#include "intel_gt_pm.h"
 #include "intel_gt_print.h"
 #include "intel_gt_regs.h"
 #include "intel_gt_sysfs.h"
@@ -172,7 +173,7 @@ static int rb_engine_cmp(struct rb_node *rb_new, const struct rb_node *rb_old)
 	return new->uabi_class - old->uabi_class;
 }
 
-static void __maybe_unused add_uabi_ccs_engines(struct intel_gt *gt, u32 ccs_mode)
+static void add_uabi_ccs_engines(struct intel_gt *gt, u32 ccs_mode)
 {
 	struct drm_i915_private *i915 = gt->i915;
 	intel_engine_mask_t new_ccs_mask, tmp;
@@ -230,7 +231,7 @@ static void __maybe_unused add_uabi_ccs_engines(struct intel_gt *gt, u32 ccs_mod
 	mutex_unlock(&i915->uabi_engines_mutex);
 }
 
-static void __maybe_unused remove_uabi_ccs_engines(struct intel_gt *gt, u8 ccs_mode)
+static void remove_uabi_ccs_engines(struct intel_gt *gt, u8 ccs_mode)
 {
 	struct drm_i915_private *i915 = gt->i915;
 	intel_engine_mask_t new_ccs_mask, tmp;
@@ -273,8 +274,85 @@ static ssize_t num_cslices_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(num_cslices);
 
+static ssize_t ccs_mode_show(struct device *dev,
+			     struct device_attribute *attr, char *buff)
+{
+	struct intel_gt *gt = kobj_to_gt(&dev->kobj);
+	u32 ccs_mode;
+
+	ccs_mode = hweight32(gt->ccs.id_mask);
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
+	int ccs_mode = hweight32(gt->ccs.id_mask);
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
+	if (!val || val > num_cslices || (num_cslices % val))
+		return -EINVAL;
+
+	/* Let's wait until the GT is no longer in use */
+	ret = intel_gt_pm_wait_for_idle(gt);
+	if (ret)
+		return ret;
+
+	mutex_lock(&gt->wakeref.mutex);
+
+	/*
+	 * Let's check again that the GT is idle,
+	 * we don't want to change the CCS mode
+	 * while someone is using the GT
+	 */
+	if (intel_gt_pm_is_awake(gt)) {
+		ret = -EBUSY;
+		goto out;
+	}
+
+	/*
+	 * Nothing to do if the requested setting
+	 * is the same as the current one
+	 */
+	if (val == ccs_mode)
+		goto out;
+	else if (val > ccs_mode)
+		add_uabi_ccs_engines(gt, val);
+	else
+		remove_uabi_ccs_engines(gt, val);
+
+out:
+	mutex_unlock(&gt->wakeref.mutex);
+
+	return ret ?: count;
+}
+static DEVICE_ATTR_RW(ccs_mode);
+
 void intel_gt_sysfs_ccs_init(struct intel_gt *gt)
 {
 	if (sysfs_create_file(&gt->sysfs_gt, &dev_attr_num_cslices.attr))
 		gt_warn(gt, "Failed to create sysfs num_cslices files\n");
+
+	/*
+	 * Do not create the ccs_mode file for non DG2 platforms
+	 * because they don't need it as they have only one CCS engine
+	 */
+	if (!IS_DG2(gt->i915))
+		return;
+
+	if (sysfs_create_file(&gt->sysfs_gt, &dev_attr_ccs_mode.attr))
+		gt_warn(gt, "Failed to create sysfs ccs_mode files\n");
 }
-- 
2.45.2

