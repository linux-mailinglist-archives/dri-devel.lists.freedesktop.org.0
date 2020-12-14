Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E266B2D988D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 14:10:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB3589D58;
	Mon, 14 Dec 2020 13:10:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E0789D58
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 13:10:04 +0000 (UTC)
Date: Mon, 14 Dec 2020 14:10:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607951404;
 bh=dYqaX7ZlT918HqHUjPs08NC+tP8SqoCldZ3xCn63nYk=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=VGYH/aNjeJl4uLvzeNpTOymBIMhshwvZsjzjeGCzql7gGgi4uvnWSUfQ2UUo3MLqn
 FJOYTzWqlOn2hn8l/05jXrJhmxlbsvZ9yhoLwt4ovrIc56ghGVASLqkAe/Ehe8u++J
 FN1tWEeJfcrmk00DKI4cjauULsmW0zBdCEEWVa88wL56HjPwgowYSJvlCMVqszLGuf
 T0RzUFPiEczataQJDdnsQsoRzG4R8QQci5i0RlwPm7PlnizfiHIsyB/EH8KQdtV7zt
 d6n6P+UsrtcgzW3rRAqWVyUGPkWGXr8L1Pz9ckambqGXhThKOhDOGR1o3M1s/MP8Is
 gnJ4F3IIpyMCg==
From: Sebastian Reichel <sre@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v5 03/29] drm/omap: pll: fix iteration loop check
Message-ID: <20201214131002.g2o22exnripd352y@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-4-tomi.valkeinen@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201208122855.254819-4-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: multipart/mixed; boundary="===============0142474758=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0142474758==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5towxtsqzguguzvq"
Content-Disposition: inline


--5towxtsqzguguzvq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 02:28:29PM +0200, Tomi Valkeinen wrote:
> If the PLL calc function is given bad parameters, n_start/m_start may be
> higher than n_stop/m_stop, which leads to the loops iterating through
> the whole u32 number space.
>=20
> Fix this by failing early on such cases.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/omapdrm/dss/pll.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/pll.c b/drivers/gpu/drm/omapdrm/=
dss/pll.c
> index 1212f3cc52d1..12926218c436 100644
> --- a/drivers/gpu/drm/omapdrm/dss/pll.c
> +++ b/drivers/gpu/drm/omapdrm/dss/pll.c
> @@ -222,6 +222,9 @@ bool dss_pll_calc_a(const struct dss_pll *pll, unsign=
ed long clkin,
>  	n_stop =3D min((unsigned)(clkin / fint_hw_min), hw->n_max);
>  	n_inc =3D 1;
> =20
> +	if (n_start > n_stop)
> +		return false;
> +
>  	if (hw->errata_i886) {
>  		swap(n_start, n_stop);
>  		n_inc =3D -1;
> @@ -239,6 +242,9 @@ bool dss_pll_calc_a(const struct dss_pll *pll, unsign=
ed long clkin,
>  				hw->m_max);
>  		m_inc =3D 1;
> =20
> +		if (m_start > m_stop)
> +			continue;
> +
>  		if (hw->errata_i886) {
>  			swap(m_start, m_stop);
>  			m_inc =3D -1;
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--5towxtsqzguguzvq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XZCoACgkQ2O7X88g7
+pqJ6hAAkx+ebmVUSwe2pwpghVXidASey7O5J425uRtx/aDG1c7pwc/XM3VWdh0T
eVbiz/QYH2asCNk1EPiSl9Dm9peqwiIDoG2uQIq6GcGmXiT/BpTQW40J8wDuQStE
MPhy8OhAkt/ktJ279oAhS/3ja3Pq+Vog2OD2ZaQZEJAb+9vum+GG0Qw8LobBhcjb
cvW9IieSBi4u1eyX3g3zy+Jojv6UmeFMpfDrjjCFMRC2dlsAhL2l9fs49J/JQX0S
IQNbNm+26bFDdsMs4PzF8bgY+BKGJtTHU0DaSreyOFynbL31LjoGsuNCrDAg6Ckt
0OgsIHDJ5si+ttEoZWAxkGQEEoezVh0x/cTpojcugroA5cTgBJtzWTpUiT9HW/qy
qEQWUWsQq5qT7lCx/Vgou+6+Srw9lxx83fGJ9XFR8E3ZY2YJUkooeASkU2xoUymy
oSxaKlpVeYFv83TSgQGbGQkPgnZ94UNhA5qhTTqs1uOAHftsV3bVP65QAPEgAjBM
vJEqXfgRkqeGluHq2NabM0E/gTO8FsHHt6bbgxNw+Ynzs3F7ySwedE/d/cexS8En
r/g1lIGvLOknj8GtQCE59d/ptNutsIifclH9WdalSI9Uw2iw3z3AE7z9kYQPi/8u
N1dGDQmwtsyggjwSROmRx8C+/Xw/A1E9FnLHMEa3zO6GmFfDedE=
=rlq9
-----END PGP SIGNATURE-----

--5towxtsqzguguzvq--

--===============0142474758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0142474758==--
