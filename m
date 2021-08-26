Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA38D3F82B4
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 08:48:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74ECE6E519;
	Thu, 26 Aug 2021 06:48:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D5EC6E513;
 Thu, 26 Aug 2021 06:48:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="204816334"
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="204816334"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 23:48:01 -0700
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="516381278"
Received: from lapeders-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.132])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 23:47:58 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Brost Matthew <matthew.brost@intel.com>
Subject: [PATCH] drm/i915/gt: Register the migrate contexts with their engines
Date: Thu, 26 Aug 2021 08:47:50 +0200
Message-Id: <20210826064750.372557-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Pinned contexts, like the migrate contexts need reset after resume
since their context image may have been lost. Also the GuC needs to
register pinned contexts.

Add a list to struct intel_engine_cs where we add all pinned contexts on
creation, and traverse that list at __engine_unpark() time to reset the
pinned contexts.

This fixes the kms_pipe_crc_basic@suspend-read-crc-pipe-a selftest for now,
but proper LMEM backup / restore is needed for full suspend functionality.
However, note that even with full LMEM backup / restore it may be
desirable to keep the reset since backing up the migrate context images
must happen using memcpy() after the migrate context has become inactive,
and for performance- and other reasons we want to avoid memcpy() from
LMEM.

Also traverse the list at guc_init_lrc_mapping() calling
guc_kernel_context_pin() for the pinned contexts, like is already done
for the kernel context.

Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Brost Matthew <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_context_types.h     |  8 ++++++++
 drivers/gpu/drm/i915/gt/intel_engine_cs.c         |  4 ++++
 drivers/gpu/drm/i915/gt/intel_engine_pm.c         |  9 +++++++++
 drivers/gpu/drm/i915/gt/intel_engine_types.h      |  7 +++++++
 drivers/gpu/drm/i915/gt/mock_engine.c             |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 10 +++++++---
 6 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
index e54351a170e2..a63631ea0ec4 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
@@ -152,6 +152,14 @@ struct intel_context {
 	/** sseu: Control eu/slice partitioning */
 	struct intel_sseu sseu;
 
+	/**
+	 * pinned_contexts_link: List link for the engine's pinned contexts.
+	 * This is only used if this is a perma-pinned kernel context and
+	 * the list is assumed to only be manipulated during driver load
+	 * or unload time so no mutex protection currently.
+	 */
+	struct list_head pinned_contexts_link;
+
 	u8 wa_bb_page; /* if set, page num reserved for context workarounds */
 
 	struct {
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 332efea696a5..c606a4714904 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -320,6 +320,7 @@ static int intel_engine_setup(struct intel_gt *gt, enum intel_engine_id id)
 
 	BUILD_BUG_ON(BITS_PER_TYPE(engine->mask) < I915_NUM_ENGINES);
 
+	INIT_LIST_HEAD(&engine->pinned_contexts_list);
 	engine->id = id;
 	engine->legacy_idx = INVALID_ENGINE;
 	engine->mask = BIT(id);
@@ -875,6 +876,8 @@ intel_engine_create_pinned_context(struct intel_engine_cs *engine,
 		return ERR_PTR(err);
 	}
 
+	list_add_tail(&ce->pinned_contexts_link, &engine->pinned_contexts_list);
+
 	/*
 	 * Give our perma-pinned kernel timelines a separate lockdep class,
 	 * so that we can use them from within the normal user timelines
@@ -897,6 +900,7 @@ void intel_engine_destroy_pinned_context(struct intel_context *ce)
 	list_del(&ce->timeline->engine_link);
 	mutex_unlock(&hwsp->vm->mutex);
 
+	list_del(&ce->pinned_contexts_link);
 	intel_context_unpin(ce);
 	intel_context_put(ce);
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
index 1f07ac4e0672..3a5cbbf3e3fe 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
@@ -72,6 +72,15 @@ static int __engine_unpark(struct intel_wakeref *wf)
 			   READ_ONCE(*ce->timeline->hwsp_seqno));
 	}
 
+	list_for_each_entry(ce, &engine->pinned_contexts_list,
+			    pinned_contexts_link) {
+		if (ce == engine->kernel_context)
+			continue;
+
+		dbg_poison_ce(ce);
+		ce->ops->reset(ce);
+	}
+
 	if (engine->unpark)
 		engine->unpark(engine);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index bfbfe53c23dd..5ae1207c363b 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -307,6 +307,13 @@ struct intel_engine_cs {
 
 	struct intel_context *kernel_context; /* pinned */
 
+	/**
+	 * pinned_contexts_list: List of pinned contexts. This list is only
+	 * assumed to be manipulated during driver load- or unload time and
+	 * does therefore not have any additional protection.
+	 */
+	struct list_head pinned_contexts_list;
+
 	intel_engine_mask_t saturated; /* submitting semaphores too late? */
 
 	struct {
diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/mock_engine.c
index 2c1af030310c..8a14982a9691 100644
--- a/drivers/gpu/drm/i915/gt/mock_engine.c
+++ b/drivers/gpu/drm/i915/gt/mock_engine.c
@@ -376,6 +376,7 @@ int mock_engine_init(struct intel_engine_cs *engine)
 {
 	struct intel_context *ce;
 
+	INIT_LIST_HEAD(&engine->pinned_contexts_list);
 	engine->sched_engine = i915_sched_engine_create(ENGINE_MOCK);
 	if (!engine->sched_engine)
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 87d8dc8f51b9..55709206b95e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2385,9 +2385,13 @@ static inline void guc_init_lrc_mapping(struct intel_guc *guc)
 	 * and even it did this code would be run again.
 	 */
 
-	for_each_engine(engine, gt, id)
-		if (engine->kernel_context)
-			guc_kernel_context_pin(guc, engine->kernel_context);
+	for_each_engine(engine, gt, id) {
+		struct intel_context *ce;
+
+		list_for_each_entry(ce, &engine->pinned_contexts_list,
+				    pinned_contexts_link)
+			guc_kernel_context_pin(guc, ce);
+	}
 }
 
 static void guc_release(struct intel_engine_cs *engine)
-- 
2.31.1

