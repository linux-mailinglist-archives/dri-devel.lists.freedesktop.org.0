Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B9B90E051
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 02:01:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0BD610E81D;
	Wed, 19 Jun 2024 00:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="PXwJfJqF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8F410E1E2;
 Wed, 19 Jun 2024 00:01:01 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ILaNPk001113;
 Wed, 19 Jun 2024 00:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xVD7KOpuBOvNjrz+9mgfdwPgt4x1SXqbuiYEaj4mg/E=; b=PXwJfJqFOKmFWKhY
 0yI/pXl/+lAguhsPL/im/FTeMw+UdnsbSvwKxUJSqcjxaa5DTuPrjatU+OTNryqw
 l1KbwaIWr3GbM9O8kGhQWK108xIHmzFx4fdlX4kzLRVqq03CYRYY783oOgP5CIlW
 vDJPAwCwEQBgf0lThHAcpv43/eQku0jN0XDWZuZftQ8TjNm3/G+pmN4OBw3wi6dz
 9/Ea42MW+SPe7lSbVYV8br5csaI1xAsYTzKMX7mfn4mV9D85P617IzLByuAy/rNW
 saKLboC/og6aw3Xgr8akBbotpBIv90UcMwYYLsPym/g19hDs3SBcztXMEASgGmHe
 Amzjsg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuja2875r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jun 2024 00:00:57 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45J00ufS001608
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jun 2024 00:00:56 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 17:00:56 -0700
Message-ID: <9ddb841c-382a-4684-92cb-3a07e72ce5da@quicinc.com>
Date: Tue, 18 Jun 2024 17:00:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/14] drm/msm/hdmi: switch to
 pm_runtime_resume_and_get()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
 <20240522-fd-hdmi-hpd-v2-7-c30bdb7c5c7e@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-7-c30bdb7c5c7e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: JbHUk5wEWQBDUxEURMskGSCvS708-Tom
X-Proofpoint-ORIG-GUID: JbHUk5wEWQBDUxEURMskGSCvS708-Tom
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_06,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180176
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



On 5/22/2024 3:50 AM, Dmitry Baryshkov wrote:
> The pm_runtime_get_sync() function is a bad choise for runtime power

[nit: s/choise/choice/]

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> management. Switch HDMI driver to pm_runtime_resume_and_get() and add
> proper error handling, while we are at it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  2 +-
>   drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 12 ++++++++++--
>   drivers/gpu/drm/msm/hdmi/hdmi_phy.c    |  6 +++++-
>   3 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> index fb99328107dd..d1b35328b6e8 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> @@ -19,7 +19,7 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
>   	const struct hdmi_platform_config *config = hdmi->config;
>   	int ret;
>   
> -	pm_runtime_get_sync(&hdmi->pdev->dev);
> +	pm_runtime_resume_and_get(&hdmi->pdev->dev);
>   
>   	ret = regulator_bulk_enable(config->pwr_reg_cnt, hdmi->pwr_regs);
>   	if (ret)
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
> index 36266aa626dc..fc21ad3b01dc 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
> @@ -85,7 +85,12 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
>   	if (hdmi->hpd_gpiod)
>   		gpiod_set_value_cansleep(hdmi->hpd_gpiod, 1);
>   
> -	pm_runtime_get_sync(dev);
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "runtime resume failed: %d\n", ret);
> +		goto fail;
> +	}
> +
>   	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
>   	if (ret)
>   		goto fail;
> @@ -178,7 +183,10 @@ static enum drm_connector_status detect_reg(struct hdmi *hdmi)
>   	uint32_t hpd_int_status = 0;
>   	int ret;
>   
> -	pm_runtime_get_sync(&hdmi->pdev->dev);
> +	ret = pm_runtime_resume_and_get(&hdmi->pdev->dev);
> +	if (ret)
> +		goto out;
> +
>   	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
>   	if (ret)
>   		goto out;
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> index 88a3423b7f24..d5acae752300 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> @@ -58,7 +58,11 @@ int msm_hdmi_phy_resource_enable(struct hdmi_phy *phy)
>   	struct device *dev = &phy->pdev->dev;
>   	int i, ret = 0;
>   
> -	pm_runtime_get_sync(dev);
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "runtime resume failed: %d\n", ret);
> +		return ret;
> +	}
>   
>   	ret = regulator_bulk_enable(cfg->num_regs, phy->regs);
>   	if (ret) {
> 
> -- 
> 2.39.2
> 
