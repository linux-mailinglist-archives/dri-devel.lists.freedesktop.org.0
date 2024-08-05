Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EE99473D2
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 05:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACAE10E112;
	Mon,  5 Aug 2024 03:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="Ug+sMb+B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2045.outbound.protection.outlook.com [40.107.215.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35ED710E111
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 03:26:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kT2LGoI83+6lvunhp7+zi2bcNBVzAtAEDmY7OaKObmlXaTrNsPH5KigLNrUWQEPX11inSQR1sr3BIg7THt/LbWlXgS1C+2ge19A6ve8okvEUtyUf+BFccjSIz/q8qx/TWQ0V9jlDdMMHVUG4ejgAgs4vUZmqLT/acx6PKuqN0/ut0+wKZiUuUBtDEJVk8bTcL5e7eP1EHXobGA0LCRvPEMJmM06cfIJOR0k5PdlaEGGrP9SWLseEcYZYVEWYFcJ2qmPm+qUbkrly5IlTMq2UkgOlzj9jADXgXBdlH5EHxUzPT3gJn6wCrXC7+pz2IuwZq7atwEVz/Mm94XTgITvK+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2cWvy/CqupHCFSbbHPQVyjQiZ/HSwtMGli/YgYqm7Y=;
 b=UkZ8xZDWvCHl0ThDc0Kb1PmR63pjK0MuoYy0KEVw4XQS3xdYS2BWvvH0J99pzVGxQ9hVPeeT7JHGGehLUOgls/iQmKYTkby5RZRKW5jXB/m08yDqp/BLHLOt01CUtrbW48MwQI02EFnHMfWAMIFQsFaowHIDQVZFQWm2ulxX5oh1d/NjPJNW8C8WfMuC1Jqh6hL+Z5RUj4NtuvhU8ekmd5vsbhJ8AUX7A4g69GsZpJlCgaNB32lMjpyLuLAsqy4CLabvxghrhmD/s/Kwhbf86qfELUg5KZiWKxD+B7ooRuUmPQ1cA3xu1ys0JB6rs7WLczkKKh5gHr2IQg4DyhVzRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2cWvy/CqupHCFSbbHPQVyjQiZ/HSwtMGli/YgYqm7Y=;
 b=Ug+sMb+B+7Lmfztjj+ECy0+TS/MYpV+BQu3k+iv4CDQLjW1m21EnJ+8LaLJ0jS3CGzBK+VGrvIm5ROG/DsC6ntaaHpvUMQuhBDuw2I76ft98BvzxI2I4hifEcJyacAu5SKmXlEwtN65l+i6vItkd1lM29fyEicu43peAlLCbM3eoQJQdIvWEp99Wd+2SFHlavxnJrzDGYTEly9anfYRzHaLeznPqKyxjRrbu0fFAdjw6HPiwSzm46A4IqkjC07sAqv3yzFrcctUzAiyx2zQhP/GiZMREGebOQzGWRr3GXt3cpD5ZsHbR6U+Cj84P5QPBzJBlI4KcFAj94Qfa1HcX5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by KL1PR06MB6988.apcprd06.prod.outlook.com (2603:1096:820:11b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 03:26:13 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%4]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 03:26:12 +0000
From: Huan Yang <link@vivo.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v2 3/4] fix vmap_udmabuf error page set
Date: Mon,  5 Aug 2024 11:25:45 +0800
Message-ID: <20240805032550.3912454-4-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240805032550.3912454-1-link@vivo.com>
References: <20240805032550.3912454-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0025.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::12) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|KL1PR06MB6988:EE_
X-MS-Office365-Filtering-Correlation-Id: 970a2b40-6021-4f64-d6fd-08dcb4fe5b2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dOKilgeqrm+Xo6eNryomT3SOd8pLGkglP22yrUILkQYiosX4/Pftf+jT7wRY?=
 =?us-ascii?Q?GtkPvz4u9hVfDaKAvxBCuvL85K5VUtlHnXK4UrBfbrzb0s9IwqJuV1KxZfnv?=
 =?us-ascii?Q?q9K8w4nQw1ZkS5wCecfUYKEaU3lqtKEfDvwgvs2xQrhwnhcgZOf8iNnVvcey?=
 =?us-ascii?Q?BfTrLgu9rf7xuwV412jZzO8yZq6lROv82pFLBfdl+wTEQ2UBdtOvPk7VAris?=
 =?us-ascii?Q?Fr2KEGw7L75C99yZ9vxFg6I+YqMixBeV5pXtyRKJ7CUgWyaZxFPRacdoAKrb?=
 =?us-ascii?Q?WtAqhvpANbC2XTJa6KdcXQlvP+6waCKXYvfPmaXdbNcMpbz14IweH2H970iC?=
 =?us-ascii?Q?3UkoEGa/4RMpoTvBAiQTAU0itvSks4eqdecyr4xa4wDguwVYQivVstDiPX6s?=
 =?us-ascii?Q?3QxHzumjHtgSYq/DWN27ufRwwzBXDh4mVxAML15drOBpUS/ND63QC5y7khZN?=
 =?us-ascii?Q?yHfcgPyjW+3llMuxZbZ5Maw/KztN4GSPbhChsKc1XUb6092/rr3b/niQmOMY?=
 =?us-ascii?Q?ua++TejKlLWDyNi0xl9uEgL14YhKC78tUcSNAHfNwsGMLrb2DQUkbq9NsCo1?=
 =?us-ascii?Q?61/e1eRzky/73Y2Ok+0rnTQ2eiMrU+tBCEuu7oD+1Ypxl93e3m8OukbV50uX?=
 =?us-ascii?Q?dvkNCqFHGbmgzOxVTLKlBLrFOi+fYh8G5as+9qfCEcblPpYBPras5QJAb6tZ?=
 =?us-ascii?Q?YyNvoensA+XbLz4pqFGLRjYXYvxooc3FD13pSRred084h5AhLs4mHdvFEnL6?=
 =?us-ascii?Q?kfx966XLPZ/7IY2v6+BbI1PcE1Ld3XxMqjwX/f1xfmAEd7/z+vZKctzpumuZ?=
 =?us-ascii?Q?rG37Y5vNzGmkxGqtIc+olWdRE+j2oCwMDQZcyoaFEWHeI0fO/WAXnX+9pb6a?=
 =?us-ascii?Q?/5ylixViUYp38wq2DgihVBF0iyBGF1616s7/LYVIPBAk87FqLBzPHW4Zobqx?=
 =?us-ascii?Q?XtcLdIjoobBZX48K+N1l8iPStaSEWjVFwyiiE0RsPN44OocLroanAsrNmpRg?=
 =?us-ascii?Q?0B9jnu2aRbKBoqyYeX8TzyPFUnLbO/FFds71+cAikZYOUNzVcct3Cen3TIZh?=
 =?us-ascii?Q?46eow+03lXBB07WeojTM+cJ6NpTQzNFxkkzH5XRzSvggZe7GabHe1vHWT0HJ?=
 =?us-ascii?Q?Cf/FmdaunIueBfTFHCSDsqMtQAl301edAk6JHN/bo4wXzwdd2Y9Ui6t8ifS0?=
 =?us-ascii?Q?kPoU6wgOi5yGkD1+K4SUQyaddyME5gKp1Q/t0c8HcWz6Z2puZ1Ba9tYGkURt?=
 =?us-ascii?Q?JRzCKFC2Y51Ul3k9m81kTrKz6JXJtQpEallyXwmzqQc8JDs3q20C8MRbSLKW?=
 =?us-ascii?Q?r83LbPZ5tW4zZiKovQFtTW1M9mKDShiTTwrvssxHkffsz8Tx12j/EkA/qvpJ?=
 =?us-ascii?Q?zYFpqsOyVbmpQo4myqe5WNhk3UX/f4aHlYoeQpDguCmXlbxu8g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YpD+DXiKUU/CYrWyAUjbeRAJemPXzED3aS/qfLQXAGUDlaayDIggT8KiKaVc?=
 =?us-ascii?Q?DYL/nbRn872Y/a4Kw31mxl6gsqX/u4W3uaomZSHZ+u6A0lu7v3yxwFUdts6H?=
 =?us-ascii?Q?BPVzk56WmdAiKElF4yV2TGFZ/WfDi6a79fBvieUlkg1KMNNsYuMrgntJuae9?=
 =?us-ascii?Q?XCbqiVcCQ/aePOxLj0aFMga8oyi0WCf3f3/f6yyPFdhxwYSaEyQgfAPy+nkw?=
 =?us-ascii?Q?iY+bp7zMdJMxD2xFDUNTCFE57S662lePAqI5dlzb64MahC2mojwIFtYEimrv?=
 =?us-ascii?Q?acAcIctzenkz5DiVvoptSBF0QCg0MXyygxLR2kkE7Om4p8CqIsTYbkLHdq3Z?=
 =?us-ascii?Q?xYnZ45UyNBtqnl7yFXh7OFkIjhfK57ZnfIXIBSF+iSjpMxo2ByO3lAEFgSMO?=
 =?us-ascii?Q?jaUduklVfo3ugnrnGV0X6hct44rB9C78TRocW+kHyI+1qf+aTDKBR61zQLxQ?=
 =?us-ascii?Q?JyojPMu8d4UbySjkVGQs5jpOZNaKMMptOvghyv9ZeB8rsBpx5aUdP9GpganX?=
 =?us-ascii?Q?MRvQLmhj6kcCxCjKiMwLvfuNA1Kp8J9zFQddR/CwsUuaSWlQ4gphBuqogH5l?=
 =?us-ascii?Q?EmWkUdiC4ao5/F3dPHvz6ndW3eYde8t7D3L5YWajVjLuCYO11P01ZBlLU71s?=
 =?us-ascii?Q?PcdWMZeTF7S6iTm+4boz0F5k5bm8GvOcYUtwhTYYRQUCxKZoJ8BUfCBp/l+U?=
 =?us-ascii?Q?PzBSAKm33WrQ8Nv86+08s82BshaO3NHW5fr+VFeItzumHLXTMuoykFoum6M6?=
 =?us-ascii?Q?hpTftaN0x6fdOhmFoq4WQlAwzIZzhIe61aMG/HE4tORgBX3MdgW0GgrR/uO/?=
 =?us-ascii?Q?UPpua0edsR2oQO/jUwfFSpQsxUQFBXKNKByExKLfZknDT4Br83q6qD9bhy1B?=
 =?us-ascii?Q?IxWlxTbLUupnBpJnnMPl04pDYUTys7TYvABli86Xl2jC0vqnAb5v7l9dEoOu?=
 =?us-ascii?Q?gr3v9KFiA1N1eC+yAkXJ+t9UgikTche+eC+gFmiKFCrLmSnlLYiVAVfSURSQ?=
 =?us-ascii?Q?KWKhCeMvmZEb/CXSuI9+u1ucthqApXfd+wV68D/+NbZXNZWYevt7Td7bXmtV?=
 =?us-ascii?Q?oQEfsAJgQYx8hEOLJh4YJN6bFqMw/vJINN7MGjOTmY6KthbHPsd9ZTuuIeoY?=
 =?us-ascii?Q?EAHFEVvVqw5ndqmc5ofDOE3o1zgnrESjiWE7mXVfd3uP8CVCJn6a6WOJFNfv?=
 =?us-ascii?Q?6ptFSLl3xBhkQe+cR3f6Gdlj2IfXUvvBDnKgXKBqIQGtph6GYU17uPe/+CLF?=
 =?us-ascii?Q?7tznCbAEbaTqVPTSqF5Lg5GneYzTDYNT32960Q0j7+rByTfjgfVcSfuNaN2x?=
 =?us-ascii?Q?+fbhBT6n9B5YsZwqopl4R0QHXNcIrM231RaOy36pE0xp0KkiJbwgLPZK2AvZ?=
 =?us-ascii?Q?MktmWgofOwD1utN2nkI7WoU9reuxMloG3+9QNfUrZMupqWodF4WwdbfnA3lx?=
 =?us-ascii?Q?9KHzaekytI7NfsVjjWfnLnqSGCRyJpN0fGwt/mzhC4cIjRn8/eB0f9l7Ogrq?=
 =?us-ascii?Q?07DCCjJImJxkpgKNSl/tDNbQyPazBvpraYjCgG+0zRiA+TExTGheb9ZmkICQ?=
 =?us-ascii?Q?bGNoJwivO9mz31smAoPsmTbyrXI1wZtXKdC7IjLK?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 970a2b40-6021-4f64-d6fd-08dcb4fe5b2f
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 03:26:12.6199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: umqNwg+O98Je9z0HhvYhZ4NdqB7seKM4j+KdgXfylpoI9Q4KagyJ1OR1ufb+sdt8AENDClVmPn7RyBmdekOGzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6988
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

Currently vmap_udmabuf set page's array by each folio.
But, ubuf->folios is only contain's the folio's head page.

That mean we repeatedly mapped the folio head page to the vmalloc area.

This patch fix it, set each folio's page correct, so that pages array
contains right page, and then map into vmalloc area

Signed-off-by: Huan Yang <link@vivo.com>
---
 drivers/dma-buf/udmabuf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index af2391cea0bf..9737f063b6b3 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -78,7 +78,8 @@ static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 		return -ENOMEM;
 
 	for (pg = 0; pg < ubuf->pagecount; pg++)
-		pages[pg] = &ubuf->folios[pg]->page;
+		pages[pg] = folio_page(ubuf->folios[pg],
+				       ubuf->offsets[pg] >> PAGE_SHIFT);
 
 	vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
 	kvfree(pages);
-- 
2.45.2

