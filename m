Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CCF169AF9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 00:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4486E03C;
	Sun, 23 Feb 2020 23:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3016E6E03C
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2020 23:38:21 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48QhTK2MHWz9sPK;
 Mon, 24 Feb 2020 10:38:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1582501098;
 bh=Yq+U2+OV7jbRAuCHl+F+0GVlXi1B9ySL65WiNoIKVFc=;
 h=Date:From:To:Cc:Subject:From;
 b=hybumsL/5KArw/L4lAg/knFB3+T/hPG5zCV5yisKcj0OH6PDJqHZxDIUl+Zr/3bm1
 gqw4nwbRXubICzgjv8NfcmmDE6MRPrpi5Yyum+fI/z0oVeDqjjOnYMvSgsPtlfttTT
 flz3V5ds8acuRARED6ZNBRmH7DcsJPV6dD4dRurdKugZKdhThj+0JPdnqcUdm2Mpa7
 ySl9JY44xsCMMouEuqD2cELlz32H7wu0fNFM9TElVLlzWimJMSer2g3ivB3PuPyd/E
 gzhW8iR0S29tqlCpC359Ivbpub4vcO8QMZwHcmB6uxjQZHbANIMSmb15Y8HwjqfNcJ
 rY+uTIzHYfZbw==
Date: Mon, 24 Feb 2020 10:38:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@linux.ie>,
 DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the amdgpu tree with the drm tree
Message-ID: <20200224103812.017657a3@canb.auug.org.au>
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
Cc: Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1781265045=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1781265045==
Content-Type: multipart/signed; boundary="Sig_/yGuS3+67JTCIx4QWNVhlbGu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yGuS3+67JTCIx4QWNVhlbGu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got conflicts in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c

between commit:

  5e791166d377 ("drm/ttm: nuke invalidate_caches callback")

from the drm tree and commit:

  58e6933fa53e ("drm/amdgpu/ttm: move debugfs init into core amdgpu debugfs=
")

from the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 3ab46d4647e4,660867cf2597..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@@ -66,9 -68,11 +68,6 @@@ static int amdgpu_map_buffer(struct ttm
  			     struct amdgpu_ring *ring,
  			     uint64_t *addr);
 =20
- static int amdgpu_ttm_debugfs_init(struct amdgpu_device *adev);
- static void amdgpu_ttm_debugfs_fini(struct amdgpu_device *adev);
 -static int amdgpu_invalidate_caches(struct ttm_bo_device *bdev, uint32_t =
flags)
 -{
 -	return 0;
 -}
--
  /**
   * amdgpu_init_mem_type - Initialize a memory manager for a specific type=
 of
   * memory request.

--Sig_/yGuS3+67JTCIx4QWNVhlbGu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5TDOQACgkQAVBC80lX
0GwoHAf7Baph4dkZitGT+gcCnOblCteMTYT6mixpfWu4upUAGfF7QZrqkVrXc2HI
RrjXC23mezv8iS8o6N3CO9ZGSDkWyHTOhRsDpk5cPZYVX5dJ/Hg89tKe1uphOd41
wimjTJ4UmhqkQG84pNuoUGVxtW6Z3vaPvgxcYmOTEIoviewiCnRBtCnPQlOMdCi9
tddKAs/DclUQXN/w+y23sXiyvzD9Ebdyhd6xOV1DPwHcvQtFI+u4gd+AykrNDxWT
KuO5sHSJTd8/II6bosR+cKu/TVRSEMx6a1QrN+uI8g38FeDThD48aCxRWxjzC0BL
WiK7dn9PO0LXSxWV8qv39Zg5/CS2vw==
=NemJ
-----END PGP SIGNATURE-----

--Sig_/yGuS3+67JTCIx4QWNVhlbGu--

--===============1781265045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1781265045==--
