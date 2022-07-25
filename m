Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E14FA58019B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 17:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F4914A967;
	Mon, 25 Jul 2022 15:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F0114A976;
 Mon, 25 Jul 2022 15:20:56 +0000 (UTC)
Received: from dimapc.. (109-252-119-232.nat.spd-mgts.ru [109.252.119.232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 612EA6601B0D;
 Mon, 25 Jul 2022 16:20:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658762454;
 bh=VnASVctkeLjfZ36FxY1reL6K2hi5HykLh1z80wBnGvM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I+HYrQXtbcbpmdiCSnuLabgcI4/SrJccBuswJyuF48plCvQMX7Qr/QfxNp/L5ZCbv
 Rc7lKQuntBj4POIUqqPdOErIEmAHAYHfoFYGfFkpUDJ8QwpNkzetNcgCmves2rKnFq
 uLhxeQZcZhZWDKiWY4amjfaS4B7KvkFr71jNEzFB4eIDYyj04Q9c3nGbh/FYVWKmkx
 +Lxjc4Rh6KTP9z44w16aBmEdssgXeSCCKaucqAduNlL5NAtOpNDM5arnnVyk34JXbP
 8ubHY8NC2WPeTmTr0yJ9vqm+4l7BSGFWSN6bbdjGICUx3STb3Ukwwx9UJ/oJj7IJSO
 e2ewnyEkm5y4g==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>
Subject: [PATCH v2 2/5] drm/gem: Take reservation lock for vmap/vunmap
 operations
Date: Mon, 25 Jul 2022 18:18:36 +0300
Message-Id: <20220725151839.31622-3-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220725151839.31622-1-dmitry.osipenko@collabora.com>
References: <20220725151839.31622-1-dmitry.osipenko@collabora.com>
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
Cc: linux-rdma@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The new common dma-buf locking convention will require buffer importers
to hold the reservation lock around mapping operations. Make DRM GEM core
to take the lock around the vmapping operations and update QXL and i915
drivers to use the locked functions for the case where DRM core now holds
the lock. This patch prepares DRM core and drivers to transition to the
common dma-buf locking convention where vmapping of exported GEMs will
be done under the held reservation lock.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_client.c                 |  4 ++--
 drivers/gpu/drm/drm_gem.c                    | 24 ++++++++++++++++++++
 drivers/gpu/drm/drm_gem_framebuffer_helper.c |  6 ++---
 drivers/gpu/drm/drm_prime.c                  |  4 ++--
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c   |  2 +-
 drivers/gpu/drm/qxl/qxl_object.c             | 17 +++++++-------
 drivers/gpu/drm/qxl/qxl_prime.c              |  4 ++--
 include/drm/drm_gem.h                        |  3 +++
 8 files changed, 46 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index af3b7395bf69..e9a1cd310352 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -323,7 +323,7 @@ drm_client_buffer_vmap(struct drm_client_buffer *buffer,
 	 * fd_install step out of the driver backend hooks, to make that
 	 * final step optional for internal users.
 	 */
-	ret = drm_gem_vmap(buffer->gem, map);
+	ret = drm_gem_vmap_unlocked(buffer->gem, map);
 	if (ret)
 		return ret;
 
@@ -345,7 +345,7 @@ void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
 {
 	struct iosys_map *map = &buffer->map;
 
-	drm_gem_vunmap(buffer->gem, map);
+	drm_gem_vunmap_unlocked(buffer->gem, map);
 }
 EXPORT_SYMBOL(drm_client_buffer_vunmap);
 
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index eb0c2d041f13..8b92846112ef 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1171,6 +1171,8 @@ int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 {
 	int ret;
 
+	dma_resv_assert_held(obj->resv);
+
 	if (!obj->funcs->vmap)
 		return -EOPNOTSUPP;
 
@@ -1186,6 +1188,8 @@ EXPORT_SYMBOL(drm_gem_vmap);
 
 void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
 {
+	dma_resv_assert_held(obj->resv);
+
 	if (iosys_map_is_null(map))
 		return;
 
@@ -1197,6 +1201,26 @@ void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
 }
 EXPORT_SYMBOL(drm_gem_vunmap);
 
+int drm_gem_vmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map)
+{
+	int ret;
+
+	dma_resv_lock(obj->resv, NULL);
+	ret = drm_gem_vmap(obj, map);
+	dma_resv_unlock(obj->resv);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_gem_vmap_unlocked);
+
+void drm_gem_vunmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map)
+{
+	dma_resv_lock(obj->resv, NULL);
+	drm_gem_vunmap(obj, map);
+	dma_resv_unlock(obj->resv);
+}
+EXPORT_SYMBOL(drm_gem_vunmap_unlocked);
+
 /**
  * drm_gem_lock_reservations - Sets up the ww context and acquires
  * the lock on an array of GEM objects.
diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 61339a9cd010..135cd4a96ea9 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -354,7 +354,7 @@ int drm_gem_fb_vmap(struct drm_framebuffer *fb, struct iosys_map *map,
 			ret = -EINVAL;
 			goto err_drm_gem_vunmap;
 		}
-		ret = drm_gem_vmap(obj, &map[i]);
+		ret = drm_gem_vmap_unlocked(obj, &map[i]);
 		if (ret)
 			goto err_drm_gem_vunmap;
 	}
@@ -376,7 +376,7 @@ int drm_gem_fb_vmap(struct drm_framebuffer *fb, struct iosys_map *map,
 		obj = drm_gem_fb_get_obj(fb, i);
 		if (!obj)
 			continue;
-		drm_gem_vunmap(obj, &map[i]);
+		drm_gem_vunmap_unlocked(obj, &map[i]);
 	}
 	return ret;
 }
@@ -403,7 +403,7 @@ void drm_gem_fb_vunmap(struct drm_framebuffer *fb, struct iosys_map *map)
 			continue;
 		if (iosys_map_is_null(&map[i]))
 			continue;
-		drm_gem_vunmap(obj, &map[i]);
+		drm_gem_vunmap_unlocked(obj, &map[i]);
 	}
 }
 EXPORT_SYMBOL(drm_gem_fb_vunmap);
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index b75ef1756873..1bd234fd21a5 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -678,7 +678,7 @@ int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct iosys_map *map)
 {
 	struct drm_gem_object *obj = dma_buf->priv;
 
-	return drm_gem_vmap(obj, map);
+	return drm_gem_vmap_unlocked(obj, map);
 }
 EXPORT_SYMBOL(drm_gem_dmabuf_vmap);
 
@@ -694,7 +694,7 @@ void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct iosys_map *map)
 {
 	struct drm_gem_object *obj = dma_buf->priv;
 
-	drm_gem_vunmap(obj, map);
+	drm_gem_vunmap_unlocked(obj, map);
 }
 EXPORT_SYMBOL(drm_gem_dmabuf_vunmap);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 5ecea7df98b1..cc54a5b1d6ae 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -72,7 +72,7 @@ static int i915_gem_dmabuf_vmap(struct dma_buf *dma_buf,
 	struct drm_i915_gem_object *obj = dma_buf_to_obj(dma_buf);
 	void *vaddr;
 
-	vaddr = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WB);
+	vaddr = i915_gem_object_pin_map(obj, I915_MAP_WB);
 	if (IS_ERR(vaddr))
 		return PTR_ERR(vaddr);
 
diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index b42a657e4c2f..a64cd635fbc0 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -168,9 +168,16 @@ int qxl_bo_vmap_locked(struct qxl_bo *bo, struct iosys_map *map)
 		bo->map_count++;
 		goto out;
 	}
-	r = ttm_bo_vmap(&bo->tbo, &bo->map);
+
+	r = __qxl_bo_pin(bo);
 	if (r)
 		return r;
+
+	r = ttm_bo_vmap(&bo->tbo, &bo->map);
+	if (r) {
+		__qxl_bo_unpin(bo);
+		return r;
+	}
 	bo->map_count = 1;
 
 	/* TODO: Remove kptr in favor of map everywhere. */
@@ -192,12 +199,6 @@ int qxl_bo_vmap(struct qxl_bo *bo, struct iosys_map *map)
 	if (r)
 		return r;
 
-	r = __qxl_bo_pin(bo);
-	if (r) {
-		qxl_bo_unreserve(bo);
-		return r;
-	}
-
 	r = qxl_bo_vmap_locked(bo, map);
 	qxl_bo_unreserve(bo);
 	return r;
@@ -247,6 +248,7 @@ void qxl_bo_vunmap_locked(struct qxl_bo *bo)
 		return;
 	bo->kptr = NULL;
 	ttm_bo_vunmap(&bo->tbo, &bo->map);
+	__qxl_bo_unpin(bo);
 }
 
 int qxl_bo_vunmap(struct qxl_bo *bo)
@@ -258,7 +260,6 @@ int qxl_bo_vunmap(struct qxl_bo *bo)
 		return r;
 
 	qxl_bo_vunmap_locked(bo);
-	__qxl_bo_unpin(bo);
 	qxl_bo_unreserve(bo);
 	return 0;
 }
diff --git a/drivers/gpu/drm/qxl/qxl_prime.c b/drivers/gpu/drm/qxl/qxl_prime.c
index 142d01415acb..9169c26357d3 100644
--- a/drivers/gpu/drm/qxl/qxl_prime.c
+++ b/drivers/gpu/drm/qxl/qxl_prime.c
@@ -59,7 +59,7 @@ int qxl_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 	struct qxl_bo *bo = gem_to_qxl_bo(obj);
 	int ret;
 
-	ret = qxl_bo_vmap(bo, map);
+	ret = qxl_bo_vmap_locked(bo, map);
 	if (ret < 0)
 		return ret;
 
@@ -71,5 +71,5 @@ void qxl_gem_prime_vunmap(struct drm_gem_object *obj,
 {
 	struct qxl_bo *bo = gem_to_qxl_bo(obj);
 
-	qxl_bo_vunmap(bo);
+	qxl_bo_vunmap_locked(bo);
 }
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 87cffc9efa85..bf3700415229 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -420,4 +420,7 @@ void drm_gem_unlock_reservations(struct drm_gem_object **objs, int count,
 int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
 			    u32 handle, u64 *offset);
 
+int drm_gem_vmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map);
+void drm_gem_vunmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map);
+
 #endif /* __DRM_GEM_H__ */
-- 
2.36.1

