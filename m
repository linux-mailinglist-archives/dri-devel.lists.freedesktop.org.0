Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3E11B4F4F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 23:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B189D89CE0;
	Wed, 22 Apr 2020 21:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B9D89C99
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 21:25:38 +0000 (UTC)
IronPort-SDR: tp7T1bxswWtD57N+n7yf/PYOab+whlDOmMLJ+HYR8rXMJdYcxhscQbdoOaV2enxqJ+0tApf7w1
 IAsnlVFQ9pGQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 14:25:38 -0700
IronPort-SDR: sBt7V5VtRrtFjsv3Oejj5bB/kHyJgry/BdvRHAmp3kGAkag/guHpx6qqd6R+l8XdiRwkLZjfhS
 us1jYqtG2viw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,304,1583222400"; d="scan'208";a="259208508"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by orsmga006.jf.intel.com with ESMTP; 22 Apr 2020 14:25:37 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/i915/dmabuf: dmabuf cleanup
Date: Wed, 22 Apr 2020 17:25:15 -0400
Message-Id: <20200422212519.36276-2-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200422212519.36276-1-michael.j.ruhl@intel.com>
References: <20200422212519.36276-1-michael.j.ruhl@intel.com>
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
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>, jianxin.xiong@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some minor cleanup of some variables to make upcoming patches
a little easier.

Normalize struct sg_table to sgt.
Normalize struct dma_buf_attachment to attach.
checkpatch issues sizeof(), !NULL updates.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 58 +++++++++++-----------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 7db5a793739d..0d9124ad549a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -17,11 +17,11 @@ static struct drm_i915_gem_object *dma_buf_to_obj(struct dma_buf *buf)
 	return to_intel_bo(buf->priv);
 }
 
-static struct sg_table *i915_gem_map_dma_buf(struct dma_buf_attachment *attachment,
+static struct sg_table *i915_gem_map_dma_buf(struct dma_buf_attachment *attach,
 					     enum dma_data_direction dir)
 {
-	struct drm_i915_gem_object *obj = dma_buf_to_obj(attachment->dmabuf);
-	struct sg_table *st;
+	struct drm_i915_gem_object *obj = dma_buf_to_obj(attach->dmabuf);
+	struct sg_table *sgt;
 	struct scatterlist *src, *dst;
 	int ret, i;
 
@@ -30,54 +30,54 @@ static struct sg_table *i915_gem_map_dma_buf(struct dma_buf_attachment *attachme
 		goto err;
 
 	/* Copy sg so that we make an independent mapping */
-	st = kmalloc(sizeof(struct sg_table), GFP_KERNEL);
-	if (st == NULL) {
+	sgt = kmalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt) {
 		ret = -ENOMEM;
 		goto err_unpin_pages;
 	}
 
-	ret = sg_alloc_table(st, obj->mm.pages->nents, GFP_KERNEL);
+	ret = sg_alloc_table(sgt, obj->mm.pages->nents, GFP_KERNEL);
 	if (ret)
 		goto err_free;
 
 	src = obj->mm.pages->sgl;
-	dst = st->sgl;
+	dst = sgt->sgl;
 	for (i = 0; i < obj->mm.pages->nents; i++) {
 		sg_set_page(dst, sg_page(src), src->length, 0);
 		dst = sg_next(dst);
 		src = sg_next(src);
 	}
 
-	if (!dma_map_sg_attrs(attachment->dev,
-			      st->sgl, st->nents, dir,
+	if (!dma_map_sg_attrs(attach->dev,
+			      sgt->sgl, sgt->nents, dir,
 			      DMA_ATTR_SKIP_CPU_SYNC)) {
 		ret = -ENOMEM;
 		goto err_free_sg;
 	}
 
-	return st;
+	return sgt;
 
 err_free_sg:
-	sg_free_table(st);
+	sg_free_table(sgt);
 err_free:
-	kfree(st);
+	kfree(sgt);
 err_unpin_pages:
 	i915_gem_object_unpin_pages(obj);
 err:
 	return ERR_PTR(ret);
 }
 
-static void i915_gem_unmap_dma_buf(struct dma_buf_attachment *attachment,
-				   struct sg_table *sg,
+static void i915_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
+				   struct sg_table *sgt,
 				   enum dma_data_direction dir)
 {
-	struct drm_i915_gem_object *obj = dma_buf_to_obj(attachment->dmabuf);
+	struct drm_i915_gem_object *obj = dma_buf_to_obj(attach->dmabuf);
 
-	dma_unmap_sg_attrs(attachment->dev,
-			   sg->sgl, sg->nents, dir,
+	dma_unmap_sg_attrs(attach->dev,
+			   sgt->sgl, sgt->nents, dir,
 			   DMA_ATTR_SKIP_CPU_SYNC);
-	sg_free_table(sg);
-	kfree(sg);
+	sg_free_table(sgt);
+	kfree(sgt);
 
 	i915_gem_object_unpin_pages(obj);
 }
@@ -194,25 +194,25 @@ struct dma_buf *i915_gem_prime_export(struct drm_gem_object *gem_obj, int flags)
 
 static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
 {
-	struct sg_table *pages;
+	struct sg_table *sgt;
 	unsigned int sg_page_sizes;
 
-	pages = dma_buf_map_attachment(obj->base.import_attach,
-				       DMA_BIDIRECTIONAL);
-	if (IS_ERR(pages))
-		return PTR_ERR(pages);
+	sgt = dma_buf_map_attachment(obj->base.import_attach,
+				     DMA_BIDIRECTIONAL);
+	if (IS_ERR(sgt))
+		return PTR_ERR(sgt);
 
-	sg_page_sizes = i915_sg_page_sizes(pages->sgl);
+	sg_page_sizes = i915_sg_page_sizes(sgt->sgl);
 
-	__i915_gem_object_set_pages(obj, pages, sg_page_sizes);
+	__i915_gem_object_set_pages(obj, sgt, sg_page_sizes);
 
 	return 0;
 }
 
 static void i915_gem_object_put_pages_dmabuf(struct drm_i915_gem_object *obj,
-					     struct sg_table *pages)
+					     struct sg_table *sgt)
 {
-	dma_buf_unmap_attachment(obj->base.import_attach, pages,
+	dma_buf_unmap_attachment(obj->base.import_attach, sgt,
 				 DMA_BIDIRECTIONAL);
 }
 
@@ -250,7 +250,7 @@ struct drm_gem_object *i915_gem_prime_import(struct drm_device *dev,
 	get_dma_buf(dma_buf);
 
 	obj = i915_gem_object_alloc();
-	if (obj == NULL) {
+	if (!obj) {
 		ret = -ENOMEM;
 		goto fail_detach;
 	}
-- 
2.21.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
