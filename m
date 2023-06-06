Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D567247DC
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 17:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2AD910E375;
	Tue,  6 Jun 2023 15:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6DB10E375;
 Tue,  6 Jun 2023 15:35:36 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3568kMu3021699; Tue, 6 Jun 2023 15:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=NgjYo4Rwv7G3+7CKsvyLZZNa5yavibZ5U1RUD2IW1Ho=;
 b=ZIXla4Quq0hfnIDhuMjpaaujuqGl6cogR/mYSD9ft7u5ru2af99vmnhRqgpOidRixuXC
 W/8zEVwTITr2dFP6KVLc0WcBNxCXcreEuxVOKtub4pEmaBM6LAvxNiVANV+nWAjmzoAJ
 0L9GcYcFylTwQumAvvN1WKRaXmp1dyddYx/iEgJiolxIt3ZN6bj20e64cGqF6W1NkEZo
 R8LXqcoKq5pMgQsvBPYFQpexeQVzT/kzmzdSMe1WWNpg3LzC6+kD2n1GDR028KEM6ru8
 TbHT1IlsE1MkQLyP3tMQbl8ompjybE8MyfZjt2XPG1K612VQ/PEkmGVKecKkCd/ZhadX /A== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r1db9ba49-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jun 2023 15:35:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 356FZThq022139
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 6 Jun 2023 15:35:29 GMT
Received: from akhilpo-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 6 Jun 2023 08:35:24 -0700
Date: Tue, 6 Jun 2023 21:05:21 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v8 05/18] drm/msm/a6xx: Move
 a6xx_bus_clear_pending_transactions to a6xx_gpu
Message-ID: <r4zy7b734sowfg254q6rsxsmhoolc6c7wzw76hqfzxosgolmju@wkru43sktcu6>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
 <20230223-topic-gmuwrapper-v8-5-69c68206609e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230223-topic-gmuwrapper-v8-5-69c68206609e@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: di6e2dge28cmLJjPiOjeKIXQVOIPtx7e
X-Proofpoint-GUID: di6e2dge28cmLJjPiOjeKIXQVOIPtx7e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_11,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=982 mlxscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060133
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

On Mon, May 29, 2023 at 03:52:24PM +0200, Konrad Dybcio wrote:
> 
> This function is responsible for telling the GPU to halt transactions
> on all of its relevant buses, drain them and leave them in a predictable
> state, so that the GPU can be e.g. reset cleanly.
> 
> Move the function to a6xx_gpu.c, remove the static keyword and add a
> prototype in a6xx_gpu.h to accomodate for the move.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 37 -----------------------------------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 36 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  2 ++
>  3 files changed, 38 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 9421716a2fe5..b86be123ecd0 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -868,43 +868,6 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>  		(val & 1), 100, 1000);
>  }
>  
> -#define GBIF_CLIENT_HALT_MASK             BIT(0)
> -#define GBIF_ARB_HALT_MASK                BIT(1)
> -
> -static void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu,
> -		bool gx_off)
> -{
> -	struct msm_gpu *gpu = &adreno_gpu->base;
> -
> -	if (!a6xx_has_gbif(adreno_gpu)) {
> -		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0xf);
> -		spin_until((gpu_read(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL1) &
> -								0xf) == 0xf);
> -		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0);
> -
> -		return;
> -	}
> -
> -	if (gx_off) {
> -		/* Halt the gx side of GBIF */
> -		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 1);
> -		spin_until(gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT_ACK) & 1);
> -	}
> -
> -	/* Halt new client requests on GBIF */
> -	gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_CLIENT_HALT_MASK);
> -	spin_until((gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK) &
> -			(GBIF_CLIENT_HALT_MASK)) == GBIF_CLIENT_HALT_MASK);
> -
> -	/* Halt all AXI requests on GBIF */
> -	gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_ARB_HALT_MASK);
> -	spin_until((gpu_read(gpu,  REG_A6XX_GBIF_HALT_ACK) &
> -			(GBIF_ARB_HALT_MASK)) == GBIF_ARB_HALT_MASK);
> -
> -	/* The GBIF halt needs to be explicitly cleared */
> -	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
> -}
> -
>  /* Force the GMU off in case it isn't responsive */
>  static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
>  {
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index e34aa15156a4..6bb4da70f6a6 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1597,6 +1597,42 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
>  		a6xx_gpu->llc_mmio = ERR_PTR(-EINVAL);
>  }
>  
> +#define GBIF_CLIENT_HALT_MASK             BIT(0)
> +#define GBIF_ARB_HALT_MASK                BIT(1)
> +
> +void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off)
> +{
> +	struct msm_gpu *gpu = &adreno_gpu->base;
> +
> +	if (!a6xx_has_gbif(adreno_gpu)) {
> +		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0xf);
> +		spin_until((gpu_read(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL1) &
> +								0xf) == 0xf);
> +		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0);
> +
> +		return;
> +	}
> +
> +	if (gx_off) {
> +		/* Halt the gx side of GBIF */
> +		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 1);
> +		spin_until(gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT_ACK) & 1);
> +	}
> +
> +	/* Halt new client requests on GBIF */
> +	gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_CLIENT_HALT_MASK);
> +	spin_until((gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK) &
> +			(GBIF_CLIENT_HALT_MASK)) == GBIF_CLIENT_HALT_MASK);
> +
> +	/* Halt all AXI requests on GBIF */
> +	gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_ARB_HALT_MASK);
> +	spin_until((gpu_read(gpu,  REG_A6XX_GBIF_HALT_ACK) &
> +			(GBIF_ARB_HALT_MASK)) == GBIF_ARB_HALT_MASK);
> +
> +	/* The GBIF halt needs to be explicitly cleared */
> +	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
> +}
> +
>  static int a6xx_pm_resume(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index eea2e60ce3b7..9580def06d45 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -88,4 +88,6 @@ void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
>  struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu);
>  int a6xx_gpu_state_put(struct msm_gpu_state *state);
>  
> +void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
> +
>  #endif /* __A6XX_GPU_H__ */
> 
> -- 
> 2.40.1
> 
