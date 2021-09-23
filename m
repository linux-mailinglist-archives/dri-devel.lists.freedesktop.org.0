Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D8B4154A3
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 02:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0854F6E0CB;
	Thu, 23 Sep 2021 00:31:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0266E0CA;
 Thu, 23 Sep 2021 00:31:01 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3241FE52;
 Thu, 23 Sep 2021 02:31:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1632357060;
 bh=EJ55Z1zJwBfIXFQCU8OpO167gyhJ46bJiR8/jqfwHJo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CNhY2kbC7Vq7vtZtF/mPiDbmQrvjxwkYGEOxqx7o1x5pL9cIGssqCt28BMMVPPgER
 ciAxR2Js8meqDjQJMbawjJHr08OtwmJBMGH5HaVDFue80m8WSBw8igHW+wiWp+R04N
 12U3xpzRelxOtBmx0IiIdM6n/w2kANLlVDzhsT7A=
Date: Thu, 23 Sep 2021 03:30:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Rob Clark <robdclark@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] drm/bridge: ti-sn65dsi86: Implement
 bridge->mode_valid()
Message-ID: <YUvKwsNS0LQf9PfO@pendragon.ideasonboard.com>
References: <20210920225801.227211-1-robdclark@gmail.com>
 <20210920225801.227211-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210920225801.227211-3-robdclark@gmail.com>
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

Hi Rob,

Thank you for the patch.

On Mon, Sep 20, 2021 at 03:57:59PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> For the brave new world of bridges not creating their own connectors, we
> need to implement the max clock limitation via bridge->mode_valid()
> instead of connector->mode_valid().
> 
> v2: Drop unneeded connector->mode_valid()
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 41d48a393e7f..6154bed0af5b 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -615,20 +615,8 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
>  	return drm_bridge_get_modes(pdata->next_bridge, connector);
>  }
>  
> -static enum drm_mode_status
> -ti_sn_bridge_connector_mode_valid(struct drm_connector *connector,
> -				  struct drm_display_mode *mode)
> -{
> -	/* maximum supported resolution is 4K at 60 fps */
> -	if (mode->clock > 594000)
> -		return MODE_CLOCK_HIGH;
> -
> -	return MODE_OK;
> -}
> -
>  static struct drm_connector_helper_funcs ti_sn_bridge_connector_helper_funcs = {
>  	.get_modes = ti_sn_bridge_connector_get_modes,
> -	.mode_valid = ti_sn_bridge_connector_mode_valid,
>  };
>  
>  static const struct drm_connector_funcs ti_sn_bridge_connector_funcs = {
> @@ -766,6 +754,18 @@ static void ti_sn_bridge_detach(struct drm_bridge *bridge)
>  	drm_dp_aux_unregister(&bridge_to_ti_sn65dsi86(bridge)->aux);
>  }
>  
> +static enum drm_mode_status
> +ti_sn_bridge_mode_valid(struct drm_bridge *bridge,
> +			const struct drm_display_info *info,
> +			const struct drm_display_mode *mode)
> +{
> +	/* maximum supported resolution is 4K at 60 fps */
> +	if (mode->clock > 594000)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +
>  static void ti_sn_bridge_disable(struct drm_bridge *bridge)
>  {
>  	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> @@ -1127,6 +1127,7 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
>  static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>  	.attach = ti_sn_bridge_attach,
>  	.detach = ti_sn_bridge_detach,
> +	.mode_valid = ti_sn_bridge_mode_valid,
>  	.pre_enable = ti_sn_bridge_pre_enable,
>  	.enable = ti_sn_bridge_enable,
>  	.disable = ti_sn_bridge_disable,

-- 
Regards,

Laurent Pinchart
