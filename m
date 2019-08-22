Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F63989BC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 05:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F666E419;
	Thu, 22 Aug 2019 03:15:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21FC6E419;
 Thu, 22 Aug 2019 03:15:10 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46DV5P2lZHz9s3Z;
 Thu, 22 Aug 2019 13:15:04 +1000 (AEST)
Date: Thu, 22 Aug 2019 13:15:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>
Subject: linux-next: manual merge of the drm-intel tree with the drm tree
Message-ID: <20190822131504.13c1f47e@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1566443708;
 bh=FWaVWC9hKQVgW4ffnE0ESsDOTl/uHhq2zf25RGNfLHs=;
 h=Date:From:To:Cc:Subject:From;
 b=nm6q66TIHdKGwLXxL77K1mObonlc7ccgadLjX7SAKyUYqVITjiAsbmwiMYwj9YYBA
 1Nsy/mH4R+WMiQoPA2bn7ER/gcGLH6tGNXQRo5TnUsCYw77tbruaSEwYecDwBD/5Eo
 s58l8myWLRJmmxXKGvD21brRt4bRYiaY8UbI8Cen7FN1Vw1oNrv0yvC5K6565Uhc1F
 ija/dYur8K30990eZfUz18RErxfh5rILIT3HhY9X1UXZPVim/1HiCc4dIN+8U4/bgx
 AQbZ3nsg/cZhsc6iz0Bs6mNy2Zs2Bfw0qpHz4ys/B0/df9ZWiSfT2HReoE+G9kKUNA
 FB9vtPBCiDLQg==
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0630373832=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0630373832==
Content-Type: multipart/signed; boundary="Sig_/OZdfbKRhgv_ngs8_CRFNLlE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OZdfbKRhgv_ngs8_CRFNLlE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/i915_vma.c

between commit:

  52791eeec1d9 ("dma-buf: rename reservation_object to dma_resv")

from the drm tree and commit:

  cd2a4eaf8c79 ("drm/i915: Report resv_obj allocation failure")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/i915_vma.c
index 2645f4e850c2,252edef6c59e..000000000000
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@@ -926,14 -906,22 +906,22 @@@ int i915_vma_move_to_active(struct i915
  	if (unlikely(err))
  		return err;
 =20
- 	obj->write_domain =3D 0;
  	if (flags & EXEC_OBJECT_WRITE) {
- 		obj->write_domain =3D I915_GEM_DOMAIN_RENDER;
-=20
- 		if (intel_fb_obj_invalidate(obj, ORIGIN_CS))
- 			__i915_active_request_set(&obj->frontbuffer_write, rq);
+ 		if (intel_frontbuffer_invalidate(obj->frontbuffer, ORIGIN_CS))
+ 			i915_active_ref(&obj->frontbuffer->write,
+ 					rq->timeline,
+ 					rq);
 =20
 -		reservation_object_add_excl_fence(vma->resv, &rq->fence);
++		dma_resv_add_excl_fence(vma->resv, &rq->fence);
+ 		obj->write_domain =3D I915_GEM_DOMAIN_RENDER;
  		obj->read_domains =3D 0;
+ 	} else {
 -		err =3D reservation_object_reserve_shared(vma->resv, 1);
++		err =3D dma_resv_reserve_shared(vma->resv, 1);
+ 		if (unlikely(err))
+ 			return err;
+=20
 -		reservation_object_add_shared_fence(vma->resv, &rq->fence);
++		dma_resv_add_shared_fence(vma->resv, &rq->fence);
+ 		obj->write_domain =3D 0;
  	}
  	obj->read_domains |=3D I915_GEM_GPU_DOMAINS;
  	obj->mm.dirty =3D true;

--Sig_/OZdfbKRhgv_ngs8_CRFNLlE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1eCLgACgkQAVBC80lX
0GxuUQf9G4hRvr4DgYRyVDh+YJeCJAh1S5g40itC+tJH2QeeeYFIY+SmWICsK2MJ
3gV7RZmcvqNSNOWA/QebgIscbVKcXd53H07vNo4DO+tkd0Zq03JQ/d6NA0tWl2rE
AM2UzcFwqTkTqiT9HZLyV65x2YWBfKxx/aPwDrJ7AdhKV3k1TG1qVWmO1WPfUoln
I6y4igZIOLp+QHGaNYtQb2DsD3tal33Q2G33HfbgBl5qMgPgAnB3gmstBG5/8EMX
4P1vj0JsZ/Z9PfO1q5lT9k/wex3iwwBF24ohTUqgHl6xcjZYxrKJ0Fvnl3+EpXpW
aJZDeXq2iKMn1DPMx7F9SNCkif9FRg==
=KOQn
-----END PGP SIGNATURE-----

--Sig_/OZdfbKRhgv_ngs8_CRFNLlE--

--===============0630373832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0630373832==--
