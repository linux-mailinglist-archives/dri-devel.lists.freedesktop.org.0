Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1015887D7
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 09:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDBD310E98E;
	Wed,  3 Aug 2022 07:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2059.outbound.protection.outlook.com [40.107.20.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F792AED8
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 09:58:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAyb09nd/oxYF2HHyOIzdifj0LwovxhxsMt7wXDaqTlxUEFyWDTDM6m1scRQ8wHiQ1WBfOtcrqGaa78E1xs3JnpXLw7gaKKJO93/h0pm7bo4w9TdMf+xNAUeoPiB6RvLp3WrVrZ+juMrL6asbgji88a2BXX8PrEOarbKpxFO7sbbsc23SoXnlW/DnBEQ+2JjzEVHXvLsYxxsFBlBSkUArnuwLvzk28aZRVlcdmKVgnYhCzJ+UyT9qPh+KI9mcLzZtwCv4vqnHasu2BWQ1ZDTtpFMRu9Yq2BvYquilgYFiuJF9hMaPNC6Fsf75yTaw2ULumnZhdZ8i0b4piJ30bZx/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lk8z61pSjUyn51VI9T8eBY3Ubnc7j16YLC8/9J63+4k=;
 b=QbOSOWbZqt9CSWaMF3aM57bneDYWJiYnTesycTAhzldKkP4I+TbVYme0xwn1dXPzWtCDsmsE47qMMZeh7f3elC2f+jJRp/wIheNIAkuwl9jTuDw65orE4fmzTApK4+mi2YUpB3iVm2hLWA6DiDueFixrN8VV77MrJG0s5YJVhgGkAVhFvcknKIG05iVYSJTDjWOWJemMeMRk8oNIvm28OIBJzEh6j5XHU+blTyoKMXYCUDAHNAHdIvgxgSlHs7Erxi8XIqKRb5ecXOtMV/acHmhiCr63nIx9ohhiRss29JuYOOU9x5FNFUJFr8KB/shgfVWjahjqeZTHxABM/jiFXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lk8z61pSjUyn51VI9T8eBY3Ubnc7j16YLC8/9J63+4k=;
 b=YA7144S06dZgXkQvxUNM6dW3kpWhC6nCiaxX0loZw7Qhd9V2vF6QQmCC5aTQsTuRIDqhp+1Ml42Sk7mzz1qcTj7UrCTfIUsuOwk1UKwBwevk6f5MADQxvS54ktEUy/KYAN1RApfRj/8WmcYERY2dXxOCTLsRiKWJDMpVEA0nHNU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6737.eurprd04.prod.outlook.com (2603:10a6:208:176::18)
 by AS8PR04MB8341.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Tue, 2 Aug
 2022 09:58:53 +0000
Received: from AM0PR04MB6737.eurprd04.prod.outlook.com
 ([fe80::6ca7:299e:d92f:7d1b]) by AM0PR04MB6737.eurprd04.prod.outlook.com
 ([fe80::6ca7:299e:d92f:7d1b%5]) with mapi id 15.20.5482.011; Tue, 2 Aug 2022
 09:58:52 +0000
From: Olivier Masse <olivier.masse@nxp.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, christian.koenig@amd.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] dma-buf: heaps: add Linaro secure dmabuf heap support
Date: Tue,  2 Aug 2022 11:58:41 +0200
Message-Id: <20220802095843.14614-4-olivier.masse@nxp.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20220802095843.14614-1-olivier.masse@nxp.com>
References: <20220802095843.14614-1-olivier.masse@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM3PR07CA0145.eurprd07.prod.outlook.com
 (2603:10a6:207:8::31) To AM0PR04MB6737.eurprd04.prod.outlook.com
 (2603:10a6:208:176::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c3323bc-c935-4a49-c419-08da746d9af5
X-MS-TrafficTypeDiagnostic: AS8PR04MB8341:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3VJUOiXuJkxZk8uXTbdXPV4FOnmukCl8oeyHT5nadlKsz0HcrdrGP6BMBg9k8LNP/szZyemJw9O0FMhCWDEvpFtLSh+gMpGDyBs0cmW7RTfScuCXk9zL5BLly5jGM0zKCuuGRJo3xGkovLqdbmZVXSe+fqCJ+Z41q+Nqgz/xJqR08xljDh+TO5O8usZan9hk+Sxk8Z8siPQ1cuZh/No+p9qvTBNhjDeXsEVfBnykivqvnv1hfKdoiZ5uvUeENN/OoVHzkprl7lVOppE6aXxbl9zTyZTbJjM4llpqV80PvHStiJEFnuWOJ0W491mQADDzfwWjRl4KZ/TlU+VBnjLn5485X25Z6tsI9x9mvy63gbxrmU5b7uh5wscDyJ5AeHQMeE1p0IRGcQUO4eCrttRMB/UMX9gDSauSRnAgePiLDkOqhEtnGr5czIc2lGFNro8m3G6NsqEiWZTjARFTlj81jUU/Fw6VROLRGT6VonHcXmuQbpXZlwG68JlMISyUaMpv8EPJ7AHSgTeoeuLMwwAKfNNM2kNvMP3yZ93GtFP9FcoDRgrqdEh9FAFVr/h9p2sGi9r7MiVjUukubC7jTXNjQu38EZViEImwFj2sw0Su6PRdt3PSgpq/kQ4a1Oy+Vf+ROleCIz5rwWyPoCS3/YTD8+w71IOsB+b97lgALabIMjGK5JIhmKq1jPfU/QffkaoF3/Qu7/y1G+j2zWeVMLGFfFNZC9AOa56N3lkx4A8Ux6kYXXRmU6ddE95osjDYmBMa6kJOnec5cSmakaibUcDkICrJxLA2WDfPUQEUavFnYiE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB6737.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(366004)(136003)(39860400002)(376002)(41300700001)(2906002)(83380400001)(2616005)(86362001)(6666004)(52116002)(6506007)(44832011)(1076003)(30864003)(36756003)(26005)(6512007)(38100700002)(186003)(38350700002)(6486002)(5660300002)(8676002)(66556008)(66476007)(66946007)(8936002)(478600001)(4326008)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RtVU1wcVxH2WPoDSDnZpQBbfWhWRfIPe6FnRQ7p++u0XGdPj4XSUEXTVKgDl?=
 =?us-ascii?Q?LzeS2YpSiRdr0jC9mIPLl5PW24quP5nL1My5IdzE3v0VUeejF/shnTIRRBsq?=
 =?us-ascii?Q?U85eUoqHND56TVMb967kNmLxTzqykXCyXJ2K/QN0iHTBGjjV++Xa25Lq9+7k?=
 =?us-ascii?Q?iTqAcfq/U7p1jELq0X4EhZu/sddsSjZPFtOMYRjt3dYyX334bH7Grkw6yTNI?=
 =?us-ascii?Q?UftV1T5QXmBPprTs0ASfj48ao/UBJ2kEGI7WHw87y8vL+5C61QoyOj7YCIYM?=
 =?us-ascii?Q?0J6xMrau+6Xn7EoBBV/3GtNUTQPTO/hhvtktZqvQDAWTl8cGe7S2QMVHJik7?=
 =?us-ascii?Q?CAsTvJomGuf/kNMI+Taph562icO3aU3B7olQK8eqf1HYtX0Sy0707qZDnMqe?=
 =?us-ascii?Q?wQ0NyObvc6lNx8x69Xn3uXtxCsAx0Libe3t9onPVleqEN7Q6QKll2JX2DS0Y?=
 =?us-ascii?Q?jLy5Vn4I62LUzOgdF/13NBZuce5AXH15ALjDNCuDJZO7DLS7KXlEKXd9MSmW?=
 =?us-ascii?Q?zeH03se8unc46J01XdIzQc4S1JCOMfo7eunCeal3Rrdr5IwtJgjFHeADX8sg?=
 =?us-ascii?Q?gtoi/kFmj5Ma54cINZZ/HWLw2vBHonSvWMjRZUASY7xxhTnIcRuaUiJewRDG?=
 =?us-ascii?Q?eb3n+JeXjm2Q9TnywQ8EhHHLmQ8k95KD9n3zdIf+vmMpxwKm5VNizjsbjvXa?=
 =?us-ascii?Q?6sBLZfdrbmTzEYdZHF34qQLeL9aKZR0p9e5gP/mkL+nm3ErvWWQJ+zJMiMuj?=
 =?us-ascii?Q?lUy6lZAEqJdfGlTYGpv5vMajU7dydV7kQ5TvSVllBgEtx4im9yddIX8jC+fl?=
 =?us-ascii?Q?DvxZhMlrdghftDRn8cyX7tyancVrQ3qLnva+cEvGdT+TNtErCFZFTHmPUCjA?=
 =?us-ascii?Q?ON36S0sZ51J2YCvDoytDlUf/IK9fgdST+fOwZBSMNgfzppMyBBN6QBoihyKi?=
 =?us-ascii?Q?QrLotc/gboFily66xwP9fEl9UHkyxFMJx2FNXVfo51gLxXIM5jKFHjmQsOGv?=
 =?us-ascii?Q?J0yXb6wkQkJ3lHEYPj3+alov26D/uA9zJyGBtC5y0xoWDHd0eSrpBuwKQPPD?=
 =?us-ascii?Q?S1uo/LgzQ772Oa7ilsKe1qFqR0my93le5bSiqE7NZVycRsRKWV/wY6SjSV/p?=
 =?us-ascii?Q?eRgKfy1TYPcntr2sEFzUFDWTA1OZBCjS2PAtlYUr5EomTkh4l3v2cQmHjTLU?=
 =?us-ascii?Q?/cqHzW65Dco+r6zBV1n5wxpXPRsYK+1pamqZGhPVgT8hFRE3/FEuIgh+TA7c?=
 =?us-ascii?Q?5tYgxJ5o41gWMq0AIf3F5DnlI3eIAvi/zVDOGie9zpAt3B1d0RQWXp9jqiox?=
 =?us-ascii?Q?rUHpHupY8UWenF2CNqWfA74HrXZ1BQMoQkuVh//oFlu23SPMVsm1pONWTYmf?=
 =?us-ascii?Q?QpNaaY14TVJhEdU/JUZp5yyzU8UvY2F+c+xtaCXs6SrW6ncb8z+wxcRuP+SY?=
 =?us-ascii?Q?0YglghD2tkplp3OpnUwyQ//9+f6TkzBbIgOPLXb7WZ20bWlEQtizrtgWc74c?=
 =?us-ascii?Q?6G3Q1SrUiKvrFiwri5r6P3o3RQL3rNBp99ktsiYEC2OdZPSl4sa7XdOm6huG?=
 =?us-ascii?Q?V1ny4KB8u+BULo8JBl/lGC1sP747f8Zerucrwwyb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c3323bc-c935-4a49-c419-08da746d9af5
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 09:58:52.8901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IslUwqqCqgJank03GR1fwYylWB6A1KouinKSk9UMpkq1K5CY/N/sS+MTz/sdJ2R8CtYtciIzIOkcnMffkM9wfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8341
X-Mailman-Approved-At: Wed, 03 Aug 2022 07:21:27 +0000
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
Cc: clement.faure@nxp.com, olivier.masse@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

add Linaro secure heap bindings: linaro,secure-heap
use genalloc to allocate/free buffer from buffer pool.
buffer pool info is from dts.
use sg_table instore the allocated memory info, the length of sg_table is 1.
implement secure_heap_buf_ops to implement buffer share in difference device:
1. Userspace passes this fd to all drivers it wants this buffer
to share with: First the filedescriptor is converted to a &dma_buf using
dma_buf_get(). Then the buffer is attached to the device using dma_buf_attach().
2. Once the buffer is attached to all devices userspace can initiate DMA
access to the shared buffer. In the kernel this is done by calling dma_buf_map_attachment()
3. get sg_table with dma_buf_map_attachment in difference device.

Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
---
 drivers/dma-buf/heaps/Kconfig       |  21 +-
 drivers/dma-buf/heaps/Makefile      |   1 +
 drivers/dma-buf/heaps/secure_heap.c | 588 ++++++++++++++++++++++++++++
 3 files changed, 606 insertions(+), 4 deletions(-)
 create mode 100644 drivers/dma-buf/heaps/secure_heap.c

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index 6a33193a7b3e..b2406932192e 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -1,8 +1,12 @@
-config DMABUF_HEAPS_DEFERRED_FREE
-	tristate
+menuconfig DMABUF_HEAPS_DEFERRED_FREE
+	bool "DMA-BUF heaps deferred-free library"
+	help
+	  Choose this option to enable the DMA-BUF heaps deferred-free library.
 
-config DMABUF_HEAPS_PAGE_POOL
-	tristate
+menuconfig DMABUF_HEAPS_PAGE_POOL
+	bool "DMA-BUF heaps page-pool library"
+	help
+	  Choose this option to enable the DMA-BUF heaps page-pool library.
 
 config DMABUF_HEAPS_SYSTEM
 	bool "DMA-BUF System Heap"
@@ -26,3 +30,12 @@ config DMABUF_HEAPS_DSP
           Choose this option to enable the dsp dmabuf heap. The dsp heap
           is allocated by gen allocater. it's allocated according the dts.
           If in doubt, say Y.
+
+config DMABUF_HEAPS_SECURE
+	tristate "DMA-BUF Secure Heap"
+	depends on DMABUF_HEAPS && DMABUF_HEAPS_DEFERRED_FREE
+	help
+	  Choose this option to enable the secure dmabuf heap. The secure heap
+	  pools are defined according to the DT. Heaps are allocated
+	  in the pools using gen allocater.
+	  If in doubt, say Y.
diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
index e70722ea615e..08f6aa5919d1 100644
--- a/drivers/dma-buf/heaps/Makefile
+++ b/drivers/dma-buf/heaps/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_DMABUF_HEAPS_PAGE_POOL)	+= page_pool.o
 obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
 obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
 obj-$(CONFIG_DMABUF_HEAPS_DSP)          += dsp_heap.o
+obj-$(CONFIG_DMABUF_HEAPS_SECURE)	+= secure_heap.o
diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-buf/heaps/secure_heap.c
new file mode 100644
index 000000000000..31aac5d050b4
--- /dev/null
+++ b/drivers/dma-buf/heaps/secure_heap.c
@@ -0,0 +1,588 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DMABUF secure heap exporter
+ *
+ * Copyright 2021 NXP.
+ */
+
+#include <linux/dma-buf.h>
+#include <linux/dma-heap.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/genalloc.h>
+#include <linux/highmem.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
+
+#include "deferred-free-helper.h"
+#include "page_pool.h"
+
+#define MAX_SECURE_HEAP 2
+#define MAX_HEAP_NAME_LEN 32
+
+struct secure_heap_buffer {
+	struct dma_heap *heap;
+	struct list_head attachments;
+	struct mutex lock;
+	unsigned long len;
+	struct sg_table sg_table;
+	int vmap_cnt;
+	struct deferred_freelist_item deferred_free;
+	void *vaddr;
+	bool uncached;
+};
+
+struct dma_heap_attachment {
+	struct device *dev;
+	struct sg_table *table;
+	struct list_head list;
+	bool no_map;
+	bool mapped;
+	bool uncached;
+};
+
+struct secure_heap_info {
+	struct gen_pool *pool;
+
+	bool no_map;
+};
+
+struct rmem_secure {
+	phys_addr_t base;
+	phys_addr_t size;
+
+	char name[MAX_HEAP_NAME_LEN];
+
+	bool no_map;
+};
+
+static struct rmem_secure secure_data[MAX_SECURE_HEAP] = {0};
+static unsigned int secure_data_count;
+
+static struct sg_table *dup_sg_table(struct sg_table *table)
+{
+	struct sg_table *new_table;
+	int ret, i;
+	struct scatterlist *sg, *new_sg;
+
+	new_table = kzalloc(sizeof(*new_table), GFP_KERNEL);
+	if (!new_table)
+		return ERR_PTR(-ENOMEM);
+
+	ret = sg_alloc_table(new_table, table->orig_nents, GFP_KERNEL);
+	if (ret) {
+		kfree(new_table);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	new_sg = new_table->sgl;
+	for_each_sgtable_sg(table, sg, i) {
+		sg_set_page(new_sg, sg_page(sg), sg->length, sg->offset);
+		new_sg->dma_address = sg->dma_address;
+#ifdef CONFIG_NEED_SG_DMA_LENGTH
+		new_sg->dma_length = sg->dma_length;
+#endif
+		new_sg = sg_next(new_sg);
+	}
+
+	return new_table;
+}
+
+static int secure_heap_attach(struct dma_buf *dmabuf,
+			      struct dma_buf_attachment *attachment)
+{
+	struct secure_heap_buffer *buffer = dmabuf->priv;
+	struct secure_heap_info *info = dma_heap_get_drvdata(buffer->heap);
+	struct dma_heap_attachment *a;
+	struct sg_table *table;
+
+	a = kzalloc(sizeof(*a), GFP_KERNEL);
+	if (!a)
+		return -ENOMEM;
+
+	table = dup_sg_table(&buffer->sg_table);
+	if (IS_ERR(table)) {
+		kfree(a);
+		return -ENOMEM;
+	}
+
+	a->table = table;
+	a->dev = attachment->dev;
+	INIT_LIST_HEAD(&a->list);
+	a->no_map = info->no_map;
+	a->mapped = false;
+	a->uncached = buffer->uncached;
+	attachment->priv = a;
+
+	mutex_lock(&buffer->lock);
+	list_add(&a->list, &buffer->attachments);
+	mutex_unlock(&buffer->lock);
+
+	return 0;
+}
+
+static void secure_heap_detach(struct dma_buf *dmabuf,
+			       struct dma_buf_attachment *attachment)
+{
+	struct secure_heap_buffer *buffer = dmabuf->priv;
+	struct dma_heap_attachment *a = attachment->priv;
+
+	mutex_lock(&buffer->lock);
+	list_del(&a->list);
+	mutex_unlock(&buffer->lock);
+
+	sg_free_table(a->table);
+	kfree(a->table);
+	kfree(a);
+}
+
+static struct sg_table *secure_heap_map_dma_buf(struct dma_buf_attachment *attachment,
+						enum dma_data_direction direction)
+{
+	struct dma_heap_attachment *a = attachment->priv;
+	struct sg_table *table = a->table;
+	int attr = 0;
+	int ret;
+
+	if (!a->no_map) {
+		if (a->uncached)
+			attr = DMA_ATTR_SKIP_CPU_SYNC;
+
+		ret = dma_map_sgtable(attachment->dev, table, direction, attr);
+		if (ret)
+			return ERR_PTR(ret);
+
+		a->mapped = true;
+	}
+
+	return table;
+}
+
+static void secure_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
+				      struct sg_table *table,
+				      enum dma_data_direction direction)
+{
+	struct dma_heap_attachment *a = attachment->priv;
+	int attr = 0;
+
+	if (!a->no_map)	{
+		if (a->uncached)
+			attr = DMA_ATTR_SKIP_CPU_SYNC;
+
+		a->mapped = false;
+		dma_unmap_sgtable(attachment->dev, table, direction, attr);
+	}
+}
+
+static int secure_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
+						enum dma_data_direction direction)
+{
+	struct secure_heap_buffer *buffer = dmabuf->priv;
+	struct dma_heap_attachment *a;
+
+	mutex_lock(&buffer->lock);
+
+	if (buffer->vmap_cnt)
+		invalidate_kernel_vmap_range(buffer->vaddr, buffer->len);
+
+	if (!buffer->uncached) {
+		list_for_each_entry(a, &buffer->attachments, list) {
+			if (!a->mapped)
+				continue;
+			dma_sync_sgtable_for_cpu(a->dev, a->table, direction);
+		}
+	}
+	mutex_unlock(&buffer->lock);
+
+	return 0;
+}
+
+static int secure_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
+					      enum dma_data_direction direction)
+{
+	struct secure_heap_buffer *buffer = dmabuf->priv;
+	struct dma_heap_attachment *a;
+
+	mutex_lock(&buffer->lock);
+
+	if (buffer->vmap_cnt)
+		flush_kernel_vmap_range(buffer->vaddr, buffer->len);
+
+	if (!buffer->uncached) {
+		list_for_each_entry(a, &buffer->attachments, list) {
+			if (!a->mapped)
+				continue;
+			dma_sync_sgtable_for_device(a->dev, a->table, direction);
+		}
+	}
+	mutex_unlock(&buffer->lock);
+
+	return 0;
+}
+
+static int secure_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
+{
+	struct secure_heap_buffer *buffer = dmabuf->priv;
+	struct sg_table *table = &buffer->sg_table;
+	unsigned long addr = vma->vm_start;
+	struct sg_page_iter piter;
+	int ret;
+
+	if (buffer->uncached)
+		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
+
+	for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
+		struct page *page = sg_page_iter_page(&piter);
+
+		ret = remap_pfn_range(vma, addr, page_to_pfn(page), PAGE_SIZE,
+				      vma->vm_page_prot);
+		if (ret)
+			return ret;
+		addr += PAGE_SIZE;
+	}
+	return 0;
+}
+
+static void *secure_heap_do_vmap(struct secure_heap_buffer *buffer)
+{
+	struct sg_table *table = &buffer->sg_table;
+	int npages = PAGE_ALIGN(buffer->len) / PAGE_SIZE;
+	struct page **pages = vmalloc(sizeof(struct page *) * npages);
+	struct page **tmp = pages;
+	struct sg_page_iter piter;
+	pgprot_t pgprot = PAGE_KERNEL;
+	void *vaddr;
+
+	if (!pages)
+		return ERR_PTR(-ENOMEM);
+
+	if (buffer->uncached)
+		pgprot = pgprot_writecombine(PAGE_KERNEL);
+
+	for_each_sgtable_page(table, &piter, 0) {
+		WARN_ON(tmp - pages >= npages);
+		*tmp++ = sg_page_iter_page(&piter);
+	}
+
+	vaddr = vmap(pages, npages, VM_MAP, pgprot);
+	vfree(pages);
+
+	if (!vaddr)
+		return ERR_PTR(-ENOMEM);
+
+	return vaddr;
+}
+
+static int secure_heap_vmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
+{
+	struct secure_heap_buffer *buffer = dmabuf->priv;
+	void *vaddr;
+	int ret = 0;
+
+	mutex_lock(&buffer->lock);
+	if (buffer->vmap_cnt) {
+		buffer->vmap_cnt++;
+		goto out;
+	}
+
+	vaddr = secure_heap_do_vmap(buffer);
+	if (IS_ERR(vaddr)) {
+		ret = PTR_ERR(vaddr);
+		goto out;
+	}
+
+	buffer->vaddr = vaddr;
+	buffer->vmap_cnt++;
+	dma_buf_map_set_vaddr(map, buffer->vaddr);
+out:
+	mutex_unlock(&buffer->lock);
+
+	return ret;
+}
+
+static void secure_heap_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
+{
+	struct secure_heap_buffer *buffer = dmabuf->priv;
+
+	mutex_lock(&buffer->lock);
+	if (!--buffer->vmap_cnt) {
+		vunmap(buffer->vaddr);
+		buffer->vaddr = NULL;
+	}
+	mutex_unlock(&buffer->lock);
+	dma_buf_map_clear(map);
+}
+
+static void secure_heap_zero_buffer(struct secure_heap_buffer *buffer)
+{
+	struct sg_table *sgt = &buffer->sg_table;
+	struct sg_page_iter piter;
+	struct page *p;
+	void *vaddr;
+
+	for_each_sgtable_page(sgt, &piter, 0) {
+		p = sg_page_iter_page(&piter);
+		vaddr = kmap_atomic(p);
+		memset(vaddr, 0, PAGE_SIZE);
+		kunmap_atomic(vaddr);
+	}
+}
+
+static void secure_heap_buf_free(struct deferred_freelist_item *item,
+				 enum df_reason reason)
+{
+	struct secure_heap_buffer *buffer;
+	struct secure_heap_info *info;
+	struct sg_table *table;
+	struct scatterlist *sg;
+	int i;
+
+	buffer = container_of(item, struct secure_heap_buffer, deferred_free);
+	info = dma_heap_get_drvdata(buffer->heap);
+
+	if (!info->no_map) {
+		// Zero the buffer pages before adding back to the pool
+		if (reason == DF_NORMAL)
+			secure_heap_zero_buffer(buffer);
+	}
+
+	table = &buffer->sg_table;
+	for_each_sg(table->sgl, sg, table->nents, i)
+		gen_pool_free(info->pool, sg_dma_address(sg), sg_dma_len(sg));
+
+	sg_free_table(table);
+	kfree(buffer);
+}
+
+static void secure_heap_dma_buf_release(struct dma_buf *dmabuf)
+{
+	struct secure_heap_buffer *buffer = dmabuf->priv;
+	int npages = PAGE_ALIGN(buffer->len) / PAGE_SIZE;
+
+	deferred_free(&buffer->deferred_free, secure_heap_buf_free, npages);
+}
+
+static const struct dma_buf_ops secure_heap_buf_ops = {
+	.attach = secure_heap_attach,
+	.detach = secure_heap_detach,
+	.map_dma_buf = secure_heap_map_dma_buf,
+	.unmap_dma_buf = secure_heap_unmap_dma_buf,
+	.begin_cpu_access = secure_heap_dma_buf_begin_cpu_access,
+	.end_cpu_access = secure_heap_dma_buf_end_cpu_access,
+	.mmap = secure_heap_mmap,
+	.vmap = secure_heap_vmap,
+	.vunmap = secure_heap_vunmap,
+	.release = secure_heap_dma_buf_release,
+};
+
+static struct dma_buf *secure_heap_do_allocate(struct dma_heap *heap,
+					       unsigned long len,
+					       unsigned long fd_flags,
+					       unsigned long heap_flags,
+					       bool uncached)
+{
+	struct secure_heap_buffer *buffer;
+	struct secure_heap_info *info = dma_heap_get_drvdata(heap);
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	unsigned long size = roundup(len, PAGE_SIZE);
+	struct dma_buf *dmabuf;
+	struct sg_table *table;
+	int ret = -ENOMEM;
+	unsigned long phy_addr;
+
+	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
+	if (!buffer)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&buffer->attachments);
+	mutex_init(&buffer->lock);
+	buffer->heap = heap;
+	buffer->len = size;
+	buffer->uncached = uncached;
+
+	phy_addr = gen_pool_alloc(info->pool, size);
+	if (!phy_addr)
+		goto free_buffer;
+
+	table = &buffer->sg_table;
+	if (sg_alloc_table(table, 1, GFP_KERNEL))
+		goto free_pool;
+
+	sg_set_page(table->sgl,	phys_to_page(phy_addr),	size, 0);
+	sg_dma_address(table->sgl) = phy_addr;
+	sg_dma_len(table->sgl) = size;
+
+	/* create the dmabuf */
+	exp_info.exp_name = dma_heap_get_name(heap);
+	exp_info.ops = &secure_heap_buf_ops;
+	exp_info.size = buffer->len;
+	exp_info.flags = fd_flags;
+	exp_info.priv = buffer;
+	dmabuf = dma_buf_export(&exp_info);
+	if (IS_ERR(dmabuf)) {
+		ret = PTR_ERR(dmabuf);
+		goto free_pages;
+	}
+
+	return dmabuf;
+
+free_pages:
+	sg_free_table(table);
+
+free_pool:
+	gen_pool_free(info->pool, phy_addr, size);
+
+free_buffer:
+	mutex_destroy(&buffer->lock);
+	kfree(buffer);
+
+	return ERR_PTR(ret);
+}
+
+static struct dma_buf *secure_heap_allocate(struct dma_heap *heap,
+					    unsigned long len,
+					    unsigned long fd_flags,
+					    unsigned long heap_flags)
+{
+	// use uncache buffer here by default
+	return secure_heap_do_allocate(heap, len, fd_flags, heap_flags, true);
+	// use cache buffer
+	// return secure_heap_do_allocate(heap, len, fd_flags, heap_flags, false);
+}
+
+static const struct dma_heap_ops secure_heap_ops = {
+	.allocate = secure_heap_allocate,
+};
+
+static int secure_heap_add(struct rmem_secure *rmem)
+{
+	struct dma_heap *secure_heap;
+	struct dma_heap_export_info exp_info;
+	struct secure_heap_info *info = NULL;
+	struct gen_pool *pool = NULL;
+	int ret = -EINVAL;
+
+	if (rmem->base == 0 || rmem->size == 0) {
+		pr_err("secure_data base or size is not correct\n");
+		goto error;
+	}
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info) {
+		pr_err("dmabuf info allocation failed\n");
+		ret = -ENOMEM;
+		goto error;
+	}
+
+	pool = gen_pool_create(PAGE_SHIFT, -1);
+	if (!pool) {
+		pr_err("can't create gen pool\n");
+		ret = -ENOMEM;
+		goto error;
+	}
+
+	if (gen_pool_add(pool, rmem->base, rmem->size, -1) < 0) {
+		pr_err("failed to add memory into pool\n");
+		ret = -ENOMEM;
+		goto error;
+	}
+
+	info->pool = pool;
+	info->no_map = rmem->no_map;
+
+	exp_info.name = rmem->name;
+	exp_info.ops = &secure_heap_ops;
+	exp_info.priv = info;
+
+	secure_heap = dma_heap_add(&exp_info);
+	if (IS_ERR(secure_heap)) {
+		pr_err("dmabuf secure heap allocation failed\n");
+		ret = PTR_ERR(secure_heap);
+		goto error;
+	}
+
+	return 0;
+
+error:
+	kfree(info);
+	if (pool)
+		gen_pool_destroy(pool);
+
+	return ret;
+}
+
+static int secure_heap_create(void)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < secure_data_count; i++) {
+		ret = secure_heap_add(&secure_data[i]);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+static int rmem_secure_heap_device_init(struct reserved_mem *rmem,
+					 struct device *dev)
+{
+	dev_set_drvdata(dev, rmem);
+	return 0;
+}
+
+static void rmem_secure_heap_device_release(struct reserved_mem *rmem,
+					 struct device *dev)
+{
+	dev_set_drvdata(dev, NULL);
+}
+
+static const struct reserved_mem_ops rmem_dma_ops = {
+	.device_init    = rmem_secure_heap_device_init,
+	.device_release = rmem_secure_heap_device_release,
+};
+
+static int __init rmem_secure_heap_setup(struct reserved_mem *rmem)
+{
+	if (secure_data_count < MAX_SECURE_HEAP) {
+		int name_len = 0;
+		char *s = rmem->name;
+
+		secure_data[secure_data_count].base = rmem->base;
+		secure_data[secure_data_count].size = rmem->size;
+		secure_data[secure_data_count].no_map =
+			(of_get_flat_dt_prop(rmem->fdt_node, "no-map", NULL) != NULL);
+
+		while (name_len < MAX_HEAP_NAME_LEN) {
+			if ((*s == '@') || (*s == '\0'))
+				break;
+			name_len++;
+			s++;
+		}
+		if (name_len == MAX_HEAP_NAME_LEN)
+			name_len--;
+
+		strncpy(secure_data[secure_data_count].name, rmem->name, name_len);
+
+		rmem->ops = &rmem_dma_ops;
+		pr_info("Reserved memory: DMA buf secure pool %s at %pa, size %ld MiB\n",
+			secure_data[secure_data_count].name,
+			&rmem->base, (unsigned long)rmem->size / SZ_1M);
+
+		secure_data_count++;
+		return 0;
+	}
+	WARN_ONCE(1, "Cannot handle more than %u secure heaps\n", MAX_SECURE_HEAP);
+	return -EINVAL;
+}
+
+RESERVEDMEM_OF_DECLARE(secure_heap, "linaro,secure-heap", rmem_secure_heap_setup);
+
+module_init(secure_heap_create);
+MODULE_LICENSE("GPL v2");
-- 
2.25.0

