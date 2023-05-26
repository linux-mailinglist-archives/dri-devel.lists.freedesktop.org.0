Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BD07123FC
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 11:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176CF10E7E2;
	Fri, 26 May 2023 09:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4ECD10E7D2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 09:48:08 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8D00B844;
 Fri, 26 May 2023 11:47:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1685094469;
 bh=qbmeFJ7c8C+6VVJrzyhuUWdWLd8rNiycGWPDQcvaw+s=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=sitg+UAKxBUuIKwXO6fK7W3Pw5Z8cIKInZ1qCg8eQm2htLFEUh3QSNNGMMNhVsc9k
 O9MlytwkUTbH2E6g+V5Y8R97xVnCg/smiBQkRUe77y47QlbfKKfUe1SV++DTHvOljK
 fMBcvFe2R9ogPiJI36wuVreK7LPuwVup5q1u7Njg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230526090709.1517297-1-u.kleine-koenig@pengutronix.de>
References: <20230526090709.1517297-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2] drm: Switch i2c drivers back to use .probe()
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Date: Fri, 26 May 2023 10:48:04 +0100
Message-ID: <168509448433.130277.3243909863879735319@Monstersaurus>
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
Cc: Antonio Borneo <antonio.borneo@foss.st.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Crt Mori <cmo@melexis.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Guenter Roeck <groeck@chromium.org>,
 Liang He <windhl@126.com>, Marek =?utf-8?q?Beh=C3=BAn?= <kabel@kernel.org>,
 chrome-platform@lists.linux.dev, Florian Fainelli <f.fainelli@gmail.com>,
 Robert Foss <rfoss@kernel.org>, Stefan Mavrodiev <stefan@olimex.com>,
 Sam Ravnborg <sam@ravnborg.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Miguel Ojeda <ojeda@kernel.org>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 linux-rpi-kernel@lists.infradead.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Phong LE <ple@baylibre.com>,
 kernel@pengutronix.de, Alvin =?utf-8?q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 Martin Donnelly <martin.donnelly@ge.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Uwe Kleine-K=C3=B6nig (2023-05-26 10:07:09)
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
> back to (the new) .probe() to be able to eventually drop .probe_new() from
> struct i2c_driver.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>=20
> I didn't get feedback for (implicit) v1 that was sent with Message-Id:
> <20230427175954.666464-1-u.kleine-koenig@pengutronix.de>. This is a
> rebase on v6.4-rc1 as the former patch doesn't apply cleanly any more.
>=20
> I also added more people to Cc, maybe that helps to get feedback.

Having been invovled in b8a1a4cd5a98 ("i2c: Provide a temporary
.probe_new() call-back type") and definitley expected 'temporary' to
mean less than 7 years, I very much approve of this patchset.

Thank you for all your efforts Uwe.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> This patch is based on v6.4-rc1, and applies fine on today's next.
> (There are also no new drivers that need adaption in next.)
>=20
> Thanks for considering,
> Uwe
>=20
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c             | 2 +-
>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c       | 2 +-
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c       | 2 +-
>  drivers/gpu/drm/bridge/analogix/anx7625.c                | 2 +-
>  drivers/gpu/drm/bridge/chipone-icn6211.c                 | 2 +-
>  drivers/gpu/drm/bridge/chrontel-ch7033.c                 | 2 +-
>  drivers/gpu/drm/bridge/cros-ec-anx7688.c                 | 2 +-
>  drivers/gpu/drm/bridge/ite-it6505.c                      | 2 +-
>  drivers/gpu/drm/bridge/ite-it66121.c                     | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt8912b.c                 | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt9211.c                  | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt9611.c                  | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c               | 2 +-
>  drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 4 ++--
>  drivers/gpu/drm/bridge/nxp-ptn3460.c                     | 2 +-
>  drivers/gpu/drm/bridge/parade-ps8622.c                   | 2 +-
>  drivers/gpu/drm/bridge/parade-ps8640.c                   | 2 +-
>  drivers/gpu/drm/bridge/sii902x.c                         | 2 +-
>  drivers/gpu/drm/bridge/sii9234.c                         | 2 +-
>  drivers/gpu/drm/bridge/sil-sii8620.c                     | 2 +-
>  drivers/gpu/drm/bridge/tc358767.c                        | 2 +-
>  drivers/gpu/drm/bridge/tc358768.c                        | 2 +-
>  drivers/gpu/drm/bridge/tc358775.c                        | 2 +-
>  drivers/gpu/drm/bridge/ti-dlpc3433.c                     | 2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c                    | 2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c                    | 2 +-
>  drivers/gpu/drm/bridge/ti-tfp410.c                       | 2 +-
>  drivers/gpu/drm/i2c/tda9950.c                            | 2 +-
>  drivers/gpu/drm/i2c/tda998x_drv.c                        | 2 +-
>  drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c       | 2 +-
>  drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c    | 2 +-
>  drivers/gpu/drm/solomon/ssd130x-i2c.c                    | 2 +-
>  32 files changed, 33 insertions(+), 33 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index ddceafa7b637..2254457ab5d0 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1393,7 +1393,7 @@ static struct i2c_driver adv7511_driver =3D {
>                 .of_match_table =3D adv7511_of_ids,
>         },
>         .id_table =3D adv7511_i2c_ids,
> -       .probe_new =3D adv7511_probe,
> +       .probe =3D adv7511_probe,
>         .remove =3D adv7511_remove,
>  };
> =20
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers=
/gpu/drm/bridge/analogix/analogix-anx6345.c
> index 3577c532abb4..72ab2ab77081 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> @@ -815,7 +815,7 @@ static struct i2c_driver anx6345_driver =3D {
>                    .name =3D "anx6345",
>                    .of_match_table =3D of_match_ptr(anx6345_match_table),
>                   },
> -       .probe_new =3D anx6345_i2c_probe,
> +       .probe =3D anx6345_i2c_probe,
>         .remove =3D anx6345_i2c_remove,
>         .id_table =3D anx6345_id,
>  };
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers=
/gpu/drm/bridge/analogix/analogix-anx78xx.c
> index a3a38bbe2786..06a3e3243e19 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> @@ -1389,7 +1389,7 @@ static struct i2c_driver anx78xx_driver =3D {
>                    .name =3D "anx7814",
>                    .of_match_table =3D of_match_ptr(anx78xx_match_table),
>                   },
> -       .probe_new =3D anx78xx_i2c_probe,
> +       .probe =3D anx78xx_i2c_probe,
>         .remove =3D anx78xx_i2c_remove,
>         .id_table =3D anx78xx_id,
>  };
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/=
bridge/analogix/anx7625.c
> index 6846199a2ee1..0a97364ba8ea 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -2753,7 +2753,7 @@ static struct i2c_driver anx7625_driver =3D {
>                 .of_match_table =3D anx_match_table,
>                 .pm =3D &anx7625_pm_ops,
>         },
> -       .probe_new =3D anx7625_i2c_probe,
> +       .probe =3D anx7625_i2c_probe,
>         .remove =3D anx7625_i2c_remove,
> =20
>         .id_table =3D anx7625_id,
> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/b=
ridge/chipone-icn6211.c
> index 0e37840cd7a8..8bfce21d6b90 100644
> --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
> @@ -795,7 +795,7 @@ static struct i2c_device_id chipone_i2c_id[] =3D {
>  MODULE_DEVICE_TABLE(i2c, chipone_i2c_id);
> =20
>  static struct i2c_driver chipone_i2c_driver =3D {
> -       .probe_new =3D chipone_i2c_probe,
> +       .probe =3D chipone_i2c_probe,
>         .id_table =3D chipone_i2c_id,
>         .driver =3D {
>                 .name =3D "chipone-icn6211-i2c",
> diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/b=
ridge/chrontel-ch7033.c
> index 339b759e4c81..a854eb84e399 100644
> --- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
> +++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
> @@ -603,7 +603,7 @@ static const struct i2c_device_id ch7033_ids[] =3D {
>  MODULE_DEVICE_TABLE(i2c, ch7033_ids);
> =20
>  static struct i2c_driver ch7033_driver =3D {
> -       .probe_new =3D ch7033_probe,
> +       .probe =3D ch7033_probe,
>         .remove =3D ch7033_remove,
>         .driver =3D {
>                 .name =3D "ch7033",
> diff --git a/drivers/gpu/drm/bridge/cros-ec-anx7688.c b/drivers/gpu/drm/b=
ridge/cros-ec-anx7688.c
> index fa91bdeddef0..c8abd9920fee 100644
> --- a/drivers/gpu/drm/bridge/cros-ec-anx7688.c
> +++ b/drivers/gpu/drm/bridge/cros-ec-anx7688.c
> @@ -173,7 +173,7 @@ static const struct of_device_id cros_ec_anx7688_brid=
ge_match_table[] =3D {
>  MODULE_DEVICE_TABLE(of, cros_ec_anx7688_bridge_match_table);
> =20
>  static struct i2c_driver cros_ec_anx7688_bridge_driver =3D {
> -       .probe_new =3D cros_ec_anx7688_bridge_probe,
> +       .probe =3D cros_ec_anx7688_bridge_probe,
>         .remove =3D cros_ec_anx7688_bridge_remove,
>         .driver =3D {
>                 .name =3D "cros-ec-anx7688-bridge",
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge=
/ite-it6505.c
> index abaf6e23775e..a4cc51cf6e06 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -3478,7 +3478,7 @@ static struct i2c_driver it6505_i2c_driver =3D {
>                 .of_match_table =3D it6505_of_match,
>                 .pm =3D &it6505_bridge_pm_ops,
>         },
> -       .probe_new =3D it6505_i2c_probe,
> +       .probe =3D it6505_i2c_probe,
>         .remove =3D it6505_i2c_remove,
>         .shutdown =3D it6505_shutdown,
>         .id_table =3D it6505_id,
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridg=
e/ite-it66121.c
> index a2d723d6a4be..466641c77fe9 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -1640,7 +1640,7 @@ static struct i2c_driver it66121_driver =3D {
>                 .name   =3D "it66121",
>                 .of_match_table =3D it66121_dt_match,
>         },
> -       .probe_new =3D it66121_probe,
> +       .probe =3D it66121_probe,
>         .remove =3D it66121_remove,
>         .id_table =3D it66121_id,
>  };
> diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/b=
ridge/lontium-lt8912b.c
> index 13c131ade268..4eaea67fb71c 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> @@ -773,7 +773,7 @@ static struct i2c_driver lt8912_i2c_driver =3D {
>                 .name =3D "lt8912",
>                 .of_match_table =3D lt8912_dt_match,
>         },
> -       .probe_new =3D lt8912_probe,
> +       .probe =3D lt8912_probe,
>         .remove =3D lt8912_remove,
>         .id_table =3D lt8912_id,
>  };
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9211.c b/drivers/gpu/drm/br=
idge/lontium-lt9211.c
> index 3e19fff6547a..0ab7c07c2c84 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9211.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9211.c
> @@ -785,7 +785,7 @@ static const struct of_device_id lt9211_match_table[]=
 =3D {
>  MODULE_DEVICE_TABLE(of, lt9211_match_table);
> =20
>  static struct i2c_driver lt9211_driver =3D {
> -       .probe_new =3D lt9211_probe,
> +       .probe =3D lt9211_probe,
>         .remove =3D lt9211_remove,
>         .id_table =3D lt9211_id,
>         .driver =3D {
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/br=
idge/lontium-lt9611.c
> index a25d21a7d5c1..9663601ce098 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -1190,7 +1190,7 @@ static struct i2c_driver lt9611_driver =3D {
>                 .name =3D "lt9611",
>                 .of_match_table =3D lt9611_match_table,
>         },
> -       .probe_new =3D lt9611_probe,
> +       .probe =3D lt9611_probe,
>         .remove =3D lt9611_remove,
>         .id_table =3D lt9611_id,
>  };
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm=
/bridge/lontium-lt9611uxc.c
> index 583daacf3705..2a57e804ea02 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -1011,7 +1011,7 @@ static struct i2c_driver lt9611uxc_driver =3D {
>                 .of_match_table =3D lt9611uxc_match_table,
>                 .dev_groups =3D lt9611uxc_attr_groups,
>         },
> -       .probe_new =3D lt9611uxc_probe,
> +       .probe =3D lt9611uxc_probe,
>         .remove =3D lt9611uxc_remove,
>         .id_table =3D lt9611uxc_id,
>  };
> diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/d=
rivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> index 4fc494d9084b..460db3c8a08c 100644
> --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> @@ -375,7 +375,7 @@ MODULE_DEVICE_TABLE(of, stdp4028_ge_b850v3_fw_match);
> =20
>  static struct i2c_driver stdp4028_ge_b850v3_fw_driver =3D {
>         .id_table       =3D stdp4028_ge_b850v3_fw_i2c_table,
> -       .probe_new      =3D stdp4028_ge_b850v3_fw_probe,
> +       .probe          =3D stdp4028_ge_b850v3_fw_probe,
>         .remove         =3D stdp4028_ge_b850v3_fw_remove,
>         .driver         =3D {
>                 .name           =3D "stdp4028-ge-b850v3-fw",
> @@ -422,7 +422,7 @@ MODULE_DEVICE_TABLE(of, stdp2690_ge_b850v3_fw_match);
> =20
>  static struct i2c_driver stdp2690_ge_b850v3_fw_driver =3D {
>         .id_table       =3D stdp2690_ge_b850v3_fw_i2c_table,
> -       .probe_new      =3D stdp2690_ge_b850v3_fw_probe,
> +       .probe          =3D stdp2690_ge_b850v3_fw_probe,
>         .remove         =3D stdp2690_ge_b850v3_fw_remove,
>         .driver         =3D {
>                 .name           =3D "stdp2690-ge-b850v3-fw",
> diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridg=
e/nxp-ptn3460.c
> index cd292a2f894c..d81920227a8a 100644
> --- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
> +++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> @@ -335,7 +335,7 @@ MODULE_DEVICE_TABLE(of, ptn3460_match);
> =20
>  static struct i2c_driver ptn3460_driver =3D {
>         .id_table       =3D ptn3460_i2c_table,
> -       .probe_new      =3D ptn3460_probe,
> +       .probe          =3D ptn3460_probe,
>         .remove         =3D ptn3460_remove,
>         .driver         =3D {
>                 .name   =3D "nxp,ptn3460",
> diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bri=
dge/parade-ps8622.c
> index efa80e309b98..c9b6cb7678e3 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8622.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8622.c
> @@ -538,7 +538,7 @@ MODULE_DEVICE_TABLE(i2c, ps8622_i2c_table);
> =20
>  static struct i2c_driver ps8622_driver =3D {
>         .id_table       =3D ps8622_i2c_table,
> -       .probe_new      =3D ps8622_probe,
> +       .probe          =3D ps8622_probe,
>         .remove         =3D ps8622_remove,
>         .driver         =3D {
>                 .name   =3D "ps8622",
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bri=
dge/parade-ps8640.c
> index c3eb45179405..8801cdd033b5 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -791,7 +791,7 @@ static const struct of_device_id ps8640_match[] =3D {
>  MODULE_DEVICE_TABLE(of, ps8640_match);
> =20
>  static struct i2c_driver ps8640_driver =3D {
> -       .probe_new =3D ps8640_probe,
> +       .probe =3D ps8640_probe,
>         .remove =3D ps8640_remove,
>         .driver =3D {
>                 .name =3D "ps8640",
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/si=
i902x.c
> index ef66461e7f7c..aac239729a1d 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -1151,7 +1151,7 @@ static const struct i2c_device_id sii902x_i2c_ids[]=
 =3D {
>  MODULE_DEVICE_TABLE(i2c, sii902x_i2c_ids);
> =20
>  static struct i2c_driver sii902x_driver =3D {
> -       .probe_new =3D sii902x_probe,
> +       .probe =3D sii902x_probe,
>         .remove =3D sii902x_remove,
>         .driver =3D {
>                 .name =3D "sii902x",
> diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/si=
i9234.c
> index 2d17f227867b..d8373d918324 100644
> --- a/drivers/gpu/drm/bridge/sii9234.c
> +++ b/drivers/gpu/drm/bridge/sii9234.c
> @@ -955,7 +955,7 @@ static struct i2c_driver sii9234_driver =3D {
>                 .name   =3D "sii9234",
>                 .of_match_table =3D sii9234_dt_match,
>         },
> -       .probe_new =3D sii9234_probe,
> +       .probe =3D sii9234_probe,
>         .remove =3D sii9234_remove,
>         .id_table =3D sii9234_id,
>  };
> diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridg=
e/sil-sii8620.c
> index b96d03cd878d..79b09ccd1353 100644
> --- a/drivers/gpu/drm/bridge/sil-sii8620.c
> +++ b/drivers/gpu/drm/bridge/sil-sii8620.c
> @@ -2378,7 +2378,7 @@ static struct i2c_driver sii8620_driver =3D {
>                 .name   =3D "sii8620",
>                 .of_match_table =3D of_match_ptr(sii8620_dt_match),
>         },
> -       .probe_new      =3D sii8620_probe,
> +       .probe          =3D sii8620_probe,
>         .remove         =3D sii8620_remove,
>         .id_table =3D sii8620_id,
>  };
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/t=
c358767.c
> index 91f7cb56a654..4dcf899715ac 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -2209,7 +2209,7 @@ static struct i2c_driver tc358767_driver =3D {
>                 .of_match_table =3D tc358767_of_ids,
>         },
>         .id_table =3D tc358767_i2c_ids,
> -       .probe_new =3D tc_probe,
> +       .probe =3D tc_probe,
>         .remove =3D tc_remove,
>  };
>  module_i2c_driver(tc358767_driver);
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/t=
c358768.c
> index 7c0cbe84611b..783c3fd896ca 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -1083,7 +1083,7 @@ static struct i2c_driver tc358768_driver =3D {
>                 .of_match_table =3D tc358768_of_ids,
>         },
>         .id_table =3D tc358768_i2c_ids,
> -       .probe_new =3D tc358768_i2c_probe,
> +       .probe =3D tc358768_i2c_probe,
>         .remove =3D tc358768_i2c_remove,
>  };
>  module_i2c_driver(tc358768_driver);
> diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/t=
c358775.c
> index 19316994ddd1..90a89d70d832 100644
> --- a/drivers/gpu/drm/bridge/tc358775.c
> +++ b/drivers/gpu/drm/bridge/tc358775.c
> @@ -728,7 +728,7 @@ static struct i2c_driver tc358775_driver =3D {
>                 .of_match_table =3D tc358775_of_ids,
>         },
>         .id_table =3D tc358775_i2c_ids,
> -       .probe_new =3D tc_probe,
> +       .probe =3D tc_probe,
>         .remove =3D tc_remove,
>  };
>  module_i2c_driver(tc358775_driver);
> diff --git a/drivers/gpu/drm/bridge/ti-dlpc3433.c b/drivers/gpu/drm/bridg=
e/ti-dlpc3433.c
> index 186a9e2ff24d..b65632ec7e7d 100644
> --- a/drivers/gpu/drm/bridge/ti-dlpc3433.c
> +++ b/drivers/gpu/drm/bridge/ti-dlpc3433.c
> @@ -400,7 +400,7 @@ static const struct of_device_id dlpc3433_match_table=
[] =3D {
>  MODULE_DEVICE_TABLE(of, dlpc3433_match_table);
> =20
>  static struct i2c_driver dlpc3433_driver =3D {
> -       .probe_new =3D dlpc3433_probe,
> +       .probe =3D dlpc3433_probe,
>         .remove =3D dlpc3433_remove,
>         .id_table =3D dlpc3433_id,
>         .driver =3D {
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi83.c
> index 75286c9afbb9..e26a8acb9f6b 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -734,7 +734,7 @@ static const struct of_device_id sn65dsi83_match_tabl=
e[] =3D {
>  MODULE_DEVICE_TABLE(of, sn65dsi83_match_table);
> =20
>  static struct i2c_driver sn65dsi83_driver =3D {
> -       .probe_new =3D sn65dsi83_probe,
> +       .probe =3D sn65dsi83_probe,
>         .remove =3D sn65dsi83_remove,
>         .id_table =3D sn65dsi83_id,
>         .driver =3D {
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index 7a748785c545..62ec377f2183 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1951,7 +1951,7 @@ static struct i2c_driver ti_sn65dsi86_driver =3D {
>                 .of_match_table =3D ti_sn65dsi86_match_table,
>                 .pm =3D &ti_sn65dsi86_pm_ops,
>         },
> -       .probe_new =3D ti_sn65dsi86_probe,
> +       .probe =3D ti_sn65dsi86_probe,
>         .id_table =3D ti_sn65dsi86_id,
>  };
> =20
> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/=
ti-tfp410.c
> index ab63225cd635..c06390da9ffd 100644
> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> @@ -408,7 +408,7 @@ static struct i2c_driver tfp410_i2c_driver =3D {
>                 .of_match_table =3D of_match_ptr(tfp410_match),
>         },
>         .id_table       =3D tfp410_i2c_ids,
> -       .probe_new      =3D tfp410_i2c_probe,
> +       .probe          =3D tfp410_i2c_probe,
>         .remove         =3D tfp410_i2c_remove,
>  };
>  #endif /* IS_ENABLED(CONFIG_I2C) */
> diff --git a/drivers/gpu/drm/i2c/tda9950.c b/drivers/gpu/drm/i2c/tda9950.c
> index b8c143e573e0..82d618c40dce 100644
> --- a/drivers/gpu/drm/i2c/tda9950.c
> +++ b/drivers/gpu/drm/i2c/tda9950.c
> @@ -492,7 +492,7 @@ static struct i2c_device_id tda9950_ids[] =3D {
>  MODULE_DEVICE_TABLE(i2c, tda9950_ids);
> =20
>  static struct i2c_driver tda9950_driver =3D {
> -       .probe_new =3D tda9950_probe,
> +       .probe =3D tda9950_probe,
>         .remove =3D tda9950_remove,
>         .driver =3D {
>                 .name =3D "tda9950",
> diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda9=
98x_drv.c
> index db5c9343a3d2..40bcd9067e69 100644
> --- a/drivers/gpu/drm/i2c/tda998x_drv.c
> +++ b/drivers/gpu/drm/i2c/tda998x_drv.c
> @@ -2099,7 +2099,7 @@ static const struct i2c_device_id tda998x_ids[] =3D=
 {
>  MODULE_DEVICE_TABLE(i2c, tda998x_ids);
> =20
>  static struct i2c_driver tda998x_driver =3D {
> -       .probe_new =3D tda998x_probe,
> +       .probe =3D tda998x_probe,
>         .remove =3D tda998x_remove,
>         .driver =3D {
>                 .name =3D "tda998x",
> diff --git a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c b/drivers=
/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
> index aba556c98300..4819ada69482 100644
> --- a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
> +++ b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
> @@ -308,7 +308,7 @@ static struct i2c_driver lcd_olinuxino_driver =3D {
>                 .name =3D "lcd_olinuxino",
>                 .of_match_table =3D lcd_olinuxino_of_ids,
>         },
> -       .probe_new =3D lcd_olinuxino_probe,
> +       .probe =3D lcd_olinuxino_probe,
>         .remove =3D lcd_olinuxino_remove,
>  };
> =20
> diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/driv=
ers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> index 11d6ca276c1e..90ea91e4311d 100644
> --- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> +++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> @@ -489,7 +489,7 @@ static struct i2c_driver rpi_touchscreen_driver =3D {
>                 .name =3D "rpi_touchscreen",
>                 .of_match_table =3D rpi_touchscreen_of_ids,
>         },
> -       .probe_new =3D rpi_touchscreen_probe,
> +       .probe =3D rpi_touchscreen_probe,
>         .remove =3D rpi_touchscreen_remove,
>  };
> =20
> diff --git a/drivers/gpu/drm/solomon/ssd130x-i2c.c b/drivers/gpu/drm/solo=
mon/ssd130x-i2c.c
> index ddfa0bb5d9c9..b4eb2d64bf6e 100644
> --- a/drivers/gpu/drm/solomon/ssd130x-i2c.c
> +++ b/drivers/gpu/drm/solomon/ssd130x-i2c.c
> @@ -100,7 +100,7 @@ static struct i2c_driver ssd130x_i2c_driver =3D {
>                 .name =3D DRIVER_NAME,
>                 .of_match_table =3D ssd130x_of_match,
>         },
> -       .probe_new =3D ssd130x_i2c_probe,
> +       .probe =3D ssd130x_i2c_probe,
>         .remove =3D ssd130x_i2c_remove,
>         .shutdown =3D ssd130x_i2c_shutdown,
>  };
>=20
> base-commit: ac9a78681b921877518763ba0e89202254349d1b
> --=20
> 2.39.2
>
