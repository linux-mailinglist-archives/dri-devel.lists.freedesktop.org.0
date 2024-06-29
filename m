Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C731991CA62
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2024 03:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451BE10ED71;
	Sat, 29 Jun 2024 01:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="E+Q8/8pv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80FC10ED71;
 Sat, 29 Jun 2024 01:58:43 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45T0iq9f012954;
 Sat, 29 Jun 2024 01:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=DaQDaqafwgHEyJHxh9lPxPAh
 D4FP45AMifHABbLtOtQ=; b=E+Q8/8pv3D/XGoL7LCRZtMSbPiStB6DtI+DVssew
 Yx5HxguvmRLbvjSJ4k7GQT/ng/NYHmSMs3py4XiPeuXx+MVfBkzrfiBHYvmENPo7
 pCulsB83+NaXJX6IOkw5XZmy+sGg7SuBc6vOYhfhtmhV7Dc7zyw25ipl01JHYOqM
 ylFhotBXKly+cxtp8XwH5RZ8b9SRENWffOlfw0dP7rwOdX6mX0aJHWEuoRfN7OXa
 NMc7BW6Lzd0905YHLSh4/FZxP8/JcZgDKUnKrmCgYrkmIORIrHbLze7gCY16BxMT
 NpIAX1+9YezQ5ObY4Wa3vkEsp1Zyz+iHicpYN5jNXWLlWQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4027yf0381-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Jun 2024 01:58:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45T1wdQI032019
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Jun 2024 01:58:39 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 28 Jun 2024 18:58:35 -0700
Date: Sat, 29 Jun 2024 07:28:31 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Rob Clark <robdclark@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@chromium.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/5] drm/msm/adreno: Split up giant device table
Message-ID: <20240629015831.sglaflboanhrarmn@hu-akhilpo-hyd.qualcomm.com>
References: <20240618164303.66615-1-robdclark@gmail.com>
 <20240618164303.66615-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240618164303.66615-2-robdclark@gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: RBQR0hAo0TGJbjaNNOE2QWVTnaDIuJQx
X-Proofpoint-ORIG-GUID: RBQR0hAo0TGJbjaNNOE2QWVTnaDIuJQx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_18,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406290013
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

On Tue, Jun 18, 2024 at 09:42:47AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Split into a separate table per generation, in preparation to move each
> gen's device table to it's own file.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 67 +++++++++++++++++-----
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 10 ++++
>  2 files changed, 63 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index c3703a51287b..a57659eaddc2 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -20,7 +20,7 @@ bool allow_vram_carveout = false;
>  MODULE_PARM_DESC(allow_vram_carveout, "Allow using VRAM Carveout, in place of IOMMU");
>  module_param_named(allow_vram_carveout, allow_vram_carveout, bool, 0600);
>  
> -static const struct adreno_info gpulist[] = {
> +static const struct adreno_info a2xx_gpus[] = {
>  	{
>  		.chip_ids = ADRENO_CHIP_IDS(0x02000000),
>  		.family = ADRENO_2XX_GEN1,
> @@ -54,7 +54,12 @@ static const struct adreno_info gpulist[] = {
>  		.gmem  = SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.init  = a2xx_gpu_init,
> -	}, {
> +	}
> +};
> +DECLARE_ADRENO_GPULIST(a2xx);
> +
> +static const struct adreno_info a3xx_gpus[] = {
> +	{
>  		.chip_ids = ADRENO_CHIP_IDS(0x03000512),
>  		.family = ADRENO_3XX,
>  		.fw = {
> @@ -116,7 +121,12 @@ static const struct adreno_info gpulist[] = {
>  		.gmem  = SZ_1M,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.init  = a3xx_gpu_init,
> -	}, {
> +	}
> +};
> +DECLARE_ADRENO_GPULIST(a3xx);
> +
> +static const struct adreno_info a4xx_gpus[] = {
> +	{
>  		.chip_ids = ADRENO_CHIP_IDS(0x04000500),
>  		.family = ADRENO_4XX,
>  		.revn  = 405,
> @@ -149,7 +159,12 @@ static const struct adreno_info gpulist[] = {
>  		.gmem  = (SZ_1M + SZ_512K),
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.init  = a4xx_gpu_init,
> -	}, {
> +	}
> +};
> +DECLARE_ADRENO_GPULIST(a4xx);
> +
> +static const struct adreno_info a5xx_gpus[] = {
> +	{
>  		.chip_ids = ADRENO_CHIP_IDS(0x05000600),
>  		.family = ADRENO_5XX,
>  		.revn = 506,
> @@ -274,7 +289,12 @@ static const struct adreno_info gpulist[] = {
>  		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
>  		.init = a5xx_gpu_init,
>  		.zapfw = "a540_zap.mdt",
> -	}, {
> +	}
> +};
> +DECLARE_ADRENO_GPULIST(a5xx);
> +
> +static const struct adreno_info a6xx_gpus[] = {
> +	{
>  		.chip_ids = ADRENO_CHIP_IDS(0x06010000),
>  		.family = ADRENO_6XX_GEN1,
>  		.revn = 610,
> @@ -520,7 +540,12 @@ static const struct adreno_info gpulist[] = {
>  		.zapfw = "a690_zap.mdt",
>  		.hwcg = a690_hwcg,
>  		.address_space_size = SZ_16G,
> -	}, {
> +	}
> +};
> +DECLARE_ADRENO_GPULIST(a6xx);
> +
> +static const struct adreno_info a7xx_gpus[] = {
> +	{
>  		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
>  		.family = ADRENO_6XX_GEN1, /* NOT a mistake! */
>  		.fw = {
> @@ -582,7 +607,17 @@ static const struct adreno_info gpulist[] = {
>  		.init = a6xx_gpu_init,
>  		.zapfw = "gen70900_zap.mbn",
>  		.address_space_size = SZ_16G,
> -	},
> +	}
> +};
> +DECLARE_ADRENO_GPULIST(a7xx);
> +
> +static const struct adreno_gpulist *gpulists[] = {
> +	&a2xx_gpulist,
> +	&a3xx_gpulist,
> +	&a4xx_gpulist,
> +	&a5xx_gpulist,
> +	&a6xx_gpulist,
> +	&a6xx_gpulist,

Typo. a6xx_gpulist -> a7xx_gpulist.

-Akhil

>  };
>  
>  MODULE_FIRMWARE("qcom/a300_pm4.fw");
> @@ -617,13 +652,17 @@ MODULE_FIRMWARE("qcom/yamato_pm4.fw");
>  static const struct adreno_info *adreno_info(uint32_t chip_id)
>  {
>  	/* identify gpu: */
> -	for (int i = 0; i < ARRAY_SIZE(gpulist); i++) {
> -		const struct adreno_info *info = &gpulist[i];
> -		if (info->machine && !of_machine_is_compatible(info->machine))
> -			continue;
> -		for (int j = 0; info->chip_ids[j]; j++)
> -			if (info->chip_ids[j] == chip_id)
> -				return info;
> +	for (int i = 0; i < ARRAY_SIZE(gpulists); i++) {
> +		for (int j = 0; j < gpulists[i]->gpus_count; j++) {
> +			const struct adreno_info *info = &gpulists[i]->gpus[j];
> +
> +			if (info->machine && !of_machine_is_compatible(info->machine))
> +				continue;
> +
> +			for (int k = 0; info->chip_ids[k]; k++)
> +				if (info->chip_ids[k] == chip_id)
> +					return info;
> +		}
>  	}
>  
>  	return NULL;
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 77526892eb8c..17aba8c58f3d 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -114,6 +114,16 @@ struct adreno_info {
>  
>  #define ADRENO_CHIP_IDS(tbl...) (uint32_t[]) { tbl, 0 }
>  
> +struct adreno_gpulist {
> +	const struct adreno_info *gpus;
> +	unsigned gpus_count;
> +};
> +
> +#define DECLARE_ADRENO_GPULIST(name)                  \
> +const struct adreno_gpulist name ## _gpulist = {      \
> +	name ## _gpus, ARRAY_SIZE(name ## _gpus)      \
> +}
> +
>  /*
>   * Helper to build a speedbin table, ie. the table:
>   *      fuse | speedbin
> -- 
> 2.45.2
> 
