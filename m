Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3E96014C6
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 19:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CA010E69B;
	Mon, 17 Oct 2022 17:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB4510E3AE;
 Mon, 17 Oct 2022 17:24:17 +0000 (UTC)
Received: from dimapc.. (109-252-119-114.nat.spd-mgts.ru [109.252.119.114])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2F9B2660232A;
 Mon, 17 Oct 2022 18:24:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666027456;
 bh=Ex3AyquhNB6SUyXxM39A6LQM86DSUXI6d8WILYiNDB4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D14SQhLaDc3wymEhfQ7kLOLaTxtKSAiqblynz43C7tbL9D87TBKj9qtbPtRFBl5Ic
 kvkmX9iLBEezccTFptMYfIZsAxP7NV4mdV6qTt+Lf3Ckfx6h1kPMZGVHErAzDSPl5F
 P1D6fEHo10EcXP/Bipt6/vA++Ef96gT5IAOt6Aj40ir/ztZO4RQYBUBkohSMkXIFbx
 WLQ5L+mUh9KjBkUe0zWKlm27XCOHUx7l+LZ6Pu0jBhzR1UzXVlzAEmfsnxx8Grpzmd
 +KBvqdSOy6UATlaRldthV2/8tkSd2Qa2P/DOAMyCHnepVWOFc+PuG0157aUl6S2IIY
 kEb5ReGRHuzpw==
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
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Ruhl Michael J <michael.j.ruhl@intel.com>
Subject: [PATCH v7 01/21] dma-buf: Add unlocked variant of vmapping functions
Date: Mon, 17 Oct 2022 20:22:09 +0300
Message-Id: <20221017172229.42269-2-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017172229.42269-1-dmitry.osipenko@collabora.com>
References: <20221017172229.42269-1-dmitry.osipenko@collabora.com>
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
Cc: linux-rdma@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add unlocked variant of dma_buf_vmap/vunmap() that will be utilized
by drivers that don't take the reservation lock explicitly.

Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
Acked-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/dma-buf/dma-buf.c | 43 +++++++++++++++++++++++++++++++++++++++
 include/linux/dma-buf.h   |  2 ++
 2 files changed, 45 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index efb4990b29e1..e95fc8dc3aed 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1425,6 +1425,33 @@ int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_vmap, DMA_BUF);
 
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
+	iosys_map_clear(map);
+
+	if (WARN_ON(!dmabuf))
+		return -EINVAL;
+
+	dma_resv_lock(dmabuf->resv, NULL);
+	ret = dma_buf_vmap(dmabuf, map);
+	dma_resv_unlock(dmabuf->resv);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(dma_buf_vmap_unlocked, DMA_BUF);
+
 /**
  * dma_buf_vunmap - Unmap a vmap obtained by dma_buf_vmap.
  * @dmabuf:	[in]	buffer to vunmap
@@ -1449,6 +1476,22 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap, DMA_BUF);
 
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
+	dma_resv_lock(dmabuf->resv, NULL);
+	dma_buf_vunmap(dmabuf, map);
+	dma_resv_unlock(dmabuf->resv);
+}
+EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap_unlocked, DMA_BUF);
+
 #ifdef CONFIG_DEBUG_FS
 static int dma_buf_debug_show(struct seq_file *s, void *unused)
 {
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 71731796c8c3..8daa054dd7fe 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -632,4 +632,6 @@ int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
 		 unsigned long);
 int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map);
 void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map);
+int dma_buf_vmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map);
+void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map);
 #endif /* __DMA_BUF_H__ */
-- 
2.37.3

