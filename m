Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA9B2524D7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 02:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127D16E055;
	Wed, 26 Aug 2020 00:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFC06E055;
 Wed, 26 Aug 2020 00:55:50 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BbnTw0RvFz9sTK;
 Wed, 26 Aug 2020 10:55:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1598403348;
 bh=hoxKBsKE63D/fgihlpKl/FhX6INVTwC8nzDYLZcAU1Y=;
 h=Date:From:To:Cc:Subject:From;
 b=bpsFMPJ60MQtLACGbpOyZQnUtvSXtarJc1iumaQkKoENqgipOYxREylVeY6K+lCbN
 8bsaQ9ObuYAg511+ZVaVp+fsvejqUzNEXUvbfmK8iFXIh385ZKymYdzcq2IjiQkURG
 mv/LIEmqcvTL11ciwwJwY5DWOCRvqXlQVA1eSb8tprUOQYhApvm22W9ad5Shg9DKgu
 SqDa3RYgRVeVZGxWBxvHPwo/KrsYtDBEk52eOcAYhXBVvrFv3yOYRCchK/efMD6M9D
 2d+Nujeg0+iqwzMFCArfDYH0VKoSRyc39FZWZgveJNW1WaX+BvhFpRiMhZJrtbZ1zg
 Jcrsd9bdIsyAw==
Date: Wed, 26 Aug 2020 10:55:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20200826105547.4f6ea26d@canb.auug.org.au>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sidong Yang <realwakka@gmail.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/mixed; boundary="===============0401787652=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0401787652==
Content-Type: multipart/signed; boundary="Sig_/=t6fPzJwTXhrx0VBf9IFJv2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=t6fPzJwTXhrx0VBf9IFJv2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/qxl/qxl_display.c: In function 'qxl_display_read_client_mon=
itors_config':
include/drm/drm_modeset_lock.h:167:7: error: implicit declaration of functi=
on 'drm_drv_uses_atomic_modeset' [-Werror=3Dimplicit-function-declaration]
  167 |  if (!drm_drv_uses_atomic_modeset(dev))    \
      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/qxl/qxl_display.c:187:2: note: in expansion of macro 'DRM_M=
ODESET_LOCK_ALL_BEGIN'
  187 |  DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, DRM_MODESET_ACQUIRE_INTERRUPT=
IBLE, ret);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/qxl/qxl_display.c:189:35: error: macro "DRM_MODESET_LOCK_AL=
L_END" requires 3 arguments, but only 2 given
  189 |  DRM_MODESET_LOCK_ALL_END(ctx, ret);
      |                                   ^
In file included from include/drm/drm_crtc.h:36,
                 from include/drm/drm_atomic.h:31,
                 from drivers/gpu/drm/qxl/qxl_display.c:29:
include/drm/drm_modeset_lock.h:194: note: macro "DRM_MODESET_LOCK_ALL_END" =
defined here
  194 | #define DRM_MODESET_LOCK_ALL_END(dev, ctx, ret)    \
      |=20
drivers/gpu/drm/qxl/qxl_display.c:189:2: error: 'DRM_MODESET_LOCK_ALL_END' =
undeclared (first use in this function)
  189 |  DRM_MODESET_LOCK_ALL_END(ctx, ret);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/qxl/qxl_display.c:189:2: note: each undeclared identifier i=
s reported only once for each function it appears in
drivers/gpu/drm/qxl/qxl_display.c:187:2: error: label 'modeset_lock_fail' u=
sed but not defined
  187 |  DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, DRM_MODESET_ACQUIRE_INTERRUPT=
IBLE, ret);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from include/drm/drm_crtc.h:36,
                 from include/drm/drm_atomic.h:31,
                 from drivers/gpu/drm/qxl/qxl_display.c:29:
include/drm/drm_modeset_lock.h:170:1: warning: label 'modeset_lock_retry' d=
efined but not used [-Wunused-label]
  170 | modeset_lock_retry:       \
      | ^~~~~~~~~~~~~~~~~~
drivers/gpu/drm/qxl/qxl_display.c:187:2: note: in expansion of macro 'DRM_M=
ODESET_LOCK_ALL_BEGIN'
  187 |  DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, DRM_MODESET_ACQUIRE_INTERRUPT=
IBLE, ret);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/qxl/qxl_display.c: In function 'qxl_framebuffer_surface_dir=
ty':
drivers/gpu/drm/qxl/qxl_display.c:434:35: error: macro "DRM_MODESET_LOCK_AL=
L_END" requires 3 arguments, but only 2 given
  434 |  DRM_MODESET_LOCK_ALL_END(ctx, ret);
      |                                   ^
In file included from include/drm/drm_crtc.h:36,
                 from include/drm/drm_atomic.h:31,
                 from drivers/gpu/drm/qxl/qxl_display.c:29:
include/drm/drm_modeset_lock.h:194: note: macro "DRM_MODESET_LOCK_ALL_END" =
defined here
  194 | #define DRM_MODESET_LOCK_ALL_END(dev, ctx, ret)    \
      |=20
drivers/gpu/drm/qxl/qxl_display.c:434:2: error: 'DRM_MODESET_LOCK_ALL_END' =
undeclared (first use in this function)
  434 |  DRM_MODESET_LOCK_ALL_END(ctx, ret);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/qxl/qxl_display.c:411:2: error: label 'modeset_lock_fail' u=
sed but not defined
  411 |  DRM_MODESET_LOCK_ALL_BEGIN(fb->dev, ctx, DRM_MODESET_ACQUIRE_INTER=
RUPTIBLE, ret);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from include/drm/drm_crtc.h:36,
                 from include/drm/drm_atomic.h:31,
                 from drivers/gpu/drm/qxl/qxl_display.c:29:
include/drm/drm_modeset_lock.h:170:1: warning: label 'modeset_lock_retry' d=
efined but not used [-Wunused-label]
  170 | modeset_lock_retry:       \
      | ^~~~~~~~~~~~~~~~~~
drivers/gpu/drm/qxl/qxl_display.c:411:2: note: in expansion of macro 'DRM_M=
ODESET_LOCK_ALL_BEGIN'
  411 |  DRM_MODESET_LOCK_ALL_BEGIN(fb->dev, ctx, DRM_MODESET_ACQUIRE_INTER=
RUPTIBLE, ret);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  bbaac1354cc9 ("drm/qxl: Replace deprecated function in qxl_display")

interacting with commit

  77ef38574beb ("drm/modeset-lock: Take the modeset BKL for legacy drivers")

from the drm-misc-fixes tree.

drivers/gpu/drm/qxl/qxl_display.c manages to include
drm/drm_modeset_lock.h by some indirect route, but fails to have
drm/drm_drv.h similarly included.  In fact, drm/drm_modeset_lock.h should
have included drm/drm_drv.h since it uses things declared there, and
drivers/gpu/drm/qxl/qxl_display.c should include drm/drm_modeset_lock.h
similarly.

I have added the following hack patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 26 Aug 2020 10:40:18 +1000
Subject: [PATCH] fix interaction with drm-misc-fix commit

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/qxl/qxl_display.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_di=
splay.c
index fa79688013b7..6063f3a15329 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -26,6 +26,7 @@
 #include <linux/crc32.h>
 #include <linux/delay.h>
=20
+#include <drm/drm_drv.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -186,7 +187,7 @@ void qxl_display_read_client_monitors_config(struct qxl=
_device *qdev)
=20
 	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE, r=
et);
 	qxl_update_offset_props(qdev);
-	DRM_MODESET_LOCK_ALL_END(ctx, ret);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 	if (!drm_helper_hpd_irq_event(dev)) {
 		/* notify that the monitor configuration changed, to
 		   adjust at the arbitrary resolution */
@@ -431,7 +432,7 @@ static int qxl_framebuffer_surface_dirty(struct drm_fra=
mebuffer *fb,
 			  clips, num_clips, inc, 0);
=20
 out_lock_end:
-	DRM_MODESET_LOCK_ALL_END(ctx, ret);
+	DRM_MODESET_LOCK_ALL_END(fb->dev, ctx, ret);
=20
 	return 0;
 }
--=20
2.28.0

--=20
Cheers,
Stephen Rothwell

--Sig_/=t6fPzJwTXhrx0VBf9IFJv2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9FsxMACgkQAVBC80lX
0GwUiAf/VXvo+XA2ZBKhDrKTbyDJzIg5LziJNHZxevxS8R3ZifhABsFNxhzTaEEx
H/VO6kLeXk0hrXryvT/5vZVfWEYvxU967IDJUMa+XmY8GuXzzUJurF1h7wN9UJOq
B2DHvAQsyG/JLFvZDTWd6ZTv+cGcetSBcCLhlb7ShfDzyOWU8mePuTREXo7htzrC
X+gFiDijD/vf5X5L+rCXSK3bzT+jzP7h2BvGLiqVwm1avOWDHjmUyAfWIcrgbdbl
Mh8KDWB7xDiZgUkMu/Z7OTvAhp9j+kFHd+/jZIrw3qieAGrnrK7QSAS85BSATMwq
YvWGtyH5uF0rPvrG2A1+As/qiN3KlQ==
=K0X/
-----END PGP SIGNATURE-----

--Sig_/=t6fPzJwTXhrx0VBf9IFJv2--

--===============0401787652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0401787652==--
