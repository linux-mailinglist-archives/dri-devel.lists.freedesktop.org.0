Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D975414769
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 13:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5131E89E11;
	Wed, 22 Sep 2021 11:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F359A89E11;
 Wed, 22 Sep 2021 11:12:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="210806105"
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; d="scan'208";a="210806105"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 04:12:09 -0700
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; d="scan'208";a="512939305"
Received: from bbrowne-mobl.ger.corp.intel.com (HELO [10.213.200.151])
 ([10.213.200.151])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 04:12:07 -0700
Subject: Re: [PATCH 18/26] drm/i915: use new iterator in
 i915_gem_object_last_write_engine
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
References: <20210922091044.2612-1-christian.koenig@amd.com>
 <20210922091044.2612-19-christian.koenig@amd.com>
 <92e428d5-76d5-e63f-5322-aa5cf1a1952a@linux.intel.com>
 <db679020-b35b-8664-a6b8-3d88ed2ca8c6@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <80ac45ad-c23b-92a7-59dd-b6a253789df5@linux.intel.com>
Date: Wed, 22 Sep 2021 12:12:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <db679020-b35b-8664-a6b8-3d88ed2ca8c6@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/09/2021 12:00, Christian König wrote:
> Am 22.09.21 um 12:27 schrieb Tvrtko Ursulin:
>>
>> On 22/09/2021 10:10, Christian König wrote:
>>> This is maybe even a fix since the RCU usage here looks incorrect.
>>
>> I'm afraid I gazumped you here by removing this function shortly 
>> before you posted the respin.
> 
> Is that already landed in drm-misc-next? If not just give me an Acked-by 
> and it will be fixed when merging trees together again by just dropping 
> the change.
> 
> Alternatively if it is not in drm-next I will ping the drm-misc-next 
> maintainer for a merge.

Problem is you will never pass our CI with a series which does not apply 
to drm-tip. ;)

Regards,

Tvrtko

> Regards,
> Christian.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/gpu/drm/i915/gem/i915_gem_object.h | 16 ++++++++--------
>>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>> index 48112b9d76df..e20efffce3a9 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>> @@ -507,16 +507,16 @@ static inline struct intel_engine_cs *
>>>   i915_gem_object_last_write_engine(struct drm_i915_gem_object *obj)
>>>   {
>>>       struct intel_engine_cs *engine = NULL;
>>> +    struct dma_resv_iter cursor;
>>>       struct dma_fence *fence;
>>>   -    rcu_read_lock();
>>> -    fence = dma_resv_get_excl_unlocked(obj->base.resv);
>>> -    rcu_read_unlock();
>>> -
>>> -    if (fence && dma_fence_is_i915(fence) && 
>>> !dma_fence_is_signaled(fence))
>>> -        engine = to_request(fence)->engine;
>>> -    dma_fence_put(fence);
>>> -
>>> +    dma_resv_iter_begin(&cursor, obj->base.resv, false);
>>> +    dma_resv_for_each_fence_unlocked(&cursor, fence) {
>>> +        if (fence && dma_fence_is_i915(fence) &&
>>> +            !dma_fence_is_signaled(fence))
>>> +            engine = to_request(fence)->engine;
>>> +    }
>>> +    dma_resv_iter_end(&cursor);
>>>       return engine;
>>>   }
>>>
> 
