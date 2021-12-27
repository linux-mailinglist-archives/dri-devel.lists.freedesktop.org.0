Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D38A47FB8F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Dec 2021 10:46:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84BAD10EDA7;
	Mon, 27 Dec 2021 09:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0488810EDA7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Dec 2021 09:46:40 +0000 (UTC)
X-UUID: dc751a024c3740ce9ade90befab2b52b-20211227
X-UUID: dc751a024c3740ce9ade90befab2b52b-20211227
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <guangming.cao@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1420548967; Mon, 27 Dec 2021 17:46:35 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 27 Dec 2021 17:46:34 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 27 Dec 2021 17:46:33 +0800
From: <guangming.cao@mediatek.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>, Liam Mark <lmark@codeaurora.org>, "Laura
 Abbott" <labbott@redhat.com>, Brian Starkey <Brian.Starkey@arm.com>, "John
 Stultz" <john.stultz@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>, "open
 list:DMA-BUF HEAPS FRAMEWORK" <linux-media@vger.kernel.org>, "open
 list:DMA-BUF HEAPS FRAMEWORK" <dri-devel@lists.freedesktop.org>, "moderated
 list:DMA-BUF HEAPS FRAMEWORK" <linaro-mm-sig@lists.linaro.org>, open list
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2] dma-buf: dma-heap: Add a size check for allocation
Date: Mon, 27 Dec 2021 17:47:16 +0800
Message-ID: <20211227094716.5870-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Guangming <Guangming.Cao@mediatek.com>, wsd_upstream@mediatek.com,
 Yunfei Wang <yf.wang@mediatek.com>, Libo Kang <libo.kang@mediatek.com>,
 Bo Song <bo.song@mediatek.com>, mingyuan ma <mingyuan.ma@mediatek.com>,
 jianjiao zeng <jianjiao.zeng@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Guangming <Guangming.Cao@mediatek.com>

Add a size check for allcation since the allocation size is
always less than the total DRAM size.

Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
Signed-off-by: jianjiao zeng <jianjiao.zeng@mediatek.com>
---
v2: 1. update size limitation as total_dram page size.
    2. update commit message
---
 drivers/dma-buf/dma-heap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 56bf5ad01ad5..e39d2be98d69 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -55,6 +55,8 @@ static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
 	struct dma_buf *dmabuf;
 	int fd;
 
+	if (len / PAGE_SIZE > totalram_pages())
+		return -EINVAL;
 	/*
 	 * Allocations from all heaps have to begin
 	 * and end on page boundaries.
-- 
2.17.1

