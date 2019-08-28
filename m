Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1E19FD8B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DBA89487;
	Wed, 28 Aug 2019 08:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4990089483;
 Wed, 28 Aug 2019 08:55:29 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46JKMJ5Txkz9sNp;
 Wed, 28 Aug 2019 18:55:24 +1000 (AEST)
Date: Wed, 28 Aug 2019 18:55:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20190828185516.22b03da8@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1566982525;
 bh=uHfZSqpM9d5GmZPwHwbJ/ALaDsqk/uyw9kZHkl+R9NE=;
 h=Date:From:To:Cc:Subject:From;
 b=I7/yD7DH7aaydjm2wxLZr4OBwHvpk84eM0V2tmBzHdYVPOlqOrGmr3Q+jUAd4ZXPA
 FE347BnBhMs4N5Nhf0ngbcP9ClAXbqLevO5Z00AQUDHipyUtkAJHGKDH9mnxn4ly4A
 0Hoe4mowNqHA+XHsqW+9DZg660LpvFNpBMxWsOFKqhPNRxy1xgLar8ZRTq3bD9rVaC
 EI3KcN9F13n6ZLK5PcKmkDJfHUep8Ac8eC8btSYJVXCaTSMqQ4jUoAZRohY/fRNzrB
 YuU7aZ6FrJRpX1Aup0r7SJDw3RWPRzvyyqrIXIErez1MiXRAtBz9+V5N3kARzTnnw2
 VhTPQfwaTLRwQ==
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
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/mixed; boundary="===============1726200386=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1726200386==
Content-Type: multipart/signed; boundary="Sig_/vl+g_4dHxCiacR0wR8Sx6nD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vl+g_4dHxCiacR0wR8Sx6nD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/gpu/drm/virtio/virtgpu_object.c:31:67: error: expected ')' before '=
int'
 module_param_named(virglhack, virtio_gpu_virglrenderer_workaround, int, 04=
00);
                                                                   ^~~~
                                                                   )

Caused by commit

  3e93bc2a58aa ("drm/virtio: make resource id workaround runtime switchable=
.")

I applied the following fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 28 Aug 2019 18:37:40 +1000
Subject: [PATCH] drm/virtio: module_param_named() requires linux/modulepara=
m.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virt=
io/virtgpu_object.c
index aab5534056ec..b5f8923ac674 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -23,6 +23,8 @@
  * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  */
=20
+#include <linux/moduleparam.h>
+
 #include <drm/ttm/ttm_execbuf_util.h>
=20
 #include "virtgpu_drv.h"
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/vl+g_4dHxCiacR0wR8Sx6nD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1mQXQACgkQAVBC80lX
0GwORQf6AlHwThxv6cZcRGeDgqyf3lCCR2mfKYONLAp2GmjLFjkS3TaAri5ltvPT
97svBbPdH8yu86Kw8PowHBXS8BUV1CxmrgfSrmZHUjBerrTi+wlIduVFP7Q8tzry
haUQ6gaVphSvChG0OCAB6TsJZlnmHtJy5VZSRH5mZ4Opsn0HYGaa0RcV5dWqQM1z
cpOpsz7Hbyf1DQC4TQ6Y5+CLD1sj4MNe9gh8N4blAlN6Kv7HoLMEMSZCUPUxSlkV
Z9bLuzSnHv+EB77v0H3UO9x3OOR7g1KYc6GmVJyOXk0QQC9o/yery3tYscE2lobC
tF82e/0NcWBt1banOVbXJQCqWDFFjg==
=/Jl+
-----END PGP SIGNATURE-----

--Sig_/vl+g_4dHxCiacR0wR8Sx6nD--

--===============1726200386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1726200386==--
