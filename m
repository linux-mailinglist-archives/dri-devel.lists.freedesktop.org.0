Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB14A1301A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 01:40:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F07410E530;
	Thu, 16 Jan 2025 00:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="LhNFpZzD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F9510E197;
 Thu, 16 Jan 2025 00:40:44 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50FGqbQU018694;
 Thu, 16 Jan 2025 00:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 h1meRf8wD57+V9EdO92kCHnNaOOfnIxmy8gHzIkc9H4=; b=LhNFpZzDtXj/cb8W
 Xm+J+bA4sLUULY4QeRtu9xU0+4jkHwSt6HoBmMqb577RU6ITvy9YJW92COym1ubJ
 8C1aEk5j69ZnD5f/WO8Qw3mzLmvhprKF/TDjhBBnuZrOLRbXjyyGnw9eWaN5SoNj
 7dmlX2W0m7wV57oSy/paOpXmMzcs2GDTm+oVMF0aG7nopGeOC2yXDuH9h3Yi8qjq
 gNTWo8hXIVgA9xtnJGnLFCTTr045i9kowFcr6JrLk9v5Vwjt5VCyAqAGgvQ0Zx84
 eEwmjA9fnhIV4T7tcJgUFUkdQsOYjIx1DmYF+Emw9/aMgfR9zDgib+h8dWUI9b2Q
 4s/2lw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446gx38wxw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jan 2025 00:40:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50G0eeNm002443
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jan 2025 00:40:40 GMT
Received: from [10.71.108.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 Jan
 2025 16:40:40 -0800
Message-ID: <b5a49ad8-02df-4418-911c-91bc57c4d05a@quicinc.com>
Date: Wed, 15 Jan 2025 16:40:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/9] drm/msm/dpu: handle perf mode in
 _dpu_core_perf_crtc_update_bus()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
 <20250106-dpu-perf-rework-v4-7-00b248349476@linaro.org>
 <459422c9-c272-4389-9b05-487a0148a082@quicinc.com>
 <ab4wkauem3xb65wh3h22bcyzlpx26rrmsicrdlewomn55ykpqi@tggrsmb6qcmf>
 <8e6b6940-d155-4ab7-bdd6-a67e9506218a@quicinc.com>
 <4quxgv6n35np7fm7iqx5bw5xnkz7gxabh3ix5rexcq5nir5k7i@xi33w2wyj7om>
 <72c50442-5624-44ca-a954-64f7ddfa16f9@quicinc.com>
 <mvw34ny5en3dzt5ro6556daiktk6dc2azjotq26755dqscbu3b@fq7rxjqf7fg2>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <mvw34ny5en3dzt5ro6556daiktk6dc2azjotq26755dqscbu3b@fq7rxjqf7fg2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: dCm-AJho5fQTwl6YPhsLVmA_lqROuSpz
X-Proofpoint-ORIG-GUID: dCm-AJho5fQTwl6YPhsLVmA_lqROuSpz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_10,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160002
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



On 1/15/2025 4:32 PM, Dmitry Baryshkov wrote:
> On Wed, Jan 15, 2025 at 11:41:27AM -0800, Abhinav Kumar wrote:
>>
>>
>> On 1/15/2025 12:27 AM, Dmitry Baryshkov wrote:
>>> On Tue, Jan 14, 2025 at 01:18:26PM -0800, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 1/14/2025 3:10 AM, Dmitry Baryshkov wrote:
>>>>> On Mon, Jan 13, 2025 at 07:38:16PM -0800, Abhinav Kumar wrote:
>>>>>>
>>>>>>
>>>>>> On 1/5/2025 7:07 PM, Dmitry Baryshkov wrote:
>>>>>>> Move perf mode handling for the bandwidth to
>>>>>>> _dpu_core_perf_crtc_update_bus() rather than overriding per-CRTC data
>>>>>>> and then aggregating known values.
>>>>>>>
>>>>>>> Note, this changes the fix_core_ab_vote. Previously it would be
>>>>>>> multiplied per the CRTC number, now it will be used directly for
>>>>>>> interconnect voting. This better reflects user requirements in the case
>>>>>>> of different resolutions being set on different CRTCs: instead of using
>>>>>>> the same bandwidth for each CRTC (which is incorrect) user can now
>>>>>>> calculate overall bandwidth required by all outputs and use that value.
>>>>>>>
>>>>>>
>>>>>> There are two things this change is doing:
>>>>>>
>>>>>> 1) Dropping the core_clk_rate setting because its already handled inside
>>>>>> _dpu_core_perf_get_core_clk_rate() and hence dpu_core_perf_crtc_update()
>>>>>> will still work.
>>>>>>
>>>>>> and
>>>>>>
>>>>>> 2) Then this part of moving the ab/ib setting to
>>>>>> _dpu_core_perf_crtc_update_bus().
>>>>>>
>>>>>> Can we split this into two changes so that its clear that dropping
>>>>>> core_clk_rate setting in this change will not cause an issue.
>>>>>
>>>>> Ack
>>>>>
>>>>
>>>> Actually I think this is incorrect.
>>>>
>>>> If the user puts in an incorrect value beyond the bounds, earlier the code
>>>> will reject that by failing the in _dpu_core_perf_calc_crtc().
>>>
>>> This function doesn't perform any validation nor returns an error code.
>>> Probably you've meant some other function.
>>>
>>
>> Sorry, let me explain a little more to complete the flow I am seeing.
>>
>> _dpu_core_perf_calc_crtc() gets called by dpu_core_perf_crtc_check().
>>
>> That one checks against erroneous values.
>>
>>                  if (!threshold) {
>>                          DPU_ERROR("no bandwidth limits specified\n");
>>                          return -E2BIG;
>>                  } else if (bw > threshold) {
>>                          DPU_ERROR("exceeds bandwidth: %ukb > %ukb\n", bw,
>>                                          threshold);
>>                          return -E2BIG;
>>                  }
> 
> Here we are checking that the selected set of modes doesn't overload
> defined platform requirements. However I think that it should be
> possible for the user to attempt to overcome predefined bandwidth
> limitations in attempt to debug the issue. ICC framework handles that
> perfectly (and if you check, until the sync_state is reached all BW's
> are assumed to be UINT_MAX). Maybe I should document it in the commit
> message that after this commit forced BWs are not a subject to the
> catalog limitations.
> 

hmmm, yes this was the validation I was referring to.

I didnt get why a user should be allowed to go beyond the platform 
limits, what purpose does that serve , its not leading to any conclusion 
or towards the resolution of the issue. With the platform validation not 
only we are enforcing the limits but also making sure that random values 
given by the user dont cause more harm than good.

>>
>>>>
>>>> Now, if we move it to _dpu_core_perf_crtc_update_bus(), this is beyond the
>>>> check phase so incorrect values cannot be rejected.
>>>>
>>>> So we will still need to preserve overriding the values in
>>>> _dpu_core_perf_calc_crtc().
>>>>
>>>>>>
>>>>>>
>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 40 +++++++++++++--------------
>>>>>>>      1 file changed, 19 insertions(+), 21 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>>>>>>> index 70f43e8359caee2082f2ca9944a17a6a20aa3d49..7ff3405c6867556a8dc776783b91f1da6c86ef3f 100644
>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>>>>>>> @@ -118,22 +118,9 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
>>>>>>>      		return;
>>>>>>>      	}
>>>>>>> -	memset(perf, 0, sizeof(struct dpu_core_perf_params));
>>>>>>> -
>>>>>>> -	if (core_perf->perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
>>>>>>> -		perf->bw_ctl = 0;
>>>>>>> -		perf->max_per_pipe_ib = 0;
>>>>>>> -		perf->core_clk_rate = 0;
>>>>>>> -	} else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
>>>>>>> -		perf->bw_ctl = core_perf->fix_core_ab_vote * 1000ULL;
>>>>>>> -		perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
>>>>>>> -		perf->core_clk_rate = core_perf->fix_core_clk_rate;
>>>>>>> -	} else {
>>>>>>> -		perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
>>>>>>> -		perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
>>>>>>> -		perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
>>>>>>> -	}
>>>>>>> -
>>>>>>> +	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
>>>>>>> +	perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
>>>>>>> +	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
>>>>>>>      	DRM_DEBUG_ATOMIC(
>>>>>>>      		"crtc=%d clk_rate=%llu core_ib=%u core_ab=%u\n",
>>>>>>>      			crtc->base.id, perf->core_clk_rate,
>>>>>>> @@ -222,18 +209,29 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
>>>>>>>      {
>>>>>>>      	struct dpu_core_perf_params perf = { 0 };
>>>>>>>      	int i, ret = 0;
>>>>>>> -	u64 avg_bw;
>>>>>>> +	u32 avg_bw;
>>>>>>> +	u32 peak_bw;
>>>>>>>      	if (!kms->num_paths)
>>>>>>>      		return 0;
>>>>>>> -	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
>>>>>>> +	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
>>>>>>> +		avg_bw = 0;
>>>>>>> +		peak_bw = 0;
>>>>>>> +	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
>>>>>>> +		avg_bw = kms->perf.fix_core_ab_vote;
>>>>>>> +		peak_bw = kms->perf.fix_core_ib_vote;
>>>>>>> +	} else {
>>>>>>> +		dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
>>>>>>> +
>>>>>>> +		avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
>>>>>>> +		peak_bw = perf.max_per_pipe_ib;
>>>>>>> +	}
>>>>>>> -	avg_bw = perf.bw_ctl;
>>>>>>> -	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
>>>>>>> +	avg_bw /= kms->num_paths;
>>>>>>>      	for (i = 0; i < kms->num_paths; i++)
>>>>>>> -		icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
>>>>>>> +		icc_set_bw(kms->path[i], avg_bw, peak_bw);
>>>>>>>      	return ret;
>>>>>>>      }
>>>>>>>
>>>>>
>>>
> 
