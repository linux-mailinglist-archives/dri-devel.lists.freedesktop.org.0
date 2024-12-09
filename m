Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 889F19E88F8
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 02:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CB810E276;
	Mon,  9 Dec 2024 01:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="i1UwMysJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C676410E0B9;
 Mon,  9 Dec 2024 01:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1733707036;
 bh=t+DmoviSdAlTAk3abSj0RVB34XICUcoxmmWptoeLCtM=;
 h=Date:From:To:Cc:Subject:From;
 b=i1UwMysJ1ZO+TD6/r/L/NuH6jt2pIFn/AEYRufyRUxUUSG9XNjWRZbrDr/17Gv8n8
 t4GbF1iqZzcKPKr+Y8pHVFtZAI336VhJhZwe+t7Vai5JUOW+rbnRiO4VE9akZ9a8DD
 7WoLcmFfKMlzHTSDlv1m7KSIf5oKzPB0bAJm97mDbfqBv4cJZ8qr6+GQA/ShNL1SBg
 8SF1uT4bNFkVVDcBY43BwUqSfOp6KqwNbcVBKHl+Hs3bP05YOyDTnta42yW05eKAkl
 tw3hdinSvuWLH5khcwbwTYpgyI4m6fEpW+wAO6K/gBdY2aDKbrtO2kZxw/dawa1Aei
 kcROYCcYV1kPw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y63qt32kcz4wj1;
 Mon,  9 Dec 2024 12:17:14 +1100 (AEDT)
Date: Mon, 9 Dec 2024 12:17:17 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Peter Zijlstra <peterz@infradead.org>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Vivek Kasireddy
 <vivek.kasireddy@intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20241209121717.2abe8026@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TGxxteLnVPJt1FrtE=UXr.l";
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

--Sig_/TGxxteLnVPJt1FrtE=UXr.l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/module.h:22,
                 from include/linux/device/driver.h:21,
                 from include/linux/device.h:32,
                 from include/linux/dma-mapping.h:5,
                 from include/linux/dma-buf.h:21,
                 from include/linux/virtio_dma_buf.h:11,
                 from drivers/gpu/drm/virtio/virtgpu_prime.c:26:
drivers/gpu/drm/virtio/virtgpu_prime.c:30:18: error: expected ',' or ';' be=
fore 'DMA_BUF'
   30 | MODULE_IMPORT_NS(DMA_BUF);
      |                  ^~~~~~~
include/linux/moduleparam.h:26:61: note: in definition of macro '__MODULE_I=
NFO'
   26 |                 =3D __MODULE_INFO_PREFIX __stringify(tag) "=3D" info
      |                                                             ^~~~
include/linux/module.h:299:33: note: in expansion of macro 'MODULE_INFO'
  299 | #define MODULE_IMPORT_NS(ns)    MODULE_INFO(import_ns, ns)
      |                                 ^~~~~~~~~~~
drivers/gpu/drm/virtio/virtgpu_prime.c:30:1: note: in expansion of macro 'M=
ODULE_IMPORT_NS'
   30 | MODULE_IMPORT_NS(DMA_BUF);
      | ^~~~~~~~~~~~~~~~

Caused by commit

  25c3fd1183c0 ("drm/virtio: Add a helper to map and note the dma addrs and=
 lengths")

Interacting with commit

  cdd30ebb1b9f ("module: Convert symbol namespace to string literal")

from Linus' tree.

I have applied the following merge fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 9 Dec 2024 12:08:24 +1100
Subject: [PATCH] fix up for "drm/virtio: Add a helper to map and note the d=
ma
 addrs and lengths"

interacting with commit

  cdd30ebb1b9f ("module: Convert symbol namespace to string literal")

from Linus' tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/virtio/virtgpu_prime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virti=
o/virtgpu_prime.c
index 688810d1b611..b3664c12843d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -27,7 +27,7 @@
=20
 #include "virtgpu_drv.h"
=20
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
=20
 static int virtgpu_virtio_get_uuid(struct dma_buf *buf,
 				   uuid_t *uuid)
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/TGxxteLnVPJt1FrtE=UXr.l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdWRR0ACgkQAVBC80lX
0Gya1gf+L7+ybxyfZSaJhxvqPO9tsfECMUSA6w/dj8rcodhy5CrYOfDWkt/avS49
F41fQ1QqqvmgOpqT3Rj/mKBlFCNlZAj04bNukZcgy/v3CLGYcQq/QY+n4deKDAUp
bMnQsChNIXqI/bwyZ7laLU+3HAPim0tF9b6vA2t2vjKRNbeYigrjVc2vW+RXRI0T
RRRGkGZdepm37Sv1/pzIQFstyPNum6hutFpYvQ/xn0NA5EYzKC0xBfw4Veng9rdU
bq6xvanR8Ldlsz4kAfR+sUHZepeR6UG3bC0R95vSZsj/1up13gWn09lp7zQvh36z
L7EugUQRrzyAiojD3i2m8Y2aswKoiA==
=c+iH
-----END PGP SIGNATURE-----

--Sig_/TGxxteLnVPJt1FrtE=UXr.l--
