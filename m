Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F098B92FB91
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 15:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB4A10ED0D;
	Fri, 12 Jul 2024 13:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C8G7Ckra";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A949B10ED0D;
 Fri, 12 Jul 2024 13:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720791585; x=1752327585;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=K3JBCCsidiDsLCQv0D4erX3z+IiavHg3lRrtCpUooUc=;
 b=C8G7Ckra7wQnSX0xPp8yAtyaiXspVpH6f1qHeQztRbE30NJmczzuIRUG
 bjKJ6YSWc8fmBIrvLnON65wlbPC6VZ+Wx8nz0h6i5q0yQ9OgfjLdcin8D
 BGVCpR1dKja6GpIH275Oe+g6ZQSaRWuMrGqsUefpE35ZBid6QuSrWm1nj
 3Ss8Rjni36MsurD9/ZbjIUlhI1RagGz2JGZSjdeFNzZlmDxf3pP886871
 dGxSbjKXBaWejGgl7/OFZN1spHs9Xi3irhWwJ9Q35tR15j9fZcmuzwRnC
 XSyp8CiECQlUhKy1AmcKX4us9oAKGk26SGjuStoP/+3IYYpL/mo/CSt0L w==;
X-CSE-ConnectionGUID: JgItzqaqSRCOi61VKdog5w==
X-CSE-MsgGUID: 8aYNRwxVRLO3Mj5VMoEDtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="40759245"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="40759245"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 06:39:45 -0700
X-CSE-ConnectionGUID: qkBL5bQ5R5GQRii+E3d5MA==
X-CSE-MsgGUID: FVTRpR0pTK2eRlGt3LzFdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="53210815"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.61])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 06:39:41 -0700
Date: Fri, 12 Jul 2024 15:39:39 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "Wilson, Chris P" <chris.p.wilson@intel.com>,
 "tursulin@ursulin.net" <tursulin@ursulin.net>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Das, Nirmoy" <nirmoy.das@intel.com>,
 "janusz.krzysztofik@linux.intel.com" <janusz.krzysztofik@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v3] drm/i915/gt: Do not consider preemption during
 execlists_dequeue for gen8
Message-ID: <ZpEyGzBVM2ZaXcWM@ashyti-mobl2.lan>
References: <20240711163208.1355736-1-nitin.r.gote@intel.com>
 <CH0PR11MB54443CBE8B4A052419FFFD1BE5A52@CH0PR11MB5444.namprd11.prod.outlook.com>
 <ZpAfyzKlqlMrd4nj@intel.com>
 <SJ0PR11MB586743B1AF7DABD0F131E906D0A62@SJ0PR11MB5867.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ0PR11MB586743B1AF7DABD0F131E906D0A62@SJ0PR11MB5867.namprd11.prod.outlook.com>
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

Hi Nitin,

> > > > We're seeing a GPU HANG issue on a CHV platform, which was caused by
> > > > bac24f59f454 ("drm/i915/execlists: Enable coarse preemption boundaries
> > for gen8").
> > > >
> > > > Gen8 platform has only timeslice and doesn't support a preemption
> > > > mechanism as engines do not have a preemption timer and doesn't send
> > > > an irq if the preemption timeout expires.
> > >
> > > That seems to mean the original can_preempt function was inaccurately
> > > built, so fixing it here makes the most sense to me, especially if it's causing
> > problems.
> > >
> > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> -Jonathan
> > > Cavitt
> > >
> > > > So, add a fix to not consider preemption during dequeuing for gen8
> > > > platforms.
> > > >
> > > > v2: Simplify can_preempt() function (Tvrtko Ursulin)
> > > >
> > > > v3:
> > > >  - Inside need_preempt(), condition of can_preempt() is not required
> > > >    as simplified can_preempt() is enough. (Chris Wilson)
> > > >
> > > > Fixes: bac24f59f454 ("drm/i915/execlists: Enable coarse preemption
> > > > boundaries for gen8")
> > 
> > Something strange in here...
> > 
> > This patch is not using directly or indirectly (I915_ENGINE_HAS_PREEMPTION)
> > the can_preempt()...
> >
> 
> Thank you Rodrigo for the review comment. Seems like you are right.
> Fixes: bac24f59f454 is misleading as it's not using can_preempt(). 
> The bug could be from the commit bac24f59f454 as mentioned in the issue
> But this change fixes the original implementation of can_preempt()  in below commit.
> Fixes: 751f82b353a6 ("drm/i915/gt: Only disable preemption on gen8 render engines").
> 
> I will update the Fixes in the commit description and will send in v4.

no need to resend it, I will update it before pushing.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

I think the first mention in the commit log is correct, though,
as that's the reason where the issue was generated.

Thanks,
Andi

> > > > Closes:
> > > > https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11396
> > > > Suggested-by: Andi Shyti <andi.shyti@intel.com>
> > > > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > > > Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> > > > CC: <stable@vger.kernel.org> # v5.2+
> > > > ---
> > > >  drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 6 +-----
> > > >  1 file changed, 1 insertion(+), 5 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > > > b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > > > index 21829439e686..72090f52fb85 100644
> > > > --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > > > +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > > > @@ -3315,11 +3315,7 @@ static void remove_from_engine(struct
> > > > i915_request *rq)
> > > >
> > > >  static bool can_preempt(struct intel_engine_cs *engine)  {
> > > > -	if (GRAPHICS_VER(engine->i915) > 8)
> > > > -		return true;
> > > > -
> > > > -	/* GPGPU on bdw requires extra w/a; not implemented */
> > > > -	return engine->class != RENDER_CLASS;
> > > > +	return GRAPHICS_VER(engine->i915) > 8;
> > > >  }
> > > >
> > > >  static void kick_execlists(const struct i915_request *rq, int prio)
> > > > --
> > > > 2.25.1
> > > >
> > > >
