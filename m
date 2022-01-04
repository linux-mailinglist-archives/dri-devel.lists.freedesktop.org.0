Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1104348473F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 18:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B4E10E286;
	Tue,  4 Jan 2022 17:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C824C10E286;
 Tue,  4 Jan 2022 17:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641318755; x=1672854755;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=p6mcQo6yBQKPzTf5vkgmctmluVDYU/vTdUMidScKGMs=;
 b=VrKf58fnjc7ZRjhMY5q8r2zJVolIztfYmlLVY0AYtLr75VSmdpxR7oa8
 o7xwG51w+qMjJMt9luzoxZIKMWmV0BFFt5oqw/MGAOaB8Pm+bj3wFHEKB
 0HoViK+ll4I6rmQnYKrLo9YAyQEIALU4PT9UCRogjKgBIEex78zynrscJ
 0L9XUwLcWtuS2bdLnM7f82MrtQ4BMWjEBVeTuLbNhSu8h4nVv6fQMlDlp
 WQRdNmWNeymRckq5McVN9Kx5DL1zF/7P2q3JUFEKQX/ReEs6rg1Y8bCiX
 UpJ3Xt9xKvNJGTZetBE087WXUHXfwIe7/yHqVoS0KjljImkFqoQF7Wg29 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="266538304"
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="266538304"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 09:52:35 -0800
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="590747796"
Received: from orsosgc001.jf.intel.com (HELO orsosgc001.ra.intel.com)
 ([10.165.21.154])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 09:52:35 -0800
Date: Tue, 4 Jan 2022 09:52:31 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v9 2/6] drm/i915: Use to_gt() helper for GGTT accesses
Message-ID: <20220104175231.GA12985@orsosgc001.ra.intel.com>
References: <20211219212500.61432-1-andi.shyti@linux.intel.com>
 <20211219212500.61432-3-andi.shyti@linux.intel.com>
 <YcIIf4wmvNdM09ZS@mdroper-desk1.amr.corp.intel.com>
 <YcIvFYDuY2uM5hCr@intel.intel>
 <YdNn1uOzEwwnm91N@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <YdNn1uOzEwwnm91N@mdroper-desk1.amr.corp.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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

On Mon, Jan 03, 2022 at 01:17:10PM -0800, Matt Roper wrote:
>On Tue, Dec 21, 2021 at 09:46:29PM +0200, Andi Shyti wrote:
>> Hi Matt,
>>
>> > > diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
>> > > index 170bba913c30..128315aec517 100644
>> > > --- a/drivers/gpu/drm/i915/i915_perf.c
>> > > +++ b/drivers/gpu/drm/i915/i915_perf.c
>> > > @@ -1630,7 +1630,7 @@ static int alloc_noa_wait(struct i915_perf_stream *stream)
>> > >  	struct drm_i915_gem_object *bo;
>> > >  	struct i915_vma *vma;
>> > >  	const u64 delay_ticks = 0xffffffffffffffff -
>> > > -		intel_gt_ns_to_clock_interval(stream->perf->i915->ggtt.vm.gt,
>> > > +		intel_gt_ns_to_clock_interval(to_gt(stream->perf->i915)->ggtt->vm.gt,
>> >
>> > I'm not too familiar with the perf code, but this looks a bit roundabout
>> > since we're ultimately trying to get to a GT...do we even need to go
>> > through the ggtt structure here or can we just pass
>> > "to_gt(stream->perf->i915)" as the first parameter?
>> >
>> > >  					      atomic64_read(&stream->perf->noa_programming_delay));
>> > >  	const u32 base = stream->engine->mmio_base;
>> > >  #define CS_GPR(x) GEN8_RING_CS_GPR(base, x)
>> > > @@ -3542,7 +3542,7 @@ i915_perf_open_ioctl_locked(struct i915_perf *perf,
>> > >
>> > >  static u64 oa_exponent_to_ns(struct i915_perf *perf, int exponent)
>> > >  {
>> > > -	return intel_gt_clock_interval_to_ns(perf->i915->ggtt.vm.gt,
>> > > +	return intel_gt_clock_interval_to_ns(to_gt(perf->i915)->ggtt->vm.gt,
>> >
>> > Ditto; this looks like "to_gt(perf->i915)" might be all we need?
>>
>> I think this function is looking for the GT coming from the VM,
>> otherwise originally it could have taken it from &i915->gt. In my
>> first version I proposed a wrapper around this but it was
>> rejected by Lucas.
>>
>> Besides, as we discussed earlier when I was proposed the static
>> allocation, the ggtt might not always be linked to the same gt,
>> so that I assumed that sometimes:
>>
>>    to_gt(perf->i915)->ggtt->vm.gt != to_gt(perf->i915)
>>
>> if two GTs are sharing the same ggtt, what would the ggtt->vm.gt
>> link be?
>
>From the git history, it doesn't look like this really needs to care
>about the GGTT at all; I think it was just unintentionally written in a
>roundabout manner when intel_gt was first being introduced in the code.
>The reference here first showed up in commit f170523a7b8e ("drm/i915/gt:
>Consolidate the CS timestamp clocks").
>
>Actually the most correct thing to do is probably to use
>'stream->engine->gt' to ensure we grab the GT actually associated with
>the stream's engine.
>

stream is not yet created at this point, so I would do this:

pass intel_gt to the helper instead of perf:
static u64 oa_exponent_to_ns(struct intel_gt *gt, int exponent)
{
	return intel_gt_clock_interval_to_ns(gt, 2ULL << exponent);
}

caller would then be:
oa_period = oa_exponent_to_ns(props->engine->gt, value);

Thanks,
Umesh

>
>Matt
>
>
>>
>> Thanks,
>> Andi
>
>-- 
>Matt Roper
>Graphics Software Engineer
>VTT-OSGC Platform Enablement
>Intel Corporation
>(916) 356-2795
