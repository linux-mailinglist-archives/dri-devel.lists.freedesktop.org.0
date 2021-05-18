Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE74F3879BA
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 15:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD6D89CD3;
	Tue, 18 May 2021 13:19:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2054.outbound.protection.outlook.com [40.107.96.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF7489CD3;
 Tue, 18 May 2021 13:19:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kuylz0z3Djn3IYElTHTitNn073/Xs0m2nKmquWP55PMVNteQhmp5O5Uy3pczFz5kL8S+uN6/LXTivNXfDDQPsA/MHr89johyNaSWtSH4vX/lrE2tVuBWItogYJdPj+p3SZsRjuvbZj0bnEJQFaUidCobNV3gQBVXZigGsiASxQUdG9Gq+rWbKmFW3TOu1cktwVY90btOxtLmKYQeUPgBYYZnyHzOrfz+tdCIV9k5tbUj1fpq1GSQqabZGAieuERzC2rXrqdd/szOisRuMx681pT9dKab3+ZM7hIraSzt/HBIEdTaiYdc2MZhyXKh9Dck6r40C4+YJXA+6tKwvzQjSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOlODZMtVTDJHTOpg7IpU4u8extQUAgfGqcE/tm543g=;
 b=STeKFdzZu3GWwcfR0gdAVgZCJDVYpHCUEaSgkC04bjnZZpnHigigt0uY7cKso70aERGdMWSLtieE+8jd+SgmusfLR28pP+F/lL9hFgUg2Tdd4KFMYME9w8j/ypUPFRoqyqjofhtANo/dlz4D3X/TaiZxp0kkxkViN+OA6yfA+0k+YOcjT506vy0Fkgy3dSajZ/hL11ewL3tCMjT6an9X6sm3vYH2qm2pYh4iHsYvFjo949MkWrSzsc97ZnN2IRMwVzbQVObS6MBZ/FJqA7pZgKbJdyL/5UFDDYx2NnXq81BbOyJowSU1rJ5V+RirEWwBwwmRA4fSpEEXf2CsOmQirA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOlODZMtVTDJHTOpg7IpU4u8extQUAgfGqcE/tm543g=;
 b=XjFWYcxWc0kW88cjiWcapCSIBe9PCFnQvPFbXq8Mhqq3du6vvX67LrgwROmwudjk4Vt1vl0lk0hdyGSnBsh8nrRGWrMerFtTUkU/QCiATKxF1qFbAlDy1+xi23hY2aybEnN4yqheUtP4os1ZbFRGCTWGZczsGOD0issaaKm74MRmh9usDGmd+12INGAAqx2osocc1WnWBdUzKJ8kf86Q2ffxj+rz3D+Ppnts/BT5xGDTgYmEsehMOasyFrhZXLZQO3bZdTMjqBJQpYmMk4okMIK7dNPuoPTS60+2aX1waMSYLF1t7D5R5VZMa8yyO2EKycUnPEkAEUY19VymguoZfg==
Received: from DM5PR16CA0016.namprd16.prod.outlook.com (2603:10b6:3:c0::26) by
 MWHPR1201MB2494.namprd12.prod.outlook.com (2603:10b6:300:de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 13:19:12 +0000
Received: from DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:c0:cafe::2) by DM5PR16CA0016.outlook.office365.com
 (2603:10b6:3:c0::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 18 May 2021 13:19:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT003.mail.protection.outlook.com (10.13.173.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 13:19:11 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 18 May
 2021 13:19:07 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v8 5/8] mm: Device exclusive memory access
Date: Tue, 18 May 2021 23:19:05 +1000
Message-ID: <47694715.suB6H4Uo8R@nvdebian>
In-Reply-To: <YKMhorngO2DVrxac@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <20210407084238.20443-6-apopple@nvidia.com> <YKMhorngO2DVrxac@t490s>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f9a07bd-827a-45c1-2538-08d919ff86be
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2494:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB2494ACB86129C3014112326ADF2C9@MWHPR1201MB2494.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1R8G2CNdCTxKPjesvyT8XTtDnAXZBEZ8/3q+/sO5U4CbEhYQtpLHtq0Salt71dNQ7SoS6C+FI0FnxZ5kCHhEnN5D5nrFx5KcXK6p7Nhy/R5/tXTU9kJQsj4024FkcDHXS2EdXk2xF4e+6KhI6uApTN61wAamjCsO0/oQDBvOuEuhZAAx/IZe5G+VN/xcuIxqfu+j1zyN0A2PXKDmn1hHZKycVBYAo15EciffmBbcgfJ/4Araml86jXH4Iw9HrftC59VOGBPDJmE9ggtVODhXq1u7nVk9mZjsFd16+eBh/455W+OSk/eOLwDiuGLcIaVqYHQQHJDrYkKUCpefXV3INH4HILED5LJMUByECe6cgfyxsQ6lLtOIpzQwu19AoK8jh9qR7VRyvWImb5lyatngvz2Xv3S5JW7ZKV1sg4Ix1Y/69k9goH2UDzaFlmICxh09WJYa/+9FwP3xLz8nKNEfcIQCg3V9tYCKymMKVLa8f3HEO6b1u67eO+CZ6lcx/24suG6xdyisXMhV6whuMRaCwie1+1OwjeWzTENsICUi49/eEjWMVB/RVIVUfk1uGBsu4+Ejrnx8z6wWmg1XRt1QEmxFmxBcU07dCP2ZkAzjWlEK9WnIoMcSwwVcXZ4yFUF7DE/6HZs1caRAwMjLy8xtX+J4QSV7fzOQqZ+5B4SF4IWr4ye9kgLCC9Qr6CaPli2pYpSV3xnAR+caOP7FF22HuQ==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(36840700001)(46966006)(186003)(426003)(356005)(16526019)(316002)(7416002)(26005)(7636003)(36906005)(54906003)(83380400001)(82740400003)(336012)(47076005)(33716001)(2906002)(30864003)(4326008)(36860700001)(9686003)(86362001)(8936002)(82310400003)(5660300002)(9576002)(478600001)(6916009)(8676002)(70586007)(70206006)(39026012)(33290500001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 13:19:11.6579 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f9a07bd-827a-45c1-2538-08d919ff86be
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2494
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
 nouveau@lists.freedesktop.org, bsingharora@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 jgg@nvidia.com, jhubbard@nvidia.com, akpm@linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, 18 May 2021 12:08:34 PM AEST Peter Xu wrote:
> > v6:
> > * Fixed a bisectablity issue due to incorrectly applying the rename of
> > 
> >   migrate_pgmap_owner to the wrong patches for Nouveau and hmm_test.
> > 
> > v5:
> > * Renamed range->migrate_pgmap_owner to range->owner.
> 
> May be nicer to mention this rename in commit message (or make it a separate
> patch)?

Ok, I think if it needs to be explicitly called out in the commit message it 
should be a separate patch. Originally I thought the change was _just_ small 
enough to include here, but this patch has since grown so I'll split it out.
 
<snip>

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
> > index 516104b9334b..7a3c260146df 100644
> > --- a/include/linux/swap.h
> > +++ b/include/linux/swap.h
> > @@ -63,9 +63,11 @@ static inline int current_is_kswapd(void)
> > 
> >   * to a special SWP_DEVICE_* entry.
> >   */
> 
> Should we add another short description for the newly added two types?
> Otherwise the reader could get confused assuming the above comment is
> explaining all four types, while it is for SWP_DEVICE_{READ|WRITE} only?

Good idea, I can see how that could be confusing. Will add a short 
description.

<snip>

> > diff --git a/mm/memory.c b/mm/memory.c
> > index 3a5705cfc891..556ff396f2e9 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -700,6 +700,84 @@ struct page *vm_normal_page_pmd(struct vm_area_struct
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
> > +             page_add_file_rmap(page, false);
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
> > without + * sleeping. Returns 0 on success or -EBUSY if the page could
> > not be locked or + * the entry no longer points at locked_page in which
> > case locked_page should be + * locked before retrying the call.
> > + */
> > +static unsigned long
> > +try_restore_exclusive_pte(struct mm_struct *src_mm, pte_t *src_pte,
> > +                       struct vm_area_struct *vma, unsigned long addr,
> > +                       struct page **locked_page)
> > +{
> > +     swp_entry_t entry = pte_to_swp_entry(*src_pte);
> > +     struct page *page = pfn_swap_entry_to_page(entry);
> > +
> > +     if (*locked_page) {
> > +             /* The entry changed, retry */
> > +             if (unlikely(*locked_page != page)) {
> > +                     unlock_page(*locked_page);
> > +                     put_page(*locked_page);
> > +                     *locked_page = page;
> > +                     return -EBUSY;
> > +             }
> > +             restore_exclusive_pte(vma, page, addr, src_pte);
> > +             unlock_page(page);
> > +             put_page(page);
> > +             *locked_page = NULL;
> > +             return 0;
> > +     }
> > +
> > +     if (trylock_page(page)) {
> > +             restore_exclusive_pte(vma, page, addr, src_pte);
> > +             unlock_page(page);
> > +             return 0;
> > +     }
> > +
> > +     /* The page couldn't be locked so drop the locks and retry. */
> > +     *locked_page = page;
> > +     return -EBUSY;
> > +}
> > +
> > 
> >  /*
> >  
> >   * copy one vm_area from one task to the other. Assumes the page tables
> >   * already present in the new task to be cleared in the whole range
> > 
> > @@ -781,6 +859,12 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct
> > mm_struct *src_mm,> 
> >                               pte = pte_swp_mkuffd_wp(pte);
> >                       
> >                       set_pte_at(src_mm, addr, src_pte, pte);
> >               
> >               }
> > 
> > +     } else if (is_device_exclusive_entry(entry)) {
> > +             /* COW mappings should be dealt with by removing the entry
> > */
> > +             VM_BUG_ON(is_cow_mapping(vm_flags));
> > +             page = pfn_swap_entry_to_page(entry);
> > +             get_page(page);
> > +             rss[mm_counter(page)]++;
> > 
> >       }
> >       set_pte_at(dst_mm, addr, dst_pte, pte);
> >       return 0;
> > 
> > @@ -947,6 +1031,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct
> > vm_area_struct *src_vma,> 
> >       int rss[NR_MM_COUNTERS];
> >       swp_entry_t entry = (swp_entry_t){0};
> >       struct page *prealloc = NULL;
> > 
> > +     struct page *locked_page = NULL;
> > 
> >  again:
> >       progress = 0;
> > 
> > @@ -980,13 +1065,36 @@ copy_pte_range(struct vm_area_struct *dst_vma,
> > struct vm_area_struct *src_vma,> 
> >                       continue;
> >               
> >               }
> >               if (unlikely(!pte_present(*src_pte))) {
> > 
> > -                     entry.val = copy_nonpresent_pte(dst_mm, src_mm,
> > -                                                     dst_pte, src_pte,
> > -                                                     src_vma, addr, rss);
> > -                     if (entry.val)
> > -                             break;
> > -                     progress += 8;
> > -                     continue;
> > +                     swp_entry_t swp_entry = pte_to_swp_entry(*src_pte);
> > +
> > +                     if (unlikely(is_cow_mapping(src_vma->vm_flags) &&
> > +                         is_device_exclusive_entry(swp_entry))) {
> > +                             /*
> > +                              * Normally this would require sending mmu
> > +                              * notifiers, but copy_page_range() has
> > already +                              * done that for COW mappings.
> > +                              */
> > +                             ret = try_restore_exclusive_pte(src_mm,
> > src_pte, +                                                            
> > src_vma, addr, +                                                         
> >    &locked_page); +                             if (ret == -EBUSY)
> > +                                     break;
> > +                     } else {
> > +                             entry.val = copy_nonpresent_pte(dst_mm,
> > src_mm, +                                                            
> > dst_pte, src_pte, +                                                      
> >       src_vma, addr, +                                                   
> >          rss); +                             if (entry.val)
> > +                                     break;
> > +                             progress += 8;
> > +                             continue;
> > +                     }
> > +             }
> > +             /* a non-present pte became present after dropping the ptl
> > */
> > +             if (unlikely(locked_page)) {
> > +                     unlock_page(locked_page);
> > +                     put_page(locked_page);
> > +                     locked_page = NULL;
> > 
> >               }
> >               /* copy_present_pte() will clear `*prealloc' if consumed */
> >               ret = copy_present_pte(dst_vma, src_vma, dst_pte, src_pte,
> > 
> > @@ -1023,6 +1131,11 @@ copy_pte_range(struct vm_area_struct *dst_vma,
> > struct vm_area_struct *src_vma,> 
> >                       goto out;
> >               
> >               }
> >               entry.val = 0;
> > 
> > +     } else if (ret == -EBUSY) {
> > +             if (get_page_unless_zero(locked_page))
> > +                     lock_page(locked_page);
> > +             else
> > +                     locked_page = NULL;
> > 
> >       } else if (ret) {
> >       
> >               WARN_ON_ONCE(ret != -EAGAIN);
> >               prealloc = page_copy_prealloc(src_mm, src_vma, addr);
> > 
> > @@ -1287,7 +1400,8 @@ static unsigned long zap_pte_range(struct mmu_gather
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
> > @@ -1303,7 +1417,10 @@ static unsigned long zap_pte_range(struct
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
> > @@ -3256,6 +3373,44 @@ void unmap_mapping_range(struct address_space
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
> > +     struct page_vma_mapped_walk pvmw = {
> > +             .page = page,
> > +             .vma = vma,
> > +             .address = vmf->address,
> > +             .flags = PVMW_SYNC,
> > +     };
> > +     vm_fault_t ret = 0;
> > +     struct mmu_notifier_range range;
> > +
> > +     if (!lock_page_or_retry(page, vma->vm_mm, vmf->flags))
> > +             return VM_FAULT_RETRY;
> > +     mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma,
> > vma->vm_mm,
> > +                             vmf->address & PAGE_MASK,
> > +                             (vmf->address & PAGE_MASK) + PAGE_SIZE);
> > +     mmu_notifier_invalidate_range_start(&range);
> 
> I looked at MMU_NOTIFIER_CLEAR document and it tells me:
> 
>  * @MMU_NOTIFY_CLEAR: clear page table entry (many reasons for this like
>  * madvise() or replacing a page by another one, ...).
> 
> Does MMU_NOTIFIER_CLEAR suite for this case?  Normally I think for such a
> case (existing pte is invalid) we don't need to notify at all.  However
> from what I read from the whole series, this seems to be a critical point
> where we'd like to kick the owner/driver to synchronously stop doing atomic
> operations from the device.  Not sure whether we'd like a new notifier
> type, or maybe at least comment on why to use CLEAR?

Right, notifying the owner/driver when it no longer has exclusive access to 
the page and allowing it to stop atomic operations is the critical point and 
why it notifies when we ordinarily wouldn't (ie. invalid -> valid).

I did consider adding a new type, but in the driver implementation it ends up 
being treated the same as a CLEAR notification anyway so didn't think it was 
necessary. But I suppose adding a different type would allow other listening 
notifiers to filter these which might be worthwhile.

> > +
> > +     while (page_vma_mapped_walk(&pvmw)) {
> 
> IIUC a while loop of page_vma_mapped_walk() handles thps, however here it's
> already in do_swap_page() so it's small pte only?  Meanwhile...
> 
> > +             if (unlikely(!pte_same(*pvmw.pte, vmf->orig_pte))) {
> > +                     page_vma_mapped_walk_done(&pvmw);
> > +                     break;
> > +             }
> > +
> > +             restore_exclusive_pte(vma, page, pvmw.address, pvmw.pte);
> 
> ... I'm not sure whether passing in page would work for thp after all, as
> iiuc we may need to pass in the subpage rather than the head page if so.

Hmm, I need to check this and follow up.

> > +     }
> > +
> > +     unlock_page(page);
> > +
> > +     mmu_notifier_invalidate_range_end(&range);
> > +     return ret;
> > +}
> > +
> > 
> >  /*
> >  
> >   * We enter with non-exclusive mmap_lock (to exclude vma changes,
> >   * but allow concurrent faults), and pte mapped but not yet locked.
> > 
> > @@ -3283,6 +3438,9 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
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
> > diff --git a/mm/migrate.c b/mm/migrate.c
> > index cc4612e2a246..9cc9251d4802 100644
> > --- a/mm/migrate.c
> > +++ b/mm/migrate.c
> > @@ -2570,8 +2570,8 @@ static void migrate_vma_collect(struct migrate_vma
> > *migrate)> 
> >        * that the registered device driver can skip invalidating device
> >        * private page mappings that won't be migrated.
> >        */
> > 
> > -     mmu_notifier_range_init_migrate(&range, 0, migrate->vma,
> > -             migrate->vma->vm_mm, migrate->start, migrate->end,
> > +     mmu_notifier_range_init_owner(&range, MMU_NOTIFY_MIGRATE, 0,
> > +             migrate->vma, migrate->vma->vm_mm, migrate->start,
> > migrate->end,> 
> >               migrate->pgmap_owner);
> >       
> >       mmu_notifier_invalidate_range_start(&range);
> > 
> > @@ -3074,9 +3074,9 @@ void migrate_vma_pages(struct migrate_vma *migrate)
> > 
> >                       if (!notified) {
> >                       
> >                               notified = true;
> > 
> > -                             mmu_notifier_range_init_migrate(&range, 0,
> > -                                     migrate->vma, migrate->vma->vm_mm,
> > -                                     addr, migrate->end,
> > +                             mmu_notifier_range_init_owner(&range,
> > +                                     MMU_NOTIFY_MIGRATE, 0, migrate->vma,
> > +                                     migrate->vma->vm_mm, addr,
> > migrate->end,> 
> >                                       migrate->pgmap_owner);
> 
> (As I read more, I feel more that maybe it's better to move this renaming
>  change along with mmu_notifier_range_init_owner() rework into a separate
>  patch, as even the changes are straightforward there're still quite a few
>  places that need touch up; no strong opinion though)

Ack, will take a look at doing this.

> >                               mmu_notifier_invalidate_range_start(&range);
> >                       
> >                       }
> > 
> > diff --git a/mm/mprotect.c b/mm/mprotect.c
> > index f21b760ec809..c6018541ea3d 100644
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
> > index eed988ab2e81..29842f169219 100644
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
> > index 7f91f058f1f5..32b99a7bb358 100644
> > --- a/mm/rmap.c
> > +++ b/mm/rmap.c
> > @@ -2005,6 +2005,216 @@ void page_mlock(struct page *page)
> > 
> >       rmap_walk(page, &rwc);
> >  
> >  }
> > 
> > +struct ttp_args {
> > +     struct mm_struct *mm;
> > +     unsigned long address;
> > +     void *arg;
> > +     bool valid;
> > +};
> > +
> > +static bool try_to_protect_one(struct page *page, struct vm_area_struct
> > *vma, +                     unsigned long address, void *arg)
> > +{
> > +     struct mm_struct *mm = vma->vm_mm;
> > +     struct page_vma_mapped_walk pvmw = {
> > +             .page = page,
> > +             .vma = vma,
> > +             .address = address,
> > +     };
> > +     struct ttp_args *ttp = arg;
> > +     pte_t pteval;
> > +     struct page *subpage;
> > +     bool ret = true;
> > +     struct mmu_notifier_range range;
> > +     swp_entry_t entry;
> > +     pte_t swp_pte;
> > +
> > +     mmu_notifier_range_init_owner(&range, MMU_NOTIFY_EXCLUSIVE, 0, vma,
> > +                                   vma->vm_mm, address,
> > +                                   min(vma->vm_end,
> > +                                       address + page_size(page)),
> 
> (this indent looks odd; seems better to join with previous line?  Slightly
> over 80 but seems kernel code is not extremely strict on that)

It seems sometimes sticking to 80 is still preferable though so generally I 
still try to stick to that. Agree the indent does look a little odd though so 
perhaps this is better:

+     mmu_notifier_range_init_owner(&range, MMU_NOTIFY_EXCLUSIVE, 0, vma,
+                                   vma->vm_mm, address, min(vma->vm_end,
+                                   address + page_size(page)),
+                                   ttp->arg);


> > +     if (PageHuge(page)) {
> > +             /*
> > +              * If sharing is possible, start and end will be adjusted
> > +              * accordingly.
> > +              */
> > +             adjust_range_if_pmd_sharing_possible(vma, &range.start,
> > +                                                  &range.end);
> > +     }
> 
> Is this for hugetlb specific?  Can we drop this chunk if we know it's
> PageAnon(), or is this a preparation for the future?
> 
> IMHO if possible we shouldn't introduce code that may never run, so to me
> that sounds still better to be postponed until the hugetlbfs support (if
> there will be).  So raise this question up.

Yeah I agree, this appears to be a hangover from an earlier version when 
try_to_protect_one() was part of the giant try_to_unmap_one() function which I 
subsequently cleaned up so I think it can be removed. Thanks.

> > +     mmu_notifier_invalidate_range_start(&range);
> > +
> > +     while (page_vma_mapped_walk(&pvmw)) {
> 
> Same here, not sure whether "if" would be easier.
> 
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
> > +             address = pvmw.address;
> 
> Same question here: could the subpage be not the same as page at all?
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
> > +             /* Update high watermark before we lower rss */
> > +             update_hiwater_rss(mm);
> 
> We don't update RSS, right?  If so, can this be dropped?

Yep.

> > +
> > +             if (arch_unmap_one(mm, vma, address, pteval) < 0) {
> > +                     set_pte_at(mm, address, pvmw.pte, pteval);
> > +                     ret = false;
> > +                     page_vma_mapped_walk_done(&pvmw);
> > +                     break;
> > +             }
> > +
> > +             /*
> > +              * Check that our target page is still mapped at the
> > expected
> > +              * address.
> > +              */
> > +             if (ttp->mm == mm && ttp->address == address &&
> > +                 pte_write(pteval))
> > +                     ttp->valid = true;
> 
> I think I get the point of doing this (as after GUP the pte could have been
> changed to point to another page), however it smells a bit odd to me (or
> it's also possible that I'm not familiar enough with the code base..). 
> IIUC this is the _only_ reason that we passed in "address" into
> try_to_protect() too, and further into the ttp_args.

Yes, this is why "address" is passed up to ttp_args.

> The odd part is the remote GUP should have walked the page table already, so
> since the target here is the vaddr to replace, the 1st page table walk
> should be able to both trylock/lock the page, then modify the pte with
> pgtable lock held, return the locked page, then walk the rmap again to
> remove all the rest of the ptes that are mapping to this page.  In that
> case before we call the rmap_walk() we know this must be the page we want
> to take care of, and no one will be able to restore the original mm pte
> either (as we're with the page lock).  Then we don't need this check,
> neither do we need ttp->address.

If I am understanding you correctly I think this would be similar to the 
approach that was taken in v2. However it pretty much ended up being just an 
open-coded version of gup which is useful anyway to fault the page in.

> However frankly I didn't think deeper on how to best implement that and how
> many code changes are needed.  So just raise it up as question too here.
> 
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
> > page_to_pfn(subpage));
> (For my own preference I actually prefer
> make_device_exclusive_entry(writable) and helpers defined like that, then
> these lines can be written as oneliner by passing in pte_write(); however
> that's quite subjective opinion and I saw there're discussions around that
> on patch 2, so I'll avoid commenting more)

As you say this is somewhat subjective and personally I prefer this to adding 
flag type arguments (although when the flag is a single bool I can go either 
way). The real reason is the original swap entry code cleaned up in patches 1 
& 2 had a mixture of both styles and I didn't really think a third helper 
(make_device_exclusive_entry(writable)) was necessary.

> > +             swp_pte = swp_entry_to_pte(entry);
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
> > +             put_page(page);
> > +     }
> > +
> > +     mmu_notifier_invalidate_range_end(&range);
> > +
> > +     return ret;
> > +}
> > +
> > +/**
> > + * try_to_protect - try to replace all page table mappings with swap
> > entries
> Is this too general?  Either on the word "protect" or the comment after it,
> as there're a lot of types of swap entries (and a lot of types of protect
> too..), while it seems this is only for the device exclusive swap entries.
> 
> How about rename it to try_to_mark_device_exclusive?  Or even dropping the
> "try_to_" (e.g. device_exclusive_mark_page())?
> 
> > + * @page: the page to replace page table entries for
> > + * @flags: action and flags
> 
> Obsolete line?

Yep.

> > + * @mm: the mm_struct where the page is expected to be mapped
> > + * @address: address where the page is expected to be mapped
> > + * @arg: passed to MMU_NOTIFY_EXCLUSIVE range notifier callbacks
> > + *
> > + * Tries to remove all the page table entries which are mapping this page
> > and + * replace them with special swap entries to grant a device
> > exclusive access to + * the page. Caller must hold the page lock.
> > + *
> > + * Returns false if the page is still mapped, or if it could not be
> > unmapped + * from the expected address. Otherwise returns true (success).
> > + */
> > +static bool try_to_protect(struct page *page, struct mm_struct *mm,
> > +                        unsigned long address, void *arg)
> > +{
> > +     struct ttp_args ttp = {
> > +             .mm = mm,
> > +             .address = address,
> > +             .arg = arg,
> > +             .valid = false,
> > +     };
> > +     struct rmap_walk_control rwc = {
> > +             .rmap_one = try_to_protect_one,
> > +             .done = page_not_mapped,
> > +             .anon_lock = page_lock_anon_vma_read,
> > +             .arg = &ttp,
> > +     };
> > +
> > +     /*
> > +      * Restrict to anonymous pages for now to avoid potential writeback
> > +      * issues.
> > +      */
> > +     if (!PageAnon(page))
> > +             return false;
> > +
> > +     /*
> > +      * During exec, a temporary VMA is setup and later moved.
> > +      * The VMA is moved under the anon_vma lock but not the
> > +      * page tables leading to a race where migration cannot
> > +      * find the migration ptes. Rather than increasing the
> > +      * locking requirements of exec(), migration skips
> > +      * temporary VMAs until after exec() completes.
> > +      */
> > +     if (!PageKsm(page) && PageAnon(page))
> 
> I think we can drop the PageAnon() check as it's just done above.
> 
> I feel like this chunk was copied over from try_to_unmap(), however is that
> necessary?  Is it possible that the caller of make_device_exclusive_range()
> pass in a temp stack vma during exec()?

Indeed it was and I doubt it's possible for a caller to pass in a temp stack. 
Will double check.

> > +             rwc.invalid_vma = invalid_migration_vma;
> > +
> > +     rmap_walk(page, &rwc);
> > +
> > +     return ttp.valid && !page_mapcount(page);
> > +}
> > +
> > +/**
> > + * make_device_exclusive_range() - Mark a range for exclusive use by a
> > device + * @mm: mm_struct of assoicated target process
> > + * @start: start of the region to mark for exclusive device access
> > + * @end: end address of region
> > + * @pages: returns the pages which were successfully marked for exclusive
> > access + * @arg: passed to MMU_NOTIFY_EXCLUSIVE range notifier too allow
> > filtering
> s/too/to/?
> 
> > + *
> > + * Returns: number of pages successfully marked for exclusive access
> 
> Hmm, I see that try_to_protect() can fail even if npages returned from GUP,
> so perhaps "number of pages successfully GUPed, however the page is marked
> for exclusive access only if the page pointer is non-NULL", or something
> like that?

Good point, thanks.

> > + *
> > + * This function finds ptes mapping page(s) to the given address range,
> > locks + * them and replaces mappings with special swap entries preventing
> > userspace CPU
> s/userspace//?  As same for kernel access?
> 
> (I don't think I fully read all the codes in this patch, but I'll stop here
> for today..)

No problem, thanks for the comments and reading this far!

 - Alistair

> Thanks,
> 
> > + * access. On fault these entries are replaced with the original mapping
> > after + * calling MMU notifiers.
> > + *
> > + * A driver using this to program access from a device must use a mmu
> > notifier + * critical section to hold a device specific lock during
> > programming. Once + * programming is complete it should drop the page
> > lock and reference after + * which point CPU access to the page will
> > revoke the exclusive access. + */
> > +int make_device_exclusive_range(struct mm_struct *mm, unsigned long
> > start,
> > +                             unsigned long end, struct page **pages,
> > +                             void *arg)
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
> > +             if (!try_to_protect(pages[i], mm, start, arg)) {
> > +                     unlock_page(pages[i]);
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




