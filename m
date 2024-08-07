Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB1A94A3B4
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 11:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95DA410E465;
	Wed,  7 Aug 2024 09:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kQE1QIRv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5ED210E058;
 Wed,  7 Aug 2024 09:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723021852; x=1754557852;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nku2VyyAlaFbHebRPyXL2hKd7GvPsaxYnBfga0f8rZ0=;
 b=kQE1QIRvtzrRCTzem5yYnGtGltubaL/RPxbBhdMK6ZWA9+OkxuyXO7Vg
 DGUyqMlUoVIdZZPtT+OK+rm4Sa+rz4Y/hiPsH/CncxPg2r9Y6+OWQ0it7
 dtwcHWXCcY63m71kTVyffEktNnjSNVmaRuuxDRiFlQYsHxkU5DXsZClF7
 5NZzC4eADymLW2YtBfD4z87EtPT9sc2jDfKSWSg3QwTtuK5mO92x39NzV
 1qd8SR8i2TpyLq6OSmtuhggjyzepAGOIGNv1soCoXFIue4jUIymTXmxC5
 ZY2+bObAtT325BJqgEQKMzDflCPkWJ9HJhnX6UPnd3iyEGk+Z78MqQIzZ A==;
X-CSE-ConnectionGUID: 7NjMmtXGRXm+cyXCdUa2hg==
X-CSE-MsgGUID: B92EGiviQ+KCalU4ic7TZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="24842651"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="24842651"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 02:10:50 -0700
X-CSE-ConnectionGUID: +l3obtpaTNGoFvm0B+WWhg==
X-CSE-MsgGUID: YAf8rwaeSlukd/xpdRPjtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="60914853"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.244.232])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 02:10:48 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH] drm/i915/gt: Mark the GT as dead when mmio is unreliable
Date: Wed,  7 Aug 2024 10:10:14 +0100
Message-ID: <20240807091014.469992-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
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

From: Chris Wilson <chris.p.wilson@intel.com>

After we detect that mmio is returning all 0xff, we believe that the GPU
has dropped off the pci bus and is dead. Mark the device as wedged such
that we can propagate the failure back to userspace and wait for
recovery.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.h       |  6 ++++++
 drivers/gpu/drm/i915/gt/intel_gt_types.h |  2 ++
 drivers/gpu/drm/i915/gt/intel_reset.c    | 12 +++++++++++-
 drivers/gpu/drm/i915/intel_uncore.c      |  7 +++++--
 4 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
index b5e114d284ad..b73555889d50 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -208,4 +208,10 @@ enum i915_map_type intel_gt_coherent_map_type(struct intel_gt *gt,
 void intel_gt_bind_context_set_ready(struct intel_gt *gt);
 void intel_gt_bind_context_set_unready(struct intel_gt *gt);
 bool intel_gt_is_bind_context_ready(struct intel_gt *gt);
+
+static inline void intel_gt_set_wedged_async(struct intel_gt *gt)
+{
+	queue_work(system_highpri_wq, &gt->wedge);
+}
+
 #endif /* __INTEL_GT_H__ */
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index cfdd2ad5e954..bcee084b1f27 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -292,6 +292,8 @@ struct intel_gt {
 	struct gt_defaults defaults;
 	struct kobject *sysfs_defaults;
 
+	struct work_struct wedge;
+
 	struct i915_perf_gt perf;
 
 	/** link: &ggtt.gt_list */
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 735cd23a43c6..8f1ea95471ef 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -1013,6 +1013,15 @@ static void __intel_gt_set_wedged(struct intel_gt *gt)
 	GT_TRACE(gt, "end\n");
 }
 
+static void set_wedged_work(struct work_struct *w)
+{
+	struct intel_gt *gt = container_of(w, struct intel_gt, wedge);
+	intel_wakeref_t wf;
+
+	with_intel_runtime_pm(gt->uncore->rpm, wf)
+		__intel_gt_set_wedged(gt);
+}
+
 void intel_gt_set_wedged(struct intel_gt *gt)
 {
 	intel_wakeref_t wakeref;
@@ -1614,6 +1623,7 @@ void intel_gt_init_reset(struct intel_gt *gt)
 	init_waitqueue_head(&gt->reset.queue);
 	mutex_init(&gt->reset.mutex);
 	init_srcu_struct(&gt->reset.backoff_srcu);
+	INIT_WORK(&gt->wedge, set_wedged_work);
 
 	/*
 	 * While undesirable to wait inside the shrinker, complain anyway.
@@ -1640,7 +1650,7 @@ static void intel_wedge_me(struct work_struct *work)
 	struct intel_wedge_me *w = container_of(work, typeof(*w), work.work);
 
 	gt_err(w->gt, "%s timed out, cancelling all in-flight rendering.\n", w->name);
-	intel_gt_set_wedged(w->gt);
+	set_wedged_work(&w->gt->wedge);
 }
 
 void __intel_init_wedge(struct intel_wedge_me *w,
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 2eba289d88ad..6aa179a3e92a 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -24,6 +24,7 @@
 #include <drm/drm_managed.h>
 #include <linux/pm_runtime.h>
 
+#include "gt/intel_gt.h"
 #include "gt/intel_engine_regs.h"
 #include "gt/intel_gt_regs.h"
 
@@ -180,14 +181,16 @@ fw_domain_wait_ack_clear(const struct intel_uncore_forcewake_domain *d)
 	if (!wait_ack_clear(d, FORCEWAKE_KERNEL))
 		return;
 
-	if (fw_ack(d) == ~0)
+	if (fw_ack(d) == ~0) {
 		drm_err(&d->uncore->i915->drm,
 			"%s: MMIO unreliable (forcewake register returns 0xFFFFFFFF)!\n",
 			intel_uncore_forcewake_domain_to_str(d->id));
-	else
+		intel_gt_set_wedged_async(d->uncore->gt);
+	} else {
 		drm_err(&d->uncore->i915->drm,
 			"%s: timed out waiting for forcewake ack to clear.\n",
 			intel_uncore_forcewake_domain_to_str(d->id));
+	}
 
 	add_taint_for_CI(d->uncore->i915, TAINT_WARN); /* CI now unreliable */
 }
-- 
2.45.2

