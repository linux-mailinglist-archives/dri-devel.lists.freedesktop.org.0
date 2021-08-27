Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C923F94A0
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 08:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B10126E8E3;
	Fri, 27 Aug 2021 06:55:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A226E8E4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:55:46 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gwr8F2cPyz9sVq;
 Fri, 27 Aug 2021 16:55:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1630047343;
 bh=W9a7uH45o/X7TI2lMvmmme6lPDzI3mybkZi6XAaP6I8=;
 h=Date:From:To:Cc:Subject:From;
 b=iLzTnYgWKHuqTwqKypJubR0SL82xcPldXYqrEbW91LUvtLRV0PXifrsKyVFj/G2vX
 oULCufSCxqqpmrCi1s7PtpzxC3fqfwkDAADvbzu5GdSK5y4phnuLnnVKqV8hLhF32J
 U68a8z9wQITtFH1WA42MK/erQN/EEzP0O15DHJeY8L6itEhD5z2PtSglb6TKBr37c1
 pMkbfcKL/ihJOysecfIvg4EHA3jySeAwyeVJm6CZ9IIp5+LAISOumubCdX/FvES9jh
 fSe8sGLqxOwHPsXoRnc5bCQOhCHr29qPzfWl4SPAn4HB+nL/6TolPpEAdUlv8l0SwM
 uzcFpcUqQXy7w==
Date: Fri, 27 Aug 2021 16:55:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Williamson <alex.williamson@redhat.com>, Dave Airlie
 <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Christoph
 Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Max Gurtovoy <mgurtovoy@nvidia.com>, Yishai
 Hadas <yishaih@nvidia.com>
Subject: linux-next: manual merge of the vfio tree with the drm tree
Message-ID: <20210827165540.30567055@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/g/niN.PFBGgWn_yojOkpWNz";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/g/niN.PFBGgWn_yojOkpWNz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfio tree got a conflict in:

  drivers/vfio/pci/vfio_pci.c

between commits:

  b8779475869a ("vgaarb: provide a vga_client_unregister wrapper")
  f6b1772b2555 ("vgaarb: remove the unused irq_set_state argument to vga_cl=
ient_register")
  bf44e8cecc03 ("vgaarb: don't pass a cookie to vga_client_register")

from the drm tree and commits:

  1cbd70fe3787 ("vfio/pci: Rename vfio_pci.c to vfio_pci_core.c")
  ff53edf6d6ab ("vfio/pci: Split the pci_driver code out of vfio_pci_core.c=
")

from the vfio tree.

I fixed it up (I reapplied the drm changes to vfio_pci_core.c - see below)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 27 Aug 2021 16:52:45 +1000
Subject: [PATCH] fixup for "vfio/pci: Rename vfio_pci.c to vfio_pci_core.c"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/vfio/pci/vfio_pci_core.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_c=
ore.c
index 675616e08897..68198e0f2a63 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -53,10 +53,9 @@ static inline bool vfio_vga_disabled(void)
  * has no way to get to it and routing can be disabled externally at the
  * bridge.
  */
-static unsigned int vfio_pci_set_vga_decode(void *opaque, bool single_vga)
+static unsigned int vfio_pci_set_decode(struct pci_dev *pdev, bool single_=
vga)
 {
-	struct vfio_pci_core_device *vdev =3D opaque;
-	struct pci_dev *tmp =3D NULL, *pdev =3D vdev->pdev;
+	struct pci_dev *tmp =3D NULL;
 	unsigned char max_busnr;
 	unsigned int decodes;
=20
@@ -1756,10 +1755,10 @@ static int vfio_pci_vga_init(struct vfio_pci_core_d=
evice *vdev)
 	if (!vfio_pci_is_vga(pdev))
 		return 0;
=20
-	ret =3D vga_client_register(pdev, vdev, NULL, vfio_pci_set_vga_decode);
+	ret =3D vga_client_register(pdev, vfio_pci_set_decode);
 	if (ret)
 		return ret;
-	vga_set_legacy_decoding(pdev, vfio_pci_set_vga_decode(vdev, false));
+	vga_set_legacy_decoding(pdev, vfio_pci_set_decode(pdev, false));
 	return 0;
 }
=20
@@ -1769,7 +1768,7 @@ static void vfio_pci_vga_uninit(struct vfio_pci_core_=
device *vdev)
=20
 	if (!vfio_pci_is_vga(pdev))
 		return;
-	vga_client_register(pdev, NULL, NULL, NULL);
+	vga_client_unregister(pdev);
 	vga_set_legacy_decoding(pdev, VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM |
 					      VGA_RSRC_LEGACY_IO |
 					      VGA_RSRC_LEGACY_MEM);
--=20
2.32.0

--=20
Cheers,
Stephen Rothwell

--Sig_/g/niN.PFBGgWn_yojOkpWNz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEojGwACgkQAVBC80lX
0Gwkbwf/cvmHUKI0kHJVftfJW2ihn9mGX2uu9v6b8SK5uLicP5q+yMR+SmlRtW+L
iPT7J6UVkdg3J319pl1N2R/MFSkOkRknHyT5bibTr3eABYfDYi7YXeeJKCzB7Occ
83/dp3FborcUuPniueYgRNp4AOa5qZd6XqFP194TJgzdAlqls8YOYsq/3dAkm3x0
UH7c6DYEobEgXH9SMQMbAUxHamMf6YvH35IVqfFHWeLAJ0rKXNza0xzCX6vc71J5
C9dp130xITAzHrZvOWJcsZEIHskmlBMsBH0QVtE7cQevBQB9SdZZByudQkXPKIWV
CDkG6cbVwbuOKcopjm/MA+9V4GgDVg==
=WuCX
-----END PGP SIGNATURE-----

--Sig_/g/niN.PFBGgWn_yojOkpWNz--
