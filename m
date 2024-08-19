Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC04295751F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 21:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3BF310E35D;
	Mon, 19 Aug 2024 19:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="nofXM9aP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9963610E35C;
 Mon, 19 Aug 2024 19:59:47 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JB8uYA025662;
 Mon, 19 Aug 2024 19:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=wZXGwo3NRahAKPBdC0x2drch
 QdEI7BDLJxmJcB2J2wA=; b=nofXM9aPagJhjLp+yk1s9e2KEZHrgRMdOtgyQ+fD
 s6rHksu+uaBCULIQ+6h0h6Py3wH1A3Gk5ExmG8U5lFBosAD/rptTeum1bY7KeOX0
 N3ogatc75ETACvacBp9NpaIO+CBJ7D1yeYa4BAotNIXBzxUYwXbWTArh0BG5Ctfy
 byHSRn6Reb6ju4wRLxUTvm1/fv8HpKN4adL/YLJ+sInytToyCWK2SKjsUA6bRmVe
 R67Oa6PAhZXmKYTgDRztARNmG+P3Z4yVopQdyzAMsCX7XnEqLty6Dt8+ys01R9FQ
 ZOwnonX/S9l8ul1Id4zju9Tmr77DERB8EUpyqOiOkacrXg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412n585avu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Aug 2024 19:59:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47JJxdTP024242
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Aug 2024 19:59:39 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 19 Aug 2024 12:59:34 -0700
Date: Tue, 20 Aug 2024 01:29:31 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Antonino Maniscalco <antomani103@gmail.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konrad.dybcio@linaro.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/7] drm/msm: Fix bv_fence being used as bv_rptr
Message-ID: <20240819195931.5xl2c3fupgy6atif@hu-akhilpo-hyd.qualcomm.com>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-1-7bda26c34037@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240815-preemption-a750-t-v1-1-7bda26c34037@gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: W3z_s3mfWdk-mYIzd_dsBCs35O4smXaO
X-Proofpoint-ORIG-GUID: W3z_s3mfWdk-mYIzd_dsBCs35O4smXaO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1011 spamscore=0
 mlxlogscore=913 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408190136
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

On Thu, Aug 15, 2024 at 08:26:11PM +0200, Antonino Maniscalco wrote:
> The bv_fence field of rbmemptrs was being used incorrectly as the BV
> rptr shadow pointer in some places.
> 
> Add a bv_rptr field and change the code to use that instead.
> 
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil.

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.h  | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index bcaec86ac67a..32a4faa93d7f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1132,7 +1132,7 @@ static int hw_init(struct msm_gpu *gpu)
>  	/* ..which means "always" on A7xx, also for BV shadow */
>  	if (adreno_is_a7xx(adreno_gpu)) {
>  		gpu_write64(gpu, REG_A7XX_CP_BV_RB_RPTR_ADDR,
> -			    rbmemptr(gpu->rb[0], bv_fence));
> +			    rbmemptr(gpu->rb[0], bv_rptr));
>  	}
>  
>  	/* Always come up on rb 0 */
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
> index 0d6beb8cd39a..40791b2ade46 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.h
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
> @@ -31,6 +31,7 @@ struct msm_rbmemptrs {
>  	volatile uint32_t rptr;
>  	volatile uint32_t fence;
>  	/* Introduced on A7xx */
> +	volatile uint32_t bv_rptr;
>  	volatile uint32_t bv_fence;
>  
>  	volatile struct msm_gpu_submit_stats stats[MSM_GPU_SUBMIT_STATS_COUNT];
> 
> -- 
> 2.46.0
> 
> 
