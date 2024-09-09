Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 198C9971D7F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 17:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA15510E5B4;
	Mon,  9 Sep 2024 15:07:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JRA0DGmK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B8D10E54F;
 Mon,  9 Sep 2024 15:07:47 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5c3c3b63135so4736829a12.3; 
 Mon, 09 Sep 2024 08:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725894466; x=1726499266; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0e3VQB4mtZmgnW0q+EBl348gw10/94LT4bRkiM7OfK4=;
 b=JRA0DGmKapqM8uUibxYmta1Nda6PHCFkvWNjQ3w899S97+J4ndS9qvfy4Q0FRbH/WY
 DZsV9N5cK5nDA1CPxBm6LiGBUIr3RWV6VNxl+kSlsgYglXd1FwHyRaR7QdFEbMYlNYrI
 dcR7iqyRIabEMlYtlOtuvOSNrZ9X6qj2/dU3V6+/xEyQNrfX+i8HryJi35N7sDpW40Rc
 1DgnbcNvNAbThC4pF8RaEz897qRy0ewV+druF6a2Q/zMWsXcKKhuDsdFsL4oasqrXvH0
 H1kf/ZSmcPvlhfl9z9M++396kCTg93D96t2b1D6C0nDJlJ12w9pt2HeYMJ4mhjDP34zK
 aBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725894466; x=1726499266;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0e3VQB4mtZmgnW0q+EBl348gw10/94LT4bRkiM7OfK4=;
 b=xB2Uzn7M9vrSgBTvEBt9hbfQOg5SgEbzRh9mDKrLO9Yn+PLLZSg7yk4ZROqtEeWSrJ
 ds5sfZy0FTEgNdrJh5sj66AbDdkIRr8qOGN8q/xe2kEDFx1Hu/Eyh/zxecLT3peOCkhK
 2Lj00TR9xr44NFiOL7Q+qKVMQESjXCHu8SzmCTw7z7/qSwcV8bjmGGJGGKodHdEd8xOc
 6JoCsrCjCW1cTipWbH3bAQ43yFZtodRKuYb+6rh7opAfvM8h/fJ+ENcUe5IMJoWC1Vlm
 hR/+6FxsH0gahtABj1rod8XadOhl1xmClhch94aPe3lmdlDAkflZSWQKtmZOOy/flJ+8
 mMQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZ7DJak+KaGjNQN6rvCWvR5axCL4N2JZLVQhjYcxKGSWw9p7NyUOcKBMKhWlAzbEvZvY3AnvW8W7D/@lists.freedesktop.org,
 AJvYcCXhd50PfeHrjnumBRMrZINuA6ElB77dl52VIoKWdvEAZMTFu2fABVHChSTRk7Vp4ywH0zuhgYS9Wg4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOibgkWOUiD4VMU9ZOHDk40HQXdMoMOClUJ4HuS3c8JhBIH1an
 YnmqJEgz5Bb4sQSI2XIf6pw6aplDkj42GuWQnzvkC7f/39/FhBxj
X-Google-Smtp-Source: AGHT+IGJinPXTnmtg2jvdQUT+IkSTQKqrBpThwnTKU/zEfWtEF1nJMRSz7qtzC1Q2lBU0r0PDBhmNg==
X-Received: by 2002:a05:6402:5409:b0:5c3:3f6a:9767 with SMTP id
 4fb4d7f45d1cf-5c3dc7904d8mr9809150a12.9.1725894465215; 
 Mon, 09 Sep 2024 08:07:45 -0700 (PDT)
Received: from [192.168.1.17] (host-95-246-172-178.retail.telecomitalia.it.
 [95.246.172.178]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd4680esm3109614a12.21.2024.09.09.08.07.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 08:07:44 -0700 (PDT)
Message-ID: <69efbf90-7ce1-429f-bf3a-d19acd7d649d@gmail.com>
Date: Mon, 9 Sep 2024 17:07:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/10] drm/msm/A6xx: Use posamble to reset counters on
 preemption
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
 <20240905-preemption-a750-t-v3-6-fd947699f7bc@gmail.com>
 <20240906200847.ajcrpikzl65fwbjz@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <20240906200847.ajcrpikzl65fwbjz@hu-akhilpo-hyd.qualcomm.com>
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

On 9/6/24 10:08 PM, Akhil P Oommen wrote:
> On Thu, Sep 05, 2024 at 04:51:24PM +0200, Antonino Maniscalco wrote:
>> Use the postamble to reset perf counters when switching between rings,
>> except when sysprof is enabled, analogously to how they are reset
>> between submissions when switching pagetables.
>>
>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 20 ++++++++++++++++++-
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  5 +++++
>>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 32 +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  7 +++++--
>>   4 files changed, 61 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index ed0b138a2d66..710ec3ce2923 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -366,7 +366,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>   static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
>>   		struct a6xx_gpu *a6xx_gpu, struct msm_gpu_submitqueue *queue)
>>   {
>> -	u64 preempt_offset_priv_secure;
>> +	bool sysprof = refcount_read(&a6xx_gpu->base.base.sysprof_active) > 1;
>> +	u64 preempt_offset_priv_secure, preempt_postamble;
>>   
>>   	OUT_PKT7(ring, CP_SET_PSEUDO_REG, 15);
>>   
>> @@ -398,6 +399,23 @@ static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
>>   	/* seems OK to set to 0 to disable it */
>>   	OUT_RING(ring, 0);
>>   	OUT_RING(ring, 0);
>> +
>> +	/* if not profiling set postamble to clear perfcounters, else clear it */
>> +	if (!sysprof && a6xx_gpu->preempt_postamble_len) {
>> +		preempt_postamble = a6xx_gpu->preempt_postamble_iova;
>> +
>> +		OUT_PKT7(ring, CP_SET_AMBLE, 3);
>> +		OUT_RING(ring, lower_32_bits(preempt_postamble));
>> +		OUT_RING(ring, upper_32_bits(preempt_postamble));
>> +		OUT_RING(ring, CP_SET_AMBLE_2_DWORDS(
>> +					a6xx_gpu->preempt_postamble_len) |
>> +				CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));
>> +	} else {
> 
> Why do we need this else part?

Wouldn't the postmable remain set if we don't explicitly set it to 0?

> 
>> +		OUT_PKT7(ring, CP_SET_AMBLE, 3);
>> +		OUT_RING(ring, 0);
>> +		OUT_RING(ring, 0);
>> +		OUT_RING(ring, CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));
>> +	}
>>   }
>>   
>>   static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> index da10060e38dc..b009732c08c5 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> @@ -71,6 +71,11 @@ struct a6xx_gpu {
>>   	bool uses_gmem;
>>   	bool skip_save_restore;
>>   
>> +	struct drm_gem_object *preempt_postamble_bo;
>> +	void *preempt_postamble_ptr;
>> +	uint64_t preempt_postamble_iova;
>> +	uint64_t preempt_postamble_len;
>> +
>>   	struct a6xx_gmu gmu;
>>   
>>   	struct drm_gem_object *shadow_bo;
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> index 1caff76aca6e..ec44f44d925f 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> @@ -346,6 +346,28 @@ static int preempt_init_ring(struct a6xx_gpu *a6xx_gpu,
>>   	return 0;
>>   }
>>   
>> +static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu)
>> +{
>> +	u32 *postamble = a6xx_gpu->preempt_postamble_ptr;
>> +	u32 count = 0;
>> +
>> +	postamble[count++] = PKT7(CP_REG_RMW, 3);
>> +	postamble[count++] = REG_A6XX_RBBM_PERFCTR_SRAM_INIT_CMD;
>> +	postamble[count++] = 0;
>> +	postamble[count++] = 1;
>> +
>> +	postamble[count++] = PKT7(CP_WAIT_REG_MEM, 6);
>> +	postamble[count++] = CP_WAIT_REG_MEM_0_FUNCTION(WRITE_EQ);
>> +	postamble[count++] = CP_WAIT_REG_MEM_1_POLL_ADDR_LO(
>> +				REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS);
>> +	postamble[count++] = CP_WAIT_REG_MEM_2_POLL_ADDR_HI(0);
>> +	postamble[count++] = CP_WAIT_REG_MEM_3_REF(0x1);
>> +	postamble[count++] = CP_WAIT_REG_MEM_4_MASK(0x1);
>> +	postamble[count++] = CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0);
> 
> Isn't it better to just replace this with NOP packets when sysprof is
> enabled, just before triggering preemption? It will help to have an
> immediate effect.
> 
> -Akhil
> 

Mmm, this being a postamble I wonder whether we have the guarantee that 
it finishes execution before the IRQ is called so updating it doesn't 
race with the CP executing it.

>> +
>> +	a6xx_gpu->preempt_postamble_len = count;
>> +}
>> +
>>   void a6xx_preempt_fini(struct msm_gpu *gpu)
>>   {
>>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> @@ -376,6 +398,16 @@ void a6xx_preempt_init(struct msm_gpu *gpu)
>>   	a6xx_gpu->uses_gmem = 1;
>>   	a6xx_gpu->skip_save_restore = 1;
>>   
>> +	a6xx_gpu->preempt_postamble_ptr  = msm_gem_kernel_new(gpu->dev,
>> +			PAGE_SIZE, MSM_BO_WC | MSM_BO_MAP_PRIV,
>> +			gpu->aspace, &a6xx_gpu->preempt_postamble_bo,
>> +			&a6xx_gpu->preempt_postamble_iova);
>> +
>> +	preempt_prepare_postamble(a6xx_gpu);
>> +
>> +	if (IS_ERR(a6xx_gpu->preempt_postamble_ptr))
>> +		goto fail;
>> +
>>   	timer_setup(&a6xx_gpu->preempt_timer, a6xx_preempt_timer, 0);
>>   
>>   	return;
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> index 6b1888280a83..87098567483b 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> @@ -610,12 +610,15 @@ OUT_PKT4(struct msm_ringbuffer *ring, uint16_t regindx, uint16_t cnt)
>>   	OUT_RING(ring, PKT4(regindx, cnt));
>>   }
>>   
>> +#define PKT7(opcode, cnt) \
>> +	(CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15) | \
>> +		((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23))
>> +
>>   static inline void
>>   OUT_PKT7(struct msm_ringbuffer *ring, uint8_t opcode, uint16_t cnt)
>>   {
>>   	adreno_wait_ring(ring, cnt + 1);
>> -	OUT_RING(ring, CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15) |
>> -		((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23));
>> +	OUT_RING(ring, PKT7(opcode, cnt));
>>   }
>>   
>>   struct msm_gpu *a2xx_gpu_init(struct drm_device *dev);
>>
>> -- 
>> 2.46.0
>>

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>

