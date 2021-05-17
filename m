Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 076463836BC
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 17:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587026E1F8;
	Mon, 17 May 2021 15:34:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645106E079;
 Mon, 17 May 2021 15:34:30 +0000 (UTC)
IronPort-SDR: Cv1QUhwkFMP4bXmZQY08/sZG2d7x4gnnQ5NNm22pFeBwqQWCfLrslxq3gyXEVRiOJMD8cKmfOf
 ISmEkVkmGSiQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="221533473"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; d="scan'208";a="221533473"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2021 08:33:49 -0700
IronPort-SDR: 8/3+86j8yzQ/cM2YEacpWTY7NaK2xJ0fvfw/oED7yXcImQpdiTPDAwEkdQR+hbWqbJaBVNtzg9
 88+WEdmsElhw==
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; d="scan'208";a="438025289"
Received: from lobrie3x-mobl4.ger.corp.intel.com (HELO [10.213.193.103])
 ([10.213.193.103])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2021 08:33:47 -0700
Subject: Re: [PATCH] drm/i915: Stop propagating fence errors by default
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210507083521.2406201-1-tvrtko.ursulin@linux.intel.com>
 <YJlXeMkMG7Xt0zlA@phenom.ffwll.local>
 <9fbcff85-f36c-fc90-eeb6-aa58c85a920f@linux.intel.com>
 <YKKH1rRy2HN4Gnr8@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <596bdfdd-df65-2166-4839-86e6c3308772@linux.intel.com>
Date: Mon, 17 May 2021 16:33:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKKH1rRy2HN4Gnr8@phenom.ffwll.local>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jason Ekstrand <jason.ekstrand@intel.com>,
 Marcin Slusarz <marcin.slusarz@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 17/05/2021 16:12, Daniel Vetter wrote:
> On Tue, May 11, 2021 at 10:05:27AM +0100, Tvrtko Ursulin wrote:
>>
>> On 10/05/2021 16:55, Daniel Vetter wrote:
>>> On Fri, May 07, 2021 at 09:35:21AM +0100, Tvrtko Ursulin wrote:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>
>>>> This is an alternative proposed fix for the below references bug report
>>>> where dma fence error propagation is causing undesirable change in
>>>> behaviour post GPU hang/reset.
>>>>
>>>> Approach in this patch is to simply stop propagating all dma fence errors
>>>> by default since that seems to be the upstream ask.
>>>>
>>>> To handle the case where i915 needs error propagation for security, I add
>>>> a new dma fence flag DMA_FENCE_FLAG_PROPAGATE_ERROR and make use of it in
>>>> the command parsing chain only.
>>>>
>>>> It sounds a plausible argument that fence propagation could be useful in
>>>> which case a core flag to enable opt-in should be universally useful.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>> Reported-by: Marcin Slusarz <marcin.slusarz@intel.com>
>>>> Reported-by: Miroslav Bendik
>>>> References: 9e31c1fe45d5 ("drm/i915: Propagate errors on awaiting already signaled fences")
>>>> References: https://gitlab.freedesktop.org/drm/intel/-/issues/3080
>>>> Cc: Jason Ekstrand <jason.ekstrand@intel.com>
>>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>> ---
>>>>    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 2 ++
>>>>    drivers/gpu/drm/i915/i915_sw_fence.c           | 8 ++++----
>>>>    drivers/gpu/drm/i915/i915_sw_fence.h           | 8 ++++++++
>>>>    include/linux/dma-fence.h                      | 1 +
>>>
>>> I still don't like this, least because we still introduce the concept of
>>> error propagation to dma-fence (but hey only in i915 code, which is
>>> exactly the kind of not-really-upstream approach we got a major chiding
>>> for).
>>>
>>> The only thing this does is make it explicitly opt-in instead opt-out,
>>> like the first fix. The right approach is imo still to just throw it out,
>>> and instead make the one error propagation we really need very, very
>>> explicit. Instead of hiding it behind lots of magic.
>>>
>>> The one error propagation we need is when the cmd parser work fails, it
>>> must cancel it's corresponding request to make sure the batchbuffer
>>> doesn't run. This should require about 2 lines in total:
>>>
>>> - one line to store the request so that the cmd parser work can access it.
>>>     No refcounting needed, because the the request cannot even start (much
>>>     less get freed) before the cmd parser has singalled its fence
>>>
>>> - one line to kill the request if the parsing fails. Maybe 2 if you
>>>     include the if condition. I have no idea how that's done since I'm
>>>     honestly lost how the i915 scheduler decides whether to run a batch or
>>>     not. I'm guessing we have a version of this for the ringbuffer and the
>>>     execlist backend (if not maybe gen7 cmdparser is broken?)
>>>
>>> I don't see any need for magic behind-the-scenes propagation of such a
>>> security critical error. Especially when that error propagation thing
>>> caused security bugs of its own, is an i915-only feature, and not
>>> motivated by any userspace/uapi requirements at all.
>>
>> I took this approach because to me propagating errors sounds more logical
>> than ignoring them and I was arguing in the commit message that the
>> infrastructure to enable that could be put in place as opt-in.
>>
>> I also do not see a lot of magic in this patch. Only thing, potentially the
>> logic should be inverted so that the waiter marks itself as interested in
>> receiving errors. That would probably make even more sense as a core
>> concept.
>>
>> Has there been a wider discussion on this topic in the past? I am curious to
>> know, even if propagation currently is i915 only, could other drivers be
>> interested.
> 
> There hasn't been. i915-gem team decided "this is a cool concept", which
> resulted in a security bug. Now we're a few months in arguing whether a
> cool-looking concept that leads to a security bug is maybe a good idea,
> and whether we should sneak it in as a core concept to dma-buf.h without
> any wider discussion on the concept.
> 
>> Note that it adds almost nothing to the dma-buf common code about a single
>> flag, and at some point (currently missing) documentation on the very flag.
> 
> This is really not how upstream collaboration works, and it needs to stop.
> 
> If you want this, start another thread arguing why this is a good idea,
> fully decoupled from the security fix here.

When I asked you whether you know there were past discussions on this 
topic, clearly the point of that was to figure out whether a new 
discussion needs to be started, or I need to go and read an existing one 
to get up to speed.

I don't know how you interpreted that as an attempt to sneak anything 
in. And I don't know how I could have reliably figured out the answer to 
that question without asking. So colour me confused.

To clarify on the security issue part - are you talking about 
https://gitlab.freedesktop.org/drm/intel/-/issues/3080, or the other 
security issue, the one which would be caused by simply reverting the 
error propagation in i915?

Regards,

Tvrtko
