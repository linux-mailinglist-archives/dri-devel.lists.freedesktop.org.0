Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54543D1E774
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 12:39:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FED310E5FD;
	Wed, 14 Jan 2026 11:39:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZimFrFLs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DD010E5FD
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 11:39:32 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-88a3d2f3299so98741726d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 03:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768390771; x=1768995571; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jbQULNNltYWNdEuVSBXiWpTsjD/Zwd5AGvb5VIFDPRo=;
 b=ZimFrFLs+QDhGP2N08rMDmTS1a5bDb/OHzaNiuIqvdSUQmuJMsZlM7TDgEv6us4Miy
 w7q/Q9l1RnmWI+9BjNKOL3z26TzWV8gxvZpRUJIugZGkRZtmqLrpCOnHqWrUvLhFU15c
 kKUHZHa8cvfBNK6PsUxw1bKnsHPYHsJeN7qjI2YaFncW2qxR4LjDqC4JMcRaGl+tmcKu
 rDMNHV1OvZFZKudYk98cO+U7vhpPvp091gBf9oKyWKhpnePQyzRH/dUtAAvmmckLv8GG
 O6ot0MzrANjJNYEioaz4i+Kf+8+9dediajL8GFVzeT2giNGotHqcKkluvWoI1UPIXhtA
 ouMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768390771; x=1768995571;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jbQULNNltYWNdEuVSBXiWpTsjD/Zwd5AGvb5VIFDPRo=;
 b=AlbMbMy3DkZI4u4DXqXfGPXCeOT/T9mof3K2EGSRYbatGFX2Y2S3NEKFnsVz2Xya0A
 OkJb966Ap/zsnC12SSoklMGoPo64breOlwgKc6pTd2D+cEilHXI43K5TD99ocQ3MtG9d
 +MK8iSckPkMBFhhhWvvLTxmxaUHOe2RjCVhogCPDaURwueD3X7CjU4oBM1qnIv3kkO2n
 A61U23+d4UumGY7tZtK+TBuYNwGr+h+kqh9l/IsBn+kSm5DcbEAhggo2g9ZA7xpSlrw2
 ZqAMrhZCRk00EGjiDaZjgW3/jCD75BVZy5nRklx70NWq9Q9ydCG4dJeGP+N4jSrrngVD
 C4IA==
X-Gm-Message-State: AOJu0YzSWtixCyAHwfBHd6pFLrwCy3LEipprVS7Jc4TX6fn/BXscszTe
 8bklfoLUEYzwq4NDgfhy9IHQ+p92GzxgwUl7EKx742hK92kijqot32ja
X-Gm-Gg: AY/fxX7jvvhvgWY6Dq2qzToQr20RVyMTA4HPKn7FIPnE/LgHVaR7gt0/Z/2MaXwqbgC
 MX//CidJgqW1xd8RwAkMrWQfd5VwoPL5MB9A7Nr7MFjKVlauHaevQ+J1NsdqBJ7LX/2+ymLYGSD
 3l8PGB01648d7U1aJ/hE8IHz2wHClN59R5BnL1R8voI9Al2SGVQeQRmEJHmfNfwudmcq6zuXf3R
 hPKgCPQ2nnirpR8rJjNI+MaNMxO6Tdy+0KvmedXQYeXGqlDlmyxpH/6PxW1G8UT5q0XMBW+ZJ40
 e2LeRWP9i3hLQHgkokgsACLNrDB0r6TOmsLnBXMftmlbZQ5bDqt7KGIhBP5WvRKLGvlaK81bnod
 ZeomkOxZRBiBIhEbi8QYh7uwIQwWVpMggQt+FIY4y+Q/5pfAdwnuaZAEgJC2iVS3udu1oZu3Nr9
 LEL0C/a2SCyOwR742gvOpUxLurq28HtM+Ow7othTAkeok=
X-Received: by 2002:a05:6214:4003:b0:890:58b4:3e7c with SMTP id
 6a1803df08f44-892743ded60mr29117166d6.33.1768390771211; 
 Wed, 14 Jan 2026 03:39:31 -0800 (PST)
Received: from [10.254.120.192] (mkmvpn.amd.com. [165.204.54.211])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-890770e217bsm172711516d6.13.2026.01.14.03.39.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Jan 2026 03:39:30 -0800 (PST)
Message-ID: <eb79bf68-a08f-49f3-b287-9e95831cee21@gmail.com>
Date: Wed, 14 Jan 2026 12:39:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] dma-buf: add dma_fence_is_initialized function
To: Tvrtko Ursulin <tursulin@ursulin.net>, phasta@mailbox.org,
 matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20260113152125.47380-1-christian.koenig@amd.com>
 <20260113152125.47380-3-christian.koenig@amd.com>
 <b85f053e-e26c-4762-b7f3-d8b1a58a3a41@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <b85f053e-e26c-4762-b7f3-d8b1a58a3a41@ursulin.net>
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

On 1/14/26 10:53, Tvrtko Ursulin wrote:
> \
> On 13/01/2026 15:16, Christian König wrote:
>> Some driver use fence->ops to test if a fence was initialized or not.
>> The problem is that this utilizes internal behavior of the dma_fence
>> implementation.
>>
>> So better abstract that into a function.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 13 +++++++------
>>   drivers/gpu/drm/qxl/qxl_release.c       |  2 +-
>>   include/linux/dma-fence.h               | 12 ++++++++++++
>>   3 files changed, 20 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> index 0a0dcbf0798d..b97f90bbe8b9 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> @@ -278,9 +278,10 @@ void amdgpu_job_free_resources(struct amdgpu_job *job)
>>       unsigned i;
>>         /* Check if any fences were initialized */
>> -    if (job->base.s_fence && job->base.s_fence->finished.ops)
>> +    if (job->base.s_fence &&
>> +        dma_fence_is_initialized(&job->base.s_fence->finished))
>>           f = &job->base.s_fence->finished;
>> -    else if (job->hw_fence && job->hw_fence->base.ops)
>> +    else if (dma_fence_is_initialized(&job->hw_fence->base))
>>           f = &job->hw_fence->base;
>>       else
>>           f = NULL;
>> @@ -297,11 +298,11 @@ static void amdgpu_job_free_cb(struct drm_sched_job *s_job)
>>         amdgpu_sync_free(&job->explicit_sync);
>>   -    if (job->hw_fence->base.ops)
>> +    if (dma_fence_is_initialized(&job->hw_fence->base))
>>           dma_fence_put(&job->hw_fence->base);
>>       else
>>           kfree(job->hw_fence);
>> -    if (job->hw_vm_fence->base.ops)
>> +    if (dma_fence_is_initialized(&job->hw_vm_fence->base))
>>           dma_fence_put(&job->hw_vm_fence->base);
>>       else
>>           kfree(job->hw_vm_fence);
>> @@ -335,11 +336,11 @@ void amdgpu_job_free(struct amdgpu_job *job)
>>       if (job->gang_submit != &job->base.s_fence->scheduled)
>>           dma_fence_put(job->gang_submit);
>>   -    if (job->hw_fence->base.ops)
>> +    if (dma_fence_is_initialized(&job->hw_fence->base))
>>           dma_fence_put(&job->hw_fence->base);
>>       else
>>           kfree(job->hw_fence);
>> -    if (job->hw_vm_fence->base.ops)
>> +    if (dma_fence_is_initialized(&job->hw_vm_fence->base))
>>           dma_fence_put(&job->hw_vm_fence->base);
>>       else
>>           kfree(job->hw_vm_fence);
>> diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
>> index 7b3c9a6016db..b38ae0b25f3c 100644
>> --- a/drivers/gpu/drm/qxl/qxl_release.c
>> +++ b/drivers/gpu/drm/qxl/qxl_release.c
>> @@ -146,7 +146,7 @@ qxl_release_free(struct qxl_device *qdev,
>>       idr_remove(&qdev->release_idr, release->id);
>>       spin_unlock(&qdev->release_idr_lock);
>>   -    if (release->base.ops) {
>> +    if (dma_fence_is_initialized(&release->base)) {
>>           WARN_ON(list_empty(&release->bos));
>>           qxl_release_free_list(release);
>>   diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>> index eea674acdfa6..371aa8ecf18e 100644
>> --- a/include/linux/dma-fence.h
>> +++ b/include/linux/dma-fence.h
>> @@ -274,6 +274,18 @@ void dma_fence_release(struct kref *kref);
>>   void dma_fence_free(struct dma_fence *fence);
>>   void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq);
>>   +/**
>> + * dma_fence_is_initialized - test if fence was initialized
>> + * @fence: fence to test
>> + *
>> + * Return: True if fence was initialized, false otherwise. Works correctly only
>> + * when memory backing the fence structure is zero initialized on allocation.
>> + */
>> +static inline bool dma_fence_is_initialized(struct dma_fence *fence)
>> +{
>> +    return fence && !!fence->ops;
> 
> This patch should precede the one adding RCU protection to fence->ops. And that one then needs to add a rcu_dereference() here.

Good point.

> At which point however it would start exploding?

When we start setting the ops pointer to NULL in the next patch.

> Which also means the new API is racy by definition and can give false positives if fence would be to be signaled as someone is checking.

Oh, that is a really really good point. I haven't thought about that because all current users would check the fence only after it is signaled.

> Hmm.. is the new API too weak, being able to only be called under very limited circumstances?

Yes, exactly that. All callers use this only to decide on the correct cleanup path.

So the fence is either fully signaled or was never initialized in the first place.

> Would it be better to solve it in the drivers by tracking state?

The alternative I had in mind was to use another DMA_FENCE_FLAG_... for that.

I will probably use that approach instead, just to make it extra defensive.

Thanks,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>> +}
>> +
>>   /**
>>    * dma_fence_put - decreases refcount of the fence
>>    * @fence: fence to reduce refcount of
> 

