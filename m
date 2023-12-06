Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAED806964
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 09:16:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FBA710E6B3;
	Wed,  6 Dec 2023 08:16:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BEA10E6A1
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 08:16:02 +0000 (UTC)
X-UUID: aeb51048940f11eea33bb35ae8d461a2-20231206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=AEOnbt4r9fsU1FaBhQrHBhHtJ6EFlT2KKfJtqxzhvuE=; 
 b=ApxelhEIPVXx9gy07iAqk1R61gZSGLQQ8Og37yQSVzXxlMiC+4Ain1BmhVa1dA7iPHvRgmBqZiWuzAhC/HNSYxn4WxIYP7F4dOnzy+6c/M8b1sI5GM2uaXGFVwyV3XfcPa50YAV7Onrw5140ILCsswbpDrxkRnVbtFOCN0gKIIM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.34, REQID:87bc9a72-6506-47bf-bbda-7b20a6963e2a, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:abefa75, CLOUDID:c2e87773-1bd3-4f48-b671-ada88705968c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: aeb51048940f11eea33bb35ae8d461a2-20231206
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1038099776; Wed, 06 Dec 2023 16:15:57 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 6 Dec 2023 16:15:55 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 6 Dec 2023 16:15:54 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
Subject: [PATCH v3,
 12/21] media: mediatek: vcodec: add interface to allocate/free secure
 memory
Date: Wed, 6 Dec 2023 16:15:29 +0800
Message-ID: <20231206081538.17056-13-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206081538.17056-1-yunfei.dong@mediatek.com>
References: <20231206081538.17056-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Steve Cho <stevecho@chromium.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Matthias Brugger <matthias.bgg@gmail.com>,
 John Stultz <jstultz@google.com>, linux-arm-kernel@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 linux-mediatek@lists.infradead.org, "T . J .
 Mercier" <tjmercier@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Yong Wu <yong.wu@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Need to call dma heap interface to allocate/free secure memory when playing
secure video.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../media/platform/mediatek/vcodec/Kconfig    |   1 +
 .../mediatek/vcodec/common/mtk_vcodec_util.c  | 122 +++++++++++++++++-
 .../mediatek/vcodec/common/mtk_vcodec_util.h  |   3 +
 3 files changed, 123 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/Kconfig b/drivers/media/platform/mediatek/vcodec/Kconfig
index bc8292232530..707865703e61 100644
--- a/drivers/media/platform/mediatek/vcodec/Kconfig
+++ b/drivers/media/platform/mediatek/vcodec/Kconfig
@@ -17,6 +17,7 @@ config VIDEO_MEDIATEK_VCODEC
 	depends on VIDEO_MEDIATEK_VPU || !VIDEO_MEDIATEK_VPU
 	depends on MTK_SCP || !MTK_SCP
 	depends on MTK_SMI || (COMPILE_TEST && MTK_SMI=n)
+	depends on DMABUF_HEAPS
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
 	select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
index 9ce34a3b5ee6..2c44747f77a0 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
@@ -5,9 +5,11 @@
 *	Tiffany Lin <tiffany.lin@mediatek.com>
 */
 
+#include <linux/dma-heap.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/regmap.h>
+#include <uapi/linux/dma-heap.h>
 
 #include "../decoder/mtk_vcodec_dec_drv.h"
 #include "../encoder/mtk_vcodec_enc_drv.h"
@@ -45,7 +47,7 @@ int mtk_vcodec_write_vdecsys(struct mtk_vcodec_dec_ctx *ctx, unsigned int reg,
 }
 EXPORT_SYMBOL(mtk_vcodec_write_vdecsys);
 
-int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
+static int mtk_vcodec_mem_alloc_nor(void *priv, struct mtk_vcodec_mem *mem)
 {
 	enum mtk_instance_type inst_type = *((unsigned int *)priv);
 	struct platform_device *plat_dev;
@@ -76,9 +78,71 @@ int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
 
 	return 0;
 }
-EXPORT_SYMBOL(mtk_vcodec_mem_alloc);
 
-void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
+static int mtk_vcodec_mem_alloc_sec(struct mtk_vcodec_dec_ctx *ctx, struct mtk_vcodec_mem *mem)
+{
+	struct device *dev = &ctx->dev->plat_dev->dev;
+	struct dma_buf *dma_buffer;
+	struct dma_heap *vdec_heap;
+	struct dma_buf_attachment *attach;
+	struct sg_table *sgt;
+	unsigned long size = mem->size;
+	int ret = 0;
+
+	if (!size)
+		return -EINVAL;
+
+	vdec_heap = dma_heap_find("mtk_svp");
+	if (!vdec_heap) {
+		mtk_v4l2_vdec_err(ctx, "dma heap find failed!");
+		return -EPERM;
+	}
+
+	dma_buffer = dma_heap_buffer_alloc(vdec_heap, size, DMA_HEAP_VALID_FD_FLAGS,
+					   DMA_HEAP_VALID_HEAP_FLAGS);
+	if (IS_ERR_OR_NULL(dma_buffer)) {
+		mtk_v4l2_vdec_err(ctx, "dma heap alloc size=0x%lx failed!", size);
+		return PTR_ERR(dma_buffer);
+	}
+
+	attach = dma_buf_attach(dma_buffer, dev);
+	if (IS_ERR_OR_NULL(attach)) {
+		mtk_v4l2_vdec_err(ctx, "dma attach size=0x%lx failed!", size);
+		ret = PTR_ERR(attach);
+		goto err_attach;
+	}
+
+	sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
+	if (IS_ERR_OR_NULL(sgt)) {
+		mtk_v4l2_vdec_err(ctx, "dma map attach size=0x%lx failed!", size);
+		ret = PTR_ERR(sgt);
+		goto err_sgt;
+	}
+
+	mem->va = dma_buffer;
+	mem->dma_addr = (dma_addr_t)sg_dma_address((sgt)->sgl);
+
+	if (!mem->va || !mem->dma_addr) {
+		mtk_v4l2_vdec_err(ctx, "dma buffer size=0x%lx failed!", size);
+		ret = -EPERM;
+		goto err_addr;
+	}
+
+	mem->attach = attach;
+	mem->sgt = sgt;
+
+	return 0;
+err_addr:
+	dma_buf_unmap_attachment(attach, sgt, DMA_BIDIRECTIONAL);
+err_sgt:
+	dma_buf_detach(dma_buffer, attach);
+err_attach:
+	dma_buf_put(dma_buffer);
+
+	return ret;
+}
+
+static void mtk_vcodec_mem_free_nor(void *priv, struct mtk_vcodec_mem *mem)
 {
 	enum mtk_instance_type inst_type = *((unsigned int *)priv);
 	struct platform_device *plat_dev;
@@ -111,6 +175,57 @@ void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
 	mem->dma_addr = 0;
 	mem->size = 0;
 }
+
+static void mtk_vcodec_mem_free_sec(struct mtk_vcodec_mem *mem)
+{
+	if (mem->sgt)
+		dma_buf_unmap_attachment(mem->attach, mem->sgt, DMA_BIDIRECTIONAL);
+	dma_buf_detach((struct dma_buf *)mem->va, mem->attach);
+	dma_buf_put((struct dma_buf *)mem->va);
+
+	mem->attach = NULL;
+	mem->sgt = NULL;
+	mem->va = NULL;
+	mem->dma_addr = 0;
+	mem->size = 0;
+}
+
+int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
+{
+	enum mtk_instance_type inst_type = *((unsigned int *)priv);
+	int ret;
+
+	if (inst_type == MTK_INST_DECODER) {
+		struct mtk_vcodec_dec_ctx *dec_ctx = priv;
+
+		if (dec_ctx->is_secure_playback) {
+			ret = mtk_vcodec_mem_alloc_sec(dec_ctx, mem);
+			goto alloc_end;
+		}
+	}
+
+	ret = mtk_vcodec_mem_alloc_nor(priv, mem);
+alloc_end:
+
+	return ret;
+}
+EXPORT_SYMBOL(mtk_vcodec_mem_alloc);
+
+void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
+{
+	enum mtk_instance_type inst_type = *((unsigned int *)priv);
+
+	if (inst_type == MTK_INST_DECODER) {
+		struct mtk_vcodec_dec_ctx *dec_ctx = priv;
+
+		if (dec_ctx->is_secure_playback) {
+			mtk_vcodec_mem_free_sec(mem);
+			return;
+		}
+	}
+
+	mtk_vcodec_mem_free_nor(priv, mem);
+}
 EXPORT_SYMBOL(mtk_vcodec_mem_free);
 
 void *mtk_vcodec_get_hw_dev(struct mtk_vcodec_dec_dev *dev, int hw_idx)
@@ -172,3 +287,4 @@ EXPORT_SYMBOL(mtk_vcodec_get_curr_ctx);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Mediatek video codec driver");
+MODULE_IMPORT_NS(DMA_BUF);
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.h
index 85f615cdd4d3..22078e757ed0 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.h
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.h
@@ -18,6 +18,9 @@ struct mtk_vcodec_mem {
 	size_t size;
 	void *va;
 	dma_addr_t dma_addr;
+
+	struct dma_buf_attachment *attach;
+	struct sg_table *sgt;
 };
 
 struct mtk_vcodec_fb {
-- 
2.18.0

