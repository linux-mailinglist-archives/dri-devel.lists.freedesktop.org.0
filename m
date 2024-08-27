Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D7195FE2C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 03:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53AD510E254;
	Tue, 27 Aug 2024 01:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ap/3qJJL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD2D10E254
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 01:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1724721408;
 bh=tqmAPvnAzaEIKis2MDMTjtpVaSeJDxe21zSxrryH++M=;
 h=Date:From:To:Cc:Subject:From;
 b=ap/3qJJL65r61EYmAFVTBzx2QotEK4CWaPXMyXk4zK8BD4cCdRnMjsRV0029XA7rF
 103S3zCpM3M5xZ+KapcDVU8zUmb2t4WEX4MRoZD5PCgKI+GIxe3fifhoR9MeM+dNA2
 WyhacyawgODawp2Z7GHzoqkMd775gZdbT0u9Qs4/u57CVoW4v0+xnTRtbAgatBpCVd
 WrcqxebD7FSdLPO1juGmKYjbWMq/kwNa15IK5Dz9gLYiilWiaUXmMiVvvjGyOjgq+v
 487cVnI7XnsadyttLljkZAEe/54QGPTru9UvNdZmvH8n1oxXzlgEXqOGlZk/45pDEf
 j2QlZ27m0eubQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wt8lM4lWTz4wnx;
 Tue, 27 Aug 2024 11:16:47 +1000 (AEST)
Date: Tue, 27 Aug 2024 11:16:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, Kees Cook <kees@kernel.org>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Wen Yang <wen.yang@linux.dev>
Subject: linux-next: manual merge of the drm tree with the pstore tree
Message-ID: <20240827111647.5b127414@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r6dainDK6DRhX9HCi8ZrBj4";
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

--Sig_/r6dainDK6DRhX9HCi8ZrBj4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  fs/pstore/platform.c

between commit:

  1bf8012fc699 ("pstore: replace spinlock_t by raw_spinlock_t")

from the pstore tree and commit:

  e1a261ba599e ("printk: Add a short description string to kmsg_dump()")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/pstore/platform.c
index 84719e2bcbc4,9c6b7c97fa3c..000000000000
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@@ -285,10 -285,10 +285,10 @@@ static void pstore_dump(struct kmsg_dum
  	int		saved_ret =3D 0;
  	int		ret;
 =20
- 	why =3D kmsg_dump_reason_str(reason);
+ 	why =3D kmsg_dump_reason_str(detail->reason);
 =20
- 	if (pstore_cannot_block_path(reason)) {
+ 	if (pstore_cannot_block_path(detail->reason)) {
 -		if (!spin_trylock_irqsave(&psinfo->buf_lock, flags)) {
 +		if (!raw_spin_trylock_irqsave(&psinfo->buf_lock, flags)) {
  			pr_err("dump skipped in %s path because of concurrent dump\n",
  					in_nmi() ? "NMI" : why);
  			return;

--Sig_/r6dainDK6DRhX9HCi8ZrBj4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbNKP8ACgkQAVBC80lX
0GwZ3gf+OoINSkkFHpfMpWfO+5+GRHZj43lhdgDEX5xxdGFhZpdbSkJ5/0Fks0Pr
5ptK7gwLF6DovaG2WTeHTXRDuR2fqAXy6+XzMaV/MkbmyB5DhlXa2KlsJyirI/ZD
Ew7DX4lOwECspkopOtjQl28um64yg80ROkyEOPdeAYydBsq6bIqVlZ6xvNcr96Ue
aIyr1CNj+1LFYikcIO1s38a0uFb1xYSNPHPrp4Hz2js1snPSjYfqYaX8gTqHzVO0
o2BarHV0aPQ2weT8+sV48DyHw+hk4BCUNhJ3JeZeyTf17AQ78tejNJRACGBMNj4M
uapLCBXHvq32qj0QFpUcSDwdeI9pFg==
=xnHv
-----END PGP SIGNATURE-----

--Sig_/r6dainDK6DRhX9HCi8ZrBj4--
