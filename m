Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0655976B1D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 15:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6DF10EB9B;
	Thu, 12 Sep 2024 13:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fX2gXH0Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C787810EB9A;
 Thu, 12 Sep 2024 13:49:18 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a8d2b24b7a8so397123066b.1; 
 Thu, 12 Sep 2024 06:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726148957; x=1726753757; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a2OjWKLmyq0FeFvsJuG2LPAGav69Q4+sdvymKC2ChyU=;
 b=fX2gXH0Yx6lt3ciQYfm8szxKRUjOqWl1Ojv2s605Z73013pvHNIZsixA9jWMhhLCB3
 dnVgFk5koanxB7BZYdz60VKozfLs7O8S5zYkD72T6R2Xi9+Mdmft/2mXnbFjZ8zYVHoA
 Ww6bbG2UhUvDk7vVTaSMb67UBfszBWD9dmAhG07ASxczhF/aNe7+aiaFFtFzWp/mclvh
 LGwh0z2vE5jxX4IJzxPnzi5NSoe3bqJGJR3sXuvKTj4OLR/uuCNIuPR71mE3UVxeloyC
 Se/rP7wmsujolMD5/Vb7gjUwkfrmNe5pG8N3Ep/IABqpZiqJtUfl8SfAdG5ztzKfvWT6
 Yy5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726148957; x=1726753757;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a2OjWKLmyq0FeFvsJuG2LPAGav69Q4+sdvymKC2ChyU=;
 b=Mv2e6hK30uo+ZNiozN9jqwNI9ZP818BeUWs+OL3KVNz6mxC0lJ2OFfhbcxyjGlwQGa
 nPLRO+PuuZ2ZO0nkbhohRLHZC5G7KpoytR+0NLBNSFV9WDW8xS4H/ZtMgZh62k80zDRy
 9Y5uQlaFPpE7fxrkNJHAz1YQydodzRWomV7x4KD2q070rRs72sF6uCHxCGihYeM/KkCX
 cLl+V5FOphyo8EJVQc/P4NxYBU120igt1QuNxiRUlXho8yRa+RyM6HjcpTqeE0WKG2kZ
 6LqDo4s693xWwfeeKIK84BhRGmmIJqtRtErThKdXLPiAS6Dk2pR8ZQcRn1448YjMOVxm
 s8SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoR/vE0wPPDTV6U+YsdGSst4PggOHmxIA56Aw8IquQvj6EVjjaTdTiSnM5LJlnEO0V5N9pGGjwN0k=@lists.freedesktop.org,
 AJvYcCWx0vAaZ43X9H7xAzK47W3a+krwTpOD0aebODvF2KwWJZ2LWnLLWC7Iff/tNIdNiVle5pAjn4pwyLLO@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNCDk7q+Vhezrv02IxZDuz/K7Zq9ARaiLW2gDU1Sut9KKRH6JV
 H5pfc/QgBZjHvZpSOmmV/ddoeizoh9JYVKZ2f4qrYYkaOVIhL/pQ
X-Google-Smtp-Source: AGHT+IFgwyMDp/MZic/cfpTexvX05RgAKFVg3x47fitCbcG38c/untHaUT2m9nTNxOkCOe8V0IaNlg==
X-Received: by 2002:a17:907:6d20:b0:a8d:592d:f56 with SMTP id
 a640c23a62f3a-a8ffae3a29fmr789264166b.31.1726148956571; 
 Thu, 12 Sep 2024 06:49:16 -0700 (PDT)
Received: from [192.168.1.17] (host-87-20-168-161.retail.telecomitalia.it.
 [87.20.168.161]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25833c90sm749673066b.25.2024.09.12.06.49.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 06:49:16 -0700 (PDT)
Message-ID: <83141e2a-c132-4dc0-ad23-344f745b7010@gmail.com>
Date: Thu, 12 Sep 2024 15:49:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] Preemption support for A7XX
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
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sharat Masetty <smasetty@codeaurora.org>
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
 <20240906195827.at7tgesx55xt6k5o@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <20240906195827.at7tgesx55xt6k5o@hu-akhilpo-hyd.qualcomm.com>
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

On 9/6/24 9:58 PM, Akhil P Oommen wrote:
> On Thu, Sep 05, 2024 at 04:51:18PM +0200, Antonino Maniscalco wrote:
>> This series implements preemption for A7XX targets, which allows the GPU to
>> switch to an higher priority ring when work is pushed to it, reducing latency
>> for high priority submissions.
>>
>> This series enables L1 preemption with skip_save_restore which requires
>> the following userspace patches to function:
>>
>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30544
>>
>> A flag is added to `msm_submitqueue_create` to only allow submissions
>> from compatible userspace to be preempted, therefore maintaining
>> compatibility.
>>
>> Preemption is currently only enabled by default on A750, it can be
>> enabled on other targets through the `enable_preemption` module
>> parameter. This is because more testing is required on other targets.
>>
>> For testing on other HW it is sufficient to set that parameter to a
>> value of 1, then using the branch of mesa linked above, `TU_DEBUG=hiprio`
>> allows to run any application as high priority therefore preempting
>> submissions from other applications.
>>
>> The `msm_gpu_preemption_trigger` and `msm_gpu_preemption_irq` traces
>> added in this series can be used to observe preemption's behavior as
>> well as measuring preemption latency.
>>
>> Some commits from this series are based on a previous series to enable
>> preemption on A6XX targets:
>>
>> https://lkml.kernel.org/1520489185-21828-1-git-send-email-smasetty@codeaurora.org
>>
>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> 
> Antonino, can you please test this once with per-process pt disabled to
> ensure that is not broken? It is handy sometimes while debugging.
> We just need to remove "adreno-smmu" compatible string from gpu smmu
> node in DT.
> 

Removing that from the DT causes a crash inside 
`msm_iommu_pagetable_create` as it seems `create_private_address_space` 
is assigned unconditionally in a6xx_gpu.c . I tested it with the 
following change:

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 9e5a83b885f0..4111f5fd9721 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -832,11 +832,11 @@ msm_gpu_create_private_address_space(struct 
msm_gpu *gpu, struct task_struct *ta
          * If the target doesn't support private address spaces then return
          * the global one
          */
-       if (gpu->funcs->create_private_address_space) {
-               aspace = gpu->funcs->create_private_address_space(gpu);
-               if (!IS_ERR(aspace))
-                       aspace->pid = get_pid(task_pid(task));
-       }
+       /* if (gpu->funcs->create_private_address_space) { */
+       /*      aspace = gpu->funcs->create_private_address_space(gpu); */
+       /*      if (!IS_ERR(aspace)) */
+       /*              aspace->pid = get_pid(task_pid(task)); */
+       /* } */

         if (IS_ERR_OR_NULL(aspace))
                 aspace = msm_gem_address_space_get(gpu->aspace);

and it appears to work.

> -Akhil.
> 
>> ---
>> Changes in v3:
>> - Added documentation about preemption
>> - Use quirks to determine which target supports preemption
>> - Add a module parameter to force disabling or enabling preemption
>> - Clear postamble when profiling
>> - Define A6XX_CP_CONTEXT_SWITCH_CNTL_LEVEL fields in a6xx.xml
>> - Make preemption records MAP_PRIV
>> - Removed user ctx record (NON_PRIV) and patch 2/9 as it's not needed
>>    anymore
>> - Link to v2: https://lore.kernel.org/r/20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com
>>
>> Changes in v2:
>> - Added preept_record_size for X185 in PATCH 3/7
>> - Added patches to reset perf counters
>> - Dropped unused defines
>> - Dropped unused variable (fixes warning)
>> - Only enable preemption on a750
>> - Reject MSM_SUBMITQUEUE_ALLOW_PREEMPT for unsupported targets
>> - Added Akhil's Reviewed-By tags to patches 1/9,2/9,3/9
>> - Added Neil's Tested-By tags
>> - Added explanation for UAPI changes in commit message
>> - Link to v1: https://lore.kernel.org/r/20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com
>>
>> ---
>> Antonino Maniscalco (10):
>>        drm/msm: Fix bv_fence being used as bv_rptr
>>        drm/msm: Add a `preempt_record_size` field
>>        drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
>>        drm/msm/A6xx: Implement preemption for A7XX targets
>>        drm/msm/A6xx: Sync relevant adreno_pm4.xml changes
>>        drm/msm/A6xx: Use posamble to reset counters on preemption
>>        drm/msm/A6xx: Add traces for preemption
>>        drm/msm/A6XX: Add a flag to allow preemption to submitqueue_create
>>        drm/msm/A6xx: Enable preemption for A750
>>        Documentation: document adreno preemption
>>
>>   Documentation/gpu/msm-preemption.rst               |  98 +++++
>>   drivers/gpu/drm/msm/Makefile                       |   1 +
>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   7 +-
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 331 +++++++++++++++-
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h              | 166 ++++++++
>>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c          | 430 +++++++++++++++++++++
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   9 +-
>>   drivers/gpu/drm/msm/msm_drv.c                      |   4 +
>>   drivers/gpu/drm/msm/msm_gpu_trace.h                |  28 ++
>>   drivers/gpu/drm/msm/msm_ringbuffer.h               |   8 +
>>   drivers/gpu/drm/msm/msm_submitqueue.c              |   3 +
>>   drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   7 +-
>>   .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  39 +-
>>   include/uapi/drm/msm_drm.h                         |   5 +-
>>   14 files changed, 1094 insertions(+), 42 deletions(-)
>> ---
>> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
>> change-id: 20240815-preemption-a750-t-fcee9a844b39
>>
>> Best regards,
>> -- 
>> Antonino Maniscalco <antomani103@gmail.com>
>>

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>

