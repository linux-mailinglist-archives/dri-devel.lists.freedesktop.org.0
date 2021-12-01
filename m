Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA45464609
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 05:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846A96E4B5;
	Wed,  1 Dec 2021 04:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0DD6E4B5
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 04:40:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0231AA15;
 Wed,  1 Dec 2021 05:40:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1638333618;
 bh=8VN2j4uJzeEwURf5h3e5B07WTOsIM2x5UrMpvp3kHjA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WO34FAJvjq8befW0H7YxdnU9eHf/N3NusxfPF4KAqQB6qwMLCUNck16TykouObJZj
 GYtidFM3FDzgJsHZxFsMs2ODdSpPAjERNOLTfnqbS49hcDrBG0/zrq/axlvrK4babD
 7GF+Q3TaYvHZiJcu7wlNcuu+/ZQznZIcWqSpedQQ=
Date: Wed, 1 Dec 2021 06:39:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 2/2] drm: rcar-du: mipi-dsi: Use
 devm_drm_of_get_bridge helper
Message-ID: <Yab8mQL7g/thyS00@pendragon.ideasonboard.com>
References: <20211130162513.2898302-1-kieran.bingham+renesas@ideasonboard.com>
 <20211130162513.2898302-3-kieran.bingham+renesas@ideasonboard.com>
 <163829113971.3059017.15142528562599981704@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <163829113971.3059017.15142528562599981704@Monstersaurus>
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
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kieran,

On Tue, Nov 30, 2021 at 04:52:19PM +0000, Kieran Bingham wrote:
> Quoting Kieran Bingham (2021-11-30 16:25:13)
> > Instead of open coding the calls for
> >   drm_of_find_panel_or_bridge()
> >   devm_drm_panel_bridge_add()
> > 
> > use the devm_drm_of_get_bridge() helper directly.
> > 
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > ---
> > v2:
> >  - New patch
> > 
> >  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 19 ++++---------------
> >  1 file changed, 4 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> > index 0a9f197ef62c..1dfe20d3d0f2 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> > @@ -637,7 +637,7 @@ static int rcar_mipi_dsi_host_attach(struct mipi_dsi_host *host,
> >                                         struct mipi_dsi_device *device)
> >  {
> >         struct rcar_mipi_dsi *dsi = host_to_rcar_mipi_dsi(host);
> > -       struct drm_panel *panel;
> > +       struct device *dev = dsi->dev;
> >         int ret;
> >  
> >         if (device->lanes > dsi->num_data_lanes)
> > @@ -646,20 +646,9 @@ static int rcar_mipi_dsi_host_attach(struct mipi_dsi_host *host,
> >         dsi->lanes = device->lanes;
> >         dsi->format = device->format;
> >  
> > -       ret = drm_of_find_panel_or_bridge(dsi->dev->of_node, 1, 0, &panel,
> > -                                         &dsi->next_bridge);
> > -       if (ret) {
> > -               dev_err_probe(dsi->dev, ret, "could not find next bridge\n");
> > -               return ret;
> > -       }
> > -
> > -       if (!dsi->next_bridge) {
> > -               dsi->next_bridge = devm_drm_panel_bridge_add(dsi->dev, panel);
> > -               if (IS_ERR(dsi->next_bridge)) {
> > -                       dev_err(dsi->dev, "failed to create panel bridge\n");
> > -                       return PTR_ERR(dsi->next_bridge);
> > -               }
> > -       }
> > +       dsi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> > +       if (IS_ERR(dsi->next_bridge))
> > +               return PTR_ERR(dsi->next_bridge);
> 
> I did make a change here to make this:
> 
> 	dsi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> 	if (IS_ERR(dsi->next_bridge)) {
> 		dev_err(dev, "failed to get next bridge\n");
> 		return PTR_ERR(dsi->next_bridge);
> 	}
> 
> But it seems I got out of sequence and saved out the wrong patch ;-(
> 
> If you think it's better with the error print, please add it while
> squashing, or if you really need, I can send an updated patch and
> retest.

I think an error message is useful, yes. I'll add it manually.

> >  
> >         /* Initialize the DRM bridge. */
> >         dsi->bridge.funcs = &rcar_mipi_dsi_bridge_ops;

-- 
Regards,

Laurent Pinchart
