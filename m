Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA960C90D8D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 05:43:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F4910E767;
	Fri, 28 Nov 2025 04:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hoEeTKwh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010047.outbound.protection.outlook.com
 [40.93.198.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A90610E767
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 04:42:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=liOEc3/yFAzCQqc8263oU0rxVpA9PaKz59fvimEsiUwckvI/f8eVSbYD25os6wYy0SPuARsHHtMu8ZwclUxeukfLuTEksLa6dtLk/onu5j9QJF+X6XSZiZR0iDjpi83NDrd5ZUUt0c0bySCj7Oag7Nk8F1XsYs4qTTxZRRFaMNjIzSB479AR8VgyRUbMavex7QeLUivWPJq2li9DXH1v3ucnrk405+zibAyRS2oFwaKw1RnVVlo/bx9XSDcLYdxi315hzjAH8cAK7on13wWyk+KnGodT33jOm5s1QAFDpQGCsulo6T1ePQp+pEWGhkfvAtQCarGwEguppRPFkM1IGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LrU9ocWwwrvSGqzUbXguGNq3kciL0EoWAWkk9iyHF/w=;
 b=W3+QNcIHQaKkbrxgLHrxw3pdT2ep1MNR+8O2NI4FKyTU3crUwi0gBr76dK61rz2pqy+X6GzWrAsXOEDxmysqqRQbsv90s+anXhI4GdU05JSAnf+UPC/yLl1m2iEBwFPONZbBu1zfG6ara1HE4a6ejQxbRcOO0giC144gdKqZtcwB+bTbS2EE6hZ5ogX4zF5pTrXaSP2gIb3QySapCrqigtjPKdUWmXct925bEfurewRsws2vTSV9f1glChmyHHPVIHLklqCVj+IY5fbeSQHVasP177s/xxHy91x4LbQwQ58tM69zTPRPaI59nqOS7DY6FaqwexAebDFyQ4Ncd05cSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LrU9ocWwwrvSGqzUbXguGNq3kciL0EoWAWkk9iyHF/w=;
 b=hoEeTKwhi+ZOy8fMKDCQvzaOKvu5BoLjTVAx5q4KrN4qc4sPddJ4kPRPXQVSqzol7PJcJm6HsratLjfrRCMSo1EKqmV0ARSCkwDIKWLQ6+hBXbEOOznOzFakUP0uFqtnGpuXdnOxehMxJqnKA0j9aDFW0sNgcYUxOQmo89N20nysBQCkPGY0mhNmlKvmQaHCRLMWFNG2+VjdfSuUJgTBe7pdH75C+tx1D+8u6ufDOz1DOZFz40a33b9WaSAywI24HklCLd6WOrrLe+DH0oP3UD6XpVsfxLsYWUHivZYZIvkiy5mMN/yzVf/99F8+MYoxn7lXfu3xtyVWzngfuwLL2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 MW6PR12MB8735.namprd12.prod.outlook.com (2603:10b6:303:245::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Fri, 28 Nov
 2025 04:42:55 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%3]) with mapi id 15.20.9343.016; Fri, 28 Nov 2025
 04:42:55 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: linux-mm@kvack.org
Cc: balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org
Subject: [RFC PATCH 5/6] mm/util: Add flag to track device private PFNs in
 page snapshots
Date: Fri, 28 Nov 2025 15:41:45 +1100
Message-Id: <20251128044146.80050-6-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251128044146.80050-1-jniethe@nvidia.com>
References: <20251128044146.80050-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::33) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|MW6PR12MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f3c517f-7a5f-4791-92d1-08de2e3898b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0OBbtCyO78GXLuOp2tfydsCo7gv1jNdqrhASUPfuTNeLojTChoHUm9+b9P74?=
 =?us-ascii?Q?0//mjfNqt2XfYzmCHxdq4qlkf4l5J8+ETI+JD4kmKQ/AS35PIoW/X6cEG2Ht?=
 =?us-ascii?Q?EocazXJefPST8WdLvdfCl7ahS50BBdxYASsjf09Q0vxSlrEwOGtq91Wr0ejt?=
 =?us-ascii?Q?qPjuPwuo8lb7zE2pL6N1XUHcwno921f35OFOEw1ymGziOTdEdCmKUN99dRKR?=
 =?us-ascii?Q?lSqmFpMNXu6MDWdqJnMQW29wOGUbyjDh34la3yxBBypYsmDEQqQxXhln1OiM?=
 =?us-ascii?Q?N5XTLRL8Zx4dWQ41hkZGNks457TlupMw3sczD+q11AQ6+eVJgXwkRPoheg4w?=
 =?us-ascii?Q?Wil8wPuUa2cxEDUzGyr3ttm/Sam22N4WyOCdzWqXgW+kqiEhmZzniJCcflyf?=
 =?us-ascii?Q?McEG1clGwkDRH74L3lBJPfDXTvabW1JaMtrU7NxmwrlNR2dL4OerTncQo8cO?=
 =?us-ascii?Q?QC/c6ld+AHC9TSEiGGehRa8TTHbGyzbh0s/ZBn0kVibvrTodU3KggVQggLMA?=
 =?us-ascii?Q?ZVQokh1wy4dZlV0o6S7SZgpRtpOca6UR4NJH4hJ+mcEsVwEfAPzg7iF9xzkO?=
 =?us-ascii?Q?R/PQO8ySXY2EE898WGBaPiCUA7LzclDoQc0Zqadb3TD3AzhpKTFq9BVLzqtx?=
 =?us-ascii?Q?BsA7fpL9+KwmbRt+/E2MHc6uBDhgJe/sspbfJLK+OEDrrKHWbX3a2m2aZeET?=
 =?us-ascii?Q?YvlykMzcgtqVjUWBSEdhS1miRSO1ExxRxSJx7AqDb/qH3W3EA1Pcjen3gXxz?=
 =?us-ascii?Q?k4hZZ4v/C5NgY+pFJiJfJd4sABK4wJtiHTRfS6QG80TFLNCEnloNEzrPEdPR?=
 =?us-ascii?Q?2tNjMHnZ9ErYGYPXvts06BVFl4FSZrWUao5Gc+BciRFUhzYmIAd/blV1KDEP?=
 =?us-ascii?Q?1kxgMOK70DTOc14RhWHifoxbSYgXzJSKZGJ5YSnzev77HJ2jO0PRvm12Jsg2?=
 =?us-ascii?Q?QQJ/RXxZSVyIx8xlsQ5Zy9btwH4Z1MYe6Sb5J48IusdrjhRSSsK37WMsDde+?=
 =?us-ascii?Q?e2llvXUPkozEjX58Kro8Rh4Mh1WOYyNKoCSZYYv9Lk5TS9ug4ecHwL78tPYj?=
 =?us-ascii?Q?p2jy9fhZqhNkLXhZbXM+h4BfcHvnwoHXPdCjmC7IdaOJi1kQWxSa7OSc3AGt?=
 =?us-ascii?Q?5vLCP+Meob7tLfU3ZMrhpjdtRWH5KeL71ugaYZp8z48c+FQ/wPcNt8j0altM?=
 =?us-ascii?Q?t6cN15elzW//Vdz7j0sBhrve3Ex6D2KTpn5k94c2QiJvyDsqp5HARUBm/hkV?=
 =?us-ascii?Q?bE9LBKZPdQW0n3kXB+OZVzZuILnha4VxI4p9ofMwBWlOnerF407XJkRl4OOC?=
 =?us-ascii?Q?NbYvz/lTeZmXmAh9FA/G3c3MEXwtlbllKsEafb9CW2ia2IZg+lWRul5KKW2O?=
 =?us-ascii?Q?saiQw8iW7DLi4cb9nVn5ygxx9UgKGRo5RVijQZIJsjgtfPgamI1V8ggZZ6vb?=
 =?us-ascii?Q?aBUEHS5XDvTFRxHkW4mV3BCoa+cbspvO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SfySAPaI51zkpPYaqnsNpkVSWp/DcdA+euzWt4zvZmMp6kScrT/KoYCstEQ2?=
 =?us-ascii?Q?Yyie+UjgG9dIozJC4zLY0c+V83P9L62J3bF34jVURfL1Q6pn8kf+J0LHmAG7?=
 =?us-ascii?Q?CVEKSkI61Dbx1FYPL/JCfbMTuqB/RdcLB/+haISmlkO7pkjl3jPRHA14fZ7J?=
 =?us-ascii?Q?Xd+aVCdaEC4RS1Qwr65VMVcFCPidu9giEySrC1LoL3tyWHEuCRKlKg/2jYqL?=
 =?us-ascii?Q?KS/J4+stzSk7uZjHyCj2EBmrACXXMbXcwYnxw62DFlU/VZ7feCqf91apDriZ?=
 =?us-ascii?Q?MG+ZipRwV7P7Ntk+6XuNPIn4nRdY83F6t86+71O/Tjb0+MfubHBNyvdWw2io?=
 =?us-ascii?Q?Sg/rteBiJHtGzhlvLuq+MADqN/MNxSxk/DIhhevgKrZYCi5l2c/9f1FrPU8P?=
 =?us-ascii?Q?F+Zs8HxhnmtJ3AnmiLRvUgRmFVaoX3fg82FWZ2hDaBcAJGywUssXCL+UQ9VG?=
 =?us-ascii?Q?DjS1lQ3e6Tujr4iQR6jbNzvDUzl1a9/Hmsc4mfR7AmxOzF7JXOH8UcPSIaWc?=
 =?us-ascii?Q?FMaG6GY23xOOV1+AhgtewOE0DWOIHsgCSMrWfNly/r9yZjvy1NPcJV0vlYH4?=
 =?us-ascii?Q?c+LFlf3oV05P9ELJdbmo1abOGFMZswDHHfkbVXMWIzzwcfliJ9GxNcILSrpd?=
 =?us-ascii?Q?aZ/tmy03LfbM3iBH9P+vEGVtsI044VlkBEd2Yen47xwddyBDR19RsEG/zCzd?=
 =?us-ascii?Q?Vy9n4/+eyv1d6/UGcobkfyF1N7RhoPnd1z8uCKC/CJNKDAFOv8va7w6wyn5u?=
 =?us-ascii?Q?nMn/HPQf4OTWEPyEYYg4ZItUvlhuDdqWn60L2qHoWyUVSa0ZSj1ZT9nHLCGH?=
 =?us-ascii?Q?tbQXZZppIktEkvvrFNo/5Nq3M8fKz1QaSAwpUKrTHn/hq30nPotRZq8jQDjU?=
 =?us-ascii?Q?g4aEdZku6edeiSPGHUAlEKkJK1h1siUNwFLW1SqzttxLKBcL/EA0SfSJr32v?=
 =?us-ascii?Q?YlvVTTbXAv6saQ4dru1+5NlmBaqArkIEIi/IvWAq3v08d2PyYDQ8cpK5ctqz?=
 =?us-ascii?Q?gmz/9tsYvXANCvjs8h6E7/X2K8eUlHqiM2hTp8ekSJeb8Xfxg86OPFxTksHD?=
 =?us-ascii?Q?KahfBg0OCSTyQYVi2az/72E/FedPQAnI6XxGONVS2tJakppMGdfFBdWXiUDv?=
 =?us-ascii?Q?QlNkIIAwthVMPFxyWFeyapupkuU0Nmd3JpZ08r0kYSjaSWOhnnJPWDfu98vQ?=
 =?us-ascii?Q?qsDZHwk57X1T5Ug9Vvuy1Kdtw1rSy7RkMQycnKNNYYEvIHy6LMVdl9fgmlsF?=
 =?us-ascii?Q?Aipl06UorkHqoV17x3f1n72ZR/pYfxLx5Qpb9KjS9h8fRWhvf1XNxxDFlSoa?=
 =?us-ascii?Q?WisBKMtI8BXrxIViAeO7FQY2e3/bd0FwMPCxS7Gbu2sroTUAsj8iBn9YCGqn?=
 =?us-ascii?Q?eRw1O5Vl+RFuvkPMk/CbUt8pGrFyCsXI9AJ7QcBbUZ/FFHylt4kU7/8RAoWJ?=
 =?us-ascii?Q?Ztogf1SkuNfuIAx1m4vcrmRVJYWQ64BMWPrBDjhk7RCIkNWtm17nNr6NRCBi?=
 =?us-ascii?Q?oBtzeaHTrmfWBE8WNhu+srVshM8De3hvYe/3mwjbGoEwQy76gFYfJiddFWRd?=
 =?us-ascii?Q?f0rjU13q3kYBfsk8MwSxW782Jg4ES1fIpL8A1fog?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3c517f-7a5f-4791-92d1-08de2e3898b8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 04:42:54.9559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PjFOLZ8vRVeRfsUGYhbIfwsexPi3m52BTo0cujfTrLzSmMRs9s0gUzCy7jfAaW79a1Kh9PSwRBofiIN09OTyYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8735
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

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have
normal PFN and must be handled separately.

Add a new flag PAGE_SNAPSHOT_DEVICE_PRIVATE to track when the pfn of a
page snapshot is a device private page.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 fs/proc/page.c     | 6 ++++--
 include/linux/mm.h | 7 ++++---
 mm/util.c          | 3 +++
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/fs/proc/page.c b/fs/proc/page.c
index fc64f23e05e5..c3e88a199c19 100644
--- a/fs/proc/page.c
+++ b/fs/proc/page.c
@@ -192,10 +192,12 @@ u64 stable_page_flags(const struct page *page)
 	         folio_test_large_rmappable(folio)) {
 		/* Note: we indicate any THPs here, not just PMD-sized ones */
 		u |= 1 << KPF_THP;
-	} else if (is_huge_zero_pfn(ps.pfn)) {
+	} else if (!(ps.flags & PAGE_SNAPSHOT_DEVICE_PRIVATE) &&
+		   is_huge_zero_pfn(ps.pfn)) {
 		u |= 1 << KPF_ZERO_PAGE;
 		u |= 1 << KPF_THP;
-	} else if (is_zero_pfn(ps.pfn)) {
+	} else if (!(ps.flags & PAGE_SNAPSHOT_DEVICE_PRIVATE)
+		   && is_zero_pfn(ps.pfn)) {
 		u |= 1 << KPF_ZERO_PAGE;
 	}
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7c79b3369b82..6b8c299a6687 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4317,9 +4317,10 @@ static inline bool page_pool_page_is_pp(const struct page *page)
 }
 #endif
 
-#define PAGE_SNAPSHOT_FAITHFUL (1 << 0)
-#define PAGE_SNAPSHOT_PG_BUDDY (1 << 1)
-#define PAGE_SNAPSHOT_PG_IDLE  (1 << 2)
+#define PAGE_SNAPSHOT_FAITHFUL		(1 << 0)
+#define PAGE_SNAPSHOT_PG_BUDDY		(1 << 1)
+#define PAGE_SNAPSHOT_PG_IDLE		(1 << 2)
+#define PAGE_SNAPSHOT_DEVICE_PRIVATE	(1 << 3)
 
 struct page_snapshot {
 	struct folio folio_snapshot;
diff --git a/mm/util.c b/mm/util.c
index 8989d5767528..2472b7381b11 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1215,6 +1215,9 @@ static void set_ps_flags(struct page_snapshot *ps, const struct folio *folio,
 
 	if (folio_test_idle(folio))
 		ps->flags |= PAGE_SNAPSHOT_PG_IDLE;
+
+	if (is_device_private_page(page))
+		ps->flags |= PAGE_SNAPSHOT_DEVICE_PRIVATE;
 }
 
 /**
-- 
2.34.1

