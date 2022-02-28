Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FB54C7E40
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 00:24:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E98B10E2C5;
	Mon, 28 Feb 2022 23:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A394910E2C5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 23:24:41 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B22F478;
 Tue,  1 Mar 2022 00:24:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646090679;
 bh=GequZV5BwVjpKPb+Q/rQWeSXyCGPG/WT/t2NCTE3e44=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Xi4ptyLzFjcJ0ffGr6xtQG2NQb6Tbk4Id3luptcVQKUalOnq7cbUIgwJlty9rVGMd
 TevFoHW2bEgBDHUj46YHrjIPfOEZY5t5NTiAEOz//i69Gtnx9P0eytbjrV05xq5ocC
 MbG5jVP6lmrsARn2BaUJRbkXne/VCRmLhDAR3bOw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220228183955.25508-1-jose.exposito89@gmail.com>
References: <20220228183955.25508-1-jose.exposito89@gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: switch to devm_drm_of_get_bridge
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 andrzej.hajda@intel.com
Date: Mon, 28 Feb 2022 23:24:36 +0000
Message-ID: <164609067646.2361501.15747139249939190799@Monstersaurus>
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
Cc: linux-pwm@vger.kernel.org, jernej.skrabec@gmail.com, maxime@cerno.tech,
 narmstrong@baylibre.com, airlied@linux.ie, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, robert.foss@linaro.org,
 u.kleine-koenig@pengutronix.de,
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 lee.jones@linaro.org, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jos=C3=A9

Quoting Jos=C3=A9 Exp=C3=B3sito (2022-02-28 18:39:54)
> The function "drm_of_find_panel_or_bridge" has been deprecated in
> favor of "devm_drm_of_get_bridge".
>=20
> Switch to the new function and reduce boilerplate.
>=20
> Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index dab8f76618f3..fb8e16ed7e90 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1232,15 +1232,9 @@ static int ti_sn_bridge_probe(struct auxiliary_dev=
ice *adev,
>  {
>         struct ti_sn65dsi86 *pdata =3D dev_get_drvdata(adev->dev.parent);
>         struct device_node *np =3D pdata->dev->of_node;
> -       struct drm_panel *panel;
>         int ret;
> =20
> -       ret =3D drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
> -       if (ret)
> -               return dev_err_probe(&adev->dev, ret,
> -                                    "could not find any panel node\n");
> -
> -       pdata->next_bridge =3D devm_drm_panel_bridge_add(pdata->dev, pane=
l);
> +       pdata->next_bridge =3D devm_drm_of_get_bridge(pdata->dev, np, 1, =
0);

Yikes, I was about to rely on this panel variable to determine if the
device is a panel or a display port connector. (Well, I am relying on
it, and patches are hoping to be reposted this week).

Is there expected to be another way to identify if the next connection
is a panel or a bridge?

Regards

--
Kieran


>         if (IS_ERR(pdata->next_bridge)) {
>                 DRM_ERROR("failed to create panel bridge\n");
>                 return PTR_ERR(pdata->next_bridge);
> --=20
> 2.25.1
>
