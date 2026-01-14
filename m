Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FABD1DB93
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 10:53:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E66D10E5B8;
	Wed, 14 Jan 2026 09:53:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="GbICMmNz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5851D10E5B8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 09:53:09 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-477ba2c1ca2so92868805e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 01:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1768384388; x=1768989188; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CHfttbzoZw/iZ4qOqblGFZkKrITTrqpiR476mkxJafo=;
 b=GbICMmNzF3gWjQKBiQvOC3L5T1Bg/Syk6MurEKml0HNRb6FM6EswuKgaSTVz/taSxb
 ylpv/Kv8IetGvRV1C9nCMaLeq+J1j5tKEYrSCzG7Yts3YIkTZ16cCqXWyH1K9sviejo/
 zc0I5wWnRdhrycEderlSyWXsCkgQshGhAa6uA5J9RGbPLNq6AGsO5EhqkvUPItotVNqN
 HDGvNnrlB9DEDFyBl+3HI7jFOgTGTBm0uQpz35raNnLs98rMv2umCcnmWOBJzwsV4jSF
 lssDci84a2gDwHevhN8TlDeS5UTITezjUAlJaqJvR2jQgdwuF07pmw9gihNfiKFbwx2Q
 eItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768384388; x=1768989188;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CHfttbzoZw/iZ4qOqblGFZkKrITTrqpiR476mkxJafo=;
 b=UM/OMAZJKrrZjvLunh9QXW6hBLJGbE78Owxxx2DzWnnLNZHD16sg63fiCcqc2krj64
 sv6/6vV4TCterKD4rVAFDljrzAASKQOdsObQOzz0OSu8fH7rq8lVcF+o8dftUJgv337l
 AhB99zb1QgcctOPWFs215X/MCNPLzy2Z1p/o8+h+tAusMB5sa8yPKv6AZ8EfyiOubaRT
 wqeNQslpmUbKQgpvmb9dU0w6mVIhY2BJbof8dYg3pPDPh0h0g4PoDkCW/WZOagryJLwf
 cbx1morglElOk4TUM0ovv9w8PIKXTLRO8q9SEXADOph2+nmmd2Xoa5+1XAvlXY5U2cP3
 tnTg==
X-Gm-Message-State: AOJu0YzTZgwaUuQVtGA9Wehg8joUUTB7+O8H6a4CiaMy79JAuj+Zc9hQ
 O222XwlUanFQmPqOF0i3nYaw5/HKo6ghNU5xCLUr9nkdjv5beJkBH8SosnxYnqVO+/hfe5sjFRS
 rc4Qe
X-Gm-Gg: AY/fxX5PEQGvsbkiIQGqFAa3YwZNYuhN6WbOIDpUyXIFNQOXtlHiXZ+lsHcgQnWcFsi
 YTHbs+FLrtkI0G3UlElesASeme5CroaVMn5b1QDYjxfjN2iNHlxvwSi23cX74v6qgT+okMBAfZ+
 Gxa2V0xlk8C3j4KoUuEAbeIKe/jh2KClYOo4vymUcUUAXBGKR+eHrHdiqFftUrmR3ozrS6zqK2M
 VZwTtTKAkr/aBDPTpwRxCFL35IUNP8QgArXK2LFON5eL01bBcmN300C0V2xLKZWRdJfzjHP5jDo
 /unhzZboNawUsdHoutMChuVRn5TDNeJTvD4hU1qBe/DkVVxmYZHzGwrHHssUrydD9HxBw1O4vLA
 RK8al/AxeayxtYOFylCq+vf4hPBONtxfudkl2MYRPgRe/nOPIIvk0idmBirCJMo7DEutxLInOat
 fNcE4gPcLlxsAqhZHqD5u0JcBrGK3hs8He
X-Received: by 2002:a05:600c:4fc9:b0:47d:5d27:2a7f with SMTP id
 5b1f17b1804b1-47ee3372781mr23597125e9.26.1768384387765; 
 Wed, 14 Jan 2026 01:53:07 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee2814548sm16420015e9.9.2026.01.14.01.53.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 01:53:07 -0800 (PST)
Message-ID: <b85f053e-e26c-4762-b7f3-d8b1a58a3a41@ursulin.net>
Date: Wed, 14 Jan 2026 09:53:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] dma-buf: add dma_fence_is_initialized function
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20260113152125.47380-1-christian.koenig@amd.com>
 <20260113152125.47380-3-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260113152125.47380-3-christian.koenig@amd.com>
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

\
On 13/01/2026 15:16, Christian König wrote:
> Some driver use fence->ops to test if a fence was initialized or not.
> The problem is that this utilizes internal behavior of the dma_fence
> implementation.
> 
> So better abstract that into a function.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 13 +++++++------
>   drivers/gpu/drm/qxl/qxl_release.c       |  2 +-
>   include/linux/dma-fence.h               | 12 ++++++++++++
>   3 files changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 0a0dcbf0798d..b97f90bbe8b9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -278,9 +278,10 @@ void amdgpu_job_free_resources(struct amdgpu_job *job)
>   	unsigned i;
>   
>   	/* Check if any fences were initialized */
> -	if (job->base.s_fence && job->base.s_fence->finished.ops)
> +	if (job->base.s_fence &&
> +	    dma_fence_is_initialized(&job->base.s_fence->finished))
>   		f = &job->base.s_fence->finished;
> -	else if (job->hw_fence && job->hw_fence->base.ops)
> +	else if (dma_fence_is_initialized(&job->hw_fence->base))
>   		f = &job->hw_fence->base;
>   	else
>   		f = NULL;
> @@ -297,11 +298,11 @@ static void amdgpu_job_free_cb(struct drm_sched_job *s_job)
>   
>   	amdgpu_sync_free(&job->explicit_sync);
>   
> -	if (job->hw_fence->base.ops)
> +	if (dma_fence_is_initialized(&job->hw_fence->base))
>   		dma_fence_put(&job->hw_fence->base);
>   	else
>   		kfree(job->hw_fence);
> -	if (job->hw_vm_fence->base.ops)
> +	if (dma_fence_is_initialized(&job->hw_vm_fence->base))
>   		dma_fence_put(&job->hw_vm_fence->base);
>   	else
>   		kfree(job->hw_vm_fence);
> @@ -335,11 +336,11 @@ void amdgpu_job_free(struct amdgpu_job *job)
>   	if (job->gang_submit != &job->base.s_fence->scheduled)
>   		dma_fence_put(job->gang_submit);
>   
> -	if (job->hw_fence->base.ops)
> +	if (dma_fence_is_initialized(&job->hw_fence->base))
>   		dma_fence_put(&job->hw_fence->base);
>   	else
>   		kfree(job->hw_fence);
> -	if (job->hw_vm_fence->base.ops)
> +	if (dma_fence_is_initialized(&job->hw_vm_fence->base))
>   		dma_fence_put(&job->hw_vm_fence->base);
>   	else
>   		kfree(job->hw_vm_fence);
> diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
> index 7b3c9a6016db..b38ae0b25f3c 100644
> --- a/drivers/gpu/drm/qxl/qxl_release.c
> +++ b/drivers/gpu/drm/qxl/qxl_release.c
> @@ -146,7 +146,7 @@ qxl_release_free(struct qxl_device *qdev,
>   	idr_remove(&qdev->release_idr, release->id);
>   	spin_unlock(&qdev->release_idr_lock);
>   
> -	if (release->base.ops) {
> +	if (dma_fence_is_initialized(&release->base)) {
>   		WARN_ON(list_empty(&release->bos));
>   		qxl_release_free_list(release);
>   
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index eea674acdfa6..371aa8ecf18e 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -274,6 +274,18 @@ void dma_fence_release(struct kref *kref);
>   void dma_fence_free(struct dma_fence *fence);
>   void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq);
>   
> +/**
> + * dma_fence_is_initialized - test if fence was initialized
> + * @fence: fence to test
> + *
> + * Return: True if fence was initialized, false otherwise. Works correctly only
> + * when memory backing the fence structure is zero initialized on allocation.
> + */
> +static inline bool dma_fence_is_initialized(struct dma_fence *fence)
> +{
> +	return fence && !!fence->ops;

This patch should precede the one adding RCU protection to fence->ops. 
And that one then needs to add a rcu_dereference() here.

At which point however it would start exploding? Which also means the 
new API is racy by definition and can give false positives if fence 
would be to be signaled as someone is checking.

Hmm.. is the new API too weak, being able to only be called under very 
limited circumstances? Would it be better to solve it in the drivers by 
tracking state?

Regards,

Tvrtko

> +}
> +
>   /**
>    * dma_fence_put - decreases refcount of the fence
>    * @fence: fence to reduce refcount of

