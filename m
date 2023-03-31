Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F29846D1CE2
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A00010F135;
	Fri, 31 Mar 2023 09:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7F410F135
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 09:47:43 +0000 (UTC)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id B45A5207CC;
 Fri, 31 Mar 2023 11:47:41 +0200 (CEST)
Date: Fri, 31 Mar 2023 11:47:39 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 2/2] drm/bridge: ti-sn65dsi83: Add DSI video mode
 configuration
Message-ID: <ZCasOyfXOMTzzZ8s@francesco-nb.int.toradex.com>
References: <20230330101752.429804-1-francesco@dolcini.it>
 <20230330101752.429804-3-francesco@dolcini.it>
 <6a386ff3-2af6-a544-674f-7c60d4d89e4e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a386ff3-2af6-a544-674f-7c60d4d89e4e@linaro.org>
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
Cc: Marek Vasut <marex@denx.de>, Robert Foss <rfoss@kernel.org>,
 Francesco Dolcini <francesco@dolcini.it>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 11:06:44AM +0200, Neil Armstrong wrote:
> Hi,
> 
> On 30/03/2023 12:17, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > 
> > Enable configuration of the DSI video mode instead of hard-coding
> > MIPI_DSI_MODE_VIDEO_BURST. The bridge support any of burst-mode,
> > non-burst with sync event or non-burst with sync pulse
> > 
> > With this change is possible to use the bridge with host DSI
> > that do not support burst mode.
> > 
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> >   drivers/gpu/drm/bridge/ti-sn65dsi83.c | 24 +++++++++++++++++++++++-
> >   1 file changed, 23 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > index 91ecfbe45bf9..144d0de0d278 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > @@ -145,6 +145,7 @@ struct sn65dsi83 {
> >   	struct drm_bridge		*panel_bridge;
> >   	struct gpio_desc		*enable_gpio;
> >   	struct regulator		*vcc;
> > +	u32				dsi_video_mode;
> >   	bool				lvds_dual_link;
> >   	bool				lvds_dual_link_even_odd_swap;
> >   };
> > @@ -603,6 +604,9 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
> >   		return dev_err_probe(dev, PTR_ERR(ctx->vcc),
> >   				     "Failed to get supply 'vcc'\n");
> > +	ctx->dsi_video_mode = 0;
> > +	of_property_read_u32(dev->of_node, "dsi-video-mode", &ctx->dsi_video_mode);
> > +
> >   	return 0;
> >   }
> > @@ -642,7 +646,25 @@ static int sn65dsi83_host_attach(struct sn65dsi83 *ctx)
> >   	dsi->lanes = dsi_lanes;
> >   	dsi->format = MIPI_DSI_FMT_RGB888;
> > -	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST;
> > +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
> > +
> > +	switch (ctx->dsi_video_mode) {
> > +	case 0:
> > +		/* burst mode */
> > +		dsi->mode_flags |= MIPI_DSI_MODE_VIDEO_BURST;
> > +		break;
> > +	case 1:
> > +		/* non-burst mode with sync event */
> > +		break;
> > +	case 2:
> > +		/* non-burst mode with sync pulse */
> > +		dsi->mode_flags |= MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
> > +		break;
> > +	default:
> > +		dev_warn(dev, "invalid video mode %d\n", ctx->dsi_video_mode);
> > +		break;
> > +	}
> > +
> >   	ret = devm_mipi_dsi_attach(dev, dsi);
> >   	if (ret < 0) {
> 
> As I understand from DSI spec is that those are dynamic, so they are hardcoded in driver now
> but they shouldn't be hardcoded in DT.
> 
> The problem is larger and we should add some sort of "supported features" we can get
> from the DSI controller and set the flags accordingly because the features support accross the
> DSI controllers isn't linear.

I need to change this since I do have a bridge that does not support
DSI video burst mode, while the ti-sn65 supports really any mode.

The change here is the same as what is done for the raydium,rm67191
panel, see Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
and drivers/gpu/drm/panel/panel-raydium-rm67191.c.

What's wrong to have this in the dts so that a panel can explicitly tell
which DSI video mode it expects?

Francesco

