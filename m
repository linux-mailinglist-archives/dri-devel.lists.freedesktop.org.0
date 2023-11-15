Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C16047EC10D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 12:02:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1E410E544;
	Wed, 15 Nov 2023 11:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9A910E542;
 Wed, 15 Nov 2023 11:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700046145; x=1731582145;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A1jD3pp9Ww79dbHlgMKPCb/ew2abLukNSeZGWRbQLlo=;
 b=QGKRWkd7nXUk7Z5E3hPLGhtLrzO4BnRIvjoxdu0tGSJHbt/svq4BSQoe
 xKJ/Wj+v7dBKg9qIzXe0q7GGybgMnM4dYKzVc0H9zDp2pEuinKLBm1+0I
 nLrPF89FMJTRf5U4IRZsdnDy1mTM8/uKtfIuMXk6MVbXox4+lP22DGSRr
 BTe38CZgNPWLSb1Ff2gz+XMC3gtPfq9Beoc1HLeERHKYKFlvfY4qOaJKw
 TpWoGCNrVowlfgTiwNuG7QZQOX8SVU7ecei+fdanibbttnanGAOMnBRd4
 nVLmzoLqJsj0umEOANjJiYoKtb0k1IKgALq0XUhC1p1W52BHcZF5qC0ow A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="421953828"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="421953828"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 03:02:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="799811849"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="799811849"
Received: from jcornall-mobl3.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.211.209])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 03:02:22 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/gsc: Mark internal GSC engine with reserved uabi
 class
Date: Wed, 15 Nov 2023 11:02:16 +0000
Message-Id: <20231115110216.267138-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

The GSC CS is not exposed to the user, so we skipped assigning a uabi
class number for it. However, the trace logs use the uabi class and
instance to identify the engine, so leaving uabi class unset makes the
GSC CS show up as the RCS in those logs.

Given that the engine is not exposed to the user, we can't add a new
case in the uabi enum, so we insted internally define a kernel
internal class as -1.

At the same time remove special handling for the name and complete
the uabi_classes array so internal class is automatically correctly
assigned.

Engine will show as 65535:0 other0 in the logs/traces which should
be unique enough.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Fixes: 194babe26bdc ("drm/i915/mtl: don't expose GSC command streamer to the user")
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
Daniele I borrowed most of your commit text as is, hope you don't mind but
I was lazy. See if you like this solution. It is also untested so lets see.
---
 drivers/gpu/drm/i915/gt/intel_engine_user.c | 37 ++++++++++++---------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index 118164ddbb2e..7693ccfac1f9 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -41,12 +41,15 @@ void intel_engine_add_user(struct intel_engine_cs *engine)
 	llist_add(&engine->uabi_llist, &engine->i915->uabi_engines_llist);
 }
 
+#define I915_NO_UABI_CLASS (-1)
+
 static const u8 uabi_classes[] = {
 	[RENDER_CLASS] = I915_ENGINE_CLASS_RENDER,
 	[COPY_ENGINE_CLASS] = I915_ENGINE_CLASS_COPY,
 	[VIDEO_DECODE_CLASS] = I915_ENGINE_CLASS_VIDEO,
 	[VIDEO_ENHANCEMENT_CLASS] = I915_ENGINE_CLASS_VIDEO_ENHANCE,
 	[COMPUTE_CLASS] = I915_ENGINE_CLASS_COMPUTE,
+	[OTHER_CLASS] = I915_NO_UABI_CLASS, /* Not exposed to users, no uabi class. */
 };
 
 static int engine_cmp(void *priv, const struct list_head *A,
@@ -200,6 +203,7 @@ static void engine_rename(struct intel_engine_cs *engine, const char *name, u16
 
 void intel_engines_driver_register(struct drm_i915_private *i915)
 {
+	u16 name_instance, other_instance = 0;
 	struct legacy_ring ring = {};
 	struct list_head *it, *next;
 	struct rb_node **p, *prev;
@@ -216,27 +220,28 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 		if (intel_gt_has_unrecoverable_error(engine->gt))
 			continue; /* ignore incomplete engines */
 
-		/*
-		 * We don't want to expose the GSC engine to the users, but we
-		 * still rename it so it is easier to identify in the debug logs
-		 */
-		if (engine->id == GSC0) {
-			engine_rename(engine, "gsc", 0);
-			continue;
-		}
-
 		GEM_BUG_ON(engine->class >= ARRAY_SIZE(uabi_classes));
 		engine->uabi_class = uabi_classes[engine->class];
+		if (engine->uabi_class == I915_NO_UABI_CLASS) {
+			name_instance = other_instance++;
+		} else {
+			GEM_BUG_ON(engine->uabi_class >=
+				   ARRAY_SIZE(i915->engine_uabi_class_count));
+			name_instance =
+				i915->engine_uabi_class_count[engine->uabi_class]++;
+		}
+		engine->uabi_instance = name_instance;
 
-		GEM_BUG_ON(engine->uabi_class >=
-			   ARRAY_SIZE(i915->engine_uabi_class_count));
-		engine->uabi_instance =
-			i915->engine_uabi_class_count[engine->uabi_class]++;
-
-		/* Replace the internal name with the final user facing name */
+		/*
+		 * Replace the internal name with the final user and log facing
+		 * name.
+		 */
 		engine_rename(engine,
 			      intel_engine_class_repr(engine->class),
-			      engine->uabi_instance);
+			      name_instance);
+
+		if (engine->uabi_class == I915_NO_UABI_CLASS)
+			continue;
 
 		rb_link_node(&engine->uabi_node, prev, p);
 		rb_insert_color(&engine->uabi_node, &i915->uabi_engines);
-- 
2.40.1

