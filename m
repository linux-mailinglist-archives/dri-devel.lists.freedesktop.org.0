Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C29ABB7E0
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 10:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6669F10E2F5;
	Mon, 19 May 2025 08:51:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="ge9Cttgo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC57310E20C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 08:51:33 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3a3683d8314so1404682f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 01:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1747644692; x=1748249492;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cMzb20Y8K6+m/UrYRO/jRs0gQ6tMsBz2734Y6nD7bV0=;
 b=ge9CttgoDQ3deRK05DQdZqTo03YM5rI8+KctLpNLi+nXUujE8uHLnnJKJKxnOKBs3o
 TH3Dx9yqx6rDKq9kWggZaevMKgUxj3Fo7FrUlfz9c1p5pw2Tj621UiQTjVH9e+kuHWLe
 n0EFeDdkIFv58haimr/9ivm/Uy7kSXR4qsDm6tfElaVQf12iKJMA2oY5IsAPhfkf8lZc
 Ovejn3ZEAX2nOZ1/vXSpteYtFgdAX6SlNJ26lDnslKmLnb4BdB2upPzaH2jOiKgLkhtK
 ECBYkTZFACh6a7myA5fx1Gixlbg90mZwCn7kDuyOpPMNA5T3p9Y94kW+B9siiHEPXDoV
 yeuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747644692; x=1748249492;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cMzb20Y8K6+m/UrYRO/jRs0gQ6tMsBz2734Y6nD7bV0=;
 b=iwHUJBKlnuUVJEeUjLn8BL+YsS5/IeErMaRO5Yjr3hW7OVs0ufRwNWx2LThqe4J2pU
 9Dbp8gzwogo6sfrKrJkP2lTnAvt7zbW00y26KwS1uaD3t7PmH/YVOizgIk71v+BCGMIX
 F4YnuoPKCTZ4+CSu7+hVoFgicbktp7KLu7e/8/zn0RuLB2zMIMGS0RJuCXRz2f/++Ppn
 rBByeHPppeRrPL6bPF4H6TnfG3dYfziRWFP5k8C21U+sorLfRSr+/AtkWa9M9Uxo2/fr
 NbjUTJfUZ0r3m5g4M0Z/PK19nS5ZVZXtFmTczFCB8AnESD0eRxqThnfrLJ8zKl++WuQ+
 N7qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVfM6pEDezaudvIxMmDs1Nzmi+ECPrqVJQr+Y8GN1hB/1Et4YAF3Sxk/9a06NCS9PVCYVk4trygJs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywC9/Bfz72BEuJKphiARxTgEPRdvGmrlF7AUC6NV6kVFbaiTfD
 mT08qW7UxFZ52dP6ieelP1Cl8ZNvo/AlgUOBJ6zGuHfsHju5e3AiOnnzmsVKBX883Rs=
X-Gm-Gg: ASbGncvuefotZoz4BWlE0RpE8kxtHyMMUj59B5889ro4JwzDCaYp9tiLz4u5tbyOpCJ
 ooBscxG+Z/xbgf0VQiClF+UAanvKZESD20bZ6bn7K1t/8Ak6/f+EJVvEZcSbPpLcDGx9Xpo2WHz
 pp3AeIBtEwbkTsuTGx5F1F30TWA7gDw3GuWkkDHDYAFXXhNdtdFbQdngJCvr2ayTatQsPYDgIXp
 kS0x0v1Y42Phh+xJrxgmFBt0OvgViJaq6sxnkaMjHG74E2K9hTGfZjkNmcaKvTOYvTT/e63oI4Z
 4bIpmWSnw8r0/T1LJ/n2BpYmfIuo6pjLIbkpSsfyXeqOdT1mjKrsCxSMOBORUwzwCg==
X-Google-Smtp-Source: AGHT+IELwRJfANJRR4EEKpN/qpDuWHqyoEpUZWNEEMYp+zTdFQTyerTcFHqUOxQhC6JH3DgQFBu9OQ==
X-Received: by 2002:a5d:5988:0:b0:3a3:6a77:3386 with SMTP id
 ffacd0b85a97d-3a36a773752mr3882579f8f.3.1747644691545; 
 Mon, 19 May 2025 01:51:31 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca4d224sm12358763f8f.12.2025.05.19.01.51.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 01:51:31 -0700 (PDT)
Message-ID: <da8cfddf-6cb9-4ddd-9345-16d065663d4b@ursulin.net>
Date: Mon, 19 May 2025 09:51:30 +0100
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
 <01cce810-7303-4c92-b138-d8a647f3dcee@ursulin.net>
 <a36fdcf31fa0ca7d9e1a24f60ba4c5bf78c7ae87.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <a36fdcf31fa0ca7d9e1a24f60ba4c5bf78c7ae87.camel@mailbox.org>
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


On 16/05/2025 18:16, Philipp Stanner wrote:
> On Fri, 2025-05-16 at 15:30 +0100, Tvrtko Ursulin wrote:
>>
>> On 16/05/2025 14:38, Philipp Stanner wrote:
>>> On Fri, 2025-05-16 at 13:10 +0100, Tvrtko Ursulin wrote:
>>>>
>>>> On 16/05/2025 12:53, Tvrtko Ursulin wrote:
>>>>>
>>>>> On 16/05/2025 08:28, Philipp Stanner wrote:
>>>>>> On Thu, 2025-05-15 at 17:17 +0100, Tvrtko Ursulin wrote:
>>>>>>>
>>>>>>> On 15/05/2025 16:00, Christian König wrote:
>>>>>>>> Sometimes drivers need to be able to submit multiple jobs
>>>>>>>> which
>>>>>>>> depend on
>>>>>>>> each other to different schedulers at the same time, but
>>>>>>>> using
>>>>>>>> drm_sched_job_add_dependency() can't fail any more after
>>>>>>>> the
>>>>>>>> first
>>>>>>>> job is
>>>>>>>> initialized.
>>>>>>>>
>>>>>>>> This function preallocate memory for dependency slots so
>>>>>>>> that
>>>>>>>> no
>>>>>>>> ENOMEM
>>>>>>>> can come later while adding dependencies.
>>>>>>>>
>>>>>>>> v2: rework implementation an documentation
>>>>>>>> v3: rework from scratch, use separate function to add
>>>>>>>> preallocated
>>>>>>>> deps
>>>>>>
>>>>>> I think we agreed to not put change logs into commit messages
>>>>>> anymore
>>>>>> :)
>>>>>>
>>>>>> They aren't useful for any reader. Who needs the changelog
>>>>>> afterwards
>>>>>> can retreive it through the mail thread link that we add.
>>>>>>
>>>>>>>>
>>>>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>>>>> ---
>>>>>>>>      drivers/gpu/drm/scheduler/sched_main.c | 45
>>>>>>>> ++++++++++++++++++++++++++
>>>>>>>>      include/drm/gpu_scheduler.h            |  4 +++
>>>>>>>>      2 files changed, 49 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> index f7118497e47a..b95e7089aa70 100644
>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> @@ -858,6 +858,51 @@ void drm_sched_job_arm(struct
>>>>>>>> drm_sched_job
>>>>>>>> *job)
>>>>>>>>      }
>>>>>>>>      EXPORT_SYMBOL(drm_sched_job_arm);
>>>>>>>> +/**
>>>>>>>> + * drm_sched_job_prealloc_dependency_slot - avoid ENOMEM
>>>>>>>> on
>>>>>>>> adding
>>>>>>>> dependencies
>>>>>>>> + * @job: scheduler job where dependencies will be added
>>>>>>>> + * @id: id for the allocated slot
>>>>>>>> +  *
>>>>>>>> + * Sometimes drivers need to be able to submit multiple
>>>>>>>> jobs
>>>>>>>> which
>>>>>>>> depend on
>>>>>>>> + * each other to different schedulers at the same time,
>>>>>>>> but
>>>>>>>> using
>>>>>>>> + * drm_sched_job_add_dependency() can't fail any more
>>>>>>>> after
>>>>>>>> the
>>>>>>>> first job is
>>>>>>>> + * initialized.
>>>>>>>> + *
>>>>>>>> + * This function preallocate memory for a dependency
>>>>>>>> slot so
>>>>>>>> that
>>>>>>>> no ENOMEM can
>>>>>>>> + * come later while adding dependencies. The index of
>>>>>>>> the
>>>>>>>> preallocated slot is
>>>>>>>> + * returned in @id.
>>>>>>>> + *
>>>>>>>> + * Return:
>>>>>>>> + * 0 on success, or an error on failing to expand the
>>>>>>>> array.
>>>>>>>> + */
>>>>>>>> +int drm_sched_job_prealloc_dependency_slot(struct
>>>>>>>> drm_sched_job
>>>>>>>> *job,
>>>>>>>> +                       u32 *id)
>>>>>>>> +{
>>>>>>>> +    return xa_alloc(&job->dependencies, id, NULL,
>>>>>>>> xa_limit_32b, GFP_KERNEL);
>>>>>>>> +}
>>>>>>>> +EXPORT_SYMBOL(drm_sched_job_prealloc_dependency_slot);
>>>>>>>> +
>>>>>>>> +/**
>>>>>>>> + * drm_sched_job_add_prealloc_dep - add dependency to
>>>>>>>> preallocated
>>>>>>>> slot
>>>>>>>> + * @job: scheduler job where dependencies will be added
>>>>>>>> + * @id: the preallocated slot index
>>>>>>>> + * @fence: the dependency to add
>>>>>>>> + *
>>>>>>>> + * Consumes @fence and adds it to the preallocated slot
>>>>>>>> dependency.
>>>>>>>> + */
>>>>>>>> +void drm_sched_job_add_prealloc_dep(struct drm_sched_job
>>>>>>>> *job, u32
>>>>>>>> id,
>>>>>>>> +                    struct dma_fence *fence)
>>>>>>>> +{
>>>>>>>> +    fence = xa_store(&job->dependencies, id, fence,
>>>>>>>> GFP_ATOMIC);
>>>>>>>
>>>>>>> Add assert that the passed id exists (was preallocated) and
>>>>>>> is
>>>>>>> NULL?
>>>>>>
>>>>>> You
>>>>>
>>>>> Hm?
>>>>>
>>>>>>>
>>>>>>> Also, if someone preallocates and does not consume the slot
>>>>>>> will that
>>>>>>> confuse the iteration in drm_sched_job_dependency()?
>>>>>>
>>>>>> drm_sched_job_add_dependency() you mean.
>>>>>
>>>>> I was actually thinking of drm_sched_job_dependency() because
>>>>> that
>>>>> looked it would skip dependencies upon encountering an
>>>>> unconsumed
>>>>> preallocated slot, but yes, drm_sched_job_add_dependency()
>>>>> could
>>>>> explode
>>>>> even earlier if adding a normal dependency after preallocating
>>>>> a
>>>>> slot.
>>>>>
>>>>>> Yes, it would. All operations simply give you NULL for those
>>>>>> slots. So
>>>>>> seems to me you have to check for NULL wherever a
>>>>>> preallocated
>>>>>> slot
>>>>>> might drop out. That would then be a bug.
>>>>>>
>>>>>> It's kind of tricky, all that. It's a pity that Wilcox didn't
>>>>>> answer
>>>>>> our questions about the idiomatic way to do it.
>>>>>>
>>>>>> Maybe reserving slots with already signaled fences wasn't
>>>>>> such a
>>>>>> bad
>>>>>> idea after all?
>>>>>>
>>>>>> If we go for the NULL approach, it's probably the only sane
>>>>>> way
>>>>>> to then
>>>>>> check for NULL wherever dependencies are accessed :(
>>>>>>
>>>>>> Opinions?
>>>>>
>>>>> Well if the xarray API returns the NULL consistently the
>>>>> approach
>>>>> from
>>>>> this patch is fine I think.
>>>>>
>>>>> We just need to add two more checks to the above mentioned
>>>>> functions,
>>>>
>>>> I need to correct myself, drm_sched_job_dependency() wouldn't be
>>>> able
>>>> to
>>>> just skip NULLs since it relies on NULL for "no more
>>>> dependencies".
>>>> We
>>>> would need to track something like job->max_dependency and
>>>> terminate
>>>> on
>>>> job->last_dependency > job->max_dependency or so.
>>>
>>> Agreed, that would have to be fixed.
>>>
>>> I believe we should reconsider Christian's first idea [1].
>>>
>>> Thinking about it some more:
>>>    * With the NULL version, suddenly the xarray containing only
>>> valid
>>>      dependencies can sometimes contain NULL entries.
>>>    * If we could create our own tag, entries could be returned that
>>> were
>>>      neither NULL nor valid fences, also requiring checks
>>> 'everywhere'.
>>>    * Only the "signaled fence as prealloc reservation" approach is
>>> fully
>>>      backwards compatible and will never cause anyone to block after
>>>      later reworks.
>>>
>>> So maybe it's actually the best idea?
>>>
>>> Sorry for the zigg-zagg. No hard requirements intended from my
>>> side,
>>> I'm willing to go with what you guys think.
>>>
>>> Just saying, at least now I think that the already-signaled fence
>>> seems
>>> the most elegant solution. And since there's a function
>>> (dma_fence_get_stub()) for that, it seems to be in alignment with
>>> official dma_fence rules.
>>
>> Potential problem there was dma_fence_is_signaled() and fence
>> signaling
>> annotations. In case some driver is holding a lock over the arm+push
>> pair. I wish we had a non-signaling is_signaled helper..
>>
> 
> Yes! +1!
> 
> But Christian doesn't like that direction:
> 
> https://lore.kernel.org/all/20250409120640.106408-2-phasta@kernel.org/

Thanks, I read this but ended up uncertain on the conclusion.

For instance Christian at the end comments like this:

"""
You can test the flag if you know what the fence means to you, that is 
not a problem at all.
"""

That was in the context of testing the signaled bit without 
opportunistic signaling.

For me, from the scheduler dependencies side, that should exactly apply. 
Scheduler knows it does not need to add a signaled fence to the dep 
array so AFAICS it is fine to skip it. And it may easily be 
opportunistic signaling ends up a problem for the scheduler.

So maybe such helper would be okay after all.

Or if the concern is helper might encourage some potentially unsafe 
usage, in that case it should come with kerneldoc describing. It is not 
like review is guaranteed to catch someone using test_bit directly 
anyway so for me, on balance, helper is always better.

Regards,

Tvrtko




> 
> P.
> 
>>
>>
> 
> 
>>
>>
>> Anyway, I think both options are passable. I even like the NULL entry
>> slightly more since it is simpler in a way and I don't mind some
>> extra
>> checks completely hidden in scheduler internals.
>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>>
>>> Philipp
>>>
>>>
>>> [1]
>>> https://lore.kernel.org/all/20250318120313.19099-2-christian.koenig@amd.com
>>> /
>>>
>>>
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>> some more unit tests probably to make sure, and that should be
>>>>> fine
>>>>> for
>>>>> now.
>>>>>
>>>>> On the bikeshedding front I would perhaps suggest:
>>>>>
>>>>>     - drm_sched_job_preallocate_dependency()
>>>>>     - drm_sched_job_replace_dependency()
>>>>>
>>>>> Reads a little bit more aligned with the rest of the API and a
>>>>> bit
>>>>> easier on the eyes, to my eyes at least.
>>>>>
>>>>> Regards,
>>>>>
>>>>> Tvrtko
>>>>>
>>>>
>>>
>>
> 

