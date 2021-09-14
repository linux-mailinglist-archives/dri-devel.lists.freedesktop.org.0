Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BCB40AC22
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 12:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A203989CF3;
	Tue, 14 Sep 2021 10:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE00E89CF3;
 Tue, 14 Sep 2021 10:59:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="307509405"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="307509405"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 03:59:45 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="432953315"
Received: from ocascan-mobl.ger.corp.intel.com (HELO [10.213.234.116])
 ([10.213.234.116])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 03:59:43 -0700
Subject: Re: [Intel-gfx] [PATCH 15/26] drm/i915: use the new iterator in
 i915_request_await_object
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
References: <20210913131707.45639-1-christian.koenig@amd.com>
 <20210913131707.45639-16-christian.koenig@amd.com>
 <f9ebc539-3965-b57f-7040-78aaba72afbd@linux.intel.com>
 <698f042e-4fc5-2944-8d77-b89352034fcf@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <5e0d0d25-9c45-a81f-f8af-6a0c96d57778@linux.intel.com>
Date: Tue, 14 Sep 2021 11:59:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <698f042e-4fc5-2944-8d77-b89352034fcf@gmail.com>
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


On 14/09/2021 11:39, Christian König wrote:
> Am 14.09.21 um 12:26 schrieb Tvrtko Ursulin:
>>
>> On 13/09/2021 14:16, Christian König wrote:
>>> Simplifying the code a bit.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/gpu/drm/i915/i915_request.c | 36 ++++++-----------------------
>>>   1 file changed, 7 insertions(+), 29 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_request.c 
>>> b/drivers/gpu/drm/i915/i915_request.c
>>> index 37aef1308573..b81045ceb619 100644
>>> --- a/drivers/gpu/drm/i915/i915_request.c
>>> +++ b/drivers/gpu/drm/i915/i915_request.c
>>> @@ -1583,38 +1583,16 @@ i915_request_await_object(struct i915_request 
>>> *to,
>>>                 struct drm_i915_gem_object *obj,
>>>                 bool write)
>>>   {
>>> -    struct dma_fence *excl;
>>> +    struct dma_resv_cursor cursor;
>>> +    struct dma_fence *fence;
>>>       int ret = 0;
>>>   -    if (write) {
>>> -        struct dma_fence **shared;
>>> -        unsigned int count, i;
>>> -
>>> -        ret = dma_resv_get_fences(obj->base.resv, &excl, &count,
>>> -                      &shared);
>>> -        if (ret)
>>> -            return ret;
>>> -
>>> -        for (i = 0; i < count; i++) {
>>> -            ret = i915_request_await_dma_fence(to, shared[i]);
>>> -            if (ret)
>>> -                break;
>>> -
>>> -            dma_fence_put(shared[i]);
>>> +    dma_resv_for_each_fence_unlocked(obj->base.resv, &cursor, write, 
>>> fence) {
>>
>> I think callers have the object locked for this one. At least if you 
>> haven't tried it it's worth asking CI (you have the assert already so 
>> it will tell you). But I think it's important to have an atomic 
>> snapshot here.
> 
> Thanks for the info. In this case I'm just going to use the locked 
> variant of the iterator here for the next round.
> 
> Could you point me to the place where the lock is grabed/released for 
> reference?

There is quite a few callers and I haven't audited all of them. But I 
think, given the function is used for setting up tracking of implicit 
dependencies, that it has to be true.

In the case of execbuf for instance the flow is relatively complicated:

i915_gem_do_execbuffer
   eb_relocate_parse
     eb_validate_vmas
       eb_lock_vmas
         i915_gem_object_lock
   eb_submit
     eb_move_to_gpu
       i915_request_await_object
   i915_gem_ww_ctx_fini
     i915_gem_ww_ctx_unlock_all
       i915_gem_object_unlock

Other call sites have simpler flows but there is a lot of them so I 
think using CI is easiest.

Regards,

Tvrtko

> Thanks,
> Christian.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>> +        ret = i915_request_await_dma_fence(to, fence);
>>> +        if (ret) {
>>> +            dma_fence_put(fence);
>>> +            break;
>>>           }
>>> -
>>> -        for (; i < count; i++)
>>> -            dma_fence_put(shared[i]);
>>> -        kfree(shared);
>>> -    } else {
>>> -        excl = dma_resv_get_excl_unlocked(obj->base.resv);
>>> -    }
>>> -
>>> -    if (excl) {
>>> -        if (ret == 0)
>>> -            ret = i915_request_await_dma_fence(to, excl);
>>> -
>>> -        dma_fence_put(excl);
>>>       }
>>>         return ret;
>>>
> 
