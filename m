Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D77AA6DB85
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 14:30:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641CD10E3FB;
	Mon, 24 Mar 2025 13:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f2kTrwr0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B98410E3FB;
 Mon, 24 Mar 2025 13:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742823054; x=1774359054;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lpwNkHlIqkg1GJGVRPhIXkpFAk3MWeFOqvNleve+cLQ=;
 b=f2kTrwr0525X56eXpSCRwlueL395dm1dpCL6zI7IAZ41KO1I/P//8o6j
 7KDLFnoFDI9+P1IYRfb2a/Vv/vgqrUkfee1eR4/m5Tutev0nveu6SVOXZ
 kpiayQahtrsEYyAcseETQg5LKpydaRxwei55qAzZH0tGwQMsYOhjhdJKG
 xIGCLiGgBTu2G7FM+l5k8pKB05GhVrvOk6Kzba0MNJtIEgi/VBy50TZbo
 LIgEb3gPXpW1+h27nCTivKkASHXG8vY1GQdGrjLsfMAen/CNAdANed1IP
 YOXWz2DojrmHHFv8hUl8UuKpc0JdbA7uX4/auJ8GWPC4k36yBsZGM9+NK w==;
X-CSE-ConnectionGUID: VIcVCRKHQ5ylIlRUUb7oUg==
X-CSE-MsgGUID: 7yYEa8Z0SmKt4AIDAxIiwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="44133991"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="44133991"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:30:54 -0700
X-CSE-ConnectionGUID: c6WuyvfQTge6FRNsZM6OqQ==
X-CSE-MsgGUID: 5MMW1gFXRXmxpa9EDds12g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="124209237"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.252])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:30:50 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Arshad Mehmood <arshad.mehmood@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v4 05/15] drm/i915/gem: Mark and verify UABI engine validity
Date: Mon, 24 Mar 2025 14:29:41 +0100
Message-ID: <20250324132952.1075209-6-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250324132952.1075209-1-andi.shyti@linux.intel.com>
References: <20250324132952.1075209-1-andi.shyti@linux.intel.com>
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

Mark engines as invalid when they are not added to the UABI list
to prevent accidental assignment of batch buffers.

Currently, this change is mostly precautionary with minimal
impact. However, in the future, when CCS engines will be
dynamically added and removed by the user, this mechanism will
be used for determining engine validity.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 28 +++++++++++++++++--
 drivers/gpu/drm/i915/gt/intel_engine_user.c   |  9 ++++--
 2 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 7796c4119ef5..a6448f6c8f6a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -2680,6 +2680,22 @@ eb_select_legacy_ring(struct i915_execbuffer *eb)
 	return user_ring_map[user_ring_id];
 }
 
+static bool engine_valid(struct intel_context *ce)
+{
+	if (!intel_engine_is_virtual(ce->engine))
+		return !RB_EMPTY_NODE(&ce->engine->uabi_node);
+
+	/*
+	 * TODO: check virtual sibilings; we need to walk through all the
+	 * virtual engines and ask whether the physical engine where it is based
+	 * is still valid. For each of them we need to check with
+	 * RB_EMPTY_NODE(...)
+	 *
+	 * This can be a placed in a new ce_ops.
+	 */
+	return true;
+}
+
 static int
 eb_select_engine(struct i915_execbuffer *eb)
 {
@@ -2710,8 +2726,6 @@ eb_select_engine(struct i915_execbuffer *eb)
 	eb->num_batches = ce->parallel.number_children + 1;
 	gt = ce->engine->gt;
 
-	for_each_child(ce, child)
-		intel_context_get(child);
 	eb->wakeref = intel_gt_pm_get(ce->engine->gt);
 	/*
 	 * Keep GT0 active on MTL so that i915_vma_parked() doesn't
@@ -2720,6 +2734,16 @@ eb_select_engine(struct i915_execbuffer *eb)
 	if (gt->info.id)
 		eb->wakeref_gt0 = intel_gt_pm_get(to_gt(gt->i915));
 
+	/* We need to hold the wakeref to stabilize i915->uabi_engines */
+	if (!engine_valid(ce)) {
+		intel_context_put(ce);
+		err = -ENODEV;
+		goto err;
+	}
+
+	for_each_child(ce, child)
+		intel_context_get(child);
+
 	if (!test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
 		err = intel_context_alloc_state(ce);
 		if (err)
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index 11cc06c0c785..cd7662b1ad59 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -220,7 +220,7 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 			container_of(it, typeof(*engine), uabi_list);
 
 		if (intel_gt_has_unrecoverable_error(engine->gt))
-			continue; /* ignore incomplete engines */
+			goto clear_node_continue; /* ignore incomplete engines */
 
 		GEM_BUG_ON(engine->class >= ARRAY_SIZE(uabi_classes));
 		engine->uabi_class = uabi_classes[engine->class];
@@ -242,7 +242,7 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 			      engine->uabi_instance);
 
 		if (uabi_class > I915_LAST_UABI_ENGINE_CLASS)
-			continue;
+			goto clear_node_continue;
 
 		GEM_BUG_ON(uabi_class >=
 			   ARRAY_SIZE(i915->engine_uabi_class_count));
@@ -260,6 +260,11 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
 
 		prev = &engine->uabi_node;
 		p = &prev->rb_right;
+
+		continue;
+
+clear_node_continue:
+		RB_CLEAR_NODE(&engine->uabi_node);
 	}
 
 	if (IS_ENABLED(CONFIG_DRM_I915_SELFTESTS) &&
-- 
2.47.2

