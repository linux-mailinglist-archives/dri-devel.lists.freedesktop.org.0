Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D44CF6AC803
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 17:32:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD9C10E3F5;
	Mon,  6 Mar 2023 16:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142AB10E3F5;
 Mon,  6 Mar 2023 16:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678120359; x=1709656359;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=ON7/HzslYGhXzSc02vWwvEfrToct6tCg5PzOWD35lw0=;
 b=k0ttoIi7K0+2HSqRzo7iRLUoVZQAhFS4jxO/nLiMGNLTFoe30vLSfuOh
 sueSrtnKgf1cdfsmdVXplOnuQzVcWR6zb7NYkaMhuMTNl/LHgBzxN3Ggr
 /Vv+Xath+L76PjHAf0Tl4T1PndPuFpOJqkV+em9YivecJ2sNMP5V3PAbb
 is7lq6EzU7r5uE1zEuu/psCtm67iFhevSbkQhu0vikFsZxGrl2BXic23h
 lotJS0dckgOtIhu4PtsNzE4uTrrkiAYRixAzayV05gSC1EeEbvRL+DovE
 sFy+b4gYd6EU238MZjbEBQ8TQuCgVwqc2cDqMtkqRLFW+zZDTcMXqqVrW A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="315998689"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="315998689"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 08:32:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="745132890"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="745132890"
Received: from lab-ah.igk.intel.com ([10.102.42.211])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 08:32:35 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Mon, 06 Mar 2023 17:32:01 +0100
Subject: [PATCH v4 05/10] drm/i915: Separate wakeref tracking types from rpm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230224-track_gt-v4-5-464e8ab4c9ab@intel.com>
References: <20230224-track_gt-v4-0-464e8ab4c9ab@intel.com>
In-Reply-To: <20230224-track_gt-v4-0-464e8ab4c9ab@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.1
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
Cc: netdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Eric Dumazet <edumazet@google.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These structs will be used by other subsystems.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/intel_runtime_pm.c      | 14 +++++++-------
 drivers/gpu/drm/i915/intel_runtime_pm.h      | 10 +---------
 drivers/gpu/drm/i915/intel_wakeref.h         |  4 ++--
 drivers/gpu/drm/i915/intel_wakeref_tracker.h | 24 ++++++++++++++++++++++++
 4 files changed, 34 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
index 129746713d072f..1901eedb6704a2 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.c
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
@@ -164,7 +164,7 @@ static int cmphandle(const void *_a, const void *_b)
 
 static void
 __print_intel_runtime_pm_wakeref(struct drm_printer *p,
-				 const struct intel_runtime_pm_debug *dbg)
+				 const struct intel_wakeref_tracker *dbg)
 {
 	unsigned long i;
 	char *buf;
@@ -202,8 +202,8 @@ __print_intel_runtime_pm_wakeref(struct drm_printer *p,
 }
 
 static noinline void
-__untrack_all_wakerefs(struct intel_runtime_pm_debug *debug,
-		       struct intel_runtime_pm_debug *saved)
+__untrack_all_wakerefs(struct intel_wakeref_tracker *debug,
+		       struct intel_wakeref_tracker *saved)
 {
 	*saved = *debug;
 
@@ -213,7 +213,7 @@ __untrack_all_wakerefs(struct intel_runtime_pm_debug *debug,
 }
 
 static void
-dump_and_free_wakeref_tracking(struct intel_runtime_pm_debug *debug)
+dump_and_free_wakeref_tracking(struct intel_wakeref_tracker *debug)
 {
 	if (debug->count) {
 		struct drm_printer p = drm_debug_printer("i915");
@@ -227,7 +227,7 @@ dump_and_free_wakeref_tracking(struct intel_runtime_pm_debug *debug)
 static noinline void
 __intel_wakeref_dec_and_check_tracking(struct intel_runtime_pm *rpm)
 {
-	struct intel_runtime_pm_debug dbg = {};
+	struct intel_wakeref_tracker dbg = {};
 	unsigned long flags;
 
 	if (!atomic_dec_and_lock_irqsave(&rpm->wakeref_count,
@@ -244,7 +244,7 @@ __intel_wakeref_dec_and_check_tracking(struct intel_runtime_pm *rpm)
 static noinline void
 untrack_all_intel_runtime_pm_wakerefs(struct intel_runtime_pm *rpm)
 {
-	struct intel_runtime_pm_debug dbg = {};
+	struct intel_wakeref_tracker dbg = {};
 	unsigned long flags;
 
 	spin_lock_irqsave(&rpm->debug.lock, flags);
@@ -257,7 +257,7 @@ untrack_all_intel_runtime_pm_wakerefs(struct intel_runtime_pm *rpm)
 void print_intel_runtime_pm_wakeref(struct intel_runtime_pm *rpm,
 				    struct drm_printer *p)
 {
-	struct intel_runtime_pm_debug dbg = {};
+	struct intel_wakeref_tracker dbg = {};
 
 	do {
 		unsigned long alloc = dbg.count;
diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.h b/drivers/gpu/drm/i915/intel_runtime_pm.h
index e592e8d6499a1f..a8dc2baf79844f 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.h
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.h
@@ -83,15 +83,7 @@ struct intel_runtime_pm {
 	 * paired rpm_put) we can remove corresponding pairs of and keep
 	 * the array trimmed to active wakerefs.
 	 */
-	struct intel_runtime_pm_debug {
-		spinlock_t lock;
-
-		depot_stack_handle_t last_acquire;
-		depot_stack_handle_t last_release;
-
-		depot_stack_handle_t *owners;
-		unsigned long count;
-	} debug;
+	struct intel_wakeref_tracker debug;
 #endif
 };
 
diff --git a/drivers/gpu/drm/i915/intel_wakeref.h b/drivers/gpu/drm/i915/intel_wakeref.h
index 71b8a63f6f104d..583fdaadd9912c 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.h
+++ b/drivers/gpu/drm/i915/intel_wakeref.h
@@ -17,6 +17,8 @@
 #include <linux/timer.h>
 #include <linux/workqueue.h>
 
+#include "intel_wakeref_tracker.h"
+
 #if IS_ENABLED(CONFIG_DRM_I915_DEBUG)
 #define INTEL_WAKEREF_BUG_ON(expr) BUG_ON(expr)
 #else
@@ -26,8 +28,6 @@
 struct intel_runtime_pm;
 struct intel_wakeref;
 
-typedef depot_stack_handle_t intel_wakeref_t;
-
 struct intel_wakeref_ops {
 	int (*get)(struct intel_wakeref *wf);
 	int (*put)(struct intel_wakeref *wf);
diff --git a/drivers/gpu/drm/i915/intel_wakeref_tracker.h b/drivers/gpu/drm/i915/intel_wakeref_tracker.h
new file mode 100644
index 00000000000000..74e6261fb31260
--- /dev/null
+++ b/drivers/gpu/drm/i915/intel_wakeref_tracker.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2019 Intel Corporation
+ */
+
+#ifndef INTEL_WAKEREF_TRACKER_H
+#define INTEL_WAKEREF_TRACKER_H
+
+#include <linux/spinlock.h>
+#include <linux/stackdepot.h>
+
+typedef depot_stack_handle_t intel_wakeref_t;
+
+struct intel_wakeref_tracker {
+	spinlock_t lock;
+
+	depot_stack_handle_t last_acquire;
+	depot_stack_handle_t last_release;
+
+	depot_stack_handle_t *owners;
+	unsigned long count;
+};
+
+#endif /* INTEL_WAKEREF_TRACKER_H */

-- 
2.34.1
