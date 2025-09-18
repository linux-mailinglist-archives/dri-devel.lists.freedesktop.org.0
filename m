Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F42B85509
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 16:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26C910E210;
	Thu, 18 Sep 2025 14:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HXlXzbn1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AEE210E204
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 14:45:49 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-62fa0653cd2so2183396a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 07:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758206748; x=1758811548; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g+4fkDR9tR/7yH+qT4TpU7FDH9BAIK1eyrhjxg3L/lI=;
 b=HXlXzbn1K+h1LFc6+KqmfQHpU9w7Pefdbt4D2cltA0d9b5F9e1ofX6Li3zSwfkJHed
 eK8Ta2h0wXEwdg26HjVzx/QjT3c/hFCLiVzcODNrXbNWcG6+0SmUsotbKTYgmZRmclvS
 McLQlp3gOKT+v6ly1HOla0QbgudvhhSrY1r13ywNizqMWLrySVOpuXWEsfcrRbZ2KjGK
 pSzeZj3loVRbtloZupP9MqdCNf4kQR5oknJfQjT8498v6zZxL60fVtIf1BNrmzrmIqFT
 YcraMTdJ3kdnFUJp7krBurgJJOnicCkQyl9cU7JtMovO5cnVmJXUvREa4YVdTgqDjpqw
 T11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758206748; x=1758811548;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g+4fkDR9tR/7yH+qT4TpU7FDH9BAIK1eyrhjxg3L/lI=;
 b=jAPD32Z2Ne2WR+fOG53pFqDfpAnWhilXhGbseQDRe/wz2X/hkwCB/ZVytERbKo+7Mk
 RbYyyI9usVdsaABjvxpq1TdtS0D9h85PrGJ222YWC51u7Xrw4QoM86K3JBHxq4JOiwy4
 Tgt16Vt5BNgNhEv2VyRgyM6o9EUubfopCCUsOdbOD3QPLUOiTaeyHAg6WQrKwF3OsLU8
 C95/n2GfYtLXav4R7CM9UzkSnAGXNIIXjCRPUU3TlRGQOK9NJCvRNdI2H8k3ZsTmxNUz
 Gknz9qQZDQe6ekKl/G9Sw6NrxSMM9KZiUBSuaeHgRgPZW/Y45JebSwEcr4dZPxu0IAKk
 y+8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbvDwIPm/L+tRR5jYSJHz9LlwE8UIkgmsRe3cLX2aOV19OHLy/F8HKALZXPa3M/IMNFwW8WB8n7so=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHxih4l+/BNWUv4KFCD6tvqqPZv+8Flz+RcUxf288YS3LE0RhP
 EeivBjOx1bNWgfwtpXaOQoe2Y2Lu1yCr/zkZhFf25o2+rQPFtNeAMBg=
X-Gm-Gg: ASbGncvSu+VYP3VR8JutMjnDbt4WLpbbu1QeG40sYZAr/yywGodM+qXFD7m+Oj7R2yO
 OMPd7iz43m17HYRTCF4CzwTLm4nw/870S2L5+SedmCig6hFF5yZvf7lgQTW563k5tmofOi5RrLq
 urDoUIYSaR/gdSEdMlysB01Pe/AvCHAMTDCP6E0XgKfvG+fjqgo7J1J185UNm6KWSKlL1W9tsqe
 EjhOvZo/Y7G1lJS0mg3FBTkruoI9KgRM0gprs3mxyLd+IIi22+MZqyBLUCy5uVNHkqVdOxvM3zO
 iV51OpM0PoYwlqtmVNOQDtvWdBlb4PfXMvu0yDIfR+WzbWaOBvELSuS6EXEu3Nq+DWVsBFLihlK
 3bOXohii3o97pgV80SZUOSWmqOZKitB08Jxw6b1kMVbNjB+sDLIe1J6X893FAp2iZGKC+Z7SRzn
 duyX6gGxskLOrKEvxAGLuMOraLWwzY
X-Google-Smtp-Source: AGHT+IHUiRv0UhrpPYFqhz3imT7dnQ0dpSoCmbzKX0ECgZ31WAKNXXLeQ19MnJspPcoHp4FZRx/T/w==
X-Received: by 2002:a17:907:3e9e:b0:b04:5cca:9988 with SMTP id
 a640c23a62f3a-b1bba00183cmr688429266b.43.1758206747410; 
 Thu, 18 Sep 2025 07:45:47 -0700 (PDT)
Received: from [192.168.1.17] (host-79-12-163-148.retail.telecomitalia.it.
 [79.12.163.148]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b1fc73ba1e8sm205028166b.31.2025.09.18.07.45.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Sep 2025 07:45:46 -0700 (PDT)
Message-ID: <7876a7c5-4b40-4760-bb59-3fbeb5d63f67@gmail.com>
Date: Thu, 18 Sep 2025 16:45:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/msm: preemption aware hangcheck
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250911-preemption_aware_hangcheck-v1-0-974819876819@gmail.com>
 <20250911-preemption_aware_hangcheck-v1-2-974819876819@gmail.com>
 <c08872c9-cdad-4e62-827b-7985cb3b18de@oss.qualcomm.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <c08872c9-cdad-4e62-827b-7985cb3b18de@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 9/17/25 5:23 PM, Akhil P Oommen wrote:
> On 9/11/2025 10:31 PM, Anna Maniscalco wrote:
>> Rework hangcheck code to work well toghether with preemption.
>>
>> Track the time a job has spent in a ring by storing timestamps of the
>> `CP_ALWAYS_ON_CONTEXT` register at the beginning of a job and when
>> switching rings as well as reading it back if the ring is currently
>> active.
>>
>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  3 +-
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c     |  3 +-
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 28 +++++++++++++++--
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 25 +++++++++++----
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.c   |  3 +-
>>   drivers/gpu/drm/msm/msm_gpu.c             | 51 +++++++++++++++++++++++++------
>>   drivers/gpu/drm/msm/msm_gpu.h             |  3 ++
>>   drivers/gpu/drm/msm/msm_ringbuffer.h      |  6 ++++
>>   9 files changed, 102 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> index 4a04dc43a8e6764a113d0ade3dee94bd4c0083af..cb4775a35da0706e571eb27ce617044de84ca118 100644
>> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> @@ -1255,7 +1255,8 @@ static void a5xx_fault_detect_irq(struct msm_gpu *gpu)
>>   		gpu_read(gpu, REG_A5XX_CP_IB2_BUFSZ));
>>   
>>   	/* Turn off the hangcheck timer to keep it from bothering us */
>> -	timer_delete(&gpu->hangcheck_timer);
>> +	for (int i = 0; i < gpu->nr_rings; i++)
>> +		timer_delete(&gpu->rb[i]->hangcheck_timer);
>>   
>>   	kthread_queue_work(gpu->worker, &gpu->recover_work);
>>   }
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index fc62fef2fed87f065cb8fa4e997abefe4ff11cd5..103c19fa8669f06a6c1627ced1daf2bcd60415db 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -28,7 +28,8 @@ static void a6xx_gmu_fault(struct a6xx_gmu *gmu)
>>   	gmu->hung = true;
>>   
>>   	/* Turn off the hangcheck timer while we are resetting */
>> -	timer_delete(&gpu->hangcheck_timer);
>> +	for (int i = 0; i < gpu->nr_rings; i++)
>> +		timer_delete(&gpu->rb[i]->hangcheck_timer);
>>   
>>   	/* Queue the GPU handler because we need to treat this as a recovery */
>>   	kthread_queue_work(gpu->worker, &gpu->recover_work);
> I think a helper routine makes sense. We have to disable hangcheck
> whenever recover_worker is queued.
>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index b8f8ae940b55f5578abdbdec6bf1e90a53e721a5..7647e3dfd50db7446589e67949ed08d0a422f543 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -465,6 +465,9 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>   	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_COUNTER,
>>   		rbmemptr_stats(ring, index, alwayson_start));
>>   
>> +	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_CONTEXT,
>> +		rbmemptr(ring, last_job_start_ctx));
>> +
>>   	OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
>>   	OUT_RING(ring, CP_SET_THREAD_BOTH);
>>   
>> @@ -1816,7 +1819,8 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
>>   		gpu_read(gpu, REG_A6XX_CP_IB2_REM_SIZE));
>>   
>>   	/* Turn off the hangcheck timer to keep it from bothering us */
>> -	timer_delete(&gpu->hangcheck_timer);
>> +	for (int i = 0; i < gpu->nr_rings; i++)
>> +		timer_delete(&gpu->rb[i]->hangcheck_timer);
>>   
>>   	/* Turn off interrupts to avoid triggering recovery again */
>>   	gpu_write(gpu, REG_A6XX_RBBM_INT_0_MASK, 0);
>> @@ -1839,7 +1843,8 @@ static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
>>   	 */
>>   	if (status & (A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
>>   		      A7XX_CX_MISC_SW_FUSE_VALUE_LPAC)) {
>> -		timer_delete(&gpu->hangcheck_timer);
>> +		for (int i = 0; i < gpu->nr_rings; i++)
>> +			timer_delete(&gpu->rb[i]->hangcheck_timer);
>>   
>>   		kthread_queue_work(gpu->worker, &gpu->recover_work);
>>   	}
>> @@ -2327,6 +2332,22 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>>   	return 0;
>>   }
>>   
>> +static int a6xx_get_ctx_timestamp(struct msm_ringbuffer *ring, uint64_t *value)
>> +{
>> +	struct msm_gpu *gpu = ring->gpu;
>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> +
>> +	guard(spinlock_irqsave)(&a6xx_gpu->eval_lock);
> Is eval_lock initialized anywhere? Also why do we need this?

Yeah eval_lock was introduced in the preemption series. It is 
initialized in `a6xx_preempt_hw_init`.

>
>> +
>> +	if (a6xx_in_preempt(a6xx_gpu) || ring != a6xx_gpu->cur_ring)
> This will race with preemption. I think we should wrap the preempt state
> check and the regread under the preempt lock.

Continuing. The idea is that if in_preempt returns true then it doesn't 
matter that reading cur_ring might race because we exit early.

On the other end, if it returns false, since we are holding `eval_lock` 
and the only place where we can go from the PREEMPT_NONE state to any 
other state is also guarded by that lock, then we are guaranteed that no 
preemption will occur so long as we are within this function.

>
>> +		return -EBUSY;
>> +
>> +	*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_CONTEXT);With IFPC, we cannot access a GX domain register (CP, RBBM etc) unless
> we are certain that the GX is powered up. Could you please test this
> series along with the IFPC series? If we hit the right timing, there
> should be a GMU fence error in the dmesg. Not sure how easy it is to hit
> that timing, but I believe there is a problem here conceptually.

Right. I'll fix this although we don't have a fenced_read helper and I 
wonder if reading behaves like writing when it comes to waking up the gpu.

So would it work to try the read and poll REG_A6XX_GMU_AHB_FENCE_STATUS 
like we do when writing?

>> +
>> +	return 0;
>> +}
>> +
>>   static struct msm_ringbuffer *a6xx_active_ring(struct msm_gpu *gpu)
>>   {
>>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> @@ -2555,6 +2576,7 @@ static const struct adreno_gpu_funcs funcs = {
>>   		.get_rptr = a6xx_get_rptr,
>>   		.progress = a6xx_progress,
>>   		.sysprof_setup = a6xx_gmu_sysprof_setup,
>> +		.get_ctx_timestamp = a6xx_get_ctx_timestamp,
>>   	},
>>   	.get_timestamp = a6xx_gmu_get_timestamp,
>>   };
>> @@ -2584,6 +2606,7 @@ static const struct adreno_gpu_funcs funcs_gmuwrapper = {
>>   		.create_private_vm = a6xx_create_private_vm,
>>   		.get_rptr = a6xx_get_rptr,
>>   		.progress = a6xx_progress,
>> +		.get_ctx_timestamp = a6xx_get_ctx_timestamp,
>>   	},
>>   	.get_timestamp = a6xx_get_timestamp,
>>   };
>> @@ -2616,6 +2639,7 @@ static const struct adreno_gpu_funcs funcs_a7xx = {
>>   		.get_rptr = a6xx_get_rptr,
>>   		.progress = a6xx_progress,
>>   		.sysprof_setup = a6xx_gmu_sysprof_setup,
>> +		.get_ctx_timestamp = a6xx_get_ctx_timestamp,
>>   	},
>>   	.get_timestamp = a6xx_gmu_get_timestamp,
>>   };
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> index 0b17d36c36a9567e6afa4269ae7783ed3578e40e..7248d3d38c6d8a06cb4a536043bf4877179447cc 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> @@ -80,6 +80,7 @@ struct a6xx_gpu {
>>   	struct drm_gem_object *preempt_postamble_bo;
>>   	void *preempt_postamble_ptr;
>>   	uint64_t preempt_postamble_iova;
>> +	uint64_t preempt_postamble_cntreset_end;
>>   	uint64_t preempt_postamble_len;
>>   	bool postamble_enabled;
>>   
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> index afc5f4aa3b17334027f3c20072cc3f059a9733b7..88a65549fa8038d4836eb5aeaea775d679415315 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> @@ -99,11 +99,15 @@ static void a6xx_preempt_timer(struct timer_list *t)
>>   	kthread_queue_work(gpu->worker, &gpu->recover_work);
>>   }
>>   
>> -static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu)
>> +static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu, struct msm_ringbuffer *ring)
>>   {
>>   	u32 *postamble = a6xx_gpu->preempt_postamble_ptr;
>> +	uint64_t last_active_ctxcycles;
>>   	u32 count = 0;
>>   
>> +	if (ring)
>> +		last_active_ctxcycles = rbmemptr(ring, last_active_ctxcycles);
>> +
>>   	postamble[count++] = PKT7(CP_REG_RMW, 3);
>>   	postamble[count++] = REG_A6XX_RBBM_PERFCTR_SRAM_INIT_CMD;
>>   	postamble[count++] = 0;
>> @@ -118,6 +122,15 @@ static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu)
>>   	postamble[count++] = CP_WAIT_REG_MEM_4_MASK(0x1);
>>   	postamble[count++] = CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0);
>>   
>> +	a6xx_gpu->preempt_postamble_cntreset_end = count;
>> +
>> +	postamble[count++] = PKT7(ring ? CP_REG_TO_MEM : CP_NOP, 3);
>> +	postamble[count++] = CP_REG_TO_MEM_0_REG(REG_A6XX_CP_ALWAYS_ON_CONTEXT) |
>> +		CP_REG_TO_MEM_0_CNT(2) |
>> +		CP_REG_TO_MEM_0_64B;
>> +	postamble[count++] = lower_32_bits(last_active_ctxcycles);
>> +	postamble[count++] = upper_32_bits(last_active_ctxcycles);
>> +
>>   	a6xx_gpu->preempt_postamble_len = count;
>>   
>>   	a6xx_gpu->postamble_enabled = true;
>> @@ -129,9 +142,9 @@ static void preempt_disable_postamble(struct a6xx_gpu *a6xx_gpu)
>>   
>>   	/*
>>   	 * Disable the postamble by replacing the first packet header with a NOP
>> -	 * that covers the whole buffer.
>> +	 * that skips the counters reset part.
>>   	 */
>> -	*postamble = PKT7(CP_NOP, (a6xx_gpu->preempt_postamble_len - 1));
>> +	*postamble = PKT7(CP_NOP, (a6xx_gpu->preempt_postamble_cntreset_end - 1));
>>   
>>   	a6xx_gpu->postamble_enabled = false;
>>   }
>> @@ -338,8 +351,8 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>>   	/* Enable or disable postamble as needed */
>>   	sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
>>   
>> -	if (!sysprof && !a6xx_gpu->postamble_enabled)
>> -		preempt_prepare_postamble(a6xx_gpu);
>> +	if (!sysprof)
>> +		preempt_prepare_postamble(a6xx_gpu, ring);
>>   
>>   	if (sysprof && a6xx_gpu->postamble_enabled)
>>   		preempt_disable_postamble(a6xx_gpu);
>> @@ -454,7 +467,7 @@ void a6xx_preempt_init(struct msm_gpu *gpu)
>>   			gpu->vm, &a6xx_gpu->preempt_postamble_bo,
>>   			&a6xx_gpu->preempt_postamble_iova);
>>   
>> -	preempt_prepare_postamble(a6xx_gpu);
>> +	preempt_prepare_postamble(a6xx_gpu, NULL);
>>   
>>   	if (IS_ERR(a6xx_gpu->preempt_postamble_ptr))
>>   		goto fail;
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> index afaa3cfefd357dc0230994c8b5830a14c6d7a352..58f1e2a95bbfb00feb5a3bb91853e6bb533ec631 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> @@ -334,7 +334,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
>>   		struct msm_gpu_fault_info fault_info = {};
>>   
>>   		/* Turn off the hangcheck timer to keep it from bothering us */
>> -		timer_delete(&gpu->hangcheck_timer);
>> +		for (int i = 0; i < gpu->nr_rings; i++)
>> +			timer_delete(&gpu->rb[i]->hangcheck_timer);
>>   
>>   		fault_info.ttbr0 = info->ttbr0;
>>   		fault_info.iova  = iova;
>> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
>> index 17759abc46d7d7af4117b1d71f1d5fba6ba0b61c..a3c5073aca1f65e450e0673262e8ca4bc7a5be6f 100644
>> --- a/drivers/gpu/drm/msm/msm_gpu.c
>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
>> @@ -463,7 +463,9 @@ static void recover_worker(struct kthread_work *work)
>>   	struct drm_device *dev = gpu->dev;
>>   	struct msm_drm_private *priv = dev->dev_private;
>>   	struct msm_gem_submit *submit;
>> -	struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
>> +	struct msm_ringbuffer *cur_ring = gpu->hung_ring ?
>> +		gpu->hung_ring : gpu->funcs->active_ring(gpu);
>> +	gpu->hung_ring = NULL;
>>   	char *comm = NULL, *cmd = NULL;
>>   	struct task_struct *task;
>>   	int i;
>> @@ -613,11 +615,17 @@ void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_
>>   	mutex_unlock(&gpu->lock);
>>   }
>>   
>> -static void hangcheck_timer_reset(struct msm_gpu *gpu)
>> +static void hangcheck_ring_timer_reset(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>>   {
>>   	struct msm_drm_private *priv = gpu->dev->dev_private;
>> -	mod_timer(&gpu->hangcheck_timer,
>> -			round_jiffies_up(jiffies + msecs_to_jiffies(priv->hangcheck_period)));
>> +	mod_timer(&ring->hangcheck_timer,
>> +			  round_jiffies_up(jiffies + msecs_to_jiffies(priv->hangcheck_period)));
>> +}
>> +
>> +static void hangcheck_timer_reset(struct msm_gpu *gpu)
>> +{
>> +	for (int i = 0; i < gpu->nr_rings; i++)
>> +		hangcheck_ring_timer_reset(gpu, gpu->rb[i]);
> It triggers my OCD a bit that there are multiple timers flying around
> waking up CPU clusters. But this is okay for now I guess. :)
>
>>   }
>>   
>>   static bool made_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>> @@ -635,11 +643,33 @@ static bool made_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>>   	return true;
>>   }
>>   
>> +static bool check_ring_timeout(struct msm_ringbuffer *ring, unsigned long timeout)
>> +{
>> +	struct msm_gpu *gpu = ring->gpu;
>> +	struct msm_ringbuffer *curr_ring = gpu->funcs->active_ring(gpu);
>> +	u64 start, end;
>> +	int ret;
>> +
>> +	if (!gpu->funcs->get_ctx_timestamp)
>> +		return !made_progress(gpu, ring);
>> +
>> +	start = ring->memptrs->last_job_start_ctx;
>> +
>> +	if (!gpu->funcs->get_ctx_timestamp(ring, &end))
> I suppose you want the other way. ie, if get_ctx_timestamp() returns
> -EBUSY, which means gpu is either under preemption or in a different
> ring, use the memptr data.
You are right, that `!` does not belong there!
>
>> +		end = ring->memptrs->last_active_ctxcycles;
> Assuming my above comment is correct, if GPU is under preemption, there
> is a chance that the postamble might not have got executed. So with a
> stale 'end' value, the below calc may go wrong?
>
>> +
>> +	if (end >= start)
>> +		return (end - start) < timeout;
>> +	else
>> +		return false;
> In case of an infinite shader blocking preemption, wouldn't we always
> return false here?
Right. Once we fix the above condition this shouldn't be a problem 
because hangcheck timer will fire on the ring that is stuck so `end` 
will be read from the register and it should detect the hang.
>
> -Akhil> +}
>> +
>>   static void hangcheck_handler(struct timer_list *t)
>>   {
>> -	struct msm_gpu *gpu = timer_container_of(gpu, t, hangcheck_timer);
>> +	struct msm_ringbuffer *ring = timer_container_of(ring, t, hangcheck_timer);
>> +	struct msm_gpu *gpu = ring->gpu;
>> +	struct msm_drm_private *priv = gpu->dev->dev_private;
>>   	struct drm_device *dev = gpu->dev;
>> -	struct msm_ringbuffer *ring = gpu->funcs->active_ring(gpu);
>>   	uint32_t fence = ring->memptrs->fence;
>>   
>>   	if (fence != ring->hangcheck_fence) {
>> @@ -647,7 +677,7 @@ static void hangcheck_handler(struct timer_list *t)
>>   		ring->hangcheck_fence = fence;
>>   		ring->hangcheck_progress_retries = 0;
>>   	} else if (fence_before(fence, ring->fctx->last_fence) &&
>> -			!made_progress(gpu, ring)) {
>> +			check_ring_timeout(ring, priv->hangcheck_period * 192000)) {
>>   		/* no progress and not done.. hung! */
>>   		ring->hangcheck_fence = fence;
>>   		ring->hangcheck_progress_retries = 0;
>> @@ -658,6 +688,7 @@ static void hangcheck_handler(struct timer_list *t)
>>   		DRM_DEV_ERROR(dev->dev, "%s:     submitted fence: %u\n",
>>   				gpu->name, ring->fctx->last_fence);
>>   
>> +		gpu->hung_ring = ring;
>>   		kthread_queue_work(gpu->worker, &gpu->recover_work);
>>   	}
>>   
>> @@ -911,7 +942,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>   	submit->ring->cur_ctx_seqno = submit->queue->ctx->seqno;
>>   
>>   	pm_runtime_put(&gpu->pdev->dev);
>> -	hangcheck_timer_reset(gpu);
>> +	hangcheck_ring_timer_reset(gpu, submit->ring);
> Should we reset hangcheck whenever there is a submission to a random ring?
The idea is that we only reset the timer for that ring. If that ring is 
stuck presumably whatever applications are running on it will stop 
submitting eventually since fences won't be signaled and so the timer 
should run.

That isn't really guaranteed but previously that was assumed.

Do you think this isn't a good assumption to make?

>
> -Akhil
>
>>   }
>>   
>>   /*
>> @@ -1011,8 +1042,6 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>   	if (funcs->progress)
>>   		priv->hangcheck_period /= 2;
>>   
>> -	timer_setup(&gpu->hangcheck_timer, hangcheck_handler, 0);
>> -
>>   	spin_lock_init(&gpu->perf_lock);
>>   
>>   
>> @@ -1097,6 +1126,8 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>   			goto fail;
>>   		}
>>   
>> +		timer_setup(&gpu->rb[i]->hangcheck_timer, hangcheck_handler, 0);
>> +
>>   		memptrs += sizeof(struct msm_rbmemptrs);
>>   		memptrs_iova += sizeof(struct msm_rbmemptrs);
>>   	}
>> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
>> index a597f2bee30b6370ecc3639bfe1072c85993e789..7bf1b7f4bc4b61338bfa4c1463eb549f8c22d5c3 100644
>> --- a/drivers/gpu/drm/msm/msm_gpu.h
>> +++ b/drivers/gpu/drm/msm/msm_gpu.h
>> @@ -93,6 +93,7 @@ struct msm_gpu_funcs {
>>   	 */
>>   	bool (*progress)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
>>   	void (*sysprof_setup)(struct msm_gpu *gpu);
>> +	int (*get_ctx_timestamp)(struct msm_ringbuffer *ring, uint64_t *value);
>>   };
>>   
>>   /* Additional state for iommu faults: */
>> @@ -257,6 +258,8 @@ struct msm_gpu {
>>   	/* work for handling GPU recovery: */
>>   	struct kthread_work recover_work;
>>   
>> +	struct msm_ringbuffer *hung_ring;
>> +
>>   	/** retire_event: notified when submits are retired: */
>>   	wait_queue_head_t retire_event;
>>   
>> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
>> index d1e49f701c8176e50d2b9a5cca35acee67f75209..316247fb089f26bd657ccf8464a5039e1cd1ac45 100644
>> --- a/drivers/gpu/drm/msm/msm_ringbuffer.h
>> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
>> @@ -37,6 +37,8 @@ struct msm_rbmemptrs {
>>   	volatile struct msm_gpu_submit_stats stats[MSM_GPU_SUBMIT_STATS_COUNT];
>>   	volatile u64 ttbr0;
>>   	volatile u32 context_idr;
>> +	volatile u64 last_job_start_ctx;
>> +	volatile u64 last_active_ctxcycles;
>>   };
>>   
>>   struct msm_cp_state {
>> @@ -73,6 +75,10 @@ struct msm_ringbuffer {
>>   	uint64_t memptrs_iova;
>>   	struct msm_fence_context *fctx;
>>   
>> +	/* Hang and Inactivity Detection:
>> +	 */
>> +	struct timer_list hangcheck_timer;
>> +
>>   	/**
>>   	 * hangcheck_progress_retries:
>>   	 *
>>

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

