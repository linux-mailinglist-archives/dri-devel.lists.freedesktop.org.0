Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD3486D7CD
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 00:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A8B10E6EB;
	Thu, 29 Feb 2024 23:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OlMChqVH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AABA610E6EB;
 Thu, 29 Feb 2024 23:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709249353; x=1740785353;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+bA01XdC0cIkAiSG74UJpDn5jpqKv7/AKErJHNqRmU4=;
 b=OlMChqVH4VRNL6u3U6Fxr+zgte8+SDmhVZd1t87g610lC5JM0fWMKEs3
 92JIWcsVVNuNMM5pusgo6hFAvgGVDxjA9LrhbgEWaI3pxbj+2c4W5sgJL
 cGL0TCgg8brpzBwr4KkLikLYml5snW8VQPHbrJ+muoGz8MxGU0qsNV5j2
 A/YLLpnog4aMmGyOvfRgsVhwce5psBhFKBpYwowviddQ4xgTPFV5S1stM
 KA60fWKJctsDvV1Hxhxom7iUXylmyol945rDkR3qA60vN446Dj1CTmCSJ
 mcMt/8lLFPXotoK1kFGXbrlCkr/F03PlvPAcYfieZ+GnbX4Az3DWdod/a A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="29193389"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="29193389"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 15:29:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="38836012"
Received: from syhu-mobl2.ccr.corp.intel.com (HELO intel.com) ([10.94.248.193])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 15:29:09 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Subject: [PATCH v3 1/4] drm/i915/gt: Refactor uabi engine class/instance list
 creation
Date: Fri,  1 Mar 2024 00:28:56 +0100
Message-ID: <20240229232859.70058-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240229232859.70058-1-andi.shyti@linux.intel.com>
References: <20240229232859.70058-1-andi.shyti@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the upcoming changes we need a cleaner way to build the list
of uabi engines.

Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_user.c | 29 ++++++++++++---------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index 833987015b8b..cf8f24ad88f6 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -203,7 +203,7 @@ static void engine_rename(struct intel_engine_cs *engine, const char *name, u16
 
 void intel_engines_driver_register(struct drm_i915_private *i915)
 {
-	u16 name_instance, other_instance = 0;
+	u16 class_instance[I915_LAST_UABI_ENGINE_CLASS + 1] = { };
 	struct legacy_ring ring = {};
 	struct list_head *it, *next;
 	struct rb_node **p, *prev;
@@ -214,6 +214,8 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 	prev = NULL;
 	p = &i915->uabi_engines.rb_node;
 	list_for_each_safe(it, next, &engines) {
+		u16 uabi_class;
+
 		struct intel_engine_cs *engine =
 			container_of(it, typeof(*engine), uabi_list);
 
@@ -222,15 +224,14 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 
 		GEM_BUG_ON(engine->class >= ARRAY_SIZE(uabi_classes));
 		engine->uabi_class = uabi_classes[engine->class];
-		if (engine->uabi_class == I915_NO_UABI_CLASS) {
-			name_instance = other_instance++;
-		} else {
-			GEM_BUG_ON(engine->uabi_class >=
-				   ARRAY_SIZE(i915->engine_uabi_class_count));
-			name_instance =
-				i915->engine_uabi_class_count[engine->uabi_class]++;
-		}
-		engine->uabi_instance = name_instance;
+
+		if (engine->uabi_class == I915_NO_UABI_CLASS)
+			uabi_class = I915_LAST_UABI_ENGINE_CLASS + 1;
+		else
+			uabi_class = engine->uabi_class;
+
+		GEM_BUG_ON(uabi_class >= ARRAY_SIZE(class_instance));
+		engine->uabi_instance = class_instance[uabi_class]++;
 
 		/*
 		 * Replace the internal name with the final user and log facing
@@ -238,11 +239,15 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 		 */
 		engine_rename(engine,
 			      intel_engine_class_repr(engine->class),
-			      name_instance);
+			      engine->uabi_instance);
 
-		if (engine->uabi_class == I915_NO_UABI_CLASS)
+		if (uabi_class > I915_LAST_UABI_ENGINE_CLASS)
 			continue;
 
+		GEM_BUG_ON(uabi_class >=
+			   ARRAY_SIZE(i915->engine_uabi_class_count));
+		i915->engine_uabi_class_count[uabi_class]++;
+
 		rb_link_node(&engine->uabi_node, prev, p);
 		rb_insert_color(&engine->uabi_node, &i915->uabi_engines);
 
-- 
2.43.0

