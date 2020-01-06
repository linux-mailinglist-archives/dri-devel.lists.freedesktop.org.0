Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 780291310C2
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 11:48:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33D96E252;
	Mon,  6 Jan 2020 10:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48EAA6E252
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 10:48:05 +0000 (UTC)
Received: from ip5f5a5f74.dynamic.kabel-deutschland.de ([95.90.95.116]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1ioPvN-0004Qj-NI; Mon, 06 Jan 2020 11:47:53 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Yannick FERTRE <yannick.fertre@st.com>
Subject: Re: [PATCH] drm/bridge/synopsys: dsi: use mipi_dsi_device to find
 panel or bridge
Date: Mon, 06 Jan 2020 11:47:53 +0100
Message-ID: <5440050.dOyRey5V17@diego>
In-Reply-To: <00359841-35ab-e1bb-5750-fe83f81aeef0@st.com>
References: <20191217224150.20540-1-heiko@sntech.de>
 <00359841-35ab-e1bb-5750-fe83f81aeef0@st.com>
MIME-Version: 1.0
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
Cc: "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "maxime@cerno.tech" <maxime@cerno.tech>,
 "christoph.muellner@theobroma-systems.com"
 <christoph.muellner@theobroma-systems.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yannick,

Am Freitag, 20. Dezember 2019, 16:52:47 CET schrieb Yannick FERTRE:
> Hello Heiko,
> I test with success your patch on a board stm32mp1 with a panel raydium 
> rm68200.
> I need more time to test with a HDMI bridge  like ad7533.

I guess this was too short before the holiday season, so just a soft reminder,
that you wanted to check that on that mentioned hdmi bridge :-)


Thanks
Heiko


> On 12/17/19 11:41 PM, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> >
> > Right now the dsi driver uses drm_of_find_panel_or_bridge() to find a
> > connected panel or bridge. But this requires an of-graph connection
> > between the dsi-host and dsi-device, where normal bindings for regular
> > panels just expect the dsi device to be a subnode of the actual dsi host
> > not requiring ports.
> >
> > drm_of_find_panel_or_bridge is used to find panel/bridge under the actual
> > device-node of the dsi device, but as this happens in the dsi_host_attach
> > callback we already have the dsi-device and its device-node available and
> > therefore can just call the relevant panel+bridge functions ourself,
> > making it work as well in setups without port-connections.
> >
> > Tested on a Rockchip px30 single-dsi with panels form Leadtek and Xinpeng
> > as well on Gru-Scarlet (rk3399) with dual-dsi (and thus port-connections
> > to both dsi controllers) connected to the Innotek display variant.
> >
> > changes in v2:
> > - rework commit message, rereading what I had written was just too
> >    cringe-worthy ;-)
> >
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> > ---
> >   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 17 ++++++++++-------
> >   1 file changed, 10 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> > index 981d532cdd59..4b4961e7c680 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> > @@ -26,6 +26,7 @@
> >   #include <drm/drm_mipi_dsi.h>
> >   #include <drm/drm_modes.h>
> >   #include <drm/drm_of.h>
> > +#include <drm/drm_panel.h>
> >   #include <drm/drm_print.h>
> >   #include <drm/drm_probe_helper.h>
> >   
> > @@ -310,16 +311,16 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
> >   	dsi->format = device->format;
> >   	dsi->mode_flags = device->mode_flags;
> >   
> > -	ret = drm_of_find_panel_or_bridge(host->dev->of_node, 1, 0,
> > -					  &panel, &bridge);
> > -	if (ret)
> > -		return ret;
> > -
> > -	if (panel) {
> > +	panel = of_drm_find_panel(device->dev.of_node);
> > +	if (!IS_ERR(panel)) {
> >   		bridge = drm_panel_bridge_add_typed(panel,
> >   						    DRM_MODE_CONNECTOR_DSI);
> >   		if (IS_ERR(bridge))
> >   			return PTR_ERR(bridge);
> > +	} else {
> > +		bridge = of_drm_find_bridge(device->dev.of_node);
> > +		if (!bridge)
> > +			return -EPROBE_DEFER;
> >   	}
> >   
> >   	dsi->panel_bridge = bridge;
> > @@ -340,6 +341,7 @@ static int dw_mipi_dsi_host_detach(struct mipi_dsi_host *host,
> >   {
> >   	struct dw_mipi_dsi *dsi = host_to_dsi(host);
> >   	const struct dw_mipi_dsi_plat_data *pdata = dsi->plat_data;
> > +	struct drm_bridge *bridge;
> >   	int ret;
> >   
> >   	if (pdata->host_ops && pdata->host_ops->detach) {
> > @@ -348,7 +350,8 @@ static int dw_mipi_dsi_host_detach(struct mipi_dsi_host *host,
> >   			return ret;
> >   	}
> >   
> > -	drm_of_panel_bridge_remove(host->dev->of_node, 1, 0);
> > +	bridge = of_drm_find_bridge(device->dev.of_node);
> > +	drm_panel_bridge_remove(bridge);
> >   
> >   	drm_bridge_remove(&dsi->bridge);
> >   
> 




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
