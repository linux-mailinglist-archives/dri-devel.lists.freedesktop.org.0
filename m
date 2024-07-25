Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C531893BA8E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 04:14:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F28010E12B;
	Thu, 25 Jul 2024 02:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="Te5BZbJf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2063.outbound.protection.outlook.com [40.107.255.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1735710E12B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 02:14:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r/JwbUDGPG7WJuD2GiQ/VroT5tjLanw2d+4JdUeme0bG1ljyf7eOTpcm+iPFswwG4Q5Xd5FoVTRRQLsrJ+LgEKBrnHbCkl3bjQZvQ8wkDiOIBrf5nFp2hhg6mhhqNS4XhkRaf4davaapVkeFWIJ2JSw9kBPx2YhiY10yUrX7oF7TsUnGo9+jwYYrK1hwU9sJvNDZnnlq/6GNuVJn2r9RiNK49G4s7lCbTF2puAhl0CTx5tbM+HiJizjDOY43M/iPi+1Nf8kOavp5EBS0jjk0cTufKXb6O/kPUL62+f9TIIKM+ZnC1x4EhQiYq4Cyvb+JullXmLAZYY8+AV0IHK2SMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WU8I3XPlulrftvQutKfwAcNZnYGqc/K0uhAMsDyn3cM=;
 b=B10V5C8MIcCHrmQT/W2WwlEwmCJVdAemZOOR//Ifubvvz5DZ+Z8s+52Agbwux9o3wwUqxl3DB/hhXZT4hxjSpuK5Z/U5ddbbqMZKcUuMbKv0EQm4Xza76UbsgXWN7Ie+eSqA+lL+d8azh4dRbGEb8O8bjQFc0vIPS3Fqj3TMUUptbG83fX9oCALnKoCz/OTOFRkzIkg97CgHfxS9d6NXGJZNT1o7+oMOWGJmHKL9a6OfM7/1NWdk7PgdqwZ7K+D1Zbphj+0DmzXahn4Ev64LmISSDkbaraDACgjqbzRvXp+YeZ4FcCFrJCa5106FpBllpmL5l4F/s070ptJ269UiUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WU8I3XPlulrftvQutKfwAcNZnYGqc/K0uhAMsDyn3cM=;
 b=Te5BZbJfAWDS4/3VnZoodMDhaVkjbWYuNgbA5UAOZdXWH6lZ2qqFSUAN1i3wYQvvPERXRGwOyB2xANULkQZXlAzarto2R41teJILwb4+5c1Zo87847WYl1rxj0Zygd8yYquUA7OTxpqfe3icakDd2ZouYWWXi6VlfTfyurP6V4/6jysNX8FOiII3UC8JJQ00eTdAjEFhk8I/a/fleW8gXIeBv40pC+rZ3hzjbv1XXGpucwOplJdvh2DK7GO8SdEXlDd88UkH9AJJsM0ra5FzgsGvkwgCIIxtHq0aguOyz9bq7UArmaQt62ZoVjIzNuCt0mFes9SdLbN3KP01hv9xCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by PUZPR06MB6104.apcprd06.prod.outlook.com (2603:1096:301:118::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Thu, 25 Jul
 2024 02:14:16 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7762.027; Thu, 25 Jul 2024
 02:14:15 +0000
From: Huan Yang <link@vivo.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v2] udmabuf: array alloc use kvmalloc
Date: Thu, 25 Jul 2024 10:13:49 +0800
Message-ID: <20240725021349.580574-1-link@vivo.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0010.APCP153.PROD.OUTLOOK.COM (2603:1096::20) To
 PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|PUZPR06MB6104:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eefeb49-4e5a-49b5-13cf-08dcac4f7b75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lz+4VP+vjfLhFT7QSkT1UByM8c2ZUi0uaiRUFt+7WYdavBNoaiqeQ9wt25cI?=
 =?us-ascii?Q?G91DLg0BF4/PkWEfwi+/DEb/YdbU5OCK9NQZi4xO0ZXcRlCproTFHWrG7fzp?=
 =?us-ascii?Q?ZwUdQPM9s8uXKbA02K52ny2BMAVuGiuL4sw/E/6I39PfWq5xAXVwHm74IkV/?=
 =?us-ascii?Q?8nodUSh58yN0ZBjLufrEbLZLwmum9uL2QLxf+sAMVvEUGa2qKmInelCoPtpB?=
 =?us-ascii?Q?1zMzlD9WlEXoWwDgrGwVvQ8pOdXtW805mp6byYgCAZktX0wWQ46Z1jT4u8s/?=
 =?us-ascii?Q?BIjMlo3uFAwp342anM9k5x0ObehwOMcjtgSOlZGeQ2LNT7dUMBXFdWLKSz48?=
 =?us-ascii?Q?4ITMBagzkJJw1obL/Wz3Dq/xO6vDI5an6zRHXT/XEccTjudru7XeIdBfx//D?=
 =?us-ascii?Q?UkE9mgRYza/VXAXS/Y5ytDBY08DxPjn6IKCds+XXQeligK1O/uNri3OWAQdA?=
 =?us-ascii?Q?ceOSC36dXovQB/bwNEGCJ5VMSyClJcH3E3F5gjfwnPjIFB39al4ZQTi8+tqh?=
 =?us-ascii?Q?othJCIUXdjCvIwl3LFNZZGskw2YSQmye+m7x0PZ6Ws1CW2F7XruY3oj49o2A?=
 =?us-ascii?Q?3Aqz4+Xler+Hai4pJqaJFz8hOmjVUu6n9kYm3FFlhSfbs7HJeSHezpxKkGjM?=
 =?us-ascii?Q?p/6Rf6PeW5mpVPtgMd8DeX1J32lvD9L1GjrfrP1Wcv4o2Kxq1tNwPV5z/ljX?=
 =?us-ascii?Q?W8EeH2LHl+gpipZck7BG6rVjchty4Y3JMqBZjdmQsCMLjSt/kt79Shr3sUtH?=
 =?us-ascii?Q?1zJ/iEwpfgt1PQ4IGZ5GyrwjWJORHolYJeuk1HbgfLzyA5G5Or4i7aTZf6Es?=
 =?us-ascii?Q?lEwkdm+fugLNecmXAywZsNxt8fNpWIr17U/9ncveLEFAGNmN7GrWMOsduUK7?=
 =?us-ascii?Q?7lo01ZSyB/C96MvSDQA3b8cbXdGN3Jep1mZYooNBaZmZyMcJwNOMnwe8jQuA?=
 =?us-ascii?Q?NvUpEjhBpjG3F7iwNDAaowJC1fx03DdJGi5qdmkpoRchacbBcSyZJ24/fk1w?=
 =?us-ascii?Q?7le/xshhU3Ompxami9FvY0Q0EVBIPpyKClReato8fqZhL62H8BYFLk5yzAUR?=
 =?us-ascii?Q?AHTUWB5thYpO8POJZYmm72s8ZCKFH6Yi8XMmCsAQiVGqfrygA1fZj5Q53G8h?=
 =?us-ascii?Q?oV0C6Blwjabg4TfTBGxM4rfY8aAy5SSAmp2H/Y9q1N0+ftddT+82odUP5+D7?=
 =?us-ascii?Q?MTz3x7CXOPQEIv9jBJF3Ye5rf42dUs+f2znX3DXMWt4iEdHgLsQFxGxjZZRJ?=
 =?us-ascii?Q?oz2OFmRBPhUH2oBWnAFvjNJW0AAU6lBQpZkYu7XinZId04e38iJjag39q4tE?=
 =?us-ascii?Q?JFCNloED1ZTVH9Q4E0H36OSsfIUXaJIShSkxWcpuzhYK6yAo6Ln711Xp/05Z?=
 =?us-ascii?Q?uXtBgk2dhfPrfZSP0DWxySHr2X7o4pnr+KBLYg6hkGDTXA6ydg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QiwM6FdxAe6bmaBarMRQp+gIepU9oiC8EMz4O3ILQ0e0cO2UF1smCTLZMuWJ?=
 =?us-ascii?Q?oSHNxzIcG1pcJONnKdJD+doJK5t4FKYm6Vh2L6+nA0rVXBAU1XXsVCGH2Yqh?=
 =?us-ascii?Q?5z/DkcnaQfUBHfY7t7lobflKbNyhBiOI3nMnsljz5dZazduSgtBs55yRFcf+?=
 =?us-ascii?Q?b0G3D+tDJNO6ziSGmlmJR3MWm89xM2f8UkQ4xcT/1FZzeEp2OYi1SqMuLQtl?=
 =?us-ascii?Q?N9DVIm0A9a7UhoKt+P2uR1JZWQUcKrFocX05OKTSe3wHOGCchbAhJsIeomhF?=
 =?us-ascii?Q?Jl1VmM5E0Pk35NSGcWiZmT3OD4O7GY0GnBELed8qcDzE7tlyb5Ji+PsDmKeZ?=
 =?us-ascii?Q?kDaJo8eRlqv1H5k89pdme2kJS7NuxKnkNtHcOOEKOg6o8MgMf7OWNufaOUV1?=
 =?us-ascii?Q?tcFltK+jpcUJFTceJM8kxo2CjBwH3b3+W1a67Ru+Ia/WOjv7XcWi1ZtmoFX5?=
 =?us-ascii?Q?zwScCsGaSwe8vae/197EKwPYE+a/jnto3iuXs2T2sPBWiftw8PrY9NexNx58?=
 =?us-ascii?Q?LWnoZVNH6qDw4LgIJAUUPhSM4DEHFK6iYAZd2gZgeAwOtpo/hWiqfKZQFffK?=
 =?us-ascii?Q?lUHxXV7w0j4FN6Ze5sWJpNngLrh59NwHZV7SDn5FdUH2+fPO2bOXP56f4Yoi?=
 =?us-ascii?Q?+AnwcJvxXPt9wqUkYpx2NvH/ICPlQUw9yGTEdeNNpaIsuvmCWqf4q6rDh0Lz?=
 =?us-ascii?Q?yS/AVp5p0NySusLDoAb1cn583krJk1itvpJbvsjoLwlsfkwVDsVuuWorRqYV?=
 =?us-ascii?Q?PeTENb9Zsk3G40IuioQl1TTPk2CreVi4l1v6VcKsGG6d+CYDEpgkZxkiRQnZ?=
 =?us-ascii?Q?q2pmAtv/2kWNPnkzT+fRj5+/Ev/rFivbR5a54KK1iENZE4XmiegIoh8RGa04?=
 =?us-ascii?Q?SlyqKf7UpIa8nByiHRhG4pz5ocQ/eYN1+hAcwf2KBvwXQgl2anAEmF89LYIW?=
 =?us-ascii?Q?0Iyo5DvAtKLRJIUErB/ReXnsPhBC2jrjMOzY5uzzvkAY9/5PZvXyfBVp0Ylm?=
 =?us-ascii?Q?jHWfUE0OsaItF24Xax5SLdmBBbwN4Q6C336eYo9NZmfAt4Ydvpp8OI09aQcc?=
 =?us-ascii?Q?FnwScVoVFIw9dh4jWSI0LjaoVTGGMiUq2cxXmOH0Y9eDer+F0ZwauErI80LT?=
 =?us-ascii?Q?r/RuF/3jAEPW+lctEBd917SiMD1Z7E9qakeePiouFqjFSLGxLeKjlIC2H6ON?=
 =?us-ascii?Q?4888FW4/njQv6/D6NRaEExWYneiujrwyngU0BdgmVNsLm9yoLmHGyBVuuBIp?=
 =?us-ascii?Q?jJa486iUKVjZXq1K4LRaGXk28LhtXMD5DCVyQCHLWEOtvwXeQybzw6b0xhzW?=
 =?us-ascii?Q?Lh+Wmrdo425wuDgHrhl5wHyPVRXF4jnMk+Lv/94lpUZN2JHVFdzZYWjaooTQ?=
 =?us-ascii?Q?5d0eFDNjGodKlaHKJ56UCdz3dhI/LWG8OcCHn9rPbS3BmKGeV/2l23IXwg1Z?=
 =?us-ascii?Q?BIfUk8BW+Axtb1UB/jAZW8B5I23N4/D7oE1+W70SD9Qk68VnCnPLpynM4/Qn?=
 =?us-ascii?Q?0KOOpdcDffxz50T13bppPjVaPKgBvnSoCEvblHCsTG4gaaUZl84iu+80UBK/?=
 =?us-ascii?Q?n2PPnMsTVGu6seEnLzsRZrD9lH2ZvV27SPIddpTE?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eefeb49-4e5a-49b5-13cf-08dcac4f7b75
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 02:14:15.5424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cvB0z9hZdqyt68OG2JgPuiYYr/gvUN999fja1rjQyReQk0pJgeMCI0T5FxIrJHuftlbUSxIW7TfoenmlqCvOoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6104
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

When PAGE_SIZE 4096, MAX_PAGE_ORDER 10, 64bit machine,
page_alloc only support 4MB.
If above this, trigger this warn and return NULL.

udmabuf can change size limit, if change it to 3072(3GB), and then alloc
3GB udmabuf, will fail create.

[ 4080.876581] ------------[ cut here ]------------
[ 4080.876843] WARNING: CPU: 3 PID: 2015 at mm/page_alloc.c:4556 __alloc_pages+0x2c8/0x350
[ 4080.878839] RIP: 0010:__alloc_pages+0x2c8/0x350
[ 4080.879470] Call Trace:
[ 4080.879473]  <TASK>
[ 4080.879473]  ? __alloc_pages+0x2c8/0x350
[ 4080.879475]  ? __warn.cold+0x8e/0xe8
[ 4080.880647]  ? __alloc_pages+0x2c8/0x350
[ 4080.880909]  ? report_bug+0xff/0x140
[ 4080.881175]  ? handle_bug+0x3c/0x80
[ 4080.881556]  ? exc_invalid_op+0x17/0x70
[ 4080.881559]  ? asm_exc_invalid_op+0x1a/0x20
[ 4080.882077]  ? udmabuf_create+0x131/0x400

Because MAX_PAGE_ORDER, kmalloc can max alloc 4096 * (1 << 10), 4MB
memory, each array entry is pointer(8byte), so can save 524288 pages(2GB).

Further more, costly order(order 3) may not be guaranteed that it can be
applied for, due to fragmentation.

This patch change udmabuf array use kvmalloc_array, this can fallback
alloc into vmalloc, which can guarantee allocation for any size and does
not affect the performance of kmalloc allocations.

Signed-off-by: Huan Yang <link@vivo.com>
---
Changelog:
 v2 -> v1: rebase, change offset and mempin folio array use kvmalloc,
change description.

 drivers/dma-buf/udmabuf.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 047c3cd2ceff..7addb1720bc3 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -80,7 +80,7 @@ static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 
 	dma_resv_assert_held(buf->resv);
 
-	pages = kmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
+	pages = kvmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
 	if (!pages)
 		return -ENOMEM;
 
@@ -88,7 +88,7 @@ static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 		pages[pg] = &ubuf->folios[pg]->page;
 
 	vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
-	kfree(pages);
+	kvfree(pages);
 	if (!vaddr)
 		return -EINVAL;
 
@@ -196,8 +196,8 @@ static void release_udmabuf(struct dma_buf *buf)
 		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
 
 	unpin_all_folios(&ubuf->unpin_list);
-	kfree(ubuf->offsets);
-	kfree(ubuf->folios);
+	kvfree(ubuf->offsets);
+	kvfree(ubuf->folios);
 	kfree(ubuf);
 }
 
@@ -322,13 +322,13 @@ static long udmabuf_create(struct miscdevice *device,
 	if (!ubuf->pagecount)
 		goto err;
 
-	ubuf->folios = kmalloc_array(ubuf->pagecount, sizeof(*ubuf->folios),
+	ubuf->folios = kvmalloc_array(ubuf->pagecount, sizeof(*ubuf->folios),
 				    GFP_KERNEL);
 	if (!ubuf->folios) {
 		ret = -ENOMEM;
 		goto err;
 	}
-	ubuf->offsets = kcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
+	ubuf->offsets = kvcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
 				GFP_KERNEL);
 	if (!ubuf->offsets) {
 		ret = -ENOMEM;
@@ -343,7 +343,7 @@ static long udmabuf_create(struct miscdevice *device,
 			goto err;
 
 		pgcnt = list[i].size >> PAGE_SHIFT;
-		folios = kmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
+		folios = kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
 		if (!folios) {
 			ret = -ENOMEM;
 			goto err;
@@ -353,7 +353,7 @@ static long udmabuf_create(struct miscdevice *device,
 		ret = memfd_pin_folios(memfd, list[i].offset, end,
 				       folios, pgcnt, &pgoff);
 		if (ret <= 0) {
-			kfree(folios);
+			kvfree(folios);
 			if (!ret)
 				ret = -EINVAL;
 			goto err;
@@ -369,7 +369,7 @@ static long udmabuf_create(struct miscdevice *device,
 				ret = add_to_unpin_list(&ubuf->unpin_list,
 							folios[k]);
 				if (ret < 0) {
-					kfree(folios);
+					kvfree(folios);
 					goto err;
 				}
 			}
@@ -382,7 +382,7 @@ static long udmabuf_create(struct miscdevice *device,
 			}
 		}
 
-		kfree(folios);
+		kvfree(folios);
 		fput(memfd);
 		memfd = NULL;
 	}
@@ -398,8 +398,8 @@ static long udmabuf_create(struct miscdevice *device,
 	if (memfd)
 		fput(memfd);
 	unpin_all_folios(&ubuf->unpin_list);
-	kfree(ubuf->offsets);
-	kfree(ubuf->folios);
+	kvfree(ubuf->offsets);
+	kvfree(ubuf->folios);
 	kfree(ubuf);
 	return ret;
 }

base-commit: 2347b4c79f5e6cd3f4996e80c2d3c15f53006bf5
-- 
2.45.2

