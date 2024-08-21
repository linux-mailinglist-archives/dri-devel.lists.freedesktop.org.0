Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95971959C41
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 14:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E951C10E901;
	Wed, 21 Aug 2024 12:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ru6zmtBW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF3110E901;
 Wed, 21 Aug 2024 12:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724244339; x=1755780339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i41+sMUZ446YXE/yYL8yUaZnjB+K7nLkyeorA0pQGtQ=;
 b=Ru6zmtBWlKUyso81ERQY58qCW7zPqUTM3acvNDwEZoOSNOTaUF7+Qjyh
 4OP8Q5Fs5MQs//pdnqFytJHD/Fv1/GqukGoVAAo7yN9uVEA98fKvvFF6Q
 w9HDwZALB5Q6ac9AnWQdEgW5jUZfQzZ8qnll6plLNcEBNhZLX4rJrQzHl
 nT3UQRNsCrZZzCm4sTo4e0ZltuFrediJN3ZU7dQ2CC0uVa7JvL0sMe40v
 e9rXti+uPzePUQeOHjIHt92P6BtLYmJeVIH0P4+2E2KhJWtFCXNAoCwD2
 Bknkgk0tMY3W/O+8BOGRYBMFHro1Jz0+eVpJnMszTzOdlkwxfjRGPW/qa g==;
X-CSE-ConnectionGUID: eSKsigPIS7WtdmoVBmbKxQ==
X-CSE-MsgGUID: ItqSWTE6QXCtk/eHKX6Cyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="40059790"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="40059790"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 05:45:39 -0700
X-CSE-ConnectionGUID: ovQTO5/RSs+Mh7sWWGGlMw==
X-CSE-MsgGUID: RLlIARBPRzW1vw9NZde2pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61052311"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.24])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 05:45:38 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v1 14/14] drm/i915/gt: Allow the user to change the CCS mode
 through sysfs
Date: Wed, 21 Aug 2024 14:43:49 +0200
Message-ID: <20240821124349.295259-15-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240821124349.295259-1-andi.shyti@linux.intel.com>
References: <20240821124349.295259-1-andi.shyti@linux.intel.com>
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
index 82de29eb4dd7..ffdcc98b0802 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
@@ -5,6 +5,7 @@
 
 #include "i915_drv.h"
 #include "intel_gt_ccs_mode.h"
+#include "intel_gt_pm.h"
 #include "intel_gt_print.h"
 #include "intel_gt_regs.h"
 #include "intel_gt_sysfs.h"
@@ -160,7 +161,7 @@ static int rb_engine_cmp(struct rb_node *rb_new, const struct rb_node *rb_old)
 	return new->uabi_instance - old->uabi_instance;
 }
 
-static void __maybe_unused add_uabi_ccs_engines(struct intel_gt *gt, u32 ccs_mode)
+static void add_uabi_ccs_engines(struct intel_gt *gt, u32 ccs_mode)
 {
 	struct drm_i915_private *i915 = gt->i915;
 	intel_engine_mask_t new_ccs_mask, tmp;
@@ -194,7 +195,7 @@ static void __maybe_unused add_uabi_ccs_engines(struct intel_gt *gt, u32 ccs_mod
 	}
 }
 
-static void __maybe_unused remove_uabi_ccs_engines(struct intel_gt *gt, u8 ccs_mode)
+static void remove_uabi_ccs_engines(struct intel_gt *gt, u8 ccs_mode)
 {
 	struct drm_i915_private *i915 = gt->i915;
 	intel_engine_mask_t new_ccs_mask, tmp;
@@ -240,8 +241,85 @@ static ssize_t num_cslices_show(struct device *dev,
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

