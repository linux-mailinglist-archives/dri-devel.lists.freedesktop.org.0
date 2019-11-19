Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1CD103033
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 00:28:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ACC56EA0F;
	Tue, 19 Nov 2019 23:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07056E3F5
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 21:21:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id BD32528ED0E
Received: by earth.universe (Postfix, from userid 1000)
 id 78ADE3C0C78; Tue, 19 Nov 2019 22:21:21 +0100 (CET)
Date: Tue, 19 Nov 2019 22:21:21 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [RFCv1 32/42] drm/omap: dsi: convert to drm_panel
Message-ID: <20191119212121.htqjlqbetoli5kp4@earth.universe>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
 <20191117024028.2233-33-sebastian.reichel@collabora.com>
 <D109D867-1C8E-44F6-9C91-AF55BCB3FDD3@goldelico.com>
 <20191118144558.abix5y555jk63szb@earth.universe>
 <9681B365-9174-43CE-BCAE-ED986F182935@goldelico.com>
 <469800BA-25F8-4E0A-8194-50C197BC4BF5@goldelico.com>
MIME-Version: 1.0
In-Reply-To: <469800BA-25F8-4E0A-8194-50C197BC4BF5@goldelico.com>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Tue, 19 Nov 2019 23:28:08 +0000
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 Merlijn Wajer <merlijn@wizzup.org>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1965200750=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1965200750==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nxwd6lhuvnkw4xqv"
Content-Disposition: inline


--nxwd6lhuvnkw4xqv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nikolaus,

On Tue, Nov 19, 2019 at 10:42:55AM +0100, H. Nikolaus Schaller wrote:
> > Am 18.11.2019 um 15:51 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> >=20
> >> Ok, I tried not to break video mode support, but I do not have any
> >> hardware. Make sure to set the MIPI_DSI_MODE_VIDEO flag in the panel
> >> driver.
> >=20
> > Indeed, this may be missing (can't look into the code at the moment)...
> > Or I did something wrong when refactoring the driver.
> > We will find out.
>=20
> Yes, MIPI_DSI_MODE_VIDEO was indeed missing/wrongly applied and some
> more bugs. But I still wasn't able to make it work.
>=20
> I also tried to fake the panel-orisetech-otm8009a.c DSI driver into
> my setup. It should not properly program the panel by DCS command
> but it should try to.
>=20
> Result is the same: I can see it being probed and calling get_modes
> but then:
>=20
> [drm] Cannot find any crtc or sizes
>=20
> And I don't see calls to .enable or .prepare where DCS commands would
> be sent.

You probably want to enable all kind of drm debugging to get more
information. I guess, that some timing check fails, e.g.
dsi_check_timings(). If the timing checks fail, the mode will not
be added as valid mode. When no valid mode is found, the panel
will not be enabled.

-- Sebastian

--nxwd6lhuvnkw4xqv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl3UXNEACgkQ2O7X88g7
+pr+qQ//RvImY+pnQMKdBuAnUUgREwqGVEkxUwXNIheUOR2qfZ72HHvrGZppeOxT
351fOvDf8pI5mNn62y/sva2IgUsA3pg7GeL4ELnSXrALg5mz4DlipUP2upUu9R2d
TUhg2JKX9fKWysuoxmC5x40eVkvJcxYpqR75LJHR2B3Z4HZnLaGQvsgIaIywj150
duMtyPV9kyn44ZnMvVqXsiTN/ibMPNggAaXxy2EAcJNaJdYFe1FGLy3SEarmrIES
K8jE32BYoLZ1iwbAcb4WdrVk8Ib+xl2x1tkiTFtwyi6opX/vUAimwUCLIZAT2f/a
Gt4breU3BMlkqrPFWTWiNPj08unb8I7DMrtrO9vpwkcEwep+sIljuBWSPs1UKYbr
q96YnsLwomup5goKxvbmAKLyO36cz40r+VwHC8vM7fO84IRF+nzh/o6fR4a8MbQX
KFgEP/37oaOsT1+N7Qm5wFxO8UBZqJw3YQ7w2lSntI1hCJgxw+SI0qbHRUHDCTWc
fL+nHLgM17LKbGd182IoCB90kFq9qeA4LUgPOiqgVN5FArcZeliZKLho9nr9rpR1
IOKzZEIaCWrkVJaxW7h/bRp17RO63fwHo25rv7YHqfubqlvfs/ya7R0YqXYp9c8G
s4SqtG6CaQP+br0kCWWwOr8gXY3/XV4mjG0zKXbkKDh4yuDHOMg=
=VN58
-----END PGP SIGNATURE-----

--nxwd6lhuvnkw4xqv--

--===============1965200750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1965200750==--
