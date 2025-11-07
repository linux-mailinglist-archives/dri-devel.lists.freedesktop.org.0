Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 425E9C408F7
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 16:18:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BF410EAFA;
	Fri,  7 Nov 2025 15:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="CrmuZlxd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DD310EAFA
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 15:18:12 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4711810948aso6277565e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 07:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1762528691; x=1763133491; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=d9dTI72UNi4STgQlM1dTHrD8kffrsq2tlv/hqqGXE+g=;
 b=CrmuZlxdRH4y0aPAHKphPaRyRUhj4kA3qSh9ySVz6swpswmlQjeMdWZT8ZrpOONogh
 Cs6zrqGGKMrfltRUdOJIs7sgZXMcYDkAWRQBsfZIolxnhhlunE1HCHQe9imQpgSTVFPc
 ItkiXd3hmdVlJVhDIR4La2DSPSg7GEpwVJKx/j3mZI+ArcwxJkMEiOI9od0+sxdyOtID
 Ltm4jWO+BwWTrMwN8K1eDPBTt+T1dUL6VmtW2mEIntP9iCmxo1iepx+K9fNVP5CDzdgr
 MhoHM8U/FPKjM2uLKs50CC8FXd5rdtwGguZ1Vhz3ImAGmyGzgZ/lPWTGUz8k52v6Jk14
 mTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762528691; x=1763133491;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d9dTI72UNi4STgQlM1dTHrD8kffrsq2tlv/hqqGXE+g=;
 b=UVlqkPxlwoLJhOHFDX2oHpZRw7UePq8jYXpD+Yfcx7t3Z77kXBiSdzfLVUiO0LL1dP
 gkyK/4CinuOnX5DKyXEdgvRxIyzgYhboB7kv0xP0CHGoT9PFL4nic7/zYF5NuNsYjFAb
 jGhfsN+YXahMWP5nTDaEHemJZA9pnKdS7i4ItQR+Nz/M/1eGst0r/HOGx+i3pCJAkLqd
 sO4GZlFg/nfP/RgV1yCyaPSXTE0CA253PJF8MQrXY/unmr4BRSku4LJP7kU9LdWWZc9/
 b0egLDwGd56Lgoa+p0dZOjYS3iZ/+sF+MokGuSOtz1undSgIvA7ByVeI1MZngi38U9mZ
 wTDQ==
X-Gm-Message-State: AOJu0YxU99VB0hpt2NXzKcnnuSKoYcY0uZLBdZOE09MTwoMTgZNDpuAB
 HZzUG5v6gVWPCmgT0KpeN4fokhT+3ebyIDym8YbronOvtbzTg18rKDKp8GLA8ggXzsc=
X-Gm-Gg: ASbGnct0CiXFR8fuy052v1I7WMcmcCeVdr9yupmWHQjXnMizMQeCC7CXIWm0byT/1Wk
 nLSt5H/R8o37bLp0swPCkquTbJXjOYKIeZKM1I9GYlteMfzkoqsBdlQSwcwo/MFW0CsCIajhiyE
 Y5ncM/kILw8tC1a/spdF7x/MItqul3fmfi4LqB08JtcWnDMKqFrSHjkGIIh/L2EkopsN42a9XxW
 ICK03aK8KYCOS/PC70Ff8h5uHuX+Xx2wJLnnD4K/Kf28pxnomnYOObdcuxtOqFrKBN1pkMPFAqG
 +0r04Dnj8Sh9CTHcQn7l5JzbF8dfKm5/MuSuL1mahb2xLtUILb3AKxaiV8JU75E8WFnE6RtZOW7
 sBnVFkGFKj4tPAWCjtiTq4oV2Pf2D5yhZ6/ecw/oy/4JuBzRFsyK5J5gPGXxfd+nHPyucHHo2jG
 9VNB8xEtizCumMy9TT
X-Google-Smtp-Source: AGHT+IG4EIX5fyema2IYjt2l3Vyqv0iu4sditV/Gh2C/YUsbpK5YmKbRpuXDfxNtaO5SVbSj16Xs3w==
X-Received: by 2002:a05:600c:3114:b0:471:9da:5232 with SMTP id
 5b1f17b1804b1-4776bcbbb2dmr30521885e9.15.1762528689958; 
 Fri, 07 Nov 2025 07:18:09 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4776bcd521fsm66664195e9.6.2025.11.07.07.18.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 07:18:09 -0800 (PST)
Message-ID: <f39d38c8-8a07-4a63-a09f-3319b5ebb5f6@ursulin.net>
Date: Fri, 7 Nov 2025 15:18:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Don't crash kernel on wrong params
From: Tvrtko Ursulin <tursulin@ursulin.net>
To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251107125508.235449-2-phasta@kernel.org>
 <c4a10ad7-22c0-412c-a456-d2dd0f049ac9@ursulin.net>
Content-Language: en-GB
In-Reply-To: <c4a10ad7-22c0-412c-a456-d2dd0f049ac9@ursulin.net>
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


On 07/11/2025 14:42, Tvrtko Ursulin wrote:
> 
> On 07/11/2025 12:55, Philipp Stanner wrote:
>> drm_sched_job_arm() just panics the kernel with BUG_ON() in case of an
>> entity being NULL. While drm_sched_job_arm() crashing or not effectively
>> arming jobs is certainly a huge issue that needs to be noticed,
>> completely shooting down the kernel reduces the probability of reaching
>> and debugging a system to 0.
>>
>> Moreover, the checkpatch script by now strongly discourages all new uses
>> of BUG_ON() for this reason.
>>
>> Replace the BUG_ON() in drm_sched_job_arm() with a WARN_ON().
>>
>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/ 
>> scheduler/sched_main.c
>> index 1d4f1b822e7b..3bf4ae0ca4bc 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -857,7 +857,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>>       struct drm_gpu_scheduler *sched;
>>       struct drm_sched_entity *entity = job->entity;
>> -    BUG_ON(!entity);
>> +    WARN_ON(!entity);
>>       drm_sched_entity_select_rq(entity);
> 
> void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
> {
>      struct dma_fence *fence;
>      struct drm_gpu_scheduler *sched;
>      struct drm_sched_rq *rq;
> 
>      /* single possible engine and already selected */
>      if (!entity->sched_list)
> 
> Still the same end result.
> 
> I believe best practice is to simply not have BUG_ON's followed by null 

Sorry I meant WARN_ONs. If we think there is scope for bad things to 
happen after letting the execution proceed then I would add an early 
return to the WARN_ON (_ONCE?). That probably means to push job as well.

Regards,

Tvrtko

> pointer dereferences since they add no value. Ie. it should just be 
> removed and not replaced.
> 
> Regards,
> 
> Tvrtko
> 
> Regards,
> 
> Tvrtko
> 
>>       sched = entity->rq->sched;
> 

