Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BEB4133D0
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 15:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FED689137;
	Tue, 21 Sep 2021 13:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F50E6E998;
 Tue, 21 Sep 2021 13:10:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="220156236"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="220156236"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 06:10:29 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="556923492"
Received: from ekyne-mobl.ger.corp.intel.com (HELO [10.213.200.64])
 ([10.213.200.64])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 06:10:28 -0700
Subject: Re: [Intel-gfx] [PATCH 13/26] drm/i915: use the new iterator in
 i915_gem_busy_ioctl
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
References: <20210917123513.1106-1-christian.koenig@amd.com>
 <20210917123513.1106-14-christian.koenig@amd.com>
 <6fbaca09-ec51-c44e-708c-334ef8be8595@linux.intel.com>
 <368e8495-f4de-cbb2-3584-e022a5937885@gmail.com>
 <563bb7c3-f956-212d-6085-b1b88292887c@linux.intel.com>
 <64b6a924-be38-0ed0-da92-86296702f71c@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <5705c186-1c17-cd5d-c11d-8b5337204c8a@linux.intel.com>
Date: Tue, 21 Sep 2021 14:10:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <64b6a924-be38-0ed0-da92-86296702f71c@gmail.com>
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


On 21/09/2021 10:41, Christian König wrote:
> Am 20.09.21 um 12:33 schrieb Tvrtko Ursulin:
>> On 20/09/2021 11:13, Christian König wrote:
>>> Am 20.09.21 um 10:45 schrieb Tvrtko Ursulin:
>>>>
>>>> On 17/09/2021 13:35, Christian König wrote:
>>>>> This makes the function much simpler since the complex
>>>>> retry logic is now handled else where.
>>>>>
>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>> ---
>>>>>   drivers/gpu/drm/i915/gem/i915_gem_busy.c | 32 
>>>>> ++++++++----------------
>>>>>   1 file changed, 11 insertions(+), 21 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c 
>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>>>>> index 6234e17259c1..b1cb7ba688da 100644
>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>>>>> @@ -82,8 +82,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void 
>>>>> *data,
>>>>>   {
>>>>>       struct drm_i915_gem_busy *args = data;
>>>>>       struct drm_i915_gem_object *obj;
>>>>> -    struct dma_resv_list *list;
>>>>> -    unsigned int seq;
>>>>> +    struct dma_resv_iter cursor;
>>>>> +    struct dma_fence *fence;
>>>>>       int err;
>>>>>         err = -ENOENT;
>>>>> @@ -109,27 +109,17 @@ i915_gem_busy_ioctl(struct drm_device *dev, 
>>>>> void *data,
>>>>>        * to report the overall busyness. This is what the 
>>>>> wait-ioctl does.
>>>>>        *
>>>>>        */
>>>>> -retry:
>>>>> -    seq = raw_read_seqcount(&obj->base.resv->seq);
>>>>> -
>>>>> -    /* Translate the exclusive fence to the READ *and* WRITE 
>>>>> engine */
>>>>> -    args->busy = 
>>>>> busy_check_writer(dma_resv_excl_fence(obj->base.resv));
>>>>> -
>>>>> -    /* Translate shared fences to READ set of engines */
>>>>> -    list = dma_resv_shared_list(obj->base.resv);
>>>>> -    if (list) {
>>>>> -        unsigned int shared_count = list->shared_count, i;
>>>>> -
>>>>> -        for (i = 0; i < shared_count; ++i) {
>>>>> -            struct dma_fence *fence =
>>>>> -                rcu_dereference(list->shared[i]);
>>>>> -
>>>>> +    args->busy = false;
>>>>> +    dma_resv_iter_begin(&cursor, obj->base.resv, true);
>>>>> +    dma_resv_for_each_fence_unlocked(&cursor, fence) {
>>>>
>>>> You did not agree with my suggestion to reset args->busy on restart 
>>>> and so preserve current behaviour?
>>>
>>> No, I want to keep the restart behavior internally to the dma_resv 
>>> object and as far as I can see it should not make a difference here.
>>
>> To be clear, on paper difference between old and new implementation is 
>> if the restart happens while processing the shared fences.
>>
>> Old implementation unconditionally goes to "args->busy =
>> >>> busy_check_writer(dma_resv_excl_fence(obj->base.resv));" and so 
>> overwrites the set of flags returned to userspace.
>>
>> New implementation can merge new read flags to the old set of flags 
>> and so return a composition of past and current fences.
>>
>> Maybe it does not matter hugely in this case, depends if userspace 
>> typically just restarts until flags are clear. But I am not sure.
>>
>> On the higher level - what do you mean with wanting to keep the 
>> restart behaviour internal? Not providing iterators users means of 
>> detecting it? I think it has to be provided.
> 
> Ok I will adjust that for now to get the patch set upstream. But in 
> general when somebody outside of the dma_resv code base depends on the 
> restart behavior then that's a bug inside the design of that code.

Thanks, no change in behaviour makes for an easy r-b. :)

> The callers should only care about what unsignaled fences are inside the 
> dma_resv container and it shouldn't matter if those fences are presented 
> once or multiple times because of a reset..
> 
> When this makes a difference we have a bug in the handling and should 
> probably consider taking the dma_resv.lock instead.

I agree, which is why I was mentioning earlier how it would be good to 
completely sort locked from unlocked iterators and avoid situations 
where unlocked one is called from a path where object is locked.

Unfortunately for the display code path I cannot easily help with the 
audit of call paths. And I think there are at least two patches in your 
series which need KMS expertise.

Regards,

Tvrtko
