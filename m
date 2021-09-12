Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6BD407FC5
	for <lists+dri-devel@lfdr.de>; Sun, 12 Sep 2021 21:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871E089C1F;
	Sun, 12 Sep 2021 19:42:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDEED89C1F
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Sep 2021 19:42:57 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 9973ecc9-1401-11ec-9416-0050568cd888;
 Sun, 12 Sep 2021 19:42:44 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 33C8C194C71;
 Sun, 12 Sep 2021 21:42:47 +0200 (CEST)
Date: Sun, 12 Sep 2021 21:42:53 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/vc4: dpi: Switch to devm_drm_of_get_bridge
Message-ID: <YT5YPYjKQk+DIKhB@ravnborg.org>
References: <20210910130941.1740182-1-maxime@cerno.tech>
 <20210910130941.1740182-3-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210910130941.1740182-3-maxime@cerno.tech>
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

On Fri, Sep 10, 2021 at 03:09:40PM +0200, Maxime Ripard wrote:
> The new devm_drm_of_get_bridge removes most of the boilerplate we
> have to deal with. Let's switch to it.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/vc4/vc4_dpi.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
> index a90f2545baee..c180eb60bee8 100644
> --- a/drivers/gpu/drm/vc4/vc4_dpi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dpi.c
> @@ -229,26 +229,19 @@ static const struct of_device_id vc4_dpi_dt_match[] = {
>  static int vc4_dpi_init_bridge(struct vc4_dpi *dpi)
>  {
>  	struct device *dev = &dpi->pdev->dev;
> -	struct drm_panel *panel;
>  	struct drm_bridge *bridge;
> -	int ret;
>  
> -	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
> -					  &panel, &bridge);
> -	if (ret) {
> +	bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
> +	if (IS_ERR(bridge)) {
>  		/* If nothing was connected in the DT, that's not an
>  		 * error.
>  		 */
> -		if (ret == -ENODEV)
> +		if (PTR_ERR(bridge) == -ENODEV)
>  			return 0;
>  		else
> -			return ret;
> +			return PTR_ERR(bridge);
>  	}
>  
> -	if (panel)
> -		bridge = drm_panel_bridge_add_typed(panel,
> -						    DRM_MODE_CONNECTOR_DPI);
> -
>  	return drm_bridge_attach(dpi->encoder, bridge, NULL, 0);
>  }
>  
> -- 
> 2.31.1
