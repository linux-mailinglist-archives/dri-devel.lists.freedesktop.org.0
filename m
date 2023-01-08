Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D74E36619A8
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 22:05:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9C010E209;
	Sun,  8 Jan 2023 21:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB8910E215
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 21:05:38 +0000 (UTC)
Received: from workpc.. (109-252-117-89.nat.spd-mgts.ru [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B01C86602CBA;
 Sun,  8 Jan 2023 21:05:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1673211937;
 bh=xPozR7rL6+SL+SRZNBXz9tFd0+rKzikfuDQsMuB4WUs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ALzn5tfB67msarRtgEGYiqOq/f8pomziwNEFWFuQz9wnFBKwwXGC82BRdP27LLIl5
 fRK4+OIr+qe3yjBAiy4GFJVdz0JzbeS+D9bINIiYwzgiQNQewxY5NqYGBarvQog2DN
 oh502S12wn9LpSDbs9V736uN05/uozmoktm29gDX2uHYpI32ShKqZ7tZtHdLpKlTIh
 EOE1mgn4vzkiIXISOgnW+o/wTbYt9g6RX1ePwML9rPCGoQ5obCgjtNWT8mLrNoaoKp
 2FKO0vucCyrtxdS3lfnL4pk4dzLrvu+pFI5dtmAheF/PiQriXw6WMlfqoP/CNXpJ3z
 5tLRU5ow3sKIw==
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
Subject: [PATCH v10 05/11] drm/shmem: Switch to use drm_* debug helpers
Date: Mon,  9 Jan 2023 00:04:39 +0300
Message-Id: <20230108210445.3948344-6-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
References: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
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
index f21f47737817..5006f7da7f2d 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -141,7 +141,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
-	WARN_ON(shmem->vmap_use_count);
+	drm_WARN_ON(obj->dev, shmem->vmap_use_count);
 
 	if (obj->import_attach) {
 		drm_prime_gem_destroy(obj, shmem->sgt);
@@ -156,7 +156,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 			drm_gem_shmem_put_pages(shmem);
 	}
 
-	WARN_ON(shmem->pages_use_count);
+	drm_WARN_ON(obj->dev, shmem->pages_use_count);
 
 	drm_gem_object_release(obj);
 	mutex_destroy(&shmem->pages_lock);
@@ -175,7 +175,8 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
 
 	pages = drm_gem_get_pages(obj);
 	if (IS_ERR(pages)) {
-		DRM_DEBUG_KMS("Failed to get pages (%ld)\n", PTR_ERR(pages));
+		drm_dbg_kms(obj->dev, "Failed to get pages (%ld)\n",
+			    PTR_ERR(pages));
 		shmem->pages_use_count = 0;
 		return PTR_ERR(pages);
 	}
@@ -207,9 +208,10 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
  */
 int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
 {
+	struct drm_gem_object *obj = &shmem->base;
 	int ret;
 
-	WARN_ON(shmem->base.import_attach);
+	drm_WARN_ON(obj->dev, obj->import_attach);
 
 	ret = mutex_lock_interruptible(&shmem->pages_lock);
 	if (ret)
@@ -225,7 +227,7 @@ static void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
-	if (WARN_ON_ONCE(!shmem->pages_use_count))
+	if (drm_WARN_ON_ONCE(obj->dev, !shmem->pages_use_count))
 		return;
 
 	if (--shmem->pages_use_count > 0)
@@ -268,7 +270,9 @@ EXPORT_SYMBOL(drm_gem_shmem_put_pages);
  */
 int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem)
 {
-	WARN_ON(shmem->base.import_attach);
+	struct drm_gem_object *obj = &shmem->base;
+
+	drm_WARN_ON(obj->dev, obj->import_attach);
 
 	return drm_gem_shmem_get_pages(shmem);
 }
@@ -283,7 +287,9 @@ EXPORT_SYMBOL(drm_gem_shmem_pin);
  */
 void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem)
 {
-	WARN_ON(shmem->base.import_attach);
+	struct drm_gem_object *obj = &shmem->base;
+
+	drm_WARN_ON(obj->dev, obj->import_attach);
 
 	drm_gem_shmem_put_pages(shmem);
 }
@@ -303,7 +309,7 @@ static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
 	if (obj->import_attach) {
 		ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
 		if (!ret) {
-			if (WARN_ON(map->is_iomem)) {
+			if (drm_WARN_ON(obj->dev, map->is_iomem)) {
 				dma_buf_vunmap(obj->import_attach->dmabuf, map);
 				ret = -EIO;
 				goto err_put_pages;
@@ -328,7 +334,7 @@ static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
 	}
 
 	if (ret) {
-		DRM_DEBUG_KMS("Failed to vmap pages, error %d\n", ret);
+		drm_dbg_kms(obj->dev, "Failed to vmap pages, error %d\n", ret);
 		goto err_put_pages;
 	}
 
@@ -378,7 +384,7 @@ static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
 {
 	struct drm_gem_object *obj = &shmem->base;
 
-	if (WARN_ON_ONCE(!shmem->vmap_use_count))
+	if (drm_WARN_ON_ONCE(obj->dev, !shmem->vmap_use_count))
 		return;
 
 	if (--shmem->vmap_use_count > 0)
@@ -463,7 +469,7 @@ void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem)
 	struct drm_gem_object *obj = &shmem->base;
 	struct drm_device *dev = obj->dev;
 
-	WARN_ON(!drm_gem_shmem_is_purgeable(shmem));
+	drm_WARN_ON(obj->dev, !drm_gem_shmem_is_purgeable(shmem));
 
 	dma_unmap_sgtable(dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
 	sg_free_table(shmem->sgt);
@@ -555,7 +561,7 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 	mutex_lock(&shmem->pages_lock);
 
 	if (page_offset >= num_pages ||
-	    WARN_ON_ONCE(!shmem->pages) ||
+	    drm_WARN_ON_ONCE(obj->dev, !shmem->pages) ||
 	    shmem->madv < 0) {
 		ret = VM_FAULT_SIGBUS;
 	} else {
@@ -574,7 +580,7 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
 	struct drm_gem_object *obj = vma->vm_private_data;
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 
-	WARN_ON(shmem->base.import_attach);
+	drm_WARN_ON(obj->dev, obj->import_attach);
 
 	mutex_lock(&shmem->pages_lock);
 
@@ -583,7 +589,7 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
 	 * mmap'd, vm_open() just grabs an additional reference for the new
 	 * mm the vma is getting copied into (ie. on fork()).
 	 */
-	if (!WARN_ON_ONCE(!shmem->pages_use_count))
+	if (!drm_WARN_ON_ONCE(obj->dev, !shmem->pages_use_count))
 		shmem->pages_use_count++;
 
 	mutex_unlock(&shmem->pages_lock);
@@ -677,7 +683,7 @@ struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
-	WARN_ON(shmem->base.import_attach);
+	drm_WARN_ON(obj->dev, obj->import_attach);
 
 	return drm_prime_pages_to_sg(obj->dev, shmem->pages, obj->size >> PAGE_SHIFT);
 }
@@ -708,7 +714,7 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem)
 	if (shmem->sgt)
 		return shmem->sgt;
 
-	WARN_ON(obj->import_attach);
+	drm_WARN_ON(obj->dev, obj->import_attach);
 
 	ret = drm_gem_shmem_get_pages(shmem);
 	if (ret)
-- 
2.38.1

