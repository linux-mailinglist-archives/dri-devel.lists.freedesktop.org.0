Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B099B22BA
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 03:29:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA51410E28D;
	Mon, 28 Oct 2024 02:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ho1cZ+ll";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB5210E28D
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 02:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1730082569;
 bh=DtCkAVAEc3Y0s+qaAQzJ7S7dJ/qpMzYRGAoTLAgQp5c=;
 h=Date:From:To:Cc:Subject:From;
 b=Ho1cZ+llhAulgCfkrsBVpVXa5KeAf/tMBFWzrPsX5u0mSgfclatJPVfuQRyf2sCBg
 4RiUOuD2B5xlcfVOD5RjygFf+3QBYU5Ah8yGZ1Wyv0zvv6yZaimNriCs0gGoR3V9Ol
 trog6I3q7cIkfOlAZhST/w6MX8CpVKWjDJ9XOcDVLo6PCqjMF1VeDiJgP3xhIHVc1c
 mva3qTV+ApWy9iy3PTZayRTFbZrsFiF7gSOgMwJnsGACtANOsbZ/qIb8hr22JpEH88
 lCNY8I+A3N+BXjys0qhakOvh/g/AF+qUjcA/awf3qfBpiM/swuvkky309obPh3K8CQ
 U55I6vrq99+dQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XcHQc6jvHz4w2L;
 Mon, 28 Oct 2024 13:29:28 +1100 (AEDT)
Date: Mon, 28 Oct 2024 13:29:29 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, Arnd Bergmann <arnd@arndb.de>
Cc: DRI <dri-devel@lists.freedesktop.org>, Arnd Bergmann <arnd@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Niklas Schnelle
 <schnelle@linux.ibm.com>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: linux-next: manual merge of the drm tree with the asm-generic tree
Message-ID: <20241028132929.3786e425@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kbxojL.auj6N3miGzsIGzpJ";
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

--Sig_/kbxojL.auj6N3miGzsIGzpJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/qxl/Kconfig

between commit:

  65f5bf96750f ("drm: handle HAS_IOPORT dependencies")

from the asm-generic tree and commit:

  92c13542e878 ("drm/qxl: Run DRM default client setup")

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

diff --cc drivers/gpu/drm/qxl/Kconfig
index 17d6927e5e23,1992df4a82d2..000000000000
--- a/drivers/gpu/drm/qxl/Kconfig
+++ b/drivers/gpu/drm/qxl/Kconfig
@@@ -1,7 -1,8 +1,8 @@@
  # SPDX-License-Identifier: GPL-2.0-only
  config DRM_QXL
  	tristate "QXL virtual GPU"
 -	depends on DRM && PCI && MMU
 +	depends on DRM && PCI && MMU && HAS_IOPORT
+ 	select DRM_CLIENT_SELECTION
  	select DRM_KMS_HELPER
  	select DRM_TTM
  	select DRM_TTM_HELPER


--Sig_/kbxojL.auj6N3miGzsIGzpJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmce9wkACgkQAVBC80lX
0GyICQf+MgfxragsezMHAON2VP9UtIWBllNOPdreocza1pozLf4KZVFkxT9y06iB
YdR9WY0D5N1mr5dHZ6WePK4Xh6mONhsSJhxvE8Y3NwU9aJInYu8SQ2KHhd1Qc2sN
E1CIan9NLZZbgdJ3JS4PLDI1xUQct7eVJwMe0zEwjAhqN2sssZ9ghqgUMlqNheWy
9jGJoxQNZo6XojzhQ53cc1vyYo5ujTESvAkPNhKSQKlMgVDgoEQWF+L8beI5JY4u
ZWvILS4fiIV5vAecpSlKJTRVWjIGRmIis/bSsiHH5tGNqwJRpoxNmD9JLjM9gDx7
IrM2pG44UM6xrXdwH3babbEZUtJwHA==
=oBy3
-----END PGP SIGNATURE-----

--Sig_/kbxojL.auj6N3miGzsIGzpJ--
