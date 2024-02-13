Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F71853CB9
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 22:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0C310E28A;
	Tue, 13 Feb 2024 21:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="EDkGBSFc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09AF10E28A;
 Tue, 13 Feb 2024 21:10:28 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41DK1Sud026716; Tue, 13 Feb 2024 21:10:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=Jbz2qBtbdhtdSCb+zAfl/NZGMtlAwJpe16WCbuAH2Ps=; b=ED
 kGBSFcbo62r6mCyavNVwu1g5EnTCKMCamVX4k8cSGvJpVNwQa4jyCoPIxnrEkLBK
 gu83gIk1WYTBczl/x/0o7sJKpzx354sK/yoKYGk8+21vIzl1hucXISVr5KOIrt56
 eVNU8RBuZEehE7ESMT/3CA/id4CG6qtISsqKn+CDJKNZUBic1LVVxVY8fB9iC2Lv
 vHGHYK/npjD68FfXQmD3ipOmeOAspkr8GvvLKr0NjTDU5YurJOEJh7IToDIFZdeW
 teXkREvvIjIMP01Mwc9kc7v7Hki20PEXpJKmWIh5QLalT8egp8RAvNOInMBEBpU+
 kkh6YfrHTzOxJL5qj+MA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w8eks85ry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Feb 2024 21:10:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41DLAOQb027748
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Feb 2024 21:10:25 GMT
Received: from [10.110.23.109] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 13 Feb
 2024 13:10:23 -0800
Message-ID: <9c8536d3-9292-c223-0c25-e3516cd6c402@quicinc.com>
Date: Tue, 13 Feb 2024 13:10:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 16/19] drm/msm/dpu: modify encoder programming for CDM
 over DP
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
 <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <seanpaul@chromium.org>, <swboyd@chromium.org>,
 <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
 <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-17-quic_parellan@quicinc.com>
 <CAA8EJprttbMgM=HEwctePZOwKny+nM2=qRJsPWmP4Ar0H8ATEg@mail.gmail.com>
 <217dbec7-d7b9-688f-ce40-2a62179cb507@quicinc.com>
 <CAA8EJprLvEn7ndCHqkw4RuGq_AE1nOxyONZx832Wv8Y2dGtRhQ@mail.gmail.com>
 <58578bb9-6f2e-e57f-d40e-2306c336a442@quicinc.com>
 <CAA8EJpp2AhGXg-M0KRLTRL6s5wnmcoXWra4mUHwC8U39aOcuFg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpp2AhGXg-M0KRLTRL6s5wnmcoXWra4mUHwC8U39aOcuFg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ZX4cuFL8G2GdXft27W0j3Kd3v8w5iWbd
X-Proofpoint-GUID: ZX4cuFL8G2GdXft27W0j3Kd3v8w5iWbd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-13_13,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402130167
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



On 2/13/2024 11:31 AM, Dmitry Baryshkov wrote:
> On Tue, 13 Feb 2024 at 20:46, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 2/13/2024 10:23 AM, Dmitry Baryshkov wrote:
>>> On Tue, 13 Feb 2024 at 19:32, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 2/13/2024 3:18 AM, Dmitry Baryshkov wrote:
>>>>> On Sat, 10 Feb 2024 at 03:53, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>>>>>>
>>>>>> Adjust the encoder format programming in the case of video mode for DP
>>>>>> to accommodate CDM related changes.
>>>>>>
>>>>>> Changes in v2:
>>>>>>            - Move timing engine programming to a separate patch from this
>>>>>>              one
>>>>>>            - Move update_pending_flush_periph() invocation completely to
>>>>>>              this patch
>>>>>>            - Change the logic of dpu_encoder_get_drm_fmt() so that it only
>>>>>>              calls drm_mode_is_420_only() instead of doing additional
>>>>>>              unnecessary checks
>>>>>>            - Create new functions msm_dp_needs_periph_flush() and it's
>>>>>>              supporting function dpu_encoder_needs_periph_flush() to check
>>>>>>              if the mode is YUV420 and VSC SDP is enabled before doing a
>>>>>>              peripheral flush
>>>>>>
>>>>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 35 +++++++++++++++++++
>>>>>>     .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 13 +++++++
>>>>>>     .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 19 ++++++++++
>>>>>>     drivers/gpu/drm/msm/dp/dp_display.c           | 18 ++++++++++
>>>>>>     drivers/gpu/drm/msm/msm_drv.h                 | 17 ++++++++-
>>>>>>     5 files changed, 101 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>>> index 7e7796561009a..6280c6be6dca9 100644
>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>>> @@ -222,6 +222,41 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
>>>>>>            15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
>>>>>>     };
>>>>>>
>>>>>> +u32 dpu_encoder_get_drm_fmt(struct dpu_encoder_phys *phys_enc)
>>>>>> +{
>>>>>> +       struct drm_encoder *drm_enc;
>>>>>> +       struct dpu_encoder_virt *dpu_enc;
>>>>>> +       struct drm_display_info *info;
>>>>>> +       struct drm_display_mode *mode;
>>>>>> +
>>>>>> +       drm_enc = phys_enc->parent;
>>>>>> +       dpu_enc = to_dpu_encoder_virt(drm_enc);
>>>>>> +       info = &dpu_enc->connector->display_info;
>>>>>> +       mode = &phys_enc->cached_mode;
>>>>>> +
>>>>>> +       if (drm_mode_is_420_only(info, mode))
>>>>>> +               return DRM_FORMAT_YUV420;
>>>>>> +
>>>>>> +       return DRM_FORMAT_RGB888;
>>>>>> +}
>>>>>> +
>>>>>> +bool dpu_encoder_needs_periph_flush(struct dpu_encoder_phys *phys_enc)
>>>>>> +{
>>>>>> +       struct drm_encoder *drm_enc;
>>>>>> +       struct dpu_encoder_virt *dpu_enc;
>>>>>> +       struct msm_display_info *disp_info;
>>>>>> +       struct msm_drm_private *priv;
>>>>>> +       struct drm_display_mode *mode;
>>>>>> +
>>>>>> +       drm_enc = phys_enc->parent;
>>>>>> +       dpu_enc = to_dpu_encoder_virt(drm_enc);
>>>>>> +       disp_info = &dpu_enc->disp_info;
>>>>>> +       priv = drm_enc->dev->dev_private;
>>>>>> +       mode = &phys_enc->cached_mode;
>>>>>> +
>>>>>> +       return phys_enc->hw_intf->cap->type == INTF_DP && phys_enc->hw_cdm &&
>>>>>
>>>>> Do we really need to check for phys_enc->hw_cdm here?
>>>>>
>>>>
>>>> hmmm I dont think so. If CDM was not there, then after the last patch,
>>>> YUV420 removes will not be present at all.
>>>>
>>>> The only other case I could think of was, if for some reason CDM was
>>>> used by some other interface such as WB, then hw_cdm will not be assigned.
>>>>
>>>> But, I think even for that msm_dp_needs_periph_flush() will take care of
>>>> it because we use the cached_mode which is assigned only in mode_set().
>>>>
>>>>>> +              msm_dp_needs_periph_flush(priv->dp[disp_info->h_tile_instance[0]], mode);
>>>>>> +}
>>>>>>
>>>>>>     bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
>>>>>>     {
>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>>>> index f43d57d9c74e1..211a3d90eb690 100644
>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>>>> @@ -341,6 +341,19 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
>>>>>>      */
>>>>>>     unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc);
>>>>>>
>>>>>> +/**
>>>>>> + * dpu_encoder_get_drm_fmt - return DRM fourcc format
>>>>>> + * @phys_enc: Pointer to physical encoder structure
>>>>>> + */
>>>>>> +u32 dpu_encoder_get_drm_fmt(struct dpu_encoder_phys *phys_enc);
>>>>>> +
>>>>>> +/**
>>>>>> + * dpu_encoder_needs_periph_flush - return true if physical encoder requires
>>>>>> + *     peripheral flush
>>>>>> + * @phys_enc: Pointer to physical encoder structure
>>>>>> + */
>>>>>> +bool dpu_encoder_needs_periph_flush(struct dpu_encoder_phys *phys_enc);
>>>>>> +
>>>>>>     /**
>>>>>>      * dpu_encoder_helper_split_config - split display configuration helper function
>>>>>>      *     This helper function may be used by physical encoders to configure
>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>>>>> index f562beb6f7971..3f102b2813ca8 100644
>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>>>>> @@ -413,8 +413,15 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
>>>>>>     static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
>>>>>>     {
>>>>>>            struct dpu_hw_ctl *ctl;
>>>>>> +       struct dpu_hw_cdm *hw_cdm;
>>>>>> +       const struct dpu_format *fmt = NULL;
>>>>>> +       u32 fmt_fourcc = DRM_FORMAT_RGB888;
>>>>>>
>>>>>>            ctl = phys_enc->hw_ctl;
>>>>>> +       hw_cdm = phys_enc->hw_cdm;
>>>>>> +       if (hw_cdm)
>>>>>> +               fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc);
>>>>>
>>>>> Please move if(hw_cdm) inside dpu_encoder_get_drm_fmt().
>>>>>
>>>>
>>>> I think we dont need to check for if (hw_cdm) at all.
>>>> dpu_encoder_get_drm_fmt() was just supposed to be a helper which returns
>>>> the fourcc code based on the mode. It doesnt need to know if there is
>>>> cdm or not.
>>>>
>>>> We cannot move it inside dpu_encoder_helper_phys_setup_cdm() because for
>>>> WB, we do not change the fourcc based on the mode. Its specific to video
>>>> mode.
>>>
>>> Wait... In the case of the WB we use the fourcc + modifier from the
>>> framebuffer. Ok, this looks fine then.
>>>
>>>
>>>>
>>>>>> +       fmt = dpu_get_dpu_format(fmt_fourcc);
>>>>>
>>>>> Can this be moved into dpu_encoder_helper_phys_setup_cdm() ? Or maybe
>>>>> we can move both calls into the helper? I mean, fmt_fourcc is not used
>>>>> at all if the CDM is not used.
>>>>>
>>>>
>>>> fourcc is always used to get the fmt to setup the timing engine params.
>>>> Its just that it was always hard-coded to RGB. With CDM, it can change
>>>> based on the mode. Thats why this utility was introduced to return the
>>>> fourcc from the mode information.
>>>
>>> Yes, I perfectly understand that. I just disliked the idea of calling
>>> dpu_get_dpu_format() if the result gets unused.
>>> What about passing fourcc + modifier to
>>> dpu_encoder_helper_phys_setup_cdm() instead?
>>>
>>
>> Why would it be unused? Its returning YUV420 if the mode is YUV420 and
>> RGB otherwise.
> 
> I thought about it being unused if there is no CDM in play.
> 
>>
>> We need fourcc + modifier for video mode timing engine setup. I didnt
>> quite follow your suggestion of passing these to
>> dpu_encoder_helper_phys_setup_cdm().
> 
> Ah, this is modified in the next patch...
> 
> Maybe passing fmt_fourcc from this function to setup_timing_engine
> will solve my troubles.
> 

Sorry but isnt that what the next patch is doing?

dpu_encoder_phys_vid_setup_timing_engine() gets the fourcc from 
dpu_encoder_get_drm_fmt() now.

There should be no link between setup_cdm() and setup_timing_engine().

What we have right now makes looks fine.

>>
>>
>>>>
>>>>>>
>>>>>>            DPU_DEBUG_VIDENC(phys_enc, "\n");
>>>>>>
>>>>>> @@ -423,6 +430,8 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
>>>>>>
>>>>>>            dpu_encoder_helper_split_config(phys_enc, phys_enc->hw_intf->idx);
>>>>>>
>>>>>> +       dpu_encoder_helper_phys_setup_cdm(phys_enc, fmt, CDM_CDWN_OUTPUT_HDMI);
>>>>>> +
>>>>>>            dpu_encoder_phys_vid_setup_timing_engine(phys_enc);
>>>>>>
>>>>>>            /*
>>>>>> @@ -438,6 +447,16 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
>>>>>>            if (ctl->ops.update_pending_flush_merge_3d && phys_enc->hw_pp->merge_3d)
>>>>>>                    ctl->ops.update_pending_flush_merge_3d(ctl, phys_enc->hw_pp->merge_3d->idx);
>>>>>>
>>>>>> +       if (ctl->ops.update_pending_flush_cdm && phys_enc->hw_cdm)
>>>>>> +               ctl->ops.update_pending_flush_cdm(ctl, hw_cdm->idx);
>>>>>> +
>>>>>> +       /*
>>>>>> +        * Peripheral flush must be updated whenever flushing SDP packets is needed.
>>>>>> +        * SDP packets are required for any YUV format (YUV420, YUV422, YUV444).
>>>>>> +        */
>>>>>> +       if (ctl->ops.update_pending_flush_periph && dpu_encoder_needs_periph_flush(phys_enc))
>>>>>> +               ctl->ops.update_pending_flush_periph(ctl, phys_enc->hw_intf->idx);
>>>>>> +
>>>>>>     skip_flush:
>>>>>>            DPU_DEBUG_VIDENC(phys_enc,
>>>>>>                    "update pending flush ctl %d intf %d\n",
>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>> index 4b04388719363..ebcc76ef1d590 100644
>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>> @@ -1397,6 +1397,24 @@ void __exit msm_dp_unregister(void)
>>>>>>            platform_driver_unregister(&dp_display_driver);
>>>>>>     }
>>>>>>
>>>>>> +bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
>>>>>> +                              const struct drm_display_mode *mode)
>>>>>> +{
>>>>>> +       struct dp_display_private *dp;
>>>>>> +       const struct drm_display_info *info;
>>>>>> +
>>>>>> +       dp = container_of(dp_display, struct dp_display_private, dp_display);
>>>>>> +       info = &dp_display->connector->display_info;
>>>>>> +
>>>>>> +       return dp->panel->vsc_sdp_supported && drm_mode_is_420_only(info, mode);
>>>>>> +}
>>>>>> +
>>>>>> +bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
>>>>>> +                              const struct drm_display_mode *mode)
>>>>>> +{
>>>>>> +       return msm_dp_is_yuv_420_enabled(dp_display, mode);
>>>>>> +}
>>>>>> +
>>>>>>     bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
>>>>>>     {
>>>>>>            struct dp_display_private *dp;
>>>>>> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
>>>>>> index 16a7cbc0b7dd8..b876ebd48effe 100644
>>>>>> --- a/drivers/gpu/drm/msm/msm_drv.h
>>>>>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>>>>>> @@ -387,7 +387,10 @@ void __exit msm_dp_unregister(void);
>>>>>>     int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>>>>>>                             struct drm_encoder *encoder);
>>>>>>     void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
>>>>>> -
>>>>>> +bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
>>>>>> +                              const struct drm_display_mode *mode);
>>>>>> +bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
>>>>>> +                              const struct drm_display_mode *mode);
>>>>>>     bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
>>>>>>
>>>>>>     #else
>>>>>> @@ -409,6 +412,18 @@ static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm
>>>>>>     {
>>>>>>     }
>>>>>>
>>>>>> +static inline bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
>>>>>> +                                            const struct drm_display_mode *mode)
>>>>>> +{
>>>>>> +       return false;
>>>>>> +}
>>>>>> +
>>>>>> +static inline bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
>>>>>> +                                            const struct drm_display_mode *mode)
>>>>>> +{
>>>>>> +       return false;
>>>>>> +}
>>>>>> +
>>>>>>     static inline bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
>>>>>>     {
>>>>>>            return false;
>>>>>> --
>>>>>> 2.39.2
>>>>>>
>>>>>
>>>>>
>>>
>>>
>>>
> 
> 
> 
