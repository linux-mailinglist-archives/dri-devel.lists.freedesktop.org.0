Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8215A81C9
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 17:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A46ED10E455;
	Wed, 31 Aug 2022 15:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E89D10E43B;
 Wed, 31 Aug 2022 15:39:34 +0000 (UTC)
Received: from dimapc.. (109-252-119-13.nat.spd-mgts.ru [109.252.119.13])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5ED406601DF6;
 Wed, 31 Aug 2022 16:39:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1661960373;
 bh=TO/xOZs1dtACY2TtNnVw4DrKgpYQloSInWovd/NRlPU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q4RpyrFuRPXfFwE4IPeTn4f8aO9fs8mGCDqmr3lYg5wWfswotgiPg5YqK1c106c7N
 N+tML8Z0SX3jPKy///QcQSjV+VsPsyEZoMJDMq+YIBdB0m/lJPlhCTFNrgJ1RAex73
 AaATZQzxNo2/kJi2ozDsuUllogY9NgWh3degqbUQfwo0p7uascb7MXL7190qqY8CYE
 e4E/5/tu8W51Cd/taQhQP0yh3Xh4dT4zR5wOtb+tYqj3L+WFqDrq2nXepRRxygLFhO
 xQQpfkba2uPpP/BnzoYygxmBgmvhZ10EVXFX7Xf1zq8DgME4eBewDGKYdXMw5RvklB
 CZAOBciV9e37Q==
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
 Qiang Yu <yuq825@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Tomi Valkeinen <tomba@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Subject: [PATCH v4 06/21] drm/i915: Prepare to dynamic dma-buf locking
 specification
Date: Wed, 31 Aug 2022 18:37:42 +0300
Message-Id: <20220831153757.97381-7-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831153757.97381-1-dmitry.osipenko@collabora.com>
References: <20220831153757.97381-1-dmitry.osipenko@collabora.com>
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
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare i915 driver to the common dynamic dma-buf locking convention
by starting to use the unlocked versions of dma-buf API functions
and handling cases where importer now holds the reservation lock.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c       |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c       | 12 ++++++++++++
 .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 16 ++++++++--------
 3 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index f5062d0c6333..07eee1c09aaf 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -72,7 +72,7 @@ static int i915_gem_dmabuf_vmap(struct dma_buf *dma_buf,
 	struct drm_i915_gem_object *obj = dma_buf_to_obj(dma_buf);
 	void *vaddr;
 
-	vaddr = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WB);
+	vaddr = i915_gem_object_pin_map(obj, I915_MAP_WB);
 	if (IS_ERR(vaddr))
 		return PTR_ERR(vaddr);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 389e9f157ca5..7e2a9b02526c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -331,7 +331,19 @@ static void __i915_gem_free_objects(struct drm_i915_private *i915,
 			continue;
 		}
 
+		/*
+		 * dma_buf_unmap_attachment() requires reservation to be
+		 * locked. The imported GEM shouldn't share reservation lock,
+		 * so it's safe to take the lock.
+		 */
+		if (obj->base.import_attach)
+			i915_gem_object_lock(obj, NULL);
+
 		__i915_gem_object_pages_fini(obj);
+
+		if (obj->base.import_attach)
+			i915_gem_object_unlock(obj);
+
 		__i915_gem_free_object(obj);
 
 		/* But keep the pointer alive for RCU-protected lookups */
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
index 62c61af77a42..9e3ed634aa0e 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
@@ -213,7 +213,7 @@ static int igt_dmabuf_import_same_driver(struct drm_i915_private *i915,
 		goto out_import;
 	}
 
-	st = dma_buf_map_attachment(import_attach, DMA_BIDIRECTIONAL);
+	st = dma_buf_map_attachment_unlocked(import_attach, DMA_BIDIRECTIONAL);
 	if (IS_ERR(st)) {
 		err = PTR_ERR(st);
 		goto out_detach;
@@ -226,7 +226,7 @@ static int igt_dmabuf_import_same_driver(struct drm_i915_private *i915,
 		timeout = -ETIME;
 	}
 	err = timeout > 0 ? 0 : timeout;
-	dma_buf_unmap_attachment(import_attach, st, DMA_BIDIRECTIONAL);
+	dma_buf_unmap_attachment_unlocked(import_attach, st, DMA_BIDIRECTIONAL);
 out_detach:
 	dma_buf_detach(dmabuf, import_attach);
 out_import:
@@ -296,7 +296,7 @@ static int igt_dmabuf_import(void *arg)
 		goto out_obj;
 	}
 
-	err = dma_buf_vmap(dmabuf, &map);
+	err = dma_buf_vmap_unlocked(dmabuf, &map);
 	dma_map = err ? NULL : map.vaddr;
 	if (!dma_map) {
 		pr_err("dma_buf_vmap failed\n");
@@ -337,7 +337,7 @@ static int igt_dmabuf_import(void *arg)
 
 	err = 0;
 out_dma_map:
-	dma_buf_vunmap(dmabuf, &map);
+	dma_buf_vunmap_unlocked(dmabuf, &map);
 out_obj:
 	i915_gem_object_put(obj);
 out_dmabuf:
@@ -358,7 +358,7 @@ static int igt_dmabuf_import_ownership(void *arg)
 	if (IS_ERR(dmabuf))
 		return PTR_ERR(dmabuf);
 
-	err = dma_buf_vmap(dmabuf, &map);
+	err = dma_buf_vmap_unlocked(dmabuf, &map);
 	ptr = err ? NULL : map.vaddr;
 	if (!ptr) {
 		pr_err("dma_buf_vmap failed\n");
@@ -367,7 +367,7 @@ static int igt_dmabuf_import_ownership(void *arg)
 	}
 
 	memset(ptr, 0xc5, PAGE_SIZE);
-	dma_buf_vunmap(dmabuf, &map);
+	dma_buf_vunmap_unlocked(dmabuf, &map);
 
 	obj = to_intel_bo(i915_gem_prime_import(&i915->drm, dmabuf));
 	if (IS_ERR(obj)) {
@@ -418,7 +418,7 @@ static int igt_dmabuf_export_vmap(void *arg)
 	}
 	i915_gem_object_put(obj);
 
-	err = dma_buf_vmap(dmabuf, &map);
+	err = dma_buf_vmap_unlocked(dmabuf, &map);
 	ptr = err ? NULL : map.vaddr;
 	if (!ptr) {
 		pr_err("dma_buf_vmap failed\n");
@@ -435,7 +435,7 @@ static int igt_dmabuf_export_vmap(void *arg)
 	memset(ptr, 0xc5, dmabuf->size);
 
 	err = 0;
-	dma_buf_vunmap(dmabuf, &map);
+	dma_buf_vunmap_unlocked(dmabuf, &map);
 out:
 	dma_buf_put(dmabuf);
 	return err;
-- 
2.37.2

