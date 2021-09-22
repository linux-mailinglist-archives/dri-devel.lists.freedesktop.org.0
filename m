Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4104C4148B0
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 14:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD05B6EB90;
	Wed, 22 Sep 2021 12:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726DA6EB97;
 Wed, 22 Sep 2021 12:20:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="223622212"
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; d="scan'208";a="223622212"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 05:20:32 -0700
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; d="scan'208";a="703740646"
Received: from bbrowne-mobl.ger.corp.intel.com (HELO [10.213.200.151])
 ([10.213.200.151])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 05:20:31 -0700
Subject: Re: [PATCH 13/26] drm/i915: use the new iterator in
 i915_gem_busy_ioctl
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
References: <20210922091044.2612-1-christian.koenig@amd.com>
 <20210922091044.2612-14-christian.koenig@amd.com>
 <6b22cb75-6c41-db55-83f2-3eae87b585aa@linux.intel.com>
 <4c357136-3279-ff57-1c4f-62276534c887@linux.intel.com>
 <acc297ce-287e-295c-8b54-223610fb2093@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <6f8140bd-9cff-e0d8-e014-b3fb8d2d8ab0@linux.intel.com>
Date: Wed, 22 Sep 2021 13:20:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <acc297ce-287e-295c-8b54-223610fb2093@gmail.com>
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


On 22/09/2021 13:15, Christian König wrote:
> Am 22.09.21 um 13:46 schrieb Tvrtko Ursulin:
>>
>> On 22/09/2021 11:21, Tvrtko Ursulin wrote:
>>>
>>> On 22/09/2021 10:10, Christian König wrote:
>>>> This makes the function much simpler since the complex
>>>> retry logic is now handled else where.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/gem/i915_gem_busy.c | 35 
>>>> ++++++++++--------------
>>>>   1 file changed, 14 insertions(+), 21 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c 
>>>> b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>>>> index 6234e17259c1..313afb4a11c7 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>>>> @@ -82,8 +82,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void 
>>>> *data,
>>>>   {
>>>>       struct drm_i915_gem_busy *args = data;
>>>>       struct drm_i915_gem_object *obj;
>>>> -    struct dma_resv_list *list;
>>>> -    unsigned int seq;
>>>> +    struct dma_resv_iter cursor;
>>>> +    struct dma_fence *fence;
>>>>       int err;
>>>>       err = -ENOENT;
>>>> @@ -109,27 +109,20 @@ i915_gem_busy_ioctl(struct drm_device *dev, 
>>>> void *data,
>>>>        * to report the overall busyness. This is what the wait-ioctl 
>>>> does.
>>>>        *
>>>>        */
>>>> -retry:
>>>> -    seq = raw_read_seqcount(&obj->base.resv->seq);
>>>> -
>>>> -    /* Translate the exclusive fence to the READ *and* WRITE engine */
>>>> -    args->busy = 
>>>> busy_check_writer(dma_resv_excl_fence(obj->base.resv));
>>>> -
>>>> -    /* Translate shared fences to READ set of engines */
>>>> -    list = dma_resv_shared_list(obj->base.resv);
>>>> -    if (list) {
>>>> -        unsigned int shared_count = list->shared_count, i;
>>>> -
>>>> -        for (i = 0; i < shared_count; ++i) {
>>>> -            struct dma_fence *fence =
>>>> -                rcu_dereference(list->shared[i]);
>>>> -
>>>> +    args->busy = false;
>>>
>>> You can drop this line, especially since it is not a boolean. With that:
>>>
>>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Having said this, one thing to add in the commit message is some 
>> commentary that although simpler in code, the new implementation has a 
>> lot more atomic instructions due all the extra fence get/put.
>>
>> Saying this because I remembered busy ioctl is quite an over-popular 
>> one. Thinking about traces from some real userspaces I looked at in 
>> the past.
>>
>> So I think ack from maintainers will be required here. Because I just 
>> don't know if any performance impact will be visible or not. So view 
>> my r-b as "code looks fine" but I am on the fence if it should 
>> actually be merged. Probably leaning towards no actually - given how 
>> the code is localised here and I dislike burdening old platforms with 
>> more CPU time it could be cheaply left as is.
> 
> Well previously we would have allocated memory, which as far as I know 
> has more overhead than a few extra atomic operations.

It doesn't, it only uses dma_resv_excl_fence and dma_resv_shared_list.

Regards,

Tvrtko

> On the other hand I could as well stick with dma_resv_get_fences() here.
> 
> Regards,
> Christian.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> +    dma_resv_iter_begin(&cursor, obj->base.resv, true);
>>>> +    dma_resv_for_each_fence_unlocked(&cursor, fence) {
>>>> +        if (dma_resv_iter_is_restarted(&cursor))
>>>> +            args->busy = 0;
>>>> +
>>>> +        if (dma_resv_iter_is_exclusive(&cursor))
>>>> +            /* Translate the exclusive fence to the READ *and* 
>>>> WRITE engine */
>>>> +            args->busy |= busy_check_writer(fence);
>>>> +        else
>>>> +            /* Translate shared fences to READ set of engines */
>>>>               args->busy |= busy_check_reader(fence);
>>>> -        }
>>>>       }
>>>> -
>>>> -    if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
>>>> -        goto retry;
>>>> +    dma_resv_iter_end(&cursor);
>>>>       err = 0;
>>>>   out:
>>>>
> 
