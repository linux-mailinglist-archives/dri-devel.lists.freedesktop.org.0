Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 836917EB4AD
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 17:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E9610E46C;
	Tue, 14 Nov 2023 16:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A6E10E480;
 Tue, 14 Nov 2023 16:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699978973; x=1731514973;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0Xb5RtL4MOwoAH3rwXAzxpRWwQJkipyVc3sXvBP2y/k=;
 b=QBOQu6fj5J+xOUomTSg84XPLCKku0SvQB271RIBnD39Ebkw/6vUqqEQY
 ynNd0puuJ4PPLEnQpE4Gseqx//dQJYzHkrY+7khfJjad3Pn32lpYTUBor
 e1LaRiHfDzI0e3hSpU5kxs5gm6si7VxiRyGc7yGWF6U2Lx5imD5FJR+c/
 midkgaA1G1/4Mh+edzNdt1xTNBm2uOKTzr/a7gWAl3DBGxPZqdc3IDXHw
 izZ39o9XOLIj8dDWVFLDNx1uVobGQkylnGsAZJrcS8lwHvjQDEJpv0ARL
 YxRgxLHz5ojjW0/yCAijL70c5xX7Ba/2NwfckYkLa2JPlRK+/mf89nuua g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="476903805"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="476903805"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 08:22:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="888292308"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="888292308"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga004.jf.intel.com with ESMTP; 14 Nov 2023 08:22:27 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v1 1/1] drm/i915/gt: Dont wait forever when idling in suspend
Date: Tue, 14 Nov 2023 08:22:27 -0800
Message-Id: <20231114162227.756974-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>,
 Mousumi Jana <mousumi.jana@intel.com>, dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When suspending, add a timeout when calling
intel_gt_pm_wait_for_idle else if we have a leaked
wakeref (which would be indicative of a bug elsewhere
in the driver), driver will at exit the suspend-resume
cycle, after the kernel detects the held reference and
prints a message to abort suspending instead of hanging
in the kernel forever which then requires serial connection
or ramoops dump to debug further.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Tested-by: Mousumi Jana <mousumi.jana@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c     |  7 ++++++-
 drivers/gpu/drm/i915/gt/intel_gt_pm.h     |  7 ++++++-
 drivers/gpu/drm/i915/intel_wakeref.c      | 14 ++++++++++----
 drivers/gpu/drm/i915/intel_wakeref.h      |  6 ++++--
 5 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 40687806d22a..ffef963037f2 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -686,7 +686,7 @@ void intel_engines_release(struct intel_gt *gt)
 		if (!engine->release)
 			continue;
 
-		intel_wakeref_wait_for_idle(&engine->wakeref);
+		intel_wakeref_wait_for_idle(&engine->wakeref, 0);
 		GEM_BUG_ON(intel_engine_pm_is_awake(engine));
 
 		engine->release(engine);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
index f5899d503e23..25cb39ba9fdf 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@ -306,6 +306,8 @@ int intel_gt_resume(struct intel_gt *gt)
 
 static void wait_for_suspend(struct intel_gt *gt)
 {
+	int final_timeout_ms = (I915_GT_SUSPEND_IDLE_TIMEOUT * 10);
+
 	if (!intel_gt_pm_is_awake(gt))
 		return;
 
@@ -318,7 +320,10 @@ static void wait_for_suspend(struct intel_gt *gt)
 		intel_gt_retire_requests(gt);
 	}
 
-	intel_gt_pm_wait_for_idle(gt);
+	/* we are suspending, so we shouldn't be waiting forever */
+	if (intel_gt_pm_wait_timeout_for_idle(gt, final_timeout_ms) == -ETIMEDOUT)
+		gt_warn(gt, "bailing from %s after %d milisec timeout\n",
+			__func__, final_timeout_ms);
 }
 
 void intel_gt_suspend_prepare(struct intel_gt *gt)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
index b1eeb5b33918..1757ca4c3077 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
@@ -68,7 +68,12 @@ static inline void intel_gt_pm_might_put(struct intel_gt *gt)
 
 static inline int intel_gt_pm_wait_for_idle(struct intel_gt *gt)
 {
-	return intel_wakeref_wait_for_idle(&gt->wakeref);
+	return intel_wakeref_wait_for_idle(&gt->wakeref, 0);
+}
+
+static inline int intel_gt_pm_wait_timeout_for_idle(struct intel_gt *gt, int timeout_ms)
+{
+	return intel_wakeref_wait_for_idle(&gt->wakeref, timeout_ms);
 }
 
 void intel_gt_pm_init_early(struct intel_gt *gt);
diff --git a/drivers/gpu/drm/i915/intel_wakeref.c b/drivers/gpu/drm/i915/intel_wakeref.c
index 623a69089386..f2611c65246b 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.c
+++ b/drivers/gpu/drm/i915/intel_wakeref.c
@@ -113,14 +113,20 @@ void __intel_wakeref_init(struct intel_wakeref *wf,
 			 "wakeref.work", &key->work, 0);
 }
 
-int intel_wakeref_wait_for_idle(struct intel_wakeref *wf)
+int intel_wakeref_wait_for_idle(struct intel_wakeref *wf, int timeout_ms)
 {
-	int err;
+	int err = 0;
 
 	might_sleep();
 
-	err = wait_var_event_killable(&wf->wakeref,
-				      !intel_wakeref_is_active(wf));
+	if (!timeout_ms)
+		err = wait_var_event_killable(&wf->wakeref,
+					      !intel_wakeref_is_active(wf));
+	else if (wait_var_event_timeout(&wf->wakeref,
+					!intel_wakeref_is_active(wf),
+					msecs_to_jiffies(timeout_ms)) < 1)
+		err = -ETIMEDOUT;
+
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/i915/intel_wakeref.h b/drivers/gpu/drm/i915/intel_wakeref.h
index ec881b097368..302694a780d2 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.h
+++ b/drivers/gpu/drm/i915/intel_wakeref.h
@@ -251,15 +251,17 @@ __intel_wakeref_defer_park(struct intel_wakeref *wf)
 /**
  * intel_wakeref_wait_for_idle: Wait until the wakeref is idle
  * @wf: the wakeref
+ * @timeout_ms: Timeout in ms, 0 means never timeout.
  *
  * Wait for the earlier asynchronous release of the wakeref. Note
  * this will wait for any third party as well, so make sure you only wait
  * when you have control over the wakeref and trust no one else is acquiring
  * it.
  *
- * Return: 0 on success, error code if killed.
+ * Returns 0 on success, -ETIMEDOUT upon a timeout, or the unlikely
+ * error propagation from wait_var_event_killable if timeout_ms is 0.
  */
-int intel_wakeref_wait_for_idle(struct intel_wakeref *wf);
+int intel_wakeref_wait_for_idle(struct intel_wakeref *wf, int timeout_ms);
 
 struct intel_wakeref_auto {
 	struct drm_i915_private *i915;

base-commit: 3d1e36691e73b3946b4a9ca8132a34f0319ff984
-- 
2.39.0

