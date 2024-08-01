Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C293944998
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 12:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0308E10E8FB;
	Thu,  1 Aug 2024 10:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="kb0Epgu8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2081.outbound.protection.outlook.com [40.107.255.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9588D10E8FB
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 10:45:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lirBDIr6xwMWyvzTpS4u3DvoCoaAXekgRRO/dALDraUo8pCq3vmy+1vShVJW278BCudtslxLzC98/RRvekH6plUm9TYwywm8VTe+6tRNomO5mP8JOQMpxe+6Z4MTG66A3KZOrA8B1cLXXByMujM2oygiLlK4ya2URbSem5wc5pNaQ+cAUOe846rdTVYkUhiIRGs3jwnEu9EnjK2m8XUf8e9coORqvgbn4/b+405ODP2gQ54KsQb5fBkdDnN9NeDRSwFWPTZXwKESMvQ6pXAs/4Xuk10qsm0K7EQfVUovRM8rktCgSixqJJ53MkYH0Wejky5/bouAxiK7vrMgtcLilg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mI0gpVfBwy2PG4XtWWDhnXZeLqC3mjTemls4sGgVBLY=;
 b=P/aYQ8s31pYIRZqDgdV+SXkGKH9e7XiCOQM+E8c3RyfOJMBgbV+4B1rbXK7KQebatUBvRkka19noY1BdlhaMZ+4mCHiSZ4mXoaEks+rue4M+aw18xZgZAJlwMm7lBTlRXGsfppsS4jzyJopY2wIJe1kvE+k2T1SaBTpCFZxb9ucU/0nddsXHJIa+DQvZTzxc4sAJNhseXQc+P8SpVI6eE7LEMKaj0J7zmLlilLlQU8KTqReWmrUBKl/NwCiWECH5Z9ojG9j/teQVDonrFRCdB2Rppf5utS1FY9ihfsjGFTQCEyJEUMIytX7loS0xjPzPjhxT+tj5O+KOVZu8KpU79w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mI0gpVfBwy2PG4XtWWDhnXZeLqC3mjTemls4sGgVBLY=;
 b=kb0Epgu8W5NxEIPigM34o+j/ZF0nNQQDAGsEtxn9a7q03ybT4QUZXy5upj2CeEgXpXENy1eu/J8Xkn7e/cSFXI2J2bGeV3e14vJEZ3n4xHm54JHS3DyV1QoD82KZZSi+tsspq0RWtlj17aDonfCnbAQuWFRlWrUWNX9E02Qqhg21wknwwFrarofpLz84YdV1hTUhMXpbJCD+xTNl7h7lvd2AZfXhCj+4hYtppoinbRLtCovP5FBEz8ZsQ445v3/TLxOQRc9HWroQcTQWxuDg+W3192pCHUxdymloPaX7NLJpEwkEyx2FImxz0uvgbNwPIs8gX1CRC70hkr8F50R54g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SEZPR06MB6304.apcprd06.prod.outlook.com (2603:1096:101:10d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 10:45:34 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%4]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 10:45:34 +0000
From: Huan Yang <link@vivo.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH 5/5] udmabuf: remove folio pin list
Date: Thu,  1 Aug 2024 18:45:09 +0800
Message-ID: <20240801104512.4056860-6-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240801104512.4056860-1-link@vivo.com>
References: <20240801104512.4056860-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0209.apcprd06.prod.outlook.com
 (2603:1096:4:68::17) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SEZPR06MB6304:EE_
X-MS-Office365-Filtering-Correlation-Id: 695854b1-ffc2-46cd-d71a-08dcb2171248
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|366016|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9kUOPAsfPTn1uCTgCV4uhSX47XZ97GDF2hkh+fSEy6JVvU277BoB/ZkDwfRS?=
 =?us-ascii?Q?sHeFjedHnAAgeE5+uw/jfVb2kJxkptwzVxjfR7oI5+QFCnge0yLQi5kdrUrn?=
 =?us-ascii?Q?Ax3w5lY4r3IdP5PmbMNp6s+eCnXEnsF1eTXmdXDnQDxil0+IUiMTyj0XA5dW?=
 =?us-ascii?Q?GlvIv2vc7f6Zj+g3kSGMS/12JXKus/uR1YAAGHdXqhNuzBCeDPfi2NFYvb68?=
 =?us-ascii?Q?qHp5lX9jUP/zENsSZ7TPSbEEmOo1FKXknnhI27xjQJ3TG2AAYCqpf801B2zG?=
 =?us-ascii?Q?xqqNUkOUZSNRw8Ioy1DTEEVhlZhS1bL3UGAyph2racIVGjT66DvM63LSVsRs?=
 =?us-ascii?Q?Zk1nYdEJZkZAT/kfsyDJLhHSIgJku63wjNsLWD0YntIK+6nEhjA+I9kR9Yfg?=
 =?us-ascii?Q?6HLOSE8Opf4pM4E/daA7kJj7IjkaxHGE34tRt43OoubRrD9vsacPMWQVHjCL?=
 =?us-ascii?Q?ndWSE+WlNdlUjKGnFZXiL0WCUoNUsCZ6Qxl7+dGH6TIYqiAtzQo2/iFE9V+H?=
 =?us-ascii?Q?wZ5/804oTbkSCFhNkOhTRDln9mEjt4/wD5WY2ZZQBFuG1yIINSEXjEDIn9SW?=
 =?us-ascii?Q?ba5q3q23dNluNsGWfn7OJLHwxHr+gHDT4q2vsKk0NRu6+WpK31j3cpNgZBFG?=
 =?us-ascii?Q?6R3dcmb4y+NWGQoduKwuRZCKz/r9ih2d0hPvflbfvauRDdpZYxm0/NI6uHVJ?=
 =?us-ascii?Q?vwpdWnr+Nskm1UrdZWSaomMQK3/GhG4u7PFq4uBVjmeoSo9f2DwuUHAHpIGj?=
 =?us-ascii?Q?uo5hmrqnJpMHv170y5zIk0PXtkUlqRZZxMLKZs7Zbf2rwrKP723uS6ynmfV2?=
 =?us-ascii?Q?cGtODc1EmIgvbssXhmoWsJjsaIg7w0mt+AFD+HBCZs1DSIVBHVVNvEgf2eHj?=
 =?us-ascii?Q?F6O+JaGBmajtamXQ/aFqFSSVL49Xb4utViLqDVXdyPKIfcOBHBvAgTHXUfCX?=
 =?us-ascii?Q?+OzVHsLCALAHfpG0mzx1W2CeJgj73tEb02scLKFXjJU4tS5ZgOq7cPwIc2D2?=
 =?us-ascii?Q?AoTaR1Rrn0XTns6Vw+ogDLuBjqnfTaDrQTox0xjJ94x9U/g1hoAh76qiYH0h?=
 =?us-ascii?Q?ciS6h3fuKW48ecrZVv97kS+g+0Efw26D9Wwd0Ttfh/nhNCsk6aaOA22tbxvh?=
 =?us-ascii?Q?KihbUji4BxhkHZSMmb0azZyEWWpPMLmsxUz+EBb64rifQZ1J1lZL1U6QROP0?=
 =?us-ascii?Q?tBk+lj5b0ZcnP6hRasfn9t1BVDedV9Y2NW6w1RI6eFLNIBByvI6kJUR3+3hn?=
 =?us-ascii?Q?PMB6/weZX9DpndQzMYGF0/to8Kn7ILx810jp70yon+KknjUWzq5J/nW7d1xn?=
 =?us-ascii?Q?A2pFUrYuUxJz0IjT5zJrX9ZOPQl1esR20JcQraku60Bp0QKoxK4GDsrKxAoR?=
 =?us-ascii?Q?Kez/j19+EeSGHYsnWwgPOv1OcyAj6fbIZg23hbXQz6XHkngJFw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6dMfQAsa2Ri2zx0N8TLizqDWm60R9/lHx2nZuAk8Bqb4oEekIINS77R5p9oe?=
 =?us-ascii?Q?hstiiC2KPjz0IK54Tyo0I9E7bu9D+C4d9G1gADSuj1VeCx4tWTU0LjIKHMfE?=
 =?us-ascii?Q?Ds94rA8AffTTbVpqH6G9GHPuJzdKKYtHFkT6SqLDA8XZzr1L4fgg3Hgt7z/R?=
 =?us-ascii?Q?Sy5LYEzKKNwUGE4kPPeL8i53bf6PBoHqfOv2HIFo/5LpAkcUXogtI64n0Y9l?=
 =?us-ascii?Q?8yKpDbHRgUHGhJD1KfVTLksajIVdgZ+4ogO/PsGBqvr3qKIMKyeybZGG6bPP?=
 =?us-ascii?Q?DmCy58wh230BBHM4RKv+tczpe5oFHFR+Y4SjwfUEj7wpjDP3ssaKgpFoIoAU?=
 =?us-ascii?Q?VYujVrZgmZxZimHqIHXJFc6RvDu04Kj1+qnazUy06vlupCwOH9tUbMKgh4qW?=
 =?us-ascii?Q?NFJtB8m9cWhGaZOWHfREnocfu2Tr53WoN7r7NzDzBoG27CV8nN9R+2NU7IIg?=
 =?us-ascii?Q?EKA5gWRnjKw6Bt8yKrZ/LtznTYgSAt0HzSdMe7uctL0W5SeReGvpToh22QTh?=
 =?us-ascii?Q?q/VJqqCAhJTaHR/R3C36iHbwEsfvgKBmnwEQ9wzjqubdOCj7cqXr4gbbs5V7?=
 =?us-ascii?Q?TageigF7/vYWm3nY+ipvTTTIoHXTW8Z717AtxXFoWXasM14QSV4UGORHHMQx?=
 =?us-ascii?Q?2SXCJBbGFce7rQvxpdiHUfCEiajRCseiT3jaw0IOawbLK4gKLyvP4fvMJj+w?=
 =?us-ascii?Q?nLJ/14WtxXfVzRyZfDjRU3+iCHUbP8Z3M645iXikw3+5nc6+uT20pBh/h5n7?=
 =?us-ascii?Q?Sokw5fea/GcvSJEalj52jqWnHHuhHVMXpF2DEoUUopqtvj3QGSG2dZcI52I7?=
 =?us-ascii?Q?278ruS5+kJoxHj0dkze8S8YUh45Nj7JHWv1oVRcs8nxLYGof9OqQondsNLmK?=
 =?us-ascii?Q?Cs/NYQy/qCPX79zxiwAi9xQRSy2A0Oj4ARx//8jZ4CfOffYQHb1014SbyvQW?=
 =?us-ascii?Q?RjUfJTtX6UnH9chu/q0igZaX2uxPM4JIBVof0q9Y3VWJ+9Jhloh/I3d9GpN3?=
 =?us-ascii?Q?9GryjU4ApSAb9fLFGfI+Ae+OPtUbC3WTWCrC0hOBPzqZ1ZwJpvhWlou0v6qf?=
 =?us-ascii?Q?6dQBf8Ky9yb0T3/5gAqMdRS984DKL+cwsZpb4wQ1IMqeiWWXkUIztFuPXB91?=
 =?us-ascii?Q?UOyN/oyJx9hw4/6PR2jVa9r1mtCdM663JgbP99qly7VgCOsEaXDWYqbKPQ0h?=
 =?us-ascii?Q?iqC8X1aEZh1JS0vvbr+ZZKzSwOtJiGVY6zrMSBh/jAgQ3I3RNEIRwYGQTPie?=
 =?us-ascii?Q?5i5GtWzuliP5vw2s9yIhYYYvIMJCq2XISnYT5CWEDXGLO+lpvjULG4V6wAJ6?=
 =?us-ascii?Q?2r+y+n2IkeexbVDH9WxCaEfFNrOyDyLNylf8x7lH4Ik3IanR44Jq8uzIogaC?=
 =?us-ascii?Q?QNmMPGZbR3kEnnuxCcELkpUUN8PRNJUiSobGCeeq8wtGCm+hY9c+Sor76O7H?=
 =?us-ascii?Q?ay9G8zz7me1axW3O1LNEmJKwXRGcPzRNvu1Vlp9MF07rGXjvB3K2jLUH4YeC?=
 =?us-ascii?Q?uvYPUfEvVe64vtiSoG2W4wNrsRGeiNvpeRmlg0wDAgyz3WDUEH7N6/DR2Ubr?=
 =?us-ascii?Q?Pc/fprtZT6bJuEZQVlLRyPbxub+f4YDpxFJd08W/?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 695854b1-ffc2-46cd-d71a-08dcb2171248
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 10:45:34.1825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uS6Tan53xdYHYJi6M9CDMUS8wJNzXWev6Z04NfMsjqol0ijQ8VXYZVr6vIt8k3Fu03ji3c9S7xKxBFOOJ/SqoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6304
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

Currently, udmabuf handles folio by creating an unpin list to record
each folio obtained from the list and unpinning them when released. To
maintain this approach, many data structures have been established.

However, maintaining this type of data structure requires a significant
amount of memory and traversing the list is a substantial overhead,
which is not friendly to the CPU cache, TLB, and so on.

Therefore, this patch removes the relationship between the folio and its
offset in the linear address mapping.

As an alternative, udmabuf only tracks all folio structures and splits
them into individual pages when needed by traversing them in the
required locations.(mmap/vmap, sg table.)

So, udmabuf's folios_array only save the folio struct, add nr_folios to
point how many folio saved in it.

offset is removed, and add item's offset and size to replace, due to
memfd create may have offset, we must set correctly page in folio.

So, when setup sg_table, we must start correct offset in each item at
begin, and then set each folio's page into sgtable.

Both item's offset and size number just the create list number, so,
memory size will not too large.

By doing this, we can accept the overhead of the udmabuf_folio structure
and the performance loss of traversing the list during unpinning.

Signed-off-by: Huan Yang <link@vivo.com>
---
 drivers/dma-buf/udmabuf.c | 149 +++++++++++++++++---------------------
 1 file changed, 66 insertions(+), 83 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 677ebb2d462f..1106e0b1e746 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -25,17 +25,19 @@ module_param(size_limit_mb, int, 0644);
 MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in megabytes. Default is 64.");
 
 struct udmabuf {
+	// all page's count, pagecount * PAGE_SIZE is the udmabuf's size
 	pgoff_t pagecount;
+
+	// folios array only point to each folio, do not duplicate set.
 	struct folio **folios;
+	// folios array's number
+	pgoff_t nr_folios;
+
 	struct sg_table *sg;
 	struct miscdevice *device;
-	pgoff_t *offsets;
-	struct list_head unpin_list;
-};
 
-struct udmabuf_folio {
-	struct folio *folio;
-	struct list_head list;
+	pgoff_t *item_offset;
+	size_t *item_size;
 };
 
 static struct sg_table *udmabuf_get_sg_table(struct device *dev,
@@ -118,7 +120,10 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
 	struct udmabuf *ubuf = buf->priv;
 	struct sg_table *sg;
 	struct scatterlist *sgl;
-	unsigned int i = 0;
+	struct folio *folio = NULL;
+	size_t fsize, foffset;
+	unsigned int i = 0, item_idx = 0, findex = 0;
+	size_t cur_size, item_size;
 	int ret;
 
 	sg = kzalloc(sizeof(*sg), GFP_KERNEL);
@@ -129,9 +134,33 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
 	if (ret < 0)
 		goto err_alloc;
 
-	for_each_sg(sg->sgl, sgl, ubuf->pagecount, i)
-		sg_set_folio(sgl, ubuf->folios[i], PAGE_SIZE,
-			     ubuf->offsets[i]);
+	cur_size = 0;
+	item_size = ubuf->item_size[0];
+	foffset = ubuf->item_offset[0];
+	folio = ubuf->folios[0];
+	fsize = folio_size(folio);
+
+	for_each_sg(sg->sgl, sgl, ubuf->pagecount, i) {
+		sg_set_folio(sgl, folio, PAGE_SIZE, foffset);
+		foffset += PAGE_SIZE;
+		cur_size += PAGE_SIZE;
+
+		// move to next folio.
+		if (foffset == fsize) {
+			++findex;
+			folio = ubuf->folios[findex];
+			fsize = folio_size(folio);
+			foffset = 0;
+		}
+
+		// if reach to next item, must check the start offset.
+		if (cur_size == item_size) {
+			++item_idx;
+			foffset = ubuf->item_offset[item_idx];
+			item_size = ubuf->item_size[item_idx];
+			cur_size = 0;
+		}
+	}
 
 	// if dev is NULL, no need to sync.
 	if (!dev)
@@ -203,34 +232,6 @@ static void unmap_udmabuf(struct dma_buf_attachment *at,
 	return put_sg_table(at->dev, sg, direction);
 }
 
-static void unpin_all_folios(struct list_head *unpin_list)
-{
-	struct udmabuf_folio *ubuf_folio;
-
-	while (!list_empty(unpin_list)) {
-		ubuf_folio = list_first_entry(unpin_list,
-					      struct udmabuf_folio, list);
-		unpin_folio(ubuf_folio->folio);
-
-		list_del(&ubuf_folio->list);
-		kfree(ubuf_folio);
-	}
-}
-
-static int add_to_unpin_list(struct list_head *unpin_list,
-			     struct folio *folio)
-{
-	struct udmabuf_folio *ubuf_folio;
-
-	ubuf_folio = kzalloc(sizeof(*ubuf_folio), GFP_KERNEL);
-	if (!ubuf_folio)
-		return -ENOMEM;
-
-	ubuf_folio->folio = folio;
-	list_add_tail(&ubuf_folio->list, unpin_list);
-	return 0;
-}
-
 static void release_udmabuf(struct dma_buf *buf)
 {
 	struct udmabuf *ubuf = buf->priv;
@@ -239,8 +240,9 @@ static void release_udmabuf(struct dma_buf *buf)
 	if (ubuf->sg)
 		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
 
-	unpin_all_folios(&ubuf->unpin_list);
-	kvfree(ubuf->offsets);
+	unpin_folios(ubuf->folios, ubuf->nr_folios);
+	kfree(ubuf->item_offset);
+	kfree(ubuf->item_size);
 	kvfree(ubuf->folios);
 	kfree(ubuf);
 }
@@ -338,19 +340,18 @@ static long udmabuf_create(struct miscdevice *device,
 			   struct udmabuf_create_list *head,
 			   struct udmabuf_create_item *list)
 {
-	pgoff_t pgoff, pgcnt, pglimit, pgbuf = 0;
+	pgoff_t pgoff, pgcnt, pglimit;
 	long nr_folios, ret = -EINVAL;
 	struct file *memfd = NULL;
 	struct folio **folios;
 	struct udmabuf *ubuf;
-	u32 i, j, k, flags;
+	u32 i, flags;
 	loff_t end;
 
 	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
 	if (!ubuf)
 		return -ENOMEM;
 
-	INIT_LIST_HEAD(&ubuf->unpin_list);
 	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
 	for (i = 0; i < head->count; i++) {
 		if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
@@ -365,20 +366,27 @@ static long udmabuf_create(struct miscdevice *device,
 	if (!ubuf->pagecount)
 		goto err;
 
-	ubuf->folios = kvmalloc_array(ubuf->pagecount, sizeof(*ubuf->folios),
-				      GFP_KERNEL);
-	if (!ubuf->folios) {
+	ubuf->item_size =
+		kmalloc_array(head->count, sizeof(size_t), GFP_KERNEL);
+	if (!ubuf->item_size)
+		return -ENOMEM;
+
+	ubuf->item_offset =
+		kmalloc_array(head->count, sizeof(pgoff_t), GFP_KERNEL);
+	if (!ubuf->item_offset) {
 		ret = -ENOMEM;
 		goto err;
 	}
-	ubuf->offsets =
-		kvcalloc(ubuf->pagecount, sizeof(*ubuf->offsets), GFP_KERNEL);
-	if (!ubuf->offsets) {
+
+	ubuf->folios = kvmalloc_array(ubuf->pagecount, sizeof(*ubuf->folios),
+				      GFP_KERNEL);
+	if (!ubuf->folios) {
 		ret = -ENOMEM;
 		goto err;
 	}
+	folios = ubuf->folios;
 
-	pgbuf = 0;
+	nr_folios = 0;
 	for (i = 0; i < head->count; i++) {
 		memfd = fget(list[i].memfd);
 		ret = check_memfd_seals(memfd);
@@ -386,49 +394,24 @@ static long udmabuf_create(struct miscdevice *device,
 			goto err;
 
 		pgcnt = list[i].size >> PAGE_SHIFT;
-		folios = kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
-		if (!folios) {
-			ret = -ENOMEM;
-			goto err;
-		}
 
 		end = list[i].offset + (pgcnt << PAGE_SHIFT) - 1;
 		ret = memfd_pin_folios(memfd, list[i].offset, end,
 				       folios, pgcnt, &pgoff);
 		if (ret <= 0) {
-			kvfree(folios);
-			if (!ret)
-				ret = -EINVAL;
+			ret = ret ?: -EINVAL;
 			goto err;
 		}
+		ubuf->item_size[i] = list[i].size;
+		ubuf->item_offset[i] = pgoff;
 
-		nr_folios = ret;
-		pgoff >>= PAGE_SHIFT;
-		for (j = 0, k = 0; j < pgcnt; j++) {
-			ubuf->folios[pgbuf] = folios[k];
-			ubuf->offsets[pgbuf] = pgoff << PAGE_SHIFT;
-
-			if (j == 0 || ubuf->folios[pgbuf-1] != folios[k]) {
-				ret = add_to_unpin_list(&ubuf->unpin_list,
-							folios[k]);
-				if (ret < 0) {
-					kfree(folios);
-					goto err;
-				}
-			}
-
-			pgbuf++;
-			if (++pgoff == folio_nr_pages(folios[k])) {
-				pgoff = 0;
-				if (++k == nr_folios)
-					break;
-			}
-		}
+		nr_folios += ret;
+		folios += ret;
 
-		kvfree(folios);
 		fput(memfd);
 		memfd = NULL;
 	}
+	ubuf->nr_folios = nr_folios;
 
 	flags = head->flags & UDMABUF_FLAGS_CLOEXEC ? O_CLOEXEC : 0;
 	ret = export_udmabuf(ubuf, device, flags);
@@ -440,8 +423,8 @@ static long udmabuf_create(struct miscdevice *device,
 err:
 	if (memfd)
 		fput(memfd);
-	unpin_all_folios(&ubuf->unpin_list);
-	kvfree(ubuf->offsets);
+	kfree(ubuf->item_size);
+	kfree(ubuf->item_offset);
 	kvfree(ubuf->folios);
 	kfree(ubuf);
 	return ret;
-- 
2.45.2

