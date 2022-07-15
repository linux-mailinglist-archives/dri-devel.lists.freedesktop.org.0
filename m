Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 977F3576EE0
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBE610E420;
	Sat, 16 Jul 2022 14:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE6510E06A;
 Fri, 15 Jul 2022 15:05:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TXXdYX2eriNb55shXXzSGEHiPqiXGxz76ofmliLPwflr2903fY1DtjwIN8e+UoVE6cL0R08+oJ1bnTLvlwOCVIOUJXkxa9yumeesW1ZTPLnrvJJ6P2XDKTNpJvJTvds/ttacGg4O6vEysLnnJlsZ4yJ8XTLBsMWnOFUDcPKWk27JAwvOjP2o7+DhmMkX5Fl4SLxHOPZhEe8h1O+JwrAc5/xiI9vYvPLeiW0xLozGDOliwYFKvi4TQjmhICfXr/uCcXQO9XJDCQ1y7s5Ks+gW8yIUkjDKew3mwLJRUxb6on1b3vrFUzwcIU5pPf8MWnGHDC3vTs/EazgF8CVKVa8Aww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBW4h10J7XAhyaHtTT9wydlVynoCzg0kQPS8qrn77OY=;
 b=LhKmQqhgrofkxInd6wbdfoYSpAZCldKTh8iO42EQ0mspGKMEPdf/UObWnlZMFN0DJSEUFr7miEZbu7dXAVvyepC/nm95CD3ZgsUD3/7DMQXiSHtV9qUkmy6SpF+lLS6+sQy7k63SHZfUXqnJnebWvFtvvrJJGx2Lhd5FcVwfPiNPPPeyqRVIyRDAVkxAgrYEW/XI5mxlCBMu6PomCoMXA6vT2PGfCiJFvu0J5mdiatVoJTJgaXuDn7AgRC+2zS2R+WiQj9UQHphzMR4tQFMG0BTPs5sf3KJxyyxQzWnpoaXHrFz0D7ZPOybI84vaEeoenc/Ek6baKyJDHHCxuuqlZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBW4h10J7XAhyaHtTT9wydlVynoCzg0kQPS8qrn77OY=;
 b=Gq7PmTRmVDY902OOCG3pY2cyHCh7da5Bojw9mPrxdbaGAPyZ/Gk5QQ2Z6/yOfIZzXHp5MntfNR2VLVtDn7rb5tmpM1PVJOzwtBD3Lkfy/eGa1ajeq6wRw/xBoPMMRODXJjKt7VjbrTdoz6jhe9WpuyTmucLekC76L1UUjUgphlM=
Received: from DS7P222CA0030.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::10) by
 MN2PR12MB3583.namprd12.prod.outlook.com (2603:10b6:208:c5::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.14; Fri, 15 Jul 2022 15:05:38 +0000
Received: from DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::6b) by DS7P222CA0030.outlook.office365.com
 (2603:10b6:8:2e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12 via Frontend
 Transport; Fri, 15 Jul 2022 15:05:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT045.mail.protection.outlook.com (10.13.173.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5438.12 via Frontend Transport; Fri, 15 Jul 2022 15:05:38 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 15 Jul
 2022 10:05:36 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v9 02/14] mm: move page zone helpers from mm.h to mmzone.h
Date: Fri, 15 Jul 2022 10:05:09 -0500
Message-ID: <20220715150521.18165-3-alex.sierra@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7e364758-2e71-473d-3470-08da66737a54
X-MS-TrafficTypeDiagnostic: MN2PR12MB3583:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zsQRNsqTIe04LCmYdaYqn0qITXKzgZoJxoOuUCmNAR7poOdEEqqqs7UkNGAgdHe58liRuC48ake0poPBiLTQalgvC4ZQ+ZZKe+NQwvTdovS/0u7Uq4Pf5F8/BYzappJLC6XUnFiTgB1QqyCghVOulDicO+LhgQ6iLq/kK+zHdiDo4hCxvJq1B0ixom1TvE05Nl/hpZqyJZB8Dz0BJUck3TdD1Bs6xcksBQEzUvayMl8AsBhZXnxt7tkZnu9tcMvfrMJfiCj4sbPYqbS1f0AhO5gGbPaXk6e8CmavCYFZDfHwwpujvqeT+5B42B2Elc9n1JZEwUQTRiA1G8YYgmi7TNUQGtmQfLD/JVkxWSggA4pfXyZYud5tGchfOrdHTS9QiWwpO0UpxaLQnJc+A2xSP5n8V+lG5ZbOJeIB+dm7VvGgbaZBaEWCguim1bDebCeX0QO/LcgSVXzhbzICFelHeaKkHMVxrKdyORyZ/Mcl4KRlbmrjf4E21Dot2ymmevPfbWIZJhlItDsud/Y7HeYLzq6B+drFIzq3qfzlUh+OhsYbxval/u/FIPplRPGIinaiIStdZG9IARy9XvzUTgYPfinMnSqqG/WC5ova0gwzYkcCKtj53I6joT34OXMUf+rIpgsxlrf152LUN19NjwP0iK+JY1DXnlm0/acHycW9bg9lEWlIgqv4KOkcadt80OiMpcOAb0U6B62bGSHvym0GDEEiAiSwkM3YCtIA6jSd7wCh69Sj0+CxhHN2cw0Zpmpo9DZQ76RhKeBv2gXT7uL38G1YMbKSjY8Nhn53goJ6aiCw6+xTMwGRb4ktGFkf9H5rjJgauBCSqqC+snWf9bGBJdir+rDL7AZcKRL942cJnQ4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(396003)(346002)(39860400002)(136003)(40470700004)(36840700001)(46966006)(5660300002)(44832011)(2906002)(7416002)(82310400005)(40480700001)(8936002)(4326008)(8676002)(70206006)(70586007)(316002)(54906003)(6916009)(40460700003)(36756003)(86362001)(478600001)(6666004)(186003)(81166007)(426003)(16526019)(336012)(41300700001)(356005)(47076005)(1076003)(2616005)(83380400001)(36860700001)(26005)(7696005)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 15:05:38.4863 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e364758-2e71-473d-3470-08da66737a54
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3583
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

[WHY]
It makes more sense to have these helpers in zone specific header
file, rather than the generic mm.h

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 include/linux/memremap.h |  2 +-
 include/linux/mm.h       | 78 ---------------------------------------
 include/linux/mmzone.h   | 80 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 81 insertions(+), 79 deletions(-)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 8af304f6b504..77229165c914 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -2,7 +2,7 @@
 #ifndef _LINUX_MEMREMAP_H_
 #define _LINUX_MEMREMAP_H_
 
-#include <linux/mm.h>
+#include <linux/mmzone.h>
 #include <linux/range.h>
 #include <linux/ioport.h>
 #include <linux/percpu-refcount.h>
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 3b31b33bd5be..2df8c2b98d36 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1049,84 +1049,6 @@ vm_fault_t finish_mkwrite_fault(struct vm_fault *vmf);
  *   back into memory.
  */
 
-/*
- * The zone field is never updated after free_area_init_core()
- * sets it, so none of the operations on it need to be atomic.
- */
-
-/* Page flags: | [SECTION] | [NODE] | ZONE | [LAST_CPUPID] | ... | FLAGS | */
-#define SECTIONS_PGOFF		((sizeof(unsigned long)*8) - SECTIONS_WIDTH)
-#define NODES_PGOFF		(SECTIONS_PGOFF - NODES_WIDTH)
-#define ZONES_PGOFF		(NODES_PGOFF - ZONES_WIDTH)
-#define LAST_CPUPID_PGOFF	(ZONES_PGOFF - LAST_CPUPID_WIDTH)
-#define KASAN_TAG_PGOFF		(LAST_CPUPID_PGOFF - KASAN_TAG_WIDTH)
-
-/*
- * Define the bit shifts to access each section.  For non-existent
- * sections we define the shift as 0; that plus a 0 mask ensures
- * the compiler will optimise away reference to them.
- */
-#define SECTIONS_PGSHIFT	(SECTIONS_PGOFF * (SECTIONS_WIDTH != 0))
-#define NODES_PGSHIFT		(NODES_PGOFF * (NODES_WIDTH != 0))
-#define ZONES_PGSHIFT		(ZONES_PGOFF * (ZONES_WIDTH != 0))
-#define LAST_CPUPID_PGSHIFT	(LAST_CPUPID_PGOFF * (LAST_CPUPID_WIDTH != 0))
-#define KASAN_TAG_PGSHIFT	(KASAN_TAG_PGOFF * (KASAN_TAG_WIDTH != 0))
-
-/* NODE:ZONE or SECTION:ZONE is used to ID a zone for the buddy allocator */
-#ifdef NODE_NOT_IN_PAGE_FLAGS
-#define ZONEID_SHIFT		(SECTIONS_SHIFT + ZONES_SHIFT)
-#define ZONEID_PGOFF		((SECTIONS_PGOFF < ZONES_PGOFF)? \
-						SECTIONS_PGOFF : ZONES_PGOFF)
-#else
-#define ZONEID_SHIFT		(NODES_SHIFT + ZONES_SHIFT)
-#define ZONEID_PGOFF		((NODES_PGOFF < ZONES_PGOFF)? \
-						NODES_PGOFF : ZONES_PGOFF)
-#endif
-
-#define ZONEID_PGSHIFT		(ZONEID_PGOFF * (ZONEID_SHIFT != 0))
-
-#define ZONES_MASK		((1UL << ZONES_WIDTH) - 1)
-#define NODES_MASK		((1UL << NODES_WIDTH) - 1)
-#define SECTIONS_MASK		((1UL << SECTIONS_WIDTH) - 1)
-#define LAST_CPUPID_MASK	((1UL << LAST_CPUPID_SHIFT) - 1)
-#define KASAN_TAG_MASK		((1UL << KASAN_TAG_WIDTH) - 1)
-#define ZONEID_MASK		((1UL << ZONEID_SHIFT) - 1)
-
-static inline enum zone_type page_zonenum(const struct page *page)
-{
-	ASSERT_EXCLUSIVE_BITS(page->flags, ZONES_MASK << ZONES_PGSHIFT);
-	return (page->flags >> ZONES_PGSHIFT) & ZONES_MASK;
-}
-
-static inline enum zone_type folio_zonenum(const struct folio *folio)
-{
-	return page_zonenum(&folio->page);
-}
-
-#ifdef CONFIG_ZONE_DEVICE
-static inline bool is_zone_device_page(const struct page *page)
-{
-	return page_zonenum(page) == ZONE_DEVICE;
-}
-extern void memmap_init_zone_device(struct zone *, unsigned long,
-				    unsigned long, struct dev_pagemap *);
-#else
-static inline bool is_zone_device_page(const struct page *page)
-{
-	return false;
-}
-#endif
-
-static inline bool folio_is_zone_device(const struct folio *folio)
-{
-	return is_zone_device_page(&folio->page);
-}
-
-static inline bool is_zone_movable_page(const struct page *page)
-{
-	return page_zonenum(page) == ZONE_MOVABLE;
-}
-
 #if defined(CONFIG_ZONE_DEVICE) && defined(CONFIG_FS_DAX)
 DECLARE_STATIC_KEY_FALSE(devmap_managed_key);
 
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index aab70355d64f..47fc41f43c48 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -730,6 +730,86 @@ static inline bool zone_is_empty(struct zone *zone)
 	return zone->spanned_pages == 0;
 }
 
+#ifndef BUILD_VDSO32_64
+/*
+ * The zone field is never updated after free_area_init_core()
+ * sets it, so none of the operations on it need to be atomic.
+ */
+
+/* Page flags: | [SECTION] | [NODE] | ZONE | [LAST_CPUPID] | ... | FLAGS | */
+#define SECTIONS_PGOFF		((sizeof(unsigned long)*8) - SECTIONS_WIDTH)
+#define NODES_PGOFF		(SECTIONS_PGOFF - NODES_WIDTH)
+#define ZONES_PGOFF		(NODES_PGOFF - ZONES_WIDTH)
+#define LAST_CPUPID_PGOFF	(ZONES_PGOFF - LAST_CPUPID_WIDTH)
+#define KASAN_TAG_PGOFF		(LAST_CPUPID_PGOFF - KASAN_TAG_WIDTH)
+
+/*
+ * Define the bit shifts to access each section.  For non-existent
+ * sections we define the shift as 0; that plus a 0 mask ensures
+ * the compiler will optimise away reference to them.
+ */
+#define SECTIONS_PGSHIFT	(SECTIONS_PGOFF * (SECTIONS_WIDTH != 0))
+#define NODES_PGSHIFT		(NODES_PGOFF * (NODES_WIDTH != 0))
+#define ZONES_PGSHIFT		(ZONES_PGOFF * (ZONES_WIDTH != 0))
+#define LAST_CPUPID_PGSHIFT	(LAST_CPUPID_PGOFF * (LAST_CPUPID_WIDTH != 0))
+#define KASAN_TAG_PGSHIFT	(KASAN_TAG_PGOFF * (KASAN_TAG_WIDTH != 0))
+
+/* NODE:ZONE or SECTION:ZONE is used to ID a zone for the buddy allocator */
+#ifdef NODE_NOT_IN_PAGE_FLAGS
+#define ZONEID_SHIFT		(SECTIONS_SHIFT + ZONES_SHIFT)
+#define ZONEID_PGOFF		((SECTIONS_PGOFF < ZONES_PGOFF) ? \
+						SECTIONS_PGOFF : ZONES_PGOFF)
+#else
+#define ZONEID_SHIFT		(NODES_SHIFT + ZONES_SHIFT)
+#define ZONEID_PGOFF		((NODES_PGOFF < ZONES_PGOFF) ? \
+						NODES_PGOFF : ZONES_PGOFF)
+#endif
+
+#define ZONEID_PGSHIFT		(ZONEID_PGOFF * (ZONEID_SHIFT != 0))
+
+#define ZONES_MASK		((1UL << ZONES_WIDTH) - 1)
+#define NODES_MASK		((1UL << NODES_WIDTH) - 1)
+#define SECTIONS_MASK		((1UL << SECTIONS_WIDTH) - 1)
+#define LAST_CPUPID_MASK	((1UL << LAST_CPUPID_SHIFT) - 1)
+#define KASAN_TAG_MASK		((1UL << KASAN_TAG_WIDTH) - 1)
+#define ZONEID_MASK		((1UL << ZONEID_SHIFT) - 1)
+
+static inline enum zone_type page_zonenum(const struct page *page)
+{
+	ASSERT_EXCLUSIVE_BITS(page->flags, ZONES_MASK << ZONES_PGSHIFT);
+	return (page->flags >> ZONES_PGSHIFT) & ZONES_MASK;
+}
+
+static inline enum zone_type folio_zonenum(const struct folio *folio)
+{
+	return page_zonenum(&folio->page);
+}
+
+#ifdef CONFIG_ZONE_DEVICE
+static inline bool is_zone_device_page(const struct page *page)
+{
+	return page_zonenum(page) == ZONE_DEVICE;
+}
+extern void memmap_init_zone_device(struct zone *, unsigned long,
+				    unsigned long, struct dev_pagemap *);
+#else
+static inline bool is_zone_device_page(const struct page *page)
+{
+	return false;
+}
+#endif
+
+static inline bool folio_is_zone_device(const struct folio *folio)
+{
+	return is_zone_device_page(&folio->page);
+}
+
+static inline bool is_zone_movable_page(const struct page *page)
+{
+	return page_zonenum(page) == ZONE_MOVABLE;
+}
+#endif
+
 /*
  * Return true if [start_pfn, start_pfn + nr_pages) range has a non-empty
  * intersection with the given zone
-- 
2.32.0

