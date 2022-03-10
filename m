Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF124D4971
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 15:33:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6DA10E7E8;
	Thu, 10 Mar 2022 14:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D4310E7E8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 14:33:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81D3C48B;
 Thu, 10 Mar 2022 15:33:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646922791;
 bh=//T4Hc7za7NzVKhYa325ljdKqA3TUdLakoWXmdcba5c=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Tzs3VFp9k/Xckhoyyfd1AE9tvIMrHQwFKpd14amL/UK87LaravXkupQUvWJSQK/5L
 w+G9zBgFn4K/ffRT7BFc7hMF/YVDXGhMfoU8tshAMNCPQco4S56EAzEzrTDCUl/ehP
 khbNZmxXhlHP/KDgj6caQtwj6/u2m9Gh4qXZXGNY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <164692104995.11309.5644358828152713613@Monstersaurus>
References: <20220307175955.363057-1-kieran.bingham+renesas@ideasonboard.com>
 <20220307175955.363057-4-kieran.bingham+renesas@ideasonboard.com>
 <164692104995.11309.5644358828152713613@Monstersaurus>
Subject: Re: [PATCH v2 3/4] drm/bridge: ti-sn65dsi86: Support DisplayPort
 (non-eDP) mode
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Date: Thu, 10 Mar 2022 14:33:08 +0000
Message-ID: <164692278854.11309.6980540186888083413@Monstersaurus>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kieran Bingham (2022-03-10 14:04:09)
> Quoting Kieran Bingham (2022-03-07 17:59:54)
> > From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >=20
> > Despite the SN65DSI86 being an eDP bridge, on some systems its output is
> > routed to a DisplayPort connector. Enable DisplayPort mode when the next
> > component in the display pipeline is detected as a DisplayPort
> > connector, and disable eDP features in that case.
> >=20
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.=
com>
> > Reworked to set bridge type based on the next bridge/connector.
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > --
> > Changes since v1/RFC:
> >  - Rebased on top of "drm/bridge: ti-sn65dsi86: switch to
> >    devm_drm_of_get_bridge"
> >  - eDP/DP mode determined from the next bridge connector type.
> >=20
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/br=
idge/ti-sn65dsi86.c
> > index 29f5f7123ed9..461f963faa0b 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -60,6 +60,7 @@
> >  #define SN_LN_ASSIGN_REG                       0x59
> >  #define  LN_ASSIGN_WIDTH                       2
> >  #define SN_ENH_FRAME_REG                       0x5A
> > +#define  ASSR_CONTROL                          BIT(0)
> >  #define  VSTREAM_ENABLE                                BIT(3)
> >  #define  LN_POLRS_OFFSET                       4
> >  #define  LN_POLRS_MASK                         0xf0
> > @@ -91,6 +92,8 @@
> >  #define SN_DATARATE_CONFIG_REG                 0x94
> >  #define  DP_DATARATE_MASK                      GENMASK(7, 5)
> >  #define  DP_DATARATE(x)                                ((x) << 5)
> > +#define SN_TRAINING_SETTING_REG                        0x95
> > +#define  SCRAMBLE_DISABLE                      BIT(4)
> >  #define SN_ML_TX_MODE_REG                      0x96
> >  #define  ML_TX_MAIN_LINK_OFF                   0
> >  #define  ML_TX_NORMAL_MODE                     BIT(0)
> > @@ -1005,6 +1008,11 @@ static int ti_sn_link_training(struct ti_sn65dsi=
86 *pdata, int dp_rate_idx,
> >         regmap_update_bits(pdata->regmap, SN_DATARATE_CONFIG_REG,
> >                            DP_DATARATE_MASK, DP_DATARATE(dp_rate_idx));
> > =20
> > +       /* For DisplayPort, use the standard DP scrambler seed. */
> > +       if (pdata->bridge.type =3D=3D DRM_MODE_CONNECTOR_DisplayPort)
> > +               regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG,
> > +                                  ASSR_CONTROL, 0);
> > +
> >         /* enable DP PLL */
> >         regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 1);
> > =20
> > @@ -1016,6 +1024,11 @@ static int ti_sn_link_training(struct ti_sn65dsi=
86 *pdata, int dp_rate_idx,
> >                 goto exit;
> >         }
> > =20
> > +       /* For DisplayPort, disable scrambling mode. */
> > +       if (pdata->bridge.type =3D=3D DRM_MODE_CONNECTOR_DisplayPort)
> > +               regmap_update_bits(pdata->regmap, SN_TRAINING_SETTING_R=
EG,
> > +                                  SCRAMBLE_DISABLE, SCRAMBLE_DISABLE);
> > +
> >         /*
> >          * We'll try to link train several times.  As part of link trai=
ning
> >          * the bridge chip will write DP_SET_POWER_D0 to DP_SET_POWER. =
 If
> > @@ -1260,7 +1273,8 @@ static int ti_sn_bridge_probe(struct auxiliary_de=
vice *adev,
> >         pdata->bridge.funcs =3D &ti_sn_bridge_funcs;
> >         pdata->bridge.of_node =3D np;
> >         pdata->bridge.ops =3D DRM_BRIDGE_OP_EDID;
> > -       pdata->bridge.type =3D DRM_MODE_CONNECTOR_eDP;
> > +       pdata->bridge.type =3D pdata->next_bridge->type =3D=3D DRM_MODE=
_CONNECTOR_DisplayPort
> > +                          ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_=
CONNECTOR_eDP;
>=20
> Anyone know if there's any expectation of other types here? Or is it
> just as safe to do:
>=20
>         pdata->bridge.type =3D pdata->next_bridge->type;
>=20
> To achieve the same effect?

Unfortunately, it would create nicer code - but I don't think it's
exactly right. It leaves the definition of our bridge type to the
connector type of the panel. While the SN65DSI86 can /only/ be either
eDP or DisplayPort.

So I'll keep this conditional on if the next connector is
DRM_MODE_CONNECTOR_DisplayPort.


>=20
> --
> Kieran
>=20
>=20
> > =20
> >         drm_bridge_add(&pdata->bridge);
> > =20
> > --=20
> > 2.32.0
> >
