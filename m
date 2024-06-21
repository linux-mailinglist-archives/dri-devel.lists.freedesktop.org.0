Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB019126F2
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 15:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B50910F19B;
	Fri, 21 Jun 2024 13:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="CJPhnDgg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54AB110F19A
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 13:45:33 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45LBc0dZ007039;
 Fri, 21 Jun 2024 14:51:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 faGsSAC8ulOthkvxWXbNTJoYirta5hMr2PYlnCbqe+A=; b=CJPhnDggnyBO2OL6
 QBlbiCq+wpmtunvZJ4Aw8T4+S9jxDpULUeCkAj6lQTxhsH2QzXVeZwCcKCACFZEs
 DTV1vfUuhCpHHjP+lI9pV44RHlDolTi1PeuXwP3PVYH4Ox0cCHdyPC5mw4vNe20S
 +/6SNeV80q4IIFEGh/SdbBdSxn96C/4aDiJGeO+XWXeewqTMBZN9WyeH6a+kRtM7
 DpVtM0sTHh05bMCsfSZPfPe7aVnY0nhyR5WigSvJ9Gg/w2Gy1chCluapmNxmDLwN
 D3T07wohV2QasIKyegJe5LaQDCbJctibgVxJYkKkFigWLp9FfSl185LNK5quPKU1
 YmmpxQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yvrkk3nub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jun 2024 14:51:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DC35D4002D;
 Fri, 21 Jun 2024 14:51:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1399E21F15B;
 Fri, 21 Jun 2024 14:50:59 +0200 (CEST)
Received: from [10.48.87.177] (10.48.87.177) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 21 Jun
 2024 14:50:58 +0200
Message-ID: <f95e0485-0073-40b1-84ae-535b55d0cd0d@foss.st.com>
Date: Fri, 21 Jun 2024 14:50:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 2/3] drm/stm: dsi: add pm runtime ops
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240129104106.43141-1-raphael.gallais-pou@foss.st.com>
 <20240129104106.43141-3-raphael.gallais-pou@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20240129104106.43141-3-raphael.gallais-pou@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.87.177]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_04,2024-06-21_01,2024-05-17_01
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

Hi Raphael,

thanks for the patch.

Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>

Tested-by: Yannick Fertre <yannick.fertre@foss.st.com>

BR


Le 29/01/2024 à 11:41, Raphael Gallais-Pou a écrit :
> From: Yannick Fertre <yannick.fertre@foss.st.com>
>
> Update control of clocks and supply thanks to the PM runtime
> mechanism to avoid kernel crash during a system suspend.
>
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
> Changes in v2:
> 	- Changed SET_RUNTIME_PM_OPS to RUNTIME_PM_OPS and removed
> 	__maybe_unused
> ---
>   drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 24 ++++++++++++++++++------
>   1 file changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> index b1aee43d51e9..82fff9e84345 100644
> --- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> +++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> @@ -11,6 +11,7 @@
>   #include <linux/mod_devicetable.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>   #include <linux/regulator/consumer.h>
>   
>   #include <video/mipi_display.h>
> @@ -77,6 +78,7 @@ enum dsi_color {
>   struct dw_mipi_dsi_stm {
>   	void __iomem *base;
>   	struct clk *pllref_clk;
> +	struct clk *pclk;
>   	struct dw_mipi_dsi *dsi;
>   	u32 hw_version;
>   	int lane_min_kbps;
> @@ -443,7 +445,6 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct dw_mipi_dsi_stm *dsi;
> -	struct clk *pclk;
>   	int ret;
>   
>   	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> @@ -483,21 +484,21 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
>   		goto err_clk_get;
>   	}
>   
> -	pclk = devm_clk_get(dev, "pclk");
> -	if (IS_ERR(pclk)) {
> -		ret = PTR_ERR(pclk);
> +	dsi->pclk = devm_clk_get(dev, "pclk");
> +	if (IS_ERR(dsi->pclk)) {
> +		ret = PTR_ERR(dsi->pclk);
>   		DRM_ERROR("Unable to get peripheral clock: %d\n", ret);
>   		goto err_dsi_probe;
>   	}
>   
> -	ret = clk_prepare_enable(pclk);
> +	ret = clk_prepare_enable(dsi->pclk);
>   	if (ret) {
>   		DRM_ERROR("%s: Failed to enable peripheral clk\n", __func__);
>   		goto err_dsi_probe;
>   	}
>   
>   	dsi->hw_version = dsi_read(dsi, DSI_VERSION) & VERSION;
> -	clk_disable_unprepare(pclk);
> +	clk_disable_unprepare(dsi->pclk);
>   
>   	if (dsi->hw_version != HWVER_130 && dsi->hw_version != HWVER_131) {
>   		ret = -ENODEV;
> @@ -551,6 +552,7 @@ static int dw_mipi_dsi_stm_suspend(struct device *dev)
>   	DRM_DEBUG_DRIVER("\n");
>   
>   	clk_disable_unprepare(dsi->pllref_clk);
> +	clk_disable_unprepare(dsi->pclk);
>   	regulator_disable(dsi->vdd_supply);
>   
>   	return 0;
> @@ -569,8 +571,16 @@ static int dw_mipi_dsi_stm_resume(struct device *dev)
>   		return ret;
>   	}
>   
> +	ret = clk_prepare_enable(dsi->pclk);
> +	if (ret) {
> +		regulator_disable(dsi->vdd_supply);
> +		DRM_ERROR("Failed to enable pclk: %d\n", ret);
> +		return ret;
> +	}
> +
>   	ret = clk_prepare_enable(dsi->pllref_clk);
>   	if (ret) {
> +		clk_disable_unprepare(dsi->pclk);
>   		regulator_disable(dsi->vdd_supply);
>   		DRM_ERROR("Failed to enable pllref_clk: %d\n", ret);
>   		return ret;
> @@ -582,6 +592,8 @@ static int dw_mipi_dsi_stm_resume(struct device *dev)
>   static const struct dev_pm_ops dw_mipi_dsi_stm_pm_ops = {
>   	SYSTEM_SLEEP_PM_OPS(dw_mipi_dsi_stm_suspend,
>   			    dw_mipi_dsi_stm_resume)
> +	RUNTIME_PM_OPS(dw_mipi_dsi_stm_suspend,
> +		       dw_mipi_dsi_stm_resume, NULL)
>   };
>   
>   static struct platform_driver dw_mipi_dsi_stm_driver = {
