Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9440D576EB7
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2718F10EF63;
	Sat, 16 Jul 2022 14:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2058.outbound.protection.outlook.com [40.107.101.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE68F10E06A;
 Fri, 15 Jul 2022 15:05:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DjhifKcBytrYgzZC9z/PUvajTeF8ZJTx3USW5CxBCkwBFMl0kchC3/Q9wdO7h+mmQUPHTc5iA2oGM6OqHI9hgYb4xHwDu/ZjyWAXv2UwOYTUwa1RPEovAwlhY+kBZ4gCLa/eeGIK3KPdVmUDGAG5nSW5EPkKIFFKRzrpYhRZZYhAnQYU/x3IuOTdJjvOqQw8Bf9YM62PqYe8rJ8o4E3Gh/HLPirsKdcu/fTjGwr4MGdS0UXYP6b6Lst9ghyebFSq/dca/KmLXys5/rWHY1yLPqcbk9/w91zqxZPe4DqdjPdvG6gdt3d4+7DYlG2snXoPBW8f4NO6A6Vql6ENMlBuyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5n2hQHCIkvFC4l9d3FiHxLrUEGiyzBAfhaflBazYrk4=;
 b=Q4ev6KTCOzDqR5wMunHxb6HKudoE/nAf1zROqcwgg+TEh+yhTXrby9PkrnKOws1FpBMxxZu5R8y6eWhAloyI+UfMs4J/QD+TdUykCynQuinnoEGGxCI6uE3syPcfYXE8W0ZyHupGIOAQBSnm+iwmCdvpNqoQig+yQDO5Idas1MJxywj/a5PcSxrmt4WyHH0JGONXwljrSxBTCAHgFb+3EZOXaVnSD1eXQaLvXX6J0xkp+ODj5dymBKcOuyGdCShCmxqhfgcRMVY2rUB4rIlWr5eHZiYwgWFn10BBWxMBaAS1jlolF/PC4kOO8/RHXIpforW0izI/2kbWnSJ4eOmLbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5n2hQHCIkvFC4l9d3FiHxLrUEGiyzBAfhaflBazYrk4=;
 b=MvNk0p4ohFoKQQ/xf+9KVsUYBpKrBMh3havX+JDoXMAqm9LSszf9a3N+J+0br5PYLd57FqlWa5Cmd+gJ1sD+nACjnXLfHO0QZsJoNQgKzGLag9jJe+LvOR+DfZ6+s6vBxIze11zcbeSGoXUDS0/b11pgJTp3bLMa0Ho2HUjpHds=
Received: from DS7P222CA0028.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::21) by
 DM5PR12MB1516.namprd12.prod.outlook.com (2603:10b6:4:5::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.14; Fri, 15 Jul 2022 15:05:37 +0000
Received: from DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::2d) by DS7P222CA0028.outlook.office365.com
 (2603:10b6:8:2e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17 via Frontend
 Transport; Fri, 15 Jul 2022 15:05:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT045.mail.protection.outlook.com (10.13.173.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5438.12 via Frontend Transport; Fri, 15 Jul 2022 15:05:36 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 15 Jul
 2022 10:05:34 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v9 01/14] mm: rename is_pinnable_pages to
 is_longterm_pinnable_pages
Date: Fri, 15 Jul 2022 10:05:08 -0500
Message-ID: <20220715150521.18165-2-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220715150521.18165-1-alex.sierra@amd.com>
References: <20220715150521.18165-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63b1943f-f149-4519-0855-08da66737961
X-MS-TrafficTypeDiagnostic: DM5PR12MB1516:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wahF/034h1E+EVpWojE1N11gIsqSWW4I559ZJiotBt34DNL1VuQckJeTvHEZuOp0pouTOX3tgU9c4rPcfL6sc2yiMJvaJvdvkzXiqtIzIoSGs7zhBxdwaLWfqLtnNG55LM+bGw5CqXA7AoOojrTzit+14krCsKpF2TY9Wo9LNs0mRGwXztrkJmIGoDDCXn0dBaRJZc5Hpscrr91n9QPANZ8g1SdHMjm6rEXJkZqgQEK14aihX587+a27lT8+BymeIdLI24yIe6eXMx+rQwbNPbMTbO8G0OgiY63wY2Q4GYaeKQ7MrSjfob700US8e62JaJuKx6subZWRzHj9ph8V+9sIBJ1bM7jq4c9tyfqoH09Q2bQZ5qCz8/I87yrGsL2wNWPdBRlLxrDpcDQs8OexJGsVk7CD7U4J3uyCjL69x+K07Jp48z90vjmL5t2ZcpwB6UX4h+zl81MjBji3+2GUCJ2mapY1b2YfP6AtMIgskjI/5cf5E3cJLCvAK1be2AKIXr7MPuvxdjIngXltPyrycW/PtLYvV+vrUKtoCBNh4RBZY1HMY29sPYYWBGFuVmzFuLxvfkKWpy0bD/fp1NA1Vwjj526hc77mvqQsr4/IaFVYC91YWAgvRa6gw7iffRE+9c30Eo2sgRfvjAp3rc+hz/gZvPUe7lw86uzlH3e1E/kOrFwutBk8qv350z2UD8lpROZWcDLvO/OFKhUk6gKRmeGPEhAZ+AiyqgFjucdNvgp24O82F9uxsPyavAfYyEYfilNf0JnAnURVD8YMcru4m1hT2j7O714iAzOaGcvXy8P2LlmyyT5XewNthAlqH0zT80pD80x1JXBm06oa9TzNJL0s3kYoOQ4XXXG6zvQyI3A=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(376002)(136003)(346002)(46966006)(36840700001)(40470700004)(316002)(26005)(2616005)(54906003)(41300700001)(478600001)(6916009)(7696005)(82310400005)(86362001)(6666004)(40480700001)(81166007)(82740400003)(40460700003)(356005)(16526019)(426003)(2906002)(44832011)(186003)(47076005)(36756003)(7416002)(5660300002)(1076003)(70206006)(336012)(36860700001)(8676002)(4326008)(70586007)(83380400001)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 15:05:36.9083 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b1943f-f149-4519-0855-08da66737961
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1516
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
Cc: rcampbell@nvidia.com, willy@infradead.org, david@redhat.com,
 Felix.Kuehling@amd.com, apopple@nvidia.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

is_pinnable_page() and folio_is_pinnable() were renamed to
is_longterm_pinnable_page() and folio_is_longterm_pinnable()
respectively. These functions are used in the FOLL_LONGTERM flag
context.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h | 8 ++++----
 mm/gup.c           | 4 ++--
 mm/gup_test.c      | 2 +-
 mm/hugetlb.c       | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index cf3d0d673f6b..3b31b33bd5be 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1592,7 +1592,7 @@ static inline bool page_needs_cow_for_dma(struct vm_area_struct *vma,
 
 /* MIGRATE_CMA and ZONE_MOVABLE do not allow pin pages */
 #ifdef CONFIG_MIGRATION
-static inline bool is_pinnable_page(struct page *page)
+static inline bool is_longterm_pinnable_page(struct page *page)
 {
 #ifdef CONFIG_CMA
 	int mt = get_pageblock_migratetype(page);
@@ -1603,15 +1603,15 @@ static inline bool is_pinnable_page(struct page *page)
 	return !is_zone_movable_page(page) || is_zero_pfn(page_to_pfn(page));
 }
 #else
-static inline bool is_pinnable_page(struct page *page)
+static inline bool is_longterm_pinnable_page(struct page *page)
 {
 	return true;
 }
 #endif
 
-static inline bool folio_is_pinnable(struct folio *folio)
+static inline bool folio_is_longterm_pinnable(struct folio *folio)
 {
-	return is_pinnable_page(&folio->page);
+	return is_longterm_pinnable_page(&folio->page);
 }
 
 static inline void set_page_zone(struct page *page, enum zone_type zone)
diff --git a/mm/gup.c b/mm/gup.c
index 551264407624..b65fe8bf5af4 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -133,7 +133,7 @@ struct folio *try_grab_folio(struct page *page, int refs, unsigned int flags)
 		 * path.
 		 */
 		if (unlikely((flags & FOLL_LONGTERM) &&
-			     !is_pinnable_page(page)))
+			     !is_longterm_pinnable_page(page)))
 			return NULL;
 
 		/*
@@ -1891,7 +1891,7 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 			continue;
 		prev_folio = folio;
 
-		if (folio_is_pinnable(folio))
+		if (folio_is_longterm_pinnable(folio))
 			continue;
 
 		/*
diff --git a/mm/gup_test.c b/mm/gup_test.c
index d974dec19e1c..12b0a91767d3 100644
--- a/mm/gup_test.c
+++ b/mm/gup_test.c
@@ -53,7 +53,7 @@ static void verify_dma_pinned(unsigned int cmd, struct page **pages,
 				dump_page(page, "gup_test failure");
 				break;
 			} else if (cmd == PIN_LONGTERM_BENCHMARK &&
-				WARN(!is_pinnable_page(page),
+				WARN(!is_longterm_pinnable_page(page),
 				     "pages[%lu] is NOT pinnable but pinned\n",
 				     i)) {
 				dump_page(page, "gup_test failure");
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index a57e1be41401..368fd33787b0 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1135,7 +1135,7 @@ static struct page *dequeue_huge_page_node_exact(struct hstate *h, int nid)
 
 	lockdep_assert_held(&hugetlb_lock);
 	list_for_each_entry(page, &h->hugepage_freelists[nid], lru) {
-		if (pin && !is_pinnable_page(page))
+		if (pin && !is_longterm_pinnable_page(page))
 			continue;
 
 		if (PageHWPoison(page))
-- 
2.32.0

