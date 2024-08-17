Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C4C9559BB
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 23:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECDEB10E0F5;
	Sat, 17 Aug 2024 21:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M1GWlSn4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92EEA10E0F5;
 Sat, 17 Aug 2024 21:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723928485; x=1755464485;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B9OgBmVd648VmceVYnVTJpLYOSn5iB8gtSm80epqr6k=;
 b=M1GWlSn4REsym+/sDkpCwvKe/LF3APedaAbz2ZtKxH/YLVppmHKzoS88
 r9FETe2By1S0JhFI41xYalhrzgoGJw7KvFeoZZQ1KLGUZ/EG72YWbhJ9w
 g3g5944hay9sEFRyoT5EehziwP4nNeR6hnOjZ3OB+YXwaK03ptBOtWBMH
 Xd7wR5yAZNW48nirmsB2jQ4E1HR/53EjfGtxcn9X5Ilap3/A3V9fKjUJU
 t4J+fURpglwZUwpaq2+2idERr7cPk1KVsabVnht0R/d0/jG+8i3b0oGs8
 V9YQ8J5QrpDYSMzZBpI5LnLMPN+eUTWC1F+Gq83jsLzrX1oLaOsgpSdvT g==;
X-CSE-ConnectionGUID: WhOxCBiaSkKQ3UmdkgkLrw==
X-CSE-MsgGUID: R6INVbr3TEKhId0pF6ouzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="32775436"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="32775436"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 14:01:24 -0700
X-CSE-ConnectionGUID: 3z7qy1JhSFi+5kF6BpphcA==
X-CSE-MsgGUID: caZ9TyzURUGw5dBv33e1hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="64382536"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.11])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 14:01:23 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [RFC PATCH v2 06/11] drm/i915/gt: Expose the number of total CCS
 slices
Date: Sat, 17 Aug 2024 23:00:21 +0200
Message-ID: <20240817210026.310645-7-andi.shyti@linux.intel.com>
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

Implement a sysfs interface to show the number of available CCS
slices. The displayed number does not take into account the CCS
balancing mode.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c | 24 +++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h |  1 +
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c    |  2 ++
 3 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
index 2b6d4ee7445d..49493928f714 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
@@ -5,7 +5,9 @@
 
 #include "i915_drv.h"
 #include "intel_gt_ccs_mode.h"
+#include "intel_gt_print.h"
 #include "intel_gt_regs.h"
+#include "intel_gt_sysfs.h"
 
 void intel_gt_apply_ccs_mode(struct intel_gt *gt, u32 mode)
 {
@@ -90,3 +92,25 @@ void intel_gt_ccs_mode_init(struct intel_gt *gt)
 {
 	mutex_init(&gt->ccs.mutex);
 }
+
+static ssize_t num_cslices_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buff)
+{
+	struct intel_gt *gt = kobj_to_gt(&dev->kobj);
+	u32 num_slices;
+
+	num_slices = hweight32(CCS_MASK(gt));
+
+	return sysfs_emit(buff, "%u\n", num_slices);
+}
+static DEVICE_ATTR_RO(num_cslices);
+
+void intel_gt_sysfs_ccs_init(struct intel_gt *gt)
+{
+	int err;
+
+	err = sysfs_create_file(&gt->sysfs_gt, &dev_attr_num_cslices.attr);
+	if (err)
+		gt_dbg(gt, "failed to create sysfs num_cslices files\n");
+}
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
index 0e1c43ea1d54..c60bfdb54e37 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
@@ -9,6 +9,7 @@
 #include "intel_gt.h"
 
 void intel_gt_apply_ccs_mode(struct intel_gt *gt, u32 mode);
+void intel_gt_sysfs_ccs_init(struct intel_gt *gt);
 void intel_gt_ccs_mode_init(struct intel_gt *gt);
 
 #endif /* __INTEL_GT_CCS_MODE_H__ */
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
index 33cba406b569..895eedc402ae 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
@@ -12,6 +12,7 @@
 #include "i915_drv.h"
 #include "i915_sysfs.h"
 #include "intel_gt.h"
+#include "intel_gt_ccs_mode.h"
 #include "intel_gt_print.h"
 #include "intel_gt_sysfs.h"
 #include "intel_gt_sysfs_pm.h"
@@ -101,6 +102,7 @@ void intel_gt_sysfs_register(struct intel_gt *gt)
 		goto exit_fail;
 
 	intel_gt_sysfs_pm_init(gt, &gt->sysfs_gt);
+	intel_gt_sysfs_ccs_init(gt);
 
 	return;
 
-- 
2.45.2

