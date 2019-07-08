Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DFF61A1F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 06:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04168999A;
	Mon,  8 Jul 2019 04:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE888999A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 04:48:53 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45htJL6Vn1z9s3l;
 Mon,  8 Jul 2019 14:48:50 +1000 (AEST)
Date: Mon, 8 Jul 2019 14:48:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>,
 Al Viro <viro@zeniv.linux.org.uk>
Subject: linux-next: build failure after merge of the drm tree
Message-ID: <20190708144849.63068ed2@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1562561331;
 bh=sKV2MToRVPaakGupotX9GjZxGEUaiI+80+PB1P1Id8o=;
 h=Date:From:To:Cc:Subject:From;
 b=K9K7Kx4d3w5xmV6ErfgHUYmakA8MLmEV/sMhChNyTlrn7TUEbaGnM7Z6CoX5OyZWU
 3dJ/GFQ30Z1Scm4UJuMoE5MCIN42v0szvFoVTbyUyVZBSXWjnGdiyFgPBiciAKQ0y1
 d+j7rcjyWtjVNSlw4bsbcdMCeqWVWL29FrXPaVTOu+u3osHBa8/fQGyCKK+BQtPgEf
 1AfxCm9/nb2STLiqWTYIWIMLe/0duG7jesPdzoEnek58WaLVIsQaff+6c2tliybei8
 MwRbKzwaCMHwNftqJRnFkADY1V0YFMLAexgKl6YYg1igcO5iblJ/+syXwcgyhd7rq6
 pIFHQxCKwF3wA==
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
Cc: Chenbo Feng <fengc@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Greg Hackmann <ghackmann@google.com>, David Howells <dhowells@redhat.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============2106758013=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2106758013==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6/BW6=Lwl+n4N/EV3VTcTF8"; protocol="application/pgp-signature"

--Sig_/6/BW6=Lwl+n4N/EV3VTcTF8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/dma-buf/dma-buf.c: In function 'dma_buf_fs_mount':
drivers/dma-buf/dma-buf.c:65:9: error: implicit declaration of function 'mo=
unt_pseudo'; did you mean 'mount_bdev'? [-Werror=3Dimplicit-function-declar=
ation]
  return mount_pseudo(fs_type, "dmabuf:", NULL, &dma_buf_dentry_ops,
         ^~~~~~~~~~~~
         mount_bdev
drivers/dma-buf/dma-buf.c:65:9: warning: returning 'int' from a function wi=
th return type 'struct dentry *' makes pointer from integer without a cast =
[-Wint-conversion]
  return mount_pseudo(fs_type, "dmabuf:", NULL, &dma_buf_dentry_ops,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    DMA_BUF_MAGIC);
    ~~~~~~~~~~~~~~

Caused by commit

  ed63bb1d1f84 ("dma-buf: give each buffer a full-fledged inode")

interacting with commit

  8d9e46d80777 ("fold mount_pseudo_xattr() into pseudo_fs_get_tree()")

from the vfs tree.

I have added the following merge fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 8 Jul 2019 14:36:53 +1000
Subject: [PATCH] dma-buf: convert to new mount api

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/dma-buf/dma-buf.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index dc4b2c521d79..e8587c5eedb7 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -24,6 +24,7 @@
 #include <linux/reservation.h>
 #include <linux/mm.h>
 #include <linux/mount.h>
+#include <linux/pseudo_fs.h>
=20
 #include <uapi/linux/dma-buf.h>
 #include <uapi/linux/magic.h>
@@ -59,16 +60,19 @@ static const struct dentry_operations dma_buf_dentry_op=
s =3D {
=20
 static struct vfsmount *dma_buf_mnt;
=20
-static struct dentry *dma_buf_fs_mount(struct file_system_type *fs_type,
-		int flags, const char *name, void *data)
+static int dma_buf_init_fs_context(struct fs_context *fc)
 {
-	return mount_pseudo(fs_type, "dmabuf:", NULL, &dma_buf_dentry_ops,
-			DMA_BUF_MAGIC);
+	struct pseudo_fs_context *ctx =3D init_pseudo(fc, DMA_BUF_MAGIC);
+
+	if (!ctx)
+		return -ENOMEM;
+	ctx->dops =3D &dma_buf_dentry_ops;
+	return 0;
 }
=20
 static struct file_system_type dma_buf_fs_type =3D {
 	.name =3D "dmabuf",
-	.mount =3D dma_buf_fs_mount,
+	.init_fs_context =3D dma_buf_init_fs_context,
 	.kill_sb =3D kill_anon_super,
 };
=20
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/6/BW6=Lwl+n4N/EV3VTcTF8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0iyzEACgkQAVBC80lX
0GyldQf/XCYQ6xaBle1bYjxxbqZJcOSFyRU/dmi8d8xCmRayn69ZUhD/5ggrEN+V
qtX/SJtSYw0zQMmbUefoq7zKSycKk7JMqX03IABRQP+tGCIm/DoGKoPC43dJkMSb
UGP8/yGNl+KmI3Z22l952pCtBYkzDiO7VyXVM+bqwJOfFwpJ/cnChMJH2RbGGc4F
K6xgTQWuPPqDuCgqc/N/orqWfGCcwTld8C89cBVdWCXZF+2RLSi6sdORFL1G/b0Y
ylwy1LbaCid/Hmz/g1Ry0c0024oPN9tr+vc84cV3kuc/cR9rLXU/vBgR8Jkc7nYn
qLaKv3jq4IarRck2BAKy9JXCazmhkg==
=6qMm
-----END PGP SIGNATURE-----

--Sig_/6/BW6=Lwl+n4N/EV3VTcTF8--

--===============2106758013==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2106758013==--
