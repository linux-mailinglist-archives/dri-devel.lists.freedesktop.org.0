Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2B3512F1B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 10:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A78D10F943;
	Thu, 28 Apr 2022 08:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB7710F93A;
 Thu, 28 Apr 2022 08:56:19 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so5193262pjb.3; 
 Thu, 28 Apr 2022 01:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jVj6mBk3PN/ulzA3y0GywA8gTFf3UaQbkuhEKHdty7M=;
 b=iUtOY9E03pptMcMmUSXzSwFTV8y3BtT8BxtTRSAyjExpIZIMK1O3ZKxe2m62Ri46Tb
 t08dBb2ojvXrP8BsfKTfAAZCHkrWCii2XwV1cksnSmnI79RqbOlRTtUwPm+aYLYLAX1w
 EiWe1IrV6pPRpr0E0YM4Jy/nUcRERyxaIDiJhPNja1bgQIT8/roEfuCEq/gFlhEwEkuw
 lV6rmiZB4GBTNB1j8iJ81jHEpWciCIBDv2EeV72uyG46tRj9RelEaw1LdNkRjODVFwSR
 O6h7/rX7f34IDMMzLTqdf5uR27o2qkCFuYktJvDLzKYPGj+YafBDFnjAQmRPQO/XvDlp
 k+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jVj6mBk3PN/ulzA3y0GywA8gTFf3UaQbkuhEKHdty7M=;
 b=k79sE3bzlNTn2A2oeA4ykSGphrydtgQbeD7+uSYKNOae/IdDck+5qHCdm9UYka2zrG
 8BeJJS+sSdCQpkIScCCN+VnAiCsysnutRfygHQblh8LA+EXgTt/tCb1svNrF6u1vSmat
 QvRHVj/xp0c3IfC6OkhNYmcsUIpMxcrgXh6Tk6ep/5hxtmWZOMtAjqulGjwFvRjZB6F4
 dzHZuJicL0jwaqgOO/wMG1gGSENjlBtq4PDYZnNDrbXJaS1QDOGVVoT8JxBj8dQEZW+R
 zrjAu7HTiD/T+VSBJ5pWLMaJxTigs6hxGKtuN5tt5HefwrffNKAXjdsbiXCLPbp64TPj
 TGhA==
X-Gm-Message-State: AOAM533WcdCRZ2/cVRSp8BmCy1bZuWdWRQDvbfAFf2i65YeXXv1tFZ7X
 H6h8Q1/8px7S6jih1a40OX4=
X-Google-Smtp-Source: ABdhPJzkY3q0ECIyz2JkXDD6VgO3mpfuxQjWsGAkQXEJ2vE4iCnW+THtIl6ozuiFk/d95P/0KmmmNQ==
X-Received: by 2002:a17:90a:4581:b0:1bc:d215:8722 with SMTP id
 v1-20020a17090a458100b001bcd2158722mr48144334pjg.149.1651136178752; 
 Thu, 28 Apr 2022 01:56:18 -0700 (PDT)
Received: from [192.168.50.247] ([103.84.139.165])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a63b553000000b003c14af50616sm1915916pgo.46.2022.04.28.01.56.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 01:56:18 -0700 (PDT)
Message-ID: <d0790635-4b2e-cd58-0a51-36427800b39c@gmail.com>
Date: Thu, 28 Apr 2022 16:56:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] gpu: drm: remove redundant dma_fence_put() when
 drm_sched_job_add_dependency() fails
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, yuq825@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20220425083645.25922-1-hbh25y@gmail.com>
 <b7d8956e-5ac6-8200-d8b1-4ce828f04665@amd.com>
 <79b198d0-eff2-d658-4b5e-9084a834fc93@gmail.com>
 <e26e6ef8-6665-0b9d-804f-cf107f1788d4@amd.com>
 <88dd5d67-7dd5-2f58-5254-adaa941deb0f@gmail.com>
 <65b6cc23-1a77-7df0-5768-f81cd03b6514@amd.com>
From: Hangyu Hua <hbh25y@gmail.com>
In-Reply-To: <65b6cc23-1a77-7df0-5768-f81cd03b6514@amd.com>
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
Cc: lima@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022/4/27 22:43, Andrey Grodzovsky wrote:
> 
> On 2022-04-26 22:31, Hangyu Hua wrote:
>> On 2022/4/26 22:55, Andrey Grodzovsky wrote:
>>>
>>> On 2022-04-25 22:54, Hangyu Hua wrote:
>>>> On 2022/4/25 23:42, Andrey Grodzovsky wrote:
>>>>> On 2022-04-25 04:36, Hangyu Hua wrote:
>>>>>
>>>>>> When drm_sched_job_add_dependency() fails, dma_fence_put() will be 
>>>>>> called
>>>>>> internally. Calling it again after drm_sched_job_add_dependency() 
>>>>>> finishes
>>>>>> may result in a dangling pointer.
>>>>>>
>>>>>> Fix this by removing redundant dma_fence_put().
>>>>>>
>>>>>> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/lima/lima_gem.c        | 1 -
>>>>>>   drivers/gpu/drm/scheduler/sched_main.c | 1 -
>>>>>>   2 files changed, 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/lima/lima_gem.c 
>>>>>> b/drivers/gpu/drm/lima/lima_gem.c
>>>>>> index 55bb1ec3c4f7..99c8e7f6bb1c 100644
>>>>>> --- a/drivers/gpu/drm/lima/lima_gem.c
>>>>>> +++ b/drivers/gpu/drm/lima/lima_gem.c
>>>>>> @@ -291,7 +291,6 @@ static int lima_gem_add_deps(struct drm_file 
>>>>>> *file, struct lima_submit *submit)
>>>>>>           err = drm_sched_job_add_dependency(&submit->task->base, 
>>>>>> fence);
>>>>>>           if (err) {
>>>>>> -            dma_fence_put(fence);
>>>>>>               return err;
>>>>>
>>>>>
>>>>> Makes sense here
>>>>>
>>>>>
>>>>>>           }
>>>>>>       }
>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> index b81fceb0b8a2..ebab9eca37a8 100644
>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> @@ -708,7 +708,6 @@ int 
>>>>>> drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
>>>>>>           dma_fence_get(fence);
>>>>>>           ret = drm_sched_job_add_dependency(job, fence);
>>>>>>           if (ret) {
>>>>>> -            dma_fence_put(fence);
>>>>>
>>>>>
>>>>>
>>>>> Not sure about this one since if you look at the relevant commits -
>>>>> 'drm/scheduler: fix drm_sched_job_add_implicit_dependencies' and
>>>>> 'drm/scheduler: fix drm_sched_job_add_implicit_dependencies harder'
>>>>> You will see that the dma_fence_put here balances the extra 
>>>>> dma_fence_get
>>>>> above
>>>>>
>>>>> Andrey
>>>>>
>>>>
>>>> I don't think so. I checked the call chain and found no additional 
>>>> dma_fence_get(). But dma_fence_get() needs to be called before 
>>>> drm_sched_job_add_dependency() to keep the counter balanced. 
>>>
>>>
>>> I don't say there is an additional get, I just say that 
>>> drm_sched_job_add_dependency doesn't grab an extra reference to the 
>>> fences it stores so this needs to be done outside and for that
>>> drm_sched_job_add_implicit_dependencies->dma_fence_get is called and, 
>>> if this addition fails you just call dma_fence_put to keep the 
>>> counter balanced.
>>>
>>
>> drm_sched_job_add_implicit_dependencies() will call 
>> drm_sched_job_add_dependency(). And drm_sched_job_add_dependency() 
>> already call dma_fence_put() when it fails. Calling dma_fence_put() 
>> twice doesn't make sense.
>>
>> dma_fence_get() is in [2]. But dma_fence_put() will be called in [1] 
>> and [3] when xa_alloc() fails.
> 
> 
> The way I see it, [2] and [3] are mat matching *get* and *put* 
> respectively. [1] *put* is against the original 
> dma_fence_init->kref_init of the fence which always set the refcount at 1.
> Also in support of this see commit 'drm/scheduler: fix 
> drm_sched_job_add_implicit_dependencies harder' - it says there 
> "drm_sched_job_add_dependency() could drop the last ref"  - this last 
> ref is the original refcount set by dma_fence_init->kref
> 
> Andrey


You can see that drm_sched_job_add_dependency() has three return paths 
they are [4], [5] and [1]. [4] and [5] will return 0. [1] will return error.

There will be three weird problems if you're right:

1. [5] path will triger a refcount leak beacause ret is 0 in *if*[6]. 
Otherwise [2] and [5] are matching *get* and *put* in here.

2. [4] path need a additional dma_fence_get() to adds the fence as a job 
dependency. fence is from obj->resv. Taking msm as an example obj->resv 
is from etnaviv_ioctl_gem_submit()->submit_lookup_objects(). It is not 
possible that an object has *refcount == 1* but is referenced in two 
places. So dma_fence_get() called in [2] is for [4]. By the way, [3] 
don't execute in this case.

3. This one is a doubt. You can see in "[PATCH] drm/scheduler: fix 
drm_sched_job_add_implicit_dependencies harder". 
drm_sched_job_add_dependency() could drop the last ref, so we need to do
the dma_fence_get() first. But the last ref still will drop in [3] if 
drm_sched_job_add_dependency() go path [1]. And there is only a *return* 
between [1] and [3]. Is this necessary? I think Rob Clark wants to avoid 
the last ref being dropped in drm_sched_job_add_implicit_dependencies() 
because fence is still used by obj->resv.


int drm_sched_job_add_dependency(struct drm_sched_job *job,
                                  struct dma_fence *fence)
{
         ...
         xa_for_each(&job->dependencies, index, entry) {
                 if (entry->context != fence->context)
                         continue;

                 if (dma_fence_is_later(fence, entry)) {
                         dma_fence_put(entry);
                         xa_store(&job->dependencies, index, fence, 
GFP_KERNEL);	<---- [4]
                 } else {
                         dma_fence_put(fence);	<---- [5]
                 }
                 return 0;
         }

         ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, 
GFP_KERNEL);
         if (ret != 0)
                 dma_fence_put(fence);   <---- [1]

         return ret;
}


int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
                                             struct drm_gem_object *obj,
                                             bool write)
{
         struct dma_resv_iter cursor;
         struct dma_fence *fence;
         int ret;

         dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
                 /* Make sure to grab an additional ref on the added 
fence */
                 dma_fence_get(fence);   <---- [2]
                 ret = drm_sched_job_add_dependency(job, fence);
                 if (ret) {      <---- [6]
                         dma_fence_put(fence);   <---- [3]

                         return ret;
                 }
         }
         return 0;
}

Thanks,
hangyu

> 
>>
>>
>> int drm_sched_job_add_dependency(struct drm_sched_job *job,
>>                  struct dma_fence *fence)
>> {
>>     ...
>>     ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, 
>> GFP_KERNEL);
>>     if (ret != 0)
>>         dma_fence_put(fence);    <--- [1]
>>
>>     return ret;
>> }
>> EXPORT_SYMBOL(drm_sched_job_add_dependency);
>>
>>
>> int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
>>                         struct drm_gem_object *obj,
>>                         bool write)
>> {
>>     struct dma_resv_iter cursor;
>>     struct dma_fence *fence;
>>     int ret;
>>
>>     dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
>>         /* Make sure to grab an additional ref on the added fence */
>>         dma_fence_get(fence);    <--- [2]
>>         ret = drm_sched_job_add_dependency(job, fence);
>>         if (ret) {
>>             dma_fence_put(fence);    <--- [3]
>>             return ret;
>>         }
>>     }
>>     return 0;
>> }
>>
>>
>>>
>>>> On the other hand, dma_fence_get() and dma_fence_put() are 
>>>> meaningless here if threre is an extra dma_fence_get() beacause 
>>>> counter will not decrease to 0 during drm_sched_job_add_dependency().
>>>>
>>>> I check the call chain as follows:
>>>>
>>>> msm_ioctl_gem_submit()
>>>> -> submit_fence_sync()
>>>> -> drm_sched_job_add_implicit_dependencies()
>>>
>>>
>>> Can you maybe trace or print one such example of problematic refcount 
>>> that you are trying to fix ? I still don't see where is the problem.
>>>
>>> Andrey
>>>
>>
>> I also wish I could. System logs can make this easy. But i don't have 
>> a corresponding GPU physical device. 
>> drm_sched_job_add_implicit_dependencies is only used in a few devices.
>>
>> Thanks.
>>>
>>>>
>>>> Thanks,
>>>> Hangyu
>>>>
>>>>>
>>>>>>               return ret;
>>>>>>           }
>>>>>>       }
