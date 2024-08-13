Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7F69500CB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 11:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6AC10E2A8;
	Tue, 13 Aug 2024 09:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="VWRv/8Rv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2063.outbound.protection.outlook.com [40.107.117.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E19410E272
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 09:05:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lDGwMF5HJC8UVXGXFyVTbDPFhmq+g7ueSLPlFwcUVgZwZ1NALeJf9lArTj1PoJoR1RWwJkCcRV2FX9Jz1Ayr7dybc8iVhKYOiH2DKCp2MPgBgwFHXXW2wtHS8D/wb3FEReedhuJYeyUu5X1ElBK6tnUZcpCuJY0rfCTpSqz6fXA69WdDMmTtb6p/SjuPDZuatSvtDgRszdkvRrNhmD+5Bc6TdVzQqzr+YwXBSnqY65QoI7ULSrgozbzpH7Cwgpv0LvuD6vFDFXETMdUPT0L3b8AwuEsX9CUB8Z+wTv3tVDRN2tIfZkaB/kWICZ2CLsCFefOuXo85JXXjN2p6se5O5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kcLyYBhcFFKALBjmJ3FFvEcxMSv+YUb9+KtElz+e5pA=;
 b=UTu+cxGMEPRmTn8vZMPVoG9znsV5v68MZPHhX2zBHbO5yozeNEpITpevPdJnBXYN6r93TfYa8tDnOGmdeJ+D9rYwR46UL0gQa8th0ITtmpHbeMzYuSW+HNGm8eB6ToBuwj+wBhnPMW7rzL5Ugdd4p0i4wqTIIzrKXxQdg5WWGOVHydNQvJgt7dvWqAKkVS3iWTZVUxgjQIYiEI77CrU0zAeWk0K9p9wcqW8xf8qsNanVquJ9Y87kJ+AQ91hAHKhQlftyhDUiCJfAsytadHmD8/FuZAsJHQxEM4GztGIbwrNecAnt0Z5/wKWcMQ1XbsHZWd+tfBanFYp0OHSh2RaeZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kcLyYBhcFFKALBjmJ3FFvEcxMSv+YUb9+KtElz+e5pA=;
 b=VWRv/8RvqRYKdH0tZ/aF8nlbW1t4OdQnjBqRO9vqYGCQP3jp5A6/EaR+PRmHU9d2zi7AKTxNF2xp8xLFZ43vaZACnJW/sQiVbdtxvSS+K7H1r327t9gSb17ixDGwdQsEn0OE1tuv8MoupOY7WTFl5yJ5Kfyy6nqBB3jBiPOWTtDJNbx+XBaHkYtVIQkzwRaNTLhvfcM5GKeFfCY0TfvNti6K4qTiqTl4vhTwrqlDOtJNONQZ5OfV2SOdOLZQ3+g3iFuZhwQIoL0zElUaMXFHl5unqYlHjCH7/mUWGTMRBtYpahhGiSHB+eCsHmqnfZz1iStuvcXQk96iO0sZlwH4fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by PUZPR06MB5820.apcprd06.prod.outlook.com (2603:1096:301:f2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 09:05:46 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%4]) with mapi id 15.20.7849.019; Tue, 13 Aug 2024
 09:05:46 +0000
From: Huan Yang <link@vivo.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v3 5/5] udmabuf: remove udmabuf_folio
Date: Tue, 13 Aug 2024 17:05:11 +0800
Message-ID: <20240813090518.3252469-6-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240813090518.3252469-1-link@vivo.com>
References: <20240813090518.3252469-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::15) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|PUZPR06MB5820:EE_
X-MS-Office365-Filtering-Correlation-Id: 566b5c2f-5736-4b79-c08f-08dcbb771e51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|376014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TkdByDFraWgtMssmVj/jrlio7OQS2mjQVV4k8WRoxrQWhzutLwTPz0LSWTmR?=
 =?us-ascii?Q?85HKSd6c5ELo8R1G8swW93ulS2E6d9d6Spj7h6FQeewU5LIE2EYrWAbSeCHM?=
 =?us-ascii?Q?Wkc4cXix9EcDny/QXsw7c7zLm9U7WC4f1MNewIgq2gT51SpCHJSC8tSXjczp?=
 =?us-ascii?Q?f/SGfKUNeIv96QIw0MraI+ASMhTfTz7InLXimC45hChXhkObBtyiSWOlvp0a?=
 =?us-ascii?Q?gasNivE+avVSJcIBwl542bIKOrZ+0bx4TbHIETnUJz30tpi8zd51EdN94731?=
 =?us-ascii?Q?In/ogXBSUzFLotBUiT9QgcbeMaQ93Bba1s6l9qMBt9lYfi1QPNzi64yhyAw2?=
 =?us-ascii?Q?Dticv3ZhqzY5/zAy2i7z8XbvdtJlA86BsfJjv+uu1vuib2jRZ8ELTC+b7Z9/?=
 =?us-ascii?Q?nTynnX8gpYiAl2xOmhJZt288rpj/ywsMoGcxgpsAMaZv5Hoq5mzH4b263gRq?=
 =?us-ascii?Q?2IFdELvUOVah07LRPjgb6DtLejoVfY/ar42R9R8f98Lx4qxxm+DgPMS+GV5j?=
 =?us-ascii?Q?XmTBIok0n3IwARMBTR+ByiZCU1khzipK226BTau15uCE/n6+inDXoxgwiVkF?=
 =?us-ascii?Q?/ggyX1AZvOCkd/vfa59z/o7fmWO4xECzatTS2SuZ3eesOq+D8NbGM6nz7Oqd?=
 =?us-ascii?Q?p8Q7z+dh+krqU3RcbgDYUSZw2/7POOgAEGP16BRtj2jv7KnqK7ikNBRchAZL?=
 =?us-ascii?Q?qi/CYz2HofeMkg38M9R+bWAOiGfX66bEMt+vNQ8owOAcl9fnbjEh4AMZwrQW?=
 =?us-ascii?Q?zMxZ6vS51xlKyYdCgATewoaVAmZUwjejoCYquMgxRNo44a2M5TfIyutMM3qE?=
 =?us-ascii?Q?T42Fbk4GzlMgS0w8ys4A8eAEyo8WAA+7iykUIvntU1BrzLabiApzzCqt7K45?=
 =?us-ascii?Q?U4TUrJtW0uVF+1BLgj56FbxWL159yl6Y6k4K42IbIW2g2EHUuFW9Xstfdv1d?=
 =?us-ascii?Q?ADhAcltTVq5IdSsk8gWQMG4dPSmmibjl6nnEf+Tm74aT4Ku81kSquGW039jy?=
 =?us-ascii?Q?YFjd4fYqULz/cJjjecjArjh3IoEJeypDQfSDC6isKNp59ewGu5SJ2me4hEXW?=
 =?us-ascii?Q?xsgluZeqX5cqxBKOiinMtJyxrBtu/aPdBEp5zSZSuYpxsqO0GLhLGnpk64SW?=
 =?us-ascii?Q?p5+KvuNpoAiZ312CWVWoqsYY7mEBUbX0bBdBDNLRCaDdiZ5sCfRej9biJk+q?=
 =?us-ascii?Q?tNrxGnNhDDVk0wMIE1c/jgnEwtCTYfzyqJZRyTfNkUph1r/RIHFStbs6aju+?=
 =?us-ascii?Q?c9kot31rhPH2GWU+1ORr+4P1nSv1OsYacqGZxq/FAH3ERUkiKyn7D3fiB0n7?=
 =?us-ascii?Q?PNXZuy+k7flstgeZCiHik6uy6HRGrOhRRIkJ3GHo6JCqyJS+7m3WQHe7Yb49?=
 =?us-ascii?Q?aeBJQa1hkP6LtpzBtv8IBw4j4uySRrqdMOSimWd6o3ssICk8Kg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HY0H0ZMQJrisFSn5HLG0zRRu8pMKxTZza/YtSZLi46xDYZXR4Tgpd06mSSDG?=
 =?us-ascii?Q?fOzIHTlWXARIOVUY+T4g0dtJ/lM0rcN0qj5fBXYX6tGWOY/Vdqgpv4nPkQDW?=
 =?us-ascii?Q?Ppi9kwnRNtz26qddPWPDZdZUPmDrR3n4vGiwDvjKo05kPugzKLA0vvms0MFn?=
 =?us-ascii?Q?JGtQ0ew3gVZBfXoVVa12kP2AMx/vQbatOP5YcKUn9TLFbGaKoEjjvIQZeQRb?=
 =?us-ascii?Q?B/UFrxoRtJRa9cLyhuiKYaLFezgkFdtW6IeB/VYUy3IrQpPRxM7NkNr+5MzR?=
 =?us-ascii?Q?B+MJTCJq1jXD03flmqZfE9Wa0eEz5rPtKz0Kl9+c2VZ0ggAb/n+lPLFyYmnF?=
 =?us-ascii?Q?55yZJnT6synXf4NBeYvSLRtjmqsH0+jV5qzMPOsMoEOkvgUSihrhnNEHcrHy?=
 =?us-ascii?Q?GDcXzDneExlTqr2w2PcVpvkHFt1+hwkN+VlioRkphseIsDsAu2beyRkunZH0?=
 =?us-ascii?Q?20yz7iy0qJ/SQSrbgs1WQHTeVIassv/QA8tA9WSdH4FMaV3yOwqUWjConGJo?=
 =?us-ascii?Q?8QYpXiGrdXoOej0v+91wnP4hxGKsFJBpkVjTGN7nMz6afzjWYoqQWVmSBEU/?=
 =?us-ascii?Q?VG9MhatxXebsSup5JJlpkR2Og/tUEs1AATYGPKTkyn9DAjxwxh+p0fXIEJ/j?=
 =?us-ascii?Q?Qo/p8nKeviEQPeqi3mpJf0rLCF1XgWH1HslX/kj1I4Ul/YSywcFobn0xtOci?=
 =?us-ascii?Q?y3bN3P3ARyhAgM6DUgOuW76KMFe3xZf/PyP69DkwGgzwtaqJt7aidyurYbbm?=
 =?us-ascii?Q?gyc7jesWz1LwzOFxceHVMs9mmyDHEC+HezxtUInn1s0hs2wf/4iudcC8XR6K?=
 =?us-ascii?Q?hPLNhp+TFNBJfcDvpGksTPy24u1c/7dogS/6fUIh9RkyGbLkYORE64+RbUYk?=
 =?us-ascii?Q?I9eyRneTIxVsBrHBnB6rZDRwxP61pwzwVLmS/jGFZVCPGbDDyrR+wvMZwlUj?=
 =?us-ascii?Q?AauM08aagVWvZxyMV75IiZOTADnnsyy49gCgCl+HRjtBKW4q0EXfcgAXFrxx?=
 =?us-ascii?Q?1/Z9B8yoaiP2K5QgcN2u0QoVsQeyUdgL25HjOkTHOgOAorZkSC+dkBqMwr4d?=
 =?us-ascii?Q?UvF/ltH0JDJri0/eNnXDNANMcbsiatCxNTNjQ+5EnE1Gylvbf8jzFLiqVLz2?=
 =?us-ascii?Q?/8PHuXfd3mSCFdnAcovaCDOGwI5wCbBZMEYx52jAAhc/muBWOTpxq3eRIiP+?=
 =?us-ascii?Q?62l/XDqUf8GbLT7GHsigbrnPB32l4y+6S0qcMg1T0h71Bx9uMkg67jSj+/un?=
 =?us-ascii?Q?Ud9E4iVRWQKx/BYk6ZzcAvY6zYzcs5mzZQOBpYQsET3ob1loLiQQAmJHyTeF?=
 =?us-ascii?Q?49kocr9WVBG5ZZAd0kumesOFVKEEKFgZoDuxB7S+Lp3xvHtwrq5icv2Ky0uc?=
 =?us-ascii?Q?P5PwGm7G3EHSczlGDfXJTeNXxGqzfi8ODxW1PncX6JJAlNXc64vg7g9pg74w?=
 =?us-ascii?Q?/R1MAFmx9o0oQAmMPjGnM8U8pz3oON8rRBBHjBzmQeP+rDcvkk7TiwzDsXZm?=
 =?us-ascii?Q?pL68wRKuZCJvqY6Z49RSNby6uU4v5l3MQoZ8py/gfIQrkzV4DLSvZN2EXWM4?=
 =?us-ascii?Q?GzzUXQHC5m7KRvVuo9B593fV3UvNNSNhBvqw0Osf?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 566b5c2f-5736-4b79-c08f-08dcbb771e51
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 09:05:46.5668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Jm8sHAD1ys20DRVjcyOWnxsMzCZtCibkSXjB9k0ZNE9ubmvi34aOCM2wRn2pdre5b8Uw3cCBa140aeYgjlk8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5820
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
which is not friendly to the CPU cache.

Considering that during creation, we arranged the folio array in the
order of pin and set the offset according to pgcnt.

We actually don't need to use unpin_list to unpin during release.
Instead, we can iterate through the folios array during release and
unpin any folio that is different from the ones previously accessed.

By this, not only saves the overhead of the udmabuf_folio data structure
but also makes array access more cache-friendly.

Signed-off-by: Huan Yang <link@vivo.com>
---
 drivers/dma-buf/udmabuf.c | 68 +++++++++++++++++----------------------
 1 file changed, 30 insertions(+), 38 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 8f9cb0e2e71a..1e7f46c33d1a 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -26,16 +26,19 @@ MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf, in megabytes. Default is
 
 struct udmabuf {
 	pgoff_t pagecount;
-	struct folio **folios;
 	struct sg_table *sg;
 	struct miscdevice *device;
+	struct folio **folios;
+	/**
+	 * offset in folios array's folio, byte unit.
+	 * udmabuf can use either shmem or hugetlb pages, an array based on
+	 * pages may not be suitable.
+	 * Especially when HVO is enabled, the tail page will be released,
+	 * so our reference to the page will no longer be correct.
+	 * Hence, it's necessary to record the offset in order to reference
+	 * the correct PFN within the folio.
+	 */
 	pgoff_t *offsets;
-	struct list_head unpin_list;
-};
-
-struct udmabuf_folio {
-	struct folio *folio;
-	struct list_head list;
 };
 
 static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
@@ -160,32 +163,28 @@ static void unmap_udmabuf(struct dma_buf_attachment *at,
 	return put_sg_table(at->dev, sg, direction);
 }
 
-static void unpin_all_folios(struct list_head *unpin_list)
+/**
+ * unpin_all_folios:		unpin each folio we pinned in create
+ * The udmabuf set all folio in folios and pinned it, but for large folio,
+ * We may have only used a small portion of the physical in the folio.
+ * we will repeatedly, sequentially set the folio into the array to ensure
+ * that the offset can index the correct folio at the corresponding index.
+ * Hence, we only need to unpin the first iterred folio.
+ */
+static void unpin_all_folios(struct udmabuf *ubuf)
 {
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
+	pgoff_t pg;
+	struct folio *last = NULL;
 
-static int add_to_unpin_list(struct list_head *unpin_list,
-			     struct folio *folio)
-{
-	struct udmabuf_folio *ubuf_folio;
+	for (pg = 0; pg < ubuf->pagecount; pg++) {
+		struct folio *tmp = ubuf->folios[pg];
 
-	ubuf_folio = kzalloc(sizeof(*ubuf_folio), GFP_KERNEL);
-	if (!ubuf_folio)
-		return -ENOMEM;
+		if (tmp == last)
+			continue;
 
-	ubuf_folio->folio = folio;
-	list_add_tail(&ubuf_folio->list, unpin_list);
-	return 0;
+		last = tmp;
+		unpin_folio(tmp);
+	}
 }
 
 static void release_udmabuf(struct dma_buf *buf)
@@ -196,7 +195,7 @@ static void release_udmabuf(struct dma_buf *buf)
 	if (ubuf->sg)
 		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
 
-	unpin_all_folios(&ubuf->unpin_list);
+	unpin_all_folios(ubuf);
 	kvfree(ubuf->offsets);
 	kvfree(ubuf->folios);
 	kfree(ubuf);
@@ -308,7 +307,6 @@ static long udmabuf_create(struct miscdevice *device,
 	if (!ubuf)
 		return -ENOMEM;
 
-	INIT_LIST_HEAD(&ubuf->unpin_list);
 	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
 	for (i = 0; i < head->count; i++) {
 		if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
@@ -366,12 +364,6 @@ static long udmabuf_create(struct miscdevice *device,
 			u32 k;
 			long fsize = folio_size(folios[j]);
 
-			ret = add_to_unpin_list(&ubuf->unpin_list, folios[j]);
-			if (ret < 0) {
-				kfree(folios);
-				goto err;
-			}
-
 			for (k = pgoff; k < fsize; k += PAGE_SIZE) {
 				ubuf->folios[pgbuf] = folios[j];
 				ubuf->offsets[pgbuf] = k;
@@ -399,7 +391,7 @@ static long udmabuf_create(struct miscdevice *device,
 err:
 	if (memfd)
 		fput(memfd);
-	unpin_all_folios(&ubuf->unpin_list);
+	unpin_all_folios(ubuf);
 	kvfree(ubuf->offsets);
 	kvfree(ubuf->folios);
 	kfree(ubuf);
-- 
2.45.2

