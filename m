Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF4382EF76
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 14:08:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7192F10E522;
	Tue, 16 Jan 2024 13:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79B610E58C;
 Tue, 16 Jan 2024 13:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705410517; x=1736946517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0F50pzjKE1YAk7Ef+fHuufqwgllCs/8+21UsBFHBFF0=;
 b=jTEk+jRXRz5KKKjAaY+zFGuwv6Hn75hN+U7WVLTsAcchZhYaIkJufVk4
 goBPKIHnIERTFLiYkKdzTI/IQ/9GbbJeA0zpfsaM3FxEyiBBBAEYi9u8j
 mLMMdMSfXJx9gd8D4uUK8Ojcn/VBH3KhVimrU4a2ixHK+7UkcuSjjbqSJ
 2sJ23RXBvugGKguRwHmoBaRR9hrEgYv3AkqmpUqZ9zxnGyjlwMj26VvQP
 qBub9M7ik/mL0VMBKv0ZIglVHvjOk4Xx0hmOh5NkCyBCz/Xd2tU8gB2Ly
 Jp0GRNBCR56bbW/vri2FyPzEv1v4ELj23GEK07qEI4NswMgf0nb7pVfWo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="397016006"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="397016006"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 05:08:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="760181522"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="760181522"
Received: from jfunnell-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.52])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 05:08:18 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/10] drm/i915: use drm_printf() with the drm_err_printer
 intead of pr_err()
Date: Tue, 16 Jan 2024 15:07:33 +0200
Message-Id: <246c0c275d05c919d959983e1784e3f7347f4540.1705410327.git.jani.nikula@intel.com>
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

There's already a related drm_printer. Use it to preserve the context
instead of a separate pr_err().

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c | 6 +++---
 drivers/gpu/drm/i915/selftests/i915_active.c        | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
index be827318275c..ef014df4c4fc 100644
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

