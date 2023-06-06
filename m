Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CC17249E4
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 19:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1842710E384;
	Tue,  6 Jun 2023 17:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF2E10E384;
 Tue,  6 Jun 2023 17:09:59 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 356CPliG008825; Tue, 6 Jun 2023 17:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=cMFO+lrUNM2Y2ZHtb0xZ2vZlDKP4pr+BXCaQJt8SZHM=;
 b=OElBh+H2UVDhy74uXx3KEhCHaY2mDZZkiv4YF2z/MmoEWkd6545oYtxxxLZCBCYDbAgz
 Lz36FksUexn7BX9w5dk97CKggRlyTJh9pamSMAEpBU8tr2FLcVJCA8JWH95TmAwWuyAE
 YxiZ+7grcYvWTghdpZLMBjiCY/21mmErb4SdktrNwm4t+Zg7pHmVoYsYXzobLCLxD2en
 axRpFEY20HiRo4fMP/SpNyI1GIkQuRvpt41T65vOt8nrH2kRlmEqJ5uccNXfEwYeBVFf
 M20r9tDPEhajk+tVTSQZAdLbi90lWwStcq+gWrKBdmEz/eeOpaBFdLGKaBDjXW6CFNdz YA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r249n0qxf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jun 2023 17:09:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 356H9MOr009459
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 6 Jun 2023 17:09:22 GMT
Received: from akhilpo-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 6 Jun 2023 10:09:16 -0700
Date: Tue, 6 Jun 2023 22:39:13 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v8 06/18] drm/msm/a6xx: Improve
 a6xx_bus_clear_pending_transactions()
Message-ID: <bkaws4kq74idxgpbkas2tle76uqfxwwioucx2s2wuq3entxves@blb2b5dcr7tn>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
 <20230223-topic-gmuwrapper-v8-6-69c68206609e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230223-topic-gmuwrapper-v8-6-69c68206609e@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: DHc7Ixj7KM7S8vUVBI1mq2BpPrhNNbXE
X-Proofpoint-GUID: DHc7Ixj7KM7S8vUVBI1mq2BpPrhNNbXE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_12,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 mlxlogscore=958 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2306060148
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 29, 2023 at 03:52:25PM +0200, Konrad Dybcio wrote:
> 
> Unify the indentation and explain the cryptic 0xF value.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 6bb4da70f6a6..e3ac3f045665 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1597,17 +1597,18 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
>  		a6xx_gpu->llc_mmio = ERR_PTR(-EINVAL);
>  }
>  
> -#define GBIF_CLIENT_HALT_MASK             BIT(0)
> -#define GBIF_ARB_HALT_MASK                BIT(1)
> +#define GBIF_CLIENT_HALT_MASK		BIT(0)
> +#define GBIF_ARB_HALT_MASK		BIT(1)
> +#define VBIF_XIN_HALT_CTRL0_MASK	GENMASK(3, 0)
>  
>  void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off)
>  {
>  	struct msm_gpu *gpu = &adreno_gpu->base;
>  
>  	if (!a6xx_has_gbif(adreno_gpu)) {
> -		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0xf);
> +		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, VBIF_XIN_HALT_CTRL0_MASK);
>  		spin_until((gpu_read(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL1) &
> -								0xf) == 0xf);
> +				(VBIF_XIN_HALT_CTRL0_MASK)) == VBIF_XIN_HALT_CTRL0_MASK);
>  		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0);
>  
>  		return;
> 
> -- 
> 2.40.1
> 
