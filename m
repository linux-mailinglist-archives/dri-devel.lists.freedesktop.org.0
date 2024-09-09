Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7187972064
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 19:24:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7529110E60D;
	Mon,  9 Sep 2024 17:24:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hODIdOXS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F0810E607;
 Mon,  9 Sep 2024 17:24:22 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-53653682246so5696299e87.1; 
 Mon, 09 Sep 2024 10:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725902660; x=1726507460; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SzINnm2Ya0afTbpAAfgnl7iTn2CTj7St4+vT2jNDuJQ=;
 b=hODIdOXSxPIitgLcdW4nxof3gH1FeS98MFyy2JuUkRtnUXcPVMu7fko+ol0ZmTPrK2
 01a9JqfsCY5J5GTYoM3EI2XVOKIIw5vjsiXwLnkMkP/TRY2ZrJNLeTP2MWGRi9zYL/G+
 1l6O6bFdQ8AUezA6hoC1qtAR/xbjQZIwBt1P6RF4x3thw+11YUzevAaHkEk9G9bJf7dG
 ZQizK6GyFd7svQSnwuJtoWjd7ndWEh88u94NQdlqNepi0E6adJfkT3xgLZVzUJrdWMuc
 qy0dpp5SbAWRy2Y4fl8stt3lFpKHbHP4ihHUeEuohYZ5a8wXZOc2DFVB+/n/BRqHjGZk
 lWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725902660; x=1726507460;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SzINnm2Ya0afTbpAAfgnl7iTn2CTj7St4+vT2jNDuJQ=;
 b=EcoBnuYAtGoSgoboM0ootAjC9xT0c22WN5RuKvcxF5McSbsjgBc9mx1kTj9II6hyZK
 kAVpgjh5iVV04fxTE5MixV+rIgfsO9SZYWYXxrR26W1NwjiRA8Ddz6+mfkV5fCdcY+Wv
 8i8SNN95tQPUvkpu+SwJ6gOzY2/8Fw0Qv9ZzbE+j9ekLN9IS8fRioImXa+PkXPvzsh21
 ly33IdHfL0Y8ZR7TMH8oAZ1kTvPlP8G/LJXZ8gN6ecUvl9V4k5x1+904Nu0d4i7aOIi8
 TSSFJ0ubhWGz89jn/Qijf8pAad5YMgAXBOyJrUINbrC8RaS4RW+bywnpHh4x4tK1WxB8
 hQGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2qgbWJFfIJQppOQCCkmXP3KlmrVVoo5meQ8Wt8x3tdWa1nMddGspKjhEe7lpMzHQ2Qk7kDIt9jNA=@lists.freedesktop.org,
 AJvYcCWV+ex2KSNhpx5xQ9fsrA3nU3BVLJPhuYx9Ietq1uAWEhsrKpPwZHaZTa5c3+6DIAJqQHpdUAMomDeJ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcDPY3v58yNiwFTM7SMzKrBmFAI6U9+rO18uFH+3ZSWS2ZYMUR
 heHYKndPldCGEC1wDwpMc3x7j1TCDDbOs/1BT/CKdk1WeHbcILzL
X-Google-Smtp-Source: AGHT+IFkmOYlKeogDazf8XMnSUXgNmiAwvfoh3FwHyhTcsMIT75dT3NSUUQNHfQeSC4vcrbssokFxg==
X-Received: by 2002:a05:6512:b24:b0:535:3d15:e718 with SMTP id
 2adb3069b0e04-536587fcf0fmr8663373e87.50.1725902659411; 
 Mon, 09 Sep 2024 10:24:19 -0700 (PDT)
Received: from [192.168.1.17] (host-95-246-172-178.retail.telecomitalia.it.
 [95.246.172.178]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd52010sm3275587a12.43.2024.09.09.10.24.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 10:24:17 -0700 (PDT)
Message-ID: <86b02057-3e25-45c4-afaf-597394132a37@gmail.com>
Date: Mon, 9 Sep 2024 19:24:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] drm/msm/A6xx: Implement preemption for A7XX
 targets
From: Antonino Maniscalco <antomani103@gmail.com>
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
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
 <20240905-preemption-a750-t-v3-4-fd947699f7bc@gmail.com>
 <20240906195444.owz4eralirekr7r7@hu-akhilpo-hyd.qualcomm.com>
 <df85bf24-651c-4a35-929b-4de6c05555a1@gmail.com>
Content-Language: en-US
In-Reply-To: <df85bf24-651c-4a35-929b-4de6c05555a1@gmail.com>
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

On 9/9/24 3:15 PM, Antonino Maniscalco wrote:
> On 9/6/24 9:54 PM, Akhil P Oommen wrote:
>> On Thu, Sep 05, 2024 at 04:51:22PM +0200, Antonino Maniscalco wrote:
>>> This patch implements preemption feature for A6xx targets, this allows
>>> the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
>>> hardware as such supports multiple levels of preemption granularities,
>>> ranging from coarse grained(ringbuffer level) to a more fine grained
>>> such as draw-call level or a bin boundary level preemption. This patch
>>> enables the basic preemption level, with more fine grained preemption
>>> support to follow.
>>>
>>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
>>> ---
>>>   drivers/gpu/drm/msm/Makefile              |   1 +
>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 293 +++++++++++++++++++++-
>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 161 ++++++++++++
> ...
>>
>> we can use the lighter smp variant here.
>>
>>> +
>>> +        if (a6xx_gpu->cur_ring == ring)
>>> +            gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
>>> +        else
>>> +            ring->skip_inline_wptr = true;
>>> +    } else {
>>> +        ring->skip_inline_wptr = true;
>>> +    }
>>> +
>>> +    spin_unlock_irqrestore(&ring->preempt_lock, flags);
>>>   }
>>>   static void get_stats_counter(struct msm_ringbuffer *ring, u32 
>>> counter,
>>> @@ -138,12 +231,14 @@ static void a6xx_set_pagetable(struct a6xx_gpu 
>>> *a6xx_gpu,
>>
>> set_pagetable checks "cur_ctx_seqno" to see if pt switch is needed or
>> not. This is currently not tracked separately for each ring. Can you
>> please check that?
> 
> I totally missed that. Thanks for catching it!
> 
>>
>> I wonder why that didn't cause any gpu errors in testing. Not sure if I
>> am missing something.
>>
> 
> I think this is because, so long as a single context doesn't submit to 
> two different rings with differenr priorities, we will only be incorrect 
> in the sense that we emit more page table switches than necessary and 
> never less. However untrusted userspace could create a context that 
> submits to two different rings and that would lead to execution in the 
> wrong context so we must fix this.
> 
>>>       /*
>>>        * Write the new TTBR0 to the memstore. This is good for 
>>> debugging.
>>> +     * Needed for preemption
>>>        */
>>> -    OUT_PKT7(ring, CP_MEM_WRITE, 4);
>>> +    OUT_PKT7(ring, CP_MEM_WRITE, 5);
>>>       OUT_RING(ring, CP_MEM_WRITE_0_ADDR_LO(lower_32_bits(memptr)));
>>>       OUT_RING(ring, CP_MEM_WRITE_1_ADDR_HI(upper_32_bits(memptr)));
>>>       OUT_RING(ring, lower_32_bits(ttbr));
>>> -    OUT_RING(ring, (asid << 16) | upper_32_bits(ttbr));
>>> +    OUT_RING(ring, upper_32_bits(ttbr));
>>> +    OUT_RING(ring, ctx->seqno);
>>>       /*
>>>        * Sync both threads after switching pagetables and enable BR only
>>> @@ -268,6 +363,43 @@ static void a6xx_submit(struct msm_gpu *gpu, 
>>> struct msm_gem_submit *submit)
>>>       a6xx_flush(gpu, ring);
>>>   }
> ...
>>> +    struct a6xx_preempt_record *record_ptr =
>>> +        a6xx_gpu->preempt[ring->id] + PREEMPT_OFFSET_PRIV_NON_SECURE;
>>> +    u64 ttbr0 = ring->memptrs->ttbr0;
>>> +    u32 context_idr = ring->memptrs->context_idr;
>>> +
>>> +    smmu_info_ptr->ttbr0 = ttbr0;
>>> +    smmu_info_ptr->context_idr = context_idr;
>>> +    record_ptr->wptr = get_wptr(ring);
>>> +
>>> +    /*
>>> +     * The GPU will write the wptr we set above when we preempt. Reset
>>> +     * skip_inline_wptr to make sure that we don't write WPTR to the 
>>> same
>>> +     * thing twice. It's still possible subsequent submissions will 
>>> update
>>> +     * wptr again, in which case they will set the flag to true. 
>>> This has
>>> +     * to be protected by the lock for setting the flag and updating 
>>> wptr
>>> +     * to be atomic.
>>> +     */
>>> +    ring->skip_inline_wptr = false;
>>> +
>>> +    spin_unlock_irqrestore(&ring->preempt_lock, flags);
>>> +
>>> +    gpu_write64(gpu,
>>> +        REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO,
>>> +        a6xx_gpu->preempt_iova[ring->id] + PREEMPT_OFFSET_SMMU_INFO);
>>> +
>>> +    gpu_write64(gpu,
>>> +        REG_A6XX_CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_ADDR,
>>> +        a6xx_gpu->preempt_iova[ring->id] + 
>>> PREEMPT_OFFSET_PRIV_NON_SECURE);
>>> +
>>> +    preempt_offset_priv_secure =
>>> +        
>>> PREEMPT_OFFSET_PRIV_SECURE(adreno_gpu->info->preempt_record_size);
>>> +    gpu_write64(gpu,
>>> +        REG_A6XX_CP_CONTEXT_SWITCH_PRIV_SECURE_RESTORE_ADDR,
>>> +        a6xx_gpu->preempt_iova[ring->id] + preempt_offset_priv_secure);
>>
>> Secure buffers are not supported currently, so we can skip this and the
>> context record allocation. Anyway this has to be a separate buffer
>> mapped in secure pagetable which don't currently have. We can skip the
>> same in pseudo register packet too.
>>
> 
> Mmm it would appear that not setting it causes an hang very early. I'll 
> see if I can find out more about what is going on.

Actually it was a mistake I had made when testing. The secure record 
will be gone from the next revision.

> 
>>> +
>>> +    a6xx_gpu->next_ring = ring;
>>> +
> ...
>>>   struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>>>
>>> -- 
>>> 2.46.0
>>>
> 
> Best regards,

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>

