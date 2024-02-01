Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6B6844E70
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 02:12:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12AF10FE1C;
	Thu,  1 Feb 2024 01:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99ACF10FE13;
 Thu,  1 Feb 2024 01:11:57 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40VMGPQc000542; Thu, 1 Feb 2024 01:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=pPYhNANVYBPQXPyw1Sr3f+BXA8fnFdEaiI27E3Bi4to=; b=Nd
 tyHUsCp57FbKABJiXyFdHicvH1HMqkZBbOSLRzd4NtQdt79QmwicxjjTwnc4BoVi
 kQOx4noh4XGXJ0qlCapKfKs+VOcD1Ao69UUeQSWvwmDc9H/SYWOXEc4Oykej5LJ2
 mfe2h3eizjWS9NXieUg77PsCke7cStbFiNZ3gQFzeE8ag+aWMlLUHpf6iPtrGgrr
 1TAuz0iveQpU+wTlZ4NS7LsncrhvWLgjilHvivpMN4hykB+sBdYOiL+tMbsU2mst
 Z3yT8CrnJvKcYRSBTtEncxQX8R2je9WLGGEjNCcbDWYdzVF84eEMIk2jsqPnkrIy
 Zlx6Sn5Kdn/2EurKfGkw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vygp7jpk0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Feb 2024 01:11:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4111BhXt002843
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Feb 2024 01:11:43 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 31 Jan
 2024 17:11:43 -0800
Message-ID: <45ddbe67-2803-1a33-ceb7-3411229a59f2@quicinc.com>
Date: Wed, 31 Jan 2024 17:11:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dpu: fix the programming of INTF_CFG2_DATA_HCTL_EN
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240201004737.2478-1-quic_abhinavk@quicinc.com>
 <CAA8EJpqG8C=ydpE_w7mWN-PJoAcOyZjQ5J1e7QoVY=MBUkWMxQ@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpqG8C=ydpE_w7mWN-PJoAcOyZjQ5J1e7QoVY=MBUkWMxQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: -HZs9R7-nRBCMFg_gN3ZoI6QsinADB9s
X-Proofpoint-GUID: -HZs9R7-nRBCMFg_gN3ZoI6QsinADB9s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=995 lowpriorityscore=0 clxscore=1015 adultscore=0
 mlxscore=0 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2402010007
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 quic_parellan@quicinc.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 seanpaul@chromium.org, Daniel Vetter <daniel@ffwll.ch>,
 quic_jesszhan@quicinc.com, Marijn Suijten <marijn.suijten@somainline.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/31/2024 5:05 PM, Dmitry Baryshkov wrote:
> On Thu, 1 Feb 2024 at 02:48, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> Currently INTF_CFG2_DATA_HCTL_EN is coupled with the enablement
>> of widebus but this is incorrect because we should be enabling
>> this bit independent of widebus except for cases where compression
>> is enabled in one pixel per clock mode.
>>
>> Fix this by making the condition checks more explicit and enabling
>> INTF_CFG2_DATA_HCTL_EN for all other cases when supported by DPU.
>>
>> Fixes: 3309a7563971 ("drm/msm/dpu: revise timing engine programming to support widebus feature")
>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Thank you!
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> For the reference: although it is marked as a fix, I'd prefer if this
> patch undergoes a full cycle through msm-next rather than
> fast-tracking through msm-fixes. This would allow us to catch possible
> issues. WDYT?
> 

Yes, I dont plan to take this in -fixes.

Even though this was tested with sc7280, sm8550 before posting, I would 
like to postpone it for a major release as no use-case other than YUV420 
is broken without this.

This will be taken as part of CDM over DP series as we will backout the 
other change: https://patchwork.freedesktop.org/patch/575963/

>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c       |  7 +++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h       |  7 +++++++
>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c       | 15 +++++++++------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h       |  1 +
>>   5 files changed, 25 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 83380bc92a00..467f874979d5 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -230,6 +230,13 @@ bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
>>          return dpu_enc->wide_bus_en;
>>   }
>>
>> +bool dpu_encoder_is_dsc_enabled(const struct drm_encoder *drm_enc)
>> +{
>> +       const struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
>> +
>> +       return dpu_enc->dsc ? true : false;
>> +}
>> +
>>   int dpu_encoder_get_crc_values_cnt(const struct drm_encoder *drm_enc)
>>   {
>>          struct dpu_encoder_virt *dpu_enc;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> index 4c05fd5e9ed1..fe6b1d312a74 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> @@ -158,6 +158,13 @@ int dpu_encoder_get_vsync_count(struct drm_encoder *drm_enc);
>>
>>   bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc);
>>
>> +/**
>> + * dpu_encoder_is_dsc_enabled - indicate whether dsc is enabled
>> + *                             for the encoder.
>> + * @drm_enc:    Pointer to previously created drm encoder structure
>> + */
>> +bool dpu_encoder_is_dsc_enabled(const struct drm_encoder *drm_enc);
>> +
>>   /**
>>    * dpu_encoder_get_crc_values_cnt - get number of physical encoders contained
>>    *     in virtual encoder that can collect CRC values
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> index d0f56c5c4cce..f562beb6f797 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> @@ -102,6 +102,7 @@ static void drm_mode_to_intf_timing_params(
>>          }
>>
>>          timing->wide_bus_en = dpu_encoder_is_widebus_enabled(phys_enc->parent);
>> +       timing->compression_en = dpu_encoder_is_dsc_enabled(phys_enc->parent);
>>
>>          /*
>>           * for DP, divide the horizonal parameters by 2 when
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> index 6bba531d6dc4..965692ef7892 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> @@ -163,13 +163,8 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>>          hsync_ctl = (hsync_period << 16) | p->hsync_pulse_width;
>>          display_hctl = (hsync_end_x << 16) | hsync_start_x;
>>
>> -       /*
>> -        * DATA_HCTL_EN controls data timing which can be different from
>> -        * video timing. It is recommended to enable it for all cases, except
>> -        * if compression is enabled in 1 pixel per clock mode
>> -        */
>>          if (p->wide_bus_en)
>> -               intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN;
>> +               intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
>>
>>          data_width = p->width;
>>
>> @@ -229,6 +224,14 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>>          DPU_REG_WRITE(c, INTF_CONFIG, intf_cfg);
>>          DPU_REG_WRITE(c, INTF_PANEL_FORMAT, panel_format);
>>          if (ctx->cap->features & BIT(DPU_DATA_HCTL_EN)) {
>> +               /*
>> +                * DATA_HCTL_EN controls data timing which can be different from
>> +                * video timing. It is recommended to enable it for all cases, except
>> +                * if compression is enabled in 1 pixel per clock mode
>> +                */
>> +               if (!(p->compression_en && !p->wide_bus_en))
>> +                       intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
>> +
>>                  DPU_REG_WRITE(c, INTF_CONFIG2, intf_cfg2);
>>                  DPU_REG_WRITE(c, INTF_DISPLAY_DATA_HCTL, display_data_hctl);
>>                  DPU_REG_WRITE(c, INTF_ACTIVE_DATA_HCTL, active_data_hctl);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> index 0bd57a32144a..6f4c87244f94 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> @@ -33,6 +33,7 @@ struct dpu_hw_intf_timing_params {
>>          u32 hsync_skew;
>>
>>          bool wide_bus_en;
>> +       bool compression_en;
>>   };
>>
>>   struct dpu_hw_intf_prog_fetch {
>> --
>> 2.40.1
>>
> 
> 
