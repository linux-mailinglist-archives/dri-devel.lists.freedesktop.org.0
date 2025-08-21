Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E41B2F4E5
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 12:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CFD210E8F3;
	Thu, 21 Aug 2025 10:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="x54WHZWt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2017 seconds by postgrey-1.36 at gabe;
 Thu, 21 Aug 2025 10:13:24 UTC
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8758A10E8F3;
 Thu, 21 Aug 2025 10:13:24 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L8uf03028719;
 Thu, 21 Aug 2025 11:39:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 kHxcorhp5czLlBBNNIvPxeZEYbfShmd+8rRbKqHVLQc=; b=x54WHZWtHoVtnKSh
 GwXIq32qEehSt5QN4pnCvtl8/TiFHUGkCVxLDpTAaQktot64B36wulxk1ei+r5EB
 q4oJU0m5ApNcrcGtHJTtGKf8JmVGtpf2P+Nqv7T7elfSWoaqyewnWBbT/y30hkyM
 QztQ5odjdA0mMraCkgbl+w7JGJlgWV4xAyEG9fI/kLcwVxziU/qGhGPxTAw20d6i
 hM/4vG1IQ1AxUrf3PLjbdmzhAQKlbABlritN7UG4B85uzMmfNcd9IrPQzWD/XlfS
 /PHF7fjxPPYQDRwv1ACERxT7tPpV8bBLheQgLG2lpZ+jXslc/76fxC3S4Xlo4gTt
 cUUJxA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48n81wnyun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Aug 2025 11:39:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 50FE64002D;
 Thu, 21 Aug 2025 11:36:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C3FF873DB4E;
 Thu, 21 Aug 2025 11:35:26 +0200 (CEST)
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Aug
 2025 11:35:25 +0200
Message-ID: <ea6b8999-4f5d-4cc2-b92b-b0776c2b1363@foss.st.com>
Date: Thu, 21 Aug 2025 11:35:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] drm/stm/dw_mipi_dsi-stm: convert from round_rate()
 to determine_rate()
To: Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
CC: <linux-clk@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
 <20250811-drm-clk-round-rate-v2-6-4a91ccf239cf@redhat.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250811-drm-clk-round-rate-v2-6-4a91ccf239cf@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.87.178]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
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

Hi Brian,

thanks for the patch.

Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>

Le 11/08/2025 à 12:56, Brian Masney a écrit :
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Acked-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>   drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> index 2c7bc064bc66c6a58903a207cbe8091a14231c2b..58eae6804cc82d174323744206be7046568b905c 100644
> --- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> +++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> @@ -274,8 +274,8 @@ static unsigned long dw_mipi_dsi_clk_recalc_rate(struct clk_hw *hw,
>   	return (unsigned long)pll_out_khz * 1000;
>   }
>   
> -static long dw_mipi_dsi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> -				       unsigned long *parent_rate)
> +static int dw_mipi_dsi_clk_determine_rate(struct clk_hw *hw,
> +					  struct clk_rate_request *req)
>   {
>   	struct dw_mipi_dsi_stm *dsi = clk_to_dw_mipi_dsi_stm(hw);
>   	unsigned int idf, ndiv, odf, pll_in_khz, pll_out_khz;
> @@ -283,14 +283,14 @@ static long dw_mipi_dsi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
>   
>   	DRM_DEBUG_DRIVER("\n");
>   
> -	pll_in_khz = (unsigned int)(*parent_rate / 1000);
> +	pll_in_khz = (unsigned int)(req->best_parent_rate / 1000);
>   
>   	/* Compute best pll parameters */
>   	idf = 0;
>   	ndiv = 0;
>   	odf = 0;
>   
> -	ret = dsi_pll_get_params(dsi, pll_in_khz, rate / 1000,
> +	ret = dsi_pll_get_params(dsi, pll_in_khz, req->rate / 1000,
>   				 &idf, &ndiv, &odf);
>   	if (ret)
>   		DRM_WARN("Warning dsi_pll_get_params(): bad params\n");
> @@ -298,7 +298,9 @@ static long dw_mipi_dsi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
>   	/* Get the adjusted pll out value */
>   	pll_out_khz = dsi_pll_get_clkout_khz(pll_in_khz, idf, ndiv, odf);
>   
> -	return pll_out_khz * 1000;
> +	req->rate = pll_out_khz * 1000;
> +
> +	return 0;
>   }
>   
>   static int dw_mipi_dsi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> @@ -351,7 +353,7 @@ static const struct clk_ops dw_mipi_dsi_stm_clk_ops = {
>   	.disable = dw_mipi_dsi_clk_disable,
>   	.is_enabled = dw_mipi_dsi_clk_is_enabled,
>   	.recalc_rate = dw_mipi_dsi_clk_recalc_rate,
> -	.round_rate = dw_mipi_dsi_clk_round_rate,
> +	.determine_rate = dw_mipi_dsi_clk_determine_rate,
>   	.set_rate = dw_mipi_dsi_clk_set_rate,
>   };
>   
>
