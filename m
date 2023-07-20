Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B78675B952
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 23:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F7B10E1C9;
	Thu, 20 Jul 2023 21:08:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B2810E1B9;
 Thu, 20 Jul 2023 21:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689887327; x=1721423327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A77xSGy2BM/xxMewsoLqoJlbw+7ke1qf8Iu5vvDcdPc=;
 b=kiW9MR67XBY3qA1tKxeOlUQKaT7Q87GER5vlvWsPaoaecHbpwmqk+ncn
 G4R7euEBo85lE0RqKu9PV/geTinphhohHbtHBq+qbWIzgDdfS1Fqw0Dg2
 0EJfwgWqCitmHNx9V5mwkaYtdxnp9/8GX8Q7qWwJ91DgT7GxajO2F68GY
 XKE7EFZD9CpZ36q0765Q1XqDCgCS9GvcmCA/Ppq7g/I0D65VT79mWOajc
 sim5S325y1jU9KVS3F2OMITx/2e8yaPJOnneEjXsTh200Cwih6BinZzqa
 4tb44qQA2x7Yo5nn7KDQfwdILY1+G4fk0msGC/qDfjkkc0swAlQ1RTRJf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="356849021"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="356849021"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 14:08:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="838280685"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="838280685"
Received: from sdene1-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.32.238])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 14:08:44 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v7 8/9] drm/i915/gt: Poll aux invalidation register bit on
 invalidation
Date: Thu, 20 Jul 2023 23:07:36 +0200
Message-Id: <20230720210737.761400-9-andi.shyti@linux.intel.com>
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
index b6dd22eb2d9b2..3ded597f002a2 100644
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
@@ -332,7 +339,7 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
 	 * table requires quiescing memory traffic beforehand
 	 */
 	if (aux_inv) {
-		cmd += 4; /* for the AUX invalidation */
+		cmd += 8; /* for the AUX invalidation */
 		cmd += 2; /* for the engine quiescing */
 
 		cmd_flush = MI_FLUSH_DW;
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

