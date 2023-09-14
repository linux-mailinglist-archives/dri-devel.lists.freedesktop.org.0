Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD867A11C0
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 01:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D3B10E5A9;
	Thu, 14 Sep 2023 23:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3900E10E31A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 23:29:08 +0000 (UTC)
Received: from workpc.. (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DF3C16607356;
 Fri, 15 Sep 2023 00:29:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694734147;
 bh=WO04qyK07S2NqVZi3rKtftqpx6J1ujZZfJYpj019Mzw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GGQK1nzymMp6iAUQ3PbgGWllfZJYeGClC/iwjy20ZMSlG6iMLrWfLgXihMmUqBC2k
 sulcYSwqx7pRCdIqq0E3bCswGqWTuQ7W+hU7DQ6nlnSA6amTl8JzmasQui5om/tSc9
 Lnz4ttfQdlRtqTR0HjORtVxCCkmF7xqZngZNvNsWu1uBXhqY+Qo8N4UpmFOtaHhNF2
 Jo/W+cpIQ2/FtaTWK4n37IrR+7PLLTJtfQd7b/8NlH1TFunlqis+hjrOcq3e1DYtFi
 PRNjfqIoEu1Q70tfNB3yGCods5qsx8eDGDtjqLWBK9OtL7dRt0w0+kjeIHIluIW5zL
 eYqa61Bu0r1Ag==
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
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>
Subject: [PATCH v17 07/18] drm/shmem-helper: Use refcount_t for pages_use_count
Date: Fri, 15 Sep 2023 02:27:10 +0300
Message-ID: <20230914232721.408581-8-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914232721.408581-1-dmitry.osipenko@collabora.com>
References: <20230914232721.408581-1-dmitry.osipenko@collabora.com>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use atomic refcount_t helper for pages_use_count to optimize pin/unpin
functions by skipping reservation locking while GEM's pin refcount > 1.

Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c  | 33 +++++++++++--------------
 drivers/gpu/drm/lima/lima_gem.c         |  2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c |  2 +-
 include/drm/drm_gem_shmem_helper.h      |  2 +-
 4 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 286f0ca51309..e9d9fbd52b34 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -155,7 +155,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 		if (shmem->pages)
 			drm_gem_shmem_put_pages_locked(shmem);
 
-		drm_WARN_ON(obj->dev, shmem->pages_use_count);
+		drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_use_count));
 
 		dma_resv_unlock(shmem->base.resv);
 	}
@@ -172,14 +172,13 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
 
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
 
@@ -195,6 +194,8 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
 
 	shmem->pages = pages;
 
+	refcount_set(&shmem->pages_use_count, 1);
+
 	return 0;
 }
 
@@ -210,21 +211,17 @@ void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
 
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
 
@@ -551,8 +548,8 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
 	 * mmap'd, vm_open() just grabs an additional reference for the new
 	 * mm the vma is getting copied into (ie. on fork()).
 	 */
-	if (!drm_WARN_ON_ONCE(obj->dev, !shmem->pages_use_count))
-		shmem->pages_use_count++;
+	drm_WARN_ON_ONCE(obj->dev,
+			 !refcount_inc_not_zero(&shmem->pages_use_count));
 
 	dma_resv_unlock(shmem->base.resv);
 
@@ -640,7 +637,7 @@ void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
 		return;
 
 	drm_printf_indent(p, indent, "pages_pin_count=%u\n", refcount_read(&shmem->pages_pin_count));
-	drm_printf_indent(p, indent, "pages_use_count=%u\n", shmem->pages_use_count);
+	drm_printf_indent(p, indent, "pages_use_count=%u\n", refcount_read(&shmem->pages_use_count));
 	drm_printf_indent(p, indent, "vmap_use_count=%u\n", shmem->vmap_use_count);
 	drm_printf_indent(p, indent, "vaddr=%p\n", shmem->vaddr);
 }
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 62d4a409faa8..988e74f67465 100644
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
index 7771769f0ce0..a91252053aa3 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -487,7 +487,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 			goto err_unlock;
 		}
 		bo->base.pages = pages;
-		bo->base.pages_use_count = 1;
+		refcount_set(&bo->base.pages_use_count, 1);
 	} else {
 		pages = bo->base.pages;
 		if (pages[page_offset]) {
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 268b3127d150..3947f5c6bff7 100644
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
2.41.0

