Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B33E359F7B5
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 12:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA0510E207;
	Wed, 24 Aug 2022 10:29:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04BE10E35A;
 Wed, 24 Aug 2022 10:23:49 +0000 (UTC)
Received: from dimapc.. (109-252-119-13.nat.spd-mgts.ru [109.252.119.13])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0F8CE6601E85;
 Wed, 24 Aug 2022 11:23:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1661336628;
 bh=yJhLmWLiZYSaVVYpgyXfxz7ssZGXeWsgtJLIcgiYQhg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cR6l5P3hk+4DgOkFYE7b7ShOmufEVYIEoMuYmR+B9JRZEQsNkMZpX/Q4TdWCwG9bl
 cFJfBE7LTAU/dulmS8UMBFoANSxxnSMIJmzKS6FB+hRhsCHkIdD0B1pRMHBxPKR0G7
 r4WBQ7qlhYOt+yLYJUtQNXRlVSLGlIz4TAuMpuH3n8+Noir1uc2e4xAYEqI3am2nAQ
 EHEZ2qLLS2EftDL48KSS7NszxIdF0Yhb3xzLozhcYxohDD0rJmR3jDIAnaMuxdqknf
 t0ki3DbaaSr2wpBm5cBtA+ZWcRnEXaxdeDfx4giTF07TzpSUxfP2ECsMorl9Skhctm
 /MrCMtEyAzCFQ==
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
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
 Qiang Yu <yuq825@gmail.com>
Subject: [PATCH v3 4/9] dma-buf: Move dma_buf_vmap/vunmap_unlocked() to
 dynamic locking specification
Date: Wed, 24 Aug 2022 13:22:43 +0300
Message-Id: <20220824102248.91964-5-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220824102248.91964-1-dmitry.osipenko@collabora.com>
References: <20220824102248.91964-1-dmitry.osipenko@collabora.com>
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
Cc: lima@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move dma_buf_vmap/vunmap_unlocked() functions to the dynamic locking
specification by taking the reservation lock. All the affected drivers
were prepared to this change by a previous drm/gem patch.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/dma-buf/dma-buf.c   | 8 ++++++++
 drivers/gpu/drm/drm_prime.c | 4 ++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 34173aafe6c9..f358af401360 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1398,6 +1398,8 @@ int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
 	if (WARN_ON(!dmabuf))
 		return -EINVAL;
 
+	dma_resv_assert_held(dmabuf->resv);
+
 	if (!dmabuf->ops->vmap)
 		return -EINVAL;
 
@@ -1440,7 +1442,9 @@ int dma_buf_vmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
 {
 	int ret;
 
+	dma_resv_lock(dmabuf->resv, NULL);
 	ret = dma_buf_vmap(dmabuf, map);
+	dma_resv_unlock(dmabuf->resv);
 
 	return ret;
 }
@@ -1456,6 +1460,8 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
 	if (WARN_ON(!dmabuf))
 		return;
 
+	dma_resv_assert_held(dmabuf->resv);
+
 	BUG_ON(iosys_map_is_null(&dmabuf->vmap_ptr));
 	BUG_ON(dmabuf->vmapping_counter == 0);
 	BUG_ON(!iosys_map_is_equal(&dmabuf->vmap_ptr, map));
@@ -1480,7 +1486,9 @@ void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
 	if (WARN_ON(!dmabuf))
 		return;
 
+	dma_resv_lock(dmabuf->resv, NULL);
 	dma_buf_vunmap(dmabuf, map);
+	dma_resv_unlock(dmabuf->resv);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap_unlocked, DMA_BUF);
 
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 7a7710158880..e9b7d3fa67f1 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -682,7 +682,7 @@ int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct iosys_map *map)
 {
 	struct drm_gem_object *obj = dma_buf->priv;
 
-	return drm_gem_vmap_unlocked(obj, map);
+	return drm_gem_vmap(obj, map);
 }
 EXPORT_SYMBOL(drm_gem_dmabuf_vmap);
 
@@ -698,7 +698,7 @@ void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct iosys_map *map)
 {
 	struct drm_gem_object *obj = dma_buf->priv;
 
-	drm_gem_vunmap_unlocked(obj, map);
+	drm_gem_vunmap(obj, map);
 }
 EXPORT_SYMBOL(drm_gem_dmabuf_vunmap);
 
-- 
2.37.2

