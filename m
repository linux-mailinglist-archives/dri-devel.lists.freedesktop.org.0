Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADA020CB62
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 03:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC6F989ED3;
	Mon, 29 Jun 2020 01:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470B489E2B;
 Mon, 29 Jun 2020 01:15:05 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49w8fs1NVHz9sSF;
 Mon, 29 Jun 2020 11:15:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1593393303;
 bh=/FVAuqzG/l6SWBWuDRhHdwt3AqyH08kGrMNSCgu01RM=;
 h=Date:From:To:Cc:Subject:From;
 b=Eojb8Pg7o/JUJ9APyHj7hP9Vmp+wA+XjBCKebmMJFNHwbXAKqDTgi0yUmN4xaoUzM
 dCQPS37de1yODf6DGMExgiI1NBDGZS46OdU/XcFNr4273TjjWAoYPQx4h7aZEFlAnm
 q0jWg5wpR8ajQcz3f9lef2WVyx3ca2XwHrW6I9ZQQLMK4OQjW+kmRKANd8lBHYHK+M
 6c0r9OtlkM5DMeEludWjszIbJLXsUvYIFM55YA4WQmJBuFFh21sbKsQWOT1HFfAc5F
 PVe/sjR7kcfJqLjXcU6wyAmY+ccupyX+LOy7A8qrVkfkGGRSJ0tvswziMYVCkb4xTM
 dAs6G9vG2ZXLQ==
Date: Mon, 29 Jun 2020 11:14:58 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20200629111458.1661446b@canb.auug.org.au>
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Dave Airlie <airlied@linux.ie>,
 James Jones <jajones@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>
Content-Type: multipart/mixed; boundary="===============0831876443=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0831876443==
Content-Type: multipart/signed; boundary="Sig_/KXcAxX3IKFywdKDZi_I8H8E";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KXcAxX3IKFywdKDZi_I8H8E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got conflicts in:

  drivers/gpu/drm/nouveau/dispnv04/crtc.c
  drivers/gpu/drm/nouveau/dispnv04/overlay.c
  drivers/gpu/drm/nouveau/dispnv50/base507c.c
  drivers/gpu/drm/nouveau/dispnv50/wndw.c
  drivers/gpu/drm/nouveau/nouveau_dmem.c
  drivers/gpu/drm/nouveau/nouveau_fbcon.c

between commits:

  183405879255 ("drm/nouveau/kms: Remove field nvbo from struct nouveau_fra=
mebuffer")
  c586f30bf74c ("drm/nouveau/kms: Add format mod prop to base/ovly/nvdisp")
  1d7f940c3a16 ("drm/nouveau/nouveau/hmm: fix nouveau_dmem_chunk allocation=
s")

from Linus' tree and commit:

  0dc9b286b8d2 ("drm/nouveau: don't use ttm bo->offset v3")

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

diff --cc drivers/gpu/drm/nouveau/dispnv04/crtc.c
index 640738f3196c,cc6ab3c2eec7..000000000000
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@@ -840,12 -839,13 +840,12 @@@ nv04_crtc_do_mode_set_base(struct drm_c
  	 */
  	if (atomic) {
  		drm_fb =3D passed_fb;
 -		fb =3D nouveau_framebuffer(passed_fb);
  	} else {
  		drm_fb =3D crtc->primary->fb;
 -		fb =3D nouveau_framebuffer(crtc->primary->fb);
  	}
 =20
 -	nv_crtc->fb.offset =3D fb->nvbo->offset;
 +	nvbo =3D nouveau_gem_object(drm_fb->obj[0]);
- 	nv_crtc->fb.offset =3D nvbo->bo.offset;
++	nv_crtc->fb.offset =3D nvbo->offset;
 =20
  	if (nv_crtc->lut.depth !=3D drm_fb->format->depth) {
  		nv_crtc->lut.depth =3D drm_fb->format->depth;
diff --cc drivers/gpu/drm/nouveau/dispnv04/overlay.c
index 6248fd1dbc6d,9529bd9053e7..000000000000
--- a/drivers/gpu/drm/nouveau/dispnv04/overlay.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
@@@ -152,7 -150,7 +152,7 @@@ nv10_update_plane(struct drm_plane *pla
  	nvif_mask(dev, NV_PCRTC_ENGINE_CTRL + soff2, NV_CRTC_FSEL_OVERLAY, 0);
 =20
  	nvif_wr32(dev, NV_PVIDEO_BASE(flip), 0);
- 	nvif_wr32(dev, NV_PVIDEO_OFFSET_BUFF(flip), nvbo->bo.offset);
 -	nvif_wr32(dev, NV_PVIDEO_OFFSET_BUFF(flip), nv_fb->nvbo->offset);
++	nvif_wr32(dev, NV_PVIDEO_OFFSET_BUFF(flip), nvbo->offset);
  	nvif_wr32(dev, NV_PVIDEO_SIZE_IN(flip), src_h << 16 | src_w);
  	nvif_wr32(dev, NV_PVIDEO_POINT_IN(flip), src_y << 16 | src_x);
  	nvif_wr32(dev, NV_PVIDEO_DS_DX(flip), (src_w << 20) / crtc_w);
@@@ -174,7 -172,7 +174,7 @@@
  	if (format & NV_PVIDEO_FORMAT_PLANAR) {
  		nvif_wr32(dev, NV_PVIDEO_UVPLANE_BASE(flip), 0);
  		nvif_wr32(dev, NV_PVIDEO_UVPLANE_OFFSET_BUFF(flip),
- 			nvbo->bo.offset + fb->offsets[1]);
 -			nv_fb->nvbo->offset + fb->offsets[1]);
++			nvbo->offset + fb->offsets[1]);
  	}
  	nvif_wr32(dev, NV_PVIDEO_FORMAT(flip), format | fb->pitches[0]);
  	nvif_wr32(dev, NV_PVIDEO_STOP, 0);
@@@ -399,7 -396,7 +399,7 @@@ nv04_update_plane(struct drm_plane *pla
 =20
  	for (i =3D 0; i < 2; i++) {
  		nvif_wr32(dev, NV_PVIDEO_BUFF0_START_ADDRESS + 4 * i,
- 			  nvbo->bo.offset);
 -			  nv_fb->nvbo->offset);
++			  nvbo->offset);
  		nvif_wr32(dev, NV_PVIDEO_BUFF0_PITCH_LENGTH + 4 * i,
  			  fb->pitches[0]);
  		nvif_wr32(dev, NV_PVIDEO_BUFF0_OFFSET + 4 * i, 0);
diff --cc drivers/gpu/drm/nouveau/dispnv50/base507c.c
index 511258bfbcbc,b60aa987d7b4..000000000000
--- a/drivers/gpu/drm/nouveau/dispnv50/base507c.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
@@@ -274,9 -273,9 +274,9 @@@ base507c_new_(const struct nv50_wndw_fu
  	if (*pwndw =3D wndw, ret)
  		return ret;
 =20
 -	ret =3D nv50_dmac_create(&drm->client.device, &disp->disp->object,
 +	ret =3D nv50_dmac_create(&drm->client.device, &disp->disp.object,
  			       &oclass, head, &args, sizeof(args),
- 			       disp50->sync->bo.offset, &wndw->wndw);
 -			       disp->sync->offset, &wndw->wndw);
++			       disp50->sync->offset, &wndw->wndw);
  	if (ret) {
  		NV_ERROR(drm, "base%04x allocation failed: %d\n", oclass, ret);
  		return ret;
diff --cc drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 99b9b681736d,ee0fd817185e..000000000000
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@@ -521,12 -507,11 +521,12 @@@ nv50_wndw_prepare_fb(struct drm_plane *
  			return PTR_ERR(ctxdma);
  		}
 =20
 -		asyw->image.handle[0] =3D ctxdma->object.handle;
 +		if (asyw->visible)
 +			asyw->image.handle[0] =3D ctxdma->object.handle;
  	}
 =20
 -	asyw->state.fence =3D dma_resv_get_excl_rcu(fb->nvbo->bo.base.resv);
 -	asyw->image.offset[0] =3D fb->nvbo->offset;
 +	asyw->state.fence =3D dma_resv_get_excl_rcu(nvbo->bo.base.resv);
- 	asyw->image.offset[0] =3D nvbo->bo.offset;
++	asyw->image.offset[0] =3D nvbo->offset;
 =20
  	if (wndw->func->prepare) {
  		asyh =3D nv50_head_atom_get(asyw->state.state, asyw->state.crtc);
diff --cc drivers/gpu/drm/nouveau/nouveau_dmem.c
index e5c230d9ae24,f13086a32f0f..000000000000
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@@ -75,32 -72,25 +75,32 @@@ struct nouveau_dmem_migrate=20
 =20
  struct nouveau_dmem {
  	struct nouveau_drm *drm;
 -	struct dev_pagemap pagemap;
  	struct nouveau_dmem_migrate migrate;
 -	struct list_head chunk_free;
 -	struct list_head chunk_full;
 -	struct list_head chunk_empty;
 +	struct list_head chunks;
  	struct mutex mutex;
 +	struct page *free_pages;
 +	spinlock_t lock;
  };
 =20
 -static inline struct nouveau_dmem *page_to_dmem(struct page *page)
 +static struct nouveau_dmem_chunk *nouveau_page_to_chunk(struct page *page)
  {
 -	return container_of(page->pgmap, struct nouveau_dmem, pagemap);
 +	return container_of(page->pgmap, struct nouveau_dmem_chunk, pagemap);
 +}
 +
 +static struct nouveau_drm *page_to_drm(struct page *page)
 +{
 +	struct nouveau_dmem_chunk *chunk =3D nouveau_page_to_chunk(page);
 +
 +	return chunk->drm;
  }
 =20
 -static unsigned long nouveau_dmem_page_addr(struct page *page)
 +unsigned long nouveau_dmem_page_addr(struct page *page)
  {
 -	struct nouveau_dmem_chunk *chunk =3D page->zone_device_data;
 -	unsigned long idx =3D page_to_pfn(page) - chunk->pfn_first;
 +	struct nouveau_dmem_chunk *chunk =3D nouveau_page_to_chunk(page);
 +	unsigned long off =3D (page_to_pfn(page) << PAGE_SHIFT) -
 +				chunk->pagemap.res.start;
 =20
- 	return chunk->bo->bo.offset + off;
 -	return (idx << PAGE_SHIFT) + chunk->bo->offset;
++	return chunk->bo->offset + off;
  }
 =20
  static void nouveau_dmem_page_free(struct page *page)
diff --cc drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 3d11b84d4cf9,1341c6fca3ed..000000000000
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@@ -393,7 -393,7 +393,7 @@@ nouveau_fbcon_create(struct drm_fb_help
 =20
  	/* To allow resizeing without swapping buffers */
  	NV_INFO(drm, "allocated %dx%d fb: 0x%llx, bo %p\n",
- 		fb->width, fb->height, nvbo->bo.offset, nvbo);
 -		fb->base.width, fb->base.height, fb->nvbo->offset, nvbo);
++		fb->width, fb->height, nvbo->offset, nvbo);
 =20
  	vga_switcheroo_client_fb_set(dev->pdev, info);
  	return 0;

--Sig_/KXcAxX3IKFywdKDZi_I8H8E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl75QJIACgkQAVBC80lX
0GyMmQgAk3dOardj5yND6O40hzhbuNxH3G5gY8vnejO7dT8B4WWN+nPdlj38sRqd
Mw0ZZjJTl7EqNAbQIiq2HBVk2EmF7NfdGSzztiDtsPtQZqQDdbEKJ7h4zI4l1J+a
HA5YQETJ2ArPHmSrvpceTGoUnC4DcNfRmUMFX+ZkE/ynYrG3Y7SvzRw9ArL1fQZJ
dqv1C6Fhk7nDW821rqV8wumG4Q+FyrwVc94xVFi6LFgq9hmGQy3SpWrM9KEHCY8y
zOgG27GSyqgJM19pDKkoF0xGDvmo8E5vHXif+dBnAgZhWiJAyVppkw5u3aByGj0o
TQd8uDSUneldSr+DbO6VrqTYg2lEzg==
=eFwK
-----END PGP SIGNATURE-----

--Sig_/KXcAxX3IKFywdKDZi_I8H8E--

--===============0831876443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0831876443==--
