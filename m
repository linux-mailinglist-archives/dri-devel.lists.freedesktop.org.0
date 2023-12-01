Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3039801339
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 19:58:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539B810E932;
	Fri,  1 Dec 2023 18:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38E710E92A;
 Fri,  1 Dec 2023 18:58:06 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B1ERP1f020586; Fri, 1 Dec 2023 18:57:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=VcGcbVsiER7IXylpt+p/XM7hf0uh8sfuZGh98NivbFM=;
 b=Hry9sVZ6at5xKA0RpYdUYM4XEcfDjupxM0lWYFATtB3KVoKMHhU/NR5tqqsz5Y3u9zK9
 wEiyEHYKn1X3pjXOR2ALJO9qf+9e1WfExub8IUp0931YLjt+kSc3C/JhcitQL7kGTTy7
 eH4b5R6quB1CMk9UaUnHceqzt4RT4pGsgoSean0ZgmYtkX6ARRmVSnlSsGh7NxOCVMoy
 M8EljW52fhk02HRQ0EzuBUJj2hIk3xbk0E8tcfUrYTJOwiGMAGx1KbGJDBWsgv8vwd0x
 SWb+yPuRoPYG/nonMc1YLgnYkzOcWxmjra9abCWA2sP05pGYBgkODvmyuybtzCXgUu/l uw== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uq3r2jm1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Dec 2023 18:57:58 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B1IvvL7021118
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Dec 2023 18:57:57 GMT
Received: from [10.71.109.160] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Dec
 2023 10:57:57 -0800
Message-ID: <d93125b2-f99b-4aad-8760-533f1e8bc7d9@quicinc.com>
Date: Fri, 1 Dec 2023 10:57:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/13] drm/msm/dpu: use devres-managed allocation for
 MDP TOP
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
 <20230730011920.354575-6-dmitry.baryshkov@linaro.org>
 <4212982a-e5fc-c7f2-1b4f-96f2e1848a74@quicinc.com>
 <CAA8EJpqENCCohr+GpiqWA_DzgKUoXRWe=+B8v51mLDFWweYp3Q@mail.gmail.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <CAA8EJpqENCCohr+GpiqWA_DzgKUoXRWe=+B8v51mLDFWweYp3Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: __t2sdAC4OhwkpH6c-tlzqdTw5CYBBCy
X-Proofpoint-ORIG-GUID: __t2sdAC4OhwkpH6c-tlzqdTw5CYBBCy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_17,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011
 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 mlxlogscore=877 bulkscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010123
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/16/2023 12:27 AM, Dmitry Baryshkov wrote:
> Hi Jessica,
> 
> On Tue, 15 Aug 2023 at 23:17, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>
>>
>>
>> On 7/29/2023 6:19 PM, Dmitry Baryshkov wrote:
>>> Use devm_kzalloc to create MDP TOP structure. This allows us to remove
>>> corresponding kfree and drop dpu_hw_mdp_destroy() function.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c | 17 +++++++----------
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h |  8 +++++---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    |  5 ++---
>>>    3 files changed, 14 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
>>> index cff48763ce25..481b373d9ccb 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
>>> @@ -2,6 +2,8 @@
>>>    /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>>>     */
>>>
>>> +#include <drm/drm_managed.h>
>>
>> Hi Dmitry,
>>
>> Is it possible to put this #include in a common header? Since it seems
>> that this is a common change for a lot of patches in this series.
> 
> I personally do not like putting unused includes into common headers.
> Each file should contain includes that are used by the particular file
> only. Header should include only the files required to process
> definitions in this header.

Acked. In that case, the rest of this LGTM:

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Thanks,

Jessica Zhang

> 
>>
>> Thanks,
>>
>> Jessica Zhang
>>
>>> +
>>>    #include "dpu_hwio.h"
>>>    #include "dpu_hw_catalog.h"
>>>    #include "dpu_hw_top.h"
>>> @@ -268,16 +270,17 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
>>>                ops->intf_audio_select = dpu_hw_intf_audio_select;
>>>    }
>>>
>>> -struct dpu_hw_mdp *dpu_hw_mdptop_init(const struct dpu_mdp_cfg *cfg,
>>> -             void __iomem *addr,
>>> -             const struct dpu_mdss_cfg *m)
>>> +struct dpu_hw_mdp *dpu_hw_mdptop_init(struct drm_device *dev,
>>> +                                   const struct dpu_mdp_cfg *cfg,
>>> +                                   void __iomem *addr,
>>> +                                   const struct dpu_mdss_cfg *m)
>>>    {
>>>        struct dpu_hw_mdp *mdp;
>>>
>>>        if (!addr)
>>>                return ERR_PTR(-EINVAL);
>>>
>>> -     mdp = kzalloc(sizeof(*mdp), GFP_KERNEL);
>>> +     mdp = drmm_kzalloc(dev, sizeof(*mdp), GFP_KERNEL);
>>>        if (!mdp)
>>>                return ERR_PTR(-ENOMEM);
>>>
>>> @@ -292,9 +295,3 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(const struct dpu_mdp_cfg *cfg,
>>>
>>>        return mdp;
>>>    }
>>> -
>>> -void dpu_hw_mdp_destroy(struct dpu_hw_mdp *mdp)
>>> -{
>>> -     kfree(mdp);
>>> -}
>>> -
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
>>> index 8b1463d2b2f0..6f3dc98087df 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
>>> @@ -145,13 +145,15 @@ struct dpu_hw_mdp {
>>>
>>>    /**
>>>     * dpu_hw_mdptop_init - initializes the top driver for the passed config
>>> + * @dev:  Corresponding device for devres management
>>>     * @cfg:  MDP TOP configuration from catalog
>>>     * @addr: Mapped register io address of MDP
>>>     * @m:    Pointer to mdss catalog data
>>>     */
>>> -struct dpu_hw_mdp *dpu_hw_mdptop_init(const struct dpu_mdp_cfg *cfg,
>>> -             void __iomem *addr,
>>> -             const struct dpu_mdss_cfg *m);
>>> +struct dpu_hw_mdp *dpu_hw_mdptop_init(struct drm_device *dev,
>>> +                                   const struct dpu_mdp_cfg *cfg,
>>> +                                   void __iomem *addr,
>>> +                                   const struct dpu_mdss_cfg *m);
>>>
>>>    void dpu_hw_mdp_destroy(struct dpu_hw_mdp *mdp);
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index 6e0643ea4868..d4f4cb402663 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -820,8 +820,6 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
>>>
>>>        dpu_kms->catalog = NULL;
>>>
>>> -     if (dpu_kms->hw_mdp)
>>> -             dpu_hw_mdp_destroy(dpu_kms->hw_mdp);
>>>        dpu_kms->hw_mdp = NULL;
>>>    }
>>>
>>> @@ -1091,7 +1089,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>>>
>>>        dpu_kms->rm_init = true;
>>>
>>> -     dpu_kms->hw_mdp = dpu_hw_mdptop_init(dpu_kms->catalog->mdp,
>>> +     dpu_kms->hw_mdp = dpu_hw_mdptop_init(dev,
>>> +                                          dpu_kms->catalog->mdp,
>>>                                             dpu_kms->mmio,
>>>                                             dpu_kms->catalog);
>>>        if (IS_ERR(dpu_kms->hw_mdp)) {
>>> --
>>> 2.39.2
>>>
> 
> 
> 
> -- 
> With best wishes
> Dmitry
