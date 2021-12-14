Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6622474B13
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 19:40:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C84C810E123;
	Tue, 14 Dec 2021 18:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 557 seconds by postgrey-1.36 at gabe;
 Tue, 14 Dec 2021 12:12:10 UTC
Received: from luna.linkmauve.fr (82-65-109-163.subs.proxad.net
 [82.65.109.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7ED10E415
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 12:12:10 +0000 (UTC)
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
 id A5265F40D8A; Tue, 14 Dec 2021 13:02:48 +0100 (CET)
Date: Tue, 14 Dec 2021 13:02:48 +0100
From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
Subject: Empty IN_FORMATS in sun4i-drm
Message-ID: <20211214120248.y2zdzr5zsqowixjx@luna>
Jabber-ID: linkmauve@linkmauve.fr
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ybmuzoimcjw3vsl4"
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 14 Dec 2021 18:40:39 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ybmuzoimcjw3vsl4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

After updating Weston from 9f8561e9 to 07326040 (latest master), it
fails to run on my PinePhone saying =E2=80=9Cformat 0x34325258 not supporte=
d by
output DSI-1=E2=80=9D and then exiting.

This format is XR24, which would be extremely surprising not to be
present, and drm_info[1] says it is present.  Looking into Weston=E2=80=99s
code, I found that drm_plane_populate_formats()=E2=80=99s docstring says it=
 uses
=E2=80=9Ceither the IN_FORMATS blob property (if available), or the plane's
format list if not.=E2=80=9D  Looking back at drm_info, I saw said IN_FORMA=
TS
blob being empty of formats (while the format list is fully populated):
"IN_FORMATS" (immutable): blob =3D 32
=E2=94=94=E2=94=80=E2=94=80=E2=94=80DRM_FORMAT_MOD_LINEAR (0x0)

This makes me think the kernel should populate IN_FORMATS with at least
the same formats as the format list when supported, or stop advertising
this property altogether.

Other compositors (such as phoc) still run file, probably because they
use the format list exclusively, without consideration for modifiers.

Besides fixing this driver, would it make sense to also make Weston
ignore an empty IN_FORMATS and fall back to the format list?

Thanks,

[1] https://github.com/ascent12/drm_info

--=20
Emmanuel Gil Peyrot

--ybmuzoimcjw3vsl4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEjrVT1SzTln43kCLJOWgfYkb2LpAFAmG4h+UACgkQOWgfYkb2
LpDFygf/TaPrdn4BSPmRmf7XJgZ4Jq1UuuwPTO+u54uiyThDjun/u8mW2aAVCF2d
o5ypb3UChOtErClxIvsMi7MqtvP/zr0fKiWhM5tqrEq9y2+rqtpBgZvt9+gGsTRZ
wCdhQoVpcx9eZz5BRMNHmpGD+x4uBYDFKuSdoRq7267e5P4hXKOPxyjjRKneuCTY
XtzRrBTSiPrTnxxF3UkOvcK0uLdaUicswRiPPUQMk+kEpZvwAIywZYoENRpwOcOU
9l9sEJvMmEIaKF2s/on57GefTM2dh24e9z2jRBRAU4RFdr6NOhoG3IDIxqHaVXMJ
cz2MKuzhhUg+JYw99lGZlzWcpzKOFA==
=dzqn
-----END PGP SIGNATURE-----

--ybmuzoimcjw3vsl4--
