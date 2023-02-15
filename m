Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D763869763B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 07:21:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B9610E14F;
	Wed, 15 Feb 2023 06:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9CC10E14F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 06:20:55 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05AD527C;
 Wed, 15 Feb 2023 07:20:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1676442054;
 bh=/LST5Btzg0OoUoDYCh6nxRCPL83lIzlzxzll4jc+hBo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kAMcqyxXHEPNdxgtrWC4rXYjnP7O1WiC4jpQ5zlzqhINJi8vbFnv/UxY/WA0fjjE/
 +7q2PBbuK6tcuOcter/JWAMr1w+QcYos3luHIcJjj/kWqDaMEjgrQYeFpAGOIqF9FC
 9fXAbndeqf0bAKkobCwqH57pxlxO4Yub0VTCjSeo=
Message-ID: <97145393-8509-b5eb-0c1e-666179f3203f@ideasonboard.com>
Date: Wed, 15 Feb 2023 08:20:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/3] drm: rcar-du: lvds: Move LVDS enable code to separate
 code section
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20230214003736.18871-1-laurent.pinchart+renesas@ideasonboard.com>
 <20230214003736.18871-3-laurent.pinchart+renesas@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230214003736.18871-3-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/02/2023 02:37, Laurent Pinchart wrote:
> To prepare for a rework of the LVDS disable code, which will need to be
> called from rcar_lvds_pclk_disable(), move the LVDS enable code,
> currently stored in the __rcar_lvds_atomic_enable() function, to a
> separate code section separate from bridge operations. It will be then
> extended with the LVDS disable code.
> 
> As part of this rework the __rcar_lvds_atomic_enable() function is
> renamed to rcar_lvds_enable() to more clearly indicate its purpose.
> 
> No functional change intended.

The desc is a bit confusing, as it talks about moving LVDS enable code, 
but the diff shows you moving the lvds pclk enable/disable code. Other 
than that:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

  Tomi

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/gpu/drm/rcar-du/rcar_lvds.c | 97 +++++++++++++++--------------
>   1 file changed, 50 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 61de18af62e6..70cdd5ec64d5 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -311,46 +311,7 @@ static void rcar_lvds_pll_setup_d3_e3(struct rcar_lvds *lvds, unsigned int freq)
>   }
>   
>   /* -----------------------------------------------------------------------------
> - * Clock - D3/E3 only
> - */
> -
> -int rcar_lvds_pclk_enable(struct drm_bridge *bridge, unsigned long freq)
> -{
> -	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
> -	int ret;
> -
> -	if (WARN_ON(!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)))
> -		return -ENODEV;
> -
> -	dev_dbg(lvds->dev, "enabling LVDS PLL, freq=%luHz\n", freq);
> -
> -	ret = pm_runtime_resume_and_get(lvds->dev);
> -	if (ret)
> -		return ret;
> -
> -	__rcar_lvds_pll_setup_d3_e3(lvds, freq, true);
> -
> -	return 0;
> -}
> -EXPORT_SYMBOL_GPL(rcar_lvds_pclk_enable);
> -
> -void rcar_lvds_pclk_disable(struct drm_bridge *bridge)
> -{
> -	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
> -
> -	if (WARN_ON(!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)))
> -		return;
> -
> -	dev_dbg(lvds->dev, "disabling LVDS PLL\n");
> -
> -	rcar_lvds_write(lvds, LVDPLLCR, 0);
> -
> -	pm_runtime_put_sync(lvds->dev);
> -}
> -EXPORT_SYMBOL_GPL(rcar_lvds_pclk_disable);
> -
> -/* -----------------------------------------------------------------------------
> - * Bridge
> + * Enable/disable
>    */
>   
>   static enum rcar_lvds_mode rcar_lvds_get_lvds_mode(struct rcar_lvds *lvds,
> @@ -394,10 +355,10 @@ static enum rcar_lvds_mode rcar_lvds_get_lvds_mode(struct rcar_lvds *lvds,
>   	return mode;
>   }
>   
> -static void __rcar_lvds_atomic_enable(struct drm_bridge *bridge,
> -				      struct drm_atomic_state *state,
> -				      struct drm_crtc *crtc,
> -				      struct drm_connector *connector)
> +static void rcar_lvds_enable(struct drm_bridge *bridge,
> +			     struct drm_atomic_state *state,
> +			     struct drm_crtc *crtc,
> +			     struct drm_connector *connector)
>   {
>   	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
>   	u32 lvdhcr;
> @@ -410,8 +371,7 @@ static void __rcar_lvds_atomic_enable(struct drm_bridge *bridge,
>   
>   	/* Enable the companion LVDS encoder in dual-link mode. */
>   	if (lvds->link_type != RCAR_LVDS_SINGLE_LINK && lvds->companion)
> -		__rcar_lvds_atomic_enable(lvds->companion, state, crtc,
> -					  connector);
> +		rcar_lvds_enable(lvds->companion, state, crtc, connector);
>   
>   	/*
>   	 * Hardcode the channels and control signals routing for now.
> @@ -531,6 +491,49 @@ static void __rcar_lvds_atomic_enable(struct drm_bridge *bridge,
>   	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
>   }
>   
> +/* -----------------------------------------------------------------------------
> + * Clock - D3/E3 only
> + */
> +
> +int rcar_lvds_pclk_enable(struct drm_bridge *bridge, unsigned long freq)
> +{
> +	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
> +	int ret;
> +
> +	if (WARN_ON(!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)))
> +		return -ENODEV;
> +
> +	dev_dbg(lvds->dev, "enabling LVDS PLL, freq=%luHz\n", freq);
> +
> +	ret = pm_runtime_resume_and_get(lvds->dev);
> +	if (ret)
> +		return ret;
> +
> +	__rcar_lvds_pll_setup_d3_e3(lvds, freq, true);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(rcar_lvds_pclk_enable);
> +
> +void rcar_lvds_pclk_disable(struct drm_bridge *bridge)
> +{
> +	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
> +
> +	if (WARN_ON(!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)))
> +		return;
> +
> +	dev_dbg(lvds->dev, "disabling LVDS PLL\n");
> +
> +	rcar_lvds_write(lvds, LVDPLLCR, 0);
> +
> +	pm_runtime_put_sync(lvds->dev);
> +}
> +EXPORT_SYMBOL_GPL(rcar_lvds_pclk_disable);
> +
> +/* -----------------------------------------------------------------------------
> + * Bridge
> + */
> +
>   static void rcar_lvds_atomic_enable(struct drm_bridge *bridge,
>   				    struct drm_bridge_state *old_bridge_state)
>   {
> @@ -542,7 +545,7 @@ static void rcar_lvds_atomic_enable(struct drm_bridge *bridge,
>   							     bridge->encoder);
>   	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
>   
> -	__rcar_lvds_atomic_enable(bridge, state, crtc, connector);
> +	rcar_lvds_enable(bridge, state, crtc, connector);
>   }
>   
>   static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,

