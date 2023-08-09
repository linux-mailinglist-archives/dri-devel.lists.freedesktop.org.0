Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C610776598
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 18:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 673A310E46D;
	Wed,  9 Aug 2023 16:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF93D10E469
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 16:53:35 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0A8606607207;
 Wed,  9 Aug 2023 17:53:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1691600014;
 bh=et4jqipkVmssatdTyKRQlEK5mzAyY+19v1DvfrwdiX8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X1hl8TJs8URYOHtq/bj5sOGUrp96IA7m18Kzn+LWM6hlM2l0x9ffKE1CnXMo2UzfJ
 i/hFBrxGolFk+MyRWM9dwOPEO+F7sKTvx1RXHKP9TduaW6O6DeVCFJUfw+jI+4ZSZS
 attOtg2zQxK0LnR1gCyudS3Sjp4Rcmid/XU0YRgWh/Wn4okGxfWDWZQRCCragAdQZ2
 eW2nArexAKBuCa+AkTduCvuii50LSg8okEqId7m/DsI7TELCedSPbyxoC/rP/PyQe0
 qoVdl9rVYoAhN4T3oeiJWdD/XxPUrLqbpAs6A+NLKfUH6uZsgspEqQUanl/ochJ8ZO
 bkrx5e4ZuUbHA==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 01/15] drm/shmem-helper: Make pages_use_count an atomic_t
Date: Wed,  9 Aug 2023 18:53:14 +0200
Message-ID: <20230809165330.2451699-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809165330.2451699-1-boris.brezillon@collabora.com>
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This way we can grab a pages ref without acquiring the resv lock when
pages_use_count > 0. Need to implement asynchronous map using the
drm_gpuva_mgr when the map/unmap operation triggers a mapping split,
requiring the new left/right regions to grab an additional page ref
to guarantee that the pages stay pinned when the middle section is
unmapped.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c  | 28 +++++++++++++------------
 drivers/gpu/drm/lima/lima_gem.c         |  2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c |  2 +-
 include/drm/drm_gem_shmem_helper.h      |  2 +-
 4 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index a783d2245599..ca6938ea1b82 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -155,7 +155,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 		if (shmem->pages)
 			drm_gem_shmem_put_pages(shmem);
 
-		drm_WARN_ON(obj->dev, shmem->pages_use_count);
+		drm_WARN_ON(obj->dev, atomic_read(&shmem->pages_use_count));
 
 		dma_resv_unlock(shmem->base.resv);
 	}
@@ -172,14 +172,14 @@ static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
 
 	dma_resv_assert_held(shmem->base.resv);
 
-	if (shmem->pages_use_count++ > 0)
+	if (atomic_inc_return(&shmem->pages_use_count) > 1)
 		return 0;
 
 	pages = drm_gem_get_pages(obj);
 	if (IS_ERR(pages)) {
 		drm_dbg_kms(obj->dev, "Failed to get pages (%ld)\n",
 			    PTR_ERR(pages));
-		shmem->pages_use_count = 0;
+		atomic_set(&shmem->pages_use_count, 0);
 		return PTR_ERR(pages);
 	}
 
@@ -210,10 +210,10 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
 
 	dma_resv_assert_held(shmem->base.resv);
 
-	if (drm_WARN_ON_ONCE(obj->dev, !shmem->pages_use_count))
+	if (drm_WARN_ON_ONCE(obj->dev, !atomic_read(&shmem->pages_use_count)))
 		return;
 
-	if (--shmem->pages_use_count > 0)
+	if (atomic_dec_return(&shmem->pages_use_count) > 0)
 		return;
 
 #ifdef CONFIG_X86
@@ -263,6 +263,10 @@ int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem)
 
 	drm_WARN_ON(obj->dev, obj->import_attach);
 
+	/* If we are the first owner, we need to grab the lock. */
+	if (atomic_inc_not_zero(&shmem->pages_use_count))
+		return 0;
+
 	ret = dma_resv_lock_interruptible(shmem->base.resv, NULL);
 	if (ret)
 		return ret;
@@ -286,6 +290,10 @@ void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem)
 
 	drm_WARN_ON(obj->dev, obj->import_attach);
 
+	/* If we are the last owner, we need to grab the lock. */
+	if (atomic_add_unless(&shmem->pages_use_count, -1, 1))
+		return;
+
 	dma_resv_lock(shmem->base.resv, NULL);
 	drm_gem_shmem_unpin_locked(shmem);
 	dma_resv_unlock(shmem->base.resv);
@@ -543,18 +551,12 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
 
 	drm_WARN_ON(obj->dev, obj->import_attach);
 
-	dma_resv_lock(shmem->base.resv, NULL);
-
 	/*
 	 * We should have already pinned the pages when the buffer was first
 	 * mmap'd, vm_open() just grabs an additional reference for the new
 	 * mm the vma is getting copied into (ie. on fork()).
 	 */
-	if (!drm_WARN_ON_ONCE(obj->dev, !shmem->pages_use_count))
-		shmem->pages_use_count++;
-
-	dma_resv_unlock(shmem->base.resv);
-
+	drm_WARN_ON_ONCE(obj->dev, atomic_inc_return(&shmem->pages_use_count) == 1);
 	drm_gem_vm_open(vma);
 }
 
@@ -632,7 +634,7 @@ void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
 	if (shmem->base.import_attach)
 		return;
 
-	drm_printf_indent(p, indent, "pages_use_count=%u\n", shmem->pages_use_count);
+	drm_printf_indent(p, indent, "pages_use_count=%u\n", atomic_read(&shmem->pages_use_count));
 	drm_printf_indent(p, indent, "vmap_use_count=%u\n", shmem->vmap_use_count);
 	drm_printf_indent(p, indent, "vaddr=%p\n", shmem->vaddr);
 }
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 4f9736e5f929..0116518b1601 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -47,7 +47,7 @@ int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm)
 		}
 
 		bo->base.pages = pages;
-		bo->base.pages_use_count = 1;
+		atomic_set(&bo->base.pages_use_count, 1);
 
 		mapping_set_unevictable(mapping);
 	}
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index c0123d09f699..f66e63bf743e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -487,7 +487,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 			goto err_unlock;
 		}
 		bo->base.pages = pages;
-		bo->base.pages_use_count = 1;
+		atomic_set(&bo->base.pages_use_count, 1);
 	} else {
 		pages = bo->base.pages;
 		if (pages[page_offset]) {
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index bf0c31aa8fbe..0661f87d3bda 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -37,7 +37,7 @@ struct drm_gem_shmem_object {
 	 * Reference count on the pages table.
 	 * The pages are put when the count reaches zero.
 	 */
-	unsigned int pages_use_count;
+	atomic_t pages_use_count;
 
 	/**
 	 * @madv: State for madvise
-- 
2.41.0

