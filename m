Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A494BC24778
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:31:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C5CD10EAFE;
	Fri, 31 Oct 2025 10:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="zNnC6PZJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CFF410EAFB
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:31:15 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4711810948aso15475835e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 03:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1761906674; x=1762511474;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VhcnVvzJq68ilvvMTuG3wnPWe1CR75mTZqdNC0fv3Ds=;
 b=zNnC6PZJdR5O6sWDN5kur+Bqjtlx3ZiwwfJDr/I+xZNoIUa9/qJZ4bhtH/peW2ugIJ
 pY1l+7h8NG4f/x9m7xjMtO+GSeVwcr1zZpNadVL6QtEyF2HFEk5Su3dDtGbi1Q5BzvXo
 lhNkDDn82YK81QmXBZF3yiQVBglhZqmeF/1wrJJ4IEOflQVcFfNSkWqB0oScBkp8qVYD
 YDj4JHlptL4ImtZDg2J8Ne1LjW1g6PG+jfTp3XTHTwdOi4cP1zj7H+/iBuOGAgzJgEaq
 FckUXQI5e7wWYVJmIU4uJk2JDQppefKHU0RZj0VV8gbDlnzqEtRtqByTCPIvJHcV8xuv
 qHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761906674; x=1762511474;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VhcnVvzJq68ilvvMTuG3wnPWe1CR75mTZqdNC0fv3Ds=;
 b=DKNzyv3RzpRSU+FKZdQJIDYeRIWJY952hNX8UJnXg1MtPOQsKAQwXzr28KzD9u4sEd
 pDoHGQv2803sCr/BbO0i3Im7qz8mx+7ni3llJIfIhiA6dPu3443V4y1NvvzrfFM11yiL
 EbMCjcnESgrL0yc1z+7mj/QNaMygkAafV32ePAxofS04GbZ35FYSstTHg1U7KMd615oV
 G/+mVNL3KCnL7CCPPcocdWjZnldAXy2zMuAeCwCyxsMc2/UMljQQOMvESuq7PE2GdoJl
 bJsfDh3MQmHQinqjIoG97AoESEYJvUWFpaQ5Kb1mRXoLzA6S4suRHLGNHnTY+pCjP+EV
 MPJg==
X-Gm-Message-State: AOJu0YzyJUAZQIHrspW4Jc2BCukrfWWF0zCo7k8ywtEcPpKiQOTyjaIK
 gy1Rp6lbAY/P4EG9FlYLGFbHgJ+OU29o5zWoX9echNMYk3fvGwOQPc69PJLxubRD0hw=
X-Gm-Gg: ASbGncsp+Ge2MDb+eja981pBak1q0CHiB+zEKsZktOVs4L3W7XmInfDUjaS4uCjj4tH
 /viDIE6zcCyhybmNjwZ3aKYy2jVGcgnN2iLAeb6i5f8ZbGRWmYocnU5ykWOGuGVgTrT0Dj1tTFZ
 2kaZNJLkAwW1Xh5VW6e/OAdRHOO6DTlAcTgtX9DkGLPmI+vFpZOEzy5oYWATMNR02sJGNMQWWkP
 tZhDnZOnu9lfrgrpxf9wNPHoQFUevtDYxL0WM9ni5g7zBMbrhQRqBQRZWywdH6+IBMigrwnvHv0
 C0x5WcVnyacNVKld6fUQYnYQGS8hCLK4cMajXNbettNQ5Br/iMTaBxNMOUkESvd2qVt8I+DjblO
 dIs8WYq+gDoNOcvDOsP0MSK9s+l8OpxDNLHN5xvDOBQBHjCx7jpTxkOsUCzs37xym4Enhy1s36D
 T9QlOouraAGa8lFuyd5AjcrMntmUjbnP3P1vsI3w==
X-Google-Smtp-Source: AGHT+IEIbGGCqAyV8kfxEvh7yWfs4ZITibZGz+4agh6fbSFoyf4TYw9NJs5xeOEJ6o1aHIlHuiIEVQ==
X-Received: by 2002:a05:600c:4e53:b0:46e:37fc:def0 with SMTP id
 5b1f17b1804b1-477307c2112mr25573195e9.9.1761906673778; 
 Fri, 31 Oct 2025 03:31:13 -0700 (PDT)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47728a97a1dsm80777585e9.12.2025.10.31.03.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 03:31:13 -0700 (PDT)
Message-ID: <3a707692-01eb-44cd-93df-cf93f9bad90d@ursulin.net>
Date: Fri, 31 Oct 2025 10:31:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/15] dma-buf: detach fence ops on signal
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251013143502.1655-1-christian.koenig@amd.com>
 <20251013143502.1655-5-christian.koenig@amd.com>
 <d5ea9ed0-d599-4b9f-92c8-a2e711371017@ursulin.net>
 <23bafbad-fcc9-4baa-9bd5-d4ea37c397f3@ursulin.net>
 <b723d1b8-1634-4c2a-a752-90ce75566890@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <b723d1b8-1634-4c2a-a752-90ce75566890@amd.com>
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


On 30/10/2025 13:52, Christian König wrote:
> Hi Tvrtko,
> 
> On 10/16/25 17:57, Tvrtko Ursulin wrote:
>> On 16/10/2025 09:56, Tvrtko Ursulin wrote:
>>>
>>> On 13/10/2025 14:48, Christian König wrote:
>>>> When neither a release nor a wait operation is specified it is possible
>>>> to let the dma_fence live on independent of the module who issued it.
>>>>
>>>> This makes it possible to unload drivers and only wait for all their
>>>> fences to signal.
>>>
>>> Have you looked at whether the requirement to not have the release and wait callbacks will exclude some drivers from being able to benefit from this?
>>
>> I had a browse and this seems to be the situation:
> 
> Oh, thanks a lot for doing that!
> 
>>
>> Custom .wait:
>>   - radeon, qxl, nouveau, i915
>>
>> Those would therefore still be vulnerable to the unbind->unload sequence. Actually not sure about qxl, but other three are PCI so in theory at least. I915 at least supports unbind and unload.
> 
> radeon, yeah I know that is because of the reset handling there. Not going to change and as maintainer I honestly don't care.
> 
> qxl, pretty outdated as well and probably not worth fixing it.
> 
> nouveau, no idea why that is there in the first place. Philip?
> 
> i915, that is really surprising. What is the reason for that?

I915 has some optimisations on the wait path like a short busy spin 
before going to sleep (under limited conditions) and a way to kick the 
hardware to improve the latencies caused by irq and softirq processing.

But another one, and probably the most important one, is "wait boosting" 
ie. raising GPU clocks if userspace is waiting on a specific GPU job. 
This was a significant win for some workloads in the past.

I tried to move this to generic code long time ago but AFAIR dma-fence 
64B size was a concern. Perhaps now that we are thinking of breaking 
that size barrier we could revisit. Let me try to find this work..

Right, it was this: https://patchwork.freedesktop.org/series/113846/

Executive summary would be: Allowing dma-fence owning drivers to see 
when userspace is waiting on a specific fence.

Longer story was an OpenCL application (IIRC a video conference 
background blurring thingy) and a tale of two OpenCL stacks.

The native Intel OpenCL library uses the i915 ioctls. So when it would 
wait on a kernel to complete it would get the waitboost logic courtesy 
of using the i915 wait ioctl.

But then the same application running on the clvk stack would run much, 
much slower, because the waits in that case are going via the DRM 
syncobj route and i915 could not know to waitboost.

And the duration and time distribution of these jobs was such that 
hardware/firmware would not be ramping up the GPU clocks fast enough 
without this external "someone is waiting, hurry up" signal.

It may be worth to revisit this story if we are growing the dma-fence 
struct anyway. With my changes drivers could then choose whether to do 
anything with this info or not. Because it is essentially only allowing 
drivers to see if someone is waiting.

Or an alternative option would be to call a new fence ops vfunc from the 
generic dma fence wait before going to sleep (with the number of 
waiters), and after. But I would need to think more about this, to see 
if it could potentially allow at least i915 to drop the custom wait 
callback.
>> Custom .release:
>>   - vgem, nouveau, lima, pvr, i915, usb-gadget, industrialio, etnaviv, xe
>>
>> Out of those there do not actually need a custom release and could probably be weaned off it:
>>   - usb-gadget, industrialio, etnaviv, xe
>>
>> (Xe would lose a debug assert and some would have their kfrees replaced with kfree_rcu. Plus build time asserts added the struct dma-fence remains first in the respective driver structs. It sounds feasible.)
> 
> Oh, crap! Using kfree_rcu for dma_fences is an absolutely must have!
> 
> Where have you seen that? This is obviously a bug in the drivers doing that.

Industrialio and usb-gadget use a plain kfree. But both looks easily 
fixable by just making sure dma-fence is first in the inherited object 
and then the custom release can be dropped.

Etnaviv and xe aren't broken, they use some variant of RCU, but could 
probably be weaned of the custom release easily. Especially etnaviv.

>> That would leave us with .release in:
>>   - vgem, nouveau, lima, pvr, i915
>>
>> Combined list of custom .wait + .release:
>>   - radeon, qxl, nouveau, i915, lima, pvr, vgem
>>
>>  From those the ones which support unbind and module unload would remain potentially vulnerable to use after free.
>>
>> It doesn't sound great to only solve it partially but maybe it is a reasonable next step. Where could we go from there to solve it for everyone?
> Well I only see the way of getting rid of the legacy stuff (like ->wait callbacks) for everybody who cares about their module unload.
> 
> But I'm pretty sure that for things like radeon and qxl we don't care.

Yeah, I agree the proposal moves into making things better. I would 
incorporate some of the above easily fixable drivers into the series, 
and the ones with known unresolved issues just list them in the cover 
letter.

Regards,

Tvrtko

>>>> ---
>>>>    drivers/dma-buf/dma-fence.c | 16 ++++++++++++----
>>>>    include/linux/dma-fence.h   |  4 ++--
>>>>    2 files changed, 14 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>>> index 982f2b2a62c0..39f73edf3a33 100644
>>>> --- a/drivers/dma-buf/dma-fence.c
>>>> +++ b/drivers/dma-buf/dma-fence.c
>>>> @@ -374,6 +374,14 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>>>                          &fence->flags)))
>>>>            return -EINVAL;
>>>> +    /*
>>>> +     * When neither a release nor a wait operation is specified set the ops
>>>> +     * pointer to NULL to allow the fence structure to become independent
>>>> +     * who originally issued it.
>>>> +     */
>>>> +    if (!fence->ops->release && !fence->ops->wait)
>>>> +        RCU_INIT_POINTER(fence->ops, NULL);
>>>> +
>>>>        /* Stash the cb_list before replacing it with the timestamp */
>>>>        list_replace(&fence->cb_list, &cb_list);
>>>> @@ -513,7 +521,7 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
>>>>        rcu_read_lock();
>>>>        ops = rcu_dereference(fence->ops);
>>>>        trace_dma_fence_wait_start(fence);
>>>> -    if (ops->wait) {
>>>> +    if (ops && ops->wait) {
>>>>            /*
>>>>             * Implementing the wait ops is deprecated and not supported for
>>>>             * issuer independent fences, so it is ok to use the ops outside
>>>> @@ -578,7 +586,7 @@ void dma_fence_release(struct kref *kref)
>>>>        }
>>>>        ops = rcu_dereference(fence->ops);
>>>> -    if (ops->release)
>>>> +    if (ops && ops->release)
>>>>            ops->release(fence);
>>>>        else
>>>>            dma_fence_free(fence);
>>>> @@ -614,7 +622,7 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>>>>        rcu_read_lock();
>>>>        ops = rcu_dereference(fence->ops);
>>>> -    if (!was_set && ops->enable_signaling) {
>>>> +    if (!was_set && ops && ops->enable_signaling) {
>>>>            trace_dma_fence_enable_signal(fence);
>>>>            if (!ops->enable_signaling(fence)) {
>>>> @@ -1000,7 +1008,7 @@ void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>>>>        rcu_read_lock();
>>>>        ops = rcu_dereference(fence->ops);
>>>> -    if (ops->set_deadline && !dma_fence_is_signaled(fence))
>>>> +    if (ops && ops->set_deadline && !dma_fence_is_signaled(fence))
>>>>            ops->set_deadline(fence, deadline);
>>>>        rcu_read_unlock();
>>>>    }
>>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>>> index 38421a0c7c5b..e1ba1d53de88 100644
>>>> --- a/include/linux/dma-fence.h
>>>> +++ b/include/linux/dma-fence.h
>>>> @@ -425,7 +425,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>>>>        rcu_read_lock();
>>>>        ops = rcu_dereference(fence->ops);
>>>> -    if (ops->signaled && ops->signaled(fence)) {
>>>> +    if (ops && ops->signaled && ops->signaled(fence)) {
>>>>            rcu_read_unlock();
>>>>            dma_fence_signal_locked(fence);
>>>>            return true;
>>>> @@ -461,7 +461,7 @@ dma_fence_is_signaled(struct dma_fence *fence)
>>>>        rcu_read_lock();
>>>>        ops = rcu_dereference(fence->ops);
>>>> -    if (ops->signaled && ops->signaled(fence)) {
>>>> +    if (ops && ops->signaled && ops->signaled(fence)) {
>>>>            rcu_read_unlock();
>>>>            dma_fence_signal(fence);
>>>>            return true;
>>>
>>
> 

