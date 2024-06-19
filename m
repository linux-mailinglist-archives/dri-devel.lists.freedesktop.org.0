Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C208990F53A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 19:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1CD10ED60;
	Wed, 19 Jun 2024 17:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="b/DMHMYG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F80110ED60;
 Wed, 19 Jun 2024 17:36:31 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J9kovg000787;
 Wed, 19 Jun 2024 17:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 63W9BCq6VlHfJn06OJqBKpAee/EZOawWgvEKWA09x60=; b=b/DMHMYGvvpzwbib
 pCHwwcOVD7zj63Gp6FxDW0kac5LCWkdY7C3PcKQpaxjN7QC4eEsLP5KMlk5cbc4A
 APIUORdd5+n5hUJHcK0TOcMItsOwRt3j7pMjHBZXQD1UKbUa4q/+7IGqSjKLasjX
 76luZRNmifPnnJXArABnVPxT68aXj0EgxUQ5fdl8qKsVg+UihZHKj9onkU+rrefi
 EfygKR2r9pq7QDGmfOfjhyDKYtRMxLyQZFxZZ/veqPL7zl37NaABXt6OSCdkZXtx
 OJK45MNOdZXQE8bVG9BlGeZkY+xyMPSJ09NH/ZLbwMYIBTPT4ATWg6tcWoxrgWL7
 s/m2oA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yujag2bnf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jun 2024 17:36:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45JHaSpI023002
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jun 2024 17:36:28 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Jun
 2024 10:36:27 -0700
Message-ID: <f84c0d3c-4c09-4067-843f-91f84ad06214@quicinc.com>
Date: Wed, 19 Jun 2024 10:36:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/14] drm/msm/hdmi: implement proper runtime PM
 handling
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
 <20240522-fd-hdmi-hpd-v2-9-c30bdb7c5c7e@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-9-c30bdb7c5c7e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: z3MIkBj3XIcrlVGZUdD5wLwdVzrIn-0k
X-Proofpoint-ORIG-GUID: z3MIkBj3XIcrlVGZUdD5wLwdVzrIn-0k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406190132
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



On 5/22/2024 3:51 AM, Dmitry Baryshkov wrote:
> It is completely not obvious, but the so-called 'hpd' clocks and
> regulators are required for the HDMI host to function properly. Merge
> pwr and hpd regulators. Use regulators, clocks and pinctrl to implement
> proper runtime PM callbacks.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/hdmi/hdmi.c        | 62 +++++++++++++++++++++++++---------
>   drivers/gpu/drm/msm/hdmi/hdmi.h        |  7 +---
>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 12 -------
>   drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 42 +----------------------
>   4 files changed, 48 insertions(+), 75 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 7ec4ca3b7597..cc671baad87b 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -8,6 +8,7 @@
>   #include <linux/gpio/consumer.h>
>   #include <linux/of_irq.h>
>   #include <linux/of_platform.h>
> +#include <linux/pinctrl/consumer.h>
>   #include <linux/platform_device.h>
>   
>   #include <drm/drm_bridge_connector.h>
> @@ -226,11 +227,11 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>   	.item ## _names = item ##_names_ ## entry, \
>   	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
>   
> -static const char *hpd_reg_names_8960[] = {"core-vdda"};
> +static const char *pwr_reg_names_8960[] = {"core-vdda"};
>   static const char *hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
>   
>   static const struct hdmi_platform_config hdmi_tx_8960_config = {
> -		HDMI_CFG(hpd_reg, 8960),
> +		HDMI_CFG(pwr_reg, 8960),
>   		HDMI_CFG(hpd_clk, 8960),
>   };
>   
> @@ -434,20 +435,6 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
>   	if (hdmi->irq < 0)
>   		return hdmi->irq;
>   
> -	hdmi->hpd_regs = devm_kcalloc(&pdev->dev,
> -				      config->hpd_reg_cnt,
> -				      sizeof(hdmi->hpd_regs[0]),
> -				      GFP_KERNEL);
> -	if (!hdmi->hpd_regs)
> -		return -ENOMEM;
> -
> -	for (i = 0; i < config->hpd_reg_cnt; i++)
> -		hdmi->hpd_regs[i].supply = config->hpd_reg_names[i];
> -
> -	ret = devm_regulator_bulk_get(&pdev->dev, config->hpd_reg_cnt, hdmi->hpd_regs);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "failed to get hpd regulators\n");
> -
>   	hdmi->pwr_regs = devm_kcalloc(&pdev->dev,
>   				      config->pwr_reg_cnt,
>   				      sizeof(hdmi->pwr_regs[0]),
> @@ -525,6 +512,48 @@ static void msm_hdmi_dev_remove(struct platform_device *pdev)
>   	msm_hdmi_put_phy(hdmi);
>   }
>   
> +static int msm_hdmi_runtime_suspend(struct device *dev)
> +{
> +	struct hdmi *hdmi = dev_get_drvdata(dev);
> +	const struct hdmi_platform_config *config = hdmi->config;
> +
> +	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
> +
> +	pinctrl_pm_select_sleep_state(dev);
> +
> +	regulator_bulk_disable(config->pwr_reg_cnt, hdmi->pwr_regs);
> +
> +	return 0;
> +}
> +
> +static int msm_hdmi_runtime_resume(struct device *dev)
> +{
> +	struct hdmi *hdmi = dev_get_drvdata(dev);
> +	const struct hdmi_platform_config *config = hdmi->config;
> +	int ret;
> +
> +	ret = regulator_bulk_enable(config->pwr_reg_cnt, hdmi->pwr_regs);
> +	if (ret)
> +		return ret;
> +
> +	ret = pinctrl_pm_select_default_state(dev);
> +	if (ret)
> +		goto fail;
> +
> +	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
> +	if (ret)
> +		goto fail;
> +
> +	return 0;
> +
> +fail:
> +	pinctrl_pm_select_sleep_state(dev);
> +
> +	return ret;
> +}
> +
> +DEFINE_RUNTIME_DEV_PM_OPS(msm_hdmi_pm_ops, msm_hdmi_runtime_suspend, msm_hdmi_runtime_resume, NULL);
> +
>   static const struct of_device_id msm_hdmi_dt_match[] = {
>   	{ .compatible = "qcom,hdmi-tx-8996", .data = &hdmi_tx_8974_config },
>   	{ .compatible = "qcom,hdmi-tx-8994", .data = &hdmi_tx_8974_config },
> @@ -541,6 +570,7 @@ static struct platform_driver msm_hdmi_driver = {
>   	.driver = {
>   		.name = "hdmi_msm",
>   		.of_match_table = msm_hdmi_dt_match,
> +		.pm = &msm_hdmi_pm_ops,
>   	},
>   };
>   
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
> index eeba85ffef09..ee5463eb41b6 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.h
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
> @@ -48,7 +48,6 @@ struct hdmi {
>   	void __iomem *qfprom_mmio;
>   	phys_addr_t mmio_phy_addr;
>   
> -	struct regulator_bulk_data *hpd_regs;
>   	struct regulator_bulk_data *pwr_regs;
>   	struct clk_bulk_data *hpd_clks;
>   	struct clk *extp_clk;
> @@ -86,11 +85,7 @@ struct hdmi {
>   
>   /* platform config data (ie. from DT, or pdata) */
>   struct hdmi_platform_config {
> -	/* regulators that need to be on for hpd: */
> -	const char **hpd_reg_names;
> -	int hpd_reg_cnt;
> -
> -	/* regulators that need to be on for screen pwr: */
> +	/* regulators that need to be on: */
>   	const char **pwr_reg_names;
>   	int pwr_reg_cnt;
>   
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> index d1b35328b6e8..cddba640d292 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> @@ -16,15 +16,10 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
>   	struct drm_device *dev = bridge->dev;
>   	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
>   	struct hdmi *hdmi = hdmi_bridge->hdmi;
> -	const struct hdmi_platform_config *config = hdmi->config;
>   	int ret;
>   
>   	pm_runtime_resume_and_get(&hdmi->pdev->dev);
>   
> -	ret = regulator_bulk_enable(config->pwr_reg_cnt, hdmi->pwr_regs);
> -	if (ret)
> -		DRM_DEV_ERROR(dev->dev, "failed to enable pwr regulator: %d\n", ret);
> -
>   	if (hdmi->extp_clk) {
>   		DBG("pixclock: %lu", hdmi->pixclock);
>   		ret = clk_set_rate(hdmi->extp_clk, hdmi->pixclock);
> @@ -39,11 +34,8 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
>   
>   static void power_off(struct drm_bridge *bridge)
>   {
> -	struct drm_device *dev = bridge->dev;
>   	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
>   	struct hdmi *hdmi = hdmi_bridge->hdmi;
> -	const struct hdmi_platform_config *config = hdmi->config;
> -	int ret;
>   
>   	/* TODO do we need to wait for final vblank somewhere before
>   	 * cutting the clocks?
> @@ -53,10 +45,6 @@ static void power_off(struct drm_bridge *bridge)
>   	if (hdmi->extp_clk)
>   		clk_disable_unprepare(hdmi->extp_clk);
>   
> -	ret = regulator_bulk_disable(config->pwr_reg_cnt, hdmi->pwr_regs);
> -	if (ret)
> -		DRM_DEV_ERROR(dev->dev, "failed to disable pwr regulator: %d\n", ret);
> -
>   	pm_runtime_put(&hdmi->pdev->dev);
>   }
>   
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
> index fc21ad3b01dc..32e447267e3b 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
> @@ -64,36 +64,17 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
>   {
>   	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
>   	struct hdmi *hdmi = hdmi_bridge->hdmi;
> -	const struct hdmi_platform_config *config = hdmi->config;
>   	struct device *dev = &hdmi->pdev->dev;
>   	uint32_t hpd_ctrl;
>   	int ret;
>   	unsigned long flags;
>   
> -	ret = regulator_bulk_enable(config->hpd_reg_cnt, hdmi->hpd_regs);
> -	if (ret) {
> -		DRM_DEV_ERROR(dev, "failed to enable hpd regulators: %d\n", ret);
> -		goto fail;
> -	}
> -
> -	ret = pinctrl_pm_select_default_state(dev);
> -	if (ret) {
> -		DRM_DEV_ERROR(dev, "pinctrl state chg failed: %d\n", ret);
> -		goto fail;
> -	}
> -
>   	if (hdmi->hpd_gpiod)
>   		gpiod_set_value_cansleep(hdmi->hpd_gpiod, 1);
>   
>   	ret = pm_runtime_resume_and_get(dev);
> -	if (ret) {
> -		DRM_DEV_ERROR(dev, "runtime resume failed: %d\n", ret);
> -		goto fail;
> -	}
> -
> -	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
>   	if (ret)
> -		goto fail;
> +		return ret;
>   
>   	msm_hdmi_set_mode(hdmi, false);
>   	msm_hdmi_phy_reset(hdmi);
> @@ -119,32 +100,18 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
>   	spin_unlock_irqrestore(&hdmi->reg_lock, flags);
>   
>   	return 0;
> -
> -fail:
> -	return ret;
>   }
>   
>   void msm_hdmi_hpd_disable(struct hdmi *hdmi)
>   {
> -	const struct hdmi_platform_config *config = hdmi->config;
>   	struct device *dev = &hdmi->pdev->dev;
> -	int ret;
>   
>   	/* Disable HPD interrupt */
>   	hdmi_write(hdmi, REG_HDMI_HPD_INT_CTRL, 0);
>   
>   	msm_hdmi_set_mode(hdmi, false);
>   
> -	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
>   	pm_runtime_put(dev);
> -
> -	ret = pinctrl_pm_select_sleep_state(dev);
> -	if (ret)
> -		dev_warn(dev, "pinctrl state chg failed: %d\n", ret);
> -
> -	ret = regulator_bulk_disable(config->hpd_reg_cnt, hdmi->hpd_regs);
> -	if (ret)
> -		dev_warn(dev, "failed to disable hpd regulator: %d\n", ret);
>   }
>   
>   void msm_hdmi_hpd_irq(struct drm_bridge *bridge)
> @@ -179,7 +146,6 @@ void msm_hdmi_hpd_irq(struct drm_bridge *bridge)
>   
>   static enum drm_connector_status detect_reg(struct hdmi *hdmi)
>   {
> -	const struct hdmi_platform_config *config = hdmi->config;
>   	uint32_t hpd_int_status = 0;
>   	int ret;
>   
> @@ -187,14 +153,8 @@ static enum drm_connector_status detect_reg(struct hdmi *hdmi)
>   	if (ret)
>   		goto out;
>   
> -	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
> -	if (ret)
> -		goto out;
> -
>   	hpd_int_status = hdmi_read(hdmi, REG_HDMI_HPD_INT_STATUS);
>   
> -	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
> -
>   out:
>   	pm_runtime_put(&hdmi->pdev->dev);
>   
> 
> -- 
> 2.39.2
> 
