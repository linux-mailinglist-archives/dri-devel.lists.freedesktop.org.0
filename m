Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E55A4D488C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 15:04:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A1910E84C;
	Thu, 10 Mar 2022 14:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C0C510E853
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 14:04:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0923D49C;
 Thu, 10 Mar 2022 15:04:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646921052;
 bh=nQ39qbYrxr7CVSbk/bS8LFz4g5AfZUSlLBk54b2Cr7s=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Pf6wwnMVNLfyoj0+Sd09KoYCaBDzC80hngPd2VhDTq+kzLtO6cCyNyVXkPoSQlaBt
 WJHtdYJalTmRFBQP76nP8cjCPSUWk4CL6SJNm3yh+ZhZ2k0SEkBPwMy75CKsyot5n8
 nvPI8KAVnFDVebV4n5m4OnXx8kbWLdeC3GT5TOe0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220307175955.363057-4-kieran.bingham+renesas@ideasonboard.com>
References: <20220307175955.363057-1-kieran.bingham+renesas@ideasonboard.com>
 <20220307175955.363057-4-kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 3/4] drm/bridge: ti-sn65dsi86: Support DisplayPort
 (non-eDP) mode
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Date: Thu, 10 Mar 2022 14:04:09 +0000
Message-ID: <164692104995.11309.5644358828152713613@Monstersaurus>
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

Quoting Kieran Bingham (2022-03-07 17:59:54)
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>=20
> Despite the SN65DSI86 being an eDP bridge, on some systems its output is
> routed to a DisplayPort connector. Enable DisplayPort mode when the next
> component in the display pipeline is detected as a DisplayPort
> connector, and disable eDP features in that case.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> Reworked to set bridge type based on the next bridge/connector.
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> --
> Changes since v1/RFC:
>  - Rebased on top of "drm/bridge: ti-sn65dsi86: switch to
>    devm_drm_of_get_bridge"
>  - eDP/DP mode determined from the next bridge connector type.
>=20
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index 29f5f7123ed9..461f963faa0b 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -60,6 +60,7 @@
>  #define SN_LN_ASSIGN_REG                       0x59
>  #define  LN_ASSIGN_WIDTH                       2
>  #define SN_ENH_FRAME_REG                       0x5A
> +#define  ASSR_CONTROL                          BIT(0)
>  #define  VSTREAM_ENABLE                                BIT(3)
>  #define  LN_POLRS_OFFSET                       4
>  #define  LN_POLRS_MASK                         0xf0
> @@ -91,6 +92,8 @@
>  #define SN_DATARATE_CONFIG_REG                 0x94
>  #define  DP_DATARATE_MASK                      GENMASK(7, 5)
>  #define  DP_DATARATE(x)                                ((x) << 5)
> +#define SN_TRAINING_SETTING_REG                        0x95
> +#define  SCRAMBLE_DISABLE                      BIT(4)
>  #define SN_ML_TX_MODE_REG                      0x96
>  #define  ML_TX_MAIN_LINK_OFF                   0
>  #define  ML_TX_NORMAL_MODE                     BIT(0)
> @@ -1005,6 +1008,11 @@ static int ti_sn_link_training(struct ti_sn65dsi86=
 *pdata, int dp_rate_idx,
>         regmap_update_bits(pdata->regmap, SN_DATARATE_CONFIG_REG,
>                            DP_DATARATE_MASK, DP_DATARATE(dp_rate_idx));
> =20
> +       /* For DisplayPort, use the standard DP scrambler seed. */
> +       if (pdata->bridge.type =3D=3D DRM_MODE_CONNECTOR_DisplayPort)
> +               regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG,
> +                                  ASSR_CONTROL, 0);
> +
>         /* enable DP PLL */
>         regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 1);
> =20
> @@ -1016,6 +1024,11 @@ static int ti_sn_link_training(struct ti_sn65dsi86=
 *pdata, int dp_rate_idx,
>                 goto exit;
>         }
> =20
> +       /* For DisplayPort, disable scrambling mode. */
> +       if (pdata->bridge.type =3D=3D DRM_MODE_CONNECTOR_DisplayPort)
> +               regmap_update_bits(pdata->regmap, SN_TRAINING_SETTING_REG,
> +                                  SCRAMBLE_DISABLE, SCRAMBLE_DISABLE);
> +
>         /*
>          * We'll try to link train several times.  As part of link traini=
ng
>          * the bridge chip will write DP_SET_POWER_D0 to DP_SET_POWER.  If
> @@ -1260,7 +1273,8 @@ static int ti_sn_bridge_probe(struct auxiliary_devi=
ce *adev,
>         pdata->bridge.funcs =3D &ti_sn_bridge_funcs;
>         pdata->bridge.of_node =3D np;
>         pdata->bridge.ops =3D DRM_BRIDGE_OP_EDID;
> -       pdata->bridge.type =3D DRM_MODE_CONNECTOR_eDP;
> +       pdata->bridge.type =3D pdata->next_bridge->type =3D=3D DRM_MODE_C=
ONNECTOR_DisplayPort
> +                          ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CO=
NNECTOR_eDP;

Anyone know if there's any expectation of other types here? Or is it
just as safe to do:

	pdata->bridge.type =3D pdata->next_bridge->type;

To achieve the same effect?

--
Kieran


> =20
>         drm_bridge_add(&pdata->bridge);
> =20
> --=20
> 2.32.0
>
