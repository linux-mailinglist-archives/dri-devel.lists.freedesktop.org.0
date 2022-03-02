Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9990C4CA3C1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 12:30:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D0C10E379;
	Wed,  2 Mar 2022 11:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 481 seconds by postgrey-1.36 at gabe;
 Wed, 02 Mar 2022 11:30:51 UTC
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC39A10E379
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 11:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 383D1FB03;
 Wed,  2 Mar 2022 12:22:48 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k5nJkWO75cHE; Wed,  2 Mar 2022 12:22:47 +0100 (CET)
Date: Wed, 2 Mar 2022 12:22:45 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v2 2/8] drm: bridge: nwl-dsi: Switch to
 devm_drm_of_get_bridge
Message-ID: <Yh9ThVtY97VYQpuN@qwark.sigxcpu.org>
References: <20220301141247.126911-1-jagan@amarulasolutions.com>
 <20220301141247.126911-2-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220301141247.126911-2-jagan@amarulasolutions.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-amarula@amarulasolutions.com,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Tue, Mar 01, 2022 at 07:42:41PM +0530, Jagan Teki wrote:
> devm_drm_of_get_bridge is capable of looking up the downstream
> bridge and panel and trying to add a panel bridge if the panel
> is found.
> 
> Replace explicit finding calls with devm_drm_of_get_bridge.
> 
> Cc: Guido Günther <agx@sigxcpu.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v2:
> - split the patch
> 
>  drivers/gpu/drm/bridge/nwl-dsi.c | 18 +++---------------
>  1 file changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
> index 30aacd939dc3..c9e108a7eca2 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -916,22 +916,10 @@ static int nwl_dsi_bridge_attach(struct drm_bridge *bridge,
>  {
>  	struct nwl_dsi *dsi = bridge_to_dsi(bridge);
>  	struct drm_bridge *panel_bridge;
> -	struct drm_panel *panel;
> -	int ret;
> -
> -	ret = drm_of_find_panel_or_bridge(dsi->dev->of_node, 1, 0, &panel,
> -					  &panel_bridge);
> -	if (ret)
> -		return ret;
> -
> -	if (panel) {
> -		panel_bridge = drm_panel_bridge_add(panel);
> -		if (IS_ERR(panel_bridge))
> -			return PTR_ERR(panel_bridge);
> -	}
>  
> -	if (!panel_bridge)
> -		return -EPROBE_DEFER;
> +	panel_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node, 1, 0);
> +	if (IS_ERR(panel_bridge))
> +		return PTR_ERR(panel_bridge);
>  
>  	return drm_bridge_attach(bridge->encoder, panel_bridge, bridge, flags);
>  }

Reviewed-by: Guido Günther <agx@sigxcpu.org>

Thanks,
 -- Guido

> -- 
> 2.25.1
> 
