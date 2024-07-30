Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4375E940A87
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 09:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE40110E4EE;
	Tue, 30 Jul 2024 07:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="jKZHXZA3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2060.outbound.protection.outlook.com [40.107.117.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7120F10E4EE
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 07:58:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eCflF0Fz6mGUnTN+P9OsE4thAiRbqw6pxSroIs/ogKohMByBARuVojvdr5oocYOrC0mihymrUzMhBdGfL9bTplcNelOXCuO2YpDeOjy6akuVC9PGE6BcJ9gNen8FbPo1zj7pbppeZDKJsRnNOpz7Eca5okCP9T4xsjhdjyvDNo4xeWCtVJ7iR846TOjSRUpCdFzCsMNz1yzSKXAO6F7IV4KuwfB3V2M+iWCFMKG+NWW94yRdGydK4j2S6ER0dOBIpP9G3BiCg9cRDEEasHbqFbkzenBoEssjI3hTUASa9t9e5UNkZbyuBx46HbngXK0f4qCDDtBWWhjPOgTZzJfQeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHX/UiO7M2V7tZ1K2p2u8yZfB1+JJYYUuYVrD1PHkr0=;
 b=LB2MUVrYLiKCDrBDbLtgniqJynFncosIEGmZgvmL/MFaX1cUA9XGdwEG/Z/CdWVCF+bVWm6BPIX6MZS7t+wkhpTRsergS5c5Ubvoq1kPmc4A11/fhDm/x+OKMAy8mcMkf8Tyz1ezxkRPcGbSTwD8FaptM42ktL5YmM7S4RjKD7fDt1bF39aW5KgecaqBHIxIXfhVotnO0mp5SWSmEwCoXj66c939IaHC2iBTnZRuXoWo5iPBdN5G4wNgBNXqAto58siWxde4dPkM+atmeRlcfevJRbvN4TuzysUQx35xqTisJDgfiKIOqJyOQbsRrY5mKsqak+RzVUFIEh2l/QEoeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHX/UiO7M2V7tZ1K2p2u8yZfB1+JJYYUuYVrD1PHkr0=;
 b=jKZHXZA3TF4Ag+YDCbEIId7iH7QMeL84dr04WFOpCSHGeJsZWAswD5GjBaa+KAlF82ftfx1mp8XfJ2/h5Sq/L657YPR9JEPbYaDFVz/szjNBHq4t0K+C/1iOPD+AVWeG2P0ALgTh5YiWs/xpJUhtSnVLokyvfOeRJCdgWnNHRbP0ax7KORhvoKCsDZDLaelvdO9ibePGN9vDWwS+Jqj9+94ioy24D+CzQ7tqkHOTzbAjXTgE6SFfz/7YkZAfWfBs9OO/RAgYEmtt4kKRa4ythAkYS0qbz2gPkWfOE1oDgliGOnxsf0hMEKbg1JnHUT7FViLY+zaVQMWcImBQA7w7+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TYZPR06MB5123.apcprd06.prod.outlook.com (2603:1096:400:1c1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 07:58:18 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 07:58:17 +0000
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
Subject: [PATCH v2 1/5] dma-buf: heaps: Introduce DMA_HEAP_ALLOC_AND_READ_FILE
 heap flag
Date: Tue, 30 Jul 2024 15:57:45 +0800
Message-ID: <20240730075755.10941-2-link@vivo.com>
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
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TYZPR06MB5123:EE_
X-MS-Office365-Filtering-Correlation-Id: 85174c0b-a3ec-4847-05df-08dcb06d5f42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IXY1yecc9OTgHuiqN5ux2zJYvqolghZ+pukSO5ZPIHyjfTVh235alhizUICs?=
 =?us-ascii?Q?4oXytsP6lHMTw+lhBzmEaFcN00GVg5l+sPOqUYx5M1XS7IresJluFKWkhlEk?=
 =?us-ascii?Q?w0LB/2T9J4akoQKdqyCk79hrvdDjTlP0r7bXKghF+eLIH240SO1AWTIJnKsp?=
 =?us-ascii?Q?A41PYiIgDTYyfdN0XZyzBQDJJ3qAye58keLYE8RDVR9xWgbSHJz3sSWy046+?=
 =?us-ascii?Q?ej0lvVoQD8PfPDu/epoKQvTOQShcSQPqh9mjlNoY/YdL1F8FumOeyA0p/7E7?=
 =?us-ascii?Q?1GLZViRND+GEr7IXa9N/mJfzUeA4RBjIsCDwHC0v5agTMUvpujmBgPWY5l5u?=
 =?us-ascii?Q?VaSdBEcP8qH4S3oNp3bQiNQNxaXihQT57CxPa8oEqbiz3lRG/q0kU8qgDz2S?=
 =?us-ascii?Q?TgQ10yJg/8/wBNwLJlIpUo51UkwaazEMOQ6EwVSDGfniCI3hNC/b9z+naRbF?=
 =?us-ascii?Q?9KdR6DQYozlpteY9ckAUivXKfG0TZszDx6r/8sqWPUL1+0Q1NlszOJ4W7KRL?=
 =?us-ascii?Q?2NKiT2XWUN1ncaVvddkvHi5qUal4aNzu2Z2rHS81z5CPCIdTeUjPtx6bt15J?=
 =?us-ascii?Q?s8w511RaFoI2xoOJTXD6Xm2+AutGHb3sAtzL5wnMkdonLO2AyQ/I+5H2FH21?=
 =?us-ascii?Q?jVD8TzWXdPJWifJ4VkxLuhxKYp1d7SObiIJF7nnUlI5GY0UEyBXIosAmTBTI?=
 =?us-ascii?Q?/kub97hi9Nt1GSaEBe0nh/Q1UElv5bsI9xER+Sh4UarTLmlHfwTQVn96tYQv?=
 =?us-ascii?Q?rVs58ibKYa3tzGI1Bq1jBTwTMVSCcyjLraQd1RY96ZwWfM8IUfJL0M8muew2?=
 =?us-ascii?Q?xadresPmHR9bLL0B6nSaZPYvLT+w61hgKds4EwAPMRsI/YLpKNrsQjNHJhLJ?=
 =?us-ascii?Q?BbVgnrsrfvUqR0HJ4F/2mFLZWyKfiC81kJ/+0G5cUgjbLotIGwNyn45VvNqB?=
 =?us-ascii?Q?nBV3ZMY1HWbC7L1Yhfh5DxNIZGd7p/K0hVIDN2/rJ9Z/IPPMmnfHNEJcRpiI?=
 =?us-ascii?Q?nSiHCKLkW7Gq1Ye/oMBzHabzjouKHojifwnfGV5roRxAuPwgHhTnEHryVFhI?=
 =?us-ascii?Q?Nh03hIfc7fIiPrRCsnRFK+DZ0aGLcUFv3lNEk+o1PPMzfs3Zj+9yP12OqSsU?=
 =?us-ascii?Q?d/SGCkLvmNcs3sEkyeLWXTlVaaqsONxtOrfJa1VKhZVaSYJLvF9+gw3qQTa1?=
 =?us-ascii?Q?u9PLOJkdWJ37uOGnApFFg4oNjYNPha4sroxBc97T3bW36vOStL4VZvdg54SL?=
 =?us-ascii?Q?QjPz7rUSPuzklT8+3yslzP1+7vgWMG17+7M1rEpLmGInvO7I3C/B0eiGHtu3?=
 =?us-ascii?Q?usne8XYJ70GfIoAhO9KnO5ZUzakU04lPstt0AU8C1Mgnyvc879Rm2BO94r9j?=
 =?us-ascii?Q?4dPXBiYbnBmn1c/dj6mo5wZl2UV3lAsSOnq0ClWPOJVWG7r2G2A1X7fyfDXf?=
 =?us-ascii?Q?WNQSjoRq2/A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SVvGDNwXFOu4S7kgXQ8jBObYBdWAdXXqYsoTMTD82A0Qq9OW3/oBqfhJZViO?=
 =?us-ascii?Q?eaq8hli6MO1SvDfM3J/HRSbXSvXXEpKAjONTP8qx4JyhdcYLFxqsrFL1tVm9?=
 =?us-ascii?Q?dRVmYxUhZh6KDiMbYJuESOCjJ2giugy7alIRLddebStEbp6GpFH2BrTSDPFy?=
 =?us-ascii?Q?NUKPf2thAggd/RpEygjGDM76uBFRIkd/5ezVZaNEX+Y0MDzD3E+y1RwzNPwv?=
 =?us-ascii?Q?HmP7RAKMG1SwRI7z9eMQ9mSXJ+s77nbl+htp974L1KAP15K9AAQHbZyRUTCR?=
 =?us-ascii?Q?TGVMx0ypW5QCW4TkOZgTghAIBqTG9iUmJzTSdneb0w0VImFVkItesiiuCF1f?=
 =?us-ascii?Q?BK9RJTfbfHiNPj33uZEexEnJKif7DbJf8ddewaPeU1h0tKNOppGdZIqYXZHg?=
 =?us-ascii?Q?ERAjtcCZ8Qxv+2Zllm80IkKCHqJyy7UyYZY0CO9ayC7ipnl99fGJtiUikBhE?=
 =?us-ascii?Q?a/DZmVvaVD+s9XrgSyCS4BHOReqzhLjQdrofZaayfkZvqAiOkybkobOtuywf?=
 =?us-ascii?Q?4kprdtj8BRAO+aw3kFZHLUGIiG2IpMJRlEYvepClDQ1OKzVoKJevUMxMAv83?=
 =?us-ascii?Q?GdBteyEboP7uFnNd6AVL5f5ucM5JfRHaUeJopwf7ytUKVTKRFMCy0krzV2B8?=
 =?us-ascii?Q?O2Y7N9ghIct8x+s+1OXnShurbVlhritpvrfjGC62GRlQulk2UTLpDd/aiyGq?=
 =?us-ascii?Q?goduaaYbb45rGmDtQofqz2tn2ulxiXA7m1XlNwg+ndSD5RFhFuksP4T3v2KI?=
 =?us-ascii?Q?IVOq3saV8I0CQVX8bH/8bwLBWfQZPptP57zMVc1WdBMsLkuTclvT4zyzq9cW?=
 =?us-ascii?Q?KzhMeIuaZqKBbkJpo6059Bk1XGbI/iXgJ9JrJwVzE1DFS/mTzK15aL7A78dj?=
 =?us-ascii?Q?S1NyB38SgES4KR98Qua30yGkEoFmbOTHhuOIeDe7S2MzUWyUVKD9I0GTHSGP?=
 =?us-ascii?Q?Ej3bqlW8qGYvVTWD9WMxF7Wl2xUpX9LzCVA4Y/AFq7XvWvIuW4HqMHUhyKPw?=
 =?us-ascii?Q?PI2g4UbZ5RomLHnOZK5ODuoTJh6MnLd9FcR5AHmCeTT7Yi570NPZBv92H2A6?=
 =?us-ascii?Q?bpR9/1/jdH72kB4Q64FtUTMnhpPMjlhRsvFb4b4COpgnxbiwIMLyWYzTuoo0?=
 =?us-ascii?Q?5w6+agdBJ7a7lck55JjSl/bMcqxA7Xwp0ejGenPa4VYGpiucA/CDCo5fJUyE?=
 =?us-ascii?Q?G87qoWMdgCsSOw4B2zGYu+LnZc00gNYjoK8TZ7mEjFnYv0jR0ZXuqYGtCmx1?=
 =?us-ascii?Q?7RDakYM1VYxKKp6+AfHp/mHRlPHgc/FCCXm0ARvuUieY7sN9ki/9az6e/ftR?=
 =?us-ascii?Q?70yZdAotsQU3boqGFFs+ufERqTXvWl0qDIrddP8lpH55NUylOF5Vqf8ulapw?=
 =?us-ascii?Q?yLIey5q0gDJ8luikNvdVc80sRf0/XkUIE5ouqriI0Ikkwe46BAxt5EZJRR3O?=
 =?us-ascii?Q?QsWzH79Y/0S5qQrWxHQP2/0o9seJLr6rKsJMBjr9GROx6ox7zlUzw1R3n3Ia?=
 =?us-ascii?Q?VaM6MhgPq5s8g8b8iqf4SnzQbY0f56Xh3/amEvz0sRUHFYw60fgtlpdKXrw5?=
 =?us-ascii?Q?eHByihIxeINt3vpae2gMOLA3j+q1kwl5Jdg83Y6N?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85174c0b-a3ec-4847-05df-08dcb06d5f42
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 07:58:17.7801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ihmnhvaeE9vVy4Qvj/6kz8SY16Dv476VRMaXTahYSNRwtd8K+zTSXx9kbBY2iEYvnuPW2xWtw45Pu1HpA3Q3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5123
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

Some user may need load file into dma-buf, current way is:
  1. allocate a dma-buf, get dma-buf fd
  2. mmap dma-buf fd into user vaddr
  3. read(file_fd, vaddr, fsz)
Due to dma-buf can't support direct I/O(can't pin, not pure page base),
the file read must be buffer I/O.

This means that during the process of reading the file into dma-buf,
page cache needs to be generated, and the corresponding content needs to
be first copied to the page cache before being copied to the dma-buf.

This method worked well when reading relatively small files before, as
the page cache can cache the file content, thus improving performance.

However, there are new challenges currently, especially as AI models are
becoming larger and need to be shared between DMA devices and the CPU
via dma-buf.

For example, the current 3B model file size is around 3.4GB. Using the
previous method would mean generating a total of 3.4GB of page cache
(even if it will be reclaimed), and also requiring the copying of 3.4GB
of content between page cache and dma-buf.

Due to the limited nature of system memory, files in the gigabyte range
cannot persist in memory indefinitely, so this portion of page cache may
not provide much assistance for subsequent reads. Additionally, the
existence of page cache will consume additional system resources due to
the extra copying required by the CPU.

Therefore, it is necessary for dma-buf to support direct I/O.

This patch provides a method to immediately read the file content after
the dma-buf is allocated, and only returns the dma-buf file descriptor
after the file is fully read.

Since the dma-buf file descriptor is not returned, no other thread can
access it except for the current thread, so we don't need to worry about
race conditions.

Map the dma-buf to the vmalloc area and initiate file reads in kernel
space, supporting both buffer I/O and direct I/O.

This patch adds the DMA_HEAP_ALLOC_AND_READ heap_flag for upper layers.
When a user needs to allocate a dma-buf and read a file, they should
pass this flag. As the size of the file being read is fixed, there is no
need to pass the 'len' parameter.

Instead, The file_fd needs to be passed to indicate to the kernel the file
that needs to be read, and the file open flag determines the mode of
file reading. But, please note that if direct I/O(O_DIRECT) is needed to
read the file, the file size must be page aligned.

Therefore, for the user, len and file_fd are mutually exclusive,
and they are combined using a union.

Once the user obtains the dma-buf fd, the dma-buf directly contains the
file content.

Signed-off-by: Huan Yang <link@vivo.com>
---
 drivers/dma-buf/dma-heap.c    | 127 +++++++++++++++++++++++++++++++++-
 include/uapi/linux/dma-heap.h |  11 ++-
 2 files changed, 133 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 2298ca5e112e..f19b944d4eaa 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -43,12 +43,128 @@ struct dma_heap {
 	struct cdev heap_cdev;
 };
 
+/**
+ * struct dma_heap_file - wrap the file, read task for dma_heap allocate use.
+ * @file:		file to read from.
+ * @fsize:		file size.
+ */
+struct dma_heap_file {
+	struct file *file;
+	size_t fsize;
+};
+
 static LIST_HEAD(heap_list);
 static DEFINE_MUTEX(heap_list_lock);
 static dev_t dma_heap_devt;
 static struct class *dma_heap_class;
 static DEFINE_XARRAY_ALLOC(dma_heap_minors);
 
+static int init_dma_heap_file(struct dma_heap_file *heap_file, int file_fd)
+{
+	struct file *file;
+	size_t fsz;
+
+	file = fget(file_fd);
+	if (!file)
+		return -EINVAL;
+
+	// Direct I/O only support PAGE_SIZE aligned files.
+	fsz = i_size_read(file_inode(file));
+	if (file->f_flags & O_DIRECT && !PAGE_ALIGNED(fsz))
+		return -EINVAL;
+
+	heap_file->fsize = fsz;
+	heap_file->file = file;
+
+	return 0;
+}
+
+static void deinit_dma_heap_file(struct dma_heap_file *heap_file)
+{
+	fput(heap_file->file);
+}
+
+/**
+ * Trigger sync file read, read into dma-buf.
+ *
+ * @dmabuf:			which we done alloced and export.
+ * @heap_file:			file info wrapper to read from.
+ *
+ * Whether to use buffer I/O or direct I/O depends on the mode when the
+ * file is opened.
+ * Remember, if use direct I/O, file must be page aligned.
+ * Since the buffer used for file reading is provided by dma-buf, when
+ * using direct I/O, the file content will be directly filled into
+ * dma-buf without the need for additional CPU copying.
+ *
+ * 0 on success, negative if anything wrong.
+ */
+static int dma_heap_read_file_sync(struct dma_buf *dmabuf,
+				   struct dma_heap_file *heap_file)
+{
+	struct iosys_map map;
+	ssize_t bytes;
+	int ret;
+
+	ret = dma_buf_vmap(dmabuf, &map);
+	if (ret)
+		return ret;
+
+	/**
+	 * The kernel_read_file function can handle file reading effectively,
+	 * and if the return value does not match the file size,
+	 * then it indicates an error.
+	 */
+	bytes = kernel_read_file(heap_file->file, 0, &map.vaddr, dmabuf->size,
+				 &heap_file->fsize, READING_POLICY);
+	if (bytes != heap_file->fsize)
+		ret = -EIO;
+
+	dma_buf_vunmap(dmabuf, &map);
+
+	return ret;
+}
+
+static int dma_heap_buffer_alloc_and_read(struct dma_heap *heap, int file_fd,
+					  u32 fd_flags, u64 heap_flags)
+{
+	struct dma_heap_file heap_file;
+	struct dma_buf *dmabuf;
+	int ret, fd;
+
+	ret = init_dma_heap_file(&heap_file, file_fd);
+	if (ret)
+		return ret;
+
+	dmabuf = heap->ops->allocate(heap, heap_file.fsize, fd_flags,
+				     heap_flags);
+	if (IS_ERR(dmabuf)) {
+		ret = PTR_ERR(dmabuf);
+		goto error_file;
+	}
+
+	ret = dma_heap_read_file_sync(dmabuf, &heap_file);
+	if (ret)
+		goto error_put;
+
+	ret = dma_buf_fd(dmabuf, fd_flags);
+	if (ret < 0)
+		goto error_put;
+
+	fd = ret;
+
+	deinit_dma_heap_file(&heap_file);
+
+	return fd;
+
+error_put:
+	dma_buf_put(dmabuf);
+error_file:
+	deinit_dma_heap_file(&heap_file);
+
+	return ret;
+}
+
 static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
 				 u32 fd_flags,
 				 u64 heap_flags)
@@ -108,9 +224,14 @@ static long dma_heap_ioctl_allocate(struct file *file, void *data)
 	if (heap_allocation->heap_flags & ~DMA_HEAP_VALID_HEAP_FLAGS)
 		return -EINVAL;
 
-	fd = dma_heap_buffer_alloc(heap, heap_allocation->len,
-				   heap_allocation->fd_flags,
-				   heap_allocation->heap_flags);
+	if (heap_allocation->heap_flags & DMA_HEAP_ALLOC_AND_READ_FILE)
+		fd = dma_heap_buffer_alloc_and_read(
+			heap, heap_allocation->file_fd,
+			heap_allocation->fd_flags, heap_allocation->heap_flags);
+	else
+		fd = dma_heap_buffer_alloc(heap, heap_allocation->len,
+					   heap_allocation->fd_flags,
+					   heap_allocation->heap_flags);
 	if (fd < 0)
 		return fd;
 
diff --git a/include/uapi/linux/dma-heap.h b/include/uapi/linux/dma-heap.h
index a4cf716a49fa..ef2fbd885825 100644
--- a/include/uapi/linux/dma-heap.h
+++ b/include/uapi/linux/dma-heap.h
@@ -18,13 +18,17 @@
 /* Valid FD_FLAGS are O_CLOEXEC, O_RDONLY, O_WRONLY, O_RDWR */
 #define DMA_HEAP_VALID_FD_FLAGS (O_CLOEXEC | O_ACCMODE)
 
+/* Heap will read file after alloc done, len field change to file fd */
+#define DMA_HEAP_ALLOC_AND_READ_FILE		00000001
+
 /* Currently no heap flags */
-#define DMA_HEAP_VALID_HEAP_FLAGS (0ULL)
+#define DMA_HEAP_VALID_HEAP_FLAGS (DMA_HEAP_ALLOC_AND_READ_FILE)
 
 /**
  * struct dma_heap_allocation_data - metadata passed from userspace for
  *                                      allocations
  * @len:		size of the allocation
+ * @file_fd:		file descriptor to read the allocation from
  * @fd:			will be populated with a fd which provides the
  *			handle to the allocated dma-buf
  * @fd_flags:		file descriptor flags used when allocating
@@ -33,7 +37,10 @@
  * Provided by userspace as an argument to the ioctl
  */
 struct dma_heap_allocation_data {
-	__u64 len;
+	union {
+		__u64 len;
+		__u32 file_fd;
+	};
 	__u32 fd;
 	__u32 fd_flags;
 	__u64 heap_flags;
-- 
2.45.2

