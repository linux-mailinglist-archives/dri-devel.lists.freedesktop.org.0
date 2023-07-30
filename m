Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 704FF768647
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 17:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BC610E0C9;
	Sun, 30 Jul 2023 15:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E263110E03A;
 Sun, 30 Jul 2023 15:45:00 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36UFabEa016665; Sun, 30 Jul 2023 15:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=wn+ayn+oVLBqwfJG0g2RCDMaK3qtCu6zzR1BUUIPuOo=;
 b=oV8CieSwrQBvAO5j4VaySDLumvBTvhiRAU713GsR/f+SjvPjgtK3PvCkjF/CV/kt/1sb
 /wCOxW50fxMvWxYc90Wy3d+y8SVjAKv/ke6TIvPE1VpnHWukC5NijjzSe/Bn7HeFfa6b
 GkVSEdb0R9b3/TtCpmy2ba5bYpG/cY6vaWbJjrDTpdisBs2mz4CgMI996ISaAx+cvmb2
 JksWKv4aR+LAcD+En0iblZwt7Xi4q0NBMW4ZAUoRjd7Jnga0ZrB5CK7dIVA51iUCOCT/
 rCh9N8mzyFoC/kd1c3BZLK9NQWLeTv6sBtkNM/PrT1oU4A30QGvglMVyYGldDzmarzsC 3Q== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s4uxs9tsa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 30 Jul 2023 15:44:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36UFibu4019195
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 30 Jul 2023 15:44:37 GMT
Received: from [10.110.77.76] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Sun, 30 Jul
 2023 08:44:36 -0700
Message-ID: <e3ab1dc0-2ea6-90f3-dd37-36ce4fec313c@quicinc.com>
Date: Sun, 30 Jul 2023 08:44:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/4] drm/msm/dpu: deduplicate some (most) of SSPP
 sub-blocks
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20230714015503.3198971-1-dmitry.baryshkov@linaro.org>
 <20230714015503.3198971-4-dmitry.baryshkov@linaro.org>
 <52a2e139-f201-09b1-8c77-b394f323ac43@quicinc.com>
 <9b4870a9-a9db-ae3d-5f77-e395fc851d6f@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <9b4870a9-a9db-ae3d-5f77-e395fc851d6f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ZX0XlkbyP3cf4-oOeOoLVA0E3uLgVk3U
X-Proofpoint-GUID: ZX0XlkbyP3cf4-oOeOoLVA0E3uLgVk3U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 impostorscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307300146
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/29/2023 5:19 PM, Dmitry Baryshkov wrote:
> On 30/07/2023 03:00, Abhinav Kumar wrote:
>>
>>
>> On 7/13/2023 6:55 PM, Dmitry Baryshkov wrote:
>>> As we have dropped the variadic parts of SSPP sub-blocks declarations,
>>> deduplicate them now, reducing memory cruft.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>
>> Perhaps I am missing something here, so wanted to clarify.
>>
>> The first change drops the id field.
>>
>> the qseed_ver was stored in the id. So that means the qseed_ver 
>> parameter of _VIG_SBLK is also unused because the dpu_caps of each 
>> chipset already have qseed_type parameter to denote which qseed type 
>> the chipset supports.
>>
>> So you could technically drop even dpu_vig_sblk_qseed3lite / 
>> dpu_vig_sblk_qseed3 / dpu_vig_sblk_qseed4 all into the same and 
>> de-duplicate even more?
> 
> Yes and no. There is/was a plan to finally push QSEED hw version to sblk 
> and make that actually work. So, this part is left as is for now.
> 

But now after dropping id in the first patch, the DPU_SSPP_SCALER_QSEED* 
parameter of the macro is unused now. That doesnt look right.

So either we should do that now or not touch id either.

>>
>>>   .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 16 +++---
>>>   .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 16 +++---
>>>   .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 16 +++---
>>>   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 16 +++---
>>>   .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |  6 +-
>>>   .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 16 +++---
>>>   .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  8 +--
>>>   .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  4 +-
>>>   .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  8 +--
>>>   .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  4 +-
>>>   .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  4 +-
>>>   .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 16 +++---
>>>   .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  8 +--
>>>   .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 16 +++---
>>>   .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 16 +++---
>>>   .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 20 +++----
>>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 56 +++----------------
>>>   17 files changed, 102 insertions(+), 144 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>> index 7d87dc2d7b1b..7aa3738d2edd 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>> @@ -75,7 +75,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
>>>           .name = "sspp_0", .id = SSPP_VIG0,
>>>           .base = 0x4000, .len = 0x1ac,
>>>           .features = VIG_MSM8998_MASK,
>>> -        .sblk = &msm8998_vig_sblk_0,
>>> +        .sblk = &dpu_vig_sblk_qseed3,
>>>           .xin_id = 0,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG0,
>>> @@ -83,7 +83,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
>>>           .name = "sspp_1", .id = SSPP_VIG1,
>>>           .base = 0x6000, .len = 0x1ac,
>>>           .features = VIG_MSM8998_MASK,
>>> -        .sblk = &msm8998_vig_sblk_1,
>>> +        .sblk = &dpu_vig_sblk_qseed3,
>>>           .xin_id = 4,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG1,
>>> @@ -91,7 +91,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
>>>           .name = "sspp_2", .id = SSPP_VIG2,
>>>           .base = 0x8000, .len = 0x1ac,
>>>           .features = VIG_MSM8998_MASK,
>>> -        .sblk = &msm8998_vig_sblk_2,
>>> +        .sblk = &dpu_vig_sblk_qseed3,
>>>           .xin_id = 8,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG2,
>>> @@ -99,7 +99,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
>>>           .name = "sspp_3", .id = SSPP_VIG3,
>>>           .base = 0xa000, .len = 0x1ac,
>>>           .features = VIG_MSM8998_MASK,
>>> -        .sblk = &msm8998_vig_sblk_3,
>>> +        .sblk = &dpu_vig_sblk_qseed3,
>>>           .xin_id = 12,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG3,
>>> @@ -107,7 +107,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
>>>           .name = "sspp_8", .id = SSPP_DMA0,
>>>           .base = 0x24000, .len = 0x1ac,
>>>           .features = DMA_MSM8998_MASK,
>>> -        .sblk = &sdm845_dma_sblk_0,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 1,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA0,
>>> @@ -115,7 +115,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
>>>           .name = "sspp_9", .id = SSPP_DMA1,
>>>           .base = 0x26000, .len = 0x1ac,
>>>           .features = DMA_MSM8998_MASK,
>>> -        .sblk = &sdm845_dma_sblk_1,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 5,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA1,
>>> @@ -123,7 +123,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
>>>           .name = "sspp_10", .id = SSPP_DMA2,
>>>           .base = 0x28000, .len = 0x1ac,
>>>           .features = DMA_CURSOR_MSM8998_MASK,
>>> -        .sblk = &sdm845_dma_sblk_2,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 9,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA2,
>>> @@ -131,7 +131,7 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
>>>           .name = "sspp_11", .id = SSPP_DMA3,
>>>           .base = 0x2a000, .len = 0x1ac,
>>>           .features = DMA_CURSOR_MSM8998_MASK,
>>> -        .sblk = &sdm845_dma_sblk_3,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 13,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA3,
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>>> index 87459cf40895..02d33ea7e25f 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>>> @@ -73,7 +73,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
>>>           .name = "sspp_0", .id = SSPP_VIG0,
>>>           .base = 0x4000, .len = 0x1c8,
>>>           .features = VIG_SDM845_MASK_SDMA,
>>> -        .sblk = &sdm845_vig_sblk_0,
>>> +        .sblk = &dpu_vig_sblk_qseed3,
>>>           .xin_id = 0,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG0,
>>> @@ -81,7 +81,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
>>>           .name = "sspp_1", .id = SSPP_VIG1,
>>>           .base = 0x6000, .len = 0x1c8,
>>>           .features = VIG_SDM845_MASK_SDMA,
>>> -        .sblk = &sdm845_vig_sblk_1,
>>> +        .sblk = &dpu_vig_sblk_qseed3,
>>>           .xin_id = 4,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG1,
>>> @@ -89,7 +89,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
>>>           .name = "sspp_2", .id = SSPP_VIG2,
>>>           .base = 0x8000, .len = 0x1c8,
>>>           .features = VIG_SDM845_MASK_SDMA,
>>> -        .sblk = &sdm845_vig_sblk_2,
>>> +        .sblk = &dpu_vig_sblk_qseed3,
>>>           .xin_id = 8,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG2,
>>> @@ -97,7 +97,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
>>>           .name = "sspp_3", .id = SSPP_VIG3,
>>>           .base = 0xa000, .len = 0x1c8,
>>>           .features = VIG_SDM845_MASK_SDMA,
>>> -        .sblk = &sdm845_vig_sblk_3,
>>> +        .sblk = &dpu_vig_sblk_qseed3,
>>>           .xin_id = 12,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG3,
>>> @@ -105,7 +105,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
>>>           .name = "sspp_8", .id = SSPP_DMA0,
>>>           .base = 0x24000, .len = 0x1c8,
>>>           .features = DMA_SDM845_MASK_SDMA,
>>> -        .sblk = &sdm845_dma_sblk_0,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 1,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA0,
>>> @@ -113,7 +113,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
>>>           .name = "sspp_9", .id = SSPP_DMA1,
>>>           .base = 0x26000, .len = 0x1c8,
>>>           .features = DMA_SDM845_MASK_SDMA,
>>> -        .sblk = &sdm845_dma_sblk_1,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 5,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA1,
>>> @@ -121,7 +121,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
>>>           .name = "sspp_10", .id = SSPP_DMA2,
>>>           .base = 0x28000, .len = 0x1c8,
>>>           .features = DMA_CURSOR_SDM845_MASK_SDMA,
>>> -        .sblk = &sdm845_dma_sblk_2,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 9,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA2,
>>> @@ -129,7 +129,7 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
>>>           .name = "sspp_11", .id = SSPP_DMA3,
>>>           .base = 0x2a000, .len = 0x1c8,
>>>           .features = DMA_CURSOR_SDM845_MASK_SDMA,
>>> -        .sblk = &sdm845_dma_sblk_3,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 13,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA3,
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>>> index 96c542d620f1..7659ce96548f 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>>> @@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
>>>           .name = "sspp_0", .id = SSPP_VIG0,
>>>           .base = 0x4000, .len = 0x1f0,
>>>           .features = VIG_SDM845_MASK,
>>> -        .sblk = &sdm845_vig_sblk_0,
>>> +        .sblk = &dpu_vig_sblk_qseed3,
>>>           .xin_id = 0,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG0,
>>> @@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
>>>           .name = "sspp_1", .id = SSPP_VIG1,
>>>           .base = 0x6000, .len = 0x1f0,
>>>           .features = VIG_SDM845_MASK,
>>> -        .sblk = &sdm845_vig_sblk_1,
>>> +        .sblk = &dpu_vig_sblk_qseed3,
>>>           .xin_id = 4,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG1,
>>> @@ -98,7 +98,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
>>>           .name = "sspp_2", .id = SSPP_VIG2,
>>>           .base = 0x8000, .len = 0x1f0,
>>>           .features = VIG_SDM845_MASK,
>>> -        .sblk = &sdm845_vig_sblk_2,
>>> +        .sblk = &dpu_vig_sblk_qseed3,
>>>           .xin_id = 8,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG2,
>>> @@ -106,7 +106,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
>>>           .name = "sspp_3", .id = SSPP_VIG3,
>>>           .base = 0xa000, .len = 0x1f0,
>>>           .features = VIG_SDM845_MASK,
>>> -        .sblk = &sdm845_vig_sblk_3,
>>> +        .sblk = &dpu_vig_sblk_qseed3,
>>>           .xin_id = 12,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG3,
>>> @@ -114,7 +114,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
>>>           .name = "sspp_8", .id = SSPP_DMA0,
>>>           .base = 0x24000, .len = 0x1f0,
>>>           .features = DMA_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_0,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 1,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA0,
>>> @@ -122,7 +122,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
>>>           .name = "sspp_9", .id = SSPP_DMA1,
>>>           .base = 0x26000, .len = 0x1f0,
>>>           .features = DMA_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_1,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 5,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA1,
>>> @@ -130,7 +130,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
>>>           .name = "sspp_10", .id = SSPP_DMA2,
>>>           .base = 0x28000, .len = 0x1f0,
>>>           .features = DMA_CURSOR_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_2,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 9,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA2,
>>> @@ -138,7 +138,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
>>>           .name = "sspp_11", .id = SSPP_DMA3,
>>>           .base = 0x2a000, .len = 0x1f0,
>>>           .features = DMA_CURSOR_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_3,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 13,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA3,
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>>> index 4edc1060f05c..2d054c8ccf1f 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>>> @@ -81,7 +81,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
>>>           .name = "sspp_0", .id = SSPP_VIG0,
>>>           .base = 0x4000, .len = 0x1f0,
>>>           .features = VIG_SDM845_MASK,
>>> -        .sblk = &sdm845_vig_sblk_0,
>>> +        .sblk = &dpu_vig_sblk_qseed3,
>>>           .xin_id = 0,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG0,
>>> @@ -89,7 +89,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
>>>           .name = "sspp_1", .id = SSPP_VIG1,
>>>           .base = 0x6000, .len = 0x1f0,
>>>           .features = VIG_SDM845_MASK,
>>> -        .sblk = &sdm845_vig_sblk_1,
>>> +        .sblk = &dpu_vig_sblk_qseed3,
>>>           .xin_id = 4,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG1,
>>> @@ -97,7 +97,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
>>>           .name = "sspp_2", .id = SSPP_VIG2,
>>>           .base = 0x8000, .len = 0x1f0,
>>>           .features = VIG_SDM845_MASK,
>>> -        .sblk = &sdm845_vig_sblk_2,
>>> +        .sblk = &dpu_vig_sblk_qseed3,
>>>           .xin_id = 8,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG2,
>>> @@ -105,7 +105,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
>>>           .name = "sspp_3", .id = SSPP_VIG3,
>>>           .base = 0xa000, .len = 0x1f0,
>>>           .features = VIG_SDM845_MASK,
>>> -        .sblk = &sdm845_vig_sblk_3,
>>> +        .sblk = &dpu_vig_sblk_qseed3,
>>>           .xin_id = 12,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG3,
>>> @@ -113,7 +113,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
>>>           .name = "sspp_8", .id = SSPP_DMA0,
>>>           .base = 0x24000, .len = 0x1f0,
>>>           .features = DMA_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_0,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 1,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA0,
>>> @@ -121,7 +121,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
>>>           .name = "sspp_9", .id = SSPP_DMA1,
>>>           .base = 0x26000, .len = 0x1f0,
>>>           .features = DMA_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_1,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 5,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA1,
>>> @@ -129,7 +129,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
>>>           .name = "sspp_10", .id = SSPP_DMA2,
>>>           .base = 0x28000, .len = 0x1f0,
>>>           .features = DMA_CURSOR_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_2,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 9,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA2,
>>> @@ -137,7 +137,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
>>>           .name = "sspp_11", .id = SSPP_DMA3,
>>>           .base = 0x2a000, .len = 0x1f0,
>>>           .features = DMA_CURSOR_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_3,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 13,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA3,
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
>>> index b3bfb897327b..dae37b2ccfef 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
>>> @@ -75,7 +75,7 @@ static const struct dpu_sspp_cfg sm6125_sspp[] = {
>>>           .name = "sspp_0", .id = SSPP_VIG0,
>>>           .base = 0x4000, .len = 0x1f0,
>>>           .features = VIG_SM6125_MASK,
>>> -        .sblk = &sm6125_vig_sblk_0,
>>> +        .sblk = &dpu_vig_sblk_qseed3lite,
>>>           .xin_id = 0,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG0,
>>> @@ -83,7 +83,7 @@ static const struct dpu_sspp_cfg sm6125_sspp[] = {
>>>           .name = "sspp_8", .id = SSPP_DMA0,
>>>           .base = 0x24000, .len = 0x1f0,
>>>           .features = DMA_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_0,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 1,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA0,
>>> @@ -91,7 +91,7 @@ static const struct dpu_sspp_cfg sm6125_sspp[] = {
>>>           .name = "sspp_9", .id = SSPP_DMA1,
>>>           .base = 0x26000, .len = 0x1f0,
>>>           .features = DMA_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_1,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 5,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA1,
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>>> index f8910dbc1952..854a4b49765b 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>>> @@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
>>>           .name = "sspp_0", .id = SSPP_VIG0,
>>>           .base = 0x4000, .len = 0x1f8,
>>>           .features = VIG_SC7180_MASK_SDMA,
>>> -        .sblk = &sm8250_vig_sblk_0,
>>> +        .sblk = &dpu_vig_sblk_qseed4,
>>>           .xin_id = 0,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG0,
>>> @@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
>>>           .name = "sspp_1", .id = SSPP_VIG1,
>>>           .base = 0x6000, .len = 0x1f8,
>>>           .features = VIG_SC7180_MASK_SDMA,
>>> -        .sblk = &sm8250_vig_sblk_1,
>>> +        .sblk = &dpu_vig_sblk_qseed4,
>>>           .xin_id = 4,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG1,
>>> @@ -98,7 +98,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
>>>           .name = "sspp_2", .id = SSPP_VIG2,
>>>           .base = 0x8000, .len = 0x1f8,
>>>           .features = VIG_SC7180_MASK_SDMA,
>>> -        .sblk = &sm8250_vig_sblk_2,
>>> +        .sblk = &dpu_vig_sblk_qseed4,
>>>           .xin_id = 8,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG2,
>>> @@ -106,7 +106,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
>>>           .name = "sspp_3", .id = SSPP_VIG3,
>>>           .base = 0xa000, .len = 0x1f8,
>>>           .features = VIG_SC7180_MASK_SDMA,
>>> -        .sblk = &sm8250_vig_sblk_3,
>>> +        .sblk = &dpu_vig_sblk_qseed4,
>>>           .xin_id = 12,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG3,
>>> @@ -114,7 +114,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
>>>           .name = "sspp_8", .id = SSPP_DMA0,
>>>           .base = 0x24000, .len = 0x1f8,
>>>           .features = DMA_SDM845_MASK_SDMA,
>>> -        .sblk = &sdm845_dma_sblk_0,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 1,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA0,
>>> @@ -122,7 +122,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
>>>           .name = "sspp_9", .id = SSPP_DMA1,
>>>           .base = 0x26000, .len = 0x1f8,
>>>           .features = DMA_SDM845_MASK_SDMA,
>>> -        .sblk = &sdm845_dma_sblk_1,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 5,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA1,
>>> @@ -130,7 +130,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
>>>           .name = "sspp_10", .id = SSPP_DMA2,
>>>           .base = 0x28000, .len = 0x1f8,
>>>           .features = DMA_CURSOR_SDM845_MASK_SDMA,
>>> -        .sblk = &sdm845_dma_sblk_2,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 9,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA2,
>>> @@ -138,7 +138,7 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
>>>           .name = "sspp_11", .id = SSPP_DMA3,
>>>           .base = 0x2a000, .len = 0x1f8,
>>>           .features = DMA_CURSOR_SDM845_MASK_SDMA,
>>> -        .sblk = &sdm845_dma_sblk_3,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 13,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA3,
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>>> index 8c046eacec7c..c358b161bedc 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>>> @@ -58,7 +58,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
>>>           .name = "sspp_0", .id = SSPP_VIG0,
>>>           .base = 0x4000, .len = 0x1f8,
>>>           .features = VIG_SC7180_MASK,
>>> -        .sblk = &sc7180_vig_sblk_0,
>>> +        .sblk = &dpu_vig_sblk_qseed4,
>>>           .xin_id = 0,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG0,
>>> @@ -66,7 +66,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
>>>           .name = "sspp_8", .id = SSPP_DMA0,
>>>           .base = 0x24000, .len = 0x1f8,
>>>           .features = DMA_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_0,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 1,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA0,
>>> @@ -74,7 +74,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
>>>           .name = "sspp_9", .id = SSPP_DMA1,
>>>           .base = 0x26000, .len = 0x1f8,
>>>           .features = DMA_CURSOR_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_1,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 5,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA1,
>>> @@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
>>>           .name = "sspp_10", .id = SSPP_DMA2,
>>>           .base = 0x28000, .len = 0x1f8,
>>>           .features = DMA_CURSOR_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_2,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 9,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA2,
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
>>> index 473cdbace322..6e4542100205 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
>>> @@ -46,7 +46,7 @@ static const struct dpu_sspp_cfg sm6115_sspp[] = {
>>>           .name = "sspp_0", .id = SSPP_VIG0,
>>>           .base = 0x4000, .len = 0x1f8,
>>>           .features = VIG_SC7180_MASK,
>>> -        .sblk = &sm6115_vig_sblk_0,
>>> +        .sblk = &dpu_vig_sblk_qseed4,
>>>           .xin_id = 0,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG0,
>>> @@ -54,7 +54,7 @@ static const struct dpu_sspp_cfg sm6115_sspp[] = {
>>>           .name = "sspp_8", .id = SSPP_DMA0,
>>>           .base = 0x24000, .len = 0x1f8,
>>>           .features = DMA_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_0,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 1,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA0,
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
>>> index ac716c8dbd7f..14fa820a8a06 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
>>> @@ -66,7 +66,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
>>>           .name = "sspp_0", .id = SSPP_VIG0,
>>>           .base = 0x4000, .len = 0x1f8,
>>>           .features = VIG_SC7180_MASK,
>>> -        .sblk = &sc7180_vig_sblk_0,
>>> +        .sblk = &dpu_vig_sblk_qseed4,
>>>           .xin_id = 0,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG0,
>>> @@ -74,7 +74,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
>>>           .name = "sspp_8", .id = SSPP_DMA0,
>>>           .base = 0x24000, .len = 0x1f8,
>>>           .features = DMA_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_0,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 1,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA0,
>>> @@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
>>>           .name = "sspp_9", .id = SSPP_DMA1,
>>>           .base = 0x26000, .len = 0x1f8,
>>>           .features = DMA_CURSOR_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_1,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 5,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA1,
>>> @@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
>>>           .name = "sspp_10", .id = SSPP_DMA2,
>>>           .base = 0x28000, .len = 0x1f8,
>>>           .features = DMA_CURSOR_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_2,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 9,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA2,
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>>> index 7d9fdd807695..f1ee8bab54af 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>>> @@ -43,7 +43,7 @@ static const struct dpu_sspp_cfg qcm2290_sspp[] = {
>>>           .name = "sspp_0", .id = SSPP_VIG0,
>>>           .base = 0x4000, .len = 0x1f8,
>>>           .features = VIG_QCM2290_MASK,
>>> -        .sblk = &qcm2290_vig_sblk_0,
>>> +        .sblk = &qcm2290_vig_sblk,
>>>           .xin_id = 0,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG0,
>>> @@ -51,7 +51,7 @@ static const struct dpu_sspp_cfg qcm2290_sspp[] = {
>>>           .name = "sspp_8", .id = SSPP_DMA0,
>>>           .base = 0x24000, .len = 0x1f8,
>>>           .features = DMA_SDM845_MASK,
>>> -        .sblk = &qcm2290_dma_sblk_0,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 1,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA0,
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
>>> index 5f36f9468853..8cdece6cd80d 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
>>> @@ -47,7 +47,7 @@ static const struct dpu_sspp_cfg sm6375_sspp[] = {
>>>           .name = "sspp_0", .id = SSPP_VIG0,
>>>           .base = 0x4000, .len = 0x1f8,
>>>           .features = VIG_SC7180_MASK,
>>> -        .sblk = &sm6115_vig_sblk_0,
>>> +        .sblk = &dpu_vig_sblk_qseed4,
>>>           .xin_id = 0,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG0,
>>> @@ -55,7 +55,7 @@ static const struct dpu_sspp_cfg sm6375_sspp[] = {
>>>           .name = "sspp_8", .id = SSPP_DMA0,
>>>           .base = 0x24000, .len = 0x1f8,
>>>           .features = DMA_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_0,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 1,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA0,
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>>> index b22e6b97c993..078cb32f90bf 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>>> @@ -80,7 +80,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
>>>           .name = "sspp_0", .id = SSPP_VIG0,
>>>           .base = 0x4000, .len = 0x1f8,
>>>           .features = VIG_SC7180_MASK,
>>> -        .sblk = &sm8250_vig_sblk_0,
>>> +        .sblk = &dpu_vig_sblk_qseed4,
>>>           .xin_id = 0,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG0,
>>> @@ -88,7 +88,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
>>>           .name = "sspp_1", .id = SSPP_VIG1,
>>>           .base = 0x6000, .len = 0x1f8,
>>>           .features = VIG_SC7180_MASK,
>>> -        .sblk = &sm8250_vig_sblk_1,
>>> +        .sblk = &dpu_vig_sblk_qseed4,
>>>           .xin_id = 4,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG1,
>>> @@ -96,7 +96,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
>>>           .name = "sspp_2", .id = SSPP_VIG2,
>>>           .base = 0x8000, .len = 0x1f8,
>>>           .features = VIG_SC7180_MASK,
>>> -        .sblk = &sm8250_vig_sblk_2,
>>> +        .sblk = &dpu_vig_sblk_qseed4,
>>>           .xin_id = 8,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG2,
>>> @@ -104,7 +104,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
>>>           .name = "sspp_3", .id = SSPP_VIG3,
>>>           .base = 0xa000, .len = 0x1f8,
>>>           .features = VIG_SC7180_MASK,
>>> -        .sblk = &sm8250_vig_sblk_3,
>>> +        .sblk = &dpu_vig_sblk_qseed4,
>>>           .xin_id = 12,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG3,
>>> @@ -112,7 +112,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
>>>           .name = "sspp_8", .id = SSPP_DMA0,
>>>           .base = 0x24000, .len = 0x1f8,
>>>           .features = DMA_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_0,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 1,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA0,
>>> @@ -120,7 +120,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
>>>           .name = "sspp_9", .id = SSPP_DMA1,
>>>           .base = 0x26000, .len = 0x1f8,
>>>           .features = DMA_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_1,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 5,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA1,
>>> @@ -128,7 +128,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
>>>           .name = "sspp_10", .id = SSPP_DMA2,
>>>           .base = 0x28000, .len = 0x1f8,
>>>           .features = DMA_CURSOR_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_2,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 9,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA2,
>>> @@ -136,7 +136,7 @@ static const struct dpu_sspp_cfg sm8350_sspp[] = {
>>>           .name = "sspp_11", .id = SSPP_DMA3,
>>>           .base = 0x2a000, .len = 0x1f8,
>>>           .features = DMA_CURSOR_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_3,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 13,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA3,
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>>> index 4b2cc62b07ea..0c7662a68232 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>>> @@ -64,7 +64,7 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
>>>           .name = "sspp_0", .id = SSPP_VIG0,
>>>           .base = 0x4000, .len = 0x1f8,
>>>           .features = VIG_SC7280_MASK_SDMA,
>>> -        .sblk = &sc7280_vig_sblk_0,
>>> +        .sblk = &dpu_vig_sblk_qseed4_rot_v2,
>>>           .xin_id = 0,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG0,
>>> @@ -72,7 +72,7 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
>>>           .name = "sspp_8", .id = SSPP_DMA0,
>>>           .base = 0x24000, .len = 0x1f8,
>>>           .features = DMA_SDM845_MASK_SDMA,
>>> -        .sblk = &sdm845_dma_sblk_0,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 1,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA0,
>>> @@ -80,7 +80,7 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
>>>           .name = "sspp_9", .id = SSPP_DMA1,
>>>           .base = 0x26000, .len = 0x1f8,
>>>           .features = DMA_CURSOR_SDM845_MASK_SDMA,
>>> -        .sblk = &sdm845_dma_sblk_1,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 5,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA1,
>>> @@ -88,7 +88,7 @@ static const struct dpu_sspp_cfg sc7280_sspp[] = {
>>>           .name = "sspp_10", .id = SSPP_DMA2,
>>>           .base = 0x28000, .len = 0x1f8,
>>>           .features = DMA_CURSOR_SDM845_MASK_SDMA,
>>> -        .sblk = &sdm845_dma_sblk_2,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 9,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA2,
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>>> index ec959f85ae2a..322957c61891 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>>> @@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
>>>           .name = "sspp_0", .id = SSPP_VIG0,
>>>           .base = 0x4000, .len = 0x2ac,
>>>           .features = VIG_SC7180_MASK,
>>> -        .sblk = &sm8250_vig_sblk_0,
>>> +        .sblk = &dpu_vig_sblk_qseed4,
>>>           .xin_id = 0,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG0,
>>> @@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
>>>           .name = "sspp_1", .id = SSPP_VIG1,
>>>           .base = 0x6000, .len = 0x2ac,
>>>           .features = VIG_SC7180_MASK,
>>> -        .sblk = &sm8250_vig_sblk_1,
>>> +        .sblk = &dpu_vig_sblk_qseed4,
>>>           .xin_id = 4,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG1,
>>> @@ -98,7 +98,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
>>>           .name = "sspp_2", .id = SSPP_VIG2,
>>>           .base = 0x8000, .len = 0x2ac,
>>>           .features = VIG_SC7180_MASK,
>>> -        .sblk = &sm8250_vig_sblk_2,
>>> +        .sblk = &dpu_vig_sblk_qseed4,
>>>           .xin_id = 8,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG2,
>>> @@ -106,7 +106,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
>>>           .name = "sspp_3", .id = SSPP_VIG3,
>>>           .base = 0xa000, .len = 0x2ac,
>>>           .features = VIG_SC7180_MASK,
>>> -        .sblk = &sm8250_vig_sblk_3,
>>> +        .sblk = &dpu_vig_sblk_qseed4,
>>>           .xin_id = 12,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG3,
>>> @@ -114,7 +114,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
>>>           .name = "sspp_8", .id = SSPP_DMA0,
>>>           .base = 0x24000, .len = 0x2ac,
>>>           .features = DMA_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_0,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 1,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA0,
>>> @@ -122,7 +122,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
>>>           .name = "sspp_9", .id = SSPP_DMA1,
>>>           .base = 0x26000, .len = 0x2ac,
>>>           .features = DMA_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_1,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 5,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA1,
>>> @@ -130,7 +130,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
>>>           .name = "sspp_10", .id = SSPP_DMA2,
>>>           .base = 0x28000, .len = 0x2ac,
>>>           .features = DMA_CURSOR_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_2,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 9,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA2,
>>> @@ -138,7 +138,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
>>>           .name = "sspp_11", .id = SSPP_DMA3,
>>>           .base = 0x2a000, .len = 0x2ac,
>>>           .features = DMA_CURSOR_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_3,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 13,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA3,
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>>> index 98a4aaef94d2..ae6d050aa4a9 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>>> @@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
>>>           .name = "sspp_0", .id = SSPP_VIG0,
>>>           .base = 0x4000, .len = 0x32c,
>>>           .features = VIG_SC7180_MASK,
>>> -        .sblk = &sm8250_vig_sblk_0,
>>> +        .sblk = &dpu_vig_sblk_qseed4,
>>>           .xin_id = 0,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG0,
>>> @@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
>>>           .name = "sspp_1", .id = SSPP_VIG1,
>>>           .base = 0x6000, .len = 0x32c,
>>>           .features = VIG_SC7180_MASK,
>>> -        .sblk = &sm8250_vig_sblk_1,
>>> +        .sblk = &dpu_vig_sblk_qseed4,
>>>           .xin_id = 4,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG1,
>>> @@ -98,7 +98,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
>>>           .name = "sspp_2", .id = SSPP_VIG2,
>>>           .base = 0x8000, .len = 0x32c,
>>>           .features = VIG_SC7180_MASK,
>>> -        .sblk = &sm8250_vig_sblk_2,
>>> +        .sblk = &dpu_vig_sblk_qseed4,
>>>           .xin_id = 8,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG2,
>>> @@ -106,7 +106,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
>>>           .name = "sspp_3", .id = SSPP_VIG3,
>>>           .base = 0xa000, .len = 0x32c,
>>>           .features = VIG_SC7180_MASK,
>>> -        .sblk = &sm8250_vig_sblk_3,
>>> +        .sblk = &dpu_vig_sblk_qseed4,
>>>           .xin_id = 12,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG3,
>>> @@ -114,7 +114,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
>>>           .name = "sspp_8", .id = SSPP_DMA0,
>>>           .base = 0x24000, .len = 0x32c,
>>>           .features = DMA_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_0,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 1,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA0,
>>> @@ -122,7 +122,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
>>>           .name = "sspp_9", .id = SSPP_DMA1,
>>>           .base = 0x26000, .len = 0x32c,
>>>           .features = DMA_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_1,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 5,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA1,
>>> @@ -130,7 +130,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
>>>           .name = "sspp_10", .id = SSPP_DMA2,
>>>           .base = 0x28000, .len = 0x32c,
>>>           .features = DMA_CURSOR_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_2,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 9,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA2,
>>> @@ -138,7 +138,7 @@ static const struct dpu_sspp_cfg sm8450_sspp[] = {
>>>           .name = "sspp_11", .id = SSPP_DMA3,
>>>           .base = 0x2a000, .len = 0x32c,
>>>           .features = DMA_CURSOR_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_3,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 13,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA3,
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>> index 7de9eccf9181..6aea57754b15 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>> @@ -83,7 +83,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>>>           .name = "sspp_0", .id = SSPP_VIG0,
>>>           .base = 0x4000, .len = 0x344,
>>>           .features = VIG_SC7180_MASK,
>>> -        .sblk = &sm8550_vig_sblk_0,
>>> +        .sblk = &dpu_vig_sblk_qseed4,
>>>           .xin_id = 0,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG0,
>>> @@ -91,7 +91,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>>>           .name = "sspp_1", .id = SSPP_VIG1,
>>>           .base = 0x6000, .len = 0x344,
>>>           .features = VIG_SC7180_MASK,
>>> -        .sblk = &sm8550_vig_sblk_1,
>>> +        .sblk = &dpu_vig_sblk_qseed4,
>>>           .xin_id = 4,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG1,
>>> @@ -99,7 +99,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>>>           .name = "sspp_2", .id = SSPP_VIG2,
>>>           .base = 0x8000, .len = 0x344,
>>>           .features = VIG_SC7180_MASK,
>>> -        .sblk = &sm8550_vig_sblk_2,
>>> +        .sblk = &dpu_vig_sblk_qseed4,
>>>           .xin_id = 8,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG2,
>>> @@ -107,7 +107,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>>>           .name = "sspp_3", .id = SSPP_VIG3,
>>>           .base = 0xa000, .len = 0x344,
>>>           .features = VIG_SC7180_MASK,
>>> -        .sblk = &sm8550_vig_sblk_3,
>>> +        .sblk = &dpu_vig_sblk_qseed4,
>>>           .xin_id = 12,
>>>           .type = SSPP_TYPE_VIG,
>>>           .clk_ctrl = DPU_CLK_CTRL_VIG3,
>>> @@ -115,7 +115,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>>>           .name = "sspp_8", .id = SSPP_DMA0,
>>>           .base = 0x24000, .len = 0x344,
>>>           .features = DMA_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_0,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 1,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA0,
>>> @@ -123,7 +123,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>>>           .name = "sspp_9", .id = SSPP_DMA1,
>>>           .base = 0x26000, .len = 0x344,
>>>           .features = DMA_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_1,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 5,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA1,
>>> @@ -131,7 +131,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>>>           .name = "sspp_10", .id = SSPP_DMA2,
>>>           .base = 0x28000, .len = 0x344,
>>>           .features = DMA_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_2,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 9,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA2,
>>> @@ -139,7 +139,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>>>           .name = "sspp_11", .id = SSPP_DMA3,
>>>           .base = 0x2a000, .len = 0x344,
>>>           .features = DMA_SDM845_MASK,
>>> -        .sblk = &sdm845_dma_sblk_3,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 13,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA3,
>>> @@ -147,7 +147,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>>>           .name = "sspp_12", .id = SSPP_DMA4,
>>>           .base = 0x2c000, .len = 0x344,
>>>           .features = DMA_CURSOR_SDM845_MASK,
>>> -        .sblk = &sm8550_dma_sblk_4,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 14,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA4,
>>> @@ -155,7 +155,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>>>           .name = "sspp_13", .id = SSPP_DMA5,
>>>           .base = 0x2e000, .len = 0x344,
>>>           .features = DMA_CURSOR_SDM845_MASK,
>>> -        .sblk = &sm8550_dma_sblk_5,
>>> +        .sblk = &dpu_dma_sblk,
>>>           .xin_id = 15,
>>>           .type = SSPP_TYPE_DMA,
>>>           .clk_ctrl = DPU_CLK_CTRL_DMA5,
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> index 63304c2ee6d9..cf185f58ffbb 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> @@ -291,66 +291,25 @@ static const uint32_t wb2_formats[] = {
>>>       .virt_num_formats = ARRAY_SIZE(plane_formats), \
>>>       }
>>> -static const struct dpu_sspp_sub_blks msm8998_vig_sblk_0 =
>>> -                _VIG_SBLK(DPU_SSPP_SCALER_QSEED3);
>>> -static const struct dpu_sspp_sub_blks msm8998_vig_sblk_1 =
>>> -                _VIG_SBLK(DPU_SSPP_SCALER_QSEED3);
>>> -static const struct dpu_sspp_sub_blks msm8998_vig_sblk_2 =
>>> -                _VIG_SBLK(DPU_SSPP_SCALER_QSEED3);
>>> -static const struct dpu_sspp_sub_blks msm8998_vig_sblk_3 =
>>> -                _VIG_SBLK(DPU_SSPP_SCALER_QSEED3);
>>> -
>>>   static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 = {
>>>       .rot_maxheight = 1088,
>>>       .rot_num_formats = ARRAY_SIZE(rotation_v2_formats),
>>>       .rot_format_list = rotation_v2_formats,
>>>   };
>>> -static const struct dpu_sspp_sub_blks sdm845_vig_sblk_0 =
>>> -                _VIG_SBLK(DPU_SSPP_SCALER_QSEED3);
>>> -static const struct dpu_sspp_sub_blks sdm845_vig_sblk_1 =
>>> -                _VIG_SBLK(DPU_SSPP_SCALER_QSEED3);
>>> -static const struct dpu_sspp_sub_blks sdm845_vig_sblk_2 =
>>> -                _VIG_SBLK(DPU_SSPP_SCALER_QSEED3);
>>> -static const struct dpu_sspp_sub_blks sdm845_vig_sblk_3 =
>>> +static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3 =
>>>                   _VIG_SBLK(DPU_SSPP_SCALER_QSEED3);
>>> -static const struct dpu_sspp_sub_blks sdm845_dma_sblk_0 = _DMA_SBLK;
>>> -static const struct dpu_sspp_sub_blks sdm845_dma_sblk_1 = _DMA_SBLK;
>>> -static const struct dpu_sspp_sub_blks sdm845_dma_sblk_2 = _DMA_SBLK;
>>> -static const struct dpu_sspp_sub_blks sdm845_dma_sblk_3 = _DMA_SBLK;
>>> +static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed3lite =
>>> +                _VIG_SBLK(DPU_SSPP_SCALER_QSEED3LITE);
>>> -static const struct dpu_sspp_sub_blks sc7180_vig_sblk_0 =
>>> +static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed4 =
>>>                   _VIG_SBLK(DPU_SSPP_SCALER_QSEED4);
>>> -static const struct dpu_sspp_sub_blks sc7280_vig_sblk_0 =
>>> +static const struct dpu_sspp_sub_blks dpu_vig_sblk_qseed4_rot_v2 =
>>>               _VIG_SBLK_ROT(DPU_SSPP_SCALER_QSEED4, 
>>> &dpu_rot_sc7280_cfg_v2);
>>> -static const struct dpu_sspp_sub_blks sm6115_vig_sblk_0 =
>>> -                _VIG_SBLK(DPU_SSPP_SCALER_QSEED4);
>>> -
>>> -static const struct dpu_sspp_sub_blks sm6125_vig_sblk_0 =
>>> -                _VIG_SBLK(DPU_SSPP_SCALER_QSEED3LITE);
>>> -
>>> -static const struct dpu_sspp_sub_blks sm8250_vig_sblk_0 =
>>> -                _VIG_SBLK(DPU_SSPP_SCALER_QSEED4);
>>> -static const struct dpu_sspp_sub_blks sm8250_vig_sblk_1 =
>>> -                _VIG_SBLK(DPU_SSPP_SCALER_QSEED4);
>>> -static const struct dpu_sspp_sub_blks sm8250_vig_sblk_2 =
>>> -                _VIG_SBLK(DPU_SSPP_SCALER_QSEED4);
>>> -static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
>>> -                _VIG_SBLK(DPU_SSPP_SCALER_QSEED4);
>>> -
>>> -static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
>>> -                _VIG_SBLK(DPU_SSPP_SCALER_QSEED4);
>>> -static const struct dpu_sspp_sub_blks sm8550_vig_sblk_1 =
>>> -                _VIG_SBLK(DPU_SSPP_SCALER_QSEED4);
>>> -static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
>>> -                _VIG_SBLK(DPU_SSPP_SCALER_QSEED4);
>>> -static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
>>> -                _VIG_SBLK(DPU_SSPP_SCALER_QSEED4);
>>> -static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK;
>>> -static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK;
>>> +static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK;
>>>   #define _VIG_SBLK_NOSCALE \
>>>       { \
>>> @@ -362,8 +321,7 @@ static const struct dpu_sspp_sub_blks 
>>> sm8550_dma_sblk_5 = _DMA_SBLK;
>>>       .virt_num_formats = ARRAY_SIZE(plane_formats), \
>>>       }
>>> -static const struct dpu_sspp_sub_blks qcm2290_vig_sblk_0 = 
>>> _VIG_SBLK_NOSCALE;
>>> -static const struct dpu_sspp_sub_blks qcm2290_dma_sblk_0 = _DMA_SBLK;
>>> +static const struct dpu_sspp_sub_blks qcm2290_vig_sblk = 
>>> _VIG_SBLK_NOSCALE;
>>>   /*************************************************************
>>>    * MIXER sub blocks config
> 
