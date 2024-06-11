Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E3E904356
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 20:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24DE010E6FE;
	Tue, 11 Jun 2024 18:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="TItGzoKg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC39310E6FE;
 Tue, 11 Jun 2024 18:16:26 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BE0Ixp001164;
 Tue, 11 Jun 2024 18:16:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HCfn8C8/XpyROf2ldYcIa11DfhUOExIUTuzL0u1dX10=; b=TItGzoKgyqgfK6+m
 npnyUQw67PHAwt7IR4r8spst3OnLtX9zo4GAryuOgSyGtU5yqWBouhSqluODM4ra
 8M5MSjmlpcjXmqeQQEH8isrtaA5KwESFM5TBp4CqHeRmKL3ky6+n2a6g1qop6MMx
 9SMdwkwR0lr+yusuc+GEHlfYBHsh8zLH74xwGnb/yPJGsvol3JfXm1Ed7IMVhcj4
 AeziKnrTUEsJeP2uHWFrLwxzECsBX8BrQzF0aQ0ycLcW8MiJQsNmZfveudFpX5OC
 GDNvlhyCcVBIdAKKEyEbBtCme7zTF5BcRyQPaVHe0Komkzk9b39WfBUsSxKIx9bf
 hAy4hg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymfp7ewer-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jun 2024 18:16:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45BIGMiq021736
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jun 2024 18:16:22 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Jun
 2024 11:16:21 -0700
Message-ID: <fec9efa1-8e8a-48a5-8d8b-8c6346a06dad@quicinc.com>
Date: Tue, 11 Jun 2024 11:16:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/14] drm/msm/hdmi: simplify extp clock handling
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
 <20240522-fd-hdmi-hpd-v2-2-c30bdb7c5c7e@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-2-c30bdb7c5c7e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 9xqB2I9mCLOH9MISd2RycTWFwYxorwld
X-Proofpoint-ORIG-GUID: 9xqB2I9mCLOH9MISd2RycTWFwYxorwld
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_09,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110125
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
> With the extp being the only "power" clock left, remove the surrounding
> loops and handle the extp clock directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/hdmi/hdmi.c        | 24 ++++--------------------
>   drivers/gpu/drm/msm/hdmi/hdmi.h        |  6 +-----
>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 33 +++++++++++++--------------------
>   3 files changed, 18 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 108c86925780..681265e29aa0 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -235,13 +235,11 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
>   };
>   
>   static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
> -static const char *pwr_clk_names_8x74[] = {"extp"};
>   static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
>   static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
>   
>   static const struct hdmi_platform_config hdmi_tx_8974_config = {
>   		HDMI_CFG(pwr_reg, 8x74),
> -		HDMI_CFG(pwr_clk, 8x74),
>   		HDMI_CFG(hpd_clk, 8x74),
>   		.hpd_freq      = hpd_clk_freq_8x74,
>   };
> @@ -485,24 +483,10 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
>   		hdmi->hpd_clks[i] = clk;
>   	}
>   
> -	hdmi->pwr_clks = devm_kcalloc(&pdev->dev,
> -				      config->pwr_clk_cnt,
> -				      sizeof(hdmi->pwr_clks[0]),
> -				      GFP_KERNEL);
> -	if (!hdmi->pwr_clks)
> -		return -ENOMEM;
> -
> -	for (i = 0; i < config->pwr_clk_cnt; i++) {
> -		struct clk *clk;
> -
> -		clk = msm_clk_get(pdev, config->pwr_clk_names[i]);
> -		if (IS_ERR(clk))
> -			return dev_err_probe(dev, PTR_ERR(clk),
> -					     "failed to get pwr clk: %s\n",
> -					     config->pwr_clk_names[i]);
> -
> -		hdmi->pwr_clks[i] = clk;
> -	}
> +	hdmi->extp_clk = devm_clk_get_optional(&pdev->dev, "extp");
> +	if (IS_ERR(hdmi->extp_clk))
> +		return dev_err_probe(dev, PTR_ERR(hdmi->extp_clk),
> +				     "failed to get extp clock\n");
>   
>   	hdmi->hpd_gpiod = devm_gpiod_get_optional(&pdev->dev, "hpd", GPIOD_IN);
>   	/* This will catch e.g. -EPROBE_DEFER */
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
> index 4586baf36415..abdbe4779cf9 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.h
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
> @@ -51,7 +51,7 @@ struct hdmi {
>   	struct regulator_bulk_data *hpd_regs;
>   	struct regulator_bulk_data *pwr_regs;
>   	struct clk **hpd_clks;
> -	struct clk **pwr_clks;
> +	struct clk *extp_clk;
>   
>   	struct gpio_desc *hpd_gpiod;
>   
> @@ -98,10 +98,6 @@ struct hdmi_platform_config {
>   	const char **hpd_clk_names;
>   	const long unsigned *hpd_freq;
>   	int hpd_clk_cnt;
> -
> -	/* clks that need to be on for screen pwr (ie pixel clk): */
> -	const char **pwr_clk_names;
> -	int pwr_clk_cnt;
>   };
>   
>   struct hdmi_bridge {
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> index 4a5b5112227f..9eb4d06bdc0e 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> @@ -17,7 +17,7 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
>   	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
>   	struct hdmi *hdmi = hdmi_bridge->hdmi;
>   	const struct hdmi_platform_config *config = hdmi->config;
> -	int i, ret;
> +	int ret;
>   
>   	pm_runtime_get_sync(&hdmi->pdev->dev);
>   
> @@ -25,21 +25,15 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
>   	if (ret)
>   		DRM_DEV_ERROR(dev->dev, "failed to enable pwr regulator: %d\n", ret);
>   
> -	if (config->pwr_clk_cnt > 0) {
> +	if (hdmi->extp_clk) {
>   		DBG("pixclock: %lu", hdmi->pixclock);
> -		ret = clk_set_rate(hdmi->pwr_clks[0], hdmi->pixclock);
> -		if (ret) {
> -			DRM_DEV_ERROR(dev->dev, "failed to set pixel clk: %s (%d)\n",
> -					config->pwr_clk_names[0], ret);
> -		}
> -	}
> +		ret = clk_set_rate(hdmi->extp_clk, hdmi->pixclock);
> +		if (ret)
> +			DRM_DEV_ERROR(dev->dev, "failed to set extp clk rate: %d\n", ret);
>   
> -	for (i = 0; i < config->pwr_clk_cnt; i++) {
> -		ret = clk_prepare_enable(hdmi->pwr_clks[i]);
> -		if (ret) {
> -			DRM_DEV_ERROR(dev->dev, "failed to enable pwr clk: %s (%d)\n",
> -					config->pwr_clk_names[i], ret);
> -		}
> +		ret = clk_prepare_enable(hdmi->extp_clk);
> +		if (ret)
> +			DRM_DEV_ERROR(dev->dev, "failed to enable extp clk: %d\n", ret);
>   	}
>   }
>   
> @@ -49,15 +43,15 @@ static void power_off(struct drm_bridge *bridge)
>   	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
>   	struct hdmi *hdmi = hdmi_bridge->hdmi;
>   	const struct hdmi_platform_config *config = hdmi->config;
> -	int i, ret;
> +	int ret;
>   
>   	/* TODO do we need to wait for final vblank somewhere before
>   	 * cutting the clocks?
>   	 */
>   	mdelay(16 + 4);
>   
> -	for (i = 0; i < config->pwr_clk_cnt; i++)
> -		clk_disable_unprepare(hdmi->pwr_clks[i]);
> +	if (hdmi->extp_clk)
> +		clk_disable_unprepare(hdmi->extp_clk);
>   
>   	ret = regulator_bulk_disable(config->pwr_reg_cnt, hdmi->pwr_regs);
>   	if (ret)
> @@ -271,7 +265,6 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
>   {
>   	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
>   	struct hdmi *hdmi = hdmi_bridge->hdmi;
> -	const struct hdmi_platform_config *config = hdmi->config;
>   	struct msm_drm_private *priv = bridge->dev->dev_private;
>   	struct msm_kms *kms = priv->kms;
>   	long actual, requested;
> @@ -285,8 +278,8 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
>   	if (kms->funcs->round_pixclk)
>   		actual = kms->funcs->round_pixclk(kms,
>   			requested, hdmi_bridge->hdmi->encoder);
> -	else if (config->pwr_clk_cnt > 0)
> -		actual = clk_round_rate(hdmi->pwr_clks[0], requested);
> +	else if (hdmi->extp_clk)
> +		actual = clk_round_rate(hdmi->extp_clk, requested);
>   	else
>   		actual = requested;
>   
> 
> -- 
> 2.39.2
> 
