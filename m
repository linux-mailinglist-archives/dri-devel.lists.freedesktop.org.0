Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AD948A2F1
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 23:32:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2196910E254;
	Mon, 10 Jan 2022 22:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CBC410E2EA;
 Mon, 10 Jan 2022 22:32:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3FyEv3CKWv4Qo6jcRBKMX3MdVqB6gNKw6BzJTlC8ZyAoxb7YpXNTl1jXEjyNVl6q9QbpCyVx7amo4s83rphJ3UI6U4mYiG1ALT9CtQRa96s7TRHeQw5pSEllQXF2QxECccy/cNDYmfm10/6hPSMKTypvTsV67y6ozgLPwYCxDCO53TZKSiwgVeYcJvYjjQAl65uPpCbzJ19ahYZAPDnqcrSaa0jvgSq5uR8fESrS6u4pgyZcMjqFuBNKtlfPvOixtTM/qFbnN04xI43UZwn6yVn67q33mc0hmV+tMaJJrrYRdYltQiD3lr9IWLzEL8jY3msY2RBpo+1WAV64wmAlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VWmrNFdi9djrwkG+E21MHL+RHFLuEFQtQbFwBJQ054=;
 b=Uo7uliDid6Egdlq0bMzGFbdlM49kVcJmqyookTm7X1ahCle/UMjysY6kekMfPtMbCspmGT7RgZXelvAGWw7RPSqktmbAmT5Lw5hvIohbrXM1b5zGsORIdd1E6+lzkjVX+SgACcmy8C1ptsy0hEMdnkbX1iekgehi7O27Su8YrJ8Hi4To9X351qzpWGCwYV2yHG1fuHctivTilGL9kYwUA51PK1PfddYaBIbokaESVqrWnpzUEEnA/p7YIyTMZJvBbDexB9fzQ7UXP0SeCltma9qLUBchRmfcdbY/tUEiaJAFD2uMy/EQ1iAvodPoJ8v8DbJWoiK3FTogMjQ8j/gSxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VWmrNFdi9djrwkG+E21MHL+RHFLuEFQtQbFwBJQ054=;
 b=36v31871QAjKT5zPuS8EVJPpg+fKiQF6QKIfvc7WH/Jqq5+lriqL8M+IzAm/iuop+CLZhNAIhTXdHNqT9pvEFFdf6YvScFbebOohUVr1XapD0nfMccpeBJOIli53rU9WHf8NQDLSDBKDUSAzi9Nrfo0ks3QQ5KxX0AEPy9cuybE=
Received: from BN0PR04CA0145.namprd04.prod.outlook.com (2603:10b6:408:ed::30)
 by BN6PR12MB1299.namprd12.prod.outlook.com (2603:10b6:404:1d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 22:32:12 +0000
Received: from BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ed:cafe::cc) by BN0PR04CA0145.outlook.office365.com
 (2603:10b6:408:ed::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7 via Frontend
 Transport; Mon, 10 Jan 2022 22:32:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT013.mail.protection.outlook.com (10.13.176.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.9 via Frontend Transport; Mon, 10 Jan 2022 22:32:12 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 10 Jan
 2022 16:32:11 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v3 01/10] mm: add zone device coherent type memory support
Date: Mon, 10 Jan 2022 16:31:52 -0600
Message-ID: <20220110223201.31024-2-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220110223201.31024-1-alex.sierra@amd.com>
References: <20220110223201.31024-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d9a5e48-7c0f-47f2-14e5-08d9d4890c06
X-MS-TrafficTypeDiagnostic: BN6PR12MB1299:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB1299AEDFFFED834BC4F8EAAEFD509@BN6PR12MB1299.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7c6cQmQp3B0cpG724z6Qru5ZVMak+I8WTfmbOcsdccHst9IE3oNMvJG2xh2wsjdrlGi45jHZKStEuR1Bve1WkYQCPYqwI0GJZpLJrYgMNtXmB9nhuMnsbsgDsf80sERiFoi3c342i11usREk6n9IDNMXS1BI3Bvfu2ewiz3g8qcCVYfzLEYFeev/vXgtvFOehndoYvsWpCB9cQ3EPIUYYSMjBRdt8kMB3SgpgiZo6GZRE14sErTyjV95hmDR5BGB8XpqWv/nIYZu91RnYa+QP4Ikj3MpYCKcHlrJ7+GO9/Z/p+Votc1wTObfMHEPMlEVBO7UKFwxv46WDj5VXgI5S99XKPn9wIhzjqtRuaUhQgu8Rqug/GspU7krpnhwmVlf/PCdDK6OIUKVZ+nUfE0fRLr8bcQhO7VvuUH0bba2+HzkXcV6GVjmCMp40b7LDg8bxOf3z7/QjCAFR7P+bQK9FDQ+E2o1YGGMGZ4montjHrzHLpNEWhxj1DjUX6OTOrRGJ6PKdecgUooWqLyk9irRAT/EJel8WmoSOUZR/ICjGtfmWqYwTkU4pURQt/NGXx2AdhjS3bpipT68bjn92+dciz4Zg/naYtGtgmswGT1HIa/V66o7IrOz4/rUxMAniTURWudAFIyZ3aD8aUl+NIShlGM7kOAhG+At9s7x0MlnmMndsKq9xZuN1L3ZW/6QeU9nJpVwAYoOTEWl06QoIEOuDorZRioAOIIZXs++eZXf01ygNBOOzJFCYSvoSkANKtGMtUJ18puqZxTX7y6NYVLpjcl1jwBKRH0pSF2ePLrdvAo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(36840700001)(46966006)(2906002)(316002)(54906003)(110136005)(7696005)(47076005)(40460700001)(6666004)(16526019)(8936002)(336012)(356005)(186003)(508600001)(82310400004)(8676002)(44832011)(1076003)(86362001)(70206006)(2616005)(36860700001)(81166007)(83380400001)(36756003)(5660300002)(4326008)(26005)(7416002)(70586007)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 22:32:12.6500 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9a5e48-7c0f-47f2-14e5-08d9d4890c06
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1299
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
Cc: willy@infradead.org, apopple@nvidia.com, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Device memory that is cache coherent from device and CPU point of view.
This is used on platforms that have an advanced system bus (like CAPI
or CXL). Any page of a process can be migrated to such memory. However,
no one should be allowed to pin such memory so that it can always be
evicted.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 include/linux/memremap.h |  8 ++++++++
 include/linux/mm.h       | 16 ++++++++++++++++
 mm/memcontrol.c          |  6 +++---
 mm/memory-failure.c      |  8 ++++++--
 mm/memremap.c            |  5 ++++-
 mm/migrate.c             | 21 +++++++++++++--------
 6 files changed, 50 insertions(+), 14 deletions(-)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index c0e9d35889e8..ff4d398edf35 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -39,6 +39,13 @@ struct vmem_altmap {
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
@@ -59,6 +66,7 @@ struct vmem_altmap {
 enum memory_type {
 	/* 0 is reserved to catch uninitialized type fields */
 	MEMORY_DEVICE_PRIVATE = 1,
+	MEMORY_DEVICE_COHERENT,
 	MEMORY_DEVICE_FS_DAX,
 	MEMORY_DEVICE_GENERIC,
 	MEMORY_DEVICE_PCI_P2PDMA,
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 73a52aba448f..fcf96c0fc918 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1162,6 +1162,7 @@ static inline bool page_is_devmap_managed(struct page *page)
 		return false;
 	switch (page->pgmap->type) {
 	case MEMORY_DEVICE_PRIVATE:
+	case MEMORY_DEVICE_COHERENT:
 	case MEMORY_DEVICE_FS_DAX:
 		return true;
 	default:
@@ -1191,6 +1192,21 @@ static inline bool is_device_private_page(const struct page *page)
 		page->pgmap->type == MEMORY_DEVICE_PRIVATE;
 }
 
+static inline bool is_device_coherent_page(const struct page *page)
+{
+	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
+		is_zone_device_page(page) &&
+		page->pgmap->type == MEMORY_DEVICE_COHERENT;
+}
+
+static inline bool is_device_page(const struct page *page)
+{
+	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
+		is_zone_device_page(page) &&
+		(page->pgmap->type == MEMORY_DEVICE_PRIVATE ||
+		page->pgmap->type == MEMORY_DEVICE_COHERENT);
+}
+
 static inline bool is_pci_p2pdma_page(const struct page *page)
 {
 	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 6da5020a8656..d0bab0747c73 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -5695,8 +5695,8 @@ static int mem_cgroup_move_account(struct page *page,
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
@@ -5730,7 +5730,7 @@ static enum mc_target_type get_mctgt_type(struct vm_area_struct *vma,
 		 */
 		if (page_memcg(page) == mc.from) {
 			ret = MC_TARGET_PAGE;
-			if (is_device_private_page(page))
+			if (is_device_page(page))
 				ret = MC_TARGET_DEVICE;
 			if (target)
 				target->page = page;
diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index 3e6449f2102a..4cf212e5f432 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -1554,12 +1554,16 @@ static int memory_failure_dev_pagemap(unsigned long pfn, int flags,
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
index ed593bf87109..94d6a1e01d42 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -44,6 +44,7 @@ EXPORT_SYMBOL(devmap_managed_key);
 static void devmap_managed_enable_put(struct dev_pagemap *pgmap)
 {
 	if (pgmap->type == MEMORY_DEVICE_PRIVATE ||
+	    pgmap->type == MEMORY_DEVICE_COHERENT ||
 	    pgmap->type == MEMORY_DEVICE_FS_DAX)
 		static_branch_dec(&devmap_managed_key);
 }
@@ -51,6 +52,7 @@ static void devmap_managed_enable_put(struct dev_pagemap *pgmap)
 static void devmap_managed_enable_get(struct dev_pagemap *pgmap)
 {
 	if (pgmap->type == MEMORY_DEVICE_PRIVATE ||
+	    pgmap->type == MEMORY_DEVICE_COHERENT ||
 	    pgmap->type == MEMORY_DEVICE_FS_DAX)
 		static_branch_inc(&devmap_managed_key);
 }
@@ -328,6 +330,7 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 
 	switch (pgmap->type) {
 	case MEMORY_DEVICE_PRIVATE:
+	case MEMORY_DEVICE_COHERENT:
 		if (!IS_ENABLED(CONFIG_DEVICE_PRIVATE)) {
 			WARN(1, "Device private memory not supported\n");
 			return ERR_PTR(-EINVAL);
@@ -498,7 +501,7 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
 void free_devmap_managed_page(struct page *page)
 {
 	/* notify page idle for dax */
-	if (!is_device_private_page(page)) {
+	if (!is_device_page(page)) {
 		wake_up_var(&page->_refcount);
 		return;
 	}
diff --git a/mm/migrate.c b/mm/migrate.c
index 1852d787e6ab..91018880dc7f 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -362,7 +362,7 @@ static int expected_page_refs(struct address_space *mapping, struct page *page)
 	 * Device private pages have an extra refcount as they are
 	 * ZONE_DEVICE pages.
 	 */
-	expected_count += is_device_private_page(page);
+	expected_count += is_device_page(page);
 	if (mapping)
 		expected_count += thp_nr_pages(page) + page_has_private(page);
 
@@ -2503,7 +2503,7 @@ static bool migrate_vma_check_page(struct page *page)
 		 * FIXME proper solution is to rework migration_entry_wait() so
 		 * it does not need to take a reference on page.
 		 */
-		return is_device_private_page(page);
+		return is_device_page(page);
 	}
 
 	/* For file back page */
@@ -2791,7 +2791,7 @@ EXPORT_SYMBOL(migrate_vma_setup);
  *     handle_pte_fault()
  *       do_anonymous_page()
  * to map in an anonymous zero page but the struct page will be a ZONE_DEVICE
- * private page.
+ * private or coherent page.
  */
 static void migrate_vma_insert_page(struct migrate_vma *migrate,
 				    unsigned long addr,
@@ -2867,10 +2867,15 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 				swp_entry = make_readable_device_private_entry(
 							page_to_pfn(page));
 			entry = swp_entry_to_pte(swp_entry);
+		} else if (is_device_coherent_page(page)) {
+			entry = pte_mkold(mk_pte(page,
+						 READ_ONCE(vma->vm_page_prot)));
+			if (vma->vm_flags & VM_WRITE)
+				entry = pte_mkwrite(pte_mkdirty(entry));
 		} else {
 			/*
-			 * For now we only support migrating to un-addressable
-			 * device memory.
+			 * We support migrating to private and coherent types
+			 * for device zone memory.
 			 */
 			pr_warn_once("Unsupported ZONE_DEVICE page type.\n");
 			goto abort;
@@ -2976,10 +2981,10 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 		mapping = page_mapping(page);
 
 		if (is_zone_device_page(newpage)) {
-			if (is_device_private_page(newpage)) {
+			if (is_device_page(newpage)) {
 				/*
-				 * For now only support private anonymous when
-				 * migrating to un-addressable device memory.
+				 * For now only support private and coherent
+				 * anonymous when migrating to device memory.
 				 */
 				if (mapping) {
 					migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
-- 
2.32.0

