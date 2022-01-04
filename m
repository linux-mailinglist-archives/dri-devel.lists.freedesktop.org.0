Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A6C484AB5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 23:27:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACFB10E64C;
	Tue,  4 Jan 2022 22:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E92910E636;
 Tue,  4 Jan 2022 22:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641335260; x=1672871260;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RCYRlu96X7lO4I+0q0Z0WN/LreTvOaSCGpANNnEXJs8=;
 b=RIDJYSvHGRH0iR2bIxQAzL6dH0uLsiiifU7xeYD+9kT1U6NiOJsnwoHP
 3ziWdS1iyMkNaI4G4r5jLy+WOz0UWNDH2YCjfgANXIAXETC8x6IzsZZC4
 V8C2uI2RPHLhiAv7n/79Eu4ooTN1KrtSqemwHf97tMbUGlm1Chmc0UoM5
 V2GIAnEi4PaiJC7YwjfcuX5WxKSxXkv/yLcj4SyxAfU5Gy0VMAnwv/P/g
 O1ijHrCXf1MRJfHNJYPnR2DWWnewuUHywzm2Ekbr561qK7mT9xVGOnbqq
 ddsaPIEcuvl2EDh2uaJm8ug5Mv7znQ6Ukb1SyzMSvQV784x2pmZvh6KPw g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="241127629"
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; d="scan'208";a="241127629"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 14:27:40 -0800
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; d="scan'208";a="526224690"
Received: from tnaharix-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.215.231])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 14:27:36 -0800
Date: Wed, 5 Jan 2022 00:27:32 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH v9 2/6] drm/i915: Use to_gt() helper for GGTT accesses
Message-ID: <YdTJ1MHJck8zzGBx@intel.intel>
References: <20211219212500.61432-1-andi.shyti@linux.intel.com>
 <20211219212500.61432-3-andi.shyti@linux.intel.com>
 <YcIIf4wmvNdM09ZS@mdroper-desk1.amr.corp.intel.com>
 <YcIvFYDuY2uM5hCr@intel.intel>
 <YdNn1uOzEwwnm91N@mdroper-desk1.amr.corp.intel.com>
 <20220104175231.GA12985@orsosgc001.ra.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220104175231.GA12985@orsosgc001.ra.intel.com>
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 Andi Shyti <andi@etezian.org>, Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

> > > > >  	struct drm_i915_gem_object *bo;
> > > > >  	struct i915_vma *vma;
> > > > >  	const u64 delay_ticks = 0xffffffffffffffff -
> > > > > -		intel_gt_ns_to_clock_interval(stream->perf->i915->ggtt.vm.gt,
> > > > > +		intel_gt_ns_to_clock_interval(to_gt(stream->perf->i915)->ggtt->vm.gt,
> > > >
> > > > I'm not too familiar with the perf code, but this looks a bit roundabout
> > > > since we're ultimately trying to get to a GT...do we even need to go
> > > > through the ggtt structure here or can we just pass
> > > > "to_gt(stream->perf->i915)" as the first parameter?
> > > >
> > > > >  					      atomic64_read(&stream->perf->noa_programming_delay));
> > > > >  	const u32 base = stream->engine->mmio_base;
> > > > >  #define CS_GPR(x) GEN8_RING_CS_GPR(base, x)
> > > > > @@ -3542,7 +3542,7 @@ i915_perf_open_ioctl_locked(struct i915_perf *perf,
> > > > >
> > > > >  static u64 oa_exponent_to_ns(struct i915_perf *perf, int exponent)
> > > > >  {
> > > > > -	return intel_gt_clock_interval_to_ns(perf->i915->ggtt.vm.gt,
> > > > > +	return intel_gt_clock_interval_to_ns(to_gt(perf->i915)->ggtt->vm.gt,
> > > >
> > > > Ditto; this looks like "to_gt(perf->i915)" might be all we need?
> > > 
> > > I think this function is looking for the GT coming from the VM,
> > > otherwise originally it could have taken it from &i915->gt. In my
> > > first version I proposed a wrapper around this but it was
> > > rejected by Lucas.
> > > 
> > > Besides, as we discussed earlier when I was proposed the static
> > > allocation, the ggtt might not always be linked to the same gt,
> > > so that I assumed that sometimes:
> > > 
> > >    to_gt(perf->i915)->ggtt->vm.gt != to_gt(perf->i915)
> > > 
> > > if two GTs are sharing the same ggtt, what would the ggtt->vm.gt
> > > link be?
> > 
> > From the git history, it doesn't look like this really needs to care
> > about the GGTT at all; I think it was just unintentionally written in a
> > roundabout manner when intel_gt was first being introduced in the code.
> > The reference here first showed up in commit f170523a7b8e ("drm/i915/gt:
> > Consolidate the CS timestamp clocks").
> > 
> > Actually the most correct thing to do is probably to use
> > 'stream->engine->gt' to ensure we grab the GT actually associated with
> > the stream's engine.
> > 
> 
> stream is not yet created at this point, so I would do this:
> 
> pass intel_gt to the helper instead of perf:
> static u64 oa_exponent_to_ns(struct intel_gt *gt, int exponent)
> {
> 	return intel_gt_clock_interval_to_ns(gt, 2ULL << exponent);
> }
> 
> caller would then be:
> oa_period = oa_exponent_to_ns(props->engine->gt, value);

thanks for the suggestions, but this is out of the scope of this
patch... I did propose a wrapper but it was rejected because it
was, indeed, out of scope.

I'm going to use to_gt(perf->i915) as Matt suggested originally,
patch is ready.

Thanks,
Andi
