Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A647E48D807
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 13:33:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5499510E934;
	Thu, 13 Jan 2022 12:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0340810E934
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 12:33:26 +0000 (UTC)
X-UUID: a357bcd85de4422e9e90e55554a8dd4d-20220113
X-UUID: a357bcd85de4422e9e90e55554a8dd4d-20220113
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1167861225; Thu, 13 Jan 2022 20:33:19 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 13 Jan 2022 20:33:17 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 13 Jan 2022 20:33:16 +0800
From: <guangming.cao@mediatek.com>
To: <sumit.semwal@linaro.org>
Subject: [PATCH v3] dma-buf: dma-heap: Add a size check for allocation
Date: Thu, 13 Jan 2022 20:34:06 +0800
Message-ID: <20220113123406.11520-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAO_48GF=ttKqSOm9GRoA3Mq+-RQOtRjWp449XPcz-wH=kjaTjw@mail.gmail.com>
References: <CAO_48GF=ttKqSOm9GRoA3Mq+-RQOtRjWp449XPcz-wH=kjaTjw@mail.gmail.com>
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
Cc: linux-arm-kernel@lists.infradead.org, mingyuan.ma@mediatek.com,
 Guangming <Guangming.Cao@mediatek.com>, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, yf.wang@mediatek.com, libo.kang@mediatek.com,
 benjamin.gaignard@linaro.org, bo.song@mediatek.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, lmark@codeaurora.org, labbott@redhat.com,
 christian.koenig@amd.com, jianjiao.zeng@mediatek.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Guangming <Guangming.Cao@mediatek.com>

Add a size check for allocation since the allocation size is
always less than the total DRAM size.

Without this check, once the invalid size allocation runs on a process that
can't be killed by OOM flow(such as "gralloc" on Android devices), it will
cause a kernel exception, and to make matters worse, we can't find who are using
so many memory with "dma_buf_debug_show" since the relevant dma-buf hasn't exported.

To make OOM issue easier, maybe need dma-buf framework to dump the buffer size
under allocating in "dma_buf_debug_show".

Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
Signed-off-by: jianjiao zeng <jianjiao.zeng@mediatek.com>
---
v3: 1. update patch, use right shift to replace division.
    2. update patch, add reason in code and commit message.
v2: 1. update size limitation as total_dram page size.
    2. update commit message
---
 drivers/dma-buf/dma-heap.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 56bf5ad01ad5..1fd382712584 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -55,6 +55,16 @@ static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
 	struct dma_buf *dmabuf;
 	int fd;
 
+	/*
+	 * Invalid size check. The "len" should be less than totalram.
+	 *
+	 * Without this check, once the invalid size allocation runs on a process that
+	 * can't be killed by OOM flow(such as "gralloc" on Android devices), it will
+	 * cause a kernel exception, and to make matters worse, we can't find who are using
+	 * so many memory with "dma_buf_debug_show" since the relevant dma-buf hasn't exported.
+	 */
+	if (len >> PAGE_SHIFT > totalram_pages())
+		return -EINVAL;
 	/*
 	 * Allocations from all heaps have to begin
 	 * and end on page boundaries.
-- 
2.17.1

