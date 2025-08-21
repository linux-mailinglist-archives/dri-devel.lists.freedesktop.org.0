Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFB4B2F42F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 11:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB5510E8F4;
	Thu, 21 Aug 2025 09:40:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="n5hHxiHw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6543510E8F4;
 Thu, 21 Aug 2025 09:40:15 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L73mkn017291;
 Thu, 21 Aug 2025 11:39:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 WlqqfI0U0npfmgU+tmlUwSHbK4ZelsnQ4LVffls/8aw=; b=n5hHxiHwTKdbVyRl
 vHBWgMduDM+tlhtZeSXTi/mGPgVEsu/HOgOcBgDrwFVAPAVlc6/35j9oQpPweKad
 b2qSUj3MTwx77kAkK3nbKgC77W4lGqLmIjx7LNzvM/UjDvLLrDJrMHOuAU6CtxCr
 xjP3lYfEXbJUS0nBw/4kiq15Gi9Rf9+B5RecphEiZFJCv1mCLprGvM8uV+5MUVZT
 fO1CxdWtOi6kMZTY82cKed2gYCB3d7Ds4+8ggAbvIlE4ywU/hhm9sKiDDh5r8zpz
 /8z7stmnBupg7HBOfEsgTrji6B2v+Hp+gya+hzkvCOsMcbEyZJRxy1z+LDv1JwVz
 vEpSJg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48n70de72d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Aug 2025 11:39:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3446F40046;
 Thu, 21 Aug 2025 11:37:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F3EAD73DB5A;
 Thu, 21 Aug 2025 11:36:15 +0200 (CEST)
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Aug
 2025 11:36:14 +0200
Message-ID: <86adb9ce-68de-494f-92e8-6e11773987fe@foss.st.com>
Date: Thu, 21 Aug 2025 11:36:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] drm/stm/lvds: convert from round_rate() to
 determine_rate()
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
 <20250811-drm-clk-round-rate-v2-7-4a91ccf239cf@redhat.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250811-drm-clk-round-rate-v2-7-4a91ccf239cf@redhat.com>
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
>   drivers/gpu/drm/stm/lvds.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
> index 07788e8d3d8302a3951e97d64736b721033998d3..fe38c0984b2b552e1ccaef4d1e589b9d86a40ee3 100644
> --- a/drivers/gpu/drm/stm/lvds.c
> +++ b/drivers/gpu/drm/stm/lvds.c
> @@ -682,8 +682,8 @@ static unsigned long lvds_pixel_clk_recalc_rate(struct clk_hw *hw,
>   	return (unsigned long)lvds->pixel_clock_rate;
>   }
>   
> -static long lvds_pixel_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> -				      unsigned long *parent_rate)
> +static int lvds_pixel_clk_determine_rate(struct clk_hw *hw,
> +					 struct clk_rate_request *req)
>   {
>   	struct stm_lvds *lvds = container_of(hw, struct stm_lvds, lvds_ck_px);
>   	unsigned int pll_in_khz, bdiv = 0, mdiv = 0, ndiv = 0;
> @@ -703,7 +703,7 @@ static long lvds_pixel_clk_round_rate(struct clk_hw *hw, unsigned long rate,
>   	mode = list_first_entry(&connector->modes,
>   				struct drm_display_mode, head);
>   
> -	pll_in_khz = (unsigned int)(*parent_rate / 1000);
> +	pll_in_khz = (unsigned int)(req->best_parent_rate / 1000);
>   
>   	if (lvds_is_dual_link(lvds->link_type))
>   		multiplier = 2;
> @@ -719,14 +719,16 @@ static long lvds_pixel_clk_round_rate(struct clk_hw *hw, unsigned long rate,
>   	lvds->pixel_clock_rate = (unsigned long)pll_get_clkout_khz(pll_in_khz, bdiv, mdiv, ndiv)
>   					 * 1000 * multiplier / 7;
>   
> -	return lvds->pixel_clock_rate;
> +	req->rate = lvds->pixel_clock_rate;
> +
> +	return 0;
>   }
>   
>   static const struct clk_ops lvds_pixel_clk_ops = {
>   	.enable = lvds_pixel_clk_enable,
>   	.disable = lvds_pixel_clk_disable,
>   	.recalc_rate = lvds_pixel_clk_recalc_rate,
> -	.round_rate = lvds_pixel_clk_round_rate,
> +	.determine_rate = lvds_pixel_clk_determine_rate,
>   };
>   
>   static const struct clk_init_data clk_data = {
>
