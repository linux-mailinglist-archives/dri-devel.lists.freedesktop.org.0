Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACFA715224
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 00:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9809710E31B;
	Mon, 29 May 2023 22:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39E910E310;
 Mon, 29 May 2023 22:46:15 +0000 (UTC)
Received: from workpc.. (109-252-150-34.dynamic.spd-mgts.ru [109.252.150.34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3CBFF66065B2;
 Mon, 29 May 2023 23:46:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1685400374;
 bh=+6RJQyz1SQvOuneJSGlfQv6Mf5mBzyHbdAeoEcurylU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UClCPfJmZXkUcPnwalgQpy/q53+uEpKKe3rNHHPWFetgO3TZ+d1oAd02kvR87Z3Fj
 3Vst0MA6fuKZJkED8bs1qJ7PUvWIaPmAuEd9/w4cVC7jBteCsKCGv3vigWnIn+V2Q+
 2XCxIcNHVdHSky5m+DycMmk2Dk1EnyO7C2HT4i/0daR17uHOoagoaz9OBgWXSozusu
 KIl6rgYd5BFLJCy37/DCU50HFbsKxysvJLrhUPX5eSvtrjpT3R30gkcTs3UVPqx7Ds
 /rWdZCgsgADV0j1sfa6TGqnzE122EDYTiydoy8NnKQZujFi2LRNQj/W6rBI1eVZLnM
 01fAA0MdUd2NA==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomba@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Emil Velikov <emil.l.velikov@gmail.com>
Subject: [PATCH v4 4/6] drm: Don't assert held reservation lock for dma-buf
 mmapping
Date: Tue, 30 May 2023 01:39:33 +0300
Message-Id: <20230529223935.2672495-5-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230529223935.2672495-1-dmitry.osipenko@collabora.com>
References: <20230529223935.2672495-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't assert held dma-buf reservation lock on memory mapping of exported
buffer.

We're going to change dma-buf mmap() locking policy such that exporters
will have to handle the lock. The previous locking policy caused deadlock
problem for DRM drivers in a case of self-imported dma-bufs once these
drivers are moved to use reservation lock universally. The problem is
solved by moving the lock down to exporters. This patch prepares DRM
drivers for the locking policy update.

Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Acked-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_prime.c                | 2 --
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 2 --
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c  | 2 --
 drivers/gpu/drm/tegra/gem.c                | 2 --
 4 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 149cd4ff6a3b..cea85e84666f 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -781,8 +781,6 @@ int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma)
 	struct drm_gem_object *obj = dma_buf->priv;
 	struct drm_device *dev = obj->dev;
 
-	dma_resv_assert_held(dma_buf->resv);
-
 	if (!dev->driver->gem_prime_mmap)
 		return -ENOSYS;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index fd556a076d05..1df74f7aa3dc 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -97,8 +97,6 @@ static int i915_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	int ret;
 
-	dma_resv_assert_held(dma_buf->resv);
-
 	if (obj->base.size < vma->vm_end - vma->vm_start)
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
index 3abc47521b2c..8e194dbc9506 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
@@ -66,8 +66,6 @@ static int omap_gem_dmabuf_mmap(struct dma_buf *buffer,
 	struct drm_gem_object *obj = buffer->priv;
 	int ret = 0;
 
-	dma_resv_assert_held(buffer->resv);
-
 	ret = drm_gem_mmap_obj(obj, omap_gem_mmap_size(obj), vma);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index bce991a2ccc0..871ef5d26523 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -693,8 +693,6 @@ static int tegra_gem_prime_mmap(struct dma_buf *buf, struct vm_area_struct *vma)
 	struct drm_gem_object *gem = buf->priv;
 	int err;
 
-	dma_resv_assert_held(buf->resv);
-
 	err = drm_gem_mmap_obj(gem, gem->size, vma);
 	if (err < 0)
 		return err;
-- 
2.40.1

