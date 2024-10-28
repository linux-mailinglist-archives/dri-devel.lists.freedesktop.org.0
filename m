Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F619B22C5
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 03:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7348A10E30C;
	Mon, 28 Oct 2024 02:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qxUBRCO+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A01010E30C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 02:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1730082881;
 bh=JDHWiN9NAo9LuoaCbWhzdDJS6nLwTnW098dN72JlDqM=;
 h=Date:From:To:Cc:Subject:From;
 b=qxUBRCO+aRZLSN3VKXR1G0fii3naedy+ScP32TccCRGfBwohPT0A9MQENaTtnzLci
 J4YK9vKzbvdy+99v/Un/ZGKHjmkFqEDsHpBFrgsOowdirY01PJFkv2WzglWx6kdHKp
 c5wmBqohMbAq0/PsfXAs0CPk0H6XzKqvVfPZVnOzf2/7+CSsbDJh6qhW4N1M8pTDyM
 SunNPo1JVo7v8F5Gml+osSLt3vjP8p499V0ZEgiDF8fFvQAxjFru12+fQUxOlfhD1+
 0DJx2TaS0qeLU2x8Ouk4coNt8PSmRFaA1RVt3KIFZ59LQD2deRplaCuensQD8yRh+V
 725OqvAnaiW2w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XcHXc3s41z4x6k;
 Mon, 28 Oct 2024 13:34:40 +1100 (AEDT)
Date: Mon, 28 Oct 2024 13:34:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, Arnd Bergmann <arnd@arndb.de>
Cc: DRI <dri-devel@lists.freedesktop.org>, Arnd Bergmann <arnd@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Niklas Schnelle
 <schnelle@linux.ibm.com>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: linux-next: manual merge of the drm tree with the asm-generic tree
Message-ID: <20241028133441.7b92ee4f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SY3SL88/18B4gf/.AlhPnNx";
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

--Sig_/SY3SL88/18B4gf/.AlhPnNx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/tiny/bochs.c

between commit:

  65f5bf96750f ("drm: handle HAS_IOPORT dependencies")

from the asm-generic tree and commit:

  7934a1c25097 ("drm/bochs: Use video aperture helpers")

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

diff --cc drivers/gpu/drm/tiny/bochs.c
index e738bb858316,447989bb8201..000000000000
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@@ -1,6 -1,6 +1,7 @@@
  // SPDX-License-Identifier: GPL-2.0-or-later
 =20
+ #include <linux/aperture.h>
 +#include <linux/bug.h>
  #include <linux/module.h>
  #include <linux/pci.h>
 =20
@@@ -94,13 -99,13 +100,18 @@@ struct bochs_device=20
  	struct drm_connector connector;
  };
 =20
+ static struct bochs_device *to_bochs_device(const struct drm_device *dev)
+ {
+ 	return container_of(dev, struct bochs_device, dev);
+ }
+=20
  /* ----------------------------------------------------------------------=
 */
 =20
 +static __always_inline bool bochs_uses_mmio(struct bochs_device *bochs)
 +{
 +	return !IS_ENABLED(CONFIG_HAS_IOPORT) || bochs->mmio;
 +}
 +
  static void bochs_vga_writeb(struct bochs_device *bochs, u16 ioport, u8 v=
al)
  {
  	if (WARN_ON(ioport < 0x3c0 || ioport > 0x3df))
@@@ -234,10 -236,10 +242,10 @@@ static int bochs_hw_init(struct bochs_d
  			DRM_ERROR("Cannot map mmio region\n");
  			return -ENOMEM;
  		}
 -	} else {
 +	} else if (IS_ENABLED(CONFIG_HAS_IOPORT)) {
  		ioaddr =3D VBE_DISPI_IOPORT_INDEX;
  		iosize =3D 2;
- 		if (!request_region(ioaddr, iosize, "bochs-drm")) {
+ 		if (!devm_request_region(&pdev->dev, ioaddr, iosize, "bochs-drm")) {
  			DRM_ERROR("Cannot request ioports\n");
  			return -EBUSY;
  		}

--Sig_/SY3SL88/18B4gf/.AlhPnNx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmce+EEACgkQAVBC80lX
0GwrPggAoLtH103R0+IrRGF7UmlEAoccTRxbIxQYbZFDJT+1eVgUhDSVugHWQf4m
5dvjqxxXY/jwaI6EezJe1jhPg4neSlYzwdZT8gXWLQAdHT+2+S0Aaz84U86nhbKQ
X5z+rBtkUexUCm0NdtFLGNtUDWN3njjVJd1hwATbMwDgkEpIeiw2JkWMP06vED9O
EC7kV8nYcYlujfXj6iDOi4KM5ikHDfbOgVO3DqUDSd0Tw/UsqPIRsfPd3TPmNt+A
0siDb9ZDQ0RovY4ybCnRdYQXRehYT9nSc47vtxQgVT5nkeNLm1Bku2zEeTkFqrwx
mxdzlYZVxbTr9zwTTAb+3x5q0CCIcQ==
=IubL
-----END PGP SIGNATURE-----

--Sig_/SY3SL88/18B4gf/.AlhPnNx--
