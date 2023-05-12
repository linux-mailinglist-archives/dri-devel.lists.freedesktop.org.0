Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 726F3700F28
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 21:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120F610E225;
	Fri, 12 May 2023 19:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84AE610E0C2;
 Fri, 12 May 2023 19:05:40 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34CI1Cos012522; Fri, 12 May 2023 19:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=jEtN/tDjrIlbzPkhas7R2ZIqBheXt8OE6EPlEKEa16o=;
 b=R/fuD4MG5mRTKwb0T13uMMFvtvzsSCXwOZBuYj04BsB11pQrZDUnv/SciAQhkAcR+4lV
 +9Xs3Uh3tIER178kjSdnUMm9mNUuJly71FJraiyPpkjf7JkpEL7SqratDkyDALzYti2a
 CQPlkTBMsR4Q4XwHDQ3wguWe1xKazairaZaPGBvObovls3HHo2Jj0vAcpc0NpwF/sTzU
 N5YA6uFUTSULFS4sKrlOcFMiWlbmqMV04585GT10oeCPbYpOTtv9x/wypW+oktMDuGh0
 bpZgNztNBHadZ98htFdAnCaRApFJZ0aGKyj2JwbKnEDS+fOVN/00gvSFNIRURE9wPlIO kw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qhcj1t255-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 19:05:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34CJ5XAU005680
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 19:05:33 GMT
Received: from [10.110.82.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 12 May
 2023 12:05:32 -0700
Message-ID: <411b27d1-6c1d-fa7e-111a-ab8f02ab3981@quicinc.com>
Date: Fri, 12 May 2023 12:05:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v8 6/8] drm/msm/dpu: separate DSC flush update out of
 interface
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <andersson@kernel.org>
References: <1683914423-17612-1-git-send-email-quic_khsieh@quicinc.com>
 <1683914423-17612-7-git-send-email-quic_khsieh@quicinc.com>
 <91f63678-aade-2f42-1311-1bc706ebdc91@linaro.org>
 <5319b87a-9a4c-1786-9ea9-b9015ee56357@quicinc.com>
 <e3579cea-1764-26ff-ba9d-6eb23a0aaef0@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <e3579cea-1764-26ff-ba9d-6eb23a0aaef0@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: nP_9G0c-X7y2JpuvKzZLrSBYDJ7ix7hJ
X-Proofpoint-ORIG-GUID: nP_9G0c-X7y2JpuvKzZLrSBYDJ7ix7hJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_12,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 malwarescore=0 mlxlogscore=932
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305120160
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/12/2023 11:50 AM, Dmitry Baryshkov wrote:
> On 12/05/2023 21:47, Abhinav Kumar wrote:
>>
>>
>> On 5/12/2023 11:21 AM, Dmitry Baryshkov wrote:
>>> On 12/05/2023 21:00, Kuogee Hsieh wrote:
>>>> Current DSC flush update is piggyback inside dpu_hw_ctl_intf_cfg_v1().
>>>> This patch separates DSC flush away from dpu_hw_ctl_intf_cfg_v1() by
>>>> adding dpu_hw_ctl_update_pending_flush_dsc_v1() to handle both per
>>>> DSC engine and DSC flush bits at same time to make it consistent with
>>>> the location of flush programming of other dpu sub blocks.
>>>>
>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 14 ++++++++++++--
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  | 22 
>>>> ++++++++++++++++------
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  | 10 ++++++++++
>>>>   3 files changed, 38 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> index ffa6f04..5cae70e 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> @@ -1834,12 +1834,18 @@ dpu_encoder_dsc_initial_line_calc(struct 
>>>> drm_dsc_config *dsc,
>>>>       return DIV_ROUND_UP(total_pixels, dsc->slice_width);
>>>>   }
>>>> -static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
>>>> +static void dpu_encoder_dsc_pipe_cfg(struct dpu_encoder_virt *dpu_enc,
>>>> +                     struct dpu_hw_dsc *hw_dsc,
>>>>                        struct dpu_hw_pingpong *hw_pp,
>>>>                        struct drm_dsc_config *dsc,
>>>>                        u32 common_mode,
>>>>                        u32 initial_lines)
>>>>   {
>>>> +    struct dpu_encoder_phys *cur_master = dpu_enc->cur_master;
>>>> +    struct dpu_hw_ctl *ctl;
>>>> +
>>>> +    ctl = cur_master->hw_ctl;
>>>
>>> Just for my understanding: if we have a bonded DSI @ sdm845, should 
>>> both flashes go to the master CTL or each flush should go to the 
>>> corresponding CTL?
>>>
>>
>> Is this question for DSC or just general question about flush?
>>
>> I dont see an explicit DSC flush needed in sdm845 at the ctl level.
>>
>> If the question is about general flush involving two control paths, we 
>> need to combine the flushes and they goto the master only. Please 
>> refer to below part in sde_encoder.c
> And this is because we have a single CTL to flush on sm8150+, isn't it?
> 

For sm8150+, yes there will be only a single CTL to flush even in bonded 
DSI mode so only one will be flushed.

So, in general, you can refer to the function 
sde_encoder_phys_needs_single_flush() to decide if it needs 2 flushes or 
one. That accounts for the DPU rev as well.

>>
>> 4243     /* for split flush, combine pending flush masks and send to 
>> master */
>> 4244     if (pending_flush.pending_flush_mask && sde_enc->cur_master) {
>> 4245         ctl = sde_enc->cur_master->hw_ctl;
>> 4246         if (config_changed && ctl->ops.reg_dma_flush)
>> 4247             ctl->ops.reg_dma_flush(ctl, is_regdma_blocking);
>> 4248         _sde_encoder_trigger_flush(&sde_enc->base, 
>> sde_enc->cur_master,
>> 4249                         &pending_flush,
>> 4250                         config_changed);
>> 4251     }
> 
> 
