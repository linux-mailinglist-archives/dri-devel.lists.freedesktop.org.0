Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2272BD23017
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 09:07:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B760A10E6F1;
	Thu, 15 Jan 2026 08:07:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="FgczCj3p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C130610E6F1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 08:07:30 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-47ee3a63300so5880435e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 00:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1768464449; x=1769069249; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8UBmo5KUk3xIXDKd62Sr8UlfE//oqO1e94w982O9P7k=;
 b=FgczCj3ph+vteTt4kHZNuOachW1mlqPfLBN4GAMsyxEceEXFqgXom/RmPGDDt7qfDO
 7l4ctb7lWDus6G6GVma0uxuVAPsSCTeQnxyRmliZ7Tr76XIsvkMbe05rNV9YGC0Q4ja2
 ONSE9NNHMYVRpavNx0tH5Gi7PZvpcp4UUJEedTko7CbJhdN71qT8hLZa0kuvCanjQ1wD
 EoRm1zFgR3HIl4mHh3AssWeCRXBCBTTk5PbIxR6BdvNHa/0OK0cG8Ff5Jn3CRJmdG3ED
 7S2ZCINyQZE1w0dBBTUM9K2tC1q8OUnjOrVSC/x/0cjgk6f0yf/Q2TvqT+P1b/mYGgI9
 Sz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768464449; x=1769069249;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8UBmo5KUk3xIXDKd62Sr8UlfE//oqO1e94w982O9P7k=;
 b=oty0QwDtQlJ5Op1scWMBWqpaaagmuH3ZAJ1zCThjqGK0s6aeEINfn1RY9IcmAfFU57
 zS452NIt9nzGre2q0siK37OqLpWoaUTR7knRcc7p3SXpUXF0xPgoMnoSzeQ+kzfNw3H8
 M1TP4KNtpDeDX3G5/z+ra6Dmb7ykOK9oQUNqcMQP5gwWTD3KQ02Xb9UMw1ahHWOvTmTQ
 2IlZ0ox+R7lbILNGM90aFVV6YLC3iA2ammmOhudImvJmC2xPR/q5zyHR+YgCmavNTXid
 cJBTAmtNsXEuQ8zeFOx0QIafeDOBzQP6ipPb6GdWsZiMXaVjAK4BxIg8aLkv5T2hzuCG
 1ysQ==
X-Gm-Message-State: AOJu0Yx93wJH4mlBkvFSFuWCfgw3XRUlVcurLkDmeC4mROWEyf4mVAj4
 1FxUTuKl/HT9TaWPJ85+ZikQSWQAhxsIlWr8hqrgn5JwX6SlKY7s3KKuyzZ6Z6H2LnE=
X-Gm-Gg: AY/fxX4iXFKW7O8aIybAHmp+SpTPWmB8SZxodYkwU44NTd9Szk5Sba0Yikyl5+/QVca
 W0TUnBYunUUq6B2stLP9t2R66o8kPIbPuNg/zfHM4JMDq40SvV64JE4vXDgY54/MTcE1b2p24Jo
 O8lC9P7b0e0mJByVhnvz7Yzff3wf/hfdUZfxNUmxSkMchMenfi8HaMvbBSat1zE+1CFEf18Xlh/
 T7kvl8zdF3D+urNi36k+ZO8jIWTcc+v93o1g2zP4vrxDviUkl7LJuGbfy+DXOFC1Luf6Mghn18g
 1f4O71Jh8fAMSTIX4qW5fDNxqaFurjVQgdGcwoNW4M7qU1bE7rqCzE1Q/fONDq6VCe8Z7Dhj9eM
 /qaQQVLvO2JiIlJczqp3s8LsZNEbcna1aaFeET7+WahdeN3WVUBi7qxKckH/4kTKqJDPb3BC/tx
 wdRgU74wiiIyG2fEj2kVl8yw7L1f8hdscr
X-Received: by 2002:a05:600c:3e8d:b0:475:e067:f23d with SMTP id
 5b1f17b1804b1-47ee338a3f4mr64007495e9.25.1768464449245; 
 Thu, 15 Jan 2026 00:07:29 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af64a6c0sm4260169f8f.5.2026.01.15.00.07.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 00:07:28 -0800 (PST)
Message-ID: <ad552640-3e39-4fac-bd1c-91280cdbd302@ursulin.net>
Date: Thu, 15 Jan 2026 08:07:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] dma-buf: add dma_fence_is_initialized function
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20260113152125.47380-1-christian.koenig@amd.com>
 <20260113152125.47380-3-christian.koenig@amd.com>
 <b85f053e-e26c-4762-b7f3-d8b1a58a3a41@ursulin.net>
 <eb79bf68-a08f-49f3-b287-9e95831cee21@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <eb79bf68-a08f-49f3-b287-9e95831cee21@gmail.com>
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


On 14/01/2026 11:39, Christian König wrote:
> On 1/14/26 10:53, Tvrtko Ursulin wrote:
>> \
>> On 13/01/2026 15:16, Christian König wrote:
>>> Some driver use fence->ops to test if a fence was initialized or not.
>>> The problem is that this utilizes internal behavior of the dma_fence
>>> implementation.
>>>
>>> So better abstract that into a function.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 13 +++++++------
>>>    drivers/gpu/drm/qxl/qxl_release.c       |  2 +-
>>>    include/linux/dma-fence.h               | 12 ++++++++++++
>>>    3 files changed, 20 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> index 0a0dcbf0798d..b97f90bbe8b9 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> @@ -278,9 +278,10 @@ void amdgpu_job_free_resources(struct amdgpu_job *job)
>>>        unsigned i;
>>>          /* Check if any fences were initialized */
>>> -    if (job->base.s_fence && job->base.s_fence->finished.ops)
>>> +    if (job->base.s_fence &&
>>> +        dma_fence_is_initialized(&job->base.s_fence->finished))
>>>            f = &job->base.s_fence->finished;
>>> -    else if (job->hw_fence && job->hw_fence->base.ops)
>>> +    else if (dma_fence_is_initialized(&job->hw_fence->base))
>>>            f = &job->hw_fence->base;
>>>        else
>>>            f = NULL;
>>> @@ -297,11 +298,11 @@ static void amdgpu_job_free_cb(struct drm_sched_job *s_job)
>>>          amdgpu_sync_free(&job->explicit_sync);
>>>    -    if (job->hw_fence->base.ops)
>>> +    if (dma_fence_is_initialized(&job->hw_fence->base))
>>>            dma_fence_put(&job->hw_fence->base);
>>>        else
>>>            kfree(job->hw_fence);
>>> -    if (job->hw_vm_fence->base.ops)
>>> +    if (dma_fence_is_initialized(&job->hw_vm_fence->base))
>>>            dma_fence_put(&job->hw_vm_fence->base);
>>>        else
>>>            kfree(job->hw_vm_fence);
>>> @@ -335,11 +336,11 @@ void amdgpu_job_free(struct amdgpu_job *job)
>>>        if (job->gang_submit != &job->base.s_fence->scheduled)
>>>            dma_fence_put(job->gang_submit);
>>>    -    if (job->hw_fence->base.ops)
>>> +    if (dma_fence_is_initialized(&job->hw_fence->base))
>>>            dma_fence_put(&job->hw_fence->base);
>>>        else
>>>            kfree(job->hw_fence);
>>> -    if (job->hw_vm_fence->base.ops)
>>> +    if (dma_fence_is_initialized(&job->hw_vm_fence->base))
>>>            dma_fence_put(&job->hw_vm_fence->base);
>>>        else
>>>            kfree(job->hw_vm_fence);
>>> diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
>>> index 7b3c9a6016db..b38ae0b25f3c 100644
>>> --- a/drivers/gpu/drm/qxl/qxl_release.c
>>> +++ b/drivers/gpu/drm/qxl/qxl_release.c
>>> @@ -146,7 +146,7 @@ qxl_release_free(struct qxl_device *qdev,
>>>        idr_remove(&qdev->release_idr, release->id);
>>>        spin_unlock(&qdev->release_idr_lock);
>>>    -    if (release->base.ops) {
>>> +    if (dma_fence_is_initialized(&release->base)) {
>>>            WARN_ON(list_empty(&release->bos));
>>>            qxl_release_free_list(release);
>>>    diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>> index eea674acdfa6..371aa8ecf18e 100644
>>> --- a/include/linux/dma-fence.h
>>> +++ b/include/linux/dma-fence.h
>>> @@ -274,6 +274,18 @@ void dma_fence_release(struct kref *kref);
>>>    void dma_fence_free(struct dma_fence *fence);
>>>    void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq);
>>>    +/**
>>> + * dma_fence_is_initialized - test if fence was initialized
>>> + * @fence: fence to test
>>> + *
>>> + * Return: True if fence was initialized, false otherwise. Works correctly only
>>> + * when memory backing the fence structure is zero initialized on allocation.
>>> + */
>>> +static inline bool dma_fence_is_initialized(struct dma_fence *fence)
>>> +{
>>> +    return fence && !!fence->ops;
>>
>> This patch should precede the one adding RCU protection to fence->ops. And that one then needs to add a rcu_dereference() here.
> 
> Good point.
> 
>> At which point however it would start exploding?
> 
> When we start setting the ops pointer to NULL in the next patch.
> 
>> Which also means the new API is racy by definition and can give false positives if fence would be to be signaled as someone is checking.
> 
> Oh, that is a really really good point. I haven't thought about that because all current users would check the fence only after it is signaled.
> 
>> Hmm.. is the new API too weak, being able to only be called under very limited circumstances?
> 
> Yes, exactly that. All callers use this only to decide on the correct cleanup path.
> 
> So the fence is either fully signaled or was never initialized in the first place.
> 
>> Would it be better to solve it in the drivers by tracking state?
> 
> The alternative I had in mind was to use another DMA_FENCE_FLAG_... for that.
> 
> I will probably use that approach instead, just to make it extra defensive.

Flags sounds okay-ish. I mean it is a bit roundabout to track the state 
and export API only useful for some driver flows, not least that zero 
alloc of the object itself is not mandatory to begin with, but I guess 
it is passable.

Hm... it could even be solved with "DMA_FENCE_FLAG_USER_BITS+1". Since 
only two drivers need this maybe something to consider.

Regards,

Tvrtko

