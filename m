Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB05456AB4C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 21:04:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0EA113404;
	Thu,  7 Jul 2022 19:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291EE1133E2;
 Thu,  7 Jul 2022 19:04:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LiQuM7mfRvXmXpLGL9uhM2Dp76xsHsz1KrhWQYNLo85WTjJ3Pf6/cfFyWwrZ+NV4oXWn+x+M7cKVFDwkeOFKOezZvtTCOABhajrbNRwe2PG0MAxowDqGtl4RGfMVH017H5mtq8aU5oh3+mgLkh/pqU7/vo7JB3z9L2i5OOiOx//ZHU8b+9N/RNtuwPAf/MJUeXM0tdP0DuK/UCeWu4LoSf1Ha5sCTY2ZS36c75qeRm0KIYS1wkwNR1l7WsFwFh713liVEhg0Qm1mXq5gKT5vtU/EhHDIJSG14uA9ExsuM5L7oUCCCUHu90Ynyvf944t38Oujj/Pnr8SB+Pe5el3BRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yhmHmsxLnySPpDbmt3RTceD20afRhRpYxYv6sWrzIqQ=;
 b=TpAo9N9eORyvqRO0IcKVufZmF4e37ub/z5kVO+x3Gmv9F4UP6pV4uGO1eNLYRK1wpISGxYkoQoWRAOrvKePssZE33FIFJPBkpVs0YbjEFAjYBxici+cwC9NQHTpZH2PwRiNN4ZZdXMmPIpo6WrhhWtTDGQhr5mgkPZLb36flRp1KXzQivEkoE/CVkGV2z+JxeYjkMtQIzAGuvrjIFxgdZPlbCm/gKVr+chk3xundNOENlV2Zs/26daXCt2KBZvwR+YCiSnQCPCI2Nh3weBKNg0PQvspjKAgXXMJR0/ohrWeLyZVKme3HmvETRY+KjBDhPmZd6YWSwcNy/zw4gcpZuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhmHmsxLnySPpDbmt3RTceD20afRhRpYxYv6sWrzIqQ=;
 b=sRlaFRFKx0srvZy7D4ntjvMx7GM5V447Ox1S92pPJ0nd6wubR+ZQY9nhlUaK6qtN2mwFcRo6eAa+B6gfFW3ZLbZG3zSozmPrX9uw72TIz8X0w+Q+b49samOxAmPSBxxXNVLqK87uRA7WZ8++CxbnKDh7q7hnNN3LYaOn+NpRKRc=
Received: from BN9P222CA0018.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::23)
 by MWHPR1201MB0029.namprd12.prod.outlook.com (2603:10b6:301:4d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.19; Thu, 7 Jul
 2022 19:04:08 +0000
Received: from BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::2c) by BN9P222CA0018.outlook.office365.com
 (2603:10b6:408:10c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Thu, 7 Jul 2022 19:04:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT067.mail.protection.outlook.com (10.13.177.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 19:04:08 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 7 Jul
 2022 14:04:05 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v8 02/15] mm: move page zone helpers into new header-specific
 file
Date: Thu, 7 Jul 2022 14:03:36 -0500
Message-ID: <20220707190349.9778-3-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220707190349.9778-1-alex.sierra@amd.com>
References: <20220707190349.9778-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 631430f6-891d-4b2a-0a67-08da604b7857
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0029:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JzsV4PMSGyiMvbsmlDP4bseEQ9upWxDAXpfOTZ9FiJ1S5t1GD1o6uolWQNF9meZu6Ngthg8KC9tpx0XVT5Pj/CIRulWjrcB2CHttI4hTWpRb4M4L8jv49nK4qcC3PGA8o1v39Aj2UpRs4kAWv/f6GQgtQ/tKIJsrEyVt5bQE3S5nffcj5MMjzVo3Cb228cA/aqcR4bHEfacQLq32f+YSNK+lRY4zw4Cf4I0PlYFPYmcFOthHqvJ3iGFxDwG7FpjxyPHiSBwg+czOrkZdguUGUzHtbR5S5u0RfCWzLSPLYmJoMLtfz8pz47sJ7V3uNHjb4DiDCc32tT4h1ZaS5OaWLGxHwz3fhXOa1qoVYnHQ+THXBNdazqGsigYk+G+bNWm/CzbXhaAlfgK8TWUOisk60kU2dTkrxrc/14DRdE9oOvKAdBF8nMxVwLEZFbXgOMNicKnB/QpIzGEV1dhXNW6XORDO2D5dQPfPv3S1PPCtOjj2aX+D0NRmBu699k4te9CAfL/TJc9eosJoS39HIv9zZGszyZTpmsdvFcCjI2M91qYFcIP4B7Ke077hPdzlQ5FJ+Y/SoYorr0KOZx0G/kf/THVEj1oSLo1v2Yj0s2GfVMuJyEW2bUqoL9FAOEid5OJn2GR4w7+70UPexzkaHVTMgxfVSCDvQdHYzJLFHmeSIA88NrZ8ECIKSpaFqEBrNSXyoDuBjoZf9TbQfGze4tGvmz78M5FlLyINZ/TRVUqOvlu6+k2SlFTVuWd4AgC1D5oD73wKUa/wryTnKdpy8gTyHJnuNk2SG0qCZo2AOroCBY3UMMpktw2J69k5pqyEl+Gyf3rSj05XmJXvBQ9Fuvu5sZnY6hZ/Dsap7AKT/Y+0r0k4p2JDs3SfaL/q809Y/M9z
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(39860400002)(396003)(36840700001)(46966006)(40470700004)(40460700003)(81166007)(30864003)(44832011)(478600001)(7696005)(86362001)(7416002)(41300700001)(6666004)(36860700001)(8936002)(5660300002)(82740400003)(26005)(356005)(34020700004)(2906002)(426003)(54906003)(1076003)(47076005)(316002)(83380400001)(186003)(2616005)(16526019)(40480700001)(70206006)(336012)(36756003)(70586007)(4326008)(6916009)(8676002)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 19:04:08.2724 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 631430f6-891d-4b2a-0a67-08da604b7857
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0029
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
Have a cleaner way to expose all page zone helpers in one header
file, rather than split them between mm.h and memremap.h files.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 drivers/infiniband/core/rw.c      |   1 -
 drivers/nvme/target/io-cmd-bdev.c |   1 -
 include/linux/memremap.h          | 113 +----------------
 include/linux/mm.h                |  79 +-----------
 include/linux/page_zone.h         | 194 ++++++++++++++++++++++++++++++
 mm/memcontrol.c                   |   1 -
 6 files changed, 196 insertions(+), 193 deletions(-)
 create mode 100644 include/linux/page_zone.h

diff --git a/drivers/infiniband/core/rw.c b/drivers/infiniband/core/rw.c
index 4d98f931a13d..5a3bd41b331c 100644
--- a/drivers/infiniband/core/rw.c
+++ b/drivers/infiniband/core/rw.c
@@ -2,7 +2,6 @@
 /*
  * Copyright (c) 2016 HGST, a Western Digital Company.
  */
-#include <linux/memremap.h>
 #include <linux/moduleparam.h>
 #include <linux/slab.h>
 #include <linux/pci-p2pdma.h>
diff --git a/drivers/nvme/target/io-cmd-bdev.c b/drivers/nvme/target/io-cmd-bdev.c
index 27a72504d31c..16a8b7665fe4 100644
--- a/drivers/nvme/target/io-cmd-bdev.c
+++ b/drivers/nvme/target/io-cmd-bdev.c
@@ -6,7 +6,6 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 #include <linux/blkdev.h>
 #include <linux/blk-integrity.h>
-#include <linux/memremap.h>
 #include <linux/module.h>
 #include "nvmet.h"
 
diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 8af304f6b504..0f22f6f42e7d 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -2,70 +2,14 @@
 #ifndef _LINUX_MEMREMAP_H_
 #define _LINUX_MEMREMAP_H_
 
-#include <linux/mm.h>
 #include <linux/range.h>
 #include <linux/ioport.h>
 #include <linux/percpu-refcount.h>
+#include <linux/page_zone.h>
 
 struct resource;
 struct device;
 
-/**
- * struct vmem_altmap - pre-allocated storage for vmemmap_populate
- * @base_pfn: base of the entire dev_pagemap mapping
- * @reserve: pages mapped, but reserved for driver use (relative to @base)
- * @free: free pages set aside in the mapping for memmap storage
- * @align: pages reserved to meet allocation alignments
- * @alloc: track pages consumed, private to vmemmap_populate()
- */
-struct vmem_altmap {
-	unsigned long base_pfn;
-	const unsigned long end_pfn;
-	const unsigned long reserve;
-	unsigned long free;
-	unsigned long align;
-	unsigned long alloc;
-};
-
-/*
- * Specialize ZONE_DEVICE memory into multiple types each has a different
- * usage.
- *
- * MEMORY_DEVICE_PRIVATE:
- * Device memory that is not directly addressable by the CPU: CPU can neither
- * read nor write private memory. In this case, we do still have struct pages
- * backing the device memory. Doing so simplifies the implementation, but it is
- * important to remember that there are certain points at which the struct page
- * must be treated as an opaque object, rather than a "normal" struct page.
- *
- * A more complete discussion of unaddressable memory may be found in
- * include/linux/hmm.h and Documentation/vm/hmm.rst.
- *
- * MEMORY_DEVICE_FS_DAX:
- * Host memory that has similar access semantics as System RAM i.e. DMA
- * coherent and supports page pinning. In support of coordinating page
- * pinning vs other operations MEMORY_DEVICE_FS_DAX arranges for a
- * wakeup event whenever a page is unpinned and becomes idle. This
- * wakeup is used to coordinate physical address space management (ex:
- * fs truncate/hole punch) vs pinned pages (ex: device dma).
- *
- * MEMORY_DEVICE_GENERIC:
- * Host memory that has similar access semantics as System RAM i.e. DMA
- * coherent and supports page pinning. This is for example used by DAX devices
- * that expose memory using a character device.
- *
- * MEMORY_DEVICE_PCI_P2PDMA:
- * Device memory residing in a PCI BAR intended for use with Peer-to-Peer
- * transactions.
- */
-enum memory_type {
-	/* 0 is reserved to catch uninitialized type fields */
-	MEMORY_DEVICE_PRIVATE = 1,
-	MEMORY_DEVICE_FS_DAX,
-	MEMORY_DEVICE_GENERIC,
-	MEMORY_DEVICE_PCI_P2PDMA,
-};
-
 struct dev_pagemap_ops {
 	/*
 	 * Called once the page refcount reaches 0.  The reference count will be
@@ -83,42 +27,6 @@ struct dev_pagemap_ops {
 
 #define PGMAP_ALTMAP_VALID	(1 << 0)
 
-/**
- * struct dev_pagemap - metadata for ZONE_DEVICE mappings
- * @altmap: pre-allocated/reserved memory for vmemmap allocations
- * @ref: reference count that pins the devm_memremap_pages() mapping
- * @done: completion for @ref
- * @type: memory type: see MEMORY_* in memory_hotplug.h
- * @flags: PGMAP_* flags to specify defailed behavior
- * @vmemmap_shift: structural definition of how the vmemmap page metadata
- *      is populated, specifically the metadata page order.
- *	A zero value (default) uses base pages as the vmemmap metadata
- *	representation. A bigger value will set up compound struct pages
- *	of the requested order value.
- * @ops: method table
- * @owner: an opaque pointer identifying the entity that manages this
- *	instance.  Used by various helpers to make sure that no
- *	foreign ZONE_DEVICE memory is accessed.
- * @nr_range: number of ranges to be mapped
- * @range: range to be mapped when nr_range == 1
- * @ranges: array of ranges to be mapped when nr_range > 1
- */
-struct dev_pagemap {
-	struct vmem_altmap altmap;
-	struct percpu_ref ref;
-	struct completion done;
-	enum memory_type type;
-	unsigned int flags;
-	unsigned long vmemmap_shift;
-	const struct dev_pagemap_ops *ops;
-	void *owner;
-	int nr_range;
-	union {
-		struct range range;
-		struct range ranges[0];
-	};
-};
-
 static inline struct vmem_altmap *pgmap_altmap(struct dev_pagemap *pgmap)
 {
 	if (pgmap->flags & PGMAP_ALTMAP_VALID)
@@ -131,25 +39,6 @@ static inline unsigned long pgmap_vmemmap_nr(struct dev_pagemap *pgmap)
 	return 1 << pgmap->vmemmap_shift;
 }
 
-static inline bool is_device_private_page(const struct page *page)
-{
-	return IS_ENABLED(CONFIG_DEVICE_PRIVATE) &&
-		is_zone_device_page(page) &&
-		page->pgmap->type == MEMORY_DEVICE_PRIVATE;
-}
-
-static inline bool folio_is_device_private(const struct folio *folio)
-{
-	return is_device_private_page(&folio->page);
-}
-
-static inline bool is_pci_p2pdma_page(const struct page *page)
-{
-	return IS_ENABLED(CONFIG_PCI_P2PDMA) &&
-		is_zone_device_page(page) &&
-		page->pgmap->type == MEMORY_DEVICE_PCI_P2PDMA;
-}
-
 #ifdef CONFIG_ZONE_DEVICE
 void *memremap_pages(struct dev_pagemap *pgmap, int nid);
 void memunmap_pages(struct dev_pagemap *pgmap);
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 3b31b33bd5be..e551616cd208 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -28,6 +28,7 @@
 #include <linux/sched.h>
 #include <linux/pgtable.h>
 #include <linux/kasan.h>
+#include <linux/page_zone.h>
 
 struct mempolicy;
 struct anon_vma;
@@ -1049,84 +1050,6 @@ vm_fault_t finish_mkwrite_fault(struct vm_fault *vmf);
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
 
diff --git a/include/linux/page_zone.h b/include/linux/page_zone.h
new file mode 100644
index 000000000000..2a7a347173ee
--- /dev/null
+++ b/include/linux/page_zone.h
@@ -0,0 +1,194 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _PAGE_ZONE_H_
+#define _PAGE_ZONE_H_
+
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
+/*
+ * Specialize ZONE_DEVICE memory into multiple types each has a different
+ * usage.
+ *
+ * MEMORY_DEVICE_PRIVATE:
+ * Device memory that is not directly addressable by the CPU: CPU can neither
+ * read nor write private memory. In this case, we do still have struct pages
+ * backing the device memory. Doing so simplifies the implementation, but it is
+ * important to remember that there are certain points at which the struct page
+ * must be treated as an opaque object, rather than a "normal" struct page.
+ *
+ * A more complete discussion of unaddressable memory may be found in
+ * include/linux/hmm.h and Documentation/vm/hmm.rst.
+ *
+ * MEMORY_DEVICE_FS_DAX:
+ * Host memory that has similar access semantics as System RAM i.e. DMA
+ * coherent and supports page pinning. In support of coordinating page
+ * pinning vs other operations MEMORY_DEVICE_FS_DAX arranges for a
+ * wakeup event whenever a page is unpinned and becomes idle. This
+ * wakeup is used to coordinate physical address space management (ex:
+ * fs truncate/hole punch) vs pinned pages (ex: device dma).
+ *
+ * MEMORY_DEVICE_GENERIC:
+ * Host memory that has similar access semantics as System RAM i.e. DMA
+ * coherent and supports page pinning. This is for example used by DAX devices
+ * that expose memory using a character device.
+ *
+ * MEMORY_DEVICE_PCI_P2PDMA:
+ * Device memory residing in a PCI BAR intended for use with Peer-to-Peer
+ * transactions.
+ */
+enum memory_type {
+	/* 0 is reserved to catch uninitialized type fields */
+	MEMORY_DEVICE_PRIVATE = 1,
+	MEMORY_DEVICE_FS_DAX,
+	MEMORY_DEVICE_GENERIC,
+	MEMORY_DEVICE_PCI_P2PDMA,
+};
+
+/**
+ * struct vmem_altmap - pre-allocated storage for vmemmap_populate
+ * @base_pfn: base of the entire dev_pagemap mapping
+ * @reserve: pages mapped, but reserved for driver use (relative to @base)
+ * @free: free pages set aside in the mapping for memmap storage
+ * @align: pages reserved to meet allocation alignments
+ * @alloc: track pages consumed, private to vmemmap_populate()
+ */
+struct vmem_altmap {
+	unsigned long base_pfn;
+	const unsigned long end_pfn;
+	const unsigned long reserve;
+	unsigned long free;
+	unsigned long align;
+	unsigned long alloc;
+};
+
+/**
+ * struct dev_pagemap - metadata for ZONE_DEVICE mappings
+ * @altmap: pre-allocated/reserved memory for vmemmap allocations
+ * @ref: reference count that pins the devm_memremap_pages() mapping
+ * @done: completion for @ref
+ * @type: memory type: see MEMORY_* in memory_hotplug.h
+ * @flags: PGMAP_* flags to specify defailed behavior
+ * @vmemmap_shift: structural definition of how the vmemmap page metadata
+ *      is populated, specifically the metadata page order.
+ *	A zero value (default) uses base pages as the vmemmap metadata
+ *	representation. A bigger value will set up compound struct pages
+ *	of the requested order value.
+ * @ops: method table
+ * @owner: an opaque pointer identifying the entity that manages this
+ *	instance.  Used by various helpers to make sure that no
+ *	foreign ZONE_DEVICE memory is accessed.
+ * @nr_range: number of ranges to be mapped
+ * @range: range to be mapped when nr_range == 1
+ * @ranges: array of ranges to be mapped when nr_range > 1
+ */
+struct dev_pagemap {
+	struct vmem_altmap altmap;
+	struct percpu_ref ref;
+	struct completion done;
+	enum memory_type type;
+	unsigned int flags;
+	unsigned long vmemmap_shift;
+	const struct dev_pagemap_ops *ops;
+	void *owner;
+	int nr_range;
+	union {
+		struct range range;
+		struct range ranges[0];
+	};
+};
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
+static inline bool is_zone_movable_page(const struct page *page)
+{
+	return page_zonenum(page) == ZONE_MOVABLE;
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
+static inline bool is_device_private_page(const struct page *page)
+{
+	return IS_ENABLED(CONFIG_DEVICE_PRIVATE) &&
+		is_zone_device_page(page) &&
+		page->pgmap->type == MEMORY_DEVICE_PRIVATE;
+}
+
+static inline bool folio_is_device_private(const struct folio *folio)
+{
+	return is_device_private_page(&folio->page);
+}
+
+static inline bool is_pci_p2pdma_page(const struct page *page)
+{
+	return IS_ENABLED(CONFIG_PCI_P2PDMA) &&
+		is_zone_device_page(page) &&
+		page->pgmap->type == MEMORY_DEVICE_PCI_P2PDMA;
+}
+
+#endif /* _PAGE_ZONE_H_ */
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 618c366a2f07..a2df2f193f06 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -53,7 +53,6 @@
 #include <linux/fs.h>
 #include <linux/seq_file.h>
 #include <linux/vmpressure.h>
-#include <linux/memremap.h>
 #include <linux/mm_inline.h>
 #include <linux/swap_cgroup.h>
 #include <linux/cpu.h>
-- 
2.32.0

