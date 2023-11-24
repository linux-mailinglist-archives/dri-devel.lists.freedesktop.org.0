Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 109E07F7421
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 13:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4735810E1E7;
	Fri, 24 Nov 2023 12:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DD110E7DC;
 Fri, 24 Nov 2023 12:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700829885; x=1732365885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sdQLJb/HtVjk+S1k83K5iLZTEe3WUoWYSOUvRGpkcYg=;
 b=B+QqIExspYLfwLfLz6uO6x0wf7O1kp80TSoURPNpjUVm3nM4D2ddaKWO
 jcE7hhCmEUmDw+j8lkii4Dc1OiioLr4m7jTlseWdh90/Bm+bvRjgXL8ra
 EUoD6qp60zewn8CgDdSBgmf2EyHslKUavMgoxEIfmbZ590GEAlQi6nEeW
 eq+6WsCnt78b5AXLtsE1GGYJS84576BuHhwYIF9TGE2PS+ILjYzpR/3d/
 IdpHP4phCEqeAPd85MozYsgS+lRP/mQ1HfMiqpm8dav2D5aB4owUfFmZh
 JD43KGprUeH9Y5k97l6b+u0DDcGAK8i8YfLuvX7NOI6je4Qqww6XMeoxG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="389571282"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="389571282"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 04:44:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="15621883"
Received: from dashah-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.41.230])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 04:44:44 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 8/8] drm/i915: use drm_printf() with the drm_err_printer
 intead of pr_err()
Date: Fri, 24 Nov 2023 14:44:02 +0200
Message-Id: <8166948db4535654c1f6cb2ff15cc506f7b6f966.1700829750.git.jani.nikula@intel.com>
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

There's already a related drm_printer. Use it to preserve the context
instead of a separate pr_err().

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c | 6 +++---
 drivers/gpu/drm/i915/selftests/i915_active.c        | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
index b4970c1ed572..88fd2ab65f3b 100644
--- a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
@@ -124,7 +124,7 @@ static int __live_idle_pulse(struct intel_engine_cs *engine,
 	if (engine_sync_barrier(engine)) {
 		struct drm_printer m = drm_err_printer(&engine->i915->drm, "pulse");
 
-		pr_err("%s: no heartbeat pulse?\n", engine->name);
+		drm_printf(&m, "%s: no heartbeat pulse?\n", engine->name);
 		intel_engine_dump(engine, &m, "%s", engine->name);
 
 		err = -ETIME;
@@ -138,8 +138,8 @@ static int __live_idle_pulse(struct intel_engine_cs *engine,
 	if (!i915_active_is_idle(&p->active)) {
 		struct drm_printer m = drm_err_printer(&engine->i915->drm, "pulse");
 
-		pr_err("%s: heartbeat pulse did not flush idle tasks\n",
-		       engine->name);
+		drm_printf(&m, "%s: heartbeat pulse did not flush idle tasks\n",
+			   engine->name);
 		i915_active_print(&p->active, &m);
 
 		err = -EINVAL;
diff --git a/drivers/gpu/drm/i915/selftests/i915_active.c b/drivers/gpu/drm/i915/selftests/i915_active.c
index 8886752ade63..0d89d70b9c36 100644
--- a/drivers/gpu/drm/i915/selftests/i915_active.c
+++ b/drivers/gpu/drm/i915/selftests/i915_active.c
@@ -158,7 +158,7 @@ static int live_active_wait(void *arg)
 	if (!READ_ONCE(active->retired)) {
 		struct drm_printer p = drm_err_printer(&i915->drm, __func__);
 
-		pr_err("i915_active not retired after waiting!\n");
+		drm_printf(&p, "i915_active not retired after waiting!\n");
 		i915_active_print(&active->base, &p);
 
 		err = -EINVAL;
@@ -191,7 +191,7 @@ static int live_active_retire(void *arg)
 	if (!READ_ONCE(active->retired)) {
 		struct drm_printer p = drm_err_printer(&i915->drm, __func__);
 
-		pr_err("i915_active not retired after flushing!\n");
+		drm_printf(&p, "i915_active not retired after flushing!\n");
 		i915_active_print(&active->base, &p);
 
 		err = -EINVAL;
-- 
2.39.2

