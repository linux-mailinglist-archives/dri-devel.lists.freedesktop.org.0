Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAB9A541CA
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 05:44:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC82C10E8EB;
	Thu,  6 Mar 2025 04:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OfQExJuG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B1E10E8EA;
 Thu,  6 Mar 2025 04:44:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iugMRqL/buU31/Ba0ZBdqWSQdlqGLs1hYkmoBRb+Q4qhuuZ6bYmEL1wZyDnUu7/AO1ZdjcLXazqr9LiMPGAdeZZA1kq4lRdf9jQPqxfmNh09p3BzFIELbD9xiNvIhm6fEGOZWel/Ok2gQpdff+lMmFOjKm6O3XqGeqCP5SY3BHEGeoSDwRiJgqfuJ2gz6WtjKtd5v+I+BpmJr80JcsP7V0EgrPsPeDGTdujNrc+RjbtkD3J4Mw2SuqAGOXCVFgn8c/MiqVPPGKARqvRzFg0qL21d0JskWrS6zhUonW3VZNMa8ef/xqvjeF1QoDoNU3WrpIPGHltV40Sz+9YTi5EoEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGy+kWO+/5WWq70sXD1AWPF0IlIb7r5pajqUEBskhK8=;
 b=sUcqCYsGrc70y8VNlZ32FLBQJ65R9UuqhRhS05GA3OBHsaS/K9aQRnYOGT7SxhlUfoxtnYMVF5DV6acdXw2Tg9NZkpOOUNcX6S8xEwphcP2nSDuunRqJl9bRyRaCcnjD8mBV14N5Q0bddW92N0F+x6B/SHDaBmbddWDxM50cZ8bEanPLA1YH2Q2nwogWjegUynmxm+Oc9sAJH1CsTNJVp+E2NkEVuu43g2jxMJimZRxq/8D1S08XkataPR5IEQq564c9ixsQrOAAE3bW/+YRm6QhV8Ttt98HN3LFD2aYGcyI69U30AWdmi4JerqsKMfvJ1L+yBPXUbnevQxSxd3Q/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGy+kWO+/5WWq70sXD1AWPF0IlIb7r5pajqUEBskhK8=;
 b=OfQExJuG9bIlcYeRC4IC3KX5BhSRw+d08DSTYlWioHfGXv6lH7WfK0mzdaFqNFLR7yGtPtK0v8cswx7IGVEkSsX5P0Gg42Lp7nUKAl6kewUnxTCq31QfKcuVQA1oRTg07ZsP14qMDJntMlluAuqlQ3byRCyBmYRQLtW5Lu+s7xnpSIp8NcrSET3Ru6Cu8tEIOayvXIhmvopxmtO5SVm0B5dvgBW1xv00P1Ghbpc6a+/XximGDCK1UHFjOFEb2DvYIfbSnVwVanDAjVbKtcffz6kvgjLO2sIlowVdoVDI1OCdebr2nIagp4siy6zAa2DSJr6+MHWZO7jsfBm1Ip3Jmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 by SJ0PR12MB5674.namprd12.prod.outlook.com (2603:10b6:a03:42c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 04:44:01 +0000
Received: from SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868]) by SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868%7]) with mapi id 15.20.8489.028; Thu, 6 Mar 2025
 04:44:01 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Balbir Singh <balbirs@nvidia.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>,
 Barry Song <baohua@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>,
 Alistair Popple <apopple@nvidia.com>, Donet Tom <donettom@linux.ibm.com>
Subject: [RFC 08/11] mm/thp: add split during migration support
Date: Thu,  6 Mar 2025 15:42:36 +1100
Message-ID: <20250306044239.3874247-9-balbirs@nvidia.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306044239.3874247-1-balbirs@nvidia.com>
References: <20250306044239.3874247-1-balbirs@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0178.namprd05.prod.outlook.com
 (2603:10b6:a03:339::33) To SA1PR12MB7272.namprd12.prod.outlook.com
 (2603:10b6:806:2b6::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB7272:EE_|SJ0PR12MB5674:EE_
X-MS-Office365-Filtering-Correlation-Id: eedff22d-2a6b-4200-06ad-08dd5c698408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?06fb735tJWCJf76lwuHlyRDJcwg4KGAEE6rtICpSUgbzCIq9iMDAmMPqj/ut?=
 =?us-ascii?Q?hMqrV9VAdSgS8kmBtcwgvhK3EV7/oI6PidO8OnX5b/XEdNYjGvqLhstbvrOb?=
 =?us-ascii?Q?9PQLkSN1xuXaSbfUuSOz3H0OSJKfnP+oY7lztBuFhbGDXIOUp1Ylr7XPTTSk?=
 =?us-ascii?Q?99r6Msxgy5PPrOqxFtG1tO2cHVcK9+MOjQM9D33GyPgwu9/kpWtiTqc7UQan?=
 =?us-ascii?Q?XfmYaghqrogrdrG8CU4XO9szXQ6EEljVSCSN+NNWfTU/jCC2GVlhDjukAayB?=
 =?us-ascii?Q?Os+QaXhQXXs6WMID4+Li5zDYUkezzsFN9rxqRAXoXsDEN7MP3RsCVBaA5RC7?=
 =?us-ascii?Q?cHAKSIWXfuYn+zE/H1mziLfCdelJ4fjlSLZaI3hvvAhXwaTvaAyPLU9wBiqp?=
 =?us-ascii?Q?WyA2SkRJW/xUSQ68WalibH9+H/epV1rE48Wn7/YT0sCcvSUTqu913sDpkUHc?=
 =?us-ascii?Q?OsMemFvXlT0FDN9OE+lMT0YVx3/2iBL20tNKQIAkyBHTxRpBmIqv+yg9nt3Y?=
 =?us-ascii?Q?PAJOaGBKg7XTEcV0Pb6wLW0SFCX3cMofUtdBZ+WqfpkLiVe2PPq8dFqce05q?=
 =?us-ascii?Q?GHYNK1Swy1l/eaDR1yvXY1qEDwOIEfNEHdK67Ul8yvEcS3AzO8l0kDvNnFUq?=
 =?us-ascii?Q?yAabi0c4FHKnwrYnKCtkVf4yYi7qCO1cdnXK4tLCJjFun1+lXVsRBAGTkh/y?=
 =?us-ascii?Q?K5JYNRMhkPU2TPnFfXk/1gvzWvTm+prAAu+RQm/T/oebQMxE9weApYE/3LXo?=
 =?us-ascii?Q?kc+hs3PT1UXupC4NonldXHYOFAajyvzpCINvCdRmY9U+N8ROnie5hfkDdg4A?=
 =?us-ascii?Q?+BDUaBG2gMjmXYaC+oV12oe6ScFIi47iHw0AImx69EM8tXhzAf4VACIG/8uE?=
 =?us-ascii?Q?mnrq5S3yibC++XoZfOVnX7HFSTPAYr+rtvRRdA5iCwHqLKhqzVR6fI1pisS2?=
 =?us-ascii?Q?GKZa3VJJTRq3GBrBB4aG7zcBub5wbxcX6voMz2/8lGGSrLfc/dPKAtcByarL?=
 =?us-ascii?Q?InzCuNdTXT4+keQDJY10vAQp6zcjSuXV3cCxTShToYwjwBHDsTpvUqQR8gzP?=
 =?us-ascii?Q?bgSM7ygmSY1bUav1/bo57gry4FrditS3aibWX8lZ8ZT/ZPSsLf05CmfOA0At?=
 =?us-ascii?Q?W2Tk0ePBPl+0MsvFDyGhLeHoOCpVQo4wn0y5U0+puoTaREK/Sozc7sovXw4t?=
 =?us-ascii?Q?nr8SpGNJQSfcxh1valyPcG7E7CuPeGNnVW+qdFhyWvWaVvA2+xKwYaIiRhiz?=
 =?us-ascii?Q?0cGVy3Jq1UrTE7eOoZLGDTVGO4r42fzszKEOKGz7B4ISyMpcvmSS2zxiUnUF?=
 =?us-ascii?Q?05be4Upm3ik/GRzLTYpIkq4thA5PHLWUqvtvLjnZxxaLuhjG3kz2rDmQCu6i?=
 =?us-ascii?Q?BH762N6lr6bpAOn2kpyFa7uplQRb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB7272.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eM75303JCVeCpAENpMqFMpvyEz/QjuhbmYLvDJqpb71zQDtnGqveHi1RSY+9?=
 =?us-ascii?Q?OxhYSUZwu6l26KI/tliuxDDpGq2Mfq05ImoVp0Fbp2S6TutO0AhnmClqGnws?=
 =?us-ascii?Q?tYjiYPDF6nfQt4vpUoE9v9Kho4SvQvvB1sOEQkIAykKlyc56EY0TZ5LDWFkU?=
 =?us-ascii?Q?QLqBbSSF0+95zGRVCP5zgkCmBb8SnV7VIrxyXkq/+P/uRqdzCOXvsCUdSXQs?=
 =?us-ascii?Q?Ym+PvMuHz+USG9U54XjYDV9V30TZMWkn7778+vOOksOcsj7+9oQPePWU1KrZ?=
 =?us-ascii?Q?IuE/PjpL9+XBO+fGNaavag3LFUStjQ+gynTerRNVyegwJBvEAVz80SGNuy/2?=
 =?us-ascii?Q?JMbcb+kttrR8k1E4z7XycWrGlf/71MvLeBLa+22zhg76NZTUO7Ja6hyLx1f7?=
 =?us-ascii?Q?/PTbJXp0B0XBqexOQ1bSzZyJnC77CI/bWKJGKuQ4sMPO+4EaUfgRqZ3rzjun?=
 =?us-ascii?Q?f4E0fD/dPffE7Ii5lvwEjaYzIZshUrod7moWsWNQCCQBDoxuG5mGwsH2QTrS?=
 =?us-ascii?Q?Po90EOhLmbWP7M9PODH7ll0MXMk9sEuYmjW5tEhVaP7n4E6ODe425Ngrap4S?=
 =?us-ascii?Q?Nk/pyZ/l5lksVpqSJDRkOvFKH3Z3nKx3sHKvXzOpk9H2YpsI4xtTK+SvfKpz?=
 =?us-ascii?Q?Hrp+qeOj1onUl9eyoyohIuUdw+PuPtHEdrp4+Kl52jCDR95dRsrxEuJLFuKU?=
 =?us-ascii?Q?XZm4ETpV5PFqjYDiiQH0R2/9jBvn6NsPH8cvEJzWkolCXUXj0JfHHnghq3Xf?=
 =?us-ascii?Q?KykNTI3lJkcNFqliO2KP7xu4ZCARGsva8skgY/bxcA++NKsfkZo3jwQSrvFe?=
 =?us-ascii?Q?/ve2q9tqRg2ALCu15U85yh7J3I8M60g8KXhkI6mke+VXDtH98t+q8DDtlL+z?=
 =?us-ascii?Q?DQWyYL7BiO5X0SQfIcdzoHOjbolM25/+lp5yJQtPWh5K6LJNpefGmBNzwNFo?=
 =?us-ascii?Q?ug3dA7Z/bljalrEMwsAkMbSYyIM1MONaCysbfntuajxGyfczFA42QW9yWcTO?=
 =?us-ascii?Q?vq37pWmz6rh7Br8cxZyJlNO3Af4brGtzAwVkmsEaxNZx2BTRllD4lb8Z6yx9?=
 =?us-ascii?Q?Ls0FKMlcLMOoQVoRLcTxspgp9dvi3BIhj3CIbOrjvE3ONC8LgUcBOkE3Bu6q?=
 =?us-ascii?Q?SAtRsHYLrEyvos4h3JQoO0++1UwZ16efotVzHPKf1T7f03MDqBLdOXJxinC8?=
 =?us-ascii?Q?1uZgFWNJgpWdLSpGwmOX3uE2m+EjaEmzX1JHjhInUsHQMUKzZFB+iXi6zb5s?=
 =?us-ascii?Q?rclm33GB/sldPpj6W5/wg1trXge9ZmzqkWqBTKhj5y6zDG5CokkcBw5WM15/?=
 =?us-ascii?Q?FyuMNG53p9QGFt+5ZrGGOFpM4VSPv/Glih47aiWr0iOYufxVoWGA6QEAmvKg?=
 =?us-ascii?Q?Y9hHzRnU8bsf8N3AtN/TUwsS08886M3K+O8JzNDYAoTpKls8DD0tgQlOUFOT?=
 =?us-ascii?Q?zqMn95Rm3e/yXrJ5/9aTLRZhr/S7lh5+VmU0kbjO92VjFIjjFrxySEIQJMCD?=
 =?us-ascii?Q?R7eXeUlQP2YGfL/Tdtqtz5wmm4h+MkPIIjFWzYNxQxwiUQ1FkufBtOMnvWW0?=
 =?us-ascii?Q?FowWUHwOxZbRl2LR/G6yVunqERoYNXQMWTgVTghG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eedff22d-2a6b-4200-06ad-08dd5c698408
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 04:44:01.4399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0MbRQgtWKv/jC77MS/D3O6GRWHtIJeqJT5xiUmahFu5GzPVf4jFHgSnuTA63RK2RArls+3vjJKLtbv9OkHX4Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5674
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

Support splitting pages during THP zone device migration as needed.
The common case that arises is that after setup, during migrate
the destination might not be able to allocate MIGRATE_PFN_COMPOUND
pages.

Add a new routine migrate_vma_split_pages() to support the splitting
of already isolated pages. The pages being migrated are already unmapped
and marked for migration during setup (via unmap). folio_split() and
__split_unmapped_folio() take additional isolated arguments, to avoid
unmapping and remaping these pages and unlocking/putting the folio.

Since unmap/remap is avoided in these code paths, an extra reference
count is added to the split folio pages, which will be dropped in
the finalize phase.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 include/linux/huge_mm.h | 11 ++++++--
 mm/huge_memory.c        | 53 +++++++++++++++++++++++++-----------
 mm/migrate_device.c     | 60 ++++++++++++++++++++++++++++++++---------
 3 files changed, 94 insertions(+), 30 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index ad0c0ccfcbc2..abb8debfb362 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -341,8 +341,8 @@ unsigned long thp_get_unmapped_area_vmflags(struct file *filp, unsigned long add
 		vm_flags_t vm_flags);
 
 bool can_split_folio(struct folio *folio, int caller_pins, int *pextra_pins);
-int split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
-		unsigned int new_order);
+int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
+		unsigned int new_order, bool isolated);
 int min_order_for_split(struct folio *folio);
 int split_folio_to_list(struct folio *folio, struct list_head *list);
 bool uniform_split_supported(struct folio *folio, unsigned int new_order,
@@ -351,6 +351,13 @@ bool non_uniform_split_supported(struct folio *folio, unsigned int new_order,
 		bool warns);
 int folio_split(struct folio *folio, unsigned int new_order, struct page *page,
 		struct list_head *list);
+
+static inline int split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
+		unsigned int new_order)
+{
+	return __split_huge_page_to_list_to_order(page, list, new_order, false);
+}
+
 /*
  * try_folio_split - try to split a @folio at @page using non uniform split.
  * @folio: folio to be split
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 518a70d1b58a..1a6f0e70acee 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3544,7 +3544,7 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
 		struct page *split_at, struct page *lock_at,
 		struct list_head *list, pgoff_t end,
 		struct xa_state *xas, struct address_space *mapping,
-		bool uniform_split)
+		bool uniform_split, bool isolated)
 {
 	struct lruvec *lruvec;
 	struct address_space *swap_cache = NULL;
@@ -3586,6 +3586,7 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
 		int old_order = folio_order(folio);
 		struct folio *release;
 		struct folio *end_folio = folio_next(folio);
+		int extra_count = 1;
 
 		/* order-1 anonymous folio is not supported */
 		if (folio_test_anon(folio) && split_order == 1)
@@ -3629,6 +3630,14 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
 		__split_folio_to_order(folio, old_order, split_order);
 
 after_split:
+		/*
+		 * When a folio is isolated, the split folios will
+		 * not go through unmap/remap, so add the extra
+		 * count here
+		 */
+		if (isolated)
+			extra_count++;
+
 		/*
 		 * Iterate through after-split folios and perform related
 		 * operations. But in buddy allocator like split, the folio
@@ -3665,7 +3674,7 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
 			 * page cache.
 			 */
 			folio_ref_unfreeze(release,
-				1 + ((!folio_test_anon(origin_folio) ||
+				extra_count + ((!folio_test_anon(origin_folio) ||
 				     folio_test_swapcache(origin_folio)) ?
 					     folio_nr_pages(release) : 0));
 
@@ -3676,7 +3685,7 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
 			if (release == origin_folio)
 				continue;
 
-			if (!folio_is_device_private(origin_folio))
+			if (!isolated && !folio_is_device_private(origin_folio))
 				lru_add_page_tail(origin_folio, &release->page,
 							lruvec, list);
 
@@ -3714,6 +3723,12 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
 	if (nr_dropped)
 		shmem_uncharge(mapping->host, nr_dropped);
 
+	/*
+	 * Don't remap and unlock isolated folios
+	 */
+	if (isolated)
+		return ret;
+
 	remap_page(origin_folio, 1 << order,
 			folio_test_anon(origin_folio) ?
 				RMP_USE_SHARED_ZEROPAGE : 0);
@@ -3808,6 +3823,7 @@ bool uniform_split_supported(struct folio *folio, unsigned int new_order,
  * @lock_at: a page within @folio to be left locked to caller
  * @list: after-split folios will be put on it if non NULL
  * @uniform_split: perform uniform split or not (non-uniform split)
+ * @isolated: The pages are already unmapped
  *
  * It calls __split_unmapped_folio() to perform uniform and non-uniform split.
  * It is in charge of checking whether the split is supported or not and
@@ -3818,7 +3834,7 @@ bool uniform_split_supported(struct folio *folio, unsigned int new_order,
  */
 static int __folio_split(struct folio *folio, unsigned int new_order,
 		struct page *split_at, struct page *lock_at,
-		struct list_head *list, bool uniform_split)
+		struct list_head *list, bool uniform_split, bool isolated)
 {
 	struct deferred_split *ds_queue = get_deferred_split_queue(folio);
 	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
@@ -3864,14 +3880,16 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 		 * is taken to serialise against parallel split or collapse
 		 * operations.
 		 */
-		anon_vma = folio_get_anon_vma(folio);
-		if (!anon_vma) {
-			ret = -EBUSY;
-			goto out;
+		if (!isolated) {
+			anon_vma = folio_get_anon_vma(folio);
+			if (!anon_vma) {
+				ret = -EBUSY;
+				goto out;
+			}
+			anon_vma_lock_write(anon_vma);
 		}
 		end = -1;
 		mapping = NULL;
-		anon_vma_lock_write(anon_vma);
 	} else {
 		unsigned int min_order;
 		gfp_t gfp;
@@ -3933,7 +3951,8 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 		goto out_unlock;
 	}
 
-	unmap_folio(folio);
+	if (!isolated)
+		unmap_folio(folio);
 
 	/* block interrupt reentry in xa_lock and spinlock */
 	local_irq_disable();
@@ -3986,14 +4005,15 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
 
 		ret = __split_unmapped_folio(folio, new_order,
 				split_at, lock_at, list, end, &xas, mapping,
-				uniform_split);
+				uniform_split, isolated);
 	} else {
 		spin_unlock(&ds_queue->split_queue_lock);
 fail:
 		if (mapping)
 			xas_unlock(&xas);
 		local_irq_enable();
-		remap_page(folio, folio_nr_pages(folio), 0);
+		if (!isolated)
+			remap_page(folio, folio_nr_pages(folio), 0);
 		ret = -EAGAIN;
 	}
 
@@ -4059,12 +4079,13 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
  * Returns -EINVAL when trying to split to an order that is incompatible
  * with the folio. Splitting to order 0 is compatible with all folios.
  */
-int split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
-				     unsigned int new_order)
+int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
+				     unsigned int new_order, bool isolated)
 {
 	struct folio *folio = page_folio(page);
 
-	return __folio_split(folio, new_order, &folio->page, page, list, true);
+	return __folio_split(folio, new_order, &folio->page, page, list, true,
+				isolated);
 }
 
 /*
@@ -4093,7 +4114,7 @@ int folio_split(struct folio *folio, unsigned int new_order,
 		struct page *split_at, struct list_head *list)
 {
 	return __folio_split(folio, new_order, split_at, &folio->page, list,
-			false);
+			false, false);
 }
 
 int min_order_for_split(struct folio *folio)
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index f3fff5d705bd..e4510bb86b3c 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -804,6 +804,24 @@ static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
 		src[i] &= ~MIGRATE_PFN_MIGRATE;
 	return 0;
 }
+
+static void migrate_vma_split_pages(struct migrate_vma *migrate,
+					unsigned long idx, unsigned long addr,
+					struct folio *folio)
+{
+	unsigned long i;
+	unsigned long pfn;
+	unsigned long flags;
+
+	folio_get(folio);
+	split_huge_pmd_address(migrate->vma, addr, true, folio);
+	__split_huge_page_to_list_to_order(folio_page(folio, 0), NULL, 0, true);
+	migrate->src[idx] &= ~MIGRATE_PFN_COMPOUND;
+	flags = migrate->src[idx] & ((1UL << MIGRATE_PFN_SHIFT) - 1);
+	pfn = migrate->src[idx] >> MIGRATE_PFN_SHIFT;
+	for (i = 1; i < HPAGE_PMD_NR; i++)
+		migrate->src[i+idx] = migrate_pfn(pfn + i) | flags;
+}
 #else /* !CONFIG_ARCH_ENABLE_THP_MIGRATION */
 static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
 					 unsigned long addr,
@@ -813,6 +831,11 @@ static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
 {
 	return 0;
 }
+
+static void migrate_vma_split_pages(struct migrate_vma *migrate,
+					unsigned long idx, unsigned long addr,
+					struct folio *folio)
+{}
 #endif
 
 /*
@@ -962,8 +985,9 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 				struct migrate_vma *migrate)
 {
 	struct mmu_notifier_range range;
-	unsigned long i;
+	unsigned long i, j;
 	bool notified = false;
+	unsigned long addr;
 
 	for (i = 0; i < npages; ) {
 		struct page *newpage = migrate_pfn_to_page(dst_pfns[i]);
@@ -1005,12 +1029,16 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 				(!(dst_pfns[i] & MIGRATE_PFN_COMPOUND))) {
 				nr = HPAGE_PMD_NR;
 				src_pfns[i] &= ~MIGRATE_PFN_COMPOUND;
-				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
-				goto next;
+			} else {
+				nr = 1;
 			}
 
-			migrate_vma_insert_page(migrate, addr, &dst_pfns[i],
-						&src_pfns[i]);
+			for (j = 0; j < nr && i + j < npages; j++) {
+				src_pfns[i+j] |= MIGRATE_PFN_MIGRATE;
+				migrate_vma_insert_page(migrate,
+					addr + j * PAGE_SIZE,
+					&dst_pfns[i+j], &src_pfns[i+j]);
+			}
 			goto next;
 		}
 
@@ -1032,7 +1060,10 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 							 MIGRATE_PFN_COMPOUND);
 					goto next;
 				}
-				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
+				nr = 1 << folio_order(folio);
+				addr = migrate->start + i * PAGE_SIZE;
+				migrate_vma_split_pages(migrate, i, addr, folio);
+				extra_cnt++;
 			} else if ((src_pfns[i] & MIGRATE_PFN_MIGRATE) &&
 				(dst_pfns[i] & MIGRATE_PFN_COMPOUND) &&
 				!(src_pfns[i] & MIGRATE_PFN_COMPOUND)) {
@@ -1067,12 +1098,17 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 		BUG_ON(folio_test_writeback(folio));
 
 		if (migrate && migrate->fault_page == page)
-			extra_cnt = 1;
-		r = folio_migrate_mapping(mapping, newfolio, folio, extra_cnt);
-		if (r != MIGRATEPAGE_SUCCESS)
-			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
-		else
-			folio_migrate_flags(newfolio, folio);
+			extra_cnt++;
+		for (j = 0; j < nr && i + j < npages; j++) {
+			folio = page_folio(migrate_pfn_to_page(src_pfns[i+j]));
+			newfolio = page_folio(migrate_pfn_to_page(dst_pfns[i+j]));
+
+			r = folio_migrate_mapping(mapping, newfolio, folio, extra_cnt);
+			if (r != MIGRATEPAGE_SUCCESS)
+				src_pfns[i+j] &= ~MIGRATE_PFN_MIGRATE;
+			else
+				folio_migrate_flags(newfolio, folio);
+		}
 next:
 		i += nr;
 	}
-- 
2.48.1

