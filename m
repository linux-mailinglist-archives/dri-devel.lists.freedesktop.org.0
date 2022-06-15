Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7FB54D584
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 01:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524E51139EA;
	Wed, 15 Jun 2022 23:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5421139EA;
 Wed, 15 Jun 2022 23:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655337110; x=1686873110;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/b9pZbr90c/WuZFTHtr6zt5ED9V75uDoY/DvSSd4qUs=;
 b=ogcw+mCoMYk5TUoAPgd3qXv6r74TnnlwWl+ve9JdlKbjzxWGMIb4NAi1
 TJoFeWD3sMFfiQninRVTq+tvIwxqDNF2+ZP12/7vfJnI8n0wp66nmAa6b
 pYKBfIx8qdJdnCRRRttzTFgdD3Xc9J8yY/OlHD+9hnEKHQalCIw63YORg w=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 15 Jun 2022 16:51:50 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 16:51:49 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 15 Jun 2022 16:51:49 -0700
Received: from [10.111.175.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 15 Jun
 2022 16:51:46 -0700
Message-ID: <3d38729e-9672-dbe6-c816-6346032822d8@quicinc.com>
Date: Wed, 15 Jun 2022 16:51:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v2 1/5] drm/msm/dpu: check both DPU and MDSS
 devices for the IOMMU
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220505001605.1268483-1-dmitry.baryshkov@linaro.org>
 <20220505001605.1268483-2-dmitry.baryshkov@linaro.org>
 <14f2d0e2-6c34-e244-26a4-79638b147592@quicinc.com>
 <3e3215e2-2ddc-377f-f43a-1532dabd9727@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <3e3215e2-2ddc-377f-f43a-1532dabd9727@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, Bjorn
 Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/15/2022 11:42 AM, Dmitry Baryshkov wrote:
> On 15/06/2022 20:55, Abhinav Kumar wrote:
>>
>>
>> On 5/4/2022 5:16 PM, Dmitry Baryshkov wrote:
>>> Follow the lead of MDP5 driver and check both DPU and MDSS devices for
>>> the IOMMU specifiers.
>>>
>>> Historically DPU devices had IOMMU specified in the MDSS device tree
>>> node, but as some of MDP5 devices are being converted to the supported
>>> by the DPU driver, the driver should adapt and check both devices.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 14 +++++++++++---
>>>   1 file changed, 11 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index 143d6643be53..5ccda0766f6c 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -1004,14 +1004,22 @@ static int _dpu_kms_mmu_init(struct dpu_kms 
>>> *dpu_kms)
>>>       struct msm_mmu *mmu;
>>>       struct device *dpu_dev = dpu_kms->dev->dev;
>>>       struct device *mdss_dev = dpu_dev->parent;
>>> +    struct device *iommu_dev;
>>>       domain = iommu_domain_alloc(&platform_bus_type);
>>>       if (!domain)
>>>           return 0;
>>> -    /* IOMMUs are a part of MDSS device tree binding, not the
>>> -     * MDP/DPU device. */
>>> -    mmu = msm_iommu_new(mdss_dev, domain);
>>> +    /*
>>> +     * IOMMUs can be a part of MDSS device tree binding, or the
>>> +     * MDP/DPU device.
>>> +     */
>>
>> Can you please explain this a little more?
>>
>> So even if some of the mdp5 devices are getting converted to use DPU 
>> driver, their device trees are also updated right?
> 
> No. The DT describes the device, not the Linux drivers. So while 
> updating the drivers we should not change the DT.
> 
Alright, agreed

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> In other words, if DPU driver was using mdss_dev to initialize the 
>> iommu, why should the new devices which are going to use DPU have the 
>> binding in the dpu_dev?
>>
>>
>>> +    if (dev_iommu_fwspec_get(dpu_dev))
>>> +        iommu_dev = dpu_dev;
>>> +    else
>>> +        iommu_dev = mdss_dev;
>>> +
>>> +    mmu = msm_iommu_new(iommu_dev, domain);
>>>       if (IS_ERR(mmu)) {
>>>           iommu_domain_free(domain);
>>>           return PTR_ERR(mmu);
> 
> 
