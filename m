Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 010CF539466
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 17:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D70EB10F1C8;
	Tue, 31 May 2022 15:56:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2076.outbound.protection.outlook.com [40.107.96.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F326910F1C8;
 Tue, 31 May 2022 15:56:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lV3NFX8vWvVzoj4b2f4wXaxD66XGtyoEshJvqbgMnoN91bwoxONLLD4gPlSCRFjpm4XeuF8RyK2VHad0fPApGdxbVCAqwGdCuZ8v1k3KtPJ7PdcfmOyP5OkIE9jbRgb4ve/o0xey5z9Fq86sM9OJq6XbLXavLuzi8W+aLXelm4SPpj3uY8q+11uhS48D9tnTbxab/xbDw56+nrXc8buqT/3EbKGpIXBMtjN/lYu65PYPt7Zhxg1cUwgcypJvoH+GG1F26qnV+5xNU81C6A5gRmzLuqsDGmSFNPYn2syTqO7VPE1WXWFyUp8GpVjICj2d0StN10WnzSMn5P14cTrasw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yM1u4yCkqEAz9mq9J47hjozDMbEz1XEieINgg7ldrfs=;
 b=NTIDymA6KRVpfvKUa1ZsmcJCVgOBjXzx9W4/AdJDZFbkbmPGODdbP+5bzNxeDP+rIj77IlWqyxOqq/e2EL28XEcvPgV/iNdDGcX5gKMzLAbOBv4OvnSd8V1MYSHNyTW+xJjUTA9qkJMymK63fT/zFAZNxWaXVzUD5LsmV9kwTBrWd31kt+KDw5HI6mR+Bj+2S03P+6vSjzkz8K9WJVO2LFCCCGCY/1xMYvqZ4dilXceIeM9i3RsdI7bNIPkFxfQL8RBt/wdaXE4OzQPdSvzfQcEsN5RnUrmBtazgpYG8FRpObZpAzQs42CTnpeQY0h0tiazaumTUJvpl6aCaKqy7YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yM1u4yCkqEAz9mq9J47hjozDMbEz1XEieINgg7ldrfs=;
 b=tYndGtoAG/6aevOTiwohYgQVdq9AY4z6CLJImNu0ztwLVkazhawsoYNKRIPm2DqDMT7/g1wxBojIgSkl2MFO5ztFQ6cn9oktRnHNWcfUlr6/vB0qRLBniiU+IlKP/3hmSUAlkDdaIs3fvWHkxZFQE2eUnsCCBbgxj8f6CuCW+mg=
Received: from BN6PR13CA0050.namprd13.prod.outlook.com (2603:10b6:404:11::12)
 by MWHPR12MB1214.namprd12.prod.outlook.com (2603:10b6:300:e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.15; Tue, 31 May
 2022 15:56:41 +0000
Received: from BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:11:cafe::5f) by BN6PR13CA0050.outlook.office365.com
 (2603:10b6:404:11::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12 via Frontend
 Transport; Tue, 31 May 2022 15:56:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT053.mail.protection.outlook.com (10.13.177.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 15:56:40 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 31 May
 2022 10:56:39 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v4 01/13] mm: add zone device coherent type memory support
Date: Tue, 31 May 2022 10:56:17 -0500
Message-ID: <20220531155629.20057-2-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220531155629.20057-1-alex.sierra@amd.com>
References: <20220531155629.20057-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a80e9a18-f1ca-4b70-bab7-08da431e26f8
X-MS-TrafficTypeDiagnostic: MWHPR12MB1214:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB12147AB1CDCC3F05F9F7D8EAFDDC9@MWHPR12MB1214.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1XtWpGgGB3ur3sx+ublBcvdCwpKj+ELF3V1wChAXl7sfUFqf5PKhZMHJ8RQSsXaw9/LE6wVJIW6qT6WIl/1tr4+vdp7/q9ttYoqfWvShjBNpqDMExwUrJQKO33o1EhVeMkdhF3lAuYhFpnRTEAxyeNld5KIUgrQc+tJ1S8tZMFK8CBPjAtSreZjWSrfFaWEa3xsH7LB5jlzi3MO8C61lFRD+bQU7Yno1tkG9Xfj3U+Fp6nS9lqDvBsuN3fCf6bG08ryS4QCIOKwlaHmFgK5uPFM9WKoZdC/xqJajsggapqbLSLr9U2yfntCITANy2mVpR61+Rq1kIQIv6Q57WfmpdbM9Y4q2z1bwE4N5KHKhE8P8vCti9bGJ6X4NyecAnVJa/LOz7KKz/MLnAE94QfNgaQmFaZ2E4l0AnM7wzn1BquQOAMUp9AbD2Ueerg4k+sHzXVKjnGDjFTRJdj3Xe+uyif2+LWt1g9Szh4TjlJPIPXmUKx16t/mwUQZxgMwucmnM9MFovDopocDb/vxk6V4JWW0WQdsQFCddXv7Ci8NshTjLz4rgD+nnZQjknprpWXQqWc3tNXk+blNubNURJbrTJe8lCL7g6+gMf8Xa2QLQLoxMMDEH6rYsVJHmVgSG6GrsjaEy4EOD1HukUA4bAxY3VbXpD7oDedTiel6Egj1X/3H0SV+y3zR/yjE8t46/DQYZRwEiw2Q1iqvWV+mrNGwU0g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(81166007)(356005)(44832011)(36860700001)(82310400005)(316002)(40460700003)(26005)(54906003)(6916009)(70586007)(47076005)(70206006)(4326008)(508600001)(36756003)(86362001)(7696005)(6666004)(1076003)(2906002)(83380400001)(2616005)(426003)(16526019)(336012)(186003)(5660300002)(8936002)(7416002)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 15:56:40.7636 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a80e9a18-f1ca-4b70-bab7-08da431e26f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1214
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

