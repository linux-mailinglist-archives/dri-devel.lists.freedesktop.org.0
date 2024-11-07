Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 134A69C090C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 15:36:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD5710E863;
	Thu,  7 Nov 2024 14:36:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="pZQ12oA0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6384D10E310;
 Thu,  7 Nov 2024 14:36:21 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A75hrql002118;
 Thu, 7 Nov 2024 14:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 z+3wHS3gqApFtMhQvOyrWRXfCH4jhD5FMxIgxyYjq3c=; b=pZQ12oA0yQWZatlq
 gf8DsHhL3z6BoGYBmgVrPBBD3dW26JuFT263GX94ZvdN3oGDivQmEFL5E4a148rR
 SIQ/NznCtP3AWX4Ne8GfDjEi9pC5qWeoIWIHHKFCxjMx7tNuTeh59ijZ/jCmmhcb
 7F57vI+XY/VLffCVW9xyAZEF0nC9ro5U4XdcpxnhLwa+HsMMygCjk/Bccnd1/O4+
 /OTtdLQpKMUqYjTVeaupa+eI77ISu9sO7KE18nNaFKkXPkgBSdqU9n8t0EAEU26b
 CtS/RF8OIwi5+BX7YR+DkaeBYAF8Y/rUbwYXEuLkMNfXTyG6Bpl63cIY3aQ3gRot
 vPhlfA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42r072n2r0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Nov 2024 14:36:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A7EZwUs009870
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 7 Nov 2024 14:35:58 GMT
Received: from [10.206.104.82] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 7 Nov 2024
 06:35:52 -0800
Message-ID: <6e67ae77-a116-422c-a07b-77e991a664ea@quicinc.com>
Date: Thu, 7 Nov 2024 20:05:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] drm/msm/adreno: Add support for ACD
To: <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Viresh Kumar
 <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20241012-gpu-acd-v1-0-1e5e91aa95b6@quicinc.com>
 <20241012-gpu-acd-v1-1-1e5e91aa95b6@quicinc.com>
 <4aeec9f1-720b-400c-9582-d02847db2ac7@linaro.org>
 <43404449-1830-4651-a85a-54404b1d35bc@quicinc.com>
 <56a976d6-7dd6-4001-b6a8-268ed7d787d2@linaro.org>
 <49e1a6b6-683f-4826-b67e-8354a10a785d@quicinc.com>
 <85eaeaca-850d-47d4-b81d-b23f25084d81@linaro.org>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <85eaeaca-850d-47d4-b81d-b23f25084d81@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ifBweuF2nDAoe7kEjNp7oTRinqJqKB89
X-Proofpoint-GUID: ifBweuF2nDAoe7kEjNp7oTRinqJqKB89
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070114
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

On 11/7/2024 8:01 PM, neil.armstrong@linaro.org wrote:
> On 07/11/2024 13:46, Akhil P Oommen wrote:
>> On 11/7/2024 2:25 PM, neil.armstrong@linaro.org wrote:
>>> On 06/11/2024 02:44, Akhil P Oommen wrote:
>>>> On 11/4/2024 9:14 PM, neil.armstrong@linaro.org wrote:
>>>>> On 11/10/2024 22:29, Akhil P Oommen wrote:
>>>>>> ACD a.k.a Adaptive Clock Distribution is a feature which helps to
>>>>>> reduce
>>>>>> the power consumption. In some chipsets, it is also a requirement to
>>>>>> support higher GPU frequencies. This patch adds support for GPU
>>>>>> ACD by
>>>>>> sending necessary data to GMU and AOSS. The feature support for the
>>>>>> chipset is detected based on devicetree data.
>>>>>>
>>>>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 81 +++++++++++++++++++
>>>>>> ++++++
>>>>>> +++-------
>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 36 ++++++++++++++++
>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_hfi.h | 21 +++++++++
>>>>>>     4 files changed, 124 insertions(+), 15 deletions(-)
>>>>>>
>>>>>
>>>>> <snip>
>>>>>
>>>>>> +
>>>>>> +static int a6xx_hfi_enable_acd(struct a6xx_gmu *gmu)
>>>>>> +{
>>>>>> +    struct a6xx_hfi_acd_table *acd_table = &gmu->acd_table;
>>>>>> +    struct a6xx_hfi_msg_feature_ctrl msg = {
>>>>>> +        .feature = HFI_FEATURE_ACD,
>>>>>> +        .enable = 1,
>>>>>> +        .data = 0,
>>>>>> +    };
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    if (!acd_table->enable_by_level)
>>>>>> +        return 0;
>>>>>> +
>>>>>> +    /* Enable ACD feature at GMU */
>>>>>> +    ret = a6xx_hfi_send_msg(gmu, HFI_H2F_FEATURE_CTRL, &msg,
>>>>>> sizeof(msg), NULL, 0);
>>>>>> +    if (ret) {
>>>>>> +        DRM_DEV_ERROR(gmu->dev, "Unable to enable ACD (%d)\n", ret);
>>>>>> +        return ret;
>>>>>> +    }
>>>>>> +
>>>>>> +    /* Send ACD table to GMU */
>>>>>> +    ret = a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_ACD, &msg, sizeof(msg),
>>>>>> NULL, 0);
>>>>>
>>>>> This looks wrong, in this exact code, you never use the acd_table...
>>>>> perhaps it should be acd_table here
>>>>
>>>> Whoops! Weirdly gmu didn't explode when I tested.
>>>>
>>>> Thanks for your keen eye.
>>>
>>> You're welcome !
>>>
>>> I've been trying to enable this on SM8650, but HFI_H2F_MSG_ACD fails.
>>>
>>> My changes:
>>> ================><================================
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/
>>> msm/adreno/a6xx_hfi.c
>>> index 7c96d6f8aaa9..bd9d586f245e 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>>> @@ -682,7 +682,7 @@ static int a6xx_hfi_enable_acd(struct a6xx_gmu *gmu)
>>>          }
>>>
>>>          /* Send ACD table to GMU */
>>> -       ret = a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_ACD, &acd_table,
>>> sizeof(*acd_table), NULL, 0);
>>> +       ret = a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_ACD, &acd_table,
>>
>> &acd_table -> acd_table here?
> 
> Damn, good catch !
> 
> Ok so it didn't explode anymore, but still fails:
> =====
> [    7.083258] platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg.constprop.0
> [msm]] *ERROR* Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 7 timed out
> waiting for response
> [    7.149709] platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg.constprop.0
> [msm]] *ERROR* Unexpected message id 7 on the response queue
> [    7.149744] platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg.constprop.0
> [msm]] *ERROR* The HFI response queue is unexpectedly empty
> [    7.165163] platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg.constprop.0
> [msm]] *ERROR* Unexpected message id 8 on the response queue
> [    7.165188] platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg.constprop.0
> [msm]] *ERROR* The HFI response queue is unexpectedly empty
> ====
> 
> Seems with ACD enabled, first vote can take up to 100ms, and downstream
> has 1s timeout, with a larger timeout I got it to work !

Yes, there is an additional overhead during first perf vote. Thanks for
the heads up. I am yet to test with fixes.

-Akhil.

> 
> Thanks,
> Neil
>>
>> -Akhil
>>
>>> sizeof(struct a6xx_hfi_acd_table), NULL, 0);
>>>          if (ret) {
>>>                  DRM_DEV_ERROR(gmu->dev, "Unable to send ACD table
>>> (%d)\n", ret);
>>>                  return ret;
>>> ================><================================
>>>
>>> with the appropriate qcom,opp-acd-level in DT taken from downstream,
>>> I get:
>>> [    6.946184] platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg.constprop.0
>>> [msm]] *ERROR* Message (null) id 4 timed out waiting for response
>>> [    6.958697] platform 3d6a000.gmu: [drm:a6xx_hfi_start [msm]] *ERROR*
>>> Unable to send ACD table (-110)
>>>
>>> is there something missing ?
>>>
>>> Neil
>>>
>>>>
>>>> -Akhil.
>>>>
>>>>>
>>>>>> +    if (ret) {
>>>>>> +        DRM_DEV_ERROR(gmu->dev, "Unable to ACD table (%d)\n", ret);
>>>>>> +        return ret;
>>>>>> +    }
>>>>>> +
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +
>>>>>>     static int a6xx_hfi_send_test(struct a6xx_gmu *gmu)
>>>>>>     {
>>>>>>         struct a6xx_hfi_msg_test msg = { 0 };
>>>>>> @@ -756,6 +788,10 @@ int a6xx_hfi_start(struct a6xx_gmu *gmu, int
>>>>>> boot_state)
>>>>>>         if (ret)
>>>>>>             return ret;
>>>>>>     +    ret = a6xx_hfi_enable_acd(gmu);
>>>>>> +    if (ret)
>>>>>> +        return ret;
>>>>>> +
>>>>>>         ret = a6xx_hfi_send_core_fw_start(gmu);
>>>>>>         if (ret)
>>>>>>             return ret;
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/
>>>>>> msm/adreno/a6xx_hfi.h
>>>>>> index 528110169398..51864c8ad0e6 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
>>>>>> @@ -151,12 +151,33 @@ struct a6xx_hfi_msg_test {
>>>>>>         u32 header;
>>>>>>     };
>>>>>>     +#define HFI_H2F_MSG_ACD 7
>>>>>> +#define MAX_ACD_STRIDE 2
>>>>>> +
>>>>>> +struct a6xx_hfi_acd_table {
>>>>>> +    u32 header;
>>>>>> +    u32 version;
>>>>>> +    u32 enable_by_level;
>>>>>> +    u32 stride;
>>>>>> +    u32 num_levels;
>>>>>> +    u32 data[16 * MAX_ACD_STRIDE];
>>>>>> +};
>>>>>> +
>>>>>>     #define HFI_H2F_MSG_START 10
>>>>>>       struct a6xx_hfi_msg_start {
>>>>>>         u32 header;
>>>>>>     };
>>>>>>     +#define HFI_H2F_FEATURE_CTRL 11
>>>>>> +
>>>>>> +struct a6xx_hfi_msg_feature_ctrl {
>>>>>> +    u32 header;
>>>>>> +    u32 feature;
>>>>>> +    u32 enable;
>>>>>> +    u32 data;
>>>>>> +};
>>>>>> +
>>>>>>     #define HFI_H2F_MSG_CORE_FW_START 14
>>>>>>       struct a6xx_hfi_msg_core_fw_start {
>>>>>>
>>>>>
>>>>> Thanks,
>>>>> Neil
>>>>
>>>
>>
> 

