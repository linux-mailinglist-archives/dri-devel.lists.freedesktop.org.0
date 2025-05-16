Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB0DAB9BA6
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 14:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADCDF10EA7C;
	Fri, 16 May 2025 12:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="Sti35gFT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B1310EA89
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 12:10:10 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-441ab63a415so21544985e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 05:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1747397409; x=1748002209;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LGT2oPWwjoh7rKPwN1d4wn7K3Rnyxcoy16FVWlVVIAs=;
 b=Sti35gFT9LDSUmab2iaWusvJdM1TKPMcqcFQHt6VN0uU4nE18AshogwBz/1G1qTdNK
 lU/+BFoV7dHuXQWukIzXfGyX1vBrky91fzy7GScnmqTbxHUdtWOUSXQyUZ/yQv3FBcWe
 0kXFE5FQvpMpnedwAzDsZiyeVp/oUdtFuJ59Z4Z3nvt7OoNeRCpifmKbMV+9wuLK5Zxd
 u8peVNBFFRgI1QolUkIwVE2k8ItHMyfImKYTzmBEcMROC3g1ZAEekeNqTKn/IAK+z146
 pABKAXg1FbMPfGliGSSUn6/+4PiyUSbz8NVFgPzKXkE9iVysD+DnP3+PVNWDCA/W5bmG
 7E3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747397409; x=1748002209;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LGT2oPWwjoh7rKPwN1d4wn7K3Rnyxcoy16FVWlVVIAs=;
 b=X5f6PeNH0OEv3ZUo0rhXu4gqvFXoWUFq25by/y7mXw0GN2swj+p9Kdr6MK5E3s6/Qn
 g/6dMpWUBczTb0WX4H+WDajZOICw6n54sJzwpFFtrvzapnAwWMNkZhuBNef4n8DxUIYu
 o/ZbfHPHWo9nHi8RfOQ+pnBmCoVFwyHF1HOPI2JJTSION5WBTiBhl+Cv4ARxzCRKRq5d
 q+IbmTh14hG2wvMDufjr294v/VIr363upnPiJMTSBDkUdJKj9HU/CPoirDO71xuh0x4P
 8KWyV0K50qVKR4B1qNARnjHyEgC8pxxk+0rC9W+bq30aadEQJ8s6WTxjnaTDCQc0k8U4
 oloQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWs75I5tt2/l3fWwPbQRZnAP3+3UrvAANdAdUTIgW2i1Fp+Rjl2iVwRUwdEysRHCs3gy/7oUTocfzU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQhHFHgqxt1vMIKiSilsTob8k5ZxTcr+j3SxUC6Uncebz2VB14
 oKPewQdJfo+O1QdcduQ5cTIbR/CZ5eOBi4F3Hrol62URh7U2ztZUg67VW0qPrMn+39I=
X-Gm-Gg: ASbGncsiXlixGVikSTuQ8dBvJSyyBlt9nqBTDBU9uQY8rl+277Gu3MpCNPlWC65U12X
 cfLKQUyFkuGzhX3+7HTARPMd8L6ToW9ksUOTFKiAC35aFNYLLa21WTmFH//4e/edNkOW3une8Vl
 rUXJLMkuq87Vekff+1W2vj4Cj6lbxdxseUViZSyl7okvceMA2FLpzkGZoIihjILNngsR87aG1zm
 u0iPl15D+BK7CNsrOIcgWMZcLZb74s76I+Rjlhdd3H+Ke6ccsYcH/8OOid/pN6WZW0tyE0RWASE
 crMlSNTPmhf8i1FFOIGmsNSRfIiop4ur1X9VqiApWvlGBB+os4JSLNSbdJyhf3wDQw==
X-Google-Smtp-Source: AGHT+IH1UuoNTQjkC007ANJG1J1jGMaZnBAR0r/hx+FlzP/yWrf4ch5ilPLGeQm2BWA0uwswm/xBnQ==
X-Received: by 2002:adf:fe85:0:b0:3a3:6143:1100 with SMTP id
 ffacd0b85a97d-3a3614312b9mr1580378f8f.59.1747397408703; 
 Fri, 16 May 2025 05:10:08 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca5a03fsm2648416f8f.22.2025.05.16.05.10.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 05:10:08 -0700 (PDT)
Message-ID: <6a361f21-1ba2-4084-b85c-0db30c9b01cc@ursulin.net>
Date: Fri, 16 May 2025 13:10:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/sched: add drm_sched_prealloc_dependency_slots v3
From: Tvrtko Ursulin <tursulin@ursulin.net>
To: phasta@kernel.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <ckoenig.leichtzumerken@gmail.com>, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, amd-gfx@lists.freedesktop.org
References: <20250515150038.4615-1-christian.koenig@amd.com>
 <20250515150038.4615-2-christian.koenig@amd.com>
 <a5e53b34-c247-4193-b4ab-551693ad089a@ursulin.net>
 <5c93f114a58e84796f239b9e0f4a13e9c223e45b.camel@mailbox.org>
 <6e5ab077-77ff-443b-b345-7d99fcd01a73@ursulin.net>
Content-Language: en-GB
In-Reply-To: <6e5ab077-77ff-443b-b345-7d99fcd01a73@ursulin.net>
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


On 16/05/2025 12:53, Tvrtko Ursulin wrote:
> 
> On 16/05/2025 08:28, Philipp Stanner wrote:
>> On Thu, 2025-05-15 at 17:17 +0100, Tvrtko Ursulin wrote:
>>>
>>> On 15/05/2025 16:00, Christian König wrote:
>>>> Sometimes drivers need to be able to submit multiple jobs which
>>>> depend on
>>>> each other to different schedulers at the same time, but using
>>>> drm_sched_job_add_dependency() can't fail any more after the first
>>>> job is
>>>> initialized.
>>>>
>>>> This function preallocate memory for dependency slots so that no
>>>> ENOMEM
>>>> can come later while adding dependencies.
>>>>
>>>> v2: rework implementation an documentation
>>>> v3: rework from scratch, use separate function to add preallocated
>>>> deps
>>
>> I think we agreed to not put change logs into commit messages anymore
>> :)
>>
>> They aren't useful for any reader. Who needs the changelog afterwards
>> can retreive it through the mail thread link that we add.
>>
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/scheduler/sched_main.c | 45
>>>> ++++++++++++++++++++++++++
>>>>    include/drm/gpu_scheduler.h            |  4 +++
>>>>    2 files changed, 49 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index f7118497e47a..b95e7089aa70 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -858,6 +858,51 @@ void drm_sched_job_arm(struct drm_sched_job
>>>> *job)
>>>>    }
>>>>    EXPORT_SYMBOL(drm_sched_job_arm);
>>>> +/**
>>>> + * drm_sched_job_prealloc_dependency_slot - avoid ENOMEM on adding
>>>> dependencies
>>>> + * @job: scheduler job where dependencies will be added
>>>> + * @id: id for the allocated slot
>>>> +  *
>>>> + * Sometimes drivers need to be able to submit multiple jobs which
>>>> depend on
>>>> + * each other to different schedulers at the same time, but using
>>>> + * drm_sched_job_add_dependency() can't fail any more after the
>>>> first job is
>>>> + * initialized.
>>>> + *
>>>> + * This function preallocate memory for a dependency slot so that
>>>> no ENOMEM can
>>>> + * come later while adding dependencies. The index of the
>>>> preallocated slot is
>>>> + * returned in @id.
>>>> + *
>>>> + * Return:
>>>> + * 0 on success, or an error on failing to expand the array.
>>>> + */
>>>> +int drm_sched_job_prealloc_dependency_slot(struct drm_sched_job
>>>> *job,
>>>> +                       u32 *id)
>>>> +{
>>>> +    return xa_alloc(&job->dependencies, id, NULL,
>>>> xa_limit_32b, GFP_KERNEL);
>>>> +}
>>>> +EXPORT_SYMBOL(drm_sched_job_prealloc_dependency_slot);
>>>> +
>>>> +/**
>>>> + * drm_sched_job_add_prealloc_dep - add dependency to preallocated
>>>> slot
>>>> + * @job: scheduler job where dependencies will be added
>>>> + * @id: the preallocated slot index
>>>> + * @fence: the dependency to add
>>>> + *
>>>> + * Consumes @fence and adds it to the preallocated slot
>>>> dependency.
>>>> + */
>>>> +void drm_sched_job_add_prealloc_dep(struct drm_sched_job *job, u32
>>>> id,
>>>> +                    struct dma_fence *fence)
>>>> +{
>>>> +    fence = xa_store(&job->dependencies, id, fence,
>>>> GFP_ATOMIC);
>>>
>>> Add assert that the passed id exists (was preallocated) and is NULL?
>>
>> You
> 
> Hm?
> 
>>>
>>> Also, if someone preallocates and does not consume the slot will that
>>> confuse the iteration in drm_sched_job_dependency()?
>>
>> drm_sched_job_add_dependency() you mean.
> 
> I was actually thinking of drm_sched_job_dependency() because that 
> looked it would skip dependencies upon encountering an unconsumed 
> preallocated slot, but yes, drm_sched_job_add_dependency() could explode 
> even earlier if adding a normal dependency after preallocating a slot.
> 
>> Yes, it would. All operations simply give you NULL for those slots. So
>> seems to me you have to check for NULL wherever a preallocated slot
>> might drop out. That would then be a bug.
>>
>> It's kind of tricky, all that. It's a pity that Wilcox didn't answer
>> our questions about the idiomatic way to do it.
>>
>> Maybe reserving slots with already signaled fences wasn't such a bad
>> idea after all?
>>
>> If we go for the NULL approach, it's probably the only sane way to then
>> check for NULL wherever dependencies are accessed :(
>>
>> Opinions?
> 
> Well if the xarray API returns the NULL consistently the approach from 
> this patch is fine I think.
> 
> We just need to add two more checks to the above mentioned functions, 

I need to correct myself, drm_sched_job_dependency() wouldn't be able to 
just skip NULLs since it relies on NULL for "no more dependencies". We 
would need to track something like job->max_dependency and terminate on 
job->last_dependency > job->max_dependency or so.

Regards,

Tvrtko

> some more unit tests probably to make sure, and that should be fine for 
> now.
> 
> On the bikeshedding front I would perhaps suggest:
> 
>   - drm_sched_job_preallocate_dependency()
>   - drm_sched_job_replace_dependency()
> 
> Reads a little bit more aligned with the rest of the API and a bit 
> easier on the eyes, to my eyes at least.
> 
> Regards,
> 
> Tvrtko
> 

