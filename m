Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 479F840D683
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 11:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E226EB36;
	Thu, 16 Sep 2021 09:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA456EB36
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 09:44:12 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so5421828wmh.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 02:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=98TgCGow3Fq1rnTPEAq7rUm5XTdUK9DwOZEIMPcvEY4=;
 b=g1Wjl0Ec60hMUMPoPvdLh4byRjvW+kZeW6Asj35WpF7BA095GsMjgBn7U0TCwDwTX6
 ra1QLG4Tp1SpVaXiyhAr365igP55Jnmg9OZiG9hawOswc/L/u1ITkP2koiXoC9YEt5Ij
 /q+ZHGWvIop5DjlFHehLsnPAwB9DisrDLPK3oFmFsahsjRD3ALm71uK2CCO4ury32KaG
 OyTgpag5mP7l3A89qEQhkymaeWxzZgLg4gUK6x0KqF1DW9QZ85Ppp5ruYT0W8aiwQ5fz
 DxgrL4aqkfQMESE7tjoAR6eO7qb0pgXffu8Artd9hPi18KpafABaUReRB49PXE3E9Skz
 3sOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=98TgCGow3Fq1rnTPEAq7rUm5XTdUK9DwOZEIMPcvEY4=;
 b=f8WEvOyTG8HP3Y5tQiy+was2hhoyj0CSEHD3izxjV8uATDJmV1DXANiZ/a044SomUr
 6xrUj33Y3zYw4Q6UfU4ys8I6elsHC7hIr+F1SxYwO+4yUyPIgAaPZ0D+J2qZ8trGtuDW
 N5SwkSY2Yi3WGj3soFZrBvRJhSpB1Niib5Xw5qVVMUJryLdzPGEl10j7G6ucLyLfjiP+
 TVCwprFduhpK3KFFG3vwT4KSnWxx2gtQaV7+a6u7oW5MWnNLwL7QyRiFNH2YrO2F5bzg
 +ZdWUCsxgS5eVqdP4UE3b/KMuLK9OPrXjxJjpqpwJpGa7megEaJCfUKZBvrGubz3lhXR
 F7iw==
X-Gm-Message-State: AOAM533wloLQoKi34AFJWeTsekbqrNzwDiJ7tR+qBrvZrHaC9KVZdgc4
 fuB28lTlcP/5vxNsQuwqIHQ=
X-Google-Smtp-Source: ABdhPJyWhf82fvqub2V5/ZRovlU1m6BqNgo3lLmrz34e4zcpl6NGr2Lcx9DmnoE5FrWzDxe2Ec2V1w==
X-Received: by 2002:a05:600c:35c4:: with SMTP id
 r4mr9195218wmq.194.1631785451144; 
 Thu, 16 Sep 2021 02:44:11 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id k17sm2724808wrq.7.2021.09.16.02.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 02:44:10 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 2/6] drm/tegra: Implement correct DMA-BUF semantics
Date: Thu, 16 Sep 2021 11:44:00 +0200
Message-Id: <20210916094404.888267-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916094404.888267-1-thierry.reding@gmail.com>
References: <20210916094404.888267-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Thierry Reding <treding@nvidia.com>

DMA-BUF requires that each device that accesses a DMA-BUF attaches to it
separately. To do so the host1x_bo_pin() and host1x_bo_unpin() functions
need to be reimplemented so that they can return a mapping, which either
represents an attachment or a map of the driver's own GEM object.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/gem.c    | 138 +++++++++++++++-------------
 drivers/gpu/drm/tegra/plane.c  |  60 ++++---------
 drivers/gpu/drm/tegra/plane.h  |   2 +-
 drivers/gpu/drm/tegra/submit.c |  63 +++++++++----
 drivers/gpu/drm/tegra/uapi.c   |  68 ++++++--------
 drivers/gpu/drm/tegra/uapi.h   |   5 +-
 drivers/gpu/host1x/job.c       | 158 ++++++++++++---------------------
 drivers/gpu/host1x/job.h       |   6 +-
 include/linux/host1x.h         |  30 ++++---
 9 files changed, 244 insertions(+), 286 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 6ec598f5d5b3..79a609f981d1 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -27,79 +27,64 @@ static void tegra_bo_put(struct host1x_bo *bo)
 	drm_gem_object_put(&obj->gem);
 }
 
-/* XXX move this into lib/scatterlist.c? */
-static int sg_alloc_table_from_sg(struct sg_table *sgt, struct scatterlist *sg,
-				  unsigned int nents, gfp_t gfp_mask)
+static struct host1x_bo_mapping *tegra_bo_pin(struct device *dev, struct host1x_bo *bo,
+					      enum dma_data_direction direction)
 {
-	struct scatterlist *dst;
-	unsigned int i;
+	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
+	struct drm_gem_object *gem = &obj->gem;
+	struct host1x_bo_mapping *map;
 	int err;
 
-	err = sg_alloc_table(sgt, nents, gfp_mask);
-	if (err < 0)
-		return err;
+	map = kzalloc(sizeof(*map), GFP_KERNEL);
+	if (!map)
+		return ERR_PTR(-ENOMEM);
 
-	dst = sgt->sgl;
+	map->bo = host1x_bo_get(bo);
+	map->direction = direction;
+	map->dev = dev;
 
-	for (i = 0; i < nents; i++) {
-		sg_set_page(dst, sg_page(sg), sg->length, 0);
-		dst = sg_next(dst);
-		sg = sg_next(sg);
-	}
+	/*
+	 * Imported buffers need special treatment to satisfy the semantics of DMA-BUF.
+	 */
+	if (gem->import_attach) {
+		struct dma_buf *buf = gem->import_attach->dmabuf;
 
-	return 0;
-}
+		map->attach = dma_buf_attach(buf, dev);
+		if (IS_ERR(map->attach)) {
+			err = PTR_ERR(map->attach);
+			goto free;
+		}
 
-static struct sg_table *tegra_bo_pin(struct device *dev, struct host1x_bo *bo,
-				     dma_addr_t *phys)
-{
-	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
-	struct sg_table *sgt;
-	int err;
+		map->sgt = dma_buf_map_attachment(map->attach, direction);
+		if (IS_ERR(map->sgt)) {
+			dma_buf_detach(buf, map->attach);
+			err = PTR_ERR(map->sgt);
+			goto free;
+		}
 
-	/*
-	 * If we've manually mapped the buffer object through the IOMMU, make
-	 * sure to return the IOVA address of our mapping.
-	 *
-	 * Similarly, for buffers that have been allocated by the DMA API the
-	 * physical address can be used for devices that are not attached to
-	 * an IOMMU. For these devices, callers must pass a valid pointer via
-	 * the @phys argument.
-	 *
-	 * Imported buffers were also already mapped at import time, so the
-	 * existing mapping can be reused.
-	 */
-	if (phys) {
-		*phys = obj->iova;
-		return NULL;
+		err = sgt_dma_count_chunks(map->sgt);
+		map->size = gem->size;
+
+		goto out;
 	}
 
 	/*
 	 * If we don't have a mapping for this buffer yet, return an SG table
 	 * so that host1x can do the mapping for us via the DMA API.
 	 */
-	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
-	if (!sgt)
-		return ERR_PTR(-ENOMEM);
+	map->sgt = kzalloc(sizeof(*map->sgt), GFP_KERNEL);
+	if (!map->sgt) {
+		err = -ENOMEM;
+		goto free;
+	}
 
 	if (obj->pages) {
 		/*
 		 * If the buffer object was allocated from the explicit IOMMU
 		 * API code paths, construct an SG table from the pages.
 		 */
-		err = sg_alloc_table_from_pages(sgt, obj->pages, obj->num_pages,
-						0, obj->gem.size, GFP_KERNEL);
-		if (err < 0)
-			goto free;
-	} else if (obj->sgt) {
-		/*
-		 * If the buffer object already has an SG table but no pages
-		 * were allocated for it, it means the buffer was imported and
-		 * the SG table needs to be copied to avoid overwriting any
-		 * other potential users of the original SG table.
-		 */
-		err = sg_alloc_table_from_sg(sgt, obj->sgt->sgl,
-					     obj->sgt->orig_nents, GFP_KERNEL);
+		err = sg_alloc_table_from_pages(map->sgt, obj->pages, obj->num_pages, 0, gem->size,
+						GFP_KERNEL);
 		if (err < 0)
 			goto free;
 	} else {
@@ -108,25 +93,56 @@ static struct sg_table *tegra_bo_pin(struct device *dev, struct host1x_bo *bo,
 		 * not imported, it had to be allocated with the DMA API, so
 		 * the DMA API helper can be used.
 		 */
-		err = dma_get_sgtable(dev, sgt, obj->vaddr, obj->iova,
-				      obj->gem.size);
+		err = dma_get_sgtable(dev, map->sgt, obj->vaddr, obj->iova, gem->size);
 		if (err < 0)
 			goto free;
 	}
 
-	return sgt;
+	err = dma_map_sgtable(dev, map->sgt, direction, 0);
+	if (err)
+		goto free_sgt;
 
+out:
+	/*
+	 * If we've manually mapped the buffer object through the IOMMU, make sure to return the
+	 * existing IOVA address of our mapping.
+	 */
+	if (!obj->mm) {
+		map->phys = sg_dma_address(map->sgt->sgl);
+		map->chunks = err;
+	} else {
+		map->phys = obj->iova;
+		map->chunks = 1;
+	}
+
+	map->size = gem->size;
+
+	return map;
+
+free_sgt:
+	sg_free_table(map->sgt);
 free:
-	kfree(sgt);
+	kfree(map->sgt);
+	kfree(map);
 	return ERR_PTR(err);
 }
 
-static void tegra_bo_unpin(struct device *dev, struct sg_table *sgt)
+static void tegra_bo_unpin(struct host1x_bo_mapping *map)
 {
-	if (sgt) {
-		sg_free_table(sgt);
-		kfree(sgt);
+	if (!map)
+		return;
+
+	if (map->attach) {
+		dma_buf_unmap_attachment(map->attach, map->sgt, map->direction);
+		dma_buf_detach(map->attach->dmabuf, map->attach);
+	} else {
+		dma_unmap_sgtable(map->dev, map->sgt, map->direction, 0);
+		sg_free_table(map->sgt);
+		kfree(map->sgt);
 	}
+
+	host1x_bo_put(map->bo);
+	kfree(map);
 }
 
 static void *tegra_bo_mmap(struct host1x_bo *bo)
diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index 16a1cdc28657..e579d966e8dc 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -74,7 +74,7 @@ tegra_plane_atomic_duplicate_state(struct drm_plane *plane)
 
 	for (i = 0; i < 3; i++) {
 		copy->iova[i] = DMA_MAPPING_ERROR;
-		copy->sgt[i] = NULL;
+		copy->map[i] = NULL;
 	}
 
 	return &copy->base;
@@ -138,55 +138,37 @@ const struct drm_plane_funcs tegra_plane_funcs = {
 
 static int tegra_dc_pin(struct tegra_dc *dc, struct tegra_plane_state *state)
 {
-	struct iommu_domain *domain = iommu_get_domain_for_dev(dc->dev);
 	unsigned int i;
 	int err;
 
 	for (i = 0; i < state->base.fb->format->num_planes; i++) {
 		struct tegra_bo *bo = tegra_fb_get_plane(state->base.fb, i);
-		dma_addr_t phys_addr, *phys;
-		struct sg_table *sgt;
+		struct host1x_bo_mapping *map;
 
-		/*
-		 * If we're not attached to a domain, we already stored the
-		 * physical address when the buffer was allocated. If we're
-		 * part of a group that's shared between all display
-		 * controllers, we've also already mapped the framebuffer
-		 * through the SMMU. In both cases we can short-circuit the
-		 * code below and retrieve the stored IOV address.
-		 */
-		if (!domain || dc->client.group)
-			phys = &phys_addr;
-		else
-			phys = NULL;
-
-		sgt = host1x_bo_pin(dc->dev, &bo->base, phys);
-		if (IS_ERR(sgt)) {
-			err = PTR_ERR(sgt);
+		map = host1x_bo_pin(dc->dev, &bo->base, DMA_TO_DEVICE);
+		if (IS_ERR(map)) {
+			err = PTR_ERR(map);
 			goto unpin;
 		}
 
-		if (sgt) {
-			err = dma_map_sgtable(dc->dev, sgt, DMA_TO_DEVICE, 0);
-			if (err)
-				goto unpin;
-
+		if (!dc->client.group) {
 			/*
 			 * The display controller needs contiguous memory, so
 			 * fail if the buffer is discontiguous and we fail to
 			 * map its SG table to a single contiguous chunk of
 			 * I/O virtual memory.
 			 */
-			if (sgt->nents > 1) {
+			if (map->chunks > 1) {
 				err = -EINVAL;
 				goto unpin;
 			}
 
-			state->iova[i] = sg_dma_address(sgt->sgl);
-			state->sgt[i] = sgt;
+			state->iova[i] = map->phys;
 		} else {
-			state->iova[i] = phys_addr;
+			state->iova[i] = bo->iova;
 		}
+
+		state->map[i] = map;
 	}
 
 	return 0;
@@ -195,15 +177,9 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct tegra_plane_state *state)
 	dev_err(dc->dev, "failed to map plane %u: %d\n", i, err);
 
 	while (i--) {
-		struct tegra_bo *bo = tegra_fb_get_plane(state->base.fb, i);
-		struct sg_table *sgt = state->sgt[i];
-
-		if (sgt)
-			dma_unmap_sgtable(dc->dev, sgt, DMA_TO_DEVICE, 0);
-
-		host1x_bo_unpin(dc->dev, &bo->base, sgt);
+		host1x_bo_unpin(state->map[i]);
 		state->iova[i] = DMA_MAPPING_ERROR;
-		state->sgt[i] = NULL;
+		state->map[i] = NULL;
 	}
 
 	return err;
@@ -214,15 +190,9 @@ static void tegra_dc_unpin(struct tegra_dc *dc, struct tegra_plane_state *state)
 	unsigned int i;
 
 	for (i = 0; i < state->base.fb->format->num_planes; i++) {
-		struct tegra_bo *bo = tegra_fb_get_plane(state->base.fb, i);
-		struct sg_table *sgt = state->sgt[i];
-
-		if (sgt)
-			dma_unmap_sgtable(dc->dev, sgt, DMA_TO_DEVICE, 0);
-
-		host1x_bo_unpin(dc->dev, &bo->base, sgt);
+		host1x_bo_unpin(state->map[i]);
 		state->iova[i] = DMA_MAPPING_ERROR;
-		state->sgt[i] = NULL;
+		state->map[i] = NULL;
 	}
 }
 
diff --git a/drivers/gpu/drm/tegra/plane.h b/drivers/gpu/drm/tegra/plane.h
index d9470780c803..dfb20712fbd7 100644
--- a/drivers/gpu/drm/tegra/plane.h
+++ b/drivers/gpu/drm/tegra/plane.h
@@ -43,7 +43,7 @@ struct tegra_plane_legacy_blending_state {
 struct tegra_plane_state {
 	struct drm_plane_state base;
 
-	struct sg_table *sgt[3];
+	struct host1x_bo_mapping *map[3];
 	dma_addr_t iova[3];
 
 	struct tegra_bo_tiling tiling;
diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
index 776f825df52f..c32698404e36 100644
--- a/drivers/gpu/drm/tegra/submit.c
+++ b/drivers/gpu/drm/tegra/submit.c
@@ -64,33 +64,62 @@ static void gather_bo_put(struct host1x_bo *host_bo)
 	kref_put(&bo->ref, gather_bo_release);
 }
 
-static struct sg_table *
-gather_bo_pin(struct device *dev, struct host1x_bo *host_bo, dma_addr_t *phys)
+static struct host1x_bo_mapping *
+gather_bo_pin(struct device *dev, struct host1x_bo *bo, enum dma_data_direction direction)
 {
-	struct gather_bo *bo = container_of(host_bo, struct gather_bo, base);
-	struct sg_table *sgt;
+	struct gather_bo *gather = container_of(bo, struct gather_bo, base);
+	struct host1x_bo_mapping *map;
 	int err;
 
-	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
-	if (!sgt)
+	map = kzalloc(sizeof(*map), GFP_KERNEL);
+	if (!map)
 		return ERR_PTR(-ENOMEM);
 
-	err = dma_get_sgtable(bo->dev, sgt, bo->gather_data, bo->gather_data_dma,
-			      bo->gather_data_words * 4);
-	if (err) {
-		kfree(sgt);
-		return ERR_PTR(err);
+	kref_init(&map->ref);
+	map->bo = host1x_bo_get(bo);
+	map->direction = direction;
+	map->dev = dev;
+
+	map->sgt = kzalloc(sizeof(*map->sgt), GFP_KERNEL);
+	if (!map->sgt) {
+		err = -ENOMEM;
+		goto free;
 	}
 
-	return sgt;
+	err = dma_get_sgtable(gather->dev, map->sgt, gather->gather_data, gather->gather_data_dma,
+			      gather->gather_data_words * 4);
+	if (err)
+		goto free_sgt;
+
+	err = dma_map_sgtable(dev, map->sgt, direction, 0);
+	if (err)
+		goto free_sgt;
+
+	map->phys = sg_dma_address(map->sgt->sgl);
+	map->size = gather->gather_data_words * 4;
+	map->chunks = err;
+
+	return map;
+
+free_sgt:
+	sg_free_table(map->sgt);
+	kfree(map->sgt);
+free:
+	kfree(map);
+	return ERR_PTR(err);
 }
 
-static void gather_bo_unpin(struct device *dev, struct sg_table *sgt)
+static void gather_bo_unpin(struct host1x_bo_mapping *map)
 {
-	if (sgt) {
-		sg_free_table(sgt);
-		kfree(sgt);
-	}
+	if (!map)
+		return;
+
+	dma_unmap_sgtable(map->dev, map->sgt, map->direction, 0);
+	sg_free_table(map->sgt);
+	kfree(map->sgt);
+	host1x_bo_put(map->bo);
+
+	kfree(map);
 }
 
 static void *gather_bo_mmap(struct host1x_bo *host_bo)
diff --git a/drivers/gpu/drm/tegra/uapi.c b/drivers/gpu/drm/tegra/uapi.c
index dc16a24f4dbe..794c400c38b1 100644
--- a/drivers/gpu/drm/tegra/uapi.c
+++ b/drivers/gpu/drm/tegra/uapi.c
@@ -17,11 +17,7 @@ static void tegra_drm_mapping_release(struct kref *ref)
 	struct tegra_drm_mapping *mapping =
 		container_of(ref, struct tegra_drm_mapping, ref);
 
-	if (mapping->sgt)
-		dma_unmap_sgtable(mapping->dev, mapping->sgt, mapping->direction,
-				  DMA_ATTR_SKIP_CPU_SYNC);
-
-	host1x_bo_unpin(mapping->dev, mapping->bo, mapping->sgt);
+	host1x_bo_unpin(mapping->map);
 	host1x_bo_put(mapping->bo);
 
 	kfree(mapping);
@@ -159,6 +155,7 @@ int tegra_drm_ioctl_channel_map(struct drm_device *drm, void *data, struct drm_f
 	struct drm_tegra_channel_map *args = data;
 	struct tegra_drm_mapping *mapping;
 	struct tegra_drm_context *context;
+	enum dma_data_direction direction;
 	int err = 0;
 
 	if (args->flags & ~DRM_TEGRA_CHANNEL_MAP_READ_WRITE)
@@ -180,68 +177,53 @@ int tegra_drm_ioctl_channel_map(struct drm_device *drm, void *data, struct drm_f
 
 	kref_init(&mapping->ref);
 
-	mapping->dev = context->client->base.dev;
 	mapping->bo = tegra_gem_lookup(file, args->handle);
 	if (!mapping->bo) {
 		err = -EINVAL;
-		goto unlock;
+		goto free;
 	}
 
-	if (context->client->base.group) {
-		/* IOMMU domain managed directly using IOMMU API */
-		host1x_bo_pin(mapping->dev, mapping->bo, &mapping->iova);
-	} else {
-		switch (args->flags & DRM_TEGRA_CHANNEL_MAP_READ_WRITE) {
-		case DRM_TEGRA_CHANNEL_MAP_READ_WRITE:
-			mapping->direction = DMA_BIDIRECTIONAL;
-			break;
-
-		case DRM_TEGRA_CHANNEL_MAP_WRITE:
-			mapping->direction = DMA_FROM_DEVICE;
-			break;
-
-		case DRM_TEGRA_CHANNEL_MAP_READ:
-			mapping->direction = DMA_TO_DEVICE;
-			break;
+	switch (args->flags & DRM_TEGRA_CHANNEL_MAP_READ_WRITE) {
+	case DRM_TEGRA_CHANNEL_MAP_READ_WRITE:
+		direction = DMA_BIDIRECTIONAL;
+		break;
 
-		default:
-			return -EINVAL;
-		}
+	case DRM_TEGRA_CHANNEL_MAP_WRITE:
+		direction = DMA_FROM_DEVICE;
+		break;
 
-		mapping->sgt = host1x_bo_pin(mapping->dev, mapping->bo, NULL);
-		if (IS_ERR(mapping->sgt)) {
-			err = PTR_ERR(mapping->sgt);
-			goto put_gem;
-		}
+	case DRM_TEGRA_CHANNEL_MAP_READ:
+		direction = DMA_TO_DEVICE;
+		break;
 
-		err = dma_map_sgtable(mapping->dev, mapping->sgt, mapping->direction,
-				      DMA_ATTR_SKIP_CPU_SYNC);
-		if (err)
-			goto unpin;
+	default:
+		err = -EINVAL;
+		goto put_gem;
+	}
 
-		mapping->iova = sg_dma_address(mapping->sgt->sgl);
+	mapping->map = host1x_bo_pin(context->client->base.dev, mapping->bo, direction);
+	if (IS_ERR(mapping->map)) {
+		err = PTR_ERR(mapping->map);
+		goto put_gem;
 	}
 
+	mapping->iova = mapping->map->phys;
 	mapping->iova_end = mapping->iova + host1x_to_tegra_bo(mapping->bo)->size;
 
 	err = xa_alloc(&context->mappings, &args->mapping, mapping, XA_LIMIT(1, U32_MAX),
 		       GFP_KERNEL);
 	if (err < 0)
-		goto unmap;
+		goto unpin;
 
 	mutex_unlock(&fpriv->lock);
 
 	return 0;
 
-unmap:
-	if (mapping->sgt) {
-		dma_unmap_sgtable(mapping->dev, mapping->sgt, mapping->direction,
-				  DMA_ATTR_SKIP_CPU_SYNC);
-	}
 unpin:
-	host1x_bo_unpin(mapping->dev, mapping->bo, mapping->sgt);
+	host1x_bo_unpin(mapping->map);
 put_gem:
 	host1x_bo_put(mapping->bo);
+free:
 	kfree(mapping);
 unlock:
 	mutex_unlock(&fpriv->lock);
diff --git a/drivers/gpu/drm/tegra/uapi.h b/drivers/gpu/drm/tegra/uapi.h
index 12adad770ad3..92ff1e44ff15 100644
--- a/drivers/gpu/drm/tegra/uapi.h
+++ b/drivers/gpu/drm/tegra/uapi.h
@@ -27,10 +27,9 @@ struct tegra_drm_file {
 struct tegra_drm_mapping {
 	struct kref ref;
 
-	struct device *dev;
+	struct host1x_bo_mapping *map;
 	struct host1x_bo *bo;
-	struct sg_table *sgt;
-	enum dma_data_direction direction;
+
 	dma_addr_t iova;
 	dma_addr_t iova_end;
 };
diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 0eef6df7c89e..7a27895e0d28 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -134,11 +134,11 @@ EXPORT_SYMBOL(host1x_job_add_wait);
 
 static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 {
+	unsigned long mask = HOST1X_RELOC_READ | HOST1X_RELOC_WRITE;
 	struct host1x_client *client = job->client;
 	struct device *dev = client->dev;
 	struct host1x_job_gather *g;
 	struct iommu_domain *domain;
-	struct sg_table *sgt;
 	unsigned int i;
 	int err;
 
@@ -147,7 +147,9 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 
 	for (i = 0; i < job->num_relocs; i++) {
 		struct host1x_reloc *reloc = &job->relocs[i];
-		dma_addr_t phys_addr, *phys;
+		enum dma_data_direction direction;
+		struct host1x_bo_mapping *map;
+		struct host1x_bo *bo;
 
 		reloc->target.bo = host1x_bo_get(reloc->target.bo);
 		if (!reloc->target.bo) {
@@ -155,64 +157,44 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 			goto unpin;
 		}
 
-		/*
-		 * If the client device is not attached to an IOMMU, the
-		 * physical address of the buffer object can be used.
-		 *
-		 * Similarly, when an IOMMU domain is shared between all
-		 * host1x clients, the IOVA is already available, so no
-		 * need to map the buffer object again.
-		 *
-		 * XXX Note that this isn't always safe to do because it
-		 * relies on an assumption that no cache maintenance is
-		 * needed on the buffer objects.
-		 */
-		if (!domain || client->group)
-			phys = &phys_addr;
-		else
-			phys = NULL;
-
-		sgt = host1x_bo_pin(dev, reloc->target.bo, phys);
-		if (IS_ERR(sgt)) {
-			err = PTR_ERR(sgt);
-			goto unpin;
-		}
+		bo = reloc->target.bo;
 
-		if (sgt) {
-			unsigned long mask = HOST1X_RELOC_READ |
-					     HOST1X_RELOC_WRITE;
-			enum dma_data_direction dir;
-
-			switch (reloc->flags & mask) {
-			case HOST1X_RELOC_READ:
-				dir = DMA_TO_DEVICE;
-				break;
+		switch (reloc->flags & mask) {
+		case HOST1X_RELOC_READ:
+			direction = DMA_TO_DEVICE;
+			break;
 
-			case HOST1X_RELOC_WRITE:
-				dir = DMA_FROM_DEVICE;
-				break;
+		case HOST1X_RELOC_WRITE:
+			direction = DMA_FROM_DEVICE;
+			break;
 
-			case HOST1X_RELOC_READ | HOST1X_RELOC_WRITE:
-				dir = DMA_BIDIRECTIONAL;
-				break;
+		case HOST1X_RELOC_READ | HOST1X_RELOC_WRITE:
+			direction = DMA_BIDIRECTIONAL;
+			break;
 
-			default:
-				err = -EINVAL;
-				goto unpin;
-			}
+		default:
+			err = -EINVAL;
+			goto unpin;
+		}
 
-			err = dma_map_sgtable(dev, sgt, dir, 0);
-			if (err)
-				goto unpin;
+		map = host1x_bo_pin(dev, bo, direction);
+		if (IS_ERR(map)) {
+			err = PTR_ERR(map);
+			goto unpin;
+		}
 
-			job->unpins[job->num_unpins].dev = dev;
-			job->unpins[job->num_unpins].dir = dir;
-			phys_addr = sg_dma_address(sgt->sgl);
+		/*
+		 * host1x clients are generally not able to do scatter-gather themselves, so fail
+		 * if the buffer is discontiguous and we fail to map its SG table to a single
+		 * contiguous chunk of I/O virtual memory.
+		 */
+		if (map->chunks > 1) {
+			err = -EINVAL;
+			goto unpin;
 		}
 
-		job->addr_phys[job->num_unpins] = phys_addr;
-		job->unpins[job->num_unpins].bo = reloc->target.bo;
-		job->unpins[job->num_unpins].sgt = sgt;
+		job->addr_phys[job->num_unpins] = map->phys;
+		job->unpins[job->num_unpins].map = map;
 		job->num_unpins++;
 	}
 
@@ -224,12 +206,11 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 		return 0;
 
 	for (i = 0; i < job->num_cmds; i++) {
+		struct host1x_bo_mapping *map;
 		size_t gather_size = 0;
 		struct scatterlist *sg;
-		dma_addr_t phys_addr;
 		unsigned long shift;
 		struct iova *alloc;
-		dma_addr_t *phys;
 		unsigned int j;
 
 		if (job->cmds[i].is_wait)
@@ -243,25 +224,16 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 			goto unpin;
 		}
 
-		/**
-		 * If the host1x is not attached to an IOMMU, there is no need
-		 * to map the buffer object for the host1x, since the physical
-		 * address can simply be used.
-		 */
-		if (!iommu_get_domain_for_dev(host->dev))
-			phys = &phys_addr;
-		else
-			phys = NULL;
-
-		sgt = host1x_bo_pin(host->dev, g->bo, phys);
-		if (IS_ERR(sgt)) {
-			err = PTR_ERR(sgt);
-			goto put;
+		map = host1x_bo_pin(host->dev, g->bo, DMA_TO_DEVICE);
+		if (IS_ERR(map)) {
+			err = PTR_ERR(map);
+			goto unpin;
 		}
 
 		if (host->domain) {
-			for_each_sgtable_sg(sgt, sg, j)
+			for_each_sgtable_sg(map->sgt, sg, j)
 				gather_size += sg->length;
+
 			gather_size = iova_align(&host->iova, gather_size);
 
 			shift = iova_shift(&host->iova);
@@ -272,33 +244,23 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 				goto put;
 			}
 
-			err = iommu_map_sgtable(host->domain,
-					iova_dma_addr(&host->iova, alloc),
-					sgt, IOMMU_READ);
+			err = iommu_map_sgtable(host->domain, iova_dma_addr(&host->iova, alloc),
+						map->sgt, IOMMU_READ);
 			if (err == 0) {
 				__free_iova(&host->iova, alloc);
 				err = -EINVAL;
 				goto put;
 			}
 
-			job->unpins[job->num_unpins].size = gather_size;
-			phys_addr = iova_dma_addr(&host->iova, alloc);
-		} else if (sgt) {
-			err = dma_map_sgtable(host->dev, sgt, DMA_TO_DEVICE, 0);
-			if (err)
-				goto put;
-
-			job->unpins[job->num_unpins].dir = DMA_TO_DEVICE;
-			job->unpins[job->num_unpins].dev = host->dev;
-			phys_addr = sg_dma_address(sgt->sgl);
+			map->phys = iova_dma_addr(&host->iova, alloc);
+			map->size = gather_size;
 		}
 
-		job->addr_phys[job->num_unpins] = phys_addr;
-		job->gather_addr_phys[i] = phys_addr;
-
-		job->unpins[job->num_unpins].bo = g->bo;
-		job->unpins[job->num_unpins].sgt = sgt;
+		job->addr_phys[job->num_unpins] = map->phys;
+		job->unpins[job->num_unpins].map = map;
 		job->num_unpins++;
+
+		job->gather_addr_phys[i] = map->phys;
 	}
 
 	return 0;
@@ -690,22 +652,16 @@ void host1x_job_unpin(struct host1x_job *job)
 	unsigned int i;
 
 	for (i = 0; i < job->num_unpins; i++) {
-		struct host1x_job_unpin_data *unpin = &job->unpins[i];
-		struct device *dev = unpin->dev ?: host->dev;
-		struct sg_table *sgt = unpin->sgt;
-
-		if (!job->enable_firewall && unpin->size && host->domain) {
-			iommu_unmap(host->domain, job->addr_phys[i],
-				    unpin->size);
-			free_iova(&host->iova,
-				iova_pfn(&host->iova, job->addr_phys[i]));
-		}
+		struct host1x_bo_mapping *map = job->unpins[i].map;
+		struct host1x_bo *bo = map->bo;
 
-		if (unpin->dev && sgt)
-			dma_unmap_sgtable(unpin->dev, sgt, unpin->dir, 0);
+		if (!job->enable_firewall && map->size && host->domain) {
+			iommu_unmap(host->domain, job->addr_phys[i], map->size);
+			free_iova(&host->iova, iova_pfn(&host->iova, job->addr_phys[i]));
+		}
 
-		host1x_bo_unpin(dev, unpin->bo, sgt);
-		host1x_bo_put(unpin->bo);
+		host1x_bo_unpin(map);
+		host1x_bo_put(bo);
 	}
 
 	job->num_unpins = 0;
diff --git a/drivers/gpu/host1x/job.h b/drivers/gpu/host1x/job.h
index b4428c5495c9..dad5a1946693 100644
--- a/drivers/gpu/host1x/job.h
+++ b/drivers/gpu/host1x/job.h
@@ -35,11 +35,7 @@ struct host1x_job_cmd {
 };
 
 struct host1x_job_unpin_data {
-	struct host1x_bo *bo;
-	struct sg_table *sgt;
-	struct device *dev;
-	size_t size;
-	enum dma_data_direction dir;
+	struct host1x_bo_mapping *map;
 };
 
 /*
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 2a1b53ebee77..56851523378a 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -7,6 +7,7 @@
 #define __LINUX_HOST1X_H
 
 #include <linux/device.h>
+#include <linux/dma-direction.h>
 #include <linux/types.h>
 
 enum host1x_class {
@@ -84,12 +85,23 @@ struct host1x_client {
 struct host1x_bo;
 struct sg_table;
 
+struct host1x_bo_mapping {
+	struct dma_buf_attachment *attach;
+	enum dma_data_direction direction;
+	struct host1x_bo *bo;
+	struct sg_table *sgt;
+	unsigned int chunks;
+	struct device *dev;
+	dma_addr_t phys;
+	size_t size;
+};
+
 struct host1x_bo_ops {
 	struct host1x_bo *(*get)(struct host1x_bo *bo);
 	void (*put)(struct host1x_bo *bo);
-	struct sg_table *(*pin)(struct device *dev, struct host1x_bo *bo,
-				dma_addr_t *phys);
-	void (*unpin)(struct device *dev, struct sg_table *sgt);
+	struct host1x_bo_mapping *(*pin)(struct device *dev, struct host1x_bo *bo,
+					 enum dma_data_direction dir);
+	void (*unpin)(struct host1x_bo_mapping *map);
 	void *(*mmap)(struct host1x_bo *bo);
 	void (*munmap)(struct host1x_bo *bo, void *addr);
 };
@@ -114,17 +126,15 @@ static inline void host1x_bo_put(struct host1x_bo *bo)
 	bo->ops->put(bo);
 }
 
-static inline struct sg_table *host1x_bo_pin(struct device *dev,
-					     struct host1x_bo *bo,
-					     dma_addr_t *phys)
+static inline struct host1x_bo_mapping *host1x_bo_pin(struct device *dev, struct host1x_bo *bo,
+						      enum dma_data_direction dir)
 {
-	return bo->ops->pin(dev, bo, phys);
+	return bo->ops->pin(dev, bo, dir);
 }
 
-static inline void host1x_bo_unpin(struct device *dev, struct host1x_bo *bo,
-				   struct sg_table *sgt)
+static inline void host1x_bo_unpin(struct host1x_bo_mapping *map)
 {
-	bo->ops->unpin(dev, sgt);
+	map->bo->ops->unpin(map);
 }
 
 static inline void *host1x_bo_mmap(struct host1x_bo *bo)
-- 
2.33.0

