Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91660944995
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 12:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454B710E8F8;
	Thu,  1 Aug 2024 10:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="VGGU+g+9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2043.outbound.protection.outlook.com [40.107.255.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC7F10E8F6
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 10:45:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LOqJsYIpbgd4tAxIhlM3/+mxWt06akfggV6v5wfWd+WOV2J5nNgGlM4Lk2Gu4TSfrSsY5XLVtEl4UcROy7Wjn6C5PXvyCo9iOzkKy6mnE7z8BgEyJ2IAkpq18s1t8fz+EKSRa0FjI4Sz75MRXaQ5tQshPlLoOsKFJc2c0wrOojcUFm+8hTcCpSdClZgSYyAEcxbT12yzZglxx/6gUm5F5nDErxDq+I/jg36x6VcCDQC9cHvU+1L5oWXNVaouwgXCtWjJk819zNj1uPEtVOs5vWsrttmpgWiE6LssRC9OmbMRusCGTszGjNfHAzPxpHmI3zkB7SNtygWdisEXdOSKpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGNxavGBonMGVhAMEsLOUEdKXKTo0xNEi6YQPpzYGHg=;
 b=JK/TxzeLwHWmjmfZubCInhmRroTLYZslzX6NWDZHZ/nP1RFN8/nyC+yQdPKMG/gYVwGVb8OjyQvh25b1ekKz0geMTkspsfBMUV2V95kAwXYO/AVjytk/r4vVZgtNKgQwXvOYsuOPS1rdG+jynC+4zaknuQtL/U2zckGYrmyZ22+M8ycyxOvY340JMfRySm7bj6Jqgdnq03asHoIK1s/uwLA86I4h+DqoP5MRrlQ2M/niB1OxEoPsH5wJnZYpbkYAEJAcq/KWsgTBQEXFDOlHz5UlD+d5lgmPHAzjq4HwriqfGxu/GrzBCHymmO5GIgLf1jkV1rd++iiDFZupoYZTmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGNxavGBonMGVhAMEsLOUEdKXKTo0xNEi6YQPpzYGHg=;
 b=VGGU+g+9FesUybzCztGfDy+gdjd6yhSm1z1hVOFGHs8tNYZaVnHi1+T8Zlhjx79nZwxH/vFQ/liJIdi2MJdNfGATqQpw7ck/cagQfjEtuhAraA8TsgYtDb90n2IUarARwWIet2N0AoMlMaEMwx5PrGXff3BJFDJ/K5ypMPRRpbzMSQ4y0wkA0pf7tlBE2f2BDnEGNfkiQRE8GTkaUBCYR+zwJITrkNPqpHx7r6La3hwawVSHIoZUhF/LZeQuvr9+3Wdr/VhuTDgJcxkasu3A3nBogb+L2W8RNgPPT5tLw4xBpHfgaze7FspoYHCIrSKOhXEfBUO6e+0B8oM6h9JBTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SEZPR06MB6304.apcprd06.prod.outlook.com (2603:1096:101:10d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 10:45:25 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%4]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 10:45:25 +0000
From: Huan Yang <link@vivo.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH 1/5] udmabuf: cancel mmap page fault, direct map it
Date: Thu,  1 Aug 2024 18:45:05 +0800
Message-ID: <20240801104512.4056860-2-link@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: d0386eab-960b-458b-c3b7-08dcb2170d26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|366016|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/5svspaDkFltQhYXYqp7RLcVKThBmMv583X3nQq3JRH2Jp5ekPWXmDzpNVkn?=
 =?us-ascii?Q?0Ks1McA4337l8nUZjrDr5pfKfg28uywONrRgtMakCpTMu5KFVGA9wLQB6E/g?=
 =?us-ascii?Q?cid5Ld/ZHUWSAfEVz1bZmuC2r+vwLu26a26JVSn/+5Vqtvv0w4MKbLxCdLPQ?=
 =?us-ascii?Q?2S+eJz2GQ70ZsTAL0XpB+fihLXi1gIhkLzqDIgd0oYt4l9GKxwh0ghSO7vXJ?=
 =?us-ascii?Q?0cvbh37S9bezHs1DJ/iwrITFItTV4noVVLeu9y67gb5PFadBM4gID9kNPgBJ?=
 =?us-ascii?Q?54MFJ0iCkqVgaR7Tr2Kpi8glmEV6Lhs34ni33+urfnlsCPCz9eaCpLFPdXzH?=
 =?us-ascii?Q?ylkCa/AreD8r2wjD1IGYSdnR6M0U7ojTWcQunsG5Y9hAuu4aLOpW2hEWjre8?=
 =?us-ascii?Q?YulnKXT2rNfdwCam8IqlXQ98UHFbgL4Fdex3oAI5wh/7KMmmNDUBTJ1GIkZV?=
 =?us-ascii?Q?jlzibxuH0/QifdtqbXLWW8Lll5YDxQxFNB0s2b9PI9kwiohi8eIJzBAZ4lTW?=
 =?us-ascii?Q?WUm2q9Zy9p0kMeGhd0Q4rVbPW4QpgbY1kZQpAquoCXhh6VTCWaNZntHMYcYx?=
 =?us-ascii?Q?xXUmyhIVmvU8RF2LgIJy3oPA5+KKAapHR500kaXb2st35suiJ/3sSECDZgXP?=
 =?us-ascii?Q?+JWKmZxNK/rQkLtgVXPWYFW2l6Ht0jOZP6yPHj/GhYh8pVV+4ME0Ot78voz6?=
 =?us-ascii?Q?s5WP+hGC19AmTZSeMzkacOKrNfitIp+6q+gYtDQubpsBPhtC7gUISvtRfATN?=
 =?us-ascii?Q?HRfuA5z5w1pvNhW1ik9SCyH6LPj8mTCKlzpQp7xtIgZ1AGhfms/2P2Or9THr?=
 =?us-ascii?Q?U8ikGUNwpvP4a8mPAVBUED8AqTjtm6cfkLJxVvIjmupzfkCEPflc5SM1JGeR?=
 =?us-ascii?Q?r8gPLf7RMt3hKzYBObLFW+4GA3FsvWPe8SPOtADaAY2ECcJdxMDH8sMp4gUl?=
 =?us-ascii?Q?aTBvJ67UuDS20QpLGjaeePv07vhTK457BJ6uzxduxpa1VrYYR/CeS/z1Fpqe?=
 =?us-ascii?Q?zHvbBZLgE69OMj84uJIuBV04j7WjoWkXkP9xLjMg4G8zQRaQkVB0wnNKeQQr?=
 =?us-ascii?Q?aEkjmxjNfdApopNy+RwRbEuuqJ8PlBWfPTmPHWdCWo1NjJsNed6yM7KKcnxY?=
 =?us-ascii?Q?+4dY2kVwXFjUCaDx6iclMX+09g7/gcKS87eHnkb9DdXi1rfVyUFqNY98ep9U?=
 =?us-ascii?Q?8Nkiv9CJ5fBQ2rSyUmKKzT9Xap9/aov88unt+gx9YpZsCbksAHg+PQ57YikK?=
 =?us-ascii?Q?mcwYDOrMJ+2zfKfDSNrLze3HkQKJozIyrWiUX83y0rmj7tcD6XhGuVh01Gfq?=
 =?us-ascii?Q?6vHk+DKx/YiAJWaXl2scJf8y0h8gLbs0o6WlPAkYva7Ix4K0DQ/ar1glYrNc?=
 =?us-ascii?Q?gLmlesEPCV5r1co5yyfw325IBp02JqYKzS+XD4ilIzDB0B4pFg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8kqGCeGnIEIkdHDDO3gevumGfRzRMwCV2aiVGxLVsroI8E794pGePXZIxuTg?=
 =?us-ascii?Q?hzwtZgN1OXU9t/NbD6YLyRhK/L1CxpDiNWM4iryKYKdvO4Mv6/PWy8DFVwoK?=
 =?us-ascii?Q?QX/vEwOMtV845TzqBCCTi1nt0Dg7omFboLqPip9UjI75mzhGs3ZhlUf1+ToM?=
 =?us-ascii?Q?3ltMA1cJidCPxaBnhHST62OpDkKFNotCuEosro/mLf5CJ4Q+jV01CO5Hv3NE?=
 =?us-ascii?Q?+3/+OMEMUQQfJaQgjg4qGPnCXEI7i/9t3kqy82XtmSeX8yewPQwNlh9sRj/V?=
 =?us-ascii?Q?kxEgY7exYc++GqDFSkpM/gs+BMYg1+55U2hS4HwjZpCzOUhznqx155V/Vl8p?=
 =?us-ascii?Q?r3DeMs0IwmDfDvuG84mSRcPj0vixyUe1rx2EzEiuJLwnbJJysE2Lxb+Zr3K8?=
 =?us-ascii?Q?+1eGEpkkEWnMIqbflr29w/nivsGg/I3nX7Qvaj2WFY2diToO7SgVZpTiOvvl?=
 =?us-ascii?Q?V/S7ZJLmPSWK9Js8HQebpVfz5vomiB7wP7f133UaL9kK6NlxFDLjiMlY8S0k?=
 =?us-ascii?Q?ufAXQJOthdvuLzxQeeHOwo3VQuGF8cVAsI8PdjBZHE+eyEVvqbxDZKdTmvqu?=
 =?us-ascii?Q?kByUOK0uG4UVOWicfVqHqMA3n0pGokuOPeo2f8klIrIQQ9DU4vZICCqEeqSu?=
 =?us-ascii?Q?OZsEf+GPWpEwnEBCsizb+JmBVMygtJRv4Y/xMiHVfyNm67plmTVEGFKAG822?=
 =?us-ascii?Q?c7p7uBqDcGJ3aPxvBw16U5qzUfKbt64ijG8Vukn/tRlTBgs3Z4m8T4xztoBk?=
 =?us-ascii?Q?HtzwdLgdXOWB2jiGT6NlyQQXgvVR8f2VNjmTNuXL6m02vOWGQ9Kkk8Re25s4?=
 =?us-ascii?Q?XD8iJ7HXbsI/y/rtV3fct1zXzT9yrZlYI+xAkMyExxY4jH4WeWxp0qvt05Fi?=
 =?us-ascii?Q?fLo9ZAYkK9HfjI0GVfVR8uGojoT7MC2SAA2zQWzurzapnMV/rIomqoDmdHQB?=
 =?us-ascii?Q?fDQLA4k3mrP2lUfjAO08TiFRyux+N39+E6Td+/kAO5TmKPBzUAdqNInzNHd8?=
 =?us-ascii?Q?99hGbsnhVnioBYD9oQuC602fUleXq04u3IbMEa+VAaJf9SkVTHErOzSVHclg?=
 =?us-ascii?Q?ScasPbsuOJZXRhi/g2K2RE6WLNLMclQ+rr5bZ64/BhpSg31HFkM9j9MlXEEG?=
 =?us-ascii?Q?Yarw3vW9RRv1gjBHM5f5DuYBrYRsDaJ+fDSLO8H59qYaTAwuaKE4fraZwbDN?=
 =?us-ascii?Q?kcPTQmYdRB1MYVLLxlWrZfe+vTNmGU7zG51PbiUvdiMQBXVRaSJQcX2tK3iB?=
 =?us-ascii?Q?p2jboD99YrCht4XZQMbVIWI8PQXuQ8LqOHl5OfiUO66uLTSmjScYFDuSJr91?=
 =?us-ascii?Q?wa06zUbt9c6P8853mYw+uOHVXzxe1vyM7JekFM3ztvMPjBL3JxROFZsXwbCb?=
 =?us-ascii?Q?BXLU6nLSy4fHZVulIzhFgA/+6C0ntHO8MwsuSwX4OVs/xYKhASGVauJlrEYG?=
 =?us-ascii?Q?pNaG8Da5VXHFVRRPcTqMxQE+hmKjLwnHCO+zMyP6INQbYOEOCYSCQA32W5aB?=
 =?us-ascii?Q?wryFpoeRYUK5/w7eIxNyc2m62HOJ/ecUHmSEJYMPd9FIQEc2zWR6W2k+zRPd?=
 =?us-ascii?Q?7DcFNiH2CBdeePw6bhdugW1FImu+uVxoQhOhJUF1?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0386eab-960b-458b-c3b7-08dcb2170d26
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 10:45:25.6025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OAMxMoTh7hW0Q4mVpDeW45Uu/UyFDm0fobl7BIQvStaqUD0nwihqxZ/uQZ9u/YDqdAk8TYpzyRQeCsBBkt7KUg==
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

The current udmabuf mmap uses a page fault mechanism to populate the vma.

However, the current udmabuf has already obtained and pinned the folio
upon completion of the creation.This means that the physical memory has
already been acquired, rather than being accessed dynamically. The
current page fault method only saves some page table memory.

As a result, the page fault mechanism has lost its purpose as a demanding
page. Due to the fact that page fault requires trapping into kernel mode
and filling in when accessing the corresponding virtual address in mmap,
this means that user mode access to virtual addresses needs to trap into
kernel mode.

Therefore, when creating a large size udmabuf, this represents a
considerable overhead.

Therefore, the current patch removes the page fault method of mmap and
instead fills it directly when mmap is triggered.

Signed-off-by: Huan Yang <link@vivo.com>
---
 drivers/dma-buf/udmabuf.c | 70 ++++++++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 31 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 047c3cd2ceff..d69aeada7367 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -38,36 +38,39 @@ struct udmabuf_folio {
 	struct list_head list;
 };
 
-static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
-{
-	struct vm_area_struct *vma = vmf->vma;
-	struct udmabuf *ubuf = vma->vm_private_data;
-	pgoff_t pgoff = vmf->pgoff;
-	unsigned long pfn;
-
-	if (pgoff >= ubuf->pagecount)
-		return VM_FAULT_SIGBUS;
-
-	pfn = folio_pfn(ubuf->folios[pgoff]);
-	pfn += ubuf->offsets[pgoff] >> PAGE_SHIFT;
-
-	return vmf_insert_pfn(vma, vmf->address, pfn);
-}
-
-static const struct vm_operations_struct udmabuf_vm_ops = {
-	.fault = udmabuf_vm_fault,
-};
+static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
+				     enum dma_data_direction direction);
 
 static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
 {
 	struct udmabuf *ubuf = buf->priv;
+	struct sg_table *table = ubuf->sg;
+	unsigned long addr = vma->vm_start;
+	struct sg_page_iter piter;
+	int ret;
 
 	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) == 0)
 		return -EINVAL;
 
-	vma->vm_ops = &udmabuf_vm_ops;
-	vma->vm_private_data = ubuf;
-	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
+	if (!table) {
+		table = get_sg_table(NULL, buf, 0);
+		if (IS_ERR(table))
+			return PTR_ERR(table);
+		ubuf->sg = table;
+	}
+
+	for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
+		struct page *page = sg_page_iter_page(&piter);
+
+		ret = remap_pfn_range(vma, addr, page_to_pfn(page), PAGE_SIZE,
+				      vma->vm_page_prot);
+		if (ret)
+			return ret;
+		addr += PAGE_SIZE;
+		if (addr >= vma->vm_end)
+			return 0;
+	}
+
 	return 0;
 }
 
@@ -126,6 +129,10 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
 		sg_set_folio(sgl, ubuf->folios[i], PAGE_SIZE,
 			     ubuf->offsets[i]);
 
+	// if dev is NULL, no need to sync.
+	if (!dev)
+		return sg;
+
 	ret = dma_map_sgtable(dev, sg, direction, 0);
 	if (ret < 0)
 		goto err_map;
@@ -206,20 +213,21 @@ static int begin_cpu_udmabuf(struct dma_buf *buf,
 {
 	struct udmabuf *ubuf = buf->priv;
 	struct device *dev = ubuf->device->this_device;
-	int ret = 0;
+	struct sg_table *sg;
 
-	if (!ubuf->sg) {
-		ubuf->sg = get_sg_table(dev, buf, direction);
-		if (IS_ERR(ubuf->sg)) {
-			ret = PTR_ERR(ubuf->sg);
-			ubuf->sg = NULL;
-		}
-	} else {
+	if (ubuf->sg) {
 		dma_sync_sg_for_cpu(dev, ubuf->sg->sgl, ubuf->sg->nents,
 				    direction);
+		return 0;
 	}
 
-	return ret;
+	sg = get_sg_table(dev, buf, direction);
+	if (IS_ERR(sg))
+		return PTR_ERR(sg);
+
+	ubuf->sg = sg;
+
+	return 0;
 }
 
 static int end_cpu_udmabuf(struct dma_buf *buf,
-- 
2.45.2

