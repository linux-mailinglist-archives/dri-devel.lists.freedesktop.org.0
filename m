Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABE4A6DA9A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 13:59:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2AE10E32F;
	Mon, 24 Mar 2025 12:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D5xO/Pc1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF09910E327;
 Mon, 24 Mar 2025 12:59:20 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so32738955e9.1; 
 Mon, 24 Mar 2025 05:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742821159; x=1743425959; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nN94x1xXFx2MS+6yhUPP8D7HFLoBfyZ/GVlO9VdfFaM=;
 b=D5xO/Pc1pTsRVAmuC1NZ5LMqnXVZRakhGjHXBrvU4DeRQxC9JceRispehfbBc6cCiT
 LsWQyvygqfO81S91KrPspdoVfA2hTIZwP4iQFZnFPrA5dEdiwQMiM23zSX6x0JzToCgY
 fudN7SKLpSHHIppJOvfZKnBUKdeJna0mEpXxyMRE20XWTS+igN4oZrNIPB9Q6kdylzLN
 NVya2frjL2T5I2IQAHPcX26Iad7absHvL6c7bc1zT7LmOR0hsgC2dR6w7VM1d+wKwTLq
 +CE2ESbJoxQbfW1ud9gO8WlriKUBLllOc3CJrx52XzUXAEmdT+DvgOdflkAW3/XmqMJ4
 sg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742821159; x=1743425959;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nN94x1xXFx2MS+6yhUPP8D7HFLoBfyZ/GVlO9VdfFaM=;
 b=eFN2F9htlbD0dA7QnwRnIj0xBrGt5A09X9NZ/IH8rVe+gCDMnAcljUNl57IQOVSgAF
 G81Z6DNoFzjgPbuCcs8yPKNsgPQO1E/TD+6EU9iDPf9pNbQRm+cK33XNDv69yHIbyVjP
 sh6xc5fLjlaXrIlpZyClZ7CqNRz0TCg9Tr+tip3kga8kpOEc4zKyA5M9bzWuSV5saqjy
 idBl5rTXp5J9hZaeEkOO86X8ahHiC5xZilDoe2Z8lb43LIvYYLQgyK6yReAeP85t14oN
 B6y55PhA8fI5J9T/PVZjoSAPjYEP7UjU6lelX49+FuV0Ri9a3Ceh8S8RimbWIWnrEZD8
 6y8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsd6hR5N/T5inlWptxJgMxhPadeh2d6B88SuElrNv+99meuBNTy7MVLFTXY6oBe0Tp7Jh2fvcR@lists.freedesktop.org,
 AJvYcCWVDiyXy3/xQhzfZchv8u0iFXriBUb3MTr/Z+OqzuDllgKFLS7x3HvKOuuvx3ibQBIfZIdJWXf/MIkC@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnibbtuU4qJLL28lUqZnX2nuO+Wcp5w6FQnNyPvJ4eQdz7cdYl
 E/4lteWEwEEdQ3+CSHBlgsNkN6hJVquWgSZkmmObaqG6Rom6Tj0S
X-Gm-Gg: ASbGncsY3YWBuuHTB/IT4xnOcVZkdzphbfZPRIeyeIM/k+OlSJouAZK5iL7hBBi/TBM
 fX8Nh1UumTmvalj3v8gKU/GkOq8MUxFcGAEuKY2yf39iQ2SpPkjPZvUNBoGdocoBlB5sKC9qa1l
 ynS4b6ZvD2F3dcXjIjYv5vLE03FIc+SUlu8ygZC+xZvJ9zzjP0lEJqDFLwpUT0TsOYD6qmOlYDj
 FSANNrladg0YWMCPY8VmSkgLl0iL+js+hstHt3ZShuReDmjoXeHwpfSTd4IoYrIVY9tu5C2WqrT
 N07gV9n9CQaHYDmtolZ0HMSCan1I8IDXcZFemxjEaWG6Em03QL10cdLhad3dNbDYra5xt+rgsg=
 =
X-Google-Smtp-Source: AGHT+IGYAaKTUrMNVz3N0+42A/wUc2eJCCbMyGZPyY+n/0gtkW0/uobFuDvTuVKIh7irmQlsLkNNPg==
X-Received: by 2002:a05:600c:34cc:b0:43d:24d:bbe2 with SMTP id
 5b1f17b1804b1-43d50a3cb58mr116365645e9.28.1742821158821; 
 Mon, 24 Mar 2025 05:59:18 -0700 (PDT)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39abdaf0c0bsm6428761f8f.63.2025.03.24.05.59.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 05:59:18 -0700 (PDT)
Message-ID: <7a0185d6-1f86-4be8-a9e9-20fadfd63bd9@gmail.com>
Date: Mon, 24 Mar 2025 13:59:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/sched: add drm_sched_prealloc_dependency_slots v2
To: phasta@kernel.org, tvrtko.ursulin@igalia.com, dakr@kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20250321155852.15162-1-christian.koenig@amd.com>
 <e9db9144a38161982b9f310c4543e1effe7afe17.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <e9db9144a38161982b9f310c4543e1effe7afe17.camel@mailbox.org>
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

Am 21.03.25 um 19:05 schrieb Philipp Stanner:
> On Fri, 2025-03-21 at 16:58 +0100, Christian König wrote:
>> Sometimes drivers need to be able to submit multiple jobs which
>> depend on
>> each other to different schedulers at the same time, but using
>> drm_sched_job_add_dependency() can't fail any more after the first
>> job is
>> initialized.
>>
>> This function preallocate memory for dependency slots so that no
>> ENOMEM
>> can come later while adding dependencies.
>>
>> v2: rework implementation an documentation
> For drm/sched Danilo & I think that changelogs shouldn't be in the
> commit message anymore. The Link: applied by the DRM tools will be
> sufficient to find the history in the archives if necessary.

Sure, going to drop that.

>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>  drivers/gpu/drm/scheduler/sched_main.c | 44
>> ++++++++++++++++++++++++--
>>  include/drm/gpu_scheduler.h            |  2 ++
>>  2 files changed, 43 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index 4d4219fbe49d..ee3701f346b2 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -852,6 +852,39 @@ void drm_sched_job_arm(struct drm_sched_job
>> *job)
>>  }
>>  EXPORT_SYMBOL(drm_sched_job_arm);
>>  
>> +/**
>> + * drm_sched_job_prealloc_dependency_slots - avoid ENOMEM on adding
>> dependencies
>> + * @job: scheduler job where dependencies will be added
>> + * @num_deps: number of dependencies to preallocate slots for
>> +  *
>> + * Sometimes drivers need to be able to submit multiple jobs which
>> depend on
>> + * each other to different schedulers at the same time, but using
>> + * drm_sched_job_add_dependency() can't fail any more after the
>> first job is
>> + * initialized.
>> + *
>> + * This function preallocate memory for dependency slots so that no
>> ENOMEM can
>> + * come later while adding dependencies.
>> + *
>> + * Return:
>> + * 0 on success, or an error on failing to expand the array.
>> + */
>> +int drm_sched_job_prealloc_dependency_slots(struct drm_sched_job
>> *job,
>> +					    unsigned int num_deps)
>> +{
>> +	u32 id = 0;
>> +	int ret;
>> +
>> +	while (num_deps--) {
>> +		ret = xa_alloc(&job->dependencies, &id,
>> XA_ZERO_ENTRY,
>> +			       xa_limit_32b, GFP_KERNEL);
> Fine by me, but out of curiousity about the xarray: you mentioned
> xa_reserve() might work, too?

Different use case, xa_reserve() can only reserve a specific index and not allocate one.

Allocating and reserving at the same time seems to be done by the pattern xa_alloc(...XA_ZERO_ENTRY...) like we use here.

Regards,
Christian.

>
>
> P.
>
>> +		if (ret != 0)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(drm_sched_job_prealloc_dependency_slots);
>> +
>>  /**
>>   * drm_sched_job_add_dependency - adds the fence as a job dependency
>>   * @job: scheduler job to add the dependencies to
>> @@ -878,10 +911,15 @@ int drm_sched_job_add_dependency(struct
>> drm_sched_job *job,
>>  	 * engines involved, rather than the number of BOs.
>>  	 */
>>  	xa_for_each(&job->dependencies, index, entry) {
>> -		if (entry->context != fence->context)
>> +		if (xa_is_zero(entry)) {
>> +			/*
>> +			 * Reserved entries must not alloc memory,
>> but let's
>> +			 * use GFP_ATOMIC just to be on the
>> defensive side.
>> +			*/
>> +			xa_store(&job->dependencies, index, fence,
>> GFP_ATOMIC);
>> +		} else if (entry->context != fence->context) {
>>  			continue;
>> -
>> -		if (dma_fence_is_later(fence, entry)) {
>> +		} else if (dma_fence_is_later(fence, entry)) {
>>  			dma_fence_put(entry);
>>  			xa_store(&job->dependencies, index, fence,
>> GFP_KERNEL);
>>  		} else {
>> diff --git a/include/drm/gpu_scheduler.h
>> b/include/drm/gpu_scheduler.h
>> index 1a7e377d4cbb..916e820b27ff 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -632,6 +632,8 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>  		       u32 credits, void *owner);
>>  void drm_sched_job_arm(struct drm_sched_job *job);
>>  void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
>> +int drm_sched_job_prealloc_dependency_slots(struct drm_sched_job
>> *job,
>> +					    unsigned int num_deps);
>>  int drm_sched_job_add_dependency(struct drm_sched_job *job,
>>  				 struct dma_fence *fence);
>>  int drm_sched_job_add_syncobj_dependency(struct drm_sched_job *job,

