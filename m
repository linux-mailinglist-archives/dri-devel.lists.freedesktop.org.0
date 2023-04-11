Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3B26DD109
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 06:38:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B27910E480;
	Tue, 11 Apr 2023 04:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F9D10E480
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 04:38:19 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PwY4P6hPMz4xDh;
 Tue, 11 Apr 2023 14:38:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1681187894;
 bh=WdSzwCZdNIk1Z37Sc1D9XVh7arO8HT97XygbtDMgy60=;
 h=Date:From:To:Cc:Subject:From;
 b=uYMLANMPITzNsdWvDMXmJCKRGFyxfTh+fPL8h3ELKKWRo8qmYu4DXxXvLiVrZYlCp
 y+MgWLG9pF1pcR/KBJbabELnZpxroDlL0qcfz3k0occz9hs7tQqKFHiXfmmNFfo92+
 zrZRIglKt1HsDpcmwJq4rCLvcG9fE8xiYYO7ERYvolZDDbeNnhosjqBg/LIDXP8N3A
 7kfHSYlzXGMqa5ppxGFIMRbUo2ZNf8Pzx3tTaC0wyIh4w6zVxlLBu4XQotVasQmvGE
 XP9PsvpiUlk1Mc5kyayn6qQBYwZmLdnRys4FPN/48lUFGevLJcz+WmNZVdSl9TWXu8
 kR9twwQnskM4A==
Date: Tue, 11 Apr 2023 14:38:12 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Dave Airlie <airlied@redhat.com>
Subject: linux-next: build failure after merge of the driver-core tree
Message-ID: <20230411143812.11a4b00d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RN2rq.fb+YeY=+.0XxKESjO";
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/RN2rq.fb+YeY=+.0XxKESjO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the driver-core tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/linkage.h:7,
                 from include/linux/kernel.h:17,
                 from drivers/accel/qaic/mhi_qaic_ctrl.c:4:
drivers/accel/qaic/mhi_qaic_ctrl.c: In function 'mhi_qaic_ctrl_init':
include/linux/export.h:27:22: error: passing argument 1 of 'class_create' f=
rom incompatible pointer type [-Werror=3Dincompatible-pointer-types]
   27 | #define THIS_MODULE (&__this_module)
      |                     ~^~~~~~~~~~~~~~~
      |                      |
      |                      struct module *
drivers/accel/qaic/mhi_qaic_ctrl.c:544:38: note: in expansion of macro 'THI=
S_MODULE'
  544 |         mqc_dev_class =3D class_create(THIS_MODULE, MHI_QAIC_CTRL_D=
RIVER_NAME);
      |                                      ^~~~~~~~~~~
In file included from include/linux/device.h:31,
                 from include/linux/mhi.h:9,
                 from drivers/accel/qaic/mhi_qaic_ctrl.c:5:
include/linux/device/class.h:229:54: note: expected 'const char *' but argu=
ment is of type 'struct module *'
  229 | struct class * __must_check class_create(const char *name);
      |                                          ~~~~~~~~~~~~^~~~
drivers/accel/qaic/mhi_qaic_ctrl.c:544:25: error: too many arguments to fun=
ction 'class_create'
  544 |         mqc_dev_class =3D class_create(THIS_MODULE, MHI_QAIC_CTRL_D=
RIVER_NAME);
      |                         ^~~~~~~~~~~~
include/linux/device/class.h:229:29: note: declared here
  229 | struct class * __must_check class_create(const char *name);
      |                             ^~~~~~~~~~~~

Caused by commit

  1aaba11da9aa ("driver core: class: remove module * from class_create()")

interacting with commit

  566fc96198b4 ("accel/qaic: Add mhi_qaic_cntl")

from the drm tree.

I have applied the following merge fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 11 Apr 2023 14:16:57 +1000
Subject: [PATCH] fixup for "driver core: class: remove module * from class_=
create()"

interacting with "accel/qaic: Add mhi_qaic_cntl"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/accel/qaic/mhi_qaic_ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/mhi_qaic_ctrl.c b/drivers/accel/qaic/mhi_qa=
ic_ctrl.c
index 0c7e571f1f12..96db1580c72d 100644
--- a/drivers/accel/qaic/mhi_qaic_ctrl.c
+++ b/drivers/accel/qaic/mhi_qaic_ctrl.c
@@ -541,7 +541,7 @@ int mhi_qaic_ctrl_init(void)
 		return ret;
=20
 	mqc_dev_major =3D ret;
-	mqc_dev_class =3D class_create(THIS_MODULE, MHI_QAIC_CTRL_DRIVER_NAME);
+	mqc_dev_class =3D class_create(MHI_QAIC_CTRL_DRIVER_NAME);
 	if (IS_ERR(mqc_dev_class)) {
 		ret =3D PTR_ERR(mqc_dev_class);
 		goto unregister_chrdev;
--=20
2.39.2

--=20
Cheers,
Stephen Rothwell

--Sig_/RN2rq.fb+YeY=+.0XxKESjO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmQ05DUACgkQAVBC80lX
0Gzfawf/V6Ir//QkheAAJFTEKt7tmcD6f3dmgoe6LYBfJMDotCoLMV41HiUwuHwn
R78oYX30+Progok1U7tY6mM0nOelwknl7DuGpmZOg7ldLsmzMDRd7wNFvQsW22t/
zSH96sNga0vEZZ1FEdtZEnAsfMZ1aYHW/NgOYYpP4sKDenYkGCIOFmm5xdBwzwr9
F/3AJVl3Fy97P3OCfm+fH2OR7wuvOBuf9U8n0pxlwjorV1jeBlajn0NeJaC10Vr/
UU6XzoZnL+06GbJGW4/sdlib9lLoQYQhN5HPxaWLwU8ehxLWSezJo5F9fPy2s9w8
BZ71ZMWxuwGu1xmxFUMVs3lfsrKfsw==
=10Kj
-----END PGP SIGNATURE-----

--Sig_/RN2rq.fb+YeY=+.0XxKESjO--
