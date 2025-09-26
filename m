Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A26BA2EEB
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 10:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4E210E9FA;
	Fri, 26 Sep 2025 08:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="r3fauQ7f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A5610E9F6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 08:24:12 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3ee64bc6b90so1225313f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 01:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1758875051; x=1759479851;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oUD/8CRZzggBoLEA3Cnl2jWaOfaB/XHcGKtwCB0bD9U=;
 b=r3fauQ7fPHRpUR99mNfMoPCuAGyfhjDkVwSKZY2rMV3JIZJ/kZnIRcsz0/6BN6BeUz
 MhyNIh2aSzeVaKV5vT+PwC6Z6WZYr0Qw8z085efC4+KkE1h86JgHRIK0QB2dHCYCWc5v
 z51/5wdlyYj7GJ0S8HNTOuxAjsl22vPOuiESv9jg+gxTU1B05BJL6c1nVqE3uTa+pfkW
 0dnt/jyIxvyQd/YCwSWYT+LA9p/xrnae4iBFVOIw8DGeQXnU5OlwEV7w90CfH4rIcPnU
 KIknNKku09vaE/arBmh46z51iYK/LbRHQpyiplhvx/MALSGMHcfPPAo69Dfovl6ytr3s
 HDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758875051; x=1759479851;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oUD/8CRZzggBoLEA3Cnl2jWaOfaB/XHcGKtwCB0bD9U=;
 b=qaVWxtlR7Lb9Dt30dp2RILPnSfgDb96dWo+JqSR3gH0drMRpZKuIjU+QGW3IjqshjZ
 23hgP1bsmq1V9VaEA4rR4ub0RTAscH+huyjIvc5UYN68cmFMA0OjBKFeIjhGpqgbXKd1
 1nxaoDrtp8SUKhN7NcTcv7TWuAqdS6DKeS25u+WxecEka8+xkXjhbIByp3P6ZcJWsDGC
 Qjj/gFnpG4ocYBEfMZEvFLf0K6WPMeuW5ZYjF49yHgWRlENeccQs5FaG4Xp9zKpEXT5P
 +t2LZMkMl2z08vAXcWYGpwuee3U3FugY+agUvJxsCfqsNvZDi+3b7plb7qRDDvqvQ9uZ
 sSOg==
X-Gm-Message-State: AOJu0YzACVaB5/rGD5X0KVLkEidBj/xb0gKpvA31P+th75qcOs9/asz4
 Y7NazOOAsUoJeHQSxBP5i6Nl/WSdJjgoR4QnJA3ZGTHTg0ZGn+eDnnbQ519e6vkWNcY=
X-Gm-Gg: ASbGncusx+/WbBWbvwQd3SiTOIGXZHj0hL8N68YxnY74ady1/65pr8bmS2eIKSOisKi
 psUZTDa1tOtFxntnj+goyKggAJYC73VFz7jX23fkO3oUG9+dgJBqowxihhjnqulReFBAq0zf+u+
 k2eDL5syHt24qPvbCophaQlGuYRIhKw1UPbT9eKibd3LGt6bWemEIPJvq4sktytx3td/mYya9YR
 pBzTsMbwd6S/W15yc9A81AHzCUMBbUT7k1ciC9J8MT3wSbycxBZ92wHpwMCCzNT/r4VIQXAc+9b
 A6nlfV/FJgUFnPfZWBQlchIF4ySe04/hAQjEW6ny8h8iyuv5Fc92qw03a+VlAVT1PWmjR9/qVme
 8An1w7tm2ifdQNZpOt1bup5Sf8LRwDEeKrimhwyme7HKB/g==
X-Google-Smtp-Source: AGHT+IG8YwG9HrnLSH6VPVzo/IyxpaQEQKPMBPPWJSnyXSi9ksjE6toq2AR1AXEwtgR5IyEF+jGJag==
X-Received: by 2002:a05:6000:615:b0:3ee:f10c:6baa with SMTP id
 ffacd0b85a97d-40e4b850ab1mr5498435f8f.37.1758875050740; 
 Fri, 26 Sep 2025 01:24:10 -0700 (PDT)
Received: from [192.168.0.101] ([84.66.36.92])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc82f2ff6sm5985729f8f.56.2025.09.26.01.24.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 01:24:09 -0700 (PDT)
Message-ID: <f5a7ceb4-2313-48b9-bf75-628e9ad91757@ursulin.net>
Date: Fri, 26 Sep 2025 09:24:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] drm/sched: limit sched score update to jobs change
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Philipp Stanner <phasta@kernel.org>
References: <20250822134348.6819-1-pierre-eric.pelloux-prayer@amd.com>
 <20250822134348.6819-2-pierre-eric.pelloux-prayer@amd.com>
 <abb776bc-5b13-4db7-9421-59259119b859@ursulin.net>
 <5183ed88-1634-42c2-9bd8-ed0e626f877b@damsy.net>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <5183ed88-1634-42c2-9bd8-ed0e626f877b@damsy.net>
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


On 26/09/2025 09:20, Pierre-Eric Pelloux-Prayer wrote:
> Hi,
> 
> Le 01/09/2025 à 11:20, Tvrtko Ursulin a écrit :
>>
>>
>> + Tomeu and Oded
>>
>> On 22/08/2025 14:43, Pierre-Eric Pelloux-Prayer wrote:
>>> Currently, the scheduler score is incremented when a job is pushed to an
>>> entity and when an entity is attached to the scheduler.
>>>
>>> This leads to some bad scheduling decision where the score value is
>>> largely made of idle entities.
>>>
>>> For instance, a scenario with 2 schedulers and where 10 entities submit
>>> a single job, then do nothing, each scheduler will probably end up with
>>> a score of 5.
>>> Now, 5 userspace apps exit, so their entities will be dropped. In
>>> the worst case, these apps' entities where all attached to the same
>>> scheduler and we end up with score=5 (the 5 remaining entities) and
>>> score=0, despite the 2 schedulers being idle.
>>> When new entities show up, they will all select the second scheduler
>>> based on its low score value, instead of alternating between the 2.
>>>
>>> Some amdgpu rings depended on this feature, but the previous commit
>>> implemented the same thing in amdgpu directly so it can be safely
>>> removed from drm/sched.
>>>
>>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux- 
>>> prayer@amd.com>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_main.c | 2 --
>>>   1 file changed, 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/ 
>>> drm/ scheduler/sched_main.c
>>> index 5a550fd76bf0..e6d232a8ec58 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -206,7 +206,6 @@ void drm_sched_rq_add_entity(struct drm_sched_rq 
>>> *rq,
>>>       if (!list_empty(&entity->list))
>>>           return;
>>> -    atomic_inc(rq->sched->score);
>>>       list_add_tail(&entity->list, &rq->entities);
>>>   }
>>> @@ -228,7 +227,6 @@ void drm_sched_rq_remove_entity(struct 
>>> drm_sched_rq *rq,
>>>       spin_lock(&rq->lock);
>>> -    atomic_dec(rq->sched->score);
>>>       list_del_init(&entity->list);
>>>       if (rq->current_entity == entity)
>>
>> LGTM.
>>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
> 
> Thanks.
> 
>> Only detail is, I did a revisit of the scheduler users and it looks 
>> like the new rocket driver is the only one other than amdgpu which 
>> passes a list of more than one scheduler to drm_sched_entity_init. I 
>> don't *think* it would be affected though. It would still pick the 
>> least loaded (based on active jobs) scheduler at job submit time. 
>> Unless there is some hidden behaviour in that driver where it would be 
>> important to consider number of entities too. Anyway, it would be good 
>> for rocket driver to double-check and ack.
>>
> 
> Tomeu, Oded: any concerns about this change?

Tomeu acked it in case you missed it:

https://lore.kernel.org/dri-devel/20250822134348.6819-1-pierre-eric.pelloux-prayer@amd.com/T/#m4efa0d69211b2bb378cfb302e459faa30e57f58c

Regards,

Tvrtko

