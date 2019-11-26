Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0074410AB71
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 09:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B576E20C;
	Wed, 27 Nov 2019 08:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7EA76E3E1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 14:28:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id CBA622639F4
Date: Tue, 26 Nov 2019 09:28:14 -0500
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] drm/panfrost: devfreq: Round frequencies to OPPs
Message-ID: <20191126142814.GA6151@kevin>
References: <20191118173002.32015-1-steven.price@arm.com>
MIME-Version: 1.0
In-Reply-To: <20191118173002.32015-1-steven.price@arm.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Wed, 27 Nov 2019 08:09:16 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1599337144=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1599337144==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

On Mon, Nov 18, 2019 at 05:30:02PM +0000, Steven Price wrote:
> Currently when setting a frequency in panfrost_devfreq_target the
> returned frequency is the actual frequency that the clock driver reports
> (the return of clk_get_rate()). However, where the provided OPPs don't
> precisely match the frequencies that the clock actually achieves devfreq
> will then complain (repeatedly):
>=20
>   devfreq devfreq0: Couldn't update frequency transition information.
>=20
> To avoid this change panfrost_devfreq_target() to fetch the opp using
> devfreq_recommened_opp() and not actually query the clock for the
> frequency.
>=20
> A similar problem exists with panfrost_devfreq_get_cur_freq(), but in
> this case because the function is optional we can just remove it and
> devfreq will fall back to using the previously set frequency.
>=20
> Fixes: 221bc77914cb ("drm/panfrost: Use generic code for devfreq")
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/dr=
m/panfrost/panfrost_devfreq.c
> index 4c4e8a30a1ac..536ba93b0f46 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -18,15 +18,18 @@ static void panfrost_devfreq_update_utilization(struc=
t panfrost_device *pfdev);
>  static int panfrost_devfreq_target(struct device *dev, unsigned long *fr=
eq,
>  				   u32 flags)
>  {
> -	struct panfrost_device *pfdev =3D dev_get_drvdata(dev);
> +	struct dev_pm_opp *opp;
>  	int err;
> =20
> +	opp =3D devfreq_recommended_opp(dev, freq, flags);
> +	if (IS_ERR(opp))
> +		return PTR_ERR(opp);
> +	dev_pm_opp_put(opp);
> +
>  	err =3D dev_pm_opp_set_rate(dev, *freq);
>  	if (err)
>  		return err;
> =20
> -	*freq =3D clk_get_rate(pfdev->clock);
> -
>  	return 0;
>  }
> =20
> @@ -60,20 +63,10 @@ static int panfrost_devfreq_get_dev_status(struct dev=
ice *dev,
>  	return 0;
>  }
> =20
> -static int panfrost_devfreq_get_cur_freq(struct device *dev, unsigned lo=
ng *freq)
> -{
> -	struct panfrost_device *pfdev =3D platform_get_drvdata(to_platform_devi=
ce(dev));
> -
> -	*freq =3D clk_get_rate(pfdev->clock);
> -
> -	return 0;
> -}
> -
>  static struct devfreq_dev_profile panfrost_devfreq_profile =3D {
>  	.polling_ms =3D 50, /* ~3 frames */
>  	.target =3D panfrost_devfreq_target,
>  	.get_dev_status =3D panfrost_devfreq_get_dev_status,
> -	.get_cur_freq =3D panfrost_devfreq_get_cur_freq,
>  };
> =20
>  int panfrost_devfreq_init(struct panfrost_device *pfdev)
> --=20
> 2.20.1
>=20

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl3dNngACgkQ/v5QWgr1
WA267g/+NDmG6aj6K2DK0lkeUq6M/3casflPkv+adupyR8L/SuhJ+U+76a3XhqVI
xAn+eYwpqNHXeiSW3vTYWXVZ/nwsZ0SRbEZmdDKfuXmYiP1Wkt8HOxgEIPDgyI9r
5baXr3yXckq/aUZ+vPA8U6vw/qHAWaycIHmcOg+mUMXYPuFHJH4o2kK/wZywJAZc
/nt+XCuwhXS6Eur2kNHWo6SCYXZlAxCPEzRqpjupc1R3W0EnXJvNH1eX+2tF1W08
vO093pttECSnibV7NQHIKLfREyoybBWBJamocRTBuFlpn0Va5r3Y8Dw+CX4xZ+js
oZTRb/gLZ4WFCYoMLQUUwO+D+vqVu0BQDrxL03gMS2qGDAJ0gNQWVfJP7nwBpBzU
N0s7gMIGYx4m9veC3B4CVb8szQrpkD3KoXLfZycm+EtZx2afqbvDrP7lXDfuE3ma
Vw/7H2Dg/8kZKsEPCLIHszWlJuOsbHAFmf4hUlLp6tsFJRwb891S05fWKtqTa8UX
qLsakAu4GlJu2OmVPo1kCHLJklZTVwWGETxXObpsELF/fA2Bq/E1Zeq3Veib3P0A
RcR2AIt0QN80shPCfzWY0h2WZcQVrV+uRXuUusp5qOxA0WtdqAhPjlZ0fYOwZE/9
UvEbUBWFcOa6qrVVa4IvvklKZ62DL4qCrV200mc3hE5c7Td8xhg=
=liIu
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--

--===============1599337144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1599337144==--
