Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6638A75B94A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 23:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDE710E610;
	Thu, 20 Jul 2023 21:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783BB10E1C4;
 Thu, 20 Jul 2023 21:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689887309; x=1721423309;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=axBI1EawmKET8aRqSy7lz+BsiyWzGRYBaewVPc/bHgg=;
 b=bTr+D4nDB8mkBY63Voy9FtDQPBpIYcpu5vABARjPdA2nZMCsaDmbfxjI
 XQObYTHXmfKLEfXpIwKUGi2Hbk+iKtg0Ge+18ESiaUL9R/KkbE1FhzW4D
 q+F6tsbSTBpvgVGjmRzuCujGt1XXdkz3GsFlM3yg1+9/apuN391GQMGpB
 /YqRMxGtwbratWREZkQLMIwkt1dHD+XXB0EbiFrld4z0egEGCabQ7w+1e
 jvK+3MXaolbOJnqh8odJWOETP9xNt7f5Y41ufGyApyTTJyP65tvcVLhyn
 LP0qPXo3HloWuFZdZuVC98yEBiBzh2RHS9yWZD0Tp8ax7i3AIMMrKTtBG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="356848978"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="356848978"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 14:08:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="838280535"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="838280535"
Received: from sdene1-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.32.238])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 14:08:25 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v7 6/9] drm/i915/gt: Refactor intel_emit_pipe_control_cs() in
 a single function
Date: Thu, 20 Jul 2023 23:07:34 +0200
Message-Id: <20230720210737.761400-7-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230720210737.761400-1-andi.shyti@linux.intel.com>
References: <20230720210737.761400-1-andi.shyti@linux.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 linux-stable <stable@vger.kernel.org>,
 dri-evel <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just a trivial refactoring for reducing the number of code
duplicate. This will come at handy in the next commits.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: <stable@vger.kernel.org> # v5.8+
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 44 +++++++++++++-----------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 9d050b9a19194..202d6ff8b5264 100644
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
@@ -244,13 +251,8 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
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

