Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D853414C3F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 16:39:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBBC6EC04;
	Wed, 22 Sep 2021 14:39:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A7B6EBFD;
 Wed, 22 Sep 2021 14:39:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="203763077"
X-IronPort-AV: E=Sophos;i="5.85,314,1624345200"; d="scan'208";a="203763077"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 07:39:21 -0700
X-IronPort-AV: E=Sophos;i="5.85,314,1624345200"; d="scan'208";a="704043760"
Received: from bbrowne-mobl.ger.corp.intel.com (HELO [10.213.200.151])
 ([10.213.200.151])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2021 07:39:19 -0700
Subject: Re: [PATCH 13/26] drm/i915: use the new iterator in
 i915_gem_busy_ioctl
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
References: <20210922091044.2612-1-christian.koenig@amd.com>
 <20210922091044.2612-14-christian.koenig@amd.com>
 <6b22cb75-6c41-db55-83f2-3eae87b585aa@linux.intel.com>
 <2afbdc22-28a7-9a47-186c-f47b4f5aceab@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <26981df8-93c7-2718-1ca0-ceb908930101@linux.intel.com>
Date: Wed, 22 Sep 2021 15:39:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2afbdc22-28a7-9a47-186c-f47b4f5aceab@gmail.com>
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


On 22/09/2021 15:31, Christian König wrote:
> Am 22.09.21 um 12:21 schrieb Tvrtko Ursulin:
>>
>> On 22/09/2021 10:10, Christian König wrote:
>>> This makes the function much simpler since the complex
>>> retry logic is now handled else where.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/gpu/drm/i915/gem/i915_gem_busy.c | 35 ++++++++++--------------
>>>   1 file changed, 14 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>>> index 6234e17259c1..313afb4a11c7 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>>> @@ -82,8 +82,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void 
>>> *data,
>>>   {
>>>       struct drm_i915_gem_busy *args = data;
>>>       struct drm_i915_gem_object *obj;
>>> -    struct dma_resv_list *list;
>>> -    unsigned int seq;
>>> +    struct dma_resv_iter cursor;
>>> +    struct dma_fence *fence;
>>>       int err;
>>>         err = -ENOENT;
>>> @@ -109,27 +109,20 @@ i915_gem_busy_ioctl(struct drm_device *dev, 
>>> void *data,
>>>        * to report the overall busyness. This is what the wait-ioctl 
>>> does.
>>>        *
>>>        */
>>> -retry:
>>> -    seq = raw_read_seqcount(&obj->base.resv->seq);
>>> -
>>> -    /* Translate the exclusive fence to the READ *and* WRITE engine */
>>> -    args->busy = 
>>> busy_check_writer(dma_resv_excl_fence(obj->base.resv));
>>> -
>>> -    /* Translate shared fences to READ set of engines */
>>> -    list = dma_resv_shared_list(obj->base.resv);
>>> -    if (list) {
>>> -        unsigned int shared_count = list->shared_count, i;
>>> -
>>> -        for (i = 0; i < shared_count; ++i) {
>>> -            struct dma_fence *fence =
>>> -                rcu_dereference(list->shared[i]);
>>> -
>>> +    args->busy = false;
>>
>> You can drop this line, especially since it is not a boolean. With that:
> 
> I just realized that this won't work. We still need to initialize the 
> return value when there is no fence at all in the resv object.
> 
>>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Does that still counts if I set args->busy to zero?

Ah yes, my bad, apologies. You can keep the r-b.

Regards,

Tvrtko

> 
> Thanks,
> Christian.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>> +    dma_resv_iter_begin(&cursor, obj->base.resv, true);
>>> +    dma_resv_for_each_fence_unlocked(&cursor, fence) {
>>> +        if (dma_resv_iter_is_restarted(&cursor))
>>> +            args->busy = 0;
>>> +
>>> +        if (dma_resv_iter_is_exclusive(&cursor))
>>> +            /* Translate the exclusive fence to the READ *and* WRITE 
>>> engine */
>>> +            args->busy |= busy_check_writer(fence);
>>> +        else
>>> +            /* Translate shared fences to READ set of engines */
>>>               args->busy |= busy_check_reader(fence);
>>> -        }
>>>       }
>>> -
>>> -    if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
>>> -        goto retry;
>>> +    dma_resv_iter_end(&cursor);
>>>         err = 0;
>>>   out:
>>>
> 
