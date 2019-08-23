Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6349A5FE
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 05:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB4F6EBAF;
	Fri, 23 Aug 2019 03:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1982C6EBAF
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 03:20:09 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46F68j3yVYz9s7T;
 Fri, 23 Aug 2019 13:20:05 +1000 (AEST)
Date: Fri, 23 Aug 2019 13:20:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <20190823132004.578e99a0@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1566530407;
 bh=h/4saC/U531BHqjeM7yUCrFYXQzNfCVKnprjPF4WinQ=;
 h=Date:From:To:Cc:Subject:From;
 b=TLy6mKfGKjPPZYhQsmBb61QoRXw3F0xnYJ1VgLVeDBqvJCS3Hf1LUhdvlARNyFwhi
 dk5TH1YesFyx84ya+pBNMs6txYFV30qdCVb7JCno3On/ue4NeGrCXK7gqdjfxbwkxT
 TR8Em+Iq3awfJBuDb+AWW7Yzbkm1EEw0yckIUDdw99NIN0ALru9/utvrQK8+q8opsr
 6AKw0vW16EALhpfPjlB6GZONnUo9x66PND43P9RPmHWf4HMfEGD4/I+vdcD/GfqO6m
 nrih8gz/jLJgTZGFcXNWm+rGF/LMBY5FsnP/tdPmIyktQpeAm0hn389jjOXYsCDWWN
 R7aaOyWug4QGw==
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Alexandre Courbot <acourbot@chromium.org>
Content-Type: multipart/mixed; boundary="===============0629233821=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0629233821==
Content-Type: multipart/signed; boundary="Sig_/X2kcl2/LOpWwGE.fwJfoAWF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/X2kcl2/LOpWwGE.fwJfoAWF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/mediatek/mtk_drm_drv.c

between commit:

  4c6f3196e6ea ("drm/mediatek: use correct device to import PRIME buffers")

from the drm-fixes tree and commit:

  3baeeb21983a ("drm/mtk: Drop drm_gem_prime_export/import")

from the drm tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 7f5408cb2377,2ee809a6f3dc..000000000000
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@@ -351,21 -314,8 +345,20 @@@ static const struct file_operations mtk
  	.compat_ioctl =3D drm_compat_ioctl,
  };
 =20
 +/*
 + * We need to override this because the device used to import the memory =
is
 + * not dev->dev, as drm_gem_prime_import() expects.
 + */
 +struct drm_gem_object *mtk_drm_gem_prime_import(struct drm_device *dev,
 +						struct dma_buf *dma_buf)
 +{
 +	struct mtk_drm_private *private =3D dev->dev_private;
 +
 +	return drm_gem_prime_import_dev(dev, dma_buf, private->dma_dev);
 +}
 +
  static struct drm_driver mtk_drm_driver =3D {
- 	.driver_features =3D DRIVER_MODESET | DRIVER_GEM | DRIVER_PRIME |
- 			   DRIVER_ATOMIC,
+ 	.driver_features =3D DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 =20
  	.gem_free_object_unlocked =3D mtk_drm_gem_free_object,
  	.gem_vm_ops =3D &drm_gem_cma_vm_ops,
@@@ -373,8 -323,6 +366,7 @@@
 =20
  	.prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
  	.prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
- 	.gem_prime_export =3D drm_gem_prime_export,
 +	.gem_prime_import =3D mtk_drm_gem_prime_import,
  	.gem_prime_get_sg_table =3D mtk_gem_prime_get_sg_table,
  	.gem_prime_import_sg_table =3D mtk_gem_prime_import_sg_table,
  	.gem_prime_mmap =3D mtk_drm_gem_mmap_buf,

--Sig_/X2kcl2/LOpWwGE.fwJfoAWF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1fW2QACgkQAVBC80lX
0GwCPQgAilBWVPzBxZcJWB2bXRi3iz4BWC/GmgqEAOU75yaTwQqqHz335TAGT3aL
4CWN7cVVYNBGV9CxE5rPdpelVGORo6+BlGevvskN6Uhr3j0WkHqL+ZeVc7Rx35Wy
FU2H/nybicSZqNDg07XmfI6BSRJf+L190fqiogRvIXpFzzRB5/zWGLpWQga4Mg8v
3hpk2mLYd42twe0pCLAcnGHxwsNnb7csUB7VGmt3EmsU32CfZEMuZxir45E3JMvq
hwwHQAOZKWypD8C1oVcQuAhGz06NSILe4LVu1JVyziYNCKUabQgOA0R9ErxRUKbo
jkQtvYuxsg/rAZG8oYujsEkpKLmCJA==
=Rt4Z
-----END PGP SIGNATURE-----

--Sig_/X2kcl2/LOpWwGE.fwJfoAWF--

--===============0629233821==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0629233821==--
