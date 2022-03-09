Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B65D4D34EA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 17:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECED10E42B;
	Wed,  9 Mar 2022 16:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5143A10E43C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 16:52:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 610EF8C4;
 Wed,  9 Mar 2022 17:52:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646844756;
 bh=uBKfZYMMwHpIXToBlZHy9weOaF5/OcjOL1tK8xk7kUI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ENEMV7pf0UevDH6XzzknrULevLYD6bdmMc+jpIrqN5lddg8i7nYLleDK8n+2tys+w
 s0B86humXkshJoxrFWIKo3IMinx09eWTmYYHAjxEt51HBZQYjvOqo1sX1axtN4CKKB
 kfo5grcCM/woICwmzOVBaXrS1wESjLrIYbon9PEE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220206154405.1243333-7-sam@ravnborg.org>
References: <20220206154405.1243333-1-sam@ravnborg.org>
 <20220206154405.1243333-7-sam@ravnborg.org>
Subject: Re: [PATCH v1 6/9] drm/bridge: ti-sn65dsi86: Add NO_CONNECTOR support
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Date: Wed, 09 Mar 2022 16:52:34 +0000
Message-ID: <164684475449.123014.12998431657392822023@Monstersaurus>
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
Cc: Rob Clark <robdclark@chromium.org>, Philip Chen <philipchen@chromium.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Quoting Sam Ravnborg (2022-02-06 15:44:02)
> From: Rob Clark <robdclark@chromium.org>
>=20
> Slightly awkward to fish out the display_info when we aren't creating
> own connector.  But I don't see an obvious better way.
>=20
> v3:
>  - Rebased and dropped the ti_sn_bridge_get_bpp() patch
>    as this was solved in a different way (Sam)
>=20
> v2:
>  - Remove error return with NO_CONNECTOR flag (Rob)
>=20
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index dc6ec40bc1ef..a9041dfd2ae5 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -746,11 +746,6 @@ static int ti_sn_bridge_attach(struct drm_bridge *br=
idge,
>         struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
>         int ret;
> =20
> -       if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> -               DRM_ERROR("Fix bridge driver to make connector optional!"=
);
> -               return -EINVAL;
> -       }
> -
>         pdata->aux.drm_dev =3D bridge->dev;
>         ret =3D drm_dp_aux_register(&pdata->aux);
>         if (ret < 0) {
> @@ -758,12 +753,14 @@ static int ti_sn_bridge_attach(struct drm_bridge *b=
ridge,
>                 return ret;
>         }
> =20
> -       ret =3D ti_sn_bridge_connector_init(pdata);
> -       if (ret < 0)
> -               goto err_conn_init;
> +       if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +               ret =3D ti_sn_bridge_connector_init(pdata);
> +               if (ret < 0)
> +                       goto err_conn_init;
> =20
> -       /* We never want the next bridge to *also* create a connector: */
> -       flags |=3D DRM_BRIDGE_ATTACH_NO_CONNECTOR;
> +               /* We never want the next bridge to *also* create a conne=
ctor: */
> +               flags |=3D DRM_BRIDGE_ATTACH_NO_CONNECTOR;
> +       }
> =20
>         /* Attach the next bridge */
>         ret =3D drm_bridge_attach(bridge->encoder, pdata->next_bridge,
> @@ -774,7 +771,8 @@ static int ti_sn_bridge_attach(struct drm_bridge *bri=
dge,
>         return 0;
> =20
>  err_dsi_host:
> -       drm_connector_cleanup(&pdata->connector);
> +       if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))

I think this is unreachable / always false due to the
   flags |=3D DRM_BRIDGE_ATTACH_NO_CONNECTOR.


I've solved this locally by doing:

-	/* Attach the next bridge */
+	/*
+	 * Attach the next bridge We never want the next bridge to *also* create
+	 * a connector:
+	 */
 	ret =3D drm_bridge_attach(bridge->encoder, pdata->next_bridge,
-				&pdata->bridge, flags);
+				&pdata->bridge,
+				flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret < 0)
 		goto err_initted_aux;

+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
+
 	pdata->connector =3D drm_bridge_connector_init(pdata->bridge.dev,
 						     pdata->bridge.encoder);
 	if (IS_ERR(pdata->connector)) {
 		ret =3D PTR_ERR(pdata->connector);
 		goto err_initted_aux;
 	}

 	drm_connector_attach_encoder(pdata->connector, pdata->bridge.encoder);

 	return 0;


Which also fixes the support for
  flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR

--
Regards

Kieran

> +               drm_connector_cleanup(&pdata->connector);
>  err_conn_init:
>         drm_dp_aux_unregister(&pdata->aux);
>         return ret;
> --=20
> 2.32.0
>
