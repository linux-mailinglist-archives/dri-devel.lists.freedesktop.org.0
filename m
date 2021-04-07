Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D490356710
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 10:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75DE089D77;
	Wed,  7 Apr 2021 08:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4FFA89CDB;
 Wed,  7 Apr 2021 08:43:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSBoqPa9lzqzhfzmxD+sw0gohjmGnnfvTGQLRw4qspaP8/XSMdS+rei/x5KZtZTGjfcZL8I0BQkLVXXzJQOJzi6sztLoBa5X2ZY9FM6Jo3xXew6Vzvo0tcxQqCUeUrZgE2uSRkr55+G3pQpMAG2nC5cMfxHca034jbgh6Qbk4ViJckd4V6bSg1ozoISF45x7pf0R51dJe3GqtYIIkBHWe1to5tyy3xH4FCqGJfL7Nq6oy92ZNTiFN/B+FgHpfyelu79+nRSZX9FoYBD44kRrDnlGLupjNSA52SSBcn1AtdlrinXR/Ngn9diE20eyzEBu9k+3wgx/T5YqEUQzKxbvNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kXiR3VUVkDsntG0bfYhLL4P0lGWZ8p3XL3iW3/CGUQ=;
 b=LQYiOXaVZw2/B2CnsYKYmT2+HKzcGVJ5tWAZqFYEwC1wJgnqElYerGCFy0mahO5UBw/hMaxs5xLoy0s8za4jSnmLbJI3MP9h4kaye65Oj9LiIkmn6oaTbzDMmp5tnINmOYxvIyNy2UYOgQ9Atbl4ZbE6Ik4Z10ZYM3Ntljr1b3pcFrMEJFnAj5Zqw87uJmSWnAw2oBEDzE9HXMsh6ssqP0K3T935ZUaU49HY6CDIN0xn6TuUqAV12rgG5EE+a3+SLWKuY0o1FXynt6MfpQ0e/MMfXMxHHgxE3gc+t7vSfSxrcsTYcx1yyTxc4Eo1IhQYDVYQhzvX+oLDUSd/KKnjww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kXiR3VUVkDsntG0bfYhLL4P0lGWZ8p3XL3iW3/CGUQ=;
 b=l9Zy7V5+QKnK7PVfDpPikuoKEJRTTP3PrIS69n9M0swEE6ZQ503sVMPPjfYi0BIYDh7afvDSKGCspu9/fZO5Qf23+sSWpEaDdNo7l9nLhptA1tpsX6qKHotXHz/l19xa5sckLfamEUSPlKa8Ri5U4kN6UTPWyjZj8bONoCEU9jhwEEOIqAXL1LhAUfZGX/Aj3+R9iSbTnnNlYZWWsVtMZihG5wZ7LbN8n15Y3O5n8ih5JDr3yGKjbV6C+JRsS6favmtj/mG70WFeVP9Bg+RbumjILnHIENZfQp/F9IpgWUKQ8HqdA7rXoR0g+FsYSH1St4u9Xn+hqJn//piCJvDWkA==
Received: from BN6PR19CA0073.namprd19.prod.outlook.com (2603:10b6:404:133::11)
 by MN2PR12MB3919.namprd12.prod.outlook.com (2603:10b6:208:16a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Wed, 7 Apr
 2021 08:43:03 +0000
Received: from BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:133:cafe::a1) by BN6PR19CA0073.outlook.office365.com
 (2603:10b6:404:133::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend
 Transport; Wed, 7 Apr 2021 08:43:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT014.mail.protection.outlook.com (10.13.177.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3999.28 via Frontend Transport; Wed, 7 Apr 2021 08:43:02 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 7 Apr
 2021 08:43:01 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <bskeggs@redhat.com>, <akpm@linux-foundation.org>
Subject: [PATCH v8 2/8] mm/swapops: Rework swap entry manipulation code
Date: Wed, 7 Apr 2021 18:42:32 +1000
Message-ID: <20210407084238.20443-3-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210407084238.20443-1-apopple@nvidia.com>
References: <20210407084238.20443-1-apopple@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 854e72da-537a-4702-d819-08d8f9a12807
X-MS-TrafficTypeDiagnostic: MN2PR12MB3919:
X-Microsoft-Antispam-PRVS: <MN2PR12MB391971917BEDC12352694B45DF759@MN2PR12MB3919.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vGNfbvjBviT6ESshooopmds6mpUhJkaQaBk1WgESAl+5PO2O+UdF/Fl0wPe77P9tM+QTLy5joAHLlZHRRTngJ9Vaz4VJ8qJdlGv8RM2S/UQVIxZrBDeJQVrIie+dzI8ssgNDEmUd30f+pLIol159Culahtbk5JnYAI56Cyckl/37rRcsyRO2jfZdJ7yUmdfb+dDhvXTmA2gAEpyt+HI7UrsHbshFqSzYlvZsrhiE3h50/JLIunZC64PnKz50VZraprH3lW5YGNw0woXPmD20IWbX/wT1aIHJtT2kMpGAYqXjY1wYY4YwyMUXYKSgcXsEsh2w1A36weF7/pRfNJQIo7FiP+/HHe6025HtxtLqf/AkThPW8l6gpaaVyBiV2BbC6GKOgKIjmc7tBFycIsHbe7KFogLcKDw4WBr3dNRxyseJUzfyWHF3OvKgHecLA5VXntM405vDR0TLnjKQWkqNFeMgpbQhwZFofcP1IoVFsV2ukNDh0izUgRAbJLMTKUSH8rxLtHbo1jYiXn5eRSTp+p4PvLSkd2XJDu5lZFZaEGmZku6dNHZl7sGM52SlMddET4pRlkbw8vkIBJVdYPJjsrd9RRpmspFwMrF5hcFqLd2hwEg2+OzI4pPzYNLRH4/SWQGzuA982/rSyzFFitSsGhM21Ap1m4SMBegIW8Knpn4=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(136003)(376002)(46966006)(36840700001)(7636003)(2906002)(2616005)(336012)(8676002)(36860700001)(86362001)(36756003)(478600001)(30864003)(426003)(36906005)(356005)(4326008)(82310400003)(16526019)(1076003)(316002)(82740400003)(7416002)(47076005)(26005)(70206006)(83380400001)(186003)(70586007)(8936002)(5660300002)(54906003)(110136005)(6666004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 08:43:02.7110 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 854e72da-537a-4702-d819-08d8f9a12807
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3919
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org, jhubbard@nvidia.com,
 bsingharora@gmail.com, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, jglisse@redhat.com, willy@infradead.org, jgg@nvidia.com,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
index 139be8235ad2..4dfd807ae52a 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -100,35 +100,35 @@ static inline void *swp_to_radix_entry(swp_entry_t entry)
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
@@ -136,35 +136,32 @@ static inline bool is_device_private_entry(swp_entry_t entry)
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
@@ -174,21 +171,28 @@ extern void migration_entry_wait(struct mm_struct *mm, pmd_t *pmd,
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
index a9bd6ce1ba02..3697a80b32f8 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -817,17 +817,17 @@ static void __init swap_migration_tests(void)
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
index a4cda8564bcf..89af065cea5b 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1051,8 +1051,9 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
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
@@ -1825,13 +1826,14 @@ int change_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
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
@@ -2109,7 +2111,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 
 		entry = pmd_to_swp_entry(old_pmd);
 		page = pfn_swap_entry_to_page(entry);
-		write = is_write_migration_entry(entry);
+		write = is_writable_migration_entry(entry);
 		young = false;
 		soft_dirty = pmd_swp_soft_dirty(old_pmd);
 		uffd_wp = pmd_swp_uffd_wp(old_pmd);
@@ -2141,7 +2143,12 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
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
@@ -2998,7 +3005,10 @@ void set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
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
@@ -3024,7 +3034,7 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
 	pmde = pmd_mkold(mk_huge_pmd(new, vma->vm_page_prot));
 	if (pmd_swp_soft_dirty(*pvmw->pmd))
 		pmde = pmd_mksoft_dirty(pmde);
-	if (is_write_migration_entry(entry))
+	if (is_writable_migration_entry(entry))
 		pmde = maybe_pmd_mkwrite(pmde, vma);
 
 	flush_cache_range(vma, mmun_start, mmun_start + HPAGE_PMD_SIZE);
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 8fb42c6dd74b..59645169839b 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3795,12 +3795,13 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
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
@@ -4970,10 +4971,11 @@ unsigned long hugetlb_change_protection(struct vm_area_struct *vma,
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
index 1c98e3c1c2de..3a5705cfc891 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -734,13 +734,14 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 
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
@@ -771,9 +772,10 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
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
index 600978d18750..b752543adb64 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -237,13 +237,18 @@ static bool remove_migration_pte(struct page *page, struct vm_area_struct *vma,
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
@@ -2451,7 +2456,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 
 			mpfn = migrate_pfn(page_to_pfn(page)) |
 					MIGRATE_PFN_MIGRATE;
-			if (is_write_device_private_entry(entry))
+			if (is_writable_device_private_entry(entry))
 				mpfn |= MIGRATE_PFN_WRITE;
 		} else {
 			if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
@@ -2497,8 +2502,12 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
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
@@ -2971,7 +2980,12 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
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
 		}
 	} else {
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 94188df1ee55..f21b760ec809 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -143,23 +143,25 @@ static unsigned long change_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
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
index b0fc27e77d6d..977e70803ed8 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1526,7 +1526,7 @@ static bool try_to_unmap_one(struct page *page, struct vm_area_struct *vma,
 			 * pte. do_swap_page() will wait until the migration
 			 * pte is removed and then restart fault handling.
 			 */
-			entry = make_migration_entry(page, 0);
+			entry = make_readable_migration_entry(page_to_pfn(page));
 			swp_pte = swp_entry_to_pte(entry);
 
 			/*
@@ -1622,8 +1622,12 @@ static bool try_to_unmap_one(struct page *page, struct vm_area_struct *vma,
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
