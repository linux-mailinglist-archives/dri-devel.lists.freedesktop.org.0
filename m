Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6271C63D63C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 14:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087DA10E09E;
	Wed, 30 Nov 2022 13:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A5210E072;
 Wed, 30 Nov 2022 13:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669813384; x=1701349384;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1cJfFy2EKhAYcPEDPvEla7O2r1PEnKFHEIqMTfCKD5c=;
 b=d7c/1qQGrPjPXe63oSdILhQ9AL3OW7xxaR/e5S/1vgK3bM5vmjDQW6lg
 G22Lx+3t/MqT1pc8qm/t0Z/XAAr+foPDpJy1L7MeyqGjN0Fd5cRExjD18
 WkXj8E6FnHGYFnL6mQNMdckzWd1QvCZXiplqmyJgekf1LmeGT2wCe/sBC
 cdinZWMB67xKgt+rQgOn4UiMLsQTOCu4WtLYp1MA/JXiYEO2uTvOxbEaL
 DCHovnvkQ10bgKeuf7rTxEFC43W2Y89jXD+yQUGXoTY/bD/2LD0Q7oxCg
 ikxgPlNmR/HwEex16Ded/EtdN/mttsFcR9fqqMlXaEiantOAYmLZ1VJBX w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="401668806"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; d="scan'208";a="401668806"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 05:03:03 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="818621322"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; d="scan'208";a="818621322"
Received: from hpvpnmu01.ger.corp.intel.com (HELO [10.213.197.198])
 ([10.213.197.198])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 05:03:01 -0800
Message-ID: <d03545c9-d0cb-5bdb-24e8-9eadcda51b83@linux.intel.com>
Date: Wed, 30 Nov 2022 13:02:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH 7/9] drm/i915: stop using ttm_bo_wait
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20221125102137.1801-1-christian.koenig@amd.com>
 <20221125102137.1801-7-christian.koenig@amd.com>
 <d92312af-3c84-8bd9-108b-719fb1ec3a6b@linux.intel.com>
 <CAM0jSHMKBb3orp8Ez4sC8TNcjPZF9y-4e12Jy6SPqbJonhYVhw@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAM0jSHMKBb3orp8Ez4sC8TNcjPZF9y-4e12Jy6SPqbJonhYVhw@mail.gmail.com>
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 29/11/2022 18:05, Matthew Auld wrote:
> On Fri, 25 Nov 2022 at 11:14, Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>
>> + Matt
>>
>> On 25/11/2022 10:21, Christian König wrote:
>>> TTM is just wrapping core DMA functionality here, remove the mid-layer.
>>> No functional change.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>    drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 9 ++++++---
>>>    1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> index 5247d88b3c13..d409a77449a3 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> @@ -599,13 +599,16 @@ i915_ttm_resource_get_st(struct drm_i915_gem_object *obj,
>>>    static int i915_ttm_truncate(struct drm_i915_gem_object *obj)
>>>    {
>>>        struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
>>> -     int err;
>>> +     long err;
>>>
>>>        WARN_ON_ONCE(obj->mm.madv == I915_MADV_WILLNEED);
>>>
>>> -     err = ttm_bo_wait(bo, true, false);
>>> -     if (err)
>>> +     err = dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP,
>>> +                                 true, 15 * HZ);
>>
>> This 15 second stuck out a bit for me and then on a slightly deeper look
>> it seems this timeout will "leak" into a few of i915 code paths. If we
>> look at the difference between the legacy shmem and ttm backend I am not
>> sure if the legacy one is blocking or not - but if it can block I don't
>> think it would have an arbitrary timeout like this. Matt your thoughts?
> 
> Not sure what is meant by leak here, but the legacy shmem must also
> wait/block when unbinding each VMA, before calling truncate. It's the

By "leak" I meant if 15s timeout propagates into some code paths visible 
from userspace which with a legacy backend instead have an indefinite 
wait. If we have that it's probably not very good to have this 
inconsistency, or to apply an arbitrary timeout to those path to start with.

> same story for the ttm backend, except slightly more complicated in
> that there might be no currently bound VMA, and yet the GPU could
> still be accessing the pages due to async unbinds, kernel moves etc,
> which the wait here (and in i915_ttm_shrink) is meant to protect
> against. If the wait times out it should just fail gracefully. I guess
> we could just use MAX_SCHEDULE_TIMEOUT here? Not sure if it really
> matters though.

Right, depends if it can leak or not to userspace and diverge between 
backends.

Regards,

Tvrtko
