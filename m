Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A3D90E031
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 01:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B795410E81A;
	Tue, 18 Jun 2024 23:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="HvU3coHK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21D610E80F;
 Tue, 18 Jun 2024 23:51:55 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ILav2K007306;
 Tue, 18 Jun 2024 23:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 J91iosksmeOdMOZzm+kOJZZC2FYeRzmBvrrl1NXM6ME=; b=HvU3coHKk0oI9+r/
 j2NVV3Jnt4b16AQHSZbbq5sw3IMscW6IDZRPtvT+YbZnKbC1xt75K9xc1djG3VW6
 iOVm9OCGiX6S+ENN3gISkGJGP/0J2iA0XcQ5sqLxjicyIZCQQ572ZDSc6Sr4Mm06
 UPJXUy4Y8tWpaQi2P2K72XJ5evEnLi6Q02VN79CPgMrBFnSQ2HDEQGgfPi0G+IwB
 42uydJtlU7dGLsNKBdMVfozJ5/DVmpLLbkR1AP8zHNCoZvuUaKnWbquaffiXPn1N
 ZPQYChP1RgnlLLxOoi8ax8zw/ttCVvfH0bwgqIhBoaYLLnsqYRR0A9z4kO768RMK
 NkzKPA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuj9u06n1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jun 2024 23:51:52 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45INppBr025257
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jun 2024 23:51:51 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 16:51:51 -0700
Message-ID: <badbf856-1b6d-42cd-880d-cdde2f293a86@quicinc.com>
Date: Tue, 18 Jun 2024 16:51:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/14] drm/msm/hdmi: switch to clk_bulk API
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
 <20240522-fd-hdmi-hpd-v2-6-c30bdb7c5c7e@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-6-c30bdb7c5c7e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: XTn-NELIBobjl-y64lU50Y8cByUxh83c
X-Proofpoint-ORIG-GUID: XTn-NELIBobjl-y64lU50Y8cByUxh83c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_06,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 mlxlogscore=999 clxscore=1011 mlxscore=0 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180174
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
> The last platform using legacy clock names for HDMI block (APQ8064)
> switched to new clock names in 5.16. It's time to stop caring about old
> DT, drop hand-coded helpers and switch to clk_bulk_* API.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/hdmi/hdmi.c     | 15 +++++---------
>   drivers/gpu/drm/msm/hdmi/hdmi.h     |  2 +-
>   drivers/gpu/drm/msm/hdmi/hdmi_hpd.c | 39 +++++++++++++------------------------
>   3 files changed, 19 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index c14e009f38b1..7ec4ca3b7597 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -469,17 +469,12 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
>   	if (!hdmi->hpd_clks)
>   		return -ENOMEM;
>   
> -	for (i = 0; i < config->hpd_clk_cnt; i++) {
> -		struct clk *clk;
> +	for (i = 0; i < config->hpd_clk_cnt; i++)
> +		hdmi->hpd_clks[i].id = config->hpd_clk_names[i];
>   
> -		clk = msm_clk_get(pdev, config->hpd_clk_names[i]);
> -		if (IS_ERR(clk))
> -			return dev_err_probe(dev, PTR_ERR(clk),
> -					     "failed to get hpd clk: %s\n",
> -					     config->hpd_clk_names[i]);
> -
> -		hdmi->hpd_clks[i] = clk;
> -	}
> +	ret = devm_clk_bulk_get(&pdev->dev, config->hpd_clk_cnt, hdmi->hpd_clks);
> +	if (ret)
> +		return ret;
>   
>   	hdmi->extp_clk = devm_clk_get_optional(&pdev->dev, "extp");
>   	if (IS_ERR(hdmi->extp_clk))
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
> index c0d60ed23b75..eeba85ffef09 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.h
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
> @@ -50,7 +50,7 @@ struct hdmi {
>   
>   	struct regulator_bulk_data *hpd_regs;
>   	struct regulator_bulk_data *pwr_regs;
> -	struct clk **hpd_clks;
> +	struct clk_bulk_data *hpd_clks;
>   	struct clk *extp_clk;
>   
>   	struct gpio_desc *hpd_gpiod;
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
> index 7ae69b14e953..36266aa626dc 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
> @@ -60,27 +60,6 @@ static void msm_hdmi_phy_reset(struct hdmi *hdmi)
>   	}
>   }
>   
> -static void enable_hpd_clocks(struct hdmi *hdmi, bool enable)
> -{
> -	const struct hdmi_platform_config *config = hdmi->config;
> -	struct device *dev = &hdmi->pdev->dev;
> -	int i, ret;
> -
> -	if (enable) {
> -		for (i = 0; i < config->hpd_clk_cnt; i++) {
> -			ret = clk_prepare_enable(hdmi->hpd_clks[i]);
> -			if (ret) {
> -				DRM_DEV_ERROR(dev,
> -					"failed to enable hpd clk: %s (%d)\n",
> -					config->hpd_clk_names[i], ret);
> -			}
> -		}
> -	} else {
> -		for (i = config->hpd_clk_cnt - 1; i >= 0; i--)
> -			clk_disable_unprepare(hdmi->hpd_clks[i]);
> -	}
> -}
> -
>   int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
>   {
>   	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
> @@ -107,7 +86,9 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
>   		gpiod_set_value_cansleep(hdmi->hpd_gpiod, 1);
>   
>   	pm_runtime_get_sync(dev);
> -	enable_hpd_clocks(hdmi, true);
> +	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
> +	if (ret)
> +		goto fail;
>   
>   	msm_hdmi_set_mode(hdmi, false);
>   	msm_hdmi_phy_reset(hdmi);
> @@ -149,7 +130,7 @@ void msm_hdmi_hpd_disable(struct hdmi *hdmi)
>   
>   	msm_hdmi_set_mode(hdmi, false);
>   
> -	enable_hpd_clocks(hdmi, false);
> +	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
>   	pm_runtime_put(dev);
>   
>   	ret = pinctrl_pm_select_sleep_state(dev);
> @@ -193,14 +174,20 @@ void msm_hdmi_hpd_irq(struct drm_bridge *bridge)
>   
>   static enum drm_connector_status detect_reg(struct hdmi *hdmi)
>   {
> -	uint32_t hpd_int_status;
> +	const struct hdmi_platform_config *config = hdmi->config;
> +	uint32_t hpd_int_status = 0;
> +	int ret;
>   
>   	pm_runtime_get_sync(&hdmi->pdev->dev);
> -	enable_hpd_clocks(hdmi, true);
> +	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
> +	if (ret)
> +		goto out;
>   
>   	hpd_int_status = hdmi_read(hdmi, REG_HDMI_HPD_INT_STATUS);
>   
> -	enable_hpd_clocks(hdmi, false);
> +	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
> +
> +out:
>   	pm_runtime_put(&hdmi->pdev->dev);
>   
>   	return (hpd_int_status & HDMI_HPD_INT_STATUS_CABLE_DETECTED) ?
> 
> -- 
> 2.39.2
> 
