Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4BF959C36
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 14:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C785410E8F9;
	Wed, 21 Aug 2024 12:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XA4OiTBS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4AD10E8F9;
 Wed, 21 Aug 2024 12:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724244311; x=1755780311;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PP7eZ/Fk5eBZbLx6RVVsYVsWOwNVNlT3GGifE/xIu48=;
 b=XA4OiTBS0VtKZevc9VD7dxJZtjxFh61LLeF09/g8eEiTSAW0NH2a2AEc
 4vyY0MYZXMAXTv9WIJvmn3naUEQcgIdQ1yVrsaQboGILQrfgh7V2JVt5t
 /+STxZM9GC1bQR0JadFLjCCzdXbzjlkzRDPVBWSvvoiOqVYvAxOYiTmjz
 zEzhlTy7T5JBpq+ijlLC3UJ1kz4aBhVZ0RU4zt9KrWBejeqPZzWRJHcd1
 +juPst9njHrJ2YoBOc6Bvvy3t5wGcOHF7ybUGlHZ8urZR2mh1H4xswil+
 /I1FTpaZjBUK3IwLaRsMKf37GiarsWN/0SAsYMnfcOTN0XEtQpK12kPjN g==;
X-CSE-ConnectionGUID: KeRqssgLRU2L379EAOi1JQ==
X-CSE-MsgGUID: kVnJJt9sQqW+BOdtoQ9zpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="26395415"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="26395415"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 05:45:11 -0700
X-CSE-ConnectionGUID: u4G2rCa1Tp6WdCngNIaEVQ==
X-CSE-MsgGUID: r9ddAbhJTOmrpGsdf9ADmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="66038744"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.24])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 05:45:07 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v1 09/14] drm/i915/gt: Expose the number of total CCS slices
Date: Wed, 21 Aug 2024 14:43:44 +0200
Message-ID: <20240821124349.295259-10-andi.shyti@linux.intel.com>
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

Implement a sysfs interface to show the number of available CCS
slices. The displayed number does not take into account the CCS
balancing mode.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h |  1 +
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c    |  2 ++
 3 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
index f0319278a5fc..ed3ad881a89d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
@@ -5,7 +5,9 @@
 
 #include "i915_drv.h"
 #include "intel_gt_ccs_mode.h"
+#include "intel_gt_print.h"
 #include "intel_gt_regs.h"
+#include "intel_gt_sysfs.h"
 
 static void intel_gt_apply_ccs_mode(struct intel_gt *gt)
 {
@@ -95,3 +97,22 @@ void intel_gt_ccs_mode_init(struct intel_gt *gt)
 	/* Initialize the CCS mode setting */
 	intel_gt_apply_ccs_mode(gt);
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
+	if (sysfs_create_file(&gt->sysfs_gt, &dev_attr_num_cslices.attr))
+		gt_warn(gt, "Failed to create sysfs num_cslices files\n");
+}
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
index 4a6763b95a78..9696cc9017f6 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
@@ -9,5 +9,6 @@
 #include "intel_gt.h"
 
 void intel_gt_ccs_mode_init(struct intel_gt *gt);
+void intel_gt_sysfs_ccs_init(struct intel_gt *gt);
 
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

