Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E34EE483841
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 22:17:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C3689850;
	Mon,  3 Jan 2022 21:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E833F89829;
 Mon,  3 Jan 2022 21:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641244631; x=1672780631;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fhDBcaXP4K8E6Bpazw2yArVwwYQIbX7ELWXGI9asXpQ=;
 b=YyNkptGAWb41kCI7+gzFCx56T4i40j/54VK5QWXoW/EHpHM5+pubPQgf
 H/Tc9J3BWaQ17jJf8SC1dgh8xxyLz22yw9uYyPHoUzropI+gu7QskUrBh
 VFK8Em9eZhdeqXzNWZbV14qEaVEYmMeQRbxAI1WW5/YZwT0DLvH0ic1R6
 ay8hMRO2fjMsmnbGmTnr9fDtMoqnIv2bojzbr/FAgjiryq0w34/IJk5iL
 3N6Dm25Y9uLuN/JGy7fEoMa6qtg34rLIu4ZP92AXth/RIQ2yGG2Hc2YKa
 rCmxfIDeH3H61Rvsm6BeouQW59ES2vQttLfybx//sryWdO5C7FcidLiTj g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="328459634"
X-IronPort-AV: E=Sophos;i="5.88,258,1635231600"; d="scan'208";a="328459634"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2022 13:17:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,258,1635231600"; d="scan'208";a="760192188"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2022 13:17:11 -0800
Date: Mon, 3 Jan 2022 13:17:10 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v9 2/6] drm/i915: Use to_gt() helper for GGTT accesses
Message-ID: <YdNn1uOzEwwnm91N@mdroper-desk1.amr.corp.intel.com>
References: <20211219212500.61432-1-andi.shyti@linux.intel.com>
 <20211219212500.61432-3-andi.shyti@linux.intel.com>
 <YcIIf4wmvNdM09ZS@mdroper-desk1.amr.corp.intel.com>
 <YcIvFYDuY2uM5hCr@intel.intel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcIvFYDuY2uM5hCr@intel.intel>
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
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Andi Shyti <andi@etezian.org>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 21, 2021 at 09:46:29PM +0200, Andi Shyti wrote:
> Hi Matt,
> 
> > > diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> > > index 170bba913c30..128315aec517 100644
> > > --- a/drivers/gpu/drm/i915/i915_perf.c
> > > +++ b/drivers/gpu/drm/i915/i915_perf.c
> > > @@ -1630,7 +1630,7 @@ static int alloc_noa_wait(struct i915_perf_stream *stream)
> > >  	struct drm_i915_gem_object *bo;
> > >  	struct i915_vma *vma;
> > >  	const u64 delay_ticks = 0xffffffffffffffff -
> > > -		intel_gt_ns_to_clock_interval(stream->perf->i915->ggtt.vm.gt,
> > > +		intel_gt_ns_to_clock_interval(to_gt(stream->perf->i915)->ggtt->vm.gt,
> > 
> > I'm not too familiar with the perf code, but this looks a bit roundabout
> > since we're ultimately trying to get to a GT...do we even need to go
> > through the ggtt structure here or can we just pass
> > "to_gt(stream->perf->i915)" as the first parameter?
> > 
> > >  					      atomic64_read(&stream->perf->noa_programming_delay));
> > >  	const u32 base = stream->engine->mmio_base;
> > >  #define CS_GPR(x) GEN8_RING_CS_GPR(base, x)
> > > @@ -3542,7 +3542,7 @@ i915_perf_open_ioctl_locked(struct i915_perf *perf,
> > >  
> > >  static u64 oa_exponent_to_ns(struct i915_perf *perf, int exponent)
> > >  {
> > > -	return intel_gt_clock_interval_to_ns(perf->i915->ggtt.vm.gt,
> > > +	return intel_gt_clock_interval_to_ns(to_gt(perf->i915)->ggtt->vm.gt,
> > 
> > Ditto; this looks like "to_gt(perf->i915)" might be all we need?
> 
> I think this function is looking for the GT coming from the VM,
> otherwise originally it could have taken it from &i915->gt. In my
> first version I proposed a wrapper around this but it was
> rejected by Lucas.
> 
> Besides, as we discussed earlier when I was proposed the static
> allocation, the ggtt might not always be linked to the same gt,
> so that I assumed that sometimes:
> 
>    to_gt(perf->i915)->ggtt->vm.gt != to_gt(perf->i915)
> 
> if two GTs are sharing the same ggtt, what would the ggtt->vm.gt
> link be?

From the git history, it doesn't look like this really needs to care
about the GGTT at all; I think it was just unintentionally written in a
roundabout manner when intel_gt was first being introduced in the code.
The reference here first showed up in commit f170523a7b8e ("drm/i915/gt:
Consolidate the CS timestamp clocks").

Actually the most correct thing to do is probably to use
'stream->engine->gt' to ensure we grab the GT actually associated with
the stream's engine.


Matt


> 
> Thanks,
> Andi

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
