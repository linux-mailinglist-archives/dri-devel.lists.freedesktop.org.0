Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 714BA7593EE
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 13:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA1610E477;
	Wed, 19 Jul 2023 11:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5D810E474;
 Wed, 19 Jul 2023 11:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689764912; x=1721300912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N1/f7eHpD3wncHsxl/HrkcBG8S0cn6TBumJQPowD3Pk=;
 b=UUSvNpXte8KKE5ugw+pax+4zoRnlp87NMVBSg9YSHvFeRHj5bnob2q4e
 FjpZEvv+3L5qGmr9rzVJjkqtLsJ7BEzvVG/bJBIoIsJZMAitr8hSyRVcE
 4kdaEBRODu3WTLcuC+dcHZmB+qIymo6oF7D/Bi6aYa+t+iIO9csOJ0qSz
 qVusfTJ9exHAVTlprnaQR+Mp+b7bf8I6j6oK9NeucA1ZSYJKaIp6P/hPu
 K2n8/0m39HIYvvAdCy2uzjQhp14FrA2jc1Ku/PWRjKkOsWSbOnxNsFp2F
 iIki4ULd0o1jZU+cMFSubY9OICU3Edq0QDTXOfgV9gaPvX/EsdssLMOCq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="369991976"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="369991976"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 04:08:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="701254225"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="701254225"
Received: from schoorlx-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.251.222.155])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 04:08:28 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v6 8/9] drm/i915/gt: Poll aux invalidation register bit on
 invalidation
Date: Wed, 19 Jul 2023 13:07:28 +0200
Message-Id: <20230719110729.618733-9-andi.shyti@linux.intel.com>
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

From: Jonathan Cavitt <jonathan.cavitt@intel.com>

For platforms that use Aux CCS, wait for aux invalidation to
complete by checking the aux invalidation register bit is
cleared.

Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: <stable@vger.kernel.org> # v5.8+
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 17 ++++++++++++-----
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  1 +
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 78bbd55262a2d..bedd1586c978f 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -172,7 +172,15 @@ u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv
 	*cs++ = MI_LOAD_REGISTER_IMM(1) | MI_LRI_MMIO_REMAP_EN;
 	*cs++ = i915_mmio_reg_offset(inv_reg) + gsi_offset;
 	*cs++ = AUX_INV;
-	*cs++ = MI_NOOP;
+
+	*cs++ = MI_SEMAPHORE_WAIT_TOKEN |
+		MI_SEMAPHORE_REGISTER_POLL |
+		MI_SEMAPHORE_POLL |
+		MI_SEMAPHORE_SAD_EQ_SDD;
+	*cs++ = 0;
+	*cs++ = i915_mmio_reg_offset(inv_reg) + gsi_offset;
+	*cs++ = 0;
+	*cs++ = 0;
 
 	return cs;
 }
@@ -282,10 +290,9 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 		else if (engine->class == COMPUTE_CLASS)
 			flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
 
+		count = 8;
 		if (HAS_AUX_CCS(rq->engine->i915))
-			count = 8 + 4;
-		else
-			count = 8;
+			count += 8;
 
 		cs = intel_ring_begin(rq, count);
 		if (IS_ERR(cs))
@@ -335,7 +342,7 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
 		u32 bit_group_0 = 0;
 		u32 bit_group_1 = 0;
 
-		cmd += 4;
+		cmd += 8;
 
 		bit_group_0 |= PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
index 5df7cce23197c..2bd8d98d21102 100644
--- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
+++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
@@ -121,6 +121,7 @@
 #define   MI_SEMAPHORE_TARGET(engine)	((engine)<<15)
 #define MI_SEMAPHORE_WAIT	MI_INSTR(0x1c, 2) /* GEN8+ */
 #define MI_SEMAPHORE_WAIT_TOKEN	MI_INSTR(0x1c, 3) /* GEN12+ */
+#define   MI_SEMAPHORE_REGISTER_POLL	(1 << 16)
 #define   MI_SEMAPHORE_POLL		(1 << 15)
 #define   MI_SEMAPHORE_SAD_GT_SDD	(0 << 12)
 #define   MI_SEMAPHORE_SAD_GTE_SDD	(1 << 12)
-- 
2.40.1

