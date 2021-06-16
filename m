Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD063A986F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 13:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B976E584;
	Wed, 16 Jun 2021 11:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643FE6E57E;
 Wed, 16 Jun 2021 11:00:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TmM/8ierUtFCJ1dTnwB850CXbHhZY4LO828DONUVSPdPbD9Zdc5ReAdYmcO3ua4+RefXgGcbJgXZjjmBFu/rVccJczB6DgTwHr5IOo+0reAWqNSK07ip02CddOK7W9Hf08WjkwUyeuEQjmbMb97tKfuMjy22hycV9cNN26dRAORqGOfJs8dtVMrEEfwPz1VpVUaP07mT7xL5mfIdPuWv5NtiJkEBYrzAonObbXc2j1Ecx0eYJU82R60yoyXwnCL0WAGsoDz9fmNte+6zYpb0IaDosBPcFTQft0IIAvLSjkxJPcTZaw5FtYgW7/uYm3Nd6dZd83RFtKtIZbkq+pTvGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=neaWBJ+Tc9JkIqo7kSAPBlmsmNPY65opDVhb25wScLE=;
 b=mrHaT4xZfD/Ve1bmh2BaDzWwUC1iqs8hjLPDN4nd1VEsBHy8mYYP8Y9m8ynmu/hPXKNZ7fwvSzu5+yesxrGvncl0YXrgG/gliRvDx971u5MV5n8zzcYJIKZI1n2gSctJMjs52XN5zRmQC7eNvN2yaFoWOxKnw1KcBkCUSWKeAKUgMG1pcBr9LARnyEa0Ii6k84OK2Y/ZjjWLEjg3wEbQeNKpiFKG6H8AJ5JXMuwaNkDIzxNUQjW3dwP1G5F8Udv033wIZ/BCOsF8HEfqR2BID0vPGmFQW2huMtMQeGfzxZUzNq0BLwNPyo8SmBrurSCDnuP2E+6z81s39kwDJGKd1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=neaWBJ+Tc9JkIqo7kSAPBlmsmNPY65opDVhb25wScLE=;
 b=t1QOxuBIMWgjUVqhBCUD8Vs155M0R5PoJERVU9g1VUD6SabqWqhUJg7+B6X5pV/J86eyqy8aTmT3kWpSM8eWUEbjh4wogxecWDz0Sdemq8qwOH1unGByfuxLnz1i1vonGX9uGeA9E+wuMKyQ8tNtVYQNMkwGs0C7Erhg3LF4pQYsrsH1LqSB2xyIVOOCr4BcuKBzleA0b12NtJesjZhfSn5Qb02a0+3rJaQSvQlgZp6vjPc9RXdPAzQMapWSAKJOtpmWTjoz7Hpg2oNwJ5XGasuEgHrP/9kq9oKK5Kunk88X1SMV46uTLEB+IgWs9nNN+iaRZTId0ihiAR8LdpSdww==
Received: from BN6PR13CA0004.namprd13.prod.outlook.com (2603:10b6:404:10a::14)
 by MWHPR12MB1261.namprd12.prod.outlook.com (2603:10b6:300:10::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Wed, 16 Jun
 2021 11:00:47 +0000
Received: from BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:10a:cafe::7d) by BN6PR13CA0004.outlook.office365.com
 (2603:10b6:404:10a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.7 via Frontend
 Transport; Wed, 16 Jun 2021 11:00:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT031.mail.protection.outlook.com (10.13.177.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4242.16 via Frontend Transport; Wed, 16 Jun 2021 11:00:47 +0000
Received: from localhost (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 16 Jun
 2021 11:00:45 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>
Subject: [PATCH v11 02/10] mm/swapops: Rework swap entry manipulation code
Date: Wed, 16 Jun 2021 20:59:29 +1000
Message-ID: <20210616105937.23201-3-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210616105937.23201-1-apopple@nvidia.com>
References: <20210616105937.23201-1-apopple@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10cedde1-3cb0-4a65-d764-08d930b5fee3
X-MS-TrafficTypeDiagnostic: MWHPR12MB1261:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1261DB64858124E9B556CCD5DF0F9@MWHPR12MB1261.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9eCRXJtenxs6WwYBr5j3z5ej+LzJN6t2rGlZD2mPJS//CQeaSp9R/C2ChTiDBcv4ttpQz9y3VxXJAJc699v+KZjDuyKmOSuFX+YMdp+svQHIVNqOesSwXi3pMJxETRPz1zwvuuvDQYsESrUSsQBt0mGHtaV77ZzEQbO43wl6tCu7t35B98C/sbyDYrYl1B3Yf4JfclKeIv4WUHg3NOkNPV9XDeL1euD83KLr89Mi6tBXwAGB2wuaq3jfVNvOp0qQI1Zat0AKqYj9r9h9DH3xbE3h/9vAqIQMoXL90TrBSFufATPZrYxw/SoQzl8quEGLotT873HLsHr91AUIbQcEwbayT4DiAma8yoU/6cpSqSRsY1+91JJFHE3X+sP/QDZHopeA/Y2JxB1M71fngsuhfHNB0jECDeTFNg2Zgq/5OwW8pj+vX1YPbk9PoDxTlrTI8BPH3E/aaXxVBWjyjVUrOC3UGY8VDDxToTsIPzeScEr8wNtScl4U7uhoIIipWHVbxwAXrDyGXKScth3WJ5VyZikBNjNWYGTYOgROi/s5ijIGd7W1BkY/zx7IJYFRFlPwz77clxLHcDKAJCxUJpVOJnUmRk++vshvzOk+1GET5ikSu58kF1HO3fYoKWbZ108YblGtYolTWIhxAH0W5Abo60wEvQJ5wB8ksnxABBx5Vt4=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(46966006)(36840700001)(83380400001)(36756003)(54906003)(82310400003)(6666004)(86362001)(2906002)(70206006)(2616005)(186003)(16526019)(70586007)(47076005)(426003)(316002)(36860700001)(26005)(36906005)(336012)(478600001)(8676002)(82740400003)(1076003)(30864003)(6916009)(356005)(8936002)(7636003)(4326008)(5660300002)(7416002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 11:00:47.1335 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10cedde1-3cb0-4a65-d764-08d930b5fee3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1261
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 hughd@google.com, linux-kernel@vger.kernel.org, willy@infradead.org,
 hch@infradead.org, linux-mm@kvack.org, peterx@redhat.com, shakeelb@google.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, jhubbard@nvidia.com,
 Christoph Hellwig <hch@lst.de>, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Both migration and device private pages use special swap entries that
are manipluated by a range of inline functions. The arguments to these
are somewhat inconsitent so rework them to remove flag type arguments
and to make the arguments similar for both read and write entry
creation.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
---
 include/linux/swapops.h | 56 ++++++++++++++++++++++-------------------
 mm/debug_vm_pgtable.c   | 12 ++++-----
 mm/hmm.c                |  2 +-
 mm/huge_memory.c        | 26 +++++++++++++------
 mm/hugetlb.c            | 10 +++++---
 mm/memory.c             | 10 +++++---
 mm/migrate.c            | 26 ++++++++++++++-----
 mm/mprotect.c           | 10 +++++---
 mm/rmap.c               | 10 +++++---
 9 files changed, 100 insertions(+), 62 deletions(-)

diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index c24c79812bc1..04d76357aa0c 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -107,35 +107,35 @@ static inline void *swp_to_radix_entry(swp_entry_t entry)
 }
 
 #if IS_ENABLED(CONFIG_DEVICE_PRIVATE)
-static inline swp_entry_t make_device_private_entry(struct page *page, bool write)
+static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
 {
-	return swp_entry(write ? SWP_DEVICE_WRITE : SWP_DEVICE_READ,
-			 page_to_pfn(page));
+	return swp_entry(SWP_DEVICE_READ, offset);
 }
 
-static inline bool is_device_private_entry(swp_entry_t entry)
+static inline swp_entry_t make_writable_device_private_entry(pgoff_t offset)
 {
-	int type = swp_type(entry);
-	return type == SWP_DEVICE_READ || type == SWP_DEVICE_WRITE;
+	return swp_entry(SWP_DEVICE_WRITE, offset);
 }
 
-static inline void make_device_private_entry_read(swp_entry_t *entry)
+static inline bool is_device_private_entry(swp_entry_t entry)
 {
-	*entry = swp_entry(SWP_DEVICE_READ, swp_offset(*entry));
+	int type = swp_type(entry);
+	return type == SWP_DEVICE_READ || type == SWP_DEVICE_WRITE;
 }
 
-static inline bool is_write_device_private_entry(swp_entry_t entry)
+static inline bool is_writable_device_private_entry(swp_entry_t entry)
 {
 	return unlikely(swp_type(entry) == SWP_DEVICE_WRITE);
 }
 #else /* CONFIG_DEVICE_PRIVATE */
-static inline swp_entry_t make_device_private_entry(struct page *page, bool write)
+static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
 }
 
-static inline void make_device_private_entry_read(swp_entry_t *entry)
+static inline swp_entry_t make_writable_device_private_entry(pgoff_t offset)
 {
+	return swp_entry(0, 0);
 }
 
 static inline bool is_device_private_entry(swp_entry_t entry)
@@ -143,35 +143,32 @@ static inline bool is_device_private_entry(swp_entry_t entry)
 	return false;
 }
 
-static inline bool is_write_device_private_entry(swp_entry_t entry)
+static inline bool is_writable_device_private_entry(swp_entry_t entry)
 {
 	return false;
 }
 #endif /* CONFIG_DEVICE_PRIVATE */
 
 #ifdef CONFIG_MIGRATION
-static inline swp_entry_t make_migration_entry(struct page *page, int write)
-{
-	BUG_ON(!PageLocked(compound_head(page)));
-
-	return swp_entry(write ? SWP_MIGRATION_WRITE : SWP_MIGRATION_READ,
-			page_to_pfn(page));
-}
-
 static inline int is_migration_entry(swp_entry_t entry)
 {
 	return unlikely(swp_type(entry) == SWP_MIGRATION_READ ||
 			swp_type(entry) == SWP_MIGRATION_WRITE);
 }
 
-static inline int is_write_migration_entry(swp_entry_t entry)
+static inline int is_writable_migration_entry(swp_entry_t entry)
 {
 	return unlikely(swp_type(entry) == SWP_MIGRATION_WRITE);
 }
 
-static inline void make_migration_entry_read(swp_entry_t *entry)
+static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
 {
-	*entry = swp_entry(SWP_MIGRATION_READ, swp_offset(*entry));
+	return swp_entry(SWP_MIGRATION_READ, offset);
+}
+
+static inline swp_entry_t make_writable_migration_entry(pgoff_t offset)
+{
+	return swp_entry(SWP_MIGRATION_WRITE, offset);
 }
 
 extern void __migration_entry_wait(struct mm_struct *mm, pte_t *ptep,
@@ -181,21 +178,28 @@ extern void migration_entry_wait(struct mm_struct *mm, pmd_t *pmd,
 extern void migration_entry_wait_huge(struct vm_area_struct *vma,
 		struct mm_struct *mm, pte_t *pte);
 #else
+static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
+{
+	return swp_entry(0, 0);
+}
+
+static inline swp_entry_t make_writable_migration_entry(pgoff_t offset)
+{
+	return swp_entry(0, 0);
+}
 
-#define make_migration_entry(page, write) swp_entry(0, 0)
 static inline int is_migration_entry(swp_entry_t swp)
 {
 	return 0;
 }
 
-static inline void make_migration_entry_read(swp_entry_t *entryp) { }
 static inline void __migration_entry_wait(struct mm_struct *mm, pte_t *ptep,
 					spinlock_t *ptl) { }
 static inline void migration_entry_wait(struct mm_struct *mm, pmd_t *pmd,
 					 unsigned long address) { }
 static inline void migration_entry_wait_huge(struct vm_area_struct *vma,
 		struct mm_struct *mm, pte_t *pte) { }
-static inline int is_write_migration_entry(swp_entry_t entry)
+static inline int is_writable_migration_entry(swp_entry_t entry)
 {
 	return 0;
 }
diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index f7b23565a04f..1c922691aa61 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -843,17 +843,17 @@ static void __init swap_migration_tests(void)
 	 * locked, otherwise it stumbles upon a BUG_ON().
 	 */
 	__SetPageLocked(page);
-	swp = make_migration_entry(page, 1);
+	swp = make_writable_migration_entry(page_to_pfn(page));
 	WARN_ON(!is_migration_entry(swp));
-	WARN_ON(!is_write_migration_entry(swp));
+	WARN_ON(!is_writable_migration_entry(swp));
 
-	make_migration_entry_read(&swp);
+	swp = make_readable_migration_entry(swp_offset(swp));
 	WARN_ON(!is_migration_entry(swp));
-	WARN_ON(is_write_migration_entry(swp));
+	WARN_ON(is_writable_migration_entry(swp));
 
-	swp = make_migration_entry(page, 0);
+	swp = make_readable_migration_entry(page_to_pfn(page));
 	WARN_ON(!is_migration_entry(swp));
-	WARN_ON(is_write_migration_entry(swp));
+	WARN_ON(is_writable_migration_entry(swp));
 	__ClearPageLocked(page);
 	__free_page(page);
 }
diff --git a/mm/hmm.c b/mm/hmm.c
index 3b2dda71d0ed..11df3ca30b82 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -255,7 +255,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 		 */
 		if (hmm_is_device_private_entry(range, entry)) {
 			cpu_flags = HMM_PFN_VALID;
-			if (is_write_device_private_entry(entry))
+			if (is_writable_device_private_entry(entry))
 				cpu_flags |= HMM_PFN_WRITE;
 			*hmm_pfn = swp_offset(entry) | cpu_flags;
 			return 0;
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 327b8d9d8d2f..1c81aa11d618 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1054,8 +1054,9 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		swp_entry_t entry = pmd_to_swp_entry(pmd);
 
 		VM_BUG_ON(!is_pmd_migration_entry(pmd));
-		if (is_write_migration_entry(entry)) {
-			make_migration_entry_read(&entry);
+		if (is_writable_migration_entry(entry)) {
+			entry = make_readable_migration_entry(
+							swp_offset(entry));
 			pmd = swp_entry_to_pmd(entry);
 			if (pmd_swp_soft_dirty(*src_pmd))
 				pmd = pmd_swp_mksoft_dirty(pmd);
@@ -1772,13 +1773,14 @@ int change_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
 		swp_entry_t entry = pmd_to_swp_entry(*pmd);
 
 		VM_BUG_ON(!is_pmd_migration_entry(*pmd));
-		if (is_write_migration_entry(entry)) {
+		if (is_writable_migration_entry(entry)) {
 			pmd_t newpmd;
 			/*
 			 * A protection check is difficult so
 			 * just be safe and disable write
 			 */
-			make_migration_entry_read(&entry);
+			entry = make_readable_migration_entry(
+							swp_offset(entry));
 			newpmd = swp_entry_to_pmd(entry);
 			if (pmd_swp_soft_dirty(*pmd))
 				newpmd = pmd_swp_mksoft_dirty(newpmd);
@@ -2067,7 +2069,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 
 		entry = pmd_to_swp_entry(old_pmd);
 		page = pfn_swap_entry_to_page(entry);
-		write = is_write_migration_entry(entry);
+		write = is_writable_migration_entry(entry);
 		young = false;
 		soft_dirty = pmd_swp_soft_dirty(old_pmd);
 		uffd_wp = pmd_swp_uffd_wp(old_pmd);
@@ -2099,7 +2101,12 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		 */
 		if (freeze || pmd_migration) {
 			swp_entry_t swp_entry;
-			swp_entry = make_migration_entry(page + i, write);
+			if (write)
+				swp_entry = make_writable_migration_entry(
+							page_to_pfn(page + i));
+			else
+				swp_entry = make_readable_migration_entry(
+							page_to_pfn(page + i));
 			entry = swp_entry_to_pte(swp_entry);
 			if (soft_dirty)
 				entry = pte_swp_mksoft_dirty(entry);
@@ -3171,7 +3178,10 @@ void set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
 	pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
 	if (pmd_dirty(pmdval))
 		set_page_dirty(page);
-	entry = make_migration_entry(page, pmd_write(pmdval));
+	if (pmd_write(pmdval))
+		entry = make_writable_migration_entry(page_to_pfn(page));
+	else
+		entry = make_readable_migration_entry(page_to_pfn(page));
 	pmdswp = swp_entry_to_pmd(entry);
 	if (pmd_soft_dirty(pmdval))
 		pmdswp = pmd_swp_mksoft_dirty(pmdswp);
@@ -3197,7 +3207,7 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
 	pmde = pmd_mkold(mk_huge_pmd(new, vma->vm_page_prot));
 	if (pmd_swp_soft_dirty(*pvmw->pmd))
 		pmde = pmd_mksoft_dirty(pmde);
-	if (is_write_migration_entry(entry))
+	if (is_writable_migration_entry(entry))
 		pmde = maybe_pmd_mkwrite(pmde, vma);
 	if (pmd_swp_uffd_wp(*pvmw->pmd))
 		pmde = pmd_wrprotect(pmd_mkuffd_wp(pmde));
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index b14f4d1749b2..760b5fb836b8 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4195,12 +4195,13 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
 				    is_hugetlb_entry_hwpoisoned(entry))) {
 			swp_entry_t swp_entry = pte_to_swp_entry(entry);
 
-			if (is_write_migration_entry(swp_entry) && cow) {
+			if (is_writable_migration_entry(swp_entry) && cow) {
 				/*
 				 * COW mappings require pages in both
 				 * parent and child to be set to read.
 				 */
-				make_migration_entry_read(&swp_entry);
+				swp_entry = make_readable_migration_entry(
+							swp_offset(swp_entry));
 				entry = swp_entry_to_pte(swp_entry);
 				set_huge_swap_pte_at(src, addr, src_pte,
 						     entry, sz);
@@ -5485,10 +5486,11 @@ unsigned long hugetlb_change_protection(struct vm_area_struct *vma,
 		if (unlikely(is_hugetlb_entry_migration(pte))) {
 			swp_entry_t entry = pte_to_swp_entry(pte);
 
-			if (is_write_migration_entry(entry)) {
+			if (is_writable_migration_entry(entry)) {
 				pte_t newpte;
 
-				make_migration_entry_read(&entry);
+				entry = make_readable_migration_entry(
+							swp_offset(entry));
 				newpte = swp_entry_to_pte(entry);
 				set_huge_swap_pte_at(mm, address, ptep,
 						     newpte, huge_page_size(h));
diff --git a/mm/memory.c b/mm/memory.c
index a6c5132354a2..b4588402b777 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -733,13 +733,14 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 
 		rss[mm_counter(page)]++;
 
-		if (is_write_migration_entry(entry) &&
+		if (is_writable_migration_entry(entry) &&
 				is_cow_mapping(vm_flags)) {
 			/*
 			 * COW mappings require pages in both
 			 * parent and child to be set to read.
 			 */
-			make_migration_entry_read(&entry);
+			entry = make_readable_migration_entry(
+							swp_offset(entry));
 			pte = swp_entry_to_pte(entry);
 			if (pte_swp_soft_dirty(*src_pte))
 				pte = pte_swp_mksoft_dirty(pte);
@@ -770,9 +771,10 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		 * when a device driver is involved (you cannot easily
 		 * save and restore device driver state).
 		 */
-		if (is_write_device_private_entry(entry) &&
+		if (is_writable_device_private_entry(entry) &&
 		    is_cow_mapping(vm_flags)) {
-			make_device_private_entry_read(&entry);
+			entry = make_readable_device_private_entry(
+							swp_offset(entry));
 			pte = swp_entry_to_pte(entry);
 			if (pte_swp_uffd_wp(*src_pte))
 				pte = pte_swp_mkuffd_wp(pte);
diff --git a/mm/migrate.c b/mm/migrate.c
index b4abb87249e1..de47bdfbd2f8 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -210,13 +210,18 @@ static bool remove_migration_pte(struct page *page, struct vm_area_struct *vma,
 		 * Recheck VMA as permissions can change since migration started
 		 */
 		entry = pte_to_swp_entry(*pvmw.pte);
-		if (is_write_migration_entry(entry))
+		if (is_writable_migration_entry(entry))
 			pte = maybe_mkwrite(pte, vma);
 		else if (pte_swp_uffd_wp(*pvmw.pte))
 			pte = pte_mkuffd_wp(pte);
 
 		if (unlikely(is_device_private_page(new))) {
-			entry = make_device_private_entry(new, pte_write(pte));
+			if (pte_write(pte))
+				entry = make_writable_device_private_entry(
+							page_to_pfn(new));
+			else
+				entry = make_readable_device_private_entry(
+							page_to_pfn(new));
 			pte = swp_entry_to_pte(entry);
 			if (pte_swp_soft_dirty(*pvmw.pte))
 				pte = pte_swp_mksoft_dirty(pte);
@@ -2297,7 +2302,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 
 			mpfn = migrate_pfn(page_to_pfn(page)) |
 					MIGRATE_PFN_MIGRATE;
-			if (is_write_device_private_entry(entry))
+			if (is_writable_device_private_entry(entry))
 				mpfn |= MIGRATE_PFN_WRITE;
 		} else {
 			if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
@@ -2343,8 +2348,12 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			ptep_get_and_clear(mm, addr, ptep);
 
 			/* Setup special migration page table entry */
-			entry = make_migration_entry(page, mpfn &
-						     MIGRATE_PFN_WRITE);
+			if (mpfn & MIGRATE_PFN_WRITE)
+				entry = make_writable_migration_entry(
+							page_to_pfn(page));
+			else
+				entry = make_readable_migration_entry(
+							page_to_pfn(page));
 			swp_pte = swp_entry_to_pte(entry);
 			if (pte_present(pte)) {
 				if (pte_soft_dirty(pte))
@@ -2817,7 +2826,12 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 		if (is_device_private_page(page)) {
 			swp_entry_t swp_entry;
 
-			swp_entry = make_device_private_entry(page, vma->vm_flags & VM_WRITE);
+			if (vma->vm_flags & VM_WRITE)
+				swp_entry = make_writable_device_private_entry(
+							page_to_pfn(page));
+			else
+				swp_entry = make_readable_device_private_entry(
+							page_to_pfn(page));
 			entry = swp_entry_to_pte(swp_entry);
 		} else {
 			/*
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 127d348c9df3..d7f49f33d240 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -183,23 +183,25 @@ static unsigned long change_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
 			swp_entry_t entry = pte_to_swp_entry(oldpte);
 			pte_t newpte;
 
-			if (is_write_migration_entry(entry)) {
+			if (is_writable_migration_entry(entry)) {
 				/*
 				 * A protection check is difficult so
 				 * just be safe and disable write
 				 */
-				make_migration_entry_read(&entry);
+				entry = make_readable_migration_entry(
+							swp_offset(entry));
 				newpte = swp_entry_to_pte(entry);
 				if (pte_swp_soft_dirty(oldpte))
 					newpte = pte_swp_mksoft_dirty(newpte);
 				if (pte_swp_uffd_wp(oldpte))
 					newpte = pte_swp_mkuffd_wp(newpte);
-			} else if (is_write_device_private_entry(entry)) {
+			} else if (is_writable_device_private_entry(entry)) {
 				/*
 				 * We do not preserve soft-dirtiness. See
 				 * copy_one_pte() for explanation.
 				 */
-				make_device_private_entry_read(&entry);
+				entry = make_readable_device_private_entry(
+							swp_offset(entry));
 				newpte = swp_entry_to_pte(entry);
 				if (pte_swp_uffd_wp(oldpte))
 					newpte = pte_swp_mkuffd_wp(newpte);
diff --git a/mm/rmap.c b/mm/rmap.c
index c4a9a8b23fae..cf9f96940a1f 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1533,7 +1533,7 @@ static bool try_to_unmap_one(struct page *page, struct vm_area_struct *vma,
 			 * pte. do_swap_page() will wait until the migration
 			 * pte is removed and then restart fault handling.
 			 */
-			entry = make_migration_entry(page, 0);
+			entry = make_readable_migration_entry(page_to_pfn(page));
 			swp_pte = swp_entry_to_pte(entry);
 
 			/*
@@ -1629,8 +1629,12 @@ static bool try_to_unmap_one(struct page *page, struct vm_area_struct *vma,
 			 * pte. do_swap_page() will wait until the migration
 			 * pte is removed and then restart fault handling.
 			 */
-			entry = make_migration_entry(subpage,
-					pte_write(pteval));
+			if (pte_write(pteval))
+				entry = make_writable_migration_entry(
+							page_to_pfn(subpage));
+			else
+				entry = make_readable_migration_entry(
+							page_to_pfn(subpage));
 			swp_pte = swp_entry_to_pte(entry);
 			if (pte_soft_dirty(pteval))
 				swp_pte = pte_swp_mksoft_dirty(swp_pte);
-- 
2.20.1

