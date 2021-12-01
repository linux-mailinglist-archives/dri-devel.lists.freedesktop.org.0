Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 943AF464BDB
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 11:43:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21EFA6E85B;
	Wed,  1 Dec 2021 10:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE98B6E85B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 10:43:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 333DE8AE;
 Wed,  1 Dec 2021 11:43:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1638355401;
 bh=oXwV38rKVcoI/JorLI65sUACRMR1IV84W+QOD7b9du4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=fXgdK6jqFmdmHMamTxNo+XhvOOPlTRjAmVHvmZVBwy6YowCBbTEUgVCsD5dFjJ6Al
 kqy0KvsyNr4SsuYYyoJR4F2ZBDOagmkcD1mtCG9aU959pEh8rrgO5AeHuVluGhb+WB
 3maqXwET7jUCq49CAoBIWlZp5xvB28AAN0snd2Lw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Yab8VhX9qTvUKEcP@pendragon.ideasonboard.com>
References: <20211130162513.2898302-1-kieran.bingham+renesas@ideasonboard.com>
 <20211130162513.2898302-2-kieran.bingham+renesas@ideasonboard.com>
 <Yab8VhX9qTvUKEcP@pendragon.ideasonboard.com>
Subject: Re: [PATCH v2 1/2] drm: rcar-du: mipi-dsi: Support bridge probe
 ordering
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Wed, 01 Dec 2021 10:43:18 +0000
Message-ID: <163835539884.3059017.3883247315602947029@Monstersaurus>
User-Agent: alot/0.10
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

Quoting Laurent Pinchart (2021-12-01 04:38:46)
> Hi Kieran,
>=20
> Thank you for the patch.
>=20
> On Tue, Nov 30, 2021 at 04:25:12PM +0000, Kieran Bingham wrote:
> > The bridge probe ordering for DSI devices has been clarified and further
> > documented in
>=20
> I've read the document and
>=20

Good, I'm glad you've fully got the

>=20
> :-)

Sorry, not sure how I missed that, I must have failed to paste in the
link to the DSI probe documentation. But as you've read that, and now
this is squashed, I think this is done anyway.

Thanks for handling the integrations.

--
Kieran


>=20
> > To support connecting with the SN65DSI86 device after commit c3b75d4734=
cb
> > ("drm/bridge: sn65dsi86: Register and attach our DSI device at probe"),
> > update to the new probe ordering to remove a perpetual -EPROBE_DEFER
> > loop between the two devices.
> >=20
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >=20
> > ---
> > v2
> > - Remove now unused panel variable from rcar_mipi_dsi_probe()
> >=20
> >  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 49 +++++++++++++------------
> >  1 file changed, 26 insertions(+), 23 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/=
rcar-du/rcar_mipi_dsi.c
> > index 50e922328fed..0a9f197ef62c 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> > @@ -637,6 +637,8 @@ static int rcar_mipi_dsi_host_attach(struct mipi_ds=
i_host *host,
> >                                       struct mipi_dsi_device *device)
> >  {
> >       struct rcar_mipi_dsi *dsi =3D host_to_rcar_mipi_dsi(host);
> > +     struct drm_panel *panel;
> > +     int ret;
> > =20
> >       if (device->lanes > dsi->num_data_lanes)
> >               return -EINVAL;
> > @@ -644,12 +646,36 @@ static int rcar_mipi_dsi_host_attach(struct mipi_=
dsi_host *host,
> >       dsi->lanes =3D device->lanes;
> >       dsi->format =3D device->format;
> > =20
> > +     ret =3D drm_of_find_panel_or_bridge(dsi->dev->of_node, 1, 0, &pan=
el,
> > +                                       &dsi->next_bridge);
> > +     if (ret) {
> > +             dev_err_probe(dsi->dev, ret, "could not find next bridge\=
n");
>=20
> dev_err_probe() should only be used in probe(), and this function isn't
> guaranteed to be called at probe time only.
>=20
> This isn't a big deal as the next patch fixes this, and both will be
> squashed. Furthermore, rcar_mipi_dsi_host_attach() should only be called
> when the DSI device gets registered, which should happen after it
> registers its bridge, so I don't think we can see a probe deferral here.
>=20
> Other than that the patch looks fine, I'll squash it with the DSI
> driver.
>=20
> > +             return ret;
> > +     }
> > +
> > +     if (!dsi->next_bridge) {
> > +             dsi->next_bridge =3D devm_drm_panel_bridge_add(dsi->dev, =
panel);
> > +             if (IS_ERR(dsi->next_bridge)) {
> > +                     dev_err(dsi->dev, "failed to create panel bridge\=
n");
> > +                     return PTR_ERR(dsi->next_bridge);
> > +             }
> > +     }
> > +
> > +     /* Initialize the DRM bridge. */
> > +     dsi->bridge.funcs =3D &rcar_mipi_dsi_bridge_ops;
> > +     dsi->bridge.of_node =3D dsi->dev->of_node;
> > +     drm_bridge_add(&dsi->bridge);
> > +
> >       return 0;
> >  }
> > =20
> >  static int rcar_mipi_dsi_host_detach(struct mipi_dsi_host *host,
> >                                       struct mipi_dsi_device *device)
> >  {
> > +     struct rcar_mipi_dsi *dsi =3D host_to_rcar_mipi_dsi(host);
> > +
> > +     drm_bridge_remove(&dsi->bridge);
> > +
> >       return 0;
> >  }
> > =20
> > @@ -731,7 +757,6 @@ static int rcar_mipi_dsi_get_clocks(struct rcar_mip=
i_dsi *dsi)
> >  static int rcar_mipi_dsi_probe(struct platform_device *pdev)
> >  {
> >       struct rcar_mipi_dsi *dsi;
> > -     struct drm_panel *panel;
> >       struct resource *mem;
> >       int ret;
> > =20
> > @@ -764,21 +789,6 @@ static int rcar_mipi_dsi_probe(struct platform_dev=
ice *pdev)
> >               return PTR_ERR(dsi->rstc);
> >       }
> > =20
> > -     ret =3D drm_of_find_panel_or_bridge(dsi->dev->of_node, 1, 0, &pan=
el,
> > -                                       &dsi->next_bridge);
> > -     if (ret) {
> > -             dev_err_probe(dsi->dev, ret, "could not find next bridge\=
n");
> > -             return ret;
> > -     }
> > -
> > -     if (!dsi->next_bridge) {
> > -             dsi->next_bridge =3D devm_drm_panel_bridge_add(dsi->dev, =
panel);
> > -             if (IS_ERR(dsi->next_bridge)) {
> > -                     dev_err(dsi->dev, "failed to create panel bridge\=
n");
> > -                     return PTR_ERR(dsi->next_bridge);
> > -             }
> > -     }
> > -
> >       /* Initialize the DSI host. */
> >       dsi->host.dev =3D dsi->dev;
> >       dsi->host.ops =3D &rcar_mipi_dsi_host_ops;
> > @@ -786,11 +796,6 @@ static int rcar_mipi_dsi_probe(struct platform_dev=
ice *pdev)
> >       if (ret < 0)
> >               return ret;
> > =20
> > -     /* Initialize the DRM bridge. */
> > -     dsi->bridge.funcs =3D &rcar_mipi_dsi_bridge_ops;
> > -     dsi->bridge.of_node =3D dsi->dev->of_node;
> > -     drm_bridge_add(&dsi->bridge);
> > -
> >       return 0;
> >  }
> > =20
> > @@ -798,8 +803,6 @@ static int rcar_mipi_dsi_remove(struct platform_dev=
ice *pdev)
> >  {
> >       struct rcar_mipi_dsi *dsi =3D platform_get_drvdata(pdev);
> > =20
> > -     drm_bridge_remove(&dsi->bridge);
> > -
> >       mipi_dsi_host_unregister(&dsi->host);
> > =20
> >       return 0;
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart
