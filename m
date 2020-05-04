Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EAD1C45CD
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 20:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544506E471;
	Mon,  4 May 2020 18:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A066E478;
 Mon,  4 May 2020 18:25:01 +0000 (UTC)
IronPort-SDR: KVYkyt3R8Wz3cgbjsMYUSgfx8cCzm1xqg9ElIC/f12EPLUq1bPgWPSAgKr57Ubs2kERZxPYhSY
 DUGIDY+GHhFA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2020 11:25:01 -0700
IronPort-SDR: mFEOdKB7Vj843q/x+JNLZTXr6ZWnDU25Sc1J1Bc3aNGKep230kMYCi28s3x+RNO/x1s6aP1EJq
 /kzWp4ThFRFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,352,1583222400"; d="scan'208";a="369172299"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 04 May 2020 11:24:57 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 9/9] drm/i915/runtime_pm: Prefer drm_WARN* over WARN*
Date: Mon,  4 May 2020 23:46:00 +0530
Message-Id: <20200504181600.18503-10-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200504181600.18503-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200504181600.18503-1-pankaj.laxminarayan.bharadiya@intel.com>
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
