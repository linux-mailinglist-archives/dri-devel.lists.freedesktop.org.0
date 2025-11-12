Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 338A0C5281C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:38:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA6F10E724;
	Wed, 12 Nov 2025 13:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="luPFmGd9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177AB10E724
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 13:38:21 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4775638d819so4801165e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 05:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1762954699; x=1763559499; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CKVPli+vtTdPK0Wb1LRFV8iDiJCBNe0ca15Qkt46LAw=;
 b=luPFmGd9igeuvFekFCRPod81RkgWyZgtQfDM/9IM6VcjAHOJOl4dFfBDNAr+cU0l5h
 X6+BURxirxTVdzX5MHU83atEm/HWiJ3Qqit4ByKz/BVDC/TB3YllBZYtol7EzSiFNQK3
 mKIuKerD6IRVptJJjxpt/F+U0UEs3chItayuHQHX5Vl/h41ocf6OkyGeu8spNWZBIQxz
 xmulWr2xDE7JfAVw9giPxR5Aip2JVLk6eHjYjnivAPS2NPNywbnlZDKsDX7Cvl7qUduZ
 B1wvIG2vYlPbbjjtqscv3txeRm7bntFy3VX7HnF6RubKN7a2JQP7yfHp33mbglK179E2
 CVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762954699; x=1763559499;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CKVPli+vtTdPK0Wb1LRFV8iDiJCBNe0ca15Qkt46LAw=;
 b=hc8QFgPW6Hyo/3EGRr8REvAU2JkYc8UeO2Ml6fDPszjJEk2BW+pzrttyvdWV+bO1Qr
 B1VTcfuT9ULXHuxOsI6z2eaGjrwfpUtwbHT+5zGnVzRMPyECCJGlOAouRP/JWFjo5+JE
 jzYcpWbIZt5rALtFg3tJRaHl76dTOjNZKkeym2vGiMiw0YD9X6ciHicMfxpelcv7wJ1Z
 5sXwdSsPnzovNfzjSqbWO1sNI8rehsWvMfHBkR2rjFJT8oDr77mP/pRgv5SpuWXwbHWE
 GkfTLxehe8I7ZhN8Q6CLno2MmUw1jwX+62qIrmR+/YpInniWcLVjLeTbes/A7Q4gCSPE
 nJlw==
X-Gm-Message-State: AOJu0YxBINWAeaQvGBVM1nUNN9jFZXmRDhn/IKUK1xCU5TOrqP4T/qPm
 LlJ/fS66n0Qp8EXK82B3LYiLkHF5FSxHHtB8XZAQhS3dV3D9Awcyenv0RbRnCc9IiaY=
X-Gm-Gg: ASbGncvb3ctieDn5Vl9FKrNVqfQTATP8QVbPH+aoVVrm0OXPy6I+7V/2OpULnsg/KoW
 s3S32CDQZ7zM0Cqa+tsP2Nu4qQoOgf53GkIJwK9p7T/WacImXyC7/hmdvqGUr6csctPAv4mTwgf
 /MeKqhIQ/ZrbFbGdG6iLgoHqa/oMaHw7FStUlrD49ncmZSPFPD0wiJyayqKNIQ2raMF1+PtYvSt
 r1ZykGJN2gKTiBQIdCuEBpjIcxWV0/dXF3VIuxns3ljhL6nHkd5T7vYKm/PVTzpNKmxhf63USkJ
 D1+yeh69x8WANfWFqv09FlbT3SNzLnBCb2s65WJ4bN7N1NXzVCx/wI13yHb44F/N2XfeSCq+PZ/
 IRwfGp+U+3PbHKAg6IXhLUx2gX5chZNUVWOwNx0cpVB8oxfExgOblOANhujJQireM5xGCPIAlHs
 VvkYyMS+n924p58Wpt6tLRtQ==
X-Google-Smtp-Source: AGHT+IHgmc5huq89+1MnpQMirmZYWR9B+FP7GHxP0enOBtoio6kTy/7iypYs8CCl2+rfT2RT9vY5dg==
X-Received: by 2002:a05:600c:1d1b:b0:477:63db:c0fe with SMTP id
 5b1f17b1804b1-477871c3589mr32958135e9.32.1762954699196; 
 Wed, 12 Nov 2025 05:38:19 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e95327sm35065075e9.12.2025.11.12.05.38.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 05:38:18 -0800 (PST)
Message-ID: <b7f66752-a80d-429e-9f00-c631b0490883@ursulin.net>
Date: Wed, 12 Nov 2025 13:38:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Document racy behavior of
 drm_sched_entity_push_job()
To: phasta@kernel.org, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251112073138.93355-2-phasta@kernel.org>
 <e9c02871-fa80-46c7-8b96-bad3a6a2c5b9@ursulin.net>
 <38bce31a7cdea31738c161bb06af272d5f68af1a.camel@mailbox.org>
 <babc3eae-42c2-4927-95db-7c529a282d6d@ursulin.net>
 <cd7f6684f1d8bfca606c4a6ba75c130d07e3a7fe.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <cd7f6684f1d8bfca606c4a6ba75c130d07e3a7fe.camel@mailbox.org>
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


On 12/11/2025 13:31, Philipp Stanner wrote:
> On Wed, 2025-11-12 at 13:13 +0000, Tvrtko Ursulin wrote:
>>
>> On 12/11/2025 12:15, Philipp Stanner wrote:
>>> On Wed, 2025-11-12 at 09:42 +0000, Tvrtko Ursulin wrote:
>>>>
>>>> On 12/11/2025 07:31, Philipp Stanner wrote:
>>>>> drm_sched_entity_push_job() uses the unlocked spsc_queue. It takes a
>>>>> reference to that queue's tip at the start, and some time later removes
>>>>> that entry from that list, without locking or protection against
>>>>> preemption.
>>>>
>>>> I couldn't figure out what you refer to by tip reference at the start,
>>>> and later removes it. Are you talking about the top level view from
>>>> drm_sched_entity_push_job() or where exactly?
>>>>> This is by design, since the spsc_queue demands single producer and
>>>>> single consumer. It was, however, never documented.
>>>>>
>>>>> Document that you must not call drm_sched_entity_push_job() in parallel
>>>>> for the same entity.
>>>>>
>>>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>>>> ---
>>>>>     drivers/gpu/drm/scheduler/sched_entity.c | 3 +++
>>>>>     1 file changed, 3 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> index 5a4697f636f2..b31e8d14aa20 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> @@ -562,6 +562,9 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>>>>>      * drm_sched_entity_push_job - Submit a job to the entity's job queue
>>>>>      * @sched_job: job to submit
>>>>>      *
>>>>> + * It is illegal to call this function in parallel, at least for jobs belonging
>>>>> + * to the same entity. Doing so leads to undefined behavior.
>>>>
>>>> One thing that is documented in the very next paragraph is that the
>>>> design implies a lock held between arm and push. At least to ensure
>>>> seqno order matches the queue order.
>>>>
>>>> I did not get what other breakage you found, but I also previously did
>>>> find something other than that. Hm.. if I could only remember what it
>>>> was. Probably mine was something involving drm_sched_entity_select_rq(),
>>>> drm_sched_entity_modify_sched() and (theoretical) multi-threaded
>>>> userspace submit on the same entity. Luckily it seems no one does that.
>>>>
>>>> The issue you found is separate and not theoretically fixed by this
>>>> hypothetical common lock held over arm and push?
>>>
>>> Well, if 2 CPUs should ever run in parallel in
>>> drm_sched_entity_push_job() the spsc_queue will just explode. Most
>>> notably, one CPU could get the job at the tip (the oldest job), then be
>>> preempted, and then another CPU takes the same job and pops it.
>>
>> Ah, you are talking about the dequeue/pop side. First paragraph of the
>> commit message can be clarified in that case.
>>
>> Pop is serialised by the worker so I don't think two simultaneous
>> dequeues on the same scheduler are possible. How did you trigger it?
>>> The API contract should be that the user doesn't have to know whether
>>> there's a linked list or the magic spsc_queue.Luckily we moved the peek/pop helpers to sched_internal.h.
>>
>> Btw I thought you gave up on the scheduler and are working on the simple
>> rust queue for firmware schedulers so how come you are finding subtle
>> bugs in this code?
> 
> I'm a maintainer still, for a variety of reasons. That we work on
> something for FW with a clean locking design doesn't mean we don't care
> about existing infrastructure anymore. And I firmly believe in
> documentation. People should know the rules from the API documentation,
> not from looking into the implementation.
> 
> It's kind of a crucial design info that you must only push into
> entities sequentially, no?
> 
> This doesn't fix a bug, obviously, since it's just a line of docu.
> Regardless, pushing into the spsc queue in parallel would explode.
> Emphasizing that costs as nothing.

It wasn't an argument. I was just curious if this is something you 
managed to hit and how.

Regards,

Tvrtko

