Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B05767F19A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 23:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4333810E2D7;
	Fri, 27 Jan 2023 22:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8CD610E2D7;
 Fri, 27 Jan 2023 22:59:42 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30RMxcqw031151; Fri, 27 Jan 2023 22:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=LygHyUZAIPC2tTipDfkT12ByLaAtfzl3p7o0ABYR8hQ=;
 b=BB4W+DfN4xmR5gddVo4kQ2Wpn984QMWP6dm938Rsvbz1PvRdpW5y7WAu/YVV0a0pqsNs
 FBbTfNcpveV5cyRunOLNhIZb3ccFTKfndrMjRLW/obaQKdb0oN7PjPh+2XH6rtn7YBcD
 wld81NOrofgGEwPGZvr9UFYIj2CGkU12dgJxL6i1ZOZ9SVEW9ia61q1L4CrtNjUXy5PO
 nfmly3EWsspUtPihLgsCpZWdzNOjU+9+mMnckdxHXV/zGd+StWFaN8LsXLucuvID3P1I
 YhzLEG5F1gZ5nTHxPhZdaTPIz3MYUohQ8VkT2077RDC3P8Sh5LN7+qL+I35VO2omEhGy /Q== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nbp1vbn7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 22:59:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30RMxaMn007820
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 22:59:36 GMT
Received: from [10.110.19.240] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 27 Jan
 2023 14:59:35 -0800
Message-ID: <163d6bf4-9fba-04d4-f9ec-263c2cf5f2fc@quicinc.com>
Date: Fri, 27 Jan 2023 14:59:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 03/27] drm/msm/dpu: move SSPP allocation to the RM
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
 <20221229191856.3508092-4-dmitry.baryshkov@linaro.org>
 <b72dabe3-4de2-7d9a-1fca-01edfc588529@quicinc.com>
 <CAA8EJpra7UOWeB=YK8Xy5+Ro3EqShOe3HJtavqU8FSPywoukdQ@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpra7UOWeB=YK8Xy5+Ro3EqShOe3HJtavqU8FSPywoukdQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: iJdy9zCjKuTG2950PPUOt8iLgE2eX64k
X-Proofpoint-GUID: iJdy9zCjKuTG2950PPUOt8iLgE2eX64k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-27_14,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301270211
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/26/2023 9:56 PM, Dmitry Baryshkov wrote:
> On Fri, 27 Jan 2023 at 01:29, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 12/29/2022 11:18 AM, Dmitry Baryshkov wrote:
>>> Follow the example of all other hw blocks and initialize SSPP blocks in
>>> Resource Manager.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 17 ++++-------------
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c    | 22 ++++++++++++++++++++++
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h    | 12 ++++++++++++
>>>    3 files changed, 38 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> index e1cdd71716f0..e443799de2c1 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> @@ -1275,8 +1275,6 @@ static void dpu_plane_destroy(struct drm_plane *plane)
>>>                /* this will destroy the states as well */
>>>                drm_plane_cleanup(plane);
>>>
>>> -             dpu_hw_sspp_destroy(pdpu->pipe_hw);
>>> -
>> We removed from here so the flow will be msm_drm_uninit calls
>> drm_mode_config_cleanup() which will call kms->destroy() which shall
>> call dpu_rm_destroy() where this will be released now right?
> 
> Yes. _dpu_kms_hw_destroy() calls dpu_rm_destroy(), which destroys all
> RM-allocated objects.
> 
Ack, thanks
>>
>>
>>>                kfree(pdpu);
>>>        }
>>>    }
>>> @@ -1482,14 +1480,10 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>>>        pdpu->pipe = pipe;
>>>
>>>        /* initialize underlying h/w driver */
>>> -     pdpu->pipe_hw = dpu_hw_sspp_init(pipe, kms->mmio, kms->catalog);
>>> -     if (IS_ERR(pdpu->pipe_hw)) {
>>> -             DPU_ERROR("[%u]SSPP init failed\n", pipe);
>>> -             ret = PTR_ERR(pdpu->pipe_hw);
>>> +     pdpu->pipe_hw = dpu_rm_get_sspp(&kms->rm, pipe);
>>> +     if (!pdpu->pipe_hw || !pdpu->pipe_hw->cap || !pdpu->pipe_hw->cap->sblk) {
>>> +             DPU_ERROR("[%u]SSPP is invalid\n", pipe);
>>
>> I know this was existing code but can there be a case where pipe_hw->cap
>> exists but pipe_hw->cap->sblk doesnt?
> 
> There is none up to now, granted that SSPP has a lot of extra data in
> sblk. However, as you said, it's an existing code. No need to change
> it here. And it's good as a safety net.
> Granted that SRC offset is always 0, we can safely drop the src_sblk
> and always access it via main register space.
> 
Alright, since this is existing code, lets have it as a separate change.

Hence,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>>>                goto clean_plane;
>>> -     } else if (!pdpu->pipe_hw->cap || !pdpu->pipe_hw->cap->sblk) {
>>> -             DPU_ERROR("[%u]SSPP init returned invalid cfg\n", pipe);
>>> -             goto clean_sspp;
>>>        }
>>>
>>>        format_list = pdpu->pipe_hw->cap->sblk->format_list;
>>> @@ -1499,7 +1493,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>>>                                format_list, num_formats,
>>>                                supported_format_modifiers, type, NULL);
>>>        if (ret)
>>> -             goto clean_sspp;
>>> +             goto clean_plane;
>>>
>>>        pdpu->catalog = kms->catalog;
>>>
>>> @@ -1532,9 +1526,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>>>                                        pipe, plane->base.id);
>>>        return plane;
>>>
>>> -clean_sspp:
>>> -     if (pdpu && pdpu->pipe_hw)
>>> -             dpu_hw_sspp_destroy(pdpu->pipe_hw);
>>>    clean_plane:
>>>        kfree(pdpu);
>>>        return ERR_PTR(ret);
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>> index 73b3442e7467..0668009cc9ed 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>> @@ -8,6 +8,7 @@
>>>    #include "dpu_hw_lm.h"
>>>    #include "dpu_hw_ctl.h"
>>>    #include "dpu_hw_pingpong.h"
>>> +#include "dpu_hw_sspp.h"
>>>    #include "dpu_hw_intf.h"
>>>    #include "dpu_hw_wb.h"
>>>    #include "dpu_hw_dspp.h"
>>> @@ -91,6 +92,9 @@ int dpu_rm_destroy(struct dpu_rm *rm)
>>>        for (i = 0; i < ARRAY_SIZE(rm->hw_wb); i++)
>>>                dpu_hw_wb_destroy(rm->hw_wb[i]);
>>>
>>> +     for (i = 0; i < ARRAY_SIZE(rm->hw_sspp); i++)
>>> +             dpu_hw_sspp_destroy(rm->hw_sspp[i]);
>>> +
>>>        return 0;
>>>    }
>>>
>>> @@ -255,6 +259,24 @@ int dpu_rm_init(struct dpu_rm *rm,
>>>                rm->dsc_blks[dsc->id - DSC_0] = &hw->base;
>>>        }
>>>
>>> +     for (i = 0; i < cat->sspp_count; i++) {
>>> +             struct dpu_hw_sspp *hw;
>>> +             const struct dpu_sspp_cfg *sspp = &cat->sspp[i];
>>> +
>>> +             if (sspp->id < SSPP_NONE || sspp->id >= SSPP_MAX) {
>>> +                     DPU_ERROR("skip intf %d with invalid id\n", sspp->id);
>>> +                     continue;
>>> +             }
>>> +
>>> +             hw = dpu_hw_sspp_init(sspp->id, mmio, cat);
>>> +             if (IS_ERR(hw)) {
>>> +                     rc = PTR_ERR(hw);
>>> +                     DPU_ERROR("failed sspp object creation: err %d\n", rc);
>>> +                     goto fail;
>>> +             }
>>> +             rm->hw_sspp[sspp->id - SSPP_NONE] = hw;
>>> +     }
>>> +
>>>        return 0;
>>>
>>>    fail:
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>>> index 59de72b381f9..d62c2edb2460 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>>> @@ -21,6 +21,7 @@ struct dpu_global_state;
>>>     * @hw_intf: array of intf hardware resources
>>>     * @hw_wb: array of wb hardware resources
>>>     * @dspp_blks: array of dspp hardware resources
>>> + * @hw_sspp: array of sspp hardware resources
>>>     */
>>>    struct dpu_rm {
>>>        struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
>>> @@ -31,6 +32,7 @@ struct dpu_rm {
>>>        struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
>>>        struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
>>>        struct dpu_hw_blk *dsc_blks[DSC_MAX - DSC_0];
>>> +     struct dpu_hw_sspp *hw_sspp[SSPP_MAX - SSPP_NONE];
>>>    };
>>>
>>>    /**
>>> @@ -108,5 +110,15 @@ static inline struct dpu_hw_wb *dpu_rm_get_wb(struct dpu_rm *rm, enum dpu_wb wb_
>>>        return rm->hw_wb[wb_idx - WB_0];
>>>    }
>>>
>>> +/**
>>> + * dpu_rm_get_sspp - Return a struct dpu_hw_sspp instance given it's index.
>>> + * @rm: DPU Resource Manager handle
>>> + * @sspp_idx: SSPP index
>>> + */
>>> +static inline struct dpu_hw_sspp *dpu_rm_get_sspp(struct dpu_rm *rm, enum dpu_sspp sspp_idx)
>>> +{
>>> +     return rm->hw_sspp[sspp_idx - SSPP_NONE];
>>> +}
>>> +
>>>    #endif /* __DPU_RM_H__ */
>>>
> 
> 
> 
