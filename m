Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3079DF376
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 23:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B3D10E2EE;
	Sat, 30 Nov 2024 22:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="j/tzu2gi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA5F10E2EE;
 Sat, 30 Nov 2024 22:03:10 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AULut4s025505;
 Sat, 30 Nov 2024 22:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 z1Y+ilYADIywlTUzrStIh9/518CnTc058mPQ5OBkpUc=; b=j/tzu2gimLe6PkwQ
 Vqwa9LRNFcvwzMngsOpUjmVBNVevRpCwxx+GI6Ok5A/dwOaOUK20mfP56V0Xj+tf
 QkeQzLrNHpVxRv2oZGdbrP/87Ca/fwdkk26EKLO16Mm/s2HDZNiQT9rlsffVMVHE
 4D/ec5CEoa/sXLR/6S2AbiuXGE/j62JHf7hI8Gh8MS5cNPvTyBDIoKEsiCOC3ALr
 0E/kSoEd6ZTldzKBFWsAiwiFNxXYpZLTOB3mHeT/7Ej+Chg/QK/aZTZkjuDy+OqD
 MFxHDPKG45mqFZ/QhhRVoo8Mt5z4a7fqOd1Qy0eVglKKTab1lzTshjisCFombMFx
 j+gqUQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437tx1sb1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 30 Nov 2024 22:03:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AUM343l031601
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 30 Nov 2024 22:03:04 GMT
Received: from [10.216.58.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 30 Nov
 2024 14:02:56 -0800
Message-ID: <08f1c928-aed5-4012-9281-89ee27170c90@quicinc.com>
Date: Sun, 1 Dec 2024 03:32:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] drm/msm: adreno: find bandwidth index of OPP and
 set it along freq index
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Andersson
 <andersson@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
References: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
 <20241128-topic-sm8x50-gpu-bw-vote-v3-4-81d60c10fb73@linaro.org>
 <e3bb3f66-9cad-40a4-ab55-f1d5a8e34d4d@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <e3bb3f66-9cad-40a4-ab55-f1d5a8e34d4d@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: mbqaiUbMm7AUX8a4UPyw-wfwn9xkNYXo
X-Proofpoint-GUID: mbqaiUbMm7AUX8a4UPyw-wfwn9xkNYXo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411300188
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

On 11/29/2024 9:03 PM, Konrad Dybcio wrote:
> On 28.11.2024 11:25 AM, Neil Armstrong wrote:
>> The Adreno GPU Management Unit (GMU) can also scale the DDR Bandwidth
>> along the Frequency and Power Domain level, until now we left the OPP
>> core scale the OPP bandwidth via the interconnect path.
>>
>> In order to enable bandwidth voting via the GPU Management
>> Unit (GMU), when an opp is set by devfreq we also look for
>> the corresponding bandwidth index in the previously generated
>> bw_table and pass this value along the frequency index to the GMU.
>>
>> The AB pre-calculated vote is appended to the bandwidth index
>> to inform the GMU firmware the quantity of bandwidth we need.
>>
>> Since we now vote for all resources via the GMU, setting the OPP
>> is no more needed, so we can completely skip calling
>> dev_pm_opp_set_opp() in this situation.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 23 +++++++++++++++++++++--
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  2 +-
>>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c |  6 +++---
>>  3 files changed, 25 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index ee2010a01186721dd377f1655fcf05ddaff77131..c09442ecc861c4e56c81e7e775b9e57baf7d2e51 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -110,9 +110,11 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
>>  		       bool suspended)
>>  {
>>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	const struct a6xx_info *info = adreno_gpu->info->a6xx;
>>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>  	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>>  	u32 perf_index;
>> +	u32 bw_index = 0;
>>  	unsigned long gpu_freq;
>>  	int ret = 0;
>>  
>> @@ -125,6 +127,21 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
>>  		if (gpu_freq == gmu->gpu_freqs[perf_index])
>>  			break;
>>  
>> +	/* If enabled, find the corresponding DDR bandwidth index */
>> +	if (info->bcms && gmu->nr_gpu_bws > 1) {
>> +		unsigned int bw = dev_pm_opp_get_bw(opp, true, 0);
>> +
>> +		for (bw_index = 0; bw_index < gmu->nr_gpu_bws - 1; bw_index++) {
>> +			if (bw == gmu->gpu_bw_table[bw_index])
>> +				break;
>> +		}
>> +
>> +		if (bw_index) {
>> +			bw_index |= AB_VOTE(gmu->gpu_ab_votes[bw_index]);
>> +			bw_index |= AB_VOTE_ENABLE;
>> +		}
>> +	}
> 
> If we couple frequency levels with bw levels (i.e. duplicate the highest
> bandwidth a couple times), we can drop all this search logic..

Will that alter hfi table? I prefer to avoid altering GMU data. We
should not make any assumption on how fw would use the data. And we
don't want to hit any surprises on power management related things.

Lets use the GMU interfaces exactly how it is used in downstream. No
assumptions and improvisation please!

-Akhil

> 
>> +
>>  	gmu->current_perf_index = perf_index;
>>  	gmu->freq = gmu->gpu_freqs[perf_index];
>>  
>> @@ -140,8 +157,10 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
>>  		return;
>>  
>>  	if (!gmu->legacy) {
>> -		a6xx_hfi_set_freq(gmu, perf_index);
>> -		dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
>> +		a6xx_hfi_set_freq(gmu, perf_index, bw_index);
>> +		/* With Bandwidth voting, we now vote for all resources, so skip OPP set */
>> +		if (!bw_index)
>> +			dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
> 
> ..and then it would come down to..
> 
> if (!info->bcms)
> 
> Konrad

