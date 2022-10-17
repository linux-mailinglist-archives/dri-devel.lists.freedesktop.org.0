Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8226014C5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 19:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CB510E69C;
	Mon, 17 Oct 2022 17:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF54F10E763;
 Mon, 17 Oct 2022 17:24:21 +0000 (UTC)
Received: from dimapc.. (109-252-119-114.nat.spd-mgts.ru [109.252.119.114])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B7BE26602375;
 Mon, 17 Oct 2022 18:24:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666027460;
 bh=EgoLeiRcyZ6rtEkUvPDBuaLVPAM8w09Garsg2bXjQi4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PrnB+hIpA9nwg2noU4fw+jB4a5k6TAdFBgwjbcFxVz4gk0UicobU4SqAdnv7n/+Fv
 DJ7sexIP36v9XLtCie4IsYLHM6LIpvhnOmhLdUNDAysHo/uA/+yHjSW79yrwqYRRdx
 kJHArdUBp/9a/UnH0mVzeItwf3wiKEFMPynUYOrb+cqAybh4okxZQVRLMirSWWRJfH
 k+Crle1O0httVnbUldJzvMWHEmQmpgPyBbDCm8dUF74V2VrKwJwEppEPNLO9J9mH/t
 WOp20K9YDLdmcwPdYJlkaOizOtnfkVum8yrn2ZwIpTiD9kxZnJyv1wo7kwmgq/u8ff
 ON+xlwHL8eqCg==
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
Subject: [PATCH v7 02/21] dma-buf: Add unlocked variant of attachment-mapping
 functions
Date: Mon, 17 Oct 2022 20:22:10 +0300
Message-Id: <20221017172229.42269-3-dmitry.osipenko@collabora.com>
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

Add unlocked variant of dma_buf_map/unmap_attachment() that will
be used by drivers that don't take the reservation lock explicitly.

Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
Acked-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/dma-buf/dma-buf.c | 53 +++++++++++++++++++++++++++++++++++++++
 include/linux/dma-buf.h   |  6 +++++
 2 files changed, 59 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index e95fc8dc3aed..3e4060dadb74 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1100,6 +1100,34 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
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
@@ -1136,6 +1164,31 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
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
2.37.3

