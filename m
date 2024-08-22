Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3FF95BD32
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 19:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88E110EB8E;
	Thu, 22 Aug 2024 17:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lHeRPjCr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272EF10EB8D;
 Thu, 22 Aug 2024 17:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724347754; x=1755883754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yuoaLHogE4J+aURd0F0ixJHZ0d7OeyV5+5WmcIZgjYY=;
 b=lHeRPjCrXVz0g9hkBCNTK+OTXmxdGbOl192EqTJ3hIfkKuIUQEoNjYvQ
 Jrq/nFfylFdzB5kO7ENy8fEEu0UAT6DAp8mwbXd6YBJzkjJ6UQoSOW+31
 sA1zQ32IIopNmthNDv0oztxof1K3CnFDbOXcQUtkBPXbNoAb32NiEc9p/
 F5Jc7HCeo+vaEAUfboC77eH+2nZEwUBhFzREa5LQGov6QZNhUnju5KFGT
 klheYrua68uHjG5dg9/lJ1QlyBSGtQUS/51fNWznh8PUvLwF2AHt0JQFV
 MVtx5emZNqhHACW+Ojuhg0k3BqnsM6jmyqc5XtqYAt07oGC9X+xTqKPLc A==;
X-CSE-ConnectionGUID: 1edn/fIGQTGmvDPtK8j6og==
X-CSE-MsgGUID: 5lNzCtsvSbuxM/wxgD8qpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33448271"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="33448271"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 10:29:14 -0700
X-CSE-ConnectionGUID: 4IbWwxnESDGPs9+K6tmCcA==
X-CSE-MsgGUID: xaEjc0XBQeGvDPjmQ2g9Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="61501135"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.104])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 10:29:12 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v2 05/15] drm/i915/gem: Mark and verify UABI engine validity
Date: Thu, 22 Aug 2024 19:28:22 +0200
Message-ID: <20240822172832.494994-6-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240822172832.494994-1-andi.shyti@linux.intel.com>
References: <20240822172832.494994-1-andi.shyti@linux.intel.com>
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
index c58290274f97..770875e72056 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -2682,6 +2682,22 @@ eb_select_legacy_ring(struct i915_execbuffer *eb)
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
@@ -2712,8 +2728,6 @@ eb_select_engine(struct i915_execbuffer *eb)
 	eb->num_batches = ce->parallel.number_children + 1;
 	gt = ce->engine->gt;
 
-	for_each_child(ce, child)
-		intel_context_get(child);
 	eb->wakeref = intel_gt_pm_get(ce->engine->gt);
 	/*
 	 * Keep GT0 active on MTL so that i915_vma_parked() doesn't
@@ -2722,6 +2736,16 @@ eb_select_engine(struct i915_execbuffer *eb)
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
2.45.2

