Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8564422B8F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 16:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF816E416;
	Tue,  5 Oct 2021 14:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B87F6E416;
 Tue,  5 Oct 2021 14:55:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="226077344"
X-IronPort-AV: E=Sophos;i="5.85,349,1624345200"; d="scan'208";a="226077344"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 07:55:38 -0700
X-IronPort-AV: E=Sophos;i="5.85,349,1624345200"; d="scan'208";a="438726367"
Received: from tbarret1-mobl.ger.corp.intel.com (HELO [10.213.238.194])
 ([10.213.238.194])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 07:55:36 -0700
Subject: Re: [PATCH] drm/i915: Handle Intel igfx + Intel dgfx hybrid graphics
 setup
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin
 <tvrtko.ursulin@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Matthew Auld <matthew.auld@intel.com>
References: <20211005113135.768295-1-tvrtko.ursulin@linux.intel.com>
 <3aa70cb9-c28b-b85d-eac0-b3f5cca5bf73@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <2e5d05dd-8497-1695-dc3f-9f68c00bd898@linux.intel.com>
Date: Tue, 5 Oct 2021 15:55:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <3aa70cb9-c28b-b85d-eac0-b3f5cca5bf73@linux.intel.com>
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


On 05/10/2021 14:05, Thomas Hellström wrote:
> Hi, Tvrtko,
> 
> On 10/5/21 13:31, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> In short this makes i915 work for hybrid setups (DRI_PRIME=1 with Mesa)
>> when rendering is done on Intel dgfx and scanout/composition on Intel
>> igfx.
>>
>> Before this patch the driver was not quite ready for that setup, mainly
>> because it was able to emit a semaphore wait between the two GPUs, which
>> results in deadlocks because semaphore target location in HWSP is neither
>> shared between the two, nor mapped in both GGTT spaces.
>>
>> To fix it the patch adds an additional check to a couple of relevant code
>> paths in order to prevent using semaphores for inter-engine
>> synchronisation when relevant objects are not in the same GGTT space.
>>
>> v2:
>>   * Avoid adding rq->i915. (Chris)
>>
>> v3:
>>   * Use GGTT which describes the limit more precisely.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> An IMO pretty important bugfix. I read up a bit on the previous 
> discussion on this, and from what I understand the other two options were
> 
> 1) Ripping out the semaphore code,
> 2) Consider dma-fences from other instances of the same driver as foreign.

Yes, with the caveat on the second point that there is a multi-tile 
scenario, granted of limited consequence because it only applies is 
someone tries to run that wo/ GuC, where the "same driver" check is not 
enough. This patch handles that case as well. And of course it is 
hypothetical someone would be able to create a inter-tile dependency 
there. Probably nothing in the current code does it.

> For imported dma-bufs we do 2), but particularly with lmem and p2p 
> that's a more straightforward decision.

I am not immediately familiar with p2p considerations.

> I don't think 1) is a reasonable approach to fix this bug, (but perhaps 
> as a general cleanup?), and for 2) yes I guess we might end up doing 
> that, unless we find some real benefits in treating 
> same-driver-separate-device dma-fences as local, but for this particular 
> bug, IMO this is a reasonable fix.

On the option of removing the semaphore inter-optimisation I would not 
call it cleanup since it had clear performance benefits. I personally 
don't have those benchmarks results saved though. So I'd proceed with 
caution there if the code can harmlessly remain in the confines of the 
execlists backend.

Second topic, the whole same driver fence upcast issue, I suppose can be 
discussed along the lines of whether priority inheritance across drivers 
is useful. Like for instance page flip prio boost, which currently does 
safely work between i915 instances, and is relevant to hybrid graphics. 
It was safe when I looked at it, courtesy of global scheduler lock. If 
we wanted to keep that and formalise via an more explicit/generic cross 
driver API is the question. So unless it is not safe after all, I 
wouldn't rip it out before the discussion on the big picture happens.

> So,
> 
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Thanks, I'll push it once again cleared by CI.

Regards,

Tvrtko

> 
> 
> 
> 
>> ---
>>   drivers/gpu/drm/i915/i915_request.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_request.c 
>> b/drivers/gpu/drm/i915/i915_request.c
>> index 79da5eca60af..4f189982f67e 100644
>> --- a/drivers/gpu/drm/i915/i915_request.c
>> +++ b/drivers/gpu/drm/i915/i915_request.c
>> @@ -1145,6 +1145,12 @@ __emit_semaphore_wait(struct i915_request *to,
>>       return 0;
>>   }
>> +static bool
>> +can_use_semaphore_wait(struct i915_request *to, struct i915_request 
>> *from)
>> +{
>> +    return to->engine->gt->ggtt == from->engine->gt->ggtt;
>> +}
>> +
>>   static int
>>   emit_semaphore_wait(struct i915_request *to,
>>               struct i915_request *from,
>> @@ -1153,6 +1159,9 @@ emit_semaphore_wait(struct i915_request *to,
>>       const intel_engine_mask_t mask = READ_ONCE(from->engine)->mask;
>>       struct i915_sw_fence *wait = &to->submit;
>> +    if (!can_use_semaphore_wait(to, from))
>> +        goto await_fence;
>> +
>>       if (!intel_context_use_semaphores(to->context))
>>           goto await_fence;
>> @@ -1256,7 +1265,8 @@ __i915_request_await_execution(struct 
>> i915_request *to,
>>        * immediate execution, and so we must wait until it reaches the
>>        * active slot.
>>        */
>> -    if (intel_engine_has_semaphores(to->engine) &&
>> +    if (can_use_semaphore_wait(to, from) &&
>> +        intel_engine_has_semaphores(to->engine) &&
>>           !i915_request_has_initial_breadcrumb(to)) {
>>           err = __emit_semaphore_wait(to, from, from->fence.seqno - 1);
>>           if (err < 0)
