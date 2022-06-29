Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A9155F45C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 05:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B35211BF84;
	Wed, 29 Jun 2022 03:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2074.outbound.protection.outlook.com [40.107.102.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D4B11BCFD;
 Wed, 29 Jun 2022 03:55:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKOuhVNMP13J2M4EYH6C1FCYe6XvV3RBieRmuMKKrQCtik9WFRpOcnjfVhfi3MI/1VZCoP20Fpepn08/eeacr0vUpVXXYq7fbCW9uUKkw59ZYNAXOUVTs0m+TQ7mrvazIGVsNOWZskNC6+wZX3blRnFwvYIJWxl7+7eALj3Nnafn/uUM1R4Bj19L+KEbvQDXkwo7B71bZtPfg48ZqmilYCvZrsz1d5EH+VQWFitn7Byzddf258PqzBGiiSdlvvvbpeF2w6XcQEdpBQRdbhiRLGpOl9MzmHedcX5+7vDyFdvTkQR+5mCyXPbbmCreYXW9czMi6O9BTJAosvl4J17Ilw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJzmZxI7ylEoisFZmRRKonx1JB2nnvTpdQNYsE2eN2Q=;
 b=V0tU/4+YSSGUaJc5X6MzI+LASwldtCaX5qajf33NJnuB5EABqBFiQXeMdNEeFcwg6rqn+Q6aAPePiT2aq+GU7WLti4FBb0kNBMI/rMOyRz7pKIVP8fiSPgkohz6XjG9PN3pkdSLKFsiLOjsYeWkOeqgua3+nLWx5DBqb9a1Wm5RX2DJMORrtXaaKHC8f7uan+VdDh/zrIw8FbH9uHjC9dNujcyPt6NUr5KdW9UUPTPh+0Yl3zsJ+7WwHmwYI9TxBHa7ObPJPUK1at4hYxvn2C4yiLqsqHFMbzSnHQH4rI2TrI1BNycSPed+Kssd/aJcEODHUqMj0rQpu84KF2g8uBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJzmZxI7ylEoisFZmRRKonx1JB2nnvTpdQNYsE2eN2Q=;
 b=xl8dTtyUyCRF4pyhSIffdb2n3Y10WZZMAlX4845wqP098+RJYFgPVs4M0enlPa75EFTsqkC4TPnKUOpPMtidrn/NKjLMcXahW9fQ4+WETzT46XG+Rf5p3H/sb6klPhXP2tLJOzFKbKdnEGeFg1B4yzbp8D4yItYbqYgQCGQDKis=
Received: from DM6PR07CA0127.namprd07.prod.outlook.com (2603:10b6:5:330::28)
 by MWHPR12MB1805.namprd12.prod.outlook.com (2603:10b6:300:106::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 03:55:06 +0000
Received: from DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:330:cafe::6a) by DM6PR07CA0127.outlook.office365.com
 (2603:10b6:5:330::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Wed, 29 Jun 2022 03:55:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT045.mail.protection.outlook.com (10.13.173.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 03:55:05 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 28 Jun
 2022 22:55:04 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v7 01/14] mm: rename is_pinnable_pages to
 is_pinnable_longterm_pages
Date: Tue, 28 Jun 2022 22:54:13 -0500
Message-ID: <20220629035426.20013-2-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220629035426.20013-1-alex.sierra@amd.com>
References: <20220629035426.20013-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f018e977-73f1-4d1e-30ad-08da59832730
X-MS-TrafficTypeDiagnostic: MWHPR12MB1805:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X/tUujtEKGc6byh5EB20H/Ke8ACN5RAX1FuDsfiOtOkqcflQAThGNKfC43uXs4fd5MAu6iPLy299w981r3ZpWdsXce0rpGUjmDX7sARx+H6mqtyIZgYWlLK6x7VogQDRzSaY+JM9LhHmyE8XZsv3MlYtBMIpbg1A3vDjFIz1Z0IWjdrf7Q3zPYfPKjEyXmufa3P/mj/tPfozPc2Tsii3mrsNQgIvAAbfD1iKMZSUwb0XRwx917lt0JMiurqtPgpWqCBoXyt1IlVCUDHoRWbFCvL/EKj26yiReg8gm2JJgDs/ngOVAaFRAgj6GD4Zqi/EH5M+wY9cMdBqDLXx8zIYB6k/wFpRt58BZ/14UdNkTlAsx4zv8xjRXPcsVXsDoBOmafi/hQJjPE3qtOQiRCinySg8kZRqIyagcPbiFPqzH3ChkAQG1WuJe7jv+PcdVXIH910E5PDirHtnNnioIPzQZMg5d3A6ZIZKUOsCprfaAbR/k4L5cgMw+goYnECTdwlAFaScExVnvfMLOyCVNpfBARYpRLxg4OPJWXmKUU0jCHeZ28RYP/bBdQx/5VCEWt4vsokt/DCNCo4YGY6/NafQzeLtV0GOHsHizZxylydUoVhz+YNZbzfQB3cYDU3iCOjHUFV70W38XjCeOuqeZcI4fYZG4DjXV+qXrznVG1wC4IX9zjZhljuoAvfPmM4zH7hPfhNyiVZrLglgxc+Ejw/1Aj4DAni975QCxxq18eME64xXB6Zvn8cacsxEHCGpgysSrYNZSrX1kxdYkHJZvCTBTGjQU/SyQ5rR+uo9UVwARD0q/UF5nudQGLdPyhVpXj7fv0nBudhjw0QIT0Ccg6cFRg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(346002)(136003)(39860400002)(36840700001)(46966006)(40470700004)(8936002)(16526019)(40460700003)(2906002)(70206006)(478600001)(8676002)(4326008)(36756003)(316002)(82310400005)(36860700001)(82740400003)(54906003)(356005)(186003)(6916009)(70586007)(40480700001)(7696005)(5660300002)(41300700001)(2616005)(426003)(1076003)(6666004)(7416002)(83380400001)(86362001)(336012)(44832011)(26005)(47076005)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 03:55:05.8466 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f018e977-73f1-4d1e-30ad-08da59832730
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1805
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
---
 include/linux/memremap.h | 24 ++++++++++++++++++++++++
 include/linux/mm.h       | 24 ------------------------
 mm/gup.c                 |  4 ++--
 mm/gup_test.c            |  4 ++--
 mm/hugetlb.c             |  2 +-
 5 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 8af304f6b504..c272bd0af3c1 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -150,6 +150,30 @@ static inline bool is_pci_p2pdma_page(const struct page *page)
 		page->pgmap->type == MEMORY_DEVICE_PCI_P2PDMA;
 }
 
+/* MIGRATE_CMA and ZONE_MOVABLE do not allow pin pages */
+#ifdef CONFIG_MIGRATION
+static inline bool is_longterm_pinnable_page(struct page *page)
+{
+#ifdef CONFIG_CMA
+	int mt = get_pageblock_migratetype(page);
+
+	if (mt == MIGRATE_CMA || mt == MIGRATE_ISOLATE)
+		return false;
+#endif
+	return !(is_zone_movable_page(page) ||
+		 is_zero_pfn(page_to_pfn(page)));
+}
+#else
+static inline bool is_longterm_pinnable_page(struct page *page)
+{
+	return true;
+}
+#endif
+static inline bool folio_is_longterm_pinnable(struct folio *folio)
+{
+	return is_longterm_pinnable_page(&folio->page);
+}
+
 #ifdef CONFIG_ZONE_DEVICE
 void *memremap_pages(struct dev_pagemap *pgmap, int nid);
 void memunmap_pages(struct dev_pagemap *pgmap);
diff --git a/include/linux/mm.h b/include/linux/mm.h
index cf3d0d673f6b..bc0f201a4cff 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1590,30 +1590,6 @@ static inline bool page_needs_cow_for_dma(struct vm_area_struct *vma,
 	return page_maybe_dma_pinned(page);
 }
 
-/* MIGRATE_CMA and ZONE_MOVABLE do not allow pin pages */
-#ifdef CONFIG_MIGRATION
-static inline bool is_pinnable_page(struct page *page)
-{
-#ifdef CONFIG_CMA
-	int mt = get_pageblock_migratetype(page);
-
-	if (mt == MIGRATE_CMA || mt == MIGRATE_ISOLATE)
-		return false;
-#endif
-	return !is_zone_movable_page(page) || is_zero_pfn(page_to_pfn(page));
-}
-#else
-static inline bool is_pinnable_page(struct page *page)
-{
-	return true;
-}
-#endif
-
-static inline bool folio_is_pinnable(struct folio *folio)
-{
-	return is_pinnable_page(&folio->page);
-}
-
 static inline void set_page_zone(struct page *page, enum zone_type zone)
 {
 	page->flags &= ~(ZONES_MASK << ZONES_PGSHIFT);
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
index d974dec19e1c..9d705ba6737e 100644
--- a/mm/gup_test.c
+++ b/mm/gup_test.c
@@ -1,5 +1,5 @@
 #include <linux/kernel.h>
-#include <linux/mm.h>
+#include <linux/memremap.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/ktime.h>
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

