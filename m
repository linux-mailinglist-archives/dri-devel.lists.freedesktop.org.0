Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 881E13AAC50
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 08:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6766E88B;
	Thu, 17 Jun 2021 06:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC446E876;
 Thu, 17 Jun 2021 06:30:43 +0000 (UTC)
IronPort-SDR: Ad2hk4Rt1OLbUySqlG0/fUsFZZUp2yhsgy1NW0GA3U9+c4LP1jEqlBf6E0vBgJmF5zNFvKIdWy
 Hq0ah/6Qdb5g==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="203287826"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="203287826"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 23:30:43 -0700
IronPort-SDR: KBAOJZZlvzWrR3or/WeIw76GzI+/uhrmf8jnKaRP1D4RTcqyYngff9s7YkqnodJYniaGAjAOE5
 H5XC/gnJhEPA==
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="554302697"
Received: from vanderss-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.193])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 23:30:41 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 06/12] drm/i915/gt: Export the pinned context constructor
 and destructor
Date: Thu, 17 Jun 2021 08:30:12 +0200
Message-Id: <20210617063018.92802-7-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617063018.92802-1-thomas.hellstrom@linux.intel.com>
References: <20210617063018.92802-1-thomas.hellstrom@linux.intel.com>
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
Cc: matthew.auld@intel.com, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Allow internal clients to create and destroy a pinned context.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
v2:
- (Thomas) Export also the pinned context destructor
---
 drivers/gpu/drm/i915/gt/intel_engine.h    | 11 +++++++++
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 27 ++++++++++++++---------
 2 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
index 8d9184920c51..36ea9eb52bb5 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine.h
@@ -19,7 +19,9 @@
 #include "intel_workarounds.h"
 
 struct drm_printer;
+struct intel_context;
 struct intel_gt;
+struct lock_class_key;
 
 /* Early gen2 devices have a cacheline of just 32 bytes, using 64 is overkill,
  * but keeps the logic simple. Indeed, the whole purpose of this macro is just
@@ -256,6 +258,15 @@ struct i915_request *
 intel_engine_find_active_request(struct intel_engine_cs *engine);
 
 u32 intel_engine_context_size(struct intel_gt *gt, u8 class);
+struct intel_context *
+intel_engine_create_pinned_context(struct intel_engine_cs *engine,
+				   struct i915_address_space *vm,
+				   unsigned int ring_size,
+				   unsigned int hwsp,
+				   struct lock_class_key *key,
+				   const char *name);
+
+void intel_engine_destroy_pinned_context(struct intel_context *ce);
 
 void intel_engine_init_active(struct intel_engine_cs *engine,
 			      unsigned int subclass);
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 9ceddfbb1687..fcbaad18ac91 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -810,11 +810,13 @@ intel_engine_init_active(struct intel_engine_cs *engine, unsigned int subclass)
 #endif
 }
 
-static struct intel_context *
-create_pinned_context(struct intel_engine_cs *engine,
-		      unsigned int hwsp,
-		      struct lock_class_key *key,
-		      const char *name)
+struct intel_context *
+intel_engine_create_pinned_context(struct intel_engine_cs *engine,
+				   struct i915_address_space *vm,
+				   unsigned int ring_size,
+				   unsigned int hwsp,
+				   struct lock_class_key *key,
+				   const char *name)
 {
 	struct intel_context *ce;
 	int err;
@@ -825,6 +827,10 @@ create_pinned_context(struct intel_engine_cs *engine,
 
 	__set_bit(CONTEXT_BARRIER_BIT, &ce->flags);
 	ce->timeline = page_pack_bits(NULL, hwsp);
+	ce->ring = __intel_context_ring_size(ring_size);
+
+	i915_vm_put(ce->vm);
+	ce->vm = i915_vm_get(vm);
 
 	err = intel_context_pin(ce); /* perma-pin so it is always available */
 	if (err) {
@@ -843,7 +849,7 @@ create_pinned_context(struct intel_engine_cs *engine,
 	return ce;
 }
 
-static void destroy_pinned_context(struct intel_context *ce)
+void intel_engine_destroy_pinned_context(struct intel_context *ce)
 {
 	struct intel_engine_cs *engine = ce->engine;
 	struct i915_vma *hwsp = engine->status_page.vma;
@@ -863,8 +869,9 @@ create_kernel_context(struct intel_engine_cs *engine)
 {
 	static struct lock_class_key kernel;
 
-	return create_pinned_context(engine, I915_GEM_HWS_SEQNO_ADDR,
-				     &kernel, "kernel_context");
+	return intel_engine_create_pinned_context(engine, engine->gt->vm, SZ_4K,
+						  I915_GEM_HWS_SEQNO_ADDR,
+						  &kernel, "kernel_context");
 }
 
 /**
@@ -907,7 +914,7 @@ static int engine_init_common(struct intel_engine_cs *engine)
 	return 0;
 
 err_context:
-	destroy_pinned_context(ce);
+	intel_engine_destroy_pinned_context(ce);
 	return ret;
 }
 
@@ -969,7 +976,7 @@ void intel_engine_cleanup_common(struct intel_engine_cs *engine)
 		fput(engine->default_state);
 
 	if (engine->kernel_context)
-		destroy_pinned_context(engine->kernel_context);
+		intel_engine_destroy_pinned_context(engine->kernel_context);
 
 	GEM_BUG_ON(!llist_empty(&engine->barrier_tasks));
 	cleanup_status_page(engine);
-- 
2.31.1

