Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F34919F4DC
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 13:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2026E6E393;
	Mon,  6 Apr 2020 11:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F12F6E391;
 Mon,  6 Apr 2020 11:38:53 +0000 (UTC)
IronPort-SDR: rZ7tr+chzaeuZEkplSHNcdXWgoZir4WdxfdzFGevsJTc7xV+corRnJwH/h/E1fMxk9N3bxkxnw
 cnQUJGQ3SqwA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 04:38:53 -0700
IronPort-SDR: QUEFtgeeUwXM1baO9qGtKjHeNtU43z2MAPt7d7GHsY9dWgd5qJqESrKBYecy/v427CKzEmL+zn
 OTGITtzg65mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,350,1580803200"; d="scan'208";a="361192576"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2020 04:38:50 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 18/18] drm/i915/runtime_pm: Prefer drm_WARN* over WARN*
Date: Mon,  6 Apr 2020 16:58:00 +0530
Message-Id: <20200406112800.23762-19-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200406112800.23762-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200406112800.23762-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct drm_device specific drm_WARN* macros include device information
in the backtrace, so we know what device the warnings originate from.

Prefer drm_WARN* over WARN*.

Conversion is done with below semantic patch:

@@
identifier func, T;
@@
func(struct intel_runtime_pm *T,...) {
+ struct drm_i915_private *i915 = container_of(T, struct drm_i915_private, runtime_pm);
<+...
(
-WARN(
+drm_WARN(&i915->drm,
...)
|
-WARN_ON(
+drm_WARN_ON(&i915->drm,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(&i915->drm,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(&i915->drm,
...)
)
...+>

}

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/intel_runtime_pm.c | 39 ++++++++++++++++++-------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
index ad719c9602af..31ccd0559c55 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.c
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
@@ -116,6 +116,9 @@ track_intel_runtime_pm_wakeref(struct intel_runtime_pm *rpm)
 static void untrack_intel_runtime_pm_wakeref(struct intel_runtime_pm *rpm,
 					     depot_stack_handle_t stack)
 {
+	struct drm_i915_private *i915 = container_of(rpm,
+						     struct drm_i915_private,
+						     runtime_pm);
 	unsigned long flags, n;
 	bool found = false;
 
@@ -134,9 +137,9 @@ static void untrack_intel_runtime_pm_wakeref(struct intel_runtime_pm *rpm,
 	}
 	spin_unlock_irqrestore(&rpm->debug.lock, flags);
 
-	if (WARN(!found,
-		 "Unmatched wakeref (tracking %lu), count %u\n",
-		 rpm->debug.count, atomic_read(&rpm->wakeref_count))) {
+	if (drm_WARN(&i915->drm, !found,
+		     "Unmatched wakeref (tracking %lu), count %u\n",
+		     rpm->debug.count, atomic_read(&rpm->wakeref_count))) {
 		char *buf;
 
 		buf = kmalloc(PAGE_SIZE, GFP_NOWAIT | __GFP_NOWARN);
@@ -355,10 +358,14 @@ intel_runtime_pm_release(struct intel_runtime_pm *rpm, int wakelock)
 static intel_wakeref_t __intel_runtime_pm_get(struct intel_runtime_pm *rpm,
 					      bool wakelock)
 {
+	struct drm_i915_private *i915 = container_of(rpm,
+						     struct drm_i915_private,
+						     runtime_pm);
 	int ret;
 
 	ret = pm_runtime_get_sync(rpm->kdev);
-	WARN_ONCE(ret < 0, "pm_runtime_get_sync() failed: %d\n", ret);
+	drm_WARN_ONCE(&i915->drm, ret < 0,
+		      "pm_runtime_get_sync() failed: %d\n", ret);
 
 	intel_runtime_pm_acquire(rpm, wakelock);
 
@@ -539,6 +546,9 @@ void intel_runtime_pm_put(struct intel_runtime_pm *rpm, intel_wakeref_t wref)
  */
 void intel_runtime_pm_enable(struct intel_runtime_pm *rpm)
 {
+	struct drm_i915_private *i915 = container_of(rpm,
+						     struct drm_i915_private,
+						     runtime_pm);
 	struct device *kdev = rpm->kdev;
 
 	/*
@@ -565,7 +575,8 @@ void intel_runtime_pm_enable(struct intel_runtime_pm *rpm)
 
 		pm_runtime_dont_use_autosuspend(kdev);
 		ret = pm_runtime_get_sync(kdev);
-		WARN(ret < 0, "pm_runtime_get_sync() failed: %d\n", ret);
+		drm_WARN(&i915->drm, ret < 0,
+			 "pm_runtime_get_sync() failed: %d\n", ret);
 	} else {
 		pm_runtime_use_autosuspend(kdev);
 	}
@@ -580,11 +591,14 @@ void intel_runtime_pm_enable(struct intel_runtime_pm *rpm)
 
 void intel_runtime_pm_disable(struct intel_runtime_pm *rpm)
 {
+	struct drm_i915_private *i915 = container_of(rpm,
+						     struct drm_i915_private,
+						     runtime_pm);
 	struct device *kdev = rpm->kdev;
 
 	/* Transfer rpm ownership back to core */
-	WARN(pm_runtime_get_sync(kdev) < 0,
-	     "Failed to pass rpm ownership back to core\n");
+	drm_WARN(&i915->drm, pm_runtime_get_sync(kdev) < 0,
+		 "Failed to pass rpm ownership back to core\n");
 
 	pm_runtime_dont_use_autosuspend(kdev);
 
@@ -594,12 +608,15 @@ void intel_runtime_pm_disable(struct intel_runtime_pm *rpm)
 
 void intel_runtime_pm_driver_release(struct intel_runtime_pm *rpm)
 {
+	struct drm_i915_private *i915 = container_of(rpm,
+						     struct drm_i915_private,
+						     runtime_pm);
 	int count = atomic_read(&rpm->wakeref_count);
 
-	WARN(count,
-	     "i915 raw-wakerefs=%d wakelocks=%d on cleanup\n",
-	     intel_rpm_raw_wakeref_count(count),
-	     intel_rpm_wakelock_count(count));
+	drm_WARN(&i915->drm, count,
+		 "i915 raw-wakerefs=%d wakelocks=%d on cleanup\n",
+		 intel_rpm_raw_wakeref_count(count),
+		 intel_rpm_wakelock_count(count));
 
 	untrack_all_intel_runtime_pm_wakerefs(rpm);
 }
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
