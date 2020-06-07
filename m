Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 472CC1F093D
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 03:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579F96E249;
	Sun,  7 Jun 2020 01:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA216E249
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 01:24:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67A162C9;
 Sun,  7 Jun 2020 03:24:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1591493065;
 bh=hjxc+CECuOuAuOXyZxLgapJQ0U3wz/XP5fVTS3RERr8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WTJ8diBRyiDL4KNvGfD+N/ngsmF0bjeye109jfL+aVisia9sdSkmRVl299bAAPnhG
 A3Sq+8xxDIPi2vaaxS/wMUoCq93sAsgo92KPpkeQ5hnJvpt5BqyixjTzUfx+dJ8PFW
 9fgaZ8WipJLhFwKvW7ro7FsUj8g4gCsiyr3ZwguY=
Date: Sun, 7 Jun 2020 04:24:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH 23/27] drm: bridge: dw-hdmi: Attach to next bridge if
 available
Message-ID: <20200607012406.GX7339@pendragon.ideasonboard.com>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-24-laurent.pinchart+renesas@ideasonboard.com>
 <f75a9b4f-a283-53b1-ecb1-2bb6c9a278d6@baylibre.com>
 <b803dc36-f3f1-f90c-ac53-302d24397c2b@kwiboo.se>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b803dc36-f3f1-f90c-ac53-302d24397c2b@kwiboo.se>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonas,

On Tue, May 26, 2020 at 02:23:33PM +0000, Jonas Karlman wrote:
> On 2020-05-26 14:50, Neil Armstrong wrote:
> > On 26/05/2020 03:15, Laurent Pinchart wrote:
> >> On all platforms except i.MX and Rockchip, the dw-hdmi DT bindings
> >> require a video output port connected to an HDMI sink (most likely an
> >> HDMI connector, in rare cases another bridges converting HDMI to another
> >> protocol). For those platforms, retrieve the next bridge and attach it
> >> from the dw-hdmi bridge attach handler.
> >>
> >> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >> ---
> >>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 52 ++++++++++++++++++++++-
> >>  include/drm/bridge/dw_hdmi.h              |  2 +
> >>  2 files changed, 53 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> >> index 6148a022569a..512e67bb1c32 100644
> >> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> >> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> >> @@ -143,6 +143,7 @@ struct dw_hdmi_phy_data {
> >>  struct dw_hdmi {
> >>  	struct drm_connector connector;
> >>  	struct drm_bridge bridge;
> >> +	struct drm_bridge *next_bridge;
> >>  
> >>  	unsigned int version;
> >>  
> >> @@ -2797,7 +2798,8 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
> >>  	struct dw_hdmi *hdmi = bridge->driver_private;
> >>  
> >>  	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> >> -		return 0;
> >> +		return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
> >> +					 bridge, flags);
> >>  
> >>  	return dw_hdmi_connector_create(hdmi);
> >>  }
> >> @@ -3179,6 +3181,50 @@ static void dw_hdmi_init_hw(struct dw_hdmi *hdmi)
> >>  		hdmi->phy.ops->setup_hpd(hdmi, hdmi->phy.data);
> >>  }
> >>  
> >> +static int dw_hdmi_parse_dt(struct dw_hdmi *hdmi)
> >> +{
> >> +	struct device_node *endpoint;
> >> +	struct device_node *remote;
> >> +
> >> +	if (!hdmi->plat_data->output_port)
> >> +		return 0;
> >> +
> >> +	endpoint = of_graph_get_endpoint_by_regs(hdmi->dev->of_node,
> >> +						 hdmi->plat_data->output_port,
> >> +						 -1);
> >> +	if (!endpoint) {
> >> +		/*
> >> +		 * Don't treat this as a fatal error as the Rockchip DW-HDMI
> >> +		 * binding doesn't make the output port mandatory.
> >> +		 */
> >> +		dev_dbg(hdmi->dev, "Missing endpoint in port@%u\n",
> >> +			hdmi->plat_data->output_port);
> >> +		return 0;
> 
> After this series only rcar-du set output_port so this block should only
> run for rcar-du, for platforms without output_port the if-statement
> for !hdmi->plat_data->output_port already return success so you can
> probably return fatal error here.
> 
> The comment is a little bit misleading because of the if-statement above
> or am I missing something?

You're right, I'll turn this into an error.

> >> +	}
> >> +
> >> +	remote = of_graph_get_remote_port_parent(endpoint);
> >> +	of_node_put(endpoint);
> >> +	if (!remote) {
> >> +		dev_err(hdmi->dev, "Endpoint in port@%u unconnected\n",
> >> +			hdmi->plat_data->output_port);
> >> +		return -ENODEV;
> >> +	}
> >> +
> >> +	if (!of_device_is_available(remote)) {
> >> +		dev_err(hdmi->dev, "port@%u remote device is disabled\n",
> >> +			hdmi->plat_data->output_port);
> >> +		of_node_put(remote);
> >> +		return -ENODEV;
> >> +	}
> >> +
> >> +	hdmi->next_bridge = of_drm_find_bridge(remote);
> >> +	of_node_put(remote);
> >> +	if (!hdmi->next_bridge)
> >> +		return -EPROBE_DEFER;
> > 
> > I'll be safer to print a warn for now until all platforms has been tested.
> > 
> >> +
> >> +	return 0;
> >> +}
> >> +
> >>  static struct dw_hdmi *
> >>  __dw_hdmi_probe(struct platform_device *pdev,
> >>  		const struct dw_hdmi_plat_data *plat_data)
> >> @@ -3216,6 +3262,10 @@ __dw_hdmi_probe(struct platform_device *pdev,
> >>  	mutex_init(&hdmi->cec_notifier_mutex);
> >>  	spin_lock_init(&hdmi->audio_lock);
> >>  
> >> +	ret = dw_hdmi_parse_dt(hdmi);
> >> +	if (ret < 0)
> >> +		return ERR_PTR(ret);
> >> +
> >>  	ddc_node = of_parse_phandle(np, "ddc-i2c-bus", 0);
> >>  	if (ddc_node) {
> >>  		hdmi->ddc = of_get_i2c_adapter_by_node(ddc_node);
> >> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> >> index ea34ca146b82..8ebeb65d6371 100644
> >> --- a/include/drm/bridge/dw_hdmi.h
> >> +++ b/include/drm/bridge/dw_hdmi.h
> >> @@ -126,6 +126,8 @@ struct dw_hdmi_phy_ops {
> >>  struct dw_hdmi_plat_data {
> >>  	struct regmap *regm;
> >>  
> >> +	unsigned int output_port;
> >> +
> >>  	unsigned long input_bus_encoding;
> >>  	bool use_drm_infoframe;
> >>  	bool ycbcr_420_allowed;
> >>
> > 
> > I must check on meson, since I'm not sure for now if the connector probes.
> > 
> > Anyway, this looks fine.
> > 
> > Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> > 

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
