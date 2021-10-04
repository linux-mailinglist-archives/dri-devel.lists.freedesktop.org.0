Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A474219BA
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 00:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25C4898C7;
	Mon,  4 Oct 2021 22:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DECA6E21D;
 Mon,  4 Oct 2021 22:11:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="248854263"
X-IronPort-AV: E=Sophos;i="5.85,347,1624345200"; d="scan'208";a="248854263"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 15:11:30 -0700
X-IronPort-AV: E=Sophos;i="5.85,347,1624345200"; d="scan'208";a="487735457"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 15:11:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <john.c.harrison@intel.com>,
	<daniele.ceraolospurio@intel.com>
Subject: [PATCH 03/26] drm/i915/guc: Take engine PM when a context is pinned
 with GuC submission
Date: Mon,  4 Oct 2021 15:06:14 -0700
Message-Id: <20211004220637.14746-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211004220637.14746-1-matthew.brost@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
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

Taking a PM reference to prevent intel_gt_wait_for_idle from short
circuiting while a scheduling of user context could be enabled.
Returning GT idle when it is not can cause all sorts of issues
throughout the stack.

v2:
 (Daniel Vetter)
  - Add might_lock annotations to pin / unpin function
v3:
 (CI)
  - Drop intel_engine_pm_might_put from unpin path as an async put is
    used
v4:
 (John Harrison)
  - Make intel_engine_pm_might_get/put work with GuC virtual engines
  - Update commit message

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.c       |  2 ++
 drivers/gpu/drm/i915/gt/intel_engine_pm.h     | 32 +++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_pm.h         | 10 ++++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 36 +++++++++++++++++--
 drivers/gpu/drm/i915/intel_wakeref.h          | 12 +++++++
 5 files changed, 89 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index 1076066f41e0..f601323b939f 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -240,6 +240,8 @@ int __intel_context_do_pin_ww(struct intel_context *ce,
 	if (err)
 		goto err_post_unpin;
 
+	intel_engine_pm_might_get(ce->engine);
+
 	if (unlikely(intel_context_is_closed(ce))) {
 		err = -ENOENT;
 		goto err_unlock;
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.h b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
index 6fdeae668e6e..d68675925b79 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pm.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
@@ -6,9 +6,11 @@
 #ifndef INTEL_ENGINE_PM_H
 #define INTEL_ENGINE_PM_H
 
+#include "i915_drv.h"
 #include "i915_request.h"
 #include "intel_engine_types.h"
 #include "intel_wakeref.h"
+#include "intel_gt_pm.h"
 
 static inline bool
 intel_engine_pm_is_awake(const struct intel_engine_cs *engine)
@@ -31,6 +33,21 @@ static inline bool intel_engine_pm_get_if_awake(struct intel_engine_cs *engine)
 	return intel_wakeref_get_if_active(&engine->wakeref);
 }
 
+static inline void intel_engine_pm_might_get(struct intel_engine_cs *engine)
+{
+	if (!intel_engine_is_virtual(engine)) {
+		intel_wakeref_might_get(&engine->wakeref);
+	} else {
+		struct intel_gt *gt = engine->gt;
+		struct intel_engine_cs *tengine;
+		intel_engine_mask_t tmp, mask = engine->mask;
+
+		for_each_engine_masked(tengine, gt, mask, tmp)
+			intel_wakeref_might_get(&tengine->wakeref);
+	}
+	intel_gt_pm_might_get(engine->gt);
+}
+
 static inline void intel_engine_pm_put(struct intel_engine_cs *engine)
 {
 	intel_wakeref_put(&engine->wakeref);
@@ -52,6 +69,21 @@ static inline void intel_engine_pm_flush(struct intel_engine_cs *engine)
 	intel_wakeref_unlock_wait(&engine->wakeref);
 }
 
+static inline void intel_engine_pm_might_put(struct intel_engine_cs *engine)
+{
+	if (!intel_engine_is_virtual(engine)) {
+		intel_wakeref_might_put(&engine->wakeref);
+	} else {
+		struct intel_gt *gt = engine->gt;
+		struct intel_engine_cs *tengine;
+		intel_engine_mask_t tmp, mask = engine->mask;
+
+		for_each_engine_masked(tengine, gt, mask, tmp)
+			intel_wakeref_might_put(&tengine->wakeref);
+	}
+	intel_gt_pm_might_put(engine->gt);
+}
+
 static inline struct i915_request *
 intel_engine_create_kernel_request(struct intel_engine_cs *engine)
 {
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
index 05de6c1af25b..bc898df7a48c 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
@@ -31,6 +31,11 @@ static inline bool intel_gt_pm_get_if_awake(struct intel_gt *gt)
 	return intel_wakeref_get_if_active(&gt->wakeref);
 }
 
+static inline void intel_gt_pm_might_get(struct intel_gt *gt)
+{
+	intel_wakeref_might_get(&gt->wakeref);
+}
+
 static inline void intel_gt_pm_put(struct intel_gt *gt)
 {
 	intel_wakeref_put(&gt->wakeref);
@@ -41,6 +46,11 @@ static inline void intel_gt_pm_put_async(struct intel_gt *gt)
 	intel_wakeref_put_async(&gt->wakeref);
 }
 
+static inline void intel_gt_pm_might_put(struct intel_gt *gt)
+{
+	intel_wakeref_might_put(&gt->wakeref);
+}
+
 #define with_intel_gt_pm(gt, tmp) \
 	for (tmp = 1, intel_gt_pm_get(gt); tmp; \
 	     intel_gt_pm_put(gt), tmp = 0)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 17da2fea1bff..8b82da50c2bc 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1571,7 +1571,12 @@ static int guc_context_pre_pin(struct intel_context *ce,
 
 static int guc_context_pin(struct intel_context *ce, void *vaddr)
 {
-	return __guc_context_pin(ce, ce->engine, vaddr);
+	int ret = __guc_context_pin(ce, ce->engine, vaddr);
+
+	if (likely(!ret && !intel_context_is_barrier(ce)))
+		intel_engine_pm_get(ce->engine);
+
+	return ret;
 }
 
 static void guc_context_unpin(struct intel_context *ce)
@@ -1580,6 +1585,9 @@ static void guc_context_unpin(struct intel_context *ce)
 
 	unpin_guc_id(guc, ce);
 	lrc_unpin(ce);
+
+	if (likely(!intel_context_is_barrier(ce)))
+		intel_engine_pm_put_async(ce->engine);
 }
 
 static void guc_context_post_unpin(struct intel_context *ce)
@@ -2341,8 +2349,30 @@ static int guc_virtual_context_pre_pin(struct intel_context *ce,
 static int guc_virtual_context_pin(struct intel_context *ce, void *vaddr)
 {
 	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
+	int ret = __guc_context_pin(ce, engine, vaddr);
+	intel_engine_mask_t tmp, mask = ce->engine->mask;
+
+	if (likely(!ret))
+		for_each_engine_masked(engine, ce->engine->gt, mask, tmp)
+			intel_engine_pm_get(engine);
 
-	return __guc_context_pin(ce, engine, vaddr);
+	return ret;
+}
+
+static void guc_virtual_context_unpin(struct intel_context *ce)
+{
+	intel_engine_mask_t tmp, mask = ce->engine->mask;
+	struct intel_engine_cs *engine;
+	struct intel_guc *guc = ce_to_guc(ce);
+
+	GEM_BUG_ON(context_enabled(ce));
+	GEM_BUG_ON(intel_context_is_barrier(ce));
+
+	unpin_guc_id(guc, ce);
+	lrc_unpin(ce);
+
+	for_each_engine_masked(engine, ce->engine->gt, mask, tmp)
+		intel_engine_pm_put_async(engine);
 }
 
 static void guc_virtual_context_enter(struct intel_context *ce)
@@ -2379,7 +2409,7 @@ static const struct intel_context_ops virtual_guc_context_ops = {
 
 	.pre_pin = guc_virtual_context_pre_pin,
 	.pin = guc_virtual_context_pin,
-	.unpin = guc_context_unpin,
+	.unpin = guc_virtual_context_unpin,
 	.post_unpin = guc_context_post_unpin,
 
 	.ban = guc_context_ban,
diff --git a/drivers/gpu/drm/i915/intel_wakeref.h b/drivers/gpu/drm/i915/intel_wakeref.h
index 545c8f277c46..4f4c2e15e736 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.h
+++ b/drivers/gpu/drm/i915/intel_wakeref.h
@@ -123,6 +123,12 @@ enum {
 	__INTEL_WAKEREF_PUT_LAST_BIT__
 };
 
+static inline void
+intel_wakeref_might_get(struct intel_wakeref *wf)
+{
+	might_lock(&wf->mutex);
+}
+
 /**
  * intel_wakeref_put_flags: Release the wakeref
  * @wf: the wakeref
@@ -170,6 +176,12 @@ intel_wakeref_put_delay(struct intel_wakeref *wf, unsigned long delay)
 			    FIELD_PREP(INTEL_WAKEREF_PUT_DELAY, delay));
 }
 
+static inline void
+intel_wakeref_might_put(struct intel_wakeref *wf)
+{
+	might_lock(&wf->mutex);
+}
+
 /**
  * intel_wakeref_lock: Lock the wakeref (mutex)
  * @wf: the wakeref
-- 
2.32.0

