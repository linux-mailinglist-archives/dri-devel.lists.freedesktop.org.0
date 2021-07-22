Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE7E3D2516
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 16:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA676EC05;
	Thu, 22 Jul 2021 14:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77D86EC05;
 Thu, 22 Jul 2021 14:02:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10053"; a="272764595"
X-IronPort-AV: E=Sophos;i="5.84,261,1620716400"; d="scan'208";a="272764595"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 07:02:37 -0700
X-IronPort-AV: E=Sophos;i="5.84,261,1620716400"; d="scan'208";a="470651337"
Received: from cstylian-mobl3.ger.corp.intel.com (HELO [10.213.198.98])
 ([10.213.198.98])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 07:02:34 -0700
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Ditch i915 globals shrink
 infrastructure
To: Jason Ekstrand <jason@jlekstrand.net>
References: <20210721183229.4136488-1-daniel.vetter@ffwll.ch>
 <591fb3fc-ca96-da18-a280-37304f5f920d@linux.intel.com>
 <YPlFl0KZYNbtU2El@phenom.ffwll.local>
 <013d624b-a39d-55f7-9712-1ae0d0aee4c5@linux.intel.com>
 <CAOFGe94XO6ZA+W9Vby0P-VERadn1Rwox_EFTavWrjoUc6YzsaA@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <f963debc-e129-4bfb-467e-7decaef8d825@linux.intel.com>
Date: Thu, 22 Jul 2021 15:02:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOFGe94XO6ZA+W9Vby0P-VERadn1Rwox_EFTavWrjoUc6YzsaA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/07/2021 14:37, Jason Ekstrand wrote:
> On Thu, Jul 22, 2021 at 5:34 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>> On 22/07/2021 11:16, Daniel Vetter wrote:
>>> On Thu, Jul 22, 2021 at 11:02:55AM +0100, Tvrtko Ursulin wrote:
>>>> On 21/07/2021 19:32, Daniel Vetter wrote:
>>>>> This essentially reverts
>>>>>
>>>>> commit 84a1074920523430f9dc30ff907f4801b4820072
>>>>> Author: Chris Wilson <chris@chris-wilson.co.uk>
>>>>> Date:   Wed Jan 24 11:36:08 2018 +0000
>>>>>
>>>>>        drm/i915: Shrink the GEM kmem_caches upon idling
>>>>>
>>>>> mm/vmscan.c:do_shrink_slab() is a thing, if there's an issue with it
>>>>> then we need to fix that there, not hand-roll our own slab shrinking
>>>>> code in i915.
>>>>
>>>> This is somewhat incomplete statement which ignores a couple of angles so I
>>>> wish there was a bit more time to respond before steam rolling it in. :(
>>>>
>>>> The removed code was not a hand rolled shrinker, but about managing slab
>>>> sizes in face of bursty workloads. Core code does not know when i915 is
>>>> active and when it is idle, so calling kmem_cache_shrink() after going idle
>>>> wass supposed to help with house keeping by doing house keeping work outside
>>>> of the latency sensitive phase.
>>>>
>>>> To "fix" (improve really) it in core as you suggest, would need some method
>>>> of signaling when a slab user feels is an opportunte moment to do this house
>>>> keeping. And kmem_cache_shrink is just that so I don't see the problem.
>>>>
>>>> Granted, argument kmem_cache_shrink is not much used is a valid one so
>>>> discussion overall is definitely valid. Becuase on the higher level we could
>>>> definitely talk about which workloads actually benefit from this code and
>>>> how much which probably no one knows at this point.
> 
> Pardon me for being a bit curt here, but that discussion should have
> happened 3.5 years ago when this landed.  The entire justification we
> have on record for this change is, "When we finally decide the gpu is
> idle, that is a good time to shrink our kmem_caches."  We have no
> record of any workloads which benefit from this and no recorded way to
> reproduce any supposed benefits, even if it requires a microbenchmark.
> But we added over 100 lines of code for it anyway, including a bunch
> of hand-rolled RCU juggling.  Ripping out unjustified complexity is
> almost always justified, IMO.  The burden of proof here isn't on
> Daniel to show he isn't regressing anything but it was on you and
> Chris to show that complexity was worth something back in 2018 when
> this landed.

It feels like there is so much knee-jerk when looking at code added by 
Chris which often results in not reading properly what I wrote.

For instance I did not ask for any proof of no regressions, neither I 
claimed any regressions. In fact I said clearly that at this point it is 
not known what benefited from it. Statement at the time wasn't clear so 
you would need to ask Chris whether he remembers any better than what I 
can find in mailing list archives. Heck I even said the argument to 
remove is completely valid..

Point is, process used to be more inclusive and IMO there is no 
technical justification to fast track this type of change. Compared to 
other work in progress there was approaching zero maintenance cost with 
this.

Besides, mm folks may still say that it is good hygiene to tidy own 
slabs at opportune moments. Maybe it is a stretch but we don't know if 
we don't ask. There are certainly online references to slab reclaim 
being problematic in the past. There was nothing urgent in this "revert" 
which couldn't have waited a bit longer, or at least _some_ of the 
involved people copied.

Regards,

Tvrtko
