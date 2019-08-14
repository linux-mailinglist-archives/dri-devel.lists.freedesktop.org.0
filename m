Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3EB8CB78
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 07:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD60B6E268;
	Wed, 14 Aug 2019 05:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BFB6E27B;
 Wed, 14 Aug 2019 05:58:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 76ECB10B78;
 Wed, 14 Aug 2019 05:58:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 127748063E;
 Wed, 14 Aug 2019 05:58:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1223117444; Wed, 14 Aug 2019 07:58:27 +0200 (CEST)
Date: Wed, 14 Aug 2019 07:58:27 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Intel-gfx] [PATCH v6 08/17] drm/ttm: use gem vma_node
Message-ID: <20190814055827.6hrxj6daovxxnnvw@sirius.home.kraxel.org>
References: <20190805140119.7337-1-kraxel@redhat.com>
 <20190805140119.7337-9-kraxel@redhat.com>
 <20190813151115.GA29955@ulmo>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="2ebq6yfgxr3jfnrh"
Content-Disposition: inline
In-Reply-To: <20190813151115.GA29955@ulmo>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Wed, 14 Aug 2019 05:58:29 +0000 (UTC)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, thomas@shipmail.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 tzimmermann@suse.de, ckoenig.leichtzumerken@gmail.com,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--2ebq6yfgxr3jfnrh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Hi Gerd,
> 
> I've been seeing a regression on Nouveau with recent linux-next releases
> and git bisect points at this commit as the first bad one. If I revert
> it (there's a tiny conflict with a patch that was merged subsequently),
> things are back to normal.
> 
> I think the reason for this issue is that Nouveau doesn't use GEM
> objects for all buffer objects,

That shouldn't be a problem ...

> and even when it uses GEM objects, the
> code will not initialize the GEM object until after the buffer objects
> and the backing TTM objects have been created.

... but the initialization order is.

ttm_bo_uses_embedded_gem_object() assumes gem gets initialized first.

drm_gem_object_init() init calling drm_vma_node_reset() again is
probably the root cause for the breakage.

> I tried to fix that by making sure drm_gem_object_init() gets called by
> Nouveau before ttm_bo_init(), but the changes are fairly involved and I
> was unable to get the GEM reference counting right. I can look into the
> proper fix some more, but it might be worth reverting this patch for
> now to get Nouveau working again.

Changing the order doesn't look hard.  Patch attached (untested, have no
test hardware).  But maybe I missed some detail ...

The other patch attached works around the issue with a flag, to avoid
drm_vma_node_reset() being called twice.

cheers,
  Gerd


--2ebq6yfgxr3jfnrh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="0001-try-unbreak-nouveau-1.patch"

From af43f933533140e2df58176a68df0c60ba082273 Mon Sep 17 00:00:00 2001
From: Gerd Hoffmann <kraxel@redhat.com>
Date: Wed, 14 Aug 2019 07:23:31 +0200
Subject: [PATCH 1/2] try unbreak nouveau #1

---
 include/drm/drm_gem.h        | 11 +++++++++++
 drivers/gpu/drm/drm_gem.c    |  6 ++++--
 drivers/gpu/drm/ttm/ttm_bo.c |  3 ++-
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index ae693c0666cd..24e8fc58a3e1 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -297,6 +297,17 @@ struct drm_gem_object {
 	 *
 	 */
 	const struct drm_gem_object_funcs *funcs;
+
+	/**
+	 * @ttm_init: indicate ttm has initialized _resv and vma_node fields.
+	 *
+	 * ttm_bo_uses_embedded_gem_object() assumes gem is
+	 * initialized before ttm, nouveau does it the other way
+	 * around though.
+	 *
+	 * This is a temporary stopgap to handle that case.
+	 */
+	bool ttm_init;
 };
 
 /**
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index afc38cece3f5..0a75d8cf7ac7 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -159,11 +159,13 @@ void drm_gem_private_object_init(struct drm_device *dev,
 	kref_init(&obj->refcount);
 	obj->handle_count = 0;
 	obj->size = size;
-	reservation_object_init(&obj->_resv);
 	if (!obj->resv)
 		obj->resv = &obj->_resv;
 
-	drm_vma_node_reset(&obj->vma_node);
+	if (!obj->ttm_init) {
+		reservation_object_init(&obj->_resv);
+		drm_vma_node_reset(&obj->vma_node);
+	}
 }
 EXPORT_SYMBOL(drm_gem_private_object_init);
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 10a861a1690c..83b389fc117e 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -160,7 +160,7 @@ static void ttm_bo_release_list(struct kref *list_kref)
 	ttm_tt_destroy(bo->ttm);
 	atomic_dec(&bo->bdev->glob->bo_count);
 	dma_fence_put(bo->moving);
-	if (!ttm_bo_uses_embedded_gem_object(bo))
+	if (bo->base.ttm_init)
 		reservation_object_fini(&bo->base._resv);
 	mutex_destroy(&bo->wu_mutex);
 	bo->destroy(bo);
@@ -1344,6 +1344,7 @@ int ttm_bo_init_reserved(struct ttm_bo_device *bdev,
 		 */
 		reservation_object_init(&bo->base._resv);
 		drm_vma_node_reset(&bo->base.vma_node);
+		bo->base.ttm_init = true;
 	}
 	atomic_inc(&bo->bdev->glob->bo_count);
 
-- 
2.18.1


--2ebq6yfgxr3jfnrh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="0002-try-unbreak-nouveau-2.patch"

From 3e36d5819ed5330068340e78c7a1bf35451b1dad Mon Sep 17 00:00:00 2001
From: Gerd Hoffmann <kraxel@redhat.com>
Date: Wed, 14 Aug 2019 07:41:05 +0200
Subject: [PATCH 2/2] try unbreak nouveau #2

---
 drivers/gpu/drm/nouveau/nouveau_bo.h    |  4 ++--
 drivers/gpu/drm/nouveau/dispnv04/crtc.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c    | 11 ++++++++++-
 drivers/gpu/drm/nouveau/nouveau_chan.c  |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c  |  2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c   | 10 +---------
 drivers/gpu/drm/nouveau/nouveau_prime.c | 10 +---------
 drivers/gpu/drm/nouveau/nv17_fence.c    |  2 +-
 drivers/gpu/drm/nouveau/nv50_fence.c    |  2 +-
 drivers/gpu/drm/nouveau/nv84_fence.c    |  2 +-
 11 files changed, 21 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
index d675efe8e7f9..4c268f299226 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
@@ -73,7 +73,7 @@ extern struct ttm_bo_driver nouveau_bo_driver;
 void nouveau_bo_move_init(struct nouveau_drm *);
 int  nouveau_bo_new(struct nouveau_cli *, u64 size, int align, u32 flags,
 		    u32 tile_mode, u32 tile_flags, struct sg_table *sg,
-		    struct reservation_object *robj,
+		    struct reservation_object *robj, bool gem_init,
 		    struct nouveau_bo **);
 int  nouveau_bo_pin(struct nouveau_bo *, u32 flags, bool contig);
 int  nouveau_bo_unpin(struct nouveau_bo *);
@@ -115,7 +115,7 @@ nouveau_bo_new_pin_map(struct nouveau_cli *cli, u64 size, int align, u32 flags,
 		       struct nouveau_bo **pnvbo)
 {
 	int ret = nouveau_bo_new(cli, size, align, flags,
-				 0, 0, NULL, NULL, pnvbo);
+				 0, 0, NULL, NULL, false, pnvbo);
 	if (ret == 0) {
 		ret = nouveau_bo_pin(*pnvbo, flags, true);
 		if (ret == 0) {
diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index f22f01020625..5640f5e45c11 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -1366,7 +1366,7 @@ nv04_crtc_create(struct drm_device *dev, int crtc_num)
 
 	ret = nouveau_bo_new(&nouveau_drm(dev)->client, 64*64*4, 0x100,
 			     TTM_PL_FLAG_VRAM, 0, 0x0000, NULL, NULL,
-			     &nv_crtc->cursor.nvbo);
+			     false, &nv_crtc->cursor.nvbo);
 	if (!ret) {
 		ret = nouveau_bo_pin(nv_crtc->cursor.nvbo, TTM_PL_FLAG_VRAM, false);
 		if (!ret) {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 8497768f1b41..047c0166f823 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2319,7 +2319,7 @@ nv50_display_create(struct drm_device *dev)
 
 	/* small shared memory area we use for notifiers and semaphores */
 	ret = nouveau_bo_new(&drm->client, 4096, 0x1000, TTM_PL_FLAG_VRAM,
-			     0, 0x0000, NULL, NULL, &disp->sync);
+			     0, 0x0000, NULL, NULL, false, &disp->sync);
 	if (!ret) {
 		ret = nouveau_bo_pin(disp->sync, TTM_PL_FLAG_VRAM, true);
 		if (!ret) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 99e391be9370..b1b67a427a98 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -189,7 +189,7 @@ int
 nouveau_bo_new(struct nouveau_cli *cli, u64 size, int align,
 	       uint32_t flags, uint32_t tile_mode, uint32_t tile_flags,
 	       struct sg_table *sg, struct reservation_object *robj,
-	       struct nouveau_bo **pnvbo)
+	       bool gem_init, struct nouveau_bo **pnvbo)
 {
 	struct nouveau_drm *drm = cli->drm;
 	struct nouveau_bo *nvbo;
@@ -295,6 +295,15 @@ nouveau_bo_new(struct nouveau_cli *cli, u64 size, int align,
 	acc_size = ttm_bo_dma_acc_size(&drm->ttm.bdev, size,
 				       sizeof(struct nouveau_bo));
 
+	if (gem_init) {
+		/* Initialize the embedded gem-object. */
+		ret = drm_gem_object_init(drm->dev, &nvbo->bo.base, size);
+		if (ret) {
+			kfree(nvbo);
+			return -ENOMEM;
+		}
+	}
+
 	ret = ttm_bo_init(&drm->ttm.bdev, &nvbo->bo, size,
 			  type, &nvbo->placement,
 			  align >> PAGE_SHIFT, false, acc_size, sg,
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 282fd90b65e1..fedf3239b2e4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -144,7 +144,7 @@ nouveau_channel_prep(struct nouveau_drm *drm, struct nvif_device *device,
 		target = TTM_PL_FLAG_VRAM;
 
 	ret = nouveau_bo_new(cli, size, 0, target, 0, 0, NULL, NULL,
-			    &chan->push.buffer);
+			     false, &chan->push.buffer);
 	if (ret == 0) {
 		ret = nouveau_bo_pin(chan->push.buffer, target, false);
 		if (ret == 0)
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 1333220787a1..4090ba54bbdd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -314,7 +314,7 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm)
 
 	ret = nouveau_bo_new(&drm->client, DMEM_CHUNK_SIZE, 0,
 			     TTM_PL_FLAG_VRAM, 0, 0, NULL, NULL,
-			     &chunk->bo);
+			     false, &chunk->bo);
 	if (ret)
 		goto out;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index c7368aa0bdec..1993f2c90e4c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -189,7 +189,7 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
 		flags |= TTM_PL_FLAG_UNCACHED;
 
 	ret = nouveau_bo_new(cli, size, align, flags, tile_mode,
-			     tile_flags, NULL, NULL, pnvbo);
+			     tile_flags, NULL, NULL, true, pnvbo);
 	if (ret)
 		return ret;
 	nvbo = *pnvbo;
@@ -203,14 +203,6 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
 	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA)
 		nvbo->valid_domains &= domain;
 
-	/* Initialize the embedded gem-object. We return a single gem-reference
-	 * to the caller, instead of a normal nouveau_bo ttm reference. */
-	ret = drm_gem_object_init(drm->dev, &nvbo->bo.base, nvbo->bo.mem.size);
-	if (ret) {
-		nouveau_bo_ref(NULL, pnvbo);
-		return -ENOMEM;
-	}
-
 	nvbo->bo.persistent_swap_storage = nvbo->bo.base.filp;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
index e86ad7ae622b..db1ec2d0d4c9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -70,21 +70,13 @@ struct drm_gem_object *nouveau_gem_prime_import_sg_table(struct drm_device *dev,
 
 	reservation_object_lock(robj, NULL);
 	ret = nouveau_bo_new(&drm->client, attach->dmabuf->size, 0, flags, 0, 0,
-			     sg, robj, &nvbo);
+			     sg, robj, true, &nvbo);
 	reservation_object_unlock(robj);
 	if (ret)
 		return ERR_PTR(ret);
 
 	nvbo->valid_domains = NOUVEAU_GEM_DOMAIN_GART;
 
-	/* Initialize the embedded gem-object. We return a single gem-reference
-	 * to the caller, instead of a normal nouveau_bo ttm reference. */
-	ret = drm_gem_object_init(dev, &nvbo->bo.base, nvbo->bo.mem.size);
-	if (ret) {
-		nouveau_bo_ref(NULL, &nvbo);
-		return ERR_PTR(-ENOMEM);
-	}
-
 	return &nvbo->bo.base;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nv17_fence.c b/drivers/gpu/drm/nouveau/nv17_fence.c
index 5d613d43b84d..6c589d0b847c 100644
--- a/drivers/gpu/drm/nouveau/nv17_fence.c
+++ b/drivers/gpu/drm/nouveau/nv17_fence.c
@@ -128,7 +128,7 @@ nv17_fence_create(struct nouveau_drm *drm)
 	spin_lock_init(&priv->lock);
 
 	ret = nouveau_bo_new(&drm->client, 4096, 0x1000, TTM_PL_FLAG_VRAM,
-			     0, 0x0000, NULL, NULL, &priv->bo);
+			     0, 0x0000, NULL, NULL, false, &priv->bo);
 	if (!ret) {
 		ret = nouveau_bo_pin(priv->bo, TTM_PL_FLAG_VRAM, false);
 		if (!ret) {
diff --git a/drivers/gpu/drm/nouveau/nv50_fence.c b/drivers/gpu/drm/nouveau/nv50_fence.c
index a00ecc3de053..17910bfca099 100644
--- a/drivers/gpu/drm/nouveau/nv50_fence.c
+++ b/drivers/gpu/drm/nouveau/nv50_fence.c
@@ -81,7 +81,7 @@ nv50_fence_create(struct nouveau_drm *drm)
 	spin_lock_init(&priv->lock);
 
 	ret = nouveau_bo_new(&drm->client, 4096, 0x1000, TTM_PL_FLAG_VRAM,
-			     0, 0x0000, NULL, NULL, &priv->bo);
+			     0, 0x0000, NULL, NULL, false, &priv->bo);
 	if (!ret) {
 		ret = nouveau_bo_pin(priv->bo, TTM_PL_FLAG_VRAM, false);
 		if (!ret) {
diff --git a/drivers/gpu/drm/nouveau/nv84_fence.c b/drivers/gpu/drm/nouveau/nv84_fence.c
index f07da00f285f..fecdb036521e 100644
--- a/drivers/gpu/drm/nouveau/nv84_fence.c
+++ b/drivers/gpu/drm/nouveau/nv84_fence.c
@@ -204,7 +204,7 @@ nv84_fence_create(struct nouveau_drm *drm)
 			  */
 			 TTM_PL_FLAG_TT | TTM_PL_FLAG_UNCACHED;
 	ret = nouveau_bo_new(&drm->client, 16 * drm->chan.nr, 0,
-			     domain, 0, 0, NULL, NULL, &priv->bo);
+			     domain, 0, 0, NULL, NULL, false, &priv->bo);
 	if (ret == 0) {
 		ret = nouveau_bo_pin(priv->bo, domain, false);
 		if (ret == 0) {
-- 
2.18.1


--2ebq6yfgxr3jfnrh
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--2ebq6yfgxr3jfnrh--
