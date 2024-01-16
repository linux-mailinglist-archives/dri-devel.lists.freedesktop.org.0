Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0807F82EF63
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 14:07:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3167610E51B;
	Tue, 16 Jan 2024 13:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD0310E51B;
 Tue, 16 Jan 2024 13:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705410476; x=1736946476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HNVv4G62tOw7G2snQw4eRCCKiZWA029TqeH/bIx4U04=;
 b=Z13JJpL4cggs8aed/JMLiPHuwQBRqJHfOOOwvjf686dOS68vX9Z9JHUt
 zdMWqh9Bw+z018Ln//zuKX5PTNOxbSBWRIP+GTPvCnHXCSrmlz9S+IjNt
 7hRgS1Q18861WLHvLJ6wZ+qcisULT2mJIn/jhPxbOPDaQbR8iBfEqe36O
 hAf0iSR1c8R3lvHqNzSWycZvJ4ALYlYHOsFLip40If7AIc955Wv9j5bCH
 njcykC+Jvx/ghe/cKKMBN6/a6iKBMwAdXKqoWrTuKLoMJ0QNorXZuJBDd
 nuXBV77SeCN/+EX1IgvpBeVV2dQEMYFQjhGFzRrS/I9/Q594zVVnp4NN8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="431021302"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="431021302"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 05:07:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="32451741"
Received: from jfunnell-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.52])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 05:07:45 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/10] drm/print: make drm_err_printer() device specific by
 using drm_err()
Date: Tue, 16 Jan 2024 15:07:26 +0200
Message-Id: <2a9cdcfc1df44568078f7c131e2e7e0f7c94e97e.1705410327.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705410327.git.jani.nikula@intel.com>
References: <cover.1705410327.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With few users for drm_err_printer(), it's still feasible to convert it
to be device specific. Use drm_err() under the hood.

While at it, make the prefix optional.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_print.c                         |  7 ++++++-
 drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c |  4 ++--
 drivers/gpu/drm/i915/selftests/i915_active.c        |  4 ++--
 include/drm/drm_print.h                             | 11 ++++++++---
 4 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 5b93c11895bb..91dbcdeaad3f 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -191,7 +191,12 @@ EXPORT_SYMBOL(__drm_printfn_debug);
 
 void __drm_printfn_err(struct drm_printer *p, struct va_format *vaf)
 {
-	pr_err("*ERROR* %s %pV", p->prefix, vaf);
+	struct drm_device *drm = p->arg;
+
+	if (p->prefix)
+		drm_err(drm, "%s %pV", p->prefix, vaf);
+	else
+		drm_err(drm, "%pV", vaf);
 }
 EXPORT_SYMBOL(__drm_printfn_err);
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
index bc441ce7b380..be827318275c 100644
--- a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
@@ -122,7 +122,7 @@ static int __live_idle_pulse(struct intel_engine_cs *engine,
 	GEM_BUG_ON(!llist_empty(&engine->barrier_tasks));
 
 	if (engine_sync_barrier(engine)) {
-		struct drm_printer m = drm_err_printer("pulse");
+		struct drm_printer m = drm_err_printer(&engine->i915->drm, "pulse");
 
 		pr_err("%s: no heartbeat pulse?\n", engine->name);
 		intel_engine_dump(engine, &m, "%s", engine->name);
@@ -136,7 +136,7 @@ static int __live_idle_pulse(struct intel_engine_cs *engine,
 	pulse_unlock_wait(p); /* synchronize with the retirement callback */
 
 	if (!i915_active_is_idle(&p->active)) {
-		struct drm_printer m = drm_err_printer("pulse");
+		struct drm_printer m = drm_err_printer(&engine->i915->drm, "pulse");
 
 		pr_err("%s: heartbeat pulse did not flush idle tasks\n",
 		       engine->name);
diff --git a/drivers/gpu/drm/i915/selftests/i915_active.c b/drivers/gpu/drm/i915/selftests/i915_active.c
index b61fe850e924..8886752ade63 100644
--- a/drivers/gpu/drm/i915/selftests/i915_active.c
+++ b/drivers/gpu/drm/i915/selftests/i915_active.c
@@ -156,7 +156,7 @@ static int live_active_wait(void *arg)
 
 	__i915_active_wait(&active->base, TASK_UNINTERRUPTIBLE);
 	if (!READ_ONCE(active->retired)) {
-		struct drm_printer p = drm_err_printer(__func__);
+		struct drm_printer p = drm_err_printer(&i915->drm, __func__);
 
 		pr_err("i915_active not retired after waiting!\n");
 		i915_active_print(&active->base, &p);
@@ -189,7 +189,7 @@ static int live_active_retire(void *arg)
 		err = -EIO;
 
 	if (!READ_ONCE(active->retired)) {
-		struct drm_printer p = drm_err_printer(__func__);
+		struct drm_printer p = drm_err_printer(&i915->drm, __func__);
 
 		pr_err("i915_active not retired after flushing!\n");
 		i915_active_print(&active->base, &p);
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 5ed26a702e3e..1040213d02a4 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -35,6 +35,8 @@
 
 #include <drm/drm.h>
 
+struct drm_device;
+
 /* Do *not* use outside of drm_print.[ch]! */
 extern unsigned long __drm_debug;
 
@@ -235,16 +237,19 @@ static inline struct drm_printer drm_debug_printer(const char *prefix)
 }
 
 /**
- * drm_err_printer - construct a &drm_printer that outputs to pr_err()
- * @prefix: debug output prefix
+ * drm_err_printer - construct a &drm_printer that outputs to drm_err()
+ * @drm: the &struct drm_device pointer
+ * @prefix: debug output prefix, or NULL for no prefix
  *
  * RETURNS:
  * The &drm_printer object
  */
-static inline struct drm_printer drm_err_printer(const char *prefix)
+static inline struct drm_printer drm_err_printer(struct drm_device *drm,
+						 const char *prefix)
 {
 	struct drm_printer p = {
 		.printfn = __drm_printfn_err,
+		.arg = drm,
 		.prefix = prefix
 	};
 	return p;
-- 
2.39.2

