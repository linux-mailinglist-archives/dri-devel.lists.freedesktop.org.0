Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA3D38BB77
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 03:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DE96E466;
	Fri, 21 May 2021 01:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4DA6E463;
 Fri, 21 May 2021 01:20:16 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FmTLQ2qMxz9sWl;
 Fri, 21 May 2021 11:20:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1621560014;
 bh=MnxSzSE5uzgMvgSTQKJkCe/Jdj5UFiYpk9Dz0cH+S28=;
 h=Date:From:To:Cc:Subject:From;
 b=GsBB9ji4GXJ9Hs5Vjfs8EmC5OYHwwr58hstuEub83fhPs2nleWgXpAFLZby0Ppp64
 gmeP5DltwZ9Zm3VmG4z1bIHPQS0pVIaG7IgGUWg6XkI5tv7ZpwttzhxVyyzQL2fp/i
 viGl8M5RODGGdHNtB7hyMP8RQsAeDwGkri97vxyc34/Cs1SN6HXkwradaG33IXlc/x
 m2KYckj1niWIjDsFBuwbgtR6uFj4DCo1QbKl5KpCQTojmsFtjke2FXiALolByipgXR
 DWm4snbk37p1ximKGRIOVLguXsyYrSdEtZDlUu1m2Egyx3Q1FFtvoFnVSYuCCxr+P/
 FOD92izmI85zQ==
Date: Fri, 21 May 2021 11:20:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the amdgpu tree with the drm-misc tree
Message-ID: <20210521112013.1f10e61f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nglW1/rJqHeC2FSoBdtO2gF";
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/nglW1/rJqHeC2FSoBdtO2gF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c

between commit:

  f89f8c6bafd0 ("drm/amdgpu: Guard against write accesses after device remo=
val")

from the drm-misc tree and commit:

  0ccc3ccf5b3a ("drm/amdgpu: re-apply "use the new cursor in the VM code" v=
2")

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

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 90c34491f85d,57a6ad04118c..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@@ -1594,23 -1618,21 +1620,24 @@@ static int amdgpu_vm_update_ptes(struc
   * Returns:
   * 0 for success, -EINVAL for failure.
   */
- static int amdgpu_vm_bo_update_mapping(struct amdgpu_device *adev,
- 				       struct amdgpu_device *bo_adev,
- 				       struct amdgpu_vm *vm, bool immediate,
- 				       bool unlocked, struct dma_resv *resv,
- 				       uint64_t start, uint64_t last,
- 				       uint64_t flags, uint64_t offset,
- 				       struct drm_mm_node *nodes,
- 				       dma_addr_t *pages_addr,
- 				       struct dma_fence **fence)
+ int amdgpu_vm_bo_update_mapping(struct amdgpu_device *adev,
+ 				struct amdgpu_device *bo_adev,
+ 				struct amdgpu_vm *vm, bool immediate,
+ 				bool unlocked, struct dma_resv *resv,
+ 				uint64_t start, uint64_t last,
+ 				uint64_t flags, uint64_t offset,
+ 				struct ttm_resource *res,
+ 				dma_addr_t *pages_addr,
+ 				struct dma_fence **fence,
+ 				bool *table_freed)
  {
  	struct amdgpu_vm_update_params params;
+ 	struct amdgpu_res_cursor cursor;
  	enum amdgpu_sync_mode sync_mode;
- 	uint64_t pfn;
 -	int r;
 +	int r, idx;
 +
 +	if (!drm_dev_enter(&adev->ddev, &idx))
 +		return -ENODEV;
 =20
  	memset(&params, 0, sizeof(params));
  	params.adev =3D adev;
@@@ -1717,9 -1722,11 +1727,12 @@@
 =20
  	r =3D vm->update_funcs->commit(&params, fence);
 =20
+ 	if (table_freed)
+ 		*table_freed =3D params.table_freed;
+=20
  error_unlock:
  	amdgpu_vm_eviction_unlock(vm);
 +	drm_dev_exit(idx);
  	return r;
  }
 =20

--Sig_/nglW1/rJqHeC2FSoBdtO2gF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCnCs0ACgkQAVBC80lX
0GzVZwf/Y3NFPIHY8jz3M+QIuKffIjL0IMt/Oo6mTxvpzMv3Rkn0T0xjwz1dAeSp
YyKuLx/x/9HixXpK61Ya4ua+b1YORFOUMXjRTGt+Wgl+eDEaZF9Pwe/edlKqVwDp
Zs2OIvbRJCJz4pqXUKUan/LIUgKKIb9FXK0iGfvP3xLGQMrpj/mdSM/3+KHLeS45
vcKPLQ/C62bWEw4lBL32x8ygQcLEb3NqsKkHIePVjV+CM27eBz4ybs4N4niWogf1
HYW7/Mbgx+xDo5/uKAUnxnIbsBy7+R/vfMk/pJKz0V2xzxgXjL+QY3VEorzq1fgx
hWOZrzqqcmUsRkoYKgQKy2G6kXXxfw==
=wrkb
-----END PGP SIGNATURE-----

--Sig_/nglW1/rJqHeC2FSoBdtO2gF--
