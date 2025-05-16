Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C45C0AB9E9F
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 16:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B9F10EAE6;
	Fri, 16 May 2025 14:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="Lc0WVCUe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E1610EAE6
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 14:30:55 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3a0b9e2d640so1884377f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 07:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1747405854; x=1748010654;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=c4wvw18aCRTZtC+Q6NWNiH1YReQVKr/g1/5hAXp/LsI=;
 b=Lc0WVCUeLuYhSkcyr8yXIf59lK6UU9EChLaQfXlQK7eyFXJG7FPU2qm26ntA5gynWH
 mu+cHXwKqCeaQkn6Y+haulZAjNLOQlVAFiUVAifcmgIThsFuAs5ltCWOuUXvcVmAWAct
 WpVbZbZlR8lhsapJW4xAUUDN5h9/NiG8ADWMoBoWV6ahgwOanZ/xQH5pVoZ2KRftsUU9
 8Sv806LJhyRDYPw6Y8xn7NuwVmNXtcGFI+n0Aqy/NalCn7CIOgAKZ6sQA3BGh3RdYW/z
 BP3Ss6kJiJtMeqj1KmqQYlG4zh02YjQQhzQqvYfvp3VheOmpDsl/5hC7sjx5qzFZBWhM
 NSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747405854; x=1748010654;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c4wvw18aCRTZtC+Q6NWNiH1YReQVKr/g1/5hAXp/LsI=;
 b=RNht8t1dzbygQN1sC9FC8opbof3SEO2CJW2KjeB9bGNQKJfQIwPEEHfMVhjuZfZTzD
 IIcc3lh1jfWmK0G2YuwbcdUzY0GCy85ktwTcHj26cujohZKHC/CFDGWRHET+OhskiOZU
 ZnTGgxJuK11TovbJ3ho/fqzOvfbt+Jz5/BDnkf7c9y5puYTidZkY02az182HGxfOvtfV
 MZwmwxf2it5/ERmahsd7ATGalN59ChbJbZMdZN5c9FbmHC7kaZF5db/Q6y8Too4DayiI
 BBgx3Ub8DI1kGlaF27YFaKSSM09IBSXsnr4oD9ckzvipPLy0n+BtkBrVRzYhSGtGwwRg
 EdRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWTqqEZoUq3mt5h19bdNsRM7vBUbe/NN35BSWMUsm59el0YmRDgF1JeUun5UAs7apgr3IWMF9XsnQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXHEMQAyNR6aeBLnu5lA6ev/t+tyTdgPJFZyqi89Yinsi2xIGA
 cO37+ztG5TvP9TV6Flly2XhC/PrBDD/He3PUfZIV5ar9TZXg9w02EqshCsADDerbG8U=
X-Gm-Gg: ASbGncvv/nvtD3DhDQSiv0R4TLa8NzGCpn1KQwefSUm/XmcGbmmaAfl6Ya60CUS65QA
 EbXo7ROYMoy0hJPaVIiybjOPbdWXE4I+k3gKxo9NyyNOhGTgKBN0LkKEN6Aef2zZ3avATwvRCOF
 +LML3q8CowwBtXSjR4xXh9Y/NHgDAzpSxZ8bkWwI2Nj74ADsUDNP61YK2M1QxSEIAuLLoZ/Wnox
 iwfIqVlVFLZxJAa9OlZEhR0CgR0bw+Alp2hwsuydUURQ8+CY2CV9zXQ7AIcJwDm19Z8C0qIeTm8
 Ayx38CFIsM8MNhdgLfBFH8mkbyLVedhnhfD/WGEqIXDpicWjlSfVHPJs2HL7ZJgE4Q==
X-Google-Smtp-Source: AGHT+IGcBtj5Je8eljzvos0HznnEVfHBZc4FKjI3ImFroFRX6a7GkghigHyWX7YGD43THm0JdYBcdQ==
X-Received: by 2002:a05:6000:4020:b0:3a3:64c8:1fa7 with SMTP id
 ffacd0b85a97d-3a364c822admr183351f8f.55.1747405854094; 
 Fri, 16 May 2025 07:30:54 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca889d9sm3032336f8f.77.2025.05.16.07.30.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 07:30:53 -0700 (PDT)
Message-ID: <01cce810-7303-4c92-b138-d8a647f3dcee@ursulin.net>
Date: Fri, 16 May 2025 15:30:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/sched: add drm_sched_prealloc_dependency_slots v3
To: phasta@kernel.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <ckoenig.leichtzumerken@gmail.com>, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, amd-gfx@lists.freedesktop.org
References: <20250515150038.4615-1-christian.koenig@amd.com>
 <20250515150038.4615-2-christian.koenig@amd.com>
 <a5e53b34-c247-4193-b4ab-551693ad089a@ursulin.net>
 <5c93f114a58e84796f239b9e0f4a13e9c223e45b.camel@mailbox.org>
 <6e5ab077-77ff-443b-b345-7d99fcd01a73@ursulin.net>
 <6a361f21-1ba2-4084-b85c-0db30c9b01cc@ursulin.net>
 <fc617b712c5937c02be89f7ba068ce0de1512027.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <fc617b712c5937c02be89f7ba068ce0de1512027.camel@mailbox.org>
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


On 16/05/2025 14:38, Philipp Stanner wrote:
> On Fri, 2025-05-16 at 13:10 +0100, Tvrtko Ursulin wrote:
>>
>> On 16/05/2025 12:53, Tvrtko Ursulin wrote:
>>>
>>> On 16/05/2025 08:28, Philipp Stanner wrote:
>>>> On Thu, 2025-05-15 at 17:17 +0100, Tvrtko Ursulin wrote:
>>>>>
>>>>> On 15/05/2025 16:00, Christian König wrote:
>>>>>> Sometimes drivers need to be able to submit multiple jobs
>>>>>> which
>>>>>> depend on
>>>>>> each other to different schedulers at the same time, but
>>>>>> using
>>>>>> drm_sched_job_add_dependency() can't fail any more after the
>>>>>> first
>>>>>> job is
>>>>>> initialized.
>>>>>>
>>>>>> This function preallocate memory for dependency slots so that
>>>>>> no
>>>>>> ENOMEM
>>>>>> can come later while adding dependencies.
>>>>>>
>>>>>> v2: rework implementation an documentation
>>>>>> v3: rework from scratch, use separate function to add
>>>>>> preallocated
>>>>>> deps
>>>>
>>>> I think we agreed to not put change logs into commit messages
>>>> anymore
>>>> :)
>>>>
>>>> They aren't useful for any reader. Who needs the changelog
>>>> afterwards
>>>> can retreive it through the mail thread link that we add.
>>>>
>>>>>>
>>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/scheduler/sched_main.c | 45
>>>>>> ++++++++++++++++++++++++++
>>>>>>     include/drm/gpu_scheduler.h            |  4 +++
>>>>>>     2 files changed, 49 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> index f7118497e47a..b95e7089aa70 100644
>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> @@ -858,6 +858,51 @@ void drm_sched_job_arm(struct
>>>>>> drm_sched_job
>>>>>> *job)
>>>>>>     }
>>>>>>     EXPORT_SYMBOL(drm_sched_job_arm);
>>>>>> +/**
>>>>>> + * drm_sched_job_prealloc_dependency_slot - avoid ENOMEM on
>>>>>> adding
>>>>>> dependencies
>>>>>> + * @job: scheduler job where dependencies will be added
>>>>>> + * @id: id for the allocated slot
>>>>>> +  *
>>>>>> + * Sometimes drivers need to be able to submit multiple jobs
>>>>>> which
>>>>>> depend on
>>>>>> + * each other to different schedulers at the same time, but
>>>>>> using
>>>>>> + * drm_sched_job_add_dependency() can't fail any more after
>>>>>> the
>>>>>> first job is
>>>>>> + * initialized.
>>>>>> + *
>>>>>> + * This function preallocate memory for a dependency slot so
>>>>>> that
>>>>>> no ENOMEM can
>>>>>> + * come later while adding dependencies. The index of the
>>>>>> preallocated slot is
>>>>>> + * returned in @id.
>>>>>> + *
>>>>>> + * Return:
>>>>>> + * 0 on success, or an error on failing to expand the array.
>>>>>> + */
>>>>>> +int drm_sched_job_prealloc_dependency_slot(struct
>>>>>> drm_sched_job
>>>>>> *job,
>>>>>> +                       u32 *id)
>>>>>> +{
>>>>>> +    return xa_alloc(&job->dependencies, id, NULL,
>>>>>> xa_limit_32b, GFP_KERNEL);
>>>>>> +}
>>>>>> +EXPORT_SYMBOL(drm_sched_job_prealloc_dependency_slot);
>>>>>> +
>>>>>> +/**
>>>>>> + * drm_sched_job_add_prealloc_dep - add dependency to
>>>>>> preallocated
>>>>>> slot
>>>>>> + * @job: scheduler job where dependencies will be added
>>>>>> + * @id: the preallocated slot index
>>>>>> + * @fence: the dependency to add
>>>>>> + *
>>>>>> + * Consumes @fence and adds it to the preallocated slot
>>>>>> dependency.
>>>>>> + */
>>>>>> +void drm_sched_job_add_prealloc_dep(struct drm_sched_job
>>>>>> *job, u32
>>>>>> id,
>>>>>> +                    struct dma_fence *fence)
>>>>>> +{
>>>>>> +    fence = xa_store(&job->dependencies, id, fence,
>>>>>> GFP_ATOMIC);
>>>>>
>>>>> Add assert that the passed id exists (was preallocated) and is
>>>>> NULL?
>>>>
>>>> You
>>>
>>> Hm?
>>>
>>>>>
>>>>> Also, if someone preallocates and does not consume the slot
>>>>> will that
>>>>> confuse the iteration in drm_sched_job_dependency()?
>>>>
>>>> drm_sched_job_add_dependency() you mean.
>>>
>>> I was actually thinking of drm_sched_job_dependency() because that
>>> looked it would skip dependencies upon encountering an unconsumed
>>> preallocated slot, but yes, drm_sched_job_add_dependency() could
>>> explode
>>> even earlier if adding a normal dependency after preallocating a
>>> slot.
>>>
>>>> Yes, it would. All operations simply give you NULL for those
>>>> slots. So
>>>> seems to me you have to check for NULL wherever a preallocated
>>>> slot
>>>> might drop out. That would then be a bug.
>>>>
>>>> It's kind of tricky, all that. It's a pity that Wilcox didn't
>>>> answer
>>>> our questions about the idiomatic way to do it.
>>>>
>>>> Maybe reserving slots with already signaled fences wasn't such a
>>>> bad
>>>> idea after all?
>>>>
>>>> If we go for the NULL approach, it's probably the only sane way
>>>> to then
>>>> check for NULL wherever dependencies are accessed :(
>>>>
>>>> Opinions?
>>>
>>> Well if the xarray API returns the NULL consistently the approach
>>> from
>>> this patch is fine I think.
>>>
>>> We just need to add two more checks to the above mentioned
>>> functions,
>>
>> I need to correct myself, drm_sched_job_dependency() wouldn't be able
>> to
>> just skip NULLs since it relies on NULL for "no more dependencies".
>> We
>> would need to track something like job->max_dependency and terminate
>> on
>> job->last_dependency > job->max_dependency or so.
> 
> Agreed, that would have to be fixed.
> 
> I believe we should reconsider Christian's first idea [1].
> 
> Thinking about it some more:
>   * With the NULL version, suddenly the xarray containing only valid
>     dependencies can sometimes contain NULL entries.
>   * If we could create our own tag, entries could be returned that were
>     neither NULL nor valid fences, also requiring checks 'everywhere'.
>   * Only the "signaled fence as prealloc reservation" approach is fully
>     backwards compatible and will never cause anyone to block after
>     later reworks.
> 
> So maybe it's actually the best idea?
> 
> Sorry for the zigg-zagg. No hard requirements intended from my side,
> I'm willing to go with what you guys think.
> 
> Just saying, at least now I think that the already-signaled fence seems
> the most elegant solution. And since there's a function
> (dma_fence_get_stub()) for that, it seems to be in alignment with
> official dma_fence rules.

Potential problem there was dma_fence_is_signaled() and fence signaling 
annotations. In case some driver is holding a lock over the arm+push 
pair. I wish we had a non-signaling is_signaled helper..

Anyway, I think both options are passable. I even like the NULL entry 
slightly more since it is simpler in a way and I don't mind some extra 
checks completely hidden in scheduler internals.

Regards,

Tvrtko

> 
> 
> Philipp
> 
> 
> [1]https://lore.kernel.org/all/20250318120313.19099-2-christian.koenig@amd.com/
> 
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>> some more unit tests probably to make sure, and that should be fine
>>> for
>>> now.
>>>
>>> On the bikeshedding front I would perhaps suggest:
>>>
>>>    - drm_sched_job_preallocate_dependency()
>>>    - drm_sched_job_replace_dependency()
>>>
>>> Reads a little bit more aligned with the rest of the API and a bit
>>> easier on the eyes, to my eyes at least.
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>
> 

