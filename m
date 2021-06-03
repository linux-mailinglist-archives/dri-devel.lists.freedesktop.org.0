Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EB839982E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 04:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B68C96EF38;
	Thu,  3 Jun 2021 02:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04AC16EF31;
 Thu,  3 Jun 2021 02:48:54 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FwVhd4X4Dz9sPf;
 Thu,  3 Jun 2021 12:48:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1622688531;
 bh=xSLZDHrDrKxpk5ZtNpk55TJEoabwTu/1J5LjvK5s1ek=;
 h=Date:From:To:Cc:Subject:From;
 b=ksDH373YnNicstrzjVrgIeWBbmUjlWLgPI5tdeSo7Hq2BAvpHHstFlahBkdh6hvYe
 ydNO4G12THG7zcLA7SB1zXjHOtXEBIEiFzOpqpOrN+4J6c6HEwFUwo2XGpVClNryfY
 4eoim1GFxtJdtFMzhdUh5uBX9vzPgs9rSPA9qUwthQ1oWqkNVDmkJ4IuL0m5O54p3c
 b2A5XCFZLykewwOFO3VEgFLyckKEjDJTrySQQY8qnseDy2VNM3v6M5IgI34iqcEudK
 FwjgJt1AnN5URfP84nkNIhLpfsTTh33vdLheUzhYQ6aNMnaCUYUB/YRNrc1nXbB4g1
 QKexAv4j2lOtA==
Date: Thu, 3 Jun 2021 12:48:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the amdgpu tree with the drm-misc tree
Message-ID: <20210603124847.19a6dacf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CY2HkHUQ6d9_/Cn61X/ZYg8";
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
Cc: Felix Kuehling <Felix.Kuehling@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/CY2HkHUQ6d9_/Cn61X/ZYg8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got conflicts in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c

between commit:

  d3116756a710 ("drm/ttm: rename bo->mem and make it a pointer")

from the drm-misc tree and commits:

  b453e42a6e8b ("drm/amdgpu: Add new placement for preemptible SG BOs")
  2a675640bc2d ("drm/amdgpu: move shadow bo validation to VM code")
  59276f056fb7 ("drm/amdgpu: switch to amdgpu_bo_vm for vm code")
  19a1d9350be6 ("drm/amdgpu: flush gart changes after all BO recovery")

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
index 663aa7d2e2ea,86259435803e..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@@ -459,10 -479,11 +461,11 @@@ static int amdgpu_bo_move(struct ttm_bu
  {
  	struct amdgpu_device *adev;
  	struct amdgpu_bo *abo;
 -	struct ttm_resource *old_mem =3D &bo->mem;
 +	struct ttm_resource *old_mem =3D bo->resource;
  	int r;
 =20
- 	if (new_mem->mem_type =3D=3D TTM_PL_TT) {
+ 	if (new_mem->mem_type =3D=3D TTM_PL_TT ||
+ 	    new_mem->mem_type =3D=3D AMDGPU_PL_PREEMPT) {
  		r =3D amdgpu_ttm_backend_bind(bo->bdev, bo->ttm, new_mem);
  		if (r)
  			return r;
@@@ -989,8 -1012,9 +995,9 @@@ int amdgpu_ttm_alloc_gart(struct ttm_bu
  			return r;
  		}
 =20
+ 		amdgpu_gart_invalidate_tlb(adev);
 -		ttm_resource_free(bo, &bo->mem);
 -		bo->mem =3D tmp;
 +		ttm_resource_free(bo, bo->resource);
 +		ttm_bo_assign_mem(bo, &tmp);
  	}
 =20
  	return 0;
@@@ -1348,7 -1373,16 +1356,16 @@@ static bool amdgpu_ttm_bo_eviction_valu
  		}
  	}
 =20
 -	switch (bo->mem.mem_type) {
 +	switch (bo->resource->mem_type) {
+ 	case AMDGPU_PL_PREEMPT:
+ 		/* Preemptible BOs don't own system resources managed by the
+ 		 * driver (pages, VRAM, GART space). They point to resources
+ 		 * owned by someone else (e.g. pageable memory in user mode
+ 		 * or a DMABuf). They are used in a preemptible context so we
+ 		 * can guarantee no deadlocks and good QoS in case of MMU
+ 		 * notifiers or DMABuf move notifiers from the resource owner.
+ 		 */
+ 		return false;
  	case TTM_PL_TT:
  		if (amdgpu_bo_is_amdgpu_bo(bo) &&
  		    amdgpu_bo_encrypted(ttm_to_amdgpu_bo(bo)))
@@@ -1767,8 -1809,13 +1791,9 @@@ void amdgpu_ttm_fini(struct amdgpu_devi
  	amdgpu_bo_free_kernel(&adev->mman.discovery_memory, NULL, NULL);
  	amdgpu_ttm_fw_reserve_vram_fini(adev);
 =20
 -	if (adev->mman.aper_base_kaddr)
 -		iounmap(adev->mman.aper_base_kaddr);
 -	adev->mman.aper_base_kaddr =3D NULL;
 -
  	amdgpu_vram_mgr_fini(adev);
  	amdgpu_gtt_mgr_fini(adev);
+ 	amdgpu_preempt_mgr_fini(adev);
  	ttm_range_man_fini(&adev->mman.bdev, AMDGPU_PL_GDS);
  	ttm_range_man_fini(&adev->mman.bdev, AMDGPU_PL_GWS);
  	ttm_range_man_fini(&adev->mman.bdev, AMDGPU_PL_OA);
@@@ -1919,7 -2010,12 +1944,12 @@@ int amdgpu_fill_buffer(struct amdgpu_b
  		return -EINVAL;
  	}
 =20
 -	if (bo->tbo.mem.mem_type =3D=3D AMDGPU_PL_PREEMPT) {
++	if (bo->tbo.resource->mem_type =3D=3D AMDGPU_PL_PREEMPT) {
+ 		DRM_ERROR("Trying to clear preemptible memory.\n");
+ 		return -EINVAL;
+ 	}
+=20
 -	if (bo->tbo.mem.mem_type =3D=3D TTM_PL_TT) {
 +	if (bo->tbo.resource->mem_type =3D=3D TTM_PL_TT) {
  		r =3D amdgpu_ttm_alloc_gart(&bo->tbo);
  		if (r)
  			return r;
diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index bcfd4a8d0288,1923f035713a..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@@ -657,11 -657,10 +658,11 @@@ void amdgpu_vm_move_to_lru_tail(struct=20
  		if (!bo->parent)
  			continue;
 =20
 -		ttm_bo_move_to_lru_tail(&bo->tbo, &bo->tbo.mem,
 +		ttm_bo_move_to_lru_tail(&bo->tbo, bo->tbo.resource,
  					&vm->lru_bulk_move);
- 		if (bo->shadow)
- 			ttm_bo_move_to_lru_tail(&bo->shadow->tbo,
+ 		if (shadow)
 -			ttm_bo_move_to_lru_tail(&shadow->tbo, &shadow->tbo.mem,
++			ttm_bo_move_to_lru_tail(&shadow->tbo,
 +						bo->shadow->tbo.resource,
  						&vm->lru_bulk_move);
  	}
  	spin_unlock(&adev->mman.bdev.lru_lock);
@@@ -1818,11 -1853,12 +1859,12 @@@ int amdgpu_vm_bo_update(struct amdgpu_d
  			struct drm_gem_object *gobj =3D dma_buf->priv;
  			struct amdgpu_bo *abo =3D gem_to_amdgpu_bo(gobj);
 =20
 -			if (abo->tbo.mem.mem_type =3D=3D TTM_PL_VRAM)
 +			if (abo->tbo.resource->mem_type =3D=3D TTM_PL_VRAM)
  				bo =3D gem_to_amdgpu_bo(gobj);
  		}
 -		mem =3D &bo->tbo.mem;
 +		mem =3D bo->tbo.resource;
- 		if (mem->mem_type =3D=3D TTM_PL_TT)
+ 		if (mem->mem_type =3D=3D TTM_PL_TT ||
+ 		    mem->mem_type =3D=3D AMDGPU_PL_PREEMPT)
  			pages_addr =3D bo->tbo.ttm->dma_address;
  	}
 =20

--Sig_/CY2HkHUQ6d9_/Cn61X/ZYg8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC4Qw8ACgkQAVBC80lX
0GxjJAf+K2Xk6Tf0FoqwHM8wrFCtjSGKeds+Kx4kxBOihlr4qZ+bUTKS/k6STTE2
ecBUTgqmwaNUaEb8jf3VrnZ6DaVaD75gCy6w16O5JUSgkm8peoMUnm+3dhhrrgxH
jZ4JxGEBarh+nwzLKB0jDY4p/2VYKQn36uq5PTX+B/tb7jA6qs/f7m6OS1ivhC/a
EB9pUcujHgEFAKOI5GQxFM7Un61RLCyAoEvH8noaJ4GLAtcxTaIA1CZyITylk9rd
zMvVEaAJYfN14QzyGNxPgq0SQWOjRryhR/Kgs71Qr9KG/Gw2ueTft+Vt0zwl/IYv
nXEal76ylJ4i+REE901zE1uEfxWeEQ==
=H2qR
-----END PGP SIGNATURE-----

--Sig_/CY2HkHUQ6d9_/Cn61X/ZYg8--
