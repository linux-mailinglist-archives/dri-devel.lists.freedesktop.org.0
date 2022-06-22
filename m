Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E59C5544C0
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 11:00:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BD810E6F8;
	Wed, 22 Jun 2022 09:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE5610E67B;
 Wed, 22 Jun 2022 09:00:47 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id z11so16767360edp.9;
 Wed, 22 Jun 2022 02:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZSrjBcq+xVI2Tq2esk3UlZQ9meYAvS1lMgIesO1n3Z8=;
 b=h8RKlG1rHkT6jZCHsUrhUFfzY4Pis4FbgxrGEHFwUuOKk0e3Sc6Nx+s/Myahxn8Wyk
 +5iBK+At5Byvi8Gjh2uAalMETu/PNaJ+HCOpAyRcosbtvizkEB7kMPH7e4oQk7h/dLWX
 JG84AK+JpBO1c1gcxtfbZMtOqyPQGdXFJ+TFuZTj7F0sDM+IOReR2fTxyF/LjuXaQDdk
 wWlF7la/mV0SgKO79fRu+1DgOs9z5n5oRH8qylNfAIyKpfZFg/9zXibsYXB9OYUFLJOt
 /wvFugnqyqt8/+H61hMNP0WWDn7h8ngRB6bNpaH5SIzWrFvMk2tOOwSRLkVWhKZS7CWO
 JwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZSrjBcq+xVI2Tq2esk3UlZQ9meYAvS1lMgIesO1n3Z8=;
 b=2VdUm2yrES7Aw6R829BSz1ZAr8+fVOQSdGCInMfel7ssomc4l4bkMghT4/RHkjngXx
 pS3u9CK102oum77XRIjHHwdnI4gHgdOhl4hUdb9k9XHzsjYQCgpqyJ7n7ahieFN7LqBG
 4mePQFWoJ3/yXnwCKNgaly07WPDVcnnmODEkqXkmiDPjEaFZvfmpqOTaZUW4jmkK3U2x
 E+fPAl1IKu+T6gu9B1sLBxLe8LMEt2TsKBVTRhLCPC4+42ZNYapClp10+s9J7rIjQaJm
 rjPQMI8IZ2AdkwMcitvrXx5SpFZgBohiSSznRtAs0LMv5l2IJh/ee9LJZGSEflTgz5N2
 bcKA==
X-Gm-Message-State: AJIora9kIaCPHp5h67A9XY+dSGhv79II2OKp2VXF0ZvauPtMfDY4pBCV
 b9px20D5Ih3PT3/2kbMum6laWMUw0m4=
X-Google-Smtp-Source: AGRyM1tVmfBwM0QGdTXeAI/S1FlEkd/b07/w6cfcwBUG+h/Z6TC6wjIz4uwS4PJTZM+NU5zC5jC9vg==
X-Received: by 2002:a05:6402:3713:b0:435:539e:a939 with SMTP id
 ek19-20020a056402371300b00435539ea939mr2860095edb.160.1655888446307; 
 Wed, 22 Jun 2022 02:00:46 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:8f77:c83:6a3d:ee86?
 ([2a02:908:1256:79a0:8f77:c83:6a3d:ee86])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a170906078b00b00722f069fd40sm650870ejc.159.2022.06.22.02.00.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 02:00:45 -0700 (PDT)
Message-ID: <6d1acd76-dee8-29fd-dde3-bf51161792de@gmail.com>
Date: Wed, 22 Jun 2022 11:00:44 +0200
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <91aba934-32f0-b1b9-b882-979ca02a1920@amd.com>
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

Am 21.06.22 um 21:34 schrieb Andrey Grodzovsky:
> On 2022-06-21 03:19, Christian König wrote:
>
>> Am 21.06.22 um 00:02 schrieb Andrey Grodzovsky:
>>> Problem:
>>> In amdgpu_job_submit_direct - The refcount should drop by 2
>>> but it drops only by 1.
>>>
>>> amdgpu_ib_sched->emit -> refcount 1 from first fence init
>>> dma_fence_get -> refcount 2
>>> dme_fence_put -> refcount 1
>>>
>>> Fix:
>>> Add put for external_hw_fence in amdgpu_job_free/free_cb
>>
>> Well what is the external_hw_fence good for in this construct?
>
>
> As far as I understand for direct submissions you don't want to pass a 
> job
> pointer to ib_schedule and so u can't use the embedded fence for this 
> case.

Can you please look a bit deeper into this, we now have a couple of 
fields in the job structure which have no obvious use.

I think we could pass a job structure to ib_schedule even for direct 
submit now.

Regards,
Christian.

>
> Andrey
>
>
>>
>>>
>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 8 ++++++--
>>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> index 10aa073600d4..58568fdde2d0 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> @@ -152,8 +152,10 @@ static void amdgpu_job_free_cb(struct 
>>> drm_sched_job *s_job)
>>>       /* only put the hw fence if has embedded fence */
>>>       if (job->hw_fence.ops != NULL)
>>>           dma_fence_put(&job->hw_fence);
>>> -    else
>>> +    else {
>>
>> When one side of the if uses {} the other side should use {} as well, 
>> e.g. use } else { here.
>>
>> Christian.
>>
>>> + dma_fence_put(job->external_hw_fence);
>>>           kfree(job);
>>> +    }
>>>   }
>>>     void amdgpu_job_free(struct amdgpu_job *job)
>>> @@ -165,8 +167,10 @@ void amdgpu_job_free(struct amdgpu_job *job)
>>>       /* only put the hw fence if has embedded fence */
>>>       if (job->hw_fence.ops != NULL)
>>>           dma_fence_put(&job->hw_fence);
>>> -    else
>>> +    else {
>>> +        dma_fence_put(job->external_hw_fence);
>>>           kfree(job);
>>> +    }
>>>   }
>>>     int amdgpu_job_submit(struct amdgpu_job *job, struct 
>>> drm_sched_entity *entity,
>>

