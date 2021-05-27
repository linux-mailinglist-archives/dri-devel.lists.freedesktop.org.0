Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C5F392580
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 05:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80C96EDF7;
	Thu, 27 May 2021 03:35:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F476EDF7;
 Thu, 27 May 2021 03:35:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cOhS7rkCKeCOYNW/zTDpqUMJ2pIXtVTHxq94ZriRbK+e4L8HV2L68YivXcIMC/cNT3+srYibrbiuZM4EfbHHuAr1YHWbFL2LD0vRMLfVZ17fLGRg+JTNxmit9xlYqd3VLMjYCejDhT5UjZZ6t6UvaakQD8u66FfBKHVbgl/M6VnyWXtDU+KKZAnCiAbB1vLxlGGsIG2wM6ZMZztRk3R3QzK3BYvStn7YyuJosZrlChHtvecAjtw/JaeU2m+dCjGBgDMQuwiO+ddjIhRTtlPoB4alThLcmfBHOU/9+AeS/v2x0a2FJ+bGaXihZSE/RE94ZPPm7CgOgb8eCc4ip5oGWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gK4D2H8K8rvd050MfvpU1bCw0882ti//zI3vMEGD7cs=;
 b=TUqqaKJyFybp8rALdyXvMZArypgo7Wn7kMsZM9D1B44Q59ouwLIo1JcNUnixmQxBUWobjxWl4rGQ+0VxCxJIocA8hGiZLVSMfm6ucYH/LONKpzNgbdRu1q7/v/Vsy8gCBGXL+rhdNlBZiDm7xMf7ODNnEPFvMiYjJQETwuOKEGqrUI7NxVjiqOAneHASgU3H/sjunPh2mrdOwJloUo7cXcwnmfIDmU7cH8tpQ1s3YkyHDbjKyChOa5fAA0AGc0d93KnAhdSKO7QvDpc/+ApMOptgMGtuXmy2O1bwzYxMO4CRPOYRQ+Cz0I493zpS59S7phTzaBYv9F7avDzaYVV5lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gK4D2H8K8rvd050MfvpU1bCw0882ti//zI3vMEGD7cs=;
 b=oNuBcTNefIuUwD38aZnRSlWBYFWWWxYpKK/5iXKdCugZxcG8U9yFOa+W3d19pR6tM7zWgW0AmIu5s5+b9TXvhXUFu6t5YR7x+YPNaKzAtw8uvmKCFMpy49FiPa50fEsA0lpypgPiQbx/o926J1WCuuC/8/utcw8Ang2wL0h02/dF0VgKWmb55QWVQo0PBwtO/A/uN0jF1DVp9uj1DL8VVSidf6nbTmUR2j/AH5b9Twbtc4Qj7b0LKAvj+TcRpbWwcoxnNYYpO+TUWLnQeFT0Ee8XPEC7eQjx8YWuteuoD7T4E+XyFpqWIVOHT9GG6gp4kN8GVGPg+mTDEvj73+sUow==
Received: from BN6PR18CA0005.namprd18.prod.outlook.com (2603:10b6:404:121::15)
 by BL0PR12MB4996.namprd12.prod.outlook.com (2603:10b6:208:1c6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Thu, 27 May
 2021 03:35:45 +0000
Received: from BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:121:cafe::68) by BN6PR18CA0005.outlook.office365.com
 (2603:10b6:404:121::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Thu, 27 May 2021 03:35:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT021.mail.protection.outlook.com (10.13.177.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Thu, 27 May 2021 03:35:45 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 27 May
 2021 03:35:41 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v9 07/10] mm: Device exclusive memory access
Date: Thu, 27 May 2021 13:35:39 +1000
Message-ID: <37725705.JvxlXkkoz5@nvdebian>
In-Reply-To: <YK6hYGEx+XzeZELV@t490s>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <20210524132725.12697-8-apopple@nvidia.com> <YK6hYGEx+XzeZELV@t490s>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75431eda-eed1-4822-86cd-08d920c0831d
X-MS-TrafficTypeDiagnostic: BL0PR12MB4996:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4996DE657114DC3C9EA1D5ABDF239@BL0PR12MB4996.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n+CvSPXlGGdRxtxv/CchSl+HRRn4KDlfxKZqEKBpjJ5bZokPgZFikjz+tYmL3CyJmJv2K/qAI5Kvper/baOXz3tmDWE004KNWNmcZ+JrOLHfyzF3ZIvAq2enXw8dt5F201QdHusiHaKzCmDwcz6fY9xpviSDWq7VOJ39Fgm7u0ZqhC9KPxsPyBe3SXFalZ+p5/u254cGFKZqfY0qpoChatNAqECfVqgy/9OxvZg301hxkZMCLyPM37ILtbRaPGYqoFQtcwjR92j5tjkbppry7WRbXhqfKoimVy8LObrrMzV24ZexfERhoZzMIQ7EQ9k8gn+TYKnZYXKiHsc5U6c9uuO0VrON42R8GAWl20XfbV0BuqbGnQvn3i46Qkz1zyRJxWXpwp/OWI0phFLN9UjmQJt8KHn1Q/dEhZjdBYPZwbZbXgwMp/1Q0GJ8g8K3V2V2OHzWmzcEKdLDBh3AHYjAFn7+ZjQfuavGgdVToU/BAqVJwTZsXFZsFejhyjGGOT+vgt5oFaxYB663GK/mRKgjdnbcFLyFi8mwl/ZPkwrCn5iJ/0aZmfFmnulakTlpLUKgG0rVjKI3OL2JhVXQGceV1yJThcJ+nLOj9Lxxrkm4H3qfylOGEMhWjj4+mjZDYHvY7bCMc7n0XjigkSLnNLZr77HHEkxLBd4lCcnagW7qfrarabh1WNcCsG3SV+2F8tJK
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(36840700001)(46966006)(356005)(7636003)(82740400003)(83380400001)(86362001)(30864003)(33716001)(54906003)(36906005)(82310400003)(7416002)(47076005)(2906002)(6916009)(8676002)(36860700001)(9576002)(70586007)(4326008)(316002)(9686003)(478600001)(8936002)(426003)(336012)(26005)(16526019)(186003)(5660300002)(70206006)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 03:35:45.2567 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75431eda-eed1-4822-86cd-08d920c0831d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4996
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
 nouveau@lists.freedesktop.org, bsingharora@gmail.com, hughd@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 jgg@nvidia.com, jhubbard@nvidia.com, akpm@linux-foundation.org, Christoph
 Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, 27 May 2021 5:28:32 AM AEST Peter Xu wrote:
> On Mon, May 24, 2021 at 11:27:22PM +1000, Alistair Popple wrote:
> > Some devices require exclusive write access to shared virtual
> > memory (SVM) ranges to perform atomic operations on that memory. This
> > requires CPU page tables to be updated to deny access whilst atomic
> > operations are occurring.
> > 
> > In order to do this introduce a new swap entry
> > type (SWP_DEVICE_EXCLUSIVE). When a SVM range needs to be marked for
> > exclusive access by a device all page table mappings for the particular
> > range are replaced with device exclusive swap entries. This causes any
> > CPU access to the page to result in a fault.
> > 
> > Faults are resovled by replacing the faulting entry with the original
> > mapping. This results in MMU notifiers being called which a driver uses
> > to update access permissions such as revoking atomic access. After
> > notifiers have been called the device will no longer have exclusive
> > access to the region.
> > 
> > Walking of the page tables to find the target pages is handled by
> > get_user_pages() rather than a direct page table walk. A direct page
> > table walk similar to what migrate_vma_collect()/unmap() does could also
> > have been utilised. However this resulted in more code similar in
> > functionality to what get_user_pages() provides as page faulting is
> > required to make the PTEs present and to break COW.
> > 
> > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > 
> > ---
> > 
> > v9:
> > * Split rename of migrate_pgmap_owner into a separate patch.
> > * Added comments explaining SWP_DEVICE_EXCLUSIVE_* entries.
> > * Renamed try_to_protect{_one} to page_make_device_exclusive{_one} based
> > 
> >   somewhat on a suggestion from Peter Xu. I was never particularly happy
> >   with try_to_protect() as a name so think this is better.
> > 
> > * Removed unneccesary code and reworded some comments based on feedback
> > 
> >   from Peter Xu.
> > 
> > * Removed the VMA walk when restoring PTEs for device-exclusive entries.
> > * Simplified implementation of copy_pte_range() to fail if the page
> > 
> >   cannot be locked. This might lead to occasional fork() failures but at
> >   this stage we don't think that will be an issue.
> > 
> > v8:
> > * Remove device exclusive entries on fork rather than copy them.
> > 
> > v7:
> > * Added Christoph's Reviewed-by.
> > * Minor cosmetic cleanups suggested by Christoph.
> > * Replace mmu_notifier_range_init_migrate/exclusive with
> > 
> >   mmu_notifier_range_init_owner as suggested by Christoph.
> > 
> > * Replaced lock_page() with lock_page_retry() when handling faults.
> > * Restrict to anonymous pages for now.
> > 
> > v6:
> > * Fixed a bisectablity issue due to incorrectly applying the rename of
> > 
> >   migrate_pgmap_owner to the wrong patches for Nouveau and hmm_test.
> > 
> > v5:
> > * Renamed range->migrate_pgmap_owner to range->owner.
> > * Added MMU_NOTIFY_EXCLUSIVE to allow passing of a driver cookie which
> > 
> >   allows notifiers called as a result of make_device_exclusive_range() to
> >   be ignored.
> > 
> > * Added a check to try_to_protect_one() to detect if the pages originally
> > 
> >   returned from get_user_pages() have been unmapped or not.
> > 
> > * Removed check_device_exclusive_range() as it is no longer required with
> > 
> >   the other changes.
> > 
> > * Documentation update.
> > 
> > v4:
> > * Add function to check that mappings are still valid and exclusive.
> > * s/long/unsigned long/ in make_device_exclusive_entry().
> > ---
> > 
> >  Documentation/vm/hmm.rst     |  17 ++++
> >  include/linux/mmu_notifier.h |   6 ++
> >  include/linux/rmap.h         |   4 +
> >  include/linux/swap.h         |   7 +-
> >  include/linux/swapops.h      |  44 ++++++++-
> >  mm/hmm.c                     |   5 +
> >  mm/memory.c                  | 128 +++++++++++++++++++++++-
> >  mm/mprotect.c                |   8 ++
> >  mm/page_vma_mapped.c         |   9 +-
> >  mm/rmap.c                    | 186 +++++++++++++++++++++++++++++++++++
> >  10 files changed, 405 insertions(+), 9 deletions(-)
> > 
> > diff --git a/Documentation/vm/hmm.rst b/Documentation/vm/hmm.rst
> > index 3df79307a797..a14c2938e7af 100644
> > --- a/Documentation/vm/hmm.rst
> > +++ b/Documentation/vm/hmm.rst
> > 
> > @@ -405,6 +405,23 @@ between device driver specific code and shared common 
code:
> >     The lock can now be released.
> > 
> > +Exclusive access memory
> > +=======================
> > +
> > +Some devices have features such as atomic PTE bits that can be used to
> > implement +atomic access to system memory. To support atomic operations
> > to a shared virtual +memory page such a device needs access to that page
> > which is exclusive of any +userspace access from the CPU. The
> > ``make_device_exclusive_range()`` function +can be used to make a memory
> > range inaccessible from userspace.
> > +
> > +This replaces all mappings for pages in the given range with special swap
> > +entries. Any attempt to access the swap entry results in a fault which is
> > +resovled by replacing the entry with the original mapping. A driver gets
> > +notified that the mapping has been changed by MMU notifiers, after which
> > point +it will no longer have exclusive access to the page. Exclusive
> > access is +guranteed to last until the driver drops the page lock and
> > page reference, at +which point any CPU faults on the page may proceed as
> > described.
> > +
> > 
> >  Memory cgroup (memcg) and rss accounting
> >  ========================================
> > 
> > diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
> > index 8e428eb813b8..d049e0f6f756 100644
> > --- a/include/linux/mmu_notifier.h
> > +++ b/include/linux/mmu_notifier.h
> > @@ -42,6 +42,11 @@ struct mmu_interval_notifier;
> > 
> >   * @MMU_NOTIFY_MIGRATE: used during migrate_vma_collect() invalidate to
> >   signal * a device driver to possibly ignore the invalidation if the
> >   * owner field matches the driver's device private pgmap owner.
> > 
> > + *
> > + * @MMU_NOTIFY_EXCLUSIVE: to signal a device driver that the device will
> > no + * longer have exclusive access to the page. May ignore the
> > invalidation that's + * part of make_device_exclusive_range() if the
> > owner field
> > + * matches the value passed to make_device_exclusive_range().
> 
> Perhaps s/matches/does not match/?

No, "matches" is correct. The MMU_NOTIFY_EXCLUSIVE notifier is to notify a 
listener that a range is being invalidated for the purpose of making the range 
available for some device to have exclusive access to. Which does also mean a 
device getting the notification no longer has exclusive access if it already 
did.

A unique type is needed because when creating the range a driver needs to form 
a mmu critical section (with mmu_interval_read_begin()/
mmu_interval_read_end()) to ensure the entry remains valid long enough to 
program the device pte and hasn't been invalidated.

However without a way of filtering any invalidations will result in a retry, 
but make_device_exclusive_range() needs to do an invalidation during 
installation of the entry. To avoid this causing infinite retries the driver 
ignores specific invalidation events that it knows don't apply, ie. the 
invalidations that are a result of that driver asking for device exclusive 
entries.

Agree the comment could be improved though.

> >   */
> >  
> >  enum mmu_notifier_event {
> >  
> >       MMU_NOTIFY_UNMAP = 0,
> > 
> > @@ -51,6 +56,7 @@ enum mmu_notifier_event {
> > 
> >       MMU_NOTIFY_SOFT_DIRTY,
> >       MMU_NOTIFY_RELEASE,
> >       MMU_NOTIFY_MIGRATE,
> > 
> > +     MMU_NOTIFY_EXCLUSIVE,
> > 
> >  };
> >  
> >  #define MMU_NOTIFIER_RANGE_BLOCKABLE (1 << 0)
> > 
> > diff --git a/include/linux/rmap.h b/include/linux/rmap.h
> > index 0e25d829f742..3a1ce4ef9276 100644
> > --- a/include/linux/rmap.h
> > +++ b/include/linux/rmap.h
> > @@ -193,6 +193,10 @@ int page_referenced(struct page *, int is_locked,
> > 
> >  bool try_to_migrate(struct page *page, enum ttu_flags flags);
> >  bool try_to_unmap(struct page *, enum ttu_flags flags);
> > 
> > +int make_device_exclusive_range(struct mm_struct *mm, unsigned long
> > start,
> > +                             unsigned long end, struct page **pages,
> > +                             void *arg);
> > +
> > 
> >  /* Avoid racy checks */
> >  #define PVMW_SYNC            (1 << 0)
> >  /* Look for migarion entries rather than present PTEs */
> > 
> > diff --git a/include/linux/swap.h b/include/linux/swap.h
> > index a6d4505ecf73..306df39d7c67 100644
> > --- a/include/linux/swap.h
> > +++ b/include/linux/swap.h
> > @@ -63,11 +63,16 @@ static inline int current_is_kswapd(void)
> > 
> >   *
> >   * When a page is migrated from CPU to device, we set the CPU page table
> >   entry * to a special SWP_DEVICE_* entry.
> 
> s/SWP_DEVICE_*/SWP_DEVICE_{READ|WRITE}/?  Since SWP_DEVICE_* covers all four
> too.

Sure.

> > + *
> > + * When a page is mapped by the device for exclusive access we set the
> > CPU page + * table entries to special SWP_DEVICE_EXCLUSIVE_* entries.
> > 
> >   */
> >  
> >  #ifdef CONFIG_DEVICE_PRIVATE
> > 
> > -#define SWP_DEVICE_NUM 2
> > +#define SWP_DEVICE_NUM 4
> > 
> >  #define SWP_DEVICE_WRITE
> >  (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM)
> >  #define SWP_DEVICE_READ
> >  (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+1)> 
> > +#define SWP_DEVICE_EXCLUSIVE_WRITE
> > (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+2) +#define
> > SWP_DEVICE_EXCLUSIVE_READ
> > (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+3)> 
> >  #else
> >  #define SWP_DEVICE_NUM 0
> >  #endif
> > 
> > diff --git a/include/linux/swapops.h b/include/linux/swapops.h
> > index 4dfd807ae52a..4129bd2ff9d6 100644
> > --- a/include/linux/swapops.h
> > +++ b/include/linux/swapops.h
> > @@ -120,6 +120,27 @@ static inline bool
> > is_writable_device_private_entry(swp_entry_t entry)> 
> >  {
> >  
> >       return unlikely(swp_type(entry) == SWP_DEVICE_WRITE);
> >  
> >  }
> > 
> > +
> > +static inline swp_entry_t make_readable_device_exclusive_entry(pgoff_t
> > offset) +{
> > +     return swp_entry(SWP_DEVICE_EXCLUSIVE_READ, offset);
> > +}
> > +
> > +static inline swp_entry_t make_writable_device_exclusive_entry(pgoff_t
> > offset) +{
> > +     return swp_entry(SWP_DEVICE_EXCLUSIVE_WRITE, offset);
> > +}
> > +
> > +static inline bool is_device_exclusive_entry(swp_entry_t entry)
> > +{
> > +     return swp_type(entry) == SWP_DEVICE_EXCLUSIVE_READ ||
> > +             swp_type(entry) == SWP_DEVICE_EXCLUSIVE_WRITE;
> > +}
> > +
> > +static inline bool is_writable_device_exclusive_entry(swp_entry_t entry)
> > +{
> > +     return unlikely(swp_type(entry) == SWP_DEVICE_EXCLUSIVE_WRITE);
> > +}
> > 
> >  #else /* CONFIG_DEVICE_PRIVATE */
> >  static inline swp_entry_t make_readable_device_private_entry(pgoff_t
> >  offset) {
> > 
> > @@ -140,6 +161,26 @@ static inline bool
> > is_writable_device_private_entry(swp_entry_t entry)> 
> >  {
> >  
> >       return false;
> >  
> >  }
> > 
> > +
> > +static inline swp_entry_t make_readable_device_exclusive_entry(pgoff_t
> > offset) +{
> > +     return swp_entry(0, 0);
> > +}
> > +
> > +static inline swp_entry_t make_writable_device_exclusive_entry(pgoff_t
> > offset) +{
> > +     return swp_entry(0, 0);
> > +}
> > +
> > +static inline bool is_device_exclusive_entry(swp_entry_t entry)
> > +{
> > +     return false;
> > +}
> > +
> > +static inline bool is_writable_device_exclusive_entry(swp_entry_t entry)
> > +{
> > +     return false;
> > +}
> > 
> >  #endif /* CONFIG_DEVICE_PRIVATE */
> >  
> >  #ifdef CONFIG_MIGRATION
> > 
> > @@ -219,7 +260,8 @@ static inline struct page
> > *pfn_swap_entry_to_page(swp_entry_t entry)> 
> >   */
> >  
> >  static inline bool is_pfn_swap_entry(swp_entry_t entry)
> >  {
> > 
> > -     return is_migration_entry(entry) || is_device_private_entry(entry);
> > +     return is_migration_entry(entry) || is_device_private_entry(entry)
> > ||
> > +            is_device_exclusive_entry(entry);
> > 
> >  }
> >  
> >  struct page_vma_mapped_walk;
> > 
> > diff --git a/mm/hmm.c b/mm/hmm.c
> > index 11df3ca30b82..fad6be2bf072 100644
> > --- a/mm/hmm.c
> > +++ b/mm/hmm.c
> > @@ -26,6 +26,8 @@
> > 
> >  #include <linux/mmu_notifier.h>
> >  #include <linux/memory_hotplug.h>
> > 
> > +#include "internal.h"
> > +
> > 
> >  struct hmm_vma_walk {
> >  
> >       struct hmm_range        *range;
> >       unsigned long           last;
> > 
> > @@ -271,6 +273,9 @@ static int hmm_vma_handle_pte(struct mm_walk *walk,
> > unsigned long addr,> 
> >               if (!non_swap_entry(entry))
> >               
> >                       goto fault;
> > 
> > +             if (is_device_exclusive_entry(entry))
> > +                     goto fault;
> > +
> > 
> >               if (is_migration_entry(entry)) {
> >               
> >                       pte_unmap(ptep);
> >                       hmm_vma_walk->last = addr;
> > 
> > diff --git a/mm/memory.c b/mm/memory.c
> > index e061cfa18c11..c1d2d732f189 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -700,6 +700,68 @@ struct page *vm_normal_page_pmd(struct vm_area_struct
> > *vma, unsigned long addr,> 
> >  }
> >  #endif
> > 
> > +static void restore_exclusive_pte(struct vm_area_struct *vma,
> > +                               struct page *page, unsigned long address,
> > +                               pte_t *ptep)
> > +{
> > +     pte_t pte;
> > +     swp_entry_t entry;
> > +
> > +     pte = pte_mkold(mk_pte(page, READ_ONCE(vma->vm_page_prot)));
> > +     if (pte_swp_soft_dirty(*ptep))
> > +             pte = pte_mksoft_dirty(pte);
> > +
> > +     entry = pte_to_swp_entry(*ptep);
> > +     if (pte_swp_uffd_wp(*ptep))
> > +             pte = pte_mkuffd_wp(pte);
> > +     else if (is_writable_device_exclusive_entry(entry))
> > +             pte = maybe_mkwrite(pte_mkdirty(pte), vma);
> > +
> > +     set_pte_at(vma->vm_mm, address, ptep, pte);
> > +
> > +     /*
> > +      * No need to take a page reference as one was already
> > +      * created when the swap entry was made.
> > +      */
> > +     if (PageAnon(page))
> > +             page_add_anon_rmap(page, vma, address, false);
> > +     else
> > +             /*
> > +              * Currently device exclusive access only supports anonymous
> > +              * memory so the entry shouldn't point to a filebacked page.
> > +              */
> > +             WARN_ON_ONCE(!PageAnon(page));
> > +
> > +     if (vma->vm_flags & VM_LOCKED)
> > +             mlock_vma_page(page);
> > +
> > +     /*
> > +      * No need to invalidate - it was non-present before. However
> > +      * secondary CPUs may have mappings that need invalidating.
> > +      */
> > +     update_mmu_cache(vma, address, ptep);
> > +}
> > +
> > +/*
> > + * Tries to restore an exclusive pte if the page lock can be acquired
> > without + * sleeping.
> > + */
> > +static unsigned long
> 
> Better return a int?

Ok.

> > +try_restore_exclusive_pte(struct mm_struct *src_mm, pte_t *src_pte,
> > +                       struct vm_area_struct *vma, unsigned long addr)
> 
> Raised in the other thread too: src_mm can be dropped.

Ack, sorry I must have missed that.

> > +{
> > +     swp_entry_t entry = pte_to_swp_entry(*src_pte);
> > +     struct page *page = pfn_swap_entry_to_page(entry);
> > +
> > +     if (trylock_page(page)) {
> > +             restore_exclusive_pte(vma, page, addr, src_pte);
> > +             unlock_page(page);
> > +             return 0;
> > +     }
> > +
> > +     return -EBUSY;
> > +}
> > +
> > 
> >  /*
> >  
> >   * copy one vm_area from one task to the other. Assumes the page tables
> >   * already present in the new task to be cleared in the whole range
> > 
> > @@ -781,6 +843,17 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct
> > mm_struct *src_mm,> 
> >                               pte = pte_swp_mkuffd_wp(pte);
> >                       
> >                       set_pte_at(src_mm, addr, src_pte, pte);
> >               
> >               }
> > 
> > +     } else if (is_device_exclusive_entry(entry)) {
> > +             /*
> > +              * Make device exclusive entries present by restoring the
> > +              * original entry then copying as for a present pte. Device
> > +              * exclusive entries currently only support private writable
> > +              * (ie. COW) mappings.
> > +              */
> > +             VM_BUG_ON(!is_cow_mapping(vma->vm_flags));
> > +             if (try_restore_exclusive_pte(src_mm, src_pte, vma, addr))
> > +                     return -EBUSY;
> > +             return -ENOENT;
> > 
> >       }
> >       set_pte_at(dst_mm, addr, dst_pte, pte);
> >       return 0;
> > 
> > @@ -980,9 +1053,18 @@ copy_pte_range(struct vm_area_struct *dst_vma,
> > struct vm_area_struct *src_vma,> 
> >                       if (ret == -EAGAIN) {
> >                       
> >                               entry = pte_to_swp_entry(*src_pte);
> >                               break;
> > 
> > +                     } else if (ret == -EBUSY) {
> > +                             break;
> > +                     } else if (!ret) {
> > +                             progress += 8;
> > +                             continue;
> > 
> >                       }
> > 
> > -                     progress += 8;
> > -                     continue;
> > +
> > +                     /*
> > +                      * Device exclusive entry restored, continue by
> > copying +                      * the now present pte.
> > +                      */
> > +                     WARN_ON_ONCE(ret != -ENOENT);
> 
> The change looks right, thanks.  It's just that we should start to consider
> document all these err code now in copy_pte_range() some day (perhaps on top
> of this patch)..

I tried to write the documentation but with the new clean-up patch using a 
unique return code for each case the code ends up being rather self 
documenting IMHO. It seems reasonably obvious what function returns what due 
to the "if (ret == ...) break;" statements after each so the comments ended up 
repeating the code (ie. copy_present_pte() returns this for this case, etc.), 
but lets see what we think once I've updated.

Of course the whole thing is still a bit clunky, so it's still on my list of 
things to look at reworking/cleaning up in future.
 
> >               }
> >               /* copy_present_pte() will clear `*prealloc' if consumed */
> >               ret = copy_present_pte(dst_vma, src_vma, dst_pte, src_pte,
> > 
> > @@ -1019,6 +1101,8 @@ copy_pte_range(struct vm_area_struct *dst_vma,
> > struct vm_area_struct *src_vma,> 
> >                       goto out;
> >               
> >               }
> >               entry.val = 0;
> > 
> > +     } else if (ret == -EBUSY) {
> > +             return -EBUSY;
> > 
> >       } else if (ret) {
> >       
> >               WARN_ON_ONCE(ret != -EAGAIN);
> >               prealloc = page_copy_prealloc(src_mm, src_vma, addr);
> > 
> > @@ -1283,7 +1367,8 @@ static unsigned long zap_pte_range(struct mmu_gather
> > *tlb,> 
> >               }
> >               
> >               entry = pte_to_swp_entry(ptent);
> > 
> > -             if (is_device_private_entry(entry)) {
> > +             if (is_device_private_entry(entry) ||
> > +                 is_device_exclusive_entry(entry)) {
> > 
> >                       struct page *page = pfn_swap_entry_to_page(entry);
> >                       
> >                       if (unlikely(details && details->check_mapping)) {
> > 
> > @@ -1299,7 +1384,10 @@ static unsigned long zap_pte_range(struct
> > mmu_gather *tlb,> 
> >                       pte_clear_not_present_full(mm, addr, pte,
> >                       tlb->fullmm);
> >                       rss[mm_counter(page)]--;
> > 
> > -                     page_remove_rmap(page, false);
> > +
> > +                     if (is_device_private_entry(entry))
> > +                             page_remove_rmap(page, false);
> > +
> > 
> >                       put_page(page);
> >                       continue;
> >               
> >               }
> > 
> > @@ -3303,6 +3391,35 @@ void unmap_mapping_range(struct address_space
> > *mapping,> 
> >  }
> >  EXPORT_SYMBOL(unmap_mapping_range);
> > 
> > +/*
> > + * Restore a potential device exclusive pte to a working pte entry
> > + */
> > +static vm_fault_t remove_device_exclusive_entry(struct vm_fault *vmf)
> > +{
> > +     struct page *page = vmf->page;
> > +     struct vm_area_struct *vma = vmf->vma;
> > +     vm_fault_t ret = 0;
> > +     struct mmu_notifier_range range;
> > +
> > +     if (!lock_page_or_retry(page, vma->vm_mm, vmf->flags))
> > +             return VM_FAULT_RETRY;
> > +     mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma,
> > vma->vm_mm,
> > +                             vmf->address & PAGE_MASK,
> > +                             (vmf->address & PAGE_MASK) + PAGE_SIZE);
> 
>   @MMU_NOTIFY_EXCLUSIVE: to signal a device driver that the device will no
>   longer have exclusive access to the page.
> 
> Shouldn't this be the place to use new MMU_NOTIFY_EXCLUSIVE?

No. We could introduce another type to notify the range is going away due to 
fault but as mentioned in the other thread I didn't think that was necessary 
as the only sensible thing a driver can do is invalidate the entry anyway.

MMU_NOTIFY_EXCLUSIVE is to signal the invalidation is occurring because the 
range is being marked for exclusive access (hopefully the explanation earlier 
makes sense).

> > +     mmu_notifier_invalidate_range_start(&range);
> > +
> > +     vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd, vmf->address,
> > +                             &vmf->ptl);
> > +     if (likely(pte_same(*vmf->pte, vmf->orig_pte)))
> > +             restore_exclusive_pte(vma, page, vmf->address, vmf->pte);
> > +
> > +     pte_unmap_unlock(vmf->pte, vmf->ptl);
> > +     unlock_page(page);
> > +
> > +     mmu_notifier_invalidate_range_end(&range);
> > +     return ret;
> 
> We can drop "ret" and return 0 here directly.

Agreed, was left over from cleaning this function up in the last version.
 
> > +}
> > +
> > 
> >  /*
> >  
> >   * We enter with non-exclusive mmap_lock (to exclude vma changes,
> >   * but allow concurrent faults), and pte mapped but not yet locked.
> > 
> > @@ -3330,6 +3447,9 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> > 
> >               if (is_migration_entry(entry)) {
> >               
> >                       migration_entry_wait(vma->vm_mm, vmf->pmd,
> >                       
> >                                            vmf->address);
> > 
> > +             } else if (is_device_exclusive_entry(entry)) {
> > +                     vmf->page = pfn_swap_entry_to_page(entry);
> > +                     ret = remove_device_exclusive_entry(vmf);
> > 
> >               } else if (is_device_private_entry(entry)) {
> >               
> >                       vmf->page = pfn_swap_entry_to_page(entry);
> >                       ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> > 
> > diff --git a/mm/mprotect.c b/mm/mprotect.c
> > index ee5961888e70..883e2cc85cad 100644
> > --- a/mm/mprotect.c
> > +++ b/mm/mprotect.c
> > @@ -165,6 +165,14 @@ static unsigned long change_pte_range(struct
> > vm_area_struct *vma, pmd_t *pmd,> 
> >                               newpte = swp_entry_to_pte(entry);
> >                               if (pte_swp_uffd_wp(oldpte))
> >                               
> >                                       newpte = pte_swp_mkuffd_wp(newpte);
> > 
> > +                     } else if
> > (is_writable_device_exclusive_entry(entry)) { +                          
> >   entry = make_readable_device_exclusive_entry( +                        
> >                             swp_offset(entry)); +                        
> >     newpte = swp_entry_to_pte(entry);
> > +                             if (pte_swp_soft_dirty(oldpte))
> > +                                     newpte =
> > pte_swp_mksoft_dirty(newpte); +                             if
> > (pte_swp_uffd_wp(oldpte))
> > +                                     newpte = pte_swp_mkuffd_wp(newpte);
> > 
> >                       } else {
> >                       
> >                               newpte = oldpte;
> >                       
> >                       }
> > 
> > diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
> > index a6a7febb4d93..f535bcb4950c 100644
> > --- a/mm/page_vma_mapped.c
> > +++ b/mm/page_vma_mapped.c
> > @@ -41,7 +41,8 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw)
> > 
> >                               /* Handle un-addressable ZONE_DEVICE memory
> >                               */
> >                               entry = pte_to_swp_entry(*pvmw->pte);
> > 
> > -                             if (!is_device_private_entry(entry))
> > +                             if (!is_device_private_entry(entry) &&
> > +                                 !is_device_exclusive_entry(entry))
> > 
> >                                       return false;
> >                       
> >                       } else if (!pte_present(*pvmw->pte))
> >                       
> >                               return false;
> > 
> > @@ -93,7 +94,8 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw)
> > 
> >                       return false;
> >               
> >               entry = pte_to_swp_entry(*pvmw->pte);
> > 
> > -             if (!is_migration_entry(entry))
> > +             if (!is_migration_entry(entry) &&
> > +                 !is_device_exclusive_entry(entry))
> > 
> >                       return false;
> >               
> >               pfn = swp_offset(entry);
> > 
> > @@ -102,7 +104,8 @@ static bool check_pte(struct page_vma_mapped_walk
> > *pvmw)> 
> >               /* Handle un-addressable ZONE_DEVICE memory */
> >               entry = pte_to_swp_entry(*pvmw->pte);
> > 
> > -             if (!is_device_private_entry(entry))
> > +             if (!is_device_private_entry(entry) &&
> > +                 !is_device_exclusive_entry(entry))
> > 
> >                       return false;
> >               
> >               pfn = swp_offset(entry);
> > 
> > diff --git a/mm/rmap.c b/mm/rmap.c
> > index 8ed1853060cf..fe062f63ef4d 100644
> > --- a/mm/rmap.c
> > +++ b/mm/rmap.c
> > @@ -2008,6 +2008,192 @@ void page_mlock(struct page *page)
> > 
> >       rmap_walk(page, &rwc);
> >  
> >  }
> > 
> > +struct make_exclusive_args {
> > +     struct mm_struct *mm;
> > +     unsigned long address;
> > +     void *owner;
> > +     bool valid;
> > +};
> > +
> > +static bool page_make_device_exclusive_one(struct page *page,
> > +             struct vm_area_struct *vma, unsigned long address, void
> > *priv) +{
> > +     struct mm_struct *mm = vma->vm_mm;
> > +     struct page_vma_mapped_walk pvmw = {
> > +             .page = page,
> > +             .vma = vma,
> > +             .address = address,
> > +     };
> > +     struct make_exclusive_args *args = priv;
> > +     pte_t pteval;
> > +     struct page *subpage;
> > +     bool ret = true;
> > +     struct mmu_notifier_range range;
> > +     swp_entry_t entry;
> > +     pte_t swp_pte;
> > +
> > +     mmu_notifier_range_init_owner(&range, MMU_NOTIFY_EXCLUSIVE, 0, vma,
> 
> Similar question here, EXCLUSIVE comment says it gets notified when the
> device does not have exclusive access.
> 
> If you prefer to keep using EXCLUSIVE for both mark/restore, then we need to
> change the comment above MMU_NOTIFY_EXCLUSIVE?

Yeah, sorry for the confusion that comment was stating the somewhat obvious 
(any invalidation notifier means a device no longer has exclusive access) but 
not enough detail about why a driver might treat this specific invalidation 
reason differently.

> > +                                   vma->vm_mm, address, min(vma->vm_end,
> > +                                   address + page_size(page)),
> > args->owner); +     mmu_notifier_invalidate_range_start(&range);
> > +
> > +     while (page_vma_mapped_walk(&pvmw)) {
> > +             /* Unexpected PMD-mapped THP? */
> > +             VM_BUG_ON_PAGE(!pvmw.pte, page);
> > +
> > +             if (!pte_present(*pvmw.pte)) {
> > +                     ret = false;
> > +                     page_vma_mapped_walk_done(&pvmw);
> > +                     break;
> > +             }
> > +
> > +             subpage = page - page_to_pfn(page) + pte_pfn(*pvmw.pte);
> 
> I see that all pages passed in should be done after FOLL_SPLIT_PMD, so is
> this needed?  Or say, should subpage==page always be true?

Not always, in the case of a thp there are small ptes which will get device 
exclusive entries.

> > +             address = pvmw.address;
> > +
> > +             /* Nuke the page table entry. */
> > +             flush_cache_page(vma, address, pte_pfn(*pvmw.pte));
> > +             pteval = ptep_clear_flush(vma, address, pvmw.pte);
> > +
> > +             /* Move the dirty bit to the page. Now the pte is gone. */
> > +             if (pte_dirty(pteval))
> > +                     set_page_dirty(page);
> > +
> > +             if (arch_unmap_one(mm, vma, address, pteval) < 0) {
> > +                     set_pte_at(mm, address, pvmw.pte, pteval);
> > +                     ret = false;
> > +                     page_vma_mapped_walk_done(&pvmw);
> > +                     break;
> > +             }
> 
> Didn't notice this previously, but also suggest to drop this.
> 
> Two reasons:
> 
> 1. It's introduced in ca827d55ebaa ("mm, swap: Add infrastructure for saving
> page metadata on swap", 2018-03-18) for sparc-only use so far.  If we
> really want this, we'll also want to call arch_do_swap_page() when
> restoring the pte just like what we do in do_swap_page(); NOTE: current
> code path of SWP_DEVICE_EXCLUSIVE will skip the arch_do_swap_page() in
> do_swap_page() so it's not even paired with the above arch_unmap_one(), so
> I believe this won't even work for sparc at all.
> 
> 2. I highly doubt whether sparc is also on the list of platforms to support
> for device atomic ops even in the future.  IMHO we'd better not copy-paste
> code clips if never used at all, because once merged, removing it would
> need more justifications.

That seems reasonable, I am not aware of any need to support this on sparc now 
or in the future and we can always add it then. And as you say I had missed 
the need to pair it with arch_do_swap_page() anyway.

> > +
> > +             /*
> > +              * Check that our target page is still mapped at the
> > expected
> > +              * address.
> > +              */
> > +             if (args->mm == mm && args->address == address &&
> > +                 pte_write(pteval))
> > +                     args->valid = true;
> > +
> > +             /*
> > +              * Store the pfn of the page in a special migration
> > +              * pte. do_swap_page() will wait until the migration
> > +              * pte is removed and then restart fault handling.
> > +              */
> > +             if (pte_write(pteval))
> > +                     entry = make_writable_device_exclusive_entry(
> > +                                                    
> > page_to_pfn(subpage)); +             else
> > +                     entry = make_readable_device_exclusive_entry(
> > +                                                    
> > page_to_pfn(subpage)); +             swp_pte = swp_entry_to_pte(entry);
> > +             if (pte_soft_dirty(pteval))
> > +                     swp_pte = pte_swp_mksoft_dirty(swp_pte);
> > +             if (pte_uffd_wp(pteval))
> > +                     swp_pte = pte_swp_mkuffd_wp(swp_pte);
> > +
> > +             /* Take a reference for the swap entry */
> > +             get_page(page);
> > +             set_pte_at(mm, address, pvmw.pte, swp_pte);
> > +
> > +             page_remove_rmap(subpage, PageHuge(page));
> 
> Why PageHuge()?  Should it be a constant "false"?

Yes.

> > +             put_page(page);
> 
> Should we drop this put_page() along with get_page() above?
> 
> page_count() should be >0 anyway as we've got a mapcount before at least
> when dropping the pte.  Then IMHO we can simply keep the old page
> reference.

I had debated doing that when I wrote it but left it there to keep things 
obvious whilst checking the refcounting. However a comment here works just as 
well so have done that.

> > +     }
> > +
> > +     mmu_notifier_invalidate_range_end(&range);
> > +
> > +     return ret;
> > +}
> > +
> > +/**
> > + * page_make_device_exclusive - replace page table mappings with swap
> > entries
> "with swap entries" looks a bit blurred to me (although below longer comment
> explains much better).  How about below (or something similar):
> 
>   page_make_device_exclusive - Mark the page exclusively owned by the device
> 
> ?

Seems good, will do.

> It'll also match with comment above make_device_exclusive_range().
> 
> No strong opinion.
> 
> The rest looks good.  Thanks,

Thanks again for looking.

> > + * @page: the page to replace page table entries for
> > + * @mm: the mm_struct where the page is expected to be mapped
> > + * @address: address where the page is expected to be mapped
> > + * @owner: passed to MMU_NOTIFY_EXCLUSIVE range notifier callbacks
> > + *
> > + * Tries to remove all the page table entries which are mapping this page
> > and + * replace them with special device exclusive swap entries to grant
> > a device + * exclusive access to the page. Caller must hold the page
> > lock.
> > + *
> > + * Returns false if the page is still mapped, or if it could not be
> > unmapped + * from the expected address. Otherwise returns true (success).
> > + */
> > +static bool page_make_device_exclusive(struct page *page, struct
> > mm_struct *mm, +                             unsigned long address, void
> > *owner)
> > +{
> > +     struct make_exclusive_args args = {
> > +             .mm = mm,
> > +             .address = address,
> > +             .owner = owner,
> > +             .valid = false,
> > +     };
> > +     struct rmap_walk_control rwc = {
> > +             .rmap_one = page_make_device_exclusive_one,
> > +             .done = page_not_mapped,
> > +             .anon_lock = page_lock_anon_vma_read,
> > +             .arg = &args,
> > +     };
> > +
> > +     /*
> > +      * Restrict to anonymous pages for now to avoid potential writeback
> > +      * issues.
> > +      */
> > +     if (!PageAnon(page))
> > +             return false;
> > +
> > +     rmap_walk(page, &rwc);
> > +
> > +     return args.valid && !page_mapcount(page);
> > +}
> > +
> > +/**
> > + * make_device_exclusive_range() - Mark a range for exclusive use by a
> > device + * @mm: mm_struct of assoicated target process
> > + * @start: start of the region to mark for exclusive device access
> > + * @end: end address of region
> > + * @pages: returns the pages which were successfully marked for exclusive
> > access + * @owner: passed to MMU_NOTIFY_EXCLUSIVE range notifier to allow
> > filtering + *
> > + * Returns: number of pages found in the range by GUP. A page is marked
> > for + * exclusive access only if the page pointer is non-NULL.
> > + *
> > + * This function finds ptes mapping page(s) to the given address range,
> > locks + * them and replaces mappings with special swap entries preventing
> > userspace CPU + * access. On fault these entries are replaced with the
> > original mapping after + * calling MMU notifiers.
> > + *
> > + * A driver using this to program access from a device must use a mmu
> > notifier + * critical section to hold a device specific lock during
> > programming. Once + * programming is complete it should drop the page
> > lock and reference after + * which point CPU access to the page will
> > revoke the exclusive access. + */
> > +int make_device_exclusive_range(struct mm_struct *mm, unsigned long
> > start,
> > +                             unsigned long end, struct page **pages,
> > +                             void *owner)
> > +{
> > +     unsigned long npages = (end - start) >> PAGE_SHIFT;
> > +     unsigned long i;
> > +
> > +     npages = get_user_pages_remote(mm, start, npages,
> > +                                    FOLL_GET | FOLL_WRITE |
> > FOLL_SPLIT_PMD, +                                    pages, NULL, NULL);
> > +     for (i = 0; i < npages; i++, start += PAGE_SIZE) {
> > +             if (!trylock_page(pages[i])) {
> > +                     put_page(pages[i]);
> > +                     pages[i] = NULL;
> > +                     continue;
> > +             }
> > +
> > +             if (!page_make_device_exclusive(pages[i], mm, start, owner))
> > { +                     unlock_page(pages[i]);
> > +                     put_page(pages[i]);
> > +                     pages[i] = NULL;
> > +             }
> > +     }
> > +
> > +     return npages;
> > +}
> > +EXPORT_SYMBOL_GPL(make_device_exclusive_range);
> > +
> > 
> >  void __put_anon_vma(struct anon_vma *anon_vma)
> >  {
> >  
> >       struct anon_vma *root = anon_vma->root;
> > 
> > --
> > 2.20.1
> 
> --
> Peter Xu




