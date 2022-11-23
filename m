Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEFB634E19
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 04:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA1310E1E4;
	Wed, 23 Nov 2022 03:00:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD4610E1E4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 03:00:23 +0000 (UTC)
Received: from dimapc.. (109-252-117-140.nat.spd-mgts.ru [109.252.117.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AE8166602AE5;
 Wed, 23 Nov 2022 03:00:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1669172422;
 bh=le7MY1rHTG895yNoJQwBOn1a1w1txaYwjlqaSvlS+ZU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SGSx0uwx8kkMNzdM3DYE+uSXECwZ2wLApRBRzEdxzrLq44Xvwhubx/cqCm5/xf5HJ
 KF0FA0UqHMCz9UEkUx+5iBTkIyV38yO2oi/Fa8DJETSydmTB991ijwq5hUmkFEAHqH
 HpT2uzZ0f2zd3BCixTkrh55Ot3EASbEen/P5LBQD4IDQWjY+n/nboIA54CARKgaau1
 SxShXwFjc3XHyrlbXdpaGE3uO+3vzIDhP01Hx6bJAeYni+r5R2I+arNr/7cwnJwkIe
 ZxwfysE9f9FuhiIvh16OtBHxP7GcLyAXGep8JUNRmr0qZIgoiwmPnUyIgxkHjKGESN
 pWq5iw8MzODhw==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v9 05/11] drm/shmem: Switch to use drm_* debug helpers
Date: Wed, 23 Nov 2022 05:57:17 +0300
Message-Id: <20221123025723.695075-6-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221123025723.695075-1-dmitry.osipenko@collabora.com>
References: <20221123025723.695075-1-dmitry.osipenko@collabora.com>
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

Ease debugging of a multi-GPU system by using drm_WARN_*() and
drm_dbg_kms() helpers that print out DRM device name corresponding
to shmem GEM.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 38 +++++++++++++++-----------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 35138f8a375c..5504eeb61099 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -139,7 +139,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
-	WARN_ON(shmem->vmap_use_count);
+	drm_WARN_ON(obj->dev, shmem->vmap_use_count);
 
 	if (obj->import_attach) {
 		drm_prime_gem_destroy(obj, shmem->sgt);
@@ -154,7 +154,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 			drm_gem_shmem_put_pages(shmem);
 	}
 
-	WARN_ON(shmem->pages_use_count);
+	drm_WARN_ON(obj->dev, shmem->pages_use_count);
 
 	drm_gem_object_release(obj);
 	mutex_destroy(&shmem->pages_lock);
@@ -173,7 +173,8 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
 
 	pages = drm_gem_get_pages(obj);
 	if (IS_ERR(pages)) {
-		DRM_DEBUG_KMS("Failed to get pages (%ld)\n", PTR_ERR(pages));
+		drm_dbg_kms(obj->dev, "Failed to get pages (%ld)\n",
+			    PTR_ERR(pages));
 		shmem->pages_use_count = 0;
 		return PTR_ERR(pages);
 	}
@@ -205,9 +206,10 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
  */
 int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
 {
+	struct drm_gem_object *obj = &shmem->base;
 	int ret;
 
-	WARN_ON(shmem->base.import_attach);
+	drm_WARN_ON(obj->dev, obj->import_attach);
 
 	ret = mutex_lock_interruptible(&shmem->pages_lock);
 	if (ret)
@@ -223,7 +225,7 @@ static void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
-	if (WARN_ON_ONCE(!shmem->pages_use_count))
+	if (drm_WARN_ON_ONCE(obj->dev, !shmem->pages_use_count))
 		return;
 
 	if (--shmem->pages_use_count > 0)
@@ -266,7 +268,9 @@ EXPORT_SYMBOL(drm_gem_shmem_put_pages);
  */
 int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem)
 {
-	WARN_ON(shmem->base.import_attach);
+	struct drm_gem_object *obj = &shmem->base;
+
+	drm_WARN_ON(obj->dev, obj->import_attach);
 
 	return drm_gem_shmem_get_pages(shmem);
 }
@@ -281,7 +285,9 @@ EXPORT_SYMBOL(drm_gem_shmem_pin);
  */
 void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem)
 {
-	WARN_ON(shmem->base.import_attach);
+	struct drm_gem_object *obj = &shmem->base;
+
+	drm_WARN_ON(obj->dev, obj->import_attach);
 
 	drm_gem_shmem_put_pages(shmem);
 }
@@ -301,7 +307,7 @@ static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
 	if (obj->import_attach) {
 		ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
 		if (!ret) {
-			if (WARN_ON(map->is_iomem)) {
+			if (drm_WARN_ON(obj->dev, map->is_iomem)) {
 				dma_buf_vunmap(obj->import_attach->dmabuf, map);
 				ret = -EIO;
 				goto err_put_pages;
@@ -326,7 +332,7 @@ static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
 	}
 
 	if (ret) {
-		DRM_DEBUG_KMS("Failed to vmap pages, error %d\n", ret);
+		drm_dbg_kms(obj->dev, "Failed to vmap pages, error %d\n", ret);
 		goto err_put_pages;
 	}
 
@@ -376,7 +382,7 @@ static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
 {
 	struct drm_gem_object *obj = &shmem->base;
 
-	if (WARN_ON_ONCE(!shmem->vmap_use_count))
+	if (drm_WARN_ON_ONCE(obj->dev, !shmem->vmap_use_count))
 		return;
 
 	if (--shmem->vmap_use_count > 0)
@@ -461,7 +467,7 @@ void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem)
 	struct drm_gem_object *obj = &shmem->base;
 	struct drm_device *dev = obj->dev;
 
-	WARN_ON(!drm_gem_shmem_is_purgeable(shmem));
+	drm_WARN_ON(obj->dev, !drm_gem_shmem_is_purgeable(shmem));
 
 	dma_unmap_sgtable(dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
 	sg_free_table(shmem->sgt);
@@ -553,7 +559,7 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 	mutex_lock(&shmem->pages_lock);
 
 	if (page_offset >= num_pages ||
-	    WARN_ON_ONCE(!shmem->pages) ||
+	    drm_WARN_ON_ONCE(obj->dev, !shmem->pages) ||
 	    shmem->madv < 0) {
 		ret = VM_FAULT_SIGBUS;
 	} else {
@@ -573,10 +579,10 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 	int ret;
 
-	WARN_ON(shmem->base.import_attach);
+	drm_WARN_ON(obj->dev, obj->import_attach);
 
 	ret = drm_gem_shmem_get_pages(shmem);
-	WARN_ON_ONCE(ret != 0);
+	drm_WARN_ON_ONCE(obj->dev, ret != 0);
 
 	drm_gem_vm_open(vma);
 }
@@ -669,7 +675,7 @@ struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
-	WARN_ON(shmem->base.import_attach);
+	drm_WARN_ON(obj->dev, obj->import_attach);
 
 	return drm_prime_pages_to_sg(obj->dev, shmem->pages, obj->size >> PAGE_SHIFT);
 }
@@ -700,7 +706,7 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem)
 	if (shmem->sgt)
 		return shmem->sgt;
 
-	WARN_ON(obj->import_attach);
+	drm_WARN_ON(obj->dev, obj->import_attach);
 
 	ret = drm_gem_shmem_get_pages(shmem);
 	if (ret)
-- 
2.38.1

