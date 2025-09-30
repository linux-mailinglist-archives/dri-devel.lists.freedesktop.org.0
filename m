Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6650BAB798
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 07:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0585410E4D1;
	Tue, 30 Sep 2025 05:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="U1/m1IjA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A0310E4C0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:03:12 +0000 (UTC)
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20250930035609epoutp03c0ffe9ca15c43d85077fc111cee4f5b0~p8zw7Xw4j3111931119epoutp03i
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 03:56:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20250930035609epoutp03c0ffe9ca15c43d85077fc111cee4f5b0~p8zw7Xw4j3111931119epoutp03i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759204569;
 bh=1W11SVDf7mSdU0NAMCcHXIjep9ea1d8AcmsqRXISRQQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U1/m1IjAI4DIcv4h6+zFdaQRRfvHsfUqxGWL8Mq2aKcA0XNc+ZOm3QmL3P2Lm8MRG
 4EzOYlvrN+BrBoMVeC22aBgqKgfL6TE9UduTeNsdnidgr7CmlSEOn4VMBJL6dmmSpU
 pntyxvkPZfrR86z6DurT+p5t/pi1hxoaBrJCNkq8=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
 20250930035608epcas5p3346a9c3759e43a5329f5c2692c011366~p8zwVr79x3089530895epcas5p3w;
 Tue, 30 Sep 2025 03:56:08 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.86]) by
 epsnrtp02.localdomain (Postfix) with ESMTP id 4cbPP25Fd5z2SSKh; Tue, 30 Sep
 2025 03:56:06 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20250930035606epcas5p3c38c2ba8148bd90a56415f544c5072f1~p8zt3VL6W0048900489epcas5p30;
 Tue, 30 Sep 2025 03:56:06 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250930035600epsmtip1ad42e54e76d70164f1da07e92729229e~p8zo8oThG2885328853epsmtip1T;
 Tue, 30 Sep 2025 03:56:00 +0000 (GMT)
From: Himanshu Dewangan <h.dewangan@samsung.com>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
 ih0206.lee@samsung.com, jehyung.lee@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Himanshu Dewangan <h.dewangan@samsung.com>
Subject: [PATCH 11/29] =?UTF-8?q?media:=20mfc:=20Add=20rate=E2=80=91calcul?=
 =?UTF-8?q?ation=20framework=20and=20memory=20utilities?=
Date: Tue, 30 Sep 2025 09:33:30 +0530
Message-Id: <20250930040348.3702923-12-h.dewangan@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930040348.3702923-1-h.dewangan@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930035606epcas5p3c38c2ba8148bd90a56415f544c5072f1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250930035606epcas5p3c38c2ba8148bd90a56415f544c5072f1
References: <20250930040348.3702923-1-h.dewangan@samsung.com>
 <CGME20250930035606epcas5p3c38c2ba8148bd90a56415f544c5072f1@epcas5p3.samsung.com>
X-Mailman-Approved-At: Tue, 30 Sep 2025 05:28:53 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nagaraju Siddineni <nagaraju.s@samsung.com>

- Implement runtime rate‑calculation (timestamp handling, framerate/BPS
  estimation, QoS adjustments, performance checks) with new helper APIs.
- Add utility layer for format validation, resolution/stride/size
  computation, DPB size, address mapping, and view‑buffer bookkeeping.
- Export functions used by decoder/encoder paths for dynamic QoS and
  memory handling.

Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
---
 .../platform/samsung/exynos-mfc/Makefile      |   2 +-
 .../samsung/exynos-mfc/base/mfc_mem.c         | 187 ++++++
 .../samsung/exynos-mfc/base/mfc_mem.h         |  44 ++
 .../exynos-mfc/base/mfc_rate_calculate.c      | 612 ++++++++++++++++++
 .../exynos-mfc/base/mfc_rate_calculate.h      | 100 +++
 .../samsung/exynos-mfc/base/mfc_utils.c       | 284 ++++++++
 .../samsung/exynos-mfc/base/mfc_utils.h       | 214 +++++-
 7 files changed, 1441 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_rate_calculate.c
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_rate_calculate.h
 create mode 100644 drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.c

diff --git a/drivers/media/platform/samsung/exynos-mfc/Makefile b/drivers/media/platform/samsung/exynos-mfc/Makefile
index 5353289fa810..bd5f80953bab 100644
--- a/drivers/media/platform/samsung/exynos-mfc/Makefile
+++ b/drivers/media/platform/samsung/exynos-mfc/Makefile
@@ -19,7 +19,7 @@ exynos_mfc-y += mfc_core_hw_reg_api.o mfc_core_reg_api.o
 #Plugin control layer
 #Plugin HW access layer
 #Common base layer
-exynos_mfc-y += base/mfc_queue.o
+exynos_mfc-y += base/mfc_rate_calculate.o base/mfc_queue.o base/mfc_utils.o
 exynos_mfc-y += base/mfc_buf.o base/mfc_mem.o
 #Tracing
 # exynos_mfc-y += trace/mfc_trace_points.o
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_mem.c b/drivers/media/platform/samsung/exynos-mfc/base/mfc_mem.c
index 17cc1d793cbc..c99c1c081b0e 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_mem.c
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_mem.c
@@ -18,6 +18,70 @@
 
 #include "mfc_mem.h"
 
+struct vb2_mem_ops *mfc_mem_ops(void)
+{
+	return (struct vb2_mem_ops *)&vb2_dma_sg_memops;
+}
+
+int mfc_mem_get_user_shared_handle(struct mfc_ctx *ctx,
+				   struct mfc_user_shared_handle *handle, char *name)
+{
+	struct iosys_map map = IOSYS_MAP_INIT_VADDR(NULL);
+	int ret = 0;
+
+	handle->dma_buf = dma_buf_get(handle->fd);
+	if (IS_ERR(handle->dma_buf)) {
+		mfc_ctx_err("[MEMINFO][SH][%s] Failed to import fd\n", name);
+		ret = PTR_ERR(handle->dma_buf);
+		goto import_dma_fail;
+	}
+
+	if (handle->dma_buf->size < handle->data_size) {
+		mfc_ctx_err("[MEMINFO][SH][%s] User-provided dma_buf size(%ld) is smaller than required size(%ld)\n",
+			    name, handle->dma_buf->size, handle->data_size);
+		ret = -EINVAL;
+		goto dma_buf_size_fail;
+	}
+	ret = dma_buf_vmap_unlocked(handle->dma_buf, &map);
+	if (ret) {
+		mfc_ctx_err("[MEMINFO][SH][%s] Failed to get kernel virtual address\n", name);
+		ret = -EINVAL;
+		goto map_kernel_fail;
+	}
+
+	handle->vaddr = map.vaddr;
+	mfc_ctx_debug(2, "[MEMINFO][SH][%s] shared handle fd: %d, vaddr: 0x%p, buf size: %zu, data size: %zu\n",
+		      name, handle->fd, handle->vaddr,
+		      handle->dma_buf->size, handle->data_size);
+
+	return 0;
+
+map_kernel_fail:
+	handle->vaddr = NULL;
+dma_buf_size_fail:
+	dma_buf_put(handle->dma_buf);
+import_dma_fail:
+	handle->dma_buf = NULL;
+	handle->fd = -1;
+	return ret;
+}
+
+void mfc_mem_cleanup_user_shared_handle(struct mfc_ctx *ctx,
+					struct mfc_user_shared_handle *handle)
+{
+	struct iosys_map map = IOSYS_MAP_INIT_VADDR(handle->vaddr);
+
+	if (handle->vaddr)
+		dma_buf_vunmap_unlocked(handle->dma_buf, &map);
+	if (handle->dma_buf)
+		dma_buf_put(handle->dma_buf);
+
+	handle->data_size = 0;
+	handle->dma_buf = NULL;
+	handle->vaddr = NULL;
+	handle->fd = -1;
+}
+
 static int mfc_mem_fw_alloc(struct mfc_dev *dev, struct mfc_special_buf *special_buf)
 {
 #if (IS_ENABLED(CONFIG_SAMSUNG_IOMMU))
@@ -334,6 +398,26 @@ void mfc_mem_special_buf_free(struct mfc_dev *dev, struct mfc_special_buf *speci
 	}
 }
 
+void mfc_bufcon_put_daddr(struct mfc_ctx *ctx, struct mfc_buf *mfc_buf, int plane)
+{
+	int i;
+
+	for (i = 0; i < mfc_buf->num_valid_bufs; i++) {
+		if (mfc_buf->addr[i][plane]) {
+			mfc_ctx_debug(4, "[BUFCON] put batch buf addr[%d][%d]: 0x%08llx\n",
+				      i, plane, mfc_buf->addr[i][plane]);
+		}
+		if (mfc_buf->attachments[i][plane])
+			dma_buf_detach(mfc_buf->dmabufs[i][plane], mfc_buf->attachments[i][plane]);
+		if (mfc_buf->dmabufs[i][plane])
+			dma_buf_put(mfc_buf->dmabufs[i][plane]);
+
+		mfc_buf->addr[i][plane] = 0;
+		mfc_buf->attachments[i][plane] = NULL;
+		mfc_buf->dmabufs[i][plane] = NULL;
+	}
+}
+
 void mfc_put_iovmm(struct mfc_ctx *ctx, struct dpb_table *dpb, int num_planes, int index)
 {
 	int i;
@@ -524,6 +608,81 @@ void mfc_get_iovmm(struct mfc_ctx *ctx, struct vb2_buffer *vb, struct dpb_table
 	mfc_put_iovmm(ctx, dpb, mem_get_count, sub_view_index);
 }
 
+void mfc_init_dpb_table(struct mfc_ctx *ctx)
+{
+	struct mfc_dec *dec = ctx->dec_priv;
+	int index, plane;
+
+	mutex_lock(&dec->dpb_mutex);
+	for (index = 0; index < MFC_MAX_DPBS; index++) {
+		for (plane = 0; plane < MFC_MAX_PLANES; plane++) {
+			dec->dpb[index].fd[plane] = -1;
+			dec->dpb[index].addr[plane] = 0;
+			dec->dpb[index].attach[plane] = NULL;
+			dec->dpb[index].dmabufs[plane] = NULL;
+		}
+		dec->dpb[index].new_fd = -1;
+		dec->dpb[index].mapcnt = 0;
+		dec->dpb[index].queued = 0;
+	}
+	mutex_unlock(&dec->dpb_mutex);
+}
+
+void mfc_cleanup_iovmm(struct mfc_ctx *ctx)
+{
+	struct mfc_dec *dec = ctx->dec_priv;
+	int i;
+
+	mutex_lock(&dec->dpb_mutex);
+
+	for (i = 0; i < MFC_MAX_DPBS; i++) {
+		dec->dpb[i].paddr = 0;
+		dec->dpb[i].ref = 0;
+		if (dec->dpb[i].mapcnt == 0) {
+			continue;
+		} else if (dec->dpb[i].mapcnt == 1) {
+			mfc_put_iovmm(ctx, dec->dpb, ctx->dst_fmt->mem_planes, i);
+		} else {
+			mfc_ctx_err("[IOVMM] DPB[%d] %#llx invalid mapcnt %d\n",
+				    i, dec->dpb[i].addr[0], dec->dpb[i].mapcnt);
+			MFC_TRACE_CTX("DPB[%d] %#llx invalid mapcnt %d\n",
+				      i, dec->dpb[i].addr[0], dec->dpb[i].mapcnt);
+		}
+	}
+
+	mutex_unlock(&dec->dpb_mutex);
+}
+
+void mfc_cleanup_iovmm_except_used(struct mfc_ctx *ctx)
+{
+	struct mfc_dec *dec = ctx->dec_priv;
+	int i;
+
+	mutex_lock(&dec->dpb_mutex);
+
+	for (i = 0; i < MFC_MAX_DPBS; i++) {
+		if (dec->dynamic_used & (1UL << i)) {
+			continue;
+		} else {
+			dec->dpb[i].paddr = 0;
+			dec->dpb[i].ref = 0;
+			if (dec->dpb[i].mapcnt == 0) {
+				continue;
+			} else if (dec->dpb[i].mapcnt == 1) {
+				dec->dpb_table_used &= ~(1UL << i);
+				mfc_put_iovmm(ctx, dec->dpb, ctx->dst_fmt->mem_planes, i);
+			} else {
+				mfc_ctx_err("[IOVMM] DPB[%d] %#llx invalid mapcnt %d\n",
+					    i, dec->dpb[i].addr[0], dec->dpb[i].mapcnt);
+				MFC_TRACE_CTX("DPB[%d] %#llx invalid mapcnt %d\n",
+					      i, dec->dpb[i].addr[0], dec->dpb[i].mapcnt);
+			}
+		}
+	}
+
+	mutex_unlock(&dec->dpb_mutex);
+}
+
 void mfc_iova_pool_free(struct mfc_dev *dev, struct mfc_special_buf *buf)
 {
 	/* Project that do not support iova reservation */
@@ -712,6 +871,34 @@ int mfc_iommu_map_firmware(struct mfc_core *core, struct mfc_special_buf *fw_buf
 	return 0;
 }
 
+void mfc_check_iova(struct mfc_dev *dev)
+{
+	struct mfc_platdata *pdata = dev->pdata;
+	struct mfc_ctx *ctx;
+	unsigned long total_iova = 0;
+
+	if (!pdata->iova_threshold)
+		return;
+
+	/*
+	 * The number of extra dpb is 8
+	 * OMX: extra buffer 5, platform buffer 3
+	 * Codec2: platform buffer 8
+	 */
+	list_for_each_entry(ctx, &dev->ctx_list, list)
+		total_iova += (ctx->raw_buf.total_plane_size *
+				(ctx->dpb_count + MFC_EXTRA_DPB + 3)) / SZ_1K;
+
+	if (total_iova > (pdata->iova_threshold * SZ_1K))
+		dev->skip_lazy_unmap = 1;
+	else
+		dev->skip_lazy_unmap = 0;
+
+	mfc_dev_debug(2, "[LAZY_UNMAP] Now the IOVA for DPB is %lu/%uMB, LAZY_UNMAP %s\n",
+		      total_iova / SZ_1K, pdata->iova_threshold,
+		      dev->skip_lazy_unmap ? "disable" : "enable");
+}
+
 /* DMA memory related helper functions */
 static void mfc_memdev_release(struct device *dev)
 {
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_mem.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_mem.h
index 3deeb0d611a0..3bd40dd0a0ed 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_mem.h
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_mem.h
@@ -66,6 +66,35 @@ static inline size_t mfc_mem_get_sg_length(struct mfc_dev *dev, struct sg_table
 	return size;
 }
 
+static inline void mfc_mem_buf_prepare(struct vb2_buffer *vb, int stream)
+{
+	int i;
+	enum dma_data_direction dir;
+	struct dma_buf *dbuf;
+
+	dir = V4L2_TYPE_IS_OUTPUT(vb->type) ?
+					DMA_TO_DEVICE : DMA_FROM_DEVICE;
+
+	for (i = 0; i < vb->num_planes; i++) {
+		dbuf = vb->planes[i].dbuf;
+		dma_buf_end_cpu_access(dbuf, dir);
+	}
+}
+
+static inline void mfc_mem_buf_finish(struct vb2_buffer *vb, int stream)
+{
+	int i;
+	struct dma_buf *dbuf;
+
+	if (V4L2_TYPE_IS_OUTPUT(vb->type))
+		return;
+
+	for (i = 0; i < vb->num_planes; i++) {
+		dbuf = vb->planes[i].dbuf;
+		dma_buf_begin_cpu_access(dbuf, DMA_FROM_DEVICE);
+	}
+}
+
 static inline void mfc_print_dpb_table(struct mfc_ctx *ctx)
 {
 	struct mfc_dec *dec = ctx->dec_priv;
@@ -95,16 +124,31 @@ static inline void mfc_print_dpb_table(struct mfc_ctx *ctx)
 				dec->dpb[i].queued ? "Q" : "DQ");
 	}
 }
+
+struct vb2_mem_ops *mfc_mem_ops(void);
+
+int mfc_mem_get_user_shared_handle(struct mfc_ctx *ctx,
+				   struct mfc_user_shared_handle *handle, char *name);
+void mfc_mem_cleanup_user_shared_handle(struct mfc_ctx *ctx,
+					struct mfc_user_shared_handle *handle);
+
 int mfc_mem_special_buf_alloc(struct mfc_dev *dev, struct mfc_special_buf *special_buf);
 void mfc_mem_special_buf_free(struct mfc_dev *dev, struct mfc_special_buf *special_buf);
 
+void mfc_bufcon_put_daddr(struct mfc_ctx *ctx, struct mfc_buf *mfc_buf, int plane);
+
 void mfc_put_iovmm(struct mfc_ctx *ctx, struct dpb_table *dpb, int num_planes, int index);
 void mfc_get_iovmm(struct mfc_ctx *ctx, struct vb2_buffer *vb, struct dpb_table *dpb);
+void mfc_init_dpb_table(struct mfc_ctx *ctx);
+void mfc_cleanup_iovmm(struct mfc_ctx *ctx);
+void mfc_cleanup_iovmm_except_used(struct mfc_ctx *ctx);
+
 void mfc_iova_pool_free(struct mfc_dev *dev, struct mfc_special_buf *buf);
 int mfc_iova_pool_alloc(struct mfc_dev *dev, struct mfc_special_buf *buf);
 int mfc_iova_pool_init(struct mfc_dev *dev);
 
 int mfc_iommu_map_firmware(struct mfc_core *core, struct mfc_special_buf *fw_buf);
+void mfc_check_iova(struct mfc_dev *dev);
 
 int mfc_configure_dma_memory(struct mfc_dev *mfc_dev);
 void mfc_unconfigure_dma_memory(struct mfc_dev *mfc_dev);
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_rate_calculate.c b/drivers/media/platform/samsung/exynos-mfc/base/mfc_rate_calculate.c
new file mode 100644
index 000000000000..94a555c900d7
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_rate_calculate.c
@@ -0,0 +1,612 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * mfc_rate_calculate.c	file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#include <linux/err.h>
+#include <linux/sort.h>
+
+#include "mfc_utils.h"
+
+#define COL_FRAME_RATE		0
+#define COL_FRAME_INTERVAL	1
+
+#define MFC_MAX_INTERVAL	(2 * USEC_PER_SEC)
+
+/*
+ * A framerate table determines	framerate by the interval(us) of each frame.
+ * Framerate is	not accurate, just rough value to separate overload section.
+ * Base	line of	each section are selected from middle value.
+ * 25fps(40000us), 40fps(25000us), 80fps(12500us)
+ * 144fps(6940us), 205fps(4860us), 320fps(3125us)
+ *
+ * interval(us)	| 0	    3125	  4860		6940	      12500	    25000 40000
+ * framerate	|    480fps   |	   240fps   |	 180fps	  |    120fps	|    60fps    |	   30fps   |
+ * 24fps
+ */
+static unsigned long framerate_table[][2] = {
+	{  24000, 40000 },
+	{  30000, 25000 },
+	{  60000, 12500 },
+	{ 120000,  6940 },
+	{ 180000,  4860 },
+	{ 240000,  3125 },
+	{ 480000,     0 },
+};
+
+/*
+ * display_framerate_table determines framerate by the queued interval.
+ * It supports 30fps, 60fps, 120fps as display framerate.
+ * Base line of each section is selected from middle value.
+ * 25fps(40000us), 40fps(25000us), 80fps(12500us)
+ *
+ * interval(us)     |          12500         25000        40000
+ * disp framerate   |   120fps   |    60fps    |    30fps   |	24fps
+ */
+static unsigned long display_framerate_table[][2] = {
+	{  24000, 40000 },
+	{  30000, 25000 },
+	{  60000, 12500 },
+	{ 120000,     0 },
+};
+
+inline unsigned long mfc_rate_timespec64_diff(struct timespec64 *to,
+					struct timespec64 *from)
+{
+	unsigned long interval_nsec = (to->tv_sec * NSEC_PER_SEC + to->tv_nsec)
+		- (from->tv_sec * NSEC_PER_SEC + from->tv_nsec);
+
+	if (interval_nsec <= 0)
+		interval_nsec = MFC_MAX_INTERVAL * 1000;
+
+	return interval_nsec / 1000;
+}
+
+static int __mfc_rate_ts_sort(const void *p0, const void *p1)
+{
+	const int *t0 = p0, *t1 = p1;
+
+	/* ascending sort */
+	if (*t0 < *t1)
+		return -1;
+	else if (*t0 > *t1)
+		return 1;
+
+	return 0;
+}
+
+static int __mfc_rate_get_ts_min_interval(struct mfc_ctx *ctx, struct mfc_ts_control *ts)
+{
+	int tmp[MAX_TIME_INDEX];
+
+	if (!ts->ts_is_full)
+		return 0;
+
+	memcpy(&tmp[0], &ts->ts_interval_array[0], MAX_TIME_INDEX * sizeof(int));
+	sort(tmp, MAX_TIME_INDEX, sizeof(int), __mfc_rate_ts_sort, NULL);
+
+	return tmp[0];
+}
+
+static int __mfc_rate_get_ts_interval(struct mfc_ctx *ctx, struct mfc_ts_control *ts, int type)
+{
+	int tmp[MAX_TIME_INDEX];
+	int n, i, val = 0, sum = 0;
+
+	n = ts->ts_is_full ? MAX_TIME_INDEX : ts->ts_count;
+
+	memcpy(&tmp[0], &ts->ts_interval_array[0], n * sizeof(int));
+	sort(tmp, n, sizeof(int), __mfc_rate_ts_sort, NULL);
+
+	if (type == MFC_TS_SRC) {
+		/* apply median filter for selecting ts interval */
+		val = (n <= 2) ? tmp[0] : tmp[n / 2];
+	} else if ((type == MFC_TS_DST_Q) || (type == MFC_TS_SRC_Q) || (type == MFC_TS_DST_DQ)) {
+		/* apply average for selecting ts interval except min,max */
+		if (n < 3)
+			return 0;
+		for (i = 1; i < (n - 1); i++)
+			sum += tmp[i];
+		val = sum / (n - 2);
+	} else {
+		mfc_ctx_err("[TS] Wrong timestamp type %d\n", type);
+	}
+
+	if (ctx->dev->debugfs.debug_ts == 1) {
+		mfc_ctx_info("==============[%s%s%s][TS] interval (sort)==============\n",
+			     (type & 0x1) ? "SRC" : "DST", (type & 0x2) ? "_Q" : "",
+			     (type & 0x4) ? "_DQ" : "");
+		for (i = 0; i < n; i++)
+			mfc_ctx_info("[%s%s%s][TS] interval [%d] = %d\n",
+				     (type & 0x1) ? "SRC" : "DST",
+				     (type & 0x2) ? "_Q" : "",
+				     (type & 0x4) ? "_DQ" : "", i, tmp[i]);
+		mfc_ctx_info("[%s%s%s][TS] get interval %d\n",
+			     (type & 0x1) ? "SRC" : "DST",
+			     (type & 0x2) ? "_Q" : "",
+			     (type & 0x4) ? "_DQ" : "", val);
+	}
+
+	return val;
+}
+
+static unsigned long __mfc_rate_get_framerate_by_interval(int interval, int type)
+{
+	unsigned long (*table)[2];
+	unsigned long i;
+	int size;
+
+	/* if the interval is too big (2sec), framerate set to 0 */
+	if (interval > MFC_MAX_INTERVAL || interval <= 0)
+		return 0;
+
+	if (type == MFC_TS_SRC || type == MFC_TS_SRC_Q || type == MFC_TS_DST_DQ) {
+		table = framerate_table;
+		size = ARRAY_SIZE(framerate_table);
+	} else if (type == MFC_TS_DST_Q) {
+		table = display_framerate_table;
+		size = ARRAY_SIZE(display_framerate_table);
+	} else {
+		return 0;
+	}
+
+	for (i = 0; i < size; i++) {
+		if (interval > table[i][COL_FRAME_INTERVAL])
+			return table[i][COL_FRAME_RATE];
+	}
+
+	return 0;
+}
+
+int mfc_rate_get_bps_section_by_bps(struct mfc_dev *dev, int kbps, int max_kbps)
+{
+	struct mfc_platdata *pdata = dev->pdata;
+	int i, max_freq_idx;
+	int freq_ratio, bps_interval, prev_interval = 0;
+
+	max_freq_idx = pdata->num_mfc_freq - 1;
+	if (kbps > max_kbps) {
+		mfc_dev_debug(4, "[BPS] overspec bps %d > %d\n", kbps, max_kbps);
+		return max_freq_idx;
+	}
+
+	for (i = 0; i < pdata->num_mfc_freq; i++) {
+		freq_ratio = pdata->mfc_freqs[i] * 100 / pdata->mfc_freqs[max_freq_idx];
+		bps_interval = max_kbps * freq_ratio / 100;
+		mfc_dev_debug(4, "[BPS] MFC freq lv%d, %uKHz covered: %d ~ %dkbps (now: %dkbps)\n",
+			      i, pdata->mfc_freqs[i], prev_interval, bps_interval, kbps);
+		if (kbps <= bps_interval) {
+			mfc_dev_debug(3, "[BPS] MFC freq lv%d, %uKHz is needed: %d ~ %dkbps\n",
+				      i, pdata->mfc_freqs[i],
+				      prev_interval, bps_interval);
+			return i;
+		}
+		prev_interval = bps_interval;
+	}
+
+	/* Not changed the MFC freq according to BPS */
+	return 0;
+}
+
+/* Return the minimum interval between previous and next entry */
+static int __mfc_rate_get_interval(struct list_head *head, struct list_head *entry)
+{
+	unsigned long prev_interval = MFC_MAX_INTERVAL, next_interval = MFC_MAX_INTERVAL;
+	struct mfc_timestamp *prev_ts, *next_ts, *curr_ts;
+	int ret = 0;
+
+	curr_ts = list_entry(entry, struct mfc_timestamp, list);
+
+	if (entry->prev != head) {
+		prev_ts = list_entry(entry->prev, struct mfc_timestamp, list);
+		prev_interval = mfc_rate_timespec64_diff(&curr_ts->timestamp,
+							 &prev_ts->timestamp);
+		if (prev_interval > MFC_MAX_INTERVAL)
+			prev_interval = MFC_MAX_INTERVAL;
+	}
+
+	if (entry->next != head) {
+		next_ts = list_entry(entry->next, struct mfc_timestamp, list);
+		next_interval = mfc_rate_timespec64_diff(&next_ts->timestamp,
+							 &curr_ts->timestamp);
+		if (next_interval > MFC_MAX_INTERVAL)
+			next_interval = MFC_MAX_INTERVAL;
+	}
+
+	ret = (prev_interval < next_interval) ? prev_interval : next_interval;
+	return ret;
+}
+
+static int __mfc_rate_add_timestamp(struct mfc_ctx *ctx, struct mfc_ts_control *ts,
+				    struct timespec64 *time, struct list_head *head)
+{
+	int replace_entry = 0;
+	struct mfc_timestamp *curr_ts = &ts->ts_array[ts->ts_count];
+	struct mfc_timestamp *adj_ts = NULL;
+
+	if (ts->ts_is_full) {
+		/* Replace the entry if list of array[ts_count] is same as entry */
+		if (&curr_ts->list == head)
+			replace_entry = 1;
+		else
+			list_del(&curr_ts->list);
+	}
+
+	memcpy(&curr_ts->timestamp, time, sizeof(*time));
+	if (!replace_entry)
+		list_add(&curr_ts->list, head);
+	curr_ts->interval = __mfc_rate_get_interval(&ts->ts_list, &curr_ts->list);
+	curr_ts->index = ts->ts_count;
+
+	ts->ts_interval_array[ts->ts_count] = curr_ts->interval;
+	ts->ts_count++;
+
+	if (ts->ts_count == MAX_TIME_INDEX) {
+		ts->ts_is_full = 1;
+		ts->ts_count %= MAX_TIME_INDEX;
+	}
+
+	/*
+	 * When timestamp is updated, the interval of adjacent timestamp can be changed.
+	 * So, update this value of prev and next in list.
+	 */
+	if (curr_ts->list.next != &ts->ts_list) {
+		adj_ts = list_entry(curr_ts->list.next, struct mfc_timestamp, list);
+		adj_ts->interval = __mfc_rate_get_interval(&ts->ts_list, &adj_ts->list);
+		ts->ts_interval_array[adj_ts->index] = adj_ts->interval;
+	}
+	if (curr_ts->list.prev != &ts->ts_list) {
+		adj_ts = list_entry(curr_ts->list.prev, struct mfc_timestamp, list);
+		adj_ts->interval = __mfc_rate_get_interval(&ts->ts_list, &adj_ts->list);
+		ts->ts_interval_array[adj_ts->index] = adj_ts->interval;
+	}
+
+	return 0;
+}
+
+void mfc_rate_reset_ts_list(struct mfc_ts_control *ts)
+{
+	struct mfc_timestamp *temp_ts = NULL;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ts->ts_lock, flags);
+
+	/* empty the timestamp queue */
+	while (!list_empty(&ts->ts_list)) {
+		temp_ts = list_entry((&ts->ts_list)->next, struct mfc_timestamp, list);
+		list_del(&temp_ts->list);
+	}
+
+	ts->ts_count = 0;
+	ts->ts_is_full = 0;
+
+	spin_unlock_irqrestore(&ts->ts_lock, flags);
+}
+
+static unsigned long __mfc_rate_get_fps_by_timestamp(struct mfc_ctx *ctx,
+						     struct mfc_ts_control *ts,
+						     struct timespec64 *time, int type)
+{
+	struct mfc_timestamp *temp_ts;
+	int found;
+	int index = 0;
+	int ts_is_full = ts->ts_is_full;
+	int interval = MFC_MAX_INTERVAL;
+	int min_interval = 0;
+	int time_diff;
+	unsigned long framerate;
+	unsigned long flags;
+	u64 current_time;
+
+	spin_lock_irqsave(&ts->ts_lock, flags);
+	if (list_empty(&ts->ts_list)) {
+		__mfc_rate_add_timestamp(ctx, ts, time, &ts->ts_list);
+		spin_unlock_irqrestore(&ts->ts_lock, flags);
+		return __mfc_rate_get_framerate_by_interval(0, type);
+	}
+	found = 0;
+	list_for_each_entry_reverse(temp_ts, &ts->ts_list, list) {
+		time_diff = __mfc_timespec64_compare(time, &temp_ts->timestamp);
+		if (time_diff == 0) {
+			/* Do not add if same timestamp already exists */
+			found = 1;
+			break;
+		} else if (time_diff > 0) {
+			/* Add this after temp_ts */
+			__mfc_rate_add_timestamp(ctx, ts, time, &temp_ts->list);
+			found = 1;
+			break;
+		}
+	}
+
+	if (!found)	/* Add this at first entry */
+		__mfc_rate_add_timestamp(ctx, ts, time, &ts->ts_list);
+	spin_unlock_irqrestore(&ts->ts_lock, flags);
+
+	interval = __mfc_rate_get_ts_interval(ctx, ts, type);
+	framerate = __mfc_rate_get_framerate_by_interval(interval, type);
+
+	if (ctx->dev->debugfs.debug_ts == 1) {
+		spin_lock_irqsave(&ts->ts_lock, flags);
+		/* Debug info */
+		mfc_ctx_info("=================[%s%s%s][TS]===================\n",
+			     (type & 0x1) ? "SRC" : "DST", (type & 0x2) ? "_Q" : "",
+			     (type & 0x4) ? "_DQ" : "");
+		mfc_ctx_info("[%s%s%s][TS] New timestamp = %lld.%06ld, count = %d\n",
+			     (type & 0x1) ? "SRC" : "DST",
+			     (type & 0x2) ? "_Q" : "",
+			     (type & 0x4) ? "_DQ" : "",
+			     time->tv_sec, time->tv_nsec, ts->ts_count);
+
+		index = 0;
+		list_for_each_entry(temp_ts, &ts->ts_list, list) {
+			mfc_ctx_info("[%s%s][TS] [%d] timestamp [i:%d]: %lld.%06ld\n",
+				     (type & 0x1) ? "SRC" : "DST",
+				     (type & 0x2) ? "_Q" : "",
+				     index, temp_ts->index,
+				     temp_ts->timestamp.tv_sec,
+				     temp_ts->timestamp.tv_nsec);
+			index++;
+		}
+		mfc_ctx_info("[%s%s%s][TS] Min interval = %d, It is %ld fps\n",
+			     (type & 0x1) ? "SRC" : "DST",
+			     (type & 0x2) ? "_Q" : "",
+			     (type & 0x4) ? "_DQ" : "",
+			     interval, framerate);
+		spin_unlock_irqrestore(&ts->ts_lock, flags);
+	}
+
+	if (!ts->ts_is_full) {
+		if (ctx->dev->debugfs.debug_ts == 1)
+			mfc_ctx_info("[TS] ts doesn't full, keep %ld fps\n", ctx->framerate);
+		return ctx->framerate;
+	}
+
+	if (!ts_is_full && type == MFC_TS_SRC) {
+		min_interval = __mfc_rate_get_ts_min_interval(ctx, ts);
+		if (min_interval)
+			ctx->max_framerate =
+				__mfc_rate_get_framerate_by_interval(min_interval, type);
+		else
+			ctx->max_framerate = 0;
+
+		current_time = ktime_get_ns() / NSEC_PER_SEC;
+		if (current_time == time->tv_sec)
+			ctx->ktime_used = TRUE;
+	}
+
+	return framerate;
+}
+
+static int __mfc_rate_get_bps_section(struct mfc_ctx *ctx, u32 bytesused)
+{
+	struct mfc_dev *dev = ctx->dev;
+	struct list_head *head = &ctx->bitrate_list;
+	struct mfc_bitrate *temp_bitrate;
+	struct mfc_bitrate *new_bitrate = &ctx->bitrate_array[ctx->bitrate_index];
+	int max_kbps;
+	unsigned long sum_size = 0, avg_kbits, fps;
+	int count = 0;
+
+	if (ctx->bitrate_is_full) {
+		temp_bitrate = list_entry(head->next, struct mfc_bitrate, list);
+		list_del(&temp_bitrate->list);
+	}
+
+	new_bitrate->bytesused = bytesused;
+	list_add_tail(&new_bitrate->list, head);
+
+	list_for_each_entry(temp_bitrate, head, list) {
+		mfc_ctx_debug(4, "[BPS][%d] strm_size %d\n", count, temp_bitrate->bytesused);
+		sum_size += temp_bitrate->bytesused;
+		count++;
+	}
+
+	if (count == 0) {
+		mfc_ctx_err("[BPS] There is no list for bps\n");
+		return ctx->last_bps_section;
+	}
+
+	ctx->bitrate_index++;
+	if (ctx->bitrate_index == MAX_TIME_INDEX) {
+		ctx->bitrate_is_full = 1;
+		ctx->bitrate_index %= MAX_TIME_INDEX;
+	}
+
+	/*
+	 * When there is a value of ts_is_full,
+	 * we can trust fps(trusted fps calculated by timestamp diff).
+	 * When fps information becomes reliable,
+	 * we will start QoS handling by obtaining bps section.
+	 */
+	if (!ctx->src_ts.ts_is_full)
+		return 0;
+
+	if (IS_MULTI_MODE(ctx))
+		fps = ctx->last_framerate / 1000 / dev->num_core;
+	else
+		fps = ctx->last_framerate / 1000;
+	avg_kbits = ((sum_size * BITS_PER_BYTE) / count) / SZ_1K;
+	ctx->kbps = (int)(avg_kbits * fps);
+	max_kbps = dev->pdata->mfc_resource[ctx->codec_mode].max_kbps;
+	mfc_ctx_debug(3, "[BPS] %d kbps, average %lu Kbits per frame\n", ctx->kbps, avg_kbits);
+
+	return mfc_rate_get_bps_section_by_bps(dev, ctx->kbps, max_kbps);
+}
+
+void mfc_rate_update_bitrate(struct mfc_ctx *ctx, u32 bytesused)
+{
+	int bps_section;
+
+	/* bitrate is updated */
+	bps_section = __mfc_rate_get_bps_section(ctx, bytesused);
+	if (ctx->last_bps_section != bps_section) {
+		mfc_ctx_debug(2, "[BPS] bps section changed: %d -> %d\n",
+			      ctx->last_bps_section, bps_section);
+		ctx->last_bps_section = bps_section;
+		ctx->update_bitrate = true;
+	}
+}
+
+void mfc_rate_update_framerate(struct mfc_ctx *ctx)
+{
+	struct mfc_dev *dev = ctx->dev;
+	unsigned long framerate;
+
+	/* 2) when src timestamp isn't full, only check operating framerate by user */
+	if (!ctx->src_ts.ts_is_full) {
+		if (ctx->operating_framerate && ctx->operating_framerate > ctx->framerate) {
+			mfc_ctx_debug(2, "[QoS] operating fps changed: %ld\n",
+				      ctx->operating_framerate);
+			mfc_rate_set_framerate(ctx, ctx->operating_framerate);
+			ctx->update_framerate = true;
+			return;
+		}
+	} else {
+		/* 3) get src framerate */
+		framerate = ctx->last_framerate;
+
+		/* 4) check display framerate */
+		if (dev->pdata->display_framerate &&
+		    ctx->dst_q_ts.ts_is_full && ctx->dst_q_framerate > framerate) {
+			framerate = ctx->dst_q_framerate;
+			if (framerate != ctx->framerate)
+				mfc_ctx_debug(2, "[QoS] display fps %ld\n", framerate);
+		}
+
+		/* 5) check operating framerate by user */
+		if (ctx->operating_framerate && ctx->operating_framerate > framerate) {
+			framerate = ctx->operating_framerate;
+			if (framerate != ctx->framerate)
+				mfc_ctx_debug(2, "[QoS] operating fps %ld\n", framerate);
+		}
+
+		/* 6) check non-real-time and undefined mode */
+		if (ctx->rt == MFC_NON_RT || ctx->rt == MFC_RT_UNDEFINED) {
+			if (framerate < ctx->src_q_framerate) {
+				framerate = ctx->src_q_framerate;
+				if (framerate != ctx->framerate)
+					mfc_ctx_debug(2,
+						      "[QoS][PRIO] (default) NRT src_q fps %ld\n",
+						      framerate);
+			}
+		}
+
+		if (ctx->operating_framerate == ctx->framerate && !ctx->check_src_ts_full) {
+			mfc_ctx_debug(2, "[QoS] src ts is full, update framerate for load balancing\n");
+			ctx->check_src_ts_full = true;
+			ctx->update_framerate = true;
+		}
+
+		if (framerate && framerate != ctx->framerate) {
+			mfc_ctx_debug(2, "[QoS] fps changed: %ld -> %ld, qos ratio: %d\n",
+				      ctx->framerate, framerate, ctx->qos_ratio);
+			mfc_rate_set_framerate(ctx, framerate);
+			ctx->update_framerate = true;
+		}
+	}
+}
+
+void mfc_rate_update_last_framerate(struct mfc_ctx *ctx, u64 timestamp)
+{
+	struct timespec64 time;
+
+	time.tv_sec = timestamp / NSEC_PER_SEC;
+	time.tv_nsec = (timestamp - (time.tv_sec * NSEC_PER_SEC));
+
+	ctx->last_framerate = __mfc_rate_get_fps_by_timestamp(ctx, &ctx->src_ts, &time, MFC_TS_SRC);
+	if (ctx->last_framerate > MFC_MAX_FPS)
+		ctx->last_framerate = MFC_MAX_FPS;
+
+	if (ctx->src_ts.ts_is_full)
+		ctx->last_framerate = (ctx->qos_ratio * ctx->last_framerate) / 100;
+}
+
+void mfc_rate_update_bufq_framerate(struct mfc_ctx *ctx, int type)
+{
+	struct timespec64 time;
+	u64 timestamp;
+
+	timestamp = ktime_get_ns();
+	time.tv_sec = timestamp / NSEC_PER_SEC;
+	time.tv_nsec = timestamp - (time.tv_sec * NSEC_PER_SEC);
+
+	if (type == MFC_TS_DST_Q) {
+		ctx->dst_q_framerate = __mfc_rate_get_fps_by_timestamp
+			(ctx, &ctx->dst_q_ts, &time, MFC_TS_DST_Q);
+		mfc_ctx_debug(5, "[QoS] dst_q_framerate = %lu\n", ctx->dst_q_framerate);
+	}
+	if (type == MFC_TS_DST_DQ) {
+		ctx->dst_dq_framerate = __mfc_rate_get_fps_by_timestamp
+			(ctx, &ctx->dst_dq_ts, &time, MFC_TS_DST_DQ);
+		mfc_ctx_debug(5, "[QoS] dst_dq_framerate = %lu\n", ctx->dst_dq_framerate);
+	}
+	if (type == MFC_TS_SRC_Q) {
+		ctx->src_q_framerate = __mfc_rate_get_fps_by_timestamp
+			(ctx, &ctx->src_q_ts, &time, MFC_TS_SRC_Q);
+		mfc_ctx_debug(5, "[QoS] src_q_framerate = %lu\n", ctx->src_q_framerate);
+	}
+}
+
+void mfc_rate_reset_bufq_framerate(struct mfc_ctx *ctx)
+{
+	ctx->dst_q_framerate = 0;
+	ctx->dst_dq_framerate = 0;
+	ctx->src_q_framerate = 0;
+
+	mfc_rate_reset_ts_list(&ctx->dst_q_ts);
+	mfc_rate_reset_ts_list(&ctx->src_q_ts);
+}
+
+int mfc_rate_check_perf_ctx(struct mfc_ctx *ctx, int max_runtime)
+{
+	struct mfc_ts_control *ts;
+	struct timespec64 start_time, curr_time;
+	u64 timestamp, interval;
+	int op_fps, fps;
+	unsigned long flags;
+
+	if (ctx->dev->debugfs.sched_perf_disable)
+		return 0;
+
+	ts = &ctx->dst_dq_ts;
+	if (!ts->ts_is_full)
+		return 0;
+
+	op_fps = ctx->operating_framerate;
+	if (op_fps == 0) {
+		op_fps = ctx->src_q_framerate;
+		mfc_ctx_debug(2, "[PRIO][rt %d] use fps: %d\n", ctx->rt, op_fps);
+	}
+
+	/* Calculate interval from start to current time */
+	timestamp = ktime_get_ns();
+	curr_time.tv_sec = timestamp / NSEC_PER_SEC;
+	curr_time.tv_nsec = timestamp - (curr_time.tv_sec * NSEC_PER_SEC);
+
+	spin_lock_irqsave(&ts->ts_lock, flags);
+	start_time = ts->ts_array[ts->ts_count].timestamp;
+	spin_unlock_irqrestore(&ts->ts_lock, flags);
+
+	interval = mfc_rate_timespec64_diff(&curr_time, &start_time);
+	interval += max_runtime;
+
+	fps = (((MAX_TIME_INDEX - 1) * 1000) / (interval / 1000)) * 1000;
+	mfc_ctx_debug(2, "[PRIO][rt %d] st %lld.%06ld, curr %lld.%06ld, interval %lld, fps %d\n",
+		      ctx->rt, start_time.tv_sec, start_time.tv_nsec,
+		      curr_time.tv_sec, curr_time.tv_nsec, interval, fps);
+
+	if (fps > op_fps) {
+		mfc_ctx_debug(2, "[PRIO] PERF enough fps: %d, op_fps: %d\n", fps, op_fps);
+		return 1;
+	}
+
+	mfc_ctx_debug(2, "[PRIO] PERF insufficient fps: %d, op_fps: %d\n", fps, op_fps);
+	return 0;
+}
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_rate_calculate.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_rate_calculate.h
new file mode 100644
index 000000000000..2452e6ee56dd
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_rate_calculate.h
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * mfc_rate_calculate.h
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#ifndef __MFC_RATE_CALCULATE_H
+#define __MFC_RATE_CALCULATE_H __FILE__
+
+#include "mfc_common.h"
+
+#define MFC_MIN_FPS			(30000)
+#define MFC_MAX_FPS			(480000)
+#define DEC_DEFAULT_FPS			(480000)
+#define ENC_DEFAULT_FPS			(480000)
+#define ENC_DEFAULT_CAM_CAPTURE_FPS	(60000)
+
+inline unsigned long mfc_rate_timespec64_diff(struct timespec64 *to,
+					struct timespec64 *from);
+void mfc_rate_reset_ts_list(struct mfc_ts_control *ts);
+int mfc_rate_get_bps_section_by_bps(struct mfc_dev *dev, int kbps, int max_kbps);
+void mfc_rate_update_bitrate(struct mfc_ctx *ctx, u32 bytesused);
+void mfc_rate_update_framerate(struct mfc_ctx *ctx);
+void mfc_rate_update_last_framerate(struct mfc_ctx *ctx, u64 timestamp);
+void mfc_rate_update_bufq_framerate(struct mfc_ctx *ctx, int type);
+void mfc_rate_reset_bufq_framerate(struct mfc_ctx *ctx);
+int mfc_rate_check_perf_ctx(struct mfc_ctx *ctx, int max_runtime);
+
+static inline int __mfc_timespec64_compare(const struct timespec64 *lhs,
+					   const struct timespec64 *rhs)
+{
+	if (lhs->tv_sec < rhs->tv_sec)
+		return -1;
+	if (lhs->tv_sec > rhs->tv_sec)
+		return 1;
+	return lhs->tv_nsec - rhs->tv_nsec;
+}
+
+static inline void mfc_rate_reset_framerate(struct mfc_ctx *ctx)
+{
+	if (ctx->type == MFCINST_DECODER)
+		ctx->framerate = DEC_DEFAULT_FPS;
+
+	mfc_ctx_debug(3, "[QoS] reset ctx->framrate: %lu\n", ctx->framerate);
+}
+
+static inline void mfc_rate_reset_last_framerate(struct mfc_ctx *ctx)
+{
+	ctx->last_framerate = 0;
+}
+
+static inline void mfc_rate_set_framerate(struct mfc_ctx *ctx, int rate)
+{
+	ctx->framerate = rate;
+
+	mfc_ctx_debug(3, "[QoS] set ctx->framerate: %lu\n", ctx->framerate);
+}
+
+static inline int mfc_rate_get_framerate(struct mfc_ctx *ctx)
+{
+	unsigned long framerate = ctx->last_framerate;
+
+	if (!framerate)
+		framerate = ctx->framerate;
+
+	if (ctx->operating_framerate > framerate)
+		return ctx->operating_framerate;
+	else
+		return framerate;
+}
+
+static inline unsigned long mfc_rate_get_rt_framerate(struct mfc_ctx *ctx, enum mfc_real_time rt)
+{
+	unsigned long framerate;
+
+	framerate = ctx->operating_framerate;
+
+	if (rt == MFC_RT_UNDEFINED || rt == MFC_NON_RT) {
+		framerate = ctx->framerate;
+	} else {
+		if (ctx->src_ts.ts_is_full)
+			framerate = mfc_rate_get_framerate(ctx);
+	}
+
+	if (framerate == 0)
+		framerate = MFC_MIN_FPS;
+	else if (framerate > MFC_MAX_FPS)
+		framerate = MFC_MAX_FPS;
+
+	mfc_ctx_debug(3, "[QoS] rt framerate: %lu\n", framerate);
+
+	return framerate;
+}
+
+#endif /* __MFC_RATE_CALCULATE_H */
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.c b/drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.c
new file mode 100644
index 000000000000..b0698b2bb0c0
--- /dev/null
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.c
@@ -0,0 +1,284 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *              http://www.samsung.com
+ *
+ * mfc_utils.c file
+ *
+ * Nagaraju Siddineni, <nagaraju.s@samsung.com>
+ * Himanshu Dewangan, <h.dewangan@samsung.com>
+ */
+
+#include "mfc_utils.h"
+#include "mfc_mem.h"
+#include "mfc_queue.h"
+
+static struct mfc_resolution mfc_res[] = {
+	{
+		.width = 0,
+		.height = 0,
+	},
+	{
+		.width = 1920,
+		.height = 1088,
+	},
+	{
+		.width = 4096,
+		.height = 2176,
+	},
+	{
+		.width = 8192,
+		.height = 4352,
+	},
+};
+
+int mfc_check_vb_with_fmt(struct mfc_fmt *fmt, struct vb2_buffer *vb)
+{
+	struct mfc_ctx *ctx = vb->vb2_queue->drv_priv;
+	int mem_planes;
+
+	if (!fmt)
+		return -EINVAL;
+
+	if (fmt->type & MFC_FMT_FRAME)
+		mem_planes = ctx->num_fd_frame;
+	else
+		mem_planes = fmt->mem_planes;
+
+	if (mem_planes != vb->num_planes) {
+		mfc_ctx_err("plane number is different (%d != %d)\n",
+			    mem_planes, vb->num_planes);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int mfc_check_resolution(struct mfc_ctx *ctx)
+{
+	int check_res = ctx->dev->pdata->support_check_res;
+	int max_width, max_height;
+
+	if (!check_res)
+		return 0;
+
+	max_width = mfc_res[check_res].width;
+	max_height = mfc_res[check_res].height;
+
+	if ((ctx->crop_width > max_width && ctx->crop_height > max_height) ||
+	    (ctx->crop_width > max_height && ctx->crop_height > max_width)) {
+		mfc_ctx_err("Resolution is too big (%dx%d > %dx%d or %dx%d)\n",
+			    ctx->crop_width, ctx->crop_height,
+			    max_width, max_height, max_height, max_width);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void __mfc_set_dec_stride(struct mfc_ctx *ctx,
+				 struct mfc_raw_info *raw,
+				 struct mfc_fmt *fmt)
+{
+	int stride_align, y_stride;
+
+	stride_align = ctx->dev->pdata->stride_align;
+	y_stride = ALIGN(ctx->img_width, stride_align);
+
+	switch (fmt->fourcc) {
+	case V4L2_PIX_FMT_YUV420M:
+	case V4L2_PIX_FMT_YVU420M:
+		raw->stride[0] = y_stride;
+		raw->stride[1] = ALIGN(y_stride >> 1, stride_align);
+		raw->stride[2] = ALIGN(y_stride >> 1, stride_align);
+		break;
+	case V4L2_PIX_FMT_NV12MT_16X16:
+	case V4L2_PIX_FMT_NV12MT:
+	case V4L2_PIX_FMT_NV12M:
+	case V4L2_PIX_FMT_NV21M:
+	case V4L2_PIX_FMT_NV16M:
+	case V4L2_PIX_FMT_NV61M:
+		raw->stride[0] = y_stride;
+		raw->stride[1] = y_stride;
+		raw->stride[2] = 0;
+		break;
+	default:
+		mfc_ctx_err("Invalid pixelformat : %s\n", fmt->name);
+		break;
+	}
+}
+
+void mfc_set_linear_stride_size(struct mfc_ctx *ctx, struct mfc_raw_info *raw, struct mfc_fmt *fmt)
+{
+	/*
+	 * Decoder: Use stride alignment value defiend in DT.
+	 *	    (Largest limitation among SoC IPs)
+	 * Encoder: Use the stride value that the user set when s_fmt.
+	 */
+	if (ctx->type == MFCINST_DECODER)
+		__mfc_set_dec_stride(ctx, raw, fmt);
+}
+
+void mfc_dec_calc_dpb_size(struct mfc_ctx *ctx, struct mfc_raw_info *raw, struct mfc_fmt *fmt)
+{
+	int i;
+	int extra = MFC_LINEAR_BUF_SIZE;
+	int check_min_dpb_size = 1;
+
+	mfc_set_linear_stride_size(ctx, raw, fmt);
+
+	raw->total_plane_size = 0;
+
+	for (i = 0; i < raw->num_planes; i++) {
+		raw->plane_size[i] = 0;
+		raw->plane_size_2bits[i] = 0;
+	}
+
+	switch (fmt->fourcc) {
+	case V4L2_PIX_FMT_NV12M:
+	case V4L2_PIX_FMT_NV21M:
+		raw->plane_size[0] = raw->stride[0] * ALIGN(ctx->img_height, 16) + extra;
+		raw->plane_size[1] = raw->stride[1] * ALIGN(ctx->img_height, 16) / 2 + extra;
+		break;
+	case V4L2_PIX_FMT_YUV420M:
+	case V4L2_PIX_FMT_YVU420M:
+		raw->plane_size[0] = raw->stride[0] * ALIGN(ctx->img_height, 16) + extra;
+		raw->plane_size[1] = raw->stride[1] * ALIGN(ctx->img_height, 16) / 2 + extra;
+		raw->plane_size[2] = raw->stride[2] * ALIGN(ctx->img_height, 16) / 2 + extra;
+		break;
+	case V4L2_PIX_FMT_NV16M:
+	case V4L2_PIX_FMT_NV61M:
+		raw->plane_size[0] = raw->stride[0] * ALIGN(ctx->img_height, 16) + extra;
+		raw->plane_size[1] = raw->stride[1] * ALIGN(ctx->img_height, 16) + extra;
+		break;
+	default:
+		mfc_ctx_err("Invalid pixelformat : %s\n", fmt->name);
+		break;
+	}
+
+	/*
+	 * The min DPB size returned by firmware may be larger than
+	 * the DPB size calculated by the driver in the following situation.
+	 * - Change 10bit mem_type at INIT_BUF.
+	 * - Use single-fd format without extra bytes.
+	 * In the above case, if the driver forcibly changes the DPB size,
+	 * it fails due to buffer size error at V4L2 Qbuf.
+	 * And when F/W really needs min DPB size in scenario like VP9 interframe DRC,
+	 * if the driver does not force change the DPB size,
+	 * No.57(INSUFFICIENT_DPB_SIZE) error occurs in F/W.
+	 */
+	if (fmt->mem_planes == 1)
+		check_min_dpb_size = 0;
+
+	if (check_min_dpb_size) {
+		for (i = 0; i < raw->num_planes; i++) {
+			if (raw->plane_size[i] < ctx->min_dpb_size[i]) {
+				mfc_ctx_info("[FRAME] plane[%d] size %d / min size %d\n",
+					     i, raw->plane_size[i], ctx->min_dpb_size[i]);
+				raw->plane_size[i] = ctx->min_dpb_size[i];
+			}
+		}
+	}
+
+	for (i = 0; i < raw->num_planes; i++) {
+		raw->total_plane_size += raw->plane_size[i];
+		mfc_ctx_debug(2, "[FRAME] Plane[%d] size = %d, stride = %d\n",
+			      i, raw->plane_size[i], raw->stride[i]);
+	}
+	mfc_ctx_debug(2, "[FRAME] total plane size: %d\n", raw->total_plane_size);
+
+	if (IS_H264_DEC(ctx)) {
+		ctx->mv_size = DEC_MV_SIZE_MB(ctx->img_width, ctx->img_height);
+		ctx->mv_size = ALIGN(ctx->mv_size, 32);
+	} else {
+		ctx->mv_size = 0;
+	}
+}
+
+void mfc_calc_base_addr(struct mfc_ctx *ctx, struct vb2_buffer *vb,
+			struct mfc_fmt *fmt)
+{
+	struct mfc_buf *buf = vb_to_mfc_buf(vb);
+	int i, idx, max_idx;
+
+	if ((fmt->type & MFC_FMT_FRAME) && ctx->multi_view_enable)
+		max_idx = MFC_MV_BUF_IDX_MAX;
+	else
+		max_idx = 1;
+
+	for (i = 0; i < max_idx; i++) {
+		/* It means there is no plane in the buffer. */
+		if (ctx->view_buf_info[i].num_fd == 0)
+			continue;
+
+		for (idx = 0; idx < ctx->view_buf_info[i].num_fd; idx++)
+			buf->addr[i][idx] = mfc_mem_get_daddr_vb
+				(vb, ctx->view_buf_info[i].offset + idx);
+	}
+
+	for (i = 0; i < fmt->num_planes; i++)
+		mfc_ctx_debug(2, "[MEMINFO] plane[%d] addr %#llx\n", i, buf->addr[0][i]);
+}
+
+void mfc_set_view_buf_info(struct mfc_ctx *ctx,
+			   int mem_planes,
+			   int num_fd_depth_map,
+			   int num_fd_sub_view_meta)
+{
+	int offset = 0;
+
+	ctx->view_buf_info[MFC_MV_BUF_IDX_VIEW0].offset = offset;
+	ctx->view_buf_info[MFC_MV_BUF_IDX_VIEW0].num_fd = mem_planes;
+	offset += mem_planes;
+
+	ctx->view_buf_info[MFC_MV_BUF_IDX_VIEW0_DEPTH].offset = offset;
+	ctx->view_buf_info[MFC_MV_BUF_IDX_VIEW0_DEPTH].num_fd = num_fd_depth_map;
+	offset += num_fd_depth_map;
+
+	ctx->view_buf_info[MFC_MV_BUF_IDX_VIEW1].offset = offset;
+	ctx->view_buf_info[MFC_MV_BUF_IDX_VIEW1].num_fd = mem_planes;
+	offset += mem_planes;
+
+	ctx->view_buf_info[MFC_MV_BUF_IDX_VIEW1_DEPTH].offset = offset;
+	ctx->view_buf_info[MFC_MV_BUF_IDX_VIEW1_DEPTH].num_fd = num_fd_depth_map;
+	offset += num_fd_depth_map;
+
+	ctx->view_buf_info[MFC_MV_BUF_IDX_VIEW1_META].offset = offset;
+	ctx->view_buf_info[MFC_MV_BUF_IDX_VIEW1_META].num_fd = num_fd_sub_view_meta;
+	offset += num_fd_sub_view_meta;
+}
+
+void mfc_core_idle_checker(struct timer_list *t)
+{
+	struct mfc_core *core = timer_container_of(core, t, mfc_idle_timer);
+	struct mfc_dev *dev = core->dev;
+
+	mfc_core_debug(5, "[MFCIDLE] MFC HW idle checker is ticking!\n");
+
+	if (dev->move_ctx_cnt) {
+		MFC_TRACE_RM("[MFCIDLE] migration working\n");
+		mfc_core_idle_checker_start_tick(core);
+		return;
+	}
+
+	if (atomic_read(&core->qos_req_cur) == 0) {
+		mfc_core_debug(6, "[MFCIDLE] MFC QoS not started yet\n");
+		mfc_core_idle_checker_start_tick(core);
+		return;
+	}
+
+	if (core->sched->is_work(core)) {
+		MFC_TRACE_CORE("[MFCIDLE] there is work to do\n");
+		mfc_core_debug(6, "[MFCIDLE] there is work to do\n");
+		core->sched->queue_work(core);
+		mfc_core_idle_checker_start_tick(core);
+		return;
+	}
+
+	if (!atomic_read(&core->hw_run_bits) && !atomic_read(&core->dev->queued_bits))
+		mfc_core_change_idle_mode(core, MFC_IDLE_MODE_RUNNING);
+
+#ifdef CONFIG_MFC_USE_BUS_DEVFREQ
+	queue_work(core->mfc_idle_wq, &core->mfc_idle_work);
+#endif
+}
diff --git a/drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.h b/drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.h
index 320dc96a40ed..dedfb049e6fc 100644
--- a/drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.h
+++ b/drivers/media/platform/samsung/exynos-mfc/base/mfc_utils.h
@@ -12,7 +12,84 @@
 #ifndef __MFC_UTILS_H
 #define __MFC_UTILS_H __FILE__
 
-#include "mfc_common.h"
+#include "mfc_rate_calculate.h"
+#include "mfc_format.h"
+
+/* bit operation */
+#define mfc_clear_bits(reg, mask, shift)	((reg) &= ~((mask) << (shift)))
+#define mfc_set_bits(reg, mask, shift, value)	((reg) |= ((value) & (mask)) << (shift))
+#define mfc_clear_set_bits(reg, mask, shift, value)	\
+	do {						\
+		typeof(shift) s = shift;		\
+		typeof(mask) m = mask;			\
+		(reg) &= ~(m << s);			\
+		(reg) |= ((value) & m) << s;		\
+	} while (0)
+
+#define mfc_get_upper(x)	(((unsigned long)(x) >> 32) & U32_MAX)
+#define mfc_get_lower(x)	((x) & U32_MAX)
+
+#define MFC_FPS(x) ((x) / 1000)
+
+static inline void mfc_set_bit(int num, struct mfc_bits *data)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&data->lock, flags);
+	__set_bit(num, &data->bits);
+	spin_unlock_irqrestore(&data->lock, flags);
+}
+
+static inline void mfc_clear_bit(int num, struct mfc_bits *data)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&data->lock, flags);
+	__clear_bit(num, &data->bits);
+	spin_unlock_irqrestore(&data->lock, flags);
+}
+
+static inline int mfc_is_all_bits_cleared(struct mfc_bits *data)
+{
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&data->lock, flags);
+	ret = ((data->bits) == 0) ? 1 : 0;
+	spin_unlock_irqrestore(&data->lock, flags);
+	return ret;
+}
+
+static inline void mfc_clear_all_bits(struct mfc_bits *data)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&data->lock, flags);
+	data->bits = 0;
+	spin_unlock_irqrestore(&data->lock, flags);
+}
+
+static inline unsigned long mfc_get_bits(struct mfc_bits *data)
+{
+	unsigned long flags;
+	unsigned long ret;
+
+	spin_lock_irqsave(&data->lock, flags);
+	ret = data->bits;
+	spin_unlock_irqrestore(&data->lock, flags);
+	return ret;
+}
+
+static inline void mfc_create_bits(struct mfc_bits *data)
+{
+	spin_lock_init(&data->lock);
+	mfc_clear_all_bits(data);
+}
+
+static inline void mfc_delete_bits(struct mfc_bits *data)
+{
+	mfc_clear_all_bits(data);
+}
 
 static inline void mfc_core_clean_dev_int_flags(struct mfc_core *core)
 {
@@ -65,6 +142,7 @@ static inline void mfc_core_change_fw_state(struct mfc_core *core,
 		       prev_stat, core->fw.status, set ? "set" : "clear", state);
 	mfc_core_debug(2, "[F/W] normal status: %#x -> %#x (%s: %#x)\n",
 		       prev_stat, core->fw.status, set ? "set" : "clear", state);
+
 }
 
 static inline enum mfc_node_type mfc_get_node_type(struct file *file)
@@ -121,6 +199,27 @@ static inline void mfc_clear_mb_flag(struct mfc_buf *mfc_buf)
 	mfc_buf->flag = 0;
 }
 
+static inline void mfc_set_mb_flag(struct mfc_buf *mfc_buf, enum mfc_mb_flag f)
+{
+	mfc_buf->flag |= BIT(f);
+}
+
+static inline int mfc_check_mb_flag(struct mfc_buf *mfc_buf, enum mfc_mb_flag f)
+{
+	if (mfc_buf->flag & BIT(f))
+		return 1;
+
+	return 0;
+}
+
+int mfc_check_vb_with_fmt(struct mfc_fmt *fmt, struct vb2_buffer *vb);
+int mfc_check_resolution(struct mfc_ctx *ctx);
+void mfc_set_linear_stride_size(struct mfc_ctx *ctx, struct mfc_raw_info *raw, struct mfc_fmt *fmt);
+void mfc_dec_calc_dpb_size(struct mfc_ctx *ctx, struct mfc_raw_info *raw, struct mfc_fmt *fmt);
+void mfc_calc_base_addr(struct mfc_ctx *ctx, struct vb2_buffer *vb, struct mfc_fmt *fmt);
+void mfc_set_view_buf_info(struct mfc_ctx *ctx, int mem_planes,
+			   int num_fd_depth_map, int num_fd_sub_view_meta);
+
 static inline u32 mfc_dec_get_strm_size(struct mfc_ctx *ctx, struct mfc_buf *src_mb)
 {
 	struct vb2_plane *vb_plane;
@@ -157,6 +256,41 @@ static inline u32 mfc_dec_get_strm_size(struct mfc_ctx *ctx, struct mfc_buf *src
 
 	return strm_size;
 }
+
+static inline int mfc_dec_get_strm_offset(struct mfc_ctx *ctx, struct mfc_buf *src_mb)
+{
+	struct vb2_plane *vb_plane;
+	struct mfc_dec *dec = ctx->dec_priv;
+	unsigned int offset;
+
+	vb_plane = &src_mb->vb.vb2_buf.planes[0];
+	offset = vb_plane->data_offset;
+	if (dec->consumed)
+		offset += dec->consumed;
+
+	mfc_ctx_debug(2, "[STREAM] offset: %d (bytesused %d, data_offset %d, consumed %d)\n",
+		      offset, vb_plane->bytesused, vb_plane->data_offset, dec->consumed);
+
+	return offset;
+}
+
+static inline int mfc_dec_status_decoding(unsigned int dst_frame_status)
+{
+	if (dst_frame_status == MFC_REG_DEC_STATUS_DECODING_DISPLAY ||
+	    dst_frame_status == MFC_REG_DEC_STATUS_DECODING_ONLY)
+		return 1;
+	return 0;
+}
+
+static inline int mfc_dec_status_display(unsigned int dst_frame_status)
+{
+	if (dst_frame_status == MFC_REG_DEC_STATUS_DISPLAY_ONLY ||
+	    dst_frame_status == MFC_REG_DEC_STATUS_DECODING_DISPLAY)
+		return 1;
+
+	return 0;
+}
+
 /* Meerkat interval */
 #define MEERKAT_TICK_INTERVAL   1000
 /* After how many executions meerkat should assume lock up */
@@ -190,6 +324,20 @@ static inline void mfc_core_idle_update_hw_run(struct mfc_core *core,
 	spin_unlock_irqrestore(&core->dev->idle_bits_lock, flags);
 }
 
+static inline void mfc_idle_update_queued(struct mfc_dev *dev,
+					  struct mfc_ctx *ctx)
+{
+	unsigned long flags;
+	int bits;
+
+	spin_lock_irqsave(&dev->idle_bits_lock, flags);
+
+	bits = atomic_read(&dev->queued_bits);
+	atomic_set(&dev->queued_bits, (bits | BIT(ctx->num)));
+
+	spin_unlock_irqrestore(&dev->idle_bits_lock, flags);
+}
+
 static inline void mfc_core_change_idle_mode(struct mfc_core *core,
 					     enum mfc_idle_mode idle_mode)
 {
@@ -206,4 +354,68 @@ static inline void mfc_ctx_change_idle_mode(struct mfc_ctx *ctx,
 	MFC_TRACE_CTX("**[c:%d] idle mode : %d\n", ctx->num, idle_mode);
 	ctx->idle_mode = idle_mode;
 }
+
+static inline void mfc_print_ctx_info(struct mfc_ctx *ctx)
+{
+	struct mfc_fmt *codec = NULL;
+	struct mfc_fmt *fmt = NULL;
+
+	if (ctx->type == MFCINST_DECODER) {
+		codec = ctx->src_fmt;
+		fmt = ctx->dst_fmt;
+	} else {
+		codec = ctx->dst_fmt;
+		fmt = ctx->src_fmt;
+	}
+
+	if (!codec)
+		codec = &mfc_formats[0];
+	if (!fmt)
+		fmt = &mfc_formats[0];
+	mfc_ctx_info("- %s%s, %s, %dx%d %lu fps(ts %lu fps, op %lu fps, rt %lu fps)",
+		     codec->name,
+		     ctx->multi_view_enable ? "(MV-HEVC)" : "",
+		     fmt->name,
+		     ctx->img_width, ctx->img_height,
+		     MFC_FPS(ctx->framerate),
+		     MFC_FPS(ctx->last_framerate),
+		     MFC_FPS(ctx->operating_framerate),
+		     MFC_FPS(mfc_rate_get_rt_framerate(ctx, ctx->rt)));
+	mfc_ctx_info("mb %lu(%d%%), main core %d, op_mode %d(stream %d), rt %d\n",
+		     ctx->weighted_mb, ctx->load,
+		     ctx->op_core_num[MFC_CORE_MAIN],
+		     ctx->op_mode, ctx->stream_op_mode, ctx->rt);
+}
+
+static inline void mfc_show_ctx_info(struct mfc_ctx *ctx)
+{
+	struct mfc_fmt *codec = NULL;
+	struct mfc_fmt *fmt = NULL;
+
+	if (ctx->type == MFCINST_DECODER) {
+		codec = ctx->src_fmt;
+		fmt = ctx->dst_fmt;
+	} else {
+		codec = ctx->dst_fmt;
+		fmt = ctx->src_fmt;
+	}
+
+	if (!codec)
+		codec = &mfc_formats[0];
+	if (!fmt)
+		fmt = &mfc_formats[0];
+
+	mfc_ctx_debug(3, "- %s, %s, %dx%d %lu fps(ts %lu fps, op %lu fps, rt %lu fps)",
+		      codec->name,
+		      fmt->name,
+		      ctx->img_width, ctx->img_height,
+		      MFC_FPS(ctx->framerate),
+		      MFC_FPS(ctx->last_framerate),
+		      MFC_FPS(ctx->operating_framerate),
+		      MFC_FPS(mfc_rate_get_rt_framerate(ctx, ctx->rt)));
+	mfc_ctx_debug(3, "mb %lu(%d%%), main core %d, op_mode %d(stream %d), rt %d\n",
+		      ctx->weighted_mb, ctx->load,
+		      ctx->op_core_num[MFC_CORE_MAIN],
+		      ctx->op_mode, ctx->stream_op_mode, ctx->rt);
+}
 #endif /* __MFC_UTILS_H */
-- 
2.34.1

