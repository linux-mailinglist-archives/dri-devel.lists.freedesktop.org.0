Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EACD61EC5EA
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 01:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0D36E0C2;
	Tue,  2 Jun 2020 23:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C73E6E0C2
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 23:51:56 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 876A22B3;
 Wed,  3 Jun 2020 01:51:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1591141914;
 bh=Fe8f3kgWX47nIzg78wyxjbab4WD6Saxj6pxZxkB/gRo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JhhykH0rs1dR3LZsV2DsnKzuF2z9VlZj4+I2990IxcsJkczDcz7VYPYx26TRo4Hqs
 pJ3UkFFW7TOPtB1S1AxdP6uT0Jac6CbZ7Z6OJd89o8ZSdD7yQaDvoLg7Lp18AkwXkD
 rD2FG3r3HaSGN5hYDv+GDvzDB9etxpWO1icCqJDY=
Date: Wed, 3 Jun 2020 02:51:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Adrian Ratiu <adrian.ratiu@collabora.com>
Subject: Re: [PATCH v8 04/10] drm: bridge: dw_mipi_dsi: allow bridge daisy
 chaining
Message-ID: <20200602235139.GS6547@pendragon.ideasonboard.com>
References: <20200427081952.3536741-1-adrian.ratiu@collabora.com>
 <20200427081952.3536741-5-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200427081952.3536741-5-adrian.ratiu@collabora.com>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 linux-imx@nxp.com, linux-rockchip@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Adrian,

Thank you for the patch.

On Mon, Apr 27, 2020 at 11:19:46AM +0300, Adrian Ratiu wrote:
> Up until now the assumption was that the synopsis dsi bridge will
> directly connect to an encoder provided by the platform driver, but
> the current practice for drivers is to leave the encoder empty via
> the simple encoder API and add their logic to their own drm_bridge.
> 
> Thus we need an ablility to connect the DSI bridge to another bridge
> provided by the platform driver, so we extend the dw_mipi_dsi bind()
> API with a new "previous bridge" arg instead of just hardcoding NULL.
> 
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> ---
> New in v8.
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c   | 6 ++++--
>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 2 +-
>  include/drm/bridge/dw_mipi_dsi.h                | 5 ++++-
>  3 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index 16fd87055e7b7..140ff40fa1b62 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -1456,11 +1456,13 @@ EXPORT_SYMBOL_GPL(dw_mipi_dsi_remove);
>  /*
>   * Bind/unbind API, used from platforms based on the component framework.
>   */
> -int dw_mipi_dsi_bind(struct dw_mipi_dsi *dsi, struct drm_encoder *encoder)
> +int dw_mipi_dsi_bind(struct dw_mipi_dsi *dsi,
> +		     struct drm_encoder *encoder,
> +		     struct drm_bridge *prev_bridge)
>  {
>  	int ret;
>  
> -	ret = drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
> +	ret = drm_bridge_attach(encoder, &dsi->bridge, prev_bridge, 0);

Please note that chaining of bridges doesn't work well if multiple
bridges in the chain try to create a connector. This is why a
DRM_BRIDGE_ATTACH_NO_CONNECTOR flag has been added, with a helper to
create a connector for a chain of bridges (drm_bridge_connector_init()).
This won't play well with the component framework. I would recommend
using the of_drm_find_bridge() instead in the rockchip driver, and
deprecating dw_mipi_dsi_bind().

>  	if (ret) {
>  		DRM_ERROR("Failed to initialize bridge with drm\n");
>  		return ret;
> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> index 3feff0c45b3f7..83ef43be78135 100644
> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> @@ -929,7 +929,7 @@ static int dw_mipi_dsi_rockchip_bind(struct device *dev,
>  		return ret;
>  	}
>  
> -	ret = dw_mipi_dsi_bind(dsi->dmd, &dsi->encoder);
> +	ret = dw_mipi_dsi_bind(dsi->dmd, &dsi->encoder, NULL);
>  	if (ret) {
>  		DRM_DEV_ERROR(dev, "Failed to bind: %d\n", ret);
>  		return ret;
> diff --git a/include/drm/bridge/dw_mipi_dsi.h b/include/drm/bridge/dw_mipi_dsi.h
> index b0e390b3288e8..699b3531f5b36 100644
> --- a/include/drm/bridge/dw_mipi_dsi.h
> +++ b/include/drm/bridge/dw_mipi_dsi.h
> @@ -14,6 +14,7 @@
>  #include <drm/drm_modes.h>
>  
>  struct drm_display_mode;
> +struct drm_bridge;
>  struct drm_encoder;
>  struct dw_mipi_dsi;
>  struct mipi_dsi_device;
> @@ -62,7 +63,9 @@ struct dw_mipi_dsi *dw_mipi_dsi_probe(struct platform_device *pdev,
>  				      const struct dw_mipi_dsi_plat_data
>  				      *plat_data);
>  void dw_mipi_dsi_remove(struct dw_mipi_dsi *dsi);
> -int dw_mipi_dsi_bind(struct dw_mipi_dsi *dsi, struct drm_encoder *encoder);
> +int dw_mipi_dsi_bind(struct dw_mipi_dsi *dsi,
> +		     struct drm_encoder *encoder,
> +		     struct drm_bridge *prev_bridge);
>  void dw_mipi_dsi_unbind(struct dw_mipi_dsi *dsi);
>  void dw_mipi_dsi_set_slave(struct dw_mipi_dsi *dsi, struct dw_mipi_dsi *slave);
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
