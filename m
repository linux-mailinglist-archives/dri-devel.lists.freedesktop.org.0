Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9F878A0A7
	for <lists+dri-devel@lfdr.de>; Sun, 27 Aug 2023 19:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7050310E1ED;
	Sun, 27 Aug 2023 17:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5636810E1D8;
 Sun, 27 Aug 2023 17:56:14 +0000 (UTC)
Received: from workpc.. (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9602766072AC;
 Sun, 27 Aug 2023 18:56:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693158973;
 bh=QUE15l49Vy2Mm2iNdtx68DoK3cUPhFFXaVfUeuwXxjE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IK+L/f4YJfT49LgtwI608Dhd+wPJIBCTmNsceuOKea9Vpb4zkwnYSdhbMt9onTEbH
 a+Ru9PBapO9uFP4dkAK6pn029m2qMvse+eoKU0PHxrCP5yDCN1/MT2352UvL0gP1u7
 0cnlyPhZss7fdMcgFxt3VcqcMM1ClaxArzLb/+vncM+NM0JotORI07RTQBDpoUCWVz
 Mfm9cM2zAy8dgHBIYoWapBd+j6jyXtiiJTLkxYBFrvD86OAVA46YauYz4YmfHSqgOq
 ZsfJxKL8Nrg48m6iJfs/6L6ksE6AVQkeDIQIfBw4Rj5oYNO/0/O7RUqLocQ3nN3Bzn
 MVP1VY9KPrUFw==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v15 13/23] drm/shmem-helper: Use kref for pages_use_count
Date: Sun, 27 Aug 2023 20:54:39 +0300
Message-ID: <20230827175449.1766701-14-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230827175449.1766701-1-dmitry.osipenko@collabora.com>
References: <20230827175449.1766701-1-dmitry.osipenko@collabora.com>
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
Cc: intel-gfx@lists.freedesktop.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use atomic kref helper for pages_use_count to optimize pin/unpin functions
by skipping reservation locking while GEM's pin refcount > 1.

Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c  | 48 ++++++++++++++-----------
 drivers/gpu/drm/lima/lima_gem.c         |  2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c |  2 +-
 include/drm/drm_gem_shmem_helper.h      |  2 +-
 4 files changed, 30 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 1a7e5c332fd8..5a2e37b3e51d 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -155,7 +155,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 		if (shmem->got_sgt)
 			drm_gem_shmem_put_pages_locked(shmem);
 
-		drm_WARN_ON(obj->dev, shmem->pages_use_count);
+		drm_WARN_ON(obj->dev, kref_read(&shmem->pages_use_count));
 
 		dma_resv_unlock(shmem->base.resv);
 	}
@@ -172,14 +172,13 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
 
 	dma_resv_assert_held(shmem->base.resv);
 
-	if (shmem->pages_use_count++ > 0)
+	if (kref_get_unless_zero(&shmem->pages_use_count))
 		return 0;
 
 	pages = drm_gem_get_pages(obj);
 	if (IS_ERR(pages)) {
 		drm_dbg_kms(obj->dev, "Failed to get pages (%ld)\n",
 			    PTR_ERR(pages));
-		shmem->pages_use_count = 0;
 		return PTR_ERR(pages);
 	}
 
@@ -195,26 +194,20 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
 
 	shmem->pages = pages;
 
+	kref_init(&shmem->pages_use_count);
+
 	return 0;
 }
 
-/*
- * drm_gem_shmem_put_pages_locked - Decrease use count on the backing pages for a shmem GEM object
- * @shmem: shmem GEM object
- *
- * This function decreases the use count and puts the backing pages when use drops to zero.
- */
-void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
-{
-	struct drm_gem_object *obj = &shmem->base;
-
-	dma_resv_assert_held(shmem->base.resv);
 
-	if (drm_WARN_ON_ONCE(obj->dev, !shmem->pages_use_count))
-		return;
+static void drm_gem_shmem_kref_release_pages(struct kref *kref)
+{
+	struct drm_gem_shmem_object *shmem;
+	struct drm_gem_object *obj;
 
-	if (--shmem->pages_use_count > 0)
-		return;
+	shmem = container_of(kref, struct drm_gem_shmem_object,
+			     pages_use_count);
+	obj = &shmem->base;
 
 #ifdef CONFIG_X86
 	if (shmem->map_wc)
@@ -226,6 +219,19 @@ void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
 			  shmem->pages_mark_accessed_on_put);
 	shmem->pages = NULL;
 }
+
+/*
+ * drm_gem_shmem_put_pages_locked - Decrease use count on the backing pages for a shmem GEM object
+ * @shmem: shmem GEM object
+ *
+ * This function decreases the use count and puts the backing pages when use drops to zero.
+ */
+void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
+{
+	dma_resv_assert_held(shmem->base.resv);
+
+	kref_put(&shmem->pages_use_count, drm_gem_shmem_kref_release_pages);
+}
 EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages_locked);
 
 static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
@@ -556,8 +562,8 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
 	 * mmap'd, vm_open() just grabs an additional reference for the new
 	 * mm the vma is getting copied into (ie. on fork()).
 	 */
-	if (!drm_WARN_ON_ONCE(obj->dev, !shmem->pages_use_count))
-		shmem->pages_use_count++;
+	drm_WARN_ON_ONCE(obj->dev,
+			 !kref_get_unless_zero(&shmem->pages_use_count));
 
 	dma_resv_unlock(shmem->base.resv);
 
@@ -638,7 +644,7 @@ void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
 	if (shmem->base.import_attach)
 		return;
 
-	drm_printf_indent(p, indent, "pages_use_count=%u\n", shmem->pages_use_count);
+	drm_printf_indent(p, indent, "pages_use_count=%u\n", kref_read(&shmem->pages_use_count));
 	drm_printf_indent(p, indent, "vmap_use_count=%u\n", shmem->vmap_use_count);
 	drm_printf_indent(p, indent, "vaddr=%p\n", shmem->vaddr);
 }
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 7d74c71f5558..a5f015d188cd 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -47,7 +47,7 @@ int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm)
 		}
 
 		bo->base.pages = pages;
-		bo->base.pages_use_count = 1;
+		kref_init(&bo->base.pages_use_count);
 
 		mapping_set_unevictable(mapping);
 	}
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 7771769f0ce0..c9ac9d361864 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -487,7 +487,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 			goto err_unlock;
 		}
 		bo->base.pages = pages;
-		bo->base.pages_use_count = 1;
+		kref_init(&bo->base.pages_use_count);
 	} else {
 		pages = bo->base.pages;
 		if (pages[page_offset]) {
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index afb7cd671e2a..a5a3c193cc8f 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -37,7 +37,7 @@ struct drm_gem_shmem_object {
 	 * Reference count on the pages table.
 	 * The pages are put when the count reaches zero.
 	 */
-	unsigned int pages_use_count;
+	struct kref pages_use_count;
 
 	/**
 	 * @pages_pin_count:
-- 
2.41.0

