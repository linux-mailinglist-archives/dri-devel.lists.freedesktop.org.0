Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D39756F85
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 00:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4ACF10E04E;
	Mon, 17 Jul 2023 22:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866A410E04E;
 Mon, 17 Jul 2023 22:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689631215; x=1721167215;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Iq8+lhBZPTcGRbxKvHN/SCwg8K0BodbYT9srBDH7rKc=;
 b=ZYRjydFvyligBlde8TrwMTi9iSz1CnMMFaRJ+7VJN1EQ2sQeo7w/4NGP
 aDOMJNfKzZ5J4Z0yaCicuFgfz6qtCWhf5L1KKivt5L/4AbyBh/6YmL8zp
 LEYfk3xnF9NfKLPwYinQ2Ws0BU/9Tz/SZcN4K68vrGJ9IA/nDZUgQk5gv
 EYotDBC0IXw8yGlCbQnUVZDTTlfwW2Lp+fnyhx2xvTX8lZbAoZIO5PAk3
 40p758cJrOC2sqobT2I8vrIefxpk+GtgX13I+NFit1dz4sn7z26VZD04H
 a9SYzizBktkeEj/zpWm4J5VXkkL+w0UCWRwIk09LPVCW3G55OtW5tDCF7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="369603133"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="369603133"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 15:00:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="758572449"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="758572449"
Received: from jplazoni-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.55.169])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 15:00:10 -0700
Date: Tue, 18 Jul 2023 00:00:01 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH v4 6/6] drm/i915/gt: Support aux invalidation
 on all engines
Message-ID: <ZLW54d83qzX40XNT@ashyti-mobl2.lan>
References: <20230717173059.422892-1-andi.shyti@linux.intel.com>
 <20230717173059.422892-7-andi.shyti@linux.intel.com>
 <58136997-4870-c321-a04a-d10443e92546@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58136997-4870-c321-a04a-d10443e92546@intel.com>
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
 Andi Shyti <andi.shyti@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

On Mon, Jul 17, 2023 at 09:11:26PM +0200, Andrzej Hajda wrote:
> On 17.07.2023 19:30, Andi Shyti wrote:
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
> >   drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 63 +++++++++++++++---------
> >   drivers/gpu/drm/i915/gt/gen8_engine_cs.h |  3 +-
> >   drivers/gpu/drm/i915/gt/intel_lrc.c      | 17 +------
> >   3 files changed, 44 insertions(+), 39 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > index fbc70f3b7f2fd..6d21a1ac06e73 100644
> > --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > @@ -165,7 +165,8 @@ static u32 preparser_disable(bool state)
> >   	return MI_ARB_CHECK | 1 << 8 | state;
> >   }
> > -u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv_reg)
> > +static u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs,
> > +				     const i915_reg_t inv_reg)
> >   {
> >   	u32 gsi_offset = gt->uncore->gsi_offset;
> > @@ -187,6 +188,40 @@ u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv
> >   	return cs;
> >   }
> > +static i915_reg_t intel_get_aux_inv_reg(struct intel_engine_cs *engine)
> > +{
> > +	if (HAS_FLAT_CCS(engine->i915))
> > +		return _MMIO(0);
> 
> Why not INVALID_MMIO_REG ? Here and below.
> 
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
> > +	default:
> > +		return _MMIO(0);
> > +	}
> > +}
> > +
> > +static bool intel_engine_has_aux_inv(struct intel_engine_cs *engine)
> > +{
> > +	i915_reg_t reg = intel_get_aux_inv_reg(engine);
> > +
> > +	return !!reg.reg;
> 
>  return i915_mmio_reg_valid(intel_get_aux_inv_reg(engine));
> 
> > +}
> > +
> > +u32 *intel_emit_aux_table_inv(struct intel_engine_cs *engine, u32 *cs)
> > +{
> > +	i915_reg_t reg = intel_get_aux_inv_reg(engine);
> > +	struct intel_gt *gt = engine->gt;
> > +
> > +	return reg.reg ? gen12_emit_aux_table_inv(gt, cs, reg) : cs;
> > +}
> > +
> 
> I am not sure about prefixes, IMHO gen12_ instead of intel_ is more adequate
> as this is only gen12 feature, works only on gen12, and is called from gen12
> context, up to you. In any case we can squash intel_emit_aux_table_inv and
> gen12_emit_aux_table_inv into one function, am I right?

you and Matt have made exactly the same comments... will fix
them, Thank you!

Andi
