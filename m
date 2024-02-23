Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF071861E1A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 21:48:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07E810EACB;
	Fri, 23 Feb 2024 20:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="mYzE7YdM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220DD895C1;
 Fri, 23 Feb 2024 20:48:32 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41NKY1A7008914; Fri, 23 Feb 2024 20:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=LKWrf34v8r33/LmQhsxTJharZCGDQP5OGXVFHqA25I4=; b=mY
 zE7YdMLtvGjHI+ZRrE4bqJcyFBHGG7SXFaj7MZsf0bAIosGIGfUW8jL2N2S2D8l0
 WzRxGubTCRF6zGxZpIQrqv5Vb9z0LQj0KK5NBVpHKWgrJcmVzlN1pkthygEwAf6h
 pcewG55dJGgB7r1ITYaDlkXID5n7tRgdVY2w2zotqnINkoFtAdvvNZIvPzsno9RQ
 lEKp+2Rn/GmEGEnfevdiLYMbbhbHd50Q4SEkoS/6w3CdwSnBlKiKQJ/kdQsb6CJq
 tLkpKtl/JvFsusvi72HZzi0FRb6HJ+XOtM4EO9kNfh6zTFH0no1mb7lKR2uOXXTd
 TaeTDBo5D7GbQyzKVuPg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3weq6x9nm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Feb 2024 20:48:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41NKmRrc020334
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Feb 2024 20:48:27 GMT
Received: from [10.110.76.211] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 23 Feb
 2024 12:48:26 -0800
Message-ID: <6334793a-1204-85b3-4f91-7859b83f79ed@quicinc.com>
Date: Fri, 23 Feb 2024 12:48:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dpu: add support for 4:2:2 and 4:4:4 planar YCbCr
 plane formats
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240222-fd-dpu-yv16-yv24-v1-1-4aa833cdc641@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240222-fd-dpu-yv16-yv24-v1-1-4aa833cdc641@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: S2pdWKJC23btV_09glpIOFEQDiI7l5oH
X-Proofpoint-ORIG-GUID: S2pdWKJC23btV_09glpIOFEQDiI7l5oH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-23_06,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 spamscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402230152
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



On 2/22/2024 3:43 AM, Dmitry Baryshkov wrote:
> The DPU driver provides support for 4:2:0 planar YCbCr plane formats.
> Extend it to also support 4:2:2 and 4:4:4 plat formats.
> 

I checked myself and also internally on this. On sm8250, the DPU planes 
do not support YUV444 and YUV422 (and the corresponding YVU formats).

May I know what was the reference to add these formats to DPU 
considering that even downstream sources didn't add them?

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Full-screen (1080p@60) YV24 gave me underruns on SM8250 until I bumped
> the clock inefficiency factor from 105 to 117. I'm not sure that it is a
> correct way to handle it, so I'm sending this as an RFC. If we agree
> that bumping the .clk_inefficiency_factor is a correct way, I'll send
> v2, including catalog changes.
> 
> I had no such issues for the YV16/YU16 formats.

We don't support this too on sm8250. But interesting it worked.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    | 24 ++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  4 ++++
>   2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> index e366ab134249..1b763cd95e5a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> @@ -475,6 +475,30 @@ static const struct dpu_format dpu_format_map[] = {
>   		C1_B_Cb, C2_R_Cr, C0_G_Y,
>   		false, DPU_CHROMA_420, 1, DPU_FORMAT_FLAG_YUV,
>   		DPU_FETCH_LINEAR, 3),
> +
> +	PLANAR_YUV_FMT(YUV422,
> +		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
> +		C2_R_Cr, C1_B_Cb, C0_G_Y,
> +		false, DPU_CHROMA_H2V1, 1, DPU_FORMAT_FLAG_YUV,
> +		DPU_FETCH_LINEAR, 3),
> +
> +	PLANAR_YUV_FMT(YVU422,
> +		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
> +		C1_B_Cb, C2_R_Cr, C0_G_Y,
> +		false, DPU_CHROMA_H2V1, 1, DPU_FORMAT_FLAG_YUV,
> +		DPU_FETCH_LINEAR, 3),
> +
> +	PLANAR_YUV_FMT(YUV444,
> +		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
> +		C2_R_Cr, C1_B_Cb, C0_G_Y,
> +		false, DPU_CHROMA_RGB, 1, DPU_FORMAT_FLAG_YUV,
> +		DPU_FETCH_LINEAR, 3),
> +
> +	PLANAR_YUV_FMT(YVU444,
> +		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
> +		C1_B_Cb, C2_R_Cr, C0_G_Y,
> +		false, DPU_CHROMA_RGB, 1, DPU_FORMAT_FLAG_YUV,
> +		DPU_FETCH_LINEAR, 3),
>   };
>   
>   /*
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index ccbee0f40ad7..949c86a44ec7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -195,6 +195,10 @@ static const uint32_t plane_formats_yuv[] = {
>   	DRM_FORMAT_YVYU,
>   	DRM_FORMAT_YUV420,
>   	DRM_FORMAT_YVU420,
> +	DRM_FORMAT_YUV422,
> +	DRM_FORMAT_YVU422,
> +	DRM_FORMAT_YUV444,
> +	DRM_FORMAT_YVU444,
>   };
>   
>   static const u32 rotation_v2_formats[] = {
> 
> ---
> base-commit: ffa0c87f172bf7a0132aa960db412f8d63b2f533
> change-id: 20240222-fd-dpu-yv16-yv24-6bf152dfa7f3
> 
> Best regards,
