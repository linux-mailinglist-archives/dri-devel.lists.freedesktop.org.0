Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D163A7EDD14
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 09:45:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E4610E107;
	Thu, 16 Nov 2023 08:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75E010E099;
 Thu, 16 Nov 2023 08:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700124305; x=1731660305;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GP0K4BwEFjTvLZRUeRbRgcdL7Ik8DyrkrHmz7KnLRyI=;
 b=YKGnSl7tILQZcD3HyU2JPXnccmsQLWzkMILG+6cPhEFjIMqMLslxWriq
 aES3fv0jszWKKNdI8iktLee6oUSflZDy6ar/VmwLjgMO77m3wAoHoiWAA
 HdoyMl4DGIkjlsqCHoxMU18gCSdv+i6wInbjDfutw9S3iqi6fd4cLrvJw
 k1CpaWIlDmfK0lTmR5+V0c3kCDHSCUNYLno+yJVNEgmS02MLIbrrI4vvV
 EUzxFqkZpSE3e76m8Im63JMC+v34W8M9sBkWw0j41tHtnzX3pJ/aVUf9g
 pcDvEvGX4dat3uoOwubp5LgBcPi8CZLAWa7O/shj96ThQaGDAPXZBDJEE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="9685035"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="9685035"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 00:45:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="741704719"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; d="scan'208";a="741704719"
Received: from shudso3x-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.211.151])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 00:45:01 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/gsc: Mark internal GSC engine with reserved uabi
 class
Date: Thu, 16 Nov 2023 08:44:56 +0000
Message-Id: <20231116084456.291533-1-tvrtko.ursulin@linux.intel.com>
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

v2:
 * Fix uabi class u8 vs u16 type confusion.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Fixes: 194babe26bdc ("drm/i915/mtl: don't expose GSC command streamer to the user")
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> # v1
---
 drivers/gpu/drm/i915/gt/intel_engine_user.c | 39 ++++++++++++---------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index 118164ddbb2e..833987015b8b 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -41,12 +41,15 @@ void intel_engine_add_user(struct intel_engine_cs *engine)
 	llist_add(&engine->uabi_llist, &engine->i915->uabi_engines_llist);
 }
 
-static const u8 uabi_classes[] = {
+#define I915_NO_UABI_CLASS ((u16)(-1))
+
+static const u16 uabi_classes[] = {
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

