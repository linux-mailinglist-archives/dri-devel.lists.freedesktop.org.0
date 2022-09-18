Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A493F5BBDE1
	for <lists+dri-devel@lfdr.de>; Sun, 18 Sep 2022 14:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BD310E53F;
	Sun, 18 Sep 2022 12:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A1710E53F
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 12:56:03 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C3F3B810F6;
 Sun, 18 Sep 2022 14:56:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1663505761;
 bh=giaehTpmWV/3zDOC9JEfKXT2DXHPt8LuMfhAJRLBHbM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Bvj+VCyIuhzsBHI4DbzSa5e2mSCiLrCCyQCPBPK29ysJ7Vn6fgxofbrFC5O5WrNH8
 KnqC/2Xa3wveAz9qUOGXHXW65/hv9mXeyCuhoiyKHm6mH4NqWzUhaxW8v5o+DIm/ci
 XUIvHW53ZztHXGXjcoJ9o55pxbsL3tVQxdD7PqWyUxSCnCFjZdfm1i6BkHeyekPHV9
 8xqLsGNbFUIGCwWuh24i25WGsnxWjYif1+H3N+/5+oDSIfzb7ZmlHsFvw3kiXoc6V8
 lCQT4bF/p0OGGoWemEb3WaH1k1H5sRzwvv5LtC0+0sNru0LR6TKxvddizY3yhdhMEr
 DaEZXWkQFYQdA==
Message-ID: <41f661e5-adcd-3e42-df2f-5732b1e19125@denx.de>
Date: Sun, 18 Sep 2022 14:56:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Add and use hs_rate and lp_rate
To: dri-devel@lists.freedesktop.org
References: <20220801131113.182487-1-marex@denx.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220801131113.182487-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 robert.foss@linaro.org, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/1/22 15:11, Marek Vasut wrote:
> Fill in hs_rate and lp_rate to struct mipi_dsi_device for this bridge and
> adjust DSI input frequency calculations such that they expect the DSI host
> to configure HS clock according to hs_rate.
> 
> This is an optimization for the DSI burst mode case. In case the DSI device
> supports DSI burst mode, it is recommended to operate the DSI interface at
> the highest possible HS clock frequency which the DSI device supports. This
> permits the DSI host to send as short as possible bursts of data on the DSI
> link and keep the DSI data lanes in LP mode otherwise, which reduces power
> consumption.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/bridge/ti-sn65dsi83.c | 25 +++++++++++++------------
>   1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index 14e7aa77e7584..b161f25c3a2f5 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -286,8 +286,7 @@ static u8 sn65dsi83_get_lvds_range(struct sn65dsi83 *ctx,
>   	return (mode_clock - 12500) / 25000;
>   }
>   
> -static u8 sn65dsi83_get_dsi_range(struct sn65dsi83 *ctx,
> -				  const struct drm_display_mode *mode)
> +static u8 sn65dsi83_get_dsi_range(struct sn65dsi83 *ctx)
>   {
>   	/*
>   	 * The encoding of the CHA_DSI_CLK_RANGE is as follows:
> @@ -303,20 +302,20 @@ static u8 sn65dsi83_get_dsi_range(struct sn65dsi83 *ctx,
>   	 *  DSI_CLK = mode clock * bpp / dsi_data_lanes / 2
>   	 * the 2 is there because the bus is DDR.
>   	 */
> -	return DIV_ROUND_UP(clamp((unsigned int)mode->clock *
> -			    mipi_dsi_pixel_format_to_bpp(ctx->dsi->format) /
> -			    ctx->dsi->lanes / 2, 40000U, 500000U), 5000U);
> +	return DIV_ROUND_UP(ctx->dsi->hs_rate, 5000000U);
>   }
>   
> -static u8 sn65dsi83_get_dsi_div(struct sn65dsi83 *ctx)
> +static u8 sn65dsi83_get_dsi_div(struct sn65dsi83 *ctx,
> +				const struct drm_display_mode *mode)
>   {
>   	/* The divider is (DSI_CLK / LVDS_CLK) - 1, which really is: */
> -	unsigned int dsi_div = mipi_dsi_pixel_format_to_bpp(ctx->dsi->format);
> +	unsigned int dsi_div;
> +	int mode_clock = mode->clock;
>   
> -	dsi_div /= ctx->dsi->lanes;
> +	if (ctx->lvds_dual_link)
> +		mode_clock /= 2;
>   
> -	if (!ctx->lvds_dual_link)
> -		dsi_div /= 2;
> +	dsi_div = (ctx->dsi->hs_rate / mode_clock) / 1000;
>   
>   	return dsi_div - 1;
>   }
> @@ -397,9 +396,9 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
>   		     REG_RC_LVDS_PLL_LVDS_CLK_RANGE(sn65dsi83_get_lvds_range(ctx, mode)) |
>   		     REG_RC_LVDS_PLL_HS_CLK_SRC_DPHY);
>   	regmap_write(ctx->regmap, REG_DSI_CLK,
> -		     REG_DSI_CLK_CHA_DSI_CLK_RANGE(sn65dsi83_get_dsi_range(ctx, mode)));
> +		     REG_DSI_CLK_CHA_DSI_CLK_RANGE(sn65dsi83_get_dsi_range(ctx)));
>   	regmap_write(ctx->regmap, REG_RC_DSI_CLK,
> -		     REG_RC_DSI_CLK_DSI_CLK_DIVIDER(sn65dsi83_get_dsi_div(ctx)));
> +		     REG_RC_DSI_CLK_DSI_CLK_DIVIDER(sn65dsi83_get_dsi_div(ctx, mode)));
>   
>   	/* Set number of DSI lanes and LVDS link config. */
>   	regmap_write(ctx->regmap, REG_DSI_LANE,
> @@ -643,6 +642,8 @@ static int sn65dsi83_host_attach(struct sn65dsi83 *ctx)
>   	dsi->lanes = dsi_lanes;
>   	dsi->format = MIPI_DSI_FMT_RGB888;
>   	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST;
> +	dsi->hs_rate = 500000000;
> +	dsi->lp_rate = 16000000;
>   
>   	ret = devm_mipi_dsi_attach(dev, dsi);
>   	if (ret < 0) {

+CC Maxime -- input would be helpful.
