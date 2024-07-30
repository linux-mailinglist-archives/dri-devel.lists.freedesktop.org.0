Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA189940A85
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 09:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5370710E4D9;
	Tue, 30 Jul 2024 07:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="BFh6cPpW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2056.outbound.protection.outlook.com [40.107.255.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3047410E22C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 07:58:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ibMIILcptAK/lRvWraNbzWECbj2y7tJFcaYT7717xxucO7IMJY6/ZKp+rAQpWxb863s1ti7IP7wEj5X9QdRtJ7y36jBtas4hMdxNPDkGLF+vyFrJHzLMqSutzwCeqdqybXd40VXmZrtocj5SJzs9NtomBF2hk3SJQKGivuZq6OFp/XkeaD9WR1DQgCvqWGe3jOtLt7ti3/SEl6eKcdmkx51wGCARjN8cJxiRNzYefPxhZh7ITbiSBsbK9YymE5ylXtxcN1Uu9ji9PzXIMhOZeWy2uBJgpZzNmxe/KyGliiAk7D3RxxO30RsT8MJSSKDYmWx8JM+s/ecTZcSx4fOTVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGR4Lh2YwhY6zpo33Uuirwkrwfje1bok/xxCrDBZXJA=;
 b=HumtZLDjLsHxy7hAb6NHBM6eCZGcgg/GJntOsa80mBZykY0fphAHYfixMtRbkgNDTxiQjNOfjH+4t8DP8Uxazj4zXC/NrGG4V6smuZNH41bnKxaZd2EOKGkmOhanjgHySqqx/zXEDlcKWcmnE3HUZhIirKkauAPjAyoP1DyFQYnJ/1syqTXBel7RAurBaDWxpdcWyMewgvJVVYim8HSCiItPcb/CaDUZobcn85ZUZM4bE2gMot1NIoiBM+AQ5keM5aZK2GR3nSqj22tnlU9Ru9yJ49/yFqJEJNUIa5nHXheKDVA6J6s8NJpEaw6zMFFv3tA9oodhX3eYl/8FbPn5FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGR4Lh2YwhY6zpo33Uuirwkrwfje1bok/xxCrDBZXJA=;
 b=BFh6cPpWm2H1VZHiqRoY6g6qICFZLURZOX0lg+aU9RxWEXBa+5o3PNt4umtBofEiRbPVpm1V1Usck2W3TpozrNIpGcR7Wk8NFy43tL3sndQnGS6HH0JQB/9Ih0O8Ln0v+9XItL5W0shhpJdcWWsCg5IbDYBh/nJBTZOQztj8zVzrNfBRqubxQnVNZoOKlDu7MlFZAURVD8AldhrfTxOGj0AFtr3E4xvuLO8V331VgXzhUiu1DT2yAno0p8AMDGsMQ9nheo/NGzSdhZ6v5ueLh8bsbvdUqzJmjyBNY88k2LzyAt4UPrxuBpkTd5yKNy0jRNW2Chff8a2T/Vo+Nr6PKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SI2PR06MB5386.apcprd06.prod.outlook.com (2603:1096:4:1ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 07:58:26 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 07:58:26 +0000
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
Subject: [PATCH v2 4/5] dma-buf: heaps: system_heap alloc support async read
Date: Tue, 30 Jul 2024 15:57:48 +0800
Message-ID: <20240730075755.10941-5-link@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 523a96b6-36ba-426e-9eb9-08dcb06d6498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|52116014|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XQo43WgRewK5kpvSKfgdb4ECEQdfCWT1eD0ebSz1dwxSou8oVBEi49XDSJ5C?=
 =?us-ascii?Q?7HWohD47tVB8mDv/G458diLaRVtZuqb26G9shvRiQKJoSpaxmQ1JpwzfEtK3?=
 =?us-ascii?Q?Kx3D46wqsRFgmOoSo743sUlQBKP7fW/74W2orZQZ0NvZBCfVYMD+aJyzOvNv?=
 =?us-ascii?Q?kWoUzlyKjqO2f0LDc+PBkzdhGLnV20R2HuL4wNRMQ9q734PX17BN9YULhIt3?=
 =?us-ascii?Q?WeDThVRLTfomVEEyaCOjdNakHt64Rq7LZJ3eQCbFBZcwNmQAUSq4HykyrE1g?=
 =?us-ascii?Q?Sl6u7Wan1aYlJT4fOYMt7u0nvsjkJLOcZCtCOdtq7GS2TOpMJ/WK67OwPBc3?=
 =?us-ascii?Q?Zd4kKU5v9rRAZhbSpdfzIxdcMy952i89tgHQnMOB4U9dIWGAIYZ49mHQ7XKJ?=
 =?us-ascii?Q?EDx0207561hu8Q9v5dtCIZQYs6YQwhOcnGhmfeP+T1ZNjlS1jypwhF02Bk9R?=
 =?us-ascii?Q?FvCO7bjmbfRNXIB8RrbvKJPM2e60XmHnqsa+8tcnOLMxatlaL7VzSBssfntJ?=
 =?us-ascii?Q?+Fo1ihe+FGffgWJ+GpCRalfq8flRKsjhvHD2KZVPe6u065OBV2gQPZ1m/RWz?=
 =?us-ascii?Q?ylK+djiCvMzJsB3oZ+Tru/3rkCIGIl1NKQNFdRWNun++M9p2nsqka5SiHL61?=
 =?us-ascii?Q?IQHzn19iGK+afZwbEcLL8HJWvZrs6B649auL2iajuU+1Te7hhkdXZ5FW12Ot?=
 =?us-ascii?Q?wep37tqBrztlzqngt60nlXS8WiK1p+0L0sVyWIVcK2YIhSSmMsUtbF0JIMlL?=
 =?us-ascii?Q?20mO9JU2u1nYudumFfN8ekfCm0ZSt3gQly2HQZD8veCHxMCtyI48qWDB4vQU?=
 =?us-ascii?Q?35hd8Hr/M9vKOPGNTy7IBZFFR4Geo5Nvc9nntZN2ZoH7YDW2iAIqcuaYkEs8?=
 =?us-ascii?Q?wM4C9TW2lgT8byZX2Czt2jQQw9Q1QsEvpxKAlkkCcCt5CMS1N6aNOIQtZtUu?=
 =?us-ascii?Q?J//7+EsCtyKtSrRhittBjbLSlIdkykPLXRoz8RrBRW2dy8IlrTZpRO9eC2BO?=
 =?us-ascii?Q?9sBid4tQ6emfUQwtYWHSKNtPp+bXO4Wb1gE64SHijh6FEQ3Yhhuta39/0Ema?=
 =?us-ascii?Q?s/6Fxg6GPPSLOuIVAOV3S9kzH0qFB1TXokTNiYx7InifAKTc6RzQ0+Ny8+QE?=
 =?us-ascii?Q?vYkxR1vxCzHCzPblIDAx4ZbB3gfEjN7dDejYywLAUzvB1T2kC3tc4/KxglQu?=
 =?us-ascii?Q?exC9lf0JkBqAObb8tiLjNZ0eNp85rlNeahriM6/ahM6sSmzLP/0Qr2ek6qIp?=
 =?us-ascii?Q?YOJ7jf9Zkz6wACjyCFRH9TlGbAom0XGM3bwE9OpYtept6ToHwGE53iLSmJYs?=
 =?us-ascii?Q?UKACqLS2aDSpkxQ2vgi51ElK2R4kPlftMRWiHKKzP2Y1KmpX0WG1iZfD7Htw?=
 =?us-ascii?Q?sJqI1mC1VlMzscztVuI9cVSoJn44aslOjz2sPJFf27jp2JX5I4I74tLiKU4T?=
 =?us-ascii?Q?mZu0BXXVs78=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(52116014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rzs6RQHbab/xiuEBYw0QujHca8xB44dT6umiaA6GSD33EuRRyDCNo8W0OU57?=
 =?us-ascii?Q?S2PcyK2lGn6Y5Vh3rZvw+DFquZJkOxZ3y/HxSm4ViFUNdsCXlU/vrFpm63iy?=
 =?us-ascii?Q?xINl0gVcPHLrnzY2SRYb/owyt+bwrfHg6XUnQGtPBdhUn5ECa85KB5zOSglM?=
 =?us-ascii?Q?qz+stVibBGnM51lr6NYDoMUO86dDNHnDAhsg7EBTyqKmVaZWXNgP6Enz8li0?=
 =?us-ascii?Q?dPSk4OCBq7oBFax4UCS2lRJaXGltZ1IOGNJfW53bKkJ9Haax+i64pf1C6/pF?=
 =?us-ascii?Q?gwDZFGaEAC6Wkt8Eu+Swiz3YA4KAcYIh24AGncEklgvMZN7I9l9rjcufIiIl?=
 =?us-ascii?Q?VnBfvNoPJsLWh7XoLJtdLKQRXjx8btGqUmjLnCO+c0/2p16cD5gkOznq7XC8?=
 =?us-ascii?Q?zMSEXWs5xLCJddd/3273LEj+LSA6lle+Ge7RvBdbsGvBASauD6AOCZVSu0Mk?=
 =?us-ascii?Q?HMl++zpM1MGHM3RKckR4jnRVV/oicnRVEhMsVgld9xLRjkuwhQqjSCsIaOX6?=
 =?us-ascii?Q?carXIHDrhHn5A00RGESuPkoRvE+uysiXGnCq1F45ENJGelB6wQpw8k+d+80l?=
 =?us-ascii?Q?VD2H1SPyZ1JEyyxHJ6olhlvVxZ9MoIxPTZRJh5+PJcLKkCo1jX0pzLIIABDV?=
 =?us-ascii?Q?IxCm7iajsabok5JABKXEXaHentnceRHFzm6pTdwpvWlV7JFLOWPEOw2sxNEN?=
 =?us-ascii?Q?/pklmttxs632sW4dXGLxQHYPCbE6FD10qVwkbA0wcE0EBiMxBIw5lkwfS9In?=
 =?us-ascii?Q?roqpRu8CMUYLsRpSX393skXzlSkZKzwr6JFY8doSIYEB3KqZ+W8RNQdKQXEe?=
 =?us-ascii?Q?Cr1gq+XQieJhqvvAji1phM8dEXgl/U6s4XRmnRjtZpsBOx5suESQuzI+eDQH?=
 =?us-ascii?Q?gJYRZgyiYhozVOE2uZyvqOHyEWI5R36De2Hp34ujtevSTYMig5I/lNmL2REn?=
 =?us-ascii?Q?1jW5dFp8dEmZIJd+0LvWJSnmmKkExsRTb1FvJAB/CiwaDtOapLSbEQz1ENJn?=
 =?us-ascii?Q?MSD9C69LRQlofqSUdo52apLT/lVOVck4OqnebzpPaERG5waOiLeNIbK/QwZd?=
 =?us-ascii?Q?bEB0fejxP7HhxIUBPLHOqrFpti+u5UHvoRPI2C2N0ZUGCNhVlthb/JEnGW0L?=
 =?us-ascii?Q?GvHJIgtPrlk9iZR17Gh2/Td22rLSxdDRc71AXMoiC8GTQJQAw9uhmBVD1UFv?=
 =?us-ascii?Q?sC7TeWcRmSHSbqUDd2MUn7CRTdJZO/QdQiB/Em6QhpGeqPgWQD13KFPjq2xm?=
 =?us-ascii?Q?inLkoy0k4OLbFk+Kh4Vie6o3r8qvZ8R20wfngwycobEczDlFEJSBmBVc3ZQy?=
 =?us-ascii?Q?6cA1rPsxzm90kWIKD1dS5UQnfrqQXGi8JV5CLT6sV84b20c/sFN98+UHRpg9?=
 =?us-ascii?Q?yKMNv5LHCQND4uUcVnL6XIAqx50DrqsfIcyvpjeSAkvW4CLaQm9Mg7bQzq/U?=
 =?us-ascii?Q?+C8BqY9bEmS23G02iWEaDt/Oq+ofQdF8lKPtyAWnO3gWIhGi/BpAGRDAxD0R?=
 =?us-ascii?Q?UxiiyFQMm/NKHfvmkzbSOEJK1tXoiilRdItB8KgthGg9LNLgxdXU2LBC59W6?=
 =?us-ascii?Q?N2fxsTMKF7/Qn4fQnAMwJjlKD73C4JB0t2fnQoTX?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 523a96b6-36ba-426e-9eb9-08dcb06d6498
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 07:58:26.6794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nG7mh6LvnCbRz2V/JfUt2wJNVJlzC3Mr3fIG+QY3t4pkgglaAWaRZ7jBnTsoD6o/IKpiQ73zpdReDnS/aOPpLA==
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

The system heap cyclically allocates pages and then places these pages
into a scatter_list, which is then managed by the dma-buf.

This process can parallelize memory allocation and I/O read operations:

Gather each allocated page and trigger a submit once the limit is reached.
Once the memory allocation is complete, there is no need to wait
immediately for the file read to finish. Instead, continue preparing the
dma-buf until it is necessary to return the dma-buf, at which point
waiting for the file content to be fully read is required.

Note that the content of the page cannot be modified after it is
allocated in the heap, as it may cause conflicts with accessing the page
when reading from the file. There are currently no conflicts in the
system_heap for this part.

The formula for the time taken for system_heap buffer allocation and
file reading through async_read is as follows:

  T(total) = T(first gather page) + Max(T(remain alloc), T(I/O))

Compared to the synchronous read:
  T(total) = T(alloc) + T(I/O)

If the allocation time or I/O time is long, the time difference will be
covered by the maximum value between the allocation and I/O. The other
party will be concealed.

Therefore, the larger the size of the file that needs to be read, the
greater the corresponding benefits will be.

Signed-off-by: Huan Yang <link@vivo.com>
---
 drivers/dma-buf/heaps/system_heap.c | 70 +++++++++++++++++++++++++++--
 1 file changed, 66 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index d78cdb9d01e5..ba0c3d8ce090 100644
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
@@ -372,6 +382,13 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 		if (!page)
 			goto free_buffer;
 
+		/**
+		 * If alloc and read, gather each page to read task.
+		 * If got error, free buffer and return error.
+		 */
+		if (heap_file && dma_heap_gather_file_page(heap_ftask, page))
+			goto free_buffer;
+
 		list_add_tail(&page->lru, &pages);
 		size_remaining -= page_size(page);
 		max_order = compound_order(page);
@@ -400,9 +417,29 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 		ret = PTR_ERR(dmabuf);
 		goto free_pages;
 	}
+
+	/**
+	 * End of alloc, dma-buf export and anything we need, but maybe
+	 * file read is still work, so, wait it. if done, destroy all file
+	 * task.
+	 * But maybe something wrong when read file, if so, abandon dma-buf
+	 * return error.
+	 */
+	if (heap_file && dma_heap_end_file_read(heap_ftask)) {
+		dma_buf_put(dmabuf);
+		dmabuf = ERR_PTR(-EIO);
+	}
+
 	return dmabuf;
 
 free_pages:
+	/**
+	 * maybe we already trigger file read, so, before release pages,
+	 * wait for all running file read task done.
+	 */
+	if (heap_file)
+		dma_heap_wait_for_file_read(heap_ftask);
+
 	for_each_sgtable_sg(table, sg, i) {
 		struct page *p = sg_page(sg);
 
@@ -410,6 +447,13 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 	}
 	sg_free_table(table);
 free_buffer:
+	/**
+	 * maybe we already trigger file read, so, before release pages and
+	 * return, destroy file task, include running task.
+	 */
+	if (heap_file)
+		dma_heap_end_file_read(heap_ftask);
+
 	list_for_each_entry_safe(page, tmp_page, &pages, lru)
 		__free_pages(page, compound_order(page));
 	kfree(buffer);
@@ -417,8 +461,26 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
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
+system_heap_allocate_async_read_file(struct dma_heap *heap,
+				     struct dma_heap_file *heap_file,
+				     u32 fd_flags, u64 heap_flags)
+{
+	return __system_heap_allocate(heap, heap_file,
+				      PAGE_ALIGN(dma_heap_file_size(heap_file)),
+				      fd_flags, heap_flags);
+}
+
 static const struct dma_heap_ops system_heap_ops = {
 	.allocate = system_heap_allocate,
+	.allocate_async_read = system_heap_allocate_async_read_file,
 };
 
 static int system_heap_create(void)
-- 
2.45.2

