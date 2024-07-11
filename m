Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 773D192EFD9
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 21:40:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DEF210EB63;
	Thu, 11 Jul 2024 19:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="HJ5oKU4C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2062.outbound.protection.outlook.com [40.107.255.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58E310E97C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 07:42:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBeX7sMRLl4UV1jKv2zWAyiJE5z++RXSNaGNbagECAAYpTaAy35+QmL2mShurHK+Pt2ErkekLRjGDzock6uHcNtmOtWKuIJt6EL/JUTq2sYhGvU8aUxuIGF4C+DanjgF758la+qNeKr4Fvvlv4sfvN9geLVhboxXnjSjcVxd6U1atecAcryKLBU3U5d/LAqnYeyUyRYJA8MswS82dxrtW/dDpvPllYKV02DfgCxfFr+zWcf24IwuIu22J8jqk12xzxhtcXxr5SL8rlS6kZKlY+kCnTQe/BFT384CjvA35OVhSQguhCbbETv9xx41xh4a5mYSUbvDHckopMVrO7vqxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIbJOf9dCI9j2eDOuShE6mlR/of2KYyEOyvcPYvok1w=;
 b=wQohex7zHwmaHLZUMuZYG6q+f49d2YYIv+MqXoRzYh0FWFu2KNqxqTUen/Au9DO3WTQgNQi2V8pCfS5Q59MMRnNv9dfPojnoal3CFjG/pb9NhJip417EyVOKIjtZUY2daVczL9hYrzLh47jjaoB1xBQ7dzWOTNUzycyFy1jBAS8jr6O1EQp3QybdqxLqrAg20sO1s2B8VEcVehFz0RAYVyuywHogFZYRtDMkLSJvBwR8gqy+gZ0gzcQ84jzN+i9Cjs4MwrkQAem9C5s/ViBBlvpznKH34iH72TeqLdI/7gkotE6O2VVUSZP9o20f7MTH9GYO2ThW3TT5qA5/U/4xEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIbJOf9dCI9j2eDOuShE6mlR/of2KYyEOyvcPYvok1w=;
 b=HJ5oKU4CM3KLsnzouaRZXv51WWCdn8/YjPOcBXJykvGpRX4SVw4SXoWBtSdmqZ3l7sppxeN8K2RfqMhW+BmBy4iXdn3kMF3kHIqk09j5+zTQJqdYmxyHZ0EI2vUfv1Z+jvUXdV1vYeqPjP3pgQ5GXjp90C5vcQKwcelvo5W9k4VdgzuJe66/WP//BtYQZdGZKTG6mqZne04pFj9fCv9alhNbBl0D4TvKV9CQucXD34xdtxzDrISr97BzKkGq1v3T6fLnEcv9aYjaaL4OJnBg1BiMPxMZypacRnSgVjUFRhEOFupPP+bkWx87KB1FdE1wGqW5JznGLofoK00zjueNFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TYSPR06MB6922.apcprd06.prod.outlook.com (2603:1096:400:46e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Thu, 11 Jul
 2024 07:42:53 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7741.030; Thu, 11 Jul 2024
 07:42:52 +0000
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
Subject: [PATCH 0/2]  Introduce DMA_HEAP_IOCTL_ALLOC_AND_READ
Date: Thu, 11 Jul 2024 15:42:15 +0800
Message-ID: <20240711074221.459589-1-link@vivo.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0128.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::32) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TYSPR06MB6922:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f94a543-58ff-4f7c-bf04-08dca17d1229
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7wHOrqzr4ENsPTLznzv5qFh7cuGF9Ap5LDRwInkpShF0UKuE/Y89Kvx4DWAC?=
 =?us-ascii?Q?gFi+NebAsZV+fLLPRaAfj6fWSBIJmTBpJLJQHPhryuZ2PScxc5YSzjicAqBN?=
 =?us-ascii?Q?JkNfs/DWixpOLSa+r7jFpCQ52h8YQY+X2lQBI3Ym79SCN/c5b04nLeyKzA3J?=
 =?us-ascii?Q?sc56Abmf/kbWrmfbIl1RyogiECeaqxgin2l7mmczKyuw2I+Sq9NpW3LbZ93U?=
 =?us-ascii?Q?hGhjNxosVmZErSxKmyw/SbOT3+FjkfjSNqgvO+se/OrrycJ83CH2rwlPRNBS?=
 =?us-ascii?Q?ottrAE82fqrTXA5bEtkzNa700VawuxTjpEJ6LGuyqy7hFmIR1dTyP0AKagze?=
 =?us-ascii?Q?Cpv/rGsBaPOLEmWRpp1qU72WpkeFRMLU15cbhLwfUE2KsDq+sNrVQfwxNXhc?=
 =?us-ascii?Q?dKyUhPq8ExKJte64DOLlwKJWRe5ROcKpv4GwJQqgEpfziBEYG3iA1yRkHWNJ?=
 =?us-ascii?Q?ao9OSHAkxAnZNCcmgGCda1hh0nvmYgBbXft6OJisZUwUebvtS5+xB0Kjlqzh?=
 =?us-ascii?Q?TceTgtlHLRhr06gfcWo6LCa0Y1JrxIjqyj196ffKK0ospxQEnc8oglRsSErW?=
 =?us-ascii?Q?eQOsena5fG5HFHxrhdgGmxVjUgGCBVrkqLfWPcGR2gEC4NBHzJNiSx/enU5J?=
 =?us-ascii?Q?1cBBsrDVTNEYPTyuMyBMFIGfXSWR9c7cSFNEbUZq6dbZetSaur83u/Zjr8m+?=
 =?us-ascii?Q?xscX2tF+/i1TrlHogvxVHfWqxUsK2NIsUeeeyGi3V6Pvdj/3tfdcRcqnsrdo?=
 =?us-ascii?Q?vtdIIEvTJvNEa//YVJWzPLvFwrJ2hddf0VGf8CQ77uaeH6rfAUolgHsuDSnO?=
 =?us-ascii?Q?AsQYgKPUcq9/q8w8RUmr5HVMZM6pDE3qFfzUkyr+RUdVCOnPzomMJcMOE7U/?=
 =?us-ascii?Q?fLD1NwkLH8Ia8Dsc1G1EK3BlWg3ASAw3MruqUSjRpf4IbPTXwkg9+W6b6zWY?=
 =?us-ascii?Q?ZwEDQJuGFwnDQ3EhKy9J93wuzZ14bGH42VVxToiRwIO3mTFffIwvPZWGu/QY?=
 =?us-ascii?Q?r4Ye3S53VAtgJVG49a93owscYWDbMHF1i99vIpr59blkTemIjO+Gg+Bgdp1f?=
 =?us-ascii?Q?76bh5jQpgv71FscWJM9ptOWUCbh/sMYXBNh70zdr9ItjKqdDpzni25TGHuS5?=
 =?us-ascii?Q?iC8WwvNBpYigDkm9waKPMthPjRIESifapz3KhhbgXjFkIurSptj3+3HItiBn?=
 =?us-ascii?Q?Jf8YgnULzfMGIjvSdUJi/9TglSuTAA3mXN1OxIHNsZHXqkRUHU5HyxRkFIQe?=
 =?us-ascii?Q?y8ldhGofzVCvnofFtoLzLn9tkpnVTV++yJsabgREjngWQTk8axpnEDGTp4fx?=
 =?us-ascii?Q?LIAcmcG0dQ82dPn6vdNsS0PgOCF1lvYQFMHUr6XrqNIzZgmBFoslD7EpWeCq?=
 =?us-ascii?Q?JVOZRBy2COO0rxYYDSku27yI+U4p?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YwQsmK/q3Mm2Mf8tnhacv2BAgk5XSoeEwQstW+GIs+R7rTTMRgV+Mqm/FSj1?=
 =?us-ascii?Q?34r8qlm4hqEqcJthsafR2s7R5p8ggOY5T2MobZ5UqVDNqfcOJA6Uw8nWrQnK?=
 =?us-ascii?Q?u3CTwnRmMkzSwyk7JC9iUgiOeldYUH/xuwqFR74balPnpab7d1I5HBDPZC1L?=
 =?us-ascii?Q?g6tqICw69zXsQ53Vp8LgDntdeAxxElwacOdgUFs0fg2KtmEOr6baXZ//0bIM?=
 =?us-ascii?Q?Tpmsw2bje/xtMTtbfGslmAiuYu2VtMLir8zK1PAQl+cvRD7xP7ubuH2U0ltq?=
 =?us-ascii?Q?dRHuijdTDOaj/duxAaqVpiAs2wBGwa2pmGCMnNzeGnpj4yqhETHE+Bbo/Ahj?=
 =?us-ascii?Q?iL+9BaBJFZU5BCEvra8W64uF2C5bt8u7//jGXxJ7pRryw9wlpdLpqiDtDiKy?=
 =?us-ascii?Q?rr8bKMEof3qGr/bJNqL5w6vQuz0WKiTpYC7QhmVNYGtQ3BmJIn57vc6yryqH?=
 =?us-ascii?Q?U9cjrOul8JDzYF60P8woJJWKiL/xSZhfPciIxRps+DE3Ql5CP7vLC+98dvwA?=
 =?us-ascii?Q?5nTf+gcCcPrt21LZ/4G7IhwvaofWjyhphBPCfDDoraRszZJv3H9DHYxaL3Y8?=
 =?us-ascii?Q?YrgnPJc5SoShFo6ypf4WAhT9ah17TL6cQ2E1wMV8Q579XNaykuEJeFDlCacZ?=
 =?us-ascii?Q?nkuTFMCuJ1xjXJAc0YWrzPICK6McX0ZNqJ5K0bDI45fLKojgqrJDAbmBksBN?=
 =?us-ascii?Q?cuZtMy75l0ubBN1S+XGlrFmN8Zs/jmb4XVKsrfDWhZyk7R+ZZVIiAA9+qTjM?=
 =?us-ascii?Q?PjqB0w/rOyW6/GAoY+IIQJeYnt/uTmTx0jOkzk5t6kdklK4WWYXGK2FO5mTG?=
 =?us-ascii?Q?fgrgtXAwHJvLjJgRX1KFbDG3XVL36zK2h5Fpjhrj0+0Ax9piT1PEawKkDfbP?=
 =?us-ascii?Q?Wd+1B1p35cuO+IZ+gl0Z9aEzgnW5nT6dfssXrDBfpI7juVS07pdRVNY9GpWR?=
 =?us-ascii?Q?kGFa7BkxaHbtuDQMZC3GZunuyHF1oqVlmkbBXfjUts0Qn04KTLUxNAJ1kTjO?=
 =?us-ascii?Q?L93wRsip4R9/m5fh0w6YQtzax2Xr74R4s8E6+YjB+lb8l+jEUmsPEIEIsBZx?=
 =?us-ascii?Q?cHR6ulaZvFkEAO7MTMSDZQJOymkjxm7Ilh0wDOV4haOC1yXwRewWBXHXTvvP?=
 =?us-ascii?Q?IAVuiz9wsglC5pFsdo8TVoo1tNuxIUJrj/w/9UJfGJUb38FiZ/NLePct+L9D?=
 =?us-ascii?Q?zeFr846JvcoRxkfYmooWCeNAd2pzVLXW71t9Xkpmgm39l03ifmAvagrZMEdV?=
 =?us-ascii?Q?EeVEsviLPGNy8wL0nwGbRP7t1JgWx60PaPcuQQ4zhozXd7R/FREpN8cgvL/C?=
 =?us-ascii?Q?ZtKp0oPXccMwUOrCj3XYUDCPsCgvm/rHRrHzPejL1n5XjxkIHhz9IgdRRWhy?=
 =?us-ascii?Q?jMVSgE/AsRQh+fXxP3JlJBV5sngX/R7NF0qK+8sXZzWH6p/3YG9rckbVFDCZ?=
 =?us-ascii?Q?+EByLHWVqh1syX18rr0wXf++TF3d08ikdb8GytvPlIpYvNuFMpiMlrw+LUB9?=
 =?us-ascii?Q?JNm722jAeu9h8mGZlf9HKp70M3RSqdGJsnUEOkeXbtzLleYW8FUaR26vJQus?=
 =?us-ascii?Q?AnnohBu3NdKzt9UmCn0iGjO+oToPIBFmuez5pRdJ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f94a543-58ff-4f7c-bf04-08dca17d1229
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 07:42:52.8841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MtJnhbMvGZVk/TNzrZDhdEEYQorXv85XhIuXjqHKupqOEKgRSvAlz9kW12gJEQiTc/woN90r03yKjVSXHus11g==
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

Backgroud
====
We are currently facing some challenges when loading the model file into DMA-BUF.
  1. Our camera application algorithm model has reached the 1GB level.
  2. Our AI application's 3B model has reached the 1GB level, and the 7B model
     has reached the 3GB level.
The above-mentioned internal applications all require reading the model files
into dma-buf for sharing between the CPU and DMA devices.

Consider the current pathway for loading model files into DMA-BUF:
  1. open dma-heap, get heap fd
  2. open file, get fd
  3. allocate dma-buf, get dma-buf fd
  4. mmap dma-buf fd, get vaddr
  5. read(file_fd, vaddr, file_size) into dma-buf pages
  6. share, attach, whatever you want

IMO, The above process involves two inefficient behaviors:
  1. we need to wait dma-buf allocate success, and then load file into.
  2. dma-buf load file need through page cache
As I mentioned above, we currently have scenarios where we need to load files
of gigabyte size into DMA-BUF.
That's mean:
  1. dma-buf also need to be GB size, so, if avaliable memory is not
     enough, we need enter slowpath and wait. If we use already allocated
     memory to load file, it can save time by using a parallel approach.
  2. GB is too heavy, the page cache is useless for boost file load.(it will
     be recycled quickly.) And we need double copy to load it into dma-buf.
     a) load file into page cache
     b) memcpy from page cache to dma-buf

DMA_HEAP_IOCTL_ALLOC_AND_READ
===
This patchset implements a new ioctl, DMA_HEAP_IOCTL_ALLOC_AND_READ, which can
be used to allocate and read a file into a dma-buf in a single operation.
This ioctl is similar to DMA_HEAP_IOCTL_ALLOC, but it also reads the file into
the dma-buf.

Different from DMA_HEAP_IOCTL_ALLOC, the user does not need to pass the size
of the dma-buf, but rather the file descriptor of the opened file.
User also can offer a `batch`, so if memory allocated reach to it, trigger IO,
default is 128MB.

Both buffered I/O and direct I/O(O_DIRECT) can be accepted, but if file size reach
to GB, I will warn you if you use buffered I/O.

In kernel space, heap_fwork_t kthread used to comsume all produced file read work,
this is single thread for read.(Due to heavy size read, multi-thread may helpless).


Reference
===
Currently, we have many patches that aim to make dma-buf support direct I/O in
userspace.

Recently liu's work:
https://lore.kernel.org/all/20240710140948.25870-1-liulei.rjpt@vivo.com/

However, this patch is not focused on enabling dma-buf to perform direct I/O in
userspace. The main goal is to ensure that dma-buf completes the file memory
loading when the allocation is completed. Buffered I/O and direct I/O are both
methods to end file read.


Performance
===
Here a some self-test result:

dd a 3GB file for test, 12G RAM phone, UFS4.0, no memory pressure.
MemTotal:       11583824 kB
MemFree:         2307972 kB
MemAvailable:    7287640 kB

Notice, mtk_mm-uncached is our phone heap, you can use system_heap or other to
test.(need suit DMA_HEAP_IOCTL_ALLOC_AND_READ)

1. original
```shel
# create a model file
dd if=/dev/zero of=./model.txt bs=1M count=3072
# drop page cache
echo 3 > /proc/sys/vm/drop_caches
./dmabuf-heap-file-read mtk_mm-uncached normal
> result is total cost 2370513769ns
```

2.DMA_HEAP_IOCTL_ALLOC_AND_READ O_DIRECT
```shel
# create a model file
dd if=/dev/zero of=./model.txt bs=1M count=3072
# drop page cache
echo 3 > /proc/sys/vm/drop_caches
./dmabuf-heap-file-read mtk_mm-uncached direct_io
> result is total cost 1269239770ns
# use direct_io_check can check the content if is same to file.
```

3. DMA_HEAP_IOCTL_ALLOC_AND_READ BUFFER I/O
```shel
# create a model file
dd if=/dev/zero of=./model.txt bs=1M count=3072
# drop page cache
echo 3 > /proc/sys/vm/drop_caches
./dmabuf-heap-file-read mtk_mm-uncached normal_io
> result is total cost 2268621769ns
```

------------------
dd a 3GB file for test, 12G RAM phone, UFS4.0, stressapptest 4G memory pressure.

1. original
```shel
# create a model file
dd if=/dev/zero of=./model.txt bs=1M count=3072
# drop page cache
echo 3 > /proc/sys/vm/drop_caches
./dmabuf-heap-file-read mtk_mm-uncached normal
> result is total cost 13087213847ns
```

2.DMA_HEAP_IOCTL_ALLOC_AND_READ O_DIRECT
```shel
# create a model file
dd if=/dev/zero of=./model.txt bs=1M count=3072
# drop page cache
echo 3 > /proc/sys/vm/drop_caches
./dmabuf-heap-file-read mtk_mm-uncached direct_io
> result is total cost 2902386846ns
# use direct_io_check can check the content if is same to file.
```

3. DMA_HEAP_IOCTL_ALLOC_AND_READ BUFFER I/O
```shel
# create a model file
dd if=/dev/zero of=./model.txt bs=1M count=3072
# drop page cache
echo 3 > /proc/sys/vm/drop_caches
./dmabuf-heap-file-read mtk_mm-uncached normal_io
> result is total cost 5735579385ns
```



Can see, use O_DIRECT can improve 50% performance. Even buffered I/O, also can
improve a little.
If given memory pressure, the performance gap will become more significant.

Here are the test file which you can build by self.
```c
#include <dirent.h>
#include <errno.h>
#include <fcntl.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <time.h>
#include <unistd.h>

#include <linux/dma-buf.h>
#include <linux/dma-heap.h>
#include <dirent.h>

#define HEAP_DEVPATH "/dev/dma_heap"

#define TEST_FILE "./model.txt"


enum {
    NORMAL_DMABUF_TEST,
    NORMAL_IO_DMABUF_TEST,
    DIRECT_IO_DMABUF_TEST,
    DIRECT_IO_DMABUF_CHECK_TEST,
};

#define assert(as)                             \
	if (!(as)) {                           \
		printf("%s is failed\n", #as); \
		exit(-1);                      \
	}

int dmabuf_heap_open(char* name) {
    int ret, fd;
    char buf[256];

    ret = sprintf(buf, "%s/%s", HEAP_DEVPATH, name);
    if (ret < 0) {
        printf("sprintf failed!\n");
        return ret;
    }

    fd = open(buf, O_RDWR);
    if (fd < 0) printf("open %s failed!\n", buf);
    return fd;
}

int dmabuf_heap_alloc_read_file(int heap_fd, int file_fd, unsigned int flags,
int* dmabuf_fd) {
    struct dma_heap_allocation_file_data data = {
            .file_fd = file_fd,
            .fd_flags = O_RDWR | O_CLOEXEC,
            .heap_flags = flags,
    };
    int ret;

    if (dmabuf_fd == NULL) return -EINVAL;

    ret = ioctl(heap_fd, DMA_HEAP_IOCTL_ALLOC_AND_READ, &data);
    if (ret < 0) return ret;
    *dmabuf_fd = (int)data.fd;
    return ret;
}


int dmabuf_heap_alloc(int fd, size_t len, unsigned int flags, int* dmabuf_fd) {
    struct dma_heap_allocation_data data = {
            .len = len,
            .fd_flags = O_RDWR | O_CLOEXEC,
            .heap_flags = flags,
    };
    int ret;

    if (dmabuf_fd == NULL) return -EINVAL;

    ret = ioctl(fd, DMA_HEAP_IOCTL_ALLOC, &data);
    if (ret < 0) return ret;
    *dmabuf_fd = (int)data.fd;
    return ret;
}

void dmabuf_heap_test(int type, char *heap_name) {
    int heapfd = dmabuf_heap_open(heap_name);
    assert(heapfd > 0);

    if (type == NORMAL_DMABUF_TEST) {
        int file_fd = open(TEST_FILE, O_RDONLY);
        unsigned long fsize;
        int dma_buf_fd;
        struct stat ftat;
        fstat(file_fd, &ftat);
        fsize = ftat.st_size;

        dmabuf_heap_alloc(heapfd, fsize, 0, &dma_buf_fd);
        assert(dma_buf_fd > 0);

        void *file_addr = mmap(NULL, fsize, PROT_READ, MAP_SHARED, file_fd, 0);
        assert(file_addr != MAP_FAILED);
        void *dma_buf_addr = mmap(NULL, fsize, PROT_WRITE, MAP_SHARED,
dma_buf_fd, 0);
        assert(dma_buf_addr != MAP_FAILED);

        memcpy(dma_buf_addr, file_addr, fsize);

        munmap(file_addr, fsize);
        munmap(dma_buf_addr, fsize);
        close(file_fd);
        close(dma_buf_fd);
    } else {
        int file_fd;
        if (type == NORMAL_IO_DMABUF_TEST)
            file_fd = open(TEST_FILE, O_RDONLY);
        else
        	file_fd = open(TEST_FILE, O_RDONLY | O_DIRECT);
        int dma_buf_fd;

        dmabuf_heap_alloc_read_file(heapfd, file_fd, 0, &dma_buf_fd);
        assert(dma_buf_fd > 0);

        if (type == DIRECT_IO_DMABUF_CHECK_TEST) {
            struct stat ftat;
            fstat(file_fd, &ftat);
            unsigned long size = ftat.st_size;

            char *dmabuf_addr = (char *)mmap(NULL, size, PROT_READ,
                    MAP_SHARED, dma_buf_fd, 0);
            assert(dmabuf_addr != NULL);
            char *file_addr = (char *)mmap(NULL, size, PROT_READ, MAP_SHARED,
file_fd, 0);
            assert(file_addr != NULL);

            unsigned long i = 0;
            for (; i < size; i += 4096) {
                if (memcmp(&dmabuf_addr[i], &file_addr[i], 4096) != 0)
                    printf("cur %lu comp size %d\n", i, size);
                assert (memcmp(&dmabuf_addr[i], &file_addr[i], 4096) == 0);
            }
            munmap(dmabuf_addr, size);
            munmap(file_addr, size);
        }
        close(file_fd);
        close(dma_buf_fd);
    }
    close(heapfd);
}

int main(int argc, char* argv[]) {
    char* dmabuf_heap_name;
    char* type_name;
    int type;
    struct timespec ts_start, ts_end;
	long long start, end;
    if (argc < 3) {
        printf("input heap name, copy or trans or normal\n");
    }

    dmabuf_heap_name = argv[1];
    type_name = argv[2];

    if (strcmp(type_name, "normal") == 0)
        type = NORMAL_DMABUF_TEST;
    else if (strcmp(type_name, "direct_io") == 0)
        type = DIRECT_IO_DMABUF_TEST;
    else if (strcmp(type_name, "direct_io_check") == 0)
        type = DIRECT_IO_DMABUF_CHECK_TEST;
    else if (strcmp(type_name, "normal_io") == 0)
        type = NORMAL_IO_DMABUF_TEST;
    else
        exit(-1);

    printf("Testing dmabuf %s", dmabuf_heap_name);

    printf("\n---------------------------------------------\n");
    clock_gettime(CLOCK_MONOTONIC, &ts_start);
    dmabuf_heap_test(type, dmabuf_heap_name);
    clock_gettime(CLOCK_MONOTONIC, &ts_end);
	start = ts_start.tv_sec * 1000000000 + ts_start.tv_nsec;
	end = ts_end.tv_sec * 1000000000 + ts_end.tv_nsec;

    printf("total cost %lldns\n", end - start);

    return 0;
}
```

Huan Yang (2):
  dma-buf: heaps: DMA_HEAP_IOCTL_ALLOC_READ_FILE framework
  dma-buf: heaps: system_heap support DMA_HEAP_IOCTL_ALLOC_AND_READ

 drivers/dma-buf/dma-heap.c          | 525 +++++++++++++++++++++++++++-
 drivers/dma-buf/heaps/system_heap.c |  53 ++-
 include/linux/dma-heap.h            |  57 ++-
 include/uapi/linux/dma-heap.h       |  32 ++
 4 files changed, 660 insertions(+), 7 deletions(-)


base-commit: 523b23f0bee3014a7a752c9bb9f5c54f0eddae88
--
2.45.2

