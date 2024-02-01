Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A74844EB0
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 02:30:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F005010FE37;
	Thu,  1 Feb 2024 01:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB25910FE36;
 Thu,  1 Feb 2024 01:30:48 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41110TIB023701; Thu, 1 Feb 2024 01:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=eYK5qJwQjU5V8FDK6tiPZD3y8H9rS/oBAAy1KcnJ0lk=; b=Ab
 rUUXkI4EmCI7rAjHkGzb2BDkfCZje7vF86RHsne30a6YLEiMFzv+HjYu0dSy6sNi
 biAW+oW16SIfWBjed4Srr2yVms6wkeVL3341gqtPC9uKKYMo679kaPwqAqwXIjpA
 7eMkzuYQkb/idB0Cr5ThCt9Pj7j+S4qdd7WUixV7QhbrZQhC7tYkd6+N92mJKxTc
 74sHn7GWAMrnFXniKEP9nkUsF/gBbbvRo55LwYo6OdTfJkgqODHiLd+ko/L6lIC5
 Zev3qykh/t836jmWaaHZFrVIrEYagxcLV21+PPxazKweQwspLMbMrAH507Gu35gT
 2Yp9qtGm7hSVtE33bAVA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vyj14aed3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Feb 2024 01:30:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4111Uj9S024725
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Feb 2024 01:30:45 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 31 Jan
 2024 17:30:44 -0800
Message-ID: <560d9344-3f09-5d2c-e74e-760d80d057e3@quicinc.com>
Date: Wed, 31 Jan 2024 17:30:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 14/17] drm/msm/dpu: modify encoder programming for CDM
 over DP
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-15-quic_parellan@quicinc.com>
 <52674357-2135-4784-a371-e7809b632c19@linaro.org>
 <d1679d6f-a388-2a13-2924-1e6040217c01@quicinc.com>
 <CAA8EJppPFuP4w-OAi0hDE36tjPXOHpigg1PMyzhkOTLL-q0VMQ@mail.gmail.com>
 <771094aa-b8d9-6e6e-1945-b66818fa6d88@quicinc.com>
 <CAA8EJprBjq8OvE2tfjZmxHfp3EbxKpWWv-xTym70t6ksBoTojQ@mail.gmail.com>
 <6495d524-c3eb-a3e5-cc9e-3b0b40bf7c35@quicinc.com>
 <CAA8EJpomaX8YzXNSweh_pEE1fJ+7yUJAQvLKPHLtSRAOHxva4Q@mail.gmail.com>
 <ba267a71-5dc4-ce87-6b9d-9fa501d69633@quicinc.com>
 <CAA8EJpq6g4a+5QEOrOgoTc+GepwU1fvM21Jd1gfzzR-HKqQc-g@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpq6g4a+5QEOrOgoTc+GepwU1fvM21Jd1gfzzR-HKqQc-g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: CmgSC2OuRSR4QFT1_njBKOm_UQYtsuWH
X-Proofpoint-ORIG-GUID: CmgSC2OuRSR4QFT1_njBKOm_UQYtsuWH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2402010010
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
Cc: neil.armstrong@linaro.org, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, quic_jesszhan@quicinc.com,
 Paloma Arellano <quic_parellan@quicinc.com>, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/29/2024 3:44 PM, Dmitry Baryshkov wrote:
> On Mon, 29 Jan 2024 at 09:08, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> On 1/28/2024 10:12 PM, Dmitry Baryshkov wrote:
>>> On Mon, 29 Jan 2024 at 07:03, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 1/28/2024 7:42 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, 29 Jan 2024 at 04:58, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 1/27/2024 9:55 PM, Dmitry Baryshkov wrote:
>>>>>>> On Sun, 28 Jan 2024 at 07:48, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 1/25/2024 1:57 PM, Dmitry Baryshkov wrote:
>>>>>>>>> On 25/01/2024 21:38, Paloma Arellano wrote:
>>>>>>>>>> Adjust the encoder format programming in the case of video mode for DP
>>>>>>>>>> to accommodate CDM related changes.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>>>>>>>>>> ---
>>>>>>>>>>       drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 16 +++++++++
>>>>>>>>>>       drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  8 +++++
>>>>>>>>>>       .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 35 ++++++++++++++++---
>>>>>>>>>>       drivers/gpu/drm/msm/dp/dp_display.c           | 12 +++++++
>>>>>>>>>>       drivers/gpu/drm/msm/msm_drv.h                 |  9 ++++-
>>>>>>>>>>       5 files changed, 75 insertions(+), 5 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>>>>>>> index b0896814c1562..99ec53446ad21 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>>>>>>> @@ -222,6 +222,22 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
>>>>>>>>>>           15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
>>>>>>>>>>       };
>>>>>>>>>>       +u32 dpu_encoder_get_drm_fmt(const struct drm_encoder *drm_enc,
>>>>>>>>>> const struct drm_display_mode *mode)
>>>>>>>>>> +{
>>>>>>>>>> +    const struct dpu_encoder_virt *dpu_enc;
>>>>>>>>>> +    const struct msm_display_info *disp_info;
>>>>>>>>>> +    struct msm_drm_private *priv;
>>>>>>>>>> +
>>>>>>>>>> +    dpu_enc = to_dpu_encoder_virt(drm_enc);
>>>>>>>>>> +    disp_info = &dpu_enc->disp_info;
>>>>>>>>>> +    priv = drm_enc->dev->dev_private;
>>>>>>>>>> +
>>>>>>>>>> +    if (disp_info->intf_type == INTF_DP &&
>>>>>>>>>> + msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]],
>>>>>>>>>> mode))
>>>>>>>>>
>>>>>>>>> This should not require interacting with DP. If we got here, we must
>>>>>>>>> be sure that 4:2:0 is supported and can be configured.
>>>>>>>> Ack. Will drop this function and only check for if the mode is YUV420.
>>>>>>>>>
>>>>>>>>>> +        return DRM_FORMAT_YUV420;
>>>>>>>>>> +
>>>>>>>>>> +    return DRM_FORMAT_RGB888;
>>>>>>>>>> +}
>>>>>>>>>>         bool dpu_encoder_is_widebus_enabled(const struct drm_encoder
>>>>>>>>>> *drm_enc)
>>>>>>>>>>       {
>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>>>>>>>>> index 7b4afa71f1f96..62255d0aa4487 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>>>>>>>>>> @@ -162,6 +162,14 @@ int dpu_encoder_get_vsync_count(struct
>>>>>>>>>> drm_encoder *drm_enc);
>>>>>>>>>>        */
>>>>>>>>>>       bool dpu_encoder_is_widebus_enabled(const struct drm_encoder
>>>>>>>>>> *drm_enc);
>>>>>>>>>>       +/**
>>>>>>>>>> + * dpu_encoder_get_drm_fmt - return DRM fourcc format
>>>>>>>>>> + * @drm_enc:    Pointer to previously created drm encoder structure
>>>>>>>>>> + * @mode:    Corresponding drm_display_mode for dpu encoder
>>>>>>>>>> + */
>>>>>>>>>> +u32 dpu_encoder_get_drm_fmt(const struct drm_encoder *drm_enc,
>>>>>>>>>> +                const struct drm_display_mode *mode);
>>>>>>>>>> +
>>>>>>>>>>       /**
>>>>>>>>>>        * dpu_encoder_get_crc_values_cnt - get number of physical encoders
>>>>>>>>>> contained
>>>>>>>>>>        *    in virtual encoder that can collect CRC values
>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>>>>>>>>> index e284bf448bdda..a1dde0ff35dc8 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>>>>>>>>> @@ -234,6 +234,7 @@ static void
>>>>>>>>>> dpu_encoder_phys_vid_setup_timing_engine(
>>>>>>>>>>       {
>>>>>>>>>>           struct drm_display_mode mode;
>>>>>>>>>>           struct dpu_hw_intf_timing_params timing_params = { 0 };
>>>>>>>>>> +    struct dpu_hw_cdm *hw_cdm;
>>>>>>>>>>           const struct dpu_format *fmt = NULL;
>>>>>>>>>>           u32 fmt_fourcc = DRM_FORMAT_RGB888;
>>>>>>>>>>           unsigned long lock_flags;
>>>>>>>>>> @@ -254,17 +255,26 @@ static void
>>>>>>>>>> dpu_encoder_phys_vid_setup_timing_engine(
>>>>>>>>>>           DPU_DEBUG_VIDENC(phys_enc, "enabling mode:\n");
>>>>>>>>>>           drm_mode_debug_printmodeline(&mode);
>>>>>>>>>>       -    if (phys_enc->split_role != ENC_ROLE_SOLO) {
>>>>>>>>>> +    hw_cdm = phys_enc->hw_cdm;
>>>>>>>>>> +    if (hw_cdm) {
>>>>>>>>>> +        intf_cfg.cdm = hw_cdm->idx;
>>>>>>>>>> +        fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc->parent, &mode);
>>>>>>>>>> +    }
>>>>>>>>>> +
>>>>>>>>>> +    if (phys_enc->split_role != ENC_ROLE_SOLO ||
>>>>>>>>>> +        dpu_encoder_get_drm_fmt(phys_enc->parent, &mode) ==
>>>>>>>>>> DRM_FORMAT_YUV420) {
>>>>>>>>>>               mode.hdisplay >>= 1;
>>>>>>>>>>               mode.htotal >>= 1;
>>>>>>>>>>               mode.hsync_start >>= 1;
>>>>>>>>>>               mode.hsync_end >>= 1;
>>>>>>>>>> +        mode.hskew >>= 1;
>>>>>>>>>
>>>>>>>>> Separate patch.
>>>>>>>> Ack.
>>>>>>>>>
>>>>>>>>>>                 DPU_DEBUG_VIDENC(phys_enc,
>>>>>>>>>> -            "split_role %d, halve horizontal %d %d %d %d\n",
>>>>>>>>>> +            "split_role %d, halve horizontal %d %d %d %d %d\n",
>>>>>>>>>>                   phys_enc->split_role,
>>>>>>>>>>                   mode.hdisplay, mode.htotal,
>>>>>>>>>> -            mode.hsync_start, mode.hsync_end);
>>>>>>>>>> +            mode.hsync_start, mode.hsync_end,
>>>>>>>>>> +            mode.hskew);
>>>>>>>>>>           }
>>>>>>>>>>             drm_mode_to_intf_timing_params(phys_enc, &mode, &timing_params);
>>>>>>>>>> @@ -412,8 +422,15 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
>>>>>>>>>>       static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys
>>>>>>>>>> *phys_enc)
>>>>>>>>>>       {
>>>>>>>>>>           struct dpu_hw_ctl *ctl;
>>>>>>>>>> +    struct dpu_hw_cdm *hw_cdm;
>>>>>>>>>> +    const struct dpu_format *fmt = NULL;
>>>>>>>>>> +    u32 fmt_fourcc = DRM_FORMAT_RGB888;
>>>>>>>>>>             ctl = phys_enc->hw_ctl;
>>>>>>>>>> +    hw_cdm = phys_enc->hw_cdm;
>>>>>>>>>> +    if (hw_cdm)
>>>>>>>>>> +        fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc->parent,
>>>>>>>>>> &phys_enc->cached_mode);
>>>>>>>>>> +    fmt = dpu_get_dpu_format(fmt_fourcc);
>>>>>>>>>>             DPU_DEBUG_VIDENC(phys_enc, "\n");
>>>>>>>>>>       @@ -422,6 +439,8 @@ static void dpu_encoder_phys_vid_enable(struct
>>>>>>>>>> dpu_encoder_phys *phys_enc)
>>>>>>>>>>             dpu_encoder_helper_split_config(phys_enc,
>>>>>>>>>> phys_enc->hw_intf->idx);
>>>>>>>>>>       +    dpu_encoder_helper_phys_setup_cdm(phys_enc, fmt,
>>>>>>>>>> CDM_CDWN_OUTPUT_HDMI);
>>>>>>>>>
>>>>>>>>> If there is no CDM, why do we need to call this?
>>>>>>>> Inside of dpu_encoder_helper_phys_setup_cdm(), there's a check to see if
>>>>>>>> there is a hw_cdm. If there is not, then it immediately exits the function.
>>>>>>>>>
>>>>>>>>>> +
>>>>>>>>>>           dpu_encoder_phys_vid_setup_timing_engine(phys_enc);
>>>>>>>>>>             /*
>>>>>>>>>> @@ -437,7 +456,15 @@ static void dpu_encoder_phys_vid_enable(struct
>>>>>>>>>> dpu_encoder_phys *phys_enc)
>>>>>>>>>>           if (ctl->ops.update_pending_flush_merge_3d &&
>>>>>>>>>> phys_enc->hw_pp->merge_3d)
>>>>>>>>>>               ctl->ops.update_pending_flush_merge_3d(ctl,
>>>>>>>>>> phys_enc->hw_pp->merge_3d->idx);
>>>>>>>>>>       -    if (ctl->ops.update_pending_flush_periph &&
>>>>>>>>>> phys_enc->hw_intf->cap->type == INTF_DP)
>>>>>>>>>> +    if (ctl->ops.update_pending_flush_cdm && phys_enc->hw_cdm)
>>>>>>>>>> +        ctl->ops.update_pending_flush_cdm(ctl, hw_cdm->idx);
>>>>>>>>>> +
>>>>>>>>>> +    /*
>>>>>>>>>> +     * Peripheral flush must be updated whenever flushing SDP
>>>>>>>>>> packets is needed.
>>>>>>>>>> +     * SDP packets are required for any YUV format (YUV420, YUV422,
>>>>>>>>>> YUV444).
>>>>>>>>>> +     */
>>>>>>>>>> +    if (ctl->ops.update_pending_flush_periph &&
>>>>>>>>>> phys_enc->hw_intf->cap->type == INTF_DP &&
>>>>>>>>>> +        phys_enc->hw_cdm)
>>>>>>>>>>               ctl->ops.update_pending_flush_periph(ctl,
>>>>>>>>>> phys_enc->hw_intf->idx);
>>>>>>>>>
>>>>>>>>> Should there be a flush if we are switching from YUV 420 to RGB mode?
>>>>>>>> We only need to flush for the sdp packet, but for msa we do not need to
>>>>>>>> flush.
>>>>>>>
>>>>>>> What about having SDP with RGB as colorimetry? In other words, if
>>>>>>> there is a decision point, this one looks incorrect.
>>>>>>>
>>>>>>
>>>>>> There are two ways to do it:
>>>>>>
>>>>>> 1) Use SDP for both RGB and YUV as that supports both. If we implement
>>>>>> this policy, then what you are asking for is correct that we will need
>>>>>> SDP even to switch back to RGB. But to implement this we will also need
>>>>>> to have some sort of state management in the encoder layer about what is
>>>>>> the current encoder fmt Vs what is the prev fmt and then trigger
>>>>>> peripheral flush only during transitions from RGB to YUV and vice-versa
>>>>>>
>>>>>> 2) Use SDP only for YUV because MSA does not support YUV formats and use
>>>>>> MSA for RGB
>>>>>>
>>>>>> We decided to implement (2) and there is no significant impact of
>>>>>> switching between MSA and SDPs but state management becomes easier.
>>>>>
>>>>> Yes. However as you wrote, there might be other usecases concerning
>>>>> SDP. Having this in mind, it sounds like the driver should decide
>>>>> whether to flush peripheral at a different place (when the SDP
>>>>> infoframe is being updated?). And the dpu_encoder_phys_vid_enable()
>>>>> should use this previous decision. Maybe this should be a part of
>>>>> msm_dp_ API, something like msm_dp_needs_peripheral_flush()?
>>>>>
>>>>
>>>> Correct. The decision to flush peripheral or not certainly comes from
>>>> the peripheral itself . In this case its DP.
>>>>
>>>> I think perhaps the usage of hw_cdm here makes it hard to understand
>>>> that but the idea behind this was that in the change "drm/msm/dpu:
>>>> reserve CDM blocks for DP if mode is YUV420 ", hw_cdm is assigned only
>>>> if msm_dp_is_yuv_420_enabled() returns true.
>>>
>>> Yes.
>>>
>>>>
>>>> So in some sense, the API you are asking for is already
>>>> msm_dp_is_yuv_420_enabled() but we can rename that to
>>>> msm_dp_needs_periph_flush().
>>>
>>> No. This leaks details. We might need peripheral flush for other
>>> reasons. So this decision should be made inside the DP driver.
>>> BTW, is there a need to flush-peripheral each time the INTF gets
>>> enabled? When some bits of configuration were updated (like SDP
>>> infoframe or CDM config)?
>>>
>>
>> Not really leaking any details. Interface decides when DPU's flush bit
>> needs to be invoked. All the conditions needing the flush can be
>> absorbed within msm_dp_needs_periph_flush() which will be within DP
>> driver. So I dont see any issue with that.
> 
> As long as we have two distinct functions: msm_dp_needs_periph_flush()
> and msm_dp_is_yuv420_enabled(), it's fine with me.
> 

I am okay with it being distinct but in this series and till DP DSC is 
posted, we have only YUV420 SDP use-case for peripheral flush.

So are you okay with the fact that the code will look something like

bool msm_dp_needs_periph_flush() {
	return msm_dp_is_yuv420_enabled();
}

>>
>> The peripheral flush needs to be invoked whenever SDP/PPS packets need
>> to be sent out at the very least. Those are the two main use-cases so far.
>>
>> Not necessarily each time the INTF is enabled.
>>
>> But ....
>>
>> For PPS, we would typically enable DSC from the first frame itself and
>> we dont support dynamically turning DSC ON/OFF so its a fair assumption
>> that we need to the peripheral flush for DSC only during enable.
>>
>> For SDP, so today we enforce a modeset when we switch from a case of
>> needing cdm / not needing cdm and vice-versa. So even this use-case
>> should be accompanied by a disable()/enable().
> 
> My point was that there might be other changes to the SDP infoframe.
> 
>>
>> So are you suggesting that we unconditionally just do peripheral_flush
>> from enable()?
>>
>> I need to do some checking but maybe ....
> 
> This might be an option too. I don't know what delays / issues it can cause.
> 

I will check this if the other option we discussed above does not work 
for you.

>>
>>>>
>>>> The issue here is the phys layer cannot call msm_dp_is_yuv_420_enabled()
>>>> so its kind of round-about by checking hw_cdm.
>>>
>>> Which maybe means that I should finish phys / encoder rework.
>>>
>>
>> Ugh no. Not another rework just for this.
> 
> It is pending for the CTL flush story.
> 
>>
>>>>
>>>> The check is not entirely wrong because for DP, we need hw_cdm for all
>>>> YUV formats and not just 420 but the relationship is maybe not clear but
>>>> I thought the comment above that would help a bit:
>>>>
>>>> /*
>>>>            * Peripheral flush must be updated whenever flushing SDP packets is
>>>> needed.
>>>>            * SDP packets are required for any YUV format (YUV420, YUV422, YUV444).
>>>>            */
>>>>
>>>> The only other way I can think of is maybe we need to introduce a new
>>>> phys variable called phys_enc->needs_update_periph_flush and we can set
>>>> that in dpu_encoder.c as that can call msm_dp_needs_periph_flush().
>>>>
>>>> What do you think of this way?
>>>
>>> Let me understand first the requirements for peripheral flush (see the
>>> questions above).
>>>
>>>>
>>>>>>
>>>>>>>>>
>>>>>>>>> Also, I'd say, we should move update_pending_flush_periph invocation
>>>>>>>>> to this patch.
>>>>>>>> Ack
>>>>>>>>>
>>>>>>>>>>         skip_flush:
>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>>>>>> b/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>>>>>> index 6d764f5b08727..4329435518351 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>>>>>> @@ -1399,6 +1399,18 @@ void __exit msm_dp_unregister(void)
>>>>>>>>>>           platform_driver_unregister(&dp_display_driver);
>>>>>>>>>>       }
>>>>>>>>>>       +bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
>>>>>>>>>> +                   const struct drm_display_mode *mode)
>>>>>>>>>> +{
>>>>>>>>>> +    struct dp_display_private *dp;
>>>>>>>>>> +    const struct drm_display_info *info;
>>>>>>>>>> +
>>>>>>>>>> +    dp = container_of(dp_display, struct dp_display_private,
>>>>>>>>>> dp_display);
>>>>>>>>>> +    info = &dp_display->connector->display_info;
>>>>>>>>>> +
>>>>>>>>>> +    return dp_panel_vsc_sdp_supported(dp->panel) &&
>>>>>>>>>> drm_mode_is_420_only(info, mode);
>>>>>>>>>
>>>>>>>>> YUV 420 modes should be filtered out in mode_valid if VSC SDP is not
>>>>>>>>> supported.
>>>>>>>> Ack. Will change
>>>>>>>>>
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>>       bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
>>>>>>>>>>       {
>>>>>>>>>>           struct dp_display_private *dp;
>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/msm_drv.h
>>>>>>>>>> b/drivers/gpu/drm/msm/msm_drv.h
>>>>>>>>>> index 16a7cbc0b7dd8..b9581bd934e9e 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/msm_drv.h
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>>>>>>>>>> @@ -387,7 +387,8 @@ void __exit msm_dp_unregister(void);
>>>>>>>>>>       int msm_dp_modeset_init(struct msm_dp *dp_display, struct
>>>>>>>>>> drm_device *dev,
>>>>>>>>>>                    struct drm_encoder *encoder);
>>>>>>>>>>       void msm_dp_snapshot(struct msm_disp_state *disp_state, struct
>>>>>>>>>> msm_dp *dp_display);
>>>>>>>>>> -
>>>>>>>>>> +bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
>>>>>>>>>> +                   const struct drm_display_mode *mode);
>>>>>>>>>>       bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
>>>>>>>>>>         #else
>>>>>>>>>> @@ -409,6 +410,12 @@ static inline void msm_dp_snapshot(struct
>>>>>>>>>> msm_disp_state *disp_state, struct msm
>>>>>>>>>>       {
>>>>>>>>>>       }
>>>>>>>>>>       +static inline bool msm_dp_is_yuv_420_enabled(const struct msm_dp
>>>>>>>>>> *dp_display,
>>>>>>>>>> +                         const struct drm_display_mode *mode)
>>>>>>>>>> +{
>>>>>>>>>> +    return false;
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>>       static inline bool msm_dp_wide_bus_available(const struct msm_dp
>>>>>>>>>> *dp_display)
>>>>>>>>>>       {
>>>>>>>>>>           return false;
>>>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> --
>>>>>>> With best wishes
>>>>>>> Dmitry
>>>>>
>>>>>
>>>>>
>>>
>>>
>>>
> 
> 
> 
> --
> With best wishes
> Dmitry
