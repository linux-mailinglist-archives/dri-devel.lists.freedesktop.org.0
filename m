Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43985756F93
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 00:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754A710E1A3;
	Mon, 17 Jul 2023 22:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E2D10E1A3;
 Mon, 17 Jul 2023 22:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689631338; x=1721167338;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6CE6QZ0OBtU8EAbe6uIkqYZ+/KwqmAyT6zLY7hTYLE0=;
 b=U+RxCmnqIjIGDkRa11F2q+qs44GoiWoatTJIrT0qDIP8lG/wj5hPPYA5
 nV6AlD0djjZc9p8TtAXzgTmQ28yVkrWBDj9/IylptEebxrOLioOwxfWv3
 x3h46oWEctlmEI3Kf2o8TSzYFMe2o/jqvo19jtkwZz8jIPCPNbKkjceVU
 djq358aucqUvY5lNLX76qqNFVOIOnVphB61nuTqeG78/D1gUlwpGTJEXL
 kG/cNi9RiTdTz4bWImIwmg895ebiMED9+i8NcBZhEJpi8eV4poz3ouZO5
 TspNYwUR4EZE+PMDGLs9eBWktmTzChSeqRmEeWCoXWEh8I70FGynl0oEM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="429812824"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="429812824"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 15:02:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="813505491"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="813505491"
Received: from jplazoni-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.55.169])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 15:02:15 -0700
Date: Tue, 18 Jul 2023 00:02:06 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v4 6/6] drm/i915/gt: Support aux invalidation on all
 engines
Message-ID: <ZLW6XmtdqWyIUzkP@ashyti-mobl2.lan>
References: <20230717173059.422892-1-andi.shyti@linux.intel.com>
 <20230717173059.422892-7-andi.shyti@linux.intel.com>
 <20230717202709.GF138014@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717202709.GF138014@mdroper-desk1.amr.corp.intel.com>
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matt,

On Mon, Jul 17, 2023 at 01:27:09PM -0700, Matt Roper wrote:
> On Mon, Jul 17, 2023 at 07:30:59PM +0200, Andi Shyti wrote:
> > Perform some refactoring with the purpose of keeping in one
> > single place all the operations around the aux table
> > invalidation.
> > 
> > With this refactoring add more engines where the invalidation
> > should be performed.
> > 
> > Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > Cc: <stable@vger.kernel.org> # v5.8+
> > ---
> >  drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 63 +++++++++++++++---------
> >  drivers/gpu/drm/i915/gt/gen8_engine_cs.h |  3 +-
> >  drivers/gpu/drm/i915/gt/intel_lrc.c      | 17 +------
> >  3 files changed, 44 insertions(+), 39 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > index fbc70f3b7f2fd..6d21a1ac06e73 100644
> > --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > @@ -165,7 +165,8 @@ static u32 preparser_disable(bool state)
> >  	return MI_ARB_CHECK | 1 << 8 | state;
> >  }
> >  
> > -u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv_reg)
> > +static u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs,
> > +				     const i915_reg_t inv_reg)
> >  {
> >  	u32 gsi_offset = gt->uncore->gsi_offset;
> >  
> > @@ -187,6 +188,40 @@ u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv
> >  	return cs;
> >  }
> >  
> > +static i915_reg_t intel_get_aux_inv_reg(struct intel_engine_cs *engine)
> 
> Generally we try to avoid putting "intel_" and "i915_" prefixes on
> static functions.
> 
> > +{
> > +	if (HAS_FLAT_CCS(engine->i915))
> > +		return _MMIO(0);
> > +
> > +	switch (engine->id) {
> > +	case RCS0:
> > +		return GEN12_CCS_AUX_INV;
> > +	case VCS0:
> > +		return GEN12_VD0_AUX_INV;
> > +	case VCS2:
> > +		return GEN12_VD2_AUX_INV;
> > +	case VECS0:
> > +		return GEN12_VE0_AUX_INV;
> 
> We need CCS0 here (0x42c0).  And on graphics versions 12.70 and beyond
> we also need BCS0 too (0x4248) since the blitter gained the ability to
> interpret CCS compression.

Thanks, will add.

> > +	default:
> > +		return _MMIO(0);
> 
> It might be cleaner to use INVALID_MMIO_REG here (and then check for
> i915_mmio_reg_valid() below).
> 
> > +	}
> > +}
> > +
> > +static bool intel_engine_has_aux_inv(struct intel_engine_cs *engine)
> > +{
> > +	i915_reg_t reg = intel_get_aux_inv_reg(engine);
> > +
> > +	return !!reg.reg;
> > +}
> > +
> > +u32 *intel_emit_aux_table_inv(struct intel_engine_cs *engine, u32 *cs)
> > +{
> > +	i915_reg_t reg = intel_get_aux_inv_reg(engine);
> > +	struct intel_gt *gt = engine->gt;
> > +
> > +	return reg.reg ? gen12_emit_aux_table_inv(gt, cs, reg) : cs;
> > +}
> 
> Rather than adding this new wrapper function, can we just do the
> register lookup at the top of gen12_emit_aux_table_inv() (and bail out
> of that function early if there isn't a valid register)?
> 
> Keeping the non-static function as the one with "gen12" in the name also
> helps reduce confusion about whether this is something that older
> platforms should have been calling as well.

You and Andrzej have made the same comments, will fix them.

BTW, this set of functions are doing more or less a similar thing
to what you have done here[*]. I will add the PVC flag.

Thank you!
Andi

[*] https://patchwork.freedesktop.org/patch/539304/?series=118334&rev=1
