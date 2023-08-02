Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9191776DBA8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 01:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C95010E58D;
	Wed,  2 Aug 2023 23:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE2C10E155;
 Wed,  2 Aug 2023 23:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691019305; x=1722555305;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KPpkYgYyFBImxWbV1UvSDvRiC0M4HN3HrHFvTk9Wr3Q=;
 b=a+QT1G2PXX53tPglfI7gtJdGCbiApL8zeRNEjOsG9zK5ptkNj2fM5X6N
 x7XE4I3T/6D47MOCSxpyqe5EZMbQ0iwEd3PzMBBIk5gbZbZMuK/s0qAJi
 odSpegpO3kbfOZY0OH/uwOqteZCQBS8fmnb3Sza6nVS/ELUIk3NJVKJDL
 2IrcyKC1kp4Jt0qyo7dN5bkJPu3fQAVV5mnjmrtsw8YG4d19VCEhdGVHn
 rrOa2YqUhrxX/wJuiZOxgUIKL4dN3C4fEanT0+sUG4BCiHVpNqvPi8MHd
 b/jCodeVPMoOOqUVKM5U2rioorIc6d+0i3Vzitu2kxtkvw5itrEpY86BO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="367185061"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; d="scan'208";a="367185061"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 16:35:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="853030293"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; d="scan'208";a="853030293"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga004.jf.intel.com with ESMTP; 02 Aug 2023 16:35:05 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v1 3/3] drm/i915/gt: Timeout when waiting for idle in
 suspending
Date: Wed,  2 Aug 2023 16:35:01 -0700
Message-Id: <20230802233501.17074-4-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230802233501.17074-1-alan.previn.teres.alexis@intel.com>
References: <20230802233501.17074-1-alan.previn.teres.alexis@intel.com>
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
Cc: John Harrison <john.c.harrison@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When suspending, add a timeout when calling
intel_gt_pm_wait_for_idle else if we have a lost
G2H event that holds a wakeref (which would be
indicating of a bug elsewhere in the driver), we
get to complete the suspend-resume cycle, albeit
without all the lower power hw counters hitting
its targets, instead of hanging in the kernel.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c     |  7 ++++++-
 drivers/gpu/drm/i915/gt/intel_gt_pm.h     |  7 ++++++-
 drivers/gpu/drm/i915/intel_wakeref.c      | 14 ++++++++++----
 drivers/gpu/drm/i915/intel_wakeref.h      |  5 +++--
 5 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index ee15486fed0d..090438eb8682 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -688,7 +688,7 @@ void intel_engines_release(struct intel_gt *gt)
 		if (!engine->release)
 			continue;
 
-		intel_wakeref_wait_for_idle(&engine->wakeref);
+		intel_wakeref_wait_for_idle(&engine->wakeref, 0);
 		GEM_BUG_ON(intel_engine_pm_is_awake(engine));
 
 		engine->release(engine);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
index 3162d859ed68..dfe77eb3efd1 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@ -289,6 +289,8 @@ int intel_gt_resume(struct intel_gt *gt)
 
 static void wait_for_suspend(struct intel_gt *gt)
 {
+	int timeout_ms = CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT ? : 10000;
+
 	if (!intel_gt_pm_is_awake(gt)) {
 		intel_uc_suspend_prepare(&gt->uc);
 		return;
@@ -305,7 +307,10 @@ static void wait_for_suspend(struct intel_gt *gt)
 		intel_uc_suspend_prepare(&gt->uc);
 	}
 
-	intel_gt_pm_wait_for_idle(gt);
+	/* we are suspending, so we shouldn't be waiting forever */
+	if (intel_gt_pm_wait_timeout_for_idle(gt, timeout_ms) == -ETIME)
+		drm_warn(&gt->i915->drm, "Bailing from %s after %d milisec timeout\n",
+			 __func__, timeout_ms);
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
index 718f2f1b6174..7e01d4cc300c 100644
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
+		err = -ETIME;
+
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/i915/intel_wakeref.h b/drivers/gpu/drm/i915/intel_wakeref.h
index ec881b097368..6fbb7a2fb6ea 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.h
+++ b/drivers/gpu/drm/i915/intel_wakeref.h
@@ -251,15 +251,16 @@ __intel_wakeref_defer_park(struct intel_wakeref *wf)
 /**
  * intel_wakeref_wait_for_idle: Wait until the wakeref is idle
  * @wf: the wakeref
+ * @timeout_ms: timeout to wait in milisecs, zero means forever
  *
  * Wait for the earlier asynchronous release of the wakeref. Note
  * this will wait for any third party as well, so make sure you only wait
  * when you have control over the wakeref and trust no one else is acquiring
  * it.
  *
- * Return: 0 on success, error code if killed.
+ * Return: 0 on success, error code if killed, -ETIME if timed-out.
  */
-int intel_wakeref_wait_for_idle(struct intel_wakeref *wf);
+int intel_wakeref_wait_for_idle(struct intel_wakeref *wf, int timeout_ms);
 
 struct intel_wakeref_auto {
 	struct drm_i915_private *i915;
-- 
2.39.0

