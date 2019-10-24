Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD685E3ED7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 00:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5926E82C;
	Thu, 24 Oct 2019 22:10:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518406E82C
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 22:10:02 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46zhHm5lwFz9sPV;
 Fri, 25 Oct 2019 09:09:56 +1100 (AEDT)
Date: Fri, 25 Oct 2019 09:09:56 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm/v3d: Fix double free in v3d_submit_cl_ioctl()
Message-ID: <20191025090956.0bd40095@canb.auug.org.au>
In-Reply-To: <20191024205306.GA14416@mwanda>
References: <20191024205306.GA14416@mwanda>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1571954999;
 bh=4Y38mloP/COkWRlmk8I38YGK2MWQcjBMKZ2IaNZo8ek=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fY8Flu4ZPj0Fe1ewyMcKa9lBkhdktoPridKY+P8mSIXMBdPm8CbZVDYBkSIbrcDS5
 dMeMf4iK3s4uWKexu1Or02U4awvwoKq/N9Bis12dvwdJi+DpHrYjVVe1Y7IrhshJbV
 ns2NKaYoSio330wdjcnh2cbpeYfxV5ue4zD9q5f2vWpDcwkMhsHBmScFTCvKcZlW+X
 2By8v0ONn2tVU+iTDafwe3/eS/KlN6oU3H2Vq9nXs2ocX77dRscwQof1VHm4BnE02e
 E0wUtV2sgJpWTiZGTqFkr0sEIoBoBxKVa8Vwmfjad/2JSVTi1a4sto18pelkIBfsxL
 89Olhsuqz6p9A==
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0909362750=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0909362750==
Content-Type: multipart/signed; boundary="Sig_/4bVL9=DKNMyJYmPOU7U_Uo9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4bVL9=DKNMyJYmPOU7U_Uo9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Thu, 24 Oct 2019 23:53:06 +0300 Dan Carpenter <dan.carpenter@oracle.com>=
 wrote:
>
> Originally this error path used to leak "bin" but then we accidentally
> applied two separate commits to fix it and ended up with a double free.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Hi Stephen,
>=20
> I think this one is actually just a linux-next issue and the Fixes tag
> would point to commit f8593384f83f ("Merge remote-tracking branch
> 'drm/drm-next'").
>=20
> The original commits are 0d352a3a8a1f ("drm/v3d: don't leak bin job if
> v3d_job_init fails.") and commit 29cd13cfd762 ("drm/v3d: Fix memory leak
> in v3d_submit_cl_ioctl").
>=20
> I'm not totally sure how you guys address this normally but presumably
> you are experts at dealing with merge issues.  :)
>=20
>  drivers/gpu/drm/v3d/v3d_gem.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index 549dde83408b..37515e47b47e 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -568,7 +568,6 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *dat=
a,
>  		ret =3D v3d_job_init(v3d, file_priv, &bin->base,
>  				   v3d_job_free, args->in_sync_bcl);
>  		if (ret) {
> -			kfree(bin);
>  			v3d_job_put(&render->base);
>  			kfree(bin);
>  			return ret;

I will just apply this as part of the drm tree merge until Dave merges
the drm-misc-fixes tree and fixes this up.

--=20
Cheers,
Stephen Rothwell

--Sig_/4bVL9=DKNMyJYmPOU7U_Uo9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2yITQACgkQAVBC80lX
0Gyd1Qf+PWEOF9qVO5Oz4D2TfN8Rw7FAJzMQ0OsgJocCWOaCH86/U9vQHCPIutvG
JOZLbYWP0v8pmE3XEGptNvUekQkGx3Gv6DZpxd/4dcf4Vb7PeWCpqt8d3sOpIRIu
oImlR7EbrSULvhR5OkP2KHycdv8Dn++J3xHB9hu/RDR/Krux7wqO8su/+/XeoApW
3AJ8ngwnlMYi6lkVXPx1AAXSY5PPiydcSdMR0bjbJ19jze42OADd8lNbaNaG5Hup
O39J5G3gHaKZOWVb8dH3FJoMkf1INplG+R+hx55fRoKQZEE7L0QNaUv8UqnkiIBn
2htAbc7tE3h3nBRgTDnpbJRDWYYUWA==
=JGmF
-----END PGP SIGNATURE-----

--Sig_/4bVL9=DKNMyJYmPOU7U_Uo9--

--===============0909362750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0909362750==--
