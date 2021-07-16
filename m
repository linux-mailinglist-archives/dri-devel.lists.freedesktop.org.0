Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 706B73CBD48
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 22:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F4096EA25;
	Fri, 16 Jul 2021 19:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634796E9E1;
 Fri, 16 Jul 2021 19:59:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10047"; a="210596727"
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="210596727"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 12:59:39 -0700
X-IronPort-AV: E=Sophos;i="5.84,245,1620716400"; d="scan'208";a="507238939"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 12:59:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 20/51] drm/i915: Track 'serial' counts for virtual engines
Date: Fri, 16 Jul 2021 13:16:53 -0700
Message-Id: <20210716201724.54804-21-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210716201724.54804-1-matthew.brost@intel.com>
References: <20210716201724.54804-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The serial number tracking of engines happens at the backend of
request submission and was expecting to only be given physical
engines. However, in GuC submission mode, the decomposition of virtual
to physical engines does not happen in i915. Instead, requests are
submitted to their virtual engine mask all the way through to the
hardware (i.e. to GuC). This would mean that the heart beat code
thinks the physical engines are idle due to the serial number not
incrementing.

This patch updates the tracking to decompose virtual engines into
their physical constituents and tracks the request against each. This
is not entirely accurate as the GuC will only be issuing the request
to one physical engine. However, it is the best that i915 can do given
that it has no knowledge of the GuC's scheduling decisions.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_types.h     |  2 ++
 .../gpu/drm/i915/gt/intel_execlists_submission.c |  6 ++++++
 drivers/gpu/drm/i915/gt/intel_ring_submission.c  |  6 ++++++
 drivers/gpu/drm/i915/gt/mock_engine.c            |  6 ++++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c    | 16 ++++++++++++++++
 drivers/gpu/drm/i915/i915_request.c              |  4 +++-
 6 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index 1cb9c3b70b29..8ad304b2f2e4 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -388,6 +388,8 @@ struct intel_engine_cs {
 	void		(*park)(struct intel_engine_cs *engine);
 	void		(*unpark)(struct intel_engine_cs *engine);
 
+	void		(*bump_serial)(struct intel_engine_cs *engine);
+
 	void		(*set_default_submission)(struct intel_engine_cs *engine);
 
 	const struct intel_context_ops *cops;
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 28492cdce706..920707e22eb0 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -3191,6 +3191,11 @@ static void execlists_release(struct intel_engine_cs *engine)
 	lrc_fini_wa_ctx(engine);
 }
 
+static void execlist_bump_serial(struct intel_engine_cs *engine)
+{
+	engine->serial++;
+}
+
 static void
 logical_ring_default_vfuncs(struct intel_engine_cs *engine)
 {
@@ -3200,6 +3205,7 @@ logical_ring_default_vfuncs(struct intel_engine_cs *engine)
 
 	engine->cops = &execlists_context_ops;
 	engine->request_alloc = execlists_request_alloc;
+	engine->bump_serial = execlist_bump_serial;
 
 	engine->reset.prepare = execlists_reset_prepare;
 	engine->reset.rewind = execlists_reset_rewind;
diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
index 5c4d204d07cc..61469c631057 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
@@ -1047,6 +1047,11 @@ static void setup_irq(struct intel_engine_cs *engine)
 	}
 }
 
+static void ring_bump_serial(struct intel_engine_cs *engine)
+{
+	engine->serial++;
+}
+
 static void setup_common(struct intel_engine_cs *engine)
 {
 	struct drm_i915_private *i915 = engine->i915;
@@ -1066,6 +1071,7 @@ static void setup_common(struct intel_engine_cs *engine)
 
 	engine->cops = &ring_context_ops;
 	engine->request_alloc = ring_request_alloc;
+	engine->bump_serial = ring_bump_serial;
 
 	/*
 	 * Using a global execution timeline; the previous final breadcrumb is
diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/mock_engine.c
index 68970398e4ef..9203c766db80 100644
--- a/drivers/gpu/drm/i915/gt/mock_engine.c
+++ b/drivers/gpu/drm/i915/gt/mock_engine.c
@@ -292,6 +292,11 @@ static void mock_engine_release(struct intel_engine_cs *engine)
 	intel_engine_fini_retire(engine);
 }
 
+static void mock_bump_serial(struct intel_engine_cs *engine)
+{
+	engine->serial++;
+}
+
 struct intel_engine_cs *mock_engine(struct drm_i915_private *i915,
 				    const char *name,
 				    int id)
@@ -318,6 +323,7 @@ struct intel_engine_cs *mock_engine(struct drm_i915_private *i915,
 
 	engine->base.cops = &mock_context_ops;
 	engine->base.request_alloc = mock_request_alloc;
+	engine->base.bump_serial = mock_bump_serial;
 	engine->base.emit_flush = mock_emit_flush;
 	engine->base.emit_fini_breadcrumb = mock_emit_breadcrumb;
 	engine->base.submit_request = mock_submit_request;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 7b3e1c91e689..372e0dc7617a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1485,6 +1485,20 @@ static void guc_release(struct intel_engine_cs *engine)
 	lrc_fini_wa_ctx(engine);
 }
 
+static void guc_bump_serial(struct intel_engine_cs *engine)
+{
+	engine->serial++;
+}
+
+static void virtual_guc_bump_serial(struct intel_engine_cs *engine)
+{
+	struct intel_engine_cs *e;
+	intel_engine_mask_t tmp, mask = engine->mask;
+
+	for_each_engine_masked(e, engine->gt, mask, tmp)
+		e->serial++;
+}
+
 static void guc_default_vfuncs(struct intel_engine_cs *engine)
 {
 	/* Default vfuncs which can be overridden by each engine. */
@@ -1493,6 +1507,7 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
 
 	engine->cops = &guc_context_ops;
 	engine->request_alloc = guc_request_alloc;
+	engine->bump_serial = guc_bump_serial;
 
 	engine->sched_engine->schedule = i915_schedule;
 
@@ -1828,6 +1843,7 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
 
 	ve->base.cops = &virtual_guc_context_ops;
 	ve->base.request_alloc = guc_request_alloc;
+	ve->base.bump_serial = virtual_guc_bump_serial;
 
 	ve->base.submit_request = guc_submit_request;
 
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 01aa3d1ee2b1..30ecdc46a12f 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -669,7 +669,9 @@ bool __i915_request_submit(struct i915_request *request)
 				     request->ring->vaddr + request->postfix);
 
 	trace_i915_request_execute(request);
-	engine->serial++;
+	if (engine->bump_serial)
+		engine->bump_serial(engine);
+
 	result = true;
 
 	GEM_BUG_ON(test_bit(I915_FENCE_FLAG_ACTIVE, &request->fence.flags));
-- 
2.28.0

