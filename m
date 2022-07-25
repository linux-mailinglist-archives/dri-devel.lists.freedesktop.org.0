Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2185801A7
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 17:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD6BF112901;
	Mon, 25 Jul 2022 15:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4C614AAE1;
 Mon, 25 Jul 2022 15:21:03 +0000 (UTC)
Received: from dimapc.. (109-252-119-232.nat.spd-mgts.ru [109.252.119.232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2E5EC6601B0E;
 Mon, 25 Jul 2022 16:21:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658762462;
 bh=va+2N1U6jZR9UG67k72ODpvUReFCq9AoJW3EC29fAyY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hF7ZR01ny2d7o7bYE+Z5dQKruldBmtrcJcYzRtqjWpjWhPHejJuJ8SbR06SZM2aPy
 PtNrndiN/nQSiU3QbPd3ctnZp4AsfylceLBLgZg1oSvV4c3Zv419RY/B4awMy5ey1W
 JdPdffAe80sYcNuJxp42Aie3X8uYUumDehJZnxPU9KVd3D21F8VXhUQFK+8ZkB1DWc
 KmrEP/xKl94kuJKiRYwnCEIPYClTew820OvW7bvO7YKu8UcodMFHHx5wzl7sk4al/K
 i0Wxa4jPFMqEzxfcD4BoG6SAy54UxKHYee5eOgxPvwHkUvoNdjeuL8fEHON/BKLhvt
 80xKjVSm5X6kA==
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
Subject: [PATCH v2 5/5] dma-buf: Remove internal lock
Date: Mon, 25 Jul 2022 18:18:39 +0300
Message-Id: <20220725151839.31622-6-dmitry.osipenko@collabora.com>
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

The internal dma-buf lock isn't needed anymore because the updated
locking specification claims that dma-buf reservation must be locked
by importers, and thus, the internal data is already protected by the
reservation lock. Remove the obsoleted internal lock.

Acked-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/dma-buf/dma-buf.c | 5 -----
 include/linux/dma-buf.h   | 9 ---------
 2 files changed, 14 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index bfdd551c7571..1d211ab400a1 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -656,7 +656,6 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 
 	dmabuf->file = file;
 
-	mutex_init(&dmabuf->lock);
 	INIT_LIST_HEAD(&dmabuf->attachments);
 
 	mutex_lock(&db_list.lock);
@@ -1508,7 +1507,6 @@ int dma_buf_vmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
 		return -EINVAL;
 
 	dma_resv_lock(dmabuf->resv, NULL);
-	mutex_lock(&dmabuf->lock);
 	if (dmabuf->vmapping_counter) {
 		dmabuf->vmapping_counter++;
 		BUG_ON(iosys_map_is_null(&dmabuf->vmap_ptr));
@@ -1528,7 +1526,6 @@ int dma_buf_vmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
 	*map = dmabuf->vmap_ptr;
 
 out_unlock:
-	mutex_unlock(&dmabuf->lock);
 	dma_resv_unlock(dmabuf->resv);
 	return ret;
 }
@@ -1549,13 +1546,11 @@ void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
 	BUG_ON(!iosys_map_is_equal(&dmabuf->vmap_ptr, map));
 
 	dma_resv_lock(dmabuf->resv, NULL);
-	mutex_lock(&dmabuf->lock);
 	if (--dmabuf->vmapping_counter == 0) {
 		if (dmabuf->ops->vunmap)
 			dmabuf->ops->vunmap(dmabuf, map);
 		iosys_map_clear(&dmabuf->vmap_ptr);
 	}
-	mutex_unlock(&dmabuf->lock);
 	dma_resv_unlock(dmabuf->resv);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap_unlocked, DMA_BUF);
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index e7a6a8d28862..2f9fb7f3c835 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -326,15 +326,6 @@ struct dma_buf {
 	/** @ops: dma_buf_ops associated with this buffer object. */
 	const struct dma_buf_ops *ops;
 
-	/**
-	 * @lock:
-	 *
-	 * Used internally to serialize list manipulation, attach/detach and
-	 * vmap/unmap. Note that in many cases this is superseeded by
-	 * dma_resv_lock() on @resv.
-	 */
-	struct mutex lock;
-
 	/**
 	 * @vmapping_counter:
 	 *
-- 
2.36.1

