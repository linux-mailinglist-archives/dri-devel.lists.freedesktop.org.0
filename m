Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EA664AC17
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 01:17:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E65A10E2B3;
	Tue, 13 Dec 2022 00:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E58710E2B3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 00:16:28 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NWJv71JFhz4xN4;
 Tue, 13 Dec 2022 11:16:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1670890580;
 bh=xAYs4RzRwjOFkzI7D5yEGU/NLolgCnhRJ8STI3pof/c=;
 h=Date:From:To:Cc:Subject:From;
 b=FRl2JzYYRhjzIuuD2avNqoAGw6msBylr58Ef/s6hj0wNErThnhG22FX+pqniXOlDO
 arAZDTk0jD/KxH3j2fIt4U4E04ajGp4kLz/45Vttt0UZ5HwElRtEaZBBobRny8WOHi
 bom5kh4satYvqCBVxsClI31jqNCr2FFjvbgx5fU0A4Szn4mVBHOSTH2ytAD18sZJwT
 E67LM1CpuBlTMTUp8JfxmOWoYP8GcwmQpKCKmiNAyBv6YqbRVGiRT/8m6Od3ZsSwc8
 L7F7b+c5OSDjZmF6q5S16u2yHAJuLCgLHNbNC9Uoceg6Bdf3g5JNDoXx12xGPDSy6O
 kLCA6ueziI0aQ==
Date: Tue, 13 Dec 2022 11:16:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Helge Deller <deller@gmx.de>, Dave Airlie <airlied@redhat.com>
Subject: linux-next: manual merge of the fbdev tree with the drm tree
Message-ID: <20221213111612.7bc1f917@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sp97=XczOeN82EqDD6bT2oD";
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/sp97=XczOeN82EqDD6bT2oD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fbdev tree got a conflict in:

  drivers/video/fbdev/Kconfig

between commit:

  c8a17756c425 ("drm/ofdrm: Add ofdrm for Open Firmware framebuffers")

from the drm tree and commit:

  225e095bbd3a ("fbdev: offb: make offb driver tristate")

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

diff --cc drivers/video/fbdev/Kconfig
index 71019b167f8b,a529511f7f53..000000000000
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@@ -456,9 -453,8 +456,9 @@@ config FB_ATAR
  	  chipset found in Ataris.
 =20
  config FB_OF
- 	bool "Open Firmware frame buffer device support"
- 	depends on (FB =3D y) && PPC && (!PPC_PSERIES || PCI)
+ 	tristate "Open Firmware frame buffer device support"
+ 	depends on FB && PPC && (!PPC_PSERIES || PCI)
 +	depends on !DRM_OFDRM
  	select APERTURE_HELPERS
  	select FB_CFB_FILLRECT
  	select FB_CFB_COPYAREA

--Sig_/sp97=XczOeN82EqDD6bT2oD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmOXxEwACgkQAVBC80lX
0Gxh8wf/e0gBQKPOoEg6O0eamyAvA1MrPv45E3hqftz0Qf8sg0+b1LLlBMPONe7F
v1CD8ileZtYa9c/CpH6UNhRSbVsmE8OOJ6H+PgcKTri1FIuD5l6Us9Br8g8x61WP
mjKuY3H5XjcYhGvnzjC/NpPbwyGQqHkqHSdOF0mMa+smkNjuTkYrQ5uG0GdyLBF0
U7MLL3AMUmAJOMsBYy914Og4/8M+yhy8u9qNtSC5MIFI1hzxZrzuPuHXpKpypUJ5
aCnKzXj68sU/v3gkiRQ5ZeWcQ5UHjmJoM09wDjvYTEzumymCHEdoPGQoRM/j0id1
5x0oQ5+LdMIvLtIuUIogReMCT9nBXw==
=xRxj
-----END PGP SIGNATURE-----

--Sig_/sp97=XczOeN82EqDD6bT2oD--
