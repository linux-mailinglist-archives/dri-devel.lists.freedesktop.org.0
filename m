Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 424FCBCF5F0
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 15:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5026310E306;
	Sat, 11 Oct 2025 13:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m/G/nFl5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B04E10E2ED
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 13:48:12 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b48d8deafaeso662374366b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 06:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760190491; x=1760795291; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ij0pRbpZK7DlOFmMLygfu4zYOW6yym5MECdSzEWg690=;
 b=m/G/nFl5VOQALgg1CyrCPt9G1Oqtv28w+jgI60yHQUu/1dmKu5at4iLLftnoZVnblE
 CxKNONu/IB3OuXFAeStVkgHwa3NxBcOPjuzlap98cx/D3F2zQJCmzXgHckjpYJdPmc+a
 NtjnB855yiAPCU/hEZd5qyBGCTTyDMujJSGx/+0FUFQadYg5V7j2cIVJBjQlY5oBTVBi
 iA3wnNaKxtVONFuC4tHvFDJadVgAT9+bBUVsqW5R74V9Ayjjibz0sw47Wg9HSF47Hb8L
 pod9/OsxxPKlOBy9iUYGe0cyfrYlnEMReDqE5rAHJDit5xOfIhemD24waK7dEEvCy9Iu
 BroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760190491; x=1760795291;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ij0pRbpZK7DlOFmMLygfu4zYOW6yym5MECdSzEWg690=;
 b=Vq1e8uEAiso8+VZBXDUKK3BVjthMXaTeQ0c47fsrSOFdtT//Y4Bscx9zNTGGnoutbC
 DqMKf5EPkkrU/v1YnsN48VemoLAiaVFNCvwexBHdDTZOmq6olBcNsmmnn7wenF1CHT5B
 l44sesyvXAXOJdnyW04bnGvlDaoQWwcb4OIKyizD8DzLRsb/gYxp3v2DRngXHvZL35yO
 7keiuEuwYzkt8Vtfk0keiIM7Kpoqdv3oovQw+TFAuLLKG3lJ1jkgiqPQWN2andKjbyK9
 7tWsC7Sw9+YEGAK15nIkUsqI07EOUuDJHXS57MlH2MvnNGLNJg+4LgmFL0Row5TBjSmt
 hC8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUam9AuVqlfXfWd4IzHYsRFkdLq8jAG6Z9e8aThghQNjPL9JMtMXgg5tO79Qm0BcmSC1TwqBt3ymI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtoJgj/GfALnb0Wqt5qg5w9j7G1jz3vVSlJHJiIz0R2bkJJBXU
 SKGnjdaMOu8NTcA5VpB32mYycEuVeimH8NO8lHBz+tf2GhcfAM7LbYQ=
X-Gm-Gg: ASbGncvHurxUXFXW4RML5PY6C33n6JChFu8rE9qGXazr9N0Mr9EWmSqJ2uGgdN/1B5O
 gMaBxW/8uQhins1S1q4t2GRI9ZUlmg1AmV8a4J9sNVAAodvuw6I6aFCQe32qwV+wIAmba+5whBu
 bmqGhrhuReKpZROPaAWudXPaMkkgdkragjHqU7C5/S/uFhYS7ErY5/cX2M+dZjmRvwDRdUsfVz6
 4wQk61P26NiKDnL56sQQGzO32c2l9UxPwdK0zRAi/FJqu5E41gG1oJpSwyGvqqYHnwavjrCFcNm
 2IicTXe4uUNaq3xB6UWVD474vTJaHXEg2qtF0U1Q2P8xA7mJw29lTgSoAa6K3u1NA1ghxUlO+Ku
 dAJwVPQzDPgrCELiwl4jE0+/aM4G4XGRAabS6Q858EDqurCKzTypWxf81rtIipX/xNCWMlxDClX
 C4lr1vD9GP0kzv5h0anVJ4BX3MYDWv
X-Google-Smtp-Source: AGHT+IFd9B6gVvxY8KSFltf5N9REtQSNTlL7T1T8UAzp0xhQwwjQWYW8Is6AW0R0K0MvjyN1BJ+sLw==
X-Received: by 2002:a17:907:843:b0:b40:98b1:7457 with SMTP id
 a640c23a62f3a-b50ac5d0901mr1418839266b.47.1760190490424; 
 Sat, 11 Oct 2025 06:48:10 -0700 (PDT)
Received: from [192.168.1.17] (host-87-19-169-144.retail.telecomitalia.it.
 [87.19.169.144]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d2a76499sm498766966b.0.2025.10.11.06.48.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Oct 2025 06:48:10 -0700 (PDT)
Message-ID: <f99f1fcb-2352-42eb-94b8-c7efa497caa2@gmail.com>
Date: Sat, 11 Oct 2025 15:48:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: make sure last_fence is always updated
To: Alexey Minnekhanov <alexeymin@postmarketos.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251010-close_fence_wait_fix-v2-1-adb332dbff65@gmail.com>
 <39a7f9a7-b97c-4851-9a00-ab926967d7c8@postmarketos.org>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <39a7f9a7-b97c-4851-9a00-ab926967d7c8@postmarketos.org>
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

On 10/10/25 9:09 PM, Alexey Minnekhanov wrote:
> On 10.10.2025 17:39, Anna Maniscalco wrote:
>> Update last_fence in the vm-bind path instead of kernel managed path.
>>
>> last_fence is used to wait for work to finish in vm_bind contexts but 
>> not
>> used for kernel managed contexts.
>>
>> This fixes a bug where last_fence is not waited on context close leading
>> to faults as resources are freed while in use.
>>
>> Fixes: 92395af63a99 ("drm/msm: Add VM_BIND submitqueue")
>> ---
>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>> ---
>> Changes in v2:
>> - Only update last_fence on vm_bind path
>> - Link to v1: 
>> https://lore.kernel.org/r/20251010-close_fence_wait_fix-v1-1-fd3e394dcadd@gmail.com
>> ---
>>   drivers/gpu/drm/msm/msm_gem_submit.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c 
>> b/drivers/gpu/drm/msm/msm_gem_submit.c
>> index 
>> 3ab3b27134f93b01236fec5833a18a6e2ad2cf5e..75d9f357437006ff261db148901e176eae670d41 
>> 100644
>> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
>> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
>> @@ -414,6 +414,11 @@ static void submit_attach_object_fences(struct 
>> msm_gem_submit *submit)
>>                        submit->user_fence,
>>                        DMA_RESV_USAGE_BOOKKEEP,
>>                        DMA_RESV_USAGE_BOOKKEEP);
>> +
>> +        last_fence = vm->last_fence;
>> +        vm->last_fence = dma_fence_unwrap_merge(submit->user_fence, 
>> last_fence);
>> +        dma_fence_put(last_fence);
>> +
>>           return;
>>       }
>>   @@ -427,10 +432,6 @@ static void submit_attach_object_fences(struct 
>> msm_gem_submit *submit)
>>               dma_resv_add_fence(obj->resv, submit->user_fence,
>>                          DMA_RESV_USAGE_READ);
>>       }
>> -
>> -    last_fence = vm->last_fence;
>> -    vm->last_fence = dma_fence_unwrap_merge(submit->user_fence, 
>> last_fence);
>> -    dma_fence_put(last_fence);
>>   }
>>     static int submit_bo(struct msm_gem_submit *submit, uint32_t idx,
>>
>> ---
>> base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
>> change-id: 20251009-close_fence_wait_fix-00e1c2521eee
>>
>> Best regards,
>
> Hi!
>
> Since 6.17 I'm seeing gpu faults that were not present in 6.16, they
> look like [1].
>
> I was hoping this patch can fix it, because faults go away if I comment
> out put_iova_spaces() inside msm_gem_close(), and this patch mentions
> close path and faults together, ... but no. Perhaps something else is
> wrong somewhere?
>
> [1] https://paste.sr.ht/~minlexx/09a9b3d4bfff3e7be3e96cd88fe8cf34621cb655
>
> -- 
> Regards,
> Alexey Minnekhanov
>
If that fault appears when closing applications (which sounds likely 
given your workaround) then yes, this is very much the kind of fault 
this patch intends to fix.

Might be worth a try with this patch to see if it helps with your case.

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

