Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA25F4A018C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 21:09:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0D710E29F;
	Fri, 28 Jan 2022 20:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58DAE10E166;
 Fri, 28 Jan 2022 20:08:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjnMMx1wIBzvr25m46B91NmVPu6JgAaV7aTiRDFFn6g17a+QC0fgCxVAqSzsgAjTaME2fmmgreI/Ng6Ch5BmJHjjjZvKHZ7DNS6jMynhCO1adrWpA55r954niePRgOElSTJgXgQxljejqQjSjwSG8rIhVStMjRJ4Ry3U68qelQo1xgrSgJUBCpwZZQZa4WWO6daEXS3uacRXZkLTTF6DMw/P8LQZXXnCO4aODqSR6oznRfk9vH5WScgidOykceMslwb5Okq4ax//ECEFmebS2yBQaBwFILNzVWudfJ7YexXZj6czHBsyvbFJGjoWXduOBqd9y7ROfwNmutUKe0R/9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PuwfeGeE5I/FSXtvEGZr/OzhwQjI4rp7xydDYOM980A=;
 b=PXk+hqgJO26dyWL+aVWNbVfEmh7gGk9UKaQTrZSJZTYBiilxAjxA+iE0eReMIY+3GBHGIVZ+UJ4bowTUy1wOOy4RoKah+xYHp7kH6vjfMGNIik0xpYsIY8+Pph3HhpxxCOsCLiLhoUGlpy5rad3rmCBiV6rPiflKvKfE5MtAPSAMenUtGAJ/zUVdH96bdTHBKsSs6tRFMP2uTGJcOQwkKh6Hzz+NZPRsMZWefaq3RwqYfUjHbMKPw/Z0YCBl8fhezJRRIyUCMCi2CR6etDalkQk9+XofhAP48gqohi88yD0AxMbqxuV+kh2wmbuM9aO6hhARdE4PeIIWlXN8B4W8sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PuwfeGeE5I/FSXtvEGZr/OzhwQjI4rp7xydDYOM980A=;
 b=m6+2YqujAgNE+d2TSacHgv96PWpbtINISQAeLquBUCWDpCkhGLQdLuQxCumS79XdLnPN+CG27z/khRnNorYRd++8W+/0pj+s174bUO4vndado1vwEPOCQcRtSvTHiOs7YCTXf0+G6tgZmb+JsvrweemaCeJ57z9tdKh0P3w4gQE=
Received: from MWHPR19CA0065.namprd19.prod.outlook.com (2603:10b6:300:94::27)
 by MW4PR12MB5626.namprd12.prod.outlook.com (2603:10b6:303:169::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.14; Fri, 28 Jan
 2022 20:08:52 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:94:cafe::78) by MWHPR19CA0065.outlook.office365.com
 (2603:10b6:300:94::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19 via Frontend
 Transport; Fri, 28 Jan 2022 20:08:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Fri, 28 Jan 2022 20:08:52 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 28 Jan
 2022 14:08:50 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v5 01/10] mm: add zone device coherent type memory support
Date: Fri, 28 Jan 2022 14:08:16 -0600
Message-ID: <20220128200825.8623-2-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220128200825.8623-1-alex.sierra@amd.com>
References: <20220128200825.8623-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f066628-503b-474d-2490-08d9e29a0173
X-MS-TrafficTypeDiagnostic: MW4PR12MB5626:EE_
X-Microsoft-Antispam-PRVS: <MW4PR12MB562626AB9A2A0EC4B071AB3BFD229@MW4PR12MB5626.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5UfhSjOxDBgrQK6PkOhRDu7CjGPzdsHs2hW0HykB1yGXMSq68PqCr3PX7Pj8Hca+/dhvW5z1Le7J7sl8ih+cXsLyIBZkK6TyA9ySVHgu2Mz6F0wYy42YncHD89Aa9qZ0aALopLk6WQpmZRWhBPls2rCNGexukpKdVQmpiEtHNjB68CQ/VJ51i+9DmAAqFIyZdNEI9VkOZTgWAM1XhmU4QInQ9f5XPT1C3KSh+BGk+Id/gHU57k0bSLO7y10FrVchPdrc/U63IAclBY49k3dsnqyHCJCll+K7Q982LLzKn77m6lGMPJgRxRqe4GzltqzmTX1V/wHDhm9GV2+Mao4mNZUzf6Ho1rHoFPKKn6+Dqe4cdjEp1ysZgtU6PIQPGp2kJ33F7RZ7SRkCLYum/FAD6be2Vfyl25nOjedrIJCrZwVH2iwY8kwHjW0QUvV6gjf1IdkzgIsCwVmAYOk0oPYcn4lY6Ne6JsdOKizTpiiY4OA7niZ+fQi8sKkGSBJQ3WBkA9dVVft0+tj3fTV7anGNgVlnjk49almZr+kDOT0N1Jrcp5NIo05Fhgi+upxe2r4SDT668S3wkfT7FoYAQvSMhjNu84Ddny86mmektb2cqehNnA+hVB72SJMiXG2sDtceOTXeo5Xe0YRMn1d3Qh0o+HCzUMJsbRbnpPjvOA6S9+rY4msB70oaVARZOkBsfzz8wY5Fr7ZotKV4Pa+bafT4UMER18nEF4tHE9zfnLr3gRJnEDqr/nOKCDbVZ5IQfxdQqKH2Doiux0tfmIpl9/i6y5lTnPPqzkLujBTWswXg9PU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(40470700004)(36840700001)(336012)(86362001)(36860700001)(110136005)(2616005)(7696005)(47076005)(16526019)(508600001)(8676002)(186003)(5660300002)(6666004)(316002)(1076003)(81166007)(70586007)(70206006)(8936002)(44832011)(2906002)(36756003)(356005)(4326008)(83380400001)(26005)(7416002)(426003)(54906003)(82310400004)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 20:08:52.4925 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f066628-503b-474d-2490-08d9e29a0173
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5626
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
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
v4:
- use the same system entry path for coherent device pages at
migrate_vma_insert_page.

- Add coherent device type support for try_to_migrate /
try_to_migrate_one.
---
 include/linux/memremap.h |  8 +++++++
 include/linux/mm.h       | 16 ++++++++++++++
 mm/memcontrol.c          |  6 +++---
 mm/memory-failure.c      |  8 +++++--
 mm/memremap.c            | 14 ++++++++++++-
 mm/migrate.c             | 45 ++++++++++++++++++++--------------------
 mm/rmap.c                |  5 +++--
 7 files changed, 71 insertions(+), 31 deletions(-)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 1fafcc38acba..727b8c789193 100644
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
index e1a84b1e6787..0c61bf40edef 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1106,6 +1106,7 @@ static inline bool page_is_devmap_managed(struct page *page)
 		return false;
 	switch (page->pgmap->type) {
 	case MEMORY_DEVICE_PRIVATE:
+	case MEMORY_DEVICE_COHERENT:
 	case MEMORY_DEVICE_FS_DAX:
 		return true;
 	default:
@@ -1135,6 +1136,21 @@ static inline bool is_device_private_page(const struct page *page)
 		page->pgmap->type == MEMORY_DEVICE_PRIVATE;
 }
 
+static inline bool is_device_coherent_page(const struct page *page)
+{
+	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
+		is_zone_device_page(page) &&
+		page->pgmap->type == MEMORY_DEVICE_COHERENT;
+}
+
+static inline bool is_dev_private_or_coherent_page(const struct page *page)
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
index 09d342c7cbd0..0882b5b2a857 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -5691,8 +5691,8 @@ static int mem_cgroup_move_account(struct page *page,
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
@@ -5726,7 +5726,7 @@ static enum mc_target_type get_mctgt_type(struct vm_area_struct *vma,
 		 */
 		if (page_memcg(page) == mc.from) {
 			ret = MC_TARGET_PAGE;
-			if (is_device_private_page(page))
+			if (is_dev_private_or_coherent_page(page))
 				ret = MC_TARGET_DEVICE;
 			if (target)
 				target->page = page;
diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index 14ae5c18e776..e83740f7f05e 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -1611,12 +1611,16 @@ static int memory_failure_dev_pagemap(unsigned long pfn, int flags,
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
index 6aa5f0c2d11f..354c8027823f 100644
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
@@ -327,6 +329,16 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
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
 		if (!IS_ENABLED(CONFIG_ZONE_DEVICE) ||
 		    IS_ENABLED(CONFIG_FS_DAX_LIMITED)) {
@@ -469,7 +481,7 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
 void free_devmap_managed_page(struct page *page)
 {
 	/* notify page idle for dax */
-	if (!is_device_private_page(page)) {
+	if (!is_dev_private_or_coherent_page(page)) {
 		wake_up_var(&page->_refcount);
 		return;
 	}
diff --git a/mm/migrate.c b/mm/migrate.c
index c7da064b4781..cd137aedcfe5 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -345,7 +345,7 @@ static int expected_page_refs(struct address_space *mapping, struct page *page)
 	 * Device private pages have an extra refcount as they are
 	 * ZONE_DEVICE pages.
 	 */
-	expected_count += is_device_private_page(page);
+	expected_count += is_dev_private_or_coherent_page(page);
 	if (mapping)
 		expected_count += compound_nr(page) + page_has_private(page);
 
@@ -2611,7 +2611,7 @@ EXPORT_SYMBOL(migrate_vma_setup);
  *     handle_pte_fault()
  *       do_anonymous_page()
  * to map in an anonymous zero page but the struct page will be a ZONE_DEVICE
- * private page.
+ * private or coherent page.
  */
 static void migrate_vma_insert_page(struct migrate_vma *migrate,
 				    unsigned long addr,
@@ -2676,25 +2676,24 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 	 */
 	__SetPageUptodate(page);
 
-	if (is_zone_device_page(page)) {
-		if (is_device_private_page(page)) {
-			swp_entry_t swp_entry;
+	if (is_device_private_page(page)) {
+		swp_entry_t swp_entry;
 
-			if (vma->vm_flags & VM_WRITE)
-				swp_entry = make_writable_device_private_entry(
-							page_to_pfn(page));
-			else
-				swp_entry = make_readable_device_private_entry(
-							page_to_pfn(page));
-			entry = swp_entry_to_pte(swp_entry);
-		} else {
-			/*
-			 * For now we only support migrating to un-addressable
-			 * device memory.
-			 */
-			pr_warn_once("Unsupported ZONE_DEVICE page type.\n");
-			goto abort;
-		}
+		if (vma->vm_flags & VM_WRITE)
+			swp_entry = make_writable_device_private_entry(
+						page_to_pfn(page));
+		else
+			swp_entry = make_readable_device_private_entry(
+						page_to_pfn(page));
+		entry = swp_entry_to_pte(swp_entry);
+	} else if (is_zone_device_page(page) &&
+		   !is_device_coherent_page(page)) {
+		/*
+		 * We support migrating to private and coherent types
+		 * for device zone memory.
+		 */
+		pr_warn_once("Unsupported ZONE_DEVICE page type.\n");
+		goto abort;
 	} else {
 		entry = mk_pte(page, vma->vm_page_prot);
 		if (vma->vm_flags & VM_WRITE)
@@ -2796,10 +2795,10 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 		mapping = page_mapping(page);
 
 		if (is_zone_device_page(newpage)) {
-			if (is_device_private_page(newpage)) {
+			if (is_dev_private_or_coherent_page(newpage)) {
 				/*
-				 * For now only support private anonymous when
-				 * migrating to un-addressable device memory.
+				 * For now only support private and coherent
+				 * anonymous when migrating to device memory.
 				 */
 				if (mapping) {
 					migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
diff --git a/mm/rmap.c b/mm/rmap.c
index 6a1e8c7f6213..f2bd5a3da72c 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1835,7 +1835,7 @@ static bool try_to_migrate_one(struct page *page, struct vm_area_struct *vma,
 		/* Update high watermark before we lower rss */
 		update_hiwater_rss(mm);
 
-		if (is_zone_device_page(page)) {
+		if (is_device_private_page(page)) {
 			unsigned long pfn = page_to_pfn(page);
 			swp_entry_t entry;
 			pte_t swp_pte;
@@ -1976,7 +1976,8 @@ void try_to_migrate(struct page *page, enum ttu_flags flags)
 					TTU_SYNC)))
 		return;
 
-	if (is_zone_device_page(page) && !is_device_private_page(page))
+	if (is_zone_device_page(page) &&
+	    !is_dev_private_or_coherent_page(page))
 		return;
 
 	/*
-- 
2.32.0

