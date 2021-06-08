Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B456D39FB52
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 17:56:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39376E201;
	Tue,  8 Jun 2021 15:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB88B6E201
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 15:56:28 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id 93so8295741qtc.10
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 08:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SvrvGcdTqd/A2IzqKVxAjzaPvjwWLLId9Ilxa/8ESFQ=;
 b=TGN6mpHcaPFQwHVw/GHM7ip0el1hd+0GbdCjU7WFXQjIeCWukpCfBh8rMkDIHRdosp
 Q/LfJzQq7YCqM7ulA9Kg9TU02S0vhVEVeohZ8FHyWFLQ8d7dKe9CMMYkVTfvKgQBUc1q
 gpQWsG9Cx4HioXDP4E7cBUteCE5WUgXDnzHrmpn/qVQTEuEMNT41YRN+fUY/jUt+u1eM
 AXtwi4Zd9ZuwfRHh0bOxl1UYTGZDg6GM6nB//CR9MshABAVf8HuWx3+MXKq4+i51En1C
 Yj7hqYtCJc/4fgsc5rh1FlzLxQ7EEvICLUzEsSaDKeajNFR1fip2MmgC+oHi2l9VqD5l
 wonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SvrvGcdTqd/A2IzqKVxAjzaPvjwWLLId9Ilxa/8ESFQ=;
 b=FxYRzVcPMGAg9AtrRsKZH+lZb+apzi8OsnXvqMSj6Inha8R5PRakZjvmUvYqb48dvU
 jHFfSciv9oALIht42tMxB4BFbTE+ate4JCEHCo39lTN1t4CrQH2H+IKBY8zO6CQzmtjU
 2uRUNfNd1r+YUNX4RUvPkJ6OAH+CfjHa+fdA9lAWL6Jq7uYmcStuiBo5CA+OTABv8Y/L
 WameNElb3IiylANkMhP2KHSumNsRxOlLZCbOReJOROMdelgQiKKlOF/6T3wuaJ6a8ztg
 3bMSrRQsIzIJS0hBTzY9rBB0ivRxam4AZPoAte54cUBhqGn7YxM1XCklSLY2GLQwcZXU
 ZwuA==
X-Gm-Message-State: AOAM533ZM+6SB7mz5We6QGrYjSv7qcajPqmPj+PimCPhjxTzhXk+Zgjl
 LfauK38NoIame3Q8tK4BivRETQ==
X-Google-Smtp-Source: ABdhPJy/UH8rRqmpAvUYWlHIcj680L6hW8fGJr7C6UkJboop+ydDiBFqBIFuB1C1L+iH8lasHCi7vw==
X-Received: by 2002:a05:622a:587:: with SMTP id
 c7mr21989371qtb.315.1623167787791; 
 Tue, 08 Jun 2021 08:56:27 -0700 (PDT)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca.
 [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id c68sm12078843qkd.112.2021.06.08.08.56.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 08:56:27 -0700 (PDT)
Subject: Re: [PATCH v2 2/8] drm/msm/a6xx: use AOP-initialized PDC for a650
To: Akhil P Oommen <akhilpo@codeaurora.org>, freedreno@lists.freedesktop.org
References: <20210513171431.18632-1-jonathan@marek.ca>
 <20210513171431.18632-3-jonathan@marek.ca>
 <bd5dc0e5-2c49-31fe-a290-0d8e75b45c94@codeaurora.org>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <b16de5ab-1485-a814-0885-c266a8706f0c@marek.ca>
Date: Tue, 8 Jun 2021 11:54:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <bd5dc0e5-2c49-31fe-a290-0d8e75b45c94@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/31/21 3:24 AM, Akhil P Oommen wrote:
> On 5/13/2021 10:43 PM, Jonathan Marek wrote:
>> SM8250 AOP firmware already sets up PDC registers for us, and it only 
>> needs
>> to be enabled. This path will be used for other newer GPUs.
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 21 ++++++++++++++++-----
>>   1 file changed, 16 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c 
>> b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 3d55e153fa9c..c1ee02d6371d 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -512,19 +512,26 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu 
>> *gmu)
>>       struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>>       struct platform_device *pdev = to_platform_device(gmu->dev);
>>       void __iomem *pdcptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc");
>> -    void __iomem *seqptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
>> +    void __iomem *seqptr;
>>       uint32_t pdc_address_offset;
>> +    bool pdc_in_aop = false;
>> -    if (!pdcptr || !seqptr)
>> +    if (!pdcptr)
>>           goto err;
>> -    if (adreno_is_a618(adreno_gpu) || adreno_is_a640(adreno_gpu))
>> +    if (adreno_is_a650(adreno_gpu))
>> +        pdc_in_aop = true;
>> +    else if (adreno_is_a618(adreno_gpu) || adreno_is_a640(adreno_gpu))
>>           pdc_address_offset = 0x30090;
>> -    else if (adreno_is_a650(adreno_gpu))
>> -        pdc_address_offset = 0x300a0;
>>       else
>>           pdc_address_offset = 0x30080;
>> +    if (!pdc_in_aop) {
>> +        seqptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
>> +        if (!seqptr)
>> +            goto err;
>> +    }
>> +
>>       /* Disable SDE clock gating */
>>       gmu_write_rscc(gmu, REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0, BIT(24));
>> @@ -556,6 +563,9 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>>           gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 4, 
>> 0x0020e8a8);
>>       }
>> +    if (pdc_in_aop)
>> +        goto setup_pdc;
>> +
>>       /* Load PDC sequencer uCode for power up and power down sequence */
>>       pdc_write(seqptr, REG_A6XX_PDC_GPU_SEQ_MEM_0, 0xfebea1e1);
>>       pdc_write(seqptr, REG_A6XX_PDC_GPU_SEQ_MEM_0 + 1, 0xa5a4a3a2);
>> @@ -596,6 +606,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>>       pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_DATA + 8, 0x3);
>>       /* Setup GPU PDC */
>> +setup_pdc:
>>       pdc_write(pdcptr, REG_A6XX_PDC_GPU_SEQ_START_ADDR, 0);
>>       pdc_write(pdcptr, REG_A6XX_PDC_GPU_ENABLE_PDC, 0x80000001);
>>
> 
> We can simply swap the order of PDC and rsc programming here and skip 
> pdc sequence to jump to the rscc programming for a650. This is the order 
> followed in the downstream driver anyway.
> 
> -Akhil.

The order is the same as the msm-4.19 kernel (msm-4.19 is what a650 
hardware are using).

Looks like the order was swapped for the msm-5.4 kernel, but if the 
order isn't important, I think it is preferable to keep the current 
order (to avoid a large diff mainly).
