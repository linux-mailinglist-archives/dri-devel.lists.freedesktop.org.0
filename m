Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D805887DA
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 09:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2699010F50F;
	Wed,  3 Aug 2022 07:21:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2059.outbound.protection.outlook.com [40.107.20.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B92B10FCB5
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 09:58:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OrAAmiL71WJEZ2sYcwu162xdjsCfJz+mi7d/EviKKbG6KkKoS1cEZp57kwt5M2caT/5fpTNOpTgb/bGZfk1MP9rb8rwBHC8SPthFRrFj7TURgGMrd9QoBcQ7u8Q5JsFC3vO6bdtsyXSx/S0LUY/vvSGuNiDjLNMXH7dWTy34egH02ufX1MJs7m17IdVfV2lAkg077YbuVekb5YocaRpjjt3GrAS7L/4GwAzlPJBaeplyzwHouAFWbDsXMdlyqmPhg/B6N0e8iqmm9WYRa0biiTCbIcrItwyCIu5z+XgqmqhyQlqR1jEYLln5RWwGFow+u4wQ1T2TCMgYxV4rTf1Ywg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXOdF3cE6IyAZrsT4wTECkt/yCciaBYokLHgvJeWwJ4=;
 b=ICi+ZmSbWO9+hfxeVNHXBoztbMHjnE80WQtf34gxy9x71ekVVLh30XZsqSTbzhl7usF+X49k5IFDa77pJ+lT4/JrtHcYvNkAXWsC2ncaUm1tOfAoXML21GdMMtHslNCzMQlysRMJ71JnWcuaHHU46SbuyIRIj8FMszSH1tfsAfZzrHZBX6pabLij5VzR9TALy+oUiAhAE5YrmQy6QdCjnbk89dKwM/aGgIpEqgdHst9Sg6fVCJzMBH6Twe48KwinSc7hgxxIqnRpy+qWwsy6iKn38F920sEucxDUufw3SDivAi2sQSLkAkZj1P/v1l4W/b6oFmBEgqqqHujBt5HfPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXOdF3cE6IyAZrsT4wTECkt/yCciaBYokLHgvJeWwJ4=;
 b=RMEpMqfhlhwZTCCuJdBytFnkHQwT2TjkzRvZq6PvpJ9fHE7fMk1Z+YJ+wPLin72I8paK2y/07aO7+3PCARnLBFSovApPgxqoq943CA89gn2ThQAHvy5HxRRtv34iP6cq99TYsNJ9qK8vOCHsvn7adqElJK1h2xSnE2rbwmuruoA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6737.eurprd04.prod.outlook.com (2603:10a6:208:176::18)
 by AS8PR04MB8341.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Tue, 2 Aug
 2022 09:58:51 +0000
Received: from AM0PR04MB6737.eurprd04.prod.outlook.com
 ([fe80::6ca7:299e:d92f:7d1b]) by AM0PR04MB6737.eurprd04.prod.outlook.com
 ([fe80::6ca7:299e:d92f:7d1b%5]) with mapi id 15.20.5482.011; Tue, 2 Aug 2022
 09:58:51 +0000
From: Olivier Masse <olivier.masse@nxp.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, christian.koenig@amd.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] ANDROID: dma-buf: heaps: Add deferred-free-helper library
 code
Date: Tue,  2 Aug 2022 11:58:39 +0200
Message-Id: <20220802095843.14614-2-olivier.masse@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: a0696432-f15e-42e3-edcf-08da746d9994
X-MS-TrafficTypeDiagnostic: AS8PR04MB8341:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4j7UWFRmKfOkhZ9E1PD5Am1xX/1ykjbLzUYkFeGXDQPUQJZWkWm+30KxykNIVXKC2UCJGS9UXrL1PEkNpSwAjkjQSV3rqfohOudMgEoH9ewkbxdtDLdMoNDBuBAtnDazjUkdl3rrXVSeWwIPhOGVPKdoHoJt2etVAMQ7nBZZuarljoF/DZe2oeE+IO4neWq+V2vMCtEKikksoqSakAunl7qkTQd9uQaZgv8K5qoDoHOP1x7iAbukQMIikTgYfGT+QDq1S53EHZ74K9VHoOyc0rz4ibudKKG+YvArmyUu3+rn1qoIU0BR4PmrhNT04tkkIrbgUAgIL8u9Py/gznfjgqIMyzOWdLyCA2hSJWaKfS5y/jo6yiZEQOvCdxQ3NKsuboawC2YBrBo731d880r2TNnwxiV80fJXO6RrJZld6rYJ/9gWRfCmG+vxsECHK7Ku93Ik1ipTTOv2TQnuDC2kJoeBCwK5ad0g7/t9A/Z8VjFiJZXkAC8HuM5GmJuI0CPDH/m6MkgiWKMaWZcvoVe8AwtrL/gOkmg8urq9evZGoe51bnDV0p6Ga50zlXSEZy/79urTHD639M8S9pg2IznlyrlWrkmjqdMkzKRfGyThmgVb6gDN10rGsoYWPHQAze8jgs4BfoW/78MuJYLcMRCoLL6UgQRQIV/VfPbh+BxMSs0eJRZ1gO9/+5dlFezBc3Shf7djOd/jY4XYOxc8o8tjiwEMEGoR+H3T0vNs6YpwsDHAHtTON7dKcEWdSxLXW265/zI+hPdjQhJ2ld+jzYOP9T3bG1lIKQJLk4koeUditEo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB6737.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(366004)(136003)(39860400002)(376002)(41300700001)(2906002)(83380400001)(2616005)(86362001)(6666004)(52116002)(6506007)(44832011)(1076003)(36756003)(26005)(6512007)(38100700002)(186003)(38350700002)(6486002)(5660300002)(8676002)(66556008)(66476007)(66946007)(8936002)(478600001)(4326008)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2h5RFFmSS9QbkZubFAvczV0WWtjNTBIRDViQ2YxaFI4TE9Rb1poT0lDUW0r?=
 =?utf-8?B?UnBGWkJmOEQweWxrV2VrRi9ibnY4OFdQT25KWWNKYVlwbzVaWDJ1NTRvdnNt?=
 =?utf-8?B?a25hMG5DcWkyZFBHY0RjUWQ3aUw3N0dsV3ROWWMxeGNKMVlOZytSSUlLUFBu?=
 =?utf-8?B?MVRObXlHUm00OVk2djMzVkdEc3hUemVnaUE3K1E1elB4SlpiSHMwalcrZkVD?=
 =?utf-8?B?V2REOTlnLytZR091ZVBqTlF0aGhJYjlQbkN3OHpwODB0b0JIOTQ3amdIRGE5?=
 =?utf-8?B?WXNSZmh5dlJITlNONnQyM3lEOFdDQlNyK0dLaDUyRjFaWFNtNVhSUDdiZGdo?=
 =?utf-8?B?dFplRTJ0KzMrdHdKZFJ5aVIyaUlWOEFTWWp3MkhYb3JxL2U2L0ZlSW84aVAx?=
 =?utf-8?B?bGRPYmdjS0ZaTVMvRmZqSUJqK3p5UVJGSzZXZzdkUU1zbitsS2tJSnFMYm5y?=
 =?utf-8?B?ZGhnM0NHWFdsd3FwR2JxTVI1Si9VR0l0UTZsWTg1K2NWalhieXVmNGFlMWVQ?=
 =?utf-8?B?MFR5QnNrcFF2WHBUZUdzRTJBd0RxcjNHejVHWU5yRlhjQjdReFV6YnRadzBq?=
 =?utf-8?B?cVVGYjd4ZjBGZmVqOHA1TmZWKzhoU2Y0ejI0azRhdG1ualpOREQzYjMzV3Iw?=
 =?utf-8?B?Vi8vTjFXN1V0R1YyYThNNW8xWFJOMDJzK3E1WmU1cXlaY21YanVVSVpVdUZl?=
 =?utf-8?B?YlRNd0NKbTNsMmdjRGpBeXFGME90RlcyRTNRcFNzai8yQTVPNnl4VDUyL3VZ?=
 =?utf-8?B?Vm1BYnVzZElEOEZlVi9pamFDSERVQzZNVHd3WHFVcDdTa05keXhpcnFuaW1E?=
 =?utf-8?B?ZVk5QWRrUGp4WUhmSHI0cTVBbC9xcFJYaTVtRk9oTEw5Y0IyUGZ4eXFJN1NE?=
 =?utf-8?B?MkI3UHkyWmMvT3hrMUlVYUljVnBGcVYrYkpIV1J4VVp0MnlqT0REMWMzSCtN?=
 =?utf-8?B?Z1kwdGVHdTNPdGgwVGhBMlZwSjc2RE1nekJHTVVrSHp3YTU2ZFZBQmZST2sy?=
 =?utf-8?B?M0V3OHhrdytrTjd3YTFsRDVSWURrMFUyRHZxUDdJajR6OHZDTFpQcmt3TGNi?=
 =?utf-8?B?U2VsQklYQjJ4a2Z4Y0RBeEZyQVJrYTdRVmdQYld6QUVhbm9sc3dmVVo5Q2Nv?=
 =?utf-8?B?YWNoZHRkYklrbVdldnhBWXAzSWxPclVNaTNaeFN1R3NDbU4rUk5iOXNzb3NS?=
 =?utf-8?B?dDJsWnNEWi9aS0ZsZjAyT2lOZHlrY1VaVFJPblZReCtvUlJTQWx1ZVlESkhh?=
 =?utf-8?B?S0dTTlFwU05JZTlIelhGREQzVStUSWNHNTRma2R0WThMV1A5MXFxMHBGb0V1?=
 =?utf-8?B?OUtvanZ6TDVud01KTFNEcUVhYUFMY04vcmZxMWhrQUM2ZGM1bklKZTJ6YW5U?=
 =?utf-8?B?ZnNMK1hhekdOYU81ZEZ4SlVyMVdzYlJnaFVMZDZvYzRaL2NCcFl1YmxEQVJq?=
 =?utf-8?B?OGVBdDQ4ME44bjBGZ2g4SFVSbDJDN3Bwc1orVEc0UU8rN3FKMnVDNythcU11?=
 =?utf-8?B?d21KRGUyTUNJMWQ2TDdpbTlhdXQ3UW5CSXYwaEQ5MVpwSGxrcHp5amkwWGt2?=
 =?utf-8?B?YUxnRHRUNXd0WjA4MFA3RUs5K2tQcHJkUEpaNm94amd2ckhacWdTUWFYd2hH?=
 =?utf-8?B?TUlNc1BFOTFWcEMxUDNia2NKK1VrZnlCaGVzOUY2aTU0MWZYMFlLNVg2Mmlw?=
 =?utf-8?B?ZVgwSUlhemNXRi9iV0pxNVlGNE9LejRZNEsrNGI0T1pxT2d5RzlJTFJzbkFl?=
 =?utf-8?B?blFLK3B6eURhR3NxNTFaYTh2U2lqaWdFK3VwV0RFaVZFYmtUWGxkc004REN3?=
 =?utf-8?B?T2oxWEJFV1dlcW1CMDlqd0kyWjlZK09LMENxeUtjQXNVRGQ0dUg2UGF4TzZt?=
 =?utf-8?B?RUhQc01EbWVSMzIzTkNoSk9sblZZWkpXanRkTDJjb3FhVjhOWGsybHhpZDZZ?=
 =?utf-8?B?dlpzN3FTc1BkclRQL2J3OW5kc0I2SGdXdytoaG9pU2ZubjJnenA2KytiWnlw?=
 =?utf-8?B?K082aWlIRWl5RE9aY0RMU3lGdjFEcmpZaFRzZjN4cFAyRUxFakFzQ2xNbWRp?=
 =?utf-8?B?ajlvN3pRZWgrcGVROUt3Z3VOUDNwNEw1cnNiS05WclR3U1RIMzIyYXRWWi9p?=
 =?utf-8?Q?i+uhXwqf8DPyRk5szjkSEsnvH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0696432-f15e-42e3-edcf-08da746d9994
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 09:58:51.2496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kwtc640SNxd0zYeuD/PzoeUH9BLGiec7c8muO2Mcr5RCmYh/PLkhOu7uaB2fb5QGo3f3ov9WL/C4wIg1rvm6NQ==
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

From: John Stultz <john.stultz@linaro.org>

This patch provides infrastructure for deferring buffer frees.

This is a feature ION provided which when used with some form
of a page pool, provides a nice performance boost in an
allocation microbenchmark. The reason it helps is it allows the
page-zeroing to be done out of the normal allocation/free path,
and pushed off to a kthread.

As not all heaps will find this useful, its implemented as
a optional helper library that heaps can utilize.

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Daniel Mentz <danielmentz@google.com>
Cc: Ørjan Eide <orjan.eide@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: James Jones <jajones@nvidia.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
Bug: 168742043
---
 drivers/dma-buf/heaps/Kconfig                |   3 +
 drivers/dma-buf/heaps/Makefile               |   1 +
 drivers/dma-buf/heaps/deferred-free-helper.c | 136 +++++++++++++++++++
 drivers/dma-buf/heaps/deferred-free-helper.h |  63 +++++++++
 4 files changed, 203 insertions(+)
 create mode 100644 drivers/dma-buf/heaps/deferred-free-helper.c
 create mode 100644 drivers/dma-buf/heaps/deferred-free-helper.h

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index 3782eeeb91c0..8ee64277a5d2 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -1,3 +1,6 @@
+config DMABUF_HEAPS_DEFERRED_FREE
+	tristate
+
 config DMABUF_HEAPS_SYSTEM
 	bool "DMA-BUF System Heap"
 	depends on DMABUF_HEAPS
diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makefile
index 29733f84c354..5de95b77e169 100644
--- a/drivers/dma-buf/heaps/Makefile
+++ b/drivers/dma-buf/heaps/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_DMABUF_HEAPS_DEFERRED_FREE) += deferred-free-helper.o
 obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+= system_heap.o
 obj-$(CONFIG_DMABUF_HEAPS_CMA)		+= cma_heap.o
 obj-$(CONFIG_DMABUF_HEAPS_DSP)          += dsp_heap.o
diff --git a/drivers/dma-buf/heaps/deferred-free-helper.c b/drivers/dma-buf/heaps/deferred-free-helper.c
new file mode 100644
index 000000000000..478faa319908
--- /dev/null
+++ b/drivers/dma-buf/heaps/deferred-free-helper.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Deferred dmabuf freeing helper
+ *
+ * Copyright (C) 2020 Linaro, Ltd.
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
+
+#include "deferred-free-helper.h"
+
+static LIST_HEAD(free_list);
+static size_t list_nr_pages;
+static wait_queue_head_t freelist_waitqueue;
+static struct task_struct *freelist_task;
+static DEFINE_SPINLOCK(free_list_lock);
+
+void deferred_free(struct deferred_freelist_item *item,
+		   void (*free)(struct deferred_freelist_item*,
+				enum df_reason),
+		   size_t nr_pages)
+{
+	unsigned long flags;
+
+	if (!nr_pages)
+		return;
+
+	INIT_LIST_HEAD(&item->list);
+	item->nr_pages = nr_pages;
+	item->free = free;
+
+	spin_lock_irqsave(&free_list_lock, flags);
+	list_add(&item->list, &free_list);
+	list_nr_pages += nr_pages;
+	spin_unlock_irqrestore(&free_list_lock, flags);
+	wake_up(&freelist_waitqueue);
+}
+EXPORT_SYMBOL_GPL(deferred_free);
+
+static size_t free_one_item(enum df_reason reason)
+{
+	unsigned long flags;
+	size_t nr_pages;
+	struct deferred_freelist_item *item;
+
+	spin_lock_irqsave(&free_list_lock, flags);
+	if (list_empty(&free_list)) {
+		spin_unlock_irqrestore(&free_list_lock, flags);
+		return 0;
+	}
+	item = list_first_entry(&free_list, struct deferred_freelist_item, list);
+	list_del(&item->list);
+	nr_pages = item->nr_pages;
+	list_nr_pages -= nr_pages;
+	spin_unlock_irqrestore(&free_list_lock, flags);
+
+	item->free(item, reason);
+	return nr_pages;
+}
+
+static unsigned long get_freelist_nr_pages(void)
+{
+	unsigned long nr_pages;
+	unsigned long flags;
+
+	spin_lock_irqsave(&free_list_lock, flags);
+	nr_pages = list_nr_pages;
+	spin_unlock_irqrestore(&free_list_lock, flags);
+	return nr_pages;
+}
+
+static unsigned long freelist_shrink_count(struct shrinker *shrinker,
+					   struct shrink_control *sc)
+{
+	return get_freelist_nr_pages();
+}
+
+static unsigned long freelist_shrink_scan(struct shrinker *shrinker,
+					  struct shrink_control *sc)
+{
+	unsigned long total_freed = 0;
+
+	while (total_freed < sc->nr_to_scan) {
+		size_t pages_freed = free_one_item(DF_UNDER_PRESSURE);
+
+		if (!pages_freed)
+			break;
+
+		total_freed += pages_freed;
+	}
+
+	return total_freed;
+}
+
+static struct shrinker freelist_shrinker = {
+	.count_objects = freelist_shrink_count,
+	.scan_objects = freelist_shrink_scan,
+	.seeks = DEFAULT_SEEKS,
+	.batch = 0,
+};
+
+static int deferred_free_thread(void *data)
+{
+	while (true) {
+		wait_event_freezable(freelist_waitqueue,
+				     get_freelist_nr_pages() > 0);
+
+		free_one_item(DF_NORMAL);
+	}
+
+	return 0;
+}
+
+static int deferred_freelist_init(void)
+{
+	init_waitqueue_head(&freelist_waitqueue);
+	freelist_task = kthread_run(deferred_free_thread, NULL,
+				    "%s", "dmabuf-deferred-free-worker");
+	if (IS_ERR(freelist_task)) {
+		pr_err("Creating thread for deferred free failed\n");
+		return PTR_ERR(freelist_task);
+	}
+	sched_set_normal(freelist_task, 19);
+
+	return register_shrinker(&freelist_shrinker);
+}
+module_init(deferred_freelist_init);
+MODULE_LICENSE("GPL v2");
+
diff --git a/drivers/dma-buf/heaps/deferred-free-helper.h b/drivers/dma-buf/heaps/deferred-free-helper.h
new file mode 100644
index 000000000000..4ed5893fdf3a
--- /dev/null
+++ b/drivers/dma-buf/heaps/deferred-free-helper.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Deferred dmabuf freeing helper
+ *
+ * Copyright (C) 2020 Linaro, Ltd.
+ *
+ * Based on the ION page pool code
+ * Copyright (C) 2011 Google, Inc.
+ */
+
+#ifndef DEFERRED_FREE_HELPER_H
+#define DEFERRED_FREE_HELPER_H
+
+/**
+ * df_reason - enum for reason why item was freed
+ *
+ * This provides a reason for why the free function was called
+ * on the item. This is useful when deferred_free is used in
+ * combination with a pagepool, so under pressure the page can
+ * be immediately freed.
+ *
+ * DF_NORMAL:         Normal deferred free
+ *
+ * DF_UNDER_PRESSURE: Free was called because the system
+ *                    is under memory pressure. Usually
+ *                    from a shrinker. Avoid allocating
+ *                    memory in the free call, as it may
+ *                    fail.
+ */
+enum df_reason {
+	DF_NORMAL,
+	DF_UNDER_PRESSURE,
+};
+
+/**
+ * deferred_freelist_item - item structure for deferred freelist
+ *
+ * This is to be added to the structure for whatever you want to
+ * defer freeing on.
+ *
+ * @nr_pages: number of pages used by item to be freed
+ * @free: function pointer to be called when freeing the item
+ * @list: list entry for the deferred list
+ */
+struct deferred_freelist_item {
+	size_t nr_pages;
+	void (*free)(struct deferred_freelist_item *i,
+		     enum df_reason reason);
+	struct list_head list;
+};
+
+/**
+ * deferred_free - add item to the deferred free list
+ *
+ * @item: Pointer to deferred_freelist_item field of a structure
+ * @free: Function pointer to the free call
+ * @nr_pages: number of pages to be freed
+ */
+void deferred_free(struct deferred_freelist_item *item,
+		   void (*free)(struct deferred_freelist_item *i,
+				enum df_reason reason),
+		   size_t nr_pages);
+#endif
-- 
2.25.0

