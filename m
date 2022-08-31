Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E47FC5A817B
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 17:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E03D10E436;
	Wed, 31 Aug 2022 15:39:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE01010E43D;
 Wed, 31 Aug 2022 15:39:21 +0000 (UTC)
Received: from dimapc.. (109-252-119-13.nat.spd-mgts.ru [109.252.119.13])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BB1846601DE8;
 Wed, 31 Aug 2022 16:39:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1661960360;
 bh=AwRlDUnXNPm7IrchqI1DhYwz6VGywo+kRbZaIUUsbws=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EA11+Tf1xGgFwhLzaB4zpIaDCRNIdmnnJHMUCOo8+cNcA1+1F0D9jn9Wul3MjrQdD
 E0MPm/kez2xbgU9fHHNKDQXMMW4h2mK4UsWjNtwn5C67YAnuBWpF+nC+PNcQOxHwe3
 HZNocGVRO7Gx+HhKqArjSV+MCgscVPZcopzRkhcwwjxgHqrrxXYu2HhbUNjqd4nBia
 cPLVBNFFXe1K8+Kx+80Y5D6dAd6wgcYCQv3I82150DNV6nMETDfoT+f3K4lppzovLS
 hUo/r0FpG/YF36umNf1y+HgWwYpDw+XlGpyjBOSHprJrXFUIrwKGfPk/NTQA99oiVM
 AV/jxqjw8iHiA==
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
Subject: [PATCH v4 02/21] dma-buf: Add unlocked variant of attachment-mapping
 functions
Date: Wed, 31 Aug 2022 18:37:38 +0300
Message-Id: <20220831153757.97381-3-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831153757.97381-1-dmitry.osipenko@collabora.com>
References: <20220831153757.97381-1-dmitry.osipenko@collabora.com>
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

Add unlocked variant of dma_buf_map/unmap_attachment() that will
be used by drivers that don't take the reservation lock explicitly.

Acked-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/dma-buf/dma-buf.c | 53 +++++++++++++++++++++++++++++++++++++++
 include/linux/dma-buf.h   |  6 +++++
 2 files changed, 59 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 5e4459bb1a6f..51fb69048853 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1099,6 +1099,34 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment, DMA_BUF);
 
+/**
+ * dma_buf_map_attachment_unlocked - Returns the scatterlist table of the attachment;
+ * mapped into _device_ address space. Is a wrapper for map_dma_buf() of the
+ * dma_buf_ops.
+ * @attach:	[in]	attachment whose scatterlist is to be returned
+ * @direction:	[in]	direction of DMA transfer
+ *
+ * Unlocked variant of dma_buf_map_attachment().
+ */
+struct sg_table *
+dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
+				enum dma_data_direction direction)
+{
+	struct sg_table *sg_table;
+
+	might_sleep();
+
+	if (WARN_ON(!attach || !attach->dmabuf))
+		return ERR_PTR(-EINVAL);
+
+	dma_resv_lock(attach->dmabuf->resv, NULL);
+	sg_table = dma_buf_map_attachment(attach, direction);
+	dma_resv_unlock(attach->dmabuf->resv);
+
+	return sg_table;
+}
+EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment_unlocked, DMA_BUF);
+
 /**
  * dma_buf_unmap_attachment - unmaps and decreases usecount of the buffer;might
  * deallocate the scatterlist associated. Is a wrapper for unmap_dma_buf() of
@@ -1135,6 +1163,31 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment, DMA_BUF);
 
+/**
+ * dma_buf_unmap_attachment_unlocked - unmaps and decreases usecount of the buffer;might
+ * deallocate the scatterlist associated. Is a wrapper for unmap_dma_buf() of
+ * dma_buf_ops.
+ * @attach:	[in]	attachment to unmap buffer from
+ * @sg_table:	[in]	scatterlist info of the buffer to unmap
+ * @direction:	[in]	direction of DMA transfer
+ *
+ * Unlocked variant of dma_buf_unmap_attachment().
+ */
+void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
+				       struct sg_table *sg_table,
+				       enum dma_data_direction direction)
+{
+	might_sleep();
+
+	if (WARN_ON(!attach || !attach->dmabuf || !sg_table))
+		return;
+
+	dma_resv_lock(attach->dmabuf->resv, NULL);
+	dma_buf_unmap_attachment(attach, sg_table, direction);
+	dma_resv_unlock(attach->dmabuf->resv);
+}
+EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment_unlocked, DMA_BUF);
+
 /**
  * dma_buf_move_notify - notify attachments that DMA-buf is moving
  *
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 8daa054dd7fe..f11b5bbc2f37 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -627,6 +627,12 @@ int dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
 			     enum dma_data_direction dir);
 int dma_buf_end_cpu_access(struct dma_buf *dma_buf,
 			   enum dma_data_direction dir);
+struct sg_table *
+dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
+				enum dma_data_direction direction);
+void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
+				       struct sg_table *sg_table,
+				       enum dma_data_direction direction);
 
 int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *,
 		 unsigned long);
-- 
2.37.2

