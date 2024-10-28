Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 727F19B22B6
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 03:27:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9555B10E009;
	Mon, 28 Oct 2024 02:27:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ihryl5ms";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB6B10E009
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 02:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1730082427;
 bh=PTgMcrh/DjlRMa4Xvz3XtnTZ7EL8OuqbXeeGiXcMhDs=;
 h=Date:From:To:Cc:Subject:From;
 b=ihryl5msw++sO6kks9izFyyBxe1jmaTGqRA1FdPxfWyCLOTplIt0yWH8Vy5Rtt1R1
 u2gxgNgP9me+9aHldp/XsiftsKx/qVSH1KR3KAeji+Y0SjSUctrGVBTODgPTkkis/O
 jQaPyRYIqaujmgFQzJwsuc8X94Y+XzMbjfzjdEBsp209SnnPHPLR6BrN6inUn4IJCc
 VwR0Sj/QRTMYcOUghjN6YpxXEa3C90IaKnKslFQvUbTJPx56XiFglnT6v6iZfVCpeP
 PSZwBhLabeDoibS3Zl9BzQNdQLJJfIFabfCnyKqV5r3QDfkRgGQIAv76hoRpl+D99m
 CrnnTHgBQ6oaQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XcHMt35B4z4w2L;
 Mon, 28 Oct 2024 13:27:06 +1100 (AEDT)
Date: Mon, 28 Oct 2024 13:27:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, Arnd Bergmann <arnd@arndb.de>
Cc: DRI <dri-devel@lists.freedesktop.org>, Arnd Bergmann <arnd@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Niklas Schnelle
 <schnelle@linux.ibm.com>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: linux-next: manual merge of the drm tree with the asm-generic tree
Message-ID: <20241028132707.24aded7d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5erwJwIlhclGCrUd=HJmnLP";
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

--Sig_/5erwJwIlhclGCrUd=HJmnLP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/gma500/Kconfig

between commit:

  65f5bf96750f ("drm: handle HAS_IOPORT dependencies")

from the asm-generic tree and commit:

  aecdbfe459a0 ("drm/gma500: Run DRM default client setup")

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

diff --cc drivers/gpu/drm/gma500/Kconfig
index 23b7c14de5e2,c2927c37c40b..000000000000
--- a/drivers/gpu/drm/gma500/Kconfig
+++ b/drivers/gpu/drm/gma500/Kconfig
@@@ -1,7 -1,8 +1,8 @@@
  # SPDX-License-Identifier: GPL-2.0-only
  config DRM_GMA500
  	tristate "Intel GMA500/600/3600/3650 KMS Framebuffer"
 -	depends on DRM && PCI && X86 && MMU
 +	depends on DRM && PCI && X86 && MMU && HAS_IOPORT
+ 	select DRM_CLIENT_SELECTION
  	select DRM_KMS_HELPER
  	select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
  	select I2C

--Sig_/5erwJwIlhclGCrUd=HJmnLP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmce9nsACgkQAVBC80lX
0GwrDwf/U8EXNf+9GHqdDXPK+6i658p6nGaSKnn6EDmLrMSUd/aG4Br+G6bNya/u
hHclK2DTDhNkFyplojeMwHEQXHhOMTImJubHzD4qcnLZxGvYtutSAOWPCtZVDz1K
ku7pwQOo2TenTlGnqX+QH1t8fWaNWh65s5Y5YLH+DgEHFmSr2UdilnEQZklT/m9b
qzZOWEGCFCVqT12+ffzgEoBCbuC9Uv79oZnzeT8cXT97dJZprhrhqUzuKUJr6xMO
/0Oisko/PVKbtCmgaNSjp3D0NWOJnNGqjXzVN/hOpyr0I944rNsXmJ3qFiqFK5zF
6IX8QB1xtQtAQFR27bovyyfcyMrFtg==
=gHTb
-----END PGP SIGNATURE-----

--Sig_/5erwJwIlhclGCrUd=HJmnLP--
