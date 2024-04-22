Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C32758AD3C1
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 20:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878BF112CBC;
	Mon, 22 Apr 2024 18:17:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="G919xZXz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57997112CBC;
 Mon, 22 Apr 2024 18:17:24 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43M5dqwu022705;
 Mon, 22 Apr 2024 18:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=fhtoU6wrZha9yXgeF9yhzKdvL23EjHQpIAGTzb24zgw=; b=G9
 19xZXzcYUCeX6aD7IL+a3f77tfqOkRSjeMYgxuZKSrQXObWW7tNnkqq9rIO9zEu6
 o0j3WxLuHuO3gMG2k7VlCUVhXeJ5iCzRIGMNr7w4Qbs3ug6aMmCemJ4yZrID2m+I
 8IrwIYU2WRO4cPQ4zrzEyJIQNctViHun0rJVz7pv0jOoDeIHvQhWKBcBeiZm6TQs
 IlB0UYD5WgCC805xN+6fP2HKteuadOH3fuBgq5JBnzJFEia93U0wl9XfinYVqolj
 V4bJI9SsLN5bRsYUCSjeqBSeLPAMaR5W555gLFNoj+hRt7yeQJHZL144j+s9dh2W
 VLgZeWUeN42TY40wY+FA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xm5sx58x1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Apr 2024 18:17:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43MIHFJg007592
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Apr 2024 18:17:15 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Apr
 2024 11:17:15 -0700
Message-ID: <313d9eed-098f-c09b-eb5d-ac9ad56a8e1d@quicinc.com>
Date: Mon, 22 Apr 2024 11:17:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/3] drm/msm/mdp4: don't destroy mdp4_kms in mdp4_kms_init
 error path
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240420-mdp4-fixes-v1-0-96a70f64fa85@linaro.org>
 <20240420-mdp4-fixes-v1-2-96a70f64fa85@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240420-mdp4-fixes-v1-2-96a70f64fa85@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: HtMI5gdiaWWW4jtP--Qo4wsUXMZYqC1Y
X-Proofpoint-GUID: HtMI5gdiaWWW4jtP--Qo4wsUXMZYqC1Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_13,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 spamscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404220077
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



On 4/19/2024 7:33 PM, Dmitry Baryshkov wrote:
> Since commit 3c74682637e6 ("drm/msm/mdp4: move resource allocation to
> the _probe function") the mdp4_kms data is allocated during probe. It is
> an error to destroy it during mdp4_kms_init(), as the data is still
> referenced by the drivers's data and can be used later in case of probe
> deferral.
> 

mdp4_destroy() currently detaches mmu, calls msm_kms_destroy() which 
destroys pending timers and releases refcount on the aspace.

It does not touch the mdp4_kms as that one is devm managed.

In the comment 
https://patchwork.freedesktop.org/patch/590411/?series=132664&rev=1#comment_1074306, 
we had discussed that the last component's reprobe attempt is affected 
(which is not dpu or mdp4 or mdp5 right? )

If it was an interface (such as DSI OR DP), is it the aspace detach 
which is causing the crash?

Another note is, mdp5 needs the same fix in that case.

dpu_kms_init() looks fine.

> Fixes: 3c74682637e6 ("drm/msm/mdp4: move resource allocation to the _probe function")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 28 +++++++++-------------------
>   1 file changed, 9 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> index 4ba1cb74ad76..4c5f72b7e0e5 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -392,7 +392,7 @@ static int mdp4_kms_init(struct drm_device *dev)
>   	ret = mdp_kms_init(&mdp4_kms->base, &kms_funcs);
>   	if (ret) {
>   		DRM_DEV_ERROR(dev->dev, "failed to init kms\n");
> -		goto fail;
> +		return ret;
>   	}
>   
>   	kms = priv->kms;
> @@ -403,7 +403,7 @@ static int mdp4_kms_init(struct drm_device *dev)
>   		ret = regulator_enable(mdp4_kms->vdd);
>   		if (ret) {
>   			DRM_DEV_ERROR(dev->dev, "failed to enable regulator vdd: %d\n", ret);
> -			goto fail;
> +			return ret;
>   		}
>   	}
>   
> @@ -414,8 +414,7 @@ static int mdp4_kms_init(struct drm_device *dev)
>   	if (major != 4) {
>   		DRM_DEV_ERROR(dev->dev, "unexpected MDP version: v%d.%d\n",
>   			      major, minor);
> -		ret = -ENXIO;
> -		goto fail;
> +		return -ENXIO;
>   	}
>   
>   	mdp4_kms->rev = minor;
> @@ -423,8 +422,7 @@ static int mdp4_kms_init(struct drm_device *dev)
>   	if (mdp4_kms->rev >= 2) {
>   		if (!mdp4_kms->lut_clk) {
>   			DRM_DEV_ERROR(dev->dev, "failed to get lut_clk\n");
> -			ret = -ENODEV;
> -			goto fail;
> +			return -ENODEV;
>   		}
>   		clk_set_rate(mdp4_kms->lut_clk, max_clk);
>   	}
> @@ -445,8 +443,7 @@ static int mdp4_kms_init(struct drm_device *dev)
>   
>   	mmu = msm_iommu_new(&pdev->dev, 0);
>   	if (IS_ERR(mmu)) {
> -		ret = PTR_ERR(mmu);
> -		goto fail;
> +		return PTR_ERR(mmu);
>   	} else if (!mmu) {
>   		DRM_DEV_INFO(dev->dev, "no iommu, fallback to phys "
>   				"contig buffers for scanout\n");
> @@ -458,8 +455,7 @@ static int mdp4_kms_init(struct drm_device *dev)
>   		if (IS_ERR(aspace)) {
>   			if (!IS_ERR(mmu))
>   				mmu->funcs->destroy(mmu);
> -			ret = PTR_ERR(aspace);
> -			goto fail;
> +			return PTR_ERR(aspace);
>   		}
>   
>   		kms->aspace = aspace;
> @@ -468,7 +464,7 @@ static int mdp4_kms_init(struct drm_device *dev)
>   	ret = modeset_init(mdp4_kms);
>   	if (ret) {
>   		DRM_DEV_ERROR(dev->dev, "modeset_init failed: %d\n", ret);
> -		goto fail;
> +		return ret;
>   	}
>   
>   	mdp4_kms->blank_cursor_bo = msm_gem_new(dev, SZ_16K, MSM_BO_WC | MSM_BO_SCANOUT);
> @@ -476,14 +472,14 @@ static int mdp4_kms_init(struct drm_device *dev)
>   		ret = PTR_ERR(mdp4_kms->blank_cursor_bo);
>   		DRM_DEV_ERROR(dev->dev, "could not allocate blank-cursor bo: %d\n", ret);
>   		mdp4_kms->blank_cursor_bo = NULL;
> -		goto fail;
> +		return ret;
>   	}
>   
>   	ret = msm_gem_get_and_pin_iova(mdp4_kms->blank_cursor_bo, kms->aspace,
>   			&mdp4_kms->blank_cursor_iova);
>   	if (ret) {
>   		DRM_DEV_ERROR(dev->dev, "could not pin blank-cursor bo: %d\n", ret);
> -		goto fail;
> +		return ret;
>   	}
>   
>   	dev->mode_config.min_width = 0;
> @@ -492,12 +488,6 @@ static int mdp4_kms_init(struct drm_device *dev)
>   	dev->mode_config.max_height = 2048;
>   
>   	return 0;
> -
> -fail:
> -	if (kms)
> -		mdp4_destroy(kms);
> -
> -	return ret;
>   }
>   
>   static const struct dev_pm_ops mdp4_pm_ops = {
> 
