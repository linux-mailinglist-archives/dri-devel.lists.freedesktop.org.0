Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7736AC52676
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:13:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F8F10E025;
	Wed, 12 Nov 2025 13:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="Wfe60J3b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8E110E025
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 13:13:31 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b3e9d633b78so140539566b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 05:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1762953210; x=1763558010; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4sscEB4nn6s951AWLMLIUM6KOhyDA4FhYMtvx1jB70o=;
 b=Wfe60J3bTADhMXYMJvNhAjcb4VvHm28i6ZjtVq0fLdGdkr+GVBETu4VJy409K/Hmmo
 4N+HI2qhfI1dRKlcNlCEBaorpWP0gZ0+AVMjiycyVycygpXwt40smsCiiyEz3gr0GSP+
 iFvqEdBc1YKG92UdQjYLnB8EN8DMd3lJJhquxE/Aq6A4DjxSrc9F0ckc6+hK1QdlpEgF
 ilzk+ZmiTpkE3JXgcBOJRa5Iov5vTfVAvylBRBERKRw76pyI7c6YuRq4R9bSsUH1uHZE
 Q9JmAVubGdzGCLnF8nIT2LFgwkZUpQE1m50CO1UVh43wCx5yCeMcqOA+ix7YrxvIfJHC
 L9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762953210; x=1763558010;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4sscEB4nn6s951AWLMLIUM6KOhyDA4FhYMtvx1jB70o=;
 b=JTyspamImh8CNNlQa7wfOUypuoqQVa3Z5sHmBEcHsuqWfZvqwzKQOb887s5KPTwlWA
 jznQ3FwbyK9kyTXrwENgPUAkVpESCJbEWA3ULlrTwwL37wpNH5RNrZBYvmXdQ3fkJtxg
 6Z/p8EBPK5hp/7z3efhk5uAwtgg1r4UtypcCrhReAH5DZiHodys1kBTkatZI8MGOezzx
 EJDwmLqbyYpaU/VvjTdlLOD8YMbLLL0Q2myxRXvoQqMQEXKqmdhZDxK5147tNOSusV/T
 /fcZXAlPt+KQyChOVPxTazdvRc+aznNPz+7GVtUrjz1NysUREgT/7n3UNNtVnNHUolpg
 lCcA==
X-Gm-Message-State: AOJu0YxU2H4Kx1ys+MyFJ166nnClbkjcBE6jIu+aN2mexlQBVZfgOGNb
 TAgVWHAxHmpTqRSgPd7kUV3QFBiQ2ghX4Z1kllkZMgFT47uUZbCdHDw5vdDV+9v+MxMw7OOiKAh
 v5S/S
X-Gm-Gg: ASbGncv4a6MwcGyhGoGL40y561yrSKMgA772COhElKEasWyAr6XZjgeO64ARMJDxEgj
 znegY7r+AuZAeIHjESKc1amUhRb4jDkeHbrOn6djlrSeY5GSO4j6kUWhdAwo8M9L3ZfCpvVM6TM
 gP8qDj195WIQ6LYq+h8v7m4pTdn4ujX/wHMssqY1u92wRLoo2RmQvk0rPwLNfq6nRWYoIs/Mp8K
 8dsK9HZq9baGJWz8jJMaATTKMLuPd3BH6g/bSsu5aR5jHWSHBbyLtYBVDFA9b1ELiMQ+pTM6hoG
 ZD9/H5aPrh4z9XFYfyx3fu77X8OB2iz9E87et+wlXZlfKZH+858Ab9mZ+69JfexW7q8e+PcOY/z
 v29BAPHgO8LDhIBPsNIa4Ps+BEnvpxnBm+uMkjtgnhyEUMzXmBbQ1Ab6qXfEMI+6tr4x/R0I9yK
 Wm9peedyNEsZTnnUYWSXXQCg==
X-Google-Smtp-Source: AGHT+IEYmb0xpxTgER0fYsWuK5Jn1jwPhMsmXBG2RWR+GhDMuJu/wWFLRCIrfC34cKO4pe7gQRrGUg==
X-Received: by 2002:a17:906:fc02:b0:b73:4054:dc76 with SMTP id
 a640c23a62f3a-b734054ddbemr19909966b.26.1762953209514; 
 Wed, 12 Nov 2025 05:13:29 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf31286esm1594370566b.21.2025.11.12.05.13.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 05:13:29 -0800 (PST)
Message-ID: <babc3eae-42c2-4927-95db-7c529a282d6d@ursulin.net>
Date: Wed, 12 Nov 2025 13:13:28 +0000
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
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <38bce31a7cdea31738c161bb06af272d5f68af1a.camel@mailbox.org>
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


On 12/11/2025 12:15, Philipp Stanner wrote:
> On Wed, 2025-11-12 at 09:42 +0000, Tvrtko Ursulin wrote:
>>
>> On 12/11/2025 07:31, Philipp Stanner wrote:
>>> drm_sched_entity_push_job() uses the unlocked spsc_queue. It takes a
>>> reference to that queue's tip at the start, and some time later removes
>>> that entry from that list, without locking or protection against
>>> preemption.
>>
>> I couldn't figure out what you refer to by tip reference at the start,
>> and later removes it. Are you talking about the top level view from
>> drm_sched_entity_push_job() or where exactly?
>>> This is by design, since the spsc_queue demands single producer and
>>> single consumer. It was, however, never documented.
>>>
>>> Document that you must not call drm_sched_entity_push_job() in parallel
>>> for the same entity.
>>>
>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_entity.c | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index 5a4697f636f2..b31e8d14aa20 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -562,6 +562,9 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>>>     * drm_sched_entity_push_job - Submit a job to the entity's job queue
>>>     * @sched_job: job to submit
>>>     *
>>> + * It is illegal to call this function in parallel, at least for jobs belonging
>>> + * to the same entity. Doing so leads to undefined behavior.
>>
>> One thing that is documented in the very next paragraph is that the
>> design implies a lock held between arm and push. At least to ensure
>> seqno order matches the queue order.
>>
>> I did not get what other breakage you found, but I also previously did
>> find something other than that. Hm.. if I could only remember what it
>> was. Probably mine was something involving drm_sched_entity_select_rq(),
>> drm_sched_entity_modify_sched() and (theoretical) multi-threaded
>> userspace submit on the same entity. Luckily it seems no one does that.
>>
>> The issue you found is separate and not theoretically fixed by this
>> hypothetical common lock held over arm and push?
> 
> Well, if 2 CPUs should ever run in parallel in
> drm_sched_entity_push_job() the spsc_queue will just explode. Most
> notably, one CPU could get the job at the tip (the oldest job), then be
> preempted, and then another CPU takes the same job and pops it.

Ah, you are talking about the dequeue/pop side. First paragraph of the 
commit message can be clarified in that case.

Pop is serialised by the worker so I don't think two simultaneous 
dequeues on the same scheduler are possible. How did you trigger it?
> The API contract should be that the user doesn't have to know whether
> there's a linked list or the magic spsc_queue.Luckily we moved the peek/pop helpers to sched_internal.h.

Btw I thought you gave up on the scheduler and are working on the simple 
rust queue for firmware schedulers so how come you are finding subtle 
bugs in this code?

> The entire entity submission pattern is basically designed around
> "single producer [per entity]", and that's not very well documented.
> 
> I don't think the common lock comment fully addresses that, because
> it's merely about the sequence numbers. I think the common lock should
> likely prevent any issues, but I feel more comfortable if the user gets
> informed explicitly about the potential racyness of this function.
> 
> Maybe we can combine the two paragraphs.
Yeah, in some way.

Tvrtko

