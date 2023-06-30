Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 089FF744343
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 22:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1076410E4EF;
	Fri, 30 Jun 2023 20:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 307E710E4D8;
 Fri, 30 Jun 2023 20:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688157332; x=1719693332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8T9i9BJUYWPuJvNc719lX72DskQqZnWhABGKOWP2Z8s=;
 b=AC74adECoVzRIaiJywlfZhtcNqFM2UAxngthXwEapDl0a9KOxElFNWAB
 2qSQ3kjXp2TjcXvxM6qP2HLBk0NmvAwf3Cwgbei4dDGrSkfpPcInJJPGv
 0dlfdMONoQYZYEu7XNOKQZXWMcaKZJazqwCRwD2pMemR06tfBCJkHa+EN
 isSaDhm8nsAOObmiCgHpjzSHPiQvJB4eDDRp6NgIjmQzxQ0whw2WTSARU
 3WtLBybYRForHPpBCte13Ba4ULCHERXDR5UCY5J8/GA0xkD75/3ycDfzg
 NdpEzwynuR76cz49g9jOFYrAvjFbpe+DqpGH2lRl0MCV0VUFDanSTz/nV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="393213911"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="393213911"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 13:35:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="807904253"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="807904253"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 13:35:30 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 3/7] drm/i915/gt: Fix context workarounds with non-masked
 regs
Date: Fri, 30 Jun 2023 13:35:05 -0700
Message-Id: <20230630203509.1635216-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230630203509.1635216-1-lucas.demarchi@intel.com>
References: <20230630203509.1635216-1-lucas.demarchi@intel.com>
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
 Matt Roper <matthew.d.roper@intel.com>, dri-devel@lists.freedesktop.org
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

ICL has some non-masked registers in the context workarounds:
GEN8_L3CNTLREG, IVB_FBC_RT_BASE and VB_FBC_RT_BASE_UPPER, but there
shouldn't be an impact. The first is already being manually read and the
other 2 are intentionally overwriting the entire register. Same
reasoning applies to GEN12_FF_MODE2: the WA is intentionally
overwriting all the bits to avoid a read-modify-write.

v2:  Reword commit message wrt GEN12_FF_MODE2 and the changed behavior
on preparatory patches.
v3: Also skip reading if clear|set bits covers everything

Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: Matt Roper <matthew.d.roper@intel.com>
Link: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23783#note_1968971
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Kenneth Graunke <kenneth@whitecape.org>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 28 ++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 7d48bd57b6ef..0a9c3be4817c 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -986,6 +986,9 @@ void intel_engine_init_ctx_wa(struct intel_engine_cs *engine)
 int intel_engine_emit_ctx_wa(struct i915_request *rq)
 {
 	struct i915_wa_list *wal = &rq->engine->ctx_wa_list;
+	struct intel_uncore *uncore = rq->engine->uncore;
+	enum forcewake_domains fw;
+	unsigned long flags;
 	struct i915_wa *wa;
 	unsigned int i;
 	u32 *cs;
@@ -1002,13 +1005,36 @@ int intel_engine_emit_ctx_wa(struct i915_request *rq)
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
+		/* Skip reading the register if it's not really needed */
+		if (wa->masked_reg || (wa->clr | wa->set) == U32_MAX) {
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

