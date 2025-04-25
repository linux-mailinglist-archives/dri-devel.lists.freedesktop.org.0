Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DCEA9D2F4
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 22:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A2610E9CE;
	Fri, 25 Apr 2025 20:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="p0V7Kzsv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8BD10E9CD;
 Fri, 25 Apr 2025 20:26:28 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJrqh011041;
 Fri, 25 Apr 2025 20:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vDI+JoExhEM8MwWbaV2f1Sw4aj31+Bc6NXpJG1B8NIE=; b=p0V7Kzsvdq579ZLK
 wUwKb4kWQc0Eof9wY8VVfVu4/CY0gT2HUzyM08kMlcTuGsxqw5dY9kJ6CgDzZOW6
 5RdwfCBhJ7FcvZn33j5gcCPTvOj7zeHH9S6H5L2ufKh9f+MNM41UK5KNZSerRjVp
 FxCbw1C7y3YTAcMxeqWS2Q2T9zjOXoC1kSoxWO6s+0/h8c2o8I/evOBEFL9boKU/
 ZeOkGoCLcFcNT91wjf8R2Mt4K73nEB8JxeP21lDbRxTFqIHn9Kk3twgNpuJ0v9nc
 9QCtr9c7cyg4/oG3R3c2EkHejB0eWTCiY8oxAq4U/ImDj5zPRzoyjU6NV/gWs/6X
 T+Jv6g==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0jct8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Apr 2025 20:26:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53PKQOmQ011625
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Apr 2025 20:26:24 GMT
Received: from [10.134.71.99] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Apr
 2025 13:26:23 -0700
Message-ID: <34b7a7fd-e10c-4cde-8c26-c2d7a024c8cd@quicinc.com>
Date: Fri, 25 Apr 2025 13:26:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/msm/dpu: enable SmartDMA on SM8550
To: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Konrad Dybcio
 <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250308-dpu-rework-vig-masks-v1-0-f1b5d101ae0b@linaro.org>
 <20250308-dpu-rework-vig-masks-v1-4-f1b5d101ae0b@linaro.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250308-dpu-rework-vig-masks-v1-4-f1b5d101ae0b@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: GjIidZkOz4mY8N2y_BDrB9BFbVwqvMwB
X-Proofpoint-ORIG-GUID: GjIidZkOz4mY8N2y_BDrB9BFbVwqvMwB
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680beff1 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=iINAtZPE4VmR1exTeEMA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0NiBTYWx0ZWRfX9/Qc3gRzplzz
 OqiULUelICWTGhG3VhWdYqc9/GZmEu+uiH7aeYbJFJoJd7PLv8UhSHRMZklNCkWf23lwR5Uvt3V
 nOtlw4q8rKVhHFnpHHQYtZiEgxHg3MYHMyVIHvoqAeM25rfQpi1ksb7qq7wW7+k3/rZN0ypCLcO
 EMEnZsdaiBdmxwKd/L7pCobg6o1aorU+eSDOSNxmgs+cfduTl2Pb2441c2c/j4TZ4UutB3/5sbm
 vUwVyx1Bf9JV2XGBy75319iDOD/jT0w8Z6y0MNnXGZFUYxSHGkLObmjkUXOxVBwmOoj9Ci5UArl
 evYCKcVUV60Z7YxvYXVImZ0ytYPPU/68eivDV/uOsIXbKAAt2O1QkhszPfXvPwULrEYPJm9m7A7
 nSdiRBKVZYE4CBNPQY1FB6XuzPS6cEXVnIFnrYUMee8TOot5wBIEXe/VFYhkWW58NrQibZom
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=986 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
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
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> In order to support more versatile configuration of the display pipes on
> SM8550, enable SmartDMA for this platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

With authorship fixed,

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index a5b90e5e31202900c0bb5bc4a705a6b269005474..2379e119c8c5cb9d68cfaa4feea990ce7e24d569 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -66,70 +66,70 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
>   	{
>   		.name = "sspp_0", .id = SSPP_VIG0,
>   		.base = 0x4000, .len = 0x344,
> -		.features = VIG_SDM845_MASK,
> +		.features = VIG_SDM845_MASK_SDMA,
>   		.sblk = &dpu_vig_sblk_qseed3_3_2,
>   		.xin_id = 0,
>   		.type = SSPP_TYPE_VIG,
>   	}, {
>   		.name = "sspp_1", .id = SSPP_VIG1,
>   		.base = 0x6000, .len = 0x344,
> -		.features = VIG_SDM845_MASK,
> +		.features = VIG_SDM845_MASK_SDMA,
>   		.sblk = &dpu_vig_sblk_qseed3_3_2,
>   		.xin_id = 4,
>   		.type = SSPP_TYPE_VIG,
>   	}, {
>   		.name = "sspp_2", .id = SSPP_VIG2,
>   		.base = 0x8000, .len = 0x344,
> -		.features = VIG_SDM845_MASK,
> +		.features = VIG_SDM845_MASK_SDMA,
>   		.sblk = &dpu_vig_sblk_qseed3_3_2,
>   		.xin_id = 8,
>   		.type = SSPP_TYPE_VIG,
>   	}, {
>   		.name = "sspp_3", .id = SSPP_VIG3,
>   		.base = 0xa000, .len = 0x344,
> -		.features = VIG_SDM845_MASK,
> +		.features = VIG_SDM845_MASK_SDMA,
>   		.sblk = &dpu_vig_sblk_qseed3_3_2,
>   		.xin_id = 12,
>   		.type = SSPP_TYPE_VIG,
>   	}, {
>   		.name = "sspp_8", .id = SSPP_DMA0,
>   		.base = 0x24000, .len = 0x344,
> -		.features = DMA_SDM845_MASK,
> +		.features = DMA_SDM845_MASK_SDMA,
>   		.sblk = &dpu_dma_sblk,
>   		.xin_id = 1,
>   		.type = SSPP_TYPE_DMA,
>   	}, {
>   		.name = "sspp_9", .id = SSPP_DMA1,
>   		.base = 0x26000, .len = 0x344,
> -		.features = DMA_SDM845_MASK,
> +		.features = DMA_SDM845_MASK_SDMA,
>   		.sblk = &dpu_dma_sblk,
>   		.xin_id = 5,
>   		.type = SSPP_TYPE_DMA,
>   	}, {
>   		.name = "sspp_10", .id = SSPP_DMA2,
>   		.base = 0x28000, .len = 0x344,
> -		.features = DMA_SDM845_MASK,
> +		.features = DMA_SDM845_MASK_SDMA,
>   		.sblk = &dpu_dma_sblk,
>   		.xin_id = 9,
>   		.type = SSPP_TYPE_DMA,
>   	}, {
>   		.name = "sspp_11", .id = SSPP_DMA3,
>   		.base = 0x2a000, .len = 0x344,
> -		.features = DMA_SDM845_MASK,
> +		.features = DMA_SDM845_MASK_SDMA,
>   		.sblk = &dpu_dma_sblk,
>   		.xin_id = 13,
>   		.type = SSPP_TYPE_DMA,
>   	}, {
>   		.name = "sspp_12", .id = SSPP_DMA4,
>   		.base = 0x2c000, .len = 0x344,
> -		.features = DMA_CURSOR_SDM845_MASK,
> +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
>   		.sblk = &dpu_dma_sblk,
>   		.xin_id = 14,
>   		.type = SSPP_TYPE_DMA,
>   	}, {
>   		.name = "sspp_13", .id = SSPP_DMA5,
>   		.base = 0x2e000, .len = 0x344,
> -		.features = DMA_CURSOR_SDM845_MASK,
> +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
>   		.sblk = &dpu_dma_sblk,
>   		.xin_id = 15,
>   		.type = SSPP_TYPE_DMA,
> 

