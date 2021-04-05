Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 944A5353A72
	for <lists+dri-devel@lfdr.de>; Mon,  5 Apr 2021 02:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068D66E0E7;
	Mon,  5 Apr 2021 00:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1FC6E0E7
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Apr 2021 00:59:03 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49108D40;
 Mon,  5 Apr 2021 02:59:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1617584341;
 bh=u+61VsZcxRPDE6sQcdGBDOSu14n8mjN6zWtsUqSPBEw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vyvx79yqD5FnpLIxmHJcv6wFcsXugBtAUJmJAGcK5asmrWwk1D7BT6F782FQe9Dpi
 8VOUT2EbHTm/AETKfjaHkB3GBPPlSx7J+aO26pVJWMn/p55jE031Px4nMTCaApYcsN
 MNFgH5N1n2htYfHLjRW9bRG2zOdIgjXyQOdDwG04=
Date: Mon, 5 Apr 2021 03:58:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 05/12] drm/bridge: ti-sn65dsi86: Move
 drm_panel_unprepare() to post_disable()
Message-ID: <YGpgqJjpBPQ5//li@pendragon.ideasonboard.com>
References: <20210402222846.2461042-1-dianders@chromium.org>
 <20210402152701.v3.5.Ia75c9ffe2a2582393a8532d244da86f18b4c9b21@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210402152701.v3.5.Ia75c9ffe2a2582393a8532d244da86f18b4c9b21@changeid>
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

Thank you for the patch.

On Fri, Apr 02, 2021 at 03:28:39PM -0700, Douglas Anderson wrote:
> We prepared the panel in pre_enable() so we should unprepare it in
> post_disable() to match.
> 
> This becomes important once we start using pre_enable() and
> post_disable() to make sure things are powered on (and then off again)
> when reading the EDID.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index c006678c9921..e30460002c48 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -452,8 +452,6 @@ static void ti_sn_bridge_disable(struct drm_bridge *bridge)
>  	regmap_write(pdata->regmap, SN_ML_TX_MODE_REG, 0);
>  	/* disable DP PLL */
>  	regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 0);
> -
> -	drm_panel_unprepare(pdata->panel);
>  }
>  
>  static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn_bridge *pdata)
> @@ -869,6 +867,8 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
>  {
>  	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
>  
> +	drm_panel_unprepare(pdata->panel);
> +
>  	clk_disable_unprepare(pdata->refclk);
>  
>  	pm_runtime_put_sync(pdata->dev);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
