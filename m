Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7157A5758C3
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 02:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B22710EFDA;
	Fri, 15 Jul 2022 00:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205E910EE3C;
 Fri, 15 Jul 2022 00:53:30 +0000 (UTC)
Received: from dimapc.. (109-252-119-232.nat.spd-mgts.ru [109.252.119.232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5CA3F6601A55;
 Fri, 15 Jul 2022 01:53:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657846408;
 bh=C6e6jboiC6aFfnSeef66He4zFFQX9jQbLJ/pTtd0Ns4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XiqjN1/najxxd4Cw6vUVTj9swWM1Fp0G4u04qkn06udYxG9qMegM5UMwDZeAtiKyp
 Euwd93MUjFxJ/mjgG5QgHJD7F2FVoXJiVIS8f9QmvWDyALy0FfoDL+iUxpG36z4NNM
 l5AiMXC1+HGQQX/7jNxwkcIRwA15X8Pb4p9X22hRrfqtWkJ5qHzvowMhQRHRd8imuu
 dBWeODigC9s6hXemi+OGMJIJgS2+hQQOXju/2gGOMENMu7EQKC9dzRtFqbgCMqf/xk
 7omA9bM3+KHLRxoVd3lN0lOgGvKYtPKpMKFmzZYIjwp2GTjvI8pAqt6/7GaFaTgwkn
 nHSGTweWCRQVw==
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
Subject: [PATCH v1 4/6] dma-buf: Acquire wait-wound context on attachment
Date: Fri, 15 Jul 2022 03:52:42 +0300
Message-Id: <20220715005244.42198-5-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715005244.42198-1-dmitry.osipenko@collabora.com>
References: <20220715005244.42198-1-dmitry.osipenko@collabora.com>
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

Intel i915 GPU driver uses wait-wound mutex to lock multiple GEMs on the
attachment to the i915 dma-buf. In order to let all drivers utilize shared
wait-wound context during attachment in a general way, make dma-buf core to
acquire the ww context internally for the attachment operation and update
i915 driver to use the importer's ww context instead of the internal one.

From now on all dma-buf exporters shall use the importer's ww context for
the attachment operation.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/dma-buf/dma-buf.c                     |  8 +++++-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  2 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  6 ++---
 drivers/gpu/drm/i915/i915_gem_evict.c         |  2 +-
 drivers/gpu/drm/i915/i915_gem_ww.c            | 26 +++++++++++++++----
 drivers/gpu/drm/i915/i915_gem_ww.h            | 15 +++++++++--
 7 files changed, 47 insertions(+), 14 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 0ee588276534..37545ecb845a 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -807,6 +807,8 @@ static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
  * Optionally this calls &dma_buf_ops.attach to allow device-specific attach
  * functionality.
  *
+ * Exporters shall use ww_ctx acquired by this function.
+ *
  * Returns:
  *
  * A pointer to newly created &dma_buf_attachment on success, or a negative
@@ -822,6 +824,7 @@ dma_buf_dynamic_attach_unlocked(struct dma_buf *dmabuf, struct device *dev,
 				void *importer_priv)
 {
 	struct dma_buf_attachment *attach;
+	struct ww_acquire_ctx ww_ctx;
 	int ret;
 
 	if (WARN_ON(!dmabuf || !dev))
@@ -841,7 +844,8 @@ dma_buf_dynamic_attach_unlocked(struct dma_buf *dmabuf, struct device *dev,
 	attach->importer_ops = importer_ops;
 	attach->importer_priv = importer_priv;
 
-	dma_resv_lock(dmabuf->resv, NULL);
+	ww_acquire_init(&ww_ctx, &reservation_ww_class);
+	dma_resv_lock(dmabuf->resv, &ww_ctx);
 
 	if (dmabuf->ops->attach) {
 		ret = dmabuf->ops->attach(dmabuf, attach);
@@ -876,11 +880,13 @@ dma_buf_dynamic_attach_unlocked(struct dma_buf *dmabuf, struct device *dev,
 	}
 
 	dma_resv_unlock(dmabuf->resv);
+	ww_acquire_fini(&ww_ctx);
 
 	return attach;
 
 err_attach:
 	dma_resv_unlock(attach->dmabuf->resv);
+	ww_acquire_fini(&ww_ctx);
 	kfree(attach);
 	return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index c199bf71c373..9173f0232b16 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -173,7 +173,7 @@ static int i915_gem_dmabuf_attach(struct dma_buf *dmabuf,
 	if (!i915_gem_object_can_migrate(obj, INTEL_REGION_SMEM))
 		return -EOPNOTSUPP;
 
-	for_i915_gem_ww(&ww, err, true) {
+	for_i915_dmabuf_ww(&ww, dmabuf, err, true) {
 		err = i915_gem_object_migrate(obj, &ww, INTEL_REGION_SMEM);
 		if (err)
 			continue;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 30fe847c6664..ad7d602fc43a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -3409,7 +3409,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
 		goto err_vma;
 	}
 
-	ww_acquire_done(&eb.ww.ctx);
+	ww_acquire_done(eb.ww.ctx);
 	eb_capture_stage(&eb);
 
 	out_fence = eb_requests_create(&eb, in_fence, out_fence_fd);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index e11d82a9f7c3..5ae38f94a5c7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -178,9 +178,9 @@ static inline int __i915_gem_object_lock(struct drm_i915_gem_object *obj,
 	int ret;
 
 	if (intr)
-		ret = dma_resv_lock_interruptible(obj->base.resv, ww ? &ww->ctx : NULL);
+		ret = dma_resv_lock_interruptible(obj->base.resv, ww ? ww->ctx : NULL);
 	else
-		ret = dma_resv_lock(obj->base.resv, ww ? &ww->ctx : NULL);
+		ret = dma_resv_lock(obj->base.resv, ww ? ww->ctx : NULL);
 
 	if (!ret && ww) {
 		i915_gem_object_get(obj);
@@ -216,7 +216,7 @@ static inline bool i915_gem_object_trylock(struct drm_i915_gem_object *obj,
 	if (!ww)
 		return dma_resv_trylock(obj->base.resv);
 	else
-		return ww_mutex_trylock(&obj->base.resv->lock, &ww->ctx);
+		return ww_mutex_trylock(&obj->base.resv->lock, ww->ctx);
 }
 
 static inline void i915_gem_object_unlock(struct drm_i915_gem_object *obj)
diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
index f025ee4fa526..047f72e32d47 100644
--- a/drivers/gpu/drm/i915/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/i915_gem_evict.c
@@ -458,7 +458,7 @@ int i915_gem_evict_vm(struct i915_address_space *vm, struct i915_gem_ww_ctx *ww)
 			 * need the object ref.
 			 */
 			if (dying_vma(vma) ||
-			    (ww && (dma_resv_locking_ctx(vma->obj->base.resv) == &ww->ctx))) {
+			    (ww && (dma_resv_locking_ctx(vma->obj->base.resv) == ww->ctx))) {
 				__i915_vma_pin(vma);
 				list_add(&vma->evict_link, &locked_eviction_list);
 				continue;
diff --git a/drivers/gpu/drm/i915/i915_gem_ww.c b/drivers/gpu/drm/i915/i915_gem_ww.c
index 3f6ff139478e..c47898993c7d 100644
--- a/drivers/gpu/drm/i915/i915_gem_ww.c
+++ b/drivers/gpu/drm/i915/i915_gem_ww.c
@@ -6,12 +6,20 @@
 #include "i915_gem_ww.h"
 #include "gem/i915_gem_object.h"
 
-void i915_gem_ww_ctx_init(struct i915_gem_ww_ctx *ww, bool intr)
+void i915_gem_ww_ctx_prep(struct i915_gem_ww_ctx *ww,
+			  struct ww_acquire_ctx *ww_ctx,
+			  bool intr)
 {
-	ww_acquire_init(&ww->ctx, &reservation_ww_class);
 	INIT_LIST_HEAD(&ww->obj_list);
 	ww->intr = intr;
 	ww->contended = NULL;
+	ww->ctx = ww_ctx;
+}
+
+void i915_gem_ww_ctx_init(struct i915_gem_ww_ctx *ww, bool intr)
+{
+	ww_acquire_init(&ww->ww_ctx, &reservation_ww_class);
+	i915_gem_ww_ctx_prep(ww, &ww->ww_ctx, intr);
 }
 
 static void i915_gem_ww_ctx_unlock_all(struct i915_gem_ww_ctx *ww)
@@ -36,7 +44,15 @@ void i915_gem_ww_ctx_fini(struct i915_gem_ww_ctx *ww)
 {
 	i915_gem_ww_ctx_unlock_all(ww);
 	WARN_ON(ww->contended);
-	ww_acquire_fini(&ww->ctx);
+
+	if (ww->ctx == &ww->ww_ctx)
+		ww_acquire_fini(ww->ctx);
+}
+
+void i915_gem_ww_ctx_fini2(struct i915_gem_ww_ctx *ww)
+{
+	i915_gem_ww_ctx_unlock_all(ww);
+	WARN_ON(ww->contended);
 }
 
 int __must_check i915_gem_ww_ctx_backoff(struct i915_gem_ww_ctx *ww)
@@ -48,9 +64,9 @@ int __must_check i915_gem_ww_ctx_backoff(struct i915_gem_ww_ctx *ww)
 
 	i915_gem_ww_ctx_unlock_all(ww);
 	if (ww->intr)
-		ret = dma_resv_lock_slow_interruptible(ww->contended->base.resv, &ww->ctx);
+		ret = dma_resv_lock_slow_interruptible(ww->contended->base.resv, ww->ctx);
 	else
-		dma_resv_lock_slow(ww->contended->base.resv, &ww->ctx);
+		dma_resv_lock_slow(ww->contended->base.resv, ww->ctx);
 
 	if (!ret)
 		list_add_tail(&ww->contended->obj_link, &ww->obj_list);
diff --git a/drivers/gpu/drm/i915/i915_gem_ww.h b/drivers/gpu/drm/i915/i915_gem_ww.h
index 86f0fe343de6..e9b0fd4debbf 100644
--- a/drivers/gpu/drm/i915/i915_gem_ww.h
+++ b/drivers/gpu/drm/i915/i915_gem_ww.h
@@ -8,13 +8,17 @@
 #include <drm/drm_drv.h>
 
 struct i915_gem_ww_ctx {
-	struct ww_acquire_ctx ctx;
+	struct ww_acquire_ctx *ctx;
+	struct ww_acquire_ctx ww_ctx;
 	struct list_head obj_list;
 	struct drm_i915_gem_object *contended;
 	bool intr;
 };
 
-void i915_gem_ww_ctx_init(struct i915_gem_ww_ctx *ctx, bool intr);
+void i915_gem_ww_ctx_prep(struct i915_gem_ww_ctx *ww,
+			  struct ww_acquire_ctx *ww_ctx,
+			  bool intr);
+void i915_gem_ww_ctx_init(struct i915_gem_ww_ctx *ww, bool intr);
 void i915_gem_ww_ctx_fini(struct i915_gem_ww_ctx *ctx);
 int __must_check i915_gem_ww_ctx_backoff(struct i915_gem_ww_ctx *ctx);
 void i915_gem_ww_unlock_single(struct drm_i915_gem_object *obj);
@@ -38,4 +42,11 @@ static inline int __i915_gem_ww_fini(struct i915_gem_ww_ctx *ww, int err)
 	for (i915_gem_ww_ctx_init(_ww, _intr), (_err) = -EDEADLK; \
 	     (_err) == -EDEADLK;				  \
 	     (_err) = __i915_gem_ww_fini(_ww, _err))
+
+#define for_i915_dmabuf_ww(_ww, _dmabuf, _err, _intr)		  \
+	for (i915_gem_ww_ctx_prep(_ww, dma_resv_locking_ctx((_dmabuf)->resv), _intr), \
+	     (_err) = -EDEADLK; 				  \
+	     (_err) == -EDEADLK;				  \
+	     (_err) = __i915_gem_ww_fini(_ww, _err))
+
 #endif
-- 
2.36.1

