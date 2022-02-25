Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5494C3A09
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 01:06:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4718610E1D4;
	Fri, 25 Feb 2022 00:06:26 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203AB10E13C;
 Fri, 25 Feb 2022 00:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645747585; x=1677283585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3P9pMogz7OVboPMBmb9ZYQ7rxa0FSg4o3o5ghRnp1AU=;
 b=Oyp/iY4hc8V+TF6iW9tL25CDX6EFelehNF13/AkFvx5G3UUaICfUZZ27
 DkF4uZVr0gl4ZS/BTlj4ic1jMG2o0Kij1a3UvsenYxhPIeI+PBUKzKQ4W
 A2w/YwZdGx+Rz5m0e0Fpl9A0dIUpNITWsX/4f3wDSrPeTtzsrsncoFBMX
 Y/nqP5tCwQeGhnvh9a3nKFCRh6BctQsUfC3xEkREKGjLzBjtTEgxFkIwJ
 cNo7J7T7lmF8xwFw7MJEhQv5DFWXBZQ3pZyRQgz3kQ8BBIeb8e1t09ktx
 SA+ijlsYUyWZCIjsC8FvIx1/jsIpBF5iLVfoJoAai54aeOELgncuHCt77 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="277012940"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="277012940"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 16:06:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="592278971"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga008.fm.intel.com with ESMTP; 24 Feb 2022 16:06:24 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 4/8] drm/i915/guc: Split guc_lrc_desc_pin apart
Date: Thu, 24 Feb 2022 16:06:19 -0800
Message-Id: <20220225000623.1934438-5-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225000623.1934438-1-John.C.Harrison@Intel.com>
References: <20220225000623.1934438-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The LRC descriptor pool is going away. Further, the function that was
populating it was also doing a bunch of logic about the context
registration sequence. So, split that code apart into separate state
setup and try to register functions. Note that some of those 'try to
register' code paths actually undo the state setup and leave it to be
redone again later (with potentially different values). This is
inefficient. The next patch will correct this.

Also, move a comment about ignoring return values to the place where
the return values are actually ignored.

v2: Move some more splitting from a later patch (and do it correctly).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 54 +++++++++++--------
 1 file changed, 33 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index ad784e8068c7..e41e309b9e7e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -634,7 +634,7 @@ int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout)
 					      true, timeout);
 }
 
-static int guc_lrc_desc_pin(struct intel_context *ce, bool loop);
+static int try_context_registration(struct intel_context *ce, bool loop);
 
 static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
 {
@@ -932,7 +932,7 @@ static int guc_dequeue_one_context(struct intel_guc *guc)
 
 		if (unlikely(!ctx_id_mapped(guc, ce->guc_id.id) &&
 			     !intel_context_is_banned(ce))) {
-			ret = guc_lrc_desc_pin(ce, false);
+			ret = try_context_registration(ce, false);
 			if (unlikely(ret == -EPIPE)) {
 				goto deadlk;
 			} else if (ret == -EBUSY) {
@@ -2237,20 +2237,15 @@ static void guc_context_policy_init(struct intel_engine_cs *engine,
 	desc->preemption_timeout = engine->props.preempt_timeout_ms * 1000;
 }
 
-static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
+static void prepare_context_registration_info(struct intel_context *ce)
 {
 	struct intel_engine_cs *engine = ce->engine;
-	struct intel_runtime_pm *runtime_pm = engine->uncore->rpm;
 	struct intel_guc *guc = &engine->gt->uc.guc;
 	u32 desc_idx = ce->guc_id.id;
 	struct guc_lrc_desc *desc;
-	bool context_registered;
-	intel_wakeref_t wakeref;
 	struct intel_context *child;
-	int ret = 0;
 
 	GEM_BUG_ON(!engine->mask);
-	GEM_BUG_ON(!sched_state_is_init(ce));
 
 	/*
 	 * Ensure LRC + CT vmas are is same region as write barrier is done
@@ -2259,11 +2254,6 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 	GEM_BUG_ON(i915_gem_object_is_lmem(guc->ct.vma->obj) !=
 		   i915_gem_object_is_lmem(ce->ring->vma->obj));
 
-	context_registered = ctx_id_mapped(guc, desc_idx);
-
-	clr_ctx_id_mapping(guc, desc_idx);
-	set_ctx_id_mapping(guc, desc_idx, ce);
-
 	desc = __get_lrc_desc(guc, desc_idx);
 	desc->engine_class = engine_class_to_guc_class(engine->class);
 	desc->engine_submit_mask = engine->logical_mask;
@@ -2308,6 +2298,26 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
 
 		clear_children_join_go_memory(ce);
 	}
+}
+
+static int try_context_registration(struct intel_context *ce, bool loop)
+{
+	struct intel_engine_cs *engine = ce->engine;
+	struct intel_runtime_pm *runtime_pm = engine->uncore->rpm;
+	struct intel_guc *guc = &engine->gt->uc.guc;
+	intel_wakeref_t wakeref;
+	u32 desc_idx = ce->guc_id.id;
+	bool context_registered;
+	int ret = 0;
+
+	GEM_BUG_ON(!sched_state_is_init(ce));
+
+	context_registered = ctx_id_mapped(guc, desc_idx);
+
+	clr_ctx_id_mapping(guc, desc_idx);
+	set_ctx_id_mapping(guc, desc_idx, ce);
+
+	prepare_context_registration_info(ce);
 
 	/*
 	 * The context_lookup xarray is used to determine if the hardware
@@ -3145,7 +3155,7 @@ static int guc_request_alloc(struct i915_request *rq)
 	if (unlikely(ret < 0))
 		return ret;
 	if (context_needs_register(ce, !!ret)) {
-		ret = guc_lrc_desc_pin(ce, true);
+		ret = try_context_registration(ce, true);
 		if (unlikely(ret)) {	/* unwind */
 			if (ret == -EPIPE) {
 				disable_submission(guc);
@@ -3633,9 +3643,17 @@ static void guc_set_default_submission(struct intel_engine_cs *engine)
 static inline void guc_kernel_context_pin(struct intel_guc *guc,
 					  struct intel_context *ce)
 {
+	/*
+	 * Note: we purposefully do not check the returns below because
+	 * the registration can only fail if a reset is just starting.
+	 * This is called at the end of reset so presumably another reset
+	 * isn't happening and even it did this code would be run again.
+	 */
+
 	if (context_guc_id_invalid(ce))
 		pin_guc_id(guc, ce);
-	guc_lrc_desc_pin(ce, true);
+
+	try_context_registration(ce, true);
 }
 
 static inline void guc_init_lrc_mapping(struct intel_guc *guc)
@@ -3653,13 +3671,7 @@ static inline void guc_init_lrc_mapping(struct intel_guc *guc)
 	 * Also, after a reset the of the GuC we want to make sure that the
 	 * information shared with GuC is properly reset. The kernel LRCs are
 	 * not attached to the gem_context, so they need to be added separately.
-	 *
-	 * Note: we purposefully do not check the return of guc_lrc_desc_pin,
-	 * because that function can only fail if a reset is just starting. This
-	 * is at the end of reset so presumably another reset isn't happening
-	 * and even it did this code would be run again.
 	 */
-
 	for_each_engine(engine, gt, id) {
 		struct intel_context *ce;
 
-- 
2.25.1

