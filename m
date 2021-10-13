Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 914C142C5CA
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 18:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E016E9FE;
	Wed, 13 Oct 2021 16:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256006E054;
 Wed, 13 Oct 2021 16:04:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="227359317"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="227359317"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 09:02:50 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="480861296"
Received: from lvoronov-mobl.ger.corp.intel.com (HELO [10.213.252.151])
 ([10.213.252.151])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 09:02:48 -0700
Subject: Re: [PATCH] drm/i915: Handle Intel igfx + Intel dgfx hybrid graphics
 setup
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>
References: <20211005113135.768295-1-tvrtko.ursulin@linux.intel.com>
 <3aa70cb9-c28b-b85d-eac0-b3f5cca5bf73@linux.intel.com>
 <YWbLz35BuRZlSDFg@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <71d9b4c1-bafc-57ac-c594-f1c2ad25a332@linux.intel.com>
Date: Wed, 13 Oct 2021 17:02:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWbLz35BuRZlSDFg@phenom.ffwll.local>
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


On 13/10/2021 13:06, Daniel Vetter wrote:
> On Tue, Oct 05, 2021 at 03:05:25PM +0200, Thomas Hellström wrote:
>> Hi, Tvrtko,
>>
>> On 10/5/21 13:31, Tvrtko Ursulin wrote:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> In short this makes i915 work for hybrid setups (DRI_PRIME=1 with Mesa)
>>> when rendering is done on Intel dgfx and scanout/composition on Intel
>>> igfx.
>>>
>>> Before this patch the driver was not quite ready for that setup, mainly
>>> because it was able to emit a semaphore wait between the two GPUs, which
>>> results in deadlocks because semaphore target location in HWSP is neither
>>> shared between the two, nor mapped in both GGTT spaces.
>>>
>>> To fix it the patch adds an additional check to a couple of relevant code
>>> paths in order to prevent using semaphores for inter-engine
>>> synchronisation when relevant objects are not in the same GGTT space.
>>>
>>> v2:
>>>    * Avoid adding rq->i915. (Chris)
>>>
>>> v3:
>>>    * Use GGTT which describes the limit more precisely.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>
>> An IMO pretty important bugfix. I read up a bit on the previous discussion
>> on this, and from what I understand the other two options were
>>
>> 1) Ripping out the semaphore code,
>> 2) Consider dma-fences from other instances of the same driver as foreign.
>>
>> For imported dma-bufs we do 2), but particularly with lmem and p2p that's a
>> more straightforward decision.
>>
>> I don't think 1) is a reasonable approach to fix this bug, (but perhaps as a
>> general cleanup?), and for 2) yes I guess we might end up doing that, unless
>> we find some real benefits in treating same-driver-separate-device
>> dma-fences as local, but for this particular bug, IMO this is a reasonable
>> fix.
> 
> The foreign dma-fences have uapi impact, which Tvrtko shrugged off as
> "it's a good idea", and not it's really just not. So we still need to that
> this properly.

I always said lets merge the fix and discuss it. Fix only improved one 
fail and did not introduce any new issues you are worried about. They 
were all already there.

So lets start the discussion why it is not a good idea to extend the 
concept of priority inheritance in the hybrid case?

Today we can have high priority compositor waiting for client rendering, 
or even I915_PRIORITY_DISPLAY which I _think_ somehow ties into page 
flips with full screen stuff, and with igpu we do priority inheritance 
in those cases. Why it is a bad idea to do the same in the hybrid setup?

Regards,

Tvrtko

> 
>> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> But I'm also ok with just merging this as-is so the situation doesn't
> become too entertaining.
> -Daniel
> 
>>
>>
>>
>>
>>
>>> ---
>>>    drivers/gpu/drm/i915/i915_request.c | 12 +++++++++++-
>>>    1 file changed, 11 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
>>> index 79da5eca60af..4f189982f67e 100644
>>> --- a/drivers/gpu/drm/i915/i915_request.c
>>> +++ b/drivers/gpu/drm/i915/i915_request.c
>>> @@ -1145,6 +1145,12 @@ __emit_semaphore_wait(struct i915_request *to,
>>>    	return 0;
>>>    }
>>> +static bool
>>> +can_use_semaphore_wait(struct i915_request *to, struct i915_request *from)
>>> +{
>>> +	return to->engine->gt->ggtt == from->engine->gt->ggtt;
>>> +}
>>> +
>>>    static int
>>>    emit_semaphore_wait(struct i915_request *to,
>>>    		    struct i915_request *from,
>>> @@ -1153,6 +1159,9 @@ emit_semaphore_wait(struct i915_request *to,
>>>    	const intel_engine_mask_t mask = READ_ONCE(from->engine)->mask;
>>>    	struct i915_sw_fence *wait = &to->submit;
>>> +	if (!can_use_semaphore_wait(to, from))
>>> +		goto await_fence;
>>> +
>>>    	if (!intel_context_use_semaphores(to->context))
>>>    		goto await_fence;
>>> @@ -1256,7 +1265,8 @@ __i915_request_await_execution(struct i915_request *to,
>>>    	 * immediate execution, and so we must wait until it reaches the
>>>    	 * active slot.
>>>    	 */
>>> -	if (intel_engine_has_semaphores(to->engine) &&
>>> +	if (can_use_semaphore_wait(to, from) &&
>>> +	    intel_engine_has_semaphores(to->engine) &&
>>>    	    !i915_request_has_initial_breadcrumb(to)) {
>>>    		err = __emit_semaphore_wait(to, from, from->fence.seqno - 1);
>>>    		if (err < 0)
> 
