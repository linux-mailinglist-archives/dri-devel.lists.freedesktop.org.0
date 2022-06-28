Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8666655BCA3
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 02:15:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB8D10E6F2;
	Tue, 28 Jun 2022 00:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8BA10E611;
 Tue, 28 Jun 2022 00:15:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BD2EQOcjfcS8lK/SsKTwyY2tYKtELO+gdLHjyqPKx3e/jtF50bV+qyTbmRqqNI1PZuFTC+C1mnDnzcJSa6jp5GJQryBJgkgLm7ZDdyKosmKlPkGErinv5TWDnThLWz4+cetBg/QbdxJYURhoQckfq54F+LB/ywwxAVgsJq7Wu5fl9R2unnLUPEwpDg7JvX5u5tjj71g8iP0XMbAKzStCiMrBGb3jHwysjg+V2GIYcaf6R2gV+xIH4BHD37EoA06KkF83sqPD9BEo5taPIWPqDEFhEgfYu55CopOEMZba9+AWnpK82pTdp3ermq6PgMO+KO4H8vuD3KkvfcGghrX9zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOc606mfE+GTytdQbIdWily1XFcltRIawMZTJWDA8VM=;
 b=WM3sNLWrpXgvH3IRMnTsskjSUBF5J7V3QGqzlRM9tPV5xWDA4jf9uMaDirE0BMLiIq5AK1XCnD/rllUJgkwTQVd6Igcgu0TDG1j+yojssDWNdo4P70PaNxX/UQfBXCjdzkm1pRN47IgorE2emwYNicqX9m5+NFa3EoiZj4gfbz2qn+qyjd7NrYRuMiUfA9r50jjFi7iYj0HjqfNKzbPYtw8IKb7YqWqD+OH5ksIM/p5SwjQrw8JQukoNBZN6vxohkhH2yviXotOHKs1chM5Kv1rjn5MXddaqthpNHRxjhXy2e6X/nSaiRLWBtSCFvo3zL7DWh5rNVcGeyVd805md6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOc606mfE+GTytdQbIdWily1XFcltRIawMZTJWDA8VM=;
 b=uLGB7Sgr+3/FiBtGe1XlinL2uqhInwwb/LgZ5OwrYCOKzG1+BGB29aGMLP0M480j3wiYeIRflV36rykle7DBNtRk1CBzJX3X0cmMX69/B8BcuobrYOzF9nz4zG7s0N3x0+CWTrD9tdw58AkUOP+hnCfWCs5rHzrMhL7up9tPP0o=
Received: from MW4PR03CA0175.namprd03.prod.outlook.com (2603:10b6:303:8d::30)
 by BN6PR12MB1939.namprd12.prod.outlook.com (2603:10b6:404:107::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Tue, 28 Jun
 2022 00:15:26 +0000
Received: from CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8d:cafe::e7) by MW4PR03CA0175.outlook.office365.com
 (2603:10b6:303:8d::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17 via Frontend
 Transport; Tue, 28 Jun 2022 00:15:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT057.mail.protection.outlook.com (10.13.174.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Tue, 28 Jun 2022 00:15:25 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 27 Jun
 2022 19:15:23 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v6 06/14] mm: add device coherent checker to is_pinnable_page
Date: Mon, 27 Jun 2022 19:14:46 -0500
Message-ID: <20220628001454.3503-7-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220628001454.3503-1-alex.sierra@amd.com>
References: <20220628001454.3503-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28e050aa-050a-4656-c2ad-08da589b4cec
X-MS-TrafficTypeDiagnostic: BN6PR12MB1939:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fHZjme3QrUcv8uzFpdg09GbLsXhCf8XpwTTGz+lSfL5mBDMfbiJziO9+gJ9kQu91U8WXFlNDphnL48xvIYQ7Q9TJWpGYvNv8woAOwyDWuxKLiJ7XhnwYfAuB/NkCP+Hm5zy/oIaBy+9kHeWg+EmmZw76Tix81sjnAERo2Lc4OtfnA1VWAYzk8eFhTi+P9ns0RgJtPneZs0ojJRKwiLQSC9VtC5NfKpYYUVlB5ApfC49/eGAwZaFpFUGW+SUj4PM3yNU+iC5njnLh1QDIdXVBvL1Cn5CnHaktFvqQMILHIsGhXekqiL8HaV1TXh93hRYW6BMmcvjpDQHxUDGT5eThKz9PXg16Vxf35h8gXU8fwDN9udzjcMCyel6TMrxaX69qh3r4NTG7yH3pLRHLmvU0xzCCxsqvqIS14ma2VLZDJxk/0qp4ecAvYnZZ157KhQ0Skp1jslft0+zNNpz9XVArSLGjapQeZRWc5533rNm9fwzoY0vl03IxS3nP8+SA3Y4X057/5MjVB0rqMDXHg5FuS7boD/6VBb07Pi6Gd8BXc36/UNuqjOPn5QRlzTk+hNSerjs+G/kGvCMUH5i1EJrwmUfTZxiPRTK0+9YRVONy1qFmGLosVBfiSDM9BrilI6cT1uTOSAwlpn56xD1BF5gEy0LDXkmYxZX6LUhINYHM6B1L6cXHyI6mfAFYp1wFMJBJvdcfo4/Ua2Ip2CHBZgkxIguCLxzvD4nMPfEZf/qqP3sMkUEb0J7wNVkmDq9JYbrQZkRnB/IrQ0yNl7BpumNQ4pXyCl+R8qDHqnr24shvkt0YbziiKaF3z14Uw1mTGeWwXiDXtcal7A9TDz0Qy0hlKw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(396003)(39860400002)(136003)(40470700004)(46966006)(36840700001)(426003)(336012)(6916009)(2906002)(47076005)(36756003)(54906003)(316002)(36860700001)(2616005)(16526019)(4326008)(40480700001)(40460700003)(478600001)(83380400001)(1076003)(6666004)(70586007)(8936002)(186003)(70206006)(8676002)(41300700001)(86362001)(5660300002)(7416002)(81166007)(26005)(82740400003)(82310400005)(7696005)(44832011)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 00:15:25.8387 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28e050aa-050a-4656-c2ad-08da589b4cec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1939
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

is_device_coherent checker was added to is_pinnable_page and renamed
to is_longterm_pinnable_page. The reason is that device coherent
pages are not supported for longterm pinning.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 include/linux/memremap.h | 25 +++++++++++++++++++++++++
 include/linux/mm.h       | 24 ------------------------
 mm/gup.c                 |  5 ++---
 mm/gup_test.c            |  4 ++--
 mm/hugetlb.c             |  2 +-
 5 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 9f752ebed613..6fc0ced64b2d 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -169,6 +169,31 @@ static inline bool is_pci_p2pdma_page(const struct page *page)
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
+	return !(is_device_coherent_page(page) ||
+		 is_zone_movable_page(page) ||
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
index f6f5d48c1934..b91a4a1f260b 100644
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
index c29a7b5fbbfd..ada73b775a82 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -133,8 +133,7 @@ struct folio *try_grab_folio(struct page *page, int refs, unsigned int flags)
 		 * path.
 		 */
 		if (unlikely((flags & FOLL_LONGTERM) &&
-			     (!is_pinnable_page(page) ||
-			     is_device_coherent_page(page))))
+			    !is_longterm_pinnable_page(page)))
 			return NULL;
 
 		/*
@@ -1931,7 +1930,7 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
 			continue;
 		}
 
-		if (folio_is_pinnable(folio))
+		if (folio_is_longterm_pinnable(folio))
 			continue;
 		/*
 		 * Try to move out any movable page before pinning the range.
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

