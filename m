Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B235A6CCB2
	for <lists+dri-devel@lfdr.de>; Sat, 22 Mar 2025 22:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8DC10E18F;
	Sat, 22 Mar 2025 21:29:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="NDoVCoHa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3091A10E18F
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Mar 2025 21:29:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742678978; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=dgdmVAtdxzpYIaicsL4pVTDcc6K9J04nUZsoCHGPLhwsbafXonwDI6XUXvSOoFUx35/bE1RdIR9G+OhoBJph9M1bKyTYRaJ/MBntJOhC/+q9ZztzGW4ti2HedzxlUcnUbO3kBtqbt0qg6JqCq91XfWK7aeEnr7gvVBL646uFt/0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742678978;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=MML9D8wdRcQXvopNsGy9CrKhkITUugHvf3JIuAXSRC4=; 
 b=b6wAzpgVDBRzdmElj1u9PY25Ln7GoPOq5p1qRJ67tXfudjOrFq8wnuIS4mH/4hnwEJe5xPKGoPnE+sZCdY5GMS4YaEiYaSmq9FYZureYfYQ15x7LYZaJ0vYry/DyerTqW76KiDsHniAczh4fM1wb1hSVUawc+rpgvpX54uWS7ew=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742678978; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=MML9D8wdRcQXvopNsGy9CrKhkITUugHvf3JIuAXSRC4=;
 b=NDoVCoHakEMQkKKO84yiJG/HIc37gxKWvQZhBaHv4Kj0W2TPLSSLiihAjYK7juHr
 bFZNcrXBIv+volUSQSVS5QHM4+rjT5qM4fDRbV9US17SBf0g68mNXdv4FH0Bld8TOva
 dD89J5J8zmWko9ngeAsej6W6Q2ChGW4JufpQRMX0=
Received: by mx.zohomail.com with SMTPS id 1742678976540282.669899349429;
 Sat, 22 Mar 2025 14:29:36 -0700 (PDT)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Qiang Yu <yuq825@gmail.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: [PATCH v20 08/10] drm/shmem-helper: Use refcount_t for pages_use_count
Date: Sun, 23 Mar 2025 00:26:06 +0300
Message-ID: <20250322212608.40511-9-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
References: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Use atomic refcount_t helper for pages_use_count to optimize pin/unpin
functions by skipping reservation locking while GEM's pin refcount > 1.

Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c     | 33 ++++++++++------------
 drivers/gpu/drm/lima/lima_gem.c            |  2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c    |  2 +-
 drivers/gpu/drm/tests/drm_gem_shmem_test.c |  8 +++---
 include/drm/drm_gem_shmem_helper.h         |  2 +-
 5 files changed, 22 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index d338b36f4eaa..6fb96e790abd 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -176,7 +176,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 		if (shmem->pages)
 			drm_gem_shmem_put_pages_locked(shmem);
 
-		drm_WARN_ON(obj->dev, shmem->pages_use_count);
+		drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_use_count));
 		drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_pin_count));
 
 		dma_resv_unlock(shmem->base.resv);
@@ -194,14 +194,13 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
 
 	dma_resv_assert_held(shmem->base.resv);
 
-	if (shmem->pages_use_count++ > 0)
+	if (refcount_inc_not_zero(&shmem->pages_use_count))
 		return 0;
 
 	pages = drm_gem_get_pages(obj);
 	if (IS_ERR(pages)) {
 		drm_dbg_kms(obj->dev, "Failed to get pages (%ld)\n",
 			    PTR_ERR(pages));
-		shmem->pages_use_count = 0;
 		return PTR_ERR(pages);
 	}
 
@@ -217,6 +216,8 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
 
 	shmem->pages = pages;
 
+	refcount_set(&shmem->pages_use_count, 1);
+
 	return 0;
 }
 
@@ -232,21 +233,17 @@ void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
 
 	dma_resv_assert_held(shmem->base.resv);
 
-	if (drm_WARN_ON_ONCE(obj->dev, !shmem->pages_use_count))
-		return;
-
-	if (--shmem->pages_use_count > 0)
-		return;
-
+	if (refcount_dec_and_test(&shmem->pages_use_count)) {
 #ifdef CONFIG_X86
-	if (shmem->map_wc)
-		set_pages_array_wb(shmem->pages, obj->size >> PAGE_SHIFT);
+		if (shmem->map_wc)
+			set_pages_array_wb(shmem->pages, obj->size >> PAGE_SHIFT);
 #endif
 
-	drm_gem_put_pages(obj, shmem->pages,
-			  shmem->pages_mark_dirty_on_put,
-			  shmem->pages_mark_accessed_on_put);
-	shmem->pages = NULL;
+		drm_gem_put_pages(obj, shmem->pages,
+				  shmem->pages_mark_dirty_on_put,
+				  shmem->pages_mark_accessed_on_put);
+		shmem->pages = NULL;
+	}
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages_locked);
 
@@ -582,8 +579,8 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
 	 * mmap'd, vm_open() just grabs an additional reference for the new
 	 * mm the vma is getting copied into (ie. on fork()).
 	 */
-	if (!drm_WARN_ON_ONCE(obj->dev, !shmem->pages_use_count))
-		shmem->pages_use_count++;
+	drm_WARN_ON_ONCE(obj->dev,
+			 !refcount_inc_not_zero(&shmem->pages_use_count));
 
 	dma_resv_unlock(shmem->base.resv);
 
@@ -674,7 +671,7 @@ void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
 		return;
 
 	drm_printf_indent(p, indent, "pages_pin_count=%u\n", refcount_read(&shmem->pages_pin_count));
-	drm_printf_indent(p, indent, "pages_use_count=%u\n", shmem->pages_use_count);
+	drm_printf_indent(p, indent, "pages_use_count=%u\n", refcount_read(&shmem->pages_use_count));
 	drm_printf_indent(p, indent, "vmap_use_count=%u\n", shmem->vmap_use_count);
 	drm_printf_indent(p, indent, "vaddr=%p\n", shmem->vaddr);
 }
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 609221351cde..5deec673c11e 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -47,7 +47,7 @@ int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm)
 		}
 
 		bo->base.pages = pages;
-		bo->base.pages_use_count = 1;
+		refcount_set(&bo->base.pages_use_count, 1);
 
 		mapping_set_unevictable(mapping);
 	}
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index b91019cd5acb..4a0b4bf03f1a 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -489,7 +489,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 			goto err_unlock;
 		}
 		bo->base.pages = pages;
-		bo->base.pages_use_count = 1;
+		refcount_set(&bo->base.pages_use_count, 1);
 	} else {
 		pages = bo->base.pages;
 		if (pages[page_offset]) {
diff --git a/drivers/gpu/drm/tests/drm_gem_shmem_test.c b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
index 98884966bb92..1459cdb0c413 100644
--- a/drivers/gpu/drm/tests/drm_gem_shmem_test.c
+++ b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
@@ -134,7 +134,7 @@ static void drm_gem_shmem_test_pin_pages(struct kunit *test)
 	shmem = drm_gem_shmem_create(drm_dev, TEST_SIZE);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
 	KUNIT_EXPECT_NULL(test, shmem->pages);
-	KUNIT_EXPECT_EQ(test, shmem->pages_use_count, 0);
+	KUNIT_EXPECT_EQ(test, refcount_read(&shmem->pages_use_count), 0);
 
 	ret = kunit_add_action_or_reset(test, drm_gem_shmem_free_wrapper, shmem);
 	KUNIT_ASSERT_EQ(test, ret, 0);
@@ -142,14 +142,14 @@ static void drm_gem_shmem_test_pin_pages(struct kunit *test)
 	ret = drm_gem_shmem_pin(shmem);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 	KUNIT_ASSERT_NOT_NULL(test, shmem->pages);
-	KUNIT_EXPECT_EQ(test, shmem->pages_use_count, 1);
+	KUNIT_EXPECT_EQ(test, refcount_read(&shmem->pages_use_count), 1);
 
 	for (i = 0; i < (shmem->base.size >> PAGE_SHIFT); i++)
 		KUNIT_ASSERT_NOT_NULL(test, shmem->pages[i]);
 
 	drm_gem_shmem_unpin(shmem);
 	KUNIT_EXPECT_NULL(test, shmem->pages);
-	KUNIT_EXPECT_EQ(test, shmem->pages_use_count, 0);
+	KUNIT_EXPECT_EQ(test, refcount_read(&shmem->pages_use_count), 0);
 }
 
 /*
@@ -251,7 +251,7 @@ static void drm_gem_shmem_test_get_sg_table(struct kunit *test)
 	sgt = drm_gem_shmem_get_pages_sgt(shmem);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sgt);
 	KUNIT_ASSERT_NOT_NULL(test, shmem->pages);
-	KUNIT_EXPECT_EQ(test, shmem->pages_use_count, 1);
+	KUNIT_EXPECT_EQ(test, refcount_read(&shmem->pages_use_count), 1);
 	KUNIT_EXPECT_PTR_EQ(test, sgt, shmem->sgt);
 
 	for_each_sgtable_sg(sgt, sg, si) {
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index d411215fe494..3a4be433d5f0 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -37,7 +37,7 @@ struct drm_gem_shmem_object {
 	 * Reference count on the pages table.
 	 * The pages are put when the count reaches zero.
 	 */
-	unsigned int pages_use_count;
+	refcount_t pages_use_count;
 
 	/**
 	 * @pages_pin_count:
-- 
2.49.0

