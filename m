Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7DE53FD08
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 13:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD5010E098;
	Tue,  7 Jun 2022 11:11:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA38A10E15F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 11:11:24 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCCDC80A;
 Tue,  7 Jun 2022 13:11:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1654600282;
 bh=N5RM2H8SfGb+mMU6E4blW8c4w3vdII/75WdAW/cgngo=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=qmWEDsxG7u5UO7k+nsK6F3kbmVmh4V/4OGcC7iquW/PcmEBQhUVZ+OLeu/cx6PegD
 99LOT80hdQxy2bur571lVYl1pHXpp0NB+CtR5peu8bqVPuJ4yCYKw62KDAdutzqr4U
 NyXuVuNsONj/ZViZ52fsdgstBtbu+qV3VvutINm8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <OS0PR01MB5922168B367D861B8653668786A59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220421163128.101520-1-biju.das.jz@bp.renesas.com>
 <20220421163128.101520-4-biju.das.jz@bp.renesas.com>
 <OS0PR01MB5922168B367D861B8653668786A59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Subject: RE: [PATCH v3 3/4] drm: rcar-du: Add num_rpf to struct
 rcar_du_device_info
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Tue, 07 Jun 2022 12:11:20 +0100
Message-ID: <165460028054.4123576.7297620320138351680@Monstersaurus>
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Biju Das (2022-06-07 11:58:08)
> Hi All,
>=20
> Gentle ping. Are we happy with this patch?
>=20

The patch itself looks fine to me.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Since RZ/G2L is using separate drm driver,
> I can drop this patch, if needed.
>=20

But indeed, it's not clear if the requirement is still there if the RZ
doesn't use this code path now. But there could be future generations
with more (or less?) RPFs ... so it's not unreasonable.

I wonder if it's something that would only be worth applying when needed
though, as otherwise we're increasing the binary size for no real gain.

(17 * 4 =3D only 68 bytes ... but ... I know people try to reduce these
sizes where possible).

--
Kieran



> Please let me know.
>=20
> Cheers,
> Biju
>=20
> > Subject: [PATCH v3 3/4] drm: rcar-du: Add num_rpf to struct
> > rcar_du_device_info
> >=20
> > Number of RPF's VSP is different on R-Car and RZ/G2L  R-Car Gen3 -> 5
> > RPFs  R-Car Gen2 -> 4 RPFs  RZ/G2L -> 2 RPFs
> >=20
> > Add num_rpf to struct rcar_du_device_info to support later SoC without
> > any code changes.
> >=20
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > v2->v3:
> >  * Added Rb tag from Laurent.
> >  * Fixed the comment "max num"->"num"
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 17 +++++++++++++++++
> > drivers/gpu/drm/rcar-du/rcar_du_drv.h |  2 ++  drivers/gpu/drm/rcar-
> > du/rcar_du_vsp.c |  6 +-----
> >  3 files changed, 20 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > index 957ea97541d5..1bc7325aa356 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > @@ -55,6 +55,7 @@ static const struct rcar_du_device_info
> > rzg1_du_r8a7743_info =3D {
> >               },
> >       },
> >       .num_lvds =3D 1,
> > +     .num_rpf =3D 4,
> >  };
> >=20
> >  static const struct rcar_du_device_info rzg1_du_r8a7745_info =3D { @@ -
> > 77,6 +78,7 @@ static const struct rcar_du_device_info
> > rzg1_du_r8a7745_info =3D {
> >                       .port =3D 1,
> >               },
> >       },
> > +     .num_rpf =3D 4,
> >  };
> >=20
> >  static const struct rcar_du_device_info rzg1_du_r8a77470_info =3D { @@=
 -
> > 104,6 +106,7 @@ static const struct rcar_du_device_info
> > rzg1_du_r8a77470_info =3D {
> >                       .port =3D 2,
> >               },
> >       },
> > +     .num_rpf =3D 4,
> >  };
> >=20
> >  static const struct rcar_du_device_info rcar_du_r8a774a1_info =3D { @@=
 -
> > 133,6 +136,7 @@ static const struct rcar_du_device_info
> > rcar_du_r8a774a1_info =3D {
> >               },
> >       },
> >       .num_lvds =3D 1,
> > +     .num_rpf =3D 5,
> >       .dpll_mask =3D  BIT(1),
> >  };
> >=20
> > @@ -163,6 +167,7 @@ static const struct rcar_du_device_info
> > rcar_du_r8a774b1_info =3D {
> >               },
> >       },
> >       .num_lvds =3D 1,
> > +     .num_rpf =3D 5,
> >       .dpll_mask =3D  BIT(1),
> >  };
> >=20
> > @@ -190,6 +195,7 @@ static const struct rcar_du_device_info
> > rcar_du_r8a774c0_info =3D {
> >               },
> >       },
> >       .num_lvds =3D 2,
> > +     .num_rpf =3D 4,
> >       .lvds_clk_mask =3D  BIT(1) | BIT(0),
> >  };
> >=20
> > @@ -220,6 +226,7 @@ static const struct rcar_du_device_info
> > rcar_du_r8a774e1_info =3D {
> >               },
> >       },
> >       .num_lvds =3D 1,
> > +     .num_rpf =3D 5,
> >       .dpll_mask =3D  BIT(1),
> >  };
> >=20
> > @@ -272,6 +279,7 @@ static const struct rcar_du_device_info
> > rcar_du_r8a7790_info =3D {
> >               },
> >       },
> >       .num_lvds =3D 2,
> > +     .num_rpf =3D 4,
> >  };
> >=20
> >  /* M2-W (r8a7791) and M2-N (r8a7793) are identical */ @@ -297,6 +305,7
> > @@ static const struct rcar_du_device_info rcar_du_r8a7791_info =3D {
> >               },
> >       },
> >       .num_lvds =3D 1,
> > +     .num_rpf =3D 4,
> >  };
> >=20
> >  static const struct rcar_du_device_info rcar_du_r8a7792_info =3D { @@ -
> > 317,6 +326,7 @@ static const struct rcar_du_device_info
> > rcar_du_r8a7792_info =3D {
> >                       .port =3D 1,
> >               },
> >       },
> > +     .num_rpf =3D 4,
> >  };
> >=20
> >  static const struct rcar_du_device_info rcar_du_r8a7794_info =3D { @@ -
> > 340,6 +350,7 @@ static const struct rcar_du_device_info
> > rcar_du_r8a7794_info =3D {
> >                       .port =3D 1,
> >               },
> >       },
> > +     .num_rpf =3D 4,
> >  };
> >=20
> >  static const struct rcar_du_device_info rcar_du_r8a7795_info =3D { @@ -
> > 373,6 +384,7 @@ static const struct rcar_du_device_info
> > rcar_du_r8a7795_info =3D {
> >               },
> >       },
> >       .num_lvds =3D 1,
> > +     .num_rpf =3D 5,
> >       .dpll_mask =3D  BIT(2) | BIT(1),
> >  };
> >=20
> > @@ -403,6 +415,7 @@ static const struct rcar_du_device_info
> > rcar_du_r8a7796_info =3D {
> >               },
> >       },
> >       .num_lvds =3D 1,
> > +     .num_rpf =3D 5,
> >       .dpll_mask =3D  BIT(1),
> >  };
> >=20
> > @@ -433,6 +446,7 @@ static const struct rcar_du_device_info
> > rcar_du_r8a77965_info =3D {
> >               },
> >       },
> >       .num_lvds =3D 1,
> > +     .num_rpf =3D 5,
> >       .dpll_mask =3D  BIT(1),
> >  };
> >=20
> > @@ -459,6 +473,7 @@ static const struct rcar_du_device_info
> > rcar_du_r8a77970_info =3D {
> >               },
> >       },
> >       .num_lvds =3D 1,
> > +     .num_rpf =3D 5,
> >  };
> >=20
> >  static const struct rcar_du_device_info rcar_du_r8a7799x_info =3D { @@=
 -
> > 486,6 +501,7 @@ static const struct rcar_du_device_info
> > rcar_du_r8a7799x_info =3D {
> >               },
> >       },
> >       .num_lvds =3D 2,
> > +     .num_rpf =3D 5,
> >       .lvds_clk_mask =3D  BIT(1) | BIT(0),
> >  };
> >=20
> > @@ -505,6 +521,7 @@ static const struct rcar_du_device_info
> > rcar_du_r8a779a0_info =3D {
> >                       .port =3D 1,
> >               },
> >       },
> > +     .num_rpf =3D 5,
> >       .dsi_clk_mask =3D  BIT(1) | BIT(0),
> >  };
> >=20
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> > b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> > index 101f42df86ea..83530721e373 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> > @@ -69,6 +69,7 @@ struct rcar_du_output_routing {
> >   * @channels_mask: bit mask of available DU channels
> >   * @routes: array of CRTC to output routes, indexed by output
> > (RCAR_DU_OUTPUT_*)
> >   * @num_lvds: number of internal LVDS encoders
> > + * @num_rpf: number of RPFs in VSP
> >   * @dpll_mask: bit mask of DU channels equipped with a DPLL
> >   * @dsi_clk_mask: bitmask of channels that can use the DSI clock as dot
> > clock
> >   * @lvds_clk_mask: bitmask of channels that can use the LVDS clock as
> > dot clock @@ -80,6 +81,7 @@ struct rcar_du_device_info {
> >       unsigned int channels_mask;
> >       struct rcar_du_output_routing routes[RCAR_DU_OUTPUT_MAX];
> >       unsigned int num_lvds;
> > +     unsigned int num_rpf;
> >       unsigned int dpll_mask;
> >       unsigned int dsi_clk_mask;
> >       unsigned int lvds_clk_mask;
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> > b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> > index 9c4d1d1be1d4..abd31fd1e979 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> > @@ -405,11 +405,7 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp,
> > struct device_node *np,
> >       if (ret < 0)
> >               return ret;
> >=20
> > -      /*
> > -       * The VSP2D (Gen3) has 5 RPFs, but the VSP1D (Gen2) is limited
> > to
> > -       * 4 RPFs.
> > -       */
> > -     num_planes =3D rcdu->info->gen >=3D 3 ? 5 : 4;
> > +     num_planes =3D rcdu->info->num_rpf;
> >=20
> >       vsp->planes =3D kcalloc(num_planes, sizeof(*vsp->planes),
> > GFP_KERNEL);
> >       if (!vsp->planes)
> > --
> > 2.25.1
>
