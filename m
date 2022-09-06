Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 385C75AF894
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 01:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F205810E0A7;
	Tue,  6 Sep 2022 23:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739DC10E09B;
 Tue,  6 Sep 2022 23:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662508186; x=1694044186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CMOquIblwcmBq+LtJA9qQfr2YbFYK74stanUsvVWnow=;
 b=G74O1j1ldM2I6AdhuJCc+dS3X7FRHFAmJu++yLC0rB5elZb5/+yrgbYC
 b1hmM/kw7fVWowgQljrCLMy8pYjLtJ7Tmxs/BdGXzve0HsH2dCTmSJae/
 Z8kSZ4J07l34zU0Mpm25Wi0eznEgDrObE8g4iZ+xgvekz3KutxDGS9Btj
 1kY+tRigRyA9L0QiFDLFDflLTGico3sKajZHOFAxAfkyUc8j8rwhxnOSd
 hYj6G8cgtP/ZufdKPMb0uKNV9Oj4r8ZRKJAuGWJHAXNBuJ0gkhpOeeTmK
 AmvuaNz7kH/i0h28Pw8RtzzwUSsXmbrNeuxZ6FxNe0qmaBsr+AMxseHDm g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="276477207"
X-IronPort-AV: E=Sophos;i="5.93,295,1654585200"; d="scan'208";a="276477207"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 16:49:45 -0700
X-IronPort-AV: E=Sophos;i="5.93,295,1654585200"; d="scan'208";a="675920316"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 16:49:45 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 04/14] drm/i915: Drop intel_gt_tile_cleanup()
Date: Tue,  6 Sep 2022 16:49:24 -0700
Message-Id: <20220906234934.3655440-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906234934.3655440-1-matthew.d.roper@intel.com>
References: <20220906234934.3655440-1-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unmapping of the MMIO range can be done as a DRM-managed action, which
will take care of the unmapping on device teardown and error paths.
This will also ensure proper ordering with respect to other DRM-managed
actions that we'll be using to clean up non-primary GTs in upcoming
patches.

We have not yet enabled any non-root GTs in the driver yet, so the
kfree() of the GT structure is effectively dead code.  When we do start
enabling non-root GTs in upcoming patches, those are going to be using
DRM-managed allocations tied to the device lifetime, so we don't need to
explicitly free them (and kfree would be incorrect anyway).

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c  | 13 +------------
 drivers/gpu/drm/i915/intel_uncore.c | 13 +++++++------
 2 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index cf7aab7adb30..663a4798fb2e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -803,15 +803,6 @@ static int intel_gt_tile_setup(struct intel_gt *gt, phys_addr_t phys_addr)
 	return 0;
 }
 
-static void
-intel_gt_tile_cleanup(struct intel_gt *gt)
-{
-	intel_uncore_cleanup_mmio(gt->uncore);
-
-	if (!gt_is_root(gt))
-		kfree(gt);
-}
-
 int intel_gt_probe_all(struct drm_i915_private *i915)
 {
 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
@@ -858,10 +849,8 @@ void intel_gt_release_all(struct drm_i915_private *i915)
 	struct intel_gt *gt;
 	unsigned int id;
 
-	for_each_gt(gt, i915, id) {
-		intel_gt_tile_cleanup(gt);
+	for_each_gt(gt, i915, id)
 		i915->gt[id] = NULL;
-	}
 }
 
 void intel_gt_info_print(const struct intel_gt_info *info,
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 6841f76533f9..2a32f8a65f34 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -21,6 +21,7 @@
  * IN THE SOFTWARE.
  */
 
+#include <drm/drm_managed.h>
 #include <linux/pm_runtime.h>
 
 #include "gt/intel_engine_regs.h"
@@ -2232,6 +2233,11 @@ static int i915_pmic_bus_access_notifier(struct notifier_block *nb,
 	return NOTIFY_OK;
 }
 
+static void uncore_unmap_mmio(struct drm_device *drm, void *regs)
+{
+	iounmap(regs);
+}
+
 int intel_uncore_setup_mmio(struct intel_uncore *uncore, phys_addr_t phys_addr)
 {
 	struct drm_i915_private *i915 = uncore->i915;
@@ -2260,12 +2266,7 @@ int intel_uncore_setup_mmio(struct intel_uncore *uncore, phys_addr_t phys_addr)
 		return -EIO;
 	}
 
-	return 0;
-}
-
-void intel_uncore_cleanup_mmio(struct intel_uncore *uncore)
-{
-	iounmap(uncore->regs);
+	return drmm_add_action_or_reset(&i915->drm, uncore_unmap_mmio, uncore->regs);
 }
 
 void intel_uncore_init_early(struct intel_uncore *uncore,
-- 
2.37.2

