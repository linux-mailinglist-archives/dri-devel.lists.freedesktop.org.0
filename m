Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEC0576ED2
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E81310F6D3;
	Sat, 16 Jul 2022 14:35:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B4710E06A;
 Fri, 15 Jul 2022 15:05:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RuI2q8NGZFsHcU0rgFVQx6OBNYELYZzo3ZB4Tbn1m5q34AAn6WWh8sZQ2n4CkmrZ9yjYApwQReHf9PIJG1VwzAIpRhvaKWaGXVOt6GA45BUuI/DacDYjPhHyUbSRFuNdr6TRQALfuUF5lYUYOBtvjalJPaIdkYvI1FjqnYCdCd4H0YTeSGbbYu/rOb7SFlb+yoZXWAAe2AQkBWRwh3veqKz5xsXNGdUuP9kWJfhXHbKvS4IbXY9Bn4ztJ6gNueQvJcYgTrxZM3rAqKpIAPOC7T+ejxr+orh/IfNKqn9kSUU713oeXhJb7Aow/dK/r1KWMRrvkliMBl+rP4d2xirgHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pl3vpLHWcXBhanSoe7pGRKR9ds6OjoPRrsbyvrGQTWQ=;
 b=bzXCB+j0k5M0P4NwcBMtGSRdrkNf9yIQoKMiB/BxLlRxLGbqlAgxVuX0JFTUTDwYpnybHvzy4OAskF4o/3Zcx5pbOI9sbmPLUKWhOmc88swM+BhgHLPypvll79k4DtT194p3043JGiCxp3FUZZ1jI8dw7p0M+CGR9yAQOP8fq6dQ/fiXJdWfVgPEKn6lzO19VNjYnuNWxe2rSiHX1noWpA2KDRGOxa++PuFZM9oxmzWoJFXRtd05ebpTrYb0+m4oLZCcHlaMSOOXoGeCGv+Vb+cmLcbKzk5mDfFzEegOaJSv5Zwtj+uyCRH33OSnypk7C+fSZACs1ItC3LjfmyCo5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pl3vpLHWcXBhanSoe7pGRKR9ds6OjoPRrsbyvrGQTWQ=;
 b=pGNmgmW6sv8lasELW7Q5jQjyzGeigMW4Zdk02uMYz6pgsNZXrDQIBLXun20W+KV/1Ee56fMhF6kgCmM/sLzEiDFtO1G2iitP5PsCWAzl8Xa+Slt7tovvrHHNwi2FymssD345TW3sLCZ/zr07z0DSxpx9ZeR7iJQLsSpgfgYhIFM=
Received: from DS7P222CA0023.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::9) by
 BL0PR12MB2819.namprd12.prod.outlook.com (2603:10b6:208:8a::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.13; Fri, 15 Jul 2022 15:05:40 +0000
Received: from DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::bc) by DS7P222CA0023.outlook.office365.com
 (2603:10b6:8:2e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20 via Frontend
 Transport; Fri, 15 Jul 2022 15:05:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT045.mail.protection.outlook.com (10.13.173.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5438.12 via Frontend Transport; Fri, 15 Jul 2022 15:05:39 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 15 Jul
 2022 10:05:37 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v9 03/14] mm: add zone device coherent type memory support
Date: Fri, 15 Jul 2022 10:05:10 -0500
Message-ID: <20220715150521.18165-4-alex.sierra@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: c2a38a62-6060-4d0d-9fc0-08da66737b04
X-MS-TrafficTypeDiagnostic: BL0PR12MB2819:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7D9pZUz+MejFaivwLhwL5dxt900IGIWJGESAOYT5x958EAnTXSg+pqVGajHxGcQLq+N/S+lpf4nZdNFHO4SLIa7Ts6aFlW2pd8uDQPReIMzJXRUC1CelSVIqtUv6WR+PKSIfzuD89ZbHoOYZ3f/7NdOE6uzSoCnYlIiDvKBMQrKmfKTVzbqPpthpJ0vEEoTNAYkpKDAguD4GXnmmvoW0zEPoPQWeEYSwtHX38wbXvAhePEcL5NbiVZmyo9xxQWlnHbaFvCyZHqGEzhbW5svwNiHuH5cQT62xk0cJC9dRaQtCJOc4datgjxnapqnc8WGZAgD8jk5W4oHJ5TT/8aulnTGFVfiN+7x8KkjhXylwDpBdHBEZ/pMq9Y4NgvibFui2QBX9F4/nqUhsOLGo4s/bdBhc3KGQoRQluk5PmJTyl185fQ7isuOO+FcXo+rn6wp97CjmouxsEUlJ+KO510GfxbF4RRcFwd5YxCaB3FQw70zVTDz0jA3aOnv7ZYkOi1aaj+UbJwHArQWORi8iz8MHxwyBiCtoT96GcEUsfVETyijXOY24/Yit1SBHg0/oe/PtMTePTmkAuvnWHJjs8zGZGfKud/3fRt/TOyPDfoZWWg5GonX+XzEeNWb+kTdD78SGoR1vHZSoukVDn+omjg3BBqY6Jhsy5hEyEORXz10asCvlOJkhPKtO+s7YJNc5h1mbHWCnuivKkqNCt+UMxYUv2U6hqEW9C9lu6tC7rk5fH/ux56v5lXbVNjD0v2GQaGhYpWg1VBQHmNwcTRpx3koHTgMRvwSVJPRthgDT0tSegOQG3l2dqMHBDFbcafhaGBN5YzzZzDXKfpjx/M4CCnYDt32FjRswOdxf0oJXC8NF2TE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(396003)(39860400002)(376002)(46966006)(36840700001)(40470700004)(81166007)(36756003)(36860700001)(44832011)(82740400003)(83380400001)(7416002)(8936002)(2906002)(336012)(5660300002)(47076005)(426003)(54906003)(186003)(8676002)(16526019)(7696005)(41300700001)(1076003)(2616005)(40460700003)(316002)(86362001)(4326008)(70586007)(356005)(70206006)(40480700001)(478600001)(6916009)(6666004)(26005)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 15:05:39.6425 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a38a62-6060-4d0d-9fc0-08da66737b04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2819
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

Device memory that is cache coherent from device and CPU point of view.
This is used on platforms that have an advanced system bus (like CAPI
or CXL). Any page of a process can be migrated to such memory. However,
no one should be allowed to pin such memory so that it can always be
evicted.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Alistair Popple <apopple@nvidia.com>
[hch: rebased ontop of the refcount changes,
      removed is_dev_private_or_coherent_page]
Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: David Hildenbrand <david@redhat.com>
---
 include/linux/memremap.h | 19 +++++++++++++++++++
 include/linux/mm.h       |  5 ++++-
 mm/memcontrol.c          |  7 ++++---
 mm/memory-failure.c      |  8 ++++++--
 mm/memremap.c            | 10 ++++++++++
 mm/migrate_device.c      | 16 +++++++---------
 mm/rmap.c                |  5 +++--
 7 files changed, 53 insertions(+), 17 deletions(-)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 77229165c914..f27b142fd3d0 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -41,6 +41,13 @@ struct vmem_altmap {
  * A more complete discussion of unaddressable memory may be found in
  * include/linux/hmm.h and Documentation/vm/hmm.rst.
  *
+ * MEMORY_DEVICE_COHERENT:
+ * Device memory that is cache coherent from device and CPU point of view. This
+ * is used on platforms that have an advanced system bus (like CAPI or CXL). A
+ * driver can hotplug the device memory using ZONE_DEVICE and with that memory
+ * type. Any page of a process can be migrated to such memory. However no one
+ * should be allowed to pin such memory so that it can always be evicted.
+ *
  * MEMORY_DEVICE_FS_DAX:
  * Host memory that has similar access semantics as System RAM i.e. DMA
  * coherent and supports page pinning. In support of coordinating page
@@ -61,6 +68,7 @@ struct vmem_altmap {
 enum memory_type {
 	/* 0 is reserved to catch uninitialized type fields */
 	MEMORY_DEVICE_PRIVATE = 1,
+	MEMORY_DEVICE_COHERENT,
 	MEMORY_DEVICE_FS_DAX,
 	MEMORY_DEVICE_GENERIC,
 	MEMORY_DEVICE_PCI_P2PDMA,
@@ -150,6 +158,17 @@ static inline bool is_pci_p2pdma_page(const struct page *page)
 		page->pgmap->type == MEMORY_DEVICE_PCI_P2PDMA;
 }
 
+static inline bool is_device_coherent_page(const struct page *page)
+{
+	return is_zone_device_page(page) &&
+		page->pgmap->type == MEMORY_DEVICE_COHERENT;
+}
+
+static inline bool folio_is_device_coherent(const struct folio *folio)
+{
+	return is_device_coherent_page(&folio->page);
+}
+
 #ifdef CONFIG_ZONE_DEVICE
 void *memremap_pages(struct dev_pagemap *pgmap, int nid);
 void memunmap_pages(struct dev_pagemap *pgmap);
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 2df8c2b98d36..3ed101dfbfab 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -28,6 +28,7 @@
 #include <linux/sched.h>
 #include <linux/pgtable.h>
 #include <linux/kasan.h>
+#include <linux/memremap.h>
 
 struct mempolicy;
 struct anon_vma;
@@ -1522,7 +1523,9 @@ static inline bool is_longterm_pinnable_page(struct page *page)
 	if (mt == MIGRATE_CMA || mt == MIGRATE_ISOLATE)
 		return false;
 #endif
-	return !is_zone_movable_page(page) || is_zero_pfn(page_to_pfn(page));
+	return !(is_device_coherent_page(page) ||
+		 is_zone_movable_page(page) ||
+		 is_zero_pfn(page_to_pfn(page)));
 }
 #else
 static inline bool is_longterm_pinnable_page(struct page *page)
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 618c366a2f07..5d37a85c67da 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -5665,8 +5665,8 @@ static int mem_cgroup_move_account(struct page *page,
  *   2(MC_TARGET_SWAP): if the swap entry corresponding to this pte is a
  *     target for charge migration. if @target is not NULL, the entry is stored
  *     in target->ent.
- *   3(MC_TARGET_DEVICE): like MC_TARGET_PAGE  but page is MEMORY_DEVICE_PRIVATE
- *     (so ZONE_DEVICE page and thus not on the lru).
+ *   3(MC_TARGET_DEVICE): like MC_TARGET_PAGE  but page is device memory and
+ *   thus not on the lru.
  *     For now we such page is charge like a regular page would be as for all
  *     intent and purposes it is just special memory taking the place of a
  *     regular page.
@@ -5704,7 +5704,8 @@ static enum mc_target_type get_mctgt_type(struct vm_area_struct *vma,
 		 */
 		if (page_memcg(page) == mc.from) {
 			ret = MC_TARGET_PAGE;
-			if (is_device_private_page(page))
+			if (is_device_private_page(page) ||
+			    is_device_coherent_page(page))
 				ret = MC_TARGET_DEVICE;
 			if (target)
 				target->page = page;
diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index da39ec8afca8..79f175eeb190 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -1685,12 +1685,16 @@ static int memory_failure_dev_pagemap(unsigned long pfn, int flags,
 		goto unlock;
 	}
 
-	if (pgmap->type == MEMORY_DEVICE_PRIVATE) {
+	switch (pgmap->type) {
+	case MEMORY_DEVICE_PRIVATE:
+	case MEMORY_DEVICE_COHERENT:
 		/*
-		 * TODO: Handle HMM pages which may need coordination
+		 * TODO: Handle device pages which may need coordination
 		 * with device-side memory.
 		 */
 		goto unlock;
+	default:
+		break;
 	}
 
 	/*
diff --git a/mm/memremap.c b/mm/memremap.c
index b870a659eee6..0f8f08f8a991 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -315,6 +315,16 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 			return ERR_PTR(-EINVAL);
 		}
 		break;
+	case MEMORY_DEVICE_COHERENT:
+		if (!pgmap->ops->page_free) {
+			WARN(1, "Missing page_free method\n");
+			return ERR_PTR(-EINVAL);
+		}
+		if (!pgmap->owner) {
+			WARN(1, "Missing owner\n");
+			return ERR_PTR(-EINVAL);
+		}
+		break;
 	case MEMORY_DEVICE_FS_DAX:
 		if (IS_ENABLED(CONFIG_FS_DAX_LIMITED)) {
 			WARN(1, "File system DAX not supported\n");
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 5052093d0262..a4847ad65da3 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -518,7 +518,7 @@ EXPORT_SYMBOL(migrate_vma_setup);
  *     handle_pte_fault()
  *       do_anonymous_page()
  * to map in an anonymous zero page but the struct page will be a ZONE_DEVICE
- * private page.
+ * private or coherent page.
  */
 static void migrate_vma_insert_page(struct migrate_vma *migrate,
 				    unsigned long addr,
@@ -594,11 +594,8 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 						page_to_pfn(page));
 		entry = swp_entry_to_pte(swp_entry);
 	} else {
-		/*
-		 * For now we only support migrating to un-addressable device
-		 * memory.
-		 */
-		if (is_zone_device_page(page)) {
+		if (is_zone_device_page(page) &&
+		    !is_device_coherent_page(page)) {
 			pr_warn_once("Unsupported ZONE_DEVICE page type.\n");
 			goto abort;
 		}
@@ -701,10 +698,11 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 
 		mapping = page_mapping(page);
 
-		if (is_device_private_page(newpage)) {
+		if (is_device_private_page(newpage) ||
+		    is_device_coherent_page(newpage)) {
 			/*
-			 * For now only support private anonymous when migrating
-			 * to un-addressable device memory.
+			 * For now only support anonymous memory migrating to
+			 * device private or coherent memory.
 			 */
 			if (mapping) {
 				migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
diff --git a/mm/rmap.c b/mm/rmap.c
index 746c05acad27..d28a0ab725b6 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1972,7 +1972,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 		/* Update high watermark before we lower rss */
 		update_hiwater_rss(mm);
 
-		if (folio_is_zone_device(folio)) {
+		if (folio_is_device_private(folio)) {
 			unsigned long pfn = folio_pfn(folio);
 			swp_entry_t entry;
 			pte_t swp_pte;
@@ -2138,7 +2138,8 @@ void try_to_migrate(struct folio *folio, enum ttu_flags flags)
 					TTU_SYNC)))
 		return;
 
-	if (folio_is_zone_device(folio) && !folio_is_device_private(folio))
+	if (folio_is_zone_device(folio) &&
+	    (!folio_is_device_private(folio) && !folio_is_device_coherent(folio)))
 		return;
 
 	/*
-- 
2.32.0

