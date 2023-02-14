Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD7C6971CC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 00:25:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389BE10E9C9;
	Tue, 14 Feb 2023 23:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C889B10E9C9;
 Tue, 14 Feb 2023 23:25:34 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31E7j7ao019675; Tue, 14 Feb 2023 23:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=gfswPWGhKYDsdtAb3iErCFMJZixO2sVJaEUeMu7N7nQ=;
 b=A9LMr8au1PI017OfDR0K7lArUO1eolFAtYdzG0TCQAiVBjKZkKW4Zl6DQ0lsia1QKkx3
 E0qgHhVljDU5apIlAYrOaeeI/zmZF3sXk2n0irCT+g54Ubg8fxEnouVwpWbFzDXIbOI8
 wXlVeWZLMIxFaf+7uXgLYNolKCPMFMbg4EMdZMejoi8WvjQ4zjtgiJGDP3AbritQZ3xL
 MKq0SWf1wAKKWEgDsijw9TzDg3igyX+h9M82X5c6Uc3qrXZcjpe1a6tu63w3duTusae7
 nOUAgwO1THxk77/13g2GsGAFEMWS4QKZMUM1scpsL4gx0xRuUDnlE/Dws1Ho/oRHMlnT 6w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nr661aax6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 23:25:28 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31ENPRFl018239
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 23:25:27 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 14 Feb
 2023 15:25:27 -0800
Message-ID: <fb94f386-22af-c2c6-9071-8dcbe8c547c1@quicinc.com>
Date: Tue, 14 Feb 2023 15:25:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 15/27] drm/msm/dpu: move the rest of plane checks to
 dpu_plane_atomic_check()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-16-dmitry.baryshkov@linaro.org>
 <121827e3-3ec4-c0fd-d3fb-771150e79717@quicinc.com>
 <269a9f0e-b9c2-427d-acc0-e18262c0c4ff@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <269a9f0e-b9c2-427d-acc0-e18262c0c4ff@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: qi2R6arurOv_gtLikJ7MisGvaSviiHDy
X-Proofpoint-GUID: qi2R6arurOv_gtLikJ7MisGvaSviiHDy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_15,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 mlxscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302140201
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
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry

Sorry for the late response on this one.

On 2/3/2023 2:55 PM, Dmitry Baryshkov wrote:
> On 04/02/2023 00:44, Abhinav Kumar wrote:
>>
>>
>> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>>> Move plane state updates from dpu_crtc_atomic_check() to the function
>>> where they belong: to dpu_plane_atomic_check().
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 18 +-----------------
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 18 ++++++++++--------
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  6 ------
>>>   3 files changed, 11 insertions(+), 31 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> index b485234eefb2..bd09bb319a58 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> @@ -1129,7 +1129,6 @@ static int dpu_crtc_atomic_check(struct 
>>> drm_crtc *crtc,
>>>                                         crtc);
>>>       struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
>>>       struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
>>> -    struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
>>>       const struct drm_plane_state *pstate;
>>>       struct drm_plane *plane;
>>> @@ -1161,11 +1160,10 @@ static int dpu_crtc_atomic_check(struct 
>>> drm_crtc *crtc,
>>>       crtc_rect.x2 = mode->hdisplay;
>>>       crtc_rect.y2 = mode->vdisplay;
>>> -     /* get plane state for all drm planes associated with crtc 
>>> state */
>>> +    /* FIXME: move this to dpu_plane_atomic_check? */
>>>       drm_atomic_crtc_state_for_each_plane_state(plane, pstate, 
>>> crtc_state) {
>>>           struct dpu_plane_state *dpu_pstate = 
>>> to_dpu_plane_state(pstate);
>>>           struct drm_rect dst, clip = crtc_rect;
>>> -        int stage;
>>>           if (IS_ERR_OR_NULL(pstate)) {
>>>               rc = PTR_ERR(pstate);
>>> @@ -1179,8 +1177,6 @@ static int dpu_crtc_atomic_check(struct 
>>> drm_crtc *crtc,
>>>           dpu_pstate->needs_dirtyfb = needs_dirtyfb;
>>> -        dpu_plane_clear_multirect(pstate);
>>> -
>>>           dst = drm_plane_state_dest(pstate);
>>>           if (!drm_rect_intersect(&clip, &dst)) {
>>>               DPU_ERROR("invalid vertical/horizontal destination\n");
>>> @@ -1189,18 +1185,6 @@ static int dpu_crtc_atomic_check(struct 
>>> drm_crtc *crtc,
>>>                     DRM_RECT_ARG(&dst));
>>>               return -E2BIG;
>>>           }
>>> -
>>> -        /* verify stage setting before using it */
>>> -        stage = DPU_STAGE_0 + pstate->normalized_zpos;
>>> -        if (stage >= dpu_kms->catalog->caps->max_mixer_blendstages) {
>>> -            DPU_ERROR("> %d plane stages assigned\n",
>>> -                    dpu_kms->catalog->caps->max_mixer_blendstages - 
>>> DPU_STAGE_0);
>>> -            return -EINVAL;
>>> -        }
>>> -
>>> -        to_dpu_plane_state(pstate)->stage = stage;
>>> -        DRM_DEBUG_ATOMIC("%s: stage %d\n", dpu_crtc->name, stage);
>>> -
>>>       }
>>>       atomic_inc(&_dpu_crtc_get_kms(crtc)->bandwidth_ref);
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> index 1b3033b15bfa..5aabf9694a53 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> @@ -733,14 +733,6 @@ static int _dpu_plane_color_fill(struct 
>>> dpu_plane *pdpu,
>>>       return 0;
>>>   }
>>> -void dpu_plane_clear_multirect(const struct drm_plane_state *drm_state)
>>> -{
>>> -    struct dpu_plane_state *pstate = to_dpu_plane_state(drm_state);
>>> -
>>> -    pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
>>> -    pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>> -}
>>> -
>>>   int dpu_plane_validate_multirect_v2(struct 
>>> dpu_multirect_plane_states *plane)
>>>   {
>>>       struct dpu_plane_state *pstate[R_MAX];
>>> @@ -994,6 +986,16 @@ static int dpu_plane_atomic_check(struct 
>>> drm_plane *plane,
>>>       if (!new_plane_state->visible)
>>>           return 0;
>>> +    pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
>>> +    pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>> +
>>
>> But I am not sure if clearing the multirect belongs here and now I 
>> want to clarify one thing about 
>> https://patchwork.freedesktop.org/patch/521354/?series=99909&rev=4 
>> which was R-bed in the v1 and carried fwd since then.
>>
>> So prior to that change, we were only clearing the multirects of the 
>> planes that were staged to the crtc and we were getting those from the 
>> crtc state. But now we are clearing the multirect of all the planes.
>>
>> Dont we have to keep that in the crtc_atomic_check() since we do that 
>> on all the planes attached to a certain CRTC.
>>
>> In that case shouldnt we keep this in the crtc_atomic_check() and 
>> bring back pipe_staged[] without the multirect and source split cases 
>> ofcourse.
> 
> What for? In other words, what would be the difference?
> 

So, please correct my understanding here. drm_plane's atomic_check() 
will be called for all the planes which are getting updated in this 
atomic commit using for_each_oldnew_plane_in_state() and drm_crtc's 
atomic_check() will be called for all the CRTC's in this atomic update 
using for_each_new_crtc_in_state().

If the plane is not connected to any CRTC, why do we need to clear the 
multirect pstates.

OR in that case would atomic_commit not even be called if the plane is 
not connected to any CRTC?

One case i can think of is the disable commit where the no planes will 
be connected to the CRTC so in that case, before this change we would 
explicitly clear out all the planes connected to the CRTC but now with 
this change is there a possibility that only if the plane state changed 
we would clear it out?

	
>>
>>> +    pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
>>> +    if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
>>> +        DPU_ERROR("> %d plane stages assigned\n",
>>> +                pdpu->catalog->caps->max_mixer_blendstages - 
>>> DPU_STAGE_0);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>
>> I agree that this check belongs to the plane_atomic_check().
>>
>>>       src.x1 = new_plane_state->src_x >> 16;
>>>       src.y1 = new_plane_state->src_y >> 16;
>>>       src.x2 = src.x1 + (new_plane_state->src_w >> 16);
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
>>> index 228db401e905..a08b0539513b 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
>>> @@ -88,12 +88,6 @@ struct drm_plane *dpu_plane_init(struct drm_device 
>>> *dev,
>>>    */
>>>   int dpu_plane_validate_multirect_v2(struct 
>>> dpu_multirect_plane_states *plane);
>>> -/**
>>> - * dpu_plane_clear_multirect - clear multirect bits for the given pipe
>>> - * @drm_state: Pointer to DRM plane state
>>> - */
>>> -void dpu_plane_clear_multirect(const struct drm_plane_state 
>>> *drm_state);
>>> -
>>>   /**
>>>    * dpu_plane_color_fill - enables color fill on plane
>>>    * @plane:  Pointer to DRM plane object
> 
