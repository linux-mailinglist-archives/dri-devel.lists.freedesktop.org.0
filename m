Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1169F3F36F2
	for <lists+dri-devel@lfdr.de>; Sat, 21 Aug 2021 00:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB9F6EB63;
	Fri, 20 Aug 2021 22:50:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FEC66EB2C;
 Fri, 20 Aug 2021 22:50:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10082"; a="216580036"
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="216580036"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 15:50:01 -0700
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="513098575"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 15:50:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniel.vetter@ffwll.ch>,
	<tony.ye@intel.com>,
	<zhengguo.xu@intel.com>
Subject: [PATCH 06/27] drm/i915/guc: Take engine PM when a context is pinned
 with GuC submission
Date: Fri, 20 Aug 2021 15:44:25 -0700
Message-Id: <20210820224446.30620-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210820224446.30620-1-matthew.brost@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
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

v2:
 (Daniel Vetter)
  - Add might_lock annotations to pin / unpin function

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context.c       |  3 ++
 drivers/gpu/drm/i915/gt/intel_engine_pm.h     | 15 ++++++++
 drivers/gpu/drm/i915/gt/intel_gt_pm.h         | 10 ++++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 36 +++++++++++++++++--
 drivers/gpu/drm/i915/intel_wakeref.h          | 12 +++++++
 5 files changed, 73 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index c8595da64ad8..508cfe5770c0 100644
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
@@ -313,6 +315,7 @@ void __intel_context_do_unpin(struct intel_context *ce, int sub)
 		return;
 
 	CE_TRACE(ce, "unpin\n");
+	intel_engine_pm_might_put(ce->engine);
 	ce->ops->unpin(ce);
 	ce->ops->post_unpin(ce);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.h b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
index 17a5028ea177..3fe2ae1bcc26 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pm.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
@@ -9,6 +9,7 @@
 #include "i915_request.h"
 #include "intel_engine_types.h"
 #include "intel_wakeref.h"
+#include "intel_gt_pm.h"
 
 static inline bool
 intel_engine_pm_is_awake(const struct intel_engine_cs *engine)
@@ -31,6 +32,13 @@ static inline bool intel_engine_pm_get_if_awake(struct intel_engine_cs *engine)
 	return intel_wakeref_get_if_active(&engine->wakeref);
 }
 
+static inline void intel_engine_pm_might_get(struct intel_engine_cs *engine)
+{
+	if (!intel_engine_is_virtual(engine))
+		intel_wakeref_might_get(&engine->wakeref);
+	intel_gt_pm_might_get(engine->gt);
+}
+
 static inline void intel_engine_pm_put(struct intel_engine_cs *engine)
 {
 	intel_wakeref_put(&engine->wakeref);
@@ -52,6 +60,13 @@ static inline void intel_engine_pm_flush(struct intel_engine_cs *engine)
 	intel_wakeref_unlock_wait(&engine->wakeref);
 }
 
+static inline void intel_engine_pm_might_put(struct intel_engine_cs *engine)
+{
+	if (!intel_engine_is_virtual(engine))
+		intel_wakeref_might_put(&engine->wakeref);
+	intel_gt_pm_might_put(engine->gt);
+}
+
 static inline struct i915_request *
 intel_engine_create_kernel_request(struct intel_engine_cs *engine)
 {
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
index a17bf0d4592b..3c173033ce23 100644
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
index dbf919801de2..e0eed70f9b92 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1550,7 +1550,12 @@ static int guc_context_pre_pin(struct intel_context *ce,
 
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
@@ -1559,6 +1564,9 @@ static void guc_context_unpin(struct intel_context *ce)
 
 	unpin_guc_id(guc, ce);
 	lrc_unpin(ce);
+
+	if (likely(!intel_context_is_barrier(ce)))
+		intel_engine_pm_put_async(ce->engine);
 }
 
 static void guc_context_post_unpin(struct intel_context *ce)
@@ -2328,8 +2336,30 @@ static int guc_virtual_context_pre_pin(struct intel_context *ce,
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
@@ -2366,7 +2396,7 @@ static const struct intel_context_ops virtual_guc_context_ops = {
 
 	.pre_pin = guc_virtual_context_pre_pin,
 	.pin = guc_virtual_context_pin,
-	.unpin = guc_context_unpin,
+	.unpin = guc_virtual_context_unpin,
 	.post_unpin = guc_context_post_unpin,
 
 	.ban = guc_context_ban,
diff --git a/drivers/gpu/drm/i915/intel_wakeref.h b/drivers/gpu/drm/i915/intel_wakeref.h
index ef7e6a698e8a..dd530ae028e0 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.h
+++ b/drivers/gpu/drm/i915/intel_wakeref.h
@@ -124,6 +124,12 @@ enum {
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
@@ -171,6 +177,12 @@ intel_wakeref_put_delay(struct intel_wakeref *wf, unsigned long delay)
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

