Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C930382BCE6
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 10:21:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC2D10EAC5;
	Fri, 12 Jan 2024 09:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C04210EAC0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 09:21:49 +0000 (UTC)
X-UUID: ffd53cf8b12b11eea2298b7352fd921d-20240112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=jOYJ/f+ZykHbwiqds3rmf9X7A02H1wnKriZyiEvO+rk=; 
 b=qLUDLykHo62KZ0FyU5oZzPqDEc4Bv99rpLDEvEyzC/suS2laDMUoBtAYlLEngTmTodTClQGY1xw/nr7ji7CREac630FAohFNbj7lRETxcJeMZKw8XY6Wu3CLPFe3L7/b6v6SBEMkb6d1kJEPNbOkBm0tDJYABFn1YEOykz0iDM4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:d9f84f27-eb88-4553-a764-3b4e04670470, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:5d391d7, CLOUDID:30562e8e-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ffd53cf8b12b11eea2298b7352fd921d-20240112
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 755443370; Fri, 12 Jan 2024 17:21:42 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 12 Jan 2024 17:21:41 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 Jan 2024 17:21:40 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <christian.koenig@amd.com>, Sumit Semwal
 <sumit.semwal@linaro.org>
Subject: [PATCH v4 7/7] dma_buf: heaps: restricted_heap_mtk: Add a new CMA heap
Date: Fri, 12 Jan 2024 17:20:14 +0800
Message-ID: <20240112092014.23999-8-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240112092014.23999-1-yong.wu@mediatek.com>
References: <20240112092014.23999-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.131100-8.000000
X-TMASE-MatchedRID: l/nE+SiO7Ibv9W9IPgV+ekKcYi5Qw/RVJNtuyL6mpIWgaf0+XUrNk6jp
 YrigUiQ3RgA/t103tXM8FMQyD4C9dJ1VEaBaPUgcH5YQyOg71ZZMkOX0UoduuQ6QlBHhBZuwIfb
 myxvcCJDNfhMgDv/TilJaDhgFzZsBN4TfMcvKuzICNMj/7qB/g0vE+2pLwGbnV+B/wB2UwCpspb
 y2I/SVT2zIIE1IuwCIgy/X+Bfk+MFZU9fjAumhWM36paW7ZnFoJDAZBInjo2aYfLu5qIysvt5NR
 zJ0gz5HALglGcpZqpxRomVnnmsjayrZY8IvnQlTutvHF25zoU+wR/wKmchi2Zsoi2XrUn/JUTdY
 /mdfTXtJKW4mDlJsMd934/rDAK3zUpXqgxV1N6kUtqaSsSdFZWvshE5wCZlIriYrg+UT+3m9BQ6
 K3KvsA4GZQWPmb7sAftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.131100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4CE1811229000CA5BFC8534231A62216EDA6D05874BF78BD6A60A13D025B917E2000:8
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>, Pavel
 Machek <pavel@ucw.cz>, Jeffrey Kardatzke <jkardatzke@google.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Vijayanand Jitta <quic_vjitta@quicinc.com>, Yong Wu <yong.wu@mediatek.com>,
 jianjiao.zeng@mediatek.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linaro-mm-sig@lists.linaro.org, Pekka Paalanen <ppaalanen@gmail.com>,
 linux-mediatek@lists.infradead.org, Joakim Bech <joakim.bech@linaro.org>,
 tjmercier@google.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 youlin.pei@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Create a new MediaTek CMA heap from the CMA reserved buffer.

In this heap, When the first allocating buffer, use cma_alloc to prepare
whole the CMA range, then send its range to TEE to protect and manage.
For the later allocating, we just adds the cma_used_size.

When SVP done, cma_release will release the buffer, then kernel may
reuse it.

For the "CMA" restricted heap, "struct cma *cma" is a common property,
not just for MediaTek, so put it into "struct restricted_heap" instead of
our private data.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/dma-buf/heaps/Kconfig               |   2 +-
 drivers/dma-buf/heaps/restricted_heap.h     |   4 +
 drivers/dma-buf/heaps/restricted_heap_mtk.c | 120 +++++++++++++++++++-
 3 files changed, 123 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index 84f748fb2856..58903bc62ac8 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -24,7 +24,7 @@ config DMABUF_HEAPS_RESTRICTED
 
 config DMABUF_HEAPS_RESTRICTED_MTK
 	bool "MediaTek DMA-BUF Restricted Heap"
-	depends on DMABUF_HEAPS_RESTRICTED && TEE=y
+	depends on DMABUF_HEAPS_RESTRICTED && DMA_CMA && TEE=y
 	help
 	  Enable restricted dma-buf heaps for MediaTek platform. This heap is backed by
 	  TEE client interfaces. If in doubt, say N.
diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/heaps/restricted_heap.h
index 6c93f6d257dc..8d17c39b65de 100644
--- a/drivers/dma-buf/heaps/restricted_heap.h
+++ b/drivers/dma-buf/heaps/restricted_heap.h
@@ -21,6 +21,10 @@ struct restricted_heap {
 
 	const struct restricted_heap_ops *ops;
 
+	struct cma		*cma;
+	unsigned long		cma_paddr;
+	unsigned long		cma_size;
+
 	void			*priv_data;
 };
 
diff --git a/drivers/dma-buf/heaps/restricted_heap_mtk.c b/drivers/dma-buf/heaps/restricted_heap_mtk.c
index 902add95bb7e..0180d04076e2 100644
--- a/drivers/dma-buf/heaps/restricted_heap_mtk.c
+++ b/drivers/dma-buf/heaps/restricted_heap_mtk.c
@@ -4,9 +4,11 @@
  *
  * Copyright (C) 2024 MediaTek Inc.
  */
+#include <linux/cma.h>
 #include <linux/dma-buf.h>
 #include <linux/err.h>
 #include <linux/module.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/slab.h>
 #include <linux/tee_drv.h>
 #include <linux/uuid.h>
@@ -23,6 +25,13 @@ enum mtk_secure_mem_type {
 	 * management is inside the TEE.
 	 */
 	MTK_SECURE_MEMORY_TYPE_CM_TZ	= 1,
+	/*
+	 * MediaTek dynamic chunk memory carved out from CMA.
+	 * In normal case, the CMA could be used in kernel; When SVP start, we will
+	 * allocate whole this CMA and pass whole the CMA PA and size into TEE to
+	 * protect it, then the detail memory management also is inside the TEE.
+	 */
+	MTK_SECURE_MEMORY_TYPE_CM_CMA	= 2,
 };
 
 enum mtk_secure_buffer_tee_cmd {
@@ -32,6 +41,8 @@ enum mtk_secure_buffer_tee_cmd {
 	 * [in]  value[0].a: The buffer size.
 	 *       value[0].b: alignment.
 	 * [in]  value[1].a: enum mtk_secure_mem_type.
+	 * [in]  value[2].a: pa base in cma case.
+	 *       value[2].b: The buffer size in cma case.
 	 * [out] value[3].a: The secure handle.
 	 */
 	MTK_TZCMD_SECMEM_ZALLOC	= 0x10000, /* MTK TEE Command ID Base */
@@ -52,6 +63,9 @@ struct mtk_restricted_heap_data {
 
 	const enum mtk_secure_mem_type mem_type;
 
+	struct page		*cma_page;
+	unsigned long		cma_used_size;
+	struct mutex		lock; /* lock for cma_used_size */
 };
 
 static int mtk_tee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
@@ -125,6 +139,10 @@ static int mtk_tee_restrict_memory(struct restricted_heap *heap, struct restrict
 	params[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
 	params[1].u.value.a = data->mem_type;
 	params[2].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+	if (heap->cma && data->mem_type == MTK_SECURE_MEMORY_TYPE_CM_CMA) {
+		params[2].u.value.a = heap->cma_paddr;
+		params[2].u.value.b = heap->cma_size;
+	}
 	params[3].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
 	ret = mtk_tee_service_call(data->tee_ctx, data->tee_session,
 				   MTK_TZCMD_SECMEM_ZALLOC, params);
@@ -163,6 +181,48 @@ mtk_restricted_memory_free(struct restricted_heap *heap, struct restricted_buffe
 {
 }
 
+static int mtk_restricted_memory_cma_allocate(struct restricted_heap *heap,
+					      struct restricted_buffer *buf)
+{
+	struct mtk_restricted_heap_data *data = heap->priv_data;
+	int ret = 0;
+	/*
+	 * Allocate CMA only when allocating buffer for the first time, and just
+	 * increase cma_used_size at the other time, Actually the memory
+	 * allocating is within the TEE.
+	 */
+	mutex_lock(&data->lock);
+	if (!data->cma_used_size) {
+		data->cma_page = cma_alloc(heap->cma, heap->cma_size >> PAGE_SHIFT,
+					   get_order(PAGE_SIZE), false);
+		if (!data->cma_page) {
+			ret = -ENOMEM;
+			goto out_unlock;
+		}
+	} else if (data->cma_used_size + buf->size > heap->cma_size) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+	data->cma_used_size += buf->size;
+
+out_unlock:
+	mutex_unlock(&data->lock);
+	return ret;
+}
+
+static void mtk_restricted_memory_cma_free(struct restricted_heap *heap,
+					   struct restricted_buffer *buf)
+{
+	struct mtk_restricted_heap_data *data = heap->priv_data;
+
+	mutex_lock(&data->lock);
+	data->cma_used_size -= buf->size;
+	if (!data->cma_used_size)
+		cma_release(heap->cma, data->cma_page,
+			    heap->cma_size >> PAGE_SHIFT);
+	mutex_unlock(&data->lock);
+}
+
 static int mtk_restricted_heap_init(struct restricted_heap *heap)
 {
 	struct mtk_restricted_heap_data *data = heap->priv_data;
@@ -184,21 +244,77 @@ static struct mtk_restricted_heap_data mtk_restricted_heap_data = {
 	.mem_type		= MTK_SECURE_MEMORY_TYPE_CM_TZ,
 };
 
+static const struct restricted_heap_ops mtk_restricted_heap_ops_cma = {
+	.heap_init		= mtk_restricted_heap_init,
+	.memory_alloc		= mtk_restricted_memory_cma_allocate,
+	.memory_free		= mtk_restricted_memory_cma_free,
+	.memory_restrict	= mtk_tee_restrict_memory,
+	.memory_unrestrict	= mtk_tee_unrestrict_memory,
+};
+
+static struct mtk_restricted_heap_data mtk_restricted_heap_data_cma = {
+	.mem_type		= MTK_SECURE_MEMORY_TYPE_CM_CMA,
+};
+
 static struct restricted_heap mtk_restricted_heaps[] = {
 	{
 		.name		= "restricted_mtk_cm",
 		.ops		= &mtk_restricted_heap_ops,
 		.priv_data	= &mtk_restricted_heap_data,
 	},
+	{
+		.name		= "restricted_mtk_cma",
+		.ops		= &mtk_restricted_heap_ops_cma,
+		.priv_data	= &mtk_restricted_heap_data_cma,
+	},
 };
 
+static int __init mtk_restricted_cma_init(struct reserved_mem *rmem)
+{
+	struct restricted_heap *rstrd_heap = mtk_restricted_heaps, *rstrd_heap_cma = NULL;
+	struct mtk_restricted_heap_data *data;
+	struct cma *cma;
+	int ret, i;
+
+	for (i = 0; i < ARRAY_SIZE(mtk_restricted_heaps); i++, rstrd_heap++) {
+		data = rstrd_heap->priv_data;
+		if (data->mem_type == MTK_SECURE_MEMORY_TYPE_CM_CMA) {
+			rstrd_heap_cma = rstrd_heap;
+			break;
+		}
+	}
+	if (!rstrd_heap_cma)
+		return -EINVAL;
+
+	ret = cma_init_reserved_mem(rmem->base, rmem->size, 0, rmem->name,
+				    &cma);
+	if (ret) {
+		pr_err("%s: %s set up CMA fail\n", __func__, rmem->name);
+		return ret;
+	}
+
+	rstrd_heap_cma->cma = cma;
+	rstrd_heap_cma->cma_paddr = rmem->base;
+	rstrd_heap_cma->cma_size = rmem->size;
+	return 0;
+}
+
+RESERVEDMEM_OF_DECLARE(restricted_cma, "mediatek,dynamic-restricted-region",
+		       mtk_restricted_cma_init);
+
 static int mtk_restricted_heap_initialize(void)
 {
 	struct restricted_heap *rstrd_heap = mtk_restricted_heaps;
+	struct mtk_restricted_heap_data *data;
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(mtk_restricted_heaps); i++, rstrd_heap++)
-		restricted_heap_add(rstrd_heap);
+	for (i = 0; i < ARRAY_SIZE(mtk_restricted_heaps); i++, rstrd_heap++) {
+		data = rstrd_heap->priv_data;
+		if (data->mem_type == MTK_SECURE_MEMORY_TYPE_CM_CMA && !rstrd_heap->cma)
+			continue;
+		if (!restricted_heap_add(rstrd_heap))
+			mutex_init(&data->lock);
+	}
 	return 0;
 }
 module_init(mtk_restricted_heap_initialize);
-- 
2.25.1

