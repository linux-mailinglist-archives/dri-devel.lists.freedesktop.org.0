Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F0F7342AA
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 19:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2419D10E09D;
	Sat, 17 Jun 2023 17:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF8CD10E09D
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 17:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1687023562; bh=QNi/M5o8tjco+bs7ZpJCM0M69P+WYpwoTdiw6C3GKjE=;
 h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
 b=UCIIzZ1fZOAmlu5KBcigaoZdJeiQl5iQTvp+Em63hxeUFHVFV0VMqbdaea4EWAXd2
 zyNzLyQg4BvC6r1dp/bhnPzsSPmgYTl4xVte++3qTqVUnvPkrzgeQA3QaLX1yeaBJF
 kDvybXs2TotdiXv1/jxmESYHIbhgHQkxRY9Yky/I=
Date: Sat, 17 Jun 2023 19:39:22 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm: bridge: dw-mipi-dsi: Fix enable/disable of DSI
 controller
Message-ID: <nm7nwmftzsjafovdprobzpuat6hrm6rghishgywww7qtul5skp@mihpqbpre3e5>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
 Sam Ravnborg <sam@ravnborg.org>, linux-rockchip@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20230617150643.1808409-1-megi@xff.cz>
 <20230617173553.GA1843063@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230617173553.GA1843063@ravnborg.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-rockchip@lists.infradead.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Sam,

On Sat, Jun 17, 2023 at 07:35:53PM +0200, Sam Ravnborg wrote:
> 
> Hi Ondřej,
> 
> On Sat, Jun 17, 2023 at 05:06:33PM +0200, Ondřej Jirman wrote:
> > From: Ondrej Jirman <megi@xff.cz>
> > 
> > Before this patch, booting to Linux VT and doing a simple:
> > 
> >   echo 2 > /sys/class/graphics/fb0/blank
> >   echo 0 > /sys/class/graphics/fb0/blank
> > 
> > would result in failures to re-enable the panel. Mode set callback is
> > called only once during boot in this scenario, while calls to
> > enable/disable callbacks are balanced afterwards. The driver doesn't
> > work unless userspace calls modeset before enabling the CRTC/connector.
> > 
> > This patch moves enabling of the DSI host from mode_set into pre_enable
> > callback, and removes some old hacks where this bridge driver is
> > directly calling into other bridge driver's callbacks.
> > 
> > pre_enable_prev_first flag is set on the panel's bridge so that panel
> > drivers will get their prepare function called between DSI host's
> > pre_enable and enable callbacks, so that they get a chance to
> > perform panel setup while DSI host is already enabled in command
> > mode. Otherwise panel's prepare would be called before DSI host
> > is enabled, and any DSI communication used in prepare callback
> > would fail.
> > 
> > With all these changes, the enable/disable sequence is now well
> > balanced, and host's and panel's callbacks are called in proper order
> > documented in the drm_panel API documentation without needing the old
> > hacks. (Mainly that panel->prepare is called when DSI host is ready to
> > allow the panel driver to send DSI commands and vice versa during
> > disable.)
> > 
> > Tested on Pinephone Pro. Trace of the callbacks follows.
> > 
> > Before:
> > 
> > [    1.253882] dw-mipi-dsi-rockchip ff960000.dsi: mode_set
> > [    1.290732] panel-himax-hx8394 ff960000.dsi.0: prepare
> > [    1.475576] dw-mipi-dsi-rockchip ff960000.dsi: enable
> > [    1.475593] panel-himax-hx8394 ff960000.dsi.0: enable
> > 
> > echo 2 > /sys/class/graphics/fb0/blank
> > 
> > [   13.722799] panel-himax-hx8394 ff960000.dsi.0: disable
> > [   13.774502] dw-mipi-dsi-rockchip ff960000.dsi: post_disable
> > [   13.774526] panel-himax-hx8394 ff960000.dsi.0: unprepare
> > 
> > echo 0 > /sys/class/graphics/fb0/blank
> > 
> > [   17.735796] panel-himax-hx8394 ff960000.dsi.0: prepare
> > [   17.923522] dw-mipi-dsi-rockchip ff960000.dsi: enable
> > [   17.923540] panel-himax-hx8394 ff960000.dsi.0: enable
> > [   17.944330] dw-mipi-dsi-rockchip ff960000.dsi: failed to write command FIFO
> > [   17.944335] panel-himax-hx8394 ff960000.dsi.0: sending command 0xb9 failed: -110
> > [   17.944340] panel-himax-hx8394 ff960000.dsi.0: Panel init sequence failed: -110
> > 
> > echo 2 > /sys/class/graphics/fb0/blank
> > 
> > [  431.148583] panel-himax-hx8394 ff960000.dsi.0: disable
> > [  431.169259] dw-mipi-dsi-rockchip ff960000.dsi: failed to write command FIFO
> > [  431.169268] panel-himax-hx8394 ff960000.dsi.0: Failed to enter sleep mode: -110
> > [  431.169282] dw-mipi-dsi-rockchip ff960000.dsi: post_disable
> > [  431.169316] panel-himax-hx8394 ff960000.dsi.0: unprepare
> > [  431.169357] pclk_mipi_dsi0 already disabled
> > 
> > echo 0 > /sys/class/graphics/fb0/blank
> > 
> > [  432.796851] panel-himax-hx8394 ff960000.dsi.0: prepare
> > [  432.981537] dw-mipi-dsi-rockchip ff960000.dsi: enable
> > [  432.981568] panel-himax-hx8394 ff960000.dsi.0: enable
> > [  433.002290] dw-mipi-dsi-rockchip ff960000.dsi: failed to write command FIFO
> > [  433.002299] panel-himax-hx8394 ff960000.dsi.0: sending command 0xb9 failed: -110
> > [  433.002312] panel-himax-hx8394 ff960000.dsi.0: Panel init sequence failed: -110
> > 
> > -----------------------------------------------------------------------
> > 
> > After:
> > 
> > [    1.248372] dw-mipi-dsi-rockchip ff960000.dsi: mode_set
> > [    1.248704] dw-mipi-dsi-rockchip ff960000.dsi: pre_enable
> > [    1.285377] panel-himax-hx8394 ff960000.dsi.0: prepare
> > [    1.468392] dw-mipi-dsi-rockchip ff960000.dsi: enable
> > [    1.468421] panel-himax-hx8394 ff960000.dsi.0: enable
> > 
> > echo 2 > /sys/class/graphics/fb0/blank
> > 
> > [   16.210357] panel-himax-hx8394 ff960000.dsi.0: disable
> > [   16.261315] dw-mipi-dsi-rockchip ff960000.dsi: post_disable
> > [   16.261339] panel-himax-hx8394 ff960000.dsi.0: unprepare
> > 
> > echo 0 > /sys/class/graphics/fb0/blank
> > 
> > [   19.161453] dw-mipi-dsi-rockchip ff960000.dsi: pre_enable
> > [   19.197869] panel-himax-hx8394 ff960000.dsi.0: prepare
> > [   19.382141] dw-mipi-dsi-rockchip ff960000.dsi: enable
> > [   19.382158] panel-himax-hx8394 ff960000.dsi.0: enable
> > 
> > Signed-off-by: Ondrej Jirman <megi@xff.cz>
> 
> Nice cleanup and fix.
> Have you consider if this need a Fixes: ?

It might be useful, I'll hunt for some some useful base for a Fixes tag.

> 
> > ---
> >  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 28 +++++++++++--------
> >  1 file changed, 16 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> > index b2efecf7d160..352c6829259a 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> > @@ -265,6 +265,7 @@ struct dw_mipi_dsi {
> >  	struct dw_mipi_dsi *master; /* dual-dsi master ptr */
> >  	struct dw_mipi_dsi *slave; /* dual-dsi slave ptr */
> >  
> > +	struct drm_display_mode mode;
> >  	const struct dw_mipi_dsi_plat_data *plat_data;
> >  };
> >  
> > @@ -332,6 +333,7 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
> >  	if (IS_ERR(bridge))
> >  		return PTR_ERR(bridge);
> >  
> > +	bridge->pre_enable_prev_first = true;
> >  	dsi->panel_bridge = bridge;
> >  
> >  	drm_bridge_add(&dsi->bridge);
> > @@ -859,15 +861,6 @@ static void dw_mipi_dsi_bridge_post_atomic_disable(struct drm_bridge *bridge,
> >  	 */
> >  	dw_mipi_dsi_set_mode(dsi, 0);
> >  
> > -	/*
> > -	 * TODO Only way found to call panel-bridge post_disable &
> > -	 * panel unprepare before the dsi "final" disable...
> > -	 * This needs to be fixed in the drm_bridge framework and the API
> > -	 * needs to be updated to manage our own call chains...
> > -	 */
> > -	if (dsi->panel_bridge->funcs->post_disable)
> > -		dsi->panel_bridge->funcs->post_disable(dsi->panel_bridge);
> > -
> >  	if (phy_ops->power_off)
> >  		phy_ops->power_off(dsi->plat_data->priv_data);
> >  
> > @@ -942,15 +935,25 @@ static void dw_mipi_dsi_mode_set(struct dw_mipi_dsi *dsi,
> >  		phy_ops->power_on(dsi->plat_data->priv_data);
> >  }
> >  
> > +static void dw_mipi_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> > +						 struct drm_bridge_state *old_bridge_state)
> > +{
> > +	struct dw_mipi_dsi *dsi = bridge_to_dsi(bridge);
> > +
> > +	/* Power up the dsi ctl into a command mode */
> > +	dw_mipi_dsi_mode_set(dsi, &dsi->mode);
> > +	if (dsi->slave)
> > +		dw_mipi_dsi_mode_set(dsi->slave, &dsi->mode);
> > +}
> > +
> >  static void dw_mipi_dsi_bridge_mode_set(struct drm_bridge *bridge,
> >  					const struct drm_display_mode *mode,
> >  					const struct drm_display_mode *adjusted_mode)
> >  {
> >  	struct dw_mipi_dsi *dsi = bridge_to_dsi(bridge);
> >  
> > -	dw_mipi_dsi_mode_set(dsi, adjusted_mode);
> > -	if (dsi->slave)
> > -		dw_mipi_dsi_mode_set(dsi->slave, adjusted_mode);
> > +	/* Store the display mode for later use in pre_enable callback */
> > +	memcpy(&dsi->mode, adjusted_mode, sizeof(dsi->mode));
> >  }
> Use drm_mode_copy here.

Ok.

> With this fixed:
> 
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

thank you,
	Ondrej
