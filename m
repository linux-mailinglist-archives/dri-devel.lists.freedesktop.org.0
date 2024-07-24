Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DBE93B292
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 16:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E1410E6F8;
	Wed, 24 Jul 2024 14:20:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y029SoSm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9AFA10E6F6;
 Wed, 24 Jul 2024 14:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721830828; x=1753366828;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LbsuRnA3pBGdgtWnJqzFxpL8r08AyFGJ67WO34DQ2Uo=;
 b=Y029SoSmAxoY7ABmQXln9qWyS2plz5NzHW6F3LHQAYML2EX/D72sqEQk
 Zy8DfOU/yi3TGZitHLYkTdtsJUf2PYv9KVmE9e/b55at6dqYDuK1A2YV5
 xHLVlkZqjkioAcnwX5e8MEhot7a8s1IjFoyzKlvePHXAxTWC7r+M4UBWF
 sl1aDJRw/K+79Xc9Me1z1JZPfReSbSf0mPpP01FC97okFbEfFjg5uh0Xm
 mzzrnPSuP7rBLHGZ2wI+HMr7mb6l2iqvanifBjxjU1Eh50ChVPuLeI/4J
 YHrJUkSjY8i7hGePEqKBPEY8RSRa8fRiGzyilxrxPRp4vy40WZyoRnX+h w==;
X-CSE-ConnectionGUID: Rg+GIStNS3aS8hjxuwJm4w==
X-CSE-MsgGUID: oJ84VyHnQYO3zRVjOOm7yQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="23374172"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="23374172"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 07:20:21 -0700
X-CSE-ConnectionGUID: Dzai1fPIRai1AJ8E0rRnGg==
X-CSE-MsgGUID: yJoboXJwSFGv7ZTEpEaV3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="52543697"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.179])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 07:20:17 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH] drm/i915/gt: Stop poisoning the idle kernel context alone
 when waking up
Date: Wed, 24 Jul 2024 16:17:47 +0200
Message-ID: <20240724141745.17345-3-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
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

From: Chris Wilson <chris.p.wilson@linux.intel.com>

The kernel context was poisoned on wakeup to simulate how the driver
would cope with bad HW that caused corruption of any context that was
still resident during power loss, see commit 1d0e2c9359fe ("drm/i915/gt:
Always poison the kernel_context image before unparking"). However
clearing the entire context image also poisons the ppHWSP which may
contain pertinent information (such as the breadcrumb and context
switches) that we want to preserve. We could restrict the poisoning to
exclude the ppHWSP, or more simply recognise that we have poisoned the
HW enough and can leave the verification to after suspend/resume.

References: 1d0e2c9359fe ("drm/i915/gt: Always poison the kernel_context image before unparking")
Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |  4 ++++
 drivers/gpu/drm/i915/gt/intel_engine_pm.c     | 24 -------------------
 drivers/gpu/drm/i915/gt/intel_lrc.c           | 12 ++++++----
 3 files changed, 12 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
index 8d4bb95f8424..7d69bc496283 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
@@ -127,6 +127,10 @@ reset_engine(struct intel_engine_cs *engine, struct i915_request *rq)
 		 */
 		intel_guc_find_hung_context(engine);
 
+	/* If the heartbeat failed to resume after reset, declare an emergency. */
+	if (xchg(&rq->fence.error, -ENODEV) == -ENODEV)
+		intel_gt_set_wedged(engine->gt);
+
 	intel_gt_handle_error(engine->gt, engine->mask,
 			      I915_ERROR_CAPTURE,
 			      "stopped heartbeat on %s",
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
index fb7bff27b45a..a5c42b784168 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
@@ -59,35 +59,11 @@ static int __engine_unpark(struct intel_wakeref *wf)
 {
 	struct intel_engine_cs *engine =
 		container_of(wf, typeof(*engine), wakeref);
-	struct intel_context *ce;
 
 	ENGINE_TRACE(engine, "\n");
 
 	engine->wakeref_track = intel_gt_pm_get(engine->gt);
 
-	/* Discard stale context state from across idling */
-	ce = engine->kernel_context;
-	if (ce) {
-		GEM_BUG_ON(test_bit(CONTEXT_VALID_BIT, &ce->flags));
-
-		/* Flush all pending HW writes before we touch the context */
-		while (unlikely(intel_context_inflight(ce)))
-			intel_engine_flush_submission(engine);
-
-		/* First poison the image to verify we never fully trust it */
-		dbg_poison_ce(ce);
-
-		/* Scrub the context image after our loss of control */
-		ce->ops->reset(ce);
-
-		CE_TRACE(ce, "reset { seqno:%x, *hwsp:%x, ring:%x }\n",
-			 ce->timeline->seqno,
-			 READ_ONCE(*ce->timeline->hwsp_seqno),
-			 ce->ring->emit);
-		GEM_BUG_ON(ce->timeline->seqno !=
-			   READ_ONCE(*ce->timeline->hwsp_seqno));
-	}
-
 	if (engine->unpark)
 		engine->unpark(engine);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 7bd5d2c29056..f742707b703e 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -1017,15 +1017,19 @@ void lrc_init_state(struct intel_context *ce,
 
 	set_redzone(state, engine);
 
+	/* Clear the ppHWSP (inc. per-context counters) */
+	if (!test_bit(CONTEXT_VALID_BIT, &ce->flags))
+		memset(state, 0, LRC_STATE_OFFSET);
+
 	if (ce->default_state) {
-		shmem_read(ce->default_state, 0, state, engine->context_size);
+		shmem_read(ce->default_state, /* exclude ppHWSP */
+			   LRC_STATE_OFFSET,
+			   state + LRC_STATE_OFFSET,
+			   engine->context_size - LRC_STATE_OFFSET);
 		__set_bit(CONTEXT_VALID_BIT, &ce->flags);
 		inhibit = false;
 	}
 
-	/* Clear the ppHWSP (inc. per-context counters) */
-	memset(state, 0, PAGE_SIZE);
-
 	/* Clear the indirect wa and storage */
 	if (ce->wa_bb_page)
 		memset(state + context_wa_bb_offset(ce), 0, PAGE_SIZE);
-- 
2.43.0

