Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DC2349ED0
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 02:40:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A821C6EE9D;
	Fri, 26 Mar 2021 01:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1496EE9D
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 01:40:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67754D88;
 Fri, 26 Mar 2021 02:40:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616722847;
 bh=h2FwEu3drCj/idGlDm1Qh/fxBEzSyoFGaJm6KvdDxQE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LvYrBilg3KRhou0l4UfF9AgnycCSaFGf82r2zP+fz/NcYbT2Fd0H0Kh+yXQk10ZCi
 FQ1PSyE4rm09dF5NN314Zvmm6LCpUABd+1dUPa6PljY7Q1dmX3F5+mLdnFgvXDzBIR
 DFZ8m+7yfX/htLr9y7D5R1VBTxtkXv5m4VXvHPx4=
Date: Fri, 26 Mar 2021 03:40:04 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [RFC PATCH 08/11] drm/bridge: ti-sn65dsi86: Implement bridge
 connector operations
Message-ID: <YF07dHgNlK1RqVUA@pendragon.ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-9-laurent.pinchart+renesas@ideasonboard.com>
 <CAD=FV=UPqg0CnA1ZFR70Ym+m6ROemdFbYwk_=C3+SemP1X9hYw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=UPqg0CnA1ZFR70Ym+m6ROemdFbYwk_=C3+SemP1X9hYw@mail.gmail.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

On Wed, Mar 24, 2021 at 03:46:28PM -0700, Doug Anderson wrote:
> On Sun, Mar 21, 2021 at 8:02 PM Laurent Pinchart wrote:
> >
> > Implement the bridge connector-related .get_edid() operation, and report
> > the related bridge capabilities and type. The .get_edid() operation is
> > implemented with the same backend as the EDID retrieval from the
> > connector .get_modes() operation.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 30 ++++++++++++++++++++++-----
> >  1 file changed, 25 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index dc300fab4319..6f6e075544e8 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -261,6 +261,18 @@ static void ti_sn_debugfs_remove(struct ti_sn_bridge *pdata)
> >         pdata->debugfs = NULL;
> >  }
> >
> > +static struct edid *__ti_sn_bridge_get_edid(struct ti_sn_bridge *pdata,
> > +                                           struct drm_connector *connector)
> > +{
> > +       struct edid *edid;
> > +
> > +       pm_runtime_get_sync(pdata->dev);
> > +       edid = drm_get_edid(connector, &pdata->aux.ddc);
> > +       pm_runtime_put(pdata->dev);
> 
> As mentioned in my patch [1], the above is a bit iffy for eDP.
> Specifically just doing a pm_runtime_get_sync() isn't enough to
> actually be able to read the EDID. We also need to do any panel power
> sequencing and potentially set the "ignore HPD" bit in the bridge to
> actually read the EDID.
> 
> I'll try to find some time to make this better--let's see if I get
> distracted before I manage it.

I've replied to your review of 05/11 with a possible solution. Fingers
crossed :-)

> > +
> > +       return edid;
> > +}
> > +
> >  /* -----------------------------------------------------------------------------
> >   * DRM Connector Operations
> >   */
> > @@ -277,11 +289,8 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
> >         struct edid *edid = pdata->edid;
> >         int num, ret;
> >
> > -       if (!edid) {
> > -               pm_runtime_get_sync(pdata->dev);
> > -               edid = pdata->edid = drm_get_edid(connector, &pdata->aux.ddc);
> > -               pm_runtime_put(pdata->dev);
> > -       }
> > +       if (!edid)
> > +               edid = pdata->edid = __ti_sn_bridge_get_edid(pdata, connector);
> 
> It feels weird to me that we are now exposing the get_edid() function
> directly but we still need to implement get_modes(). I guess this is
> because we might need to fallback to the hardcoded modes? ...but that
> seems like it would be a common pattern for eDP bridges...

Bridges are moving from creating the connector internally to providing a
set of bridge operations to support connector creation externally (by
the drm_bridge_connector helper, or by display drivers directly if
needed). During the transition, both need to be implemented, hence the
bridge .get_edid() operation for the new model, and the connector
.get_modes() operation for the old model.

> >         if (edid && drm_edid_is_valid(edid)) {
> >                 ret = drm_connector_update_edid_property(connector, edid);
> > @@ -871,12 +880,21 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
> >         pm_runtime_put_sync(pdata->dev);
> >  }
> >
> > +static struct edid *ti_sn_bridge_get_edid(struct drm_bridge *bridge,
> > +                                         struct drm_connector *connector)
> > +{
> > +       struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> > +
> > +       return __ti_sn_bridge_get_edid(pdata, connector);
> > +}
> > +
> >  static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
> >         .attach = ti_sn_bridge_attach,
> >         .pre_enable = ti_sn_bridge_pre_enable,
> >         .enable = ti_sn_bridge_enable,
> >         .disable = ti_sn_bridge_disable,
> >         .post_disable = ti_sn_bridge_post_disable,
> > +       .get_edid = ti_sn_bridge_get_edid,
> >  };
> >
> >  /* -----------------------------------------------------------------------------
> > @@ -1335,6 +1353,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
> >
> >         pdata->bridge.funcs = &ti_sn_bridge_funcs;
> >         pdata->bridge.of_node = client->dev.of_node;
> > +       pdata->bridge.ops = DRM_BRIDGE_OP_EDID;
> > +       pdata->bridge.type = DRM_MODE_CONNECTOR_eDP;
> 
> Even with the few comments above, I think this is still fine to move
> us in the right direction. Unless I manage to fix up the EDID reading
> (in which case your patch would conflict and would need to be
> tweaked), then:
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> 
> [1] https://lore.kernel.org/r/20210304155144.3.I60a7fb23ce4589006bc95c64ab8d15c74b876e68@changeid/

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
