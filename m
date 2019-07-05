Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F3460E19
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jul 2019 01:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA766E563;
	Fri,  5 Jul 2019 23:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287B86E563
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 23:23:15 +0000 (UTC)
Received: from earth.universe (unknown [185.62.205.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A7F7C2147A;
 Fri,  5 Jul 2019 23:23:14 +0000 (UTC)
Received: by earth.universe (Postfix, from userid 1000)
 id 255733C08D5; Sat,  6 Jul 2019 01:23:12 +0200 (CEST)
Date: Sat, 6 Jul 2019 01:23:12 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 0/4] Add a generic driver for LED-based backlight
Message-ID: <20190705232312.uxh7rlin6r6jwn3e@earth.universe>
References: <20190701151423.30768-1-jjhiblot@ti.com>
 <20190705101434.fw5rpctnqt6dwg6e@devuan>
MIME-Version: 1.0
In-Reply-To: <20190705101434.fw5rpctnqt6dwg6e@devuan>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1562368994;
 bh=vmEZKNZqRr6xwY0yKdVhBStqaQqbAFizMtRR8lJ/Y8g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vctNU5xBE0x1R29063mHZbrhF1Jxc5qG6pFi5a8nhFuaWdIqE4gq+Lv7iXbzoN3Oo
 6hsTyC+Xxgt94NFhq9t27v5YK+Ymgi+1F98NatTuNSwYrD6WGYXvsJPzP/R7IO4QEK
 MruLsJ0v+qCQ8c+KtBosUeaOW6xOKU+StFOhTOXQ=
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, tomi.valkeinen@ti.com, jacek.anaszewski@gmail.com,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: multipart/mixed; boundary="===============0875185171=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0875185171==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="57433k23tjcm5ynk"
Content-Disposition: inline


--57433k23tjcm5ynk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 05, 2019 at 12:14:34PM +0200, Pavel Machek wrote:
> On Mon 2019-07-01 17:14:19, Jean-Jacques Hiblot wrote:
> > This series aims to add a led-backlight driver, similar to pwm-backligh=
t,
> > but using a LED class device underneath.
> >=20
> > A few years ago (2015), Tomi Valkeinen posted a series implementing a
> > backlight driver on top of a LED device:
> > https://patchwork.kernel.org/patch/7293991/
> > https://patchwork.kernel.org/patch/7294001/
> > https://patchwork.kernel.org/patch/7293981/
> >=20
> > The discussion stopped because Tomi lacked the time to work on it.
> >=20
> > This series takes it from there and implements the binding that was
> > discussed in https://patchwork.kernel.org/patch/7293991/. In this new
> > binding the backlight device is a child of the LED controller instead of
> > being another platform device that uses a phandle to reference a LED.
>=20
> Other option would be to have backlight trigger. What are
> advantages/disadvantages relative to that?

One advantage of having something like this is the possibility to
reference the backlight in DT. This means the system has an idea
how backlights are mapped. E.g.:

panelA {
    compatible =3D "random-panel";
    backlight =3D <&backlight1>;
}

panelB {
    compatible =3D "random-panel";
    backlight =3D <&backlight2>;
}

-- Sebastian

--57433k23tjcm5ynk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl0f290ACgkQ2O7X88g7
+po9RA//cLYbl7o2nMQIXHn/Oekssa9YS8SFaPCKAo2h6Gho1scrDNc91jMoi1Pa
fHdXgKrJ+QnQUGW5nf6MHBCC9R5QOSMHlerf5Taf63Wr1tvDIcmFhUj0O1JQ5cqq
4J46Vq23ZvL45658vDW5IF8teDkm0A8nELQqnaEg3hrJB8Vw9LOx3XnJxhaJlHAd
xdAmqvPlvTdR5hIUeGCZ7TCK7b3024xIFZiKpvBaEhnL98230azZ4uMdzS76W6o4
cx4c5viE+xK5jplCcoAhN9UsIdzdQKRAYDP565FnEdzpUlOzXCXDSbR63aOfHkoi
j9YoGLDtxnxdUa2WeBiM2gyso7uj97nsfGrZM3QaygXg/zWW2hmDhF3iwpxwdmRP
/PwfwWXsRyd7JokQn4g4AoqvgCSltMK0X8xAoZ88O+207wRhbKCZA3ljCcYTt713
CsEtWzxa/z/UlGAETcSaZbmsFI3IZFNaz9pqkCwkuuyhIPh7PdQNBB0mqze0aiCy
1xRAFLC6yOP0ojORn73Ki2hLluoxYd3f0NU9dVxdYMMUIz4FtNXLaJhnXtBeY/LY
4UI87oha4XdCalCnp2Mg2Ybxe5o3ZPLwBLzs8+3ifeBxGDMDuQ3v/t0uTlFSSrrj
fUN0MXHtt2vAVBKLA4FiXSKAutopgPojYx3YZRmey6YNNUgOaf4=
=9zIH
-----END PGP SIGNATURE-----

--57433k23tjcm5ynk--

--===============0875185171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0875185171==--
