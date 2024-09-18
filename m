Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CC097B6EC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 04:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888C210E520;
	Wed, 18 Sep 2024 02:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="WJQce8gV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2061.outbound.protection.outlook.com [40.107.117.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 218CA10E520
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 02:53:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ewoUO17ZWfKLx/2cMN5TN5zGG0dGQ3QTMG65oN8rxtvX1VovWpTjM5pfMYaS09xJLfG3bgz+Nzg8j2yg/neCLbpevSO4eILEwv7kab4rSa0YXVPPb6JgfRreoOrr6XtDeyKxcmWVD9Kd2zq9ncA5CtrnNjgbqg0Q0bBtlKnfGJSOMsPNDfEeh9Uh28T+9TIQ8tYhnrhrP4GrfUy/S891mq3WAx1Hy4eK/iAkQRyJHg8DxSphefAC99lU5mk0N7f8XwECFfBwbpQKerUnC0OcLOBqzaA41bkeXhaDM44z7QD3L74Ign6dvpuEBxl1Vb1aySXE62h1rqfYXODaqMezwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBH4ndlxGVYUUbFKupkt4SbcLGPfRrO5yEdC89OSr6o=;
 b=KDkZ/nFjmnso6Ar8FVQ7nQN3Up33hreOk4zO4K39GgFM+usJxdtCCnCi/LnnGjI9Zk9sJRgV+UGqY9RtA7n/0DjUXvYuNnruCxc4BfdYZTY0/PcvddMlU4W8eJIDyn1V7RWHMvtwU0fX6PQI3OUAoV762/e4wPXV8JQsh0GPo7TcfAVKStIU0CP0qv+ouh9ZDbYgeqCwOeL09KrA71ClAOV4Kf7gjBiscrlOOpGzM7lfsCxLa8GeOV4pi9Bb8kscnqJKTQr4EryRSLUWgyi+AzruO5cYZXXM/1LtC/HVjXvKDt/0YfHfJK41p+w5J1+bnHfWgpEtPatt7fZoTetFng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBH4ndlxGVYUUbFKupkt4SbcLGPfRrO5yEdC89OSr6o=;
 b=WJQce8gVHKoBKGEkfHz8e2iSi6L4FMaDFIAGNktxuqWAOl3/H2X/UkO4roBIzR32vcUudJWXj/cF5usJx6N8Jzwpp3wg29kjLNWfh2nE3DBDgtK8S+/fIsiy+rUFXC0vyM7T8pRp87JMwvxZCYP+x/R4dyIdmpeEHV1zJ+EDdGFZPwt1ntOgAH0VzQlYh8WxvSD7GEQlE7fMmYpedSXNLiGF9M3jNhlYSAOiaP5LXXUErOe1xj9uA6rcpvcGIEKAqiOrwiM8pjftFEaUJ7pVD5Ls7hqpkg2qJ0aH5mWuG2YemiukGFQLihFrih/4CA173AJHFOzDgEBq3jOMXPzihg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEYPR06MB5672.apcprd06.prod.outlook.com (2603:1096:101:bc::11)
 by KL1PR06MB6236.apcprd06.prod.outlook.com (2603:1096:820:d7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Wed, 18 Sep
 2024 02:53:10 +0000
Received: from SEYPR06MB5672.apcprd06.prod.outlook.com
 ([fe80::2f0c:5cf2:abb0:d852]) by SEYPR06MB5672.apcprd06.prod.outlook.com
 ([fe80::2f0c:5cf2:abb0:d852%5]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 02:53:10 +0000
From: Huan Yang <link@vivo.com>
To: vivek.kasireddy@intel.com, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v7 7/7] udmabuf: reuse folio array when pin folios
Date: Wed, 18 Sep 2024 10:52:30 +0800
Message-ID: <20240918025238.2957823-8-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240918025238.2957823-1-link@vivo.com>
References: <20240918025238.2957823-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To SEYPR06MB5672.apcprd06.prod.outlook.com
 (2603:1096:101:bc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR06MB5672:EE_|KL1PR06MB6236:EE_
X-MS-Office365-Filtering-Correlation-Id: 73c6b6c9-1e62-4835-26a3-08dcd78d07dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|366016|376014|7416014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Jfq/NXpdQKKeeEafXyjGeIkz361NqCtE0SvGoiXz+N84JHXsfbrLVbMN/GHw?=
 =?us-ascii?Q?iSx2aooBLyrG/YbmXJcc1i+8hzfVloiOiCXrWwKlqM/bVbinqwgnH6f2Sdyd?=
 =?us-ascii?Q?vf6RGdq5d1jq2V43JZ20Cr/ikQ0TMIEKtG35P7H2CxLjKNcaU5FqxatlZLRy?=
 =?us-ascii?Q?nDJG7Z27WhhiMwXd1fpF6XuGlA4xCDF07lpKqQQec4B/Cno7gH/NHw6m3qzB?=
 =?us-ascii?Q?6+YelNoG50z7oZ1f+vSmh8crOmWzdRVnCAJsQUrQGHFQDSq1GynjeiMJX3TE?=
 =?us-ascii?Q?IORTvPphtejlNPV9RlztkbPrR+qhHjrTxEHxu59nEauJxis8wZnpxP+CEVd+?=
 =?us-ascii?Q?i9prpckDI670vsyQ+HkyhG5xzsheXPk0bqdFbv/F1H65lKzyiT09shYI3T/p?=
 =?us-ascii?Q?yEOKgEgVUIs5hSsTNCp+1XSWJVC0s0u/k+KKrUOEvd3ruErIrjRxYGbHx6MR?=
 =?us-ascii?Q?clfGotOFhEHQ4QdRDqxBl3z/iOtOfP0BKd8SIZXs8LkLaxTR5rh0GcPDpmZT?=
 =?us-ascii?Q?q4FfLPZUAtcCiGXo0Bp0H38TGvgcKEKWDDV3o0TPnAe8vAEp+5qX1hcjO51x?=
 =?us-ascii?Q?oYEQiy8lBkTO3XoJd2gQgsAZJlgiRk9Zz6KHicg4Rfz71me7RnVxMVfoFvqq?=
 =?us-ascii?Q?h0Pf4mXVXDr3Gt/Z5LLuUpbMw1FMP2qKEXOsBsc1+gM/yrZt7DbEPlTD1wKw?=
 =?us-ascii?Q?b4FaXVvvzdNHQJ3mnZVt0leqDPwA9FkeLRHzUhLkXWpAOXPJTnc2gAN15d2p?=
 =?us-ascii?Q?TylBrI32ok4t/k492tcKPrSrwRucT9OC45ztG9i1IV8ze+cyTrKMz0spwIoS?=
 =?us-ascii?Q?spQBSjwTEkBVf1/tdF1RK6sjoO7DKCnKQTCJegxf0L8nli/wcGb+xvJCZiQf?=
 =?us-ascii?Q?vUUPILQnaFkNILkZ947VY7cvt4lJKQtzGH/BAwBMHKsFip4SmXg9S6XRQkJG?=
 =?us-ascii?Q?1mE9M9Dx1/MtBSnAa9lNZcZabizdNSg767DfdOSKr/MYwsfoS17b95VfnB6h?=
 =?us-ascii?Q?ErhffICNTrVG7f/Lgm2jGvtn9zDdvZDUEbY5Jq9VB9Wz92zq7G1zxbdFbeko?=
 =?us-ascii?Q?p9HgbMc2J6wXW/DqUtDlYpvImZwOGChsLaRvaMttQ6/RfEY1Sto2DlpX/0w5?=
 =?us-ascii?Q?rv01JbVsaWPQWnPPa3J0MVgiNr18nmw3eBu2armcs7r65ik+mwM1RlZy2Khl?=
 =?us-ascii?Q?5YUSwbPd10NqZ2gVCtUsQ3VMi1GeIiaY0wM38A5RcY2kkZGEsMZSys0nOwkr?=
 =?us-ascii?Q?Wc2XZE8aBbz5u5Tj/xWSIdN+OLWT+JmvzFdrJrsEOhdV6rVT2j+qXwKcdmDp?=
 =?us-ascii?Q?ev8AHqg7GA5dwvtrJsE3jwhIdgBnXkkf6rrcbNzCOSDcxvTQE2ixAQr1a684?=
 =?us-ascii?Q?h04j4a80fK8B7RzU2RBtbAoPXnnb9frl8j5x99Dx6pmnqg6Qw6MD6T2ZlWWA?=
 =?us-ascii?Q?+lRPvEq07MY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR06MB5672.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(366016)(376014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4YTeLeDF0OyIJtSdcoi/xntm5P7SgMCOgv5+nGNzQb+CLLAXCmNgAA14L1Gf?=
 =?us-ascii?Q?Hd98azHc6a3/9KceXUXof78IYZ8sU1icvjPg4EbSnCIWwde3uf5WnI+rxDiR?=
 =?us-ascii?Q?YS/VoTgYPuudnVdJBWJ32CyzH5p57QNPPzduYi/LbVGC54rg6vGRhfUGGppU?=
 =?us-ascii?Q?Wyd6QML9y3z3i7ge0qw+y2p0X2I0QvZmaF2wnwBZei5HfZ/aoaMPMoxQcn3B?=
 =?us-ascii?Q?iTjdItTNYYIoEp8VoajZ1+NujpKK6mnDxA2a3rjDiY+4ZHxrjLJk5YK8ZFgV?=
 =?us-ascii?Q?efUMQ9+B4QYOn2KKIcXiR+96PlBZwn1mP1Cbrmu8pKv0MO3vyh0iCY/gC4fA?=
 =?us-ascii?Q?3KxdTXV/wdqYbBtQ/itWgvjoSlt1eYOVfPOr9EPnZUOyH3Rx8yGiFEh5fqVo?=
 =?us-ascii?Q?A7Jq4E9ZI11ZiQOjk9dJkVagDfmmgGJXcZt5ahtHAwQVJZ7SgmgsPSVZkmEW?=
 =?us-ascii?Q?ZJn+el7UDlj3jcAhsC7By/YH63pst9Y1N5lmbjauFeg7PxgG3KPx5giv4G8B?=
 =?us-ascii?Q?EkP9visYd7quwt0u/Hm3hsElVbiLdip5rulC7cIqAxeu5J7iON6hCXhM8oZx?=
 =?us-ascii?Q?sR23cM3WpBoclAd4zdZ2ENZqf1VzMkVqYLQ2cQVlJzKvjnrwWZXzHstlXyf/?=
 =?us-ascii?Q?jZL2XfnkMdWxl1+2wzf/rpQU2P5RegDhlQODwHnIivrjtmyWTeJUIPe51dqV?=
 =?us-ascii?Q?DG2UFnW7vKM72GsAuhRQ6IJ/SmJ2j+QVeJwuePAcxzUrFmUrnxU0FY98Xx4E?=
 =?us-ascii?Q?Kl6FtCZwYx/quxQMJwocTD6dUfxJ4XeOkGIZ3nkR2oFGdceRWe2riNrAZcXB?=
 =?us-ascii?Q?MKgNi+7CaogCipxx6yu9TgcneAiZ52Vvu832ShApfPSobo03tJOiGIojpRCQ?=
 =?us-ascii?Q?EULGTIqCWJnUGUthqejLz1nak+JctAqaliB328B7chKrD+nzrMUW6/lLYnxZ?=
 =?us-ascii?Q?QsGriImbToSOqGcbvDoSVexZpI3LANxFPQdxNlMTaB075SsQbMvCMqb5eA9k?=
 =?us-ascii?Q?LVT0qw2bcP8/0OUgKxOjSlgkUsdBcmUa04zrHk5LLiOVg/wNjGaLL7feB4pW?=
 =?us-ascii?Q?tSExC/W/1WI4QneVS3MqJa4D2yWytdKG9ZTEZFgEMBOHsO81jFs4AaGJ/gNN?=
 =?us-ascii?Q?sn/vPLFhJiGMW/0yjlWlTQH5V0K+trCpgdQ8r2kCzXF3npq/gK25l1jzzytJ?=
 =?us-ascii?Q?o96HjzoZbJTnNLEx7YRcbAR80Ngf50AwbM89WjFhIfPoDJ5fRACVhTBOZAyH?=
 =?us-ascii?Q?ju4VNdJlPnBAlYyRn5JU1rcleawh8K1r08w4rRgwNNS+Z6vqHeOf8Yfbu8pl?=
 =?us-ascii?Q?5gxShARzCap4MA0JSLQ0EUqbQjCKa2Z4yoMjj8gSNe5H9aKLPnQL3svuiGFL?=
 =?us-ascii?Q?IbuJ4BVmwcnbKz8lOOb1h9yLOWD8JmD7MI6/I2Rqp2vv8YsFPKoYxOyb4AAL?=
 =?us-ascii?Q?w89IrUGk3lpevZ4sN8Vb8LnXh+8zqCDAZcKlXWSEz1LIqqPBnatuXRamcsSt?=
 =?us-ascii?Q?GMgZJvibvhTq0DRMJQYb60JswKJNUsf4x6eanS5ZVZ+FFiXfX46JfpirbAIZ?=
 =?us-ascii?Q?Ki8QXYwDMcp98XA1y91TECajxiWE2WkSdmlyhbuf?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c6b6c9-1e62-4835-26a3-08dcd78d07dc
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5672.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 02:53:10.3853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mCTEZQOUBLPtUe8qO1/NkCtot61/zNGcoB3LUXcX28ZQuC+1p+CDoxuy0SYX5l2GG18xzMXV5TSk3pwyWWeGiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6236
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

When invoke memfd_pin_folios, we need offer an array to save each folio
which we pinned.

The current way is dynamic alloc an array(use kvmalloc), get folios,
save into udmabuf and then free.

Depend on the size, kvmalloc can do something different:

Below PAGE_SIZE, slab allocator will be used, which have good alloc
performance, due to it cached page.

PAGE_SIZE - PCP Order, PCP(per-cpu-pageset) also given buddy page a
cache in each CPU, so different CPU no need to hold some lock(zone or
some) to get the locally page. If PCP cached page, the access also fast.

PAGE_SIZE - BUDDY_MAX, try to get page from buddy, due to kvmalloc adjusted
the gfp flags, if zone freelist can't alloc page(fast path), we will not
enter slowpath to reclaim memory. Due to need hold lock and check, may
slow, but still fast than vmalloc.

Anything wrong will fallback into vmalloc to alloc memory, it obtains
contiguous virtual addresses by loop alloc order 0 page(PAGE_SIZE), and
then map it into vmalloc area. If necessary, page alloc may enter
slowpath to reclaim memory. Hence, if fallback into vmalloc, it's slow.

When create, we need to iter each udmabuf item, then pin it's range
folios, if each item's range folio's count is large, we may fallback each
into vmalloc.

This patch find the largest range folio in items, then alloc this size's
folio array. When pin range folios, reuse this array.

Signed-off-by: Huan Yang <link@vivo.com>
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/udmabuf.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 24badfefa6b4..8ce1f074c2d3 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -338,28 +338,20 @@ static int export_udmabuf(struct udmabuf *ubuf,
 }
 
 static long udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
-			       loff_t start, loff_t size)
+			       loff_t start, loff_t size, struct folio **folios)
 {
 	pgoff_t nr_pinned = ubuf->nr_pinned;
 	pgoff_t upgcnt = ubuf->pagecount;
-	struct folio **folios = NULL;
 	u32 cur_folio, cur_pgcnt;
 	pgoff_t pgoff, pgcnt;
 	long nr_folios;
-	long ret = 0;
 	loff_t end;
 
 	pgcnt = size >> PAGE_SHIFT;
-	folios = kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
-	if (!folios)
-		return -ENOMEM;
-
 	end = start + (pgcnt << PAGE_SHIFT) - 1;
 	nr_folios = memfd_pin_folios(memfd, start, end, folios, pgcnt, &pgoff);
-	if (nr_folios <= 0) {
-		ret = nr_folios ? nr_folios : -EINVAL;
-		goto end;
-	}
+	if (nr_folios <= 0)
+		return nr_folios ? nr_folios : -EINVAL;
 
 	cur_pgcnt = 0;
 	for (cur_folio = 0; cur_folio < nr_folios; ++cur_folio) {
@@ -388,14 +380,15 @@ static long udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
 end:
 	ubuf->pagecount = upgcnt;
 	ubuf->nr_pinned = nr_pinned;
-	kvfree(folios);
-	return ret;
+	return 0;
 }
 
 static long udmabuf_create(struct miscdevice *device,
 			   struct udmabuf_create_list *head,
 			   struct udmabuf_create_item *list)
 {
+	unsigned long max_nr_folios = 0;
+	struct folio **folios = NULL;
 	pgoff_t pgcnt = 0, pglimit;
 	struct udmabuf *ubuf;
 	long ret = -EINVAL;
@@ -407,14 +400,19 @@ static long udmabuf_create(struct miscdevice *device,
 
 	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
 	for (i = 0; i < head->count; i++) {
+		pgoff_t subpgcnt;
+
 		if (!PAGE_ALIGNED(list[i].offset))
 			goto err_noinit;
 		if (!PAGE_ALIGNED(list[i].size))
 			goto err_noinit;
 
-		pgcnt += list[i].size >> PAGE_SHIFT;
+		subpgcnt = list[i].size >> PAGE_SHIFT;
+		pgcnt += subpgcnt;
 		if (pgcnt > pglimit)
 			goto err_noinit;
+
+		max_nr_folios = max_t(unsigned long, subpgcnt, max_nr_folios);
 	}
 
 	if (!pgcnt)
@@ -424,6 +422,12 @@ static long udmabuf_create(struct miscdevice *device,
 	if (ret)
 		goto err;
 
+	folios = kvmalloc_array(max_nr_folios, sizeof(*folios), GFP_KERNEL);
+	if (!folios) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
 	for (i = 0; i < head->count; i++) {
 		struct file *memfd = fget(list[i].memfd);
 
@@ -439,7 +443,7 @@ static long udmabuf_create(struct miscdevice *device,
 		}
 
 		ret = udmabuf_pin_folios(ubuf, memfd, list[i].offset,
-					 list[i].size);
+					 list[i].size, folios);
 		fput(memfd);
 		if (ret)
 			goto err;
@@ -450,12 +454,14 @@ static long udmabuf_create(struct miscdevice *device,
 	if (ret < 0)
 		goto err;
 
+	kvfree(folios);
 	return ret;
 
 err:
 	deinit_udmabuf(ubuf);
 err_noinit:
 	kfree(ubuf);
+	kvfree(folios);
 	return ret;
 }
 
-- 
2.45.2

