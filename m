Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7369C3653
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 03:04:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD29110E112;
	Mon, 11 Nov 2024 02:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="srGkHYti";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35AF10E112
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 02:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1731290687;
 bh=Id+OPwn5s7JPd6OOP4WALIDODrSX11BclR0Trmi6WmI=;
 h=Date:From:To:Cc:Subject:From;
 b=srGkHYtim/0P4doqrpzQ0d2/vbc4jD4Nt8kCH7lad4lhCJCpg0Zu+4Ym6Sf1jcSBw
 TGxsBixH9npgeKrpkZ0Q/+coFl5FSufkVxvgnW1SNV4Ayse2aGj5kZC1J9eG2AoVRo
 VTkvJ4wYWAHE7p8ony6G5KjrJkgUSlTiWUy+/GuhkVMsrdhIqZwhlmsRagDhuA5XrY
 Pp6F3O2HWz7VXFnPo4wLbR92Ihsn7URF/oGUx5VS9Kwut9T+Ss3FSdG+yBtCs0AUhu
 D2b67qDTjoDpT43nXNKHAlIhe4Z/wajZ0UeZOGBDhSoCCE5D3x+VOAO25tRVKkGpVR
 6KGf59RwXqe7Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XmtCf3XBkz4w2H;
 Mon, 11 Nov 2024 13:04:46 +1100 (AEDT)
Date: Mon, 11 Nov 2024 13:04:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: DRI <dri-devel@lists.freedesktop.org>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20241111130448.6b5a7655@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/c81ol/c1.QUz8erL5xuYPon";
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

--Sig_/c81ol/c1.QUz8erL5xuYPon
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/xe/xe_gt_ccs_mode.c

between commit:

  7fd3fa006fa5 ("drm/xe: Set mask bits for CCS_MODE register")

from Linus' tree and commit:

  a851edc457ed ("drm/xe/ccs_mode: Convert register access to use xe_mmio")

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

diff --cc drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index ffcbd05671fc,9360ac4de489..000000000000
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@@ -68,13 -68,7 +68,13 @@@ static void __xe_gt_apply_ccs_mode(stru
  		}
  	}
 =20
 +	/*
 +	 * Mask bits need to be set for the register. Though only Xe2+
 +	 * platforms require setting of mask bits, it won't harm for older
 +	 * platforms as these bits are unused there.
 +	 */
 +	mode |=3D CCS_MODE_CSLICE_0_3_MASK << 16;
- 	xe_mmio_write32(gt, CCS_MODE, mode);
+ 	xe_mmio_write32(&gt->mmio, CCS_MODE, mode);
 =20
  	xe_gt_dbg(gt, "CCS_MODE=3D%x config:%08x, num_engines:%d, num_slices:%d\=
n",
  		  mode, config, num_engines, num_slices);

--Sig_/c81ol/c1.QUz8erL5xuYPon
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcxZkAACgkQAVBC80lX
0GzMQAf/X2r0tk0IEKG++uA0oe2QRU20Bky1KzFpyv7hwlScOdVEYAzHzdfMmeIf
+y1SIfAvDjR4lVks4Az/EvyWmlJOqBAuQelxzv5P3H4FztestuyTcob0x9/2em0F
PEbPBt+X934btkmJVY42M3V9asaiOaKEKVPI2SrHrRn2I0GNdu3vcI6RpiTmKxCf
70VbGLju6QCnwlYPUZoA187h7woZzYPNEctp4y6vfmOH0//Sx/WkfAuW6UOpNHZ3
EAmWc9SGvCAkeFyfXQMj1RMNIwRd56LJk9JT2KYaICX71CEmEUMC19XlCvjILjNH
W3lnzLNI/KFkHLP6ISwmU1TrNUkYqQ==
=wiZW
-----END PGP SIGNATURE-----

--Sig_/c81ol/c1.QUz8erL5xuYPon--
