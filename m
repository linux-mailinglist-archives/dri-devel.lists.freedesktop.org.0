Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7474D4F4ABC
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 02:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4987B10E80B;
	Wed,  6 Apr 2022 00:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B1510E7C0;
 Wed,  6 Apr 2022 00:50:52 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KY5Xp3RQSz4xmr;
 Wed,  6 Apr 2022 10:50:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1649206250;
 bh=K6LR0Q5LoFNyPdpvbQ4wuGRJSuMzXSR3Bua2HeOno5g=;
 h=Date:From:To:Cc:Subject:From;
 b=LDNxU86SW9D2KYuEYE4NduZDFs4qHSQJ0/rCclT6PvLqEvsFk/0MFAKnBBMB00cwu
 zvKDui7kv0R6g2CHG5JGoNw/DyPCog8mC8lS/MzkvsyHS7W2/Z7joeD34o6wbaJLY0
 ZZJVV6h++ha9m4dqSHQ7blxk37aVm7/a/9ZYHD8WSGbb5HWkEwudgkGARvH4SPiMJ9
 zRwgNqlZ/Dh2/eK83UdRu8S+yumGoM0lq/1ehIirYDzXz3+NnHRHxx4w+nAW8NaetS
 H69ceEO8NtLQH6nNSQuQFQCQu1yRHnP5OdYOV0kqA81fLqv47RwogbZTaQGayTu6o5
 bnE8+PYH/QpTQ==
Date: Wed, 6 Apr 2022 10:50:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20220406105049.5f5e01c1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/22R7lPkTNXuhOpp3gl.O=Vn";
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/22R7lPkTNXuhOpp3gl.O=Vn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/panel/panel-newvision-nv3052c.c:478:19: error: initializati=
on of 'void (*)(struct spi_device *)' from incompatible pointer type 'int (=
*)(struct spi_device *)' [-Werror=3Dincompatible-pointer-types]
  478 |         .remove =3D nv3052c_remove,
      |                   ^~~~~~~~~~~~~~
drivers/gpu/drm/panel/panel-newvision-nv3052c.c:478:19: note: (near initial=
ization for 'nv3052c_driver.remove')

Caused by commit

  49956b505c53 ("drm/panel: Add panel driver for NewVision NV3052C based LC=
Ds")

interacting with commit

  2cbfa2128662 ("spi: make remove callback a void function")

from Linus' tree (merged in v5.18-rc1).

I applied the following merge resolution patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 6 Apr 2022 10:46:57 +1000
Subject: [PATCH] fixup for "spi: make remove callback a void function"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/=
drm/panel/panel-newvision-nv3052c.c
index 127bcfdb59df..cf078f0d3cd3 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
@@ -416,15 +416,13 @@ static int nv3052c_probe(struct spi_device *spi)
 	return 0;
 }
=20
-static int nv3052c_remove(struct spi_device *spi)
+static void nv3052c_remove(struct spi_device *spi)
 {
 	struct nv3052c *priv =3D spi_get_drvdata(spi);
=20
 	drm_panel_remove(&priv->panel);
 	drm_panel_disable(&priv->panel);
 	drm_panel_unprepare(&priv->panel);
-
-	return 0;
 }
=20
 static const struct drm_display_mode ltk035c5444t_modes[] =3D {
--=20
2.35.1

--=20
Cheers,
Stephen Rothwell

--Sig_/22R7lPkTNXuhOpp3gl.O=Vn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmJM4+kACgkQAVBC80lX
0Gzv1wgAoIeioO/RuQUM06lmi112VLRhQxgoQuReg2kTMLOhTvABrEWR3N+2rFEG
Xx06ETkA6XcTRQbAWwaX2WbHNDbEv2Bv0fy5D0Yno0HrGbONbsz2azh979KDwruX
Eb4CMGUdq2UGI9YtC78i+VzuOuoz5KLp2j6E36/N4YbQ4ZWOgBu3Xjkb/tIDmoQd
RmLWqXnPHPyph/oM20Ge6ZQlhQV35t0sNC3bIZWxV1HsGTUSRvWPYY4YxYTuNT7z
U7RbOq6Lzj7kOmhQHtoJyGnmewXZWm69kwx9QXWczg9SaRsCOyHT7tq0iEI5yOBT
teCXjP2bnViSM8U/LE3x/2vZ0eZ48Q==
=ucTU
-----END PGP SIGNATURE-----

--Sig_/22R7lPkTNXuhOpp3gl.O=Vn--
