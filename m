Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 748F8806946
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 09:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3818110E6B7;
	Wed,  6 Dec 2023 08:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90EA910E6A8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 08:15:56 +0000 (UTC)
X-UUID: aaf104a8940f11eea33bb35ae8d461a2-20231206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JWJt5f3OFXku7W6faTUM0+bKsbswJle1HktQEF2gUcM=; 
 b=qmsJEcf1gcxXVZKE52TZontudTa1ALajZiU+nHrEtGomaYMQcxMtnDdtXlxsc5IFBEeYO/6JmfzHZNmDRYBo3JuSOHnbYgKwHC7wTdqQLWtnoYWIkk2/ExzPtTeQHPJULOI5kWODWrNLiJCZ94EUUtfEAHzm4cSFAxNZaRiTV+w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.34, REQID:48aaea10-6c14-4b9a-afcd-ef4c32c6129a, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:abefa75, CLOUDID:84e87773-1bd3-4f48-b671-ada88705968c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: aaf104a8940f11eea33bb35ae8d461a2-20231206
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 407284346; Wed, 06 Dec 2023 16:15:50 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 6 Dec 2023 16:15:49 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 6 Dec 2023 16:15:48 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
Subject: [PATCH v3,
 07/21] dma-heap: Provide accessors so that in-kernel drivers can
 allocate dmabufs from specific heaps
Date: Wed, 6 Dec 2023 16:15:24 +0800
Message-ID: <20231206081538.17056-8-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206081538.17056-1-yunfei.dong@mediatek.com>
References: <20231206081538.17056-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.817000-8.000000
X-TMASE-MatchedRID: qPZlTxuLTeftt0HEL3BUV4lD2T5imTkJ2qBSQHAh8pg0QmmUihPzrFJS
 0b8z/9TB8AyWk2NFMNbijpjet3oGSJCoy9iDotiwNNHZMWDTEbe4UO5+xwKkcStjI02a+7m1J7o
 vlkPXpS3VaZR68ynk9lCRaYaDm6fHBCaQyxlaPkG3D7EeeyZCMzGZtPrBBPZrEvoxTu3fj1tEe5
 BdjBKTALjfysYMcGyRGce8edCRlYkmcsJib2IjaaOuVibdZNTv7yWPaQc4INQOkJQR4QWbsG+3c
 txX3zZNo2jEjZ+uot1HVle6mAl0da+/EguYor8cFEUknJ/kEl7dB/CxWTRRu9bFCwAgdKkSZVhc
 Zw1+0o4U24haPFkSUhqL6AAGbHEsKH3Be5ENxfV32uEPMy/F85RMZUCEHkRt
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.817000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: EB500FF3E1D7DEEA103A36D1DC445ABF71A2717DCC195B612B7AC5653DC6DC132000:8
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
 linux-mediatek@lists.infradead.org, "T
 . J . Mercier" <tjmercier@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Yong Wu <yong.wu@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Stultz <jstultz@google.com>

This allows drivers who don't want to create their own
DMA-BUF exporter to be able to allocate DMA-BUFs directly
from existing DMA-BUF Heaps.

There is some concern that the premise of DMA-BUF heaps is
that userland knows better about what type of heap memory
is needed for a pipeline, so it would likely be best for
drivers to import and fill DMA-BUFs allocated by userland
instead of allocating one themselves, but this is still
up for debate.

Signed-off-by: John Stultz <jstultz@google.com>
Signed-off-by: T.J. Mercier <tjmercier@google.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
[Yong: Fix the checkpatch alignment warning]
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 drivers/dma-buf/dma-heap.c | 83 ++++++++++++++++++++++++++++++--------
 include/linux/dma-heap.h   |  6 +++
 2 files changed, 73 insertions(+), 16 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 97025ee8500f..6efe833a4b10 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -51,12 +51,24 @@ static dev_t dma_heap_devt;
 static struct class *dma_heap_class;
 static DEFINE_XARRAY_ALLOC(dma_heap_minors);
 
-static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
-				 unsigned int fd_flags,
-				 unsigned int heap_flags)
+/**
+ * dma_heap_buffer_alloc - Allocate dma-buf from a dma_heap
+ * @heap:	DMA-Heap to allocate from
+ * @len:	size to allocate in bytes
+ * @fd_flags:	flags to set on returned dma-buf fd
+ * @heap_flags: flags to pass to the dma heap
+ *
+ * This is for internal dma-buf allocations only. Free returned buffers with dma_buf_put().
+ */
+struct dma_buf *dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
+				      unsigned int fd_flags,
+				      unsigned int heap_flags)
 {
-	struct dma_buf *dmabuf;
-	int fd;
+	if (fd_flags & ~DMA_HEAP_VALID_FD_FLAGS)
+		return ERR_PTR(-EINVAL);
+
+	if (heap_flags & ~DMA_HEAP_VALID_HEAP_FLAGS)
+		return ERR_PTR(-EINVAL);
 
 	/*
 	 * Allocations from all heaps have to begin
@@ -64,9 +76,20 @@ static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
 	 */
 	len = PAGE_ALIGN(len);
 	if (!len)
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
+
+	return heap->ops->allocate(heap, len, fd_flags, heap_flags);
+}
+EXPORT_SYMBOL_GPL(dma_heap_buffer_alloc);
 
-	dmabuf = heap->ops->allocate(heap, len, fd_flags, heap_flags);
+static int dma_heap_bufferfd_alloc(struct dma_heap *heap, size_t len,
+				   unsigned int fd_flags,
+				   unsigned int heap_flags)
+{
+	struct dma_buf *dmabuf;
+	int fd;
+
+	dmabuf = dma_heap_buffer_alloc(heap, len, fd_flags, heap_flags);
 	if (IS_ERR(dmabuf))
 		return PTR_ERR(dmabuf);
 
@@ -104,15 +127,9 @@ static long dma_heap_ioctl_allocate(struct file *file, void *data)
 	if (heap_allocation->fd)
 		return -EINVAL;
 
-	if (heap_allocation->fd_flags & ~DMA_HEAP_VALID_FD_FLAGS)
-		return -EINVAL;
-
-	if (heap_allocation->heap_flags & ~DMA_HEAP_VALID_HEAP_FLAGS)
-		return -EINVAL;
-
-	fd = dma_heap_buffer_alloc(heap, heap_allocation->len,
-				   heap_allocation->fd_flags,
-				   heap_allocation->heap_flags);
+	fd = dma_heap_bufferfd_alloc(heap, heap_allocation->len,
+				     heap_allocation->fd_flags,
+				     heap_allocation->heap_flags);
 	if (fd < 0)
 		return fd;
 
@@ -205,6 +222,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
 {
 	return heap->priv;
 }
+EXPORT_SYMBOL_GPL(dma_heap_get_drvdata);
 
 /**
  * dma_heap_get_name - get heap name
@@ -217,6 +235,7 @@ const char *dma_heap_get_name(struct dma_heap *heap)
 {
 	return heap->name;
 }
+EXPORT_SYMBOL_GPL(dma_heap_get_name);
 
 /**
  * dma_heap_add - adds a heap to dmabuf heaps
@@ -307,6 +326,37 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 	kfree(heap);
 	return err_ret;
 }
+EXPORT_SYMBOL_GPL(dma_heap_add);
+
+/**
+ * dma_heap_find - get the heap registered with the specified name
+ * @name: Name of the DMA-Heap to find
+ *
+ * Returns:
+ * The DMA-Heap with the provided name.
+ *
+ * NOTE: DMA-Heaps returned from this function MUST be released using
+ * dma_heap_put() when the user is done to enable the heap to be unloaded.
+ */
+struct dma_heap *dma_heap_find(const char *name)
+{
+	struct dma_heap *h;
+
+	mutex_lock(&heap_list_lock);
+	list_for_each_entry(h, &heap_list, list) {
+		if (!kref_get_unless_zero(&h->refcount))
+			continue;
+
+		if (!strcmp(h->name, name)) {
+			mutex_unlock(&heap_list_lock);
+			return h;
+		}
+		dma_heap_put(h);
+	}
+	mutex_unlock(&heap_list_lock);
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(dma_heap_find);
 
 static void dma_heap_release(struct kref *ref)
 {
@@ -332,6 +382,7 @@ void dma_heap_put(struct dma_heap *heap)
 {
 	kref_put(&heap->refcount, dma_heap_release);
 }
+EXPORT_SYMBOL_GPL(dma_heap_put);
 
 static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
 {
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index d57593f8a1bc..3cbf9bff2346 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -46,6 +46,12 @@ const char *dma_heap_get_name(struct dma_heap *heap);
 
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
 
+struct dma_heap *dma_heap_find(const char *name);
+
 void dma_heap_put(struct dma_heap *heap);
 
+struct dma_buf *dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
+				      unsigned int fd_flags,
+				      unsigned int heap_flags);
+
 #endif /* _DMA_HEAPS_H */
-- 
2.18.0

