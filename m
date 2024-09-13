Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07458978129
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 15:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B54210EBF1;
	Fri, 13 Sep 2024 13:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="Q2FGVsoz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E1510EBF1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 13:30:29 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-42cb60aff1eso20825555e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 06:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1726234228; x=1726839028;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IyIkZw92zTMIkoyZjfpro72dWOk2ZO3xCBNd/rMb+Ds=;
 b=Q2FGVsoztjdu6kMPBd/Sc46pfc4VOewVYyGVhj8NJnscw3UlvlJ4IwSkljvaKgCcw3
 CaMYqAcE8DHl8rM8gyG6Is9NqBBTTegj9j8VNdLxlcvo1jmxKt0DZrhSN2kp/jWij8yx
 Rd41/4xnxPYAxwNekLUuK0Tyj63LKlwcGkRoFRZ+ejbvX43YV0Sfqd+RrTAuP0GoQnTp
 rAbA5QVBFlXuedQxYrC/bcFZ52cVkFH30s1TfSPEScf/PyoR1yXslaQ6ZAHlN+PVhsAF
 4antjVSIn5H1bUy2JX+2hbCRub/OKZZtbweRVYuoJ5JC1tZ5/CuzhtHQ977nwe9PJ3nc
 w3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726234228; x=1726839028;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IyIkZw92zTMIkoyZjfpro72dWOk2ZO3xCBNd/rMb+Ds=;
 b=pcb3KyofElaZU38fBMooxE2dyR01EIt6EpSAJYHOUCzri39XY3b//Suv7zzZlgyU+F
 cwEIFxDkOCKV6FkyuurFTCnp5VLugEAHTNH5rZ3yWlNGYTVnk96Bzpxn9F6JMQ0dtBrP
 8ih5rTc3FPF5QLQrPWc2aPpQQVuCwL/bw2qHYgxCp32I4C7N6uC+PC7HkoPuatj0VtCR
 LW/Z/SHkHfARRCyYhaykma9bCkgVAv3MmynxDWy7+SRHOPXjmROMbRVjve9b9HJpHBL7
 kgVH78D/3VaL8XYT0E50P0VHVElCXIY/HjPtzTeGRn4CTYvQ83wpWUbt430XAqAtPCJY
 HZmA==
X-Gm-Message-State: AOJu0YxuDOpF8gpT5ft8udXCmSkOtwut3QkO/J9dlnMi6Wat35WRZKyW
 SJ74aEiog6kOHBmYrWgQeae/t/wPZl62ViFcOWwrzqxJs2cKQmvI809NhCH3BBs=
X-Google-Smtp-Source: AGHT+IFhJkrssEnzOwpYwkNWJeWce4Ib+xlm8U5jxaEgbK9Q8mguLyDlO/IQjvSYcnm+Q2dcvQjURQ==
X-Received: by 2002:a05:600c:46c5:b0:42c:b9c8:2bb0 with SMTP id
 5b1f17b1804b1-42cdb538cb5mr45488105e9.4.1726234227242; 
 Fri, 13 Sep 2024 06:30:27 -0700 (PDT)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b002a9asm27503875e9.0.2024.09.13.06.30.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 06:30:26 -0700 (PDT)
Message-ID: <5404888b-3727-409d-90fe-530fbb8db24f@ursulin.net>
Date: Fri, 13 Sep 2024 14:30:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/sched: memset() 'job' in drm_sched_job_init()
To: Philipp Stanner <pstanner@redhat.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Danilo Krummrich <dakr@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240828094133.17402-2-pstanner@redhat.com>
 <92a123f1-73c9-45a1-8e0a-af72dd0a70e7@ursulin.net>
 <8a646b5c871fe454d6f194a54fa65d67f3ae5366.camel@redhat.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <8a646b5c871fe454d6f194a54fa65d67f3ae5366.camel@redhat.com>
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


On 13/09/2024 13:30, Philipp Stanner wrote:
> On Fri, 2024-09-13 at 12:56 +0100, Tvrtko Ursulin wrote:
>>
>> Hi,
>>
>> On 28/08/2024 10:41, Philipp Stanner wrote:
>>> drm_sched_job_init() has no control over how users allocate struct
>>> drm_sched_job. Unfortunately, the function can also not set some
>>> struct
>>> members such as job->sched.
>>
>> job->sched usage from within looks like a bug. But not related to the
>> memset you add.
>>
>> For this one something like this looks easiest for a start:
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index ab53ab486fe6..877113b01af2 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -788,7 +788,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>                    * or worse--a blank screen--leave a trail in the
>>                    * logs, so this can be debugged easier.
>>                    */
>> -               drm_err(job->sched, "%s: entity has no rq!\n",
>> __func__);
>> +               pr_err("%s: entity has no rq!\n", __func__);
>>                   return -ENOENT;
>>           }
>>
>> Fixes: 56e449603f0a ("drm/sched: Convert the GPU scheduler to
>> variable
>> number of run-queues")
>> Cc: <stable@vger.kernel.org> # v6.7+
> 
> Danilo and I already solved that:
> 
> https://lore.kernel.org/all/20240827074521.12828-2-pstanner@redhat.com/

Ah.. I saw the link to this in your maintainership thread and 
superficially assumed it is among the pending stuff. All good.

>>
>>> This could theoretically lead to UB by users dereferencing the
>>> struct's
>>> pointer members too early.
>>
>> Hmm if drm_sched_job_init returned an error callers should not
>> dereference anything. What was actually the issue you were debugging?
> 
> I was learning about the scheduler, wrote a dummy driver and had
> awkward behavior. Turned out it was this pointer not being initialized.
> I would have seen it immediately if it were NULL.
> 
> The actual issue was and is IMO that a function called
> drm_sched_job_init() initializes the job. But it doesn't, it only
> partially initializes it. Only after drm_sched_job_arm() ran you're
> actually ready to go.

In my experience one good approach when developing stuff is to have the 
various kernel debugging aids enabled. Lockdep, SLAB debugging, memory 
poisoning, kfence.. Then if you were allocating your job without 
GFP_ZERO, _and_ dereferencing something too early out of 
misunderstanding of the API, you would get something obvious in the oops 
and not a random pointer.

Which also applies to various CI systems, such as the Intel's one which 
already runs a debug kernel and a lot of these mistakes are caught 
instantly.

>> Adding a memset is I think not the best solution since it is very
>> likely
>> redundant to someone doing a kzalloc in the first place.
> 
> It is redundant in most cases, but it is effectively for free. I
> measured the runtime with 1e6 jobs with and without memset and there
> was no difference.

I guess if kzalloc and drm_sched_job_init() are close enough in time so 
that cachelines stays put, and depending how you measure, it may be hard 
to see but cost if still there.

For instance 
https://lore.kernel.org/amd-gfx/20240813140310.82706-1-tursulin@igalia.com/ 
I can see with perf that both memsets are hotspots even when testing 
with glxgears and vsync off.

But I don't feel too strongly about this and there definitely is sense 
in initializing everything. Perhaps even instead of a memset we should 
use correct methods per field? Since in there we have spcs_node, 
atomic_t, ktime_t, dma_fence_cb (even in an annoying union), 
drm_sched_priority.. In an ideal world all those would have their 
initializers. But some don't so meh.

Regards,

Tvrtko

>>> It is easier to debug such issues if these pointers are initialized
>>> to
>>> NULL, so dereferencing them causes a NULL pointer exception.
>>> Accordingly, drm_sched_entity_init() does precisely that and
>>> initializes
>>> its struct with memset().
>>>
>>> Initialize parameter "job" to 0 in drm_sched_job_init().
>>>
>>> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
>>> ---
>>> No changes in v2.
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_main.c | 8 ++++++++
>>>    1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 356c30fa24a8..b0c8ad10b419 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -806,6 +806,14 @@ int drm_sched_job_init(struct drm_sched_job
>>> *job,
>>>    		return -EINVAL;
>>>    	}
>>>    
>>> +	/*
>>> +	 * We don't know for sure how the user has allocated.
>>> Thus, zero the
>>> +	 * struct so that unallowed (i.e., too early) usage of
>>> pointers that
>>> +	 * this function does not set is guaranteed to lead to a
>>> NULL pointer
>>> +	 * exception instead of UB.
>>> +	 */
>>> +	memset(job, 0, sizeof(*job));
>>> +
>>>    	job->entity = entity;
>>>    	job->credits = credits;
>>>    	job->s_fence = drm_sched_fence_alloc(entity, owner);
>>
> 
