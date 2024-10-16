Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E20F9A0914
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 14:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D3410E5DE;
	Wed, 16 Oct 2024 12:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fan4SORk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50BE410E5CC;
 Wed, 16 Oct 2024 12:13:43 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-539eb97f26aso4325131e87.2; 
 Wed, 16 Oct 2024 05:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729080821; x=1729685621; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oukX+3+jCZdWa70CsJuXy2feZE0OKF+5+BRjIjFvtuo=;
 b=fan4SORkbabUjKsP7kOeoRh6aeOCQGPvCr0Rdi6wO1cP7GRTc4RdEAOHgWpTvyWq+K
 QT7sdS09SUrgcq71vFSMDbJBlXXP7z/Ec9DnJ6dDWCuqgnXv3ot0wk47lIP4w/AZ9Rvq
 yR4X/BMivWSehs2vr0GM/7HGu3b+9gjBhNS5YNA2fdXe28zcwujR7F3HgVOKa3ALTXz/
 4JBuZnnrPgsRvgqNKT0I9Ji98WvrQXOylxjT44mIgaBFGaAnAzBn95qc8keO6URCcS0Q
 ra5aJ/XxymvPIT0PUA2XYe1QD1GIKPobbh/z2hdvyRyCY6lq2C0I80eaTv09wPmFJSuQ
 SIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729080821; x=1729685621;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oukX+3+jCZdWa70CsJuXy2feZE0OKF+5+BRjIjFvtuo=;
 b=rWuAAufTu2tHq4foCiaD130LKioWLxuP6vyjr+4Q9BMk3qb64uuMBhRtN5S72+l6+g
 VvItAhcXRK0I/yhOJkXvuZIlH/oTsy/+xRDP/DI+NgNc8gHjLdM02dRLWyfkaVWhR6C/
 PBPvSYWY4y1Z4ee04J31OXKEUKV83ZkklR7khwoCr7+Dd+z6Pp7ui2akdTwCiWGRQrwq
 SHVyUwcbP5d5cvK6+eKAYnwUGM52NPefbWR0moLUP8mDgmqN5T4EOX5Em7Srv9ua4TOM
 ocWQBXifHXlz+eVA96wN+dshYTq+XuQPlU/vnLdqtnzv1heYRh/sfqKjAUEMX63eEDDR
 /0/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfQ6OMYVXJmzIbxdhK642XFzUnjzYYiisDuTFHobLtDGjKlQjd0HBYPB4S0Q9eUXu6xI9JiOKS/HOV@lists.freedesktop.org,
 AJvYcCVnMdZZg5jTKlboe/EYW8BrMSJpmYiXOItxJqQX1E3+9zXem3z8/Tsb0HIhFAigyK43sgw5+/j6Jm0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzh4baWsKukVLVkyVIf9kIUEsa5agmAdMO9Cb4MQhdh+LVBJ/5D
 XsTx6ek2QaJ2Wd6CqEC8xNMXw0plUpU1GFXw1cL/dxpVe/+4gkki
X-Google-Smtp-Source: AGHT+IEjktlb7t+M19/RjoKUQZJoAvZfPZ5ttJRcYn6zBGsqkiOPb1LXIsCLUiPkaltBF4/BMPKyBQ==
X-Received: by 2002:a05:6512:2201:b0:52f:1a0:b49 with SMTP id
 2adb3069b0e04-539da4e2d8bmr8251836e87.31.1729080820891; 
 Wed, 16 Oct 2024 05:13:40 -0700 (PDT)
Received: from [192.168.1.17] (host-80-104-113-188.retail.telecomitalia.it.
 [80.104.113.188]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a29718b84sm177712966b.29.2024.10.16.05.13.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2024 05:13:40 -0700 (PDT)
Message-ID: <eb1a0381-05c3-4ef8-b6de-96824d587a7d@gmail.com>
Date: Wed, 16 Oct 2024 14:13:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v8,09/12] drm/msm/a6xx: Add traces for preemption
To: Kees Bakker <kees@ijzerbout.nl>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20241003-preemption-a750-t-v8-9-5c6cb9f256e0@gmail.com>
 <1b9afb20-d608-464c-ae6b-c535564b7e5a@ijzerbout.nl>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <1b9afb20-d608-464c-ae6b-c535564b7e5a@ijzerbout.nl>
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

On 10/8/24 11:10 PM, Kees Bakker wrote:
> Op 03-10-2024 om 18:12 schreef Antonino Maniscalco:
>> Add trace points corresponding to preemption being triggered and being
>> completed for latency measurement purposes.
>>
>> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> Tested-by: Rob Clark <robdclark@gmail.com>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  6 ++++++
>>   drivers/gpu/drm/msm/msm_gpu_trace.h       | 28 +++++++++++++++++++++ 
>> +++++++
>>   2 files changed, 34 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/ 
>> drm/msm/adreno/a6xx_preempt.c
>> index 
>> 21e333cb6342d33425eb96f97bcc853e9b041b36..6803d5af60cc8fb0f2a52ee160ffdbf0e8ef0209 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> @@ -7,6 +7,7 @@
>>   #include "a6xx_gpu.h"
>>   #include "a6xx_gmu.xml.h"
>>   #include "msm_mmu.h"
>> +#include "msm_gpu_trace.h"
>>   /*
>>    * Try to transition the preemption state from old to new. Return
>> @@ -174,6 +175,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
>>       set_preempt_state(a6xx_gpu, PREEMPT_NONE);
>> +    trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
>> +
>>       /*
>>        * Retrigger preemption to avoid a deadlock that might occur 
>> when preemption
>>        * is skipped due to it being already in flight when requested.
>> @@ -294,6 +297,9 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>>        */
>>       ring->restore_wptr = false;
>> +    trace_msm_gpu_preemption_trigger(a6xx_gpu->cur_ring->id,
>> +        ring ? ring->id : -1);
>> +
> There is no need for the ternary operator. "ring" should be non-NULL, 
> otherwise the code would have already crashed.
> So the change can just be
>      trace_msm_gpu_preemption_trigger(a6xx_gpu->cur_ring->id, ring->id);

You are right, we had a similar cleanup but I missed this particular 
one, thanks for pointing me at it! I apologize for the late response but 
I've been at XDC and therefore unable to look at my email. I will point 
this out to Rob since this series is in msm-next to see if I need to 
send a separate patch to clean this.

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>
