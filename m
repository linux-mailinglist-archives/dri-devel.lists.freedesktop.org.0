Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF5A6A6052
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 21:24:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDCC410E00F;
	Tue, 28 Feb 2023 20:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE37210E00F;
 Tue, 28 Feb 2023 20:23:59 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31SGkrfX018714; Tue, 28 Feb 2023 20:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=aD9p/uaGPnAOseXuoLESlp5Zz7ZHtsFAw9p2BJMha/k=;
 b=cBv/EfIzUS6ew8U5cFgvZoXiVN1uUo4JOaYRhH39ny+i1B/vOLRoqahsDVnenTjnwisd
 1c44vjeLnQKoZ5Bvy0SRHNmeVyoF21vFbioKTWoDbRkFZiuuwFTQhXwdrQKJmQzIulDX
 g5keqw2eHMktJ/x6ZW4nMy3e7FNKt8aGq/myVMXoS3vmPbfjJAEIXeoabTXvKM6xXQkV
 8UDFThnhCknJqI96WQ+zeQCkLlPhSI2dnWiNQs/GNFvkTFJWaX0bPzBsqMsggLrgKvXR
 jLPwTbjctnHXNb7NaSUO3R0Np1YiCzLz0QzmFRaCIljNfw6SuuhlMH4L3Zr561KqMl8r xg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p1as32k51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Feb 2023 20:23:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31SKNqhL025387
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Feb 2023 20:23:52 GMT
Received: from [10.216.38.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 28 Feb
 2023 12:23:46 -0800
Message-ID: <e19b5cd7-9125-a285-accc-ecf530804cfc@quicinc.com>
Date: Wed, 1 Mar 2023 01:53:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v3 04/15] drm/msm/a6xx: Extend and explain UBWC config
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
 <20230223-topic-gmuwrapper-v3-4-5be55a336819@linaro.org>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20230223-topic-gmuwrapper-v3-4-5be55a336819@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: F0Sq-vV9BMY1SJpXhvwhJg_zxqbHVsFD
X-Proofpoint-GUID: F0Sq-vV9BMY1SJpXhvwhJg_zxqbHVsFD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-02-28_17,2023-02-28_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302280169
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/23/2023 5:36 PM, Konrad Dybcio wrote:
> Rename lower_bit to hbb_lo and explain what it signifies.
> Add explanations (wherever possible to other tunables).
>
> Sort the variable definition and assignment alphabetically.
Sorting based on decreasing order of line length is more readable, isn't it?
>
> Port setting min_access_length, ubwc_mode and hbb_hi from downstream.
> Set default values for all of the tunables to zero, as they should be.
>
> Values were validated against downstream and will be fixed up in
> separate commits so as not to make this one even more messy.
>
> A618 remains untouched (left at hw defaults) in this patch.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 55 ++++++++++++++++++++++++++++-------
>  1 file changed, 45 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index c5f5d0bb3fdc..bdae341e0a7c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -786,39 +786,74 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> -	u32 lower_bit = 2;
> +	/* Unknown, introduced with A640/680 */
>  	u32 amsbc = 0;
> +	/*
> +	 * The Highest Bank Bit value represents the bit of the highest DDR bank.
> +	 * We then subtract 13 from it (13 is the minimum value allowed by hw) and
> +	 * write the lowest two bits of the remaining value as hbb_lo and the
> +	 * one above it as hbb_hi to the hardware. The default values (when HBB is
> +	 * not specified) are 0, 0.
> +	 */
> +	u32 hbb_hi = 0;
> +	u32 hbb_lo = 0;
> +	/* Whether the minimum access length is 64 bits */
> +	u32 min_acc_len = 0;
> +	/* Unknown, introduced with A650 family, related to UBWC mode/ver 4 */
>  	u32 rgb565_predicator = 0;
> +	/* Unknown, introduced with A650 family */
>  	u32 uavflagprd_inv = 0;
> +	/* Entirely magic, per-GPU-gen value */
> +	u32 ubwc_mode = 0;
>  
>  	/* a618 is using the hw default values */
>  	if (adreno_is_a618(adreno_gpu))
>  		return;
>  
> -	if (adreno_is_a640_family(adreno_gpu))
> +	if (adreno_is_a619(adreno_gpu)) {
> +		/* HBB = 14 */
> +		hbb_lo = 1;
> +	}
> +
> +	if (adreno_is_a630(adreno_gpu)) {
> +		/* HBB = 15 */
> +		hbb_lo = 2;
> +	}
> +
> +	if (adreno_is_a640_family(adreno_gpu)) {
>  		amsbc = 1;
> +		/* HBB = 15 */
> +		hbb_lo = 2;
> +	}
>  
>  	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu)) {
> -		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
> -		lower_bit = 3;
>  		amsbc = 1;
> +		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
> +		/* HBB = 16 */
> +		hbb_lo = 3;
>  		rgb565_predicator = 1;
>  		uavflagprd_inv = 2;
>  	}
>  
>  	if (adreno_is_7c3(adreno_gpu)) {
> -		lower_bit = 1;
>  		amsbc = 1;
> +		/* HBB is unset in downstream DTS, defaulting to 0 */
This is incorrect. For 7c3 hbb value is 14. So hbb_lo should be 1. FYI, hbb configurations were moved to the driver from DT in recent downstream kernels.

-Akhil.
>  		rgb565_predicator = 1;
>  		uavflagprd_inv = 2;
>  	}
>  
>  	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
> -		rgb565_predicator << 11 | amsbc << 4 | lower_bit << 1);
> -	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, lower_bit << 1);
> -	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
> -		uavflagprd_inv << 4 | lower_bit << 1);
> -	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, lower_bit << 21);
> +		  rgb565_predicator << 11 | hbb_hi << 10 | amsbc << 4 |
> +		  min_acc_len << 3 | hbb_lo << 1 | ubwc_mode);
> +
> +	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, hbb_hi << 4 |
> +		  min_acc_len << 3 | hbb_lo << 1 | ubwc_mode);
> +
> +	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, hbb_hi << 10 |
> +		  uavflagprd_inv << 4 | min_acc_len << 3 |
> +		  hbb_lo << 1 | ubwc_mode);
> +
> +	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, min_acc_len << 23 | hbb_lo << 21);
>  }
>  
>  static int a6xx_cp_init(struct msm_gpu *gpu)
>

