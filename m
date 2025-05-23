Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67428AC1DAF
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 09:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3372110E739;
	Fri, 23 May 2025 07:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="PP8VWoNb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48F210E764
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 07:31:13 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so70571625e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 00:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1747985472; x=1748590272;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CYhAthGa9gJYx9jvT9hSNnJWsFQv9/mr1QZZijHDPt0=;
 b=PP8VWoNbTgLm8GesFJotTKp7Aw6diQgBpu2RBfaqdv4Prd1qr5wMcYV7niy46Sj7Qw
 RL3E9Co07nkv75A/u8UI50KYgTuJstJ4RUTaJlYbEqXGI7sooXbSCOeo24EYDs97xlsV
 zMAo3PVZOwxfSfkI+L2NHDFIbSm0gTcWmijUEDqKMDJIjZH173Cl2ZUPn8dWBpmte6Se
 KwPYr3J3A5xaJw8H3FgTYsSd21Yl9FhxOdIE95zCW2bqnCYMA2hBzgHNrv1gno7GGN1h
 mTr1vEh86gaqjw67jjgssYcsmkPAIzuyahH4rxvJuzDQIeAvZHmpHUprRU+XEenwLsyo
 Yy9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747985472; x=1748590272;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CYhAthGa9gJYx9jvT9hSNnJWsFQv9/mr1QZZijHDPt0=;
 b=j+j7hiQomd1aWijkqCTvDIKZqLgKu2RDbp9aDXfuS1sJHan37Yf/vftibAGRfKi1mM
 3CR6MNXFo3yacNOHD0ETLSO6Z23f77BOup4N4BVpTASEpmluixW2HlZyfmXvx9+t5ZxI
 JgE2jW8upxIEKjJbKOG0RHO7Vwnd0Xz765mp8YEo+xVT+crT3PCviQpV4zc6yZ9Aa5+7
 M+JdswCeiqZ+6t7JsqZFPKymKUOGmAGk+GGgZhZMLH7f6GcBVMjQiO/DwyE8WT9nFyhZ
 lgq/LRaAym7G50GJqSQCQarMN8/Crm7LhX6b3XHeWpXJfXD2ecNXKlFNEiHQoasBMKQ9
 TKdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF0pWvmYVzI2OmnwdxjGoauzwCipz5nCXSWMQ+TimNcBAKL1ATluer8fkk0WVd+uqbF+tkekhyLzM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/+MpjP3KzFh3wEGZhU8H+ygrnxue3F0DOXgoHhlsuSHf0FRtH
 GXmzI3xpRC+27ZvFKUB0yuKpRhC/AyId+guD7udT5meqmLJl7OpIxloT1UxtaRzjIuE=
X-Gm-Gg: ASbGncvUN2g6uepsHyL2qhgDcOZ+AFXErne4KvKZe6pl5sD3yTUX8s8zgBgAbrSHQ1V
 HAq1W5IK0w74IjP04iYLLi/fZoM7kg1HMKCyBsJDg2HZmMSwS2aTZae0LWtUnWAa1aOszrOlg/G
 +sVIaS8Jo3RUO9aFJmUKZ3ta6bjbFKlxyEkwOf9ZDWwPjZKv/wDcTIEbHjetnZHncFSSKo4PMKa
 57+TyjMQZYs/Jw4P521ncV8FLM2XbbBf5nm4DT44WBe/vrnH0XB6/DbUyNqsPXh266ikf/HUFb9
 FZMQrSih5ALsD3hoT3bF7gVITVhvrP7sLvDgvFmg4EIW2NyzT+SuNOyOOq1lBV342xXfG0ks7ZH
 p
X-Google-Smtp-Source: AGHT+IEwGvFm0HXVLgk/8IrmbCAODtVutSbSzSkO4RDWoMpqep3Y9odTNjA0FuY8ZUzhQ0x34QlFQQ==
X-Received: by 2002:a05:600c:4fc9:b0:43d:5ec:b2f4 with SMTP id
 5b1f17b1804b1-442fd6271b6mr343621315e9.10.1747985472032; 
 Fri, 23 May 2025 00:31:12 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f6b29548sm139469445e9.4.2025.05.23.00.31.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 May 2025 00:31:11 -0700 (PDT)
Message-ID: <142de347-34b4-40ee-b76c-c9b4ab070888@ursulin.net>
Date: Fri, 23 May 2025 08:31:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/sched: optimize drm_sched_job_add_dependency a bit
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, phasta@mailbox.org, dakr@kernel.org,
 amd-gfx@lists.freedesktop.org
References: <20250522134117.7561-1-christian.koenig@amd.com>
 <20250522134117.7561-2-christian.koenig@amd.com>
 <a96a73ee-32a5-4c38-b277-e76101b94837@ursulin.net>
 <bdf82e27-ae7e-4580-ab77-c05842bc8ec1@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <bdf82e27-ae7e-4580-ab77-c05842bc8ec1@amd.com>
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


On 22/05/2025 17:19, Christian König wrote:
> On 5/22/25 16:27, Tvrtko Ursulin wrote:
>>
>> On 22/05/2025 14:41, Christian König wrote:
>>> Since we already iterated over the xarray we know at which index the new
>>> entry should be stored. So instead of using xa_alloc use xa_store and
>>> write into the index directly.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_main.c | 12 ++++++------
>>>    1 file changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index f7118497e47a..d2d64bf17c96 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -871,10 +871,8 @@ EXPORT_SYMBOL(drm_sched_job_arm);
>>>    int drm_sched_job_add_dependency(struct drm_sched_job *job,
>>>                     struct dma_fence *fence)
>>>    {
>>> +    unsigned long index = -1;
>>>        struct dma_fence *entry;
>>> -    unsigned long index;
>>> -    u32 id = 0;
>>> -    int ret;
>>>          if (!fence)
>>>            return 0;
>>> @@ -896,11 +894,13 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
>>>            return 0;
>>>        }
>>>    -    ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, GFP_KERNEL);
>>> -    if (ret != 0)
>>> +    entry = xa_store(&job->dependencies, index + 1, fence, GFP_KERNEL);
>>
>>  From the code it looks index does not "move" for NULL slots?
> 
> Correct, but I just found out that the macro initializes index to zero, so that approach also doesn't work.
> 
> *sigh* going to look into this again tomorrow. It looks like this use case is somehow not well supported at all by xarray.

Back to the stub fence and __dma_fence_is_signaled()? ;)

Regards,

Tvrtko

>> That is, if someone:
>>
>> 1) Preallocates one entry, when trying to populate it index will be -1 after xa_for_each?
>>
>> 2) Add one, preallocate one, then add one more - index will be 0 after xa_for_each?
>>
>> Regards,
>>
>> Tvrtko
>>
>>> +    if (xa_is_err(entry))
>>>            dma_fence_put(fence);
>>> +    else
>>> +        WARN_ON(entry);
>>>    -    return ret;
>>> +    return xa_err(entry);
>>>    }
>>>    EXPORT_SYMBOL(drm_sched_job_add_dependency);
>>>    
>>
> 

