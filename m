Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D873A6DAA5
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 14:01:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A970B10E33E;
	Mon, 24 Mar 2025 13:01:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aZxEuzTb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE2510E33D;
 Mon, 24 Mar 2025 13:01:36 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43cfb6e9031so39570675e9.0; 
 Mon, 24 Mar 2025 06:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742821295; x=1743426095; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TopDZiv206AYfw9qpnB5XFQK4mWCjtraJRfsMRECwO4=;
 b=aZxEuzTbUgtCwrP7epy0DgjdXbiXEGDZw1HPLaPHBxf1R+yyHJKtzQ2BKG4cJW61OY
 dJUXYxfh1BrA1Sjb6f3rS//lBEoGyQtKL//+wN8f2rn0i7jgYtihADz3IzJ8VMlyccW3
 F21sPLXv/Q5rK0diqo6a8w31cYXdiKFY+CV6fSUkaaT6Eg4YHGia2oxPTmq317t0LZd+
 ggyrgZ1eh1HIPKWRPl8uzuaxyePel86n1YN6UNBlEnsYUN4E5SaBRMAw8BwdNSnkaMNt
 NDaSjkcX6CAddkuO5QpQTBNp7z0f0JhiPMP1zt6dIwFMK4VSbKcuirLaPRqjjmY5T76B
 ykgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742821295; x=1743426095;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TopDZiv206AYfw9qpnB5XFQK4mWCjtraJRfsMRECwO4=;
 b=cizl+LdxR8RKzaiv/IG1oa9SH4m+4byX14ja4iPDSwh07sxPYC15nUbEBg5WPH4GBH
 hsWosh+70mcWOhaZL9Y20OpnjR8wFi3MiotVAMtV7Ji4d9rSYc0n4Th+9/5horwLip1X
 8i8mDcz5Q9xHpYTx7iF+NydieoIrYjU6JLjB6chHm93G/IcNovDBMvhl3Bh//DzcYM/s
 lzAzBm5EOmTGE9b1jgGVBcrmboZsUYq43V79gL68QU6BzM/3gxz7prFB1U1f1VonpVuR
 fpoTDl/r4Hib6So0xkdIlrl+gEvHGmCVekaJ/vnmDRAIdb2o8P1KArmotvndLA6OhpoC
 R3/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeN2rwxH0U0z7YWANHgjPuwJn2E7DyJp5smbg50bAj2q33e4kCzJyi84qdYCsb/ax1hFmyQDAg@lists.freedesktop.org,
 AJvYcCVrxIKNtEEzDF2sVVKL0xjX9WJhnoTSzs8rdXEwrrcw6MGyMY6jM2M3DrWUMnjybWgIU9mT/JdiXEjk@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAE2YHg8higd/E8uGAqNF2vISeFPkLIBSxo4AqkY72gq0gIxux
 bamNPo4IHq8qa6IXO4rPRe+y3ldNM+8gUX2fnmVW39BQIT7r0Hw0
X-Gm-Gg: ASbGncs0WifoVUioBLevmfZP2DPRN1Q4HXRFoxGpKIrWtJLT93G+X9hwb7GAgPM/6It
 lBOBD/NgLtEUOCgGz1yW1aItd6QIIFIEPRcHIMFVObLYLd5dIO3D7YcAFm7yWd48Yx75j2ze8Ut
 4KMH7jGln+azETp8sJkGr1RJ+WfSaO0eEInCGUJZgUmHHO9XZGDx5a5f323PudszKwHhLqpSReB
 WcztH+trHpujZbFYqEOAY7cMt6zZ3yN+7QPJhfbbDvlcG6STdxcyv3VHvoriB3zwqvg0ZHdzjfS
 GXamw8W63YMc6eyPNQRaaFFsSRascEEq4cUN6ASp0/BhqgBLfeinxf5Kbl0WFze4gy6fWYD9zg=
 =
X-Google-Smtp-Source: AGHT+IEKOWlm66EFMIAeCNsDzXVdsosSRoknqTOwinFVMuYhNzvHRd5beCpQj3HTI/fA+/9lT8l0iA==
X-Received: by 2002:a05:600c:5009:b0:43c:ec28:d31b with SMTP id
 5b1f17b1804b1-43d509f5b5fmr144704625e9.10.1742821294383; 
 Mon, 24 Mar 2025 06:01:34 -0700 (PDT)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fd18365sm119871765e9.13.2025.03.24.06.01.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 06:01:34 -0700 (PDT)
Message-ID: <ae596743-117a-4ab8-84a9-4752a718ca4c@gmail.com>
Date: Mon, 24 Mar 2025 14:01:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/sched: add drm_sched_prealloc_dependency_slots v2
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@mailbox.org,
 dakr@kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20250321155852.15162-1-christian.koenig@amd.com>
 <b04655ab-a165-48d2-8b3e-2557025c5101@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <b04655ab-a165-48d2-8b3e-2557025c5101@igalia.com>
Content-Type: text/plain; charset=UTF-8
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

Am 24.03.25 um 09:35 schrieb Tvrtko Ursulin:
>
> On 21/03/2025 15:58, Christian König wrote:
>> Sometimes drivers need to be able to submit multiple jobs which depend on
>> each other to different schedulers at the same time, but using
>> drm_sched_job_add_dependency() can't fail any more after the first job is
>> initialized.
>>
>> This function preallocate memory for dependency slots so that no ENOMEM
>> can come later while adding dependencies.
>>
>> v2: rework implementation an documentation
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 44 ++++++++++++++++++++++++--
>>   include/drm/gpu_scheduler.h            |  2 ++
>>   2 files changed, 43 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 4d4219fbe49d..ee3701f346b2 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -852,6 +852,39 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>>   }
>>   EXPORT_SYMBOL(drm_sched_job_arm);
>>   +/**
>> + * drm_sched_job_prealloc_dependency_slots - avoid ENOMEM on adding dependencies
>> + * @job: scheduler job where dependencies will be added
>> + * @num_deps: number of dependencies to preallocate slots for
>> +  *
>> + * Sometimes drivers need to be able to submit multiple jobs which depend on
>> + * each other to different schedulers at the same time, but using
>> + * drm_sched_job_add_dependency() can't fail any more after the first job is
>> + * initialized.
>> + *
>> + * This function preallocate memory for dependency slots so that no ENOMEM can
>> + * come later while adding dependencies.
>> + *
>> + * Return:
>> + * 0 on success, or an error on failing to expand the array.
>> + */
>> +int drm_sched_job_prealloc_dependency_slots(struct drm_sched_job *job,
>> +                        unsigned int num_deps)
>> +{
>> +    u32 id = 0;
>> +    int ret;
>> +
>> +    while (num_deps--) {
>> +        ret = xa_alloc(&job->dependencies, &id, XA_ZERO_ENTRY,
>> +                   xa_limit_32b, GFP_KERNEL);
>> +        if (ret != 0)
>> +            return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL(drm_sched_job_prealloc_dependency_slots);
>> +
>>   /**
>>    * drm_sched_job_add_dependency - adds the fence as a job dependency
>>    * @job: scheduler job to add the dependencies to
>> @@ -878,10 +911,15 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
>>        * engines involved, rather than the number of BOs.
>>        */
>>       xa_for_each(&job->dependencies, index, entry) {
>> -        if (entry->context != fence->context)
>> +        if (xa_is_zero(entry)) {
>
> If xa_for_each shows them I think we also need to skip them in drm_sched_job_dependency() and drm_sched_job_cleanup().

Oh, really good point. I've completely forgotten about them.

> Or remove the unused ones at arm time. Hm, we could also put a noisy fail if add_dependency allocates after a job is armed. (I can imagine a few unit tests for this once we merge them.)

Good point as well. I was also waiting for your unit testing stuff to land in drm-misc-next so I can write a test for that.

Thanks,
Christian.

>
> Regards,
>
> Tvrtko
>
>> +            /*
>> +             * Reserved entries must not alloc memory, but let's
>> +             * use GFP_ATOMIC just to be on the defensive side.
>> +            */
>> +            xa_store(&job->dependencies, index, fence, GFP_ATOMIC);
>> +        } else if (entry->context != fence->context) {
>>               continue;
>> -
>> -        if (dma_fence_is_later(fence, entry)) {
>> +        } else if (dma_fence_is_later(fence, entry)) {
>>               dma_fence_put(entry);
>>               xa_store(&job->dependencies, index, fence, GFP_KERNEL);
>>           } else {
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index 1a7e377d4cbb..916e820b27ff 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -632,6 +632,8 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>                  u32 credits, void *owner);
>>   void drm_sched_job_arm(struct drm_sched_job *job);
>>   void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
>> +int drm_sched_job_prealloc_dependency_slots(struct drm_sched_job *job,
>> +                        unsigned int num_deps);
>>   int drm_sched_job_add_dependency(struct drm_sched_job *job,
>>                    struct dma_fence *fence);
>>   int drm_sched_job_add_syncobj_dependency(struct drm_sched_job *job,
>

