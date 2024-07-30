Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D6C940A84
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 09:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED08B10E22C;
	Tue, 30 Jul 2024 07:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="PLyEKIs8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2056.outbound.protection.outlook.com [40.107.255.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 491E510E22C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 07:58:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KmpLahEW/EIuXcsIqOONhE5KG9gbd2SbNsuYAZjsQWMmnEcpS12epFBQSDZXGVKSyE7YPcAZknRG2QCK3Vblrz06N5chrUOjlIbKZRbNZtMeXD9jKp4T8yy4WOB87T7hFbb09+YJW/THS8WdQ+LOOlyNYntc0iK9PY85fVgg9xYZfGqMXlpTFW2yfnNBZV3Ypk2seQPiwVHtXbjDJ7ZgZ/CwNLbjrwCq6CBu/poFVRR6lsfolDR2OQ90dq8mn/KECViCOztv4gusq05qx3tTC2AifNWhMijGqxKi6MoNXXhMqI3QstDrINnnz6l4w3JiNGTz7JErg8k8kse1fnFCgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwkAl1b4MB+YSDpyXIavZO0sgvpDyxBgLGnVFVR2ayc=;
 b=mExzFPzaow7P/JDS7gFIZPx7IYGO/geRrJcRaXi+Gcj/7GkJ/phexSmKZomCGrLTQLfaojY/HO0PUMD+fPfHJXnTJiCa8SxRuc4/y0VmrKcCK9ZqIu+O2lXq2YyplxUNIaDtAsiVWi5cFc+AcXObcDwYPBJI6TTgGhbEF85/oyERxPt7DxN0WsMZiCwIJPanhc8G2VVTW1sJWolHsayGMDge1LPZVuNdAMfzyJGh2ctsk78xtCsnes1pYHwZ9YdF8ERYRNcuwLXX9s14zZ7lqC/4vOlmpCSBqIpT6B052PO6nB5bB1ufb1JTUKwA2Syvl8ZQ4dYmNDIAzzH+4sWS1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwkAl1b4MB+YSDpyXIavZO0sgvpDyxBgLGnVFVR2ayc=;
 b=PLyEKIs8SFfrAGXe8KNCHrAV0K3C9XpgV89wrVSmrqRERiFVBOHwVcr1/VRdgTiVqmovg2aG4EnZ5nLqhyIPqXl89erITRYapnhhDM8JyqdY2rnRnxlQSHjxeuikUp90ExwlpbdKUxF4RJHIXx0pLmaixTlR7JbSGPzoomNbam0/XXhu42j+SS3RaCcsafFXi0K8J6NbzKQkzmbZr2Wts/n4jqN08JjZlo5jz7nQSA/G0rIat7oIt2eeFtfwlgvgX59iZC0E3YuNVcN+cYO4MmxKKeLjT1FPhx30PNfYXlpBBkx3S19xEBmX6hwYdHpAw/eUBdwQt8lWarPf9ONyBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SI2PR06MB5386.apcprd06.prod.outlook.com (2603:1096:4:1ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 07:58:21 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 07:58:20 +0000
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
Subject: [PATCH v2 2/5] dma-buf: heaps: Introduce async alloc read ops
Date: Tue, 30 Jul 2024 15:57:46 +0800
Message-ID: <20240730075755.10941-3-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730075755.10941-1-link@vivo.com>
References: <20240730075755.10941-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::14) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SI2PR06MB5386:EE_
X-MS-Office365-Filtering-Correlation-Id: 95d278e5-0b2c-4ee1-57b0-08dcb06d6103
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|52116014|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IghyNLEf/EVSJfKqkqL4evAnqjReJLon7Zy0UmYAAJrf0hdab7ICriGWnXxi?=
 =?us-ascii?Q?D0Fa/8mUE069sFHtwuymL8OTlx5Ot/3tB8F8b1OaxidrknAgVa+ULR6ynUYd?=
 =?us-ascii?Q?Ekrb6FkWoveZGAEhOA56iEwpIGiPecypi+mjNGElWNLyUBIXLWStTWcmiujk?=
 =?us-ascii?Q?S9UNbmxCV2/8GqzdBoc95tApD5H8R3Nx5X3wEmgl/u5AMkrD/in3C2fSodh8?=
 =?us-ascii?Q?UAOC3hDfuqa3KPQrFxXb7XQWhWcwqwiNwSGDahKjC91VZpkyeDJ389qDCH43?=
 =?us-ascii?Q?0LvX9jyNltV1LquvGU7OQ2iXcGaJq391RDMSluewIm5o/xnMekVx/grZqwlo?=
 =?us-ascii?Q?wBXlzdC8gDkcbLmYWD89sSEaT3MdpLGxcNf50w81rkUlPuKpLowcVYyYSD8r?=
 =?us-ascii?Q?bEOxPqFJeSU/UdFzb+FyZsy/1qgUegtxvXUai3PYtDA3ZrK3E5zG35ooUQu2?=
 =?us-ascii?Q?C7GKry8wVQrK2U6j4u51MV74eeJUNQfy734GPs9hDOTucy4yTnnOb3VIMqJO?=
 =?us-ascii?Q?tjIFr7rpA//aDbCHyYH5QobcbcIpkt1Zom/1giDf+nFd2yReC0HSUq7L/fX0?=
 =?us-ascii?Q?cpJOMaXjAR7UU6Mpj9IViejLh61mzkOvf41lZMnmkdRYp8DzsHJ6t3HemA1x?=
 =?us-ascii?Q?Vp3PbCFrZ9JTyNfzhlmUjUul3Cs9V8VxUFqPr3+BJABvDyvJky1P6GAGIlRX?=
 =?us-ascii?Q?uwnLbA1Xs9MSD1wM06q5cMkcn4vTDBGJ9EkjwGmLEUrokjpnve3wLJ7262qL?=
 =?us-ascii?Q?IzS5igC3b/SlAZFR2DfRZVD4piOCJwFx95cr3A7M3rWGh16/cjg3mo73WWpq?=
 =?us-ascii?Q?g/sN/ElM3dm5MbAa4KlcwZ6pnUVMhq4EY2/h0Wli787vHp7LVlB0gOjw2Ve6?=
 =?us-ascii?Q?wnkqaxLojDODDUTALvqs8coFfx44zuBXa92ocSao8YXsd2Cwy6aFtQ97/bfX?=
 =?us-ascii?Q?rSFhVY68MYIg1/fbcz6se67gWFfuVD3NRz/ZvmovbFcuJykYTfMPmWAuMyeI?=
 =?us-ascii?Q?/KkjrXK3oigyWv/sIa25CBx4KNsuoj151QvMHaGvqpsAVphdEP1xXAYA6DZe?=
 =?us-ascii?Q?3r4hPucWr3ce7ctfrQYPVCkRO/eCvbBYT6qPA3Js86HIHE3s/MJbGmitHWRC?=
 =?us-ascii?Q?4l8ebUONHPwTUCC9NdkYuBwz4dPgP54Vg8WA/RSNmhm76Au06hPnPD8273T/?=
 =?us-ascii?Q?W1Y6YU2GIWuPHik+vGc3b0gjpWd8dM+4IDz2Nnw5I+NSd/g4bbIzfiYJNsKr?=
 =?us-ascii?Q?lF9ihLfqysKIIJRfAIIe95e3G5iMc3x+SyPUkJxSx0diPAhntJS9NsRBp10V?=
 =?us-ascii?Q?JQXnZv2PTFCOLRHh9Trea5rwj3zPRd5l0KYdCF6lGCX6g77RwNBMzdv9hJi+?=
 =?us-ascii?Q?vPgpl/aUxs7gsePHkoVg8sH2pMla0gqKq82f/antp+A7XgnPiuPV4Dy16n1m?=
 =?us-ascii?Q?kDzoGxfsvaQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(52116014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n4hNhpF3EqIOqqo85rGT3p2rjQHiCy7jvoOVXJkQDSfybSNLP2tPXWa51oLZ?=
 =?us-ascii?Q?ZCUgNbsBvOGy+VLPG/PjzeG6Z8Sq2DIsY8UFmGNHzNDpEP7wi0SJkAQMied3?=
 =?us-ascii?Q?ECm5rHw7WkwJO614+HlHcgwGTYHOL1SOJ4aWlpeBGZ7+qKvnBZd+yysRkkrv?=
 =?us-ascii?Q?P5dHVkmf1RXKU7X0lCcbHTcvts4ZHEju6Vvczm2s44ku+BYv6oenTvcbaVCe?=
 =?us-ascii?Q?XVY9aWBF/dKv2v1qtAzb0npD6WBfADvz1H/wIILN0PzbTbSDpMDO+iHJ/gq/?=
 =?us-ascii?Q?MvX75jpYDblo9E3jUKQWO9X2Y/VbWhiArfmG+ax0cuj8sCqe9Wo7bt7nWPA1?=
 =?us-ascii?Q?Roxy7rXRJ1Yh/2vwPenCvnlXjvUeCS7oyj92qVM3OsS7Gct8bc/hcggPlC1U?=
 =?us-ascii?Q?9Ewi01RiWc5FcKvlerSs1SotSdUphC3vkMQ8QTxNbMGceWo5gSFX2J3HViCy?=
 =?us-ascii?Q?QLMPX28ckYvU7eGZEDRKpU9JJwlCZcPCu6TfTRFQj6EXBdVoXbSMPPX2uabC?=
 =?us-ascii?Q?7HCjN6xsXXQ0aWb6hIDwizdD/ug7vKsbdKL4ZFWsQsg9DTjnjc5WtNEeeJp6?=
 =?us-ascii?Q?rRkLtpbsr7S5aQnnPSP40OZubqeuV2WProRu467DxZOLezAeSuLB/w7Sd7B3?=
 =?us-ascii?Q?7oWaaOEc81IoeI88UdZr0NL7uIm3pIlqgSFxG2KZuZpSp1UL/niQ4CzeemNB?=
 =?us-ascii?Q?C1G0wUp5gI9L342B28TCdlV5G9CjdODtpx2d+JA/5mNfkxQI2vGAXbO1kMR3?=
 =?us-ascii?Q?5ucrnX5C/O+zUKRhTlawm86xFjXV9QBD2kYooVN40zfjKyUo6B2RIed1pHTi?=
 =?us-ascii?Q?YQsxRd99WUrNjteUjnaN/A2CCqDZgGtFSaO6c7uT7AHVSgBww4719f3OYOas?=
 =?us-ascii?Q?dvucZVKNCDOdUN0Qwo9AZFSsNPZYpuKJoeIVwj8cKHx6p8jFfbj2VviBq+Au?=
 =?us-ascii?Q?DdAJN8BlDXpVBPqwOj1x1t7Lsi+bi6/UmfSHUtNxTK1cWNTZuNwtyfayFknq?=
 =?us-ascii?Q?gXebs0MRpHHxaoKwql/3emjQhYDLcHTG8eCaOC/QI9uVQd/MPYT3XRlNVFlR?=
 =?us-ascii?Q?Kf1+Ugs6+RlUbn7JTUFq//Hip/L93l2BglGL4F9F5yylHtkripERrGMXL5/0?=
 =?us-ascii?Q?Xtv+z6OFUFxGseNlWZENL6eq+dWBAYOHFgeSkdpQajmMbIqocqBx+vTYlOdV?=
 =?us-ascii?Q?Ciwehz3IgBHB9CnujHFfPvoJwMR6iXSEYe9K73iv+glQ5ni7K3Qf5BR5jElm?=
 =?us-ascii?Q?sjShiEVGDhzjY7MWRBVvg+io5Ihlo//3MWNeF02NHSFPOl4NRhFII/XZsBdC?=
 =?us-ascii?Q?ayVuBIHnRoQVdjfIVeBXMoBXMh+UGfFU/NgFXWuKYQ+5fUOLpiubLyqH7I0+?=
 =?us-ascii?Q?ubsSuoeU67O5NpTq967Jwd5fqFMx+bmfyGCfhyeYwZhZULLA6Si+RyXqrmUa?=
 =?us-ascii?Q?/vN3Zqs1la447LseVHg34vdaatIFBlYxnmJWibr0LIhKCX/m2sGyatnUB80+?=
 =?us-ascii?Q?Rym5cS79aKgrg5k0iCIsG5l4mSXXDwMdTDuGT5cHF5gaTG1NNiwQqgjUCllp?=
 =?us-ascii?Q?g45RAu5ATv33zNdo+EgDoXB/zRno5Hljo+7I+9d2?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d278e5-0b2c-4ee1-57b0-08dcb06d6103
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 07:58:20.6791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RXzKR5JumcTh8xC6AN5T9SvgEz2OVpGNOvfNOE++LEHoZYwDfaxVmVGBZtflj8RzxXjFErV42NcLD3WEeQI1PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5386
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

The DMA_HEAP_ALLOC_AND_READ_FILE heap flag patch enables us to
synchronously read files using direct I/O.

This approach helps to save CPU copying and avoid a certain degree of
memory thrashing (page cache generation and reclamation)

When dealing with large file sizes, the benefits of this approach become
particularly significant.

However, there are currently some methods that can improve performance,
not just save system resources:

Due to the large file size, for example, a AI 7B model of around 3.4GB, the
time taken to allocate DMA-BUF memory will be relatively long. Waiting
for the allocation to complete before reading the file will add to the
overall time consumption. Therefore, the total time for DMA-BUF
allocation and file read can be calculated using the formula
   T(total) = T(alloc) + T(I/O)

However, if we change our approach, we don't necessarily need to wait
for the DMA-BUF allocation to complete before initiating I/O. In fact,
during the allocation process, we already hold a portion of the page,
which means that waiting for subsequent page allocations to complete
before carrying out file reads is actually unfair to the pages that have
already been allocated.

The allocation of pages is sequential, and the reading of the file is
also sequential, with the content and size corresponding to the file.
This means that the memory location for each page, which holds the
content of a specific position in the file, can be determined at the
time of allocation.

However, to fully leverage I/O performance, it is best to wait and
gather a certain number of pages before initiating batch processing.

This patch only provides an allocate_async_read heap ops, without
including other infrastructure for completing async reads and the
corresponding heap implementation. When the allocate_async_read ops heap
is not implemented, it will wait for the dma-buf to be allocated before
reading the file (sync).

Signed-off-by: Huan Yang <link@vivo.com>
---
 drivers/dma-buf/dma-heap.c | 14 ++++++++++----
 include/linux/dma-heap.h   |  8 ++++++--
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index f19b944d4eaa..91e241763ebc 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -131,21 +131,27 @@ static int dma_heap_buffer_alloc_and_read(struct dma_heap *heap, int file_fd,
 	struct dma_heap_file heap_file;
 	struct dma_buf *dmabuf;
 	int ret, fd;
+	bool async_read = heap->ops->allocate_async_read ? true : false;
 
 	ret = init_dma_heap_file(&heap_file, file_fd);
 	if (ret)
 		return ret;
 
-	dmabuf = heap->ops->allocate(heap, heap_file.fsize, fd_flags,
-				     heap_flags);
+	if (async_read)
+		dmabuf = heap->ops->allocate_async_read(heap, &heap_file,
+							fd_flags, heap_flags);
+	else
+		dmabuf = heap->ops->allocate(heap, heap_file.fsize, fd_flags,
+					     heap_flags);
 	if (IS_ERR(dmabuf)) {
 		ret = PTR_ERR(dmabuf);
 		goto error_file;
 	}
 
-	ret = dma_heap_read_file_sync(dmabuf, &heap_file);
-	if (ret)
+	if (!async_read && dma_heap_read_file_sync(dmabuf, &heap_file)) {
+		ret = -EIO;
 		goto error_put;
+	}
 
 	ret = dma_buf_fd(dmabuf, fd_flags);
 	if (ret < 0)
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 064bad725061..824acbf5a1bc 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -13,11 +13,12 @@
 #include <linux/types.h>
 
 struct dma_heap;
+struct dma_heap_file;
 
 /**
  * struct dma_heap_ops - ops to operate on a given heap
- * @allocate:		allocate dmabuf and return struct dma_buf ptr
- *
+ * @allocate:			allocate dmabuf and return struct dma_buf ptr
+ * @allocate_async_read:	allocate and async read file.
  * allocate returns dmabuf on success, ERR_PTR(-errno) on error.
  */
 struct dma_heap_ops {
@@ -25,6 +26,9 @@ struct dma_heap_ops {
 				    unsigned long len,
 				    u32 fd_flags,
 				    u64 heap_flags);
+	struct dma_buf *(*allocate_async_read)(struct dma_heap *heap,
+					       struct dma_heap_file *heap_file,
+					       u32 fd_flags, u64 heap_flags);
 };
 
 /**
-- 
2.45.2

