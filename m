Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEEA81CF17
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 20:58:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863A810E842;
	Fri, 22 Dec 2023 19:58:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03F610E822;
 Fri, 22 Dec 2023 19:58:15 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BMFDr8U016516; Fri, 22 Dec 2023 19:57:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=qcppdkim1; bh=wKKlRvQbCme2K+VxY2Ifk
 mjSGoGwScWbkwBm8TgDddM=; b=jkFSNvX1a1Ls+3/vKYw/9KoxdgSVsxzoOUFk5
 nljkKxhjFU+kQHcYCRuRqFsXRLjXfFuO/l0AtGO2HD8YIy6Yi3XxKph3Wz7YxnKZ
 DL8xkU+mK+ypdP9d3Hn6uFrf7J5YrXN8Dtabk77cRv30o/VMMr9HGxhasR7Jnkcl
 QY+rGI3KLn/cpmuuOXvUE1i1iBSkZPFqxS8ElHP2kfdm6Oyhcud6P4Em0qRzdx9M
 26snaje1xXd59UEL2Sq7ThJxYLbqkvxg7CtxKXXcVCPKs4olpxaz3RRR2rrIwuZh
 srRFWoCtpxQdg9scXeVLU1lzP3Ic2Js9hXWq3N0bj44MQrc2A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v57vg9h6w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Dec 2023 19:57:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BMJvtia021833
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Dec 2023 19:57:55 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 22 Dec 2023 11:57:50 -0800
Date: Sat, 23 Dec 2023 01:27:47 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Fix recovery vs runpm race
Message-ID: <k5yte4b36j23p3pfqmflhpkfesyiwoczi3avs2vavvzb3i2oct@zhssj7u5a6og>
References: <20231218155927.368881-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231218155927.368881-1-robdclark@gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 49yidPqc0o0-vPdYGCd9NjzI6keTMM3p
X-Proofpoint-ORIG-GUID: 49yidPqc0o0-vPdYGCd9NjzI6keTMM3p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1011 suspectscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312220146
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Danylo Piliaiev <dpiliaiev@igalia.com>, Konrad
 Dybcio <konrad.dybcio@linaro.org>, David
 Heidelberg <david.heidelberg@collabora.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 18, 2023 at 07:59:24AM -0800, Rob Clark wrote:
> 
> From: Rob Clark <robdclark@chromium.org>
> 
> a6xx_recover() is relying on the gpu lock to serialize against incoming
> submits doing a runpm get, as it tries to temporarily balance out the
> runpm gets with puts in order to power off the GPU.  Unfortunately this
> gets worse when we (in a later patch) will move the runpm get out of the
> scheduler thread/work to move it out of the fence signaling path.
> 
> Instead we can just simplify the whole thing by using force_suspend() /
> force_resume() instead of trying to be clever.

At some places, we take a pm_runtime vote and access the gpu
registers assuming it will be powered until we drop the vote.  a6xx_get_timestamp()
is an example. If we do a force suspend, it may cause bus errors from
those threads. Now you have to serialize every place we do runtime_get/put with a
mutex. Or is there a better way to handle the 'later patch' you
mentioned?

-Akhil.

> 
> Reported-by: David Heidelberg <david.heidelberg@collabora.com>
> Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/10272
> Fixes: abe2023b4cea ("drm/msm/gpu: Push gpu lock down past runpm")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 268737e59131..a5660d63535b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1244,12 +1244,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
>  	dev_pm_genpd_add_notifier(gmu->cxpd, &gmu->pd_nb);
>  	dev_pm_genpd_synced_poweroff(gmu->cxpd);
>  
> -	/* Drop the rpm refcount from active submits */
> -	if (active_submits)
> -		pm_runtime_put(&gpu->pdev->dev);
> -
> -	/* And the final one from recover worker */
> -	pm_runtime_put_sync(&gpu->pdev->dev);
> +	pm_runtime_force_suspend(&gpu->pdev->dev);
>  
>  	if (!wait_for_completion_timeout(&gmu->pd_gate, msecs_to_jiffies(1000)))
>  		DRM_DEV_ERROR(&gpu->pdev->dev, "cx gdsc didn't collapse\n");
> @@ -1258,10 +1253,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
>  
>  	pm_runtime_use_autosuspend(&gpu->pdev->dev);
>  
> -	if (active_submits)
> -		pm_runtime_get(&gpu->pdev->dev);
> -
> -	pm_runtime_get_sync(&gpu->pdev->dev);
> +	pm_runtime_force_resume(&gpu->pdev->dev);
>  
>  	gpu->active_submits = active_submits;
>  	mutex_unlock(&gpu->active_lock);
> -- 
> 2.43.0
> 
