Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02514933430
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 00:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5260210E8FE;
	Tue, 16 Jul 2024 22:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="WXSHJIhb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078BC10E8FD;
 Tue, 16 Jul 2024 22:25:05 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46GHesmQ031863;
 Tue, 16 Jul 2024 22:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 05xxKaYxYa1oRwc8zqQ9/XPos2PC/6l9sH2GUsjaBYc=; b=WXSHJIhbp+LimyLZ
 yVLJWxf+5RLR7NoCLBvCcCjjmiycCGY44F8U2wsP6ljssyugavBRnDB9G0Cd38gK
 AD0G0hiwGreUtvT7/wE7x0oM4be006jzI9KjsqYKOr4nkyrvSw/M4QWqgu6qOZbw
 tG9cir/XUUOMeRiDRIeng78kn765+boMwBL+zdN5xRFQFQgPb4yWIrm+xHdWYylA
 EwUMkfBUtd+snh/7mwGAD1yFEPip2oAeTqi5b6a2l8snXGMBWhg/UWvMXWLgLFLq
 Pk52CnvMuBnV0YNeq7SPbpczC/hVnCkCzz9OigHblq+zeIooPBHPcUu0/P+gWiBL
 aIqZyg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfs0g2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jul 2024 22:25:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46GMOxZX028539
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jul 2024 22:24:59 GMT
Received: from [10.71.110.34] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 16 Jul
 2024 15:24:58 -0700
Message-ID: <c023874c-9df2-4195-92ad-c355c67ceccd@quicinc.com>
Date: Tue, 16 Jul 2024 15:24:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/16] drm/msm/dpu: fix error condition in
 dpu_encoder_virt_atomic_mode_set
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
 <20240625-dpu-mode-config-width-v5-2-501d984d634f@linaro.org>
 <637fbd36-d6cd-4bb7-af83-8849c0fee8f2@quicinc.com>
 <CAA8EJppxyUrEWYQvMGtw14UVobkQdaPZuwHPeMcONRYrgPp2jw@mail.gmail.com>
 <cf1ed8b1-1c70-47f8-8c34-ef62129d44a8@quicinc.com>
 <CAA8EJpqXv2cfN2CC1+FMgwXnwMh3BeocY5ae1sOZazdy0_FCNw@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpqXv2cfN2CC1+FMgwXnwMh3BeocY5ae1sOZazdy0_FCNw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: fvZvILsnwdwyHu_b7GvZNMK0pTYzJQBG
X-Proofpoint-GUID: fvZvILsnwdwyHu_b7GvZNMK0pTYzJQBG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-16_02,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407160164
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



On 7/13/2024 2:49 AM, Dmitry Baryshkov wrote:
> On Sat, 13 Jul 2024 at 03:25, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 7/12/2024 4:11 PM, Dmitry Baryshkov wrote:
>>> On Fri, 12 Jul 2024 at 22:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>> On 6/24/2024 2:13 PM, Dmitry Baryshkov wrote:
>>>>> The commit b954fa6baaca ("drm/msm/dpu: Refactor rm iterator") removed
>>>>> zero-init of the hw_ctl array, but didn't change the error condition,
>>>>> that checked for hw_ctl[i] being NULL. Use indices check instead.
>>>>>
>>>>> Fixes: b954fa6baaca ("drm/msm/dpu: Refactor rm iterator")
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>> index 5d205e09cf45..7613005fbfea 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>>> @@ -1186,7 +1186,7 @@ static void :tag(struct drm_encoder *drm_enc,
>>>>>                         return;
>>>>>                 }
>>>>>
>>>>> -             if (!hw_ctl[i]) {
>>>>> +             if (i >= num_ctl) {
>>>>
>>>> This is not very clear to me.
>>>>
>>>> How will we hit this condition? I dont see i going beyond 1 in this loop
>>>> and neither should num_ctl
>>>
>>> Why? the driver doesn't support flushing through a single CTL, so
>>> num_ctl = num_intf.
>>>
>>
>> num_ctl will be = num_intf, but what I was trying to understand here is
>> that , previously this condition was making sure that we have a ctl
>> assigned for each physical encoder which is actually a requirement for
>> the display pipeline. If we assigned a hw_ctl for one phys encoder and
>> not the other, its an error.
>>
>> But on closer look, I think even your check will catch that.
>>
>>
>>>>
>>>> Will it be just easier to bring back the NULL assignment at the top?
>>>>
>>>> struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC] = { NULL };
>>>>
>>>> I also see the same issue for other blocks such as hw_dsc, hw_lm
>>>
>>> Other blocks loop properly up to the num_resource. I'd prefer to drop
>>> the NULL init from the DSPP init and use num_dspp instead.
>>>
>>
>> Overall, I think the purpose of NULL init was to make sure that before
>> we call to_dpu_hw_***() macros, we have a valid hw_*.
>>
>> We could use either num_* or the hw_* as both are returned by RM.
>>
>> One side-note here is with a proper NULL hw_ctl is that the consumers of
>> hw_ctl should also be able to check for NULL correctly.
> 
> The problem of the NULL checks is that it's too tempting to perform a
> NULL check after to_dpu_hw_ctl conversion. However it's not safe to
> pass NULL pointer to such functions: there is no guarantee that
> conversion will return NULL if it gets passed the NULL pointer.
> 

Yes, thats why these checks are there before calling to_dpu_hw_ctl() to 
make sure we dont pass NULL there.

>> So for example dpu_encoder_phys layers use if (!phys->hw_ctl) checks but
>> today we do not set phys->hw_ctl to NULL correctly.
>>
>> Do you think that instead of the return statements, we should do
>> something like
>>
>> dpu_enc->hw_ctl = i < num_ctl ?
>>          to_dpu_hw_ctl(hw_ctl[i]) : NULL;
> 
> Yeah, why not.
> 
> Generally, I think we should stop storing the state-related data in
> the non-state structures. Hopefully I'll have time for that at some
> point later on.
> 
>>
>>
>> But this will need the NULL init back.
> 
> It doesn't, as you have the comparison.
> 

Ack, yes thats true. Lets do it this way then. I am fine with that.

>>
>>>>
>>>>>                         DPU_ERROR_ENC(dpu_enc,
>>>>>                                 "no ctl block assigned at idx: %d\n", i);
>>>>>                         return;
>>>>>
>>>
>>>
>>>
> 
> 
> 
