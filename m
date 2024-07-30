Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02602940A86
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 09:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5938910E4E7;
	Tue, 30 Jul 2024 07:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="ejmV3vMR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2056.outbound.protection.outlook.com [40.107.255.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA44B10E22C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 07:58:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZJMHxyQyFa9VgUuTP6JT+j8fZuh2RA8G+cQcb5F7QnmpHNv3n2tEu4w67jpTZqMABQLjrE9sw8pc5s328MASyz4LleRe34+Q1owDEC7l/SJNdo7p8KVwXjKjwwwjoniaMU+Nudqwi054ltBQD/OYDjLgsadMsKwMzOuzM1z9hYuZ+eVtH9QCFMTjb0ii0S72S2UINFWFjv/aAoDmI5EWagfwkd1cAz9BFehsv+gImmoC8h9+t1SA4sOChRv88ZyBLe3fVmPoUv3+hNVXYJ10pAOmq/R3flwaeb+r0J52O4iiqrQ3xyEZ3/5CzlnIE1BlsO16XVClSxLTSMtOoRu+Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jk9wIFl4MSkUn+JaziDh0bjJMIVOpKsmVkq+2U70zec=;
 b=WdcAinn2uUtZnMMWswcmxOwMB8bORPVLn/ZxDn1lfNGApoJIE+Pv+DwKgfhNFfwFJNWKsse82A3mG/niSo+0ziOK6wgDqH+iI1ti9V0/xMqCVkMPZDbuM1kkt2FR++wyQmGoOMp6a7jrCMUQ4FuuGK5BGA9JzpOadvosY/tBo3YRWL/3/9KlM8f7RZ9bWShb4JOtySYOT9Hhjg1Iat3CxK+IdNNW4KGsOkOf14/ig9JZNV3FBBIlNHknV81LbI1S2dyNnrCbmVs8KoNgiX1U+jepUNvFoqwgLpH1annV7QgZmkz4frbqNhasawxE/Jg0Y4TSkK5h3k0snwnZba6ibw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jk9wIFl4MSkUn+JaziDh0bjJMIVOpKsmVkq+2U70zec=;
 b=ejmV3vMR2Sr0suaBW66CY4i+mpFRYyAhVScoOVhMQtpUiXE8jslevudV00B8VXR3lJVfxigV/JfJhxLpG4UUlqgNucJAgZeFDolXMm0+GJvzOriyXTuQVIqiP6aScuBWwzSqILBEE6+e6P/ooc0nWebND1AJ14MMKO2NdFGs/jylzpCxDzjeULpEa8zRdrUhMeGTURj9ZUZHd96QmM0Uqfzd0fsqXZNH2iJ/maop2lxcc/Z1PdKAeGlAxIGkUtg86q4KG95sprwLX4ah//2X9hAru5dAhgjLbQho1rESI0TF9he+udCj/RSydTxZq51ppykkseFetGP/nTA0NU7ttg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SI2PR06MB5386.apcprd06.prod.outlook.com (2603:1096:4:1ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 07:58:23 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 07:58:23 +0000
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
Subject: [PATCH v2 3/5] dma-buf: heaps: support alloc async read file
Date: Tue, 30 Jul 2024 15:57:47 +0800
Message-ID: <20240730075755.10941-4-link@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: ee548953-10a7-49e2-1b1a-08dcb06d62d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|52116014|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5s3wvcueDnpqAoehrNK9CR+MmJNkSSjmNJEXxuBLrzeDx8U98V06gies/lGB?=
 =?us-ascii?Q?BASz1bGCNMLSkyU6AyT7gwI9UAqKiy5QxqbGtj5IERzxbD+g9tVgcHVPg1Bi?=
 =?us-ascii?Q?nnbYjbNGkWQk7vv6QNjf9nPPp4FI55MC9dtXMhFsA+4PBRjQQnkCzqTlHZex?=
 =?us-ascii?Q?RGGbgsER2AbqilzFmYxHxWg/q/7S38azxteG2Ouil7mjka/4uHy2RCeO9DEQ?=
 =?us-ascii?Q?1Px+8dgmI5zJb6yHocCMfv+0CWio1WwMH0GaAthEfl9pzF8JYvqG4AB1Hv7g?=
 =?us-ascii?Q?bEvqkxVppTWX69DNRZKzny96B1+3wVxBCC9+Z++q+YwaToCXQmIK6B1Lg2uK?=
 =?us-ascii?Q?jwJu3oN/u41mLdhUbVYFG6LsJnd2pgsp+zcBezET9yB9UhNdGqNLC3RiC/NB?=
 =?us-ascii?Q?f80GFiJuINejp5qv6f9VrFtP/Vui7vWOebO141+9veZmFTigV13tImUXa9BH?=
 =?us-ascii?Q?kCEKKvnOdKoghnGaBjhd057Cvenv+JBJjexsFr9X2Ydqh9igoj6pP3DCiweq?=
 =?us-ascii?Q?2C6Fnl0S1HD0vhU8ef4/IXU9dCoqrA9/fDJoBXJK3LQWQc6TAhgt/lq+G+e6?=
 =?us-ascii?Q?Bi2ktbkegJxOsA/ABJcs/Bp4sdEWiBQwxTzoZrDN3AV14w/SkknHPQyRN1nU?=
 =?us-ascii?Q?ofWTC7Uu4mt1qKXUd6EMqk/t+artHNXlNXx0XyOVQv/Alupb5mFiJCup2Gcp?=
 =?us-ascii?Q?S5jkeLI01NHGZotKBRLWUcQ8cvr52CopDtPJY4RyUNiSbW88WLBLYzJIsNLe?=
 =?us-ascii?Q?NWdgy9WIics/v9LR/5cA4GT0odlB9Q6HmezJcktWhTpUDiRFJ3R4YNz9/onf?=
 =?us-ascii?Q?0ZNSs2UoMddKUaeAlz4ZNB8TNlaCb7lhgQTBH8sc7p9YdDImQ+GY0t7Ln28B?=
 =?us-ascii?Q?1nLMwThpb6IzzlJBL7D4EBkIMi++eqtSxV101PIP8uU6mBZQOkSUyvG5GUSj?=
 =?us-ascii?Q?v56uY7XvJnqp0EDrtOZLgQa6DYgofZrMrPXNN9KSpCbZAdphQwg+TADHuzAY?=
 =?us-ascii?Q?nXoY3Yxne793ErTSciGLlSTio30Z9BIs/luhcPDuLadF1DKLiJH9oIOA+5rX?=
 =?us-ascii?Q?aaF95/y0dZ7XQowvnhNVMYW8w2iuKF4OvAt2jZIfbEezTR+x7KwVleXM02QT?=
 =?us-ascii?Q?G9Bq0ce2/86W2TGMSwkbNMbWyXiAKFawUxY3hqse09G1db/XFOIE5tWCeZnY?=
 =?us-ascii?Q?rUx6mllgM3k8CGLqhhWgHCgozcNJxWpj9WWGJK/gc47+oGH31DaBwT3MSNmM?=
 =?us-ascii?Q?S2KGoWu877AXzLgFB15rVj1pOKEHhys9qsRW7VQqS+c12Z33DIKkqOBeSorm?=
 =?us-ascii?Q?IB7e4FfcC9g+7JBZcvHDxK1IgBQEwFarc5Z0GOiDIOXCYdy8rHFTk9L2X9MR?=
 =?us-ascii?Q?8h9lC0uRwTYDPFjWCyxpBppQVg2CGLSJJxdKl0Rw/4t2LyRGX8Mjk1HXmQ8e?=
 =?us-ascii?Q?yk/Oi1lCnnI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(52116014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kSLEgMTIDpvDq0pXEGzz2pIrYOKDgfiD98q3r7Tm+ClRsp8CMriMc7iG0ZNp?=
 =?us-ascii?Q?q0v5nTFTApEQ4c6084KhDsZFmYdndnxcvidmwsXA8qLj82Z9jelA48SPor59?=
 =?us-ascii?Q?RBDMd/tKqKDnLq0Mef1lmXn7akIwlXkt3jeg+fw4PXmxpKoRUyJj5O212xQz?=
 =?us-ascii?Q?7AqILv5JVx546lESul8m5KwYnuv+2bed5UjCFPUPBfj9ZFy+IkjQc2LsHrI/?=
 =?us-ascii?Q?1RyDKzLmHJWsG+J36WwijvD9slU1USetcK+qs2U8ElzGl3IYfVPD+JeBct49?=
 =?us-ascii?Q?lYVR1QZw+EA1XZk1X7ekhMB6vChpfn5zB5WBzPEZGEeKSGMLhnjlEe8xw2YQ?=
 =?us-ascii?Q?eQsrRCqEZwr/rRy19ENcYFEGy9rQd8NuhNs9qjePSm+3rCsosbcpOJf0eENH?=
 =?us-ascii?Q?JVlsBcXYru7y62cP3RvO9HkdYgsiNsMQONG59f6Hl/yGS6zQ6MuWahKj9m1E?=
 =?us-ascii?Q?22SYdWGXbHBpcER6TP4TfT5zmSQJPNIt9RASDlQ1lQXGTqANpSytqP7K+ETJ?=
 =?us-ascii?Q?r9w+k8yxKzlbq1/kpvVYRpr63f8HyV6WxtL6yOsHrTaj+hocauCeVMBVmsZF?=
 =?us-ascii?Q?P+22O1MaCy/zrjAtUY+1bZ828HM44a1vk0+233M2OSzHB3LNHVkBqculyI7F?=
 =?us-ascii?Q?PK+oE2NMeyvojRuWwlGzaxyGr6CIgfhEca5dAzpEAXr2CUjWe2ElrETzl45t?=
 =?us-ascii?Q?ldKTbyaLcV+mnaETNF4i6ECLbDSuvXRbpH0Nuk8smqjHqh9aGUsoZam7G3xY?=
 =?us-ascii?Q?a8RzdlvQduV1apajOxGLD1M/5aWqL2ZWv6tefmGg9jPkfVJTVtGg0pqjdImJ?=
 =?us-ascii?Q?aqbOzqy5EKV549YRLjtmPO8joBenIqc9XPJjOHdGugiZzOlqOMyTUnf68e19?=
 =?us-ascii?Q?ic25hP+rcjXnvaU7sqbqW/v7huNWTdUqIqbEKsyKZ7WX4seOj9Ji8cicTBOb?=
 =?us-ascii?Q?MMbhYTI5abTOyptbrtRvhB8ioKHC5XjjzsfHd2n3syYSJRtLOibu3A7shZpj?=
 =?us-ascii?Q?qhGdldZAsHkoswGBFYrrtME4WJr0RrVlXwzbLbDAcQj69AWu+6UOVlNCxv6q?=
 =?us-ascii?Q?kTHwDVKTr0wBnnN7UT/FQDRnC0r4wGCV1bGK4kmPOHcIKXCcUhY4YpxhFJj2?=
 =?us-ascii?Q?a3sGXq4M76OqAFam1g0afhPDP8MivO8FZPRfgutkLjCar5bdkoNECHb2Oexg?=
 =?us-ascii?Q?smua2BD0K0BRE+4W/RIV+a+GOgg5aSZaCwwbN+6NOkPPzXDGpeBIxZbI5CoH?=
 =?us-ascii?Q?vX8so/zAez8Gz1CYC+iYfsJAqlWqG+QBspuwbx6oQ6Q2U9njg6yzxD2UTX8u?=
 =?us-ascii?Q?wgKUTy4N/WnYyfEtCZ5IVoyjUxp/RCCySV5Qla7N5Kmw3U2SHNYR0oc5pNaN?=
 =?us-ascii?Q?MtRrmv++Fj5709Jff1AZWk3WF4/psKm0M7khDowbZpdbJHjdfpyInfUQ59PH?=
 =?us-ascii?Q?XHPdYwB5HWrIZ4ETBNx7Q5LvIUJoML73KVKMfUqlM2zdDKHnMErK4SafsGcO?=
 =?us-ascii?Q?GUDq9yWwuCdFDovJ7Z0DdD2TjnBW3XwSnMym1zji5uBcuyWfKPNeC/oHMVL/?=
 =?us-ascii?Q?SM3QhO8zH16MMMwCDpinHu7aHEw3OKe+Cywe9wzg?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee548953-10a7-49e2-1b1a-08dcb06d62d0
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 07:58:23.7483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BttZdFaMUMRVMKVO2V9gLpg8t62YhRuMeL3rOTuUo2CyLCFge7ydZoIx4LDFYvQXBUmk8fqBnetOmQwEItCb+A==
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

This patch completes the infrastructure for async read. It treats memory
allocation as the producer and assigns file reading to the heap_fwork_t
thread as the consumer.

The heap needs to gather each allocated page and, when a certain amount
(default 128MB) is gathered, it will package and pass it to heap_fwork_t
to initiate file reading.

This process is completed by the helper functions
dma_heap_gather_file_page. Ever heap declare a task and pass each page,
then wait file read done before return dma-buf.

Because the memory allocation and file reading correspond to each other,
the number of gathers during the prepare process and submit process can
determine the offset in the file as well as the size to be read.

When a gather page initiates a read, it is packaged into a work and
passed to the heap_fwork_t thread, containing the offset and size of the
file being read, the buffer obtained by mapping the gather page to
vmalloc, and the credentials used during the read.

The buffer for file reading is provided by mapping the gathered pages to
vmalloc. This means that if direct I/O is used to read a file, the file
content will be directly transferred to the corresponding memory of the
dma-buf, without the need for additional CPU copying and intermediate
buffers.

Although direct I/O requires page aligned, this patch can
automatically adapt to the file size and use buffer I/O to read the
unaligned parts.

Note that heap_fwork_t is a single-threaded process, which means that
the file read work is executed serially. Considering that the default
I/O amount initiated at a time is 128MB, which is already quite large,
multiple threads will not help accelerate I/O performance.

So, this is more suit for large size file read into dma-buf.

Signed-off-by: Huan Yang <link@vivo.com>
---
 drivers/dma-buf/dma-heap.c | 423 ++++++++++++++++++++++++++++++++++++-
 include/linux/dma-heap.h   |  45 ++++
 2 files changed, 462 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 91e241763ebc..df1b2518f126 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -18,6 +18,7 @@
 #include <linux/uaccess.h>
 #include <linux/syscalls.h>
 #include <linux/dma-heap.h>
+#include <linux/vmalloc.h>
 #include <uapi/linux/dma-heap.h>
 
 #define DEVNAME "dma_heap"
@@ -46,42 +47,419 @@ struct dma_heap {
 /**
  * struct dma_heap_file - wrap the file, read task for dma_heap allocate use.
  * @file:		file to read from.
+ * @cred:		kthread use, user cred copy to use for the read.
+ * @glimit:		The size limit for gathering. Whenever the page of the
+ *			gather reaches the limit, file I/O is triggered.
+ *			This is the maximum limit for the current ALLOC_AND_READ
+ *			operation.
  * @fsize:		file size.
+ * @direct:		use direct IO?
  */
 struct dma_heap_file {
 	struct file *file;
+	struct cred *cred;
+	size_t glimit;
 	size_t fsize;
+	bool direct;
 };
 
+/**
+ * struct dma_heap_file_work - represents a dma_heap file read real work.
+ * @vaddr:		contigous virtual address alloc by vmap, file read need.
+ *
+ * @start_size:		file read start offset, same to @dma_heap_file_task->roffset.
+ *
+ * @need_size:		file read need size, same to @dma_heap_file_task->rsize.
+ *
+ * @heap_file:		file wrapper.
+ *
+ * @list:		child node of @dma_heap_file_control->works.
+ *
+ * @refp:		same @dma_heap_file_task->ref, if end of read, put ref.
+ *
+ * @failp:		if any work io failed, set it true, pointp @dma_heap_file_task->fail.
+ */
+struct dma_heap_file_work {
+	void *vaddr;
+	ssize_t start_size;
+	ssize_t need_size;
+	struct dma_heap_file *heap_file;
+	struct list_head list;
+	atomic_t *refp;
+	bool *failp;
+};
+
+/**
+ * struct dma_heap_file_task - represents a dma_heap file read process
+ * @ref:		current file work counter, if zero, allocate and read
+ *			done.
+ *
+ * @roffset:		last read offset, current prepared work' begin file
+ *			start offset.
+ *
+ * @rsize:		current allocated page size use to read, if reach rbatch,
+ *			trigger commit.
+ *
+ * @nr_gathered:	current gathered page, Take the minimum value
+ *			between the @glimit and the remaining allocation amount.
+ *
+ * @heap_file:		current dma_heap_file
+ *
+ * @parray:		used for vmap, size is @dma_heap_file's batch's number
+ *			pages.(this is maximum). Due to single thread file read,
+ *			one page array reuse in ftask prepare is OK.
+ *			Each index in parray is PAGE_SIZE.(vmap need)
+ *
+ * @pindex:		current allocated page filled in @parray's index.
+ *
+ * @fail:		any work failed when file read?
+ *
+ * dma_heap_file_task is the production of file read, will prepare each work
+ * during allocate dma_buf pages, if match current batch, then trigger commit
+ * and prepare next work. After all batch queued, user going on prepare dma_buf
+ * and so on, but before return dma_buf fd, need to wait file read end and
+ * check read result.
+ */
+struct dma_heap_file_task {
+	atomic_t ref;
+	size_t roffset;
+	size_t rsize;
+	size_t nr_gathered;
+	struct dma_heap_file *heap_file;
+	struct page **parray;
+	unsigned int pindex;
+	bool fail;
+};
+
+/**
+ * struct dma_heap_file_control - global control of dma_heap file read.
+ * @works:		@dma_heap_file_work's list head.
+ *
+ * @threadwq:		wait queue for @work_thread, if commit work, @work_thread
+ *			wakeup and read this work's file contains.
+ *
+ * @workwq:		used for main thread wait for file read end, if allocation
+ *			end before file read. @dma_heap_file_task ref effect this.
+ *
+ * @work_thread:	file read kthread. the dma_heap_file_task work's consumer.
+ *
+ * @heap_fwork_cachep:	@dma_heap_file_work's cachep, it's alloc/free frequently.
+ *
+ * @nr_work:		global number of how many work committed.
+ */
+struct dma_heap_file_control {
+	struct list_head works;
+	spinlock_t lock; // only lock for @works.
+	wait_queue_head_t threadwq;
+	wait_queue_head_t workwq;
+	struct task_struct *work_thread;
+	struct kmem_cache *heap_fwork_cachep;
+	atomic_t nr_work;
+};
+
+static struct dma_heap_file_control *heap_fctl;
 static LIST_HEAD(heap_list);
 static DEFINE_MUTEX(heap_list_lock);
 static dev_t dma_heap_devt;
 static struct class *dma_heap_class;
 static DEFINE_XARRAY_ALLOC(dma_heap_minors);
 
+static struct dma_heap_file_work *
+init_file_work(struct dma_heap_file_task *heap_ftask)
+{
+	struct dma_heap_file_work *heap_fwork;
+	struct dma_heap_file *heap_file = heap_ftask->heap_file;
+
+	if (READ_ONCE(heap_ftask->fail))
+		return NULL;
+
+	heap_fwork = kmem_cache_alloc(heap_fctl->heap_fwork_cachep, GFP_KERNEL);
+	if (unlikely(!heap_fwork))
+		return NULL;
+
+	/**
+	 * Map the gathered page to the vmalloc area.
+	 * So we get a continuous virtual address, even if the physical address
+	 * is scatter, can use this to trigger file read, if use direct I/O,
+	 * all content can direct read into dma-buf pages without extra copy.
+	 *
+	 * Now that we get vaddr page, cached pages can return to original user, so we
+	 * will not effect dma-buf export even if file read not end.
+	 */
+	heap_fwork->vaddr = vmap(heap_ftask->parray, heap_ftask->pindex, VM_MAP,
+				 PAGE_KERNEL);
+	if (unlikely(!heap_fwork->vaddr)) {
+		kmem_cache_free(heap_fctl->heap_fwork_cachep, heap_fwork);
+		return NULL;
+	}
+
+	heap_fwork->heap_file = heap_file;
+	heap_fwork->start_size = heap_ftask->roffset;
+	heap_fwork->need_size = heap_ftask->rsize;
+	heap_fwork->refp = &heap_ftask->ref;
+	heap_fwork->failp = &heap_ftask->fail;
+	atomic_inc(&heap_ftask->ref);
+	return heap_fwork;
+}
+
+static void deinit_file_work(struct dma_heap_file_work *heap_fwork)
+{
+	vunmap(heap_fwork->vaddr);
+	atomic_dec(heap_fwork->refp);
+	wake_up(&heap_fctl->workwq);
+
+	kmem_cache_free(heap_fctl->heap_fwork_cachep, heap_fwork);
+}
+
+/**
+ * dma_heap_submit_file_read -  prepare collect enough memory, going to trigger IO
+ * @heap_ftask:			info that current IO needs
+ *
+ * This will also check if reach to tail read.
+ * For direct I/O submissions, it is necessary to pay attention to file reads
+ * that are not page-aligned. For the unaligned portion of the read, buffer IO
+ * needs to be triggered.
+ * Returns:
+ *   0 if all right, negative if something wrong
+ */
+static int dma_heap_submit_file_read(struct dma_heap_file_task *heap_ftask)
+{
+	struct dma_heap_file_work *heap_fwork = init_file_work(heap_ftask);
+	struct page *last = NULL;
+	struct dma_heap_file *heap_file = heap_ftask->heap_file;
+	size_t start = heap_ftask->roffset;
+	struct file *file = heap_file->file;
+	size_t fsz = heap_file->fsize;
+
+	if (unlikely(!heap_fwork))
+		return -ENOMEM;
+
+	/**
+	 * If file size is not page aligned, direct io can't process the tail.
+	 * So, if reach to tail, remain the last page use buffer read.
+	 */
+	if (heap_file->direct && start + heap_ftask->rsize > fsz) {
+		heap_fwork->need_size -= PAGE_SIZE;
+		last = heap_ftask->parray[heap_ftask->pindex - 1];
+	}
+
+	spin_lock(&heap_fctl->lock);
+	list_add_tail(&heap_fwork->list, &heap_fctl->works);
+	spin_unlock(&heap_fctl->lock);
+	atomic_inc(&heap_fctl->nr_work);
+
+	wake_up(&heap_fctl->threadwq);
+
+	if (last) {
+		char *buf, *pathp;
+		ssize_t err;
+		void *buffer;
+
+		buf = kmalloc(PATH_MAX, GFP_KERNEL);
+		if (unlikely(!buf))
+			return -ENOMEM;
+
+		start = PAGE_ALIGN_DOWN(fsz);
+
+		pathp = file_path(file, buf, PATH_MAX);
+		if (IS_ERR(pathp)) {
+			kfree(buf);
+			return PTR_ERR(pathp);
+		}
+
+		// use page's kaddr as file read buffer.
+		buffer = kmap_local_page(last);
+		err = kernel_read_file_from_path(pathp, start, &buffer,
+						 fsz - start, &fsz,
+						 READING_POLICY);
+		kunmap_local(buffer);
+		kfree(buf);
+		if (err < 0)
+			return err;
+	}
+
+	heap_ftask->roffset += heap_ftask->rsize;
+	heap_ftask->rsize = 0;
+	heap_ftask->pindex = 0;
+	heap_ftask->nr_gathered = min_t(size_t,
+					PAGE_ALIGN(fsz) - heap_ftask->roffset,
+					heap_ftask->nr_gathered);
+	return 0;
+}
+
+int dma_heap_gather_file_page(struct dma_heap_file_task *heap_ftask,
+			      struct page *page)
+{
+	struct page **array = heap_ftask->parray;
+	int index = heap_ftask->pindex;
+	int num = compound_nr(page), i;
+	unsigned long sz = page_size(page);
+
+	heap_ftask->rsize += sz;
+	for (i = 0; i < num; ++i)
+		array[index++] = &page[i];
+	heap_ftask->pindex = index;
+
+	if (heap_ftask->rsize < heap_ftask->nr_gathered)
+		return 0;
+
+	// already reach to limit, trigger file read.
+	return dma_heap_submit_file_read(heap_ftask);
+}
+
+int dma_heap_wait_for_file_read(struct dma_heap_file_task *heap_ftask)
+{
+	wait_event_freezable(heap_fctl->workwq,
+			     atomic_read(&heap_ftask->ref) == 0);
+	return heap_ftask->fail ? -EIO : 0;
+}
+
+int dma_heap_end_file_read(struct dma_heap_file_task *heap_ftask)
+{
+	int ret;
+
+	ret = dma_heap_wait_for_file_read(heap_ftask);
+	kvfree(heap_ftask->parray);
+	kfree(heap_ftask);
+
+	return ret;
+}
+
+struct dma_heap_file_task *
+dma_heap_declare_file_read(struct dma_heap_file *heap_file)
+{
+	struct dma_heap_file_task *heap_ftask =
+		kzalloc(sizeof(*heap_ftask), GFP_KERNEL);
+	if (unlikely(!heap_ftask))
+		return NULL;
+
+	/**
+	 * glimit is the maximum size which we prepare work will meet.
+	 * So, direct alloc this number's page array is OK.
+	 */
+	heap_ftask->parray = kvmalloc_array(heap_file->glimit >> PAGE_SHIFT,
+					    sizeof(struct page *), GFP_KERNEL);
+	if (unlikely(!heap_ftask->parray))
+		goto put;
+
+	heap_ftask->heap_file = heap_file;
+	heap_ftask->nr_gathered = heap_file->glimit;
+	return heap_ftask;
+
+put:
+	kfree(heap_ftask);
+	return NULL;
+}
+
+static void __work_this_io(struct dma_heap_file_work *heap_fwork)
+{
+	struct dma_heap_file *heap_file = heap_fwork->heap_file;
+	struct file *file = heap_file->file;
+	ssize_t start = heap_fwork->start_size;
+	ssize_t size = heap_fwork->need_size;
+	void *buffer = heap_fwork->vaddr;
+	const struct cred *old_cred;
+	ssize_t err;
+
+	// use real task's cred to read this file.
+	old_cred = override_creds(heap_file->cred);
+	err = kernel_read_file(file, start, &buffer, size, &heap_file->fsize,
+			       READING_POLICY);
+	if (err < 0)
+		WRITE_ONCE(*heap_fwork->failp, true);
+	// recovery to my cred.
+	revert_creds(old_cred);
+}
+
+static int dma_heap_file_work_thread(void *data)
+{
+	struct dma_heap_file_control *heap_fctl =
+		(struct dma_heap_file_control *)data;
+	struct dma_heap_file_work *worker, *tmp;
+	int nr_work;
+
+	LIST_HEAD(pages);
+	LIST_HEAD(workers);
+
+	while (true) {
+		wait_event_freezable(heap_fctl->threadwq,
+				     atomic_read(&heap_fctl->nr_work) > 0);
+recheck:
+		spin_lock(&heap_fctl->lock);
+		list_splice_init(&heap_fctl->works, &workers);
+		spin_unlock(&heap_fctl->lock);
+
+		if (unlikely(kthread_should_stop())) {
+			list_for_each_entry_safe(worker, tmp, &workers, list) {
+				list_del(&worker->list);
+				deinit_file_work(worker);
+			}
+			break;
+		}
+
+		nr_work = 0;
+		list_for_each_entry_safe(worker, tmp, &workers, list) {
+			++nr_work;
+			list_del(&worker->list);
+			__work_this_io(worker);
+
+			deinit_file_work(worker);
+		}
+
+		if (atomic_sub_return(nr_work, &heap_fctl->nr_work) > 0)
+			goto recheck;
+	}
+	return 0;
+}
+
+size_t dma_heap_file_size(struct dma_heap_file *heap_file)
+{
+	return heap_file->fsize;
+}
+
 static int init_dma_heap_file(struct dma_heap_file *heap_file, int file_fd)
 {
 	struct file *file;
 	size_t fsz;
+	int ret;
 
 	file = fget(file_fd);
 	if (!file)
 		return -EINVAL;
 
-	// Direct I/O only support PAGE_SIZE aligned files.
 	fsz = i_size_read(file_inode(file));
-	if (file->f_flags & O_DIRECT && !PAGE_ALIGNED(fsz))
-		return -EINVAL;
 
-	heap_file->fsize = fsz;
+	/**
+	 * Selinux block our read, but actually we are reading the stand-in
+	 * for this file.
+	 * So save current's cred and when going to read, override mine, and
+	 * end of read, revert.
+	 */
+	heap_file->cred = prepare_kernel_cred(current);
+	if (unlikely(!heap_file->cred)) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
 	heap_file->file = file;
+#define DEFAULT_DMA_BUF_HEAPS_GATHER_LIMIT (128 << 20)
+	heap_file->glimit = min_t(size_t, PAGE_ALIGN(fsz),
+				  DEFAULT_DMA_BUF_HEAPS_GATHER_LIMIT);
+	heap_file->fsize = fsz;
+
+	heap_file->direct = file->f_flags & O_DIRECT;
 
 	return 0;
+
+err:
+	fput(file);
+	return ret;
 }
 
 static void deinit_dma_heap_file(struct dma_heap_file *heap_file)
 {
 	fput(heap_file->file);
+	put_cred(heap_file->cred);
 }
 
 /**
@@ -443,11 +821,44 @@ static int dma_heap_init(void)
 
 	dma_heap_class = class_create(DEVNAME);
 	if (IS_ERR(dma_heap_class)) {
-		unregister_chrdev_region(dma_heap_devt, NUM_HEAP_MINORS);
-		return PTR_ERR(dma_heap_class);
+		ret = PTR_ERR(dma_heap_class);
+		goto fail_class;
 	}
 	dma_heap_class->devnode = dma_heap_devnode;
 
+	heap_fctl = kzalloc(sizeof(*heap_fctl), GFP_KERNEL);
+	if (unlikely(!heap_fctl)) {
+		ret =  -ENOMEM;
+		goto fail_alloc;
+	}
+
+	INIT_LIST_HEAD(&heap_fctl->works);
+	init_waitqueue_head(&heap_fctl->threadwq);
+	init_waitqueue_head(&heap_fctl->workwq);
+
+	heap_fctl->work_thread = kthread_run(dma_heap_file_work_thread,
+					     heap_fctl, "heap_fwork_t");
+	if (IS_ERR(heap_fctl->work_thread)) {
+		ret = -ENOMEM;
+		goto fail_thread;
+	}
+
+	heap_fctl->heap_fwork_cachep = KMEM_CACHE(dma_heap_file_work, 0);
+	if (unlikely(!heap_fctl->heap_fwork_cachep)) {
+		ret = -ENOMEM;
+		goto fail_cache;
+	}
+
 	return 0;
+
+fail_cache:
+	kthread_stop(heap_fctl->work_thread);
+fail_thread:
+	kfree(heap_fctl);
+fail_alloc:
+	class_destroy(dma_heap_class);
+fail_class:
+	unregister_chrdev_region(dma_heap_devt, NUM_HEAP_MINORS);
+	return ret;
 }
 subsys_initcall(dma_heap_init);
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 824acbf5a1bc..3becbd08963a 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -14,6 +14,8 @@
 
 struct dma_heap;
 struct dma_heap_file;
+struct dma_heap_file_task;
+struct dma_heap_file;
 
 /**
  * struct dma_heap_ops - ops to operate on a given heap
@@ -69,4 +71,47 @@ const char *dma_heap_get_name(struct dma_heap *heap);
  */
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
 
+/**
+ * dma_heap_wait_for_file_read - waits for a file read to complete
+ *
+ * Some users need to call this function before destroying the page to ensure
+ * that all file work has been completed, in order to avoid UAF issues.
+ * Remember, this function does not destroy the data structure corresponding to
+ * the ftask. Before ending the actual processing, you need to call
+ * @dma_heap_end_file_read.
+ *
+ * 0 - success, -EIO - if any file work failed
+ */
+int dma_heap_wait_for_file_read(struct dma_heap_file_task *heap_ftask);
+
+/**
+ * dma_heap_end_file_read - waits for a file read to complete then destroy it
+ * 0 - success, -EIO - if any file work failed
+ */
+int dma_heap_end_file_read(struct dma_heap_file_task *heap_ftask);
+
+/**
+ * dma_heap_alloc_file_read - Declare a task to read file when allocate pages.
+ * @heap_file:		target file to read
+ *
+ * Return NULL if failed, otherwise return a struct pointer.
+ */
+struct dma_heap_file_task *
+dma_heap_declare_file_read(struct dma_heap_file *heap_file);
+
+/**
+ * dma_heap_gather_file_page - gather each allocated page.
+ * @heap_ftask:		prepared and need to commit's work.
+ * @page:		current allocated page. don't care which order.
+ *
+ * This function gather all allocated pages, automatically submit when the
+ * gathering reaches the limit. Submit will package pages, prepare the data
+ * required for reading file, then submit to async read thread.
+ *
+ * 0 - success, nagtive - failed.
+ */
+int dma_heap_gather_file_page(struct dma_heap_file_task *heap_ftask,
+			      struct page *page);
+size_t dma_heap_file_size(struct dma_heap_file *heap_file);
+
 #endif /* _DMA_HEAPS_H */
-- 
2.45.2

