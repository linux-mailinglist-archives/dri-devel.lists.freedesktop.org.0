Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFE07C91FB
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 03:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B65E10E0A1;
	Sat, 14 Oct 2023 01:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B47F10E07A;
 Sat, 14 Oct 2023 01:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697245457; x=1728781457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BrSK/Ywnd8ITyDiA5Uq1XljbxoBnWJoRU9KoKD8ZEhk=;
 b=eNSWtrk+14y/zxwGM/umCPuwZapc8rKDnKpOK5WAiOJzVyb9g4zIOSDA
 TMs4MERQbI1wNT6sRVqpacxikA/IU/dWbsgTnRktAdlzlqMIhXtXVTwBm
 MbLPwsvejZexTv5Kftda91M8AAwDtpaHDk3/DLtX6+5hFTfvKSPsCi5WS
 unCd1Hj0IddVBNGadBDltBPtVXGy0sCI1loQNL4Y5rKccMb2F9dUbsThP
 64wLMT/vIZzA4aAUIANvFoc+ouUp17I1fJpTQhkoL+EzbsyAH++7iZZBy
 ZsM5C6OJpfIEBlqzdhbN8JMcB1qCT+VNlq3jmnEaXxFQE10gLqjBo6Wsr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="364656951"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="364656951"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 18:04:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="898756740"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="898756740"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2023 18:02:24 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 3/3] drm/i915/gt: Timeout when waiting for idle in
 suspending
Date: Fri, 13 Oct 2023 18:04:13 -0700
Message-Id: <20231014010413.256468-4-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231014010413.256468-1-alan.previn.teres.alexis@intel.com>
References: <20231014010413.256468-1-alan.previn.teres.alexis@intel.com>
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>, dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mousumi Jana <mousumi.jana@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When suspending, add a timeout when calling
intel_gt_pm_wait_for_idle else if we have a lost
G2H event that holds a wakeref (which would be
indicative of a bug elsewhere in the driver),
driver will at least complete the suspend-resume
cycle, (albeit not hitting all the targets for
low power hw counters), instead of hanging in the kernel.

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
index 179d9546865b..4b45a8f7fe5a 100644
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
-- 
2.39.0

