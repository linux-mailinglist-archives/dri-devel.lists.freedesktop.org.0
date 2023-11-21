Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A83F77F331E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 17:05:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518C310E4EA;
	Tue, 21 Nov 2023 16:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ACB010E4EA
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 16:05:30 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r5TFU-0002YH-Uj; Tue, 21 Nov 2023 17:05:16 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r5TFT-00AciH-0t; Tue, 21 Nov 2023 17:05:15 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r5TFS-00534r-Ne; Tue, 21 Nov 2023 17:05:14 +0100
Date: Tue, 21 Nov 2023 17:05:14 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 101/108] drm/bridge: ti-sn65dsi86: Make use of
 devm_pwmchip_alloc() function
Message-ID: <20231121160514.feveiq2cyemwvqni@pengutronix.de>
References: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
 <20231121134901.208535-102-u.kleine-koenig@pengutronix.de>
 <CAD=FV=Vz7TuUH=U8t0XVhj5rzoci9KBjSZXJruMQyXiARY+Z_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wksajl7kpzsrvmwx"
Content-Disposition: inline
In-Reply-To: <CAD=FV=Vz7TuUH=U8t0XVhj5rzoci9KBjSZXJruMQyXiARY+Z_Q@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wksajl7kpzsrvmwx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Doug,

On Tue, Nov 21, 2023 at 07:15:51AM -0800, Doug Anderson wrote:
> > @@ -1585,22 +1586,28 @@ static const struct pwm_ops ti_sn_pwm_ops =3D {
> >  static int ti_sn_pwm_probe(struct auxiliary_device *adev,
> >                            const struct auxiliary_device_id *id)
> >  {
> > +       struct pwm_chip *chip;
> >         struct ti_sn65dsi86 *pdata =3D dev_get_drvdata(adev->dev.parent=
);
> >
> > -       pdata->pchip.dev =3D pdata->dev;
> > -       pdata->pchip.ops =3D &ti_sn_pwm_ops;
> > -       pdata->pchip.npwm =3D 1;
> > -       pdata->pchip.of_xlate =3D of_pwm_single_xlate;
> > -       pdata->pchip.of_pwm_n_cells =3D 1;
> > +       /* XXX: should this better use adev->dev instead of pdata->dev?=
 */
> > +       pdata->pchip =3D chip =3D devm_pwmchip_alloc(pdata->dev, 1, siz=
eof(&pdata));
>=20
> Yes, it should be "adev->dev". See recent commits like commit
> 7b821db95140 ("drm/bridge: ti-sn65dsi86: Associate DSI device lifetime
> with auxiliary device").

I'd do that in a separate commit and not change that hidden in patch
like this one. Agree? Then I'd keep that as is and not address this in
this series. Maybe it will take another cycle until this patch goes in
anyhow ...

> I also think the size you're passing is technically wrong. The private
> data you're storing is a pointer to a "struct ti_sn65dsi86". The size
> of that is "sizeof(pdata)", not "sizeof(&pdata)".

sizeof(*pdata)?

> Other than the above, this looks OK to me. Once the dependencies are
> in I'd be happy to apply this to drm-misc. I could also "Ack" it for
> landing in other trees and I _think_ that would be OK (the driver
> isn't changing much and it's unlikely to cause conflicts), though
> technically the Ack would be more legit from one of the drm-misc
> maintainers [1].
>=20
> [1] https://drm.pages.freedesktop.org/maintainer-tools/repositories.html?=
highlight=3Dmaxime#the-drm-misc-repository

*nod*

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--wksajl7kpzsrvmwx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVc1TkACgkQj4D7WH0S
/k5U/gf+IJSjD2KOhvY3bj4PzkBHwCpz622WDH2+3xQDo1hFRdxt/Blerymh7xNW
sKJ3aHNYtaBjuVO8PC1f+0PH0orRhCjjuUvjRzKip4/2PK1Uk2qPE41nHCXkcP4q
bxVsv3BRt9lSYZLGU2QOR88aokE5mS9OvqCdYsDIiUWrpwyyEpV0/y6xpaegjo9P
T6RPuVH7GsmvIunJ8XEu+5dp6qy7OW+nix+ZG4yScgjZwtgPU/nKITOry3424duj
+4hRCyFyPJ1q9173aksZpW6KyC+H5IodXRXmyojDhq5N3dTgjeT7B3ELaXVaBAGV
vAGhfJqjzZ/bwNw/eoAEvqkb5jW9tQ==
=n3d5
-----END PGP SIGNATURE-----

--wksajl7kpzsrvmwx--
