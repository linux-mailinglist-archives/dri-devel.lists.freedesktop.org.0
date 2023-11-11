Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE947E8A95
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 12:17:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C1710E274;
	Sat, 11 Nov 2023 11:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3EC689F63
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 11:17:29 +0000 (UTC)
X-UUID: e4737822808311ee8051498923ad61e6-20231111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=X8JOOUTp0NTHKO7GSOSzEB0gVa+VyTzE5X5bnBxrEY8=; 
 b=XUuyYYiYt5xMcUzBEJBnVk2Wda+9Ihp7ekvPPrNZJ9bSysdas5EGtMwCOgp/HdlEPeqym4FggrmL9nFZZPWfGFieQ5+y2NvBtAwed5vJl6lWaTwg1AWccpLsmXrYdcqZ07yxuDqcaOTkpP/eg5s0gfA37P9SbuwrJQPxgi2tWU4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33, REQID:44f3e6ea-67db-49ba-b801-0f42751aafc0, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:364b77b, CLOUDID:1c6769fc-4a48-46e2-b946-12f04f20af8c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e4737822808311ee8051498923ad61e6-20231111
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1633324757; Sat, 11 Nov 2023 19:17:25 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 11 Nov 2023 19:17:24 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 11 Nov 2023 19:17:23 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 5/8] dma-buf: heaps: secure_heap: Add dma_ops
Date: Sat, 11 Nov 2023 19:15:56 +0800
Message-ID: <20231111111559.8218-6-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231111111559.8218-1-yong.wu@mediatek.com>
References: <20231111111559.8218-1-yong.wu@mediatek.com>
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
Cc: dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Vijayanand Jitta <quic_vjitta@quicinc.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Yong Wu <yong.wu@mediatek.com>,
 jianjiao.zeng@mediatek.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
 linux-mediatek@lists.infradead.org, Joakim Bech <joakim.bech@linaro.org>,
 tjmercier@google.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the dma_ops for this secure heap.
a) For secure buffer, cache_ops/mmap are not allowed, thus return
EPERM for them.
b) The secure buffer can't be accessed in kernel, thus it doesn't
have va/dma_address for it. Use the dma_address property to save the
"secure handle".

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/dma-buf/heaps/secure_heap.c | 120 ++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-buf/heaps/secure_heap.c
index 05062c14e7c7..25cc95442c56 100644
--- a/drivers/dma-buf/heaps/secure_heap.c
+++ b/drivers/dma-buf/heaps/secure_heap.c
@@ -9,6 +9,7 @@
 #include <linux/dma-heap.h>
 #include <linux/err.h>
 #include <linux/module.h>
+#include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/tee_drv.h>
 #include <linux/uuid.h>
@@ -87,6 +88,10 @@ struct secure_heap {
 	const struct secure_heap_prv_data *data;
 };
 
+struct secure_heap_attachment {
+	struct sg_table			*table;
+};
+
 static int tee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
 {
 	const struct secure_heap_prv_data *d = data;
@@ -238,6 +243,120 @@ static void secure_heap_secure_memory_free(struct secure_heap *sec_heap,
 		data->memory_free(sec_heap, sec_buf);
 }
 
+static int secure_heap_attach(struct dma_buf *dmabuf, struct dma_buf_attachment *attachment)
+{
+	struct secure_buffer *sec_buf = dmabuf->priv;
+	struct secure_heap_attachment *a;
+	struct sg_table *table;
+	int ret;
+
+	a = kzalloc(sizeof(*a), GFP_KERNEL);
+	if (!a)
+		return -ENOMEM;
+
+	table = kzalloc(sizeof(*table), GFP_KERNEL);
+	if (!table) {
+		ret = -ENOMEM;
+		goto err_free_attach;
+	}
+
+	ret = sg_alloc_table(table, 1, GFP_KERNEL);
+	if (ret)
+		goto err_free_sgt;
+	sg_set_page(table->sgl, 0, sec_buf->size, 0);
+
+	a->table = table;
+	attachment->priv = a;
+
+	return 0;
+
+err_free_sgt:
+	kfree(table);
+err_free_attach:
+	kfree(a);
+	return ret;
+}
+
+static void secure_heap_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attachment)
+{
+	struct secure_heap_attachment *a = attachment->priv;
+
+	sg_free_table(a->table);
+	kfree(a->table);
+	kfree(a);
+}
+
+static struct sg_table *
+secure_heap_map_dma_buf(struct dma_buf_attachment *attachment, enum dma_data_direction direction)
+{
+	struct secure_heap_attachment *a = attachment->priv;
+	struct dma_buf *dmabuf = attachment->dmabuf;
+	struct secure_buffer *sec_buf = dmabuf->priv;
+	struct sg_table *table = a->table;
+
+	/*
+	 * Technically dma_address refers to the address used by HW, But for secure buffer
+	 * we don't know its dma_address in kernel, Instead, we only know its "secure handle".
+	 * Thus use this property to save the "secure handle", and the user will use it to
+	 * obtain the real address in secure world.
+	 *
+	 * Note: CONFIG_DMA_API_DEBUG requires it to be aligned with PAGE_SIZE.
+	 */
+	if (sec_buf->sec_handle) {
+		sg_dma_address(table->sgl) = sec_buf->sec_handle;
+		sg_dma_len(table->sgl) = sec_buf->size;
+	}
+	return table;
+}
+
+static void
+secure_heap_unmap_dma_buf(struct dma_buf_attachment *attachment, struct sg_table *table,
+			  enum dma_data_direction direction)
+{
+	struct secure_heap_attachment *a = attachment->priv;
+
+	WARN_ON(a->table != table);
+	sg_dma_address(table->sgl) = 0;
+	sg_dma_len(table->sgl) = 0;
+}
+
+static int
+secure_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf, enum dma_data_direction direction)
+{
+	return -EPERM;
+}
+
+static int
+secure_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf, enum dma_data_direction direction)
+{
+	return -EPERM;
+}
+
+static int secure_heap_dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
+{
+	return -EPERM;
+}
+
+static void secure_heap_free(struct dma_buf *dmabuf)
+{
+	struct secure_buffer *sec_buf = dmabuf->priv;
+	struct secure_heap *sec_heap = dma_heap_get_drvdata(sec_buf->heap);
+
+	secure_heap_secure_memory_free(sec_heap, sec_buf);
+	kfree(sec_buf);
+}
+
+static const struct dma_buf_ops sec_heap_buf_ops = {
+	.attach		= secure_heap_attach,
+	.detach		= secure_heap_detach,
+	.map_dma_buf	= secure_heap_map_dma_buf,
+	.unmap_dma_buf	= secure_heap_unmap_dma_buf,
+	.begin_cpu_access = secure_heap_dma_buf_begin_cpu_access,
+	.end_cpu_access	= secure_heap_dma_buf_end_cpu_access,
+	.mmap		= secure_heap_dma_buf_mmap,
+	.release	= secure_heap_free,
+};
+
 static struct dma_buf *
 secure_heap_allocate(struct dma_heap *heap, unsigned long size,
 		     unsigned long fd_flags, unsigned long heap_flags)
@@ -271,6 +390,7 @@ secure_heap_allocate(struct dma_heap *heap, unsigned long size,
 	if (ret)
 		goto err_free_buf;
 	exp_info.exp_name = dma_heap_get_name(heap);
+	exp_info.ops = &sec_heap_buf_ops;
 	exp_info.size = sec_buf->size;
 	exp_info.flags = fd_flags;
 	exp_info.priv = sec_buf;
-- 
2.25.1

