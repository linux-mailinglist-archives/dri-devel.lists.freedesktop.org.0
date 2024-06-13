Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB44907D15
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 22:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2F810E1FB;
	Thu, 13 Jun 2024 20:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="WvYvSF5P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9A010E1C9;
 Thu, 13 Jun 2024 20:03:06 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45DJGL6r030228;
 Thu, 13 Jun 2024 20:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ++/0rbwSkqHw84MvR+hU+/vr8pLS4HWr/ld0QgWtZNw=; b=WvYvSF5PEZ3CDWF2
 Bb3TWXsTmVcI7Wc0gfYvJ0Ahq9n84fXRvHjFI+QaT9pjr8accF0x8K+jmKsy474Y
 wCZawg+88z/Au5hzHKmrKxQnrgZ4HV+GooPSKMr2v1EEwwedsFtqSMF2I9tzr6io
 QxWJZxXQDFOkLGviNDjZjz8PmrmegTwSPfYGPliPyTffVaXNP5JyIfEooXDEAHGy
 jLuY+PfwPAzMUG/KH8ETdMqaXhvbAeNG3kxJILzl9HrSCrg6bQXLXfkxanWCd8ay
 6eLiro2aZjUPde6OwMNg+ZT6TTsGWMiuDj+XyYERq2CbLT42UMO6OYnzzd6tf3uK
 frXLMg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yr6q405ge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jun 2024 20:02:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45DK2woe017051
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jun 2024 20:02:58 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Jun
 2024 13:02:57 -0700
Message-ID: <a7ca8784-9dde-159f-e304-db38d3dddfb4@quicinc.com>
Date: Thu, 13 Jun 2024 13:02:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 10/13] drm/msm/dpu: allow sharing SSPP between planes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
 <20240314000216.392549-11-dmitry.baryshkov@linaro.org>
 <68dc0d98-9830-d71d-ec65-71890fb2986e@quicinc.com>
 <CAA8EJpop48--yTyyWs+3b=sgHgjV6-7akp7mJX007aMaaKteJA@mail.gmail.com>
 <7e1c4f24-f663-71ea-3a03-e21951ee543b@quicinc.com>
 <emkkg5jqeyxvqifm4pubrtrizoui7cj3nnzwli7n2h6ly53xcf@dpa7245xozpp>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <emkkg5jqeyxvqifm4pubrtrizoui7cj3nnzwli7n2h6ly53xcf@dpa7245xozpp>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _XKqESzQqL1OvkII6HUC2Ww8H7kL_9MW
X-Proofpoint-ORIG-GUID: _XKqESzQqL1OvkII6HUC2Ww8H7kL_9MW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_12,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406130143
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



On 6/13/2024 3:05 AM, Dmitry Baryshkov wrote:
> On Wed, Jun 12, 2024 at 06:17:37PM -0700, Abhinav Kumar wrote:
>>
>>
>> On 6/12/2024 2:08 AM, Dmitry Baryshkov wrote:
>>> On Wed, 12 Jun 2024 at 02:12, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 3/13/2024 5:02 PM, Dmitry Baryshkov wrote:
>>>>> Since SmartDMA planes provide two rectangles, it is possible to use them
>>>>> to drive two different DRM planes, first plane getting the rect_0,
>>>>> another one using rect_1 of the same SSPP. The sharing algorithm is
>>>>> pretty simple, it requires that each of the planes can be driven by the
>>>>> single rectangle and only consequetive planes are considered.
>>>>>
>>>>
>>>> consequetive - > consecutive
>>>>
>>>> Can you please explain why only consecutive planes are considered for this?
>>>>
>>>> So lets say we have 4 virtual planes : 0, 1, 2, 3
>>>>
>>>> It will try 0-1, 1-2, 2-3
>>>>
>>>> Because all planes are virtual, there are only 3 unique pairs to be
>>>> considered? Otherwise technically 6 pairs are possible.
>>>
>>> An implementation that tries all 6 pairs taking the zpos and the
>>> overlapping into account is appreciated. I cared for the simplest case
>>> here. Yes, further optimizations can be implemented.
>>>
>>
>> Ok got it. So you would like to build a better one on top of this.
>> But I see one case where this has an issue or is not optimal. Pls see below.
> 
> Yes, it is not optimal. This is the 'best possible effort' or 'best
> simple effort' from my POV.
> 
>>
>>>>
>>>>
>>>> General request:
>>>>
>>>> Patches 1-9 : Add support for using 2 SSPPs in one plane
>>>> Patches 10-12 : Add support for using two rectangles of the same SSPP as
>>>> two virtual planes
>>>> Patch 13 : Can be pushed along with the first set.
>>>>
>>>> Can we break up this series in this way to make it easier to test and
>>>> land the bulk of it in this cycle?
>>>
>>> Sure.
>>>
>>
>> Thanks.
>>
>>>>
>>>> I have some doubts on patches 10-12 and would like to spend more time
>>>> reviewing and testing this. So I am trying to reduce the debt of patches
>>>> we have been carrying as this is a tricky feature to simulate and test
>>>> the cases.
>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 128 +++++++++++++++++++---
>>>>>     1 file changed, 112 insertions(+), 16 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>> index cde20c1fa90d..2e1c544efc4a 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>>>> @@ -886,10 +886,9 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
>>>>>         return 0;
>>>>>     }
>>>>>
>>>>> -static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
>>>>> -                                                struct dpu_sw_pipe_cfg *pipe_cfg,
>>>>> -                                                const struct dpu_format *fmt,
>>>>> -                                                uint32_t max_linewidth)
>>>>> +static int dpu_plane_is_multirect_capable(struct dpu_sw_pipe *pipe,
>>>>> +                                       struct dpu_sw_pipe_cfg *pipe_cfg,
>>>>> +                                       const struct dpu_format *fmt)
>>>>>     {
>>>>>         if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
>>>>>             drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect))
>>>>> @@ -901,6 +900,13 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
>>>>>         if (DPU_FORMAT_IS_YUV(fmt))
>>>>>                 return false;
>>>>>
>>>>> +     return true;
>>>>> +}
>>>>> +
>>>>> +static int dpu_plane_is_parallel_capable(struct dpu_sw_pipe_cfg *pipe_cfg,
>>>>> +                                      const struct dpu_format *fmt,
>>>>> +                                      uint32_t max_linewidth)
>>>>> +{
>>>>>         if (DPU_FORMAT_IS_UBWC(fmt) &&
>>>>>             drm_rect_width(&pipe_cfg->src_rect) > max_linewidth / 2)
>>>>>                 return false;
>>>>> @@ -908,6 +914,82 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
>>>>>         return true;
>>>>>     }
>>>>>
>>>>> +static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
>>>>> +                                                struct dpu_sw_pipe_cfg *pipe_cfg,
>>>>> +                                                const struct dpu_format *fmt,
>>>>> +                                                uint32_t max_linewidth)
>>>>> +{
>>>>> +     return dpu_plane_is_multirect_capable(pipe, pipe_cfg, fmt) &&
>>>>> +             dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
>>>>> +}
>>>>> +
>>>>> +
>>>>> +static int dpu_plane_try_multirect(struct dpu_plane_state *pstate,
>>>>> +                                struct dpu_plane_state *prev_pstate,
>>>>> +                                const struct dpu_format *fmt,
>>>>> +                                uint32_t max_linewidth)
>>>>> +{
>>>>> +     struct dpu_sw_pipe *pipe = &pstate->pipe;
>>>>> +     struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
>>>>> +     struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
>>>>> +     struct dpu_sw_pipe *prev_pipe = &prev_pstate->pipe;
>>>>> +     struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_pstate->pipe_cfg;
>>>>> +     const struct dpu_format *prev_fmt =
>>>>> +             to_dpu_format(msm_framebuffer_format(prev_pstate->base.fb));
>>>>> +     u16 max_tile_height = 1;
>>>>> +
>>>>> +     if (prev_pstate->r_pipe.sspp != NULL ||
>>>>> +         prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
>>>>> +             return false;
>>>>> +
>>>>> +     if (!dpu_plane_is_multirect_capable(pipe, pipe_cfg, fmt) ||
>>>>> +         !dpu_plane_is_multirect_capable(prev_pipe, prev_pipe_cfg, prev_fmt) ||
>>>>> +         !(test_bit(DPU_SSPP_SMART_DMA_V1, &prev_pipe->sspp->cap->features) ||
>>>>> +           test_bit(DPU_SSPP_SMART_DMA_V2, &prev_pipe->sspp->cap->features)))
>>>>
>>>> This test_bit check should be absorbed into
>>>> dpu_plane_is_multirect_capable()?
>>>
>>> Yep.
>>>
>>>>
>>>>> +             return false;
>>>>> +
>>>>> +     if (DPU_FORMAT_IS_UBWC(fmt))
>>>>> +             max_tile_height = max(max_tile_height, fmt->tile_height);
>>>>> +
>>>>> +     if (DPU_FORMAT_IS_UBWC(prev_fmt))
>>>>> +             max_tile_height = max(max_tile_height, prev_fmt->tile_height);
>>>>> +
>>>>> +     r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>>>>> +     r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>>>> +
>>>>> +     r_pipe->sspp = NULL;
>>>>> +
>>>>> +     if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth) &&
>>>>> +         dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, max_linewidth) &&
>>>>> +         (pipe_cfg->dst_rect.x1 >= prev_pipe_cfg->dst_rect.x2 ||
>>>>> +          prev_pipe_cfg->dst_rect.x1 >= pipe_cfg->dst_rect.x2)) {
>>>>
>>>> Even if y1 > y2 or y2 > y1 but the separation is less than the  2 *
>>>> max_tile_height, it can qualify for parallel fetch.
>>>>
>>>> So parallel fetch is possible not only in x direction but y direction as
>>>> well as it will be fetched by different SSPPs.
>>>
>>> I think that's now what I see in the SDE driver.
>>>
>>
>> hmm , okay, we can support that case once this one works without issues.
>>
>>>>
>>>>> +             pipe->sspp = prev_pipe->sspp;
>>>>> +
>>>>> +             pipe->multirect_index = DPU_SSPP_RECT_1;
>>>>> +             pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
>>>>> +
>>>>> +             prev_pipe->multirect_index = DPU_SSPP_RECT_0;
>>>>> +             prev_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
>>>>> +
>>>>> +             return true;
>>>>> +     }
>>>>> +
>>>>> +     if (pipe_cfg->dst_rect.y1 >= prev_pipe_cfg->dst_rect.y2 + 2 * max_tile_height ||
>>>>> +         prev_pipe_cfg->dst_rect.y1 >= pipe_cfg->dst_rect.y2 + 2 * max_tile_height) {
>>>>> +             pipe->sspp = prev_pipe->sspp;
>>>>> +
>>>>> +             pipe->multirect_index = DPU_SSPP_RECT_1;
>>>>> +             pipe->multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
>>>>> +
>>>>> +             prev_pipe->multirect_index = DPU_SSPP_RECT_0;
>>>>> +             prev_pipe->multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
>>>>> +
>>>>> +             return true;
>>>>> +     }
>>>>> +
>>>>> +     return false;
>>>>> +}
>>>>> +
>>>>>     static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
>>>>>                                         struct drm_atomic_state *state,
>>>>>                                         const struct drm_crtc_state *crtc_state)
>>>>> @@ -1098,13 +1180,14 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>>>>>     static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>>>>>                                               struct dpu_global_state *global_state,
>>>>>                                               struct drm_atomic_state *state,
>>>>> -                                           struct drm_plane_state *plane_state)
>>>>> +                                           struct drm_plane_state *plane_state,
>>>>> +                                           struct drm_plane_state *prev_plane_state)
>>>>>     {
>>>>>         const struct drm_crtc_state *crtc_state = NULL;
>>>>>         struct drm_plane *plane = plane_state->plane;
>>>>>         struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>>>>>         struct dpu_rm_sspp_requirements reqs;
>>>>> -     struct dpu_plane_state *pstate;
>>>>> +     struct dpu_plane_state *pstate, *prev_pstate;
>>>>>         struct dpu_sw_pipe *pipe;
>>>>>         struct dpu_sw_pipe *r_pipe;
>>>>>         struct dpu_sw_pipe_cfg *pipe_cfg;
>>>>> @@ -1117,6 +1200,7 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>>>>>                                                            plane_state->crtc);
>>>>>
>>>>>         pstate = to_dpu_plane_state(plane_state);
>>>>> +     prev_pstate = prev_plane_state ? to_dpu_plane_state(prev_plane_state) : NULL;
>>>>>         pipe = &pstate->pipe;
>>>>>         r_pipe = &pstate->r_pipe;
>>>>>         pipe_cfg = &pstate->pipe_cfg;
>>>>> @@ -1137,19 +1221,27 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>>>>>
>>>>>         max_linewidth = dpu_kms->catalog->caps->max_linewidth;
>>>>>
>>>>> -     pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
>>>>> -     if (!pipe->sspp)
>>>>> -             return -ENODEV;
>>>>> -
>>>>>         if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
>>>>> -             pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>>>>> -             pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>>>>> +             if (!prev_pstate ||
>>>>> +                 !dpu_plane_try_multirect(pstate, prev_pstate, fmt, max_linewidth)) {
>>>>
>>>> This is a bit confusing to check esp since i am unable to apply this
>>>> patch and check .... but...
>>>
>>> It was posted several months ago. No surprise that the source code has
>>> evolved. Getting the patches reviewed in time would have helped them
>>> to be applicable.
>>>
>>
>> Yes, part of the delays for virtual plane was purely because the CB setup
>> was down (both due to internal IT issues and general sc7280 being down) and
>> I want to make sure this series is compositor-tested and not just modetest
>> tested.
>>
>> But anyway, thats why I didnt request a rebase this time even though it was
>> very hard to review the patch emails for this series.
> 
> Review is review, testing is testing. Those are two different items.
> It's perfectly fine to review a patchset and at the same time to add a
> notice 'don't merge until fully validated on a hardware'.
> 

Ack, I will use this notice from now on.

>>
>>>> dpu_plane_atomic_check_nopipe() will set r_pipe_cfg if we are going to
>>>> do multirect with two rectangles of the same sspp. Right?
>>>
>>> No. It sets r_pipe_cfg in all the cases.
>>>
>>
>>  From what I see, we still have this check before a valid rectangle is set
>> for the r_pipe_cfg
>>
>>   	if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
>>   	     _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) >
>> max_mdp_clk_rate) {
> 
> I really don't see a contradiction here. Maybe I'm missing something.
> 
>>>> Which means r_pipe_cfg will be 0 if multirect is not possible with same
>>>> SSPP. Thats why the else case of this either uses two SSPPs.
>>>
>>> No. It means that the plane can use a single rectangle of the SSPP.
>>>
>>
>> OR that the plane does not need to use multirect because its rectangle width
>> is < max_linewidth.
> 
> Isn't it the same fact, just expressed in different words?
> 
>>
>>>>
>>>> So why are we trying multirect with again with the two rectangles of the
>>>> same SSPP as different planes? The result will be same right?
>>>
>>> No, if the width of r_pipe_cfg is 0, it means that this plane doesn't
>>> need a second rectangle to be displayed. So we can try reusing the
>>> SSPP from the previous plane.
>>>
>>
>> Yes, agreed to this point that this plane doesnt need a second rectangle to
>> be displayed as it will fit in one rectangle.
>>
>> And I see what you mean now, if the current plane needs only one rectangle
>> to be used, you are trying to use the prev plane's SSPP's other rect?
>>
>> So lets say we have plane 1 and plane 2 in the list.
>>
>> Plane 1 has only one rect used and plane 2 also needs only one rect.
>>
>> Then you use plane 1's SSPP even for plane 2.
> 
> Yes!
> 
>> Cant you use an alternative check like !dpu_plane_is_wideplane_multirect()
>> to make this condition clear?
> 
> No. There might be other conditions in play. So we really need to check
> both pipe configurations together in order to determine.
> 

What I meant was instead of doing !r_pip_cfg->rect maybe put that in a 
helper API like dpu_plane_is_wideplane_multirect().

It seems like to me the ideal way would have been that you have both the 
checks in the same place rather than breaking it up into a different API 
(check_no_pipe)

That way we could have done:

1) Try wide plane multirect
2) if that does not qualify, try SSPP sharing multirect
3) if both do not work, try dual SSPP

Now, it seems like to me that perhaps the migration of setting the 
r_pipe_cfg rect inside check_no_pipe() could have been avoided and 
rather just kept that outside?

>> Also dpu_plane_try_multirect() name is confusing then because you are trying
>> multi-rect again to see if the SSPP can be shared and wide-plane multirect
>> was not possible. So technically both are multirect, just dfferent
>> applications.
> 
> dpu_plane_try_sharing_sspp() ?
> 

Yes, this one is better.

>> That will make it clear that you are trying to use multi-rect for sharing
>> SSPP.
>>
>> So there are essentially two use-cases of multi-rect:
>>
>> 1) Wide plane multi-rect
>> 2) SSPP sharing multi-rect
>>
>> So this will make it clear.
> 
> Ideally we should be able to get rid of this distinction. Maybe in the
> end we should just list all pipe configurations in some natural order
> and then assign SSPP rectangles.
> 
>>
>> Coming to the algorithm, I see one issue with this now.
>>
>> Lets say we have this list of SSPPs.
>>
>> DMA0 Vig0 Vig1
> 
> Fine.
> 
>>
>> DMA0 has only rec0 used and rec1 is free.
>>
>> Vig0 needs both recs used.
>>
>> Vig1 needs only one rec.
> 
> And this is not fine. There are no fixed planes like DMA0, etc.
> 
> Let me rephrase that for you, if I got your example correctly. We have
> three planes, first one is small RGB plane, so it requires only a single
> rectangle, second plane requires both rectangles of VIG0.
> Third plane could have fit into DMA1 / REC1, but using this algorithm we
> end up allocating VIG1 for the third plane.
> 

Correct, this is the scenario I was trying to explain.

> 
>> Here it will notice that its previous plane has both rects used and will not
>> try the DMA0 even though it has one rect free and will end up using a new
>> SSPP.
>>
>> Thats why considering only immediate pairs is not enough. All possible pairs
>> will address this.
> 
> Yes, I know the algorithm is not optimal from the resource management
> point of view. However:
> 
> - I was not sure how allocating two rectangles of the same SSPP for
>    different stages will work across different hardware generations, etc.
>    This algorithm doesn't have such an issue, because both rectangles are
>    always using the same blending stage.
> 

hmm, I am not aware of any restrictions with this regard.

> - Trying all possible combinations requires exponential time for the
>    number of planes in use. The simple algorithm works in a linear time,
>    while being good enough for the simplest cases.
> 

Okay, lets go ahead with this algorithm but I will try to improve this.


> 
