Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82218644AC6
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 19:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4095D10E339;
	Tue,  6 Dec 2022 18:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48FA10E154;
 Tue,  6 Dec 2022 18:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670349796; x=1701885796;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DaCgPjs70Og0IQyGIgjL8ryPlRQjrsg6hlcK1jIZeJk=;
 b=RQ++Xo4KQA2asVWCq2PoEEDKj9Lzz18GTPVFwKH0Fvwikx/2sNbT9YnM
 HL2Oix+sV+vLOTxK9S6I64Pi8Niucq+YNTqA30kL0/g8W6vqTGFqabl3T
 VIXh00lGcWSXOT7w3Vj+yhooWXJ/kCkGrsMnm+yJ5YiYfdQPK8eerwafQ
 Perj2oyKr+Yvv1UNTlhtxZQU+cqqihkCXAlQIoNmbF1g8tOnfl1xbXwzO
 k0Fw/kXNf/WwTo6HsP2K5zMIVQmbdgcfZEn9BqF2X9znrvGo7LOWsjF5K
 LVzccTIyfB2kgEk1H0mUUus5mSVK0L4Axnfej3UZD7rdGUaB+R6OfDOfm w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="304317581"
X-IronPort-AV: E=Sophos;i="5.96,223,1665471600"; d="scan'208";a="304317581"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2022 10:03:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="678837112"
X-IronPort-AV: E=Sophos;i="5.96,223,1665471600"; d="scan'208";a="678837112"
Received: from yk-book.ger.corp.intel.com (HELO [10.252.19.83])
 ([10.252.19.83])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2022 10:03:04 -0800
Message-ID: <d56a0149-2913-8b78-de91-f633ae664a7a@intel.com>
Date: Tue, 6 Dec 2022 18:03:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.1
Subject: Re: [Intel-gfx] [PATCH 7/9] drm/i915: stop using ttm_bo_wait
Content-Language: en-GB
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <20221125102137.1801-1-christian.koenig@amd.com>
 <20221125102137.1801-7-christian.koenig@amd.com>
 <d92312af-3c84-8bd9-108b-719fb1ec3a6b@linux.intel.com>
 <CAM0jSHMKBb3orp8Ez4sC8TNcjPZF9y-4e12Jy6SPqbJonhYVhw@mail.gmail.com>
 <d03545c9-d0cb-5bdb-24e8-9eadcda51b83@linux.intel.com>
 <CAKMK7uHf1yvpS5JWzF2JASkXuZwyvpzWw66w9sYe19_+VqMHeA@mail.gmail.com>
 <4514ca57-e39e-d684-3101-fddf57b0c89a@gmail.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <4514ca57-e39e-d684-3101-fddf57b0c89a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.william.auld@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/12/2022 19:58, Christian König wrote:
> Am 30.11.22 um 15:06 schrieb Daniel Vetter:
>> On Wed, 30 Nov 2022 at 14:03, Tvrtko Ursulin
>> <tvrtko.ursulin@linux.intel.com> wrote:
>>> On 29/11/2022 18:05, Matthew Auld wrote:
>>>> On Fri, 25 Nov 2022 at 11:14, Tvrtko Ursulin
>>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>>
>>>>> + Matt
>>>>>
>>>>> On 25/11/2022 10:21, Christian König wrote:
>>>>>> TTM is just wrapping core DMA functionality here, remove the 
>>>>>> mid-layer.
>>>>>> No functional change.
>>>>>>
>>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 9 ++++++---
>>>>>>     1 file changed, 6 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c 
>>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>>> index 5247d88b3c13..d409a77449a3 100644
>>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>>> @@ -599,13 +599,16 @@ i915_ttm_resource_get_st(struct 
>>>>>> drm_i915_gem_object *obj,
>>>>>>     static int i915_ttm_truncate(struct drm_i915_gem_object *obj)
>>>>>>     {
>>>>>>         struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
>>>>>> -     int err;
>>>>>> +     long err;
>>>>>>
>>>>>>         WARN_ON_ONCE(obj->mm.madv == I915_MADV_WILLNEED);
>>>>>>
>>>>>> -     err = ttm_bo_wait(bo, true, false);
>>>>>> -     if (err)
>>>>>> +     err = dma_resv_wait_timeout(bo->base.resv, 
>>>>>> DMA_RESV_USAGE_BOOKKEEP,
>>>>>> +                                 true, 15 * HZ);
>>>>> This 15 second stuck out a bit for me and then on a slightly deeper 
>>>>> look
>>>>> it seems this timeout will "leak" into a few of i915 code paths. If we
>>>>> look at the difference between the legacy shmem and ttm backend I 
>>>>> am not
>>>>> sure if the legacy one is blocking or not - but if it can block I 
>>>>> don't
>>>>> think it would have an arbitrary timeout like this. Matt your 
>>>>> thoughts?
>>>> Not sure what is meant by leak here, but the legacy shmem must also
>>>> wait/block when unbinding each VMA, before calling truncate. It's the
>>> By "leak" I meant if 15s timeout propagates into some code paths visible
>>> from userspace which with a legacy backend instead have an indefinite
>>> wait. If we have that it's probably not very good to have this
>>> inconsistency, or to apply an arbitrary timeout to those path to 
>>> start with.
>>>
>>>> same story for the ttm backend, except slightly more complicated in
>>>> that there might be no currently bound VMA, and yet the GPU could
>>>> still be accessing the pages due to async unbinds, kernel moves etc,
>>>> which the wait here (and in i915_ttm_shrink) is meant to protect
>>>> against. If the wait times out it should just fail gracefully. I guess
>>>> we could just use MAX_SCHEDULE_TIMEOUT here? Not sure if it really
>>>> matters though.
>>> Right, depends if it can leak or not to userspace and diverge between
>>> backends.
>> Generally lock_timeout() is a design bug. It's either
>> lock_interruptible (or maybe lock_killable) or try_lock, but
>> lock_timeout is just duct-tape. I haven't dug in to figure out what
>> should be here, but it smells fishy.
> 
> Independent of this discussion could I get an rb for removing 
> ttm_bo_wait() from i915?
> 
> Exactly hiding this timeout inside TTM is what always made me quite 
> nervous here.

There are also a few places in i915 calling bo_wait_ctx(), which appears 
to just wrap ttm_bo_wait(). I guess that should also be converted to 
dma_resv_wait_timeout()? Or what is the story with that?

Anyway,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> 
> Regards,
> Christian.
> 
>> -Daniel
> 
