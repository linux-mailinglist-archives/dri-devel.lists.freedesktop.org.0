Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD0179A14B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 04:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A2310E0C1;
	Mon, 11 Sep 2023 02:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFFB10E0C1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 02:31:28 +0000 (UTC)
X-UUID: 4ad2c028504b11eea33bb35ae8d461a2-20230911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=VN0JQPMMhe32AWPU6hpa1Pup/Q1/dHixTUffEvqrIOQ=; 
 b=XefqQxIklsh7aVXZo9DkecV+0j9MomlWfSbuMF9Hx++iWRIIw1YY9LrAeIc5H3QPFSstuY2eue9S+PyGlg7ANG1Nzr7+tJW4cEsCTtMx97QvKIwFWVgxZg5/7vmJHDstXiDzpZ/4gHQkusKT49DNBBjpPlfIA7G8/QjEWWD1q/Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:76e991a8-f44d-4452-aee1-065186b8f03a, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:0ad78a4, CLOUDID:7083c713-4929-4845-9571-38c601e9c3c9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 4ad2c028504b11eea33bb35ae8d461a2-20230911
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 233723287; Mon, 11 Sep 2023 10:31:20 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Sep 2023 10:31:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Sep 2023 10:31:18 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 4/9] dma-buf: heaps: Initialise MediaTek secure heap
Date: Mon, 11 Sep 2023 10:30:33 +0800
Message-ID: <20230911023038.30649-5-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230911023038.30649-1-yong.wu@mediatek.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.495300-8.000000
X-TMASE-MatchedRID: l5qCKP2S+Cagb9K7EuXabQI0yP/uoH+DK2i9pofGVSvvSbc8qoHu0dnf
 JrUSEbFDjK5iVt35bftmfswbzPS/gPPtClEs9sT69Ib/6w+1lWSGm/9Tv2/Oge0JEDP8WtN7rVb
 mNWMCsmqzR95c6Z6RoVJaDhgFzZsBN4TfMcvKuzLil2r2x2PwtYfsPVs/8Vw6te8MfJIL55RAd9
 sp7/hgkm2IWWk4CSvnmVv4zOFeLFbs7aQkqkpFymwbuvhCHs3cTI0NfY99MMmbKItl61J/yZ+in
 TK0bC9eKrauXd3MZDU8etQHMROUZj3N0UyXacvaKAcvM3zjw8tWZpQIRsul12NGTMSXQ1zXQkOa
 g7LoecejwHie3xQ4QJPItqRdqv2xJ4i3oM9NWxn9FOpoL1gZGzxbkXaeUfhyHP4+GiOUtS56/Rg
 9M3zrxAGqr7/5oYKxCHMvTg6vZ5lWXGvUUmKP2w==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.495300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C5BA823EE79924C2337B95E6C18C094C8DE0777688C84FF05A48A48FC8E61DE22000:8
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 jianjiao.zeng@mediatek.com,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tjmercier@google.com, linaro-mm-sig@lists.linaro.org,
 John Stultz <jstultz@google.com>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 Yong Wu <yong.wu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Initialise a mtk_svp heap. Currently just add a null heap, Prepare for
the later patches.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/dma-buf/heaps/Kconfig           |  8 ++
 drivers/dma-buf/heaps/Makefile          |  1 +
 drivers/dma-buf/heaps/mtk_secure_heap.c | 99 +++++++++++++++++++++++++
 3 files changed, 108 insertions(+)
 create mode 100644 drivers/dma-buf/heaps/mtk_secure_heap.c

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index a5eef06c4226..729c0cf3eb7c 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -12,3 +12,11 @@ config DMABUF_HEAPS_CMA
 	  Choose this option to enable dma-buf CMA heap. This heap is backed
 	  by the Contiguous Memory Allocator (CMA). If your system has these
 	  regions, you should say Y here.
+
+config DMABUF_HEAPS_MTK_SECURE
+	bool "DMA-BUF MediaTek Secure Heap"
+	depends on DMABUF_HEAPS && TEE
+	help
+	  Choose this option to enable dma-buf MediaTek secure heap for Secure
+	  Video Path. This heap is backed by TEE client interfaces. If in
+	  doubt, say N.
diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
index 974467791032..df559dbe33fe 100644
--- a/drivers/dma-buf/heaps/Makefile
+++ b/drivers/dma-buf/heaps/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
 obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
+obj-$(CONFIG_DMABUF_HEAPS_MTK_SECURE)	+= mtk_secure_heap.o
diff --git a/drivers/dma-buf/heaps/mtk_secure_heap.c b/drivers/dma-buf/heaps/mtk_secure_heap.c
new file mode 100644
index 000000000000..bbf1c8dce23e
--- /dev/null
+++ b/drivers/dma-buf/heaps/mtk_secure_heap.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DMABUF mtk_secure_heap exporter
+ *
+ * Copyright (C) 2023 MediaTek Inc.
+ */
+
+#include <linux/dma-buf.h>
+#include <linux/dma-heap.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+
+/*
+ * MediaTek secure (chunk) memory type
+ *
+ * @KREE_MEM_SEC_CM_TZ: static chunk memory carved out for trustzone.
+ */
+enum kree_mem_type {
+	KREE_MEM_SEC_CM_TZ = 1,
+};
+
+struct mtk_secure_heap_buffer {
+	struct dma_heap		*heap;
+	size_t			size;
+};
+
+struct mtk_secure_heap {
+	const char		*name;
+	const enum kree_mem_type mem_type;
+};
+
+static struct dma_buf *
+mtk_sec_heap_allocate(struct dma_heap *heap, size_t size,
+		      unsigned long fd_flags, unsigned long heap_flags)
+{
+	struct mtk_secure_heap_buffer *sec_buf;
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	struct dma_buf *dmabuf;
+	int ret;
+
+	sec_buf = kzalloc(sizeof(*sec_buf), GFP_KERNEL);
+	if (!sec_buf)
+		return ERR_PTR(-ENOMEM);
+
+	sec_buf->size = size;
+	sec_buf->heap = heap;
+
+	exp_info.exp_name = dma_heap_get_name(heap);
+	exp_info.size = sec_buf->size;
+	exp_info.flags = fd_flags;
+	exp_info.priv = sec_buf;
+
+	dmabuf = dma_buf_export(&exp_info);
+	if (IS_ERR(dmabuf)) {
+		ret = PTR_ERR(dmabuf);
+		goto err_free_buf;
+	}
+
+	return dmabuf;
+
+err_free_buf:
+	kfree(sec_buf);
+	return ERR_PTR(ret);
+}
+
+static const struct dma_heap_ops mtk_sec_heap_ops = {
+	.allocate	= mtk_sec_heap_allocate,
+};
+
+static struct mtk_secure_heap mtk_sec_heap[] = {
+	{
+		.name		= "mtk_svp",
+		.mem_type	= KREE_MEM_SEC_CM_TZ,
+	},
+};
+
+static int mtk_sec_heap_init(void)
+{
+	struct mtk_secure_heap *sec_heap = mtk_sec_heap;
+	struct dma_heap_export_info exp_info;
+	struct dma_heap *heap;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(mtk_sec_heap); i++, sec_heap++) {
+		exp_info.name = sec_heap->name;
+		exp_info.ops = &mtk_sec_heap_ops;
+		exp_info.priv = (void *)sec_heap;
+
+		heap = dma_heap_add(&exp_info);
+		if (IS_ERR(heap))
+			return PTR_ERR(heap);
+	}
+	return 0;
+}
+
+module_init(mtk_sec_heap_init);
+MODULE_DESCRIPTION("MediaTek Secure Heap Driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

