Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC12C9F0D12
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 14:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DDF10E012;
	Fri, 13 Dec 2024 13:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="c1jQTLS0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A2C10E012;
 Fri, 13 Dec 2024 13:13:01 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD8rlkB022838;
 Fri, 13 Dec 2024 13:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Xl93Qz2eNY1D1QSVG/Nk69lF2GvJgYAIh32kdEjaYWo=; b=c1jQTLS09rxxxRgm
 EcF3C+YkAyrra9gHbBLu2xvjoD5YHeZh+9hLTguKlSrOxL6nmeqCON2eYD/j9N/+
 546y+BQdTxP9DlHd9GMfOS0Dy1RRgcnxherL6l1bSHOcKK0y4DtO0Kt2mwysEoO/
 3r+mk3Hty7QBwGuElT6NK2p8dEvSFTWNxRDp7Q66405iqGd8cXWT2/N8Mb6mR55Z
 vimaI0q4a30W4H/HDelLFpAL9TtQN50WHXVJbgQXak3F7C0MgfYhQkxfbaA86FWX
 BhkbtsFXGdhBHgog4eD7esT3nvWSYLXLqtCTg5HBOtqPgz5XXvvVUBEFyo+Dfsou
 l6smSA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43g4wnaj4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 13:12:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDDCtLS029686
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 13:12:55 GMT
Received: from [10.204.101.130] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 05:12:49 -0800
Message-ID: <80bed70e-7802-4555-a15e-e06fe46214c6@quicinc.com>
Date: Fri, 13 Dec 2024 18:42:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] drm/msm: adreno: find bandwidth index of OPP and
 set it along freq index
To: <neil.armstrong@linaro.org>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Andersson
 <andersson@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
 <20241211-topic-sm8x50-gpu-bw-vote-v5-4-6112f9f785ec@linaro.org>
 <ddf91ba2-cab2-4653-b842-65a8e82b5160@oss.qualcomm.com>
 <2f1c6deb-29f8-4144-b086-743fb0f8495c@linaro.org>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <2f1c6deb-29f8-4144-b086-743fb0f8495c@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: raObrXIn0QEBLmTEQfp2DpvAMswJDngQ
X-Proofpoint-GUID: raObrXIn0QEBLmTEQfp2DpvAMswJDngQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 mlxscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412130093
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

On 12/13/2024 3:07 AM, Neil Armstrong wrote:
> On 12/12/2024 21:21, Konrad Dybcio wrote:
>> On 11.12.2024 9:29 AM, Neil Armstrong wrote:
>>> The Adreno GPU Management Unit (GMU) can also scale the DDR Bandwidth
>>> along the Frequency and Power Domain level, until now we left the OPP
>>> core scale the OPP bandwidth via the interconnect path.
>>>
>>> In order to enable bandwidth voting via the GPU Management
>>> Unit (GMU), when an opp is set by devfreq we also look for
>>> the corresponding bandwidth index in the previously generated
>>> bw_table and pass this value along the frequency index to the GMU.
>>>
>>> The GMU also takes another vote called AB which is a 16bit quantized
>>> value of the floor bandwidth against the maximum supported bandwidth.
>>>
>>> The AB is calculated with a default 25% of the bandwidth like the
>>> downstream implementation too inform the GMU firmware the minimal
>>> quantity of bandwidth we require for this OPP.
>>>
>>> Since we now vote for all resources via the GMU, setting the OPP
>>> is no more needed, so we can completely skip calling
>>> dev_pm_opp_set_opp() in this situation.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 39 ++++++++++++++++++++++++
>>> +++++++++--
>>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  2 +-
>>>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c |  6 +++---
>>>   drivers/gpu/drm/msm/adreno/a6xx_hfi.h |  5 +++++
>>>   4 files changed, 46 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/
>>> msm/adreno/a6xx_gmu.c
>>> index
>>> 36696d372a42a27b26a018b19e73bc6d8a4a5235..46ae0ec7a16a41d55755ce04fb32404cdba087be 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> @@ -110,9 +110,11 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu,
>>> struct dev_pm_opp *opp,
>>>                  bool suspended)
>>>   {
>>>       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>> +    const struct a6xx_info *info = adreno_gpu->info->a6xx;
>>>       struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>>       struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>>>       u32 perf_index;
>>> +    u32 bw_index = 0;
>>>       unsigned long gpu_freq;
>>>       int ret = 0;
>>>   @@ -125,6 +127,37 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu,
>>> struct dev_pm_opp *opp,
>>>           if (gpu_freq == gmu->gpu_freqs[perf_index])
>>>               break;
>>>   +    /* If enabled, find the corresponding DDR bandwidth index */
>>> +    if (info->bcms && gmu->nr_gpu_bws > 1) {
>>
>> if (gmu->nr_gpu_bws)
> 
> gmu->nr_gpu_bws == 1 means there's not BW in the OPPs (index 0 is the
> "off" state)
> 
>>
>>> +        unsigned int bw = dev_pm_opp_get_bw(opp, true, 0);
>>> +
>>> +        for (bw_index = 0; bw_index < gmu->nr_gpu_bws - 1; bw_index+
>>> +) {
>>> +            if (bw == gmu->gpu_bw_table[bw_index])
>>> +                break;
>>> +        }
>>> +
>>> +        /* Vote AB as a fraction of the max bandwidth */
>>> +        if (bw) {
>>
>> This seems to only be introduced with certain a7xx too.. you should
>> ping the GMU with HFI_VALUE_GMU_AB_VOTE to check if it's supported
> 
> Good point

No no. Doing this will trigger some assert in pre-A750 gmu firmwares. We
learned it the hard way. No improvisation please. :)

-Akhil.

> 
>>
>>> +            u64 tmp;
>>> +
>>> +            /* For now, vote for 25% of the bandwidth */
>>> +            tmp = bw * 25;
>>> +            do_div(tmp, 100);
>>> +
>>> +            /*
>>> +             * The AB vote consists of a 16 bit wide quantized level
>>> +             * against the maximum supported bandwidth.
>>> +             * Quantization can be calculated as below:
>>> +             * vote = (bandwidth * 2^16) / max bandwidth
>>> +             */
>>> +            tmp *= MAX_AB_VOTE;
>>> +            do_div(tmp, gmu->gpu_bw_table[gmu->nr_gpu_bws - 1]);
>>> +
>>> +            bw_index |= AB_VOTE(clamp(tmp, 1, MAX_AB_VOTE));
>>> +            bw_index |= AB_VOTE_ENABLE;
>>> +        }
>>> +    }
>>
>> BTW, did you dump the values we send to the GMU here and in the RPMh
>> builder part & validate against downstream?
> 
> It matches how downstream builds the Ab vote yes
> 
>>
>> Konrad
> 

