Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDA12C7712
	for <lists+dri-devel@lfdr.de>; Sun, 29 Nov 2020 01:53:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F436E11A;
	Sun, 29 Nov 2020 00:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F506E11A
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Nov 2020 00:53:34 +0000 (UTC)
Received: from earth.universe (dyndsl-095-033-158-166.ewe-ip-backbone.de
 [95.33.158.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C2F8920731;
 Sun, 29 Nov 2020 00:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606611213;
 bh=Mqlc23BXjpuFDfxUUFQMIopOb4FFgOiVvMlt3K7if1A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JJedKlNBHHn0PnayhRps9M3gFaagVEF3bvLAen5e7sRHAkVm/ma5zf0zxB9YEBRp0
 7q5/RutNC7hZF9CnNnMp7Z0YGFSokooGCmeeepcWYD4oHBgJlBArSIqHEZpP/eeZQD
 KZVtI73K+SlAgkFQvLN4E3NOQ+lvjyqhK31JO5TY=
Received: by earth.universe (Postfix, from userid 1000)
 id EE38D3C0C91; Sun, 29 Nov 2020 01:53:31 +0100 (CET)
Date: Sun, 29 Nov 2020 01:53:31 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/panel: sony-acx565akm: Fix race condition in probe
Message-ID: <20201129005331.z45f5uqjwxki4wwz@earth.universe>
References: <20201127200429.129868-1-sebastian.reichel@collabora.com>
 <20201128220847.GC3865@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20201128220847.GC3865@pendragon.ideasonboard.com>
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
Cc: kernel@collabora.com, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Tony Lindgren <tony@atomide.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Merlijn Wajer <merlijn@wizzup.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-omap@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Jarkko Nikula <jarkko.nikula@bitmer.com>
Content-Type: multipart/mixed; boundary="===============1730165397=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1730165397==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gli55xpyex5xcoqk"
Content-Disposition: inline


--gli55xpyex5xcoqk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Sun, Nov 29, 2020 at 12:08:47AM +0200, Laurent Pinchart wrote:
> On Fri, Nov 27, 2020 at 09:04:29PM +0100, Sebastian Reichel wrote:
> > The probe routine acquires the reset GPIO using GPIOD_OUT_LOW. Directly
> > afterwards it calls acx565akm_detect(), which sets the GPIO value to
> > HIGH. If the bootloader initialized the GPIO to HIGH before the probe
> > routine was called, there is only a very short time period of a few
> > instructions where the reset signal is LOW. Exact time depends on
> > compiler optimizations, kernel configuration and alignment of the stars,
> > but I expect it to be always way less than 10us. There are no public
> > datasheets for the panel, but acx565akm_power_on() has a comment with
> > timings and reset period should be at least 10us. So this potentially
> > brings the panel into a half-reset state.
>=20
> Good catch.
>=20
> Looks like we got the reset polarity wrong in the driver though.
> GPIOD_OUT_LOW should mean de-asserted, but the driver expects it to mean
> low level. We can't fix that as it would require changing the device
> tree :-(

Yes, polarity is wrong unfortunately.

> > The result is, that panel may not work after boot and can get into a
> > working state by re-enabling it (e.g. by blanking + unblanking), since
> > that does a clean reset cycle. This bug has recently been hit by Ivaylo
> > Dimitrov, but there are some older reports which are probably the same
> > bug. At least Tony Lindgren, Peter Ujfalusi and Jarkko Nikula have
> > experienced it in 2017 describing the blank/unblank procedure as
> > possible workaround.
> >=20
> > Note, that the bug really goes back in time. It has originally been
> > introduced in the predecessor of the omapfb driver in 3c45d05be382
> > ("OMAPDSS: acx565akm panel: handle gpios in panel driver") in 2012.
> > That driver eventually got replaced by a newer one, which had the bug
> > from the beginning in 84192742d9c2 ("OMAPDSS: Add Sony ACX565AKM panel
> > driver") and still exists in fbdev world. That driver has later been
> > copied to omapdrm and then was used as a basis for this driver. Last
> > but not least the omapdrm specific driver has been removed in
> > 45f16c82db7e ("drm/omap: displays: Remove unused panel drivers").
> >=20
> > Reported-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
> > Reported-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> > Reported-by: Tony Lindgren <tony@atomide.com>
> > Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> > Reported-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> > Cc: Merlijn Wajer <merlijn@wizzup.org>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > Fixes: 1c8fc3f0c5d2 ("drm/panel: Add driver for the Sony ACX565AKM pane=
l")
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  drivers/gpu/drm/panel/panel-sony-acx565akm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/panel/panel-sony-acx565akm.c b/drivers/gpu=
/drm/panel/panel-sony-acx565akm.c
> > index e95fdfb16b6c..ba0b3ead150f 100644
> > --- a/drivers/gpu/drm/panel/panel-sony-acx565akm.c
> > +++ b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
> > @@ -629,7 +629,7 @@ static int acx565akm_probe(struct spi_device *spi)
> >  	lcd->spi =3D spi;
> >  	mutex_init(&lcd->mutex);
> > =20
> > -	lcd->reset_gpio =3D devm_gpiod_get(&spi->dev, "reset", GPIOD_OUT_LOW);
> > +	lcd->reset_gpio =3D devm_gpiod_get(&spi->dev, "reset", GPIOD_OUT_HIGH=
);
>=20
> Wouldn't it be better to instead add a delay here (or in
> acx565akm_detect()) ? If the panel is in a wrong state at
> boot time, a real reset can help.

acx565akm_detect() reads some registers to detect a previously
enabled panel and then driver handles this case properly. If we
reset the panel before the detection code, any detection code
would be useless (panel is obviously not enabled after a reset).

I think this detection code is only needed to avoid flickering
when a bootsplash is shown. So by accepting a bit of flickering
we can simplify the driver by dropping that code and make it a
bit more robust by doing a reset. It's a tradeoff and I don't
have strong feelings for either option.

But I think, that this fix should be applied to fixes branch
(and backported to stable). Removing panel enable detection
should not be applied as fix IMHO.

-- Sebastian

--gli55xpyex5xcoqk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/C8QMACgkQ2O7X88g7
+pq+NA/9HgUHk2AeP9aL5fvpk/dJk8KnlY/uYGq7H0/XhU4lDtrIzK11wwu5qhS1
ozymZzMJj1edEqB40WHDv4KLsZHyNnvwrRFLG7tYcSz0OMSDL8jioJKclc4f6WV/
huqKSiVLc7yjyWx0wakvJ6hXAaYhNyr7VF3Fwpofo8ieF8FmUITPzDUa1qa7FZym
3XBxXo9WLjWbPpdr5GLY5UUTgAv/0YU95emFI40fXVmCIH5tnlfWdV8RRwc5+xLa
MA+kdi5QraN7Jr3hrim1a94veZiiAhV781RjjINYpJYT7FY5x5TIVN087xzCA1m8
o1KcQTp/Q3ZoUiFSKWTvvrf5E2fdtwzs0sR9A8tuPzkOVIsp+NtcoSC/CnslZG9+
1zIryPqtBKZXixkwGBDM+k1PvFue3E944X6xzJJMoolbCFMgzgzV/gLRU+qnqnZt
Bluor0sKzw5eC0Igtpc9E9Sqpw82IcoZEQMpN19ZEmibo4KfJw4SbiKYRYCCNAn7
TpPSMOJyZ9JUcthLcrmrD+XGRjZIOXGuncKh1TKIKnX+uwf/likJSXoh6Q4iy/LG
XU7mjZBJ1CB+h4Ygndon0hYz9cIIqkBH73txSOm30D+jNGHzFnqEMYc5fFfG1iUd
6LU8i6JzpFvvCzq2px0G2OlDeEj/wW0ucHj7KXAM9WjvmB69yrY=
=QT6B
-----END PGP SIGNATURE-----

--gli55xpyex5xcoqk--

--===============1730165397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1730165397==--
