Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C84FC34C1E0
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 04:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB4F6E123;
	Mon, 29 Mar 2021 02:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DB46E123
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 02:14:06 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F7x2z4SZnz9sVw;
 Mon, 29 Mar 2021 13:14:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1616984044;
 bh=k9kCaTFSgKm9tQfT1MUAvppABz0an6Oi0rH94pjamiI=;
 h=Date:From:To:Cc:Subject:From;
 b=e276cr5qjXA0c5ua2WQptS3A/LM1/RIIee8HExUKua5b4/5qcrHxazaWH2xSDtRbp
 J8xVr13wVSFG2W5nEEvFDCuef8o9beM8sCAK0ZUrqODYyNd7q8qIvG0CIcYdvoQwRy
 jcyVKfe4fVqg2uzs5uvu+sGdIB1moRqSUY5BSiRNB8EiuaJFThpkpgz+P4CZaAbgpE
 i52wiQLa4m2spLGhCg82cuNdzcz/Xezbt66WRaVU/ZK+K7BBB1oPKHblworrwrKR87
 +CVCtYhFJCXvQg68ENM2wRVjR7bU8bcK7u+/cFk6sA10ENnaqjOuWlj/0lx/pC4fAI
 xuMrJwBjHMCGQ==
Date: Mon, 29 Mar 2021 13:14:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20210329131401.15724766@canb.auug.org.au>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 shaoyunl <shaoyun.liu@amd.com>
Content-Type: multipart/mixed; boundary="===============1999954314=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1999954314==
Content-Type: multipart/signed; boundary="Sig_/g_NQGzQ9qT.S6dVnkopD=ch";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/g_NQGzQ9qT.S6dVnkopD=ch
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c

between commits:

  9adb125dde69 ("drm/amdgpu: re-enable suspend phase 2 for S0ix")
  4021229e32bd ("drm/amdgpu/swsmu: skip gfx cgpg on s0ix suspend")
  9bb735abcbd8 ("drm/amdgpu: update comments about s0ix suspend/resume")

from Linus' tree and commit:

  e3c1b0712fdb ("drm/amdgpu: Reset the devices in the XGMI hive duirng prob=
e")

from the drm tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 8a5a8ff5d362,0f82c5d21237..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@@ -2743,16 -2712,15 +2720,25 @@@ static int amdgpu_device_ip_suspend_pha
  			continue;
  		}
 =20
 +		/* skip suspend of gfx and psp for S0ix
 +		 * gfx is in gfxoff state, so on resume it will exit gfxoff just
 +		 * like at runtime. PSP is also part of the always on hardware
 +		 * so no need to suspend it.
 +		 */
 +		if (adev->in_s0ix &&
 +		    (adev->ip_blocks[i].version->type =3D=3D AMD_IP_BLOCK_TYPE_PSP ||
 +		     adev->ip_blocks[i].version->type =3D=3D AMD_IP_BLOCK_TYPE_GFX))
 +			continue;
 +
+ 		/* skip unnecessary suspend if we do not initialize them yet */
+ 		if (adev->gmc.xgmi.pending_reset &&
+ 		    !(adev->ip_blocks[i].version->type =3D=3D AMD_IP_BLOCK_TYPE_GMC ||
+ 		      adev->ip_blocks[i].version->type =3D=3D AMD_IP_BLOCK_TYPE_SMC ||
+ 		      adev->ip_blocks[i].version->type =3D=3D AMD_IP_BLOCK_TYPE_COMMON =
||
+ 		      adev->ip_blocks[i].version->type =3D=3D AMD_IP_BLOCK_TYPE_IH)) {
+ 			adev->ip_blocks[i].status.hw =3D false;
+ 			continue;
+ 		}
  		/* XXX handle errors */
  		r =3D adev->ip_blocks[i].version->funcs->suspend(adev);
  		/* XXX handle errors */

--Sig_/g_NQGzQ9qT.S6dVnkopD=ch
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBhN+kACgkQAVBC80lX
0GyIHwf/WDrD2AvhZk2+xd2OuiACRlE6HXHMppYBDQyq7alR4iWQDeunMCdWjBzX
0QzyE03CWLgiZkJu/RfNkrYej0oNilYuI+zVCuNfb6yAZjfbjg/7oDbI1GaV/aEh
+1RmtZehAyfFG/qWNllHTBpl8cv/RaVeotbLrOwNzToZbVj7hmwSn4JlpEQ/QxB7
AxvlCb73O3aCtFFcE5xJDjiaU0w4Bc0emgmC3dt3biOX0K+2M4FHGQqBJn9W2ro8
bzlYEFxz4Fps2fs+hMRWSPs09pbBak4PfFMD9+S7qcWsszywYj8wLX6NuiA+jTfk
dfE3mOW7Li0ybRZX17B/4gQtfNIRWg==
=7sDt
-----END PGP SIGNATURE-----

--Sig_/g_NQGzQ9qT.S6dVnkopD=ch--

--===============1999954314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1999954314==--
