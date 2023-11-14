Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6D57EA773
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 01:25:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4984810E3A3;
	Tue, 14 Nov 2023 00:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A72110E3A3;
 Tue, 14 Nov 2023 00:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1699921507;
 bh=0OLCvVOkYstpdcz9x3Fniksg/NrhBMGEfgtUuBgeYaU=;
 h=Date:From:To:Cc:Subject:From;
 b=ZgFK4Z5xVWHQiwE9Oh0UIAxGoBI5/cW9TvTJoBUCYs4y/QxMuemzRn2O2B8ePGiDS
 AU/8q2L9iSAf+kDi6U3j7dLuQzAhzD0UCEq8x33MOc8Jahe8dOgs1+2zcy8Z8l1Mrg
 dhWivIpdxLehYAdu0o1PgxrEkm5hzrrxjGlsLscU0nBjZJSX0yEa2mJK/hnOGA6bWH
 xluDfos+akAfuQaw3UlWyrDKtcbRGlUcUnKiH2gQHYYk/n0cqqQIs7iLLZo9zmdTsY
 PERkah7OjrnSS7zPnjVziouwRT78MLvlLVSX7WhRW9UKRKfWs/Q5qQFhqRxbOEn6iy
 Kku4rkXUKDmrg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4STnBB2v1Zz4xQZ;
 Tue, 14 Nov 2023 11:25:05 +1100 (AEDT)
Date: Tue, 14 Nov 2023 11:25:03 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20231114112503.6e098829@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iPB_Kq5N=avBmm1/F4ReNpJ";
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/iPB_Kq5N=avBmm1/F4ReNpJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/accel/ivpu/ivpu_drv.c

between commit:

  828d63042aec ("accel/ivpu: Don't enter d0i3 during FLR")

from Linus' tree and commit:

  57c7e3e4800a ("accel/ivpu: Stop job_done_thread on suspend")

from the drm-misc tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/accel/ivpu/ivpu_drv.c
index 790603017653,51fa60b6254c..000000000000
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@@ -389,13 -390,7 +388,14 @@@ void ivpu_prepare_for_reset(struct ivpu
  	disable_irq(vdev->irq);
  	ivpu_ipc_disable(vdev);
  	ivpu_mmu_disable(vdev);
+ 	ivpu_job_done_thread_disable(vdev);
 +}
 +
 +int ivpu_shutdown(struct ivpu_device *vdev)
 +{
 +	int ret;
 +
 +	ivpu_prepare_for_reset(vdev);
 =20
  	ret =3D ivpu_hw_power_down(vdev);
  	if (ret)

--Sig_/iPB_Kq5N=avBmm1/F4ReNpJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVSvmAACgkQAVBC80lX
0GxgaAgAgYZvkvJS8o3jOn8Cpzr1F+VAS8lx2oXk0Jfhzft4Y5rEgscfl8ja8Hu2
uJ9n6rtqsFNd1q6AEikjBcoAn0rzrQ7RJp9MKB/xbtMPi1DBDlYcGIh7YMJVH9i1
OWCmz0hcWtlsfi7OUY4zX2wKUEwBr/1PGloRcXJyOklUvm1qP2ES20B+EVi2MDru
QBKNyxQeP30wZfQ9YqmkOs6WEqAUlM/0SBMfnb18yCkaQi94b/vFglBoCXqd1uwF
QZAUa2c8bfQd67s0BesSvKwIEUIh46L9Jo6Z58tom9ZvWllZZU8YMKJbd2Yedd1M
lDaPNkBKsRmOBuDcdwHI7Fu6kWz/kw==
=3A1u
-----END PGP SIGNATURE-----

--Sig_/iPB_Kq5N=avBmm1/F4ReNpJ--
