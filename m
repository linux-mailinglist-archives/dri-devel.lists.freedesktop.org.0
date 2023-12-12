Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2834B80E21B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 03:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B8610E543;
	Tue, 12 Dec 2023 02:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283CE10E543
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 02:47:09 +0000 (UTC)
X-UUID: bbbcb8ee989811eea5db2bebc7c28f94-20231212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=XaRVYF8RVa6s7Wemh4dazulTChOg4lLt+vsRrGuQUj4=; 
 b=BFB+oMIf/BIzlTyrBdIqaKeXAF8d8xA8p7r4YsxvGraZAX8gpf/wAlQ0FFfh09HrfZauTeqJL5gflLE5kLNT0HAtvWdaiFgMkULWuAEwb0+sAdApCsQu5tObjZf+t0J4oSyHGb/w3d/Oho/iyKKad6zUn/fUgTzbEdTvJFAs1FE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:52d011f7-fb57-4b15-a7b8-9409b9225b78, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:5d391d7, CLOUDID:1d87ad73-1bd3-4f48-b671-ada88705968c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: bbbcb8ee989811eea5db2bebc7c28f94-20231212
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1573079492; Tue, 12 Dec 2023 10:47:04 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Dec 2023 10:47:03 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Dec 2023 10:47:02 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 4/7] dma-buf: heaps: secure_heap: Add dma_ops
Date: Tue, 12 Dec 2023 10:46:04 +0800
Message-ID: <20231212024607.3681-5-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212024607.3681-1-yong.wu@mediatek.com>
References: <20231212024607.3681-1-yong.wu@mediatek.com>
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

Add the dma_ops for this secure heap. For secure buffer, cache_ops/mmap
are not allowed, thus return EPERM for them.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/dma-buf/heaps/secure_heap.c | 103 ++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-buf/heaps/secure_heap.c
index 925cf8e1c7ce..7cb4db3e55c2 100644
--- a/drivers/dma-buf/heaps/secure_heap.c
+++ b/drivers/dma-buf/heaps/secure_heap.c
@@ -12,6 +12,10 @@
 
 #include "secure_heap.h"
 
+struct secure_heap_attachment {
+	struct sg_table			*table;
+};
+
 static int secure_heap_memory_allocate(struct secure_heap *sec_heap, struct secure_buffer *sec_buf)
 {
 	const struct secure_heap_ops *ops = sec_heap->ops;
@@ -43,6 +47,104 @@ static void secure_heap_memory_free(struct secure_heap *sec_heap, struct secure_
 	ops->memory_free(sec_heap, sec_buf);
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
+	sg_set_page(table->sgl, NULL, sec_buf->size, 0);
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
+	struct sg_table *table = a->table;
+
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
+	secure_heap_memory_free(sec_heap, sec_buf);
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
@@ -64,6 +166,7 @@ secure_heap_allocate(struct dma_heap *heap, unsigned long size,
 	if (ret)
 		goto err_free_buf;
 	exp_info.exp_name = dma_heap_get_name(heap);
+	exp_info.ops = &sec_heap_buf_ops;
 	exp_info.size = sec_buf->size;
 	exp_info.flags = fd_flags;
 	exp_info.priv = sec_buf;
-- 
2.25.1

