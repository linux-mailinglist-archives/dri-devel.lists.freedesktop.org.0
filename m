Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD547247BD
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 17:30:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927ED10E374;
	Tue,  6 Jun 2023 15:30:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 700C810E373;
 Tue,  6 Jun 2023 15:30:29 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 356FMeV0016037; Tue, 6 Jun 2023 15:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=5rjeQ+adxEPAtRMVme/yLgNBpCtZv2fDyPstcl0ZWqI=;
 b=gJisIJDkXCyRs/n48/uyAdwP60E2kH2F6N1J43wlrrT10s95z+QUfvaNcGMKDtmZH1Zq
 /yG4gDVqpPWTPTCphrULT22L/DIrEZ2UAdmpcGxGJyo6PZ2t0Hsx+H4Nt4Mw/JVUqGwx
 l0xaExo+/OElusF4X5pmTH/VVtY0Q9dD+3pN+co1y+DXuw0g2vwXLwp5vIhf42+2n7f5
 gChOdSN5sVuminoTluvu3GvuxeWTEGeeSGgy3tyN1NjSbBlptGwZ2b++yNyuY8/qPTCk
 2DopesnkTDxUMB5eh1wXjjoDhHzM0UkSOdP1T/4ppU3o2kDguIi7ie8lp0+DzVARmP0e 6Q== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r1s4uhtyd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jun 2023 15:30:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 356FUMdb029459
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 6 Jun 2023 15:30:22 GMT
Received: from akhilpo-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 6 Jun 2023 08:30:16 -0700
Date: Tue, 6 Jun 2023 21:00:13 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v8 04/18] drm/msm/a6xx: Move force keepalive vote removal
 to a6xx_gmu_force_off()
Message-ID: <23c2tadnl5hyeyo2i4onxfgx76dfsc6zefasdhxcdzoebsn7rg@24noupcp5h2h>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
 <20230223-topic-gmuwrapper-v8-4-69c68206609e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230223-topic-gmuwrapper-v8-4-69c68206609e@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: PbliB0h2FTeeYlppe_S__3dezpyGlQH_
X-Proofpoint-GUID: PbliB0h2FTeeYlppe_S__3dezpyGlQH_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_11,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 mlxlogscore=989 impostorscore=0 malwarescore=0 bulkscore=0
 adultscore=0 priorityscore=1501 clxscore=1011 mlxscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060132
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

On Mon, May 29, 2023 at 03:52:23PM +0200, Konrad Dybcio wrote:
> 
> As pointed out by Akhil during the review process of GMU wrapper
> introduction [1], it makes sense to move this write into the function
> that's responsible for forcibly shutting the GMU off.
> 
> It is also very convenient to move this to GMU-specific code, so that
> it does not have to be guarded by an if-condition to avoid calling it
> on GMU wrapper targets.
> 
> Move the write to the aforementioned a6xx_gmu_force_off() to achieve
> that. No effective functional change.
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
-Akhil.
> 
> [1] https://lore.kernel.org/linux-arm-msm/20230501194022.GA18382@akhilpo-linux.qualcomm.com/
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 ++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 ------
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 87babbb2a19f..9421716a2fe5 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -912,6 +912,12 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
>  	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>  	struct msm_gpu *gpu = &adreno_gpu->base;
>  
> +	/*
> +	 * Turn off keep alive that might have been enabled by the hang
> +	 * interrupt
> +	 */
> +	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
> +
>  	/* Flush all the queues */
>  	a6xx_hfi_stop(gmu);
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 9fb214f150dd..e34aa15156a4 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1274,12 +1274,6 @@ static void a6xx_recover(struct msm_gpu *gpu)
>  	/* Halt SQE first */
>  	gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 3);
>  
> -	/*
> -	 * Turn off keep alive that might have been enabled by the hang
> -	 * interrupt
> -	 */
> -	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
> -
>  	pm_runtime_dont_use_autosuspend(&gpu->pdev->dev);
>  
>  	/* active_submit won't change until we make a submission */
> 
> -- 
> 2.40.1
> 
