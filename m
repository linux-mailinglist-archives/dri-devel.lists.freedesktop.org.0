Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 475578DAF5D
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 23:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFEE710E3E3;
	Mon,  3 Jun 2024 21:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ct29QGGw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76C910E062;
 Mon,  3 Jun 2024 21:24:37 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453ClLBm024670;
 Mon, 3 Jun 2024 21:24:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WUEj44O6kyC0LL/53R8XhfxX8i8cXBeedXNvLvGYWjs=; b=ct29QGGwzWWF6VLS
 N6Gmp9Ai76iVbWy6x58UPBi3IT0gIL0ummj4Uo6qUZpSobwrckXt+I1xkFojL+yC
 nBcmvR1kKfdHsIyT5WXVfrBW/2VW4DPkg7hptSGQTOlTn3b4E60wK6sDW+MOo/u8
 RAO20Bt6sONEOsPP8ejR8Du/edYVZ1FNJMPYpjbCppWGAcv0i9K6ZU78epcmlLbA
 fHo85V+JhU+4p93LpgM7ON/k/yURBmX4ZnwImkQg2PMj/pHDWSsACvuijzsvvEpt
 aGKpbhxKDIGCmxVbdwxzaaUaXDOBL2tBNv6INTYi6NxydovbrZWIQL6jmwNSp+U6
 okLiEg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw7dn0tx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jun 2024 21:24:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 453LOV9N018180
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 3 Jun 2024 21:24:31 GMT
Received: from [10.110.31.89] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 14:24:29 -0700
Message-ID: <37b56f66-4e71-51cc-a09d-fe4e1469f665@quicinc.com>
Date: Mon, 3 Jun 2024 14:24:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 7/9] drm/msm/dpu: check for overflow in
 _dpu_crtc_setup_lm_bounds()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
 <20240603-dpu-mode-config-width-v2-7-16af520575a6@linaro.org>
 <64c6e6a5-7ab2-cdf7-131a-7a1f79c48e0c@quicinc.com>
 <CAA8EJpp8WbXYTvtL0Xwxrn_eXsPfGTGz9bigtwHFjXunnM_cHg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpp8WbXYTvtL0Xwxrn_eXsPfGTGz9bigtwHFjXunnM_cHg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: AS1gRUmByRiPwhmFS3P4BsQM6foBxCHU
X-Proofpoint-GUID: AS1gRUmByRiPwhmFS3P4BsQM6foBxCHU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_17,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030173
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



On 6/3/2024 2:16 PM, Dmitry Baryshkov wrote:
> On Mon, 3 Jun 2024 at 23:57, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 6/2/2024 2:39 PM, Dmitry Baryshkov wrote:
>>> Check in _dpu_crtc_setup_lm_bounds() that CRTC width is not overflowing
>>> LM requirements.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 ++++++++++++---
>>>    1 file changed, 12 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> index e3b1e5f55a92..c5e874a3656a 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> @@ -711,12 +711,13 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc)
>>>        _dpu_crtc_complete_flip(crtc);
>>>    }
>>>
>>> -static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
>>> +static int _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
>>>                struct drm_crtc_state *state)
>>
>> Perhaps now we need to rename this to _dpu_crtc_setup_and_check_lm_bounds()?
> 
> Ack, I'll rename it.
> 
>>
>> Also, prior to this change, we never had a bounds check for each LM
>> which we should have had . Does this qualify for a Fixes tag?
> 
> Probably no. We currently have a limit in the drm_mode_config, which
> ensures that the CRTC isn't too wide.
> 

The limit in drm_mode_config is to ensure we will not go beyond 
2*max_mixer_width for the mode as we support only upto 2 LMs.

This check is making sure that even for the single LM, we do not go 
beyond the max_mixer_width which is valid imo.

>>
>> With those two questions addressed,
>>
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>>>    {
>>>        struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
>>>        struct drm_display_mode *adj_mode = &state->adjusted_mode;
>>>        u32 crtc_split_width = adj_mode->hdisplay / cstate->num_mixers;
>>> +     struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
>>>        int i;
>>>
>>>        for (i = 0; i < cstate->num_mixers; i++) {
>>> @@ -727,7 +728,12 @@ static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
>>>                r->y2 = adj_mode->vdisplay;
>>>
>>>                trace_dpu_crtc_setup_lm_bounds(DRMID(crtc), i, r);
>>> +
>>> +             if (drm_rect_width(r) > dpu_kms->catalog->caps->max_mixer_width)
>>> +                     return -E2BIG;
>>>        }
>>
>>> +
>>> +     return 0;
>>>    }
>>>
>>>    static void _dpu_crtc_get_pcc_coeff(struct drm_crtc_state *state,
>>> @@ -1195,8 +1201,11 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>>>        if (crtc_state->active_changed)
>>>                crtc_state->mode_changed = true;
>>>
>>> -     if (cstate->num_mixers)
>>> -             _dpu_crtc_setup_lm_bounds(crtc, crtc_state);
>>> +     if (cstate->num_mixers) {
>>> +             rc = _dpu_crtc_setup_lm_bounds(crtc, crtc_state);
>>> +             if (rc)
>>> +                     return rc;
>>> +     }
>>>
>>>        /* FIXME: move this to dpu_plane_atomic_check? */
>>>        drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
>>>
> 
> 
> 
