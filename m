Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 796F52A2110
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 20:21:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224A46EB5C;
	Sun,  1 Nov 2020 19:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2A96EB5C
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 19:21:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 73140240;
 Sun,  1 Nov 2020 20:21:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1604258476;
 bh=snw4XAb7TzUZCyDePQfXmmHR6fn79B7kpxF3qwItluQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t/Zp8IWoNLPiCeKhor+jqn4VPm/PCN6AdYv1hgIu8ZusrURtfz56LT/pGC+Bpwwko
 jb6NLGYvqasxCW7/qEXUaF0JzuN0I2tN7xw3n5mTfVWeS9bGrKKInJRAvoMEdsAXlz
 hT1G/38xO+0BQe28D+6zD1HmihUoThlZmHTQwjJU=
Date: Sun, 1 Nov 2020 21:20:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 3/4] drm/bridge: ti-sn65dsi86: Read EDID blob over DDC
Message-ID: <20201101192027.GA7612@pendragon.ideasonboard.com>
References: <20201030011738.2028313-1-swboyd@chromium.org>
 <20201030011738.2028313-4-swboyd@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201030011738.2028313-4-swboyd@chromium.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

Thank you for the patch.

On Thu, Oct 29, 2020 at 06:17:37PM -0700, Stephen Boyd wrote:
> Use the DDC connection to read the EDID from the eDP panel instead of
> relying on the panel to tell us the modes.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> Cc: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index c77f46a21aae..f86934fd6cc8 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -119,6 +119,7 @@
>   * @debugfs:      Used for managing our debugfs.
>   * @host_node:    Remote DSI node.
>   * @dsi:          Our MIPI DSI source.
> + * @edid:         Detected EDID of eDP panel.
>   * @refclk:       Our reference clock.
>   * @panel:        Our panel.
>   * @enable_gpio:  The GPIO we toggle to enable the bridge.
> @@ -144,6 +145,7 @@ struct ti_sn_bridge {
>  	struct drm_bridge		bridge;
>  	struct drm_connector		connector;
>  	struct dentry			*debugfs;
> +	struct edid			*edid;
>  	struct device_node		*host_node;
>  	struct mipi_dsi_device		*dsi;
>  	struct clk			*refclk;
> @@ -265,6 +267,23 @@ connector_to_ti_sn_bridge(struct drm_connector *connector)
>  static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
>  {
>  	struct ti_sn_bridge *pdata = connector_to_ti_sn_bridge(connector);
> +	struct edid *edid = pdata->edid;
> +	int num, ret;
> +
> +	if (!edid) {
> +		pm_runtime_get_sync(pdata->dev);
> +		edid = pdata->edid = drm_get_edid(connector, &pdata->aux.ddc);
> +		pm_runtime_put(pdata->dev);
> +	}

Do we need to cache the EDID ? It seems like something that should be
done by the DRM core (well, caching modes in that case), not by
individual bridge drivers.

Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +	if (edid && drm_edid_is_valid(edid)) {
> +		ret = drm_connector_update_edid_property(connector, edid);
> +		if (!ret) {
> +			num = drm_add_edid_modes(connector, edid);
> +			if (num)
> +				return num;
> +		}
> +	}
>  
>  	return drm_panel_get_modes(pdata->panel, connector);
>  }
> @@ -1245,6 +1264,7 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
>  	if (!pdata)
>  		return -EINVAL;
>  
> +	kfree(pdata->edid);
>  	ti_sn_debugfs_remove(pdata);
>  
>  	of_node_put(pdata->host_node);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
