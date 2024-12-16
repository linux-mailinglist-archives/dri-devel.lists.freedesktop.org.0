Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F13019F3986
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 20:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57CD810E766;
	Mon, 16 Dec 2024 19:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="L16RjnxK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD8710E766;
 Mon, 16 Dec 2024 19:16:18 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGE5bpL013330;
 Mon, 16 Dec 2024 19:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uy3T0lC9OYpeT7OKnDO7ZhyUgedlwCfpE/ttIVc5Aek=; b=L16RjnxKdReVBQpJ
 ARrJQyjMUt7Pg88GE0tCuSLVyEideHMdyJITlnIHwMcqquWkKfFfwHtsBJfAtY9A
 ynG2fnjS0ujVq7GPSic8vNemHY13zt4qjcaCspynGLb3R8dijkZB+89/h8v6kL/g
 Zk39tyhl5+oD3sDgHGpQFNBVhkJ7dW31E/5k1R1PHDqLrJQxlgPTAmWG8RxEZTjv
 QeSk4eAbYzPfynni1ueGqcs/QYWLZxL+Tok7erCLmHuQZ0sA4fmeckal0GLf6Vvo
 Iu6EWl85HzfpmDQekCkoq/RcPi5x6Ut/RcJ6+VdW0ApLXHt0mKjVb+F50g9+LsIM
 bvcJeA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jnnurt38-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2024 19:16:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BGJGEkW012200
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2024 19:16:14 GMT
Received: from [10.110.88.253] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 11:16:13 -0800
Message-ID: <ab9a5f29-39d3-46bd-bcdf-15466a6a30b4@quicinc.com>
Date: Mon, 16 Dec 2024 11:16:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Filter modes based on adjusted mode clock
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241212-filter-mode-clock-v1-1-f4441988d6aa@quicinc.com>
 <onavg2s7uamgwh34ozhbt56c74ktj5chp3jnn4bw5m22y5sdjr@fktyn5yt4gmw>
 <1f71a352-ab8a-47fb-a4ed-ae0a4767aec6@quicinc.com>
 <CAA8EJprwE-zV1cX4OUJJfJ1en1+riHZVCQNGNYHxnPe_S=2cwA@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJprwE-zV1cX4OUJJfJ1en1+riHZVCQNGNYHxnPe_S=2cwA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: bojs3WEWaoUAAH0KXcKBrF-ah43P3zTW
X-Proofpoint-ORIG-GUID: bojs3WEWaoUAAH0KXcKBrF-ah43P3zTW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 mlxscore=0 phishscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412160159
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



On 12/13/2024 12:38 PM, Dmitry Baryshkov wrote:
> On Fri, 13 Dec 2024 at 21:15, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 12/12/2024 5:05 PM, Dmitry Baryshkov wrote:
>>> On Thu, Dec 12, 2024 at 11:11:54AM -0800, Jessica Zhang wrote:
>>>> Filter out modes that have a clock rate greater than the max core clock
>>>> rate when adjusted for the perf clock factor
>>>>
>>>> This is especially important for chipsets such as QCS615 that have lower
>>>> limits for the MDP max core clock.
>>>>
>>>> Since the core CRTC clock is at least the mode clock (adjusted for the
>>>> perf clock factor) [1], the modes supported by the driver should be less
>>>> than the max core clock rate.
>>>>
>>>> [1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c#L83
>>>>
>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 29 +++++++++++++++++++--------
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  3 +++
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 12 +++++++++++
>>>>    3 files changed, 36 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>>>> index 6f0a37f954fe8797a4e3a34e7876a93d5e477642..0afd7c81981c722a1a9176062250c418255fe6d0 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>>>> @@ -31,6 +31,26 @@ enum dpu_perf_mode {
>>>>       DPU_PERF_MODE_MAX
>>>>    };
>>>>
>>>> +/**
>>>> + * dpu_core_perf_adjusted_crtc_clk - Adjust given crtc clock rate according to
>>>
>>> Nit: CRTC (here and further)
>>>
>>>> + *   the perf clock factor.
>>>> + * @crtc_clk_rate - Unadjusted crtc clock rate
>>>> + * @perf_cfg: performance configuration
>>>> + */
>>>> +u64 dpu_core_perf_adjusted_crtc_clk(u64 crtc_clk_rate,
>>>> +                                const struct dpu_perf_cfg *perf_cfg)
>>>
>>> It's not just the CRTC clocks
>>>
>>
>> Do you mean we should use adjusted mode clock here?
> 
> This also applies, etc. But my point was that you can not name it just
> "adjusted CRTC clock" if you also add the plane clocks handling.
> 

_dpu_plane_calc_clk() already handles the plane_clk calculation so we 
dont need to add it here.

adjusted_mode_clk sounds fine to me in that case.

>>
>>>> +{
>>>> +    u32 clk_factor;
>>>> +
>>>> +    clk_factor = perf_cfg->clk_inefficiency_factor;
>>>> +    if (clk_factor) {
>>>> +            crtc_clk_rate *= clk_factor;
>>>> +            do_div(crtc_clk_rate, 100);
>>>> +    }
>>>> +
>>>> +    return crtc_clk_rate;
>>>> +}
>>>> +
>>>>    /**
>>>>     * _dpu_core_perf_calc_bw() - to calculate BW per crtc
>>>>     * @perf_cfg: performance configuration
>>>> @@ -76,7 +96,6 @@ static u64 _dpu_core_perf_calc_clk(const struct dpu_perf_cfg *perf_cfg,
>>>>       struct dpu_plane_state *pstate;
>>>>       struct drm_display_mode *mode;
>>>>       u64 crtc_clk;
>>>
>>> While you are at it, could you please also add a patch, replacing height
>>> * vidth * vrefresh with mode->clock * 1000? The former one has limited
>>> precision.
>>>
>>>> -    u32 clk_factor;
>>>>
>>>>       mode = &state->adjusted_mode;
>>>>
>>>> @@ -90,13 +109,7 @@ static u64 _dpu_core_perf_calc_clk(const struct dpu_perf_cfg *perf_cfg,
>>>>               crtc_clk = max(pstate->plane_clk, crtc_clk);
>>>>       }
>>>
>>> This function calculates crtc_clk as max(plane_clk, crtc_clk). Shouldn't
>>> we also reject the atomic_state if for any of the planes the corrected
>>> clock is lower than max_core_clk_rate
>>>
>>
>> You mean higher than max_core_clk_rate? If so, yes we can fix that up.
> 
> Yes
> 

I cross-checked the src code, we do already have the protection for 
plane_clk going beyond max_core_clk

         /* max clk check */
         if (_dpu_plane_calc_clk(mode, pipe_cfg) > 
kms->perf.max_core_clk_rate) {
                 DPU_DEBUG_PLANE(pdpu, "plane exceeds max mdp core clk 
limits\n");
                 return -E2BIG;
         }

So this should be sufficient for the case you are referring to.

>>
>>>>
>>>> -    clk_factor = perf_cfg->clk_inefficiency_factor;
>>>> -    if (clk_factor) {
>>>> -            crtc_clk *= clk_factor;
>>>> -            do_div(crtc_clk, 100);
>>>> -    }
>>>> -
>>>> -    return crtc_clk;
>>>> +    return dpu_core_perf_adjusted_crtc_clk(crtc_clk, perf_cfg);
>>>>    }
>>>>
>>>>    static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
>>>> index 451bf8021114d9d4a2dfdbb81ed4150fc559c681..c3bcd567cdfb66647c83682d1feedd69e33f0680 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
>>>> @@ -54,6 +54,9 @@ struct dpu_core_perf {
>>>>       u64 fix_core_ab_vote;
>>>>    };
>>>>
>>>> +u64 dpu_core_perf_adjusted_crtc_clk(u64 clk_rate,
>>>> +                                const struct dpu_perf_cfg *perf_cfg);
>>>> +
>>>>    int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
>>>>               struct drm_crtc_state *state);
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>> index ad3462476a143ec01a3b8817a2c85b0f50435a9e..cd7b84ab57a7526948c2beb7c5cefdddcbe4f6d9 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>> @@ -1257,6 +1257,7 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
>>>>                                               const struct drm_display_mode *mode)
>>>>    {
>>>>       struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
>>>> +    u64 adjusted_mode_clk;
>>>>
>>>>       /* if there is no 3d_mux block we cannot merge LMs so we cannot
>>>>        * split the large layer into 2 LMs, filter out such modes
>>>> @@ -1264,6 +1265,17 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
>>>>       if (!dpu_kms->catalog->caps->has_3d_merge &&
>>>>           mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
>>>>               return MODE_BAD_HVALUE;
>>>> +
>>>> +    adjusted_mode_clk = dpu_core_perf_adjusted_crtc_clk(mode->clock,
>>>> +                                                        dpu_kms->perf.perf_cfg);
>>>> +
>>>> +    /*
>>>> +     * The given mode, adjusted for the perf clock factor, should not exceed
>>>> +     * the max core clock rate
>>>> +     */
>>>> +    if (adjusted_mode_clk > dpu_kms->perf.max_core_clk_rate / 1000)
>>>> +            return MODE_CLOCK_HIGH;
>>>> +
>>>>       /*
>>>>        * max crtc width is equal to the max mixer width * 2 and max height is 4K
>>>>        */
>>>>
>>>> ---
>>>> base-commit: 423c1c96d6b2d3bb35072e33a5fdd8db6d2c0a74
>>>> change-id: 20241212-filter-mode-clock-8cb2e769f05b
>>>>
>>>> Best regards,
>>>> --
>>>> Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>
>>>
> 
> 
> 
