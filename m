Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 846315AA44F
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 02:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789CE10E3CA;
	Fri,  2 Sep 2022 00:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EAAD10E3CA;
 Fri,  2 Sep 2022 00:24:27 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2820AWiS002464;
 Fri, 2 Sep 2022 00:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=qJXf3mZeUPNlrD3PlSBTwPi+y0xljw93eI6tpPmliIQ=;
 b=hs3jbJeUNv0912bwTLVA2Ngp7ZZL7ZzfGs5GHeqTk6siJ+b3KAGzKRtdj1fnw9KK+abB
 eb7A6ah5DkrAPH4Ybe63vVLajQjl6I+7OvXgmi3Eg+4+iUfx2FgFn8wd8AmrG9oOjQTo
 cP13ebR83IBL61CWtdjdByyI/HqUqTlxAnFzTRIKYwLi89qH4oOFhfV6xMyLcNYGZeZG
 +8LB01PJTqp5TjrYIdX2i7+IZ6xsVu2Z/ZZiLEWttkHlajBn5CNcDwmXe4MN+7MuLfbY
 wUbmueEdwHZYEDU8UugXChUqkDsG4PMScI6sMJYwK8jEawdLqALhWw/v9U7SRDMyQWvo tg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jarc8304x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Sep 2022 00:24:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2820OLhe016755
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 2 Sep 2022 00:24:21 GMT
Received: from [10.111.173.210] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 1 Sep 2022
 17:24:19 -0700
Message-ID: <014fc43f-bee6-88eb-9d3c-69aed2fcd7c6@quicinc.com>
Date: Thu, 1 Sep 2022 17:24:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 3/4] drm/msm/mdp4: move resource allocation to the
 _probe function
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220620213054.1872954-1-dmitry.baryshkov@linaro.org>
 <20220620213054.1872954-4-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220620213054.1872954-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: U16cyBt83BmMK1VSN8gCUu9IKN25eokn
X-Proofpoint-GUID: U16cyBt83BmMK1VSN8gCUu9IKN25eokn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_12,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209010107
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/20/2022 2:30 PM, Dmitry Baryshkov wrote:
> To let the probe function bail early if any of the resources is
> unavailable, move resource allocattion from kms_init directly to the
> probe callback. While we are at it, replace irq_of_parse_and_map() with
> platform_get_irq().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 107 +++++++++++------------
>   1 file changed, 51 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> index 41dc60784847..6499713eccf6 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -139,8 +139,6 @@ static void mdp4_destroy(struct msm_kms *kms)
>   		pm_runtime_disable(dev);
>   
>   	mdp_kms_destroy(&mdp4_kms->base);
> -
> -	kfree(mdp4_kms);
>   }
>   
>   static const struct mdp_kms_funcs kms_funcs = {
> @@ -383,57 +381,27 @@ static int mdp4_kms_init(struct drm_device *dev)
>   {
>   	struct platform_device *pdev = to_platform_device(dev->dev);
>   	struct msm_drm_private *priv = dev->dev_private;
> -	struct mdp4_kms *mdp4_kms;
> +	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(priv->kms));
>   	struct msm_kms *kms = NULL;
>   	struct iommu_domain *iommu;
>   	struct msm_gem_address_space *aspace;
> -	int irq, ret;
> +	int ret;
>   	u32 major, minor;
>   	unsigned long max_clk;
>   
>   	/* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
>   	max_clk = 266667000;
>   
> -	mdp4_kms = kzalloc(sizeof(*mdp4_kms), GFP_KERNEL);
> -	if (!mdp4_kms) {
> -		DRM_DEV_ERROR(dev->dev, "failed to allocate kms\n");
> -		return -ENOMEM;
> -	}
> -
>   	ret = mdp_kms_init(&mdp4_kms->base, &kms_funcs);
>   	if (ret) {
>   		DRM_DEV_ERROR(dev->dev, "failed to init kms\n");
>   		goto fail;
>   	}
>   
> -	priv->kms = &mdp4_kms->base.base;
>   	kms = priv->kms;
>   
>   	mdp4_kms->dev = dev;
>   
> -	mdp4_kms->mmio = msm_ioremap(pdev, NULL);
> -	if (IS_ERR(mdp4_kms->mmio)) {
> -		ret = PTR_ERR(mdp4_kms->mmio);
> -		goto fail;
> -	}
> -
> -	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		ret = irq;
> -		DRM_DEV_ERROR(dev->dev, "failed to get irq: %d\n", ret);
> -		goto fail;
> -	}
> -
> -	kms->irq = irq;
> -
> -	/* NOTE: driver for this regulator still missing upstream.. use
> -	 * _get_exclusive() and ignore the error if it does not exist
> -	 * (and hope that the bootloader left it on for us)
> -	 */
> -	mdp4_kms->vdd = devm_regulator_get_exclusive(&pdev->dev, "vdd");
> -	if (IS_ERR(mdp4_kms->vdd))
> -		mdp4_kms->vdd = NULL;
> -
>   	if (mdp4_kms->vdd) {
>   		ret = regulator_enable(mdp4_kms->vdd);
>   		if (ret) {
> @@ -442,24 +410,6 @@ static int mdp4_kms_init(struct drm_device *dev)
>   		}
>   	}
>   
> -	mdp4_kms->clk = devm_clk_get(&pdev->dev, "core_clk");
> -	if (IS_ERR(mdp4_kms->clk)) {
> -		DRM_DEV_ERROR(dev->dev, "failed to get core_clk\n");
> -		ret = PTR_ERR(mdp4_kms->clk);
> -		goto fail;
> -	}
> -
> -	mdp4_kms->pclk = devm_clk_get(&pdev->dev, "iface_clk");
> -	if (IS_ERR(mdp4_kms->pclk))
> -		mdp4_kms->pclk = NULL;
> -
> -	mdp4_kms->axi_clk = devm_clk_get(&pdev->dev, "bus_clk");
> -	if (IS_ERR(mdp4_kms->axi_clk)) {
> -		DRM_DEV_ERROR(dev->dev, "failed to get axi_clk\n");
> -		ret = PTR_ERR(mdp4_kms->axi_clk);
> -		goto fail;
> -	}
> -
>   	clk_set_rate(mdp4_kms->clk, max_clk);
>   
>   	read_mdp_hw_revision(mdp4_kms, &major, &minor);
> @@ -474,10 +424,9 @@ static int mdp4_kms_init(struct drm_device *dev)
>   	mdp4_kms->rev = minor;
>   
>   	if (mdp4_kms->rev >= 2) {
> -		mdp4_kms->lut_clk = devm_clk_get(&pdev->dev, "lut_clk");
> -		if (IS_ERR(mdp4_kms->lut_clk)) {
> +		if (!mdp4_kms->lut_clk) {
>   			DRM_DEV_ERROR(dev->dev, "failed to get lut_clk\n");
> -			ret = PTR_ERR(mdp4_kms->lut_clk);
> +			ret = -ENODEV;
>   			goto fail;
>   		}
>   		clk_set_rate(mdp4_kms->lut_clk, max_clk);
> @@ -560,7 +509,53 @@ static const struct dev_pm_ops mdp4_pm_ops = {
>   
>   static int mdp4_probe(struct platform_device *pdev)
>   {
> -	return msm_drv_probe(&pdev->dev, mdp4_kms_init, NULL);
> +	struct device *dev = &pdev->dev;
> +	struct mdp4_kms *mdp4_kms;
> +	int irq;
> +
> +	mdp4_kms = devm_kzalloc(dev, sizeof(*mdp4_kms), GFP_KERNEL);
> +	if (!mdp4_kms)
> +		return dev_err_probe(dev, -ENOMEM, "failed to allocate kms\n");
> +
> +	mdp4_kms->mmio = msm_ioremap(pdev, NULL);
> +	if (IS_ERR(mdp4_kms->mmio))
> +		return PTR_ERR(mdp4_kms->mmio);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return dev_err_probe(dev, irq, "failed to get irq\n");
> +
> +	mdp4_kms->base.base.irq = irq;
> +
> +	/* NOTE: driver for this regulator still missing upstream.. use
> +	 * _get_exclusive() and ignore the error if it does not exist
> +	 * (and hope that the bootloader left it on for us)
> +	 */
> +	mdp4_kms->vdd = devm_regulator_get_exclusive(&pdev->dev, "vdd");
> +	if (IS_ERR(mdp4_kms->vdd))
> +		mdp4_kms->vdd = NULL;
> +
> +	mdp4_kms->clk = devm_clk_get(&pdev->dev, "core_clk");
> +	if (IS_ERR(mdp4_kms->clk))
> +		return dev_err_probe(dev, PTR_ERR(mdp4_kms->clk), "failed to get core_clk\n");
> +
> +	mdp4_kms->pclk = devm_clk_get(&pdev->dev, "iface_clk");
> +	if (IS_ERR(mdp4_kms->pclk))
> +		mdp4_kms->pclk = NULL;
> +
> +	mdp4_kms->axi_clk = devm_clk_get(&pdev->dev, "bus_clk");
> +	if (IS_ERR(mdp4_kms->axi_clk))
> +		return dev_err_probe(dev, PTR_ERR(mdp4_kms->axi_clk), "failed to get axi_clk\n");
> +
> +	/*
> +	 * This is required for revn >= 2. Handle errors here and let the kms
> +	 * init bail out if the clock is not provided.
> +	 */
> +	mdp4_kms->lut_clk = devm_clk_get_optional(&pdev->dev, "lut_clk");
> +	if (IS_ERR(mdp4_kms->lut_clk))
> +		return dev_err_probe(dev, PTR_ERR(mdp4_kms->lut_clk), "failed to get lut_clk\n");

I can see that you have moved this from init to probe and only rev >=2 
needs it.

But, your check here will end up returning from probe because you have a 
return. So I guess you means just having dev_err_probe without the 
return and let the init fail if the clk is not found because we have the 
hw_rev only in init.

> +
> +	return msm_drv_probe(&pdev->dev, mdp4_kms_init, &mdp4_kms->base.base);
>   }
>   
>   static int mdp4_remove(struct platform_device *pdev)
