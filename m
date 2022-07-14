Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B06575293
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 18:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D371130D1;
	Thu, 14 Jul 2022 16:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0C711373A;
 Thu, 14 Jul 2022 16:15:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CovdJ7uZ7Dj5pOF9u/Y09OVGpxV0+YkxkI6Sl0jmXS4Rum+7OJjMVaCWnV0fO+PcUsrLGyMGIomjpT+8LIdP3AkGbsrDJxl3xQIk9Tj6XgaR/RFjL4upW2/jaAWBlRtoAEQvAEpuDzNAwJ5UXI8MnS1jMkzQa8Tq78d/MUuoI6K66ppkDS4cJapTBKZURaVJxQcBpiZUuZACK6/tA3oT/FxRocOWjOyrgjbxBLxzDCztXUpWxQs0KLl5IyE+PrtxActGR5jy03/vFar405qJy6DXysdXOFbzrZVeNFupT4wq2+O+vCQ9sGcCWzFU35FVFTgXiRY8UgeDun1wWbYGzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBW4h10J7XAhyaHtTT9wydlVynoCzg0kQPS8qrn77OY=;
 b=E9AFdvpIHiCakbRHeXs/zFChKoyEZsb/N5TCgG01MkcvpOekWPZcS/rizToW4N3HxnFw36FmHaJVGwsUK/B2Hdodix1S/ZEfjL9Pe7h9BCIw/3wu2IeNPrCHY6aaIb17IUhUzhRkLizBKuKgcR9bQiNIe4IPkfYGv89l36Buj04h90TOTjrHvTtOT9wZgF3YxHTmtjhNcneCV8LeoFT+/bMHVmcjlInKNBQy8S6nTH0WZdZcqu2Qv113pF03Ss6epoIJnFWxI7Djb6raylSPWAalmxIOmHgfSzvDF5dQHobSvud5/lFlnW8wBEYfGpxJp80mv7sYU1Zrt17tjanxAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBW4h10J7XAhyaHtTT9wydlVynoCzg0kQPS8qrn77OY=;
 b=UR7I4fciUr13WZTPdogePnJvmE21pXwuR5A6D4Duh76WYBGky6dt378HKtn7C5n7eLMZbWB/93Atm3fgCr8SPaXrPD1N8XjWKK7VJuI6tO+VAEoRUx6PlpOgKaWiZrcQ4RzTT+UhfyKLwV7VbABzqcZSKmrNuYG2qSmdeRO5SR8=
Received: from BN9PR03CA0152.namprd03.prod.outlook.com (2603:10b6:408:f4::7)
 by IA1PR12MB6258.namprd12.prod.outlook.com (2603:10b6:208:3e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 14 Jul
 2022 16:15:26 +0000
Received: from BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::a0) by BN9PR03CA0152.outlook.office365.com
 (2603:10b6:408:f4::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.22 via Frontend
 Transport; Thu, 14 Jul 2022 16:15:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT051.mail.protection.outlook.com (10.13.177.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5438.12 via Frontend Transport; Thu, 14 Jul 2022 16:15:26 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 14 Jul
 2022 11:15:25 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH] mm: move page zone helpers from mm.h to mmzone.h
Date: Thu, 14 Jul 2022 11:15:15 -0500
Message-ID: <20220714161515.17107-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <715fc1ae-7bd3-5b96-175c-e1cc74920739@amd.com>
References: <715fc1ae-7bd3-5b96-175c-e1cc74920739@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fff5c00-939f-40c7-d969-08da65b40ffb
X-MS-TrafficTypeDiagnostic: IA1PR12MB6258:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LOt8OaMcxbvk/8bRPeWzsR5xD09xpNKObGHaO4UDM71RlO/RCFQlISmp+C6iv+U2Yj97I/fluhNQIkkKqWO75ecziVxqW87R8j9MpCfmcuJA/aucy7AEvKMGUMCI0KnQvyJE/EKQRa1CW62fgESnZtsdZdTiynJfZMNNgAqjwB0O8ppvu3a4YhWZnzCt020TifLfYHxBZ2O6F2EkT4+9zVbmhLVEM8FBohQYno6NcLhqCHVrR0j3l7iAwjBMm1pUlHfNrolWQ0NOfJkpyaTJB6cBr7WI4PLo6w3S0m6zR9bN54Iwj09iGFjvPQvMl6tzggvmVg4aqbxr2sT1DEtYtQGYCAGysYOYRmfguhQ9wHEwiWj4XJ+56uHXDM1vCvIBaIRbwuF3C1C5q6J5BIVnyNrDjLvrXZLEabPpbkvFCK5Nr6ieNErkzPzN8vZmKzwHtwRWNrC7saa4FK0h4+l4qsMze59lgpcqJodsF6qV/EGwTAHCvtV6SlT1LaBLmDZpgHU15kkIgNWv/BSigO8NLgHi2x//ZHjgTksT3LhBpj+sBViqanaT3U5LVjm+xIzRPxrDH0KdcxmctFQ52GNc1tSmW8HHsJudCoSGqCDpvLzfPDBfyGoktbwXXtIQRmNeyKAuiNyPagC9fJ5C0HfnRTlOFWKwadHDZjWGsr3gYY+w6UrSR7wMskwzh/BWI/e2/jRUoWKUJ/UKtEqjaRHtDpmBOpZl0WXarcVbOnQmyu24EIsksflPo+Y/PF53i91M+NhOv6r6mn3MKlrNnt+83Bv56r+BfWD5NMLw0uoUMjHVzS9cFNV3Xg8IpvawkpXQRPss3U4MngGrrbwn7nGgM3Si8SMhd1sWPz+Olwg29uQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(39860400002)(376002)(346002)(40470700004)(46966006)(36840700001)(336012)(44832011)(5660300002)(26005)(81166007)(8936002)(7696005)(7416002)(16526019)(36860700001)(186003)(40460700003)(40480700001)(36756003)(8676002)(316002)(86362001)(1076003)(4326008)(70586007)(70206006)(426003)(82310400005)(54906003)(478600001)(2616005)(82740400003)(83380400001)(356005)(2906002)(47076005)(41300700001)(6916009)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 16:15:26.2247 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fff5c00-939f-40c7-d969-08da65b40ffb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6258
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

