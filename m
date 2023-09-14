Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B86ED7A11C1
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 01:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5061110E31A;
	Thu, 14 Sep 2023 23:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFB410E5AC
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 23:29:16 +0000 (UTC)
Received: from workpc.. (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 03814660736A;
 Fri, 15 Sep 2023 00:29:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694734155;
 bh=AJfzXqUuOYq/YDCQsWCWT/OFILNeW+U2Pu7qFD8Rn7I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bYsnFvCSoJdnB1sQ5AHNHoF9SF+NkuVcL3ObKLbyd39R20SBhLLImZyGjbrPqHP0D
 gsdyfIZ0WYvH7zrCYPe2G34ozAngjZig0asn/qVfn7xjLn4J//0UcL+BdJymVlibh9
 rAceDCcSs8ROfoz1KzHrDRhYPkZwa3doq+3YEkmHzAzgiOw587OYaoqCir44jOXs+1
 AHNRGwZpIjssbrXWvXrmRrsxcOiKm6e0shaN+Pxf918KUs9f0W4wDgLhH+oydc/VbR
 aoz8gxaBDMyky4sSqjQtMXZ7u+6JA6MrKir1Im5GcZlnyVXzjCMiRVffbFSVf5eLYT
 8HkdP2qp/My+A==
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
Subject: [PATCH v17 12/18] drm/shmem-helper: Prepare drm_gem_shmem_free() to
 shrinker addition
Date: Fri, 15 Sep 2023 02:27:15 +0300
Message-ID: <20230914232721.408581-13-dmitry.osipenko@collabora.com>
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

Prepare drm_gem_shmem_free() to addition of memory shrinker support
to drm-shmem by adding and using variant of put_pages() that doesn't
touch reservation lock. Reservation shouldn't be touched because lockdep
will trigger a bogus warning about locking contention with fs_reclaim
code paths that can't happen during the time when GEM is freed and
lockdep doesn't know about that.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 55 +++++++++++++++++---------
 1 file changed, 37 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 8a8eab4d0332..4959f51b647a 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -128,6 +128,41 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
 
+static void
+__drm_gem_shmem_release_pages(struct drm_gem_shmem_object *shmem)
+{
+	struct drm_gem_object *obj = &shmem->base;
+
+#ifdef CONFIG_X86
+	if (shmem->map_wc)
+		set_pages_array_wb(shmem->pages, obj->size >> PAGE_SHIFT);
+#endif
+
+	drm_gem_put_pages(obj, shmem->pages,
+			  shmem->pages_mark_dirty_on_put,
+			  shmem->pages_mark_accessed_on_put);
+	shmem->pages = NULL;
+}
+
+static void
+__drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
+{
+	/*
+	 * Destroying the object is a special case.  Acquiring the obj
+	 * lock in drm_gem_shmem_put_pages_locked() can cause a locking
+	 * order inversion between reservation_ww_class_mutex and fs_reclaim
+	 * when called from drm_gem_shmem_free().
+	 *
+	 * This deadlock is not actually possible, because no one should
+	 * be already holding the lock when drm_gem_shmem_free() is called.
+	 * Unfortunately lockdep is not aware of this detail.  So when the
+	 * refcount drops to zero, make sure that the reservation lock
+	 * isn't touched here.
+	 */
+	if (refcount_dec_and_test(&shmem->pages_use_count))
+		__drm_gem_shmem_release_pages(shmem);
+}
+
 /**
  * drm_gem_shmem_free - Free resources associated with a shmem GEM object
  * @shmem: shmem GEM object to free
@@ -142,8 +177,6 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 	if (obj->import_attach) {
 		drm_prime_gem_destroy(obj, shmem->sgt);
 	} else {
-		dma_resv_lock(shmem->base.resv, NULL);
-
 		drm_WARN_ON(obj->dev, refcount_read(&shmem->vmap_use_count));
 
 		if (shmem->sgt) {
@@ -153,11 +186,9 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 			kfree(shmem->sgt);
 		}
 		if (shmem->pages)
-			drm_gem_shmem_put_pages_locked(shmem);
+			__drm_gem_shmem_put_pages(shmem);
 
 		drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_use_count));
-
-		dma_resv_unlock(shmem->base.resv);
 	}
 
 	drm_gem_object_release(obj);
@@ -207,21 +238,9 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
  */
 void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
 {
-	struct drm_gem_object *obj = &shmem->base;
-
 	dma_resv_assert_held(shmem->base.resv);
 
-	if (refcount_dec_and_test(&shmem->pages_use_count)) {
-#ifdef CONFIG_X86
-		if (shmem->map_wc)
-			set_pages_array_wb(shmem->pages, obj->size >> PAGE_SHIFT);
-#endif
-
-		drm_gem_put_pages(obj, shmem->pages,
-				  shmem->pages_mark_dirty_on_put,
-				  shmem->pages_mark_accessed_on_put);
-		shmem->pages = NULL;
-	}
+	__drm_gem_shmem_put_pages(shmem);
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages_locked);
 
-- 
2.41.0

