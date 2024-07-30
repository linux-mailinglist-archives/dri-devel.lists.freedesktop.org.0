Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CC5940A83
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 09:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3885510E178;
	Tue, 30 Jul 2024 07:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="AgrMEEO9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2060.outbound.protection.outlook.com [40.107.255.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B553B10E178
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 07:58:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZgCa8Qj/t2lRBoObgMJZMNjN1C4B6zzVL5RVSAIldYp+c+CDx+TwRv7HZyFoEGj77A9/3B2dmHuKvXvga8IVFouo+KQOCgsEAEM3YEmv5NZblicQeFxD1bNLkCtJS9ynu1FIewdf5RXwKmf1qPbOoiZo/Z+rkD2Jt9v4qpT4HDHHOfWxabVIf8iJ92d7XLxmUPeozerSdtZcRU7jPDvQkpKItgx64wZGg7DlER5Az4U5Jc9eKGuCzTrXiCWGM/psqpk28BLuiHVgiKOj37OkI3inUminKj32df+ZjezFzs+ztcuq6xw+lMqfKYML2u9MLic9ledJwVVT+CQD4hz7ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2U7WmrwkY7YtnxAS/SSqqjqjQT2Pamp83Uu86/pyqI=;
 b=LPR02S2G58VU2yGreHZrYi0dK4sJUaj3Fh54wuqp0cXAVY00xnK8K9DFdz2HtTlKL16oScD4DVD/WJY1cIlohoItxlWdHTnlnXWYkJqQpHvB0ISMGH7YApZgH0XjJ40ZFezXC6JzzeHrgk3/1LtQFZ0AjX0YbyI6MHGxOoCJ64jxqcsVg688N6Y8xNiKQFiOz0B5wxtxyeGixAiC0CnUAcKqj6EFZyH3ZrZ7dDshAFXSh5iMf/fRqPw2RQA3WvSD1SF6/2Xj3IWEkay+IXBsCXMVBkT2oFWiXM1iljQE6rvhyJ4gS2rAqKRQ3Ss9SBd4RUBs2YwS4ozTBscv2tZI4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2U7WmrwkY7YtnxAS/SSqqjqjQT2Pamp83Uu86/pyqI=;
 b=AgrMEEO99xodgKVF/wQe9jE+f0AcaH3lHPDF6qqvgrDzVmsQv0VH826jdYwl61RAdQ3XMpoJ7+8flNKjVasQ50B8sODDhOuobm5M7WK1DqzqiiOYBjN60aUKXzfmfvGdP7ysUEhYTnerQ6QzgT/dR043xPj19OhdW3rHba97EXaDkXt7BAB1ttt/N0ENcPR7HInAFIpjVCF2X5LbocTXiIxHBjWIZo+cq8dswAvD3TkyCT5TVtXHToPEk8MC32IAETdxfCDpatHJpz0EnYnKlgfv52Y/9SymdadL1SUgryELSQjYvt7Q5POLOQ+DoJtau/czFU6YqiQlhHWC1My03w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SEZPR06MB7289.apcprd06.prod.outlook.com (2603:1096:101:24d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 07:58:16 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 07:58:14 +0000
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
Subject: [PATCH v2 0/5] Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
Date: Tue, 30 Jul 2024 15:57:44 +0800
Message-ID: <20240730075755.10941-1-link@vivo.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::14) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SEZPR06MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: c8c4429e-e01f-4727-fed5-08dcb06d5d6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ew6aQiJCf3mJk4brJHL/f+kB/FP+tGb+kCsxn1OBYdbgrYgaqksi2f6IY2k1?=
 =?us-ascii?Q?lMKz0Hihd2s/+SItE4vXc4ff8aLRulvwCDGCsOA+MA7ofORCvRJfCFhk5LKt?=
 =?us-ascii?Q?zPtcFe5zHSOsLwki5pbr4z6HaXxPWG4C6IvwgeaN0uUju+PQFMfOx+cNCnK4?=
 =?us-ascii?Q?NZREC/ZZNXbCwcHBP9xiWL6a2dEOhXcQDWhpqIhMJO0SfJQcpIg+R45X+QdH?=
 =?us-ascii?Q?SHZvi4jhW7PSbt5ZvfGYZcgORBn3sn+9S85YSC6RhRY2EKcxXHVEaiAQ6TJg?=
 =?us-ascii?Q?wvhten5zsjTnS9JEygG2www2Q5E48DcB8x9AB2L2BhBARnPB3C23ATEGXBeL?=
 =?us-ascii?Q?x2RUKZIE/Wv0GtV5Sau8h1q8zWgjDGiEpTCoSasDNXrXgy9XBcMNMG04yYqm?=
 =?us-ascii?Q?DZqaFD4axryom8uKyzPZi0AeTbTqF4IeKYtm0hvDcDUF/i+5+SJ2+eMzpJCE?=
 =?us-ascii?Q?tpPKBzTfU13lf98hVqbhejKL6myOA8n6E//Bjk0ezQKrO8pDeoSQ4JCdP+0J?=
 =?us-ascii?Q?R5YwDCtRUew1TI9ytdc5EtLd5yNcus0sDfuiAWaLtvh8wE2XZgXqvYgyGCOl?=
 =?us-ascii?Q?ytp+xNWxj8SCJ3/rWP/Bt5kTj854dFfEpaxfZEU2dP61jNx5UnbJ/dV52QmM?=
 =?us-ascii?Q?tKvWDNf4toCVceL5sHZLt2zIVLdv5i5fv/UvpSryLQ7R5Gt2Ovgy95sVUbjF?=
 =?us-ascii?Q?zeMjrzj8MM881fKl+qGvjvG7Fd1f+VvXDmB9Op7QxrO0u1rRmUkhLMY2I8ri?=
 =?us-ascii?Q?ZViR6EnFwKXlHqVmqT/oGmr7oHaUMuCW9ABYZPLv9vDgi/JH00Ln9pmluCo1?=
 =?us-ascii?Q?MAGmgdBuo3qDR8JDocs62oJTSynHFbzdDJQ3q+zEsaRK46CvnggmynUCIbdf?=
 =?us-ascii?Q?uOafEYKk7hEiTJ3UPrea3IOZAR6TKaaxylR2p/Wx/G5ZkbWKthkRILRFEmz0?=
 =?us-ascii?Q?6En2VXJH5a+Od7f4ebgvhttNNoNUdYgMLQxl87NajmbUh+6b8quwfPslXCk0?=
 =?us-ascii?Q?tw7sW0I9efsnzfhOagCOdFnVL0MIB/THeIgP7q4gGHndyex35sMf9ebW0Jli?=
 =?us-ascii?Q?aaiNrJLvnZ0T+0SuxDItLSFgJcUG5M4ctB1pqgKXHfQzHBuT07C+XtNjq5uV?=
 =?us-ascii?Q?MNe+EKCv7zmg0Es6fYjL8wC9GHwGFz9kYrLOlBBJSKx7kXUmNPCji7oxMgmn?=
 =?us-ascii?Q?bDAaMGZ6x52Hr4QC1iCsTkpp8wBCQn9BiO/27u7Y+fh1klBNC/HGlsQKRhjc?=
 =?us-ascii?Q?kq6qUNZAAsxeAUXNQB3iVOqf9rj/ethDGVLHDhHYz9wqq+N+0sxUlX4DXdCY?=
 =?us-ascii?Q?OJ2PpVMtRsdxdVRkRnogAJMNXRSiLpTeq4CM9QOMXngkCcLm8vcdSxZPVzEU?=
 =?us-ascii?Q?wQUXAWs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iXG3miXV2BQUMn3EgAkXRjrxylKWeWQnDi5uC6DnsKC3vkyld0RQY3uC5Nc6?=
 =?us-ascii?Q?FkMW6O8B7h3k23JvTJAKDa26DD+SUrDLhfrhiIcIkwogGF+3ZQXg3aA8pAdO?=
 =?us-ascii?Q?gAlMReRku0TiDbWcNLXeQ03/Lssmq/JVqpflBxdjZgK124kXgmAVyPbLHdpp?=
 =?us-ascii?Q?Gv/EtytrV4CCFitKNvIIK6B5AtFNby4v3I6jRXhvJ21sRm54U1DeeGglbtfr?=
 =?us-ascii?Q?fblsdBV5CsjqG8BWnIZ4VGcAFYL2TNH1NVgPaiR7NqVT6w/yKXbNeHkVUYIM?=
 =?us-ascii?Q?hpQjzFYcB5msUgx0GENdyhmseMhhAC2zaKSmfGXA9OJbXyUujnvf7Jb7BxvZ?=
 =?us-ascii?Q?BWeq94VHyHaC4mZGLr/kWSXMLJTr+gKS6iwK/tjaCRURRGXrbLqCLGwPWd9Z?=
 =?us-ascii?Q?vIXs10csoLleGlWjNun70Cqvfs+66ug07uN0yuuLJUqg1Dm8QlKaP54xNwTy?=
 =?us-ascii?Q?SyMs/dF5G4rH+zuIDYlf1A17UBOuDd1syMONMQt1YKNJBE5xtQIOFK1XdTTh?=
 =?us-ascii?Q?NPGaUGH42o6H2pggzU/bc0OVWsjT9HDzS6J39d0jQOzSHzjSVfwhSMpjBWhV?=
 =?us-ascii?Q?yI0StuUw4mtCBljMk2OvhTWtwvOoHrSKd/lD1cZayjoyEPRmp2r5FM5EZ+Qe?=
 =?us-ascii?Q?U60i+I/UJQ7DAksJSznITzts9/lpNw7fIeucGQQL9/aDTDXDI/fTmxTR/vS2?=
 =?us-ascii?Q?X0KWxIP6yzpq4mwR4WUO949ECks+basrLROwYntwfjUIRepc+tN4ZjnHckiw?=
 =?us-ascii?Q?XICcIPtH+GuvPsao5WCF4n5n9A0NjFTP8PUtRacpQAlv4hP1RhgyBxQ2tSCj?=
 =?us-ascii?Q?/4o4iWp4w6DqseOoh331r4utS1VdyXavk3AA5zwD1PaAqVFCR6VCW6q0mpRo?=
 =?us-ascii?Q?/tsdig5Jof/y7V0/eijhkQSgEjGYdgmSd5eXSnWE5qXrX3VA5v/ZmKg7dkh7?=
 =?us-ascii?Q?fHW9p8x4+rBfUerk67gD0ofCVT0s+3d4RMYjS9h5zLGL6D3GX6TCdl2P/87E?=
 =?us-ascii?Q?n2ny16+htQTpCe4TPMxQzA3d3tYOHA2brFX7My8yBd8Oqx7kcD+HYtv9cxTQ?=
 =?us-ascii?Q?26Ke1wiMSqOEJksgHuILN4BW6exLxJ55d7OobcUxvkz59s/ijmqKpE36kfRE?=
 =?us-ascii?Q?y112zycqCb6jIZATnScImfFz/TPsbhC9M7x1AYkI6722IHW/qrW+fxqbhvlZ?=
 =?us-ascii?Q?p/bWPQ5HN3d0lRZqDLWaKV9MF7GZWF1kZ4Tc+U5Sy/noAOez9Taxn0v8g4eE?=
 =?us-ascii?Q?ZmpISg3P4+lKk/NwG8y1BULKsunha3YqC2KzxOWHBez6bxHXP9Pg6FjmknAy?=
 =?us-ascii?Q?McJhS+kkTDslLMN64r/2RMaDRbKwfB/L/Bg7jghCe0/Es1pI0dxhIBjzGCcd?=
 =?us-ascii?Q?6h3NFdkkfTg683nMHx/FuP+BSPoU1xGSXUw7r1AoTReAJu4vxd2vzdNYzH3X?=
 =?us-ascii?Q?u2aQCA5qrX/GDdMlfLOdlRnvVsgvVUV+ncNSLwqrKzhADGW7R1cToWQEitqj?=
 =?us-ascii?Q?A81FlEeb6m1c1S0tzuKfujcfqr6wFEPpfurEJ87K9CpG3c9X7ax8lwaED1KY?=
 =?us-ascii?Q?Zhon36X7vPspG0jtQCvJcqqkZnZr21d44syRS/d6?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c4429e-e01f-4727-fed5-08dcb06d5d6e
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 07:58:14.7321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bH7JedQ5BJyfM+teIjqF6i3uuESJ2uPv0bYM6TfTROXscw97ReMUjrBbbutbk/pMZ6VcqyQU7EdTEHjWpj+EIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7289
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

Background
====
Some user may need load file into dma-buf, current way is:
  1. allocate a dma-buf, get dma-buf fd
  2. mmap dma-buf fd into user vaddr
  3. read(file_fd, vaddr, fsz)
Due to dma-buf user map can't support direct I/O[1], the file read
must be buffer I/O.

This means that during the process of reading the file into dma-buf,
page cache needs to be generated, and the corresponding content needs to
be first copied to the page cache before being copied to the dma-buf.

This way worked well when reading relatively small files before, as
the page cache can cache the file content, thus improving performance.

However, there are new challenges currently, especially as AI models are
becoming larger and need to be shared between DMA devices and the CPU
via dma-buf.

For example, our 7B model file size is around 3.4GB. Using the
previous would mean generating a total of 3.4GB of page cache
(even if it will be reclaimed), and also requiring the copying of 3.4GB
of content between page cache and dma-buf. 

Due to the limited resources of system memory, files in the gigabyte range
cannot persist in memory indefinitely, so this portion of page cache may
not provide much assistance for subsequent reads. Additionally, the
existence of page cache will consume additional system resources due to
the extra copying required by the CPU.

Therefore, I think it is necessary for dma-buf to support direct I/O.

However, direct I/O file reads cannot be performed using the buffer
mmaped by the user space for the dma-buf.[1]

Here are some discussions on implementing direct I/O using dma-buf:

mmap[1]
---
dma-buf never support user map vaddr use of direct I/O.

udmabuf[2]
---
Currently, udmabuf can use the memfd method to read files into
dma-buf in direct I/O mode.

However, if the size is large, the current udmabuf needs to adjust the
corresponding size_limit(default 64MB).
But using udmabuf for files at the 3GB level is not a very good approach.
It needs to make some adjustments internally to handle this.[3] Or else,
fail create.

But, it is indeed a viable way to enable dma-buf to support direct I/O.
However, it is necessary to initiate the file read after the memory allocation
is completed, and handle race conditions carefully.

sendfile/splice[4]
---
Another way to enable dma-buf to support direct I/O is by implementing
splice_write/write_iter in the dma-buf file operations (fops) to adapt
to the sendfile method.
However, the current sendfile/splice calls are based on pipe. When using
direct I/O to read a file, the content needs to be copied to the buffer
allocated by the pipe (default 64KB), and then the dma-buf fops'
splice_write needs to be called to write the content into the dma-buf.
This approach requires serially reading the content of file pipe size
into the pipe buffer and then waiting for the dma-buf to be written
before reading the next one.(The I/O performance is relatively weak
under direct I/O.)
Moreover, due to the existence of the pipe buffer, even when using
direct I/O and not needing to generate additional page cache,
there still needs to be a CPU copy.

copy_file_range[5]
---
Consider of copy_file_range, It only supports copying files within the
same file system. Similarly, it is not very practical.


So, currently, there is no particularly suitable solution on VFS to
allow dma-buf to support direct I/O for large file reads.

This patchset provides an idea to complete file reads when requesting a
dma-buf.

Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
===
This patch provides a method to immediately read the file content after
the dma-buf is allocated, and only returns the dma-buf file descriptor
after the file is fully read.

Since the dma-buf file descriptor is not returned, no other thread can
access it except for the current thread, so we don't need to worry about
race conditions.

Map the dma-buf to the vmalloc area and initiate file reads in kernel
space, supporting both buffer I/O and direct I/O.

This patch adds the DMA_HEAP_ALLOC_AND_READ heap_flag for user.
When a user needs to allocate a dma-buf and read a file, they should
pass this heap flag. As the size of the file being read is fixed, there is no
need to pass the 'len' parameter. Instead, The file_fd needs to be passed to
indicate to the kernel the file that needs to be read.

The file open flag determines the mode of file reading.
But, please note that if direct I/O(O_DIRECT) is needed to read the file,
the file size must be page aligned. (with patch 2-5, no need)

Therefore, for the user, len and file_fd are mutually exclusive,
and they are combined using a union.

Once the user obtains the dma-buf fd, the dma-buf directly contains the
file content.

Patch 1 implement it.

Patch 2-5 provides an approach for performance improvement.

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

The default gather size is 128MB. So, ever gathered can see as a file read
work, it maps the gather page to the vmalloc area to obtain a continuous
virtual address, which is used as a buffer to store the contents of the
corresponding file. So, if using direct I/O to read a file, the file
content will be written directly to the corresponding dma-buf buffer memory
without any additional copying.(compare to pipe buffer.)

Consider other ways to read into dma-buf. If we assume reading after mmap
dma-buf, we need to map the pages of the dma-buf to the user virtual
address space. Also, udmabuf memfd need do this operations too.
Even if we support sendfile, the file copy also need buffer, you must
setup it.
So, mapping pages to the vmalloc area does not incur any additional
performance overhead compared to other methods.[6]

Certainly, the administrator can also modify the gather size through patch5.

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

How to use
===
Consider the current pathway for loading model files into DMA-BUF:
  1. open dma-heap, get heap fd
  2. open file, get file_fd(can't use O_DIRECT)
  3. use file len to allocate dma-buf, get dma-buf fd
  4. mmap dma-buf fd, get vaddr
  5. read(file_fd, vaddr, file_size) into dma-buf pages
  6. share, attach, whatever you want

Use DMA_HEAP_ALLOC_AND_READ_FILE JUST a little change:
  1. open dma-heap, get heap fd
  2. open file, get file_fd(buffer/direct)
  3. allocate dma-buf with DMA_HEAP_ALLOC_AND_READ_FILE heap flag, set file_fd
     instead of len. get dma-buf fd(contains file content)
  4. share, attach, whatever you want

So, test it is easy.

How to test
===
The performance comparison will be conducted for the following scenarios:
  1. normal
  2. udmabuf with [3] patch
  3. sendfile
  4. only patch 1
  5. patch1 - patch4.

normal:
  1. open dma-heap, get heap fd
  2. open file, get file_fd(can't use O_DIRECT)
  3. use file len to allocate dma-buf, get dma-buf fd
  4. mmap dma-buf fd, get vaddr
  5. read(file_fd, vaddr, file_size) into dma-buf pages
  6. share, attach, whatever you want

UDMA-BUF step:
  1. memfd_create
  2. open file(buffer/direct)
  3. udmabuf create
  4. mmap memfd
  5. read file into memfd vaddr

Sendfile step(need suit splice_write/write_iter, just use to compare):
  1. open dma-heap, get heap fd
  2. open file, get file_fd(buffer/direct)
  3. use file len to allocate dma-buf, get dma-buf fd
  4. sendfile file_fd to dma-buf fd
  6. share, attach, whatever you want

patch1/patch1-4:
  1. open dma-heap, get heap fd
  2. open file, get file_fd(buffer/direct)
  3. allocate dma-buf with DMA_HEAP_ALLOC_AND_READ_FILE heap flag, set file_fd
     instead of len. get dma-buf fd(contains file content)
  4. share, attach, whatever you want

You can create a file to test it. Compare the performance gap between the two.
It is best to compare the differences in file size from KB to MB to GB.

The following test data will compare the performance differences between 512KB,
8MB, 1GB, and 3GB under various scenarios.

Performance Test
===
  12G RAM phone
  UFS4.0(the maximum speed is 4GB/s. ),
  f2fs
  kernel 6.1 with patch[7] (or else, can't support kvec direct I/O read.)
  no memory pressure.
  drop_cache is used for each test.

The average of 5 test results:
| scheme-size         | 512KB(ns)  | 8MB(ns)    | 1GB(ns)       | 3GB(ns)       |
| ------------------- | ---------- | ---------- | ------------- | ------------- |
| normal              | 2,790,861  | 14,535,784 | 1,520,790,492 | 3,332,438,754 |
| udmabuf buffer I/O  | 1,704,046  | 11,313,476 | 821,348,000   | 2,108,419,923 |
| sendfile buffer I/O | 3,261,261  | 12,112,292 | 1,565,939,938 | 3,062,052,984 |
| patch1-4 buffer I/O | 2,064,538  | 10,771,474 | 986,338,800   | 2,187,570,861 |
| sendfile direct I/O | 12,844,231 | 37,883,938 | 5,110,299,184 | 9,777,661,077 |
| patch1 direct I/O   | 813,215    | 6,962,092  | 2,364,211,877 | 5,648,897,554 |
| udmabuf direct I/O  | 1,289,554  | 8,968,138  | 921,480,784   | 2,158,305,738 |
| patch1-4 direct I/O | 1,957,661  | 6,581,999  | 520,003,538   | 1,400,006,107 |

So, based on the test results:

When the file is large, the patchset has the highest performance.
Compared to normal, patchset is a 50% improvement;
Compared to normal, patch1 only showed a degradation of 41%.
patch1 typical performance breakdown is as follows:
  1. alloc cost 188,802,693 ns
  2. vmap cost 42,491,385 ns
  3. file read cost 4,180,876,702 ns
Therefore, directly performing a single direct I/O read on a large file
may not be the most optimal way for performance.

The performance of direct I/O implemented by the sendfile method is the worst.

When file size is small, The difference in performance is not
significant. This is consistent with expectations.



Suggested use cases
===
  1. When there is a need to read large files and system resources are scarce,
     especially when the size of memory is limited.(GB level) In this
     scenario, using direct I/O for file reading can even bring performance
     improvements.(may need patch2-3)
  2. For embedded devices with limited RAM, using direct I/O can save system
     resources and avoid unnecessary data copying. Therefore, even if the
     performance is lower when read small file, it can still be used
     effectively.
  3. If there is sufficient memory, pinning the page cache of the model files
     in memory and placing file in the EROFS file system for read-only access
     maybe better.(EROFS do not support direct I/O)


Changlog
===
 v1 [8]
 v1->v2:
   Uses the heap flag method for alloc and read instead of adding a new
   DMA-buf ioctl command. [9]
   Split the patchset to facilitate review and test.
     patch 1 implement alloc and read, offer heap flag into it.
     patch 2-4 offer async read
     patch 5 can change gather limit.

Reference
===
[1] https://lore.kernel.org/all/0393cf47-3fa2-4e32-8b3d-d5d5bdece298@amd.com/
[2] https://lore.kernel.org/all/ZpTnzkdolpEwFbtu@phenom.ffwll.local/
[3] https://lore.kernel.org/all/20240725021349.580574-1-link@vivo.com/
[4] https://lore.kernel.org/all/Zpf5R7fRZZmEwVuR@infradead.org/
[5] https://lore.kernel.org/all/ZpiHKY2pGiBuEq4z@infradead.org/
[6] https://lore.kernel.org/all/9b70db2e-e562-4771-be6b-1fa8df19e356@amd.com/
[7] https://patchew.org/linux/20230209102954.528942-1-dhowells@redhat.com/20230209102954.528942-7-dhowells@redhat.com/
[8] https://lore.kernel.org/all/20240711074221.459589-1-link@vivo.com/
[9] https://lore.kernel.org/all/5ccbe705-883c-4651-9e66-6b452c414c74@amd.com/

Huan Yang (5):
  dma-buf: heaps: Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
  dma-buf: heaps: Introduce async alloc read ops
  dma-buf: heaps: support alloc async read file
  dma-buf: heaps: system_heap alloc support async read
  dma-buf: heaps: configurable async read gather limit

 drivers/dma-buf/dma-heap.c          | 552 +++++++++++++++++++++++++++-
 drivers/dma-buf/heaps/system_heap.c |  70 +++-
 include/linux/dma-heap.h            |  53 ++-
 include/uapi/linux/dma-heap.h       |  11 +-
 4 files changed, 673 insertions(+), 13 deletions(-)


base-commit: 931a3b3bccc96e7708c82b30b2b5fa82dfd04890
-- 
2.45.2

