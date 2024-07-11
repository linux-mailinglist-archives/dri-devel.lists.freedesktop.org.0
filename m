Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B131292EFDA
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 21:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C6310EB66;
	Thu, 11 Jul 2024 19:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="jYgN4sw7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2077.outbound.protection.outlook.com [40.107.255.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9996310E23B
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 07:43:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wOxAyBMwvft1gu694CEOZ9t7BaN3J3UHitYs/BEykneiABr8omE8kOHMlcva9OysotZanY36F962bsLKEXeNV9BWiOvkiOQGMkx1Aqm4wrRPigeRud5fEWowKb10VkJU/sRSveNdLQ+dJwApbjzKv06NHWPS5mtIY0+38QDBGwl/0++zYe3UyIXGh8/h8mT/2DSo6M44OqXUuxmq7ltDkcfNLBio1YRwiGdu6gXeETr/Ul5TZ37IWbm+Kpau0gRq5GtsBhS7AuTjQPTKo6bMPxXlC9ZUHfMN2Ve1vIVdP/2UNJ/TciyPZp82BK3WsbdTXCVMBAPuyYo8i7ifvvIfGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7Ju9/SmZw8qKAWymyUmk8pY3M/hxkQSWLt0Fnx4aoI=;
 b=h1ybI1JQ01rH7NXJN/cybC/3eV8mcYBsLE0jMjMMYKyndBCaI3mPH4tqViTZOOr8A9s3+edrIEiy3Gh4umuNdknYxyQGX6kaaHEELaKZrMFxOh4ydQ1bMpxVzgvl5y2vfGJ8rQVkbk4a6jvr7wyC47Tqf1Llevi3uEBwLoo2BuGFpzeCOTkViM+dXZ5KegjSJoI8RoXrERo903+JYVPocVMwPsl3gKCQp5fKRu7DkvYjQhj/C2GQrJXrVq9FIgWYshvUYZAtxRXp/bHug3fHzAuKUoC9+fKJ+U8KKuTSzGnML6iVY2C7TPoDODY9/nHeJIeoPadU7SiINu7QMK8hnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7Ju9/SmZw8qKAWymyUmk8pY3M/hxkQSWLt0Fnx4aoI=;
 b=jYgN4sw7xQ4MZARjmCIdNFYLFR5ZKzxJpi+7uo4JIgOc5Esxy9rUqMOoceNkXspRfcDzxpZj95pdTrzTdP3ioIfYixRSe9R/MeU2TZz4AwiyACJBvSKNDQ7ZtTiRbGd1suqARbZr1OzdRQSK6/fBie7FmrtQ3c+bvgP/rCk3Y4O5iandnp5nwH/0Y9f6kHmeXG7k6cvAQupV/sFDujpRq9DYwbWlBunqIXTHIlW7Gq/CX8rcfjGtpxrQPM/wgBRtrrKpDsffTI8MjnPk416/EbGzPPRuBqakIG+RflWFZQfAaoWGUl7ntDQ5jiDIghC3eIdXwos20+rTh/cDxdVh1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TYSPR06MB6922.apcprd06.prod.outlook.com (2603:1096:400:46e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Thu, 11 Jul
 2024 07:42:58 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7741.030; Thu, 11 Jul 2024
 07:42:58 +0000
From: Huan Yang <link@vivo.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH 2/2] dma-buf: heaps: system_heap support
 DMA_HEAP_IOCTL_ALLOC_AND_READ
Date: Thu, 11 Jul 2024 15:42:17 +0800
Message-ID: <20240711074221.459589-3-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711074221.459589-1-link@vivo.com>
References: <20240711074221.459589-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0128.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::32) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TYSPR06MB6922:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c066c14-297e-43a8-89c2-08dca17d157c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9TezPtcdAY9KEAYrn4tbHXRnlO0bL8yTvyW+Ycftr1PJ894uL5FkIBGh0Kme?=
 =?us-ascii?Q?JYeWKXLWKRbXmd8IiAJolvdv/kbKx4DOaRF9upFq0WuJTPXQsrlrNT45R3QL?=
 =?us-ascii?Q?X7ghVjA7OhfEsTo4z56pmJbpGr/onA6mLVENxC+lSqZ1xRW+NGKTPcRfUnPn?=
 =?us-ascii?Q?Zz+SmeHXvxAi/D4nlOS4b+oHk0k0Cp/BFB/FVNaDx269fwkPmF44Jh4N533z?=
 =?us-ascii?Q?e+ahmroy3TAe11CBFBM2qbGc2E3EhpeywEgSbVD1hJQIRgZvXbiti3dMgz8M?=
 =?us-ascii?Q?RE2mCtHXFORpEInxB9TOpyTnUYnbQs3zHxzw6SjNK7cB5fDCU5Xo2qcAG95X?=
 =?us-ascii?Q?S+kJR9RWztCFsHbGBFd8XRaeJm3mNZ/GHGjTCsc9Hdl0cZAEu9wxVWyMXVb6?=
 =?us-ascii?Q?/bcL8LxaHpSYPpdZN+/LnAzAO0NomSYLFur5CVKwFe28vxljJqNqdzpJSvJj?=
 =?us-ascii?Q?o/qGr0ztWocmrUEXoD6W1DtIBXT/aAdKKWLBSdXQ35OIEBGZ1qdJV0NP0PIU?=
 =?us-ascii?Q?nvRn67/j987jCGbK0a972QhJYHX/7iWYQUGGbz7GPsQKgqIX6Q5tOFXCOFF7?=
 =?us-ascii?Q?VcYSZ0l3R7VEv7Y9Uy6ILI/wsLCMApJgJYifNYTMAYAgcZbQZP1YZJVh93t8?=
 =?us-ascii?Q?VD6xOEVi5X036oB7DShMjylqynJB+NC/diXohiF/iUhRTN+g866/HXudmlK4?=
 =?us-ascii?Q?qeTtBUPNgnChXI075bVHCphgM4OwiEGafkeqEGwpY6d3qay507YrVcwR/enw?=
 =?us-ascii?Q?YHbICmm9dD42/j2sYSzos4xyql93XB74ibYfT5rwTKIh/67Dnm5gqb5TxQxV?=
 =?us-ascii?Q?25s5UVCVU/CTPTXnXSPKv01bo0C+TIuYklpqc1jWJG3qMO1lLBWe9UA9/rdP?=
 =?us-ascii?Q?ogETnLzus5/Khr0tkTeEbdVTGZhU87LJtgdL2KYfyiFOmRxmyvU9WDVqUOCF?=
 =?us-ascii?Q?hS0y6xafXKzUxSItLtdtmolVW1zmWtj+AayxCZQbpVVScYfSCtHTgh2FmQpV?=
 =?us-ascii?Q?Zf4J3wHqSo7GuLQE9INvwJAZObhEYKys7oG3Y0lAx9JUi74plHJh3gaLp7+G?=
 =?us-ascii?Q?r94PTtLsTC9CbyQx3knrFPFxMvHVhFcPJajlTvnEO2hRWltFSNbyZjd4z/e8?=
 =?us-ascii?Q?3wVXVoSFhdjQDxopw5xrGApjh4tqj+vfHAosPUTPEzUnTZze2LJAqeNf4Cr8?=
 =?us-ascii?Q?V+N6ZuVV55CLgwFBbS0oKyDwsgjdfQWzVBmYHn/0vwKIBYj6O1T56fe/pe6r?=
 =?us-ascii?Q?Ueakt3bnSbsiGoagkOxK60V1lO+2s59jtdKQvjMjrLF2jcDO7j0ZR5vTSaiU?=
 =?us-ascii?Q?U4ySuQFmwdt9HCcKazHHYkunfkSCaCdtKGfN7ts19xKUUCl7sXpaVLmFlQmC?=
 =?us-ascii?Q?gH3E9rJkZyMUY65HvTSuVqFAokWefxxOFRk1nMSVgOs9QoQGXVxM+b6JD0g4?=
 =?us-ascii?Q?aboRTH/jbW0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xXPfmOFLMALWWrn+w/HYNnHzJyypntcyXgqbPk9rm7c+r5U+v0lLwpm4Iunr?=
 =?us-ascii?Q?HGtPuwHn+R/NXDTxf/MxQeJaj4RNkoZRB2N3Q2BXpzpgYLmnCin6Jy0N3DKb?=
 =?us-ascii?Q?M9uK/zivx29TONKi/ae4VC5nrjg9LYb+y8OPZPSAKhB4JLiB1JmyCwZWfAP5?=
 =?us-ascii?Q?p76Ny03mouQ8S3FXaIbjLa7vngOv4hgXZRAXnA0Q/RegoIcnCtH4MGg3y3c2?=
 =?us-ascii?Q?V3SrlzERLTcjiIxI1b3KaOc4ENSVBvEmICCIAn9RDq6QmswiKmMn1AFdJ17b?=
 =?us-ascii?Q?KmKSvUOX3pf5JXZCuotGEFp6e67QAERYeGUXpCPzMgYg1BhZYf/iycNGkX7N?=
 =?us-ascii?Q?/SB0ElQiSUQfHwPho9f9DLnNvfGq1InF7shIBeY02HagL7CKy+kTklpVUYnc?=
 =?us-ascii?Q?YsTEDYLih6RRM/RubXUz3r0XSS6C5SxlOqw32cBS/U3nHu/JNzeAU/pNuvoK?=
 =?us-ascii?Q?NT/r9TWQpUe+5mkRVQdfRG7IQQgChs8MzTt9bhhJDQv7jA2w+EEzgva4YUSw?=
 =?us-ascii?Q?kHKW2DenULrrFt45D5cQeEAFgfDltQExFUMNYk/88/rUhdpqywbhDyv3EWee?=
 =?us-ascii?Q?ArPsq1WS5juK7UCoZ+6OZM35PrU3lGwvzKl1zCcsDvY4IBNE3e/cjrHWduOJ?=
 =?us-ascii?Q?tsocq3+V5qwpHP75ICakaMaq7AG/mJZJMrjdYyjhx6zd09+7C6eUYO9d+tKQ?=
 =?us-ascii?Q?sbjmLJIbpgW8ZHrohC+uiXsHRtWJzJK0dE0HCOigy2H0hb414+CditnTvBGD?=
 =?us-ascii?Q?4olkvR5IaaXyBo2nDl+ZZUy2IHQhZaozFcosXhaqM3XA9Ah7URHUjo+jQjow?=
 =?us-ascii?Q?Rp3mY2SYhpnCoNeDYPHubs1dU9JQaKqRV/Hyv2S44GiZZucu86JKs3lUPQyr?=
 =?us-ascii?Q?iblmQF6IUCZYRXgNMsrZ+e9L7jOB7OSMGlrgAGCdBy/VuHSUZtbkmmww86e1?=
 =?us-ascii?Q?7vecMZ7EOH4pGLayZjPz5U6S8BHDHA9PTsc7tJuA/y6+ZkGwyYQVSYmGQtr2?=
 =?us-ascii?Q?g63UA3Kn5iBSE0nA3DCuxAPAy6qSq+OotqrxTejZqfnS9LeI/ayUrPRlp/B6?=
 =?us-ascii?Q?YXf2/drkqHZkKOHf/ZC8vA41S3yyI62KgAzTj6rOW0AhvWMGvHKHf4IVggSo?=
 =?us-ascii?Q?lVOMbH29Kq8IEWPuE8SvPrsiR8pFSd6/qt1P7AYUiRcriAccLcUShgkILDLF?=
 =?us-ascii?Q?ajv1A9DHJnpVCVc8KlxPyCc2eD4LXGXdKCQtooKMx1vx+Xhiaq3tlbzw9GSd?=
 =?us-ascii?Q?XgzH9M905GqUgNpPnJVwiYvlv/La5M5Wkouki/6gn89HTqDw4ajOEbaJiSfy?=
 =?us-ascii?Q?Fm9vbWWBsDwCLt887Ye1F8qqucrszscs0rbClFr5zAO+hCVnmqmBmQwMvA7m?=
 =?us-ascii?Q?g1NiuZsxm+DqT5wguacALl+5+KOUv0TkhjJy7j4mhCIa4wYgD/WblXnIS3mj?=
 =?us-ascii?Q?GKAclJ7rbZuT1YcFLoTQyKWNA0/AmnkeE3AdYkD8XDxTVH2ue7zZUqe7Yhpq?=
 =?us-ascii?Q?EvS5/Llm6M4N7hrbpgXv4ghplLi9MNc4XbCoI+jhlsl8wLMXlu1LUFdikp7W?=
 =?us-ascii?Q?6AP1xxbuxP7dHhHmnyHAonb1knnqCxHFbVc3aBKN?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c066c14-297e-43a8-89c2-08dca17d157c
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 07:42:58.4626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k1iKcJ75EBMRwDxzOzS8YWk0SeV/ysfD7s3ojnHP5GeqsPBPqiGVlsrvncacbZK2TBiISfdQAUFqfh2GzN+zMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6922
X-Mailman-Approved-At: Thu, 11 Jul 2024 19:40:05 +0000
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

Example for DMA_HEAP_IOCTL_ALLOC_AND_READ used in system_heap.

By this, it will both alloc memory and trigger IO to load file
into each batched allocated memory.

Signed-off-by: Huan Yang <link@vivo.com>
---
 drivers/dma-buf/heaps/system_heap.c | 53 ++++++++++++++++++++++++++---
 1 file changed, 49 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index d78cdb9d01e5..a53a5e881538 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -331,10 +331,10 @@ static struct page *alloc_largest_available(unsigned long size,
 	return NULL;
 }
 
-static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
-					    unsigned long len,
-					    u32 fd_flags,
-					    u64 heap_flags)
+static struct dma_buf *__system_heap_allocate(struct dma_heap *heap,
+					      struct dma_heap_file *heap_file,
+					      unsigned long len, u32 fd_flags,
+					      u64 heap_flags)
 {
 	struct system_heap_buffer *buffer;
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
@@ -346,6 +346,7 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 	struct list_head pages;
 	struct page *page, *tmp_page;
 	int i, ret = -ENOMEM;
+	struct dma_heap_file_task *heap_ftask;
 
 	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
 	if (!buffer)
@@ -357,6 +358,15 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 	buffer->len = len;
 
 	INIT_LIST_HEAD(&pages);
+
+	if (heap_file) {
+		heap_ftask = dma_heap_declare_file_read(heap_file);
+		if (!heap_ftask) {
+			kfree(buffer);
+			return ERR_PTR(-ENOMEM);
+		}
+	}
+
 	i = 0;
 	while (size_remaining > 0) {
 		/*
@@ -372,6 +382,11 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 		if (!page)
 			goto free_buffer;
 
+		if (heap_file) {
+			if (dma_heap_prepare_file_read(heap_ftask, page) &&
+			    dma_heap_submit_file_read(heap_ftask))
+				goto free_buffer;
+		}
 		list_add_tail(&page->lru, &pages);
 		size_remaining -= page_size(page);
 		max_order = compound_order(page);
@@ -400,9 +415,18 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 		ret = PTR_ERR(dmabuf);
 		goto free_pages;
 	}
+
+	if (heap_file && dma_heap_destroy_file_read(heap_ftask)) {
+		dma_buf_put(dmabuf);
+		dmabuf = ERR_PTR(-EIO);
+	}
+
 	return dmabuf;
 
 free_pages:
+	if (heap_file)
+		dma_heap_wait_for_file_read(heap_ftask);
+
 	for_each_sgtable_sg(table, sg, i) {
 		struct page *p = sg_page(sg);
 
@@ -410,6 +434,9 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 	}
 	sg_free_table(table);
 free_buffer:
+	if (heap_file)
+		dma_heap_destroy_file_read(heap_ftask);
+
 	list_for_each_entry_safe(page, tmp_page, &pages, lru)
 		__free_pages(page, compound_order(page));
 	kfree(buffer);
@@ -417,8 +444,26 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 	return ERR_PTR(ret);
 }
 
+static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
+					    unsigned long len, u32 fd_flags,
+					    u64 heap_flags)
+{
+	return __system_heap_allocate(heap, NULL, len, fd_flags, heap_flags);
+}
+
+static struct dma_buf *
+system_heap_allocate_read_file(struct dma_heap *heap,
+			       struct dma_heap_file *heap_file, u32 fd_flags,
+			       u64 heap_flags)
+{
+	return __system_heap_allocate(heap, heap_file,
+				      PAGE_ALIGN(dma_heap_file_size(heap_file)),
+				      fd_flags, heap_flags);
+}
+
 static const struct dma_heap_ops system_heap_ops = {
 	.allocate = system_heap_allocate,
+	.allocate_read_file = system_heap_allocate_read_file,
 };
 
 static int system_heap_create(void)
-- 
2.45.2

