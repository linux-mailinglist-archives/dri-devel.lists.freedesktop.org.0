Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC83A06D89
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 06:24:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B5C10E2BA;
	Thu,  9 Jan 2025 05:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ZKVXdb4H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1336010E2BA;
 Thu,  9 Jan 2025 05:24:04 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5094CUu2019308;
 Thu, 9 Jan 2025 05:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GSTP3W8j6D84vx/G8rl6YFv2M+h0dh//C4CY+PhpalA=; b=ZKVXdb4HFNSbubXl
 hfKgE4ySa73A5RRRY9oNnQZCXPDHk1FaPvZ11CLZXoVxNcvKYzkzBjS1fUn1w1qN
 IfwPJ9l9OXWjp2jACTsc9WhE7vHrlevS5CiU8bGK4uXbcm4X6mnr3/GUdVCihtRo
 7f3M6oFoKa5Bh4GvfBJdTSi9STeS3gVXc9vTV+453RL4os5i7e1/z9FrDDMPFv8/
 2urn2rh6QsCx3Kiw+gpcqkXTvfoDiSPDS9S835ksGbn2CQ1MCN9CO6igX12JBVXT
 xWsAFsB+BQ7JKPMBH6EhCIXx9wtV2io+dsSedu45NLze2vVNdE4UVl89YHAH43Y+
 xkgShw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44277e047t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2025 05:22:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5095MvP3030064
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 9 Jan 2025 05:22:57 GMT
Received: from [10.110.60.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 21:22:57 -0800
Message-ID: <a0c48f70-2a0f-45b0-b179-91dd544b5b59@quicinc.com>
Date: Wed, 8 Jan 2025 21:22:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] drm/msm/dpu: don't set crtc_state->mode_changed from
 atomic_check()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Archit
 Taneja <architt@codeaurora.org>,
 Rajesh Yadav <ryadav@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, Simona Vetter <simona.vetter@ffwll.ch>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <20241222-drm-dirty-modeset-v1-6-0e76a53eceb9@linaro.org>
 <91dff265-5e13-45db-b46d-0eef4a95f5f6@quicinc.com>
 <a6fa4aa2-d90b-4b5e-92fd-db3912ed248a@quicinc.com>
 <2i5vun3pabozzqxjnciylahfx7jljtdmowjo625ida44e37djm@2axmuodlaqtk>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <2i5vun3pabozzqxjnciylahfx7jljtdmowjo625ida44e37djm@2axmuodlaqtk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: LgULmlQAGZUMQrmoJFO6n64tX2T963nk
X-Proofpoint-GUID: LgULmlQAGZUMQrmoJFO6n64tX2T963nk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501090042
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



On 1/8/2025 8:26 PM, Dmitry Baryshkov wrote:
> On Wed, Jan 08, 2025 at 08:11:27PM -0800, Abhinav Kumar wrote:
>>
>>
>> On 1/8/2025 6:27 PM, Abhinav Kumar wrote:
>>>
>>>
>>> On 12/21/2024 9:00 PM, Dmitry Baryshkov wrote:
>>>> The MSM driver uses drm_atomic_helper_check() which mandates that none
>>>> of the atomic_check() callbacks toggles crtc_state->mode_changed.
>>>> Perform corresponding check before calling the drm_atomic_helper_check()
>>>> function.
>>>>
>>>> Fixes: 8b45a26f2ba9 ("drm/msm/dpu: reserve cdm blocks for writeback
>>>> in case of YUV output")
>>>> Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
>>>> Closes:
>>>> https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32
>>>> +++++++++++++++++++++++++----
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++++
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26
>>>> +++++++++++++++++++++++
>>>>    drivers/gpu/drm/msm/msm_atomic.c            | 13 +++++++++++-
>>>>    drivers/gpu/drm/msm/msm_kms.h               |  7 +++++++
>>>>    5 files changed, 77 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> index 209e6fb605b2d8724935b62001032e7d39540366..b7c3aa8d0e2ca58091deacdeaccb0819d2bf045c
>>>> 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> @@ -753,6 +753,34 @@ static void
>>>> dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
>>>>        cstate->num_mixers = num_lm;
>>>>    }
>>>> +/**
>>>> + * dpu_encoder_virt_check_mode_changed: check if full modeset is
>>>> required
>>>> + * @drm_enc:    Pointer to drm encoder structure
>>>> + * @crtc_state:    Corresponding CRTC state to be checked
>>>> + * @conn_state: Corresponding Connector's state to be checked
>>>> + *
>>>> + * Check if the changes in the object properties demand full mode set.
>>>> + */
>>>> +int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
>>>> +                    struct drm_crtc_state *crtc_state,
>>>> +                    struct drm_connector_state *conn_state)
>>>> +{
>>>> +    struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
>>>> +    struct msm_display_topology topology;
>>>> +
>>>> +    DPU_DEBUG_ENC(dpu_enc, "\n");
>>>> +
>>>> +    /* Using mode instead of adjusted_mode as it wasn't computed yet */
>>>> +    topology = dpu_encoder_get_topology(dpu_enc, &crtc_state->mode,
>>>> crtc_state, conn_state);
>>>> +
>>>> +    if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
>>>> +        crtc_state->mode_changed = true;
>>>> +    else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
>>>> +        crtc_state->mode_changed = true;
>>>> +
>>>> +    return 0;
>>>> +}
>>>
>>> How will this work exactly?
>>>
>>> needs_cdm is set in the encoder's atomic_check which is called inside
>>> drm_atomic_helper_check(). But this function is called before that.
>>>
>>> So needs_cdm will never hit.
>>>
>>
>> Sorry, my bad. after change (4) of this series needs_cdm is also populated
>> within  dpu_encoder_get_topology().
>>
>> To follow up on https://patchwork.freedesktop.org/patch/629231/?series=137975&rev=4#comment_1148651
>>
>> So is the plan for CWB to add a dpu_crtc_check_mode_changed() like
>> dpu_encoder's and call it?
> 
> I think dpu_encoder_virt_check_mode_changed() would transform into the
> dpu_crtc_check_mode_changed() together with one of the patches that
> moves resource allocation and refactors topology handling.
>

hmm we need the cur_master for cdm. That will not be accessible in 
dpu_crtc.c so we will end up with a separate 
dpu_crtc_check_mode_changed() for CWB from what I see. We will discuss 
it further when we re-post CWB.

But overall, I think we can make CWB work on top of this.

Hence,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

I do not know how important patch 2 is for this series and I would 
prefer not delaying CWB even more than what it already has been.

If we cannot reach a conclusion on patch 2, can you break that one out 
of this series so that the rest of it is ready to land?

>>
>>
>>>
>>>> +
>>>>    static int dpu_encoder_virt_atomic_check(
>>>>            struct drm_encoder *drm_enc,
>>>>            struct drm_crtc_state *crtc_state,
> 
