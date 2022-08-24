Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E28AC59F7B4
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 12:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3D310EFDE;
	Wed, 24 Aug 2022 10:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E122114AFC9;
 Wed, 24 Aug 2022 10:23:44 +0000 (UTC)
Received: from dimapc.. (109-252-119-13.nat.spd-mgts.ru [109.252.119.13])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C3F656601E80;
 Wed, 24 Aug 2022 11:23:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1661336623;
 bh=tUHHyjnssBHNcpdFjbIByyIscqilylx0IKM9xE8tryg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ceoEL7FsiDBYxIntDQ9bDXvbnt/JLKZ6AMCy6e0vpUbd0eFio/l1TwA6Ag7PXcf9Y
 iX/rVcJCPx9VDhuWmiwxfPZKzz4jraaPIAfRL5MN97AezGKyrKqR1DM5AHCnYYMVnY
 4+JxGMztg2bC5m0rQOobLiL9MSGweRqmGo1R/a+QEtnMU28KmvKio+qg6QlNlmTQLf
 Bpl/EwCBMN712kOzQL8jiLH5K3l5o/OVKwH5y7aj2Bd91r+oqHBYTTlxV/KRkXgncm
 GZusfsLTHpZSU5qsu2LnqkOpylQIFjx/c0ebnzACDY0FwZn3P7vgoFpE0QKirqBgZT
 rwUYIOLoRREvw==
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
Subject: [PATCH v3 2/9] dma-buf: Add locked variant of dma_buf_vmap/vunmap()
Date: Wed, 24 Aug 2022 13:22:41 +0300
Message-Id: <20220824102248.91964-3-dmitry.osipenko@collabora.com>
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

Add locked variant of dma_buf_vmap/vunmap() that will be utilized by
DRM drivers once vmap/unmap functions will be moved to the new locking
convention.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/dma-buf/dma-buf.c | 42 +++++++++++++++++++++++++++++++++++----
 include/linux/dma-buf.h   |  2 ++
 2 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 452a6a1f1e60..34173aafe6c9 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1373,7 +1373,7 @@ int dma_buf_mmap_unlocked(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 EXPORT_SYMBOL_NS_GPL(dma_buf_mmap_unlocked, DMA_BUF);
 
 /**
- * dma_buf_vmap_unlocked - Create virtual mapping for the buffer object into kernel
+ * dma_buf_vmap - Create virtual mapping for the buffer object into kernel
  * address space. Same restrictions as for vmap and friends apply.
  * @dmabuf:	[in]	buffer to vmap
  * @map:	[out]	returns the vmap pointer
@@ -1388,7 +1388,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_mmap_unlocked, DMA_BUF);
  *
  * Returns 0 on success, or a negative errno code otherwise.
  */
-int dma_buf_vmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
+int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
 {
 	struct iosys_map ptr;
 	int ret = 0;
@@ -1424,14 +1424,34 @@ int dma_buf_vmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
 	mutex_unlock(&dmabuf->lock);
 	return ret;
 }
+EXPORT_SYMBOL_NS_GPL(dma_buf_vmap, DMA_BUF);
+
+/**
+ * dma_buf_vmap_unlocked - Create virtual mapping for the buffer object into kernel
+ * address space. Same restrictions as for vmap and friends apply.
+ * @dmabuf:	[in]	buffer to vmap
+ * @map:	[out]	returns the vmap pointer
+ *
+ * Unlocked version of dma_buf_vmap()
+ *
+ * Returns 0 on success, or a negative errno code otherwise.
+ */
+int dma_buf_vmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
+{
+	int ret;
+
+	ret = dma_buf_vmap(dmabuf, map);
+
+	return ret;
+}
 EXPORT_SYMBOL_NS_GPL(dma_buf_vmap_unlocked, DMA_BUF);
 
 /**
- * dma_buf_vunmap_unlocked - Unmap a vmap obtained by dma_buf_vmap.
+ * dma_buf_vunmap - Unmap a vmap obtained by dma_buf_vmap.
  * @dmabuf:	[in]	buffer to vunmap
  * @map:	[in]	vmap pointer to vunmap
  */
-void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
+void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
 {
 	if (WARN_ON(!dmabuf))
 		return;
@@ -1448,6 +1468,20 @@ void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
 	}
 	mutex_unlock(&dmabuf->lock);
 }
+EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap, DMA_BUF);
+
+/**
+ * dma_buf_vunmap_unlocked - Unmap a vmap obtained by dma_buf_vmap.
+ * @dmabuf:	[in]	buffer to vunmap
+ * @map:	[in]	vmap pointer to vunmap
+ */
+void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
+{
+	if (WARN_ON(!dmabuf))
+		return;
+
+	dma_buf_vunmap(dmabuf, map);
+}
 EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap_unlocked, DMA_BUF);
 
 #ifdef CONFIG_DEBUG_FS
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 9ab09569dec1..da2057569101 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -636,4 +636,6 @@ int dma_buf_mmap_unlocked(struct dma_buf *, struct vm_area_struct *,
 			  unsigned long);
 int dma_buf_vmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map);
 void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map);
+int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map);
+void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map);
 #endif /* __DMA_BUF_H__ */
-- 
2.37.2

