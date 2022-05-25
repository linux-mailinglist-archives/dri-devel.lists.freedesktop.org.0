Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA645342AC
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 20:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E6A10E3B9;
	Wed, 25 May 2022 18:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F7C210E3B9;
 Wed, 25 May 2022 18:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653501938; x=1685037938;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gd8CqV6OzJ5Z6cWKDN8HWPNGEQlHus6jWNy48dpbSaA=;
 b=Sx9Z4h2wXSHlYrrsDzkqEpy0Rwhg16akDCgWqUXLXyWRsjiXeVi9stmF
 uUnGwCETqO6TshKIicH18B0K5LqomhCyN+ybf026fgDTOOEtFXj3MoPY6
 ewDXG1m/8GebjWSPyXu2sZsd7L6QpY82XcwjpmTQrw8Yah3nwa4MJpPVt
 KF/mSYo1ejUV9EFP7kq0pBwABCbqCObtt59KMTe03zyEkQbKas0dYxCSZ
 GImHPY1SwCelZopuRwbSHe7k5mVRf6kTlLxK1RoXA+epNHRv0iOy3T+gA
 srDe/1NylhiQrN+xXVJxyxCQh3/b6zfbzVc0giFHmcQE2iE4laWH2nMWi w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="274002806"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="274002806"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 11:05:37 -0700
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="704108327"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 11:05:37 -0700
Date: Wed, 25 May 2022 11:05:35 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH] drm/i915/dg2: Catch and log more unexpected values in
 DG1_MSTR_TILE_INTR
Message-ID: <Yo5v7/pLw4eF8xxw@mdroper-desk1.amr.corp.intel.com>
References: <20220524094339.1692212-1-tvrtko.ursulin@linux.intel.com>
 <Yo0bBxHBH8cZcnN4@mdroper-desk1.amr.corp.intel.com>
 <f37468b3-1066-ee4b-fb5b-7664fd180fd6@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f37468b3-1066-ee4b-fb5b-7664fd180fd6@linux.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 25, 2022 at 05:03:13PM +0100, Tvrtko Ursulin wrote:
> 
> On 24/05/2022 18:51, Matt Roper wrote:
> > On Tue, May 24, 2022 at 10:43:39AM +0100, Tvrtko Ursulin wrote:
> > > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > 
> > > Catch and log any garbage in the register, including no tiles marked, or
> > > multiple tiles marked.
> > > 
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > ---
> > > We caught garbage in DG1_MSTR_TILE_INTR with DG2 (actual value 0xF9D2C008)
> > > during glmark and more badness. So I thought lets log all possible failure
> > > modes from here and also use per device logging.
> > > ---
> > >   drivers/gpu/drm/i915/i915_irq.c | 33 ++++++++++++++++++++++-----------
> > >   drivers/gpu/drm/i915/i915_reg.h |  1 +
> > >   2 files changed, 23 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> > > index 73cebc6aa650..79853d3fc1ed 100644
> > > --- a/drivers/gpu/drm/i915/i915_irq.c
> > > +++ b/drivers/gpu/drm/i915/i915_irq.c
> > > @@ -2778,24 +2778,30 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
> > >   	u32 gu_misc_iir;
> > >   	if (!intel_irqs_enabled(i915))
> > > -		return IRQ_NONE;
> > > +		goto none;
> > >   	master_tile_ctl = dg1_master_intr_disable(regs);
> > > -	if (!master_tile_ctl) {
> > > -		dg1_master_intr_enable(regs);
> > > -		return IRQ_NONE;
> > > +	if (!master_tile_ctl)
> > > +		goto enable_none;
> > > +
> > > +	if (master_tile_ctl & ~(DG1_MSTR_IRQ | DG1_MSTR_TILE_MASK)) {
> > > +		drm_warn(&i915->drm, "Garbage in master_tile_ctl: 0x%08x!\n",
> > > +			 master_tile_ctl);
> > 
> > I know we have a bunch of them already, but shouldn't we be avoiding
> > printk-based stuff like this inside interrupt handlers?  Should we be
> > migrating all these error messages over to trace_printk or something
> > similar that's safer to use?
> 
> Not sure - I kind of think some really unexpected and worrying situations
> should be loud and on by default. Risk is then spam if not ratelimited.
> Maybe we should instead ratelimit most errors/warnings coming for irq
> handlers?

It's not the risk of spam that's the problem, but rather that
printk-based stuff eventually calls into the console code to flush its
buffers.  That's way more overhead than you want in an interrupt handler
so it's bad on its own, but if you're using something slow like a serial
console, it becomes even more of a problem.

While the unexpected bits in the master tile register are strange and
may point to a bigger problem somewhere else, they're also harmless on
their own since we should just ignore those bits and only process the
valid tiles.

> 
> In this particular case at least DRM_ERROR with no device info is the odd
> one out in the entire file so I'd suggest changing at least that, if the
> rest of my changes is of questionable benefit.

Changing DRM_ERROR -> drm_err would probably be fine in the short term
since it doesn't really make us any worse off.  Changing to drm_warn
might not be great since we're generating a lot more lines of output and
probably multiplying the already bad overhead that shouldn't be
happening in an interrupt handler.  But if we could update the interrupt
handler to just save away the details and do the actual drm_warn later,
outside the interrupt handler code, that would be okay.  We should
probably work toward something like that for all of our interrupt
handler warning/error messages.


Matt

> 
> Regards,
> 
> Tvrtko
> 
> > 
> > 
> > Matt
> > 
> > > +		goto enable_none;
> > >   	}
> > >   	/* FIXME: we only support tile 0 for now. */
> > > -	if (master_tile_ctl & DG1_MSTR_TILE(0)) {
> > > -		master_ctl = raw_reg_read(regs, GEN11_GFX_MSTR_IRQ);
> > > -		raw_reg_write(regs, GEN11_GFX_MSTR_IRQ, master_ctl);
> > > -	} else {
> > > -		DRM_ERROR("Tile not supported: 0x%08x\n", master_tile_ctl);
> > > -		dg1_master_intr_enable(regs);
> > > -		return IRQ_NONE;
> > > +	if (REG_FIELD_GET(DG1_MSTR_TILE_MASK, master_tile_ctl) !=
> > > +	    DG1_MSTR_TILE(0)) {
> > > +		drm_warn(&i915->drm, "Unexpected irq from tile %u!\n",
> > > +			 ilog2(REG_FIELD_GET(DG1_MSTR_TILE_MASK,
> > > +					     master_tile_ctl)));
> > > +		goto enable_none;
> > >   	}
> > > +	master_ctl = raw_reg_read(regs, GEN11_GFX_MSTR_IRQ);
> > > +	raw_reg_write(regs, GEN11_GFX_MSTR_IRQ, master_ctl);
> > > +
> > >   	gen11_gt_irq_handler(gt, master_ctl);
> > >   	if (master_ctl & GEN11_DISPLAY_IRQ)
> > > @@ -2810,6 +2816,11 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
> > >   	pmu_irq_stats(i915, IRQ_HANDLED);
> > >   	return IRQ_HANDLED;
> > > +
> > > +enable_none:
> > > +	dg1_master_intr_enable(regs);
> > > +none:
> > > +	return IRQ_NONE;
> > >   }
> > >   /* Called from drm generic code, passed 'crtc' which
> > > diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> > > index d8579ab9384c..eefa301c6430 100644
> > > --- a/drivers/gpu/drm/i915/i915_reg.h
> > > +++ b/drivers/gpu/drm/i915/i915_reg.h
> > > @@ -5774,6 +5774,7 @@
> > >   #define DG1_MSTR_TILE_INTR		_MMIO(0x190008)
> > >   #define   DG1_MSTR_IRQ			REG_BIT(31)
> > > +#define   DG1_MSTR_TILE_MASK		REG_GENMASK(3, 0)
> > >   #define   DG1_MSTR_TILE(t)		REG_BIT(t)
> > >   #define GEN11_DISPLAY_INT_CTL		_MMIO(0x44200)
> > > -- 
> > > 2.32.0
> > > 
> > 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
