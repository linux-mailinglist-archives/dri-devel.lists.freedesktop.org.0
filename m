Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DAD3F4602
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 09:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7857389C1C;
	Mon, 23 Aug 2021 07:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E244E89C1C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 07:50:34 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GtPYJ73ySz9sWd;
 Mon, 23 Aug 2021 17:50:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1629705032;
 bh=9dAHDCrMei61o4XJtPqjbdNJts5lkuem+/e8bvOvHNA=;
 h=Date:From:To:Cc:Subject:From;
 b=Eh1fOSt6Rsa06Kcm6zUhe5LMinVpSwezbm4AvqbDqfoCf8Wx8QP+NfHTf5hwPPM3r
 seE9Pm8OmZKF0xk29DoKKPZAx8HVFzC8qkHEW0NciYckpNHIxL18k6IgUg0kAsqPB1
 4kZ6VOhB46EsB/R5gHx65lL4wT2rl8YrfYDcZV5KUcDNVE7LlI0TH2qov6acKnTWKa
 haVCYou/apmos6kKyAGlW7ST4LnEQMsbdpZIlaCJWw7UjpNPvtxGdtCJWR46mG7/ME
 fjFSQmdREx4bk93AUY7FjVMOS9j4RKaZvUSalutLmeyUmI1nmJKU1Kn2WoBwE3Ojrh
 egCMWHuXWU77Q==
Date: Mon, 23 Aug 2021 17:50:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@mellanox.com>, Dave Airlie <airlied@linux.ie>, DRI
 <dri-devel@lists.freedesktop.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon
 Romanovsky <leonro@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the hmm tree
Message-ID: <20210823175027.3f3fabd7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//zQi18i=ahDnMC3+VaHQ0Vw";
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

--Sig_//zQi18i=ahDnMC3+VaHQ0Vw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hmm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/gpu/drm/i915/gem/i915_gem_ttm.c: In function 'i915_ttm_tt_get_st':
drivers/gpu/drm/i915/gem/i915_gem_ttm.c:396:7: error: implicit declaration =
of function '__sg_alloc_table_from_pages'; did you mean 'sg_alloc_table_fro=
m_pages'? [-Werror=3Dimplicit-function-declaration]
  396 |  sg =3D __sg_alloc_table_from_pages
      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
      |       sg_alloc_table_from_pages
drivers/gpu/drm/i915/gem/i915_gem_ttm.c:396:5: warning: assignment to 'stru=
ct scatterlist *' from 'int' makes pointer from integer without a cast [-Wi=
nt-conversion]
  396 |  sg =3D __sg_alloc_table_from_pages
      |     ^

Caused by commit

  fcbfe956561b ("lib/scatterlist: Provide a dedicated function to support t=
able append")

interacting with commit

  213d50927763 ("drm/i915/ttm: Introduce a TTM i915 gem object backend")

from the drm tree.

I have applied the following merge resolution patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 23 Aug 2021 17:46:27 +1000
Subject: [PATCH] drm/i915/ttm: fix up for "lib/scatterlist: Provide a
 dedicated function to support tableappend"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915=
/gem/i915_gem_ttm.c
index 771eb2963123..d3d95934a047 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -382,7 +382,6 @@ i915_ttm_region(struct ttm_device *bdev, int ttm_mem_ty=
pe)
 static struct sg_table *i915_ttm_tt_get_st(struct ttm_tt *ttm)
 {
 	struct i915_ttm_tt *i915_tt =3D container_of(ttm, typeof(*i915_tt), ttm);
-	struct scatterlist *sg;
 	struct sg_table *st;
 	int ret;
=20
@@ -393,13 +392,13 @@ static struct sg_table *i915_ttm_tt_get_st(struct ttm=
_tt *ttm)
 	if (!st)
 		return ERR_PTR(-ENOMEM);
=20
-	sg =3D __sg_alloc_table_from_pages
+	ret =3D sg_alloc_table_from_pages_segment
 		(st, ttm->pages, ttm->num_pages, 0,
 		 (unsigned long)ttm->num_pages << PAGE_SHIFT,
-		 i915_sg_segment_size(), NULL, 0, GFP_KERNEL);
-	if (IS_ERR(sg)) {
+		 i915_sg_segment_size(), GFP_KERNEL);
+	if (ret) {
 		kfree(st);
-		return ERR_CAST(sg);
+		return ERR_PTR(ret);
 	}
=20
 	ret =3D dma_map_sgtable(i915_tt->dev, st, DMA_BIDIRECTIONAL, 0);
--=20
2.32.0

--=20
Cheers,
Stephen Rothwell

--Sig_//zQi18i=ahDnMC3+VaHQ0Vw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEjU0QACgkQAVBC80lX
0GwyKAf/djlPvQh5mFxB1HX6H6VwiNvnFMAqdCuLA9ur0ir8JX93LCvE6yDM8MGu
fNhZdfFoF4ZBogs/VAnCqnHMmRe5onD6HJ7TAOtCt2BllQHoKLT4XMY4R3TYES2X
gt2lL9kHBBJCJuo40CBr1VIAHsHWH8qPRZZOWrkSa9GsoWaNS2Pz3uWOsiwkC3p7
prmCs1HACO9LS8V1Q2zhfweMHZXv6VQIceF3XfcOm1hFqeYvHpVTU+rgVFdxbyTG
FkXMRrxp/hTDM+wltFqyDp5aMgTw9wIGvlrB0taIreHsMVCcW6ycl8hlbmHHQS4c
3Y57a/W6nW+ExSY+sq+7q1HecMTS/w==
=rnAY
-----END PGP SIGNATURE-----

--Sig_//zQi18i=ahDnMC3+VaHQ0Vw--
