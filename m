Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5582C29E047
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 02:18:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A98F96E823;
	Thu, 29 Oct 2020 01:18:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A066E47A;
 Thu, 29 Oct 2020 01:18:14 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CM6y71X4Yz9s0b;
 Thu, 29 Oct 2020 12:18:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1603934291;
 bh=b9wJS3nbAyZxMqjtljWotEpr2D5lHXOSdWj9oai4MXQ=;
 h=Date:From:To:Cc:Subject:From;
 b=TrGWt2XrpCTnwhyit4+PYTRMuHyGPddji07e/02rtX1DwoJ2Fwjl7o25gnUFm/XyK
 yonpwRBeHH16eXnqW9qbXjxcKZcCA+76uiAwkS5Xc7baVLVaT/Bq9ANSgXHDTFzj0T
 w76UO9LBWS3sGxfMpJusIO+PjTcnHSi+6nd7D9ewAXfY24wrGi6LhKrwqbwhzNuSkS
 DO3BvZ9/a4qJ/Jm4AarqMpcZWqgoHKuYxFlAden1uKX0D1IDdY/HpQo60bMDuAwDjY
 5tWugoU1nvh/knq0Z1wvcd9Bxpr+Sdh5XPWZQgm4prOv91VUdq9kNrQrl32rDRzuak
 ohAGcJ0+a0VLQ==
Date: Thu, 29 Oct 2020 12:18:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-misc tree with the
 drm-misc-fixes tree
Message-ID: <20201029121801.205e6e34@canb.auug.org.au>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: multipart/mixed; boundary="===============0872961907=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0872961907==
Content-Type: multipart/signed; boundary="Sig_/eU5nSNYdUr8Mw9jM3kranNC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/eU5nSNYdUr8Mw9jM3kranNC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/drm_gem.c

between commit:

  f49a51bfdc8e ("drm/shme-helpers: Fix dma_buf_mmap forwarding bug")

from the drm-misc-fixes tree and commit:

  d693def4fd1c ("drm: Remove obsolete GEM and PRIME callbacks from struct d=
rm_driver")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/drm_gem.c
index 69c2c079d803,1da67d34e55d..000000000000
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@@ -1085,9 -1076,7 +1076,9 @@@ int drm_gem_mmap_obj(struct drm_gem_obj
  	 */
  	drm_gem_object_get(obj);
 =20
 +	vma->vm_private_data =3D obj;
 +
- 	if (obj->funcs && obj->funcs->mmap) {
+ 	if (obj->funcs->mmap) {
  		ret =3D obj->funcs->mmap(obj, vma);
  		if (ret) {
  			drm_gem_object_put(obj);

--Sig_/eU5nSNYdUr8Mw9jM3kranNC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+aGEkACgkQAVBC80lX
0GzrUgf/RQeU2mi6hs0UPwt+oP5FUCiRHXbk3B1VVPzT1VT//NX/H4yYgGwvrWFp
g6/lxV8j52eTSI29H1wTA+8ZBrgmCd5NZ1+BOLobaJmF50cvq2TephizSk5mmOIw
uPY0863i0jtrdZHiwtw4wVl7RBTX5I7x9PFZOpYrOxsjfMdDtBMNh3TrpgoORbYE
qz/Dd4awTaD4k7Mz+NZSs4iTIv4jtxPzTYMQbAx7jFaUuBkPJvKz+/UkuDvk7FWo
58DGw1N+rLQB85dm8G7hcU1VTxdv95x6pBRTd/aK/hnty9H3zct94LXV0uKwjDC+
g4tvpJk9tyGmCyUBRzvaSQXJZVmuLg==
=zUl5
-----END PGP SIGNATURE-----

--Sig_/eU5nSNYdUr8Mw9jM3kranNC--

--===============0872961907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0872961907==--
