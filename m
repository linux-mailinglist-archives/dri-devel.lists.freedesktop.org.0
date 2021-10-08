Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF4842745D
	for <lists+dri-devel@lfdr.de>; Sat,  9 Oct 2021 01:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009BA6E2C7;
	Fri,  8 Oct 2021 23:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EA26E2C7;
 Fri,  8 Oct 2021 23:48:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10131"; a="226564844"
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="226564844"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 16:48:26 -0700
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="590708028"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 16:48:26 -0700
Date: Fri, 8 Oct 2021 16:48:25 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Subject: Re: [PATCH 07/11] drm/i915/xehp: Determine which tile raised an
 interrupt
Message-ID: <20211008234825.GS602200@mdroper-desk1.amr.corp.intel.com>
References: <20211008215635.2026385-1-matthew.d.roper@intel.com>
 <20211008215635.2026385-8-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
> From: Paulo Zanoni <paulo.r.zanoni@intel.com>
> 
> The first step of interrupt handling is to read a tile0 register that
> tells us in which tile the interrupt happened; we can then we read the
> usual interrupt registers from the appropriate tile.
> 
> Note that this is just the first step of handling interrupts properly on
> multi-tile platforms.  Subsequent patches will convert other parts of
> the interrupt handling flow.
> 
> Cc: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_irq.c | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index 038a9ec563c1..9f99ad56cde6 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -2772,37 +2772,38 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  {
>  	struct drm_i915_private * const i915 = arg;
>  	struct intel_gt *gt = &i915->gt;
> -	void __iomem * const regs = gt->uncore->regs;
> +	void __iomem * const t0_regs = gt->uncore->regs;
>  	u32 master_tile_ctl, master_ctl;
> -	u32 gu_misc_iir;
> +	u32 gu_misc_iir = 0;
> +	unsigned int i;
>  
>  	if (!intel_irqs_enabled(i915))
>  		return IRQ_NONE;
>  
> -	master_tile_ctl = dg1_master_intr_disable(regs);
> +	master_tile_ctl = dg1_master_intr_disable(t0_regs);
>  	if (!master_tile_ctl) {
> -		dg1_master_intr_enable(regs);
> +		dg1_master_intr_enable(t0_regs);
>  		return IRQ_NONE;
>  	}
>  
> -	/* FIXME: we only support tile 0 for now. */
> -	if (master_tile_ctl & DG1_MSTR_TILE(0)) {
> +	for_each_gt(i915, i, gt) {
> +		void __iomem *const regs = gt->uncore->regs;
> +
> +		if ((master_tile_ctl & DG1_MSTR_TILE(i)) == 0)
> +			continue;
> +
>  		master_ctl = raw_reg_read(regs, GEN11_GFX_MSTR_IRQ);
>  		raw_reg_write(regs, GEN11_GFX_MSTR_IRQ, master_ctl);
> -	} else {
> -		DRM_ERROR("Tile not supported: 0x%08x\n", master_tile_ctl);
> -		dg1_master_intr_enable(regs);
> -		return IRQ_NONE;
> -	}
>  
> -	gen11_gt_irq_handler(gt, master_ctl);
> +		gen11_gt_irq_handler(gt, master_ctl);
> +
> +		gu_misc_iir = gen11_gu_misc_irq_ack(gt, master_ctl);

Hmm, I missed it before sending the series, but this doesn't look right.
We ack every tile's gu_misc_irq separately, but...


> +	}
>  
>  	if (master_ctl & GEN11_DISPLAY_IRQ)
>  		gen11_display_irq_handler(i915);
>  
> -	gu_misc_iir = gen11_gu_misc_irq_ack(gt, master_ctl);
> -
> -	dg1_master_intr_enable(regs);
> +	dg1_master_intr_enable(t0_regs);
>  
>  	gen11_gu_misc_irq_handler(gt, gu_misc_iir);

...only handle the value from the final tile?  Looks like this was
intended to move inside the loop as well.


Matt

>  
> -- 
> 2.33.0
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
