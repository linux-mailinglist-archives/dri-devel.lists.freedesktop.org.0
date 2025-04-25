Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6C2A9D2EE
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 22:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F1E10E9CC;
	Fri, 25 Apr 2025 20:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="e+CyW1H4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00BFC10E9CD;
 Fri, 25 Apr 2025 20:24:42 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJuB1024750;
 Fri, 25 Apr 2025 20:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kcun9w3A1j/G1OzzsPcb3/mY7bDiEDLBGze6UIAGCZ0=; b=e+CyW1H4wfeZhM3O
 N8ApVdvBP3jZC1FkvkUcBDaA2OMYxyf7GF0Az2iSWlJvtXLMEPH5HpqD6xEAvfUv
 g1HnTJZaGLu6IpIHi31FXQJ6ap0s7xL/J3EPeMT43BKAmxbznUeGLUex5GCcgSNs
 taI6v1/BnpKq9SR2UZ5AjbMKOnMIzoZIuFLQ4SWy6K0fWp14ssmIhOArMmyYRbZ4
 A90fLkBpBbCUOBS05C70/meBy/OZfWdBLaa1X80IEkdLrl1v6Wcie1tmWssivRDY
 2Q9K4Eh94p/6UXh7/uAcx+BFcn6BXRjr5Eirqya1zMofTa1dirOmgNKPwYQSH9iD
 +PjKXg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0t389-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Apr 2025 20:24:37 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53PKOaJp003713
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Apr 2025 20:24:36 GMT
Received: from [10.134.71.99] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Apr
 2025 13:24:35 -0700
Message-ID: <f1afcf58-2937-4ad4-b5ad-8935c3367190@quicinc.com>
Date: Fri, 25 Apr 2025 13:24:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/msm/dpu: enable SmartDMA on SC8180X
To: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Konrad Dybcio
 <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250308-dpu-rework-vig-masks-v1-0-f1b5d101ae0b@linaro.org>
 <20250308-dpu-rework-vig-masks-v1-2-f1b5d101ae0b@linaro.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250308-dpu-rework-vig-masks-v1-2-f1b5d101ae0b@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: M5REsFV_lE3FfKzfgb6csjkq94wXydRw
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680bef85 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=SJCa53jPp-AOw9btYvwA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: M5REsFV_lE3FfKzfgb6csjkq94wXydRw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0NiBTYWx0ZWRfXxnXh3lYrrYuT
 SygwMhm5STjoyF5Sqb1zsYaFn8WnUmq6xaolKsgbc4ry5pR7Ccfn0wG1vrXMfuXdHADxvcV7yt/
 YxNxxIcNiSSjSmzYj1Yz4jBpVOboyp04TXp9WljVKelPYTrE8m9yIeaxTEZLcWJYPjkhfj/0My9
 zZN1PQgOEPxk+oCIaJyQozW0KBlEAkdlr1PVgcDhiz5Gbjbg/9YiX0w5kai+oYVnAXdsn36ZS5z
 eIjdg7qWhM6itC28yHwJVzN19rINH0BRcpJjw9Qrhet08acDdfCr3uYg5nOIzUPKDGsiiMfdEb8
 0CGFHuyO1BJ2xShPtCkJkHPU/xLi6NJXcfzb/Y9WI1J7qda6pWKPK5SBGSgDZSFmXa0GCgnQGkz
 C7/LBM2E//Irj+8Ow18Evk20RizOUAvtKY8IIZefeXV+IOd8sVn79N8aiC4LUl4RhezsbWz4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250146
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



On 3/7/2025 9:38 PM, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Reworking of the catalog dropped the SmartDMA feature bit on the SC8180X
> platform. Renable SmartDMA support on this SoC.
> 
> Fixes: 460c410f02e4 ("drm/msm/dpu: duplicate sdm845 catalog entries")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index de8ccf589f1fe026ca0697d48f9533befda4659d..330490d10247e6347df71927ce601da1468f466e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -75,7 +75,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
>   	{
>   		.name = "sspp_0", .id = SSPP_VIG0,
>   		.base = 0x4000, .len = 0x1f0,
> -		.features = VIG_SDM845_MASK,
> +		.features = VIG_SDM845_MASK_SDMA,
>   		.sblk = &dpu_vig_sblk_qseed3_1_4,
>   		.xin_id = 0,
>   		.type = SSPP_TYPE_VIG,
> @@ -83,7 +83,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
>   	}, {
>   		.name = "sspp_1", .id = SSPP_VIG1,
>   		.base = 0x6000, .len = 0x1f0,
> -		.features = VIG_SDM845_MASK,
> +		.features = VIG_SDM845_MASK_SDMA,
>   		.sblk = &dpu_vig_sblk_qseed3_1_4,
>   		.xin_id = 4,
>   		.type = SSPP_TYPE_VIG,
> @@ -91,7 +91,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
>   	}, {
>   		.name = "sspp_2", .id = SSPP_VIG2,
>   		.base = 0x8000, .len = 0x1f0,
> -		.features = VIG_SDM845_MASK,
> +		.features = VIG_SDM845_MASK_SDMA,
>   		.sblk = &dpu_vig_sblk_qseed3_1_4,
>   		.xin_id = 8,
>   		.type = SSPP_TYPE_VIG,
> @@ -99,7 +99,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
>   	}, {
>   		.name = "sspp_3", .id = SSPP_VIG3,
>   		.base = 0xa000, .len = 0x1f0,
> -		.features = VIG_SDM845_MASK,
> +		.features = VIG_SDM845_MASK_SDMA,
>   		.sblk = &dpu_vig_sblk_qseed3_1_4,
>   		.xin_id = 12,
>   		.type = SSPP_TYPE_VIG,
> @@ -107,7 +107,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
>   	}, {
>   		.name = "sspp_8", .id = SSPP_DMA0,
>   		.base = 0x24000, .len = 0x1f0,
> -		.features = DMA_SDM845_MASK,
> +		.features = DMA_SDM845_MASK_SDMA,
>   		.sblk = &dpu_dma_sblk,
>   		.xin_id = 1,
>   		.type = SSPP_TYPE_DMA,
> @@ -115,7 +115,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
>   	}, {
>   		.name = "sspp_9", .id = SSPP_DMA1,
>   		.base = 0x26000, .len = 0x1f0,
> -		.features = DMA_SDM845_MASK,
> +		.features = DMA_SDM845_MASK_SDMA,
>   		.sblk = &dpu_dma_sblk,
>   		.xin_id = 5,
>   		.type = SSPP_TYPE_DMA,
> @@ -123,7 +123,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
>   	}, {
>   		.name = "sspp_10", .id = SSPP_DMA2,
>   		.base = 0x28000, .len = 0x1f0,
> -		.features = DMA_CURSOR_SDM845_MASK,
> +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
>   		.sblk = &dpu_dma_sblk,
>   		.xin_id = 9,
>   		.type = SSPP_TYPE_DMA,
> @@ -131,7 +131,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
>   	}, {
>   		.name = "sspp_11", .id = SSPP_DMA3,
>   		.base = 0x2a000, .len = 0x1f0,
> -		.features = DMA_CURSOR_SDM845_MASK,
> +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
>   		.sblk = &dpu_dma_sblk,
>   		.xin_id = 13,
>   		.type = SSPP_TYPE_DMA,
> 

