Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1852A153FD1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:17:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E208D6E484;
	Thu,  6 Feb 2020 08:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED4F6F574
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 12:24:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 4104628DAA6
Date: Wed, 5 Feb 2020 07:24:23 -0500
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: Re: [PATCH] drm/panfrost: Don't try to map on error faults
Message-ID: <20200205122423.GA2903@kevin>
References: <20200205100719.24999-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20200205100719.24999-1-tomeu.vizoso@collabora.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Thu, 06 Feb 2020 08:17:51 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
Content-Type: multipart/mixed; boundary="===============0219030007=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0219030007==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>=20

Although it might be nice to

	#define TRANSLATION_FAULT_LEVEL1 0xC1
	...
	#define TRANSLATION_FAULT_LEVEL4 0xC4

and then use semantic names instead of magic values. Minimally maybe add
a comment explaining that.

On Wed, Feb 05, 2020 at 11:07:16AM +0100, Tomeu Vizoso wrote:
> If the exception type isn't one of the normal faults, don't try to map
> and instead go straight to a terminal fault.
>=20
> Otherwise, we can get flooded by kernel warnings and further faults.
>=20
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/pa=
nfrost/panfrost_mmu.c
> index 763cfca886a7..80abddb4544c 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -596,8 +596,9 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(in=
t irq, void *data)
>  		source_id =3D (fault_status >> 16);
> =20
>  		/* Page fault only */
> -		if ((status & mask) =3D=3D BIT(i)) {
> -			WARN_ON(exception_type < 0xC1 || exception_type > 0xC4);
> +		if ((status & mask) =3D=3D BIT(i) &&
> +		     exception_type >=3D 0xC1 &&
> +		     exception_type <=3D 0xC4) {
> =20
>  			ret =3D panfrost_mmu_map_fault_addr(pfdev, i, addr);
>  			if (!ret) {
> --=20
> 2.21.0
>=20

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl46s+0ACgkQ/v5QWgr1
WA3Xtw//WjS7YeR6jL+CSEjw3qqi00m2hORBCxE2+yrEUv3RgF9pYj8ugBAZIV20
TdvPTpZulaMFU8v3eV8T9e5RyrUrlUCjPBodW9Sc1VUXLSSUXAeE+gnMpUAB12pR
f14Tmqc7q6e0eJsuFmA+cICJqkzmWQcnhBMhaXxaW0uF2ziew4/GaHo8F5tFyzue
mu/t6u/RYB/GRIMtrAElsVGKGzgjw6TpCB4TiAjK20OTNkJfeZLHfpFop/nEwPcO
VrY+J43BJikSleYbyUhxbpfhTDfmxaeg8TJPsRvXayeJ17oIh1Cz1gV/TrR6AGLF
jrxfL+bkQ3QiOPJevtFy3w7G7uyC5LdpFdSYdYCiadctmhdJC8R/yFAMyxhV+HIv
0MGEWvUnNobNBP88nnVT7JoBcbYIc4ncfJB9+L4X4wWpGCy6JOFc5Gz36re0pI4t
7L5E7/CkI+zapX14ffqYlCNvuXM3kXcWavBcsiwGmW9gNUB5iu8dJPCwsShCICSl
1zdePzXDjj8VVFy6aE8agY03hhTDG9qPT/Btxbt/Jj5W3UtMKGrl+u65V8HtZ9Jt
PW/2Dsh7rwGHcqCya/zyNEZmlBQk1VZKQkcc3V22bH1pyb1VTdklQZ1PCwQPIafp
aCzVPpgtKocCZTf30LVncWNnMxAFspoSppBE3jPBtk8VTLWdSqo=
=AhWm
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--

--===============0219030007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0219030007==--
