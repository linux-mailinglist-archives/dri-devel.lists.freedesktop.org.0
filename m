Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7699345E8DA
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 08:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B974A6E5D3;
	Fri, 26 Nov 2021 07:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC1D6E5D3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 07:48:45 +0000 (UTC)
X-UUID: 7dea0e9ce0d44794bebfb2a2117cd8c3-20211126
X-UUID: 7dea0e9ce0d44794bebfb2a2117cd8c3-20211126
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <guangming.cao@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 396952874; Fri, 26 Nov 2021 15:48:41 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 26 Nov 2021 15:48:39 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 26 Nov 2021 15:48:38 +0800
From: <guangming.cao@mediatek.com>
To: <greg@kroah.com>
Subject: [PATCH v4] dma-buf: system_heap: Use 'for_each_sgtable_sg' in pages
 free flow
Date: Fri, 26 Nov 2021 15:49:04 +0800
Message-ID: <20211126074904.88388-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <YaB/JHP/pMbgRJ1O@kroah.com>
References: <YaB/JHP/pMbgRJ1O@kroah.com>
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
 kuan-ying.lee@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, lmark@codeaurora.org,
 benjamin.gaignard@linaro.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, stable@vger.kernel.org, labbott@redhat.com,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Guangming <Guangming.Cao@mediatek.com>

For previous version, it uses 'sg_table.nent's to traverse sg_table in pages
free flow.
However, 'sg_table.nents' is reassigned in 'dma_map_sg', it means the number of
created entries in the DMA adderess space.
So, use 'sg_table.nents' in pages free flow will case some pages can't be freed.

Here we should use sg_table.orig_nents to free pages memory, but use the
sgtable helper 'for each_sgtable_sg'(, instead of the previous rather common
helper 'for_each_sg' which maybe cause memory leak) is much better.

Fixes: d963ab0f15fb0 ("dma-buf: system_heap: Allocate higher order pages if available")
Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Cc: <stable@vger.kernel.org> # 5.11.*
---
v4: Correct commit message
    1. Cc stable@vger.kernel.org in commit message and add required kernel version.
    2. Add reviewed-by since patch V2 and V4 are same and V2 is reviewed by Robin.
    3. There is no new code change in V4.
V3: Cc stable@vger.kernel.org
    1. This patch needs to be merged stable branch, add stable@vger.kernel.org
       in mail list.
    2. Correct some spelling mistake.
    3. There is No new code change in V3.
V2: use 'for_each_sgtable_sg' to 'replece for_each_sg' as suggested by Robin.

---
 drivers/dma-buf/heaps/system_heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 23a7e74ef966..8660508f3684 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -289,7 +289,7 @@ static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
 	int i;
 
 	table = &buffer->sg_table;
-	for_each_sg(table->sgl, sg, table->nents, i) {
+	for_each_sgtable_sg(table, sg, i) {
 		struct page *page = sg_page(sg);
 
 		__free_pages(page, compound_order(page));
-- 
2.17.1

