Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 757DE67480D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 01:33:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84DD610E0BE;
	Fri, 20 Jan 2023 00:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B3310E0BE;
 Fri, 20 Jan 2023 00:32:54 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NygSb66w1z4xGM;
 Fri, 20 Jan 2023 11:32:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1674174769;
 bh=iozW0jdRdMl3BAmRM1JsaFrEz8h8JaFEk5HzgDL0ZGw=;
 h=Date:From:To:Cc:Subject:From;
 b=tEQK60aFpxxXeqmUdoO6X/YeFIU+epTWoi6S4ldcIob6W/gf8cgVvQlhd6f6YTjLM
 44nZEwPZXrcMagiBSbNHtT3P3UXh2o7BSD2VzubO1tPdqhK5U9QwbFiIwUejX19mTT
 ykA+P2pk+VrA6MxwMirb2ru4E3APNO4BsQTFRFwPYtUg9UQ5czHO8T4ZuOVKlU0Z1T
 lzziv0tOjttzIxm2ZdgEaDhPpcWcNwQakxtDYsExcCVLUbVExfkdkMznuXhTDJFwdZ
 jWZcYR0J45V+jPMvikRIe3PRXJDmQFMDc3jpYxOu7fk5RCf7Cs1BE4qXKiQG0rYRPb
 3NBnBEHeOorFg==
Date: Fri, 20 Jan 2023 11:32:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Oded Gabbay <ogabbay@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: linux-next: manual merge of the accel tree with the drm-misc tree
Message-ID: <20230120113246.1a0a03fe@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/18Al4johj.5KC9aGdnvp1uq";
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
Cc: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/18Al4johj.5KC9aGdnvp1uq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the accel tree got conflicts in:

  drivers/Makefile
  drivers/accel/Kconfig
  drivers/accel/Makefile

between commit:

  35b137630f08 ("accel/ivpu: Introduce a new DRM driver for Intel VPU")

from the drm-misc tree and commit:

  45886b6fa0f1 ("habanalabs: move driver to accel subsystem")

from the accel tree.

I fixed it up (I used the latter version of Makefile and see below) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/accel/Kconfig
index 4989376e5938,a5989b55178a..000000000000
--- a/drivers/accel/Kconfig
+++ b/drivers/accel/Kconfig
@@@ -23,4 -23,4 +23,5 @@@ menuconfig DRM_ACCE
  	  different device files, called accel/accel* (in /dev, sysfs
  	  and debugfs).
 =20
+ source "drivers/accel/habanalabs/Kconfig"
 +source "drivers/accel/ivpu/Kconfig"
diff --cc drivers/accel/Makefile
index b1036dbc0ba4,4df38885d6c6..000000000000
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@@ -1,3 -1,3 +1,4 @@@
  # SPDX-License-Identifier: GPL-2.0-only
 =20
 -obj-y  +=3D habanalabs/
++obj-y  +=3D habanalabs/
 +obj-y	+=3D ivpu/
=20

--Sig_/18Al4johj.5KC9aGdnvp1uq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmPJ4S4ACgkQAVBC80lX
0GxYSwgAgZni86ut0MB88HqGN9ejslVuEULW13EVl3Zn/QzUdQkF/ZoKhc5tU6ul
NuQe+KhlZ+YCd5VQ7aviQeuA+OV2JpNzDwlvFAKJ3XQuAzrCGe+9WW/v5TG3SzU3
hwdy2ax23/kSYhQeQt5aD6HwNP+faFLCpxOZ9Qu84A4SF/EhyEKZT3khVtNb49P+
Ipn5J9ucWv8TI9TqO0LLwrDmLTfrMPVUjXFmjV7HkYKAd2p28tmMCERyaLzuonlh
c0Bd9TmRjouXiD+a4a0lNQRJbo5FlHtPIOA54o1TXfI6KYzNgaLK7U3fINXxa4k/
lAzGAsco/Xn2cG+AsW7tFZncUDjJnA==
=qWkq
-----END PGP SIGNATURE-----

--Sig_/18Al4johj.5KC9aGdnvp1uq--
