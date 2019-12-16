Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E171228E6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:32:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACAF36E991;
	Tue, 17 Dec 2019 10:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B596E5CA;
 Mon, 16 Dec 2019 15:48:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 6F214260667
Date: Mon, 16 Dec 2019 10:48:03 -0500
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RFC v1 0/1] drm: lima: devfreq and cooling device support
Message-ID: <20191216154803.GA3921@kevin>
References: <20191215211223.1451499-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <20191215211223.1451499-1-martin.blumenstingl@googlemail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Tue, 17 Dec 2019 10:31:56 +0000
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
Cc: tomeu.vizoso@collabora.com, lima@lists.freedesktop.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, linux-rockchip@lists.infradead.org, wens@csie.org,
 yuq825@gmail.com, linux-amlogic@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1055439141=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1055439141==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

If so much code is being duplicated over, I'm wondering if it makes
sense for us to move some of the common devfreq code to core DRM
helpers?

On Sun, Dec 15, 2019 at 10:12:22PM +0100, Martin Blumenstingl wrote:
> This is my attempt at adding devfreq (and cooling device) support to
> the lima driver.
> I didn't have much time to do in-depth testing. However, I'm sending
> this out early because there are many SoCs with Mali-400/450 GPU so
> I want to avoid duplicating the work with somebody else.
>=20
> The code is derived from panfrost_devfreq.c which is why I kept the
> Collabora copyright in lima_devfreq.c. Please let me know if I should
> drop this or how I can make it more clear that I "borrowed" the code
> from panfrost.
>=20
> I am seeking comments in two general areas:
> - regarding the integration into the existing lima code
> - for the actual devfreq code (I had to adapt the panfrost code
>   slightly, because lima uses a bus and a GPU/core clock)
>=20
> My own TODO list includes "more" testing on various Amlogic SoCs.
> So far I have tested this on Meson8b and Meson8m2 (which both have a
> GPU OPP table defined). However, I still need to test this on a GXL
> board (which is currently missing the GPU OPP table).
>=20
>=20
> Martin Blumenstingl (1):
>   drm/lima: Add optional devfreq support
>=20
>  drivers/gpu/drm/lima/Kconfig        |   1 +
>  drivers/gpu/drm/lima/Makefile       |   3 +-
>  drivers/gpu/drm/lima/lima_devfreq.c | 162 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/lima/lima_devfreq.h |  15 +++
>  drivers/gpu/drm/lima/lima_device.c  |   4 +
>  drivers/gpu/drm/lima/lima_device.h  |  11 ++
>  drivers/gpu/drm/lima/lima_drv.c     |  14 ++-
>  drivers/gpu/drm/lima/lima_sched.c   |   7 ++
>  drivers/gpu/drm/lima/lima_sched.h   |   3 +
>  9 files changed, 217 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/drm/lima/lima_devfreq.c
>  create mode 100644 drivers/gpu/drm/lima/lima_devfreq.h
>=20
> --=20
> 2.24.1
>=20

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl33py4ACgkQ/v5QWgr1
WA0Caw/8DBkpxsfWejzUF5wK7xq5rkmaLL+RmwJzt9xgNwWgsJ8p2XWt+hgzJSAr
hNy9KVAEE62SXJHfpziY9CEkQycM+b7cQASYGf2q8/C2XNYfZHv80N8SZv1Gaqmh
NzCfRSsfgc1BvPjbiKu0E1gdsX4RxlB3TXQV0dmSYbOSQ6yyHaYHgrEImW8HVblc
/xkW7pOSkBs9ZdQKMFETaKJlQ6iQvkvUUlaywl2rBO4PvidyCVp5TXgRIYUQzXY/
ls7vy/jU8eWchvp9hlztfssMGtE20BcQeASrHjkKfRUWsaSKt0g9Wh17jbIMf/fj
BfGKqV+KwkKuMDUubvp7EBaJkwxAG8pTr1jv7+QdxOdm/KVnKMu1NSl2DJmTl8Fa
o9mIdlNQCoMJo+TG6i92JuHMZ5VL11NBm6uazi1iJIH8KEYg8UPnePbQttHnDnZq
DqTpy9w0r+T3zu9AH5pQjZCXCcKK+oV4qCTBK5zGe3UtcPigssiTVo912VsGEbb/
Y8LPtySaWSjCI/hfgz4M9ENfrmNX4yqvIewZnAMMPj6vv5sslfRBBGKBCoCtqcQx
T9Iy3c57pp9B/Prrc1llotEuqyd2Mi7mws7gSPfGZXaTC/TPNKCikvph39wdRPdp
WP+lq3rH1n5kMcc3D09p62TZGuaO0uiHmUgxshzPQa3FxXsHqZo=
=QSX1
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--

--===============1055439141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1055439141==--
