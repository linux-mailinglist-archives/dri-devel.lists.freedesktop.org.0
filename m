Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9801D79A159
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 04:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE28A10E0D0;
	Mon, 11 Sep 2023 02:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1441E10E0CD
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 02:32:07 +0000 (UTC)
X-UUID: 6428c00e504b11ee8051498923ad61e6-20230911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=k7eKKqiU9u1VTQEhbL4g+T+8Z/Im5zTAmaqVcrzlJog=; 
 b=oKAqoGGgHnTwU2Nrzr77Lv7TzaetUwm2zBYVB2mGQH8flZ/fZGDLB2cPKgwRMRTzdzgWxH2poaxG79v5uQ+IVM6mcX2FUiQzRvCQ1UbaPN7RiFQij01a502CP/yNilRPd3s/shqR3mVWpLZ9o4FqblhdHwlWX2yZpexGuDIZUqw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:2b9c6210-8e26-4923-9451-89365963a96c, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:0ad78a4, CLOUDID:dc85c713-4929-4845-9571-38c601e9c3c9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6428c00e504b11ee8051498923ad61e6-20230911
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 650081513; Mon, 11 Sep 2023 10:32:02 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Sep 2023 10:32:01 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Sep 2023 10:32:00 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 9/9] dma_buf: heaps: mtk_sec_heap: Add a new CMA heap
Date: Mon, 11 Sep 2023 10:30:38 +0800
Message-ID: <20230911023038.30649-10-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230911023038.30649-1-yong.wu@mediatek.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.150000-8.000000
X-TMASE-MatchedRID: l/nE+SiO7Ibv9W9IPgV+ekKcYi5Qw/RVJNtuyL6mpIWgaf0+XUrNk6jp
 YrigUiQ3RgA/t103tXOp3RVRr+fKXKawq2pdPD7UA9lly13c/gG94JvJnfFrHg6QlBHhBZuwYXo
 6e6cMykyCrhXL3UcSds/8MSwnHgK56fubsV+A+k+yntSjDrb64SQwGQSJ46NmXCmcAC8DBrPrio
 8O85DXBtuU0Ipyd28f+kFR4g8YiAE/eX/eRWk3RZA6S0SjvcYUmyqQJWNsukna+IH8mvgPVEttN
 R/47hK8ALglGcpZqpxRomVnnmsja5e/bF1ays2S4RtSDjG+z7BzijlDBYeD/Jsoi2XrUn/Jn6Kd
 MrRsL14qtq5d3cxkNTx61AcxE5RmHl89tzhQNcPdxB32r2oE1NRT50T+gtKLgL5DmE5InGnToZA
 9tPKpDJ6oP1a0mRIj
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.150000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D012446BA56B603C0A9C42A245B2817DF015B66332AAB4883A6336DF0FC547C72000:8
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

Create a new mtk_svp_cma heap from the CMA reserved buffer.

When the first allocating buffer, use cma_alloc to prepare whole the
CMA range, then send its range to TEE to protect and manage.
For the later allocating, we just adds the cma_used_size.

When SVP done, cma_release will release the buffer, then kernel may
reuse it.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/dma-buf/heaps/Kconfig           |   2 +-
 drivers/dma-buf/heaps/mtk_secure_heap.c | 121 +++++++++++++++++++++++-
 2 files changed, 119 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index 729c0cf3eb7c..e101f788ecbf 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -15,7 +15,7 @@ config DMABUF_HEAPS_CMA
 
 config DMABUF_HEAPS_MTK_SECURE
 	bool "DMA-BUF MediaTek Secure Heap"
-	depends on DMABUF_HEAPS && TEE
+	depends on DMABUF_HEAPS && TEE && CMA
 	help
 	  Choose this option to enable dma-buf MediaTek secure heap for Secure
 	  Video Path. This heap is backed by TEE client interfaces. If in
diff --git a/drivers/dma-buf/heaps/mtk_secure_heap.c b/drivers/dma-buf/heaps/mtk_secure_heap.c
index daf6cf2121a1..3f568fe6b569 100644
--- a/drivers/dma-buf/heaps/mtk_secure_heap.c
+++ b/drivers/dma-buf/heaps/mtk_secure_heap.c
@@ -4,11 +4,12 @@
  *
  * Copyright (C) 2023 MediaTek Inc.
  */
-
+#include <linux/cma.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-heap.h>
 #include <linux/err.h>
 #include <linux/module.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/tee_drv.h>
@@ -25,9 +26,11 @@
  * MediaTek secure (chunk) memory type
  *
  * @KREE_MEM_SEC_CM_TZ: static chunk memory carved out for trustzone.
+ * @KREE_MEM_SEC_CM_CMA: dynamic chunk memory carved out from CMA.
  */
 enum kree_mem_type {
 	KREE_MEM_SEC_CM_TZ = 1,
+	KREE_MEM_SEC_CM_CMA,
 };
 
 struct mtk_secure_heap_buffer {
@@ -42,6 +45,13 @@ struct mtk_secure_heap {
 	const enum kree_mem_type mem_type;
 	u32			 mem_session;
 	struct tee_context	*tee_ctx;
+
+	struct cma		*cma;
+	struct page		*cma_page;
+	unsigned long		cma_paddr;
+	unsigned long		cma_size;
+	unsigned long		cma_used_size;
+	struct mutex		lock; /* lock for cma_used_size */
 };
 
 struct mtk_secure_heap_attachment {
@@ -90,6 +100,42 @@ static int mtk_kree_secure_session_init(struct mtk_secure_heap *sec_heap)
 	return ret;
 }
 
+static int mtk_sec_mem_cma_allocate(struct mtk_secure_heap *sec_heap, size_t size)
+{
+	/*
+	 * Allocate CMA only when allocating buffer for the first time, and just
+	 * increase cma_used_size at the other times.
+	 */
+	mutex_lock(&sec_heap->lock);
+	if (sec_heap->cma_used_size)
+		goto add_size;
+
+	mutex_unlock(&sec_heap->lock);
+	sec_heap->cma_page = cma_alloc(sec_heap->cma, sec_heap->cma_size >> PAGE_SHIFT,
+				       get_order(PAGE_SIZE), false);
+	if (!sec_heap->cma_page)
+		return -ENOMEM;
+
+	mutex_lock(&sec_heap->lock);
+add_size:
+	sec_heap->cma_used_size += size;
+	mutex_unlock(&sec_heap->lock);
+	return sec_heap->cma_used_size;
+}
+
+static void mtk_sec_mem_cma_free(struct mtk_secure_heap *sec_heap, size_t size)
+{
+	bool cma_is_empty;
+
+	mutex_lock(&sec_heap->lock);
+	sec_heap->cma_used_size -= size;
+	cma_is_empty = !sec_heap->cma_used_size;
+	mutex_unlock(&sec_heap->lock);
+
+	if (cma_is_empty)
+		cma_release(sec_heap->cma, sec_heap->cma_page, sec_heap->cma_size >> PAGE_SHIFT);
+}
+
 static int
 mtk_sec_mem_tee_service_call(struct tee_context *tee_ctx, u32 session,
 			     unsigned int command, struct tee_param *params)
@@ -114,23 +160,47 @@ static int mtk_sec_mem_allocate(struct mtk_secure_heap *sec_heap,
 {
 	struct tee_param params[MTK_TEE_PARAM_NUM] = {0};
 	u32 mem_session = sec_heap->mem_session;
+	bool cma_frst_alloc = false;
 	int ret;
 
+	if (sec_heap->cma) {
+		ret = mtk_sec_mem_cma_allocate(sec_heap, sec_buf->size);
+		if (ret < 0)
+			return ret;
+		/*
+		 * When CMA allocates for the first time, pass the CMA range to TEE
+		 * to protect it. It's the first allocating if the cma_used_size is equal
+		 * to this required buffer size.
+		 */
+		cma_frst_alloc = (ret == sec_buf->size);
+	}
+
 	params[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
 	params[0].u.value.a = SZ_4K;			/* alignment */
 	params[0].u.value.b = sec_heap->mem_type;	/* memory type */
 	params[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
 	params[1].u.value.a = sec_buf->size;
 	params[2].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT;
+	if (sec_heap->cma && cma_frst_alloc) {
+		params[2].u.value.a = sec_heap->cma_paddr;
+		params[2].u.value.b = sec_heap->cma_size;
+	}
 
 	/* Always request zeroed buffer */
 	ret = mtk_sec_mem_tee_service_call(sec_heap->tee_ctx, mem_session,
 					   TZCMD_MEM_SECURECM_ZALLOC, params);
-	if (ret)
-		return -ENOMEM;
+	if (ret) {
+		ret = -ENOMEM;
+		goto free_cma;
+	}
 
 	sec_buf->sec_handle = params[2].u.value.a;
 	return 0;
+
+free_cma:
+	if (sec_heap->cma)
+		mtk_sec_mem_cma_free(sec_heap, sec_buf->size);
+	return ret;
 }
 
 static void mtk_sec_mem_release(struct mtk_secure_heap *sec_heap,
@@ -145,6 +215,9 @@ static void mtk_sec_mem_release(struct mtk_secure_heap *sec_heap,
 
 	mtk_sec_mem_tee_service_call(sec_heap->tee_ctx, mem_session,
 				     TZCMD_MEM_SECURECM_UNREF, params);
+
+	if (sec_heap->cma)
+		mtk_sec_mem_cma_free(sec_heap, sec_buf->size);
 }
 
 static int mtk_sec_heap_attach(struct dma_buf *dmabuf, struct dma_buf_attachment *attachment)
@@ -317,8 +390,41 @@ static struct mtk_secure_heap mtk_sec_heap[] = {
 		.name		= "mtk_svp",
 		.mem_type	= KREE_MEM_SEC_CM_TZ,
 	},
+	{
+		.name		= "mtk_svp_cma",
+		.mem_type	= KREE_MEM_SEC_CM_CMA,
+	},
 };
 
+static int __init mtk_secure_cma_init(struct reserved_mem *rmem)
+{
+	struct mtk_secure_heap *sec_heap = NULL;
+	int ret, i;
+
+	for (i = 0; i < ARRAY_SIZE(mtk_sec_heap); i++) {
+		if (mtk_sec_heap[i].mem_type != KREE_MEM_SEC_CM_CMA)
+			continue;
+		sec_heap = &mtk_sec_heap[i];
+		break;
+	}
+	if (!sec_heap)
+		return -ENOENT;
+
+	ret = cma_init_reserved_mem(rmem->base, rmem->size, 0, sec_heap->name,
+				    &sec_heap->cma);
+	if (ret) {
+		pr_err("%s: %s set up CMA fail\n", __func__, rmem->name);
+		return ret;
+	}
+	sec_heap->cma_paddr = rmem->base;
+	sec_heap->cma_size = rmem->size;
+
+	return 0;
+}
+
+RESERVEDMEM_OF_DECLARE(mtk_secure_cma, "mediatek,secure_cma_chunkmem",
+		       mtk_secure_cma_init);
+
 static int mtk_sec_heap_init(void)
 {
 	struct mtk_secure_heap *sec_heap = mtk_sec_heap;
@@ -331,6 +437,15 @@ static int mtk_sec_heap_init(void)
 		exp_info.ops = &mtk_sec_heap_ops;
 		exp_info.priv = (void *)sec_heap;
 
+		if (sec_heap->mem_type == KREE_MEM_SEC_CM_CMA) {
+			if (!sec_heap->cma) {
+				pr_err("CMA is not ready for %s.\n", sec_heap->name);
+				continue;
+			} else {
+				mutex_init(&sec_heap->lock);
+			}
+		}
+
 		heap = dma_heap_add(&exp_info);
 		if (IS_ERR(heap))
 			return PTR_ERR(heap);
-- 
2.25.1

