Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F709A14C7
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 23:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C484210E15A;
	Wed, 16 Oct 2024 21:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZmSrVr6y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C3710E06B;
 Wed, 16 Oct 2024 21:28:18 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-37d5689eea8so161235f8f.1; 
 Wed, 16 Oct 2024 14:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729114097; x=1729718897; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J5CWN7tpBnupHcpZl+OhrCbgO2xISPYJhOm4vkK3JRU=;
 b=ZmSrVr6ycldZLsSEIURJa6qhmf0N11OXYIHbEyvGV2qDi8y7mhPlISDOaSkJPf4M15
 Ah+ZzzFt366fHOhJXncf/0XsOIVCpl6dkpknaNuZJjIK5zPwEUOTsTlDnWJVUcOzh9OF
 9rI5PW8sjqR7iXJGpCbnWTxuW4kpWkANbygMI8GEt2deoTy1oMLlBHka26QbcE4uLGZb
 FWwZrQtFPVFeuhFBheW9klshHN90x9H9VlDdGyoo/fY7Gu/p/WgnXVSPK5ZZ6Dbl6Hhw
 ZgDgOTGL6FJclktvhPLZiUaqYFLcPTNEq7uv2rH8Z9fiT+XxI7ktSrvpTEopuErjdGP8
 O9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729114097; x=1729718897;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J5CWN7tpBnupHcpZl+OhrCbgO2xISPYJhOm4vkK3JRU=;
 b=YOsYAgIuWhRMB46mDPEArIUYn1RfhpOa9c1wCqTSiT9KzuA37RvE/2Ai9qUjMq0fcH
 iGAcP3DeMyxYk4S6OG5n/sdxIzefUwvKatl2LjbLHRpXATQ2L1JF/SKWxiHPhF7xq35c
 hywDCqwwCQdmvnc8uiQ/u3/YsP40IurjBl9NO64mT5cvVQX2s22ZQ0qzZvWtOKQkQAx/
 aZY/IHv6sGYXSWFIDlR67Klx7WLb41hU7qFcccRCH/i1aiDj8qgZfstepLS8Kz55eCis
 yuwkCq/7G4ilW69061nrRBTVl/7S++m0i1/iAedIv+KFiQgumNtsMnkO/zqMvoJj063A
 YJQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJdbXsTfZ4sG06ovUnl0VQTm9C8MLGUCoqBncjDMS//fy1pvv9lYhzqz6I1pTveZfbP3G05OXufPg=@lists.freedesktop.org,
 AJvYcCXzBaqGxHcaxR1GkrH1HBwlYFjX57jdaZROeVItPcXKH32LFrftc1ha/1TuL1PJ3LKJ0fYHT8Zov7xU@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx//WET/uoOqKqzWSysPavbryORD2hjOjp+IkEN4V98h/3PBXVQ
 r/7dwl3QQWr+nSDjfadjZscBRU0WIIcLsDG+60PEO/6AgrWdByRY
X-Google-Smtp-Source: AGHT+IG4mBL0U4ZnMOKXMqwNyakKje1boFmWs0OmDTl3djpfOcLYydP6lSw31xXpkwvjWI3DP54Brw==
X-Received: by 2002:adf:ce83:0:b0:37d:4cf9:e085 with SMTP id
 ffacd0b85a97d-37d86bdc2c4mr3677507f8f.25.1729114096729; 
 Wed, 16 Oct 2024 14:28:16 -0700 (PDT)
Received: from [192.168.1.17] (host-80-104-113-188.retail.telecomitalia.it.
 [80.104.113.188]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c98d4d680csm2061359a12.6.2024.10.16.14.28.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2024 14:28:16 -0700 (PDT)
Message-ID: <281503da-6ac3-496f-8051-d4e03979c1ef@gmail.com>
Date: Wed, 16 Oct 2024 23:28:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v8,09/12] drm/msm/a6xx: Add traces for preemption
To: Rob Clark <robdclark@gmail.com>
Cc: Kees Bakker <kees@ijzerbout.nl>, Sean Paul <sean@poorly.run>,
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
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20241003-preemption-a750-t-v8-9-5c6cb9f256e0@gmail.com>
 <1b9afb20-d608-464c-ae6b-c535564b7e5a@ijzerbout.nl>
 <eb1a0381-05c3-4ef8-b6de-96824d587a7d@gmail.com>
 <CAF6AEGu0b5EXjvjDn1DTy2zCSDp7yFpGvGoAb3Kc91Y9HK+=pg@mail.gmail.com>
Content-Language: en-US
From: Antonino Maniscalco <antomani103@gmail.com>
In-Reply-To: <CAF6AEGu0b5EXjvjDn1DTy2zCSDp7yFpGvGoAb3Kc91Y9HK+=pg@mail.gmail.com>
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

On 10/16/24 10:33 PM, Rob Clark wrote:
> On Wed, Oct 16, 2024 at 5:13 AM Antonino Maniscalco
> <antomani103@gmail.com> wrote:
>>
>> On 10/8/24 11:10 PM, Kees Bakker wrote:
>>> Op 03-10-2024 om 18:12 schreef Antonino Maniscalco:
>>>> Add trace points corresponding to preemption being triggered and being
>>>> completed for latency measurement purposes.
>>>>
>>>> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>> Tested-by: Rob Clark <robdclark@gmail.com>
>>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
>>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
>>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
>>>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  6 ++++++
>>>>    drivers/gpu/drm/msm/msm_gpu_trace.h       | 28 +++++++++++++++++++++
>>>> +++++++
>>>>    2 files changed, 34 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/
>>>> drm/msm/adreno/a6xx_preempt.c
>>>> index
>>>> 21e333cb6342d33425eb96f97bcc853e9b041b36..6803d5af60cc8fb0f2a52ee160ffdbf0e8ef0209 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>>>> @@ -7,6 +7,7 @@
>>>>    #include "a6xx_gpu.h"
>>>>    #include "a6xx_gmu.xml.h"
>>>>    #include "msm_mmu.h"
>>>> +#include "msm_gpu_trace.h"
>>>>    /*
>>>>     * Try to transition the preemption state from old to new. Return
>>>> @@ -174,6 +175,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
>>>>        set_preempt_state(a6xx_gpu, PREEMPT_NONE);
>>>> +    trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
>>>> +
>>>>        /*
>>>>         * Retrigger preemption to avoid a deadlock that might occur
>>>> when preemption
>>>>         * is skipped due to it being already in flight when requested.
>>>> @@ -294,6 +297,9 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>>>>         */
>>>>        ring->restore_wptr = false;
>>>> +    trace_msm_gpu_preemption_trigger(a6xx_gpu->cur_ring->id,
>>>> +        ring ? ring->id : -1);
>>>> +
>>> There is no need for the ternary operator. "ring" should be non-NULL,
>>> otherwise the code would have already crashed.
>>> So the change can just be
>>>       trace_msm_gpu_preemption_trigger(a6xx_gpu->cur_ring->id, ring->id);
>>
>> You are right, we had a similar cleanup but I missed this particular
>> one, thanks for pointing me at it! I apologize for the late response but
>> I've been at XDC and therefore unable to look at my email. I will point
>> this out to Rob since this series is in msm-next to see if I need to
>> send a separate patch to clean this.
> 
> Yes, please send a new commit, I don't want to re-write history on msm-next

Makes sense.
I noticed somebody else has already sent the patch for it 
https://lore.kernel.org/linux-arm-msm/20241011052315.4713-1-everestkc@everestkc.com.np/

> 
> BR,
> -R
> 
>> Best regards,
>> --
>> Antonino Maniscalco <antomani103@gmail.com>


Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>
