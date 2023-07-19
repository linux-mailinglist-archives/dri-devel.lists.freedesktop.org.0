Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEA27593E5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 13:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3A710E472;
	Wed, 19 Jul 2023 11:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED61010E46B;
 Wed, 19 Jul 2023 11:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689764894; x=1721300894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fDBNEQG+GItALLfDWVV/N8PNbHFrPGa1TLjj2FegPf0=;
 b=QU7w4aNxdC4iGvCzR9u3y3oMEpWBLf0mY7HW+NCl3OMBZM4hO18yIR89
 H0w8ZCtRWQdja9O/rO39uZV6ViFgYGQpoxx5y+GNbDHVpp6+u681FD2Sz
 RCSEQQBYjOj8cLky/GEG/kCj6H/1djZwjs0umQmLo1ab7aSb+vAe1OTzA
 mMYq68gCHVEdjr41uArqgq9H/SYHiQqrUPvcgJ+0fe4SORYxjYgICA/td
 CweTdEzRISfXL4OCYudJ+cIUJ/1ZDVbSx7wwXX5Fwn/fyXPgMMeLitsry
 fI9clYMkUM3jDaga4YHK4m832wAQzfhTp9BBAwKCn4sHz3rv2yOt+wDs2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="432617128"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="432617128"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 04:08:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="789382143"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="789382143"
Received: from schoorlx-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.251.222.155])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 04:08:11 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v6 5/9] drm/i915/gt: Refactor intel_emit_pipe_control_cs() in
 a single function
Date: Wed, 19 Jul 2023 13:07:25 +0200
Message-Id: <20230719110729.618733-6-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230719110729.618733-1-andi.shyti@linux.intel.com>
References: <20230719110729.618733-1-andi.shyti@linux.intel.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just a trivial refactoring for reducing the number of code
duplicate. This will come at handy in the next commits.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 44 +++++++++++++-----------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 7566c89d9def3..1b1dadacfbf42 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -177,23 +177,31 @@ u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv
 	return cs;
 }
 
+static u32 *intel_emit_pipe_control_cs(struct i915_request *rq, u32 bit_group_0,
+				       u32 bit_group_1, u32 offset)
+{
+	u32 *cs;
+
+	cs = intel_ring_begin(rq, 6);
+	if (IS_ERR(cs))
+		return cs;
+
+	cs = gen12_emit_pipe_control(cs, bit_group_0, bit_group_1,
+				     LRC_PPHWSP_SCRATCH_ADDR);
+	intel_ring_advance(rq, cs);
+
+	return cs;
+}
+
 static int mtl_dummy_pipe_control(struct i915_request *rq)
 {
 	/* Wa_14016712196 */
 	if (IS_MTL_GRAPHICS_STEP(rq->engine->i915, M, STEP_A0, STEP_B0) ||
-	    IS_MTL_GRAPHICS_STEP(rq->engine->i915, P, STEP_A0, STEP_B0)) {
-		u32 *cs;
-
-		/* dummy PIPE_CONTROL + depth flush */
-		cs = intel_ring_begin(rq, 6);
-		if (IS_ERR(cs))
-			return PTR_ERR(cs);
-		cs = gen12_emit_pipe_control(cs,
-					     0,
-					     PIPE_CONTROL_DEPTH_CACHE_FLUSH,
-					     LRC_PPHWSP_SCRATCH_ADDR);
-		intel_ring_advance(rq, cs);
-	}
+	    IS_MTL_GRAPHICS_STEP(rq->engine->i915, P, STEP_A0, STEP_B0))
+		intel_emit_pipe_control_cs(rq,
+					   0,
+					   PIPE_CONTROL_DEPTH_CACHE_FLUSH,
+					   LRC_PPHWSP_SCRATCH_ADDR);
 
 	return 0;
 }
@@ -210,7 +218,6 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 		u32 bit_group_0 = 0;
 		u32 bit_group_1 = 0;
 		int err;
-		u32 *cs;
 
 		err = mtl_dummy_pipe_control(rq);
 		if (err)
@@ -237,13 +244,8 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 		else if (engine->class == COMPUTE_CLASS)
 			bit_group_1 &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
 
-		cs = intel_ring_begin(rq, 6);
-		if (IS_ERR(cs))
-			return PTR_ERR(cs);
-
-		cs = gen12_emit_pipe_control(cs, bit_group_0, bit_group_1,
-					     LRC_PPHWSP_SCRATCH_ADDR);
-		intel_ring_advance(rq, cs);
+		intel_emit_pipe_control_cs(rq, bit_group_0, bit_group_1,
+					   LRC_PPHWSP_SCRATCH_ADDR);
 	}
 
 	if (mode & EMIT_INVALIDATE) {
-- 
2.40.1

