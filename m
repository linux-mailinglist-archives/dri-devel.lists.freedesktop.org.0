Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F4D47C7BE
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 20:47:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF41710E3F1;
	Tue, 21 Dec 2021 19:46:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B8E10E2E4;
 Tue, 21 Dec 2021 19:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640116015; x=1671652015;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=udOlidwscygkD9ALaSZNIWgNlG/NpzhvJzPaqLMexKM=;
 b=mmgvX5DsIAxz6ZjV99NPHoreeMTMSCKh8Xlkpcz/1KcswQxtDZmBu0dN
 ckGHrs+Q7ygfRB03Ng3ZdQSlr7fMQ7fCBUdvNBm3pUWGOTg0BY+7hLEi5
 E9bolCDMYhP9MUWgIJJmsJ3AiZzwPxKj0/87YvwFSJiNCzn0n8Iu+GjQP
 4DGiZIJwcAVoFfZIGpO8uLrkSvt8s9cB3OYucZSaQvZEChaZpRFvOZM07
 UBT6DUGy6A2FB/U54qHoOFqKKxi+ytXvv9Q1/gsc4My1SO+pRWBht/Uc0
 RuR/L7FMAVV40UiYRk/LmgTLZozBv9jKawp8ZuzU7M18oJW2BwB+M0oHV A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="326781415"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; d="scan'208";a="326781415"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 11:46:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; d="scan'208";a="508210864"
Received: from fgrosu-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.249.35.170])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 11:46:32 -0800
Date: Tue, 21 Dec 2021 21:46:29 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v9 2/6] drm/i915: Use to_gt() helper for GGTT accesses
Message-ID: <YcIvFYDuY2uM5hCr@intel.intel>
References: <20211219212500.61432-1-andi.shyti@linux.intel.com>
 <20211219212500.61432-3-andi.shyti@linux.intel.com>
 <YcIIf4wmvNdM09ZS@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcIIf4wmvNdM09ZS@mdroper-desk1.amr.corp.intel.com>
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

Hi Matt,

> > diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> > index 170bba913c30..128315aec517 100644
> > --- a/drivers/gpu/drm/i915/i915_perf.c
> > +++ b/drivers/gpu/drm/i915/i915_perf.c
> > @@ -1630,7 +1630,7 @@ static int alloc_noa_wait(struct i915_perf_stream *stream)
> >  	struct drm_i915_gem_object *bo;
> >  	struct i915_vma *vma;
> >  	const u64 delay_ticks = 0xffffffffffffffff -
> > -		intel_gt_ns_to_clock_interval(stream->perf->i915->ggtt.vm.gt,
> > +		intel_gt_ns_to_clock_interval(to_gt(stream->perf->i915)->ggtt->vm.gt,
> 
> I'm not too familiar with the perf code, but this looks a bit roundabout
> since we're ultimately trying to get to a GT...do we even need to go
> through the ggtt structure here or can we just pass
> "to_gt(stream->perf->i915)" as the first parameter?
> 
> >  					      atomic64_read(&stream->perf->noa_programming_delay));
> >  	const u32 base = stream->engine->mmio_base;
> >  #define CS_GPR(x) GEN8_RING_CS_GPR(base, x)
> > @@ -3542,7 +3542,7 @@ i915_perf_open_ioctl_locked(struct i915_perf *perf,
> >  
> >  static u64 oa_exponent_to_ns(struct i915_perf *perf, int exponent)
> >  {
> > -	return intel_gt_clock_interval_to_ns(perf->i915->ggtt.vm.gt,
> > +	return intel_gt_clock_interval_to_ns(to_gt(perf->i915)->ggtt->vm.gt,
> 
> Ditto; this looks like "to_gt(perf->i915)" might be all we need?

I think this function is looking for the GT coming from the VM,
otherwise originally it could have taken it from &i915->gt. In my
first version I proposed a wrapper around this but it was
rejected by Lucas.

Besides, as we discussed earlier when I was proposed the static
allocation, the ggtt might not always be linked to the same gt,
so that I assumed that sometimes:

   to_gt(perf->i915)->ggtt->vm.gt != to_gt(perf->i915)

if two GTs are sharing the same ggtt, what would the ggtt->vm.gt
link be?

Thanks,
Andi
