Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8672EA6DB90
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 14:31:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF54110E40B;
	Mon, 24 Mar 2025 13:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="emVZDmYe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DEBB10E408;
 Mon, 24 Mar 2025 13:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742823081; x=1774359081;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P6obomOq1G54LndOsjqHUJjRv+uJYxQbnF88ybgHZm4=;
 b=emVZDmYedn7IV/n6T8dUSDS5OrTwXNimhvNkyRODgCad2XcBZ//CwShy
 ehu9g9zZqG93N9t9is2lMCHJhvmAi5zCcwbT/qvstDai+1lmZrAFFKlhv
 87BnltOEWuwxpCQKJCL9PY7XTPEacLD4My2W3VbPuTWsK5NdlNbe68d/o
 6SwwkyeiXdKoe5d1Vfxb17ppDYr5ru8AD68lIvLx3IfH8a+vhiew7dy9m
 oIifj97MAZ1wpII8FiGyqG3YQ3NSxTsAOocrDBE2f8yKTy7Mp9f79pNz0
 t90Qw8GflcJQfd4HMv7e8kKng84aHydYezBomwmFe5x+GFElZ9WdwTu07 g==;
X-CSE-ConnectionGUID: SZoOqmuPQsqCCtBCQZuQxg==
X-CSE-MsgGUID: TCyOQW3GSJeA+b0lB/oX6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="55024708"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="55024708"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:31:21 -0700
X-CSE-ConnectionGUID: rwpgbpgLSAWZQIHeD0aBPA==
X-CSE-MsgGUID: /9OC9LZWSvyLWK0RubOLkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="155060079"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.252])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:31:17 -0700
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
Subject: [PATCH v4 09/15] drm/i915/gt: Expose the number of total CCS slices
Date: Mon, 24 Mar 2025 14:29:45 +0100
Message-ID: <20250324132952.1075209-10-andi.shyti@linux.intel.com>
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
index fc8a23fc28b6..edb6a4b63826 100644
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
@@ -100,3 +102,22 @@ void intel_gt_ccs_mode_init(struct intel_gt *gt)
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
2.47.2

