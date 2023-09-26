Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A89F57AF3C1
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 21:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36AE110E42A;
	Tue, 26 Sep 2023 19:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE188920D;
 Tue, 26 Sep 2023 19:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695755121; x=1727291121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5j2aDuSYGvbS+a+1URJlTiHxAz8NEz0v2Va6vw++TvY=;
 b=WaN1yY6ylQ6lMaN32+fXa54enfyL/iCZ1Rq4/dWoVc2m8xFxxo/RA+Iy
 L3cJy5GjsF5VWtHqu9Dwa+xVY+UDKDr19xbC98p2x+hohq1DVSU76TR82
 JHJGm1RrKJiEViL0citwJdHRf6OrtVAxyNTciL92hRv+1USbucDsVKoKB
 ZhFTS/fPohCBqsmsjmj0lzOGoxX+s4+9s9iaQhWgbUpCkGYxAvMS69+mF
 5imqLDY5Ln3/imCpywlfCjYbGgavdbUmmpRIFgDAceIqdw8u9HQlizIy7
 e8ap2YK+0+JuSCu2Mhd2E3ZiQ9YOI0qwXvcdiSMNJ//clFdCWA/hCwrNZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="448141900"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="448141900"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 12:05:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="819142184"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="819142184"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga004.fm.intel.com with ESMTP; 26 Sep 2023 12:05:19 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 3/3] drm/i915/gt: Timeout when waiting for idle in
 suspending
Date: Tue, 26 Sep 2023 12:05:18 -0700
Message-Id: <20230926190518.105393-4-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230926190518.105393-1-alan.previn.teres.alexis@intel.com>
References: <20230926190518.105393-1-alan.previn.teres.alexis@intel.com>
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
Cc: , Alan Previn <alan.previn.teres.alexis@intel.com>,
	dri-devel@lists.freedesktop.org,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, intel.com@freedesktop.org,
	Mousumi Jana <mousumi.jana@intel.com>,
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
 drivers/gpu/drm/i915/gt/intel_gt_pm.c     |  6 +++++-
 drivers/gpu/drm/i915/gt/intel_gt_pm.h     |  7 ++++++-
 drivers/gpu/drm/i915/intel_wakeref.c      | 14 ++++++++++----
 drivers/gpu/drm/i915/intel_wakeref.h      |  6 ++++--
 5 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 84a75c95f3f7..9c6151b78e1d 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -687,7 +687,7 @@ void intel_engines_release(struct intel_gt *gt)
 		if (!engine->release)
 			continue;
 
-		intel_wakeref_wait_for_idle(&engine->wakeref);
+		intel_wakeref_wait_for_idle(&engine->wakeref, 0);
 		GEM_BUG_ON(intel_engine_pm_is_awake(engine));
 
 		engine->release(engine);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
index 59b5658a17fb..820217c06dc7 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@ -289,6 +289,7 @@ int intel_gt_resume(struct intel_gt *gt)
 
 static void wait_for_suspend(struct intel_gt *gt)
 {
+	int timeout_ms = CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT ? : 10000;
 	/*
 	 * On rare occasions, we've observed the fence completion trigger
 	 * free_engines asynchronously via rcu_call. Ensure those are done.
@@ -308,7 +309,10 @@ static void wait_for_suspend(struct intel_gt *gt)
 		intel_gt_retire_requests(gt);
 	}
 
-	intel_gt_pm_wait_for_idle(gt);
+	/* we are suspending, so we shouldn't be waiting forever */
+	if (intel_gt_pm_wait_timeout_for_idle(gt, timeout_ms) == -ETIMEDOUT)
+		gt_warn(gt, "bailing from %s after %d milisec timeout\n",
+			__func__, timeout_ms);
 }
 
 void intel_gt_suspend_prepare(struct intel_gt *gt)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
index 6c9a46452364..5358acc2b5b1 100644
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
index 718f2f1b6174..383a37521415 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.c
+++ b/drivers/gpu/drm/i915/intel_wakeref.c
@@ -111,14 +111,20 @@ void __intel_wakeref_init(struct intel_wakeref *wf,
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

