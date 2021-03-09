Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B654C332516
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 13:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB78D6E8D9;
	Tue,  9 Mar 2021 12:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF386E8D9;
 Tue,  9 Mar 2021 12:15:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KsR/KQsbbyQYLp+P1AgePVkOjcgHN3U1QSV5YlnJ4TAJR4KdLzzIoL0kjsCu8AWcRrRiEqVpAjPescbJ4GYf8sSUJhBtPj9QEpaX1TleLnYkal9KFG3wTlHrhCtdEbsG0F4h6HBUI8QoBqTBV8IWQs1dkuwKIkkEF04D9fTvHZRHFJoD8gOi9/rCkC8vLLktVkUnSe1KHKOQVvi/fySIYe10RdpWN9VpGjIpd2p848ZV+72ucCGIyr/UV8QScNK7U11osOYZnOfdz2idAC7kP1kb/FqXX0+iE6Y97ZrYdxT4jVIObjLtCbH7Q9rgh2hMFyEqHO9e/dZxDcxuLMIE4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlekREMnKl7M7frNpqHRWM8xspAgOP8NNxb3T5xhdP0=;
 b=Q5Ha2U0SbTw51qg894hO9gRE9Sr9nFbt9JY4rEHp0Tpcgq1XBS1dtEGsOFUfeKEK+wYG4tqVZVTS/QN40DyRBPtF+e3iYVJqLus0TRFkjUK6dbyWqUJLuuQtgxQqc+U5+54UYQ126MlwESb/8Xn6FCEtpeiMjN6+yNGqzoxg+jcysguPlVzr+ByQ/gNz/Ck1jRL4mQ0ULL0GkB9A9gj1UwsvvVWPTSx7vhWsOieUVWHbVWFvqvyL35VxAT6b+qhwie17pV2Vl3kwu6yIYMN+aiun7Eu0IZMr+nvfurAR/lqV85vI6s5BaXOwD7BzDoerp8zaL7w4v/HKCaOXuZeUSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlekREMnKl7M7frNpqHRWM8xspAgOP8NNxb3T5xhdP0=;
 b=MMjMIulB6RD4wMnPP7nosv+6v9doo+BkSxY/bYUCVVvyGTKMU3aASUiaRuzs29LZiOAMikFa4S/U5MOjLabfOSUfW1gtrWxRJgKr8ERsjLmrynWKX4N4OskJ7Tsa18MIrmsjVvDxbvIjftY9f6jMk+arTe4queL7zGQzsNcp/Nn50HW/Isd94zRUh+nBhHQZIWnKZUiwe05xQowqfdFGqg5E4YjNvqeZ2nVnJgABaFLIhSrOA8cogiwMid/yl2x/ZMkio96HNwniKsb2habcNpnnuNP8lxwCrSuSFphDIsHw90IzSiabICIyldmdGRtd/AEdJXXLXr19RLotQjafiw==
Received: from BN0PR04CA0006.namprd04.prod.outlook.com (2603:10b6:408:ee::11)
 by MN2PR12MB4424.namprd12.prod.outlook.com (2603:10b6:208:26a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Tue, 9 Mar
 2021 12:15:27 +0000
Received: from BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ee:cafe::d2) by BN0PR04CA0006.outlook.office365.com
 (2603:10b6:408:ee::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Tue, 9 Mar 2021 12:15:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=pass action=none header.from=nvidia.com; 
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT066.mail.protection.outlook.com (10.13.177.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3912.17 via Frontend Transport; Tue, 9 Mar 2021 12:15:26 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 9 Mar
 2021 12:15:25 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <bskeggs@redhat.com>, <akpm@linux-foundation.org>
Subject: [PATCH v5 2/8] mm/swapops: Rework swap entry manipulation code
Date: Tue, 9 Mar 2021 23:14:59 +1100
Message-ID: <20210309121505.23608-3-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210309121505.23608-1-apopple@nvidia.com>
References: <20210309121505.23608-1-apopple@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79e9a18a-466b-4562-f14f-08d8e2f5061c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4424:
X-Microsoft-Antispam-PRVS: <MN2PR12MB442499A5685651D4501AB75FDF929@MN2PR12MB4424.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AAY2ZBOJ6RWFKparJIsMfVdUrta2DJx548pLTarWdqt9OhzKA8CozYC4ne1OtuKhAbKxD62zUhnDNFSur0B37K/LtQ2s19QB7MbNORfshiXeokIc6StesbH4rylOo4L20qFblV0cnUBUDNddmB50UMqkGyvcRk8daWO5orwSS+20tpm1mMXQhTXPFkyxwaMXIr/CBadX/TNg5jV9cLblivDAFdqTlC+CSSeLyriOsN6LFKgSI8Nkbk71sY0YEcrrzhEJMr43yqRh3G/Z70yGsELIH89izvL8NFGPkm35Pi+YpWRUOhXwoWPXdaLM3WN2WFonDxd15yU0BUzpuEcQ+dvoU8MWBrz3z0/+zH0Zd8S2Ejq6okPhNjHd7ZUuXSpL6j3J/vsw1JB6yB85BGIrzuhNDuyQA48DMfOtvpJrpTfObxOM1Sm7au+jhUIc43XKUpJmIPuAnPYtsWTDSDLiJEJ4PCT+/LnKclEqkgggHj2ndgIyFQgq15rDs/37fp3z2yl6Um3fT2NS6g6ahGUkqMXQC6Xq/NzntgMkBLzNNnNzkcmeG3mzRM11QWrfPkbtQdBHO+58vBoT42WcEqOinjuJosUgLFIrctt+705OgInAYUqSPuAaE7kYOTGdKupb5I6SeZUoVyZsqITUdaRCacqAYKeKvJ+R1a/FjPh3SR4/66qfDjXGB8OASJTjExSx
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39860400002)(346002)(396003)(46966006)(36840700001)(30864003)(316002)(2906002)(110136005)(26005)(8676002)(7636003)(426003)(54906003)(86362001)(47076005)(336012)(1076003)(107886003)(8936002)(7416002)(16526019)(82740400003)(34020700004)(4326008)(186003)(83380400001)(36906005)(36860700001)(36756003)(70586007)(82310400003)(2616005)(70206006)(5660300002)(478600001)(356005)(6666004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 12:15:26.8711 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e9a18a-466b-4562-f14f-08d8e2f5061c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4424
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
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jglisse@redhat.com, kvm-ppc@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Christoph Hellwig <hch@lst.de>
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
index 3fd88081107c..81008b0179cc 100644
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
