Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D685C51D222
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 09:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA15510FAA4;
	Fri,  6 May 2022 07:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8986D10FAA4;
 Fri,  6 May 2022 07:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651821532; x=1683357532;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=pOF+ivpPZbAuT3jgGRWiLxwnhzziOYzu373nNDCZQho=;
 b=YEMSA+GOCbcH7LSOQjTNgI+qFKKwJf+29QlZqFu2auxHLTkET6WN2iZs
 lvTiPHXfWYt/MjeqIHTlVQ7zA/W0KBuLEHKZ30iN/v109O8ckGANulYg4
 7oLNcXIr8zdysBJNqT7umFb7fOLqUhIW4UjnHE0SMLyonMuSLhuN1XZXA
 jqApnJNjzLi81INMiTOheLDnfMEeJYpYBCvAkfUtevifR4YJiLGz6AjbH
 jY9FVr+268m/IejrAzX+V8EpreyNgp9UctP3iPRVhP2U855e0xb3C94vy
 fG6mWSEFXF2oGsDbKD3RJkVPhA14fMvnLn+Zqk8Bx8ttBZgs9TuuuTx7u A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268274777"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="268274777"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 00:18:52 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="735450887"
Received: from tkinch-mobl.ger.corp.intel.com (HELO [10.213.192.122])
 ([10.213.192.122])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 00:18:50 -0700
Message-ID: <1d15f38e-c3d8-a521-4a15-50341dae5000@linux.intel.com>
Date: Fri, 6 May 2022 08:18:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc/slpc: Use non-blocking H2G for
 waitboost
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220505054010.21879-1-vinay.belgaumkar@intel.com>
 <de063b19-e5f6-342b-d816-c112c446a68f@linux.intel.com>
 <8c8dea74-aa2b-44c1-e1d7-1f613c05bf32@intel.com>
 <032467b7-8794-882a-e45f-6e9d85a716df@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <032467b7-8794-882a-e45f-6e9d85a716df@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 05/05/2022 19:36, John Harrison wrote:
> On 5/5/2022 10:21, Belgaumkar, Vinay wrote:
>> On 5/5/2022 5:13 AM, Tvrtko Ursulin wrote:
>>> On 05/05/2022 06:40, Vinay Belgaumkar wrote:
>>>> SLPC min/max frequency updates require H2G calls. We are seeing
>>>> timeouts when GuC channel is backed up and it is unable to respond
>>>> in a timely fashion causing warnings and affecting CI.
>>>
>>> Is it the "Unable to force min freq" error? Do you have a link to the 
>>> GitLab issue to add to commit message?
>> We don't have a specific error for this one, but have seen similar 
>> issues with other H2G which are blocking.
>>>
>>>> This is seen when waitboosting happens during a stress test.
>>>> this patch updates the waitboost path to use a non-blocking
>>>> H2G call instead, which returns as soon as the message is
>>>> successfully transmitted.
>>>
>>> AFAIU with this approach, when CT channel is congested, you instead 
>>> achieve silent dropping of the waitboost request, right?
>> We are hoping it makes it, but just not waiting for it to complete.
> We are not 'hoping it makes it'. We know for a fact that it will make 
> it. We just don't know when. The issue is not about whether the 
> waitboost request itself gets dropped/lost it is about the ack that 
> comes back. The GuC will process the message and it will send an ack. 
> It's just a question of whether the i915 driver has given up waiting for 
> it yet. And if it has, then you get the initial 'timed out waiting for 
> ack' followed by a later 'got unexpected ack' message.
> 
> Whereas, if we make the call asynchronous, there is no ack. i915 doesn't 
> bother waiting and it won't get surprised later.
> 
> Also, note that this is only an issue when GuC itself is backed up. 
> Normally that requires the creation/destruction of large numbers of 
> contexts in rapid succession (context management is about the slowest 
> thing we do with GuC). Some of the IGTs and selftests do that with 
> thousands of contexts all at once. Those are generally where we see this 
> kind of problem. It would be highly unlikely (but not impossible) to hit 
> it in real world usage.

Goto ->

> The general design philosophy of H2G messages is that asynchronous mode 
> should be used for everything if at all possible. It is fire and forget 
> and will all get processed in the order sent (same as batch buffer 
> execution, really). Synchronous messages should only be used when an 
> ack/status is absolutely required. E.g. start of day initialisation or 
> things like TLB invalidation where we need to know that a cache has been 
> cleared/flushed before updating memory from the CPU.
> 
> John.
> 
> 
>>>
>>> It sounds like a potentially important feedback from the field to 
>>> lose so easily. How about you added drm_notice to the worker when it 
>>> fails?
>>>
>>> Or simply a "one line patch" to replace i915_probe_error (!?) with 
>>> drm_notice and keep the blocking behavior. (I have no idea what is 
>>> the typical time to drain the CT buffer, and so to decide whether 
>>> waiting or dropping makes more sense for effectiveness of waitboosting.)
>>>
>>> Or since the congestion /should not/ happen in production, then the 
>>> argument is why complicate with more code, in which case going with 
>>> one line patch is an easy way forward?

Here. Where I did hint I understood the "should not happen in production 
angle".

So statement is GuC is congested in processing requests, but the h2g 
buffer is not congested so no chance intel_guc_send_nb() will fail with 
no space in that buffer? Sounds a bit un-intuitive.

Anyway, it sounds okay to me to use the non-blocking, but I would like 
to see some logging if the unexpected does happen. Hence I was 
suggesting the option of adding drm_notice logging if the send fails 
from the worker. (Because I think other callers would already propagate 
the error, like sysfs.)

   err = slpc_force_min_freq(slpc, slpc->boost_freq);
   if (!err)
        slpc->num_boosts++;
   else
        drm_notice(... "Failed to send waitboost request (%d)", err);

Something like that.

Regards,

Tvrtko


>> Even if we soften the blow here, the actual timeout error occurs in 
>> the intel_guc_ct.c code, so we cannot hide that error anyways. Making 
>> this call non-blocking will achieve both things.
>>
>> Thanks,
>>
>> Vinay.
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 38 
>>>> ++++++++++++++++-----
>>>>   1 file changed, 30 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c 
>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>> index 1db833da42df..c852f73cf521 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>>> @@ -98,6 +98,30 @@ static u32 slpc_get_state(struct intel_guc_slpc 
>>>> *slpc)
>>>>       return data->header.global_state;
>>>>   }
>>>>   +static int guc_action_slpc_set_param_nb(struct intel_guc *guc, u8 
>>>> id, u32 value)
>>>> +{
>>>> +    u32 request[] = {
>>>> +        GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
>>>> +        SLPC_EVENT(SLPC_EVENT_PARAMETER_SET, 2),
>>>> +        id,
>>>> +        value,
>>>> +    };
>>>> +    int ret;
>>>> +
>>>> +    ret = intel_guc_send_nb(guc, request, ARRAY_SIZE(request), 0);
>>>> +
>>>> +    return ret > 0 ? -EPROTO : ret;
>>>> +}
>>>> +
>>>> +static int slpc_set_param_nb(struct intel_guc_slpc *slpc, u8 id, 
>>>> u32 value)
>>>> +{
>>>> +    struct intel_guc *guc = slpc_to_guc(slpc);
>>>> +
>>>> +    GEM_BUG_ON(id >= SLPC_MAX_PARAM);
>>>> +
>>>> +    return guc_action_slpc_set_param_nb(guc, id, value);
>>>> +}
>>>> +
>>>>   static int guc_action_slpc_set_param(struct intel_guc *guc, u8 id, 
>>>> u32 value)
>>>>   {
>>>>       u32 request[] = {
>>>> @@ -208,12 +232,10 @@ static int slpc_force_min_freq(struct 
>>>> intel_guc_slpc *slpc, u32 freq)
>>>>        */
>>>>         with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>>>> -        ret = slpc_set_param(slpc,
>>>> - SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>>>> -                     freq);
>>>> -        if (ret)
>>>> -            i915_probe_error(i915, "Unable to force min freq to %u: 
>>>> %d",
>>>> -                     freq, ret);
>>>> +        /* Non-blocking request will avoid stalls */
>>>> +        ret = slpc_set_param_nb(slpc,
>>>> + SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>>>> +                    freq);
>>>>       }
>>>>         return ret;
>>>> @@ -231,8 +253,8 @@ static void slpc_boost_work(struct work_struct 
>>>> *work)
>>>>        */
>>>>       mutex_lock(&slpc->lock);
>>>>       if (atomic_read(&slpc->num_waiters)) {
>>>> -        slpc_force_min_freq(slpc, slpc->boost_freq);
>>>> -        slpc->num_boosts++;
>>>> +        if (!slpc_force_min_freq(slpc, slpc->boost_freq))
>>>> +            slpc->num_boosts++;
>>>>       }
>>>>       mutex_unlock(&slpc->lock);
>>>>   }
> 
