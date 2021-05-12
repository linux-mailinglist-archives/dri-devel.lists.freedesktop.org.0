Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC8737B2F9
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 02:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2993E6EB3B;
	Wed, 12 May 2021 00:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177C16EB3B;
 Wed, 12 May 2021 00:20:49 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FfwRy0NlKz9sWT;
 Wed, 12 May 2021 10:20:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1620778848;
 bh=at8WqoLbJGB6S1Ei0mKEXbtD/agRQqXu50Yp/LqIVQo=;
 h=Date:From:To:Cc:Subject:From;
 b=LrUyJu7SqFPWpr9OQgh7KDS+72p3nxtR6De8J90vHYvOJ1EZs7MLkB9fzrx60C2vp
 A+Ff16j81BYgjI7Wrchz9Es1atus1q9O7Y4dhCFwaqQDMMkdjq/h+HZzFZ+bnhXLoP
 reeIC1NTNhJnpfsi0wnN8tP24ervm+RvkhgbaJ8DNySTRUEjcbYQFmwJdj1o3ex/+w
 1XRSWpfIoFec93Lt3Rn+GiCsQBhPf9y7lzYHYc5VyR60PkN3L1a/2OkCVnGYzkt2Fb
 UVoP5vOUclyfKAbQeQmlm9SBs/NeROvLt+wTIBxlzGqwbi+YiMuMDCryrBB/bQE/NO
 MLRz5Z8g8//fw==
Date: Wed, 12 May 2021 10:20:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the amdgpu tree with the drm-misc tree
Message-ID: <20210512102045.608686ca@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Lp3RkMQUbAst2dyO6aaP3.E";
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Lp3RkMQUbAst2dyO6aaP3.E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c

between commit:

  c777dc9e7933 ("drm/ttm: move the page_alignment into the BO v2")

from the drm-misc tree and commit:

  dd03daec0ff1 ("drm/amdgpu: restructure amdgpu_vram_mgr_new")

from the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index f7235438535f,e2cbe19404c0..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@@ -448,10 -391,10 +391,10 @@@ static int amdgpu_vram_mgr_new(struct t
  		pages_per_node =3D HPAGE_PMD_NR;
  #else
  		/* default to 2MB */
- 		pages_per_node =3D (2UL << (20UL - PAGE_SHIFT));
+ 		pages_per_node =3D 2UL << (20UL - PAGE_SHIFT);
  #endif
- 		pages_per_node =3D max((uint32_t)pages_per_node,
- 				     tbo->page_alignment);
+ 		pages_per_node =3D max_t(uint32_t, pages_per_node,
 -				       mem->page_alignment);
++				       tbo->page_alignment);
  		num_nodes =3D DIV_ROUND_UP(mem->num_pages, pages_per_node);
  	}
 =20
@@@ -469,38 -412,29 +412,29 @@@
  	mem->start =3D 0;
  	pages_left =3D mem->num_pages;
 =20
- 	spin_lock(&mgr->lock);
- 	for (i =3D 0; pages_left >=3D pages_per_node; ++i) {
- 		unsigned long pages =3D rounddown_pow_of_two(pages_left);
+ 	/* Limit maximum size to 2GB due to SG table limitations */
+ 	pages =3D min(pages_left, 2UL << (30 - PAGE_SHIFT));
 =20
- 		/* Limit maximum size to 2GB due to SG table limitations */
- 		pages =3D min(pages, (2UL << (30 - PAGE_SHIFT)));
-=20
- 		r =3D drm_mm_insert_node_in_range(mm, &nodes[i], pages,
- 						pages_per_node, 0,
- 						place->fpfn, lpfn,
- 						mode);
- 		if (unlikely(r))
- 			break;
-=20
- 		vis_usage +=3D amdgpu_vram_mgr_vis_size(adev, &nodes[i]);
- 		amdgpu_vram_mgr_virt_start(mem, &nodes[i]);
- 		pages_left -=3D pages;
- 	}
-=20
- 	for (; pages_left; ++i) {
- 		unsigned long pages =3D min(pages_left, pages_per_node);
+ 	i =3D 0;
+ 	spin_lock(&mgr->lock);
+ 	while (pages_left) {
 -		uint32_t alignment =3D mem->page_alignment;
 +		uint32_t alignment =3D tbo->page_alignment;
 =20
- 		if (pages =3D=3D pages_per_node)
+ 		if (pages >=3D pages_per_node)
  			alignment =3D pages_per_node;
 =20
- 		r =3D drm_mm_insert_node_in_range(mm, &nodes[i],
- 						pages, alignment, 0,
- 						place->fpfn, lpfn,
- 						mode);
- 		if (unlikely(r))
+ 		r =3D drm_mm_insert_node_in_range(mm, &nodes[i], pages, alignment,
+ 						0, place->fpfn, lpfn, mode);
+ 		if (unlikely(r)) {
+ 			if (pages > pages_per_node) {
+ 				if (is_power_of_2(pages))
+ 					pages =3D pages / 2;
+ 				else
+ 					pages =3D rounddown_pow_of_two(pages);
+ 				continue;
+ 			}
  			goto error;
+ 		}
 =20
  		vis_usage +=3D amdgpu_vram_mgr_vis_size(adev, &nodes[i]);
  		amdgpu_vram_mgr_virt_start(mem, &nodes[i]);

--Sig_/Lp3RkMQUbAst2dyO6aaP3.E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCbH10ACgkQAVBC80lX
0GylrAf+OuzQUSeuN8oRz0JK+QNcNQMDpT+xPXU3KK583+dqa+PCtx658wk4OfAH
I1OisGviS22hxu1K4p8wTJxZ8Hcrysuc8YDAM/9ikrTaJqH6ywNHFzfrJNYmVjVz
ahuMPgsrduxS1P8IoVDX3UE2/XxElsbFd/PAky9J5jEl2qyyFxi4FQcd0PInV/sB
btKZzTYPjySRLZVuhe0aZbe/zUxzta1TXAOJG+6TFL6TDE4EMauzWWS5XqtduqbN
AJmwdvy0dKKaG2fs7i0/L5itjW0EJM0L+pNqa6MhxQV6Y4RRML2MMHjJGnqK0ZSy
cRzuhRQ+wW2YOB7EmtxknGdY+Y4Bvw==
=YnWX
-----END PGP SIGNATURE-----

--Sig_/Lp3RkMQUbAst2dyO6aaP3.E--
