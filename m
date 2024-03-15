Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB9E87CA7A
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 10:15:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2B3112058;
	Fri, 15 Mar 2024 09:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="j7CQdFq4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA4E112058
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 09:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710494124;
 bh=acrQ5oOzFvIptP0m55ggct7J15MBntUB7Hgt+FmRFRg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=j7CQdFq496EcdadWXv01UmcL6cPMnEne0Ve8NgUX6EIsZfO28poLm/zYFElsRmg8r
 L02tS8PomCFcYDO2g/Fpm6YlBqVX/p3IqIaxspuWPkGOYg1N1bGS+r6vAxDsKVKg+e
 xiDOpoNn6GD1INtI2opCCnng8fin2PPXPROdpsqeOZhWLzYqRG/i+eHB+mYljXN4CE
 sBKniqwVIkFU3vB2+zdfX0ICiRTuEItOr+lnz/V2pFkMZrcCk4q5rvTxNqt5uvNxXJ
 AewYrKTKhrLaqm9vCBSfDpgEFOzbsvh9u3hyfcFeMqChvHglqGLhJr0cKE8r+7M/1i
 pTRd13IOCOfWg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 36ED137820FD;
 Fri, 15 Mar 2024 09:15:23 +0000 (UTC)
Message-ID: <d295a448-1b50-47be-92a2-770501c83e18@collabora.com>
Date: Fri, 15 Mar 2024 10:15:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mediatek: dsi: Correct calculation formula of PHY Timing
To: Shuijing Li <shuijing.li@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240315072945.19502-1-shuijing.li@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240315072945.19502-1-shuijing.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Il 15/03/24 08:29, Shuijing Li ha scritto:
> This patch correct calculation formula of PHY timing.
> Make actual phy timing more accurate.
> 

More accurate in which cases? By how much? On which SoC(s)?

I agree about those changes if those are improving the PHY timing, but
can you please document what's going on?

Thanks,
Angelo

> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 33 +++++++++++++++---------------
>   1 file changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index a2fdfc8ddb15..d1bd7d671880 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -235,22 +235,23 @@ static void mtk_dsi_phy_timconfig(struct mtk_dsi *dsi)
>   	u32 data_rate_mhz = DIV_ROUND_UP(dsi->data_rate, 1000000);
>   	struct mtk_phy_timing *timing = &dsi->phy_timing;
>   
> -	timing->lpx = (60 * data_rate_mhz / (8 * 1000)) + 1;
> -	timing->da_hs_prepare = (80 * data_rate_mhz + 4 * 1000) / 8000;
> -	timing->da_hs_zero = (170 * data_rate_mhz + 10 * 1000) / 8000 + 1 -
> -			     timing->da_hs_prepare;
> -	timing->da_hs_trail = timing->da_hs_prepare + 1;
> -
> -	timing->ta_go = 4 * timing->lpx - 2;
> -	timing->ta_sure = timing->lpx + 2;
> -	timing->ta_get = 4 * timing->lpx;
> -	timing->da_hs_exit = 2 * timing->lpx + 1;
> -
> -	timing->clk_hs_prepare = 70 * data_rate_mhz / (8 * 1000);
> -	timing->clk_hs_post = timing->clk_hs_prepare + 8;
> -	timing->clk_hs_trail = timing->clk_hs_prepare;
> -	timing->clk_hs_zero = timing->clk_hs_trail * 4;
> -	timing->clk_hs_exit = 2 * timing->clk_hs_trail;
> +	timing->lpx = (80 * data_rate_mhz / (8 * 1000)) + 1;
> +	timing->da_hs_prepare = (59 * data_rate_mhz + 4 * 1000) / 8000 + 1;
> +	timing->da_hs_zero = (163 * data_rate_mhz + 11 * 1000) / 8000 + 1 -
> +		timing->da_hs_prepare;
> +	timing->da_hs_trail = (78 * data_rate_mhz + 7 * 1000) / 8000 + 1;
> +
> +	timing->ta_go = 4 * timing->lpx;
> +	timing->ta_sure = 3 * timing->lpx / 2;
> +	timing->ta_get = 5 * timing->lpx;
> +	timing->da_hs_exit = (118 * data_rate_mhz / (8 * 1000)) + 1;
> +
> +	timing->clk_hs_prepare = (57 * data_rate_mhz / (8 * 1000)) + 1;
> +	timing->clk_hs_post = (65 * data_rate_mhz + 53 * 1000) / 8000 + 1;
> +	timing->clk_hs_trail = (78 * data_rate_mhz + 7 * 1000) / 8000 + 1;
> +	timing->clk_hs_zero = (330 * data_rate_mhz / (8 * 1000)) + 1 -
> +		timing->clk_hs_prepare;
> +	timing->clk_hs_exit = (118 * data_rate_mhz / (8 * 1000)) + 1;
>   
>   	timcon0 = timing->lpx | timing->da_hs_prepare << 8 |
>   		  timing->da_hs_zero << 16 | timing->da_hs_trail << 24;



