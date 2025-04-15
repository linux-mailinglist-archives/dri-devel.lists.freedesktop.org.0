Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 294D2A89275
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 05:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83BCF10E348;
	Tue, 15 Apr 2025 03:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="dfP5pM9T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from HK3PR03CU002.outbound.protection.outlook.com
 (mail-eastasiaazon11011006.outbound.protection.outlook.com [52.101.129.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3454210E06C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 03:16:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjqaUSMsLb7lTj2OQoD9SJvgPaTL2uvWA8k06XkqWejwwVGYj1Cr8NHjzlGNDgf73e+xOI5odWHngmN9BaqFiMuq7ltWwYxMxwYoW2Y4MH83sZKKOyF0R5SfJi7vB/kYUWUU4oOInV2eKbgftqH5qPyLB9WrGt+u8dChORgrrT+3K8LTni9OJjwPIh7eJAeBhcxh6liRkYxPSpsW3COXX1vPca8Ej6nUChumNKOsSNVp0uSV8xqslGI8S5xJguNxX+Af2fT5PA7SBFsYJgn6fUebtPLNtjPueUn+eHeNQwaAFLN4fpMD8Wc2PhLotx6i2O6jskjGJjVgg1Pf4EAPLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSdLx0BpWL99zVzJkVDz1FFSYefU5daZGEPmgB3lQ9U=;
 b=B8NpFVAKsqj1+30rHtH4SKFWXkocfjr+oyhPUdyo6ewigl9huWmsf6LokVI2jKLekp4o7QCmelHZORE41Yi7UMM/608QDBAbO/LJtEdg0p/JbR12LHflciV2p7XKh1E0aBzUVPGYVbRsvR4hTyOjmHdNNw6TQFSvvTTsZ+sAguBwQko5yxobg2KyluJnDrWpuVE0K+prFJsxVzB4vP6Kw6LL5rbViS3M89rp5v/m/UetGXMDj1xiK2rXQYe7ouY4+G0I/uhUidv5az9cunv+IlDqwAP7Uo7bjY/RLG2gc0KHENNtSDOh+S7kcOh6z5Rivy064QBCAZ2cJCm7vOj6fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSdLx0BpWL99zVzJkVDz1FFSYefU5daZGEPmgB3lQ9U=;
 b=dfP5pM9Tht9t8Kkw6GZRHhtKqRwwcyNbZ5fjh439pnlHFYOD1/mDbmex7kMndiwU3SBqKoLJGSfHtKA6VvHkzhbD+gi+bddF7Tdy53tPqcai5R8RVdMaFSYvQhki+hi7CutnYMJmUNVr0WYyCrywk0Ow34mN1muA4vSzJCK4bkQZ2bnX3uzsNQSi7ZS/Z5XtQyAF4Zj2TohJ8JcT/1rXw5jwv4qsrJGLBLNDD3/CIkLz7aNr8YI6KdM+wKwcX7zbEL3y0qvVIBudU83y2TcnAp4vJpv9OE0CFAeB436uroJLuWeOOVEEun+Kuikzw4Hz3bDDEg5CS+77B2r8pbV1eQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TY0PR06MB4984.apcprd06.prod.outlook.com (2603:1096:400:1ac::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Tue, 15 Apr
 2025 03:16:22 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.8632.036; Tue, 15 Apr 2025
 03:16:22 +0000
From: Huan Yang <link@vivo.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dave Airlie <airlied@redhat.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com, Huan Yang <link@vivo.com>,
 Bingbu Cao <bingbu.cao@linux.intel.com>
Subject: [PATCH 1/2] Revert "udmabuf: fix vmap_udmabuf error page set"
Date: Tue, 15 Apr 2025 11:15:46 +0800
Message-ID: <20250415031548.2007942-2-link@vivo.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250415031548.2007942-1-link@vivo.com>
References: <20250415031548.2007942-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::14) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TY0PR06MB4984:EE_
X-MS-Office365-Filtering-Correlation-Id: be6d0497-bedb-439d-4084-08dd7bcbe5e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+JRzARHhy9Auk9jH7WmpYJ1Kv9dWEpx9/Flm1C5kmB2pTQj5foWkJipgAXpp?=
 =?us-ascii?Q?T8Ne4IPWUfO8b/I0q+li0WlEisGusBgyGXebGhdm3YqznOG5nkYM4O6WFyTq?=
 =?us-ascii?Q?ZQPEDaE9Yaz3YMkFuYPQoIqeB+9NvJbeVdzLBvjx8d8FZM4BsdEjRQEzm3kM?=
 =?us-ascii?Q?85tu7dD9fpEyQ9DKyQK90mWDpZi9GMDT3xbAE1/c3/Fjg1FOIA4vKEOwUgB5?=
 =?us-ascii?Q?nDhuqS42HFg6nX7EdWQipKDDabhmyuJYJLsQA1AH+cI7+WeYd9twIZfvx9ob?=
 =?us-ascii?Q?Nc8UnKdHN3W2VPZARcAeelNQh+r8kJ1STvfd7oVQ4xj1MtWpbvBomvLk6Ij5?=
 =?us-ascii?Q?0Ru9gxX/oKmU8ysfWvKipeFq7JnYzfvMoZ6YQB2GIJLeAfT02Ys72zUzVeAV?=
 =?us-ascii?Q?b/PCrooR/WDqF2SQH2CyeZjneHZsrDREfsZi7Q9ZSUCdd8jC686EIlLik2l5?=
 =?us-ascii?Q?XDWNmFDHJMLueiakszRIgPBl/zS8W/bnxNOMFHEoBAEGZJhCLJ6JAQOyunH2?=
 =?us-ascii?Q?TOUECifQztyqppP8imDTkq3hH2KnyRms+Hlo/Tg/tYEWd0uH3Vjo8N8sXgb7?=
 =?us-ascii?Q?EXOfuPAtXM+1TNWnk2xVLTfzYEkR1dEAeDmShuBegC8OvaIRPpCu0bbuZRke?=
 =?us-ascii?Q?Y2+F9DT0NMQoZ3uluOiMevW5mbeZdToSl5BF9fNsADVz3PrM28f07hkuadIi?=
 =?us-ascii?Q?q0tZMyTYkcL+2ttb4TilEE3EeYQNTCZgwXwvHTFzLsIMUwtnj+t7B1w/JqRC?=
 =?us-ascii?Q?u7OP/yXbFY0XAL8cYfxKT4ufsUqkm/hkgUIZBXH9COVwBnNBDKEPlmr1gwIz?=
 =?us-ascii?Q?ZphgGrBfU+j5mWszRCFc0ExWQhHFmZsJ/b6TDXajjtVEgsWUH9tuJZlegjpV?=
 =?us-ascii?Q?5tfySbbCPXIJQ3GBaDORBlTCDuxajbG1oKckqU/coDm+p6U1PohFd3JMd1TP?=
 =?us-ascii?Q?/EcGmFtz4ZA8fVFzvqgsMBYj9F71riObT8RXW39eg23k50kMTYrxu/+ZQpUM?=
 =?us-ascii?Q?taJLRvZueg252keFLH5dSW/KESMkEv+ZsTA/a+C1q1FGL0wmjrMlebd6W+Z0?=
 =?us-ascii?Q?mHucgjObrhR8KiewFeRQ8yZ6pcqKp4/MO8kHkkv0hv1lgAu9qjA29BAOm7po?=
 =?us-ascii?Q?re3oEO53GChToJlfwx2TE5yurqAqXJFAhGEYfNhJ528/srYNRvdQw5L2EfQg?=
 =?us-ascii?Q?cUpab6eM8hrLZfZ15BYHXFzqiWsRDtl2cJ6XGMi70JYOy8OpJW15wTQD0bPP?=
 =?us-ascii?Q?wRud6nAOBb0wB5vnN6l6IWaYY6QnME73thkjZcRx+nm++C77WcE4CpAeF+Bh?=
 =?us-ascii?Q?vFiHCbP9fcumClj97yKevsnWoI3dPm2ifoY/bMSMAzVU4wUD968TUCvg75bp?=
 =?us-ascii?Q?rSNTXDIfBOWW27/49FJtBedhdZCfJi+NUoCwtTVFinZ1OjNNQ7k4P5FP7xjx?=
 =?us-ascii?Q?dkG3CmPwc6JL+qG9a2nfuyU/+uSbInlp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bj6yUm/OOmZuWbBLG/jTIV9+F1aFNIkvU++eiimxUHJex47cR45QrBW8nFUu?=
 =?us-ascii?Q?CNY8WfZSsykpVxQxlaGslClvxc2rAJZw8RKqipOei+UMKJQaCslCWq99IMSc?=
 =?us-ascii?Q?njQfqza/WL/Qr/x1m3HHOuIlgx4k9yPjhi/sMW8kNKWCCgVMwxwChEuU3rMY?=
 =?us-ascii?Q?ux+kH+kbrPr3AM+eD67nnidHFiS11msuxOfapE1McU+HNGB1a3sdGi9sJ7Sh?=
 =?us-ascii?Q?5+gdkM/5ktjL/fbCoSix2lmPM+XNGWBxx1/3tUnhwXuOXNEQbWQnizJxYuQq?=
 =?us-ascii?Q?SThwFPDRZfRNLxik/lanS7Gp7n/auDx6+oT5IxPHE3hcBd9bzK9VZErM86Yn?=
 =?us-ascii?Q?I24WasfsyfupZ8A7CttuYFjwlmA+prLtU7VriW/p6kHa//zZpfzZF/Yo7wht?=
 =?us-ascii?Q?C0B7JJTVBlTVokRxJlj8WGALaii+6tNSzbCj0nVWrrlcx/RqpcXbUgCIg1Lc?=
 =?us-ascii?Q?GOg1Hggd6yaGrrqaXU+L8hnTIq7y9i4Fg4rNkyhvzZuDxbbJtjnQgJaL6lYb?=
 =?us-ascii?Q?kSJkgiU03omQpJK1pRkkw1bhsjCHbBLsLKWonVGH+K7T6DKzIvjtVpUGvXDs?=
 =?us-ascii?Q?I4CeySN1ee3rWdxm1ZuIfTqpxPhvxwA7Wh8mcOChbTLms2ofFoLJHJyN2wnl?=
 =?us-ascii?Q?VuEJeZ19Lh/DxKoSvq6poKr9HXdZwmptJeaxSQVUkl6YMPc/CCKajYJyg/Oy?=
 =?us-ascii?Q?Jrkor1cZcJPuAd1apjZJrTrjGvlFY9hpE7UzvTi0uAKIhSpxhKUYI0QsZ8AU?=
 =?us-ascii?Q?Sh5npkJcLSC+JcVidWodp7acvyWzrBvoOD9ZOHspdzgzmbDCGDdjPzlSLvUv?=
 =?us-ascii?Q?gR7/rZrK2b52U9Oomt29V1KoKIz2PQ8h9lZlBreAZd8L9dweJHaepY678Rbl?=
 =?us-ascii?Q?hClSil7Bekc9a1ik28zYwVY7VjT23+f12LRRKBdMQJN4Vttbk7wA8TXJ9skF?=
 =?us-ascii?Q?AY3JMKIZzJonJEl1yd1c+jkZs+PkZOUv5qz1wXEBdagR4qAZ/U6b3LkU30Fq?=
 =?us-ascii?Q?f5m/hljQdFzPCftM/3i+LU3MVQ/vG7JF+bsXNsegtfXu2cRRwnYT77h7i/iq?=
 =?us-ascii?Q?r3pbwVtEmaxmWcH0ctehm01tJrNl5teFOMFORuOIio+ouseqYMXCP576t6yd?=
 =?us-ascii?Q?dMvnpDHyuq4bvDx1eQt0eaT7hCuI18iTDLW1lOMLTeeIfLVcdx24RVYKxpLZ?=
 =?us-ascii?Q?quV0vFJXG/QFA6oT3Tpxq/uGslr4OusmKtKqgRBVeMSKHH/+yJT3ANStx12U?=
 =?us-ascii?Q?7erozeEbOnuR0z4ha+uICCy4xdP9SYaMxr3qEIVCNsMJ8q/v9UbQElOxp3+y?=
 =?us-ascii?Q?TNehnUwFZKIgFYdM70iv74Z5EGEtf8YgBEbCaOne4L/o9kaWOIkGUzPmW0nC?=
 =?us-ascii?Q?co0p1DAVd5S6Hu4nj21EOvt/06oW/h+DTGPBQJ7gCJSN7OIfvT5fLBOvr4vf?=
 =?us-ascii?Q?1/ACGEfCFTsqhtZzIt25yjoVXmRdP44RX7oIGCn5W/x5DM8YUMKjTmSLhLnt?=
 =?us-ascii?Q?Uh3IemPlJI+EUZMnbwYpN92GS1UOSTCxdV8L9M5D2GCvnDI/T+cqGGncBx+k?=
 =?us-ascii?Q?T5FIiCOCiRQgEiPkkQa31643GkTzB7nqhjs9oWZW?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be6d0497-bedb-439d-4084-08dd7bcbe5e9
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 03:16:22.3968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vwf2WDr+FA3nxQed5GdGO9z1TzlWS42kKGd+yYQ/nVnz23g/hf0ba7SYrOBVjsC4340WkXwCcjfxHLjpIzbkbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB4984
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

This reverts commit 18d7de823b7150344d242c3677e65d68c5271b04.

This given a misuse of vmap_pfn, vmap_pfn only allow none-page based
user invoke, i.e. PCIe BARs and other.

Signed-off-by: Huan Yang <link@vivo.com>
Reported-by: Bingbu Cao <bingbu.cao@linux.intel.com>
Closes: https://lore.kernel.org/dri-devel/eb7e0137-3508-4287-98c4-816c5fd98e10@vivo.com/T/#mbda4f64a3532b32e061f4e8763bc8e307bea3ca8
---
 drivers/dma-buf/Kconfig   |  1 -
 drivers/dma-buf/udmabuf.c | 22 +++++++---------------
 2 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index fee04fdb0822..b46eb8a552d7 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -36,7 +36,6 @@ config UDMABUF
 	depends on DMA_SHARED_BUFFER
 	depends on MEMFD_CREATE || COMPILE_TEST
 	depends on MMU
-	select VMAP_PFN
 	help
 	  A driver to let userspace turn memfd regions into dma-bufs.
 	  Qemu can use this to create host dmabufs for guest framebuffers.
diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 7eee3eb47a8e..79845565089d 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -109,29 +109,21 @@ static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
 static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 {
 	struct udmabuf *ubuf = buf->priv;
-	unsigned long *pfns;
+	struct page **pages;
 	void *vaddr;
 	pgoff_t pg;
 
 	dma_resv_assert_held(buf->resv);
 
-	/**
-	 * HVO may free tail pages, so just use pfn to map each folio
-	 * into vmalloc area.
-	 */
-	pfns = kvmalloc_array(ubuf->pagecount, sizeof(*pfns), GFP_KERNEL);
-	if (!pfns)
+	pages = kvmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
+	if (!pages)
 		return -ENOMEM;
 
-	for (pg = 0; pg < ubuf->pagecount; pg++) {
-		unsigned long pfn = folio_pfn(ubuf->folios[pg]);
-
-		pfn += ubuf->offsets[pg] >> PAGE_SHIFT;
-		pfns[pg] = pfn;
-	}
+	for (pg = 0; pg < ubuf->pagecount; pg++)
+		pages[pg] = &ubuf->folios[pg]->page;
 
-	vaddr = vmap_pfn(pfns, ubuf->pagecount, PAGE_KERNEL);
-	kvfree(pfns);
+	vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
+	kvfree(pages);
 	if (!vaddr)
 		return -EINVAL;
 
-- 
2.48.1

