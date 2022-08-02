Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAF85887D5
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 09:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2CF10E20B;
	Wed,  3 Aug 2022 07:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2059.outbound.protection.outlook.com [40.107.20.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 215B418BBAF
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 09:58:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhYAwWmzEbXWMWfplvvTPs2jdv7G5K/U4X06eCW2LDiUDLYFCrTWZNdvmwAbAKnFyV5r+T6SIqU1z+jZIXMnhiWPLKIUun4caev1LGsSmmYrybXBxybv95TxkHO74BZeensHNJyuH2TViLOP+Ra1LlMbVNQA9i4WJrJrrlFbXQuakvv7xkdwep04hl8RUjyGBK7khA17mdkiHS1wkj1nUR+NTMmhLJhD4E+8Dn5bEdsQnz9t8snIzVulVNvt2mHZilnpAn/Np6njvnLS0A5XaA+76Xq3gbhNfJXoQvtkZuF0p6Lid2ESWWJTLx+4WIsEC3+iHS18kZZvDnBvtMniKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6F4CMRdmn0GSb1NELVUv8fyXfsdW1uJtKJqqy0RZHs=;
 b=c04TM49Wfkm+Bng/rkCbN1wkDmskI1ZKdrsB8axBnq/NWm4ujX4jwrne9WSYqtJpJDuh05NDR6I79Cve8QnmigtG5rPjtkO9oxF+cvmE9jgILx7CpxpRVdpCyeYn5yD9uugBrPNVT3IxHCy2u7wXuJn0o5u5sg0Vo7axo/1awLun3/DG3Lfaonf7A0wA27AEIEn6zd1OsEe9pBWQlG0qs8LhnkP27aoShq+5c4b3aew0XN3a/nF5eUqseiAMP8gVq5lXqpEIf3jdFEdLNJrGMrinNyRbOdJ2e3R1tCnYtujEyusEKEpcU67h0ZDeuWt1ahId5v4HGI3jBI5akRfT0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6F4CMRdmn0GSb1NELVUv8fyXfsdW1uJtKJqqy0RZHs=;
 b=hHeWLaNkxVsyN7YIJ58EQ18YBZNAoOfutrJWRBbRDlwwq6dvopuX9ARso3HH86ArB9vC1zZpQRPXnwvZYQ5GOHRRnFC+MVnMdTy6izvE4lS6aEk8/5GOQXiZpIYOX1w7AuWleeuTccqAZlgr/a5KXjshZdKoDnNCUfEO/DwqZrk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6737.eurprd04.prod.outlook.com (2603:10a6:208:176::18)
 by AS8PR04MB8341.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Tue, 2 Aug
 2022 09:58:52 +0000
Received: from AM0PR04MB6737.eurprd04.prod.outlook.com
 ([fe80::6ca7:299e:d92f:7d1b]) by AM0PR04MB6737.eurprd04.prod.outlook.com
 ([fe80::6ca7:299e:d92f:7d1b%5]) with mapi id 15.20.5482.011; Tue, 2 Aug 2022
 09:58:52 +0000
From: Olivier Masse <olivier.masse@nxp.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, christian.koenig@amd.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] ANDROID: dma-buf: heaps: Add a shrinker controlled page
 pool
Date: Tue,  2 Aug 2022 11:58:40 +0200
Message-Id: <20220802095843.14614-3-olivier.masse@nxp.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20220802095843.14614-1-olivier.masse@nxp.com>
References: <20220802095843.14614-1-olivier.masse@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM3PR07CA0145.eurprd07.prod.outlook.com
 (2603:10a6:207:8::31) To AM0PR04MB6737.eurprd04.prod.outlook.com
 (2603:10a6:208:176::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1aa91d2-bdc0-4ee8-19a8-08da746d9a88
X-MS-TrafficTypeDiagnostic: AS8PR04MB8341:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OrZ+Mf2Im1BWeUgPbN/aeFSeGEekynp4KPB7T98fHlEIdvs8OvGsFdFjRALozCFA/gkdbPPx8avo2CD8IiVLwq+FeSb8bhmN6/XlBai9zjnk3AxtOwM3OLZlimRwL8CqtaFhuNRNKwlIDrMs5/4KhN5msNAX3uN5jV0zNOy6QCN1PzcY8iXmqTAeysEiahk7f5aUCnErBUBN5RLp/d0ErRHmNVel8fVNnN0Fvbiwvy+mSpV/px610mP07GPKuBuuD5mt9DmAW3e5bLCvWBVXhjYMvBhf+eLO4bjMq7RBV0T7wyvKk/p5jBheFx6tyC0FcFtx8GDT8MMnGpzvS1D5mzy50PZWhJmMpbkior99F0gtjL18MSveLPzWY2hKg6IVpXNCpmJb5xy6OogG1nHO4S0jD137ouRxhNPXsgdJEQQr6mJFOfEMOyNVhYh3E4YBWxajhnaDygzA/+sSWe91gaiB6b8Jp3hUrYaNTrlJ367MK7c3+OizXmgzbkSZjJAYX68XVnh8pG2cLmfaqW9W1zzXaI1lvhOYfZJ1PFxo99yupkGA7FV0SYfHOggsBOl/ep6QVvRzdsl7KftFJjK7HSsO6WoofMu5qv/GyPD9jv16t2B8eqrv4bnPg7tQ8wHkV35oDV3IoVqrkDBYHFFRkQYjCb0dczyEwr0rXbYgNOkiFdiSzIGHAC0L9t/RS0agtyy0VDFvRPCizmcZDeJng2mEoG22k4Mqv+2WKUuoKuf15iZnnxaKifyFewTFJNeJGUgUipQyIoS3Fbd0xOXrhKV9n4OiQUltOV11TZx6Crk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB6737.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(366004)(136003)(39860400002)(376002)(41300700001)(2906002)(83380400001)(2616005)(86362001)(6666004)(52116002)(6506007)(44832011)(1076003)(30864003)(36756003)(26005)(6512007)(38100700002)(186003)(38350700002)(6486002)(5660300002)(8676002)(66556008)(66476007)(66946007)(8936002)(478600001)(4326008)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUdyV2V6Z3RqcEYvbmVLUWFldTJzT0ZoekFDUUNwTnB5WHc1QVQ3NWh3RmFk?=
 =?utf-8?B?NjI2T3l2RjUvYmpQcDVYNndnSTlkYTNTVzRwcGxLcTJvTzNFQzJ1WnFvSkp2?=
 =?utf-8?B?bzYrZURyLzRFckRVV1AxY3lyaE42ZmFuMisyVnE4QWFEZWZqNitva3VsNm5r?=
 =?utf-8?B?R0ZpUkcxeFcrbU80eGY0WEFLZytGY1o3djhLWk4yaWoxdDR5TzVKcmc1UUlW?=
 =?utf-8?B?dEg0ZXhPU3BvMDdNbit2dzY1R3E0ZVo2aERZY3phVHgxNlVYaFRqN1lhcE1E?=
 =?utf-8?B?MEs0dldFaTRoVWdNNTRWQWtkUER4YUJaenNxV3FONEZmTTZLV0tzNldIN1Iz?=
 =?utf-8?B?cHZ3Y3djcGgzRWtCVWhmek9pRWNYdmowYVRNQzlYT0xSTlpTRUZmSHUzcng5?=
 =?utf-8?B?Q3ZreEZTRUxyVjdqaVlpc0s0N004RW9Ka2dxUTlqeHNkb1oyYm5ndEdWTHI3?=
 =?utf-8?B?dnBvNDVDL0sxR1BQemNNN21Ta3ljaytsaFZnS0NRNnlwMHp6WkVzRjRTUEFB?=
 =?utf-8?B?Snh3WTc0Y3BydXdQOG4vVTdqU3p4Nk5ZVDVIUm9lTmdrdy9IaWtOR0ZETXFR?=
 =?utf-8?B?UjdpTVVSdTI0SUQ0ejlSRk1nODdJd2V1ci9EQ0cxeHJFbytWcy9CUW9LL3BL?=
 =?utf-8?B?YlB1UHQ3OTAycnVJTktOM2dEV016NkxBd09keUgxRjl3Qm1zYmVBWGFkUTFG?=
 =?utf-8?B?UGc3WmZydmdEYitzV0czbStkWmcvK3l3Wk9jczBQQ2pBWlR0OFppZ3Fzdnpl?=
 =?utf-8?B?MC9nd0FKZkNsSnRsYUprMk5aYTdicGhYdjFRbzhXYVpITnMydHJwTXByYzN5?=
 =?utf-8?B?T0c1S3dkRUdtVmpaN0pPci9KMWVJWStLVmljSG5MNHdSQWpWcnNGNkwzMG45?=
 =?utf-8?B?L0poa0JIVjB6OEJjSFBGb1NMZWlUem5JTmxuSmlRbmhxWEduQXFMU29lRDhk?=
 =?utf-8?B?Ym11S0pYRmIzLzZIUDhETXMwejhqOWpLVFBSb0ZqdzV2Z0Y5YStsdTl4N0s0?=
 =?utf-8?B?SlFwdXVmdTJIQWlZNyt4cWwzNXRyOFpTV2tPR2cwencvd0o1Q3c3TUJLa3Zi?=
 =?utf-8?B?NGRwYUV1dWFkVUZVOGJjWDBmVGRIMGhLdXRBSVFVTGg0MDllbHRPNndXWUZs?=
 =?utf-8?B?Z3cwOFYrOU9xTXY3TFljaTZJYXo1RGNGTGJpYnBxdUZ4cnhKY2pQK0VMSTZ4?=
 =?utf-8?B?OUNWNThoSkl4czBGWTVNZ2xmZUxIelZpbndOU0QvVWlwanFZcDFFaE92L2VW?=
 =?utf-8?B?Snc3UlRMY0NVR0tuRkZtdUhDd0RnOXF6eWIrN0ZWV1BUU0RYbTQ2OWw2SDZ6?=
 =?utf-8?B?bHJkeFV3VGpneDh5RWpSZkNFRER3SVFRdGREOVVUbnRuNWwrU3VVL0piOU5z?=
 =?utf-8?B?RDYzNW9NcW8wVXpEeTdKWFJ5YmZCbG9UWnQ4MVc0MDhLWGE5NERnY3p5RWxo?=
 =?utf-8?B?K3djczNoZGs2SVhWMjJHVjFNTUxRSURtNkdwVkZmSnZ1NWFDQU81dTgyVVlm?=
 =?utf-8?B?M3phZ1VNejJRMTFxZGlxdlRMbmhiWENma1FvTE05ZERrckVaUVd5Q3N6bkFH?=
 =?utf-8?B?MnE1RzBpSTNscG5zVU10ODVFRDN3b2NZdFNaejdrYmcxSUt5MTQxUWxGWHA5?=
 =?utf-8?B?eURPcUN0Y21vOGZ2a2N5U3pnK3BRY0cxWHlpYUFaMVZBaGxNVFVaczYraVkz?=
 =?utf-8?B?NnYwQkZoOGluenMwVDNvUzdiVWJrZEExSkZXSGJOYWpRSmRIa0pFMDAzRytX?=
 =?utf-8?B?WDNhc3l0THRTQUxUdDc5RWkvS1k2TmVBOTRVWHJjYWJkaDFndzVzS1VSaEVD?=
 =?utf-8?B?WFowL0ZuWGhVQzhTdzN2VkhmaXFxTW94akN1TzBIQ1RpTzVrUmJCMmRsRVUx?=
 =?utf-8?B?OUdIazFONjhDeTRpY2NDQWNyeUVaRkJsMUhBOVZrWnNnNXBZazVzbnYzQzl3?=
 =?utf-8?B?MmJuUDVPWElHK1NFUERvUC9nd0QvL2Y2UlVBVFl5bXExZnJyVHRkTkdldThH?=
 =?utf-8?B?dGZNMzZYN3NjZXVINjJCb2lIVTljbUh3aStTemxiYVYyWGhReUh5MDNWMHVQ?=
 =?utf-8?B?MXhwV2owbzdyaWdFeVVmME90V2pOZ1llSUo5OWRlQ3d3R3FuMVFwK3JkVGZi?=
 =?utf-8?Q?qzUe9BkSK6iQ32qnk95Y7Wilb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1aa91d2-bdc0-4ee8-19a8-08da746d9a88
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 09:58:52.0620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JJVQHhZVNHPI+vhQST2F/FbSJjoy0Oqz6BAmLzShGIaCRPcNiniHit7RCDbtHPsZK50coI1r7PjNQ7KlBC0mfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8341
X-Mailman-Approved-At: Wed, 03 Aug 2022 07:21:28 +0000
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

From: John Stultz <john.stultz@linaro.org>

This patch adds a simple shrinker controlled page pool to the
dmabuf heaps subsystem.

This replaces the use of the networking page_pool, over concerns
that the lack of a shrinker for that implementation may cause
additional low-memory kills

TODO: Take another pass at trying to unify this w/ the ttm pool

Thoughts and feedback would be greatly appreciated!

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Daniel Mentz <danielmentz@google.com>
Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
Cc: Ørjan Eide <orjan.eide@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: James Jones <jajones@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Dave Hansen <dave.hansen@intel.com>
Cc: linux-mm@kvack.org
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
Bug: 168742043
---
 drivers/dma-buf/heaps/Kconfig     |   3 +
 drivers/dma-buf/heaps/Makefile    |   1 +
 drivers/dma-buf/heaps/page_pool.c | 246 ++++++++++++++++++++++++++++++
 drivers/dma-buf/heaps/page_pool.h |  55 +++++++
 4 files changed, 305 insertions(+)
 create mode 100644 drivers/dma-buf/heaps/page_pool.c
 create mode 100644 drivers/dma-buf/heaps/page_pool.h

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index 8ee64277a5d2..6a33193a7b3e 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -1,6 +1,9 @@
 config DMABUF_HEAPS_DEFERRED_FREE
 	tristate
 
+config DMABUF_HEAPS_PAGE_POOL
+	tristate
+
 config DMABUF_HEAPS_SYSTEM
 	bool "DMA-BUF System Heap"
 	depends on DMABUF_HEAPS
diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
index 5de95b77e169..e70722ea615e 100644
--- a/drivers/dma-buf/heaps/Makefile
+++ b/drivers/dma-buf/heaps/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_DMABUF_HEAPS_DEFERRED_FREE) += deferred-free-helper.o
+obj-$(CONFIG_DMABUF_HEAPS_PAGE_POOL)	+= page_pool.o
 obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
 obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
 obj-$(CONFIG_DMABUF_HEAPS_DSP)          += dsp_heap.o
diff --git a/drivers/dma-buf/heaps/page_pool.c b/drivers/dma-buf/heaps/page_pool.c
new file mode 100644
index 000000000000..3dd4c3862dca
--- /dev/null
+++ b/drivers/dma-buf/heaps/page_pool.c
@@ -0,0 +1,246 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * DMA BUF page pool system
+ *
+ * Copyright (C) 2020 Linaro Ltd.
+ *
+ * Based on the ION page pool code
+ * Copyright (C) 2011 Google, Inc.
+ */
+
+#include <linux/freezer.h>
+#include <linux/list.h>
+#include <linux/sched/signal.h>
+#include <linux/slab.h>
+#include <linux/swap.h>
+#include "page_pool.h"
+
+static LIST_HEAD(pool_list);
+static DEFINE_MUTEX(pool_list_lock);
+
+static struct page *dmabuf_page_pool_alloc_pages(struct dmabuf_page_pool *pool)
+{
+	if (fatal_signal_pending(current))
+		return NULL;
+	return alloc_pages(pool->gfp_mask, pool->order);
+}
+
+static void dmabuf_page_pool_free_pages(struct dmabuf_page_pool *pool,
+					       struct page *page)
+{
+	__free_pages(page, pool->order);
+}
+
+static void dmabuf_page_pool_add(struct dmabuf_page_pool *pool, struct page *page)
+{
+	int index;
+
+	if (PageHighMem(page))
+		index = POOL_HIGHPAGE;
+	else
+		index = POOL_LOWPAGE;
+
+	mutex_lock(&pool->mutex);
+	list_add_tail(&page->lru, &pool->items[index]);
+	pool->count[index]++;
+	mod_node_page_state(page_pgdat(page), NR_KERNEL_MISC_RECLAIMABLE,
+			    1 << pool->order);
+	mutex_unlock(&pool->mutex);
+}
+
+static struct page *dmabuf_page_pool_remove(struct dmabuf_page_pool *pool, int index)
+{
+	struct page *page;
+
+	mutex_lock(&pool->mutex);
+	page = list_first_entry_or_null(&pool->items[index], struct page, lru);
+	if (page) {
+		pool->count[index]--;
+		list_del(&page->lru);
+		mod_node_page_state(page_pgdat(page), NR_KERNEL_MISC_RECLAIMABLE,
+				    -(1 << pool->order));
+	}
+	mutex_unlock(&pool->mutex);
+
+	return page;
+}
+
+static struct page *dmabuf_page_pool_fetch(struct dmabuf_page_pool *pool)
+{
+	struct page *page = NULL;
+
+	page = dmabuf_page_pool_remove(pool, POOL_HIGHPAGE);
+	if (!page)
+		page = dmabuf_page_pool_remove(pool, POOL_LOWPAGE);
+
+	return page;
+}
+
+struct page *dmabuf_page_pool_alloc(struct dmabuf_page_pool *pool)
+{
+	struct page *page = NULL;
+
+	if (WARN_ON(!pool))
+		return NULL;
+
+	page = dmabuf_page_pool_fetch(pool);
+	if (!page)
+		page = dmabuf_page_pool_alloc_pages(pool);
+
+	return page;
+}
+EXPORT_SYMBOL_GPL(dmabuf_page_pool_alloc);
+
+void dmabuf_page_pool_free(struct dmabuf_page_pool *pool, struct page *page)
+{
+	if (WARN_ON(pool->order != compound_order(page)))
+		return;
+
+	dmabuf_page_pool_add(pool, page);
+}
+EXPORT_SYMBOL_GPL(dmabuf_page_pool_free);
+
+static int dmabuf_page_pool_total(struct dmabuf_page_pool *pool, bool high)
+{
+	int count = pool->count[POOL_LOWPAGE];
+
+	if (high)
+		count += pool->count[POOL_HIGHPAGE];
+
+	return count << pool->order;
+}
+
+struct dmabuf_page_pool *dmabuf_page_pool_create(gfp_t gfp_mask, unsigned int order)
+{
+	struct dmabuf_page_pool *pool = kmalloc(sizeof(*pool), GFP_KERNEL);
+	int i;
+
+	if (!pool)
+		return NULL;
+
+	for (i = 0; i < POOL_TYPE_SIZE; i++) {
+		pool->count[i] = 0;
+		INIT_LIST_HEAD(&pool->items[i]);
+	}
+	pool->gfp_mask = gfp_mask | __GFP_COMP;
+	pool->order = order;
+	mutex_init(&pool->mutex);
+
+	mutex_lock(&pool_list_lock);
+	list_add(&pool->list, &pool_list);
+	mutex_unlock(&pool_list_lock);
+
+	return pool;
+}
+EXPORT_SYMBOL_GPL(dmabuf_page_pool_create);
+
+void dmabuf_page_pool_destroy(struct dmabuf_page_pool *pool)
+{
+	struct page *page;
+	int i;
+
+	/* Remove us from the pool list */
+	mutex_lock(&pool_list_lock);
+	list_del(&pool->list);
+	mutex_unlock(&pool_list_lock);
+
+	/* Free any remaining pages in the pool */
+	for (i = 0; i < POOL_TYPE_SIZE; i++) {
+		while ((page = dmabuf_page_pool_remove(pool, i)))
+			dmabuf_page_pool_free_pages(pool, page);
+	}
+
+	kfree(pool);
+}
+EXPORT_SYMBOL_GPL(dmabuf_page_pool_destroy);
+
+static int dmabuf_page_pool_do_shrink(struct dmabuf_page_pool *pool, gfp_t gfp_mask,
+				      int nr_to_scan)
+{
+	int freed = 0;
+	bool high;
+
+	if (current_is_kswapd())
+		high = true;
+	else
+		high = !!(gfp_mask & __GFP_HIGHMEM);
+
+	if (nr_to_scan == 0)
+		return dmabuf_page_pool_total(pool, high);
+
+	while (freed < nr_to_scan) {
+		struct page *page;
+
+		/* Try to free low pages first */
+		page = dmabuf_page_pool_remove(pool, POOL_LOWPAGE);
+		if (!page)
+			page = dmabuf_page_pool_remove(pool, POOL_HIGHPAGE);
+
+		if (!page)
+			break;
+
+		dmabuf_page_pool_free_pages(pool, page);
+		freed += (1 << pool->order);
+	}
+
+	return freed;
+}
+
+static int dmabuf_page_pool_shrink(gfp_t gfp_mask, int nr_to_scan)
+{
+	struct dmabuf_page_pool *pool;
+	int nr_total = 0;
+	int nr_freed;
+	bool only_scan = false;
+
+	if (!nr_to_scan)
+		only_scan = true;
+
+	mutex_lock(&pool_list_lock);
+	list_for_each_entry(pool, &pool_list, list) {
+		if (only_scan) {
+			nr_total += dmabuf_page_pool_do_shrink(pool,
+							       gfp_mask,
+							       nr_to_scan);
+		} else {
+			nr_freed = dmabuf_page_pool_do_shrink(pool,
+							      gfp_mask,
+							      nr_to_scan);
+			nr_to_scan -= nr_freed;
+			nr_total += nr_freed;
+			if (nr_to_scan <= 0)
+				break;
+		}
+	}
+	mutex_unlock(&pool_list_lock);
+
+	return nr_total;
+}
+
+static unsigned long dmabuf_page_pool_shrink_count(struct shrinker *shrinker,
+						   struct shrink_control *sc)
+{
+	return dmabuf_page_pool_shrink(sc->gfp_mask, 0);
+}
+
+static unsigned long dmabuf_page_pool_shrink_scan(struct shrinker *shrinker,
+						  struct shrink_control *sc)
+{
+	if (sc->nr_to_scan == 0)
+		return 0;
+	return dmabuf_page_pool_shrink(sc->gfp_mask, sc->nr_to_scan);
+}
+
+struct shrinker pool_shrinker = {
+	.count_objects = dmabuf_page_pool_shrink_count,
+	.scan_objects = dmabuf_page_pool_shrink_scan,
+	.seeks = DEFAULT_SEEKS,
+	.batch = 0,
+};
+
+static int dmabuf_page_pool_init_shrinker(void)
+{
+	return register_shrinker(&pool_shrinker);
+}
+module_init(dmabuf_page_pool_init_shrinker);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/dma-buf/heaps/page_pool.h b/drivers/dma-buf/heaps/page_pool.h
new file mode 100644
index 000000000000..e3ec9eaacbc2
--- /dev/null
+++ b/drivers/dma-buf/heaps/page_pool.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * DMA BUF PagePool implementation
+ * Based on earlier ION code by Google
+ *
+ * Copyright (C) 2011 Google, Inc.
+ * Copyright (C) 2020 Linaro Ltd.
+ */
+
+#ifndef _DMABUF_PAGE_POOL_H
+#define _DMABUF_PAGE_POOL_H
+
+#include <linux/device.h>
+#include <linux/kref.h>
+#include <linux/mm_types.h>
+#include <linux/mutex.h>
+#include <linux/shrinker.h>
+#include <linux/types.h>
+
+/* page types we track in the pool */
+enum {
+	POOL_LOWPAGE,      /* Clean lowmem pages */
+	POOL_HIGHPAGE,     /* Clean highmem pages */
+
+	POOL_TYPE_SIZE
+};
+
+/**
+ * struct dmabuf_page_pool - pagepool struct
+ * @count[]:		array of number of pages of that type in the pool
+ * @items[]:		array of list of pages of the specific type
+ * @mutex:		lock protecting this struct and especially the count
+ *			item list
+ * @gfp_mask:		gfp_mask to use from alloc
+ * @order:		order of pages in the pool
+ * @list:		list node for list of pools
+ *
+ * Allows you to keep a pool of pre allocated pages to use
+ */
+struct dmabuf_page_pool {
+	int count[POOL_TYPE_SIZE];
+	struct list_head items[POOL_TYPE_SIZE];
+	struct mutex mutex;
+	gfp_t gfp_mask;
+	unsigned int order;
+	struct list_head list;
+};
+
+struct dmabuf_page_pool *dmabuf_page_pool_create(gfp_t gfp_mask,
+						 unsigned int order);
+void dmabuf_page_pool_destroy(struct dmabuf_page_pool *pool);
+struct page *dmabuf_page_pool_alloc(struct dmabuf_page_pool *pool);
+void dmabuf_page_pool_free(struct dmabuf_page_pool *pool, struct page *page);
+
+#endif /* _DMABUF_PAGE_POOL_H */
-- 
2.25.0

