Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB864949D5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 09:47:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF9F10E8F0;
	Thu, 20 Jan 2022 08:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA92810EEED
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 10:24:00 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id b13so9192293edn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 02:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=j85uReZLdngP6o4mjqty+eKiSWm20pfyWWjzHaNzc+A=;
 b=pEGWeb+EOPIAgc6ndg1ZtvNKOazZM4TD1gbawrYuBLHVEx5e2PjoQl2TpN1g4J2qkm
 kPSRei7R1s+OIYypcfibxY3f/3sWYh9eTFu0JCjgisFu3TDFL/1AtMsbbwrhmjf8FLX0
 LoRl0sLT3DXZc4mR+KQYq86rUGXX0I7a3obeyANZ9aBkmM/FOGeUqLEusc4pyFhYHU6B
 SbyR1b+RYRyHgBR6PdbQkSBSBBpKxj2PspkEQI4PV/X0uovvC0k2aPzkhPl3K8vgwA8B
 Uj7k+DbUPkIyqpg57QvRHPfPg0mpYHUXRFLfuB/ykuZc63QgWotWaoYUrSqfgzYj5BnS
 KMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=j85uReZLdngP6o4mjqty+eKiSWm20pfyWWjzHaNzc+A=;
 b=7wsyADUsCimccHZqgmNfhGWV5eiOBQO77xwBNZVoB+3KzFVfGUpdyNMnSfrSJzerjL
 5c014L7R6GYvwznqm9e6UFqZtMaZ8C9FMWM1s520Y4G43ohdT3Ws3CZK2TpJzxLMH7ao
 E4c6glaS3NgBwqFE1mmuzoZcFlt1BquVCOwXT0kSb5zX9BR4XG0eh+mg9wHRpSNW3ivy
 BP1uhRT7j64pHnQFWWNUYrIS47U9QXRVMB8K9l8DGrvxo4iWTqR7MNKX0u227ixCD9f+
 NZ4/4cz2wXSeSDhq/tA1hg2LRXeqBT6BBgJ49B24ox5YOT2GZWceKfEmplT8MYQqu5rF
 /oWA==
X-Gm-Message-State: AOAM530r+FQA1mmOe3wKwO+gbsAqwJHQzvLjrjn4jpwpRBtQcgwiuduF
 KEkO0lcMgmLYs6DVjrw7v2s=
X-Google-Smtp-Source: ABdhPJwb4d8yF6xUuXjLf7nRtYbQUWtSD1EJVjuQbQvcZQssNV7b4oeXHadqFsUUsVxAhz7nIS9LmA==
X-Received: by 2002:a17:907:970d:: with SMTP id
 jg13mr22955093ejc.121.1642587839539; 
 Wed, 19 Jan 2022 02:23:59 -0800 (PST)
Received: from localhost.localdomain ([46.249.74.23])
 by smtp.gmail.com with ESMTPSA id b4sm3456546ejb.131.2022.01.19.02.23.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jan 2022 02:23:59 -0800 (PST)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: tomba@kernel.org,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 2/3] drm: omapdrm: Support exporting of non-contiguous GEM BOs
Date: Wed, 19 Jan 2022 12:23:10 +0200
Message-Id: <1642587791-13222-3-git-send-email-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
References: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
X-Mailman-Approved-At: Thu, 20 Jan 2022 08:47:25 +0000
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
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, tony@atomide.com,
 merlijn@wizzup.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently code allocates non-scanout BOs from SHMEM and those objects are
accessible to userspace by mmap(). However, on devices with no DMM (like
OMAP3), the same objects are not accessible by kernel drivers that want to
render to them as code refuses to export them. In turn this means that on
devices with no DMM, all buffers must be allocated as scanout, otherwise
only CPU can access them. On those devices, scanout buffers are allocated
from CMA, making those allocations highly unreliable.

Fix that by implementing functionality to export SHMEM backed buffers on
devices with no DMM. This makes CMA memory only being used when needed,
instead for every buffer that has to be off-CPU rendered.

Tested on Motorola Droid4 and Nokia N900

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 drivers/gpu/drm/omapdrm/omap_gem.c        | 125 +++++++++++++++++-------------
 drivers/gpu/drm/omapdrm/omap_gem.h        |   3 +-
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c |   5 +-
 3 files changed, 73 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index bb12cb4..41c1a6d 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -38,7 +38,7 @@ struct omap_gem_object {
 	/** roll applied when mapping to DMM */
 	u32 roll;
 
-	/** protects dma_addr_cnt, block, pages, dma_addrs and vaddr */
+	/** protects pin_cnt, block, pages, dma_addrs and vaddr */
 	struct mutex lock;
 
 	/**
@@ -50,24 +50,24 @@ struct omap_gem_object {
 	 * - buffers imported from dmabuf (with the OMAP_BO_MEM_DMABUF flag set)
 	 *   if they are physically contiguous (when sgt->orig_nents == 1)
 	 *
-	 * - buffers mapped through the TILER when dma_addr_cnt is not zero, in
-	 *   which case the DMA address points to the TILER aperture
+	 * - buffers mapped through the TILER when pin_cnt is not zero, in which
+	 *   case the DMA address points to the TILER aperture
 	 *
 	 * Physically contiguous buffers have their DMA address equal to the
 	 * physical address as we don't remap those buffers through the TILER.
 	 *
 	 * Buffers mapped to the TILER have their DMA address pointing to the
-	 * TILER aperture. As TILER mappings are refcounted (through
-	 * dma_addr_cnt) the DMA address must be accessed through omap_gem_pin()
-	 * to ensure that the mapping won't disappear unexpectedly. References
-	 * must be released with omap_gem_unpin().
+	 * TILER aperture. As TILER mappings are refcounted (through pin_cnt)
+	 * the DMA address must be accessed through omap_gem_pin() to ensure
+	 * that the mapping won't disappear unexpectedly. References must be
+	 * released with omap_gem_unpin().
 	 */
 	dma_addr_t dma_addr;
 
 	/**
-	 * # of users of dma_addr
+	 * # of users
 	 */
-	refcount_t dma_addr_cnt;
+	refcount_t pin_cnt;
 
 	/**
 	 * If the buffer has been imported from a dmabuf the OMAP_DB_DMABUF flag
@@ -812,32 +812,28 @@ int omap_gem_pin(struct drm_gem_object *obj, dma_addr_t *dma_addr)
 
 	mutex_lock(&omap_obj->lock);
 
-	if (!omap_gem_is_contiguous(omap_obj) && priv->has_dmm) {
-		if (refcount_read(&omap_obj->dma_addr_cnt) == 0) {
+	if (!omap_gem_is_contiguous(omap_obj)) {
+		if (refcount_read(&omap_obj->pin_cnt) == 0) {
 
-			refcount_set(&omap_obj->dma_addr_cnt, 1);
+			refcount_set(&omap_obj->pin_cnt, 1);
 
 			ret = omap_gem_attach_pages(obj);
 			if (ret)
 				goto fail;
 
-			ret = omap_gem_pin_tiler(obj);
-			if (ret)
-				goto fail;
+			if (priv->has_dmm) {
+				ret = omap_gem_pin_tiler(obj);
+				if (ret)
+					goto fail;
+			}
 		} else {
-			refcount_inc(&omap_obj->dma_addr_cnt);
+			refcount_inc(&omap_obj->pin_cnt);
 		}
-
-		if (dma_addr)
-			*dma_addr = omap_obj->dma_addr;
-	} else if (omap_gem_is_contiguous(omap_obj)) {
-		if (dma_addr)
-			*dma_addr = omap_obj->dma_addr;
-	} else {
-		ret = -EINVAL;
-		goto fail;
 	}
 
+	if (dma_addr)
+		*dma_addr = omap_obj->dma_addr;
+
 fail:
 	mutex_unlock(&omap_obj->lock);
 
@@ -856,27 +852,29 @@ static void omap_gem_unpin_locked(struct drm_gem_object *obj)
 	struct omap_gem_object *omap_obj = to_omap_bo(obj);
 	int ret;
 
-	if (omap_gem_is_contiguous(omap_obj) || !priv->has_dmm)
+	if (omap_gem_is_contiguous(omap_obj))
 		return;
 
-	if (refcount_dec_and_test(&omap_obj->dma_addr_cnt)) {
+	if (refcount_dec_and_test(&omap_obj->pin_cnt)) {
 		if (omap_obj->sgt) {
 			sg_free_table(omap_obj->sgt);
 			kfree(omap_obj->sgt);
 			omap_obj->sgt = NULL;
 		}
-		ret = tiler_unpin(omap_obj->block);
-		if (ret) {
-			dev_err(obj->dev->dev,
-				"could not unpin pages: %d\n", ret);
-		}
-		ret = tiler_release(omap_obj->block);
-		if (ret) {
-			dev_err(obj->dev->dev,
-				"could not release unmap: %d\n", ret);
+		if (priv->has_dmm) {
+			ret = tiler_unpin(omap_obj->block);
+			if (ret) {
+				dev_err(obj->dev->dev,
+					"could not unpin pages: %d\n", ret);
+			}
+			ret = tiler_release(omap_obj->block);
+			if (ret) {
+				dev_err(obj->dev->dev,
+					"could not release unmap: %d\n", ret);
+			}
+			omap_obj->dma_addr = 0;
+			omap_obj->block = NULL;
 		}
-		omap_obj->dma_addr = 0;
-		omap_obj->block = NULL;
 	}
 }
 
@@ -909,7 +907,7 @@ int omap_gem_rotated_dma_addr(struct drm_gem_object *obj, u32 orient,
 
 	mutex_lock(&omap_obj->lock);
 
-	if ((refcount_read(&omap_obj->dma_addr_cnt) > 0) && omap_obj->block &&
+	if ((refcount_read(&omap_obj->pin_cnt) > 0) && omap_obj->block &&
 			(omap_obj->flags & OMAP_BO_TILED_MASK)) {
 		*dma_addr = tiler_tsptr(omap_obj->block, orient, x, y);
 		ret = 0;
@@ -977,7 +975,8 @@ int omap_gem_put_pages(struct drm_gem_object *obj)
 	return 0;
 }
 
-struct sg_table *omap_gem_get_sg(struct drm_gem_object *obj)
+struct sg_table *omap_gem_get_sg(struct drm_gem_object *obj,
+		enum dma_data_direction dir)
 {
 	struct omap_gem_object *omap_obj = to_omap_bo(obj);
 	dma_addr_t addr;
@@ -1002,28 +1001,44 @@ struct sg_table *omap_gem_get_sg(struct drm_gem_object *obj)
 		goto err_unpin;
 	}
 
-	if (omap_obj->flags & OMAP_BO_TILED_MASK) {
-		enum tiler_fmt fmt = gem2fmt(omap_obj->flags);
+	if (addr) {
+		if (omap_obj->flags & OMAP_BO_TILED_MASK) {
+			enum tiler_fmt fmt = gem2fmt(omap_obj->flags);
 
-		len = omap_obj->width << (int)fmt;
-		count = omap_obj->height;
-		stride = tiler_stride(fmt, 0);
+			len = omap_obj->width << (int)fmt;
+			count = omap_obj->height;
+			stride = tiler_stride(fmt, 0);
+		} else {
+			len = obj->size;
+			count = 1;
+			stride = 0;
+		}
 	} else {
-		len = obj->size;
-		count = 1;
-		stride = 0;
+		count = obj->size >> PAGE_SHIFT;
 	}
 
 	ret = sg_alloc_table(sgt, count, GFP_KERNEL);
 	if (ret)
 		goto err_free;
 
-	for_each_sg(sgt->sgl, sg, count, i) {
-		sg_set_page(sg, phys_to_page(addr), len, offset_in_page(addr));
-		sg_dma_address(sg) = addr;
-		sg_dma_len(sg) = len;
+	/* this must be after omap_gem_pin() to ensure we have pages attached */
+	omap_gem_dma_sync_buffer(obj, dir);
+
+	if (addr) {
+		for_each_sg(sgt->sgl, sg, count, i) {
+			sg_set_page(sg, phys_to_page(addr), len,
+				offset_in_page(addr));
+			sg_dma_address(sg) = addr;
+			sg_dma_len(sg) = len;
 
-		addr += stride;
+			addr += stride;
+		}
+	} else {
+		for_each_sg(sgt->sgl, sg, count, i) {
+			sg_set_page(sg, omap_obj->pages[i], PAGE_SIZE, 0);
+			sg_dma_address(sg) = omap_obj->dma_addrs[i];
+			sg_dma_len(sg) =  PAGE_SIZE;
+		}
 	}
 
 	omap_obj->sgt = sgt;
@@ -1133,7 +1148,7 @@ void omap_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 	seq_printf(m, "%08x: %2d (%2d) %08llx %pad (%2d) %p %4d",
 			omap_obj->flags, obj->name, kref_read(&obj->refcount),
 			off, &omap_obj->dma_addr,
-			refcount_read(&omap_obj->dma_addr_cnt),
+			refcount_read(&omap_obj->pin_cnt),
 			omap_obj->vaddr, omap_obj->roll);
 
 	if (omap_obj->flags & OMAP_BO_TILED_MASK) {
@@ -1196,7 +1211,7 @@ static void omap_gem_free_object(struct drm_gem_object *obj)
 	mutex_lock(&omap_obj->lock);
 
 	/* The object should not be pinned. */
-	WARN_ON(refcount_read(&omap_obj->dma_addr_cnt) > 0);
+	WARN_ON(refcount_read(&omap_obj->pin_cnt) > 0);
 
 	if (omap_obj->pages) {
 		if (omap_obj->flags & OMAP_BO_MEM_DMABUF)
diff --git a/drivers/gpu/drm/omapdrm/omap_gem.h b/drivers/gpu/drm/omapdrm/omap_gem.h
index 19209e3..4d44889 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.h
+++ b/drivers/gpu/drm/omapdrm/omap_gem.h
@@ -82,7 +82,8 @@ int omap_gem_get_pages(struct drm_gem_object *obj, struct page ***pages,
 int omap_gem_rotated_dma_addr(struct drm_gem_object *obj, u32 orient,
 		int x, int y, dma_addr_t *dma_addr);
 int omap_gem_tiled_stride(struct drm_gem_object *obj, u32 orient);
-struct sg_table *omap_gem_get_sg(struct drm_gem_object *obj);
+struct sg_table *omap_gem_get_sg(struct drm_gem_object *obj,
+		enum dma_data_direction dir);
 void omap_gem_put_sg(struct drm_gem_object *obj, struct sg_table *sgt);
 
 #endif /* __OMAPDRM_GEM_H__ */
diff --git a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
index 57af3d9..8d15e07 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
@@ -23,13 +23,10 @@ static struct sg_table *omap_gem_map_dma_buf(
 {
 	struct drm_gem_object *obj = attachment->dmabuf->priv;
 	struct sg_table *sg;
-	sg = omap_gem_get_sg(obj);
+	sg = omap_gem_get_sg(obj, dir);
 	if (IS_ERR(sg))
 		return sg;
 
-	/* this must be after omap_gem_pin() to ensure we have pages attached */
-	omap_gem_dma_sync_buffer(obj, dir);
-
 	return sg;
 }
 
-- 
1.9.1

