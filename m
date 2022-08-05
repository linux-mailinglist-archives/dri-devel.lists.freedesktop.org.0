Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C864C58ABDD
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 15:54:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437E2B59B4;
	Fri,  5 Aug 2022 13:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150047.outbound.protection.outlook.com [40.107.15.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71DDB5941
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 13:53:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5qXrTKn7daTHKbJa7mM96jeRPg0qt9AFv73wtnFmrHqiWtyFw7W4+isbochR8vccbIjxtHqX6Woc9GUFF0HDCMvVa3vi8YWQyqbWWh1h/JNP+YtUyH8Z03zRPiMQ8Evt2exX3y2MEY/zeY03nVcbqgG1nqk/NaQ1IyRTgbJmC+xcxvcJNUiSqRUWiVfyc776dHhLFPJ8ZbrTQ0j7c7+woeOU6We89Su7dYTxjUgsuvvfL6X6QEsfWpSc5sSOdAJnJtcs9ssvTxaRDN1DC8DnHN2E0/y8E6V5z6kSeIUmSR1OlryAI0NC/cv+pQCbzaSQgqMgtqOexNoAflOSc3K/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9DbIj77FK3ITEXCLZsBxQ/2jkHuZxm5ahG3BrwDiXY=;
 b=QUEzycO/6bO6E7iEp4zQzN4bhEf7HBXvI6h+v/tiKGgmb66S2jbaO/TLF2nuroT9HHMucX39u2GWs+VCjOFKZJQGwCt9Fr9BY+vv72DTd+WLVuoKjMxhxziTbDPJ77ti4JdVGXWjxs+v+bulWawMErCsEdlYUWgvR1edgzWVJZvlo6eYUpaAbIkQ3icY9hwL3GVb6SxHUl5E8c9ij2mTQ9zTx2XnIR/jnMAm9b8aIKAr8ycu/2PymTKjk14AAxoixd2MOI0vr8SUTNJKp6ImQ5vA4LOEV2wiOwbTEBC3eWriwTjgcxCklREFJOxDmYz6erkhXtJOKYC3Fr2XCzn2Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9DbIj77FK3ITEXCLZsBxQ/2jkHuZxm5ahG3BrwDiXY=;
 b=jI1yxa/XG0PGULOd6dgTOt/jcOFZUCI/9w55EbN7RP4i6pCKxifMhekSpZjt1Jy+3YHlQB+Bm5/TPzHrzBWDFhMVZpdhxCEdePifcZluBJviOYGqfD/+4nl1UKw1SaJFDjw/wyGUmF2bZACXSLMvJ6ssllNtcXxiGJiI4X/3k1M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com (2603:10a6:20b:f1::11)
 by AM6PR04MB5861.eurprd04.prod.outlook.com (2603:10a6:20b:a3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 5 Aug
 2022 13:53:39 +0000
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::4cae:16ea:e349:6532]) by AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::4cae:16ea:e349:6532%3]) with mapi id 15.20.5504.014; Fri, 5 Aug 2022
 13:53:39 +0000
From: Olivier Masse <olivier.masse@nxp.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, christian.koenig@amd.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dma-buf: heaps: add Linaro secure dmabuf heap support
Date: Fri,  5 Aug 2022 15:53:28 +0200
Message-Id: <20220805135330.970-2-olivier.masse@nxp.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20220805135330.970-1-olivier.masse@nxp.com>
References: <20220805135330.970-1-olivier.masse@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0017.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::7) To AM6PR04MB6743.eurprd04.prod.outlook.com
 (2603:10a6:20b:f1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b47709b2-79e9-4b1b-5982-08da76e9e67c
X-MS-TrafficTypeDiagnostic: AM6PR04MB5861:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GA2xkLLyu8sKUW0UYlgZBT3Lz05iPG3X4jUFsFs0hyUgaIwa3uQwVE6ne0hpHiZLYzpBSZeQW6CubHIdpO18/343v5kjEwwWJ8IqRZhQJAeyg2DvEwkopBzoudUckl5NxPWQdDE4BZeTkRbkNfiDV8Q5YK8yt3F/xEqXwGnIMFyT21AdABVxOVIdkT+QA2AFGgOYUqY+sD4HfhL47ZNIXtbZ/a7ehGEjRwKyaPPSOIy7H5Yms4eSnHF7UCR5AYSaf1aWSv8hjHfqZclPoYZzfZRBZQCGMKcbALJq2uw0kQZy2sjAZObMSlEFB95EkPtOR5BovEHYSFthcpd4T2sIC/4Nw6f+RMJm8N+2ehr3eiCEaw3DXVssbl1frbtEEqPiE6B7HrPAZZaMaOYrg4LviJYMA1seQ9MSSV6X/WaU1U8sokeaj97sMnD9rDPNfaHUXyn4S3vRAYhaH1vZcHjtxpkSfhuz5D4Scwsg5lq63BFr7Y3j9NzHilDnv+OvDflgRcK+gvPKPm+XGPEDo8CerhXmIVvpUSeJ7KGpvDsDX5eYapcNEdL7nqnh2Nb0fHCapi4BmmbDYlspH74aGargxI7misnH7jNd/dLgHnQJ6Nz4g8sBIKdrgUF8r+qHt7fRoBE/xohdMjwMichYYpMqqjHaxlbRguBlDVHgYZJhBKOio2BfPuUglvXWXe+siLLIRZA/pPeBgkf0TPN/xup0hDi3rIy30WzKOx3jFjmKV4VLG97wgQabcapeKutrL9SdKpqSrYcKzwby6ipQWaf9vY8qQbolJirtDXxta6DU/XXg5+18HnBawElEzYCho+Mt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB6743.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(366004)(39860400002)(136003)(376002)(86362001)(36756003)(38350700002)(38100700002)(6506007)(6666004)(6512007)(55236004)(83380400001)(2616005)(26005)(41300700001)(1076003)(186003)(478600001)(52116002)(66556008)(316002)(4326008)(66946007)(6486002)(8676002)(30864003)(66476007)(5660300002)(44832011)(2906002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0W3zlTTEnx6E5R2uwip1Rlz8RD2RIq6EorUvUU7zkiIwzjMJL6DHe5oGleIa?=
 =?us-ascii?Q?qGg2rpfOU0Gq0DizKeexFTm1cFE2Fu3EG+GcWB2dpzBIKB0gPyoXjjkZSI2Z?=
 =?us-ascii?Q?OjyZh8aFbYxeezsqZyvekHVwFHXQbZWRVfaOreMjrgHRZxDVbBcCK7s6P5vu?=
 =?us-ascii?Q?7hcytqN6CGoLq3fjPTwphKpLmevug/2rd8+aBA4FOLNVaaKGaHPxpQpGINqd?=
 =?us-ascii?Q?/U9bOCy0bLB3gfT6Q+dgeJESjZOLTS1UkY9bKyOee/rp7p5v/NA310INeiB7?=
 =?us-ascii?Q?7FQ6vQGzDy89KqT7wmMR7GdphTiLND7rW30OLZaRV6Qg/VQAcg2BvS50Qn2D?=
 =?us-ascii?Q?+VNwKrL75TXggknIFAiCBbIOwe6WoASe8h1RHElCZjatMfzm/zaRsF0iOHP9?=
 =?us-ascii?Q?65f0FWPZCYGnHFTn31aMPuSBnu+i7RGuuNLFvMG/jaiTvJ06XOIJ0SlTm65r?=
 =?us-ascii?Q?IfSN+h5zoT68iBixUntt46ex592l/0JtC9NJ+NYxSyuwXsbG/lGuTkvXmnYf?=
 =?us-ascii?Q?weKjVDZkZDikIFjztg/og0exhBc9JTv9m1w4bOzPZFb7KW/gmPKFAPbYxWQ2?=
 =?us-ascii?Q?ztcpt2/UG6IXntmaROMnD7VwMLTv8fqwmCyOgBiocKQ40kz078eU6R1kV7yS?=
 =?us-ascii?Q?kl0ko5B05ABTfcZHMrJkhLbJBZTUBdmSkfEgW/UGz7tZHiqO9IXX7qjVALjj?=
 =?us-ascii?Q?9lAff3KeredhaW4Ro4mYLqk+JC4dR9awxSJ3tJBXh5HPIuFhKJQ7+uSIEPjU?=
 =?us-ascii?Q?E2rT3aQmOxrW3t2u74uijCFmp0RCXhPFzb4A/vTB52C7NKrPXSp+tg+w4Dxr?=
 =?us-ascii?Q?kOi4uyo92uWXdKjMv4zfm1Pmp9zuTd295PCqaBFSxbI7NBZgUy5SAtDK6TS5?=
 =?us-ascii?Q?2CDMQNwbs14ozvDBnvVMcRB4cFW1oX8M7VtM+Hxjj325MyMRS14mpSSyYXxI?=
 =?us-ascii?Q?5UHUdF6GgvFnACdmjvXc6/ImDTR1XOVncbl/at7iqlXHjI+vV/ARLWsPWce1?=
 =?us-ascii?Q?GQUE3KSjevpT53epi16P8sozteJq6aLaHgWDT7KqlFEpIUHp5T/gdonBdhch?=
 =?us-ascii?Q?5GLWyi6+1G5wN8+EPAoPsoUjqBz2PJh0GIhfPFnKUte5v23zw9CKs0LZSy6N?=
 =?us-ascii?Q?pDgdvnhpQcF3OBn9ulJB/xEjFiIuyXtDqX9kV6193vXi4Jm928Sh39zwLLVN?=
 =?us-ascii?Q?oVVRDhUXh0jalLfSrB7WlKHKeKiHacVsNkKQzNj0l6cHqpOIwetI/nh07jV6?=
 =?us-ascii?Q?lzDeqJHgXhB3AoE6aF55SQCf9dIl7Xh3SMQMKx+rZchD/+JwZm5SerLfoXQl?=
 =?us-ascii?Q?zeos/WJ/x02gLWcJTwMv0Vqyu6GWEyi3KFoFCB/yv57Cjl9hTrI1T3XA4rmi?=
 =?us-ascii?Q?PjdaeP5jnFSBH1jo+M+DNona8OzeWaFdKW/u6IpNwqNQUPsUzoQK44K2BZpJ?=
 =?us-ascii?Q?6eYjxCqP/ij5v9QmU7YW1UIS19rqtif/LBL2NIdaT7kgCQLCOWjJfHuyAylS?=
 =?us-ascii?Q?SD8I45CrQXglV8cUFqYzTJyPhZ0oJzHKoJkp2Br3MISP015w8GD0d9z0R8dU?=
 =?us-ascii?Q?6mX4T4U93H8RA3XQTQ27xfiRX9hAwqavZYHR53Q76ve3EB/7GqkgDLx4Nc/Z?=
 =?us-ascii?Q?bg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b47709b2-79e9-4b1b-5982-08da76e9e67c
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 13:53:39.7087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BGDpBwap/3JRarZfIVX1WYlIA4ptGIxxjaJDMEiVAAuho+GAA8HoQc/nkqYEvdO4NaJmgzxCmMahq4WU/hN3ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5861
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
 drivers/dma-buf/heaps/Kconfig       |   9 +
 drivers/dma-buf/heaps/Makefile      |   1 +
 drivers/dma-buf/heaps/secure_heap.c | 357 ++++++++++++++++++++++++++++
 3 files changed, 367 insertions(+)
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
index 000000000000..25b3629613f3
--- /dev/null
+++ b/drivers/dma-buf/heaps/secure_heap.c
@@ -0,0 +1,357 @@
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
+		return -ENOMEM;
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

