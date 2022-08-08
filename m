Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F7F58CAEF
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 16:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88041112746;
	Mon,  8 Aug 2022 14:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60070.outbound.protection.outlook.com [40.107.6.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC1E14A501
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 14:58:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSo24lqrgIwuX8r7x1Fw04y8UNgGJ3H3aVr573V5QMLX8usOmijH3SF00Hg0cGL0XINsdgK0iVF2TdHhdbYRaz+56kYZcNeK2Uo2XTsClnunbCzjcnXy5ENSBJxeFSVr3TEZzDRgMvTMm7e2q0mVOWb+m/xN/3IsAnZfsNJI9KuU3gQQ5lWCmn04fc3cip7Ryec9CCOld0nXgFCB/PMWsr+DzmtDWWF+ITFwDR7ahprqjdPPg5CcICoB9OvAEsUqQorGbS3IKQQ3jpMNXSg2HRiOpcQFOhjOCnqaJZCfg7Vqny+IAvqxPuXofrHrXzhpqExqgw08oapeXvScom5Snw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FxTuwg1X8qAwF21M87xxBCmOM7qUuvYcbHbpmp88cuk=;
 b=PkJA3T4omNiml/oXfgqGRZlDArRrVpPNf5kO/pinK2Wsu2oFRn4/7GTAwzWTrc50PR/RbRxqy4Rj39+c0VDSagyVhLRn0DV/79/pMRtjbfxwBkhi8MjaoP6M7N59bjalxG92QbMQuYvWoFP80bx8Hxi+MSNUgIkF+c58uM6kov4XQ4zr5/NnFS3QHMfuY3mCUDRRGxCC0qHF/tyUoRuZ/2N82NEuDa7q/xHqzx5sqTKq9QGLpPcfdaecepnME5yJiCgfl6jJc/dIKU+HEMAV0tJWJIdDi+X5oPYieYvWm4ADAXD1IYhdfPPHd8sK4O9cPuijSrLlYXULllxgvoRhqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FxTuwg1X8qAwF21M87xxBCmOM7qUuvYcbHbpmp88cuk=;
 b=HdeYoyySZ4V0YT/mNtUfAnVQE5CEMeB+cS1+ZYxIfM3VkkbCNvTP6/2dKYIA6BmuUy7251Nc68C07euXTyoXGCSWFecWJBO9guAF/shC9qYQ+a7HPV5rn4oea0qRfjrBlVAMqSR9Y7Uz646LvOY4McvDOym5OSxiNdFopBr88rk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com (2603:10a6:20b:f1::11)
 by DB3PR0402MB3881.eurprd04.prod.outlook.com (2603:10a6:8:12::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20; Mon, 8 Aug
 2022 14:58:25 +0000
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::a401:5ed6:1bfa:89a9]) by AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::a401:5ed6:1bfa:89a9%5]) with mapi id 15.20.5504.019; Mon, 8 Aug 2022
 14:58:25 +0000
From: Olivier Masse <olivier.masse@nxp.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, christian.koenig@amd.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dma-buf: heaps: add Linaro secure dmabuf heap support
Date: Mon,  8 Aug 2022 16:58:19 +0200
Message-Id: <20220808145819.12176-1-olivier.masse@nxp.com>
X-Mailer: git-send-email 2.25.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR01CA0094.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::35) To AM6PR04MB6743.eurprd04.prod.outlook.com
 (2603:10a6:20b:f1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88b4f7e9-adcc-40a0-99fb-08da794e71be
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3881:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fAh+BtEargVVr6XB/XhN5s1Nq80bhVfm4Ppyt8V83KsQ5Uxaua5JhrDscTaEF8DK10Bq7UfqjzCW/zNCetvtPfl4wOmSifP2f70j8ls7RwnZz1hxdZjHxZP14ElW/EhCLnooYefha+vGObyaY6Wtf2OXJdR3LpT70bb09TYF3wWJFjkXvR5WteI+FbguP5cK1KwE/ZSO8KFMttEYG+ocweSbcVXcDwM3jQ2azEdS00EOZXpYDSXpQhcJht/uLDU1GtjjDy+gBUAPhHsOxN6oJGRHT1PFkE+0NrE3tH3iVMdD1uD79md+saXtYmR7+otxrSUSMr7FgSeazrk1UMer/CmfxW8fIm2k2LUH8YuuLsH1Q151i+e9Z/j/uT6llWHyeRiRvLijSG6Fk6why8kXJzBjkNMcOzytaY7zk/XjbIKHpRKN6PhScK9Ny/tLDFLyBsmVf1wlMwstvLuHQ318bqD9c04S9JK80kfIlR1GQfq77bOvTXdwYT2zihIWGQY/OatYkBZgCxrxDr/lxEJdHGwEyAMoroQYHiQWpHkj6i0Lkgdg3zSppP/n7UQc4C2bBRl2PwdTeP8rrJcCwBRaVKXj3xnGxnYroUSnMszmEmhLFr7fSTqYRDGNopOVDX536ldypCxuFHBlb7OMs2vKydpFwRh+FdCLrvwmHwMSAyLKKQEygNjh72SuOIBuNAQbdBdEmE1a6gpncZ6+nS48sdK2lwKnDebkbpw4VrlEgUFCXcP0Jrcov3g3I4D3NfU78/kfwIIdSzYLcmdUjLQwY4KmpcJb8Za8tW4YRexnP0w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB6743.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(38100700002)(38350700002)(2906002)(66476007)(66946007)(66556008)(86362001)(8676002)(52116002)(4326008)(55236004)(6506007)(6512007)(6666004)(26005)(478600001)(316002)(6486002)(41300700001)(186003)(2616005)(1076003)(83380400001)(8936002)(5660300002)(36756003)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v3nFSzNS43bqsrMn8DDxhayNfNM8UUcm6y0RoPztCyJ1A0ZdhVFHC7xj3hWJ?=
 =?us-ascii?Q?ojXJueKzVpJoEhMHI6bd2iZeFTwgTLuXsz+QaJCYfxeLoyjBvuf7AU25qb63?=
 =?us-ascii?Q?qLlPB6i4k1hInsNkV97OUggaULzU082xomHzmZVsOZDujfEygkvTPtXK9L0T?=
 =?us-ascii?Q?Ypo65/Bfl3ayWKTxyQbyRUbafvw/7slvu43uaay4WwCZMBo0ZvzjyVLuCMv/?=
 =?us-ascii?Q?Z4qwFP8GCBxgz29rVegrVu8PYKBavFAm/ye8J9agoSYto7sjX40kvPauW0GI?=
 =?us-ascii?Q?7ZWF33W3rHSbyqZLAWRbsqo9Fti8TzyPkkOFPhiXj5/UECcFZlg/QBOFV4hU?=
 =?us-ascii?Q?JaOsE2tAOiSKQhbwcEyQrSVcGVt42OW4p426S7QJtg1nupEBHi++Ru1aXPa9?=
 =?us-ascii?Q?n8Xh1kldK8E+kWNQOrU53SB1y3xF5UJcczxSQMqOniMo5psinpIp8o0Ry+Ok?=
 =?us-ascii?Q?0kvQe9YntBgvi2+COMEUIASot2H226qAb7Worhafb+AvIvtXuP4ViCI9Kdcl?=
 =?us-ascii?Q?OPCa9oOKOkOT1fFSWrDZsGwx4vIaahIz69DJa3hsJT89jR9metwunoB78ktb?=
 =?us-ascii?Q?JOkhi5UqfELwDx8yeVr7So6FaNc7k0t1e0BgcDuXi6xlf3lb2hNtwZFORGWg?=
 =?us-ascii?Q?yXjXbZp5VHj0vkzhAyQWVPQt9wGFq55Ap6NTn6ioD37H4zFxiIYgcJZjU6we?=
 =?us-ascii?Q?zbIJ1ODi3gOr8G1EMs9OUbjkIXPYR8Po4zFQxfK7WN3z53JUfUBgWd9LaPR0?=
 =?us-ascii?Q?reDuABz8ag/ITxhtCq368Nup1RiBlIz6k6+S+gk4l/hrPSz8yrbbH+4L943/?=
 =?us-ascii?Q?Mg+g5VeZtnQ5M52THIzLpGbmfH7t2HN5QhBVdY4MTx50lg5mzQefgy0yPuzH?=
 =?us-ascii?Q?buACrpDdU+8+KpzF4/Tr7Yw38xNlvj+r47tOzffixKfRgnPkZPgbxSjkNeGX?=
 =?us-ascii?Q?qd33tFmnkRQ/Lsytks7HaN2sswkafXQxORWzCYi4tv6QvZQvlg+kIex8NwMt?=
 =?us-ascii?Q?QjpkxbeJ0DByNQKzAY0xx/ZYIN1LEqGgsUSFLzhFdg5HXmWjkgmvoyrRHmJO?=
 =?us-ascii?Q?zwTMTv3qBAr2qr0chpUW5EoEnrIwfoYx7ZmRy5tk0clwC+4N30Ryu4seD7b5?=
 =?us-ascii?Q?gXkULu5pgreFmsWXvAIOami14AlTf3hIR8myPtEgzDtqdkuAzDldoB3VZH88?=
 =?us-ascii?Q?Djhq27LJhujzn/Ajv7/Hr61+IKAdRHcpc5hA/MSmWamXatemC6z1aJwnW/+v?=
 =?us-ascii?Q?SbfPuumjhMKA+aXvonvVv4wps2ADz1d4l5HXR3kXxJAVAKhFMzYgbAhVtjzl?=
 =?us-ascii?Q?whtVKInNqQfiIuR5KcHc1sww3fY1SlWWKYgwy+fGltAKI6WflwsVXE8/KDGf?=
 =?us-ascii?Q?ovGXoJ7Civ5asZk9zkXeF1jJuHjMwkjhcDkbZ1cH6r4C+MGLYEihyifHxje2?=
 =?us-ascii?Q?IXMmwTOL4d1oeSHuH1SvHF5EwLPguwl/uw27v9USned8+h6JpiKVgWE2AXml?=
 =?us-ascii?Q?BXmpaIUcDtFfE7pOWEa1z4tXleo6M6Ffpoe8owEtVY/mWPfNm5WozHRZfe5C?=
 =?us-ascii?Q?7ev/CY8QfcwmLq8nny+12cx+sbNEgHnOzNGPk2St?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88b4f7e9-adcc-40a0-99fb-08da794e71be
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 14:58:25.1104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXUTNyt/Lcghza+1l0SMInSH5rDZaEX6gPh4akbhdHDYqJT+NQO+tpFHVmIo13Vivl9doqYqRQrhPNfJ0fya7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3881
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

add Linaro secure heap compatible reserved mem: linaro,secure-heap
use genalloc to allocate/free buffer from buffer pool.
buffer pool info is defined from a dts reserved memory.

Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
---
 drivers/dma-buf/heaps/Kconfig       |   9 +
 drivers/dma-buf/heaps/Makefile      |   1 +
 drivers/dma-buf/heaps/secure_heap.c | 339 ++++++++++++++++++++++++++++
 3 files changed, 349 insertions(+)
 create mode 100644 drivers/dma-buf/heaps/secure_heap.c

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index 3782eeeb91c0..c9070c728b9a 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -20,3 +20,12 @@ config DMABUF_HEAPS_DSP
           Choose this option to enable the dsp dmabuf heap. The dsp heap
           is allocated by gen allocater. it's allocated according the dts.
           If in doubt, say Y.
+
+config DMABUF_HEAPS_SECURE
+	tristate "DMA-BUF Secure Heap"
+	depends on DMABUF_HEAPS
+	help
+	  Choose this option to enable the secure dmabuf heap. The secure heap
+	  pools are defined according to the DT. Heaps are allocated
+	  in the pools using gen allocater.
+	  If in doubt, say Y.
diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
index 29733f84c354..863ef10056a3 100644
--- a/drivers/dma-buf/heaps/Makefile
+++ b/drivers/dma-buf/heaps/Makefile
@@ -2,3 +2,4 @@
 obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
 obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
 obj-$(CONFIG_DMABUF_HEAPS_DSP)          += dsp_heap.o
+obj-$(CONFIG_DMABUF_HEAPS_SECURE)	+= secure_heap.o
diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-buf/heaps/secure_heap.c
new file mode 100644
index 000000000000..a3023bf8d457
--- /dev/null
+++ b/drivers/dma-buf/heaps/secure_heap.c
@@ -0,0 +1,339 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DMABUF secure heap exporter
+ *
+ * Copyright 2022 NXP.
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
+	void *vaddr;
+};
+
+struct secure_heap_attachment {
+	struct device *dev;
+	struct sg_table *table;
+	struct list_head list;
+};
+
+struct secure_heap_info {
+	struct gen_pool *pool;
+};
+
+struct rmem_secure {
+	phys_addr_t base;
+	phys_addr_t size;
+
+	char name[MAX_HEAP_NAME_LEN];
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
+	struct secure_heap_attachment *a;
+	struct sg_table *table;
+
+	a = kzalloc(sizeof(*a), GFP_KERNEL);
+	if (!a)
+		return -ENOMEM;
+
+	table = dup_sg_table(&buffer->sg_table);
+	if (IS_ERR(table)) {
+		kfree(a);
+		return PTR_ERR(table);
+	}
+
+	a->table = table;
+	a->dev = attachment->dev;
+	INIT_LIST_HEAD(&a->list);
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
+	struct secure_heap_attachment *a = attachment->priv;
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
+	struct secure_heap_attachment *a = attachment->priv;
+
+	return a->table;
+}
+
+static void secure_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
+				      struct sg_table *table,
+				      enum dma_data_direction direction)
+{
+}
+
+static void secure_heap_dma_buf_release(struct dma_buf *dmabuf)
+{
+	struct secure_heap_buffer *buffer = dmabuf->priv;
+	struct secure_heap_info *info;
+	struct sg_table *table;
+	struct scatterlist *sg;
+	int i;
+
+	info = dma_heap_get_drvdata(buffer->heap);
+
+	table = &buffer->sg_table;
+	for_each_sg(table->sgl, sg, table->nents, i)
+		gen_pool_free(info->pool, sg_dma_address(sg), sg_dma_len(sg));
+
+	sg_free_table(table);
+	kfree(buffer);
+}
+
+static const struct dma_buf_ops secure_heap_buf_ops = {
+	.attach = secure_heap_attach,
+	.detach = secure_heap_detach,
+	.map_dma_buf = secure_heap_map_dma_buf,
+	.unmap_dma_buf = secure_heap_unmap_dma_buf,
+	.release = secure_heap_dma_buf_release,
+};
+
+static struct dma_buf *secure_heap_allocate(struct dma_heap *heap,
+					    unsigned long len,
+					    unsigned long fd_flags,
+					    unsigned long heap_flags)
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
+		goto free_table;
+	}
+
+	return dmabuf;
+
+free_table:
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
+	if (pool)
+		gen_pool_destroy(pool);
+	kfree(info);
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
+static int __init rmem_secure_heap_setup(struct reserved_mem *rmem)
+{
+	if (secure_data_count < MAX_SECURE_HEAP) {
+		int name_len = 0;
+		const char *s = rmem->name;
+
+		secure_data[secure_data_count].base = rmem->base;
+		secure_data[secure_data_count].size = rmem->size;
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
+		secure_data[secure_data_count].name[name_len] = '\0';
+
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

