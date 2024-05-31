Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5C38D69A9
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 21:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC8610E1AC;
	Fri, 31 May 2024 19:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="FGqxP/ba";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A26D10E1AC;
 Fri, 31 May 2024 19:20:37 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V9pdKr020271;
 Fri, 31 May 2024 19:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kqKB2jYXheZELMsA21rtGvK2W27mOFwUt2NJ8nuCxOw=; b=FGqxP/baQmYSUOUs
 U8GuvOc571bueu6P5VEjJZymka2ZHLrOTtVewHspZOs66xQ7rFOQ9gglT5lMhPvl
 ZOPjbt3p2QRNyJXX4A9uifYpGeezwnPUVjR6MG5dBmW/0lKZKeAzAyWjPe5gRM3A
 JYHUieZOFz+G2ZqHpWc6WiznOOxWFUIYyEsek0hRV1Eq8mvkdWmNCgLyE5nI+HkJ
 Kr775/8XQWJ86RHMCBzwa2/uf94Xr2tO99nhslqzvqJ1PouLommyGoUPWE1VaHMB
 gI5kzvsJEfeu54VHR3MxmuipiX6/9FRaszFw1uLRulzgvT8rKUwTIY8SK8wyHEVn
 0K6pEw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2hfut8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 May 2024 19:20:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44VJKUSA008363
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 May 2024 19:20:30 GMT
Received: from [10.110.101.193] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 May
 2024 12:20:26 -0700
Message-ID: <9e0e22b0-965b-00b2-c837-904dd342e87f@quicinc.com>
Date: Fri, 31 May 2024 12:20:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 05/13] drm/msm/dpu: move scaling limitations out of the
 hw_catalog
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
 <20240314000216.392549-6-dmitry.baryshkov@linaro.org>
 <6a335026-77c1-a112-69af-a8d9d86d5528@quicinc.com>
 <CAA8EJpqKkTOkhrgJexw-D5TbgGYjBoUup3FHC80boR_cAUb2dA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpqKkTOkhrgJexw-D5TbgGYjBoUup3FHC80boR_cAUb2dA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: QleXmQWfyTgdO-XAxI8JypqGcNxrBtXJ
X-Proofpoint-ORIG-GUID: QleXmQWfyTgdO-XAxI8JypqGcNxrBtXJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 phishscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310147
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



On 5/31/2024 1:16 AM, Dmitry Baryshkov wrote:
> On Fri, 31 May 2024 at 04:02, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 3/13/2024 5:02 PM, Dmitry Baryshkov wrote:
>>> Max upscale / downscale factors are constant between platforms. In
>>> preparation to adding support for virtual planes and allocating SSPP
>>> blocks on demand move max scaling factors out of the HW catalog and
>>> handle them in the dpu_plane directly. If any of the scaling blocks gets
>>> different limitations, this will have to be handled separately, after
>>> the plane refactoring.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 12 ------------
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ----
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 16 +++++++++++++---
>>>    3 files changed, 13 insertions(+), 19 deletions(-)
>>>
>>
>> <Snip>
>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> index 70d6a8989e1a..6360052523b5 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> @@ -785,12 +785,15 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
>>>        return 0;
>>>    }
>>>
>>> +#define MAX_UPSCALE_RATIO    20
>>> +#define MAX_DOWNSCALE_RATIO  4
>>> +
>>>    static int dpu_plane_atomic_check(struct drm_plane *plane,
>>>                                  struct drm_atomic_state *state)
>>>    {
>>>        struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
>>>                                                                                 plane);
>>> -     int ret = 0, min_scale;
>>> +     int ret = 0, min_scale, max_scale;
>>>        struct dpu_plane *pdpu = to_dpu_plane(plane);
>>>        struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>>>        u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
>>> @@ -822,10 +825,17 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>>>        pipe_hw_caps = pipe->sspp->cap;
>>>        sblk = pipe->sspp->cap->sblk;
>>>
>>> -     min_scale = FRAC_16_16(1, sblk->maxupscale);
>>> +     if (sblk->scaler_blk.len) {
>>> +             min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
>>> +             max_scale = MAX_DOWNSCALE_RATIO << 16;
>>> +     } else {
>>> +             min_scale = 1 << 16;
>>> +             max_scale = 1 << 16;
>>
>> You can use DRM_PLANE_NO_SCALING instead.
> 
> Ack
> 
>>
>>> +     }
>>> +
>>>        ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
>>>                                                  min_scale,
>>> -                                               sblk->maxdwnscale << 16,
>>> +                                               max_scale,
>>>                                                  true, true);
>>
>> I am missing something here.
>>
>> As per the documentation of this API, min and max are the scaling limits
>> of both directions and not max_upscale and max_downscale.
>>
>> **
>> 837  * drm_atomic_helper_check_plane_state() - Check plane state for
>> validity
>> 838  * @plane_state: plane state to check
>> 839  * @crtc_state: CRTC state to check
>> 840  * @min_scale: minimum @src:@dest scaling factor in 16.16 fixed point
>> 841  * @max_scale: maximum @src:@dest scaling factor in 16.16 fixed point
>> 842  * @can_position: is it legal to position the plane such that it
>>
>>
>> But this change is passing max_upscale and max_downscale as the min and
>> max resp. Isnt that wrong?
> 
> First of all, please notice that I'm not changing the values that are
> passed to the function. What was being passed beforehand gets passed
> after this commit. I just moved it out of the catalog.
> 

Ack.

> Second, if we take a look at drm_calc_scale(), we can see that it
> calculates src / dst and checks that it is within the min_scale and
> max_scale boundaries, just like documented.
> In our case, the boundaries are (I'm omitting 16.16 math):
> - upscale 20 times. dst = 20 * src, scale = src/dst = 1/20
> - downscale 4 times. dst = 1/4 * src, scale = src/dst = 4
> 
> So, from the point of view of drm_calc_scale(), the min_scale is
> 1/MAX_UPSCALE, max_scale = MAX_DOWNSCALE and the values the code is
> passing are correct.
> 

That part is fine. Agreed.

But I do think, that API is not correct if the scaling limits are 
different in the Horizontal Vs Vertical direction as today it assumes 
the limits are same in both. Anyway, thats outside the scope of this 
patch. So I am good for now.

>>
>>
>>>        if (ret) {
>>>                DPU_DEBUG_PLANE(pdpu, "Check plane state failed (%d)\n", ret);
> 
> 
> 
