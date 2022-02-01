Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B01DE4A6096
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 16:49:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755F510E6A5;
	Tue,  1 Feb 2022 15:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA6810E69F;
 Tue,  1 Feb 2022 15:49:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PEDip/9jomnVr7NihwMFTlL/1WSPR7G3NL4pZangvQhZZXt90Opjj+r3NRWs8zbQ/EzU28aBnceBM9kbW/Io3vU3z7A5OiE56Z5HBL7TBGq65ZtP4mNXrg9mjLn/HKKUF7jL7JG+uak/TC20XpMG5KXAu+Rg2vrhJF3P0NskDf/5SZ22OwgmdAnN3r0js9VZJVZtiN3r4UchWLflOOCVAmV/gNerZLDAFhEWTKRlSj2uaXoSJqZv0vcEplUY9tutNFK93uhO2LGcuFFj3IiGYNVBMNvo2jbUJ0aydHD8t3qsgtOPeGGkxRpy3S69wADofq7j1Pb+0AJqFuGukE5YpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T4njNIIT68+hA4HQaRdLZevr0Po5/efULOp/iluBl5Q=;
 b=iIoXXzqNS+YCI2N0Pw+pSapdyfFpNFVpGUifZog3K8IsssJq3QNYeYJyKZprt0QK3LeP3W8dWd3fWJCvlvlo4F4bGwnNovRWFpXbcsG0niz99JqEAk/UNVfXzmm3zCoMQR/kVLejnBXr0qQJ2n9LTT2gcGXByEQKCkOqXNqfa0muMpWqbqflG4YiDs5tPXX7U8EYapjSJvwtSBW9jRQO8nT5aDs76w2G3GBODT6H1iLRqked6mQ1ZpVJMBxJNURWfiG2c63jIqhYFsg0Zr5mBKVGR/6s50mxaSQL9aUXMZu/aHc9kmQLRIuLD/JzX8L/p7At6Q4ISPKX8ssT1OXDfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4njNIIT68+hA4HQaRdLZevr0Po5/efULOp/iluBl5Q=;
 b=yBAcTpmLsy/yz3ZCi8UDZJ6cZi0HU3pUQcDZRTq0QqUUTxyTER310wwxMaPrElviNPAGV7HwzyiS8s71GFOpc61isPuMpEDhTk1e3JntWoP/IeKil9eGYfHgtaKIgoPhHzNJW1nMV1VL2A7tsABP6tir/9n7Qx7fpB5xH5n78SE=
Received: from BN0PR04CA0050.namprd04.prod.outlook.com (2603:10b6:408:e8::25)
 by MWHPR12MB1438.namprd12.prod.outlook.com (2603:10b6:300:14::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Tue, 1 Feb
 2022 15:49:14 +0000
Received: from BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::c3) by BN0PR04CA0050.outlook.office365.com
 (2603:10b6:408:e8::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Tue, 1 Feb 2022 15:49:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT008.mail.protection.outlook.com (10.13.177.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Tue, 1 Feb 2022 15:49:13 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 1 Feb
 2022 09:49:12 -0600
From: Alex Sierra <alex.sierra@amd.com>
To: <akpm@linux-foundation.org>, <Felix.Kuehling@amd.com>,
 <linux-mm@kvack.org>, <rcampbell@nvidia.com>, <linux-ext4@vger.kernel.org>,
 <linux-xfs@vger.kernel.org>
Subject: [PATCH v6 01/10] mm: add zone device coherent type memory support
Date: Tue, 1 Feb 2022 09:48:52 -0600
Message-ID: <20220201154901.7921-2-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220201154901.7921-1-alex.sierra@amd.com>
References: <20220201154901.7921-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef455a45-0663-4a2a-ca90-08d9e59a6538
X-MS-TrafficTypeDiagnostic: MWHPR12MB1438:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1438B6AF6ECAE67E76DA4DEDFD269@MWHPR12MB1438.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yVvqZxnsD2cAdNeIC6XIPgAkmQ3DfaGDtSIw53i2DU+AsRo6XpxBZfqVoDT/Lzu1Ww9v3sgRqAbiSd0Zg7Vh1ywac92YMDHPWS82JHjECN5lhFalOFxUJ/nazliXGfDxJvbMRULSIz0t93DpiXQfLmqunArig0LIuzNSP2hV3hJXg13kMV4yKUF7MK63MaTmHjp1q8zKZ1Q5vepaGSUlWgrN4S3QTldt4AGZibx8SXWmnMhEmJRZo7Fuhbzs97VHNKYzytKXmbqG3f2WlX6L1h20t5fNdY+guXzpDg59IoTXe8R892dpHBViQrFgmrjnzZ67wfZkJ9Pz/PUTDKcR2HYT6spWjonC5aga1QFVb0tsmh7IA5rbrHuuiEmopPfKgFoyMJhCerEFM20D0p+lSIHKOuYFx/7F+ERZKx4krAGdDTQlTru7oPpVH4iRr1MKkTkvy3iac3zNYAzO1QV6Siun4dv+mz/B4dzOnnBwrrm9gJv+wytsbuBpOVdQwmxaCXjU6Ensrzh/ZFU8GJctkoenPYJLjMlSPklvHiAt72aEEfvVYoEud4QjSbl2fpAPt0pbBzdy4OiHNk0DEsIfxJJwIawxXc7Mt+D+CdfqxSe+Kkvk7hyDcq14ZwB57rLyazap8rwtI7e891lsL9D8SsPkWgiul6EVCYJ52IJjW7dPhi2jXenn2CAvqRigA1IuyK03MUZfQKsygiy7zxBytA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(36860700001)(86362001)(81166007)(82310400004)(8936002)(8676002)(2906002)(4326008)(47076005)(356005)(83380400001)(7696005)(7416002)(70206006)(70586007)(44832011)(1076003)(6666004)(54906003)(508600001)(110136005)(36756003)(186003)(5660300002)(40460700003)(16526019)(26005)(336012)(426003)(316002)(2616005)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 15:49:13.4799 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef455a45-0663-4a2a-ca90-08d9e59a6538
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1438
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
Reviewed-by: Alistair Popple <apopple@nvidia.com>
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
index 213cc569b192..545f41da9fe9 100644
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
index 97a9ed8f87a9..f498ed3ece79 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -1617,12 +1617,16 @@ static int memory_failure_dev_pagemap(unsigned long pfn, int flags,
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

