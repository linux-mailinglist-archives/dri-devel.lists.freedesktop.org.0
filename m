Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B48FE7DB025
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 00:03:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E537510E1E2;
	Sun, 29 Oct 2023 23:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03D810E1D5
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 23:02:54 +0000 (UTC)
Received: from workpc.. (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6BC9E6607390;
 Sun, 29 Oct 2023 23:02:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698620573;
 bh=Y38zEoY1/gjYYjrjDZs9Rr+zwqObmBjdBml3XtFCTzs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vsu1u+Npxkp9e5ZNo9JZC5sEhd9r5AwEDu6nZCq3kKd+dbEAq44Z0f0Oq4nd5s9JJ
 IDidsJaAwKOwFEgHBx+rmabzyhrPrPquTmDzes50MPEQ2tnGo6txyw/C4mpuaNyb4n
 ixPslp3QLBnnLP96U5Hq2Q8dnX3TUSDXciHTZONuOYXT+4dhzug8t+dMCcNiEHMO+r
 Zgn+tjohtPFre1OJaf38Ybb4ckxki5HIJtmV/Knkn7lLgiij2m+3l8yenA4Aa6kr3R
 k/rmwBvcfH6L+9GiR1DzQrzVbaTADTKKvs4MejvOWFTLKeNFtLV+MerVAlTrLXGk1J
 UGR5T/2Kd5VGQ==
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
Subject: [PATCH v18 18/26] drm/shmem-helper: Change sgt allocation policy
Date: Mon, 30 Oct 2023 02:01:57 +0300
Message-ID: <20231029230205.93277-19-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
References: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
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

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 51 +++++++++++++-------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index f371ebc6f85c..1420d2166b76 100644
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
@@ -155,23 +163,12 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
-	if (obj->import_attach) {
+	if (obj->import_attach)
 		drm_prime_gem_destroy(obj, shmem->sgt);
-	} else {
-		drm_WARN_ON(obj->dev, refcount_read(&shmem->vmap_use_count));
-
-		if (shmem->sgt) {
-			dma_unmap_sgtable(obj->dev->dev, shmem->sgt,
-					  DMA_BIDIRECTIONAL, 0);
-			sg_free_table(shmem->sgt);
-			kfree(shmem->sgt);
-		}
-		if (shmem->pages)
-			drm_gem_shmem_put_pages_locked(shmem);
 
-		drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_use_count));
-		drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_pin_count));
-	}
+	drm_WARN_ON(obj->dev, refcount_read(&shmem->vmap_use_count));
+	drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_use_count));
+	drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_pin_count));
 
 	drm_gem_object_release(obj);
 	kfree(shmem);
@@ -705,6 +702,9 @@ struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem)
 
 	drm_WARN_ON(obj->dev, obj->import_attach);
 
+	if (drm_WARN_ON(obj->dev, !shmem->pages))
+		return ERR_PTR(-ENOMEM);
+
 	return drm_prime_pages_to_sg(obj->dev, shmem->pages, obj->size >> PAGE_SHIFT);
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_get_sg_table);
@@ -720,15 +720,10 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
 
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
@@ -741,8 +736,6 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
 err_free_sgt:
 	sg_free_table(sgt);
 	kfree(sgt);
-err_put_pages:
-	drm_gem_shmem_put_pages_locked(shmem);
 	return ERR_PTR(ret);
 }
 
@@ -759,6 +752,14 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
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
  * Returns:
  * A pointer to the scatter/gather table of pinned pages or errno on failure.
  */
-- 
2.41.0

