Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A034BE3C82
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 21:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF1E6E77F;
	Thu, 24 Oct 2019 19:52:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C116E77F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 19:52:00 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46zdDP46YWz9sPV;
 Fri, 25 Oct 2019 06:51:48 +1100 (AEDT)
Date: Fri, 25 Oct 2019 06:51:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH][next] drm/v3d: fix double free of bin
Message-ID: <20191025065135.09175b37@canb.auug.org.au>
In-Reply-To: <CAKMK7uGbMx21+g2kQyGu5H-L7N-guKJhsZ6b1ROnz5+kDRt3LA@mail.gmail.com>
References: <20191024104801.3122-1-colin.king@canonical.com>
 <20191024123853.GH11828@phenom.ffwll.local>
 <821f0799-1f37-c853-d2c6-dd95883e02d8@canonical.com>
 <CAKMK7uGbMx21+g2kQyGu5H-L7N-guKJhsZ6b1ROnz5+kDRt3LA@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1571946716;
 bh=UWyXQ1Iw+UMZYj2SA6HBAw1NT5T7pfbx2QffwK989yU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jwX9fOuI11zIRK3ojPaBk/qXRXsPsMVeh2/gaacyvzQwL+V0aiYZkAhFPheFd9k0J
 et2FGYEubuOkFNq4vzQyFgqNJo6wcYfVP2HuSgPzo9JP9B04IjIQFB2GD4D2CW362S
 RmoMZ2HHnMqnEWbvmOCnSeko+OCrRH1U/t2yVj6g9O1O9Phf3fr5j/9TUDRDTGgSJv
 JJpGFSBVqVfJyPLUxl37q7A5t/3+kLWuHell801boDx4L5/SwSZLopVdtrSgKgmUHR
 HlyXd1W/5Q1x4JDtE6HM/ZlzOkwAZigTbqsjCBQeJGumdnSd+iDpplh2FiQA0aDLTr
 R1fjqzpS8AefQ==
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Iago Toral Quiroga <itoral@igalia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Colin Ian King <colin.king@canonical.com>, Sean Paul <sean@poorly.run>,
 Navid Emamdoost <navid.emamdoost@gmail.com>
Content-Type: multipart/mixed; boundary="===============0230447781=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0230447781==
Content-Type: multipart/signed; boundary="Sig_/xwrizZz4UyloQa1ZZxKFEFk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/xwrizZz4UyloQa1ZZxKFEFk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 24 Oct 2019 14:49:36 +0200 Daniel Vetter <daniel@ffwll.ch> wrote:
>
> Ok adding Stephen. There's a merge conflict between drm-misc-fixes and
> drm-next (I think) and the merge double-added the kfree(bin). See
> above for the relevant sha1. Dave is already on here as a heads-up,
> but also adding drm-misc maintainers.
>=20
> > >> ---
> > >>  drivers/gpu/drm/v3d/v3d_gem.c | 1 -
> > >>  1 file changed, 1 deletion(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d=
_gem.c
> > >> index 549dde83408b..37515e47b47e 100644
> > >> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> > >> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> > >> @@ -568,7 +568,6 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void=
 *data,
> > >>              ret =3D v3d_job_init(v3d, file_priv, &bin->base,
> > >>                                 v3d_job_free, args->in_sync_bcl);
> > >>              if (ret) {
> > >> -                    kfree(bin);
> > >>                      v3d_job_put(&render->base);
> > >>                      kfree(bin);
> > >>                      return ret;

I will add this as a merge fixup until drm-misc-fixes is merged into
the drm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/xwrizZz4UyloQa1ZZxKFEFk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2yAMcACgkQAVBC80lX
0Gy2ZggAiZaoH9RPu5iXGznPgZhzyg1plQKDAAPWiIwMq1c3Bivg6umaIroB14qg
LGpurXf9YO+Vj8S06ukixB/b1vAycWSWXfauEZPhe6lF1YGykeZUVDeKCcIoR/oU
we0+KgwxN1r854mdr4+OlzjC9VssQ8c3HiGztCldR0PnenNt/BP7m+4mQtmB2gdL
H+cQREBnDZFHYKVNiDoIybIlyg34/MXC0nt2JGsY/A/UsBIFoLKEePnMc6j7Jh3O
4mkIfZb2SYcUVz0a6Ds0XuqAOVb9IRKiTHMdE1v59cnSS+AcyNog821sMAgtwAYR
lLyleGdyeEodrJ5AFmvnpCvc4bGZ9w==
=RhRC
-----END PGP SIGNATURE-----

--Sig_/xwrizZz4UyloQa1ZZxKFEFk--

--===============0230447781==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0230447781==--
