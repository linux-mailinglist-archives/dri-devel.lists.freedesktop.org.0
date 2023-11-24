Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4067F7412
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 13:44:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4115810E1E3;
	Fri, 24 Nov 2023 12:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507C310E1DF;
 Fri, 24 Nov 2023 12:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700829853; x=1732365853;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xVJ7PYtP4ASIvLpNBzpcMBMGvB3McvMPM5qk8TeDBX0=;
 b=l5I9sgfbOmEo1HxX5gJV6bTk3V+1zo9SyXlPEE1aCm6XXb5Gc8b6FCCL
 UV3kSjxiV64knMKAE4Iyv94hZBKb3UOGyMtm/E3g3JK36ENZyhsx5Qqvb
 1+1BP5F2aSt9UdZwIQSKCpFeUtYAKhJttWmG7FoaHW68TskmwjIRJVYzo
 n2ZeD3A/2LYAfFtAIF4WLtoVqAkySqFfGJAATrWcWeSswFdhKWn4DyMs4
 /83BcttTdxIV9Go/NX0YaKZGzV4xmYTbdMP2BAV2yNmS5UgrgIxwUN3P6
 Fb84aVU0Xx3TR4L2tSkvZO3kAmMs3LXQXR/3tAGqe+CGYiCVEFHDGGZdf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="478626937"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="478626937"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 04:44:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="833687912"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="833687912"
Received: from dashah-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.41.230])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 04:44:11 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/8] drm/print: make drm_err_printer() device specific by
 using drm_err()
Date: Fri, 24 Nov 2023 14:43:55 +0200
Message-Id: <a69b6eabb1bf68ef81b957b20296eb50e1cb557f.1700829750.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1700829750.git.jani.nikula@intel.com>
References: <cover.1700829750.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
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
index 273d440a53e3..b4970c1ed572 100644
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
index dd4883df876a..3d899fb0793c 100644
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

