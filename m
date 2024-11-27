Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFADF9DAAF3
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 16:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655F810EB46;
	Wed, 27 Nov 2024 15:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="hfyWr0/5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB19510EB45;
 Wed, 27 Nov 2024 15:46:38 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ARDUAOR026159;
 Wed, 27 Nov 2024 15:46:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 p/vQoUeZzgrhTjygMpM4nmWdMpWpOU3K9gUmPYMTYZg=; b=hfyWr0/5GjUFEnoi
 U5dnFCEer2YHuNzpihv6VMryHspUIyegA8TdZS7EbQaRf2wO1bGARKdolNJE4z3a
 pc+N5fUJhcP/tty5TLBWTFLAPVKz7P568Q2Z/fJ6NdYRzrYbfUiHRL2VrCfZU2yM
 cdfEa6iDmou6cullIAmjtBz4sB7Xzpwkm96PQilPvwvXyOfA2NLRDEmlj3a1Pmge
 YcfCldImoc0UZgDKsfI82pAFI8m7rQbV+Fw2xE8LwolCoyRjD1LSA13hPSfmQWD3
 dO9pLTN2k+e3SvJvBlINGSp/SdOcrdJZfnh1p/pRVibhdmLJwa5tnHM+EbqyEHgo
 uewnXA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4364by0bvp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2024 15:46:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ARFkWrO003535
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2024 15:46:32 GMT
Received: from [10.206.104.82] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 27 Nov
 2024 07:46:24 -0800
Message-ID: <2d3a77da-cf73-4888-bc4d-68482181c908@quicinc.com>
Date: Wed, 27 Nov 2024 21:16:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] drm/msm: adreno: request for maximum bus
 bandwidth usage
To: <neil.armstrong@linaro.org>
CC: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, "Stephen
 Boyd" <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
 <20241119-topic-sm8x50-gpu-bw-vote-v2-8-4deb87be2498@linaro.org>
 <20241123225954.lv3k2fxk7rxyh67z@hu-akhilpo-hyd.qualcomm.com>
 <1965cd01-7b31-4f16-82b2-27fd56fcb77e@linaro.org>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <1965cd01-7b31-4f16-82b2-27fd56fcb77e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: uvpXSlxnnXJ7kJboy11Ilq3B7kg5RXmo
X-Proofpoint-ORIG-GUID: uvpXSlxnnXJ7kJboy11Ilq3B7kg5RXmo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411270125
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

On 11/25/2024 1:44 PM, Neil Armstrong wrote:
> On 23/11/2024 23:59, Akhil P Oommen wrote:
>> On Tue, Nov 19, 2024 at 06:56:43PM +0100, Neil Armstrong wrote:
>>> When requesting a DDR bandwidth level along a GPU frequency
>>> level via the GMU, we can also specify the bus bandwidth usage in a
>>> 16bit
>>> quantitized value.
>>>
>>> For now simply request the maximum bus usage.
>>
>> Why? You don't care about power efficiency?
>> Lets drop this patch. We don't care about AB vote yet.
> 
> I care about functionality, without this AB vote the spillall use
> case that fails on SM8650 HDK fails on the SM8650 QRD.

This should have been documented as a comment so that someone doesn't
remove it in future.

> 
> AB is a quantitized value of the BW voted, so yes I expect we can have
> 100% of the BW voted, but since we scale the BW it's perfectly fine.

Ah! no. MAX AB vote here is equal to the Max IB vote value in the hfi
table. This is why I was asking about including all BW levels from the
DT in the hfi table in the other patch.

So you are always voting for Max DDR Freq which is probably helping (or
masking?) the spill all issue. We can just add a quirk to vote for MAX
IB probably.

-Akhil

> 
> Neil
> 
>>
>> -Akhil
>>
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 11 +++++++++++
>>>   drivers/gpu/drm/msm/adreno/a6xx_hfi.h |  5 +++++
>>>   2 files changed, 16 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/
>>> msm/adreno/a6xx_gmu.c
>>> index
>>> dc2d0035544e7848e5c4ea27f1ea9a191f9c4991..36c0f67fd8e109aabf09a0804bacbed3593c39d7 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> @@ -134,6 +134,17 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu,
>>> struct dev_pm_opp *opp,
>>>               if (bw == gmu->gpu_bw_table[bw_index])
>>>                   break;
>>>           }
>>> +
>>> +        if (bw_index) {
>>> +            /*
>>> +             * Append AB vote to the maximum bus usage.
>>> +             * AB represents a quantitized 16bit value of the
>>> +             * max ddr bandwidth we could use, let's simply
>>> +             * request the maximum for now.
>>> +             */
>>> +            bw_index |= AB_VOTE(MAX_AB_VOTE);
>>> +            bw_index |= AB_VOTE_ENABLE;
>>> +        }
>>>       }
>>>         gmu->current_perf_index = perf_index;
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/
>>> msm/adreno/a6xx_hfi.h
>>> index
>>> 528110169398f69f16443a29a1594d19c36fb595..52ba4a07d7b9a709289acd244a751ace9bdaab5d 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
>>> @@ -173,6 +173,11 @@ struct a6xx_hfi_gx_bw_perf_vote_cmd {
>>>       u32 bw;
>>>   };
>>>   +#define AB_VOTE_MASK        GENMASK(31, 16)
>>> +#define MAX_AB_VOTE        (FIELD_MAX(AB_VOTE_MASK) - 1)
>>> +#define AB_VOTE(vote)        FIELD_PREP(AB_VOTE_MASK, (vote))
>>> +#define AB_VOTE_ENABLE        BIT(8)
>>> +
>>>   #define HFI_H2F_MSG_PREPARE_SLUMBER 33
>>>     struct a6xx_hfi_prep_slumber_cmd {
>>>
>>> -- 
>>> 2.34.1
>>>
> 

