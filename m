Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E1888635F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 23:39:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB0A1121FB;
	Thu, 21 Mar 2024 22:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="aVcXCbDP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBDC112201;
 Thu, 21 Mar 2024 22:39:26 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42LKODcB005847; Thu, 21 Mar 2024 22:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=vlMZYf//CJEOuSyhkVYJf8jOVq9pY/I8lS9n23jYZIk=; b=aV
 cXCbDPN9e00tmjh7QGH+lrjHskYtWLMz9XwhpEhpwQM25d5FTfZruMlD35Lac15g
 TbK2Oj4BopjMgGgX0SBR8DCCn8YPrRTDNzbdMs2UEKZMpCP5Psyues1JK2gHwNFD
 Sjaeu36rw3PCBcZzn8vBo/yeblcZcBV2rTvoqw4RZTq0Q6dcJVQSZJObrbiLu1C3
 GHojpwJsNg50g3V1lXNEBVJ0csSZXkFEz76cW5E3w1ZiNOovaVzPj2qOOYjrZ7LD
 kB10Xl5tVcx7h7shaHVO9i0posaXEE3cCD3YfEiJt2K+6yVxJDpzgUroMCzLZAuJ
 ZfoDUiY88+35LxoDM92A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x0nb31cpr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Mar 2024 22:39:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42LMcshB027129
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Mar 2024 22:38:54 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 21 Mar
 2024 15:38:51 -0700
Message-ID: <80b520c5-0b76-a45c-2d1f-a73e6577cf73@quicinc.com>
Date: Thu, 21 Mar 2024 15:38:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 3/5] drm/msm/dpu: handle perf mode in
 _dpu_core_perf_crtc_update_bus()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
References: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
 <20240314-dpu-perf-rework-v3-3-79fa4e065574@linaro.org>
 <ebf0ca9b-6e9d-4387-8628-a6ccaca11215@quicinc.com>
 <CAA8EJprhgPheFq-xhAh54NkTTh5_BJk=bL1f94=hvsio6VUSQQ@mail.gmail.com>
 <949d04c1-910d-04e0-14f2-1373c1312daf@quicinc.com>
 <CAA8EJppVbnB+P4sYWXJZ4=1_yb2jQhPjC1x6w1zEJQp4Cnj4-A@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJppVbnB+P4sYWXJZ4=1_yb2jQhPjC1x6w1zEJQp4Cnj4-A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: cF--rPkWnDdmciX8LNUgzvELkpWBfgH_
X-Proofpoint-ORIG-GUID: cF--rPkWnDdmciX8LNUgzvELkpWBfgH_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-21_12,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403210172
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



On 3/19/2024 3:25 PM, Dmitry Baryshkov wrote:
> On Tue, 19 Mar 2024 at 23:35, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 3/19/2024 1:43 PM, Dmitry Baryshkov wrote:
>>> On Tue, 19 Mar 2024 at 22:34, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 3/13/2024 6:10 PM, Dmitry Baryshkov wrote:
>>>>> Move perf mode handling for the bandwidth to
>>>>> _dpu_core_perf_crtc_update_bus() rather than overriding per-CRTC data
>>>>> and then aggregating known values.
>>>>>
>>>>> Note, this changes the fix_core_ab_vote. Previously it would be
>>>>> multiplied per the CRTC number, now it will be used directly for
>>>>> interconnect voting.
>>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 39 +++++++++++++--------------
>>>>>     1 file changed, 19 insertions(+), 20 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>>>>> index 87b892069526..ff2942a6a678 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>>>>> @@ -118,21 +118,9 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
>>>>>                 return;
>>>>>         }
>>>>>
>>>>> -     memset(perf, 0, sizeof(struct dpu_core_perf_params));
>>>>> -
>>>>> -     if (core_perf->perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
>>>>> -             perf->bw_ctl = 0;
>>>>> -             perf->max_per_pipe_ib = 0;
>>>>> -             perf->core_clk_rate = 0;
>>>>> -     } else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
>>>>> -             perf->bw_ctl = core_perf->fix_core_ab_vote;
>>>>> -             perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
>>>>> -             perf->core_clk_rate = core_perf->fix_core_clk_rate;
>>>>> -     } else {
>>>>> -             perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
>>>>> -             perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
>>>>> -             perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
>>>>> -     }
>>>>> +     perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
>>>>> +     perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
>>>>> +     perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
>>>>>
>>>>>         DRM_DEBUG_ATOMIC(
>>>>>                 "crtc=%d clk_rate=%llu core_ib=%llu core_ab=%llu\n",
>>>>> @@ -233,18 +221,29 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
>>>>>     {
>>>>>         struct dpu_core_perf_params perf = { 0 };
>>>>>         int i, ret = 0;
>>>>> -     u64 avg_bw;
>>>>> +     u32 avg_bw;
>>>>> +     u32 peak_bw;
>>
>> Why were avg_bw and peak_bw values brought down to u32?
>>
>> I think we might go higher so u64 was better.
> 
> First of all, icc_set_bw takes u32, not u64. The unit is 1000 bps, not
> 1 bps, so sensible values fit into u32.
> 

True and agreed.

Would have been better to send this update as a separate patch so that 
its clear why you are actually doing this downgrade instead of this 
being hidden in this cleanup perhaps even with a Fixes tag then.

>>
>>>>>
>>>>>         if (!kms->num_paths)
>>>>>                 return 0;
>>>>>
>>>>> -     dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
>>>>> +     if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
>>>>> +             avg_bw = 0;
>>>>> +             peak_bw = 0;
>>>>> +     } else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
>>>>> +             avg_bw = kms->perf.fix_core_ab_vote;
>>>>> +             peak_bw = kms->perf.fix_core_ib_vote;
>>
>> Instead of changing the value of avg_bw like mentioned in commit text,
>> why cant we do avg_bw = fix_core_ab * (drm_mode_config::num_crtc);
>>
>> Any reason you want to change it from "per CRTC fixed" to just "fixed"?
>>
>> Now, the user who wants to hard-code this also needs to first account
>> for number of CRTCs from the dri state and then program the fixed value
>> using debugfs. Thats not convenient.
> 
> Different CRTCs have different bandwidth values, so programming as
> value-per-CRTC is not efficient. In the end we care for the overall
> bandwidth, so one has to calculate the expected value then divide it
> per num_crtc.
>

Yes, different CRTCs will have different bandwidth values as each CRTC 
might be driving a different resolution.

So you are expecting the user to program the total bandwidth they are 
expecting (sum_of_crtcs).

Then why would they have to divide it per num_crtc?

After this change, I think you are expecting the overall bandwidth right?

I think some --help option for this debugfs should be written now or 
later to explain what to do with node,

>>
>>>>> +     } else {
>>>>> +             dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
>>>>
>>>> Where is this function dpu_core_perf_aggregate() defined? I dont see it
>>>> in msm-next
>>>
>>> In the previous patch.
>>>
>>
>> Sorry, my bad. I thought it had a different name in the prev patch :/
> 
> No problems.
> 
>>
>>
>>>>
>>>>> +
>>>>> +             avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
>>>>> +             peak_bw = perf.max_per_pipe_ib;
>>>>> +     }
>>>>>
>>>>> -     avg_bw = perf.bw_ctl;
>>>>> -     do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
>>>>> +     avg_bw /= kms->num_paths;
>>>>>
>>
>>>>>         for (i = 0; i < kms->num_paths; i++)
>>>>> -             icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
>>>>> +             icc_set_bw(kms->path[i], avg_bw, peak_bw);
>>>>>
>>>>>         return ret;
>>>>>     }
>>>>>
>>>
>>>
>>>
> 
> 
> 
