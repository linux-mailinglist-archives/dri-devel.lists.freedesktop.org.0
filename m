Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5381639D2E0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 04:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC876E077;
	Mon,  7 Jun 2021 02:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E276E04A;
 Mon,  7 Jun 2021 02:20:28 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fyxt02j8Cz9sRN;
 Mon,  7 Jun 2021 12:20:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1623032426;
 bh=nOcpwf8R4Sc4oE5ZtD6iiPP8HABC/Jk7x1g/OW52Zdo=;
 h=Date:From:To:Cc:Subject:From;
 b=Rxpj8871vndB89oo2UQOE+nFvH0TI5PiIMROvFbGAjp3LYivaXHinloxZC4OvJF0l
 4QLCxLHy6i2hA42gHMOg0z11I8L9/4ZxbNNrLydQ2AEfx/RMDqPQl9M//bSqphtUOf
 t8vqztQB1U7fZHV4BY/qVgf8ZhU4yEqCwlyrm10F4pzB0bu/3gzaSq7md+SL0tPVB7
 qkXu2uMf5sZ3kUnrV8HPS7NW2EB7WlcQaiX9Dz436klHIOs5OupIF0RnSV/jji2I2u
 NwghTctJCszDFrpnOpVxfBUpYRoN24F/twqSPBVX0JsKaRaS0+9JOyVWwX3OQXCGVB
 aYpmfbwxF5WLg==
Date: Mon, 7 Jun 2021 12:20:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>, DRI
 <dri-devel@lists.freedesktop.org>, Alex Deucher <alexdeucher@gmail.com>
Subject: linux-next: manual merge of the drm-misc tree with the drm and
 amdgpu trees
Message-ID: <20210607122021.0501d588@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6MXQCe35s=qlf6_v.ujY2qt";
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

--Sig_/6MXQCe35s=qlf6_v.ujY2qt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c

between commits:

  b453e42a6e8b ("drm/amdgpu: Add new placement for preemptible SG BOs")
  19a1d9350be6 ("drm/amdgpu: flush gart changes after all BO recovery")

from the drm and amdgpu trees and commits:

  d3116756a710 ("drm/ttm: rename bo->mem and make it a pointer")
  bfa3357ef9ab ("drm/ttm: allocate resource object instead of embedding it =
v2")

from the drm-misc tree.

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
index 832970cff64c,53a8ab8ce2a7..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@@ -460,11 -460,10 +462,11 @@@ static int amdgpu_bo_move(struct ttm_bu
  {
  	struct amdgpu_device *adev;
  	struct amdgpu_bo *abo;
- 	struct ttm_resource *old_mem =3D &bo->mem;
+ 	struct ttm_resource *old_mem =3D bo->resource;
  	int r;
 =20
 -	if (new_mem->mem_type =3D=3D TTM_PL_TT) {
 +	if (new_mem->mem_type =3D=3D TTM_PL_TT ||
 +	    new_mem->mem_type =3D=3D AMDGPU_PL_PREEMPT) {
  		r =3D amdgpu_ttm_backend_bind(bo->bdev, bo->ttm, new_mem);
  		if (r)
  			return r;
@@@ -965,39 -962,38 +968,39 @@@ int amdgpu_ttm_alloc_gart(struct ttm_bu
 =20
  	addr =3D amdgpu_gmc_agp_addr(bo);
  	if (addr !=3D AMDGPU_BO_INVALID_OFFSET) {
- 		bo->mem.start =3D addr >> PAGE_SHIFT;
- 	} else {
-=20
- 		/* allocate GART space */
- 		placement.num_placement =3D 1;
- 		placement.placement =3D &placements;
- 		placement.num_busy_placement =3D 1;
- 		placement.busy_placement =3D &placements;
- 		placements.fpfn =3D 0;
- 		placements.lpfn =3D adev->gmc.gart_size >> PAGE_SHIFT;
- 		placements.mem_type =3D TTM_PL_TT;
- 		placements.flags =3D bo->mem.placement;
-=20
- 		r =3D ttm_bo_mem_space(bo, &placement, &tmp, &ctx);
- 		if (unlikely(r))
- 			return r;
+ 		bo->resource->start =3D addr >> PAGE_SHIFT;
+ 		return 0;
+ 	}
 =20
- 		/* compute PTE flags for this buffer object */
- 		flags =3D amdgpu_ttm_tt_pte_flags(adev, bo->ttm, &tmp);
+ 	/* allocate GART space */
+ 	placement.num_placement =3D 1;
+ 	placement.placement =3D &placements;
+ 	placement.num_busy_placement =3D 1;
+ 	placement.busy_placement =3D &placements;
+ 	placements.fpfn =3D 0;
+ 	placements.lpfn =3D adev->gmc.gart_size >> PAGE_SHIFT;
+ 	placements.mem_type =3D TTM_PL_TT;
+ 	placements.flags =3D bo->resource->placement;
+=20
+ 	r =3D ttm_bo_mem_space(bo, &placement, &tmp, &ctx);
+ 	if (unlikely(r))
+ 		return r;
 =20
- 		/* Bind pages */
- 		gtt->offset =3D (u64)tmp.start << PAGE_SHIFT;
- 		r =3D amdgpu_ttm_gart_bind(adev, bo, flags);
- 		if (unlikely(r)) {
- 			ttm_resource_free(bo, &tmp);
- 			return r;
- 		}
+ 	/* compute PTE flags for this buffer object */
+ 	flags =3D amdgpu_ttm_tt_pte_flags(adev, bo->ttm, tmp);
 =20
- 		amdgpu_gart_invalidate_tlb(adev);
- 		ttm_resource_free(bo, &bo->mem);
- 		bo->mem =3D tmp;
+ 	/* Bind pages */
+ 	gtt->offset =3D (u64)tmp->start << PAGE_SHIFT;
+ 	r =3D amdgpu_ttm_gart_bind(adev, bo, flags);
+ 	if (unlikely(r)) {
+ 		ttm_resource_free(bo, &tmp);
+ 		return r;
  	}
 =20
++	amdgpu_gart_invalidate_tlb(adev);
+ 	ttm_resource_free(bo, &bo->resource);
+ 	ttm_bo_assign_mem(bo, tmp);
+=20
  	return 0;
  }
 =20
@@@ -1354,16 -1349,7 +1357,16 @@@ static bool amdgpu_ttm_bo_eviction_valu
  		}
  	}
 =20
- 	switch (bo->mem.mem_type) {
+ 	switch (bo->resource->mem_type) {
 +	case AMDGPU_PL_PREEMPT:
 +		/* Preemptible BOs don't own system resources managed by the
 +		 * driver (pages, VRAM, GART space). They point to resources
 +		 * owned by someone else (e.g. pageable memory in user mode
 +		 * or a DMABuf). They are used in a preemptible context so we
 +		 * can guarantee no deadlocks and good QoS in case of MMU
 +		 * notifiers or DMABuf move notifiers from the resource owner.
 +		 */
 +		return false;
  	case TTM_PL_TT:
  		if (amdgpu_bo_is_amdgpu_bo(bo) &&
  		    amdgpu_bo_encrypted(ttm_to_amdgpu_bo(bo)))
@@@ -1942,12 -1920,7 +1945,12 @@@ int amdgpu_fill_buffer(struct amdgpu_b
  		return -EINVAL;
  	}
 =20
- 	if (bo->tbo.mem.mem_type =3D=3D AMDGPU_PL_PREEMPT) {
++	if (bo->tbo.resource->mem_type =3D=3D AMDGPU_PL_PREEMPT) {
 +		DRM_ERROR("Trying to clear preemptible memory.\n");
 +		return -EINVAL;
 +	}
 +
- 	if (bo->tbo.mem.mem_type =3D=3D TTM_PL_TT) {
+ 	if (bo->tbo.resource->mem_type =3D=3D TTM_PL_TT) {
  		r =3D amdgpu_ttm_alloc_gart(&bo->tbo);
  		if (r)
  			return r;

--Sig_/6MXQCe35s=qlf6_v.ujY2qt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC9gmUACgkQAVBC80lX
0GzKdwf/VgrAtDclvKEHs69tXAAZithzh+SefpouR0jFQMH3IW7NDahNp1VcbXnE
w7Xp67S0g6SjzRmgka6oRRCz/mG/0Csw6LWEW1Ycv4fDtxSZ0FLaoypgZDyCzhNX
lngF5lb0SbsFKmxd1oNxVP/w0m11Dka5lB49rcz2StsFCd4LJqOReX5df2qzm4ld
/4pA3/+uTFY+A/EPnmXxQGh/cLrqHujY6GYXa8Akiwq4nzWPQm3iJBHkN+Ub9gU3
qn3hQXka0tp0TlU18E4CZBDuYfZf8LGXgLdFBYrWvIFLR+XQgVrCLHAgOXGYHd5C
WhgVKz1b0U7oP/e4dyohjkwNQ4dfOg==
=/HuQ
-----END PGP SIGNATURE-----

--Sig_/6MXQCe35s=qlf6_v.ujY2qt--
