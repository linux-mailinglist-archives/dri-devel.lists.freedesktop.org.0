Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F433D6AAC
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 02:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C57C732D3;
	Tue, 27 Jul 2021 00:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFD86FC38;
 Tue, 27 Jul 2021 00:05:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="191932120"
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="191932120"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 17:05:57 -0700
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="662339130"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 17:05:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 02/33] drm/i915/guc: Make hangcheck work with GuC virtual
 engines
Date: Mon, 26 Jul 2021 17:23:17 -0700
Message-Id: <20210727002348.97202-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210727002348.97202-1-matthew.brost@intel.com>
References: <20210727002348.97202-1-matthew.brost@intel.com>
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
incrementing. Which in turns means hangcheck does not work for
GuC virtual engines.

This patch updates the tracking to decompose virtual engines into
their physical constituents and tracks the request against each. This
is not entirely accurate as the GuC will only be issuing the request
to one physical engine. However, it is the best that i915 can do given
that it has no knowledge of the GuC's scheduling decisions.

Downside of this is that all physical engines constituting a GuC
virtual engine will be periodically unparked (even during just a single
context executing) in order to be pinged with a heartbeat request.
However the power and performance cost of this is not expected to be
measurable (due low frequency of heartbeat pulses) and it is considered
an easier option than trying to make changes to GuC firmware.

v2:
 (Tvrtko)
  - Update commit message
  - Have default behavior if no vfunc present

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_types.h      |  2 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 10 ++++++++++
 drivers/gpu/drm/i915/i915_request.c               |  6 +++++-
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index 3f308a920b50..75a34cd3f1c2 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -382,6 +382,8 @@ struct intel_engine_cs {
 	void		(*park)(struct intel_engine_cs *engine);
 	void		(*unpark)(struct intel_engine_cs *engine);
 
+	void		(*bump_serial)(struct intel_engine_cs *engine);
+
 	void		(*set_default_submission)(struct intel_engine_cs *engine);
 
 	const struct intel_context_ops *cops;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 8b3ae5f65cd5..6b08221df143 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1492,6 +1492,15 @@ static void guc_release(struct intel_engine_cs *engine)
 	lrc_fini_wa_ctx(engine);
 }
 
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
@@ -1835,6 +1844,7 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
 
 	ve->base.cops = &virtual_guc_context_ops;
 	ve->base.request_alloc = guc_request_alloc;
+	ve->base.bump_serial = virtual_guc_bump_serial;
 
 	ve->base.submit_request = guc_submit_request;
 
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 6594cb2f8ebd..39a21d96577e 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -669,7 +669,11 @@ bool __i915_request_submit(struct i915_request *request)
 				     request->ring->vaddr + request->postfix);
 
 	trace_i915_request_execute(request);
-	engine->serial++;
+	if (engine->bump_serial)
+		engine->bump_serial(engine);
+	else
+		engine->serial++;
+
 	result = true;
 
 	GEM_BUG_ON(test_bit(I915_FENCE_FLAG_ACTIVE, &request->fence.flags));
-- 
2.28.0

