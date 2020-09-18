Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EABB426F378
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 05:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2428E6EC8D;
	Fri, 18 Sep 2020 03:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7B46EC8D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 03:07:16 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BszJv65FpzB3vJ;
 Fri, 18 Sep 2020 13:07:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1600398434;
 bh=jY+10yJmYJ3kdSdFgZdAN0Xv69kt3UN2C8TV6HNN/HI=;
 h=Date:From:To:Cc:Subject:From;
 b=ub528vZ8lrn0PXGMfjXAd3k1iQvDRcQbEto+2Fxaq9atjs19rCWMrAxcjmcOWGy+D
 VoE1FQ/qKcLKYOZGQIh4wI2nHMVSbEZHlFzQJJs8znfsPYRsJn3f6AsLdh0WKDtEpC
 osj8etrZN028OuKsdiroJ0SH5IKvbIpxTRmzMz9tDJGIx22OR2NieL8oAX+ib8w3rA
 MNTDGToTEvYLLeJnrO928g0Y2Y0RR1FUOU6kscBAPBTuLjTWfYX9j0k65E3MypD3AP
 KcPWUKIIjMr1mVwRmzVrsmMjyYtow1Fsbna2PXOy4npt4Ka8IjfMy6bSZzpsn84akh
 yN+KTEtb5E1iA==
Date: Fri, 18 Sep 2020 13:07:10 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>, Dave
 Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-msm tree with the drm tree
Message-ID: <20200918130710.3a9b1ed4@canb.auug.org.au>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: multipart/mixed; boundary="===============1522705811=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1522705811==
Content-Type: multipart/signed; boundary="Sig_/gob71Wiro0O.6W+bBsbntBf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gob71Wiro0O.6W+bBsbntBf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-msm tree got a conflict in:

  drivers/gpu/drm/msm/msm_gem.c

between commit:

  7690a33f22ab ("drm: msm: fix common struct sg_table related issues")

from the drm tree and commit:

  e1bf29e022fb ("drm/msm: drop cache sync hack")

from the drm-msm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/msm/msm_gem.c
index e47958c3704a,3cb7aeb93fd3..000000000000
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@@ -52,23 -52,16 +52,14 @@@ static void sync_for_device(struct msm_
  {
  	struct device *dev =3D msm_obj->base.dev->dev;
 =20
- 	if (get_dma_ops(dev) && IS_ENABLED(CONFIG_ARM64)) {
- 		dma_sync_sgtable_for_device(dev, msm_obj->sgt,
- 					    DMA_BIDIRECTIONAL);
- 	} else {
- 		dma_map_sgtable(dev, msm_obj->sgt, DMA_BIDIRECTIONAL, 0);
- 	}
 -	dma_map_sg(dev, msm_obj->sgt->sgl,
 -		msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
++	dma_map_sgtable(dev, msm_obj->sgt, DMA_BIDIRECTIONAL, 0);
  }
 =20
  static void sync_for_cpu(struct msm_gem_object *msm_obj)
  {
  	struct device *dev =3D msm_obj->base.dev->dev;
 =20
- 	if (get_dma_ops(dev) && IS_ENABLED(CONFIG_ARM64)) {
- 		dma_sync_sgtable_for_cpu(dev, msm_obj->sgt, DMA_BIDIRECTIONAL);
- 	} else {
- 		dma_unmap_sgtable(dev, msm_obj->sgt, DMA_BIDIRECTIONAL, 0);
- 	}
 -	dma_unmap_sg(dev, msm_obj->sgt->sgl,
 -		msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
++	dma_unmap_sgtable(dev, msm_obj->sgt, DMA_BIDIRECTIONAL, 0);
  }
 =20
  /* allocate pages from VRAM carveout, used when no IOMMU: */

--Sig_/gob71Wiro0O.6W+bBsbntBf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9kJF4ACgkQAVBC80lX
0Gyt9gf+Me9wSB1yIYylZjcbmnaO4xWyxULvze67Us1z7gXJN+qoSyuAU9RFLaoL
T5tw7Sz+cj5r5XorgmKZFppg3Z0G5/8e77ZNCbgKR2ofrDn2mepLJI9nDNEHtnIt
R88vkolt0drrA9vWaPW4DAEKu8ekOVVuZZ9DyPfWHxLT1XhoeBajNFF7hmaEobQR
1UFLNExXyjXBqjLCYxChp/sYMMkIYeAmjzoUVkLYUC13ZrFXzZgLbVJi5hUidHIz
fuM9YWaxB/sWQAE5zTWvkiaelvz58p8nVjnl9DoxgQWGXp9kH7trVKUYczQ+H2f3
yl5Ed8uEUZi7o9wA9YpjgqwIOKKk4Q==
=Whbl
-----END PGP SIGNATURE-----

--Sig_/gob71Wiro0O.6W+bBsbntBf--

--===============1522705811==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1522705811==--
