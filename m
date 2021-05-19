Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC25E388E39
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 14:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A366E1BC;
	Wed, 19 May 2021 12:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 419456E1BC;
 Wed, 19 May 2021 12:38:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXy6pKLnMDGi0QHmUB6rlolb/oC+eueCU5Isgt0w/fF9FLmlZyTJQb0y+Tt5WRwtViUITJnoYpEDfal1XAVhAvOwsNr6tLgBXWOPmM1O3BYkda6Ap6NLDRObVKpTar87oGcG/ka0AzLUTl6pLIjzc2i3A0g4B0lu6kXmzFiWmVLqulxMNmq5jXkjS/JFEYc+1mHKmqwSDEn2muoy2t86L4VvG1ixh9a9U6k86fkMpDypwlBTgrRJlBBnZzOlAPdFr5vnmTsJlIzz8ksJdOzgzzK1M989hHw0BLYM8knGa1D9sL51J80Px3A5MovDRApw+Lz1JsLyj1Iafkrd9fhQSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6YBP8FS9iFUhThH8sr7jQkDdg9Q7krpNI8Cosde7ZI=;
 b=WsKx3l9wVn7nzny2QIJfAHWl0/wzhHzWLdt/gYfYq4fw+YVuDMh3tVc2mucQJO8/D0eWRAt5hyc5JfnbXasO3IYgJ2AEew0yJhl+5sA879uuqHxRbzDMRxX8IByZnCMThZezl5CXQn8ovlINQ9UVwthVGHj3JEueSYcLsHro2AMtK5Ln4J5PttY7F2CSMZA64cY/aVW6rO4rn1NpLXiV0HhltZ29MTE2znWCE9v3sj6kmCBdG7kVYCyn+L3BBxnAz3gZ4ya/oGvitjPpjT5EdwRoV9yGbjdUU0V/ba0hba+KWwj4bDf2dp9aKeOx9hVkBrzj0Bp42IyDjv430OAusQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6YBP8FS9iFUhThH8sr7jQkDdg9Q7krpNI8Cosde7ZI=;
 b=e/EX9+29RKhFQevaN2IRUgwQX0MHZGpwCUNngzMZC94J57lp7x4gslHVMuIZHjqCgd9crl+2SH/MHR74xKTm6+mhCg0JFMfTI5WL4LtEkHJxcCUwjTPRoZCNFm8bslK4L9J2dmiFqPouI6u2zlEexjokK+0BB5DjgfPl9TL4PkSmSkPF2FXRGyqKg1CN1j0GuGXcR/8p6/ZLQem0k4LeNdoazEZ70++PMYANcJjzJ0YL6qcfUHMOAUK8F4iy0vorf7gEzLhhj0JLT7xW5/ihQyp/+bzn2FksMGxnU4AY7KN7VhxWZiJSRCsD7cLbtuQVnE6O4J7BUIiOpr0NDcekiw==
Received: from DM5PR21CA0018.namprd21.prod.outlook.com (2603:10b6:3:ac::28) by
 MWHPR12MB1597.namprd12.prod.outlook.com (2603:10b6:301:e::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.28; Wed, 19 May 2021 12:38:40 +0000
Received: from DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ac:cafe::7b) by DM5PR21CA0018.outlook.office365.com
 (2603:10b6:3:ac::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.2 via Frontend
 Transport; Wed, 19 May 2021 12:38:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT009.mail.protection.outlook.com (10.13.173.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 12:38:40 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 19 May
 2021 12:38:36 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Liam Howlett <liam.howlett@oracle.com>, Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH v8 3/8] mm/rmap: Split try_to_munlock from try_to_unmap
Date: Wed, 19 May 2021 22:38:33 +1000
Message-ID: <73709397.vfl0GBLx1q@nvdebian>
In-Reply-To: <20210518191451.fcjw6tlgow33gxbq@revolver>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <20210407084238.20443-4-apopple@nvidia.com>
 <20210518191451.fcjw6tlgow33gxbq@revolver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e88a539-d699-4d3d-f011-08d91ac307e4
X-MS-TrafficTypeDiagnostic: MWHPR12MB1597:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1597A4CDDC72D2CCB54CF190DF2B9@MWHPR12MB1597.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /CsVi+J4BnkUbUfEzAznVc+FAo/Y7ttViQFN8cRP8APAfFxGHaGVo4gSa/k7Jt3nW/3xylRJ+SV1UesG4vMaRdKB9Pq6hpQHMFFhV6a+kTSGTpn/zFlObSvBfZlyfV+dfUMP8hjLBLkQy7rroH0nZdyCZc3VlVv9+oQ2XAhy0DD3e22YVZrRhdTZGlkq/qWveDSLQhyCqDW4orz2TPRZl8WLlMZxyd6Tw9e+hEHZ0ZMet07R1oDBIWXCpKZN55ihwgKijsqIWIXYyQbYHTGlrHsD0WVWpjY4r9Bg+1DHKSX8y7L8Ezpkvk7VygWUTaipeT/peY62VoQrekPINsdByegaGffyK1aIGzINYSE6flsCdKiBIHz3Y5hMknTEx0H+tL+HpNKzIOLdV2yJNWpt3GB8OcRK9E6rzcOIMKrdjnw7yh2G3hM9vW7AQw4fUhfo13PW2pWlzfeV2b4+npUkqgyOIg6Hs1IEnvX/2AkJcvqVSZBGQOJHky/xsau9j4u2lCYihLWsqnV1I0HJAhP77DHyHqG0geYR0MU4kWFiNGqrMgMI4t3jwhT2FOikFcpJM9bx7XO5Jbv+Uhm1AmMe5BS7wugv8H3t0COzGInjJuEXt79vuWZn4nfJFxBrkmXgToBavUObswooMPgNEj+vIV6XKy/xYM25/oOiNezTWJsI86WTfDDOWL4N9f4P89UoRGnE9HjxM3R1DqvIfhoXjjpO+aMoxY94PdgpfpVg6KverQbZYOFdNXbf4/m8XP0yXwvjS2k+V7JprBuOUo2bow==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(46966006)(36840700001)(83380400001)(36906005)(82310400003)(82740400003)(316002)(8936002)(70206006)(9686003)(70586007)(54906003)(2906002)(426003)(336012)(4326008)(5660300002)(9576002)(356005)(7636003)(86362001)(36860700001)(110136005)(6666004)(478600001)(7416002)(33716001)(966005)(26005)(16526019)(30864003)(186003)(8676002)(47076005)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 12:38:40.1555 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e88a539-d699-4d3d-f011-08d91ac307e4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1597
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
Cc: "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "willy@infradead.org" <willy@infradead.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "bsingharora@gmail.com" <bsingharora@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "hch@infradead.org" <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>, Shakeel Butt <shakeelb@google.com>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "jhubbard@nvidia.com" <jhubbard@nvidia.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, 19 May 2021 6:04:51 AM AEST Liam Howlett wrote:
> External email: Use caution opening links or attachments
> 
> * Alistair Popple <apopple@nvidia.com> [210407 04:43]:
> > The behaviour of try_to_unmap_one() is difficult to follow because it
> > performs different operations based on a fairly large set of flags used
> > in different combinations.
> > 
> > TTU_MUNLOCK is one such flag. However it is exclusively used by
> > try_to_munlock() which specifies no other flags. Therefore rather than
> > overload try_to_unmap_one() with unrelated behaviour split this out into
> > it's own function and remove the flag.
> > 
> > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> > Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > 
> > ---
> > 
> > v8:
> > * Renamed try_to_munlock to page_mlock to better reflect what the
> > 
> >   function actually does.
> > 
> > * Removed the TODO from the documentation that this patch addresses.
> > 
> > v7:
> > * Added Christoph's Reviewed-by
> > 
> > v4:
> > * Removed redundant check for VM_LOCKED
> > ---
> > 
> >  Documentation/vm/unevictable-lru.rst | 33 ++++++++-----------
> >  include/linux/rmap.h                 |  3 +-
> >  mm/mlock.c                           | 10 +++---
> >  mm/rmap.c                            | 48 +++++++++++++++++++++-------
> >  4 files changed, 55 insertions(+), 39 deletions(-)
> > 
> > diff --git a/Documentation/vm/unevictable-lru.rst
> > b/Documentation/vm/unevictable-lru.rst index 0e1490524f53..eae3af17f2d9
> > 100644
> > --- a/Documentation/vm/unevictable-lru.rst
> > +++ b/Documentation/vm/unevictable-lru.rst
> > @@ -389,14 +389,14 @@ mlocked, munlock_vma_page() updates that zone
> > statistics for the number of> 
> >  mlocked pages.  Note, however, that at this point we haven't checked
> >  whether the page is mapped by other VM_LOCKED VMAs.
> > 
> > -We can't call try_to_munlock(), the function that walks the reverse map
> > to
> > +We can't call page_mlock(), the function that walks the reverse map to
> > 
> >  check for other VM_LOCKED VMAs, without first isolating the page from the
> >  LRU.> 
> > -try_to_munlock() is a variant of try_to_unmap() and thus requires that
> > the page +page_mlock() is a variant of try_to_unmap() and thus requires
> > that the page> 
> >  not be on an LRU list [more on these below].  However, the call to
> > 
> > -isolate_lru_page() could fail, in which case we couldn't
> > try_to_munlock().  So, +isolate_lru_page() could fail, in which case we
> > can't call page_mlock().  So,> 
> >  we go ahead and clear PG_mlocked up front, as this might be the only
> >  chance we> 
> > -have.  If we can successfully isolate the page, we go ahead and
> > -try_to_munlock(), which will restore the PG_mlocked flag and update the
> > zone +have.  If we can successfully isolate the page, we go ahead and
> > call +page_mlock(), which will restore the PG_mlocked flag and update the
> > zone> 
> >  page statistics if it finds another VMA holding the page mlocked.  If we
> >  fail to isolate the page, we'll have left a potentially mlocked page on
> >  the LRU. This is fine, because we'll catch it later if and if vmscan
> >  tries to reclaim> 
> > @@ -545,31 +545,24 @@ munlock or munmap system calls, mm teardown
> > (munlock_vma_pages_all), reclaim,> 
> >  holepunching, and truncation of file pages and their anonymous COWed
> >  pages.
> > 
> > -try_to_munlock() Reverse Map Scan
> > +page_mlock() Reverse Map Scan
> > 
> >  ---------------------------------
> > 
> > -.. warning::
> > -   [!] TODO/FIXME: a better name might be page_mlocked() - analogous to
> > the -   page_referenced() reverse map walker.
> > -
> > 
> >  When munlock_vma_page() [see section :ref:`munlock()/munlockall() System
> >  Call Handling <munlock_munlockall_handling>` above] tries to munlock a
> >  page, it needs to determine whether or not the page is mapped by any
> >  VM_LOCKED VMA without actually attempting to unmap all PTEs from the
> >  page.  For this purpose, the unevictable/mlock infrastructure
> > 
> > -introduced a variant of try_to_unmap() called try_to_munlock().
> > +introduced a variant of try_to_unmap() called page_mlock().
> > 
> > -try_to_munlock() calls the same functions as try_to_unmap() for anonymous
> > and -mapped file and KSM pages with a flag argument specifying unlock
> > versus unmap -processing.  Again, these functions walk the respective
> > reverse maps looking -for VM_LOCKED VMAs.  When such a VMA is found, as
> > in the try_to_unmap() case, -the functions mlock the page via
> > mlock_vma_page() and return SWAP_MLOCK.  This -undoes the pre-clearing of
> > the page's PG_mlocked done by munlock_vma_page. +page_mlock() walks the
> > respective reverse maps looking for VM_LOCKED VMAs. When +such a VMA is
> > found the page is mlocked via mlock_vma_page(). This undoes the
> > +pre-clearing of the page's PG_mlocked done by munlock_vma_page.
> > 
> > -Note that try_to_munlock()'s reverse map walk must visit every VMA in a
> > page's +Note that page_mlock()'s reverse map walk must visit every VMA in
> > a page's> 
> >  reverse map to determine that a page is NOT mapped into any VM_LOCKED
> >  VMA.
> >  However, the scan can terminate when it encounters a VM_LOCKED VMA.
> > 
> > -Although try_to_munlock() might be called a great many times when
> > munlocking a +Although page_mlock() might be called a great many times
> > when munlocking a> 
> >  large region or tearing down a large address space that has been mlocked
> >  via mlockall(), overall this is a fairly rare event.
> > 
> > @@ -602,7 +595,7 @@ inactive lists to the appropriate node's unevictable
> > list.> 
> >  shrink_inactive_list() should only see SHM_LOCK'd pages that became
> >  SHM_LOCK'd after shrink_active_list() had moved them to the inactive
> >  list, or pages mapped into VM_LOCKED VMAs that munlock_vma_page()
> >  couldn't isolate from the LRU to> 
> > -recheck via try_to_munlock().  shrink_inactive_list() won't notice the
> > latter, +recheck via page_mlock().  shrink_inactive_list() won't notice
> > the latter,> 
> >  but will pass on to shrink_page_list().
> >  
> >  shrink_page_list() again culls obviously unevictable pages that it could
> > 
> > diff --git a/include/linux/rmap.h b/include/linux/rmap.h
> > index def5c62c93b3..38a746787c2f 100644
> > --- a/include/linux/rmap.h
> > +++ b/include/linux/rmap.h
> > @@ -87,7 +87,6 @@ struct anon_vma_chain {
> > 
> >  enum ttu_flags {
> >  
> >       TTU_MIGRATION           = 0x1,  /* migration mode */
> > 
> > -     TTU_MUNLOCK             = 0x2,  /* munlock mode */
> > 
> >       TTU_SPLIT_HUGE_PMD      = 0x4,  /* split huge PMD if any */
> >       TTU_IGNORE_MLOCK        = 0x8,  /* ignore mlock */
> > 
> > @@ -239,7 +238,7 @@ int page_mkclean(struct page *);
> > 
> >   * called in munlock()/munmap() path to check for other vmas holding
> >   * the page mlocked.
> >   */
> > 
> > -void try_to_munlock(struct page *);
> > +void page_mlock(struct page *page);
> > 
> >  void remove_migration_ptes(struct page *old, struct page *new, bool
> >  locked);> 
> > diff --git a/mm/mlock.c b/mm/mlock.c
> > index f8f8cc32d03d..9b8b82cfbbff 100644
> > --- a/mm/mlock.c
> > +++ b/mm/mlock.c
> > @@ -108,7 +108,7 @@ void mlock_vma_page(struct page *page)
> > 
> >  /*
> >  
> >   * Finish munlock after successful page isolation
> >   *
> > 
> > - * Page must be locked. This is a wrapper for try_to_munlock()
> > + * Page must be locked. This is a wrapper for page_mlock()
> > 
> >   * and putback_lru_page() with munlock accounting.
> >   */
> >  
> >  static void __munlock_isolated_page(struct page *page)
> > 
> > @@ -118,7 +118,7 @@ static void __munlock_isolated_page(struct page *page)
> > 
> >        * and we don't need to check all the other vmas.
> >        */
> >       
> >       if (page_mapcount(page) > 1)
> > 
> > -             try_to_munlock(page);
> > +             page_mlock(page);
> > 
> >       /* Did try_to_unlock() succeed or punt? */
> >       if (!PageMlocked(page))
> > 
> > @@ -158,7 +158,7 @@ static void __munlock_isolation_failed(struct page
> > *page)> 
> >   * munlock()ed or munmap()ed, we want to check whether other vmas hold
> >   the
> >   * page locked so that we can leave it on the unevictable lru list and
> >   not
> >   * bother vmscan with it.  However, to walk the page's rmap list in
> > 
> > - * try_to_munlock() we must isolate the page from the LRU.  If some other
> > + * page_mlock() we must isolate the page from the LRU.  If some other
> > 
> >   * task has removed the page from the LRU, we won't be able to do that.
> >   * So we clear the PageMlocked as we might not get another chance.  If we
> >   * can't isolate the page, we leave it for putback_lru_page() and vmscan
> > 
> > @@ -168,7 +168,7 @@ unsigned int munlock_vma_page(struct page *page)
> > 
> >  {
> >  
> >       int nr_pages;
> > 
> > -     /* For try_to_munlock() and to serialize with page migration */
> > +     /* For page_mlock() and to serialize with page migration */
> > 
> >       BUG_ON(!PageLocked(page));
> >       VM_BUG_ON_PAGE(PageTail(page), page);
> > 
> > @@ -205,7 +205,7 @@ static int __mlock_posix_error_return(long retval)
> > 
> >   *
> >   * The fast path is available only for evictable pages with single
> >   mapping.
> >   * Then we can bypass the per-cpu pvec and get better performance.
> > 
> > - * when mapcount > 1 we need try_to_munlock() which can fail.
> > + * when mapcount > 1 we need page_mlock() which can fail.
> > 
> >   * when !page_evictable(), we need the full redo logic of
> >   putback_lru_page to * avoid leaving evictable page in unevictable list.
> >   *
> > 
> > diff --git a/mm/rmap.c b/mm/rmap.c
> > index 977e70803ed8..f09d522725b9 100644
> > --- a/mm/rmap.c
> > +++ b/mm/rmap.c
> > @@ -1405,10 +1405,6 @@ static bool try_to_unmap_one(struct page *page,
> > struct vm_area_struct *vma,> 
> >       struct mmu_notifier_range range;
> >       enum ttu_flags flags = (enum ttu_flags)(long)arg;
> > 
> > -     /* munlock has nothing to gain from examining un-locked vmas */
> > -     if ((flags & TTU_MUNLOCK) && !(vma->vm_flags & VM_LOCKED))
> > -             return true;
> > -
> > 
> >       if (IS_ENABLED(CONFIG_MIGRATION) && (flags & TTU_MIGRATION) &&
> >       
> >           is_zone_device_page(page) && !is_device_private_page(page))
> >           
> >               return true;
> > 
> > @@ -1469,8 +1465,6 @@ static bool try_to_unmap_one(struct page *page,
> > struct vm_area_struct *vma,> 
> >                               page_vma_mapped_walk_done(&pvmw);
> >                               break;
> >                       
> >                       }
> > 
> > -                     if (flags & TTU_MUNLOCK)
> > -                             continue;
> > 
> >               }
> >               
> >               /* Unexpected PMD-mapped THP? */
> > 
> > @@ -1784,8 +1778,39 @@ bool try_to_unmap(struct page *page, enum ttu_flags
> > flags)> 
> >       return !page_mapcount(page) ? true : false;
> >  
> >  }
> 
> Please add a comment here, especially around locking.
> 
> > +static bool page_mlock_one(struct page *page, struct vm_area_struct *vma,
> > +                              unsigned long address, void *arg)
> > +{
> > +     struct page_vma_mapped_walk pvmw = {
> > +             .page = page,
> > +             .vma = vma,
> > +             .address = address,
> > +     };
> > +
> > +     /* munlock has nothing to gain from examining un-locked vmas */
> > +     if (!(vma->vm_flags & VM_LOCKED))
> > +             return true;
> 
> The logic here doesn't make sense.  You called page_mlock_one() on a VMA
> that isn't locked and it returns true?  Is this a check to see if the
> VMA has zero mlock'ed pages?

I'm pretty sure the logic is correct. This is used for an rmap_walk, so we 
return true to continue the page table scan to see if other VMAs have the page 
locked.

> > +
> > +     while (page_vma_mapped_walk(&pvmw)) {
> > +             /* PTE-mapped THP are never mlocked */
> > +             if (!PageTransCompound(page)) {
> > +                     /*
> > +                      * Holding pte lock, we do *not* need
> > +                      * mmap_lock here
> > +                      */
> 
> Are you sure?  I think you at least need to hold the mmap lock for
> reading to ensure there's no race here?  mlock_vma_page() eludes to such
> a scenario when lazy mlocking.

Not really. I don't claim to be an mlock expert but as this is a clean-up for 
try_to_unmap() the intent was to not change existing behaviour.

However presenting the function in this simplified form did raise this and 
some other questions during previous reviews - see https://lore.kernel.org/
dri-devel/20210331115746.GA1463678@nvidia.com/ for the previous discussion.

To answer the questions around locking though I did do some git sha1 mining. 
The best explanation seemed to be contained in https://git.kernel.org/pub/scm/
linux/kernel/git/torvalds/linux.git/commit/?
id=b87537d9e2feb30f6a962f27eb32768682698d3b from Hugh (whom I've added again 
here in case he can help answer some of these).

> The mmap_lock is held for writing in the scenarios I have checked.
> 
> > +                     mlock_vma_page(page);
> > +             }
> > +             page_vma_mapped_walk_done(&pvmw);
> > +
> > +             /* found a mlocked page, no point continuing munlock check
> > */
> 
> I think you need to check_pte() to be sure it is mapped?
> 
> > +             return false;
> > +     }
> > +
> > +     return true;
> 
> Again, I don't get the return values.  If page_mlock_one() returns true,
> I'd expect for my page to now be locked.  This isn't the case here,
> page_mlock_one() returns true if there are no pages present for a locked
> VMA, correct?

This is used for an rmap walk, if we were able to mlock the page we return 
false to stop the walk as there is no need to examine other VMAs if the page 
has already been mlocked.

> > +}
> > +
> > 
> >  /**
> > 
> > - * try_to_munlock - try to munlock a page
> > + * page_mlock - try to munlock a page
> 
> Is this an mlock or an munlock?  I'm not confident it's either, but more
> of a check to see if there are pages mapped in a locked VMA?

It is called (only) from the munlock code to check a page does not need to be 
mlocked, or to mlock it if it does.

> >   * @page: the page to be munlocked
> >   *
> >   * Called from munlock code.  Checks all of the VMAs mapping the page
> > 
> > @@ -1793,11 +1818,10 @@ bool try_to_unmap(struct page *page, enum
> > ttu_flags flags)> 
> >   * returned with PG_mlocked cleared if no other vmas have it mlocked.
> >   */
> > 
> > -void try_to_munlock(struct page *page)
> > +void page_mlock(struct page *page)
> > 
> >  {
> >  
> >       struct rmap_walk_control rwc = {
> > 
> > -             .rmap_one = try_to_unmap_one,
> > -             .arg = (void *)TTU_MUNLOCK,
> > +             .rmap_one = page_mlock_one,
> > 
> >               .done = page_not_mapped,
> >               .anon_lock = page_lock_anon_vma_read,
> > 
> > @@ -1849,7 +1873,7 @@ static struct anon_vma *rmap_walk_anon_lock(struct
> > page *page,> 
> >   * Find all the mappings of a page using the mapping pointer and the vma
> >   chains * contained in the anon_vma struct it points to.
> >   *
> > 
> > - * When called from try_to_munlock(), the mmap_lock of the mm containing
> > the vma + * When called from page_mlock(), the mmap_lock of the mm
> > containing the vma> 
> >   * where the page was found will be held for write.  So, we won't recheck
> >   * vm_flags for that VMA.  That should be OK, because that vma shouldn't
> >   be
> >   * LOCKED.
> > 
> > @@ -1901,7 +1925,7 @@ static void rmap_walk_anon(struct page *page, struct
> > rmap_walk_control *rwc,> 
> >   * Find all the mappings of a page using the mapping pointer and the vma
> >   chains * contained in the address_space struct it points to.
> >   *
> > 
> > - * When called from try_to_munlock(), the mmap_lock of the mm containing
> > the vma + * When called from page_mlock(), the mmap_lock of the mm
> > containing the vma> 
> >   * where the page was found will be held for write.  So, we won't recheck
> 
> Above it is stated that the lock does not need to be held, but this
> comment says it is already held for writing - which is it?

I will have to check.

> >   * vm_flags for that VMA.  That should be OK, because that vma shouldn't
> >   be
> >   * LOCKED.
> > 
> > --
> > 2.20.1
> 
> munlock_vma_pages_range() comments references try_to_{munlock|unmap}

Thanks, I noticed that too when I was rereading it just now. Will fix that up.

 - Alistair



