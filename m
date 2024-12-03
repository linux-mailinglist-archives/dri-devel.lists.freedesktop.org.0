Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 565369E2B18
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 19:39:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E404110EB12;
	Tue,  3 Dec 2024 18:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G0Zm8b9/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C9210E193;
 Tue,  3 Dec 2024 13:10:03 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2ffc016f301so59656811fa.1; 
 Tue, 03 Dec 2024 05:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733231401; x=1733836201; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vBpVYUR537Z/UcSm2SUw7xuU7Lh2NWpzO6bN06e40uU=;
 b=G0Zm8b9/i7vEtKmoGIm0Y4AB10aS5YDL40cjMZpmToIWQ7te4kLX+4Lpt21hxS42xA
 zsi9ksSuwbKodis3i5c8DPysOwnQv9v1VrUV44sMel3r3vZY9zE3MIkF5K0T8TIcUDMk
 dLkXwLG0HeR9SYmsqQSBDIdqjEGkIKIhSvfZiBcUySv9fSfUgOcuLfzTW/KHUYgCUl+3
 2Os+o3m6hr4fYwB/q/KlJ77Wn5It5UjB0F0AC01M1uC6wJIEV1iatyrLdzQqm3+t0XxU
 q6twFhtQHqo/NLDv6itTETQ7y5+Nepvz08aET5GIIZcs+gQ0//Lfku44nxNEQwWssVpT
 TCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733231401; x=1733836201;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vBpVYUR537Z/UcSm2SUw7xuU7Lh2NWpzO6bN06e40uU=;
 b=HDpdIi5JvGB3bFFQR2jkYgRhe8XNNu0SiOCCeySgXzubfE0OGGej0mLToLYdJXlMVD
 0JZX4f+EXjKapF7qxQ6MFiyaUW2oV1DOATD4Ar8YsbsgTxXWAhbMT1c+COdsHM1uw1j4
 m4qmrobXYhSdFUIsrb7tu2ADk2BNKzJaRKahi6adGSvN7R8P+g1LCoLkTuGyzFy/quog
 kkmh+1jBNiVZCwRJOU92pEMJhFd9BSFrTAMlXT6XshJc/dmvmBe8yXfICE+KadyyIMtn
 ci+zLIgjXkgmney8YYyQhYkJv0Wjnffh+CZeD5yHW2f5IWFRwYnOcQHRUqd+VHw7xX2e
 JRyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWShC5gkUKESRYJMKQm70f4Em9wewITChFnP7mvMWe5FUblxsvZPjuc/hY5cSWJg5fy5F14oZ6wmKCq@lists.freedesktop.org,
 AJvYcCXL4gz2IdtWs6I7t/Eyhl3PcqHTE7oPxVUHiSeiBsOVyAP8EcY7bcDPn0xOWw9M3gU5A3QQG9cRp0M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzR7dElBWQ6XI+dMwwwpfWEwDbSwOLleSByv+gSUVw7k78FcO9R
 kYEJZfHXfmcuTc2Z3tJzhx50rO0JNzyUX57f/wVSmMqXAyvrOTAq
X-Gm-Gg: ASbGncuYMgkO5Z4jxE7fHhX1L3WFPYn0aeCAqDkRJcaWGFYRKs231Qta2rG4/gFdZFW
 dxPH7U9W2y9Agk0CSCHHRf72SYP/XDbl7U4r/DSLP310icPinjwPpiDMfimrelbm7nOgwMQ1pDc
 NQlpNsyhy0pe35mwlSyJ94JSNkAw7hbjRMhKYiTihj3AiiHGxYSaxnThbj96znFV1fXt1BePigz
 9yAdd6UeO/mFIznc9lhrqALdCCBX3YK1zdP9nIeST+r8U6X+wwc/dvn/ZR0Z4w=
X-Google-Smtp-Source: AGHT+IE44eehjh4J99/+1OuXnz12zNWYEYZrb0qp3hsM6WiSlfMd9BI6rWO85gTg6shNHsRsITMGNA==
X-Received: by 2002:a2e:bc07:0:b0:2ff:ce85:8c97 with SMTP id
 38308e7fff4ca-30009c6cdfdmr17644481fa.27.1733231400727; 
 Tue, 03 Dec 2024 05:10:00 -0800 (PST)
Received: from [192.168.50.169] ([195.136.68.87])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30014797f5csm285571fa.91.2024.12.03.05.09.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 05:10:00 -0800 (PST)
Message-ID: <b63d73ce-0845-4c0b-a110-4e10b8f587eb@gmail.com>
Date: Tue, 3 Dec 2024 14:09:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/msm: Expose uche trap base via uapi
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20241203095920.505018-1-dpiliaiev@igalia.com>
 <20241203095920.505018-2-dpiliaiev@igalia.com>
 <lhi5ni5i4kuwzu2627nf5pnhhzcx7rglza5lxeadpkdekwtisj@3cacpo2r3tzx>
Content-Language: en-US
From: Danylo <danylo.piliaiev@gmail.com>
In-Reply-To: <lhi5ni5i4kuwzu2627nf5pnhhzcx7rglza5lxeadpkdekwtisj@3cacpo2r3tzx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 03 Dec 2024 18:39:38 +0000
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




On 12/3/24 13:52, Dmitry Baryshkov wrote:
> On Tue, Dec 03, 2024 at 10:59:20AM +0100, Danylo Piliaiev wrote:
>> This adds MSM_PARAM_UCHE_TRAP_BASE that will be used by Mesa
>> implementation for VK_KHR_shader_clock and GL_ARB_shader_clock.
> Could you please spend more words, describing what it is and why is it
> necessary for those extensions. For a5xx+ it looks like some kind of an
> internal address (what kind of?). For a4xx I'm completely lost.
Yes, my bad. On at least a6xx+, shader could read 64b ALWAYSON counter
from UCHE_TRAP_BASE+0 address. We use it to implement VK_KHR_shader_clock:
  "This extension advertises the SPIR-V ShaderClockKHR capability for 
Vulkan, which
   allows a shader to query a real-time or monotonically incrementing 
counter at
   the subgroup level or across the device level."
And there is no other proper way to get such counter. Same with 
GL_ARB_shader_clock.

Not sure what's there on older gens, I exposed the value on them for the
completeness sake. But I don't know whether it is desired or not (I 
don't expect
the value being read and used on a4xx/a5xx in Mesa).

>> Signed-off-by: Danylo Piliaiev <dpiliaiev@igalia.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  6 ++++--
>>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 10 ++++++----
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 12 +++++++-----
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.c |  3 +++
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 ++
>>   include/uapi/drm/msm_drm.h              |  1 +
>>   6 files changed, 23 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
>> index 50c490b492f0..f1b18a6663f7 100644
>> --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
>> @@ -251,8 +251,8 @@ static int a4xx_hw_init(struct msm_gpu *gpu)
>>   		gpu_write(gpu, REG_A4XX_UCHE_CACHE_WAYS_VFD, 0x07);
>>   
>>   	/* Disable L2 bypass to avoid UCHE out of bounds errors */
>> -	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_LO, 0xffff0000);
>> -	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_HI, 0xffff0000);
>> +	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_LO, lower_32_bits(adreno_gpu->uche_trap_base));
>> +	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_HI, upper_32_bits(adreno_gpu->uche_trap_base));
>>   
>>   	gpu_write(gpu, REG_A4XX_CP_DEBUG, (1 << 25) |
>>   			(adreno_is_a420(adreno_gpu) ? (1 << 29) : 0));
>> @@ -693,6 +693,8 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
>>   	if (ret)
>>   		goto fail;
>>   
>> +	adreno_gpu->uche_trap_base = 0xffff0000ffff0000ull;
>> +
>>   	if (!gpu->aspace) {
>>   		/* TODO we think it is possible to configure the GPU to
>>   		 * restrict access to VRAM carveout.  But the required
>> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> index ee89db72e36e..caf2c0a7a29f 100644
>> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> @@ -750,10 +750,10 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>>   	gpu_write(gpu, REG_A5XX_UCHE_CACHE_WAYS, 0x02);
>>   
>>   	/* Disable L2 bypass in the UCHE */
>> -	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_LO, 0xFFFF0000);
>> -	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_HI, 0x0001FFFF);
>> -	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_LO, 0xFFFF0000);
>> -	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_HI, 0x0001FFFF);
>> +	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_LO, lower_32_bits(adreno_gpu->uche_trap_base));
>> +	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_HI, upper_32_bits(adreno_gpu->uche_trap_base));
>> +	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_LO, lower_32_bits(adreno_gpu->uche_trap_base));
>> +	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_HI, upper_32_bits(adreno_gpu->uche_trap_base));
>>   
>>   	/* Set the GMEM VA range (0 to gpu->gmem) */
>>   	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MIN_LO, 0x00100000);
>> @@ -1805,5 +1805,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>>   	adreno_gpu->ubwc_config.macrotile_mode = 0;
>>   	adreno_gpu->ubwc_config.ubwc_swizzle = 0x7;
>>   
>> +	adreno_gpu->uche_trap_base = 0x0001ffffffff0000ull;
>> +
>>   	return gpu;
>>   }
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 019610341df1..0ae29a7c8a4d 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1123,12 +1123,12 @@ static int hw_init(struct msm_gpu *gpu)
>>   
>>   	/* Disable L2 bypass in the UCHE */
>>   	if (adreno_is_a7xx(adreno_gpu)) {
>> -		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, 0x0001fffffffff000llu);
>> -		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, 0x0001fffffffff000llu);
>> +		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, adreno_gpu->uche_trap_base);
>> +		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, adreno_gpu->uche_trap_base);
>>   	} else {
>> -		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX, 0x0001ffffffffffc0llu);
>> -		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, 0x0001fffffffff000llu);
>> -		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, 0x0001fffffffff000llu);
>> +		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX, adreno_gpu->uche_trap_base + 0xfc0);
>> +		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, adreno_gpu->uche_trap_base);
>> +		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, adreno_gpu->uche_trap_base);
>>   	}
>>   
>>   	if (!(adreno_is_a650_family(adreno_gpu) ||
>> @@ -2533,6 +2533,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>>   		}
>>   	}
>>   
>> +	adreno_gpu->uche_trap_base = 0x1fffffffff000ull;
>> +
>>   	if (gpu->aspace)
>>   		msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
>>   				a6xx_fault_handler);
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> index 076be0473eb5..774ff6eacb9f 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>> @@ -385,6 +385,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
>>   	case MSM_PARAM_MACROTILE_MODE:
>>   		*value = adreno_gpu->ubwc_config.macrotile_mode;
>>   		return 0;
>> +	case MSM_PARAM_UCHE_TRAP_BASE:
>> +		*value = adreno_gpu->uche_trap_base;
>> +		return 0;
>>   	default:
>>   		DBG("%s: invalid param: %u", gpu->name, param);
>>   		return -EINVAL;
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> index e71f420f8b3a..9bd38dda4308 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> @@ -253,6 +253,8 @@ struct adreno_gpu {
>>   	bool gmu_is_wrapper;
>>   
>>   	bool has_ray_tracing;
>> +
>> +	u64 uche_trap_base;
>>   };
>>   #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
>>   
>> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
>> index b916aab80dde..2342cb90857e 100644
>> --- a/include/uapi/drm/msm_drm.h
>> +++ b/include/uapi/drm/msm_drm.h
>> @@ -90,6 +90,7 @@ struct drm_msm_timespec {
>>   #define MSM_PARAM_RAYTRACING 0x11 /* RO */
>>   #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
>>   #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
>> +#define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
>>   
>>   /* For backwards compat.  The original support for preemption was based on
>>    * a single ring per priority level so # of priority levels equals the #
>> -- 
>> 2.46.2
>>

