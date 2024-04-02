Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAE689601E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 01:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F9911217D;
	Tue,  2 Apr 2024 23:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="ToNpjd3q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E14C112179
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 23:28:24 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-221e1910c3bso3512543fac.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 16:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712100503; x=1712705303;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pfNYMTDlN2GfeseaH7J+vDv3bP68/U5bYmfwpkgMFSQ=;
 b=ToNpjd3q7tWJcJwQrdJjRIjkYElyQfJg0jWmV0YMtdcOChgTNKRqRK5M0JbjtywYDz
 pFc2cVU21CroUyOsOToKSQ2NiNFdG59w0XQKy7b/KD9pRZORmn7rAAWwPzRNtJ8aVh04
 B1pT0IgxhRoyYOw+frzALam5hJP0PpbKw3Mt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712100503; x=1712705303;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pfNYMTDlN2GfeseaH7J+vDv3bP68/U5bYmfwpkgMFSQ=;
 b=StPv0OZlJsKetXT4IkLfEfLSNgDIFXDAwqodxd+BHyak0KNKZDZbtROKOwR5Ixcxo7
 0jZfyp4ySyx77U2ngOC8kwMXXcKi60hwZqReu7bMpdSbZXJCl5isyC3rQy3LKcbcr9Uv
 grgyWf0TXCh13yESeEUVEVm1H6/0Tb4keGSPGNVoZcr9C5BYroRN/OZ4FFlT5O6M53pW
 bgssuUclzLSHUf5+L8ZbEEQDP3e8AFY59xa2zrSv5G5mRp7nDZ643KZR+/Yfak+GyTiI
 1ROSvubElMkfFj4jJOgdMmiZzUTqdc0OsFuEAX68PDlcQu22Bv6oFVIhDmqPT6ODY7IG
 MTcQ==
X-Gm-Message-State: AOJu0Yylss+9NDyXrhUB5mGHPUD/12y4u9QIn+SgebtDA2Xg7kFdoyzz
 /5XFEl931MpcEJbNnzMHT71cDsQLK7PX6JqT3B7MnIvgelcHWP54GvIPcVADM6JUF4VdxRdq1T7
 plYyRrxQgfY3i3OhrEaV3Rah7BxrzTLEl2tqlLtsMEW6PEiiH3lbDSaSw/rRB5GaoM+k1smdPx+
 GZBG5aTZPcf1p3HqSdfwI34srAecLY+RLsW+gxL/i4mhzhiSCEXg==
X-Google-Smtp-Source: AGHT+IHPnZHUOLp3NdJzPv33xnOnr98stKEJedm+zpdOJSfoSl9JT+45APc5dI0whw8gT+tC93I9Mw==
X-Received: by 2002:a05:6870:b621:b0:222:6495:642a with SMTP id
 cm33-20020a056870b62100b002226495642amr16097743oab.46.1712100502946; 
 Tue, 02 Apr 2024 16:28:22 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 i21-20020aa787d5000000b006eaada3860dsm10385121pfo.200.2024.04.02.16.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 16:28:22 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>, stable@vger.kernel.org
Subject: [PATCH 3/5] drm/vmwgfx: Fix prime import/export
Date: Tue,  2 Apr 2024 19:28:11 -0400
Message-Id: <20240402232813.2670131-4-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402232813.2670131-1-zack.rusin@broadcom.com>
References: <20240402232813.2670131-1-zack.rusin@broadcom.com>
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

vmwgfx never supported prime import of external buffers. Furthermore the
driver exposes two different objects to userspace: vmw_surface's and
gem buffers but prime import/export only worked with vmw_surfaces.

Because gem buffers are used through the dumb_buffer interface this meant
that the driver created buffers couldn't have been prime exported or
imported.

Fix prime import/export. Makes IGT's kms_prime pass.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Fixes: 8afa13a0583f ("drm/vmwgfx: Implement DRIVER_GEM")
Cc: <stable@vger.kernel.org> # v6.6+
---
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c       | 35 +++++++++++++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         |  7 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.h         |  2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c        |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  3 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c        | 32 ++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_prime.c      | 15 +++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 44 +++++++++++++++-------
 8 files changed, 117 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
index c52c7bf1485b..717d624e9a05 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
@@ -456,8 +456,10 @@ int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
 		.no_wait_gpu = false
 	};
 	u32 j, initial_line = dst_offset / dst_stride;
-	struct vmw_bo_blit_line_data d;
+	struct vmw_bo_blit_line_data d = {0};
 	int ret = 0;
+	struct page **dst_pages = NULL;
+	struct page **src_pages = NULL;
 
 	/* Buffer objects need to be either pinned or reserved: */
 	if (!(dst->pin_count))
@@ -477,12 +479,35 @@ int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
 			return ret;
 	}
 
+	if (!src->ttm->pages && src->ttm->sg) {
+		src_pages = kvmalloc_array(src->ttm->num_pages,
+					   sizeof(struct page *), GFP_KERNEL);
+		if (!src_pages)
+			return -ENOMEM;
+		ret = drm_prime_sg_to_page_array(src->ttm->sg, src_pages,
+						 src->ttm->num_pages);
+		if (ret)
+			goto out;
+	}
+	if (!dst->ttm->pages && dst->ttm->sg) {
+		dst_pages = kvmalloc_array(dst->ttm->num_pages,
+					   sizeof(struct page *), GFP_KERNEL);
+		if (!dst_pages) {
+			ret = -ENOMEM;
+			goto out;
+		}
+		ret = drm_prime_sg_to_page_array(dst->ttm->sg, dst_pages,
+						 dst->ttm->num_pages);
+		if (ret)
+			goto out;
+	}
+
 	d.mapped_dst = 0;
 	d.mapped_src = 0;
 	d.dst_addr = NULL;
 	d.src_addr = NULL;
-	d.dst_pages = dst->ttm->pages;
-	d.src_pages = src->ttm->pages;
+	d.dst_pages = dst->ttm->pages ? dst->ttm->pages : dst_pages;
+	d.src_pages = src->ttm->pages ? src->ttm->pages : src_pages;
 	d.dst_num_pages = PFN_UP(dst->resource->size);
 	d.src_num_pages = PFN_UP(src->resource->size);
 	d.dst_prot = ttm_io_prot(dst, dst->resource, PAGE_KERNEL);
@@ -504,6 +529,10 @@ int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
 		kunmap_atomic(d.src_addr);
 	if (d.dst_addr)
 		kunmap_atomic(d.dst_addr);
+	if (src_pages)
+		kvfree(src_pages);
+	if (dst_pages)
+		kvfree(dst_pages);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index bfd41ce3c8f4..e5eb21a471a6 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -377,7 +377,8 @@ static int vmw_bo_init(struct vmw_private *dev_priv,
 {
 	struct ttm_operation_ctx ctx = {
 		.interruptible = params->bo_type != ttm_bo_type_kernel,
-		.no_wait_gpu = false
+		.no_wait_gpu = false,
+		.resv = params->resv,
 	};
 	struct ttm_device *bdev = &dev_priv->bdev;
 	struct drm_device *vdev = &dev_priv->drm;
@@ -394,8 +395,8 @@ static int vmw_bo_init(struct vmw_private *dev_priv,
 
 	vmw_bo_placement_set(vmw_bo, params->domain, params->busy_domain);
 	ret = ttm_bo_init_reserved(bdev, &vmw_bo->tbo, params->bo_type,
-				   &vmw_bo->placement, 0, &ctx, NULL,
-				   NULL, destroy);
+				   &vmw_bo->placement, 0, &ctx,
+				   params->sg, params->resv, destroy);
 	if (unlikely(ret))
 		return ret;
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
index 0d496dc9c6af..f349642e6190 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
@@ -55,6 +55,8 @@ struct vmw_bo_params {
 	enum ttm_bo_type bo_type;
 	size_t size;
 	bool pin;
+	struct dma_resv *resv;
+	struct sg_table *sg;
 };
 
 /**
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 89d3679d2608..41ad13e45554 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1631,6 +1631,7 @@ static const struct drm_driver driver = {
 
 	.prime_fd_to_handle = vmw_prime_fd_to_handle,
 	.prime_handle_to_fd = vmw_prime_handle_to_fd,
+	.gem_prime_import_sg_table = vmw_prime_import_sg_table,
 
 	.fops = &vmwgfx_driver_fops,
 	.name = VMWGFX_DRIVER_NAME,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index ddbceaa31b59..4ecaea0026fc 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -1107,6 +1107,9 @@ extern int vmw_prime_handle_to_fd(struct drm_device *dev,
 				  struct drm_file *file_priv,
 				  uint32_t handle, uint32_t flags,
 				  int *prime_fd);
+struct drm_gem_object *vmw_prime_import_sg_table(struct drm_device *dev,
+						 struct dma_buf_attachment *attach,
+						 struct sg_table *table);
 
 /*
  * MemoryOBject management -  vmwgfx_mob.c
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
index 186150f41fbc..2132a8ad8c0c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
@@ -136,6 +136,38 @@ int vmw_gem_object_create_with_handle(struct vmw_private *dev_priv,
 	return ret;
 }
 
+struct drm_gem_object *vmw_prime_import_sg_table(struct drm_device *dev,
+						 struct dma_buf_attachment *attach,
+						 struct sg_table *table)
+{
+	int ret;
+	struct vmw_private *dev_priv = vmw_priv(dev);
+	struct drm_gem_object *gem = NULL;
+	struct vmw_bo *vbo;
+	struct vmw_bo_params params = {
+		.domain = (dev_priv->has_mob) ? VMW_BO_DOMAIN_SYS : VMW_BO_DOMAIN_VRAM,
+		.busy_domain = VMW_BO_DOMAIN_SYS,
+		.bo_type = ttm_bo_type_sg,
+		.size = attach->dmabuf->size,
+		.pin = false,
+		.resv = attach->dmabuf->resv,
+		.sg = table,
+
+	};
+
+	dma_resv_lock(params.resv, NULL);
+
+	ret = vmw_bo_create(dev_priv, &params, &vbo);
+	if (ret != 0)
+		goto out_no_bo;
+
+	vbo->tbo.base.funcs = &vmw_gem_object_funcs;
+
+	gem = &vbo->tbo.base;
+out_no_bo:
+	dma_resv_unlock(params.resv);
+	return gem;
+}
 
 int vmw_gem_object_create_ioctl(struct drm_device *dev, void *data,
 				struct drm_file *filp)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_prime.c b/drivers/gpu/drm/vmwgfx/vmwgfx_prime.c
index 2d72a5ee7c0c..c99cad444991 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_prime.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_prime.c
@@ -75,8 +75,12 @@ int vmw_prime_fd_to_handle(struct drm_device *dev,
 			   int fd, u32 *handle)
 {
 	struct ttm_object_file *tfile = vmw_fpriv(file_priv)->tfile;
+	int ret = ttm_prime_fd_to_handle(tfile, fd, handle);
 
-	return ttm_prime_fd_to_handle(tfile, fd, handle);
+	if (ret)
+		ret = drm_gem_prime_fd_to_handle(dev, file_priv, fd, handle);
+
+	return ret;
 }
 
 int vmw_prime_handle_to_fd(struct drm_device *dev,
@@ -85,5 +89,12 @@ int vmw_prime_handle_to_fd(struct drm_device *dev,
 			   int *prime_fd)
 {
 	struct ttm_object_file *tfile = vmw_fpriv(file_priv)->tfile;
-	return ttm_prime_handle_to_fd(tfile, handle, flags, prime_fd);
+	int ret;
+
+	if (handle > VMWGFX_NUM_MOB)
+		ret = ttm_prime_handle_to_fd(tfile, handle, flags, prime_fd);
+	else
+		ret = drm_gem_prime_handle_to_fd(dev, file_priv, handle, flags, prime_fd);
+
+	return ret;
 }
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 4d23d0a70bcb..621d98b376bb 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -188,13 +188,18 @@ static int vmw_ttm_map_dma(struct vmw_ttm_tt *vmw_tt)
 	switch (dev_priv->map_mode) {
 	case vmw_dma_map_bind:
 	case vmw_dma_map_populate:
-		vsgt->sgt = &vmw_tt->sgt;
-		ret = sg_alloc_table_from_pages_segment(
-			&vmw_tt->sgt, vsgt->pages, vsgt->num_pages, 0,
-			(unsigned long)vsgt->num_pages << PAGE_SHIFT,
-			dma_get_max_seg_size(dev_priv->drm.dev), GFP_KERNEL);
-		if (ret)
-			goto out_sg_alloc_fail;
+		if (vmw_tt->dma_ttm.page_flags  & TTM_TT_FLAG_EXTERNAL) {
+			vsgt->sgt = vmw_tt->dma_ttm.sg;
+		} else {
+			vsgt->sgt = &vmw_tt->sgt;
+			ret = sg_alloc_table_from_pages_segment(&vmw_tt->sgt,
+				vsgt->pages, vsgt->num_pages, 0,
+				(unsigned long)vsgt->num_pages << PAGE_SHIFT,
+				dma_get_max_seg_size(dev_priv->drm.dev),
+				GFP_KERNEL);
+			if (ret)
+				goto out_sg_alloc_fail;
+		}
 
 		ret = vmw_ttm_map_for_dma(vmw_tt);
 		if (unlikely(ret != 0))
@@ -209,8 +214,9 @@ static int vmw_ttm_map_dma(struct vmw_ttm_tt *vmw_tt)
 	return 0;
 
 out_map_fail:
-	sg_free_table(vmw_tt->vsgt.sgt);
-	vmw_tt->vsgt.sgt = NULL;
+	drm_warn(&dev_priv->drm, "VSG table map failed!");
+	sg_free_table(vsgt->sgt);
+	vsgt->sgt = NULL;
 out_sg_alloc_fail:
 	return ret;
 }
@@ -356,15 +362,17 @@ static void vmw_ttm_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
 static int vmw_ttm_populate(struct ttm_device *bdev,
 			    struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
 {
-	int ret;
+	bool external = (ttm->page_flags & TTM_TT_FLAG_EXTERNAL) != 0;
 
-	/* TODO: maybe completely drop this ? */
 	if (ttm_tt_is_populated(ttm))
 		return 0;
 
-	ret = ttm_pool_alloc(&bdev->pool, ttm, ctx);
+	if (external && ttm->sg)
+		return  drm_prime_sg_to_dma_addr_array(ttm->sg,
+						       ttm->dma_address,
+						       ttm->num_pages);
 
-	return ret;
+	return ttm_pool_alloc(&bdev->pool, ttm, ctx);
 }
 
 static void vmw_ttm_unpopulate(struct ttm_device *bdev,
@@ -372,6 +380,10 @@ static void vmw_ttm_unpopulate(struct ttm_device *bdev,
 {
 	struct vmw_ttm_tt *vmw_tt = container_of(ttm, struct vmw_ttm_tt,
 						 dma_ttm);
+	bool external = (ttm->page_flags & TTM_TT_FLAG_EXTERNAL) != 0;
+
+	if (external)
+		return;
 
 	vmw_ttm_unbind(bdev, ttm);
 
@@ -390,6 +402,7 @@ static struct ttm_tt *vmw_ttm_tt_create(struct ttm_buffer_object *bo,
 {
 	struct vmw_ttm_tt *vmw_be;
 	int ret;
+	bool external = bo->type == ttm_bo_type_sg;
 
 	vmw_be = kzalloc(sizeof(*vmw_be), GFP_KERNEL);
 	if (!vmw_be)
@@ -398,7 +411,10 @@ static struct ttm_tt *vmw_ttm_tt_create(struct ttm_buffer_object *bo,
 	vmw_be->dev_priv = vmw_priv_from_ttm(bo->bdev);
 	vmw_be->mob = NULL;
 
-	if (vmw_be->dev_priv->map_mode == vmw_dma_alloc_coherent)
+	if (external)
+		page_flags |= TTM_TT_FLAG_EXTERNAL | TTM_TT_FLAG_EXTERNAL_MAPPABLE;
+
+	if (vmw_be->dev_priv->map_mode == vmw_dma_alloc_coherent || external)
 		ret = ttm_sg_tt_init(&vmw_be->dma_ttm, bo, page_flags,
 				     ttm_cached);
 	else
-- 
2.40.1

