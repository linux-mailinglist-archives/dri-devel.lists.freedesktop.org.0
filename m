Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFFD55BC92
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 02:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF7B10E564;
	Tue, 28 Jun 2022 00:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 068EC10E01F;
 Tue, 28 Jun 2022 00:15:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oE6fZ8I0jMr6WZrifI9JShD67W/ewuqHSC8Oyp9NQfKizgfoq8X88Iil+k7Gq/z0meROiiEvo0bzRYMZy2GU6bfirjahzSlbZclMuw2pO6/AU1HoUEo3QW5Uagjfmky/stsSfvk1M3tZcxogQh23xW9HhtlOGJxboQeps6mh2M3QAtXR+jNf6loJSAn/H0UzqJkS73DegQNDvLwCOkobuQM3Oo+m+0RLoW6U+46Eurp58Qy0I+GrmAg37ifh8ddcz+tGcA+Hf/mPJiKZzHFxTmCXipzcB44ij4tmq4Oe564OJH4aUb7qKd5Sht89ecpQ400AWBTc6iHQaClXs7hzTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NN0fSNUfIviFYWrAMIMXsV6Hsd+z0eNwwBrjR/TyjQM=;
 b=LwWe0Plt8oHjzwUyliTcVhYSni4phhqLrw1AcH3wjUSnmizbeqrHcWpo4buuV3lYWn2k9r0EZ12Umkc63ypfiz4x5LQ45XgD8+kXa5gsiItpti3c/xnBzqdGfoWfpTc/ZKHxsypimVPjWxBFqoHMpYgkE/7HDoJBxGNuxOyLM7Hhujt7PKhjVAhDdtjmy/ozT9FUTG4xO6PHnxdJij5fjl0rA2QJ2N0w/XB4Xzjf6GM/XsVn9ggDZbpzTfntcOeOxusT6SuVEeEphZUOnoFbhp75O43vU2Y9pDhAwtsZYtTLnmlsztiLYg4cZtHK2oeL/7h+Frv2eaP55dM1THjl4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NN0fSNUfIviFYWrAMIMXsV6Hsd+z0eNwwBrjR/TyjQM=;
 b=LGRGIb/Dqrq45ICJ3ltbqgNYYCsxnCJjqmM09w2B0HmmvnsySU0E/m51EfeoWeWt0Vayf17g1979lVoEF1ev3wJ/Fo26e1iYtA3E1+WLEpjcFD8SjJF8ygM1nKimLjKPu5G7j0XObt/LRbw085ADRXXNiBPQDBK2rjhuQZXSK2M=
Received: from MWHPR15CA0071.namprd15.prod.outlook.com (2603:10b6:301:4c::33)
 by DM5PR1201MB0156.namprd12.prod.outlook.com (2603:10b6:4:59::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Tue, 28 Jun
 2022 00:15:21 +0000
Received: from CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4c:cafe::fe) by MWHPR15CA0071.outlook.office365.com
 (2603:10b6:301:4c::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.21 via Frontend
 Transport; Tue, 28 Jun 2022 00:15:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT009.mail.protection.outlook.com (10.13.175.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Tue, 28 Jun 2022 00:15:21 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 27 Jun
 2022 19:15:19 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v6 01/14] mm: add zone device coherent type memory support
Date: Mon, 27 Jun 2022 19:14:41 -0500
Message-ID: <20220628001454.3503-2-alex.sierra@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 409e7f1a-17dc-4c6d-5fbd-08da589b4a45
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0156:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u1DjzDxF3dMAGFSp97zu9ayedEP7+drZsuobDdeFUHq9JRD8QHSbv9s7E1illC2Vc8XzEM3Ai9ZBr6Ypb6aNLi6FE2t2ScOp5gB7S6U3ljTb15yfviPxu1Y9wnIP6N39JUEFFSl0ttAvTbQihPSoGaYq4PiVjF3yVf/Y7WZKoKvCm/LEEuZSg+Q1N+SU0RlYSHDZQmimy+iVHaj8V+lMFOnEk/qgXbqmFYsf6TRgDsbLYFshnsk6sR9TMzmCdOJmqX6GeFnXxqr6d4T52JNydUEpWrYdEIiIa440kPm6Jt2JNJoLPQyQPj+VMJIP5HSwxW7uhNZmwVc2FseIiL/yZeGx0EyyCzOCXSV1fOTp23cBACGxH8dHSPTUue55xwUpLdRqw3flO02iRXNzSfhkLkVa290A42Fxu/ys5HF4a5OcFqhJR4FXZl/ObgxEDdz71JLJ5yP5MqmAe7pTRsBZXLknuGT87Qlysb33vJwZrGX8na3O4p2t7Vp5+bOoE/1dk/EJrfsxhSBh1mocxlQ54PqKs1zer73DgAUNmNEQysn78BLx0DJW8GeH+OUYRgYwzwtH/zO4b9a1s4aQ1SAOrO/ZKTWpVUz+OAoxzsQoqHIW3+0FPTKI7pEjQob6rYeqmCSnnssu8e9o6QUAw9oG4S3p5/wr44lncKlQuWuUUiPTNsjrbvd0b/qXOqevZN0D57Bv6T+2XLxaa0g1AEHC8D49DooTx4mDQuLVlH6eCMbjaXsd1QAixznrwPt1i7dFg+MctN+MN68Ij39LeMBrgUg/ZejpWmRC9anRaC+QLturfvpCBcS0iraSI9mq2RemXDVsmDDHpZZDATJ+nmEsQQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(396003)(346002)(376002)(46966006)(40470700004)(36840700001)(4326008)(70586007)(8676002)(36860700001)(70206006)(83380400001)(81166007)(8936002)(44832011)(426003)(7696005)(47076005)(40460700003)(356005)(478600001)(40480700001)(26005)(82740400003)(16526019)(336012)(186003)(7416002)(5660300002)(36756003)(82310400005)(1076003)(2906002)(6916009)(316002)(6666004)(54906003)(2616005)(41300700001)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 00:15:21.3707 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 409e7f1a-17dc-4c6d-5fbd-08da589b4a45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0156
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

