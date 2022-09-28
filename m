Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0E15EE505
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 21:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B3A210E7F7;
	Wed, 28 Sep 2022 19:17:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A4010E7EF;
 Wed, 28 Sep 2022 19:17:27 +0000 (UTC)
Received: from dimapc.. (unknown [109.252.125.248])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2EA5B660229B;
 Wed, 28 Sep 2022 20:17:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1664392646;
 bh=1NrFDIEY1QfZG+NOs9U3CRZxTNDXg8WRHwv6i/q1kjI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DLonZI1p5RO7z29nQcfnwZ4Uh3QAepEY5afS1MjchFx4P4yJjxoTlUn4XGSHvpRjb
 b4J7zYFunbpdhxZZ4E0PQAh0iWIth2XLL1Xkuf1Z42nX5sklsaArpTDjvNrp6EMsfa
 ++y/x2066VwYKp2hc9YjTNkUsRJzRjspAr3vKXbH75nvCSl4JpT45i2gJWjFCUzP4i
 Si50eAmbVqxcDVbRhHMoqlN64fUM3AH/rFuRCzyfmM/EBm3GngeuFjMZAochzIY0DF
 WNCWsUNF4V0c8GMOjqICW1yJ1wJEX/03A2HFdOqejKP3UFEzMhMKYqb74gfPRp4FLl
 Z4CLF/eH3lxpw==
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
Subject: [PATCH v6 01/21] dma-buf: Add unlocked variant of vmapping functions
Date: Wed, 28 Sep 2022 22:15:40 +0300
Message-Id: <20220928191600.5874-2-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928191600.5874-1-dmitry.osipenko@collabora.com>
References: <20220928191600.5874-1-dmitry.osipenko@collabora.com>
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
 drivers/dma-buf/dma-buf.c | 41 +++++++++++++++++++++++++++++++++++++++
 include/linux/dma-buf.h   |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index dd0f83ee505b..0427f3b88170 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1425,6 +1425,31 @@ int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
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
@@ -1449,6 +1474,22 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
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

