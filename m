Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A29C53977B
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 22:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5196410E3C7;
	Tue, 31 May 2022 20:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5179E10E29E;
 Tue, 31 May 2022 20:00:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpxHeF9XZSYzYYGYzRkHnyoQoef5uJttv1BpGWQxCi2uMpHbUrgvaE9qOFbVAeNHdGMssnlTGJSIfXmXIgauKiivmcwHVqxzaIhQ6yAWiH6ZWdcEmD3C5dPUOV/Yz1+kn0syoBrRoJGpBu58RKiCkUyyZ0yBeO6fHa9yknir+02grZVN7Ok91l0U0SrPHXtZSO+nXTDmy5uRR1AenXt4y1/pg1EDpmqeD3z2f1p+CPzZ+9RRVt6GqUcxpqG+FeeH2Fn5y6DqeGiOazr8A6NW49DIJduChx76pAxJXvTtvmUJFtOU8YPaAhYyWlf5WlEtYGsD9HnUCDV7kHNUMXUMjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yM1u4yCkqEAz9mq9J47hjozDMbEz1XEieINgg7ldrfs=;
 b=BMHmEI67/QFRvAyFoXpN6bee9Rk7JS6+H6L6HFp1H7OqIBaYez3qopZKNM5uu2I5Jwgnst3GXsqfdI/drmGtcgGIqQbfiPl4ybpmskfx9/F3eah87+270Nx6jRdlp2IDaRqU+uC513ICGAA53FRozOMUeHr2g3TfcjDooFWc301Sd16+6xbOOYxiw8J5zyPnxzrIL2DbTZNpEZ9wgEJK4GTxV+KfbEFE+zR8J9z/l54hHU9uqIsDSMGso0q4upd3j2OGHHJVdFnAqj3JPDP8LfZjHZyHOj7P/aNGTB+9KAIATcd2+g8ApBWo83wqGqZ0iYVCu8TvwvOO07Xs0nlWrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yM1u4yCkqEAz9mq9J47hjozDMbEz1XEieINgg7ldrfs=;
 b=ekcuPFF70B92myIvbp+0VMNu/dWo4qksJOvF7kwD7TqlDjVAZnYw5k74PtTriiFdTLqbOaBICbo5lRzzJCD1bwCJDOiPH6yGlsoWZEilY4yONmoBdr9OgLZikBGxDbfhFxkGqB1s52PKvrwEfF+RweQa8AI7hrCvVwiS6RrV0pE=
Received: from BN9PR03CA0393.namprd03.prod.outlook.com (2603:10b6:408:111::8)
 by DS7PR12MB6167.namprd12.prod.outlook.com (2603:10b6:8:98::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Tue, 31 May
 2022 20:00:56 +0000
Received: from BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::50) by BN9PR03CA0393.outlook.office365.com
 (2603:10b6:408:111::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Tue, 31 May 2022 20:00:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT027.mail.protection.outlook.com (10.13.177.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 20:00:55 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 31 May
 2022 15:00:54 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v5 01/13] mm: add zone device coherent type memory support
Date: Tue, 31 May 2022 15:00:29 -0500
Message-ID: <20220531200041.24904-2-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220531200041.24904-1-alex.sierra@amd.com>
References: <20220531200041.24904-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00da9276-fb16-4737-caa0-08da43404605
X-MS-TrafficTypeDiagnostic: DS7PR12MB6167:EE_
X-Microsoft-Antispam-PRVS: <DS7PR12MB6167B874C0B9FF5D830961DEFDDC9@DS7PR12MB6167.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: colt+Qeu25eb28XOcA06MQL7hJ3XWt7AYcMxtt/n0B+rKRlCtQ0ezwk2+96BRFIUbFAYt7rTWg/TneitpRto05B0KZe+pbgdXk+lTNe8v+VfG6c7u3xsiyd8hJmi7prE15NXO/hTVUJzUh+Z343gaB9qezlJbE1NpTgVLOcYx0NltUzpB8hQ7eUmblaZU54ADA3tUBBQ+764nvl4xWZePAMBBxJaZ4r5u/jStA5iK8gtuxsYPCUNJQT0ykJrkmLFRu/z6O3qlY6pgKmvClAtHVoxZ6KSsO7iBOYOksC/WqgkJxMAGBNW9LlGOTKg9II00UTH+qGovUo2hHn0+gak9ZqwD25X7L1x5E/XKa47kWCiuJ2a6ql7Paz08eJWHALwtAtHyA1nU9uAcOWGk7T/UgOW7twxRi+QJlosVci4cvP/otmWG8ntUXhZZZJsT/JGwZu7TFmke2c7YQ42JWVVTgfXvJTjzN1r+dsyTz+I5XqqEKi2MvqqaTZUNZjZki3RRjuvsP+mQnP0jQv7WlLJk+XlBNFi8CurBhxbrUifD0PD3hxkIgpEmcLYU89JFPGJcAFFUi5YJ6CpkGELx20HEJsdJDPXQo/dEjWIOUNNVnnztdS9QFpjPVeqBiZ5QPqi2BPQvQkpoCquLSy3C0yYE6c5mFoOZI8RG+kCLQhGtKUXsKi2US5CqbSLu1Z8A8kdBhX79AtN1nLlfQJIu77Txg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(5660300002)(36860700001)(2906002)(70206006)(36756003)(70586007)(7696005)(6666004)(508600001)(26005)(316002)(8936002)(54906003)(83380400001)(44832011)(426003)(336012)(16526019)(1076003)(86362001)(186003)(40460700003)(8676002)(4326008)(81166007)(47076005)(7416002)(82310400005)(356005)(6916009)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 20:00:55.7161 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00da9276-fb16-4737-caa0-08da43404605
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6167
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
---
 include/linux/memremap.h | 19 +++++++++++++++++++
 mm/memcontrol.c          |  7 ++++---
 mm/memory-failure.c      |  8 ++++++--
 mm/memremap.c            | 10 ++++++++++
 mm/migrate_device.c      | 16 +++++++---------
 mm/rmap.c                |  5 +++--
 6 files changed, 49 insertions(+), 16 deletions(-)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 8af304f6b504..9f752ebed613 100644
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
@@ -143,6 +151,17 @@ static inline bool folio_is_device_private(const struct folio *folio)
 	return is_device_private_page(&folio->page);
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
 static inline bool is_pci_p2pdma_page(const struct page *page)
 {
 	return IS_ENABLED(CONFIG_PCI_P2PDMA) &&
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index abec50f31fe6..93f80d7ca148 100644
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
index b85661cbdc4a..0b6a0a01ee09 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -1683,12 +1683,16 @@ static int memory_failure_dev_pagemap(unsigned long pfn, int flags,
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
index 2b92e97cb25b..dbd2631b3520 100644
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
index 5bcb334cd6f2..04fac1af870b 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1957,7 +1957,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 		/* Update high watermark before we lower rss */
 		update_hiwater_rss(mm);
 
-		if (folio_is_zone_device(folio)) {
+		if (folio_is_device_private(folio)) {
 			unsigned long pfn = folio_pfn(folio);
 			swp_entry_t entry;
 			pte_t swp_pte;
@@ -2131,7 +2131,8 @@ void try_to_migrate(struct folio *folio, enum ttu_flags flags)
 					TTU_SYNC)))
 		return;
 
-	if (folio_is_zone_device(folio) && !folio_is_device_private(folio))
+	if (folio_is_zone_device(folio) &&
+	    (!folio_is_device_private(folio) && !folio_is_device_coherent(folio)))
 		return;
 
 	/*
-- 
2.32.0

