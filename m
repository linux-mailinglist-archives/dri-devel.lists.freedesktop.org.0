Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AF5349D51
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 01:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587316EE7E;
	Fri, 26 Mar 2021 00:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3407D6EE77;
 Fri, 26 Mar 2021 00:08:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l3TYzcBsxqUxH1tASAJXfwNukkumXL692cypVByLQy0a1L00XHtxoYmJwlHxiV48/j/Sbrs6lGUd5SRMy7cabC7hH5mLl9dnObyRpdAAN0SvzxD+9ZhEyO5soK83K0J6qFNfhzCYslw70SPllwK3J4mOeEFtZ1dhpvcHtvUxkd8jL73RpBw8LrV9sU7ho/BziO1qmpED4VlG7VGBlh/JTvu4DC5k6g97xVS/lKBgncjqXpA9ADQBU5xYKfoLlvYYnRmqx1tvBZCKpo4LBAC+2/kl8JrFGjyP4XgUIwGeoCOBTsw2GVWi5bc/YhAHMtjS7VBiZ3KqExxnU5CAsN/JNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67h8f7hz1WJizD6i4Gxwp/ox+MTWMvwoGeLV4EEcFF0=;
 b=Hh0HkeV6xlQiG7uScrpB/+5LHGO40aMcFu38JNwt7QzMOEfHxLQYbqwVU7unJAYseuuNj/Fuz8fUKU6Xh6aRE9RavxZUGdVX3JOQ8lQCdwRxDRTPN4oy/+m1I3ZBR7Jv4nmw9O7s4ZkYHsqSo+39TVe24nSb0GwHBPQXwUogyyu0KbibZw4P8rDzeZWJTdT5njTITSpI0h2paLaqqfn7o7hY6dK+z6aM35Sbf+c1FKrk4nEooN1J2pIoQ2iC+mTKIO3duTHtytWmN0bE2YO/iEqTOOizcCjfCP3M69XhoNNxsqsQru2UrGGTER4qVU7Zf7MFxEpsFn0BtY9XEr8D1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67h8f7hz1WJizD6i4Gxwp/ox+MTWMvwoGeLV4EEcFF0=;
 b=NsttqfJHDSb0XMG8gLEmbdVueOw7neZuexoo97LwoCN+ld+V35v2wZb937HDbMN+LCxv71n3hT+Q9bRKAnOasZ7FXkYUWAGfVRhJ+dzaRSsmZH71/KnfBX5r2udbkacUiRvj0TyUeWAFEkoPPFD7XswDuZQ3ldn0UFe0H9/cLZExzINnA6HFffhSPV/teTEUaNkDOM4mSltQn4JlTdGn1k1Ax0xqIMUIjR2AccK42v+qMiPFvgEW54Y/xxPJrkYSSR8MfVjurW7bkYQ7Un6oFp/vJwvHQZiKFQxO3aXVCaUEOYUYrMbeRK01WlZgT7X1gsmRFQoeh4qkIfvR9rHZ0w==
Received: from MWHPR12CA0049.namprd12.prod.outlook.com (2603:10b6:300:103::11)
 by BL0PR12MB2404.namprd12.prod.outlook.com (2603:10b6:207:4c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Fri, 26 Mar
 2021 00:08:38 +0000
Received: from CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:103:cafe::1c) by MWHPR12CA0049.outlook.office365.com
 (2603:10b6:300:103::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29 via Frontend
 Transport; Fri, 26 Mar 2021 00:08:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT034.mail.protection.outlook.com (10.13.174.248) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 26 Mar 2021 00:08:36 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 26 Mar
 2021 00:08:35 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <bskeggs@redhat.com>, <akpm@linux-foundation.org>
Subject: [PATCH v7 5/8] mm: Device exclusive memory access
Date: Fri, 26 Mar 2021 11:08:02 +1100
Message-ID: <20210326000805.2518-6-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210326000805.2518-1-apopple@nvidia.com>
References: <20210326000805.2518-1-apopple@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b784b1ae-c8db-46c6-1b19-08d8efeb4d37
X-MS-TrafficTypeDiagnostic: BL0PR12MB2404:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2404E9617EDA9B162CB150A4DF619@BL0PR12MB2404.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XvGgmLPvHjtu4+4L6AnPL04El6YYPo33UUiG1GFlCHBnblNw/EIHwtrbdgiqyhHc2wABp6lTQ6/qwtOy8sq6pnuIqx/5g8iAy6vpGm8fnfIEO4f/TuwQ8UaVMGTUrPQkr0HlvBr5wvqyg622kaR0WkeL9JOgS8+FG+i6dT/Bd6Kz6RGkxhOYt3TrJcl6BLLbPW9D07KWSTjPAEjN8KduiB8Hk/A8VoLZUwcvw8ciJYUPKX9k+hW4XBWI0d1mPHri1m8LdY6Ztpb7D3t7B+7h8q55+lg3Fe+g8FZAdShG0P96yPFFTaC34c3CiWbd3zdwH++FBmGp0ZelJ++LUxN6kJRefw6QSDXB8YgnqgLw6A8WXgCQ+9O0rZMhaTEz0DvVDptCaptehGYgo1N/P1+zE2xgtp76ILo26SqoPgZa4PAsqfCnQg453mOGHKiAds66Kl+R+zaYB86+k1jOOiJtezwZet7wlQdjqc66z6gzwYWMQ8huDmhQKlnMrj++JysomI9ymG3owQfpSic7XHRAKdYKcBktFZM6j9Az0whoCMtgKcnSHbccRy4PVDbO2UgNjb59IOBmMg4AKPweScXG85uHmDTvI2OMulLI6+G0Nbj5yUz+e7CYHGhmZng0zsUmlbJY/iy0W4BKcRi1fMMwuex0r7O0NkWVvv0jLKRUcRw=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(396003)(346002)(36840700001)(46966006)(82310400003)(5660300002)(186003)(36756003)(16526019)(30864003)(2906002)(26005)(36860700001)(356005)(70586007)(4326008)(83380400001)(2616005)(70206006)(36906005)(7416002)(1076003)(478600001)(426003)(336012)(82740400003)(316002)(110136005)(8936002)(47076005)(8676002)(54906003)(6666004)(86362001)(7636003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 00:08:36.3436 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b784b1ae-c8db-46c6-1b19-08d8efeb4d37
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2404
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 jhubbard@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, jglisse@redhat.com, kvm-ppc@vger.kernel.org, jgg@nvidia.com,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>

---

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
 Documentation/vm/hmm.rst              |  19 ++-
 drivers/gpu/drm/nouveau/nouveau_svm.c |   2 +-
 include/linux/mmu_notifier.h          |  26 ++--
 include/linux/rmap.h                  |   4 +
 include/linux/swap.h                  |   4 +-
 include/linux/swapops.h               |  44 +++++-
 lib/test_hmm.c                        |   2 +-
 mm/hmm.c                              |   5 +
 mm/memory.c                           | 108 ++++++++++++-
 mm/migrate.c                          |  10 +-
 mm/mprotect.c                         |   8 +
 mm/page_vma_mapped.c                  |   9 +-
 mm/rmap.c                             | 210 ++++++++++++++++++++++++++
 13 files changed, 426 insertions(+), 25 deletions(-)

diff --git a/Documentation/vm/hmm.rst b/Documentation/vm/hmm.rst
index 09e28507f5b2..a14c2938e7af 100644
--- a/Documentation/vm/hmm.rst
+++ b/Documentation/vm/hmm.rst
@@ -332,7 +332,7 @@ between device driver specific code and shared common code:
    walks to fill in the ``args->src`` array with PFNs to be migrated.
    The ``invalidate_range_start()`` callback is passed a
    ``struct mmu_notifier_range`` with the ``event`` field set to
-   ``MMU_NOTIFY_MIGRATE`` and the ``migrate_pgmap_owner`` field set to
+   ``MMU_NOTIFY_MIGRATE`` and the ``owner`` field set to
    the ``args->pgmap_owner`` field passed to migrate_vma_setup(). This is
    allows the device driver to skip the invalidation callback and only
    invalidate device private MMU mappings that are actually migrating.
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
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index f18bd53da052..94f841026c3b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -265,7 +265,7 @@ nouveau_svmm_invalidate_range_start(struct mmu_notifier *mn,
 	 * the invalidation is handled as part of the migration process.
 	 */
 	if (update->event == MMU_NOTIFY_MIGRATE &&
-	    update->migrate_pgmap_owner == svmm->vmm->cli->drm->dev)
+	    update->owner == svmm->vmm->cli->drm->dev)
 		goto out;
 
 	if (limit > svmm->unmanaged.start && start < svmm->unmanaged.limit) {
diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index b8200782dede..2e6068d3fb9f 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -41,7 +41,12 @@ struct mmu_interval_notifier;
  *
  * @MMU_NOTIFY_MIGRATE: used during migrate_vma_collect() invalidate to signal
  * a device driver to possibly ignore the invalidation if the
- * migrate_pgmap_owner field matches the driver's device private pgmap owner.
+ * owner field matches the driver's device private pgmap owner.
+ *
+ * @MMU_NOTIFY_EXCLUSIVE: to signal a device driver that the device will no
+ * longer have exclusive access to the page. May ignore the invalidation that's
+ * part of make_device_exclusive_range() if the owner field
+ * matches the value passed to make_device_exclusive_range().
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
@@ -269,7 +275,7 @@ struct mmu_notifier_range {
 	unsigned long end;
 	unsigned flags;
 	enum mmu_notifier_event event;
-	void *migrate_pgmap_owner;
+	void *owner;
 };
 
 static inline int mm_has_notifiers(struct mm_struct *mm)
@@ -521,14 +527,14 @@ static inline void mmu_notifier_range_init(struct mmu_notifier_range *range,
 	range->flags = flags;
 }
 
-static inline void mmu_notifier_range_init_migrate(
-			struct mmu_notifier_range *range, unsigned int flags,
+static inline void mmu_notifier_range_init_owner(
+			struct mmu_notifier_range *range,
+			enum mmu_notifier_event event, unsigned int flags,
 			struct vm_area_struct *vma, struct mm_struct *mm,
-			unsigned long start, unsigned long end, void *pgmap)
+			unsigned long start, unsigned long end, void *owner)
 {
-	mmu_notifier_range_init(range, MMU_NOTIFY_MIGRATE, flags, vma, mm,
-				start, end);
-	range->migrate_pgmap_owner = pgmap;
+	mmu_notifier_range_init(range, event, flags, vma, mm, start, end);
+	range->owner = owner;
 }
 
 #define ptep_clear_flush_young_notify(__vma, __address, __ptep)		\
@@ -655,8 +661,8 @@ static inline void _mmu_notifier_range_init(struct mmu_notifier_range *range,
 
 #define mmu_notifier_range_init(range,event,flags,vma,mm,start,end)  \
 	_mmu_notifier_range_init(range, start, end)
-#define mmu_notifier_range_init_migrate(range, flags, vma, mm, start, end, \
-					pgmap) \
+#define mmu_notifier_range_init_owner(range, event, flags, vma, mm, start, \
+					end, owner) \
 	_mmu_notifier_range_init(range, start, end)
 
 static inline bool
diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index 6062e0cfca2d..b207c138cbff 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -193,6 +193,10 @@ int page_referenced(struct page *, int is_locked,
 bool try_to_migrate(struct page *page, enum ttu_flags flags);
 bool try_to_unmap(struct page *, enum ttu_flags flags);
 
+int make_device_exclusive_range(struct mm_struct *mm, unsigned long start,
+				unsigned long end, struct page **pages,
+				void *arg);
+
 /* Avoid racy checks */
 #define PVMW_SYNC		(1 << 0)
 /* Look for migarion entries rather than present PTEs */
diff --git a/include/linux/swap.h b/include/linux/swap.h
index 516104b9334b..7a3c260146df 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -63,9 +63,11 @@ static inline int current_is_kswapd(void)
  * to a special SWP_DEVICE_* entry.
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
index 4dfd807ae52a..4129bd2ff9d6 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -120,6 +120,27 @@ static inline bool is_writable_device_private_entry(swp_entry_t entry)
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
@@ -140,6 +161,26 @@ static inline bool is_writable_device_private_entry(swp_entry_t entry)
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
@@ -219,7 +260,8 @@ static inline struct page *pfn_swap_entry_to_page(swp_entry_t entry)
  */
 static inline bool is_pfn_swap_entry(swp_entry_t entry)
 {
-	return is_migration_entry(entry) || is_device_private_entry(entry);
+	return is_migration_entry(entry) || is_device_private_entry(entry) ||
+	       is_device_exclusive_entry(entry);
 }
 
 struct page_vma_mapped_walk;
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 80a78877bd93..5c9f5a020c1d 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -218,7 +218,7 @@ static bool dmirror_interval_invalidate(struct mmu_interval_notifier *mni,
 	 * the invalidation is handled as part of the migration process.
 	 */
 	if (range->event == MMU_NOTIFY_MIGRATE &&
-	    range->migrate_pgmap_owner == dmirror->mdevice)
+	    range->owner == dmirror->mdevice)
 		return true;
 
 	if (mmu_notifier_range_blockable(range))
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
index 3a5705cfc891..33d11527ef77 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -781,6 +781,27 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 				pte = pte_swp_mkuffd_wp(pte);
 			set_pte_at(src_mm, addr, src_pte, pte);
 		}
+	} else if (is_device_exclusive_entry(entry)) {
+		page = pfn_swap_entry_to_page(entry);
+
+		get_page(page);
+		rss[mm_counter(page)]++;
+
+		if (is_writable_device_exclusive_entry(entry) &&
+		    is_cow_mapping(vm_flags)) {
+			/*
+			 * COW mappings require pages in both
+			 * parent and child to be set to read.
+			 */
+			entry = make_readable_device_exclusive_entry(
+							swp_offset(entry));
+			pte = swp_entry_to_pte(entry);
+			if (pte_swp_soft_dirty(*src_pte))
+				pte = pte_swp_mksoft_dirty(pte);
+			if (pte_swp_uffd_wp(*src_pte))
+				pte = pte_swp_mkuffd_wp(pte);
+			set_pte_at(src_mm, addr, src_pte, pte);
+		}
 	}
 	set_pte_at(dst_mm, addr, dst_pte, pte);
 	return 0;
@@ -1287,7 +1308,8 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
 		}
 
 		entry = pte_to_swp_entry(ptent);
-		if (is_device_private_entry(entry)) {
+		if (is_device_private_entry(entry) ||
+		    is_device_exclusive_entry(entry)) {
 			struct page *page = pfn_swap_entry_to_page(entry);
 
 			if (unlikely(details && details->check_mapping)) {
@@ -1303,7 +1325,10 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
 
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
@@ -3256,6 +3281,82 @@ void unmap_mapping_range(struct address_space *mapping,
 }
 EXPORT_SYMBOL(unmap_mapping_range);
 
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
+		page_add_file_rmap(page, false);
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
+ * Restore a potential device exclusive pte to a working pte entry
+ */
+static vm_fault_t remove_device_exclusive_entry(struct vm_fault *vmf)
+{
+	struct page *page = vmf->page;
+	struct vm_area_struct *vma = vmf->vma;
+	struct page_vma_mapped_walk pvmw = {
+		.page = page,
+		.vma = vma,
+		.address = vmf->address,
+		.flags = PVMW_SYNC,
+	};
+	vm_fault_t ret = 0;
+	struct mmu_notifier_range range;
+
+	if (!lock_page_or_retry(page, vma->vm_mm, vmf->flags))
+		return VM_FAULT_RETRY;
+	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma, vma->vm_mm,
+				vmf->address & PAGE_MASK,
+				(vmf->address & PAGE_MASK) + PAGE_SIZE);
+	mmu_notifier_invalidate_range_start(&range);
+
+	while (page_vma_mapped_walk(&pvmw)) {
+		if (unlikely(!pte_same(*pvmw.pte, vmf->orig_pte))) {
+			page_vma_mapped_walk_done(&pvmw);
+			break;
+		}
+
+		restore_exclusive_pte(vma, page, pvmw.address, pvmw.pte);
+	}
+
+	unlock_page(page);
+
+	mmu_notifier_invalidate_range_end(&range);
+	return ret;
+}
+
 /*
  * We enter with non-exclusive mmap_lock (to exclude vma changes,
  * but allow concurrent faults), and pte mapped but not yet locked.
@@ -3283,6 +3384,9 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 		if (is_migration_entry(entry)) {
 			migration_entry_wait(vma->vm_mm, vmf->pmd,
 					     vmf->address);
+		} else if (is_device_exclusive_entry(entry)) {
+			vmf->page = pfn_swap_entry_to_page(entry);
+			ret = remove_device_exclusive_entry(vmf);
 		} else if (is_device_private_entry(entry)) {
 			vmf->page = pfn_swap_entry_to_page(entry);
 			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
diff --git a/mm/migrate.c b/mm/migrate.c
index cc4612e2a246..9cc9251d4802 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2570,8 +2570,8 @@ static void migrate_vma_collect(struct migrate_vma *migrate)
 	 * that the registered device driver can skip invalidating device
 	 * private page mappings that won't be migrated.
 	 */
-	mmu_notifier_range_init_migrate(&range, 0, migrate->vma,
-		migrate->vma->vm_mm, migrate->start, migrate->end,
+	mmu_notifier_range_init_owner(&range, MMU_NOTIFY_MIGRATE, 0,
+		migrate->vma, migrate->vma->vm_mm, migrate->start, migrate->end,
 		migrate->pgmap_owner);
 	mmu_notifier_invalidate_range_start(&range);
 
@@ -3074,9 +3074,9 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 			if (!notified) {
 				notified = true;
 
-				mmu_notifier_range_init_migrate(&range, 0,
-					migrate->vma, migrate->vma->vm_mm,
-					addr, migrate->end,
+				mmu_notifier_range_init_owner(&range,
+					MMU_NOTIFY_MIGRATE, 0, migrate->vma,
+					migrate->vma->vm_mm, addr, migrate->end,
 					migrate->pgmap_owner);
 				mmu_notifier_invalidate_range_start(&range);
 			}
diff --git a/mm/mprotect.c b/mm/mprotect.c
index f21b760ec809..c6018541ea3d 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -165,6 +165,14 @@ static unsigned long change_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
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
index eed988ab2e81..29842f169219 100644
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
index b540b44e299a..b0ec88a37dab 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2005,6 +2005,216 @@ void try_to_munlock(struct page *page)
 	rmap_walk(page, &rwc);
 }
 
+struct ttp_args {
+	struct mm_struct *mm;
+	unsigned long address;
+	void *arg;
+	bool valid;
+};
+
+static bool try_to_protect_one(struct page *page, struct vm_area_struct *vma,
+			unsigned long address, void *arg)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	struct page_vma_mapped_walk pvmw = {
+		.page = page,
+		.vma = vma,
+		.address = address,
+	};
+	struct ttp_args *ttp = arg;
+	pte_t pteval;
+	struct page *subpage;
+	bool ret = true;
+	struct mmu_notifier_range range;
+	swp_entry_t entry;
+	pte_t swp_pte;
+
+	mmu_notifier_range_init_owner(&range, MMU_NOTIFY_EXCLUSIVE, 0, vma,
+				      vma->vm_mm, address,
+				      min(vma->vm_end,
+					  address + page_size(page)),
+				      ttp->arg);
+	if (PageHuge(page)) {
+		/*
+		 * If sharing is possible, start and end will be adjusted
+		 * accordingly.
+		 */
+		adjust_range_if_pmd_sharing_possible(vma, &range.start,
+						     &range.end);
+	}
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
+		/* Update high watermark before we lower rss */
+		update_hiwater_rss(mm);
+
+		if (arch_unmap_one(mm, vma, address, pteval) < 0) {
+			set_pte_at(mm, address, pvmw.pte, pteval);
+			ret = false;
+			page_vma_mapped_walk_done(&pvmw);
+			break;
+		}
+
+		/*
+		 * Check that our target page is still mapped at the expected
+		 * address.
+		 */
+		if (ttp->mm == mm && ttp->address == address &&
+		    pte_write(pteval))
+			ttp->valid = true;
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
+		/* Take a reference for the swap entry */
+		get_page(page);
+		set_pte_at(mm, address, pvmw.pte, swp_pte);
+
+		page_remove_rmap(subpage, PageHuge(page));
+		put_page(page);
+	}
+
+	mmu_notifier_invalidate_range_end(&range);
+
+	return ret;
+}
+
+/**
+ * try_to_protect - try to replace all page table mappings with swap entries
+ * @page: the page to replace page table entries for
+ * @flags: action and flags
+ * @mm: the mm_struct where the page is expected to be mapped
+ * @address: address where the page is expected to be mapped
+ * @arg: passed to MMU_NOTIFY_EXCLUSIVE range notifier callbacks
+ *
+ * Tries to remove all the page table entries which are mapping this page and
+ * replace them with special swap entries to grant a device exclusive access to
+ * the page. Caller must hold the page lock.
+ *
+ * Returns false if the page is still mapped, or if it could not be unmapped
+ * from the expected address. Otherwise returns true (success).
+ */
+static bool try_to_protect(struct page *page, struct mm_struct *mm,
+			   unsigned long address, void *arg)
+{
+	struct ttp_args ttp = {
+		.mm = mm,
+		.address = address,
+		.arg = arg,
+		.valid = false,
+	};
+	struct rmap_walk_control rwc = {
+		.rmap_one = try_to_protect_one,
+		.done = page_not_mapped,
+		.anon_lock = page_lock_anon_vma_read,
+		.arg = &ttp,
+	};
+
+	/*
+	 * Restrict to anonymous pages for now to avoid potential writeback
+	 * issues.
+	 */
+	if (!PageAnon(page))
+		return false;
+
+	/*
+	 * During exec, a temporary VMA is setup and later moved.
+	 * The VMA is moved under the anon_vma lock but not the
+	 * page tables leading to a race where migration cannot
+	 * find the migration ptes. Rather than increasing the
+	 * locking requirements of exec(), migration skips
+	 * temporary VMAs until after exec() completes.
+	 */
+	if (!PageKsm(page) && PageAnon(page))
+		rwc.invalid_vma = invalid_migration_vma;
+
+	rmap_walk(page, &rwc);
+
+	return ttp.valid && !page_mapcount(page);
+}
+
+/**
+ * make_device_exclusive_range() - Mark a range for exclusive use by a device
+ * @mm: mm_struct of assoicated target process
+ * @start: start of the region to mark for exclusive device access
+ * @end: end address of region
+ * @pages: returns the pages which were successfully marked for exclusive access
+ * @arg: passed to MMU_NOTIFY_EXCLUSIVE range notifier too allow filtering
+ *
+ * Returns: number of pages successfully marked for exclusive access
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
+				void *arg)
+{
+	unsigned long npages = (end - start) >> PAGE_SHIFT;
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
+		if (!try_to_protect(pages[i], mm, start, arg)) {
+			unlock_page(pages[i]);
+			put_page(pages[i]);
+			pages[i] = NULL;
+		}
+	}
+
+	return npages;
+}
+EXPORT_SYMBOL_GPL(make_device_exclusive_range);
+
 void __put_anon_vma(struct anon_vma *anon_vma)
 {
 	struct anon_vma *root = anon_vma->root;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
