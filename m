Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C15DB33FC29
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 01:21:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF5B6E06B;
	Thu, 18 Mar 2021 00:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4616E06B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 00:21:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C97658E6;
 Thu, 18 Mar 2021 01:21:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616026879;
 bh=dPQCVgzd2lJUq3jAWBjnHWNQs/oOCycuPf1cKDuvFNo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kXDP5Vr4spLR26JNCW6vFJT2VC7Hi008uWYh5P3Yksx+ILEzfvHMztFPSPEzLQXvC
 UKcwWkb8k6lYpZoYEmIPcK5U5XFa2QuK8Z7hNOWNSAqxAUn0U2RIA/l5gMKqiasfyL
 ITEU8yUmZn+OAdyYCrNeyQKwt7SpFY1vGog3qa5I=
Date: Thu, 18 Mar 2021 02:20:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 3/4] drm/bridge: ti-sn65dsi86: Read EDID blob over DDC
Message-ID: <YFKc23MwUQAosCs8@pendragon.ideasonboard.com>
References: <20201102181144.3469197-1-swboyd@chromium.org>
 <20201102181144.3469197-4-swboyd@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201102181144.3469197-4-swboyd@chromium.org>
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
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Sean Paul <seanpaul@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

Reviving a bit of an old thread, for a question.

On Mon, Nov 02, 2020 at 10:11:43AM -0800, Stephen Boyd wrote:
> Use the DDC connection to read the EDID from the eDP panel instead of
> relying on the panel to tell us the modes.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> Cc: Sean Paul <seanpaul@chromium.org>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 8276fa50138f..6b6e98ca2881 100644
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

Is there any specific reason to use the indirect access method, compared
to the direct method that translates access to an I2C ancillary address
to an I2C-over-AUX transaction (see page 20 of SLLSEH2B) ? The direct
method seems it would be more efficient.

> +	}
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
