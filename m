Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7949F7A7A25
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 13:11:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 196AD10E483;
	Wed, 20 Sep 2023 11:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDF010E483;
 Wed, 20 Sep 2023 11:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695208301; x=1726744301;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c0SZhvlhnSQl1roMwUzMg8nEoyStVAs4NBGX89KR3Bg=;
 b=mqL4Dnb5Qx/63JX2YZk0v8gO1zWmu5op5DZbsPFjFJBufu2z8BYm/XMk
 IW/szEYWBTf6YXZaao4+Ih4wxa4y4ylKRWIB7IlZYlind5G6cZtyhrWgX
 CDiwkc8nUXpSFYDYTDl01o8uR9eKnvsnGdaHgaswo8FoHh/a6pCzVz993
 36SZKc9p07iBIX8MoC1/z80NukWrgF/k6C46UaEp51YlMr5mYX2pnNva2
 FCDVVdxhRxmpgoQEfUggbUV6nj1s8C9dnNSpgfxt3jzOg1bycl7TKpdcT
 dWZp7a6JG46N/kWc+VySzo1q49Ibe6uQ518tF0v8wZnmjqc/A2TrThYpZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="384038946"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="384038946"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 04:11:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="775960934"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; d="scan'208";a="775960934"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 04:11:37 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Remove unnecessary memory quiescing for aux inval
Date: Wed, 20 Sep 2023 13:11:31 +0200
Message-ID: <20230920111131.2696-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mark Janes <mark.janes@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i915 already does memory quiesce before signaling
breadcrumb so remove extra memory quiescing for aux
invalidation which can cause unnecessary side effects.

Fixes: 78a6ccd65fa3 ("drm/i915/gt: Ensure memory quiesced before invalidation")
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: <stable@vger.kernel.org> # v5.8+
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Cc: Tapani Pälli <tapani.palli@intel.com>
Cc: Mark Janes <mark.janes@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 50 ++++++++++++------------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 0143445dba83..5001670046a0 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -248,11 +248,7 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 {
 	struct intel_engine_cs *engine = rq->engine;
 
-	/*
-	 * On Aux CCS platforms the invalidation of the Aux
-	 * table requires quiescing memory traffic beforehand
-	 */
-	if (mode & EMIT_FLUSH || gen12_needs_ccs_aux_inv(engine)) {
+	if (mode & EMIT_FLUSH) {
 		u32 bit_group_0 = 0;
 		u32 bit_group_1 = 0;
 		int err;
@@ -264,13 +260,6 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 
 		bit_group_0 |= PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
 
-		/*
-		 * When required, in MTL and beyond platforms we
-		 * need to set the CCS_FLUSH bit in the pipe control
-		 */
-		if (GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70))
-			bit_group_0 |= PIPE_CONTROL_CCS_FLUSH;
-
 		bit_group_1 |= PIPE_CONTROL_TILE_CACHE_FLUSH;
 		bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
 		bit_group_1 |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
@@ -800,14 +789,15 @@ u32 *gen12_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs)
 {
 	struct drm_i915_private *i915 = rq->i915;
 	struct intel_gt *gt = rq->engine->gt;
-	u32 flags = (PIPE_CONTROL_CS_STALL |
-		     PIPE_CONTROL_TLB_INVALIDATE |
-		     PIPE_CONTROL_TILE_CACHE_FLUSH |
-		     PIPE_CONTROL_FLUSH_L3 |
-		     PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
-		     PIPE_CONTROL_DEPTH_CACHE_FLUSH |
-		     PIPE_CONTROL_DC_FLUSH_ENABLE |
-		     PIPE_CONTROL_FLUSH_ENABLE);
+	u32 bit_group_0 = PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
+	u32 bit_group_1 = (PIPE_CONTROL_CS_STALL |
+			   PIPE_CONTROL_TLB_INVALIDATE |
+			   PIPE_CONTROL_TILE_CACHE_FLUSH |
+			   PIPE_CONTROL_FLUSH_L3 |
+			   PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
+			   PIPE_CONTROL_DEPTH_CACHE_FLUSH |
+			   PIPE_CONTROL_DC_FLUSH_ENABLE |
+			   PIPE_CONTROL_FLUSH_ENABLE);
 
 	/* Wa_14016712196 */
 	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)) || IS_DG2(i915))
@@ -817,14 +807,26 @@ u32 *gen12_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs)
 
 	if (GRAPHICS_VER(i915) == 12 && GRAPHICS_VER_FULL(i915) < IP_VER(12, 50))
 		/* Wa_1409600907 */
-		flags |= PIPE_CONTROL_DEPTH_STALL;
+		bit_group_1 |= PIPE_CONTROL_DEPTH_STALL;
 
 	if (!HAS_3D_PIPELINE(rq->i915))
-		flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
+		bit_group_1 &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
 	else if (rq->engine->class == COMPUTE_CLASS)
-		flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
+		bit_group_1 &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
+
+	/*
+	 * On Aux CCS platforms the invalidation of the Aux
+	 * table requires quiescing memory traffic beforehand.
+	 * gen12_emit_fini_breadcrumb_rcs() does this for us as
+	 * all memory traffic has to be completed before we signal
+	 * the breadcrumb. In MTL and beyond platforms, we need to also
+	 * add CCS_FLUSH bit in the pipe control for that purpose.
+	 */
+
+	if (GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70))
+		bit_group_0 |= PIPE_CONTROL_CCS_FLUSH;
 
-	cs = gen12_emit_pipe_control(cs, PIPE_CONTROL0_HDC_PIPELINE_FLUSH, flags, 0);
+	cs = gen12_emit_pipe_control(cs, bit_group_0, bit_group_1, 0);
 
 	/*XXX: Look at gen8_emit_fini_breadcrumb_rcs */
 	cs = gen12_emit_ggtt_write_rcs(cs,
-- 
2.41.0

