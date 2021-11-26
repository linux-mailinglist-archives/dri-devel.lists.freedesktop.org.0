Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C26B045EC01
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 11:57:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827D26F3A2;
	Fri, 26 Nov 2021 10:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECAD06F3A3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 10:57:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 167B6340;
 Fri, 26 Nov 2021 11:57:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1637924270;
 bh=I+sB0d082EJSPxR/PvHIR/ITSCs11u4vLX2Rf+X8Uzc=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=tJRCW9Q8iMDekOupCe/3eGtuggg20DVTM1K6l1UL6qEVe3CfBTsD5axs/CEzr/y8L
 Ql4Apr8Dq8u4v/+oVoD4CIDPeoYzZWlUxrP/UuZBdOhx+YNo0qaCTgB/emw1y/tMTr
 3Xn04FPk1JI0/S+gosDaPHzWPla+wGeluTfFIvvM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <OS0PR01MB5922819388EAA6973EDCD3D386639@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211126101518.938783-1-kieran.bingham+renesas@ideasonboard.com>
 <20211126101518.938783-5-kieran.bingham+renesas@ideasonboard.com>
 <OS0PR01MB5922819388EAA6973EDCD3D386639@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Subject: RE: [PATCH 4/4] drm: rcar-du: mipi-dsi: Support bridge probe ordering
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
Date: Fri, 26 Nov 2021 10:57:47 +0000
Message-ID: <163792426732.3059017.2780398503330070326@Monstersaurus>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Biju Das (2021-11-26 10:51:48)
> Hi Kieran,
>=20
> Thanks for the patch.
>=20
> > Subject: [PATCH 4/4] drm: rcar-du: mipi-dsi: Support bridge probe order=
ing
> >=20
> > The bridge probe ordering for DSI devices has been clarified and further
> > documented in
> >=20
> > To support connecting with the SN65DSI86 device after commit c3b75d4734=
cb
> > ("drm/bridge: sn65dsi86: Register and attach our DSI device at probe"),
> > update to the new probe ordering to remove a perpetual -EPROBE_DEFER lo=
op
> > between the two devices.
> >=20
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 48 +++++++++++++------------
> >  1 file changed, 26 insertions(+), 22 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> > b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> > index 833f4480bdf3..f783bacee8da 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> > @@ -639,6 +639,8 @@ static int rcar_mipi_dsi_host_attach(struct
> > mipi_dsi_host *host,
> >                                       struct mipi_dsi_device *device)
> >  {
> >       struct rcar_mipi_dsi *dsi =3D host_to_rcar_mipi_dsi(host);
> > +     struct drm_panel *panel;
> > +     int ret;
> >=20
> >       if (device->lanes > dsi->num_data_lanes)
> >               return -EINVAL;
> > @@ -646,12 +648,36 @@ static int rcar_mipi_dsi_host_attach(struct
> > mipi_dsi_host *host,
> >       dsi->lanes =3D device->lanes;
> >       dsi->format =3D device->format;
> >=20
> > +     ret =3D drm_of_find_panel_or_bridge(dsi->dev->of_node, 1, 0, &pan=
el,
> > +                                       &dsi->next_bridge);
> > +     if (ret) {
> > +             dev_err_probe(dsi->dev, ret, "could not find next bridge\=
n");
> > +             return ret;
>=20
> This can merged with previous line. return dev_err_probe(dsi->dev, ret, "=
could not find next bridge\n");
> > +     }
> > +
> > +     if (!dsi->next_bridge) {
> > +             dsi->next_bridge =3D devm_drm_panel_bridge_add(dsi->dev, =
panel);
> > +             if (IS_ERR(dsi->next_bridge)) {
> > +                     dev_err(dsi->dev, "failed to create panel bridge\=
n");
> > +                     return PTR_ERR(dsi->next_bridge);
>=20
> Why not return dev_err_probe??

Yes, I think it probably should. This was just a code move, so I didn't
change it.

--
Kieran

>=20
> Cheers,
> Biju
>=20
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
> >=20
> >  static int rcar_mipi_dsi_host_detach(struct mipi_dsi_host *host,
> >                                       struct mipi_dsi_device *device)
> >  {
> > +     struct rcar_mipi_dsi *dsi =3D host_to_rcar_mipi_dsi(host);
> > +
> > +     drm_bridge_remove(&dsi->bridge);
> > +
> >       return 0;
> >  }
> >=20
> > @@ -766,21 +792,6 @@ static int rcar_mipi_dsi_probe(struct platform_dev=
ice
> > *pdev)
> >               return PTR_ERR(dsi->rstc);
> >       }
> >=20
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
> >       dsi->host.ops =3D &rcar_mipi_dsi_host_ops; @@ -788,11 +799,6 @@ s=
tatic
> > int rcar_mipi_dsi_probe(struct platform_device *pdev)
> >       if (ret < 0)
> >               return ret;
> >=20
> > -     /* Initialize the DRM bridge. */
> > -     dsi->bridge.funcs =3D &rcar_mipi_dsi_bridge_ops;
> > -     dsi->bridge.of_node =3D dsi->dev->of_node;
> > -     drm_bridge_add(&dsi->bridge);
> > -
> >       return 0;
> >  }
> >=20
> > @@ -800,8 +806,6 @@ static int rcar_mipi_dsi_remove(struct platform_dev=
ice
> > *pdev)  {
> >       struct rcar_mipi_dsi *dsi =3D platform_get_drvdata(pdev);
> >=20
> > -     drm_bridge_remove(&dsi->bridge);
> > -
> >       mipi_dsi_host_unregister(&dsi->host);
> >=20
> >       return 0;
> > --
> > 2.30.2
>
