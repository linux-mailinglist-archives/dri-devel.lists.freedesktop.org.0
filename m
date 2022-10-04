Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACB35F3B63
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 04:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E066A10E567;
	Tue,  4 Oct 2022 02:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F0E10E567
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 02:27:28 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MhM6j3fsFz4xGR;
 Tue,  4 Oct 2022 13:27:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1664850446;
 bh=P/VIAOmJpO1XZIvYY8IRtSNZ6UnGWvqi6+0IQ8E6Ix8=;
 h=Date:From:To:Cc:Subject:From;
 b=u+ICfgjRDSrmsM8WykUAdauyQdUyeScc2DAmwSfGzNJdYfhZoBViAv/j4PZyyh5wL
 ke7UlyT+jdvi4Rw54fxCLrJVDa3jS18MHUxdC0qUKGcibMAOUpt8wdJRgd1qzPbarx
 ydRn/GI9Gs3+A/gpKU91vEqUIUQ519YuujgQrX/+xcBjqkt/lg7YrHkwukukdEFPgU
 anHn37YS6qOiEKl8j2pfNkHMvHQN20fRmEMlw1giIXdrLVbc87Id3SkQD7Tgzpms6f
 TNTi4CtZzwpUMoGZA2uew5DXOWplGPbEmqLUzqtb4AhbA8tkx8RiNYFxOJTSKXEOiZ
 gvUWrawfc/AKA==
Date: Tue, 4 Oct 2022 13:27:23 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Helge Deller <deller@gmx.de>, Dave Airlie <airlied@redhat.com>
Subject: linux-next: manual merge of the fbdev tree with the drm tree
Message-ID: <20221004132723.7b4b03ab@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VgRbDH8A3MIwgyQlb3jQMV2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, ruanjinjie <ruanjinjie@huawei.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/VgRbDH8A3MIwgyQlb3jQMV2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fbdev tree got a conflict in:

  drivers/video/fbdev/tridentfb.c

between commit:

  145eed48de27 ("fbdev: Remove conflicting devices on PCI bus")

from the drm tree and commit:

  d738bf0123d6 ("fbdev: tridentfb: Fix missing pci_disable_device() in prob=
e and remove")

from the fbdev tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/video/fbdev/tridentfb.c
index f9c3b1d38fc2,4d08f4489a0a..000000000000
--- a/drivers/video/fbdev/tridentfb.c
+++ b/drivers/video/fbdev/tridentfb.c
@@@ -1471,11 -1465,7 +1466,11 @@@ static int trident_pci_probe(struct pci
  	int chip_id;
  	bool found =3D false;
 =20
 +	err =3D aperture_remove_conflicting_pci_devices(dev, "tridentfb");
 +	if (err)
 +		return err;
 +
- 	err =3D pci_enable_device(dev);
+ 	err =3D pcim_enable_device(dev);
  	if (err)
  		return err;
 =20

--Sig_/VgRbDH8A3MIwgyQlb3jQMV2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmM7mgsACgkQAVBC80lX
0Gy6ugf/Ra0OpZea4BrirYbeQMKVFj6mXAHmqwPdQKYSR090tudEKLpUtOuGOoRY
/GLZpXfRSdycbLe1fIBVr79/XYO6rKUgGMzhEcL+4IX8GXkC4J1Mlbmg+adY6JtZ
sNwUq9Ytt98cGcJtDYk/VfdGwHxBPOj/PNjzp4/dFzHZVBHHentk66AqRUTu+7Vn
nPgqBsDK+NZ7N4/R154KMmp0R8bmA24p0I+2qzBlt4xZrWFQlsnk7Jp2ovowCh0/
1SwEkjQtdXGnB6J8aMOAkPwYoMSMTQtTdjan5C8i8jMOI+jhsgqjm8by5iyP11ZH
LHSnaSmGhln4a3tOYkOzochLJ94CBQ==
=wRzP
-----END PGP SIGNATURE-----

--Sig_/VgRbDH8A3MIwgyQlb3jQMV2--
