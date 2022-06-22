Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8667E554E76
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 17:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F4E10E75E;
	Wed, 22 Jun 2022 15:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 597681121A5;
 Wed, 22 Jun 2022 15:04:24 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id z19so7480446edb.11;
 Wed, 22 Jun 2022 08:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2li4/pLE7LM63l4LcpiN6LwdU2N2fqdhFrF9QE3WyCo=;
 b=HzpB6y7WIY695n/AuwfrXixif2eRw9KOYLIrxoxXNI3fkueka6S17crhSs1vtBu0A2
 FdCkDbuPmevmsU/hFckxAVQuqIaExXfjIQBPF+fcmjrfWAOhZYA5409PxBsU3zx9fIgu
 v0G4JzQwLNQ7J4f0stcw6f8iWaU2aKzoln+ltqZ+3WqQGBhuzyDPKrNURboPRdF0nRy9
 EJbqEpTehFofoxyA5bI1+L7U3P84Mpo1Yp1RpwJdgT2kT1YH+hgL2ZJm4vOU9v518JVT
 oAC5hAYu8rfyZbKEnSOo7tbLhjPntPLJCUwFVw30zM4YMgdBaac2Z+Miy8cT0P+1i/ZF
 c9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2li4/pLE7LM63l4LcpiN6LwdU2N2fqdhFrF9QE3WyCo=;
 b=cxreJxtR/zkmmyod553qwuLYEPGypTU8gojBBjnKYfyLuWK7bNvQuAu3yMmkswUwwm
 INgBw5/jNZEY4DxzQiClTyvqG4tWBFWMvG4MPA27SmxKQ2trba+8ra9bqhwwkOEENEH/
 PSy253zQ6LoACiwyaiUgMzB7HkovjqZmQiEcQMloQsmmcDWyq85HyMrMsjEUMu7LYaz8
 8IHqmrtRSJxD0huxEUHcedO/Eqh2nY9rrzS2NC6x8TCrvTaDWyH5206aQvS86qNR/CHl
 tPL+7mw7tQjbwNxssCsVPPZPIfaPnUyVoJAvkvymoMuElVAfzHLyo+NLqBuaVfZkwUFl
 nUHw==
X-Gm-Message-State: AJIora9NSn1RiCoBlxcpTYqPTM9Xi7ccH/WMcIsggx6kefq4lnjlyEdj
 +yohqszRaFayhyfz7DyyRJE=
X-Google-Smtp-Source: AGRyM1uDN6jBdkRPSpE6U+JBiXyEciLRNlL6o0rBv+LNCSuwLXPJWpXtDyWR2EaQ9qDkmOqkn0X63Q==
X-Received: by 2002:a50:fe15:0:b0:435:9155:f83b with SMTP id
 f21-20020a50fe15000000b004359155f83bmr4574823edt.391.1655910262821; 
 Wed, 22 Jun 2022 08:04:22 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:8f77:c83:6a3d:ee86?
 ([2a02:908:1256:79a0:8f77:c83:6a3d:ee86])
 by smtp.gmail.com with ESMTPSA id
 eg40-20020a05640228a800b004356d82b129sm11023845edb.80.2022.06.22.08.04.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 08:04:22 -0700 (PDT)
Message-ID: <16353a69-64e1-2f1c-8859-8000ac6266ce@gmail.com>
Date: Wed, 22 Jun 2022 17:04:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/5] drm/amdgpu: Fix possible refcount leak for release of
 external_hw_fence
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220620220302.86389-1-andrey.grodzovsky@amd.com>
 <20220620220302.86389-2-andrey.grodzovsky@amd.com>
 <2c70d0c4-a326-6497-54b2-51bc2b93b9d6@gmail.com>
 <91aba934-32f0-b1b9-b882-979ca02a1920@amd.com>
 <6d1acd76-dee8-29fd-dde3-bf51161792de@gmail.com>
 <445f2db4-5496-4003-c5fa-3605aef2c33d@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <445f2db4-5496-4003-c5fa-3605aef2c33d@amd.com>
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
Cc: jingwen.chen2@amd.com, Christian.Koenig@amd.com, monk.liu@amd.com,
 yiqing.yao@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.06.22 um 17:01 schrieb Andrey Grodzovsky:
>
> On 2022-06-22 05:00, Christian König wrote:
>> Am 21.06.22 um 21:34 schrieb Andrey Grodzovsky:
>>> On 2022-06-21 03:19, Christian König wrote:
>>>
>>>> Am 21.06.22 um 00:02 schrieb Andrey Grodzovsky:
>>>>> Problem:
>>>>> In amdgpu_job_submit_direct - The refcount should drop by 2
>>>>> but it drops only by 1.
>>>>>
>>>>> amdgpu_ib_sched->emit -> refcount 1 from first fence init
>>>>> dma_fence_get -> refcount 2
>>>>> dme_fence_put -> refcount 1
>>>>>
>>>>> Fix:
>>>>> Add put for external_hw_fence in amdgpu_job_free/free_cb
>>>>
>>>> Well what is the external_hw_fence good for in this construct?
>>>
>>>
>>> As far as I understand for direct submissions you don't want to pass 
>>> a job
>>> pointer to ib_schedule and so u can't use the embedded fence for 
>>> this case.
>>
>> Can you please look a bit deeper into this, we now have a couple of 
>> fields in the job structure which have no obvious use.
>>
>> I think we could pass a job structure to ib_schedule even for direct 
>> submit now.
>
>
> Are you sure  ? I see a lot of activities in amdgpu_ib_schedule depend 
> on presence of  vm and fence_ctx which are set if the job pointer 
> argument != NULL, might this have a negative impact on direct submit ?

Not 100% sure, but we did tons of workarounds because we didn't had a 
job pointer for direct submit.

But this was before we embedded the IBs at the end of the job.

It's quite likely that this should be possible now, it's just that 
somebody needs to double check.

Christian.

>
> Andrey
>
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Andrey
>>>
>>>
>>>>
>>>>>
>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>> ---
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 8 ++++++--
>>>>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c 
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>> index 10aa073600d4..58568fdde2d0 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>> @@ -152,8 +152,10 @@ static void amdgpu_job_free_cb(struct 
>>>>> drm_sched_job *s_job)
>>>>>       /* only put the hw fence if has embedded fence */
>>>>>       if (job->hw_fence.ops != NULL)
>>>>>           dma_fence_put(&job->hw_fence);
>>>>> -    else
>>>>> +    else {
>>>>
>>>> When one side of the if uses {} the other side should use {} as 
>>>> well, e.g. use } else { here.
>>>>
>>>> Christian.
>>>>
>>>>> + dma_fence_put(job->external_hw_fence);
>>>>>           kfree(job);
>>>>> +    }
>>>>>   }
>>>>>     void amdgpu_job_free(struct amdgpu_job *job)
>>>>> @@ -165,8 +167,10 @@ void amdgpu_job_free(struct amdgpu_job *job)
>>>>>       /* only put the hw fence if has embedded fence */
>>>>>       if (job->hw_fence.ops != NULL)
>>>>>           dma_fence_put(&job->hw_fence);
>>>>> -    else
>>>>> +    else {
>>>>> +        dma_fence_put(job->external_hw_fence);
>>>>>           kfree(job);
>>>>> +    }
>>>>>   }
>>>>>     int amdgpu_job_submit(struct amdgpu_job *job, struct 
>>>>> drm_sched_entity *entity,
>>>>
>>

