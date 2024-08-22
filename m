Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A703D95BD3C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 19:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C70910EB96;
	Thu, 22 Aug 2024 17:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NyLyAXM3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF8A10EB93;
 Thu, 22 Aug 2024 17:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724347773; x=1755883773;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jEGYw4KyKdqhB83EaX+pdmWXrOyBplimR5b19OZt8zY=;
 b=NyLyAXM3b2Q6465RprH88DT3IT0FBwhg08aMCqbJGnIoIR7kwiAkA8ny
 IAkN8zhRq1J/7R/mMvPvwkeZGJv/3mUlHv7PcrLcw7a8LcUC5nTLnoOCv
 3piYUFXUvAEkKzPzb6CsNMQqweIyTRlorQz76PdL6WnKXMKlToRNP1GsE
 ieYsCwCTlzZU3Mu/GIeV7fWV2p3u/r/v0YAu/sFiDNDfHV/6xCJLgt0bH
 XCp0k3Qxnw7GJ18265YuJiJjEXkl6wSV/BZ1CBbV0kDJBjqbVjiEN5MHP
 RzjpQj/vxztHRhG8ga7s706bPETXLS6rtuGCylm65/cexH35ZaKS+EMJp g==;
X-CSE-ConnectionGUID: ppuVzeFZQ+mtnFrjBwtb6g==
X-CSE-MsgGUID: l1SgXmb9RuisLaA3v1rnTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22935376"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="22935376"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 10:29:33 -0700
X-CSE-ConnectionGUID: rxuCELzvQt6DCklQZWKCSA==
X-CSE-MsgGUID: oJQqyj8GQ0OVV8qyGuJ+1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="84706408"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.104])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 10:29:31 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v2 09/15] drm/i915/gt: Expose the number of total CCS slices
Date: Thu, 22 Aug 2024 19:28:26 +0200
Message-ID: <20240822172832.494994-10-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240822172832.494994-1-andi.shyti@linux.intel.com>
References: <20240822172832.494994-1-andi.shyti@linux.intel.com>
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
2.45.2

