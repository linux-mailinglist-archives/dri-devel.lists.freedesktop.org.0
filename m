Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ADB3E50D5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 04:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E13A8987C;
	Tue, 10 Aug 2021 02:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611BE8987C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 02:03:01 +0000 (UTC)
X-UUID: 4f872159f7fe47af935b8076192d21f4-20210810
X-UUID: 4f872159f7fe47af935b8076192d21f4-20210810
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1785707904; Tue, 10 Aug 2021 10:02:57 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Aug 2021 10:02:56 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas07.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 10 Aug 2021 10:02:55 +0800
From: <guangming.cao@mediatek.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>, Liam Mark <lmark@codeaurora.org>, Laura
 Abbott <labbott@redhat.com>, Brian Starkey <Brian.Starkey@arm.com>, John
 Stultz <john.stultz@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>, "open
 list:DMA-BUF HEAPS FRAMEWORK" <linux-media@vger.kernel.org>, "open
 list:DMA-BUF HEAPS FRAMEWORK" <dri-devel@lists.freedesktop.org>, "moderated
 list:DMA-BUF HEAPS FRAMEWORK" <linaro-mm-sig@lists.linaro.org>, open list
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
CC: <wsd_upstream@mediatek.com>, Guangming Cao <Guangming.Cao@mediatek.com>
Subject: [PATCH] dma_heap: enable map_attrs when (un)map_attachment
Date: Tue, 10 Aug 2021 10:02:54 +0800
Message-ID: <20210810020254.103134-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210721094314.117413-1-guangming.cao@mediatek.com>
References: <20210721094314.117413-1-guangming.cao@mediatek.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Guangming Cao <Guangming.Cao@mediatek.com>

For dma-heap users, they can't bypass cache sync when (un)map
iova with dma heap. But they can do it by adding
DMA_ATTR_SKIP_CPU_SYNC into dma_alloc_attrs.

To Keep alignment, add map_attrs support for dma_heap when
(un)map_attachment.

Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
---
 drivers/dma-buf/heaps/cma_heap.c    | 6 ++++--
 drivers/dma-buf/heaps/system_heap.c | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 0c05b79870f9..2c9feb3bfc3e 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -99,9 +99,10 @@ static struct sg_table *cma_heap_map_dma_buf(struct dma_buf_attachment *attachme
 {
 	struct dma_heap_attachment *a = attachment->priv;
 	struct sg_table *table = &a->table;
+	int attrs = attachment->dma_map_attrs;
 	int ret;
 
-	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
+	ret = dma_map_sgtable(attachment->dev, table, direction, attrs);
 	if (ret)
 		return ERR_PTR(-ENOMEM);
 	a->mapped = true;
@@ -113,9 +114,10 @@ static void cma_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
 				   enum dma_data_direction direction)
 {
 	struct dma_heap_attachment *a = attachment->priv;
+	int attrs = attachment->dma_map_attrs;
 
 	a->mapped = false;
-	dma_unmap_sgtable(attachment->dev, table, direction, 0);
+	dma_unmap_sgtable(attachment->dev, table, direction, attrs);
 }
 
 static int cma_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 23a7e74ef966..fc7b1e02988e 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -130,9 +130,10 @@ static struct sg_table *system_heap_map_dma_buf(struct dma_buf_attachment *attac
 {
 	struct dma_heap_attachment *a = attachment->priv;
 	struct sg_table *table = a->table;
+	int attrs = attachment->dma_map_attrs;
 	int ret;
 
-	ret = dma_map_sgtable(attachment->dev, table, direction, 0);
+	ret = dma_map_sgtable(attachment->dev, table, direction, attrs);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -145,9 +146,10 @@ static void system_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
 				      enum dma_data_direction direction)
 {
 	struct dma_heap_attachment *a = attachment->priv;
+	int attrs = attachment->dma_map_attrs;
 
 	a->mapped = false;
-	dma_unmap_sgtable(attachment->dev, table, direction, 0);
+	dma_unmap_sgtable(attachment->dev, table, direction, attrs);
 }
 
 static int system_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
-- 
2.17.1

