Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B11C875C8E4
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 16:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580B810E18B;
	Fri, 21 Jul 2023 14:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4CC10E18B;
 Fri, 21 Jul 2023 14:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689948178; x=1721484178;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ClOcl+VTB21mVAMFKz7g4AEK+zUooi66bWyE1gA6T24=;
 b=FGSHo6yYhtjBg9f1wV0l3rRE37c24hNYQIAmnhOlNBrVCMzTozytYqnX
 12vdGNs9bwxMERyx+blG7sQlXlwWwsRgfaJ94WYXbQw/qk11rfnJdBgif
 Sll9FSsMTfe4OgQKw5cjfeIpfediL3cBZWpjA6P8i68duY24J1w9cfryu
 c1DbbiUcsfFPXqLZ3lpMZytsTsOBDy9bHDP2meoyhpWPXBI01cm4GbedT
 55qAxOZqji2A9fjJjfs1NrEcXx55qiKPBkxQhE9H/PQw5W3yOpXz2psya
 XMSg/2EFbFNDmdJxsE+jUVPm5qttBriqumhx44/u4p7SNmrrqtmCOWZKp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="453404353"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="453404353"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 07:02:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="1055573907"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="1055573907"
Received: from hbockhor-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.54.104])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 07:02:52 -0700
Date: Fri, 21 Jul 2023 16:02:50 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Krzysztofik, Janusz" <janusz.krzysztofik@intel.com>
Subject: Re: [v7,9/9] drm/i915/gt: Support aux invalidation on all engines
Message-ID: <ZLqQCq5eDId4zRFa@ashyti-mobl2.lan>
References: <20230720210737.761400-10-andi.shyti@linux.intel.com>
 <3494477.V25eIC5XRa@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3494477.V25eIC5XRa@jkrzyszt-mobl2.ger.corp.intel.com>
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
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>, linux-stable <stable@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 dri-evel <dri-devel@lists.freedesktop.org>, "Hajda,
 Andrzej" <andrzej.hajda@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>, "Das, Nirmoy" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Janusz,

> > diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > index 3ded597f002a2..30fb4e0af6134 100644
> > --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> > @@ -165,9 +165,36 @@ static u32 preparser_disable(bool state)
> >  	return MI_ARB_CHECK | 1 << 8 | state;
> >  }
> >  
> > -u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv_reg)
> > +static i915_reg_t gen12_get_aux_inv_reg(struct intel_engine_cs *engine)
> >  {
> > -	u32 gsi_offset = gt->uncore->gsi_offset;
> > +	if (!HAS_AUX_CCS(engine->i915))
> > +		return INVALID_MMIO_REG;
> > +
> > +	switch (engine->id) {
> > +	case RCS0:
> > +		return GEN12_CCS_AUX_INV;
> > +	case BCS0:
> > +		return GEN12_BCS0_AUX_INV;
> > +	case VCS0:
> > +		return GEN12_VD0_AUX_INV;
> > +	case VCS2:
> > +		return GEN12_VD2_AUX_INV;
> > +	case VECS0:
> > +		return GEN12_VE0_AUX_INV;
> > +	case CCS0:
> > +		return GEN12_CCS0_AUX_INV;
> > +	default:
> > +		return INVALID_MMIO_REG;
> > +	}
> > +}
> > +
> > +u32 *gen12_emit_aux_table_inv(struct intel_engine_cs *engine, u32 *cs)
> > +{
> > +	i915_reg_t inv_reg = gen12_get_aux_inv_reg(engine);
> > +	u32 gsi_offset = engine->gt->uncore->gsi_offset;
> > +
> > +	if (i915_mmio_reg_valid(inv_reg))
> > +		return cs;
> 
> Is that correct?  Now the original body of gen12_emit_aux_table_inv() will be 
> executed only if either (!HAS_AUX_CCS(engine->i915) or the engine is not one 
> of (RCS0, BCS0, VCS0, VCS2 or CCS0), ...
> 
> >  
> >  	*cs++ = MI_LOAD_REGISTER_IMM(1) | MI_LRI_MMIO_REMAP_EN;
> >  	*cs++ = i915_mmio_reg_offset(inv_reg) + gsi_offset;
> > @@ -201,6 +228,11 @@ static u32 *intel_emit_pipe_control_cs(struct i915_request *rq, u32 bit_group_0,
> >  	return cs;
> >  }
> >  
> > +static bool gen12_engine_has_aux_inv(struct intel_engine_cs *engine)
> > +{
> > +	return i915_mmio_reg_valid(gen12_get_aux_inv_reg(engine));
> > +}
> > +
> >  static int mtl_dummy_pipe_control(struct i915_request *rq)
> >  {
> >  	/* Wa_14016712196 */
> > @@ -307,11 +339,7 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
> >  
> >  		cs = gen8_emit_pipe_control(cs, flags, LRC_PPHWSP_SCRATCH_ADDR);
> >  
> > -		if (!HAS_FLAT_CCS(rq->engine->i915)) {
> 
> ... while before it was executed only if (!HAS_FLAT_CCS(rq->engine->i915)), 
> which, according to commit description of PATCH 2/9, rather had the opposite 
> meaning.  Am I missing something?

flat_ccs and aux_ccs are not mutually exclusive, so far the can
both miss like in PVC. So that the !HAS_FLAT_CCS() is an
approximation and that's why we need a better evaluation.

Aux invalidation is needed only on platforms from TGL and beyond
excluding PVC. The above engines  are the only engines where AUX
invalidation happens, but there are no cases when we reach the
default condition, as the emit_flush_rcs is already called within
that set of engines. The default is there just for completeness.

Does this answer?

Thanks,
Andi
