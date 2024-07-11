Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 254A892EFDB
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 21:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9352910EB6D;
	Thu, 11 Jul 2024 19:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="SdS27PcD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2062.outbound.protection.outlook.com [40.107.255.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9697D10E23B
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 07:42:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jKd6MOk891+8K9XDgDEtfr1fWGmxfSW/dBiVdI1hb7YTrf3BnzQYCE/A9JtUgVsYqj5y15M3TC/+wnfDaCgkiE1ADyYo8e4QabKDG3+iKgIWHcQwVF4/9bv/RX5/ZQZvvSVEOdoIuv+InQBTq1NWI0bmBTg6pojBteSt7XHRMUDP33m2OzHhPFlzOUlI+gqGnGCVr/dDNHC5xXVxhYOfXChln1YEBbkAvzWX8HJD2pTtw78yjyolQtb9WYlP55zFqdYL4pnqax4ke4+/ZVDWd1N+3ldYkuEIcCOgttpVMIM/MVmhfKPERuqbTGJBj6zafRGbO0Tgg7YkLX6YQPgicw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YyK4oABbZkYEBl/o04p3/sZJOV9I5kfD+VDtB4S/V4=;
 b=dijvmX+rw8DDKbAUcN3iFXI+sbBlhXvnUJ7hVG4D2x0nUMjvRZ03hNXCgxEyYq2mtpwXrUiAfMY113Jnfh+Y9msJxnXCgf9hOxSsoVnsWlX3mrKpOUgL6dxsmslCnjeB+UBLPPKmbH/nvIH0zDAdT+Y+CnVp2rZ9poV2+cTvsacniNAukAfH72mN0hf0DJkpTKmtz0O6BzwZmsDi9BnV23RsqhRxV1+qkFfHvXVa0DsaC4COHJrPMkLDippciX3FewvGzSh1t+3Ogca+7VMhn9lY1KMNw879EebWUeAbZ2Xn6xOivDbgWDulHo6hIIuPMwCm8SRsy6sJ66brLpQLWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YyK4oABbZkYEBl/o04p3/sZJOV9I5kfD+VDtB4S/V4=;
 b=SdS27PcDPvQ1P6lFODPWen1LHzbul4EW3G+TcKtFGloBrX6m+h32KzgjVeww2pKtbk6a3j4lyRKSrXjX9NRefYnP6vwqFrwnP1JmWVr9CRi+zTqW6gtlA3D6RuQdvV2IcRBSLMAoJszAOV13ykYSJx7JeYL0Ask8PKNHezJuhTEion227Ts27mZxdkOCFI6NPJ6JS7OX8SX2JI1r9hFbfRqn8/2jKvZJ+1En7qGMkwjume2L7r1mSxIW6hryrweH9u/mXlxRK/GdvPFxg4Sj0Yx20JSQmGmUKkzhge9+W+uaxwKzvZTvSQBa1YEsypMFmGiG0p2OhGbcc21Y4ML85g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TYSPR06MB6922.apcprd06.prod.outlook.com (2603:1096:400:46e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Thu, 11 Jul
 2024 07:42:56 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7741.030; Thu, 11 Jul 2024
 07:42:56 +0000
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
Subject: [PATCH 1/2] dma-buf: heaps: DMA_HEAP_IOCTL_ALLOC_READ_FILE framework
Date: Thu, 11 Jul 2024 15:42:16 +0800
Message-ID: <20240711074221.459589-2-link@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3c703c45-404d-4fc3-18f6-08dca17d13dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?91aCou/FcaKD5NJdS46wdsI/Jo4+uXi7+j/GklKmBxI2bsEGgQmOuA39M4pW?=
 =?us-ascii?Q?jJNhn+uvipJ+Mi8OUAoh1TnFpnyH29jkYNhrNYXTK53el+l1a17YgypLi/kF?=
 =?us-ascii?Q?Tiyqo6bjrJ+2cIzNo71BLwqj7AfHt75mAXFutr7Jbndr3Exn+8BwQwnTuYhW?=
 =?us-ascii?Q?v1viXYFavZk/G4jAwLUznJhZ7WFpTp8bVRNzoQflkwFz2jwUZ7mQ8zLTUo2X?=
 =?us-ascii?Q?9pOktFfcT5Yvg9adL54viKtQxpd7ZEOsXyIp9tEXoqiiRdYWNocSfFb7R5t8?=
 =?us-ascii?Q?25RmYaYRytvysUmfgbiaUqiGp7+PLS7LhQwOeIteZYZc9DSO1oQKEkamm3yY?=
 =?us-ascii?Q?MX6bvNiKwSyKsVXUiPLMGy6oVr4dK+AEv6r0n8BAumwFo/7bYIwniObmRT5W?=
 =?us-ascii?Q?SxmiPYbuRhuhTLIuQ3C/d/kKK4nvIDLqH3xvESdZdx9iaK2GroDnH5msXHEQ?=
 =?us-ascii?Q?mtpKPpRDvkO/ejS9azSEdtA+A78puf9RehoQQVKLxCk8dKw07FWOixA+y2nZ?=
 =?us-ascii?Q?gY9v2j0bNJSkYcVFY8V1Vr91z2oJRkov7icWNCQYDC4psSOsU/fUaNaesNqO?=
 =?us-ascii?Q?HyWdgtwnO5sdDD9ZRGGoP3a5wihevBRULaoPSw4VgausJUqo2BJux2YfGxJM?=
 =?us-ascii?Q?SHRQPdvPqL+pSnvTLWziRvfKxHbK71xzDhjM21fmb1tOqOfaUsoiVrUTuQN/?=
 =?us-ascii?Q?PYbr7ess7PBTPhmiJSz/EJ4k3jKaV5MCWK/rdH6fRfTUFgad6CsnQd7oVEFo?=
 =?us-ascii?Q?KenrhzB9huQFN6yV47RlLwtIB3Z6AYIdmowTgtW5L8t7QzXmExaHngnxOGwN?=
 =?us-ascii?Q?mnoujpJ/6yZScmw8wHTm3uI3czEi6wDkmIVbg5a1eAvKRZBnBQE+ZEmp6TrC?=
 =?us-ascii?Q?f9E3jM2ywOltWhUvVbsfqTEXXVvUv2fTse1MRaIBNxHagNvJ3FGpESN5MCVS?=
 =?us-ascii?Q?ABmEoN3rGZ+0pJKXsP96ScTLOp0AchzqE2d2A9I/8utfSVapLAXsfPBhXED3?=
 =?us-ascii?Q?3v2RI9H7Kv2OoR9PF/+wHya8D4CVk+zKARAHubw7k0Ceh61ZjhyXmuMGFksf?=
 =?us-ascii?Q?1bErMyg78kyc9htlg7rhNlJI2fGCOYjJ6jKWkkmk4m/vQeI9N/20BYZS+GCJ?=
 =?us-ascii?Q?aOPHOdiY6bUqm6JQlbikLp73AjTOMZnRcO4P2ZjAZJ0yNOfJA+UzPJS98w0o?=
 =?us-ascii?Q?BZBFdN4jdYky2rGAPX4faFH0XXB4GPwM3OjN8ph22AfK0gbOrAAByroj1iZ+?=
 =?us-ascii?Q?oQdGfe8VhmG5QbzAjUIzp8rD9fOtYiQU/nbQfYAhnmpiGThNKf19CUE9Gbfm?=
 =?us-ascii?Q?l2XTFMxLbkM7DzZCo3wOg6Rvtcz8HNcWv5mxYD0h3/OVSv4bZhehJoyT1Jak?=
 =?us-ascii?Q?moFFo/wYwIor2zm6sjcaMWbRIu9AoxU/+t9PV0hBtc0wFfVbNAn2uByg2b8s?=
 =?us-ascii?Q?uMan6OEloI0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X6aPJLhGBjSk7XfMPl/l4dmjSAFpxM/S7ftE9AythrsPKDDa48/rN1v5YJ+v?=
 =?us-ascii?Q?2KFmTRHb2Ezs048+nuY+XxWeEESy3ycYg/mJcFmup8etcyM9yRmLJ+DH65yz?=
 =?us-ascii?Q?tIjH42uK3Q39EtpGZJztN3AqXYDIEhP83Dsr21S7+bx7FLyBh8PFf3Z2gnAa?=
 =?us-ascii?Q?PcNlU97a2vgIgY7SRccyNFDwAnLGp86WRq/qwE4UKwvgirPlLYD9gdkPVjeM?=
 =?us-ascii?Q?LyUqNFxBFT4fPGpa8BmEf2DNygns02mnjf9SjU8XxZUO/mb5rkBVzXQzfNxv?=
 =?us-ascii?Q?577WLVyDP2xzBoXtdLHTzJ1WEeV+MrP6gOfj6/7/i0xHDM+hwgwgiizZ4zEp?=
 =?us-ascii?Q?03kZdhHz2P1OH4kVunjLpdUT0uIqwWo9abVYoevVWmm4Umh11RZp/JRQUKNC?=
 =?us-ascii?Q?AxcL6mZU8tMS1Rjxei3tVXlXMgyQSxVZLUFwVFvL4S+DZXHSFOcQ52/ABvEa?=
 =?us-ascii?Q?dceCkW58DDAen7z0rbQUfnNBseCwAT3UQpH5h01zs5xXKq9TEIRfVgB23bF8?=
 =?us-ascii?Q?Q00HP1kqNK4/4SVv0zGDlRX2/a4QZsgDnioypWVlFyqtd/8cvIIqWWS++0dW?=
 =?us-ascii?Q?WYpA3FkSmBfmQpP8nSN+DqkFfadjZyGlvxthECaXWbSAJgU4B8QmLkXdOI5H?=
 =?us-ascii?Q?uZjHmAfyGHd3v9YM7uQ4I4lF60C10S0SvPm1ErZjIMDll5Z7IZCz3Vsy0Yj7?=
 =?us-ascii?Q?LC0E1dvw1gVZvPHnqEHx8R3N5rEy7/LeuNBukuApZ8caq6saK6iHSvx8DFn3?=
 =?us-ascii?Q?iuIuaKTh53W+hL7ZwaTa79weqV974FX1BlfEeEQMzfCOZhWS8Fztycu2I4op?=
 =?us-ascii?Q?kdI6KngZ8RTnYsAl3zhGSOuV+iMhl309Js2ZDVrepFk4b9GC3PheHp8FM74m?=
 =?us-ascii?Q?jL5iToOsjq73uGTJzv1tnaellfrNCrOppuUy/lFcMjMWx6G71iyNA8Ss8ODk?=
 =?us-ascii?Q?+EOWuMpjPZP0/fp7y+H1v775kYgxI2imCZivA69FuBEsqEToBEHDZxgfiruw?=
 =?us-ascii?Q?maEjFGYfssdDbDyONjEmz98I7zcjp6MqTn8OS7kyZxohb75np93gFytwoPxM?=
 =?us-ascii?Q?6A3WBBJRNDD5q68My7mDc3dJzc/TCFjoMecsQSgKgoFZQ9ccxwIPKCK0YVgq?=
 =?us-ascii?Q?1Jbehwv0fG7wV4DNaudgP1ro5oB8J5pTwwyjsfvVWaPhh/trBlhDvnzzMPbR?=
 =?us-ascii?Q?L4GvCIg0nJkiQ6NnIhVat9yu2w7qN7sP1kj7s37CAj+Or4m2rK9gWXwlQTFr?=
 =?us-ascii?Q?Ac8f5CIiHXpJWmzDTima9fzxnCsstKxHuFcQTSXBfyofxmv9z084zMGydl75?=
 =?us-ascii?Q?jiSgjeyyjXLNJ9SF4XUWGg7AEVwDGqL1UssBOOT9D2Q7jEmfFGw3Yoh6svKt?=
 =?us-ascii?Q?SvdA6Qjhu80HdDaTcmR8BPQ9IZfz/sYO3l2ztiLJhZEH/UAbRwpaJwfSDf15?=
 =?us-ascii?Q?K4XbsPTqCfv1UeUE327hlZLogccZceCWl695x4Hy04iMAUPFChRvktyRbpJD?=
 =?us-ascii?Q?ZwI2LqOskWNEKgGfhCihOHXUtDDYF/OfZaR+iG1XExx9WFByjDIdIq5QNo9D?=
 =?us-ascii?Q?WcZd3si01LjwfqJI8orQnAXNWRCv7aO8rvx19iCN?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c703c45-404d-4fc3-18f6-08dca17d13dc
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 07:42:55.7987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UOZH5M4gSoM+rqcku6Fm7Sx0ls41ijxukHIdRaR6nKB1hfNRvvvJ6psiiA4EM7JBl+k1HrN7WRSQpiVZ9rj0yw==
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

Some user may need load file into dma-buf, current
way is:
  1. allocate a dma-buf, get dma-buf fd
  2. mmap dma-buf fd into vaddr
  3. read(file_fd, vaddr, fsz)
This is too heavy if fsz reached to GB.

This patch implement a feature called DMA_HEAP_IOCTL_ALLOC_READ_FILE.
User need to offer a file_fd which you want to load into dma-buf, then,
it promise if you got a dma-buf fd, it will contains the file content.

Notice, file_fd depends on user how to open this file. So, both buffer
I/O and Direct I/O is supported.

Signed-off-by: Huan Yang <link@vivo.com>
---
 drivers/dma-buf/dma-heap.c    | 525 +++++++++++++++++++++++++++++++++-
 include/linux/dma-heap.h      |  57 +++-
 include/uapi/linux/dma-heap.h |  32 +++
 3 files changed, 611 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 2298ca5e112e..abe17281adb8 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -15,9 +15,11 @@
 #include <linux/list.h>
 #include <linux/slab.h>
 #include <linux/nospec.h>
+#include <linux/highmem.h>
 #include <linux/uaccess.h>
 #include <linux/syscalls.h>
 #include <linux/dma-heap.h>
+#include <linux/vmalloc.h>
 #include <uapi/linux/dma-heap.h>
 
 #define DEVNAME "dma_heap"
@@ -43,12 +45,462 @@ struct dma_heap {
 	struct cdev heap_cdev;
 };
 
+/**
+ * struct dma_heap_file - wrap the file, read task for dma_heap allocate use.
+ * @file:		file to read from.
+ *
+ * @cred:		kthread use, user cred copy to use for the read.
+ *
+ * @max_batch:		maximum batch size to read, if collect match batch,
+ *			trigger read, default 128MB, must below file size.
+ *
+ * @fsz:		file size.
+ *
+ * @direct:		use direct IO?
+ */
+struct dma_heap_file {
+	struct file *file;
+	struct cred *cred;
+	size_t max_batch;
+	size_t fsz;
+	bool direct;
+};
+
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
+ * @rbatch:		current prepared work's batch, below @dma_heap_file's
+ *			batch.
+ *
+ * @heap_file:		current dma_heap_file
+ *
+ * @parray:		used for vmap, size is @dma_heap_file's batch's number
+ *			pages.(this is maximum). Due to single thread file read,
+ *			one page array reuse each work prepare is OK.
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
+	size_t rbatch;
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
+ * @lock:		only lock for @works.
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
+	spinlock_t lock;
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
 
+/**
+ * map_pages_to_vaddr - map each scatter page into contiguous virtual address.
+ * @heap_ftask:		prepared and need to commit's work.
+ *
+ * Cached pages need to trigger file read, this function map each scatter page
+ * into contiguous virtual address, so that file read can easy use.
+ * Now that we get vaddr page, cached pages can return to original user, so we
+ * will not effect dma-buf export even if file read not end.
+ */
+static void *map_pages_to_vaddr(struct dma_heap_file_task *heap_ftask)
+{
+	return vmap(heap_ftask->parray, heap_ftask->pindex, VM_MAP,
+		    PAGE_KERNEL);
+}
+
+bool dma_heap_prepare_file_read(struct dma_heap_file_task *heap_ftask,
+				struct page *page)
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
+	return heap_ftask->rsize >= heap_ftask->rbatch;
+}
+
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
+	heap_fwork->vaddr = map_pages_to_vaddr(heap_ftask);
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
+static void destroy_file_work(struct dma_heap_file_work *heap_fwork)
+{
+	vunmap(heap_fwork->vaddr);
+	atomic_dec(heap_fwork->refp);
+	wake_up(&heap_fctl->workwq);
+
+	kmem_cache_free(heap_fctl->heap_fwork_cachep, heap_fwork);
+}
+
+int dma_heap_submit_file_read(struct dma_heap_file_task *heap_ftask)
+{
+	struct dma_heap_file_work *heap_fwork = init_file_work(heap_ftask);
+	struct page *last = NULL;
+	struct dma_heap_file *heap_file = heap_ftask->heap_file;
+	size_t start = heap_ftask->roffset;
+	struct file *file = heap_file->file;
+	size_t fsz = heap_file->fsz;
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
+		buffer = kmap_local_page(last); // use page's kaddr.
+		err = kernel_read_file_from_path(pathp, start, &buffer,
+						 fsz - start, &fsz,
+						 READING_POLICY);
+		kunmap_local(buffer);
+		kfree(buf);
+		if (err < 0) {
+			pr_err("failed to use buffer kernel_read_file %s, err=%ld, [%ld, %ld], f_sz=%ld\n",
+			       pathp, err, start, fsz, fsz);
+
+			return err;
+		}
+	}
+
+	heap_ftask->roffset += heap_ftask->rsize;
+	heap_ftask->rsize = 0;
+	heap_ftask->pindex = 0;
+	heap_ftask->rbatch = min_t(size_t,
+				   PAGE_ALIGN(fsz) - heap_ftask->roffset,
+				   heap_ftask->rbatch);
+	return 0;
+}
+
+bool dma_heap_wait_for_file_read(struct dma_heap_file_task *heap_ftask)
+{
+	wait_event_freezable(heap_fctl->workwq,
+			     atomic_read(&heap_ftask->ref) == 0);
+	return heap_ftask->fail;
+}
+
+bool dma_heap_destroy_file_read(struct dma_heap_file_task *heap_ftask)
+{
+	bool fail;
+
+	dma_heap_wait_for_file_read(heap_ftask);
+	fail = heap_ftask->fail;
+	kvfree(heap_ftask->parray);
+	kfree(heap_ftask);
+	return fail;
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
+	 * Batch is the maximum size which we prepare work will meet.
+	 * So, direct alloc this number's page array is OK.
+	 */
+	heap_ftask->parray = kvmalloc_array(heap_file->max_batch >> PAGE_SHIFT,
+					    sizeof(struct page *), GFP_KERNEL);
+	if (unlikely(!heap_ftask->parray))
+		goto put;
+
+	heap_ftask->heap_file = heap_file;
+	heap_ftask->rbatch = heap_file->max_batch;
+	return heap_ftask;
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
+	err = kernel_read_file(file, start, &buffer, size, &heap_file->fsz,
+			       READING_POLICY);
+	if (err < 0) {
+		pr_err("use kernel_read_file, err=%ld, [%ld, %ld], f_sz=%ld\n",
+		       err, start, (start + size), heap_file->fsz);
+		WRITE_ONCE(*heap_fwork->failp, true);
+	}
+	// recovery to my cred.
+	revert_creds(old_cred);
+}
+
+static int dma_heap_file_control_thread(void *data)
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
+				destroy_file_work(worker);
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
+			destroy_file_work(worker);
+		}
+		atomic_sub(nr_work, &heap_fctl->nr_work);
+
+		if (atomic_read(&heap_fctl->nr_work) > 0)
+			goto recheck;
+	}
+	return 0;
+}
+
+size_t dma_heap_file_size(struct dma_heap_file *heap_file)
+{
+	return heap_file->fsz;
+}
+
+static int prepare_dma_heap_file(struct dma_heap_file *heap_file, int file_fd,
+				 size_t batch)
+{
+	struct file *file;
+	size_t fsz;
+	int ret;
+
+	file = fget(file_fd);
+	if (!file)
+		return -EINVAL;
+
+	fsz = i_size_read(file_inode(file));
+	if (fsz < batch) {
+		ret = -EINVAL;
+		goto err;
+	}
+
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
+	heap_file->file = file;
+	heap_file->max_batch = batch;
+	heap_file->fsz = fsz;
+
+	heap_file->direct = file->f_flags & O_DIRECT;
+
+#define DMA_HEAP_SUGGEST_DIRECT_IO_SIZE (1UL << 30)
+	if (!heap_file->direct && fsz >= DMA_HEAP_SUGGEST_DIRECT_IO_SIZE)
+		pr_warn("alloc read file better to use O_DIRECT to read larget file\n");
+
+	return 0;
+
+err:
+	fput(file);
+	return ret;
+}
+
+static void destroy_dma_heap_file(struct dma_heap_file *heap_file)
+{
+	fput(heap_file->file);
+	put_cred(heap_file->cred);
+}
+
+static int dma_heap_buffer_alloc_read_file(struct dma_heap *heap, int file_fd,
+					   size_t batch, unsigned int fd_flags,
+					   unsigned int heap_flags)
+{
+	struct dma_buf *dmabuf;
+	int fd;
+	struct dma_heap_file heap_file;
+
+	fd = prepare_dma_heap_file(&heap_file, file_fd, batch);
+	if (fd)
+		goto error_file;
+
+	dmabuf = heap->ops->allocate_read_file(heap, &heap_file, fd_flags,
+					       heap_flags);
+	if (IS_ERR(dmabuf)) {
+		fd = PTR_ERR(dmabuf);
+		goto error;
+	}
+
+	fd = dma_buf_fd(dmabuf, fd_flags);
+	if (fd < 0) {
+		dma_buf_put(dmabuf);
+		/* just return, as put will call release and that will free */
+	}
+
+error:
+	destroy_dma_heap_file(&heap_file);
+error_file:
+	return fd;
+}
+
 static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
 				 u32 fd_flags,
 				 u64 heap_flags)
@@ -93,6 +545,38 @@ static int dma_heap_open(struct inode *inode, struct file *file)
 	return 0;
 }
 
+static long dma_heap_ioctl_allocate_read_file(struct file *file, void *data)
+{
+	struct dma_heap_allocation_file_data *heap_allocation_file = data;
+	struct dma_heap *heap = file->private_data;
+	int fd;
+
+	if (heap_allocation_file->fd || !heap_allocation_file->file_fd)
+		return -EINVAL;
+
+	if (heap_allocation_file->fd_flags & ~DMA_HEAP_VALID_FD_FLAGS)
+		return -EINVAL;
+
+	if (heap_allocation_file->heap_flags & ~DMA_HEAP_VALID_HEAP_FLAGS)
+		return -EINVAL;
+
+	if (!heap->ops->allocate_read_file)
+		return -EINVAL;
+
+	fd = dma_heap_buffer_alloc_read_file(
+		heap, heap_allocation_file->file_fd,
+		heap_allocation_file->batch ?
+			PAGE_ALIGN(heap_allocation_file->batch) :
+			DEFAULT_ADI_BATCH,
+		heap_allocation_file->fd_flags,
+		heap_allocation_file->heap_flags);
+	if (fd < 0)
+		return fd;
+
+	heap_allocation_file->fd = fd;
+	return 0;
+}
+
 static long dma_heap_ioctl_allocate(struct file *file, void *data)
 {
 	struct dma_heap_allocation_data *heap_allocation = data;
@@ -121,6 +605,7 @@ static long dma_heap_ioctl_allocate(struct file *file, void *data)
 
 static unsigned int dma_heap_ioctl_cmds[] = {
 	DMA_HEAP_IOCTL_ALLOC,
+	DMA_HEAP_IOCTL_ALLOC_AND_READ,
 };
 
 static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
@@ -170,6 +655,9 @@ static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
 	case DMA_HEAP_IOCTL_ALLOC:
 		ret = dma_heap_ioctl_allocate(file, kdata);
 		break;
+	case DMA_HEAP_IOCTL_ALLOC_AND_READ:
+		ret = dma_heap_ioctl_allocate_read_file(file, kdata);
+		break;
 	default:
 		ret = -ENOTTY;
 		goto err;
@@ -316,11 +804,44 @@ static int dma_heap_init(void)
 
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
+	heap_fctl->work_thread = kthread_run(dma_heap_file_control_thread,
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
index 064bad725061..9c25383f816c 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -12,12 +12,17 @@
 #include <linux/cdev.h>
 #include <linux/types.h>
 
+#define DEFAULT_ADI_BATCH (128 << 20)
+
 struct dma_heap;
+struct dma_heap_file_task;
+struct dma_heap_file;
 
 /**
  * struct dma_heap_ops - ops to operate on a given heap
  * @allocate:		allocate dmabuf and return struct dma_buf ptr
- *
+ * @allocate_read_file: allocate dmabuf and read file, then return struct
+ * dma_buf ptr.
  * allocate returns dmabuf on success, ERR_PTR(-errno) on error.
  */
 struct dma_heap_ops {
@@ -25,6 +30,11 @@ struct dma_heap_ops {
 				    unsigned long len,
 				    u32 fd_flags,
 				    u64 heap_flags);
+
+	struct dma_buf *(*allocate_read_file)(struct dma_heap *heap,
+					      struct dma_heap_file *heap_file,
+					      u32 fd_flags,
+					      u64 heap_flags);
 };
 
 /**
@@ -65,4 +75,49 @@ const char *dma_heap_get_name(struct dma_heap *heap);
  */
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
 
+/**
+ * dma_heap_destroy_file_read - waits for a file read to complete then destroy it
+ * Returns: true if the file read failed, false otherwise
+ */
+bool dma_heap_destroy_file_read(struct dma_heap_file_task *heap_ftask);
+
+/**
+ * dma_heap_wait_for_file_read - waits for a file read to complete
+ * Returns: true if the file read failed, false otherwise
+ */
+bool dma_heap_wait_for_file_read(struct dma_heap_file_task *heap_ftask);
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
+ * dma_heap_prepare_file_read - cache each allocated page until we meet this batch.
+ * @heap_ftask:		prepared and need to commit's work.
+ * @page:		current allocated page. don't care which order.
+ *
+ * Returns true if reach to batch, false so go on prepare.
+ */
+bool dma_heap_prepare_file_read(struct dma_heap_file_task *heap_ftask,
+				struct page *page);
+
+/**
+ * dma_heap_commit_file_read -  prepare collect enough memory, going to trigger IO
+ * @heap_ftask:			info that current IO needs
+ *
+ * This commit will also check if reach to tail read.
+ * For direct I/O submissions, it is necessary to pay attention to file reads
+ * that are not page-aligned. For the unaligned portion of the read, buffer IO
+ * needs to be triggered.
+ * Returns:
+ *   0 if all right, -errno if something wrong
+ */
+int dma_heap_submit_file_read(struct dma_heap_file_task *heap_ftask);
+size_t dma_heap_file_size(struct dma_heap_file *heap_file);
+
 #endif /* _DMA_HEAPS_H */
diff --git a/include/uapi/linux/dma-heap.h b/include/uapi/linux/dma-heap.h
index a4cf716a49fa..8c20e8b74eed 100644
--- a/include/uapi/linux/dma-heap.h
+++ b/include/uapi/linux/dma-heap.h
@@ -39,6 +39,27 @@ struct dma_heap_allocation_data {
 	__u64 heap_flags;
 };
 
+/**
+ * struct dma_heap_allocation_file_data - metadata passed from userspace for
+ *                                      allocations and read file
+ * @fd:			will be populated with a fd which provides the
+ *			handle to the allocated dma-buf
+ * @file_fd:		file descriptor to read from(suggested to use O_DIRECT open file)
+ * @batch:		how many memory alloced then file read(bytes), default 128MB
+ *			will auto aligned to PAGE_SIZE
+ * @fd_flags:		file descriptor flags used when allocating
+ * @heap_flags:		flags passed to heap
+ *
+ * Provided by userspace as an argument to the ioctl
+ */
+struct dma_heap_allocation_file_data {
+	__u32 fd;
+	__u32 file_fd;
+	__u32 batch;
+	__u32 fd_flags;
+	__u64 heap_flags;
+};
+
 #define DMA_HEAP_IOC_MAGIC		'H'
 
 /**
@@ -50,4 +71,15 @@ struct dma_heap_allocation_data {
 #define DMA_HEAP_IOCTL_ALLOC	_IOWR(DMA_HEAP_IOC_MAGIC, 0x0,\
 				      struct dma_heap_allocation_data)
 
+/**
+ * DOC: DMA_HEAP_IOCTL_ALLOC_AND_READ - allocate memory from pool and both
+ *					read file when allocate memory.
+ *
+ * Takes a dma_heap_allocation_file_data struct and returns it with the fd field
+ * populated with the dmabuf handle of the allocation. When return, the dma-buf
+ * content is read from file.
+ */
+#define DMA_HEAP_IOCTL_ALLOC_AND_READ \
+	_IOWR(DMA_HEAP_IOC_MAGIC, 0x1, struct dma_heap_allocation_file_data)
+
 #endif /* _UAPI_LINUX_DMABUF_POOL_H */
-- 
2.45.2

