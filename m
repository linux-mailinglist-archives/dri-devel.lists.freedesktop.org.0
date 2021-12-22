Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9EE47D95B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 23:41:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DCA810E12A;
	Wed, 22 Dec 2021 22:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FEF210E120;
 Wed, 22 Dec 2021 22:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640212853; x=1671748853;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5OP6k5DxOb45QaOIMZu5ywfYgjOIJ4QtPn4/S384yHA=;
 b=VgxWwQf7UU3er5M+3clV57H0//sYPh+HHfjy+RzYaI9soonXHszd8IOA
 8jRioL7SOS13PKjlBLSqt5PYvpiFgcxLzC7TfTO61tUTSa8+opit7wZXJ
 SUBWKpO7ij3I6RzuNq2DmhY/ewl1b7BUQbszmSizNTn9dFu5rEkhiYzBo
 qY89y22F6b9gArmhNCg6kj3qq+H9NEhzO7dgbEvZ5CbqeqmRjnnUhDXrp
 svXUo7sWNiyP7EGO5YJFiZ69duzCsGKojz5liHOnD//kMW5/7DwnsqGtZ
 LeIm2VJmEjKaWL/oXSDbPZP608B3nOoO5REtn/yYjqBou1rVD0k/C91Xw Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="264924310"
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; d="scan'208";a="264924310"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 14:40:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; d="scan'208";a="550024403"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 14:40:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915/execlists: Weak parallel submission support for
 execlists
Date: Wed, 22 Dec 2021 14:35:32 -0800
Message-Id: <20211222223532.28698-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A weak implementation of parallel submission (multi-bb execbuf IOCTL) for
execlists. Doing as little as possible to support this interface for
execlists - basically just passing submit fences between each request
generated and virtual engines are not allowed. This is on par with what
is there for the existing (hopefully soon deprecated) bonding interface.

We perma-pin these execlists contexts to align with GuC implementation.

v2:
 (John Harrison)
  - Drop siblings array as num_siblings must be 1
v3:
 (John Harrison)
  - Drop single submission
v4:
 (John Harrison)
  - Actually drop single submission
  - Use IS_ERR check on return value from intel_context_create
  - Set last request to NULL on unpin

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 11 ++++--
 drivers/gpu/drm/i915/gt/intel_context.c       |  4 +-
 .../drm/i915/gt/intel_execlists_submission.c  | 38 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_lrc.c           |  4 ++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  2 -
 5 files changed, 51 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index cad3f0b2be9e..b0d2d81fc3b3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -570,10 +570,6 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
 	struct intel_engine_cs **siblings = NULL;
 	intel_engine_mask_t prev_mask;
 
-	/* FIXME: This is NIY for execlists */
-	if (!(intel_uc_uses_guc_submission(&to_gt(i915)->uc)))
-		return -ENODEV;
-
 	if (get_user(slot, &ext->engine_index))
 		return -EFAULT;
 
@@ -583,6 +579,13 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
 	if (get_user(num_siblings, &ext->num_siblings))
 		return -EFAULT;
 
+	if (!intel_uc_uses_guc_submission(&to_gt(i915)->uc) &&
+	    num_siblings != 1) {
+		drm_dbg(&i915->drm, "Only 1 sibling (%d) supported in non-GuC mode\n",
+			num_siblings);
+		return -EINVAL;
+	}
+
 	if (slot >= set->num_engines) {
 		drm_dbg(&i915->drm, "Invalid placement value, %d >= %d\n",
 			slot, set->num_engines);
diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index ba083d800a08..5d0ec7c49b6a 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -79,7 +79,8 @@ static int intel_context_active_acquire(struct intel_context *ce)
 
 	__i915_active_acquire(&ce->active);
 
-	if (intel_context_is_barrier(ce) || intel_engine_uses_guc(ce->engine))
+	if (intel_context_is_barrier(ce) || intel_engine_uses_guc(ce->engine) ||
+	    intel_context_is_parallel(ce))
 		return 0;
 
 	/* Preallocate tracking nodes */
@@ -563,7 +564,6 @@ void intel_context_bind_parent_child(struct intel_context *parent,
 	 * Callers responsibility to validate that this function is used
 	 * correctly but we use GEM_BUG_ON here ensure that they do.
 	 */
-	GEM_BUG_ON(!intel_engine_uses_guc(parent->engine));
 	GEM_BUG_ON(intel_context_is_pinned(parent));
 	GEM_BUG_ON(intel_context_is_child(parent));
 	GEM_BUG_ON(intel_context_is_pinned(child));
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index a69df5e9e77a..be56d0b41892 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2599,6 +2599,43 @@ static void execlists_context_cancel_request(struct intel_context *ce,
 				      current->comm);
 }
 
+static struct intel_context *
+execlists_create_parallel(struct intel_engine_cs **engines,
+			  unsigned int num_siblings,
+			  unsigned int width)
+{
+	struct intel_context *parent = NULL, *ce, *err;
+	int i;
+
+	GEM_BUG_ON(num_siblings != 1);
+
+	for (i = 0; i < width; ++i) {
+		ce = intel_context_create(engines[i]);
+		if (IS_ERR(ce)) {
+			err = ce;
+			goto unwind;
+		}
+
+		if (i == 0)
+			parent = ce;
+		else
+			intel_context_bind_parent_child(parent, ce);
+	}
+
+	parent->parallel.fence_context = dma_fence_context_alloc(1);
+
+	intel_context_set_nopreempt(parent);
+	for_each_child(parent, ce)
+		intel_context_set_nopreempt(ce);
+
+	return parent;
+
+unwind:
+	if (parent)
+		intel_context_put(parent);
+	return err;
+}
+
 static const struct intel_context_ops execlists_context_ops = {
 	.flags = COPS_HAS_INFLIGHT,
 
@@ -2617,6 +2654,7 @@ static const struct intel_context_ops execlists_context_ops = {
 	.reset = lrc_reset,
 	.destroy = lrc_destroy,
 
+	.create_parallel = execlists_create_parallel,
 	.create_virtual = execlists_create_virtual,
 };
 
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index b3489599e4de..84456ffeb4cd 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -1065,6 +1065,10 @@ lrc_pin(struct intel_context *ce,
 
 void lrc_unpin(struct intel_context *ce)
 {
+	if (unlikely(ce->parallel.last_rq)) {
+		i915_request_put(ce->parallel.last_rq);
+		ce->parallel.last_rq = NULL;
+	}
 	check_redzone((void *)ce->lrc_reg_state - LRC_STATE_OFFSET,
 		      ce->engine);
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index e7517206af82..0a03a30e4c6d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3248,8 +3248,6 @@ static void guc_parent_context_unpin(struct intel_context *ce)
 	GEM_BUG_ON(!intel_context_is_parent(ce));
 	GEM_BUG_ON(!intel_engine_is_virtual(ce->engine));
 
-	if (ce->parallel.last_rq)
-		i915_request_put(ce->parallel.last_rq);
 	unpin_guc_id(guc, ce);
 	lrc_unpin(ce);
 }
-- 
2.34.1

