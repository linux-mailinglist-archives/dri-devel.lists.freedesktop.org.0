Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ABD3A0FC3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 11:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B006E50D;
	Wed,  9 Jun 2021 09:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6946E0C2;
 Wed,  9 Jun 2021 09:38:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GmkXD0UmONtLecZO8lVFg9fI8EfVMpZHuz4xiZSpmVkRjEZGKFERrJOOl5NeyZFGg2nTg2SehjstJDcT2UjslYK9Mf0p/uoWj09VJFIzsVEfWt4bKe+o/BMygewpLGOLdH87Y0ff+nZDKOp83Iu4tl45OcD1jFwua1zOq+cdO4r+pVPbGhYTpr8eq2xSoHMWsj7bAJ47KBnubuSRXIEqYfAgQTCqwt5CYhQRHYWfk6sXfpml6+RGbbubtoG86TjBq83ifZ2duic4Nn7js6jY88zDigxMoTFnmaavP/RdZYqKVOpky9d1CHlzhyHFlDQHn3nKwSeNBMFXsp2IaCfxiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ah9rBXuZ8vhy2eNHey/zXt8m8F9dS0lR/DrKXeBDjZw=;
 b=XhPHwPVA77njkrFgmJcjH/KGL6vJcfhJaq66YVHK3k0gqqfdbEyiqzxZTiKwzIkNSBY6DgTuhQfTnsOwmCPNtjukPm1JbEb1DcB+llEqsdItQldIwqQgva9xVXrP6+vftoIjH9ymKyfmL5065fjZrSMd+LC+PPf5TGJHUD/5Rae4z3q/+YCtvEKmwbMbdI2g76mogPZTFh/gcxW1+g8mgRRzzv/zxefD8LHLx5AjarLbYMyswXv0fGakes1QEvsz90BJMJadd8lWU54LyumwmAT0FGyk+dwJFx/msNPo5bCN9U/zqkV3kytiidJl57WY8g4fbZoAkCHH3GxPSvGrgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ah9rBXuZ8vhy2eNHey/zXt8m8F9dS0lR/DrKXeBDjZw=;
 b=B2PtwsDqigajiufiVWPf2p13fON4jtGSy0pakshR9VLb9yTOhy6noXZJIzfm9UyeecMa65woPO3yN8mzbsrsBUV7EHPyGjE9gtAudF8H7gqjMWBOA5d3IlhM6G4664exFGbrTm5zzdBI8biHMD7ifzo0GcXHw4StF9IBkFpZUu1tpgkDvGqkRp6HphCQGQh9OAIiA18hHKiWerxXP7QaU7eifqnd4elnKPOs8LCclT9qZw8LVsbjA3bhOZjvFA1ds64uglj895Haw1hlC6a70VrmhePI8IVkOPxxqFQ+GMPb6WvOj7ImuFmR3UFJ0IakfND63ISzrGA2xIzzxmXFjw==
Received: from BN9PR03CA0563.namprd03.prod.outlook.com (2603:10b6:408:138::28)
 by BN8PR12MB3091.namprd12.prod.outlook.com (2603:10b6:408:44::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Wed, 9 Jun
 2021 09:38:11 +0000
Received: from BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:138:cafe::c8) by BN9PR03CA0563.outlook.office365.com
 (2603:10b6:408:138::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Wed, 9 Jun 2021 09:38:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT019.mail.protection.outlook.com (10.13.176.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4195.22 via Frontend Transport; Wed, 9 Jun 2021 09:38:11 +0000
Received: from nvdebian.localnet (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 9 Jun
 2021 09:38:07 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v10 07/10] mm: Device exclusive memory access
Date: Wed, 9 Jun 2021 19:38:04 +1000
Message-ID: <270551728.uXnuCZxQlr@nvdebian>
In-Reply-To: <YL+4ENiwbn9QAa2V@t490s>
References: <20210607075855.5084-1-apopple@nvidia.com>
 <20210607075855.5084-8-apopple@nvidia.com> <YL+4ENiwbn9QAa2V@t490s>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0497d0e-e17c-4bf5-7221-08d92b2a4c10
X-MS-TrafficTypeDiagnostic: BN8PR12MB3091:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3091CEDCDF3B760AA7122964DF369@BN8PR12MB3091.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U1aEZKdclc9CWzqSsd6qWBVnCVJIIQkyNeDblfQMfxB9PX6pM8gtUPfIIBhAMiQASr3OzvGM1ns8MjYgGFFU9ajoMywTMjaoEesLHTORtYHjNGB64+oXKpTHzYZWr+0S5+9vJKF3qVJloFcfdj5bO61sBE3Ket6KYsH52ivC79+A+hUfqKfws00PX2Od43wlO8oMb41qjidrmImAj9kBb/bm18XYzsCle9UmYNFdEvY97qjtqrl+X68wMBPixOeKcC8j2KGMdYi6eHqd6XQTs68/TdIinARdCZN9Kui2RsrHYS6bJV/Da/BWBluUvi88iFEfnb974AW+xBSnu9MLXGCjVv++Au9Hr6gt+IufBVDzgex0oUk/Txs2OuMLtHx6+681yiuxF7+wY60wXsf02YLgtqLFSUziXMcWE09h91Qi/dNClP+KuSlc7VoO9SLr4IueniR907kARxWOJiJn1+9xVx7cXCT7uVL7e9VDkysA8aCbQIiwC/7gc1vgFzxTZdNDhQqAoROsWuua8hcjvcVFXYJIlMOXV/5Vw3Mx8z1R4QbTWTSfXTcwafkGyK7myETPBzzxQLP9TQPWzsIlafKDZ+O31xHsoqQO2NWJ5YfJ7HMGcp+Mxj4xaJxRbgfXTl8XljvNgxcXontJOkHXse5q/YldUaSaMj24ZN08yl8F1vPQkrDxj4rHCbeYbNRsOWGn1ojaYsX8JUSxYoeljoc+zIvWhNAzKwGFWVwoi6IobcMT+qigWIHVTBqwL0akZBY5uYkkTS6gm6gn+KB7mQ==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(376002)(136003)(46966006)(36840700001)(7636003)(8936002)(82740400003)(30864003)(8676002)(7416002)(4326008)(36906005)(9576002)(36860700001)(83380400001)(5660300002)(2906002)(336012)(9686003)(426003)(478600001)(966005)(316002)(6666004)(33716001)(47076005)(86362001)(54906003)(70206006)(16526019)(82310400003)(70586007)(356005)(26005)(6916009)(186003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 09:38:11.1892 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0497d0e-e17c-4bf5-7221-08d92b2a4c10
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3091
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
 nouveau@lists.freedesktop.org, hughd@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 shakeelb@google.com, bskeggs@redhat.com, jgg@nvidia.com, jhubbard@nvidia.com,
 akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, 9 June 2021 4:33:52 AM AEST Peter Xu wrote:
> On Mon, Jun 07, 2021 at 05:58:52PM +1000, Alistair Popple wrote:
> 
> [...]
> 
> > +static bool page_make_device_exclusive_one(struct page *page,
> > +             struct vm_area_struct *vma, unsigned long address, void *priv)
> > +{
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
> > +                                   vma->vm_mm, address, min(vma->vm_end,
> > +                                   address + page_size(page)), args->owner);
> > +     mmu_notifier_invalidate_range_start(&range);
> > +
> > +     while (page_vma_mapped_walk(&pvmw)) {
> > +             /* Unexpected PMD-mapped THP? */
> > +             VM_BUG_ON_PAGE(!pvmw.pte, page);
> 
> [1]
> 
> > +
> > +             if (!pte_present(*pvmw.pte)) {
> > +                     ret = false;
> > +                     page_vma_mapped_walk_done(&pvmw);
> > +                     break;
> > +             }
> > +
> > +             subpage = page - page_to_pfn(page) + pte_pfn(*pvmw.pte);
> > +             address = pvmw.address;
> 
> I raised a question here previously and didn't get an answer...
> 
> https://lore.kernel.org/linux-mm/YLDr%2FRyAdUR4q0kk@t490s/

Sorry, I had overlooked that. Will continue the discussion here.

> I think I get your point now and it does look possible that the split page can
> still be mapped somewhere else as thp, then having some subpage maintainance
> looks necessary.  The confusing part is above [1] you've also got that
> VM_BUG_ON_PAGE() assuming it must not be a mapped pmd at all..

Going back I thought your original question was whether subpage != page is
possible. My main point was it's possible if we get a thp head. In that case we
need to replace all pte's with exclusive entries because I haven't (yet)
defined a pmd version of device exclusive entries and also rmap_walk won't deal
with tail pages (see below).

> Then I remembered these code majorly come from the try_to_unmap() so I looked
> there.  I _think_ what's missing here is something like:
> 
>         if (flags & TTU_SPLIT_HUGE_PMD)
>                 split_huge_pmd_address(vma, address, false, page);
> 
> at the entry of page_make_device_exclusive_one()?
>
> That !pte assertion in try_to_unmap() makes sense to me as long as it has split
> the thp page first always.  However seems not the case for FOLL_SPLIT_PMD as
> you previously mentioned.

At present this is limited to PageAnon pages which have had CoW broken, which I
think means there shouldn't be other mappings so I expect the PMD will always
have been split into small PTEs mapping subpages by GUP which is what that
assertion [1] is checking. I could call split_huge_pmd_address() unconditionally
as suggested but see the discussion below.

> Meanwhile, I also started to wonder whether it's even right to call rmap_walk()
> with tail pages...  Please see below.
> 
> > +
> > +             /* Nuke the page table entry. */
> > +             flush_cache_page(vma, address, pte_pfn(*pvmw.pte));
> > +             pteval = ptep_clear_flush(vma, address, pvmw.pte);
> > +
> > +             /* Move the dirty bit to the page. Now the pte is gone. */
> > +             if (pte_dirty(pteval))
> > +                     set_page_dirty(page);
> > +
> > +             /*
> > +              * Check that our target page is still mapped at the expected
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
> > +                                                     page_to_pfn(subpage));
> > +             else
> > +                     entry = make_readable_device_exclusive_entry(
> > +                                                     page_to_pfn(subpage));
> > +             swp_pte = swp_entry_to_pte(entry);
> > +             if (pte_soft_dirty(pteval))
> > +                     swp_pte = pte_swp_mksoft_dirty(swp_pte);
> > +             if (pte_uffd_wp(pteval))
> > +                     swp_pte = pte_swp_mkuffd_wp(swp_pte);
> > +
> > +             set_pte_at(mm, address, pvmw.pte, swp_pte);
> > +
> > +             /*
> > +              * There is a reference on the page for the swap entry which has
> > +              * been removed, so shouldn't take another.
> > +              */
> > +             page_remove_rmap(subpage, false);
> > +     }
> > +
> > +     mmu_notifier_invalidate_range_end(&range);
> > +
> > +     return ret;
> > +}
> > +
> > +/**
> > + * page_make_device_exclusive - mark the page exclusively owned by a device
> > + * @page: the page to replace page table entries for
> > + * @mm: the mm_struct where the page is expected to be mapped
> > + * @address: address where the page is expected to be mapped
> > + * @owner: passed to MMU_NOTIFY_EXCLUSIVE range notifier callbacks
> > + *
> > + * Tries to remove all the page table entries which are mapping this page and
> > + * replace them with special device exclusive swap entries to grant a device
> > + * exclusive access to the page. Caller must hold the page lock.
> > + *
> > + * Returns false if the page is still mapped, or if it could not be unmapped
> > + * from the expected address. Otherwise returns true (success).
> > + */
> > +static bool page_make_device_exclusive(struct page *page, struct mm_struct *mm,
> > +                             unsigned long address, void *owner)
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
> 
> Here we call rmap_walk() on each page we've got.  If it was thp then IIUC it'll
> become the tail pages to walk as the outcome of FOLL_SPLIT_PMD gup (please
> refer to the last reply of mine).  However now I'm uncertain whether we can do
> rmap_walk on tail page at all...  As rmap_walk_anon() has thp_nr_pages() which
> has:
> 
>         VM_BUG_ON_PGFLAGS(PageTail(page), page);

In either case (FOLL_SPLIT_PMD or not) my understanding is GUP will return a
sub/tail page (perhaps I mixed up some terminology in the last thread but I
think we're in agreement here). For thp this means we could end up passing
tail pages to rmap_walk(), however it doesn't actually walk them.

Based on the results of previous testing I had done I assumed rmap_walk()
filtered out tail pages. It does, and I didn't hit the BUG_ON above, but the
filtering was not as deliberate as assumed.

I've gone back and looked at what was happening in my earlier tests and the
tail pages get filtered because the VMA is not getting locked in
page_lock_anon_vma_read() due to failing this check:

	anon_mapping = (unsigned long)READ_ONCE(page->mapping);
	if ((anon_mapping & PAGE_MAPPING_FLAGS) != PAGE_MAPPING_ANON)
		goto out;

And now I'm not sure it makes sense to read page->mapping of a tail page. So
it might be best if we explicitly ignore any tail pages returned from GUP, at
least for now (a future series will improve thp support such as adding a pmd
version for exclusive entries).

> So... for thp mappings, wondering whether we should do normal GUP (without
> SPLIT), pass in always normal or head pages into rmap_walk(), but then
> unconditionally split_huge_pmd_address() in page_make_device_exclusive_one()?

That could work (although I think GUP will still return tail pages - see
follow_trans_huge_pmd() which is called from follow_pmd_mask() in gup). The
main problem is split_huge_pmd_address() unconditionally calls a mmu notifier
so I would need to plumb in passing an owner everywhere which could get messy.

I suppose instead we could make that conditional on pmd_trans_huge(*pmd) but
that's just replicating what GUP already does for us. When I try adding support
for file mappings I will probably have to change this, but I am hoping to leave
that for a future series once the basic concept is there for anonymous mappings.

> Please correct me if I made silly mistakes on above, as I am looking at the
> code when/during trying to review the patch, so it's possible I missed
> something again.  Neither does this code a huge matter since it's not in
> general mm path, but still raise this question up.

You're correct that this bit isn't in the general mm path so perhaps doesn't
matter as much, but I still want to get it right so appreciate you taking the
time to comment! Thanks.

> Thanks,
> 
> > +
> > +     return args.valid && !page_mapcount(page);
> > +}
> > +
> > +/**
> > + * make_device_exclusive_range() - Mark a range for exclusive use by a device
> > + * @mm: mm_struct of assoicated target process
> > + * @start: start of the region to mark for exclusive device access
> > + * @end: end address of region
> > + * @pages: returns the pages which were successfully marked for exclusive access
> > + * @owner: passed to MMU_NOTIFY_EXCLUSIVE range notifier to allow filtering
> > + *
> > + * Returns: number of pages found in the range by GUP. A page is marked for
> > + * exclusive access only if the page pointer is non-NULL.
> > + *
> > + * This function finds ptes mapping page(s) to the given address range, locks
> > + * them and replaces mappings with special swap entries preventing userspace CPU
> > + * access. On fault these entries are replaced with the original mapping after
> > + * calling MMU notifiers.
> > + *
> > + * A driver using this to program access from a device must use a mmu notifier
> > + * critical section to hold a device specific lock during programming. Once
> > + * programming is complete it should drop the page lock and reference after
> > + * which point CPU access to the page will revoke the exclusive access.
> > + */
> > +int make_device_exclusive_range(struct mm_struct *mm, unsigned long start,
> > +                             unsigned long end, struct page **pages,
> > +                             void *owner)
> > +{
> > +     long npages = (end - start) >> PAGE_SHIFT;
> > +     unsigned long i;
> > +
> > +     npages = get_user_pages_remote(mm, start, npages,
> > +                                    FOLL_GET | FOLL_WRITE | FOLL_SPLIT_PMD,
> > +                                    pages, NULL, NULL);
> > +     for (i = 0; i < npages; i++, start += PAGE_SIZE) {
> > +             if (!trylock_page(pages[i])) {
> > +                     put_page(pages[i]);
> > +                     pages[i] = NULL;
> > +                     continue;
> > +             }
> > +
> > +             if (!page_make_device_exclusive(pages[i], mm, start, owner)) {
> > +                     unlock_page(pages[i]);
> > +                     put_page(pages[i]);
> > +                     pages[i] = NULL;
> > +             }
> > +     }
> > +
> > +     return npages;
> > +}
> > +EXPORT_SYMBOL_GPL(make_device_exclusive_range);
> > +#endif
> > +
> >  void __put_anon_vma(struct anon_vma *anon_vma)
> >  {
> >       struct anon_vma *root = anon_vma->root;
> > --
> > 2.20.1
> >
> 
> --
> Peter Xu
> 




