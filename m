Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EC847088D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 19:22:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7777D10E45C;
	Fri, 10 Dec 2021 18:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 549 seconds by postgrey-1.36 at gabe;
 Fri, 10 Dec 2021 18:22:19 UTC
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B30E10E45C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 18:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 4E744FB04;
 Fri, 10 Dec 2021 19:13:07 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o6mwTDWk7X1X; Fri, 10 Dec 2021 19:13:06 +0100 (CET)
Date: Fri, 10 Dec 2021 19:13:04 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH 1/3] drm: bridge: nwl-dsi: Drop panel_bridge from nwl_dsi
Message-ID: <YbOYsENSsiG1jM7O@qwark.sigxcpu.org>
References: <20211210174819.2250178-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211210174819.2250178-1-jagan@amarulasolutions.com>
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Fri, Dec 10, 2021 at 11:18:17PM +0530, Jagan Teki wrote:
> panel_bridge pointer never used anywhere except the one it
> looked up at nwl_dsi_bridge_attach.
> 
> Drop it from the nwl_dsi structure.
> 
> Cc: Guido Günther <agx@sigxcpu.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Reviewed-by: Guido Günther <agx@sigxcpu.org>

> ---
>  drivers/gpu/drm/bridge/nwl-dsi.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
> index a7389a0facfb..6becdcdc99fe 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -65,7 +65,6 @@ struct nwl_dsi_transfer {
>  struct nwl_dsi {
>  	struct drm_bridge bridge;
>  	struct mipi_dsi_host dsi_host;
> -	struct drm_bridge *panel_bridge;
>  	struct device *dev;
>  	struct phy *phy;
>  	union phy_configure_opts phy_cfg;
> @@ -924,13 +923,11 @@ static int nwl_dsi_bridge_attach(struct drm_bridge *bridge,
>  		if (IS_ERR(panel_bridge))
>  			return PTR_ERR(panel_bridge);
>  	}
> -	dsi->panel_bridge = panel_bridge;
>  
> -	if (!dsi->panel_bridge)
> +	if (!panel_bridge)
>  		return -EPROBE_DEFER;
>  
> -	return drm_bridge_attach(bridge->encoder, dsi->panel_bridge, bridge,
> -				 flags);
> +	return drm_bridge_attach(bridge->encoder, panel_bridge, bridge, flags);
>  }
>  
>  static void nwl_dsi_bridge_detach(struct drm_bridge *bridge)
> -- 
> 2.25.1
> 
