Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 570F4416A01
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 04:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372B46EDD8;
	Fri, 24 Sep 2021 02:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8BF6EDD8;
 Fri, 24 Sep 2021 02:26:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C17E458B;
 Fri, 24 Sep 2021 04:25:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1632450358;
 bh=45e1RdVipct+ZYgoBCG59Y1r2CqJIiDZM00tNcmo9cw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lSWHnGvkX11Tky0znlaLjMETSaEQ7jIikpeUFmvnDesmOwI8Jp14TnLq9qdo1Aja9
 Hvgw/Y8YwpLOU+SK4X2IHk1RTVHw6kUnKVbG2r+h/j4xg1rdUF/Zaar9xTnEUIC3Nc
 nczMoz4hMNDQu045FhKIcOhUdXZKSjfnJVw3/PWw=
Date: Fri, 24 Sep 2021 05:25:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>,
 Rob Clark <robdclark@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] drm/bridge: ti-sn65dsi86: Add NO_CONNECTOR support
Message-ID: <YU03M+CXJ+ALi8De@pendragon.ideasonboard.com>
References: <20210920225801.227211-1-robdclark@gmail.com>
 <20210920225801.227211-4-robdclark@gmail.com>
 <YUvN3j0v+8NMjNte@pendragon.ideasonboard.com>
 <CAF6AEGviyfX6+c-CB5gMXqRQfHhvb5L8t++-VkZpvS3r9qDNoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAF6AEGviyfX6+c-CB5gMXqRQfHhvb5L8t++-VkZpvS3r9qDNoA@mail.gmail.com>
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

Hi Rob,

On Thu, Sep 23, 2021 at 10:31:52AM -0700, Rob Clark wrote:
> On Wed, Sep 22, 2021 at 5:44 PM Laurent Pinchart wrote:
> > On Mon, Sep 20, 2021 at 03:58:00PM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Slightly awkward to fish out the display_info when we aren't creating
> > > own connector.  But I don't see an obvious better way.
> > >
> > > v2: Remove error return with NO_CONNECTOR flag
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 39 ++++++++++++++++++++-------
> > >  1 file changed, 29 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > index 6154bed0af5b..94c94cc8a4d8 100644
> > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > @@ -667,11 +667,6 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
> > >                                                  .node = NULL,
> > >                                                };
> > >
> > > -     if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> > > -             DRM_ERROR("Fix bridge driver to make connector optional!");
> > > -             return -EINVAL;
> > > -     }
> > > -
> > >       pdata->aux.drm_dev = bridge->dev;
> > >       ret = drm_dp_aux_register(&pdata->aux);
> > >       if (ret < 0) {
> > > @@ -679,9 +674,11 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
> > >               return ret;
> > >       }
> > >
> > > -     ret = ti_sn_bridge_connector_init(pdata);
> > > -     if (ret < 0)
> > > -             goto err_conn_init;
> > > +     if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> > > +             ret = ti_sn_bridge_connector_init(pdata);
> > > +             if (ret < 0)
> > > +                     goto err_conn_init;
> > > +     }
> > >
> > >       /*
> > >        * TODO: ideally finding host resource and dsi dev registration needs
> > > @@ -743,7 +740,8 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
> > >  err_dsi_attach:
> > >       mipi_dsi_device_unregister(dsi);
> > >  err_dsi_host:
> > > -     drm_connector_cleanup(&pdata->connector);
> > > +     if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
> > > +             drm_connector_cleanup(&pdata->connector);
> >
> > I wonder if we actually need this. The connector gets attached to the
> > encoder, won't it be destroyed by the DRM core in the error path ?
> 
> This does not appear to be the case, we leak the connector if I remove
> this (and add a hack to trigger the error path)

OK.

> > >  err_conn_init:
> > >       drm_dp_aux_unregister(&pdata->aux);
> > >       return ret;
> > > @@ -792,9 +790,30 @@ static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
> > >       regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
> > >  }
> > >
> > > +/*
> > > + * Find the connector and fish out the bpc from display_info.  It would
> > > + * be nice if we could get this instead from drm_bridge_state, but that
> > > + * doesn't yet appear to be the case.
> >
> > You already have a bus format in the bridge state, from which you can
> > derive the bpp. Could you give it a try ?
> 
> Possibly the bridge should be converted to ->atomic_enable(), etc..
> I'll leave that for another time

It should be fairly straightforward, and would avoid the hack below.

> > > + */
> > >  static unsigned int ti_sn_bridge_get_bpp(struct ti_sn65dsi86 *pdata)
> > >  {
> > > -     if (pdata->connector.display_info.bpc <= 6)
> > > +     struct drm_bridge *bridge = &pdata->bridge;
> > > +     struct drm_connector_list_iter conn_iter;
> > > +     struct drm_connector *connector;
> > > +     unsigned bpc = 0;
> > > +
> > > +     drm_connector_list_iter_begin(bridge->dev, &conn_iter);
> > > +     drm_for_each_connector_iter(connector, &conn_iter) {
> > > +             if (drm_connector_has_possible_encoder(connector, bridge->encoder)) {
> > > +                     bpc = connector->display_info.bpc;
> > > +                     break;
> > > +             }
> > > +     }
> > > +     drm_connector_list_iter_end(&conn_iter);
> > > +
> > > +     WARN_ON(bpc == 0);
> > > +
> > > +     if (bpc <= 6)
> > >               return 18;
> > >       else
> > >               return 24;

-- 
Regards,

Laurent Pinchart
