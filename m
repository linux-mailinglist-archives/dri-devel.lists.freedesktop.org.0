Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DF0A0FE23
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 02:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D3B710E445;
	Tue, 14 Jan 2025 01:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="BRRrECD2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D673E10E445;
 Tue, 14 Jan 2025 01:31:44 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DH3i11020124;
 Tue, 14 Jan 2025 01:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QqYrKHvprx70ssLEZk0ynL28q1dwRsUZAy8EBMLnmpA=; b=BRRrECD2dMy5FlP8
 v8is2CgwS60UfaLg/X9Dd+8NoncyM9iApgGLWD31G0hNqW4tGDXaRNXF5bJuh97p
 /aTj4Io29849STZYVVfPuuojirxgBpZO9upWXwKwluohLlL9anwZLurEkx93gh4P
 NNXHjIowg5+whWHuNPimQdK9qBduwtmaMy4Z9175lC9o/sc3uI0rCpqxyG09KPle
 Ek8PX7wvd46NxUIx49/fNTdva/U8jGvkFHlKwIqZ3Amt/PwSCfkRPE5a4NRdK57F
 t/Tlu+HNbXmMqzKsGOAM1Mv8jEs/6JlESn0kYTJHNMtZr+DmpyhR9NZRGikVQm2A
 zWHa2A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4456wa90xj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jan 2025 01:31:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50E1VeJo009736
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jan 2025 01:31:40 GMT
Received: from [10.71.108.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 Jan
 2025 17:31:39 -0800
Message-ID: <21bf3612-7b93-44ee-82b0-462a02d8e3ce@quicinc.com>
Date: Mon, 13 Jan 2025 17:31:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/9] drm/msm/dpu: make fix_core_ab_vote consistent with
 fix_core_ib_vote
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
 <20250106-dpu-perf-rework-v4-4-00b248349476@linaro.org>
 <35a22251-c348-4bb7-905c-e24032100a00@quicinc.com>
 <sklr3ryu35xmoejkmbu35d3jxsg2clk3whmzslxtzcbcb3gjy4@bmcivlzkxqa3>
 <a17204c1-6eb5-4ce4-a302-c5f582055037@quicinc.com>
 <0B5D10CF-35CE-4CF5-9105-5ACCC04EB94B@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <0B5D10CF-35CE-4CF5-9105-5ACCC04EB94B@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 076LzRLzTnji_aaUsXHT6ZrarDKyGCCI
X-Proofpoint-ORIG-GUID: 076LzRLzTnji_aaUsXHT6ZrarDKyGCCI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 suspectscore=0 adultscore=0 mlxlogscore=973 priorityscore=1501
 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140010
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



On 1/11/2025 5:08 AM, Dmitry Baryshkov wrote:
> On 11 January 2025 01:49:23 EET, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>> On 1/9/2025 6:02 PM, Dmitry Baryshkov wrote:
>>> On Thu, Jan 09, 2025 at 05:40:23PM -0800, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 1/5/2025 7:07 PM, Dmitry Baryshkov wrote:
>>>>> The fix_core_ab_vote is an average bandwidth value, used for bandwidth
>>>>> overrides in several cases. However there is an internal inconsistency:
>>>>> fix_core_ib_vote is defined in KBps, while fix_core_ab_vote is defined
>>>>> in Bps.
>>>>>
>>>>> Fix that by changing the type of the variable to u32 and using * 1000ULL
>>>>> multiplier when setting up the dpu_core_perf_params::bw_ctl value.
>>>>>
>>>>
>>>> Actually after looking at this, I have another question.
>>>>
>>>> How did you conclude that fix_core_ib_vote is in KBps?
>>>>
>>>> min_dram_ib is in KBps in the catalog but how is fix_core_ib_vote?
>>>>
>>>> It depends on the interpretation perhaps. If the debugfs was supposed to
>>>> operate under the expectation that the provided value will be pre-multiplied
>>>> by 1000 and given then that explains why it was not multiplied again.
>>>>
>>>> And I cross-checked some of the internal usages of the debugfs, the values
>>>> provided to it were in Bps and not KBps.
>>>
>>> Well... As you wrote min_dram_ib is in KBps. So, by comparing the next
>>> two lines, fix_core_ib_vote should also be in kBps, as there is no
>>> premultiplier:
>>>
>>>                   perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
>>> [...]
>>>                   perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
>>>
>>> And then, as a proof, perf->max_per_pipe_ib is passed to icc_set_bw()
>>> without any modifications:
>>>
>>>                   icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
>>>
>>
>> Understood max_per_pipe_ib. But then by the same logic, fix_core_ab_vote is always in Bps and not in KBps because bw_ctl is in Bps.
>>
>> Is it really a discrepancy that fix_core_ib_vote is defined in KBps, while fix_core_ab_vote is defined in Bps because they are just following the units in which bw_ctl and max_per_pipe_ib were defined in resp.
> 
> Yes. They come in pair, as a part of the user interface. If one is in Bps and another one in KBps, it is very easy to forget that and misinterpret them or to make a mistake while programming them. Not to mention that the threshold files, which are related to AB, are in KBps.
> 

In that case, the documentation for both needs to be updated as well as 
it still says both are in bps not kbps.

  * @fix_core_ib_vote: fixed core ib vote in bps used in mode 2
  * @fix_core_ab_vote: fixed core ab vote in bps used in mode 2
  */
struct dpu_core_perf {
         const struct dpu_perf_cfg *perf_cfg;
         u64 core_clk_rate;
         u64 max_core_clk_rate;
         struct dpu_core_perf_tune perf_tune;
         u32 enable_bw_release;
         u64 fix_core_clk_rate;
         u64 fix_core_ib_vote;
         u64 fix_core_ab_vote;
};

>>
>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ++--
>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 2 +-
>>>>>     2 files changed, 3 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>>>>> index 7263ab63a692554cd51a7fd91bd6250330179240..7cabc8f26908cfd2dbbffebd7c70fc37d9159733 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
>>>>> @@ -125,7 +125,7 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
>>>>>     		perf->max_per_pipe_ib = 0;
>>>>>     		perf->core_clk_rate = 0;
>>>>>     	} else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
>>>>> -		perf->bw_ctl = core_perf->fix_core_ab_vote;
>>>>> +		perf->bw_ctl = core_perf->fix_core_ab_vote * 1000ULL;
>>>>>     		perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
>>>>>     		perf->core_clk_rate = core_perf->fix_core_clk_rate;
>>>>>     	} else {
>>>>> @@ -479,7 +479,7 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
>>>>>     			&perf->fix_core_clk_rate);
>>>>>     	debugfs_create_u32("fix_core_ib_vote", 0600, entry,
>>>>>     			&perf->fix_core_ib_vote);
>>>>> -	debugfs_create_u64("fix_core_ab_vote", 0600, entry,
>>>>> +	debugfs_create_u32("fix_core_ab_vote", 0600, entry,
>>>>>     			&perf->fix_core_ab_vote);
>>>>>     	return 0;
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
>>>>> index ca4595b4ec217697849af02446b23ed0857a0295..5e07119c14c6a9ed3413d0eaddbd93df5cc3f79d 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
>>>>> @@ -51,7 +51,7 @@ struct dpu_core_perf {
>>>>>     	u32 enable_bw_release;
>>>>>     	u64 fix_core_clk_rate;
>>>>>     	u32 fix_core_ib_vote;
>>>>> -	u64 fix_core_ab_vote;
>>>>> +	u32 fix_core_ab_vote;
>>>>>     };
>>>>>     int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
>>>>>
>>>
> 
