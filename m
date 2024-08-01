Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34877944993
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 12:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4446810E8F7;
	Thu,  1 Aug 2024 10:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="ci+x4WhZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2043.outbound.protection.outlook.com [40.107.255.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA7410E8F7
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 10:45:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dRKDy0tMOTZ7vqj9rwb+RFQGfxWAltBVURl3QyLcyTn6vc5QH55fZ8fI2hyvZODC+uRWo8masoGNZDA6qbn5ytW4bQsBvLc5OqXqSwg4O3lONOdnbtANSvxE8cJ8iUZ+uKb7zB4pbAAg3IYCXmQpb2W0nZDhake1LN2MNEbLf2weX5QrdM2Oey8/fK43070P2uqcrqPl/EKi0zRG5WlUSj/iqBC1KbsbIfiL81WAZjV2I/AHgXV8fmq0Yg2FwtA5RcpQXKhkvaMA6cHEMnR0wXtjtSkuK5vCaIuf2ITJNOgeGD3MRgrRfnBQhBu7ixtuAp3w1cL+O+gNCuNFVJmPzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NI3xBL6FLUipU1PFIttllNUVCDK4zSGmhIWGLdMmCss=;
 b=ErqAFazfZlhfa2scC1bujrXpJ1buA6jfYu0mBUwPL2PursO15EhByWVIkaHFGqpA3nNxYpgCRoIq2wP2rntWUMEl7IBvQL+5BA5yE6BrD8lO/TCGacCgSLhVIrmY1tpQ7zAPK7ZqDDvlKQJL8Xs0NsL6p4YzeDUDQoS96Vle0iPZUZmnbbJQPNa4+xr4zpFe7+wCzARZh/Z9E90Q+zdixXZFons92V6C85lR3NAWLxy8JLbeuK1K5WwYEPbM8id2wiUokbPMDHNQRw6Sk8wVFMZstOIMs/P6LaJB8a+ciFQz9+crFvkP1mBMMcpYJLjPmoHLC+yles5M7KwRjTvJvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NI3xBL6FLUipU1PFIttllNUVCDK4zSGmhIWGLdMmCss=;
 b=ci+x4WhZbPQFBG/Bk17oPCfT3a4Tc2dYSx8bzr11hufX0ENl13qEalcePFvrAWzP1cS479CRe9/QAaAHqgSWScAJQGD1IBeSMfM0Md4xZ3hEIANe3qqy5pnfSL38dL1zfulfAuPw5lWfNit5MgMpA72IE+IX7Q5LDoEbMFY6OLwK4cDVPcjSrd0gR/kz7I/Z6o1wal4+DdJUEEbpX+dXPg8qPbcxqD+M3Zi9INvtXQOejodYLv9Gbgdjskdherahw7jQMq2rGLxYS9pII2RCqiYpHCT80ETpT2HEvXy87bEmltFQKkFPDrEgnmNrYDcfAKA10Aw97MPvBHy00ocZBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SEZPR06MB6304.apcprd06.prod.outlook.com (2603:1096:101:10d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 10:45:32 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%4]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 10:45:32 +0000
From: Huan Yang <link@vivo.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH 4/5] udmabuf: add get_sg_table helper function
Date: Thu,  1 Aug 2024 18:45:08 +0800
Message-ID: <20240801104512.4056860-5-link@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 66d7008f-dcf3-4e29-4275-08dcb21710fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|366016|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RnN179dQMAZP+g9I1ygim76cdcaeWggR1Whm8P4rDd9QHKvS2WluM3sXtfpG?=
 =?us-ascii?Q?Pxypify8sCqPpL7s1etuueMUrfQqODPocUbWgHC12CxHLhJ2/9GmAjLscoEj?=
 =?us-ascii?Q?tkTZPK/cj1AIemldrkWyAhVhzcCRuIGvJA7QzW0nMXWkgyQMiFSjioOKGOB7?=
 =?us-ascii?Q?M2K6laMWZatJNP7ciiq8rtTfrX4Q8lN6kHCvddDC0aq14B89jUIK6JIY96Vg?=
 =?us-ascii?Q?kaooPvh1nIWiRx/SzjSox9Gr/YVt7VuFUma73auziXaepCTT/txiPeRTPNRl?=
 =?us-ascii?Q?lEeBN15yhy3+Pgckqdrv7OgXL40/Cdv7jt8At8sAOJ1iE0hP+6TKy2LYnWCn?=
 =?us-ascii?Q?iBPJrGSm+GQHdsJZXqgPgGmikohzA/tdRYK1Dujk6jDx8TJI71EKsLLYH2Bk?=
 =?us-ascii?Q?+kIiIi5h/iPAf5hlLfJO2Id2rTHCcSeT1kXhbbU5lxV7/Y/aOlT/YqpX89VQ?=
 =?us-ascii?Q?siq8mLdNCnzqdn7Vb4gawSiEUAlJo3w5WJ3QObQzTdcWt5HCrrccxvADEFSa?=
 =?us-ascii?Q?PPxNdBZHvABbYD6zTh7FkKGvsaLfIn8K6VMaEiU092ivlniPV3zQ2zBx2tFt?=
 =?us-ascii?Q?nzGYCUTUd6ILJM+epvNtmlkpoELLvEp+x7xuz03gdFwrzn3gyqWTlIMveAA8?=
 =?us-ascii?Q?r3ltu8+8iCVrPWr9EiBAX+VpvUrWG7pj1JCOziKm7X6tB4W4oqd7PwvD56Df?=
 =?us-ascii?Q?PH9c1p8BxQQ1D4RvVsfuRrkUgSK5IOIdd4RrpuBivgJGqLi5JqnCaYKe95bl?=
 =?us-ascii?Q?G32FXB3ceXA+6L91E2UeQlbZDJzAAQnq+3SJNQJlezbNjie9YGhgNa6ulRYC?=
 =?us-ascii?Q?ybnY2VpCpi8m54yHvxMZHKqTlOgOQML1EERBKgxWL+axCZ+d+sD/fVaPeHri?=
 =?us-ascii?Q?6rCFcVI89k+CzmC9ISQ/LCi7v1BczkTvlwALWhc8PltecQLgksEPEbGYpQT8?=
 =?us-ascii?Q?FcMVc970y8bNZDUFJ0poczL6XL6iAU/c3NX64S0uIGAZxc66zSkE5LAaf0Ga?=
 =?us-ascii?Q?nmDgNkdRsUWKKpwPbPg7DScX8+M1QUnGoAbmUOSnBDuv25UVZrnWPile/T4z?=
 =?us-ascii?Q?NMIFWs7K/UGzCrFPUiUQwDeSPMkLf2noGmPcyQXRs+ePm8dhROmFOBxQDKYj?=
 =?us-ascii?Q?NdKQQLb8ix93vaoqbJbNkn3PPhaedy11UDUuWyuOW43OQecfETeCs1HUmWwO?=
 =?us-ascii?Q?Q9uuqsv6/JGFikGhxsNhKEa0iqyVbFumYYcada9cnhGBJ1dat90nt1lFAY9G?=
 =?us-ascii?Q?xVL1+mEX+CuoRwQA9ZVAGUKKatBqbLmYeFDnsb/EJrb+9uHR4C1hD0d6pmIH?=
 =?us-ascii?Q?k4lx2JZCXqxv+hMSjR4bdlMjWIqALdnbysL0CnB+CuUDPoz0LvZNBAF8THoO?=
 =?us-ascii?Q?iYq90vaGoQ1Y3C5RX9r0PfuWBYeuXC+F+12wgdGU3dZ0Kbd8RA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3RBCb3j+kxXrO3QrFa4M3QZCE84rmNisjxVovD8NFFASan4zocmIlH7db07I?=
 =?us-ascii?Q?+tqqYr1Eum0ccuvTJ/nXnDjvvgco9lwTVq+An3MG/vs+RZPGzLoTNpRJD4lY?=
 =?us-ascii?Q?pDQj2ZErmQ1D3C5yGBjBwWShD0IlhQV8hNL/2pWCqtmuMWYD7GkVR/AzqWbz?=
 =?us-ascii?Q?M7WnV8ickXxgAr55IMC6kFzcVPA1+GZKpJaheYRO/eGuIh/3wRrpBXtWkn6F?=
 =?us-ascii?Q?Pxl26aU4+m2wv3jgLmctLok8pjJHVdj/feUtfUWRMZc25ayfSm7qT0aJdZM1?=
 =?us-ascii?Q?Cj2uyy+h2N/fC2AFBTzL7U00O5suDgv3cLQsaXdNv3AW7XsIk2Kou+Xk2TBB?=
 =?us-ascii?Q?53fNrxrrk8tV2iAZpFe+hanHty3DIrUFV7/b4K/HlSLqoXkLkjhZjRIDePDP?=
 =?us-ascii?Q?sLfGsicwmRapd1L8O8K9g2elFJ6cKWZhMR/Mm7gUJkwY0/vjbmDF2tYQ8P/r?=
 =?us-ascii?Q?qxanpBECnJgj1nogDgj0283ikxbEI2zXetwoNTu6EM5/mXZ3A7kwR+71+IMu?=
 =?us-ascii?Q?e+IE8F9q4eadKS7f/BeQBbyLfI2kVtQMM+o86bt2YnMuZH7ueEZWzMSxV81p?=
 =?us-ascii?Q?4yraGWo5pziE5xZxeBg1/eCzXiNOW3J5whYI3y2KxnbjUBQv6Z3dvlgs5vu6?=
 =?us-ascii?Q?PFGYe6JNzK7WGKrsrc8Xy56xbOIrgoOvJt0quYXVYfSsNicfVdkqy9JpBLzX?=
 =?us-ascii?Q?Qxo43e49K9vaLoQUl2YB475d1ZXrhbr3ub/Z5eRmlbP51dXJFpmRGJqcl6b8?=
 =?us-ascii?Q?l3to1UTkLZZYdDY7V5O7nRTKjFQraQMNkoBg6OI/bgoWaE/f6MFbLfKhNEIZ?=
 =?us-ascii?Q?NVqOfdBzxh7duW13dea3/2t06YI2u9ckHFfDD2GUhs5u0T1DrJNRK3ANOIEr?=
 =?us-ascii?Q?5r3DD7SX5WswGZjHkNtvLP9G48BpDxsQHVmTGSNagrwlhTX30aoYJ2p0wP3f?=
 =?us-ascii?Q?LgkrHal1rxjYy47Br6W3cYnoaoOzpSy5lf9r5QYrQuedU1oNL8/xXY+Y75/U?=
 =?us-ascii?Q?9Dmpmn7WjH3/YnMoWajHsS1aDe7rDDDLxYeHK3lyhnjbZcBlDtii8WtwmL+k?=
 =?us-ascii?Q?SVx55F8TCGw5nk34lRUs+LIGUSJvKMN34uIFtXf+jqahR+5Ej3P9tqIXql1D?=
 =?us-ascii?Q?6zMG7p4oCLJg9G24spM8SXuR7n8rvYwSbhnZsQbVBeu+unNeKGKyl3Je5hpy?=
 =?us-ascii?Q?oCQET//9A6SYx/1SCDdSKzXQ89ddctoU7bYD9iOJeLKAkGzK/47cP1aempQC?=
 =?us-ascii?Q?sW5TlGRdnw5VQO9iRwjiAbrtuAdlN5MXoX89IC7WKIqFFq2Qgzsa3xxh3Uhc?=
 =?us-ascii?Q?LBKIpyKXxPvwjTts3eI7ZExNsz4MBby0bJyeY8CcLm7jAYWIMVX/yF0hATsK?=
 =?us-ascii?Q?nYiIe18KCJbPWR94jStPXN2uxfpASt0TqewL/lq6Fwe5XqVeTQ/PH4kwYQbV?=
 =?us-ascii?Q?voN4EInRkbgVjw9Gct1NzPZAc9cZAu2YyBUMKOG56MMsoaaw33qwDNVHcHOw?=
 =?us-ascii?Q?qk+zMl5I+WVIeG7WH2dcFkOmoVtVgA0v2YGwzCiEtDf6Ma+expv5sG2p4vOe?=
 =?us-ascii?Q?h4SaqrcIZeoAEICzdnz4JB6wwMbLdGNbgx9gW68l?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66d7008f-dcf3-4e29-4275-08dcb21710fd
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 10:45:32.0430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4R0YrKQyTsVQKHJX49XWK5HSoKZ6OkYsVtTEyjo04e1XCDlEZfcvKYuAyjxXMf5z8idplXTpAl6FaO7EslBgZg==
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

Currently, there are three duplicate pieces of code that retrieve
sg_table and update uduf->sg.

Since the sgt is used to populate the page in both mmap and vmap.It is
necessary to ensure that ubuf->sg is set correctly.

This patch add a helper function, if ubuf->sg exist, just return it.
Or else, try alloc a new sgt, and cmpxchg to set it.

When the swap fails, it means that another process has set sg correctly.
Therefore, we reuse the new sg. If trigger by device, need invoke map to
sync it.

Signed-off-by: Huan Yang <link@vivo.com>
---
 drivers/dma-buf/udmabuf.c | 60 ++++++++++++++++++++++++++++-----------
 1 file changed, 43 insertions(+), 17 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 7ed532342d7f..677ebb2d462f 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -38,8 +38,9 @@ struct udmabuf_folio {
 	struct list_head list;
 };
 
-static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
-				     enum dma_data_direction direction);
+static struct sg_table *udmabuf_get_sg_table(struct device *dev,
+					     struct dma_buf *buf,
+					     enum dma_data_direction direction);
 
 static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
 {
@@ -52,12 +53,9 @@ static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
 	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) == 0)
 		return -EINVAL;
 
-	if (!table) {
-		table = get_sg_table(NULL, buf, 0);
-		if (IS_ERR(table))
-			return PTR_ERR(table);
-		ubuf->sg = table;
-	}
+	table = udmabuf_get_sg_table(NULL, buf, 0);
+	if (IS_ERR(table))
+		return PTR_ERR(table);
 
 	for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
 		struct page *page = sg_page_iter_page(&piter);
@@ -84,12 +82,9 @@ static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 
 	dma_resv_assert_held(buf->resv);
 
-	if (!sg) {
-		sg = get_sg_table(NULL, buf, 0);
-		if (IS_ERR(sg))
-			return PTR_ERR(sg);
-		ubuf->sg = sg;
-	}
+	sg = udmabuf_get_sg_table(NULL, buf, 0);
+	if (IS_ERR(sg))
+		return PTR_ERR(sg);
 
 	pages = kvmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
 	if (!pages)
@@ -154,6 +149,39 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
 	return ERR_PTR(ret);
 }
 
+static struct sg_table *udmabuf_get_sg_table(struct device *dev,
+					     struct dma_buf *buf,
+					     enum dma_data_direction direction)
+{
+	struct udmabuf *ubuf = buf->priv;
+	struct sg_table *sg = READ_ONCE(ubuf->sg);
+	int ret = 0;
+
+	if (sg)
+		return sg;
+
+	sg = get_sg_table(dev, buf, direction);
+	if (IS_ERR(sg))
+		return sg;
+
+	// Success update ubuf's sg, just return.
+	if (!cmpxchg(&ubuf->sg, NULL, sg))
+		return sg;
+
+	// use the new sg table.
+	sg_free_table(sg);
+	kfree(sg);
+	sg = READ_ONCE(ubuf->sg);
+
+	if (dev)
+		ret = dma_map_sgtable(dev, sg, direction, 0);
+
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	return sg;
+}
+
 static void put_sg_table(struct device *dev, struct sg_table *sg,
 			 enum dma_data_direction direction)
 {
@@ -230,12 +258,10 @@ static int begin_cpu_udmabuf(struct dma_buf *buf,
 		return 0;
 	}
 
-	sg = get_sg_table(dev, buf, direction);
+	sg = udmabuf_get_sg_table(dev, buf, direction);
 	if (IS_ERR(sg))
 		return PTR_ERR(sg);
 
-	ubuf->sg = sg;
-
 	return 0;
 }
 
-- 
2.45.2

