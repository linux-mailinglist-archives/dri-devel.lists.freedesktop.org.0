Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D90F2A9D2D2
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 22:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A40A10E9C9;
	Fri, 25 Apr 2025 20:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="GsCTsUfB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408CB10E9AE;
 Fri, 25 Apr 2025 20:18:41 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGKFaZ011555;
 Fri, 25 Apr 2025 20:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Jb9+4U5bJYoG9U+NjqLUlxxwi6BkpsXYG5eQggFwoa4=; b=GsCTsUfBZEcbbopO
 kPWMX0ng5SPQsNpv9qEu3KB5oB36pYdrzELRnfjyXvo2I2Ac2nEKUptMRSqylO1V
 Zxk11vXTj/pylvdd8ZzKZqzSKBcI/xSBe/UOw3+/MakgxpLV/8DPREw7qcPWvm2e
 nc8j2iOeX+n2xyUYr5H4BqUHvmWuc8pPgxaRk7uCZzm19clZRsfLIRp+/hqcN6Qu
 PZtgcou49JPtLCxZUCajRXqEAVGvrf9JDsIMUcogMKJG2+Q7i7PihL3LXbbqUtoF
 WuSJLM82LVUBniOSn1VFxfb0pAHOG6/jPWvbRnojn3IWVs1f1q9DZkbMhNaN42dZ
 fht89g==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0jc8w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Apr 2025 20:18:37 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53PKIaXq031318
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Apr 2025 20:18:36 GMT
Received: from [10.134.71.99] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Apr
 2025 13:18:36 -0700
Message-ID: <7f1df90b-7b6d-4f39-838a-60adc3ceb043@quicinc.com>
Date: Fri, 25 Apr 2025 13:18:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/msm/dpu: enable SmartDMA on SC8280XP
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>
CC: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 "Sean Paul" <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, "David Airlie" <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Konrad Dybcio <konradybcio@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250308-dpu-rework-vig-masks-v1-0-f1b5d101ae0b@linaro.org>
 <20250308-dpu-rework-vig-masks-v1-3-f1b5d101ae0b@linaro.org>
 <aae55674-1ef1-4cf8-b1ef-e2b67c086b77@quicinc.com>
 <6kgxzonjqfmup7xvpddlk76w7zcnpf6c6x7isqy6plxk5los5z@hznswxtjoz4r>
 <acdc6e46-4c58-4756-a7c9-e4e30a0ae94d@quicinc.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <acdc6e46-4c58-4756-a7c9-e4e30a0ae94d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: TPXeEXZ3d6xebz-WCjum4qRxZvhg24hv
X-Proofpoint-ORIG-GUID: TPXeEXZ3d6xebz-WCjum4qRxZvhg24hv
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680bee1d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=RT-ccWwgCe_0oFCcBdMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0NSBTYWx0ZWRfX5CNV8tATgQsH
 7o4Sy/pcppwHRRdliKS4OI2gtG+XQZmVW2TpbZd/HMsCNBVz1cK8yetDVmQFYM+EDopV+0E6pKR
 O8pnk+t2CCc52/LNzklNNKt2M24WySRkTSvZB9Y3Mr9CLjm3x2orc1VuIgxEH0Fp2KgWFzeJ6uy
 Hxh/C4mu/hIsCExWijEtQCaUvlhtbHmULqxjQZy5GFJdBqNMU/ZwHf77HiPz25g3arocP4ommpZ
 MspRN0EiEDvCCYtTTAirsoGAX/VFep10dGuSTjJ3kz+gOW9nVR1d1c9HdOQRs+a2nvOXOkPXH7o
 QFBW+YsP+G8xDwMPHzk0PMk64ltQ7qpTotSlut+Eid+hCPOxNALFKxTk/U/pBVH41dudwP9GnoR
 mMtSrXBwoCBCGQQb8znVFYKedTeWMBMExm7agL/n2CeHBEV4q5CRUaQVhw0qxYL9G6/Sa4h7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250145
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



On 4/25/2025 12:30 PM, Abhinav Kumar wrote:
> 
> 
> On 4/25/2025 12:00 PM, Dmitry Baryshkov wrote:
>> On Fri, Apr 25, 2025 at 11:34:18AM -0700, Jessica Zhang wrote:
>>>
>>>
>>> On 3/7/2025 9:38 PM, Dmitry Baryshkov wrote:
>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>
>>>> In order to support more versatile configuration of the display 
>>>> pipes on
>>>> SC8280XP, enable SmartDMA for this platform.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> Hi Dmitry,
>>>
>>> Seems like Abhinav's signed-off-by is missing for the patches that 
>>> list him
>>> as author.
>>>
>>
>> Good point. I don't remember, why these patches mark him as an author,
>> but lack SoB. Googling doesn't point out any previous patches. I think
>> the easiest way to fix the issue would be for Abhinav to respond with
>> the SoB. Another option would be for me to reset the author.
>>
> 
> I dont recall myself. You can go ahead and drop me as the author.

Sounds good. With the authorship fixed,

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> 
>>> Thanks,
>>>
>>> Jessica Zhang
>>>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 16 +++ 
>>>> +++++--------
>>>>    1 file changed, 8 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/ 
>>>> dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/ 
>>>> dpu_8_0_sc8280xp.h
>>>> index 
>>>> fcee1c3665f88a9defca4fec38dd76d56c97297e..923afc202f5195fa15bcfc1e141fc44134c965e4 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>>>> @@ -74,7 +74,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
>>>>        {
>>>>            .name = "sspp_0", .id = SSPP_VIG0,
>>>>            .base = 0x4000, .len = 0x2ac,
>>>> -        .features = VIG_SDM845_MASK,
>>>> +        .features = VIG_SDM845_MASK_SDMA,
>>>>            .sblk = &dpu_vig_sblk_qseed3_3_0,
>>>>            .xin_id = 0,
>>>>            .type = SSPP_TYPE_VIG,
>>>> @@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
>>>>        }, {
>>>>            .name = "sspp_1", .id = SSPP_VIG1,
>>>>            .base = 0x6000, .len = 0x2ac,
>>>> -        .features = VIG_SDM845_MASK,
>>>> +        .features = VIG_SDM845_MASK_SDMA,
>>>>            .sblk = &dpu_vig_sblk_qseed3_3_0,
>>>>            .xin_id = 4,
>>>>            .type = SSPP_TYPE_VIG,
>>>> @@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
>>>>        }, {
>>>>            .name = "sspp_2", .id = SSPP_VIG2,
>>>>            .base = 0x8000, .len = 0x2ac,
>>>> -        .features = VIG_SDM845_MASK,
>>>> +        .features = VIG_SDM845_MASK_SDMA,
>>>>            .sblk = &dpu_vig_sblk_qseed3_3_0,
>>>>            .xin_id = 8,
>>>>            .type = SSPP_TYPE_VIG,
>>>> @@ -98,7 +98,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
>>>>        }, {
>>>>            .name = "sspp_3", .id = SSPP_VIG3,
>>>>            .base = 0xa000, .len = 0x2ac,
>>>> -        .features = VIG_SDM845_MASK,
>>>> +        .features = VIG_SDM845_MASK_SDMA,
>>>>            .sblk = &dpu_vig_sblk_qseed3_3_0,
>>>>            .xin_id = 12,
>>>>            .type = SSPP_TYPE_VIG,
>>>> @@ -106,7 +106,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] 
>>>> = {
>>>>        }, {
>>>>            .name = "sspp_8", .id = SSPP_DMA0,
>>>>            .base = 0x24000, .len = 0x2ac,
>>>> -        .features = DMA_SDM845_MASK,
>>>> +        .features = DMA_SDM845_MASK_SDMA,
>>>>            .sblk = &dpu_dma_sblk,
>>>>            .xin_id = 1,
>>>>            .type = SSPP_TYPE_DMA,
>>>> @@ -114,7 +114,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] 
>>>> = {
>>>>        }, {
>>>>            .name = "sspp_9", .id = SSPP_DMA1,
>>>>            .base = 0x26000, .len = 0x2ac,
>>>> -        .features = DMA_SDM845_MASK,
>>>> +        .features = DMA_SDM845_MASK_SDMA,
>>>>            .sblk = &dpu_dma_sblk,
>>>>            .xin_id = 5,
>>>>            .type = SSPP_TYPE_DMA,
>>>> @@ -122,7 +122,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] 
>>>> = {
>>>>        }, {
>>>>            .name = "sspp_10", .id = SSPP_DMA2,
>>>>            .base = 0x28000, .len = 0x2ac,
>>>> -        .features = DMA_CURSOR_SDM845_MASK,
>>>> +        .features = DMA_CURSOR_SDM845_MASK_SDMA,
>>>>            .sblk = &dpu_dma_sblk,
>>>>            .xin_id = 9,
>>>>            .type = SSPP_TYPE_DMA,
>>>> @@ -130,7 +130,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] 
>>>> = {
>>>>        }, {
>>>>            .name = "sspp_11", .id = SSPP_DMA3,
>>>>            .base = 0x2a000, .len = 0x2ac,
>>>> -        .features = DMA_CURSOR_SDM845_MASK,
>>>> +        .features = DMA_CURSOR_SDM845_MASK_SDMA,
>>>>            .sblk = &dpu_dma_sblk,
>>>>            .xin_id = 13,
>>>>            .type = SSPP_TYPE_DMA,
>>>>
>>>
>>
> 

