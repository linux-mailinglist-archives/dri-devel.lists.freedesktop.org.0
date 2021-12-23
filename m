Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4842B47E10A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 10:59:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E26010E1B0;
	Thu, 23 Dec 2021 09:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from luna.linkmauve.fr (82-65-109-163.subs.proxad.net
 [82.65.109.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B3410E21B
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 09:59:28 +0000 (UTC)
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
 id 5EAC1F40C3A; Thu, 23 Dec 2021 10:59:23 +0100 (CET)
Date: Thu, 23 Dec 2021 10:59:23 +0100
From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: Re: Empty IN_FORMATS in sun4i-drm
Message-ID: <20211223095923.pes7tag5uqsoidy5@luna>
Jabber-ID: linkmauve@linkmauve.fr
References: <20211214120248.y2zdzr5zsqowixjx@luna> <2084377.irdbgypaU6@kista>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yfmkjxo3tbi7ale7"
Content-Disposition: inline
In-Reply-To: <2084377.irdbgypaU6@kista>
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
Cc: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--yfmkjxo3tbi7ale7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 14, 2021 at 06:58:56PM +0100, Jernej =C5=A0krabec wrote:
> Dne torek, 14. december 2021 ob 13:02:48 CET je Emmanuel Gil Peyrot=20
> napisal(a):
> > Hi,
> >=20
> > After updating Weston from 9f8561e9 to 07326040 (latest master), it
> > fails to run on my PinePhone saying =E2=80=9Cformat 0x34325258 not supp=
orted by
> > output DSI-1=E2=80=9D and then exiting.
> >=20
> > This format is XR24, which would be extremely surprising not to be
> > present, and drm_info[1] says it is present.  Looking into Weston=E2=80=
=99s
> > code, I found that drm_plane_populate_formats()=E2=80=99s docstring say=
s it uses
> > =E2=80=9Ceither the IN_FORMATS blob property (if available), or the pla=
ne's
> > format list if not.=E2=80=9D  Looking back at drm_info, I saw said IN_F=
ORMATS
> > blob being empty of formats (while the format list is fully populated):
> > "IN_FORMATS" (immutable): blob =3D 32
> > =E2=94=94=E2=94=80=E2=94=80=E2=94=80DRM_FORMAT_MOD_LINEAR (0x0)
>=20
> Does this solve your issue? http://ix.io/3Ipo

Hi, yes it does, thanks!

Tested-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

>=20
> Best regards,
> Jernej
>=20
> >=20
> > This makes me think the kernel should populate IN_FORMATS with at least
> > the same formats as the format list when supported, or stop advertising
> > this property altogether.
> >=20
> > Other compositors (such as phoc) still run file, probably because they
> > use the format list exclusively, without consideration for modifiers.
> >=20
> > Besides fixing this driver, would it make sense to also make Weston
> > ignore an empty IN_FORMATS and fall back to the format list?
> >=20
> > Thanks,
> >=20
> > [1] https://github.com/ascent12/drm_info
> >=20
> > --=20
> > Emmanuel Gil Peyrot
> >=20
>=20

--=20
Emmanuel Gil Peyrot

--yfmkjxo3tbi7ale7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEjrVT1SzTln43kCLJOWgfYkb2LpAFAmHESHgACgkQOWgfYkb2
LpB1Ewf9Eq+JANuVeDFXKjLR5Oq7/G2O6QV4cFE2224q0FtvLl8c4cZ61eXM8hyv
9I+Whu/X3jNYWjoCHy6XdPPpzjg8jE49k4gF+8kLEwDSmM/jucRSoRV4bNW8a1xt
TmbPCBTDFKEl1d3l8NydsY0mRrjwRv4DKg1tlvfNlIuC5zhf+53TgG/27iBZQGHu
LGLFPqeG73nmx6PS+jbolbUNzCDIW6Bkm5zqfjFRExJMF2AdYlQZtsk+1LU/soqi
32qKikupZGrH86Uh5rbr3SVDSs3ew21fhuoHjFJ4vX82OBKbe/9q3/WEDU2aFriv
GcxYFcQ38CVsX2R4wiIOivEXGa397g==
=0mAo
-----END PGP SIGNATURE-----

--yfmkjxo3tbi7ale7--
