Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A59F73A83B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 20:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A641C10E597;
	Thu, 22 Jun 2023 18:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2E710E597;
 Thu, 22 Jun 2023 18:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687458487; x=1718994487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oDGnrM8mPdOzz/LaBZ/fq0QjNJDKpZ9c/B2SP3KZECM=;
 b=UI7wl+7vIxFGo90LQa6kNEcNV2bN2FUWrj9qFKDVwUHr2kBCFmlpa2tu
 fBllYMG3nuKHhhYWpO9bH0Vuc22ZuYqOb7DSXV7qPNjoCnQngEClec+6L
 HGam3St3tKYgiHMow3chRIHDVMdS3f/31+l712KUHD1/c4aquyFjQeER/
 KaOwUeLcXo9o6OUm8Dk2TGZ0Hkt20m6wDQ77T+vmWHhlVbXDcNobWD7N6
 d+Ex06qpn32TVTt8F20AIz+lxa+WQPjGsin4fzmeUWxdF3Ix1hrH2Maw8
 jN/1X773jiaYd87RFs1BySqlte/4aCEx7pmjirDt87g4OZ8/T0Cb0GMlP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="359437775"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="359437775"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 11:27:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="780345383"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="780345383"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 11:27:44 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915/gt: Fix context workarounds with non-masked regs
Date: Thu, 22 Jun 2023 11:27:30 -0700
Message-Id: <20230622182731.3765039-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230622182731.3765039-1-lucas.demarchi@intel.com>
References: <20230622182731.3765039-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Matt Roper <matthew.d.roper@intel.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Most of the context workarounds tweak masked registers, but not all. For
masked registers, when writing the value it's sufficient to just write
the wa->set_bits since that will take care of both the clr and set bits
as well as not overwriting other bits.

However there are some workarounds, the registers are non-masked. Up
until now the driver was simply emitting a MI_LOAD_REGISTER_IMM with the
set_bits to program the register via the GPU in the WA bb. This has the
side effect of overwriting the content of the register outside of bits
that should be set and also doesn't handle the bits that should be
cleared.

Kenneth reported that on DG2, mesa was seeing a weird behavior due to
the kernel programming of L3SQCREG5 in dg2_ctx_gt_tuning_init(). With
the GPU idle, that register could be read via intel_reg as 0x00e001ff,
but during a 3D workload it would change to 0x0000007f. So the
programming of that tuning was affecting more than the bits in
L3_PWM_TIMER_INIT_VAL_MASK. Matt Roper noticed the lack of rmw for the
context workarounds due to the use of MI_LOAD_REGISTER_IMM.

So, for registers that are not masked, read its value via mmio, modify
and then set it in the buffer to be written by the GPU. This should take
care in a simple way of programming just the bits required by the
tuning/workaround. If in future there are registers that involved that
can't be read by the CPU, a more complex approach may be required like
a) issuing additional instructions to read and modify; or b) scan the
golden context and patch it in place before saving it; or something
else. But for now this should suffice.

Scanning the context workarounds for all platforms, these are the
impacted ones with the respective registers

	mtl: DRAW_WATERMARK
	mtl/dg2: XEHP_L3SQCREG5, XEHP_FF_MODE2
	gen12: GEN12_FF_MODE2

ICL has some non-masked registers in the context workarounds:
GEN8_L3CNTLREG, IVB_FBC_RT_BASE and VB_FBC_RT_BASE_UPPER, but there
shouldn't be an impact. The first is already being manually read and the
other 2 are intentionally overwriting the entire register.

Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: stable@vger.kernel.org # v5.7+
Link: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23783#note_1968971
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 27 ++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 0578fc2c9e60..a013f245a790 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1003,6 +1003,9 @@ void intel_engine_init_ctx_wa(struct intel_engine_cs *engine)
 int intel_engine_emit_ctx_wa(struct i915_request *rq)
 {
 	struct i915_wa_list *wal = &rq->engine->ctx_wa_list;
+	struct intel_uncore *uncore = rq->engine->uncore;
+	enum forcewake_domains fw;
+	unsigned long flags;
 	struct i915_wa *wa;
 	unsigned int i;
 	u32 *cs;
@@ -1019,13 +1022,35 @@ int intel_engine_emit_ctx_wa(struct i915_request *rq)
 	if (IS_ERR(cs))
 		return PTR_ERR(cs);
 
+	fw = wal_get_fw_for_rmw(uncore, wal);
+
+	intel_gt_mcr_lock(wal->gt, &flags);
+	spin_lock(&uncore->lock);
+	intel_uncore_forcewake_get__locked(uncore, fw);
+
 	*cs++ = MI_LOAD_REGISTER_IMM(wal->count);
 	for (i = 0, wa = wal->list; i < wal->count; i++, wa++) {
+		u32 val;
+
+		if (wa->masked_reg || wa->set == U32_MAX) {
+			val = wa->set;
+		} else {
+			val = wa->is_mcr ?
+				intel_gt_mcr_read_any_fw(wal->gt, wa->mcr_reg) :
+				intel_uncore_read_fw(uncore, wa->reg);
+			val &= ~wa->clr;
+			val |= wa->set;
+		}
+
 		*cs++ = i915_mmio_reg_offset(wa->reg);
-		*cs++ = wa->set;
+		*cs++ = val;
 	}
 	*cs++ = MI_NOOP;
 
+	intel_uncore_forcewake_put__locked(uncore, fw);
+	spin_unlock(&uncore->lock);
+	intel_gt_mcr_unlock(wal->gt, flags);
+
 	intel_ring_advance(rq, cs);
 
 	ret = rq->engine->emit_flush(rq, EMIT_BARRIER);
-- 
2.40.1

