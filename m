Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5ACBACFA2B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 01:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E608010E045;
	Thu,  5 Jun 2025 23:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PQLd0QGu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB5410E045;
 Thu,  5 Jun 2025 23:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1749167233;
 bh=15JvHcWTxIrumm959n5nDF+mUowsUAutYuadJfJTyv0=;
 h=Date:From:To:Cc:Subject:From;
 b=PQLd0QGuWnbp+uhMzA6EicYQNkgdhWk2t4zS0hsNjRdS7bjzO30j0BhNddGU+9Phq
 ZzkcNBo0OYOFXWXeyHFy1tkJ5+lkVXJ6Y4GVbPX9k0cOezhDCUQYJAio8Yx8B2ZjKe
 D884G8AYko9X8ZUx/4N3YyIRZFe9XEqeFMUC9O6xa76+XisbimGSdUGchOWaoWJyCJ
 VWSVcpQ8Q9JicWs6YHtzWEWVS+dqQkuLcaFugV4tCM1swD4CppbP0iGcxeqWTiJ1XC
 cvNm56WMYzhNArqGm1+voED/DoNZIzBlU2B7cWRHqnKDQIcHxVg9cyf3GxQfmIypWb
 nEiKmJW5HTfHw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bD1MM6xG7z4wbd;
 Fri,  6 Jun 2025 09:47:11 +1000 (AEST)
Date: Fri, 6 Jun 2025 09:47:11 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Jacek Lawrynowicz
 <jacek.lawrynowicz@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-misc-fixes tree with Linus' tree
Message-ID: <20250606094711.4b9909af@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RPEO+toMXI_H5DxlpAIfJIy";
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

--Sig_/RPEO+toMXI_H5DxlpAIfJIy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc-fixes tree got a conflict in:

  drivers/accel/ivpu/ivpu_gem.c

between commit:

  835b14ce4ee3 ("accel/ivpu: s/drm_gem_shmem_v[un]map/drm_gem_shmem_v[un]ma=
p_locked/")

from Linus' tree and commit:

  98d3f772ca7d ("accel/ivpu: Use dma_resv_lock() instead of a custom mutex")

from the drm-misc-fixes tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/accel/ivpu/ivpu_gem.c
index e0d242d9f3e5,248bfebeaa22..000000000000
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@@ -28,11 -28,21 +28,21 @@@ static inline void ivpu_dbg_bo(struct i
  {
  	ivpu_dbg(vdev, BO,
  		 "%6s: bo %8p vpu_addr %9llx size %8zu ctx %d has_pages %d dma_mapped %=
d mmu_mapped %d wc %d imported %d\n",
- 		 action, bo, bo->vpu_addr, ivpu_bo_size(bo), bo->ctx ? bo->ctx->id : 0,
+ 		 action, bo, bo->vpu_addr, ivpu_bo_size(bo), bo->ctx_id,
  		 (bool)bo->base.pages, (bool)bo->base.sgt, bo->mmu_mapped, bo->base.map=
_wc,
 -		 (bool)bo->base.base.import_attach);
 +		 (bool)drm_gem_is_imported(&bo->base.base));
  }
 =20
+ static inline int ivpu_bo_lock(struct ivpu_bo *bo)
+ {
+ 	return dma_resv_lock(bo->base.base.resv, NULL);
+ }
+=20
+ static inline void ivpu_bo_unlock(struct ivpu_bo *bo)
+ {
+ 	dma_resv_unlock(bo->base.base.resv);
+ }
+=20
  /*
   * ivpu_bo_pin() - pin the backing physical pages and map them to VPU.
   *
@@@ -122,10 -130,9 +130,9 @@@ static void ivpu_bo_unbind_locked(struc
  		bo->ctx =3D NULL;
  	}
 =20
 -	if (bo->base.base.import_attach)
 +	if (drm_gem_is_imported(&bo->base.base))
  		return;
 =20
- 	dma_resv_lock(bo->base.base.resv, NULL);
  	if (bo->base.sgt) {
  		dma_unmap_sgtable(vdev->drm.dev, bo->base.sgt, DMA_BIDIRECTIONAL, 0);
  		sg_free_table(bo->base.sgt);
@@@ -277,12 -285,16 +285,16 @@@ static void ivpu_gem_bo_free(struct drm
  	list_del(&bo->bo_list_node);
  	mutex_unlock(&vdev->bo_list_lock);
 =20
- 	drm_WARN_ON(&vdev->drm, !dma_resv_test_signaled(obj->resv, DMA_RESV_USAG=
E_READ));
+ 	drm_WARN_ON(&vdev->drm, !drm_gem_is_imported(&bo->base.base) &&
+ 		    !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_READ));
+ 	drm_WARN_ON(&vdev->drm, ivpu_bo_size(bo) =3D=3D 0);
+ 	drm_WARN_ON(&vdev->drm, bo->base.vaddr);
 =20
  	ivpu_bo_unbind_locked(bo);
- 	mutex_destroy(&bo->lock);
+ 	drm_WARN_ON(&vdev->drm, bo->mmu_mapped);
+ 	drm_WARN_ON(&vdev->drm, bo->ctx);
 =20
 -	drm_WARN_ON(obj->dev, bo->base.pages_use_count > 1);
 +	drm_WARN_ON(obj->dev, refcount_read(&bo->base.pages_use_count) > 1);
  	drm_gem_shmem_free(&bo->base);
  }
 =20
@@@ -361,9 -376,9 +376,9 @@@ ivpu_bo_create(struct ivpu_device *vdev
  		goto err_put;
 =20
  	if (flags & DRM_IVPU_BO_MAPPABLE) {
- 		dma_resv_lock(bo->base.base.resv, NULL);
+ 		ivpu_bo_lock(bo);
 -		ret =3D drm_gem_shmem_vmap(&bo->base, &map);
 +		ret =3D drm_gem_shmem_vmap_locked(&bo->base, &map);
- 		dma_resv_unlock(bo->base.base.resv);
+ 		ivpu_bo_unlock(bo);
 =20
  		if (ret)
  			goto err_put;
@@@ -386,9 -401,9 +401,9 @@@ void ivpu_bo_free(struct ivpu_bo *bo
  	struct iosys_map map =3D IOSYS_MAP_INIT_VADDR(bo->base.vaddr);
 =20
  	if (bo->flags & DRM_IVPU_BO_MAPPABLE) {
- 		dma_resv_lock(bo->base.base.resv, NULL);
+ 		ivpu_bo_lock(bo);
 -		drm_gem_shmem_vunmap(&bo->base, &map);
 +		drm_gem_shmem_vunmap_locked(&bo->base, &map);
- 		dma_resv_unlock(bo->base.base.resv);
+ 		ivpu_bo_unlock(bo);
  	}
 =20
  	drm_gem_object_put(&bo->base.base);

--Sig_/RPEO+toMXI_H5DxlpAIfJIy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhCLH8ACgkQAVBC80lX
0GwSkAf/XLMVorC/BQUng2JSoICcDyVMT2c370vhORQ395nwOU8qmllWek21qUJc
eQYPyKsLCyGKI9r4yKzaeaOF+I3XfXm1GrjpfFvtyKQX973y23AyQ6x8lBy9xF0E
SVhpCOJpYn6dtpbXWQqiO4MobQPJta+mG+4JI0TfkGvTXCNIfUzRCK5GAyHeSQfJ
y7OUfYoRRxhTcsVNuNniiaZgZuAorQ6ovRwwf/eYNinOelAZEmVLLVqxBs19LKvQ
7c9XeczI4LkYQ4IVogwo5dFdhdB14m9ytzdOOpSA4ViTJDcXGMD49omGJhCxSf6o
SAa4SerGGmZkukBZ+6VWMdqgMBtDew==
=YM/O
-----END PGP SIGNATURE-----

--Sig_/RPEO+toMXI_H5DxlpAIfJIy--
