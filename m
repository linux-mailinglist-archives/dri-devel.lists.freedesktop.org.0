Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AF6825A7E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 19:47:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C64010E683;
	Fri,  5 Jan 2024 18:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5822F10E689
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 18:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1704480438;
 bh=TqXT2PdRKdsfVWfuHdIUz5qWMXCVZU9Nx7RXrVE6nQU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L4TOndeX4uNvvr+jO3tvm5FF6uhPCkatj8ub4WMpwmcWSjb8nntV6FCGfNHR8+jgB
 7X22VUvb7tAVulKPH6afTNYJYIxsPkkwCD8AdJko/lxApBmxy4wC157P9HWRwk5Crg
 sGFQipdQDyfZvFsKUZlPfnpsJ8LX7E6r8PpC63LH+dyUXY4N936NnWKPnWweKUC5Bp
 n6G/sal2sxhPJGAxdzOmdivhzFMV0EJdpRUT3uD+iyDuI53cQf8S4xWEkzb1tqtIH9
 SeRCg1ArebDe5Qs7hTwAOzQw7j/2W3IT2Bd3eqIJ1ntDmpFOQ0+chg16NeOXax/plZ
 5CgG0uJUFk9gA==
Received: from workpc.. (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id DF24F378204D;
 Fri,  5 Jan 2024 18:47:16 +0000 (UTC)
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
Subject: [PATCH v19 21/30] drm/shmem-helper: Change sgt allocation policy
Date: Fri,  5 Jan 2024 21:46:15 +0300
Message-ID: <20240105184624.508603-22-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
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

In a preparation to addition of drm-shmem memory shrinker support, change
the SGT allocation policy in this way:

1. SGT can be allocated only if shmem pages are pinned at the
time of allocation, otherwise allocation fails.

2. Drivers must ensure that pages are pinned during the time of SGT usage
and should get new SGT if pages were unpinned.

This new policy is required by the shrinker because it will move pages
to/from SWAP unless pages are pinned, invalidating SGT pointer once pages
are relocated.

Previous patches prepared drivers to the new policy.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 55 ++++++++++++++------------
 1 file changed, 29 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index c7357110ca76..ff5437ab2c95 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -133,6 +133,14 @@ drm_gem_shmem_free_pages(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
+	if (shmem->sgt) {
+		dma_unmap_sgtable(obj->dev->dev, shmem->sgt,
+				  DMA_BIDIRECTIONAL, 0);
+		sg_free_table(shmem->sgt);
+		kfree(shmem->sgt);
+		shmem->sgt = NULL;
+	}
+
 #ifdef CONFIG_X86
 	if (shmem->map_wc)
 		set_pages_array_wb(shmem->pages, obj->size >> PAGE_SHIFT);
@@ -155,24 +163,12 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
-	if (obj->import_attach) {
+	if (obj->import_attach)
 		drm_prime_gem_destroy(obj, shmem->sgt);
-	} else {
-		drm_WARN_ON(obj->dev, refcount_read(&shmem->vmap_use_count));
 
-		if (shmem->sgt) {
-			dma_unmap_sgtable(obj->dev->dev, shmem->sgt,
-					  DMA_BIDIRECTIONAL, 0);
-			sg_free_table(shmem->sgt);
-			kfree(shmem->sgt);
-		}
-		if (shmem->pages &&
-		    refcount_dec_and_test(&shmem->pages_use_count))
-			drm_gem_shmem_free_pages(shmem);
-
-		drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_use_count));
-		drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_pin_count));
-	}
+	drm_WARN_ON(obj->dev, refcount_read(&shmem->vmap_use_count));
+	drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_use_count));
+	drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_pin_count));
 
 	drm_gem_object_release(obj);
 	kfree(shmem);
@@ -722,6 +718,9 @@ struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem)
 
 	drm_WARN_ON(obj->dev, obj->import_attach);
 
+	if (drm_WARN_ON(obj->dev, !shmem->pages))
+		return ERR_PTR(-ENOMEM);
+
 	return drm_prime_pages_to_sg(obj->dev, shmem->pages, obj->size >> PAGE_SHIFT);
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_get_sg_table);
@@ -737,15 +736,10 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
 
 	drm_WARN_ON(obj->dev, obj->import_attach);
 
-	ret = drm_gem_shmem_get_pages_locked(shmem);
-	if (ret)
-		return ERR_PTR(ret);
-
 	sgt = drm_gem_shmem_get_sg_table(shmem);
-	if (IS_ERR(sgt)) {
-		ret = PTR_ERR(sgt);
-		goto err_put_pages;
-	}
+	if (IS_ERR(sgt))
+		return sgt;
+
 	/* Map the pages for use by the h/w. */
 	ret = dma_map_sgtable(obj->dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
 	if (ret)
@@ -758,8 +752,6 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
 err_free_sgt:
 	sg_free_table(sgt);
 	kfree(sgt);
-err_put_pages:
-	drm_gem_shmem_put_pages_locked(shmem);
 	return ERR_PTR(ret);
 }
 
@@ -776,6 +768,17 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
  * and difference between dma-buf imported and natively allocated objects.
  * drm_gem_shmem_get_sg_table() should not be directly called by drivers.
  *
+ * Drivers should adhere to these SGT usage rules:
+ *
+ * 1. SGT should be allocated only if shmem pages are pinned at the
+ *    time of allocation, otherwise allocation will fail.
+ *
+ * 2. Drivers should ensure that pages are pinned during the time of
+ *    SGT usage and should get new SGT if pages were unpinned.
+ *
+ * Drivers don't own returned SGT and must take care of the SGT pointer
+ * lifetime. SGT is valid as long as GEM pages that backing SGT are pinned.
+ *
  * Returns:
  * A pointer to the scatter/gather table of pinned pages or errno on failure.
  */
-- 
2.43.0

