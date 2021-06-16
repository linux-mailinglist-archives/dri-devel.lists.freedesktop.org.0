Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1C93A987C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 13:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 174BE6E5A3;
	Wed, 16 Jun 2021 11:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6904A6E5A1;
 Wed, 16 Jun 2021 11:01:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SvM2qf1hudcIQ7tSKGuo+2sZ4sXBLoSjplK5SyBz+d4df+2HftvQqX+N3cS1MWXZG6YtT78lcahkFwHQHc0LU/VjzqUB5VGtTFp0LabNu67xVUkq6lGWww3sRlCQrV1JksHp+qSASM0L3rfBimrNAnkjTlFZYgk25Q1faPHeePP/RdMTkah1I3LQ8riT/+VzUdkncAISmpILynLsJ02QCjbpHK+e4mMoukfCBSrqJPgSCnrBjDzimklYS81AWAdcKHX8WA9JMqGna+IV3rAlHtGh8PRRRu95ILXo2LCTomQ6/FdQjNOsjvY6nBrNMBjJ734DnEEZdrysomz71takfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0fXBwHEYDgaPu1p6Y4dkScSDCUe/LWaPBY844qPfmI=;
 b=I57Njkcdk8p+/sPPvRuFky8OezPFnM2zbDCQGAzV7YYW94efWOqml6Jygl3sswul57VhDQAut/OfBdDNknI4UEmBejHNysJJ4CG3RaHWQEjNQEUSkT1qDYm8p7tM22cGb5Up3NadZXUAZK6rOOVk0f0xopQwt0zH0mRMoa5mg64glG2f3RLsJJffI1dEj8sH5p1G8HuWXmllXLH2OKuGQADOOgK8X2YWtygLCIC0iGAJIUoap6owiUsI/ifroR362BhDIoVQ4+FfGAkV3OXcoUr8iHIQBwritz6SVP2XM1WBgE6FMS2kHq1onW1DFcpqLXhR6+RY8ZK/R/KEXcUGcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0fXBwHEYDgaPu1p6Y4dkScSDCUe/LWaPBY844qPfmI=;
 b=qpTD5IhYaHGLsaETjfwmVe7jXbFc8Yx2QiNw99q79SZ5voJl5U+4tj11t9jLibK8WKzZAbGAeOzOytv71J2QZtsvBbwml59S9WqLlHbyzG7aGSoHreMosF9chTYf10xcjaHw+2wgyjlrkDXcT2RP0p3D9nltL0bvbSMUGbvPDLWFuVprvkdbEksByZMzBloOCHVpdQqsFmswFheUANx9YL7KCwCxpptlywcfDwycBbb1KiZUNt3GTn/vSNvsRMGEcQIEIg/j2fW4KR36bD8HI3Rg2yE4Zi9hwZRw0aKPSAfnNCaeir6o9BumuMNlGy0UNC2Jyx5qZWiZWmEdTqcdSg==
Received: from BN6PR19CA0081.namprd19.prod.outlook.com (2603:10b6:404:133::19)
 by BN6PR12MB1121.namprd12.prod.outlook.com (2603:10b6:404:1c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Wed, 16 Jun
 2021 11:01:03 +0000
Received: from BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:133:cafe::41) by BN6PR19CA0081.outlook.office365.com
 (2603:10b6:404:133::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15 via Frontend
 Transport; Wed, 16 Jun 2021 11:01:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT048.mail.protection.outlook.com (10.13.177.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4242.16 via Frontend Transport; Wed, 16 Jun 2021 11:01:02 +0000
Received: from localhost (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 16 Jun
 2021 11:01:00 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>
Subject: [PATCH v11 07/10] mm: Device exclusive memory access
Date: Wed, 16 Jun 2021 20:59:34 +1000
Message-ID: <20210616105937.23201-8-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210616105937.23201-1-apopple@nvidia.com>
References: <20210616105937.23201-1-apopple@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0eb1cd71-4a63-4767-4f51-08d930b60849
X-MS-TrafficTypeDiagnostic: BN6PR12MB1121:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1121A4CA1948B048C13A63E2DF0F9@BN6PR12MB1121.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: quWK9s+tSHqvaH7G6ww2WLZk2Cpe7N+oEH4yHx2ciVQp1TZQ3glF89d3mLE1wyMjSL2Asew1qRENm8D9ZqukTLdaC8RXDx6JMlNbjV6ntZ06VpE0pwXVTw7nOxgcScc2c3KE2aqjsMwkMk5ZbLbGaUSSVGldLs9U79oL1eqyWVarop+aYg7aPTv278RAIs4ScfOAcDR+nPqESOW5xgk8NP2w1E+Nt2kgc71Q3/xUgjsbFRyHxbLlQBKmh18CImR4s1+tGnnTGqjpPJP0tI6fmqGuvluczJXPM9l6w5X8Lsast9WtnmFMTwCaTI7vGJcS65TEltHXmBTYcRKA1H03qj7wOOlMk9oFgtXzaPiSVVkBGm7MxeDKZNTNaXNSG0c7ADHnQvd2UaG0eeDcXUMl/GykCc1SE8P7k0e8GHSGXBIRX6FIX+2Dzi1XPZemg3/ngnz8PHak5glj/7UOuevvNlcI1QJ56ptxZv4odkx6Nuy8nl6Yhz5ius3aQSwrZV+5HOEcFQEIyQDr6iFpqBZmAH9nRQ9358dSUJ9r/tnA1OgB6Qdm9ZfqjSizlXuEhXbtJcOMQPLSOHo5/tBasMywwGwPY4ZfKLC+dyuh/cwN5/r2Ay4NKWiS/hpvm2p1fFNoe92bXmQzTa5fMqnGz5pdXd1dsipc4Cquz1Zw/xWgPa8=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(346002)(39860400002)(46966006)(36840700001)(316002)(54906003)(7416002)(70206006)(6916009)(70586007)(47076005)(82740400003)(36906005)(82310400003)(2616005)(8676002)(36756003)(1076003)(86362001)(478600001)(30864003)(83380400001)(4326008)(8936002)(426003)(2906002)(7636003)(26005)(6666004)(186003)(336012)(36860700001)(356005)(16526019)(5660300002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 11:01:02.9080 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb1cd71-4a63-4767-4f51-08d930b60849
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1121
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

Some devices require exclusive write access to shared virtual
memory (SVM) ranges to perform atomic operations on that memory. This
requires CPU page tables to be updated to deny access whilst atomic
operations are occurring.

In order to do this introduce a new swap entry
type (SWP_DEVICE_EXCLUSIVE). When a SVM range needs to be marked for
exclusive access by a device all page table mappings for the particular
range are replaced with device exclusive swap entries. This causes any
CPU access to the page to result in a fault.

Faults are resovled by replacing the faulting entry with the original
mapping. This results in MMU notifiers being called which a driver uses
to update access permissions such as revoking atomic access. After
notifiers have been called the device will no longer have exclusive
access to the region.

Walking of the page tables to find the target pages is handled by
get_user_pages() rather than a direct page table walk. A direct page
table walk similar to what migrate_vma_collect()/unmap() does could also
have been utilised. However this resulted in more code similar in
functionality to what get_user_pages() provides as page faulting is
required to make the PTEs present and to break COW.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>

---

v10:
* Make device exclusive code conditional on CONFIG_DEVICE_PRIVATE.
* Updates to code comments and more minor code cleanups.

v9:
* Split rename of migrate_pgmap_owner into a separate patch.
* Added comments explaining SWP_DEVICE_EXCLUSIVE_* entries.
* Renamed try_to_protect{_one} to page_make_device_exclusive{_one} based
  somewhat on a suggestion from Peter Xu. I was never particularly happy
  with try_to_protect() as a name so think this is better.
* Removed unneccesary code and reworded some comments based on feedback
  from Peter Xu.
* Removed the VMA walk when restoring PTEs for device-exclusive entries.
* Simplified implementation of copy_pte_range() to fail if the page
  cannot be locked. This might lead to occasional fork() failures but at
  this stage we don't think that will be an issue.

v8:
* Remove device exclusive entries on fork rather than copy them.

v7:
* Added Christoph's Reviewed-by.
* Minor cosmetic cleanups suggested by Christoph.
* Replace mmu_notifier_range_init_migrate/exclusive with
  mmu_notifier_range_init_owner as suggested by Christoph.
* Replaced lock_page() with lock_page_retry() when handling faults.
* Restrict to anonymous pages for now.

v6:
* Fixed a bisectablity issue due to incorrectly applying the rename of
  migrate_pgmap_owner to the wrong patches for Nouveau and hmm_test.

v5:
* Renamed range->migrate_pgmap_owner to range->owner.
* Added MMU_NOTIFY_EXCLUSIVE to allow passing of a driver cookie which
  allows notifiers called as a result of make_device_exclusive_range() to
  be ignored.
* Added a check to try_to_protect_one() to detect if the pages originally
  returned from get_user_pages() have been unmapped or not.
* Removed check_device_exclusive_range() as it is no longer required with
  the other changes.
* Documentation update.

v4:
* Add function to check that mappings are still valid and exclusive.
* s/long/unsigned long/ in make_device_exclusive_entry().
---
 Documentation/vm/hmm.rst     |  17 ++++
 include/linux/mmu_notifier.h |   6 ++
 include/linux/rmap.h         |   4 +
 include/linux/swap.h         |   9 +-
 include/linux/swapops.h      |  44 ++++++++-
 mm/hmm.c                     |   5 +
 mm/memory.c                  | 127 +++++++++++++++++++++++-
 mm/mprotect.c                |   8 ++
 mm/page_vma_mapped.c         |   9 +-
 mm/rmap.c                    | 183 +++++++++++++++++++++++++++++++++++
 10 files changed, 402 insertions(+), 10 deletions(-)

diff --git a/Documentation/vm/hmm.rst b/Documentation/vm/hmm.rst
index 3df79307a797..a14c2938e7af 100644
--- a/Documentation/vm/hmm.rst
+++ b/Documentation/vm/hmm.rst
@@ -405,6 +405,23 @@ between device driver specific code and shared common code:
 
    The lock can now be released.
 
+Exclusive access memory
+=======================
+
+Some devices have features such as atomic PTE bits that can be used to implement
+atomic access to system memory. To support atomic operations to a shared virtual
+memory page such a device needs access to that page which is exclusive of any
+userspace access from the CPU. The ``make_device_exclusive_range()`` function
+can be used to make a memory range inaccessible from userspace.
+
+This replaces all mappings for pages in the given range with special swap
+entries. Any attempt to access the swap entry results in a fault which is
+resovled by replacing the entry with the original mapping. A driver gets
+notified that the mapping has been changed by MMU notifiers, after which point
+it will no longer have exclusive access to the page. Exclusive access is
+guranteed to last until the driver drops the page lock and page reference, at
+which point any CPU faults on the page may proceed as described.
+
 Memory cgroup (memcg) and rss accounting
 ========================================
 
diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index 8eb965ef0028..45fc2c81e370 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -42,6 +42,11 @@ struct mmu_interval_notifier;
  * @MMU_NOTIFY_MIGRATE: used during migrate_vma_collect() invalidate to signal
  * a device driver to possibly ignore the invalidation if the
  * owner field matches the driver's device private pgmap owner.
+ *
+ * @MMU_NOTIFY_EXCLUSIVE: to signal a device driver that the device will no
+ * longer have exclusive access to the page. When sent during creation of an
+ * exclusive range the owner will be initialised to the value provided by the
+ * caller of make_device_exclusive_range(), otherwise the owner will be NULL.
  */
 enum mmu_notifier_event {
 	MMU_NOTIFY_UNMAP = 0,
@@ -51,6 +56,7 @@ enum mmu_notifier_event {
 	MMU_NOTIFY_SOFT_DIRTY,
 	MMU_NOTIFY_RELEASE,
 	MMU_NOTIFY_MIGRATE,
+	MMU_NOTIFY_EXCLUSIVE,
 };
 
 #define MMU_NOTIFIER_RANGE_BLOCKABLE (1 << 0)
diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index b0ea9d98302f..83fb86133fe1 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -194,6 +194,10 @@ int page_referenced(struct page *, int is_locked,
 void try_to_migrate(struct page *page, enum ttu_flags flags);
 void try_to_unmap(struct page *, enum ttu_flags flags);
 
+int make_device_exclusive_range(struct mm_struct *mm, unsigned long start,
+				unsigned long end, struct page **pages,
+				void *arg);
+
 /* Avoid racy checks */
 #define PVMW_SYNC		(1 << 0)
 /* Look for migarion entries rather than present PTEs */
diff --git a/include/linux/swap.h b/include/linux/swap.h
index df7cbb6b3d3e..6f5a43251593 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -62,12 +62,17 @@ static inline int current_is_kswapd(void)
  * migrate part of a process memory to device memory.
  *
  * When a page is migrated from CPU to device, we set the CPU page table entry
- * to a special SWP_DEVICE_* entry.
+ * to a special SWP_DEVICE_{READ|WRITE} entry.
+ *
+ * When a page is mapped by the device for exclusive access we set the CPU page
+ * table entries to special SWP_DEVICE_EXCLUSIVE_* entries.
  */
 #ifdef CONFIG_DEVICE_PRIVATE
-#define SWP_DEVICE_NUM 2
+#define SWP_DEVICE_NUM 4
 #define SWP_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM)
 #define SWP_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+1)
+#define SWP_DEVICE_EXCLUSIVE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+2)
+#define SWP_DEVICE_EXCLUSIVE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+3)
 #else
 #define SWP_DEVICE_NUM 0
 #endif
diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index 04d76357aa0c..d356ab4047f7 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -127,6 +127,27 @@ static inline bool is_writable_device_private_entry(swp_entry_t entry)
 {
 	return unlikely(swp_type(entry) == SWP_DEVICE_WRITE);
 }
+
+static inline swp_entry_t make_readable_device_exclusive_entry(pgoff_t offset)
+{
+	return swp_entry(SWP_DEVICE_EXCLUSIVE_READ, offset);
+}
+
+static inline swp_entry_t make_writable_device_exclusive_entry(pgoff_t offset)
+{
+	return swp_entry(SWP_DEVICE_EXCLUSIVE_WRITE, offset);
+}
+
+static inline bool is_device_exclusive_entry(swp_entry_t entry)
+{
+	return swp_type(entry) == SWP_DEVICE_EXCLUSIVE_READ ||
+		swp_type(entry) == SWP_DEVICE_EXCLUSIVE_WRITE;
+}
+
+static inline bool is_writable_device_exclusive_entry(swp_entry_t entry)
+{
+	return unlikely(swp_type(entry) == SWP_DEVICE_EXCLUSIVE_WRITE);
+}
 #else /* CONFIG_DEVICE_PRIVATE */
 static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
 {
@@ -147,6 +168,26 @@ static inline bool is_writable_device_private_entry(swp_entry_t entry)
 {
 	return false;
 }
+
+static inline swp_entry_t make_readable_device_exclusive_entry(pgoff_t offset)
+{
+	return swp_entry(0, 0);
+}
+
+static inline swp_entry_t make_writable_device_exclusive_entry(pgoff_t offset)
+{
+	return swp_entry(0, 0);
+}
+
+static inline bool is_device_exclusive_entry(swp_entry_t entry)
+{
+	return false;
+}
+
+static inline bool is_writable_device_exclusive_entry(swp_entry_t entry)
+{
+	return false;
+}
 #endif /* CONFIG_DEVICE_PRIVATE */
 
 #ifdef CONFIG_MIGRATION
@@ -226,7 +267,8 @@ static inline struct page *pfn_swap_entry_to_page(swp_entry_t entry)
  */
 static inline bool is_pfn_swap_entry(swp_entry_t entry)
 {
-	return is_migration_entry(entry) || is_device_private_entry(entry);
+	return is_migration_entry(entry) || is_device_private_entry(entry) ||
+	       is_device_exclusive_entry(entry);
 }
 
 struct page_vma_mapped_walk;
diff --git a/mm/hmm.c b/mm/hmm.c
index 11df3ca30b82..fad6be2bf072 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -26,6 +26,8 @@
 #include <linux/mmu_notifier.h>
 #include <linux/memory_hotplug.h>
 
+#include "internal.h"
+
 struct hmm_vma_walk {
 	struct hmm_range	*range;
 	unsigned long		last;
@@ -271,6 +273,9 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 		if (!non_swap_entry(entry))
 			goto fault;
 
+		if (is_device_exclusive_entry(entry))
+			goto fault;
+
 		if (is_migration_entry(entry)) {
 			pte_unmap(ptep);
 			hmm_vma_walk->last = addr;
diff --git a/mm/memory.c b/mm/memory.c
index 1ac4d0b07c99..db86558791f1 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -699,6 +699,68 @@ struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
 }
 #endif
 
+static void restore_exclusive_pte(struct vm_area_struct *vma,
+				  struct page *page, unsigned long address,
+				  pte_t *ptep)
+{
+	pte_t pte;
+	swp_entry_t entry;
+
+	pte = pte_mkold(mk_pte(page, READ_ONCE(vma->vm_page_prot)));
+	if (pte_swp_soft_dirty(*ptep))
+		pte = pte_mksoft_dirty(pte);
+
+	entry = pte_to_swp_entry(*ptep);
+	if (pte_swp_uffd_wp(*ptep))
+		pte = pte_mkuffd_wp(pte);
+	else if (is_writable_device_exclusive_entry(entry))
+		pte = maybe_mkwrite(pte_mkdirty(pte), vma);
+
+	set_pte_at(vma->vm_mm, address, ptep, pte);
+
+	/*
+	 * No need to take a page reference as one was already
+	 * created when the swap entry was made.
+	 */
+	if (PageAnon(page))
+		page_add_anon_rmap(page, vma, address, false);
+	else
+		/*
+		 * Currently device exclusive access only supports anonymous
+		 * memory so the entry shouldn't point to a filebacked page.
+		 */
+		WARN_ON_ONCE(!PageAnon(page));
+
+	if (vma->vm_flags & VM_LOCKED)
+		mlock_vma_page(page);
+
+	/*
+	 * No need to invalidate - it was non-present before. However
+	 * secondary CPUs may have mappings that need invalidating.
+	 */
+	update_mmu_cache(vma, address, ptep);
+}
+
+/*
+ * Tries to restore an exclusive pte if the page lock can be acquired without
+ * sleeping.
+ */
+static int
+try_restore_exclusive_pte(pte_t *src_pte, struct vm_area_struct *vma,
+			unsigned long addr)
+{
+	swp_entry_t entry = pte_to_swp_entry(*src_pte);
+	struct page *page = pfn_swap_entry_to_page(entry);
+
+	if (trylock_page(page)) {
+		restore_exclusive_pte(vma, page, addr, src_pte);
+		unlock_page(page);
+		return 0;
+	}
+
+	return -EBUSY;
+}
+
 /*
  * copy one vm_area from one task to the other. Assumes the page tables
  * already present in the new task to be cleared in the whole range
@@ -780,6 +842,17 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 				pte = pte_swp_mkuffd_wp(pte);
 			set_pte_at(src_mm, addr, src_pte, pte);
 		}
+	} else if (is_device_exclusive_entry(entry)) {
+		/*
+		 * Make device exclusive entries present by restoring the
+		 * original entry then copying as for a present pte. Device
+		 * exclusive entries currently only support private writable
+		 * (ie. COW) mappings.
+		 */
+		VM_BUG_ON(!is_cow_mapping(src_vma->vm_flags));
+		if (try_restore_exclusive_pte(src_pte, src_vma, addr))
+			return -EBUSY;
+		return -ENOENT;
 	}
 	if (!userfaultfd_wp(dst_vma))
 		pte = pte_swp_clear_uffd_wp(pte);
@@ -980,9 +1053,18 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 			if (ret == -EIO) {
 				entry = pte_to_swp_entry(*src_pte);
 				break;
+			} else if (ret == -EBUSY) {
+				break;
+			} else if (!ret) {
+				progress += 8;
+				continue;
 			}
-			progress += 8;
-			continue;
+
+			/*
+			 * Device exclusive entry restored, continue by copying
+			 * the now present pte.
+			 */
+			WARN_ON_ONCE(ret != -ENOENT);
 		}
 		/* copy_present_pte() will clear `*prealloc' if consumed */
 		ret = copy_present_pte(dst_vma, src_vma, dst_pte, src_pte,
@@ -1020,6 +1102,8 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 			goto out;
 		}
 		entry.val = 0;
+	} else if (ret == -EBUSY) {
+		goto out;
 	} else if (ret ==  -EAGAIN) {
 		prealloc = page_copy_prealloc(src_mm, src_vma, addr);
 		if (!prealloc)
@@ -1287,7 +1371,8 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
 		}
 
 		entry = pte_to_swp_entry(ptent);
-		if (is_device_private_entry(entry)) {
+		if (is_device_private_entry(entry) ||
+		    is_device_exclusive_entry(entry)) {
 			struct page *page = pfn_swap_entry_to_page(entry);
 
 			if (unlikely(details && details->check_mapping)) {
@@ -1303,7 +1388,10 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
 
 			pte_clear_not_present_full(mm, addr, pte, tlb->fullmm);
 			rss[mm_counter(page)]--;
-			page_remove_rmap(page, false);
+
+			if (is_device_private_entry(entry))
+				page_remove_rmap(page, false);
+
 			put_page(page);
 			continue;
 		}
@@ -3351,6 +3439,34 @@ void unmap_mapping_range(struct address_space *mapping,
 }
 EXPORT_SYMBOL(unmap_mapping_range);
 
+/*
+ * Restore a potential device exclusive pte to a working pte entry
+ */
+static vm_fault_t remove_device_exclusive_entry(struct vm_fault *vmf)
+{
+	struct page *page = vmf->page;
+	struct vm_area_struct *vma = vmf->vma;
+	struct mmu_notifier_range range;
+
+	if (!lock_page_or_retry(page, vma->vm_mm, vmf->flags))
+		return VM_FAULT_RETRY;
+	mmu_notifier_range_init_owner(&range, MMU_NOTIFY_EXCLUSIVE, 0, vma,
+				vma->vm_mm, vmf->address & PAGE_MASK,
+				(vmf->address & PAGE_MASK) + PAGE_SIZE, NULL);
+	mmu_notifier_invalidate_range_start(&range);
+
+	vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd, vmf->address,
+				&vmf->ptl);
+	if (likely(pte_same(*vmf->pte, vmf->orig_pte)))
+		restore_exclusive_pte(vma, page, vmf->address, vmf->pte);
+
+	pte_unmap_unlock(vmf->pte, vmf->ptl);
+	unlock_page(page);
+
+	mmu_notifier_invalidate_range_end(&range);
+	return 0;
+}
+
 /*
  * We enter with non-exclusive mmap_lock (to exclude vma changes,
  * but allow concurrent faults), and pte mapped but not yet locked.
@@ -3379,6 +3495,9 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 		if (is_migration_entry(entry)) {
 			migration_entry_wait(vma->vm_mm, vmf->pmd,
 					     vmf->address);
+		} else if (is_device_exclusive_entry(entry)) {
+			vmf->page = pfn_swap_entry_to_page(entry);
+			ret = remove_device_exclusive_entry(vmf);
 		} else if (is_device_private_entry(entry)) {
 			vmf->page = pfn_swap_entry_to_page(entry);
 			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
diff --git a/mm/mprotect.c b/mm/mprotect.c
index d7f49f33d240..4cb240fd9936 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -205,6 +205,14 @@ static unsigned long change_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
 				newpte = swp_entry_to_pte(entry);
 				if (pte_swp_uffd_wp(oldpte))
 					newpte = pte_swp_mkuffd_wp(newpte);
+			} else if (is_writable_device_exclusive_entry(entry)) {
+				entry = make_readable_device_exclusive_entry(
+							swp_offset(entry));
+				newpte = swp_entry_to_pte(entry);
+				if (pte_swp_soft_dirty(oldpte))
+					newpte = pte_swp_mksoft_dirty(newpte);
+				if (pte_swp_uffd_wp(oldpte))
+					newpte = pte_swp_mkuffd_wp(newpte);
 			} else {
 				newpte = oldpte;
 			}
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index 082e8073af56..9a7284e360b5 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -41,7 +41,8 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw)
 
 				/* Handle un-addressable ZONE_DEVICE memory */
 				entry = pte_to_swp_entry(*pvmw->pte);
-				if (!is_device_private_entry(entry))
+				if (!is_device_private_entry(entry) &&
+				    !is_device_exclusive_entry(entry))
 					return false;
 			} else if (!pte_present(*pvmw->pte))
 				return false;
@@ -93,7 +94,8 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw)
 			return false;
 		entry = pte_to_swp_entry(*pvmw->pte);
 
-		if (!is_migration_entry(entry))
+		if (!is_migration_entry(entry) &&
+		    !is_device_exclusive_entry(entry))
 			return false;
 
 		pfn = swp_offset(entry);
@@ -102,7 +104,8 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw)
 
 		/* Handle un-addressable ZONE_DEVICE memory */
 		entry = pte_to_swp_entry(*pvmw->pte);
-		if (!is_device_private_entry(entry))
+		if (!is_device_private_entry(entry) &&
+		    !is_device_exclusive_entry(entry))
 			return false;
 
 		pfn = swp_offset(entry);
diff --git a/mm/rmap.c b/mm/rmap.c
index 860d1c23ab48..e5210dde0c4d 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2028,6 +2028,189 @@ void page_mlock(struct page *page)
 	rmap_walk(page, &rwc);
 }
 
+#ifdef CONFIG_DEVICE_PRIVATE
+struct make_exclusive_args {
+	struct mm_struct *mm;
+	unsigned long address;
+	void *owner;
+	bool valid;
+};
+
+static bool page_make_device_exclusive_one(struct page *page,
+		struct vm_area_struct *vma, unsigned long address, void *priv)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	struct page_vma_mapped_walk pvmw = {
+		.page = page,
+		.vma = vma,
+		.address = address,
+	};
+	struct make_exclusive_args *args = priv;
+	pte_t pteval;
+	struct page *subpage;
+	bool ret = true;
+	struct mmu_notifier_range range;
+	swp_entry_t entry;
+	pte_t swp_pte;
+
+	mmu_notifier_range_init_owner(&range, MMU_NOTIFY_EXCLUSIVE, 0, vma,
+				      vma->vm_mm, address, min(vma->vm_end,
+				      address + page_size(page)), args->owner);
+	mmu_notifier_invalidate_range_start(&range);
+
+	while (page_vma_mapped_walk(&pvmw)) {
+		/* Unexpected PMD-mapped THP? */
+		VM_BUG_ON_PAGE(!pvmw.pte, page);
+
+		if (!pte_present(*pvmw.pte)) {
+			ret = false;
+			page_vma_mapped_walk_done(&pvmw);
+			break;
+		}
+
+		subpage = page - page_to_pfn(page) + pte_pfn(*pvmw.pte);
+		address = pvmw.address;
+
+		/* Nuke the page table entry. */
+		flush_cache_page(vma, address, pte_pfn(*pvmw.pte));
+		pteval = ptep_clear_flush(vma, address, pvmw.pte);
+
+		/* Move the dirty bit to the page. Now the pte is gone. */
+		if (pte_dirty(pteval))
+			set_page_dirty(page);
+
+		/*
+		 * Check that our target page is still mapped at the expected
+		 * address.
+		 */
+		if (args->mm == mm && args->address == address &&
+		    pte_write(pteval))
+			args->valid = true;
+
+		/*
+		 * Store the pfn of the page in a special migration
+		 * pte. do_swap_page() will wait until the migration
+		 * pte is removed and then restart fault handling.
+		 */
+		if (pte_write(pteval))
+			entry = make_writable_device_exclusive_entry(
+							page_to_pfn(subpage));
+		else
+			entry = make_readable_device_exclusive_entry(
+							page_to_pfn(subpage));
+		swp_pte = swp_entry_to_pte(entry);
+		if (pte_soft_dirty(pteval))
+			swp_pte = pte_swp_mksoft_dirty(swp_pte);
+		if (pte_uffd_wp(pteval))
+			swp_pte = pte_swp_mkuffd_wp(swp_pte);
+
+		set_pte_at(mm, address, pvmw.pte, swp_pte);
+
+		/*
+		 * There is a reference on the page for the swap entry which has
+		 * been removed, so shouldn't take another.
+		 */
+		page_remove_rmap(subpage, false);
+	}
+
+	mmu_notifier_invalidate_range_end(&range);
+
+	return ret;
+}
+
+/**
+ * page_make_device_exclusive - mark the page exclusively owned by a device
+ * @page: the page to replace page table entries for
+ * @mm: the mm_struct where the page is expected to be mapped
+ * @address: address where the page is expected to be mapped
+ * @owner: passed to MMU_NOTIFY_EXCLUSIVE range notifier callbacks
+ *
+ * Tries to remove all the page table entries which are mapping this page and
+ * replace them with special device exclusive swap entries to grant a device
+ * exclusive access to the page. Caller must hold the page lock.
+ *
+ * Returns false if the page is still mapped, or if it could not be unmapped
+ * from the expected address. Otherwise returns true (success).
+ */
+static bool page_make_device_exclusive(struct page *page, struct mm_struct *mm,
+				unsigned long address, void *owner)
+{
+	struct make_exclusive_args args = {
+		.mm = mm,
+		.address = address,
+		.owner = owner,
+		.valid = false,
+	};
+	struct rmap_walk_control rwc = {
+		.rmap_one = page_make_device_exclusive_one,
+		.done = page_not_mapped,
+		.anon_lock = page_lock_anon_vma_read,
+		.arg = &args,
+	};
+
+	/*
+	 * Restrict to anonymous pages for now to avoid potential writeback
+	 * issues. Also tail pages shouldn't be passed to rmap_walk so skip
+	 * those.
+	 */
+	if (!PageAnon(page) || PageTail(page))
+		return false;
+
+	rmap_walk(page, &rwc);
+
+	return args.valid && !page_mapcount(page);
+}
+
+/**
+ * make_device_exclusive_range() - Mark a range for exclusive use by a device
+ * @mm: mm_struct of assoicated target process
+ * @start: start of the region to mark for exclusive device access
+ * @end: end address of region
+ * @pages: returns the pages which were successfully marked for exclusive access
+ * @owner: passed to MMU_NOTIFY_EXCLUSIVE range notifier to allow filtering
+ *
+ * Returns: number of pages found in the range by GUP. A page is marked for
+ * exclusive access only if the page pointer is non-NULL.
+ *
+ * This function finds ptes mapping page(s) to the given address range, locks
+ * them and replaces mappings with special swap entries preventing userspace CPU
+ * access. On fault these entries are replaced with the original mapping after
+ * calling MMU notifiers.
+ *
+ * A driver using this to program access from a device must use a mmu notifier
+ * critical section to hold a device specific lock during programming. Once
+ * programming is complete it should drop the page lock and reference after
+ * which point CPU access to the page will revoke the exclusive access.
+ */
+int make_device_exclusive_range(struct mm_struct *mm, unsigned long start,
+				unsigned long end, struct page **pages,
+				void *owner)
+{
+	long npages = (end - start) >> PAGE_SHIFT;
+	unsigned long i;
+
+	npages = get_user_pages_remote(mm, start, npages,
+				       FOLL_GET | FOLL_WRITE | FOLL_SPLIT_PMD,
+				       pages, NULL, NULL);
+	for (i = 0; i < npages; i++, start += PAGE_SIZE) {
+		if (!trylock_page(pages[i])) {
+			put_page(pages[i]);
+			pages[i] = NULL;
+			continue;
+		}
+
+		if (!page_make_device_exclusive(pages[i], mm, start, owner)) {
+			unlock_page(pages[i]);
+			put_page(pages[i]);
+			pages[i] = NULL;
+		}
+	}
+
+	return npages;
+}
+EXPORT_SYMBOL_GPL(make_device_exclusive_range);
+#endif
+
 void __put_anon_vma(struct anon_vma *anon_vma)
 {
 	struct anon_vma *root = anon_vma->root;
-- 
2.20.1

