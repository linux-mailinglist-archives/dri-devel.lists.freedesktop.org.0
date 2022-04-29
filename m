Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A3A5140BD
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 05:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB59210EC39;
	Fri, 29 Apr 2022 03:03:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C009910F619;
 Fri, 29 Apr 2022 03:03:31 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id k14so5549323pga.0;
 Thu, 28 Apr 2022 20:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KwG0dBZAtUlJq4flAZ0bcC8rm0sfzvBpurp6isyuVBA=;
 b=TnrvclRCXJuSLVLTamfGkcqixDJgV3F2Tp4XJK7Z1XxhiP+jQP1AB1xT8k3aDDGkI2
 W08WTwz+Kc5JsncQtMRJnVGrhyZAZQD8os1T6+G5rJ0ik362CejOYoO5N9sQ/n+j5YWP
 nxiuBoquNJbxMRT1iO+u2etLWDmxe43oTpMytBo9lq1fvjvLdaQ512jthQXYG8Oj/3rK
 +uwbTkxx60XnW++MoENfsnpp8h6fYcV6jqN2ZoAHzl3w3OIKv02Djgfs32S1+l8C0fpE
 iDMOqMUZXybAgnSG8ik+b6XIlpUJkdvE+PLfoPw0hQhv8H0PnZq0YFrQc7aUOQS1y0kG
 miUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KwG0dBZAtUlJq4flAZ0bcC8rm0sfzvBpurp6isyuVBA=;
 b=VzNtHlsxdoTBSXqU0gVDC/cpgpJH6DARW3Z8YE/4A1UPwK9wrdmB384WeQ6S2zmzbc
 dfgq5FaEjM5pm0S4v4rOgdJ+ony9G/aMONUbvNp0wTtV7IhQK3yy3Z1aaf9ttQGGsqYH
 6nQfezr8tA4eV8CHH/Ch9EGs1S2oDfNhHlbo8nqTR5j/uYHQmTkVFn+ALN12RW9PCMSN
 eQEsy7HRGbxI4rYXT7Bzytk0d+dkJop1ncANVsdbotVvE2Gibcl8WV2flrhzWJkbNN8p
 dqDfH506+EGcn06SuN64DI3ePu19OAcp8cJFGi7BQEnwi0wBdufUhd3f5jtHb2uOwU/A
 y4vQ==
X-Gm-Message-State: AOAM532zdlvA7EaJ1XVp8edaMPCKBV8jm6foPtCeMK9fhIrLMWVfTeO0
 MXFora62qMYCHrJtfyEqC6c=
X-Google-Smtp-Source: ABdhPJyAz8st7YtkDR71dQ1qCyeF6Uw6tFchg6fIQC3YjvC/7Shtyawb8tu0nMu0b9EWESccQXfMcQ==
X-Received: by 2002:a63:83c6:0:b0:3ab:5027:374b with SMTP id
 h189-20020a6383c6000000b003ab5027374bmr19044037pge.284.1651201410961; 
 Thu, 28 Apr 2022 20:03:30 -0700 (PDT)
Received: from [192.168.50.247] ([103.84.139.165])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a63d804000000b003c14af50604sm4292847pgh.28.2022.04.28.20.03.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 20:03:30 -0700 (PDT)
Message-ID: <37a48008-0700-7c60-30d6-ac2f4152114c@gmail.com>
Date: Fri, 29 Apr 2022 11:03:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
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
 <d0790635-4b2e-cd58-0a51-36427800b39c@gmail.com>
 <9b91e06c-50fd-b567-7d2b-a2597d01c4dc@amd.com>
From: Hangyu Hua <hbh25y@gmail.com>
In-Reply-To: <9b91e06c-50fd-b567-7d2b-a2597d01c4dc@amd.com>
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

On 2022/4/28 23:27, Andrey Grodzovsky wrote:
> 
> On 2022-04-28 04:56, Hangyu Hua wrote:
>> On 2022/4/27 22:43, Andrey Grodzovsky wrote:
>>>
>>> On 2022-04-26 22:31, Hangyu Hua wrote:
>>>> On 2022/4/26 22:55, Andrey Grodzovsky wrote:
>>>>>
>>>>> On 2022-04-25 22:54, Hangyu Hua wrote:
>>>>>> On 2022/4/25 23:42, Andrey Grodzovsky wrote:
>>>>>>> On 2022-04-25 04:36, Hangyu Hua wrote:
>>>>>>>
>>>>>>>> When drm_sched_job_add_dependency() fails, dma_fence_put() will 
>>>>>>>> be called
>>>>>>>> internally. Calling it again after 
>>>>>>>> drm_sched_job_add_dependency() finishes
>>>>>>>> may result in a dangling pointer.
>>>>>>>>
>>>>>>>> Fix this by removing redundant dma_fence_put().
>>>>>>>>
>>>>>>>> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
>>>>>>>> ---
>>>>>>>>   drivers/gpu/drm/lima/lima_gem.c        | 1 -
>>>>>>>>   drivers/gpu/drm/scheduler/sched_main.c | 1 -
>>>>>>>>   2 files changed, 2 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/lima/lima_gem.c 
>>>>>>>> b/drivers/gpu/drm/lima/lima_gem.c
>>>>>>>> index 55bb1ec3c4f7..99c8e7f6bb1c 100644
>>>>>>>> --- a/drivers/gpu/drm/lima/lima_gem.c
>>>>>>>> +++ b/drivers/gpu/drm/lima/lima_gem.c
>>>>>>>> @@ -291,7 +291,6 @@ static int lima_gem_add_deps(struct drm_file 
>>>>>>>> *file, struct lima_submit *submit)
>>>>>>>>           err = 
>>>>>>>> drm_sched_job_add_dependency(&submit->task->base, fence);
>>>>>>>>           if (err) {
>>>>>>>> -            dma_fence_put(fence);
>>>>>>>>               return err;
>>>>>>>
>>>>>>>
>>>>>>> Makes sense here
>>>>>>>
>>>>>>>
>>>>>>>>           }
>>>>>>>>       }
>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>>>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> index b81fceb0b8a2..ebab9eca37a8 100644
>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> @@ -708,7 +708,6 @@ int 
>>>>>>>> drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
>>>>>>>>           dma_fence_get(fence);
>>>>>>>>           ret = drm_sched_job_add_dependency(job, fence);
>>>>>>>>           if (ret) {
>>>>>>>> -            dma_fence_put(fence);
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> Not sure about this one since if you look at the relevant commits -
>>>>>>> 'drm/scheduler: fix drm_sched_job_add_implicit_dependencies' and
>>>>>>> 'drm/scheduler: fix drm_sched_job_add_implicit_dependencies harder'
>>>>>>> You will see that the dma_fence_put here balances the extra 
>>>>>>> dma_fence_get
>>>>>>> above
>>>>>>>
>>>>>>> Andrey
>>>>>>>
>>>>>>
>>>>>> I don't think so. I checked the call chain and found no additional 
>>>>>> dma_fence_get(). But dma_fence_get() needs to be called before 
>>>>>> drm_sched_job_add_dependency() to keep the counter balanced. 
>>>>>
>>>>>
>>>>> I don't say there is an additional get, I just say that 
>>>>> drm_sched_job_add_dependency doesn't grab an extra reference to the 
>>>>> fences it stores so this needs to be done outside and for that
>>>>> drm_sched_job_add_implicit_dependencies->dma_fence_get is called 
>>>>> and, if this addition fails you just call dma_fence_put to keep the 
>>>>> counter balanced.
>>>>>
>>>>
>>>> drm_sched_job_add_implicit_dependencies() will call 
>>>> drm_sched_job_add_dependency(). And drm_sched_job_add_dependency() 
>>>> already call dma_fence_put() when it fails. Calling dma_fence_put() 
>>>> twice doesn't make sense.
>>>>
>>>> dma_fence_get() is in [2]. But dma_fence_put() will be called in [1] 
>>>> and [3] when xa_alloc() fails.
>>>
>>>
>>> The way I see it, [2] and [3] are mat matching *get* and *put* 
>>> respectively. [1] *put* is against the original 
>>> dma_fence_init->kref_init of the fence which always set the refcount 
>>> at 1.
>>> Also in support of this see commit 'drm/scheduler: fix 
>>> drm_sched_job_add_implicit_dependencies harder' - it says there 
>>> "drm_sched_job_add_dependency() could drop the last ref"  - this last 
>>> ref is the original refcount set by dma_fence_init->kref
>>>
>>> Andrey
>>
>>
>> You can see that drm_sched_job_add_dependency() has three return paths 
>> they are [4], [5] and [1]. [4] and [5] will return 0. [1] will return 
>> error.
>>
>> There will be three weird problems if you're right:
>>
>> 1. [5] path will triger a refcount leak beacause ret is 0 in *if*[6]. 
> 
> 
> Terminology confusion issue - [5] is a 'put' so it cannot cause a leak 
> by definition, extra unbalanced 'get' will cause a leak because memory 
> is never released, extra put will just probably cause a warning in 
> kref_put or maybe double free.
> 
> 
>> Otherwise [2] and [5] are matching *get* and *put* in here.
> 
> 
> Exactly, they are matching - so until this point all good and no 'leak' 
> then, no ?
> 

In fact, i just want to prove that [2] and [3] are not a matching pair 
when the path go [4] or [5]. It's less likely when the path is [1]. But 
it doesn't matter, please see my explanation below.

> 
>>
>> 2. [4] path need a additional dma_fence_get() to adds the fence as a 
>> job dependency. fence is from obj->resv. Taking msm as an example 
>> obj->resv is from etnaviv_ioctl_gem_submit()->submit_lookup_objects(). 
>> It is not possible that an object has *refcount == 1* but is 
>> referenced in two places. So dma_fence_get() called in [2] is for [4]. 
>> By the way, [3] don't execute in this case.
> 
> 
> Still don't see the problem - [2] is the additional dma_fence_get() you 
> need here (just as you say above).
> 
> 
>>
>> 3. This one is a doubt. You can see in "[PATCH] drm/scheduler: fix 
>> drm_sched_job_add_implicit_dependencies harder". 
>> drm_sched_job_add_dependency() could drop the last ref, so we need to do
>> the dma_fence_get() first. But the last ref still will drop in [3] if 
>> drm_sched_job_add_dependency() go path [1]. And there is only a 
>> *return* between [1] and [3]. Is this necessary? I think Rob Clark 
>> wants to avoid the last ref being dropped in 
>> drm_sched_job_add_implicit_dependencies() because fence is still used 
>> by obj->resv.
> 
> 
> In the scenario above - if we go thorough path [1] refcount before [1] 
> starts is 2 - one from original kref_init and one from [2] and so it's 
> balanced against 2 puts (one from [1] and one from [3]) so I still don't 
> see a problem.
>

We can't directly drop the last refcount and release fence in 
drm_sched_job_add_implicit_dependencies. fence is from obj->resv. Taking 
msm as an example obj->resv is from 
msm_ioctl_gem_submit()->submit_lookup_objects().

static int submit_lookup_objects(struct msm_gem_submit *submit,
		struct drm_msm_gem_submit *args, struct drm_file *file)
{
	...
	for (i = 0; i < args->nr_bos; i++) {
		struct drm_gem_object *obj;

		/* normally use drm_gem_object_lookup(), but for bulk lookup
		 * all under single table_lock just hit object_idr directly:
		 */
		obj = idr_find(&file->object_idr, submit->bos[i].handle);		<---- we 
find obj in here by a user controllable handle
		if (!obj) {
			DRM_ERROR("invalid handle %u at index %u\n", submit->bos[i].handle, i);
			ret = -EINVAL;
			goto out_unlock;
		}

		drm_gem_object_get(obj);

		submit->bos[i].obj = to_msm_bo(obj);	<---- we store it
	}
	...
}

Taking msm as an example, the patch to call 
drm_sched_job_add_implicit_dependencies() is 
msm_ioctl_gem_submit()->submit_fence_sync().

static int submit_fence_sync(struct msm_gem_submit *submit, bool 
no_implicit)
{
	int i, ret = 0;

	for (i = 0; i < submit->nr_bos; i++) {
		struct drm_gem_object *obj = &submit->bos[i].obj->base;	<---- get the obj
	...
		ret = drm_sched_job_add_implicit_dependencies(&submit->base,
							      obj,
							      write);
		if (ret)
			break;
	}

	return ret;
}

If fence is released in drm_sched_job_add_implicit_dependencies(), a 
dangling pointer will be in obj->resv.

specific scenario:
recount = 1 init, obj->resv->fence_excl = fence
recount = 1 before drm_sched_job_add_implicit_dependencies
recount = 2 in [2]
recount = 1 in [1]
recount = 0 in [3] <--- fence release. But fence still in obj->resv

Thanks,
Hangyu

> I suggest that you give a specific scenario  from fence ref-count 
> perspective that your patch fixes. I might be wrong but unless you give 
> a specific case where the 'put' in [3] is redundant I just can't see it.
> 
> Andrey >
> 
>>
>>
>> int drm_sched_job_add_dependency(struct drm_sched_job *job,
>>                                  struct dma_fence *fence)
>> {
>>         ...
>>         xa_for_each(&job->dependencies, index, entry) {
>>                 if (entry->context != fence->context)
>>                         continue;
>>
>>                 if (dma_fence_is_later(fence, entry)) {
>>                         dma_fence_put(entry);
>>                         xa_store(&job->dependencies, index, fence, 
>> GFP_KERNEL);    <---- [4]
>>                 } else {
>>                         dma_fence_put(fence);    <---- [5]
>>                 }
>>                 return 0;
>>         }
>>
>>         ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, 
>> GFP_KERNEL);
>>         if (ret != 0)
>>                 dma_fence_put(fence);   <---- [1]
>>
>>         return ret;
>> }
>>
>>
>> int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
>>                                             struct drm_gem_object *obj,
>>                                             bool write)
>> {
>>         struct dma_resv_iter cursor;
>>         struct dma_fence *fence;
>>         int ret;
>>
>>         dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
>>                 /* Make sure to grab an additional ref on the added 
>> fence */
>>                 dma_fence_get(fence);   <---- [2]
>>                 ret = drm_sched_job_add_dependency(job, fence);
>>                 if (ret) {      <---- [6]
>>                         dma_fence_put(fence);   <---- [3]
>>
>>                         return ret;
>>                 }
>>         }
>>         return 0;
>> }
>>
>> Thanks,
>> hangyu
>>
>>>
>>>>
>>>>
>>>> int drm_sched_job_add_dependency(struct drm_sched_job *job,
>>>>                  struct dma_fence *fence)
>>>> {
>>>>     ...
>>>>     ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, 
>>>> GFP_KERNEL);
>>>>     if (ret != 0)
>>>>         dma_fence_put(fence);    <--- [1]
>>>>
>>>>     return ret;
>>>> }
>>>> EXPORT_SYMBOL(drm_sched_job_add_dependency);
>>>>
>>>>
>>>> int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
>>>>                         struct drm_gem_object *obj,
>>>>                         bool write)
>>>> {
>>>>     struct dma_resv_iter cursor;
>>>>     struct dma_fence *fence;
>>>>     int ret;
>>>>
>>>>     dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
>>>>         /* Make sure to grab an additional ref on the added fence */
>>>>         dma_fence_get(fence);    <--- [2]
>>>>         ret = drm_sched_job_add_dependency(job, fence);
>>>>         if (ret) {
>>>>             dma_fence_put(fence);    <--- [3]
>>>>             return ret;
>>>>         }
>>>>     }
>>>>     return 0;
>>>> }
>>>>
>>>>
>>>>>
>>>>>> On the other hand, dma_fence_get() and dma_fence_put() are 
>>>>>> meaningless here if threre is an extra dma_fence_get() beacause 
>>>>>> counter will not decrease to 0 during drm_sched_job_add_dependency().
>>>>>>
>>>>>> I check the call chain as follows:
>>>>>>
>>>>>> msm_ioctl_gem_submit()
>>>>>> -> submit_fence_sync()
>>>>>> -> drm_sched_job_add_implicit_dependencies()
>>>>>
>>>>>
>>>>> Can you maybe trace or print one such example of problematic 
>>>>> refcount that you are trying to fix ? I still don't see where is 
>>>>> the problem.
>>>>>
>>>>> Andrey
>>>>>
>>>>
>>>> I also wish I could. System logs can make this easy. But i don't 
>>>> have a corresponding GPU physical device. 
>>>> drm_sched_job_add_implicit_dependencies is only used in a few devices.
>>>>
>>>> Thanks.
>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>> Hangyu
>>>>>>
>>>>>>>
>>>>>>>>               return ret;
>>>>>>>>           }
>>>>>>>>       }
