Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8394A4A6EBD
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 11:32:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959D110E70E;
	Wed,  2 Feb 2022 10:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54ABC10E70E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 10:32:21 +0000 (UTC)
Date: Wed, 02 Feb 2022 10:32:01 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v12 7/9] drm/bridge: display-connector: add ddc-en gpio
 support
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <DLAO6R.7AAJRIJFJSDD3@crapouillou.net>
In-Reply-To: <77a7a1daaf381e1651be38adb62f9af9dd6c8fc5.1643632014.git.hns@goldelico.com>
References: <cover.1643632014.git.hns@goldelico.com>
 <77a7a1daaf381e1651be38adb62f9af9dd6c8fc5.1643632014.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 letux-kernel@openphoenux.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus,

Le lun., janv. 31 2022 at 13:26:53 +0100, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> "hdmi-connector.yaml" bindings defines an optional property
> "ddc-en-gpios" for a single gpio to enable DDC operation.
>=20
> Usually this controls +5V power on the HDMI connector.
> This +5V may also be needed for HPD.
>=20
> This was not reflected in code.
>=20
> Now, the driver activates the ddc gpio after probe and
> deactivates after remove so it is "almost on".
>=20
> But only if this driver is loaded (and not e.g. blacklisted
> as module).
>=20
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/gpu/drm/bridge/display-connector.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/bridge/display-connector.c=20
> b/drivers/gpu/drm/bridge/display-connector.c
> index d24f5b90feabf..555395e301096 100644
> --- a/drivers/gpu/drm/bridge/display-connector.c
> +++ b/drivers/gpu/drm/bridge/display-connector.c
> @@ -24,6 +24,7 @@ struct display_connector {
>  	int			hpd_irq;
>=20
>  	struct regulator	*dp_pwr;
> +	struct gpio_desc	*ddc_en;
>  };
>=20
>  static inline struct display_connector *
> @@ -345,6 +346,19 @@ static int display_connector_probe(struct=20
> platform_device *pdev)
>  		}
>  	}
>=20
> +	/* enable DDC */
> +	if (type =3D=3D DRM_MODE_CONNECTOR_HDMIA) {
> +		conn->ddc_en =3D devm_gpiod_get_optional(&pdev->dev, "ddc-en",
> +						       GPIOD_OUT_HIGH);
> +
> +		if (IS_ERR(conn->ddc_en)) {
> +			dev_err(&pdev->dev, "Couldn't get ddc-en gpio\n");
> +			return PTR_ERR(conn->ddc_en);
> +		}
> +
> +		gpiod_set_value(conn->ddc_en, 1);

You already requested the gpio with the GPIOD_OUT_HIGH flag, so this=20
can be removed.


> +	}
> +
>  	conn->bridge.funcs =3D &display_connector_bridge_funcs;
>  	conn->bridge.of_node =3D pdev->dev.of_node;
>=20
> @@ -373,6 +387,9 @@ static int display_connector_remove(struct=20
> platform_device *pdev)
>  {
>  	struct display_connector *conn =3D platform_get_drvdata(pdev);
>=20
> +	if (conn->ddc_en)
> +		gpiod_set_value(conn->ddc_en, 0);

Note that gpiod_set_value() already does the null-check internally. I=20
actually do prefer your solution, so this is fine with me, but=20
maintainers may have a different opinion.

Cheers,
-Paul

> +
>  	if (conn->dp_pwr)
>  		regulator_disable(conn->dp_pwr);
>=20
> --
> 2.33.0
>=20


