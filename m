Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C86A6DB9E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 14:32:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F2210E40E;
	Mon, 24 Mar 2025 13:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lLpDr9p6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD8D10E40E;
 Mon, 24 Mar 2025 13:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742823122; x=1774359122;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=92l6FArlYG7KWJ7HEUNaMMrZ2E5B106tBpHBnZs79uU=;
 b=lLpDr9p6FNHczF1v0BlGzW9DlbTPYwGuo5oR2C5gaEFyt5CXXV0kEs3o
 E/MQuCXEkJnEC2X8f1N2V6kbiHgb84MfupKPypIDDGJS/QWu+On04uSJR
 bkUxN+cmWHpA2GDjHOFGEZyJEE//IIyisXSLHA5sgijunDfkYf1zMUaLc
 uEHP9v6Hzzwr1eOpnFD3RqFkV8FEiwamQgsEE3z4rjnZ6TBntKagaCg5E
 DNmUwnLk+x24V3GJcMS8rQsSecokIQHcViEPLS+fx77W6EGuwZyijr4en
 gCnrL6Hj3Fypx6so08IrXf74o9GdVv6svifizyrP0Svk654BGwTMCMR3E w==;
X-CSE-ConnectionGUID: 93+RGvJKSiin4YeDmLn+Hg==
X-CSE-MsgGUID: MXog9HOARhqghltVHZG6hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="66493475"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="66493475"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:32:01 -0700
X-CSE-ConnectionGUID: D0UQ/YLqSCuLac1K6jBGEQ==
X-CSE-MsgGUID: Jfb1NZdxRvWy1VN2i7580A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="123847292"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.252])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:31:57 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Arshad Mehmood <arshad.mehmood@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v4 15/15] drm/i915/gt: Allow the user to change the CCS mode
 through sysfs
Date: Mon, 24 Mar 2025 14:29:51 +0100
Message-ID: <20250324132952.1075209-16-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250324132952.1075209-1-andi.shyti@linux.intel.com>
References: <20250324132952.1075209-1-andi.shyti@linux.intel.com>
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
index cbabeb503d3b..8364523f2730 100644
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
@@ -234,7 +235,7 @@ static void __maybe_unused add_uabi_ccs_engines(struct intel_gt *gt, u32 ccs_mod
 	mutex_unlock(&i915->uabi_engines_mutex);
 }
 
-static void __maybe_unused remove_uabi_ccs_engines(struct intel_gt *gt, u8 ccs_mode)
+static void remove_uabi_ccs_engines(struct intel_gt *gt, u8 ccs_mode)
 {
 	struct drm_i915_private *i915 = gt->i915;
 	intel_engine_mask_t new_ccs_mask, tmp;
@@ -277,8 +278,85 @@ static ssize_t num_cslices_show(struct device *dev,
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
2.47.2

