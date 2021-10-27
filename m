Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F98643C39E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 09:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666AB6E542;
	Wed, 27 Oct 2021 07:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE366E4AB;
 Wed, 27 Oct 2021 07:13:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="230365327"
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="230365327"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 00:13:47 -0700
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="447426017"
Received: from dzhang-mobl2.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.251.142.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 00:13:46 -0700
Date: Wed, 27 Oct 2021 00:13:43 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Subject: Re: [PATCH 07/11] drm/i915/xehp: Determine which tile raised an
 interrupt
Message-ID: <20211027071343.s4rrp2v3kfnfj3sl@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20211008215635.2026385-1-matthew.d.roper@intel.com>
 <20211008215635.2026385-8-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20211008215635.2026385-8-matthew.d.roper@intel.com>
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

On Fri, Oct 08, 2021 at 02:56:31PM -0700, Matt Roper wrote:
>From: Paulo Zanoni <paulo.r.zanoni@intel.com>
>
>The first step of interrupt handling is to read a tile0 register that
>tells us in which tile the interrupt happened; we can then we read the
>usual interrupt registers from the appropriate tile.
>
>Note that this is just the first step of handling interrupts properly on
>multi-tile platforms.  Subsequent patches will convert other parts of
>the interrupt handling flow.
>
>Cc: Stuart Summers <stuart.summers@intel.com>
>Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/i915/i915_irq.c | 31 ++++++++++++++++---------------
> 1 file changed, 16 insertions(+), 15 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
>index 038a9ec563c1..9f99ad56cde6 100644
>--- a/drivers/gpu/drm/i915/i915_irq.c
>+++ b/drivers/gpu/drm/i915/i915_irq.c
>@@ -2772,37 +2772,38 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
> {
> 	struct drm_i915_private * const i915 = arg;
> 	struct intel_gt *gt = &i915->gt;
>-	void __iomem * const regs = gt->uncore->regs;
>+	void __iomem * const t0_regs = gt->uncore->regs;

given that we later make gt point elsewhere since it's now only used
inside the loop, I think this would be clearer with

	void __iomem * const t0_regs = i915->gt->uncore->regs;
	struct intel_gt *gt;

but see below


> 	u32 master_tile_ctl, master_ctl;
>-	u32 gu_misc_iir;
>+	u32 gu_misc_iir = 0;
>+	unsigned int i;
>
> 	if (!intel_irqs_enabled(i915))
> 		return IRQ_NONE;
>
>-	master_tile_ctl = dg1_master_intr_disable(regs);
>+	master_tile_ctl = dg1_master_intr_disable(t0_regs);
> 	if (!master_tile_ctl) {
>-		dg1_master_intr_enable(regs);
>+		dg1_master_intr_enable(t0_regs);
> 		return IRQ_NONE;
> 	}
>
>-	/* FIXME: we only support tile 0 for now. */
>-	if (master_tile_ctl & DG1_MSTR_TILE(0)) {
>+	for_each_gt(i915, i, gt) {
>+		void __iomem *const regs = gt->uncore->regs;
>+
>+		if ((master_tile_ctl & DG1_MSTR_TILE(i)) == 0)
>+			continue;
>+
> 		master_ctl = raw_reg_read(regs, GEN11_GFX_MSTR_IRQ);
> 		raw_reg_write(regs, GEN11_GFX_MSTR_IRQ, master_ctl);
>-	} else {
>-		DRM_ERROR("Tile not supported: 0x%08x\n", master_tile_ctl);
>-		dg1_master_intr_enable(regs);
>-		return IRQ_NONE;
>-	}
>
>-	gen11_gt_irq_handler(gt, master_ctl);
>+		gen11_gt_irq_handler(gt, master_ctl);
>+
>+		gu_misc_iir = gen11_gu_misc_irq_ack(gt, master_ctl);
>+	}
>
> 	if (master_ctl & GEN11_DISPLAY_IRQ)
> 		gen11_display_irq_handler(i915);
>
>-	gu_misc_iir = gen11_gu_misc_irq_ack(gt, master_ctl);
>-
>-	dg1_master_intr_enable(regs);
>+	dg1_master_intr_enable(t0_regs);
>
> 	gen11_gu_misc_irq_handler(gt, gu_misc_iir);

since we used gt in the for_each_gt() loop it looks like this is not
the gt we wanted anymore. Alas gen11_gu_misc_irq_handler() only uses gt
to backpoint to i915... so I'm not sure if it should actually be taking
a gt as parameter if it is per device rather than per tile/gt.

Lucas De Marchi

>
>-- 
>2.33.0
>
