Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE6B856CD2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 19:37:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C06210E9CF;
	Thu, 15 Feb 2024 18:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="g0SU3YBY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBA1110E97A;
 Thu, 15 Feb 2024 18:37:53 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41FEluha020551; Thu, 15 Feb 2024 18:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=U5s9yLWlgbRXEA95N2+CsuG9Yn0lTipB+cr5xgz0RTk=; b=g0
 SU3YBYc7487WwlA8OzoarUjKQ36zz3REpzunyAfjMBZoyeS3nlgyngpmkERqi41D
 m0gBeetOIdQE08M+ZnmSw8gW+IXeAFy81TY2rJkUsE/3NF2JnMdKX0iYhC4Fgn4n
 Xp6gaqrIFShlnciTSl3Uh6NC2It0zCdEM7O8ghXL3OqSVM+p8qoCnVSI3o7d7UUx
 A1oFu3zjGTBKTlSCnx+FyNsStTgIlCDMH3HmgOYGUidd6pU6EjvcJ7yeb8a+vLUk
 VFSBmmar5uxBzAbAvFg/ONDXMDCaAQv96/togZFWkIaNuOHrheMfWyaybHlE8r1l
 FSjPJug5tquhRUwjHPkw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w974j2eqa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Feb 2024 18:37:48 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41FIbleb010315
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Feb 2024 18:37:47 GMT
Received: from [10.110.109.215] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 15 Feb
 2024 10:37:46 -0800
Message-ID: <e98a5451-6bd7-38a7-6cf8-80aafee3edee@quicinc.com>
Date: Thu, 15 Feb 2024 10:37:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 16/19] drm/msm/dpu: modify encoder programming for CDM
 over DP
Content-Language: en-US
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
CC: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <seanpaul@chromium.org>, <swboyd@chromium.org>,
 <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
 <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
References: <20240214180347.1399-1-quic_parellan@quicinc.com>
 <20240214180347.1399-17-quic_parellan@quicinc.com>
 <CAA8EJppvxr_Cc6xYkrTPQtiDDqMrErByvz9a532ccbdDgsM7GQ@mail.gmail.com>
 <049fecef-83b4-84c2-fce1-634d3cffea95@quicinc.com>
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <049fecef-83b4-84c2-fce1-634d3cffea95@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ZdQPCJHEa87gSR7RMEg3H-wPpMzhIQhX
X-Proofpoint-ORIG-GUID: ZdQPCJHEa87gSR7RMEg3H-wPpMzhIQhX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_17,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402150150
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


On 2/15/2024 7:47 AM, Abhinav Kumar wrote:
>
>
> On 2/15/2024 12:45 AM, Dmitry Baryshkov wrote:
>> On Wed, 14 Feb 2024 at 20:04, Paloma Arellano 
>> <quic_parellan@quicinc.com> wrote:
>>>
>>> Adjust the encoder format programming in the case of video mode for DP
>>> to accommodate CDM related changes.
>>>
>>> Changes in v2:
>>>          - Move timing engine programming to a separate patch from this
>>>            one
>>>          - Move update_pending_flush_periph() invocation completely to
>>>            this patch
>>>          - Change the logic of dpu_encoder_get_drm_fmt() so that it 
>>> only
>>>            calls drm_mode_is_420_only() instead of doing additional
>>>            unnecessary checks
>>>          - Create new functions msm_dp_needs_periph_flush() and it's
>>>            supporting function dpu_encoder_needs_periph_flush() to 
>>> check
>>>            if the mode is YUV420 and VSC SDP is enabled before doing a
>>>            peripheral flush
>>>
>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 35 
>>> +++++++++++++++++++
>>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 13 +++++++
>>>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 19 ++++++++++
>>>   drivers/gpu/drm/msm/dp/dp_display.c           | 18 ++++++++++
>>>   drivers/gpu/drm/msm/msm_drv.h                 | 17 ++++++++-
>>>   5 files changed, 101 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> index 7e7796561009a..6280c6be6dca9 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> @@ -222,6 +222,41 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
>>>          15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
>>>   };
>>>
>>> +u32 dpu_encoder_get_drm_fmt(struct dpu_encoder_phys *phys_enc)
>>> +{
>>> +       struct drm_encoder *drm_enc;
>>> +       struct dpu_encoder_virt *dpu_enc;
>>> +       struct drm_display_info *info;
>>> +       struct drm_display_mode *mode;
>>> +
>>> +       drm_enc = phys_enc->parent;
>>> +       dpu_enc = to_dpu_encoder_virt(drm_enc);
>>> +       info = &dpu_enc->connector->display_info;
>>> +       mode = &phys_enc->cached_mode;
>>> +
>>> +       if (drm_mode_is_420_only(info, mode))
>>> +               return DRM_FORMAT_YUV420;
>>> +
>>> +       return DRM_FORMAT_RGB888;
>>> +}
>>> +
>>> +bool dpu_encoder_needs_periph_flush(struct dpu_encoder_phys *phys_enc)
>>> +{
>>> +       struct drm_encoder *drm_enc;
>>> +       struct dpu_encoder_virt *dpu_enc;
>>> +       struct msm_display_info *disp_info;
>>> +       struct msm_drm_private *priv;
>>> +       struct drm_display_mode *mode;
>>> +
>>> +       drm_enc = phys_enc->parent;
>>> +       dpu_enc = to_dpu_encoder_virt(drm_enc);
>>> +       disp_info = &dpu_enc->disp_info;
>>> +       priv = drm_enc->dev->dev_private;
>>> +       mode = &phys_enc->cached_mode;
>>> +
>>> +       return phys_enc->hw_intf->cap->type == INTF_DP && 
>>> phys_enc->hw_cdm &&
>>> + msm_dp_needs_periph_flush(priv->dp[disp_info->h_tile_instance[0]], 
>>> mode);
>>> +}
>>>
>>>   bool dpu_encoder_is_widebus_enabled(const struct drm_encoder 
>>> *drm_enc)
>>>   {
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>> index f43d57d9c74e1..211a3d90eb690 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>> @@ -341,6 +341,19 @@ static inline enum dpu_3d_blend_mode 
>>> dpu_encoder_helper_get_3d_blend_mode(
>>>    */
>>>   unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys 
>>> *phys_enc);
>>>
>>> +/**
>>> + * dpu_encoder_get_drm_fmt - return DRM fourcc format
>>> + * @phys_enc: Pointer to physical encoder structure
>>> + */
>>> +u32 dpu_encoder_get_drm_fmt(struct dpu_encoder_phys *phys_enc);
>>> +
>>> +/**
>>> + * dpu_encoder_needs_periph_flush - return true if physical encoder 
>>> requires
>>> + *     peripheral flush
>>> + * @phys_enc: Pointer to physical encoder structure
>>> + */
>>> +bool dpu_encoder_needs_periph_flush(struct dpu_encoder_phys 
>>> *phys_enc);
>>> +
>>>   /**
>>>    * dpu_encoder_helper_split_config - split display configuration 
>>> helper function
>>>    *     This helper function may be used by physical encoders to 
>>> configure
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>> index f02411b062c4c..e29bc4bd39208 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>> @@ -415,8 +415,15 @@ static int 
>>> dpu_encoder_phys_vid_control_vblank_irq(
>>>   static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys 
>>> *phys_enc)
>>>   {
>>>          struct dpu_hw_ctl *ctl;
>>> +       struct dpu_hw_cdm *hw_cdm;
>>> +       const struct dpu_format *fmt = NULL;
>>> +       u32 fmt_fourcc = DRM_FORMAT_RGB888;
>>>
>>>          ctl = phys_enc->hw_ctl;
>>> +       hw_cdm = phys_enc->hw_cdm;
>>> +       if (hw_cdm)
>>
>> I thought that Abhinav proposed to drop the if(hw_cdm) condition here.
>> LGTM otherwise.
>>
>
> Yes I did.
>
> This needs to be fixed in v4.


Ack, I must have forgotten to drop it, but I'll do it in the v4

>
>>> +               fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc);
>>> +       fmt = dpu_get_dpu_format(fmt_fourcc);
>>>
>>>          DPU_DEBUG_VIDENC(phys_enc, "\n");
>>>
>>> @@ -425,6 +432,8 @@ static void dpu_encoder_phys_vid_enable(struct 
>>> dpu_encoder_phys *phys_enc)
>>>
>>>          dpu_encoder_helper_split_config(phys_enc, 
>>> phys_enc->hw_intf->idx);
>>>
>>> +       dpu_encoder_helper_phys_setup_cdm(phys_enc, fmt, 
>>> CDM_CDWN_OUTPUT_HDMI);
>>> +
>>>          dpu_encoder_phys_vid_setup_timing_engine(phys_enc);
>>>
>>>          /*
>>> @@ -440,6 +449,16 @@ static void dpu_encoder_phys_vid_enable(struct 
>>> dpu_encoder_phys *phys_enc)
>>>          if (ctl->ops.update_pending_flush_merge_3d && 
>>> phys_enc->hw_pp->merge_3d)
>>> ctl->ops.update_pending_flush_merge_3d(ctl, 
>>> phys_enc->hw_pp->merge_3d->idx);
>>>
>>> +       if (ctl->ops.update_pending_flush_cdm && phys_enc->hw_cdm)
>>> +               ctl->ops.update_pending_flush_cdm(ctl, hw_cdm->idx);
>>> +
>>> +       /*
>>> +        * Peripheral flush must be updated whenever flushing SDP 
>>> packets is needed.
>>> +        * SDP packets are required for any YUV format (YUV420, 
>>> YUV422, YUV444).
>>> +        */
>>> +       if (ctl->ops.update_pending_flush_periph && 
>>> dpu_encoder_needs_periph_flush(phys_enc))
>>> +               ctl->ops.update_pending_flush_periph(ctl, 
>>> phys_enc->hw_intf->idx);
>>> +
>>>   skip_flush:
>>>          DPU_DEBUG_VIDENC(phys_enc,
>>>                  "update pending flush ctl %d intf %d\n",
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>>> b/drivers/gpu/drm/msm/dp/dp_display.c
>>> index 4b04388719363..ebcc76ef1d590 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>> @@ -1397,6 +1397,24 @@ void __exit msm_dp_unregister(void)
>>>          platform_driver_unregister(&dp_display_driver);
>>>   }
>>>
>>> +bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
>>> +                              const struct drm_display_mode *mode)
>>> +{
>>> +       struct dp_display_private *dp;
>>> +       const struct drm_display_info *info;
>>> +
>>> +       dp = container_of(dp_display, struct dp_display_private, 
>>> dp_display);
>>> +       info = &dp_display->connector->display_info;
>>> +
>>> +       return dp->panel->vsc_sdp_supported && 
>>> drm_mode_is_420_only(info, mode);
>>> +}
>>> +
>>> +bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
>>> +                              const struct drm_display_mode *mode)
>>> +{
>>> +       return msm_dp_is_yuv_420_enabled(dp_display, mode);
>>> +}
>>> +
>>>   bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
>>>   {
>>>          struct dp_display_private *dp;
>>> diff --git a/drivers/gpu/drm/msm/msm_drv.h 
>>> b/drivers/gpu/drm/msm/msm_drv.h
>>> index 16a7cbc0b7dd8..b876ebd48effe 100644
>>> --- a/drivers/gpu/drm/msm/msm_drv.h
>>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>>> @@ -387,7 +387,10 @@ void __exit msm_dp_unregister(void);
>>>   int msm_dp_modeset_init(struct msm_dp *dp_display, struct 
>>> drm_device *dev,
>>>                           struct drm_encoder *encoder);
>>>   void msm_dp_snapshot(struct msm_disp_state *disp_state, struct 
>>> msm_dp *dp_display);
>>> -
>>> +bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
>>> +                              const struct drm_display_mode *mode);
>>> +bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
>>> +                              const struct drm_display_mode *mode);
>>>   bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
>>>
>>>   #else
>>> @@ -409,6 +412,18 @@ static inline void msm_dp_snapshot(struct 
>>> msm_disp_state *disp_state, struct msm
>>>   {
>>>   }
>>>
>>> +static inline bool msm_dp_is_yuv_420_enabled(const struct msm_dp 
>>> *dp_display,
>>> +                                            const struct 
>>> drm_display_mode *mode)
>>> +{
>>> +       return false;
>>> +}
>>> +
>>> +static inline bool msm_dp_needs_periph_flush(const struct msm_dp 
>>> *dp_display,
>>> +                                            const struct 
>>> drm_display_mode *mode)
>>> +{
>>> +       return false;
>>> +}
>>> +
>>>   static inline bool msm_dp_wide_bus_available(const struct msm_dp 
>>> *dp_display)
>>>   {
>>>          return false;
>>> -- 
>>> 2.39.2
>>>
>>
>>
