Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D73441D3516
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 17:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51666EB64;
	Thu, 14 May 2020 15:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48AF66EB64
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 15:29:24 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 056CF259;
 Thu, 14 May 2020 17:29:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1589470162;
 bh=eCF5D9pwtfO0/OIXpwaQAOnWwlWn8b2DFTQIONr8n/o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CwFa39jP/Rbjgw3yDyxA5hiB44LOj1EN79KhDnHbnsVYMkmgPJShRm50BLyFMOyMT
 hp9ohhmqY+BDgpGQF2/mUfhchjcBEDKUDfVUgIMMYyP96omr4mDIGItvswTKG01xgr
 D/Ju3znemXmghwCTDvtuoWT6taxq7wzS/IC2etRI=
Date: Thu, 14 May 2020 18:28:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/2] drm: bridge: dw-hdmi: Pass dw_hdmi pointer to
 .mode_valid() operation
Message-ID: <20200514152809.GH5955@pendragon.ideasonboard.com>
References: <20200514011707.6512-1-laurent.pinchart+renesas@ideasonboard.com>
 <8dd2e65a-804d-2764-5a0b-e9e0286afa68@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8dd2e65a-804d-2764-5a0b-e9e0286afa68@baylibre.com>
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
 Jonas Karlman <jonas@kwiboo.se>, Sandy Huang <hjc@rock-chips.com>,
 linux-renesas-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

On Thu, May 14, 2020 at 11:15:52AM +0200, Neil Armstrong wrote:
> On 14/05/2020 03:17, Laurent Pinchart wrote:
> > Platform glue drivers for dw_hdmi may need to access device-specific
> > data from their .mode_valid() implementation. They currently have no
> > clean way to do so, and one driver hacks around it by accessing the
> > dev_private data of the drm_device retrieved from the connector.
> > 
> > Pass the dw_hdmi pointer to .mode_valid() in order give context
> > information to drivers, and add a dw_hdmi_device() to retrieve the
> > struct device related to the context.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c   | 13 ++++++++++++-
> >  drivers/gpu/drm/imx/dw_hdmi-imx.c           |  4 ++--
> >  drivers/gpu/drm/meson/meson_dw_hdmi.c       |  3 ++-
> >  drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c      |  2 +-
> >  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c |  3 ++-
> >  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c       |  6 ++++--
> >  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h       |  3 ++-
> >  include/drm/bridge/dw_hdmi.h                |  4 +++-
> >  8 files changed, 28 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > index 30681398cfb0..97c7a9a4983c 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > @@ -2778,7 +2778,8 @@ dw_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
> >  		return MODE_BAD;
> >  
> >  	if (hdmi->plat_data->mode_valid)
> > -		mode_status = hdmi->plat_data->mode_valid(connector, mode);
> > +		mode_status = hdmi->plat_data->mode_valid(hdmi, connector,
> > +							  mode);
> 
> Can't it pass `struct dw_hdmi *hdmi, void *data` like the phy_ops ?

We could, if we had a void *data pointer :-) The PHY ops have a void
*phy_data in dw_hdmi_plat_data, but for .mode_valid() (and
.configure_phy()) we don't have a data field. Would you add one to
dw_hdmi_plat_data ? I wonder which of them should be passed to
.configure_phy() in that case, as it's a PHY-related function, but not
applicable to vendor PHYs. dw_hdmi_plat_data is quite messy :-S

I wonder if we could merge all private data. Or do you think the PHY ops
and the other ops would be handled by different pieces of code that
would each require their own private data ?

> >  
> >  	return mode_status;
> >  }
> > @@ -3395,6 +3396,16 @@ static void __dw_hdmi_remove(struct dw_hdmi *hdmi)
> >  		i2c_put_adapter(hdmi->ddc);
> >  }
> >  
> > +/*
> > + * Retrieve the device passed to the dw_hdmi_probe() or dw_hdmi_bind()
> > + * functions.
> > + */
> > +struct device *dw_hdmi_device(struct dw_hdmi *hdmi)
> > +{
> > +	return hdmi->dev;
> > +}
> > +EXPORT_SYMBOL_GPL(dw_hdmi_device);
> 
> This looks really hackish, passing data like the phy_ops looks cleaner.
> 
> > +
> >  /* -----------------------------------------------------------------------------
> >   * Probe/remove API, used from platforms based on the DRM bridge API.
> >   */
> > diff --git a/drivers/gpu/drm/imx/dw_hdmi-imx.c b/drivers/gpu/drm/imx/dw_hdmi-imx.c
> > index ba4ca17fd4d8..ff5b03a4a86a 100644
> > --- a/drivers/gpu/drm/imx/dw_hdmi-imx.c
> > +++ b/drivers/gpu/drm/imx/dw_hdmi-imx.c
> > @@ -145,7 +145,7 @@ static const struct drm_encoder_helper_funcs dw_hdmi_imx_encoder_helper_funcs =
> >  };
> >  
> >  static enum drm_mode_status
> > -imx6q_hdmi_mode_valid(struct drm_connector *con,
> > +imx6q_hdmi_mode_valid(struct dw_hdmi *hdmi, struct drm_connector *con,
> >  		      const struct drm_display_mode *mode)
> >  {
> >  	if (mode->clock < 13500)
> > @@ -158,7 +158,7 @@ imx6q_hdmi_mode_valid(struct drm_connector *con,
> >  }
> >  
> >  static enum drm_mode_status
> > -imx6dl_hdmi_mode_valid(struct drm_connector *con,
> > +imx6dl_hdmi_mode_valid(struct dw_hdmi *hdmi, struct drm_connector *con,
> >  		       const struct drm_display_mode *mode)
> >  {
> >  	if (mode->clock < 13500)
> > diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> > index 5be963e9db05..174d45ecdeda 100644
> > --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> > +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> > @@ -630,7 +630,8 @@ static irqreturn_t dw_hdmi_top_thread_irq(int irq, void *dev_id)
> >  }
> >  
> >  static enum drm_mode_status
> > -dw_hdmi_mode_valid(struct drm_connector *connector,
> > +dw_hdmi_mode_valid(struct dw_hdmi *hdmi,
> > +		   struct drm_connector *connector,
> >  		   const struct drm_display_mode *mode)
> >  {
> >  	struct meson_drm *priv = connector->dev->dev_private;
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
> > index 452461dc96f2..3d2fdbeeb82d 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
> > @@ -38,7 +38,7 @@ static const struct rcar_hdmi_phy_params rcar_hdmi_phy_params[] = {
> >  };
> >  
> >  static enum drm_mode_status
> > -rcar_hdmi_mode_valid(struct drm_connector *connector,
> > +rcar_hdmi_mode_valid(struct dw_hdmi *hdmi, struct drm_connector *connector,
> >  		     const struct drm_display_mode *mode)
> >  {
> >  	/*
> > diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> > index 121aa8a63a76..32acfe2c3f58 100644
> > --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> > +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> > @@ -220,7 +220,8 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
> >  }
> >  
> >  static enum drm_mode_status
> > -dw_hdmi_rockchip_mode_valid(struct drm_connector *connector,
> > +dw_hdmi_rockchip_mode_valid(struct dw_hdmi *hdmi,
> > +			    struct drm_connector *connector,
> >  			    const struct drm_display_mode *mode)
> >  {
> >  	const struct dw_hdmi_mpll_config *mpll_cfg = rockchip_mpll_cfg;
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> > index 972682bb8000..055ffefd1b60 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> > @@ -31,7 +31,8 @@ sun8i_dw_hdmi_encoder_helper_funcs = {
> >  };
> >  
> >  static enum drm_mode_status
> > -sun8i_dw_hdmi_mode_valid_a83t(struct drm_connector *connector,
> > +sun8i_dw_hdmi_mode_valid_a83t(struct dw_hdmi *hdmi,
> > +			      struct drm_connector *connector,
> >  			      const struct drm_display_mode *mode)
> >  {
> >  	if (mode->clock > 297000)
> > @@ -41,7 +42,8 @@ sun8i_dw_hdmi_mode_valid_a83t(struct drm_connector *connector,
> >  }
> >  
> >  static enum drm_mode_status
> > -sun8i_dw_hdmi_mode_valid_h6(struct drm_connector *connector,
> > +sun8i_dw_hdmi_mode_valid_h6(struct dw_hdmi *hdmi,
> > +			    struct drm_connector *connector,
> >  			    const struct drm_display_mode *mode)
> >  {
> >  	/*
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> > index 8e64945167e9..f831cb351d72 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> > +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
> > @@ -176,7 +176,8 @@ struct sun8i_hdmi_phy {
> >  };
> >  
> >  struct sun8i_dw_hdmi_quirks {
> > -	enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
> > +	enum drm_mode_status (*mode_valid)(struct dw_hdmi *hdmi,
> > +					   struct drm_connector *connector,
> >  					   const struct drm_display_mode *mode);
> >  	unsigned int set_rate : 1;
> >  	unsigned int use_drm_infoframe : 1;
> > diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> > index 0b34a12c4a1c..c98010a53683 100644
> > --- a/include/drm/bridge/dw_hdmi.h
> > +++ b/include/drm/bridge/dw_hdmi.h
> > @@ -124,7 +124,8 @@ struct dw_hdmi_phy_ops {
> >  
> >  struct dw_hdmi_plat_data {
> >  	struct regmap *regm;
> > -	enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
> > +	enum drm_mode_status (*mode_valid)(struct dw_hdmi *hdmi,
> > +					   struct drm_connector *connector,
> >  					   const struct drm_display_mode *mode);
> >  	unsigned long input_bus_format;
> >  	unsigned long input_bus_encoding;
> > @@ -153,6 +154,7 @@ void dw_hdmi_unbind(struct dw_hdmi *hdmi);
> >  struct dw_hdmi *dw_hdmi_bind(struct platform_device *pdev,
> >  			     struct drm_encoder *encoder,
> >  			     const struct dw_hdmi_plat_data *plat_data);
> > +struct device *dw_hdmi_device(struct dw_hdmi *hdmi);
> >  
> >  void dw_hdmi_resume(struct dw_hdmi *hdmi);
> >  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
