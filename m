Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B3728496B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 11:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF486E430;
	Tue,  6 Oct 2020 09:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676346E430
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 09:35:12 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4C5C4F28Gxz9sS8;
 Tue,  6 Oct 2020 20:35:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1601976910;
 bh=a12/UVDR6zr+BYph3qJOSxMnY7GGVoasy0f3LxNxy2g=;
 h=Date:From:To:Cc:Subject:From;
 b=j6alsdsA3Uln7mQ1aTXbEIv6ck8MLWm+kik2fXDXlCvb1+f5H7f5GshceE8MR1Ntd
 6dygfzpZ/zjhz59ckiWYO/mmODHqDg3qmrKSUT5819V0CG7rmYC2Cc84A6Hrnd58EC
 PJd4Wy2miyf/MU0oD0gxTXBCBtJ30t86Vq5rLliMFzRxrsbHFvsaHAiXHeB6CLdUjp
 ZVq9+lD5A0DZ1J/vHMnVoC3xNh70XqMNtzN0Pq0grjEjcb9RTHzbCpcXc8YRZnSGOy
 IzHqdU69tALbls1TGgJWHE6ik/jSJCycjZvOOQZTq3ebf9lUJdSKztYO2W7rKDaG0V
 +5Qwdr1Lz1wFw==
Date: Tue, 6 Oct 2020 20:35:08 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@mellanox.com>, Dave Airlie <airlied@linux.ie>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the hmm tree
Message-ID: <20201006203508.3cb3d0e3@canb.auug.org.au>
MIME-Version: 1.0
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
Cc: Maor Gottlieb <maorg@nvidia.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Leon Romanovsky <leonro@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1966132314=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1966132314==
Content-Type: multipart/signed; boundary="Sig_/6sFO0+9XXkLgtCyzVp9ZubH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6sFO0+9XXkLgtCyzVp9ZubH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hmm tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:


Caused by commit

  07da1223ec93 ("lib/scatterlist: Add support in dynamic allocation of SG t=
able from pages")

interacting with commit

  707d561f77b5 ("drm: allow limiting the scatter list size.")

from the drm tree.

I have added the following merge fix patch

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 6 Oct 2020 20:22:51 +1100
Subject: [PATCH] lib/scatterlist: merge fix for "drm: allow limiting the
 scatter list size."

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/drm_prime.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 11fe9ff76fd5..83ac901b65a2 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -807,6 +807,7 @@ struct sg_table *drm_prime_pages_to_sg(struct drm_devic=
e *dev,
 				       struct page **pages, unsigned int nr_pages)
 {
 	struct sg_table *sg =3D NULL;
+	struct scatterlist *sl;
 	size_t max_segment =3D 0;
 	int ret;
=20
@@ -820,11 +821,13 @@ struct sg_table *drm_prime_pages_to_sg(struct drm_dev=
ice *dev,
 		max_segment =3D dma_max_mapping_size(dev->dev);
 	if (max_segment =3D=3D 0 || max_segment > SCATTERLIST_MAX_SEGMENT)
 		max_segment =3D SCATTERLIST_MAX_SEGMENT;
-	ret =3D __sg_alloc_table_from_pages(sg, pages, nr_pages, 0,
+	sl =3D __sg_alloc_table_from_pages(sg, pages, nr_pages, 0,
 					  nr_pages << PAGE_SHIFT,
-					  max_segment, GFP_KERNEL);
-	if (ret)
+					  max_segment, NULL, 0, GFP_KERNEL);
+	if (IS_ERR(sl)) {
+		ret =3D PTR_ERR(sl);
 		goto out;
+	}
=20
 	return sg;
 out:
--=20
2.28.0


I assume that there may be more needed.

--=20
Cheers,
Stephen Rothwell

--Sig_/6sFO0+9XXkLgtCyzVp9ZubH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl98OkwACgkQAVBC80lX
0GzOCQf+PBJgkIRZDEm5TYTOzNpFmT0Pl/eg915A/wCde0kLoswfxghraZDnlMwp
AAU+CjSrdnnvYLX+AbU7+Vo281UYkyNaWhpv4DV/UZwO7xhog2EkOvZQoYuJRWdv
fvcMIWyZ+Dyz61RmpluVOEmKapF8qRASCBlWwJc3YwQFrfiRk4Re/TDufFtlK9TE
rTYmN7ZYW21kVHXyBRX69KhbMl2a4jTyReBFUEOB+BYytYB8CSQqEOrd1Gjs3BoB
79gG0uh2rQhJ/ajjg+EGQBTF/YwjlB1Vqmy5gpc8q1IWZVBiWE8m6fdXUtccXSqX
/GUbtuKVBF/MzdmMsdppRZHDIwywCw==
=8ADh
-----END PGP SIGNATURE-----

--Sig_/6sFO0+9XXkLgtCyzVp9ZubH--

--===============1966132314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1966132314==--
