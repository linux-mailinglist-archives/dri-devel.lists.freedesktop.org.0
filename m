Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF635733A1E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 21:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9984710E682;
	Fri, 16 Jun 2023 19:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 494 seconds by postgrey-1.36 at gabe;
 Fri, 16 Jun 2023 19:45:06 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A06510E682
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 19:45:06 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 4BB1C1C0AB3; Fri, 16 Jun 2023 21:36:48 +0200 (CEST)
Date: Fri, 16 Jun 2023 21:36:47 +0200
From: Pavel Machek <pavel@denx.de>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 4.14 5/6] fbdev: imsttfb: Release framebuffer and
 dealloc cmap on error path
Message-ID: <ZIy5z07fFRazOshY@duo.ucw.cz>
References: <20230615114016.649846-1-sashal@kernel.org>
 <20230615114016.649846-5-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="Jt24rwAEGiQvM7C/"
Content-Disposition: inline
In-Reply-To: <20230615114016.649846-5-sashal@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, zyytlz.wz@163.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Jt24rwAEGiQvM7C/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Helge Deller <deller@gmx.de>
>=20
> [ Upstream commit 5cf9a090a39c97f4506b7b53739d469b1c05a7e9 ]
>=20
> Add missing cleanups in error path.

If we insist this is important enough for -stable, it will need
tweaking. The function returns void, so we can't return a value.

Best regards,
								Pavel
							=09
> +++ b/drivers/video/fbdev/imsttfb.c
> @@ -1452,9 +1452,13 @@ static void init_imstt(struct fb_info *info)
>  	              FBINFO_HWACCEL_FILLRECT |
>  	              FBINFO_HWACCEL_YPAN;
> =20
> -	fb_alloc_cmap(&info->cmap, 0, 0);
> +	if (fb_alloc_cmap(&info->cmap, 0, 0)) {
> +		framebuffer_release(info);
> +		return -ENODEV;
> +	}
> =20
>  	if (register_framebuffer(info) < 0) {
> +		fb_dealloc_cmap(&info->cmap);
>  		framebuffer_release(info);
>  		return;
>  	}

--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--Jt24rwAEGiQvM7C/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZIy5zwAKCRAw5/Bqldv6
8meCAKCgkOAKsby1J3tn/AOi2M2+igh3pQCgmXSLqtqZflXALW7hzkAjZz5lTd0=
=/Q0f
-----END PGP SIGNATURE-----

--Jt24rwAEGiQvM7C/--
