Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50181329706
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 09:53:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA89E6E916;
	Tue,  2 Mar 2021 08:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BFDD6E8D4;
 Tue,  2 Mar 2021 08:52:59 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B603dfcea0002>; Tue, 02 Mar 2021 00:52:58 -0800
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 2 Mar
 2021 08:52:55 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 1/8] mm: Remove special swap entry functions
Date: Tue, 2 Mar 2021 19:52:53 +1100
Message-ID: <2110609.1zlQqR5hOE@nvdebian>
In-Reply-To: <20210226155909.GA2907711@infradead.org>
References: <20210226071832.31547-1-apopple@nvidia.com>
 <20210226071832.31547-2-apopple@nvidia.com>
 <20210226155909.GA2907711@infradead.org>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1614675178; bh=Q3KJiry9KyGM4bq+yenpeuhX/mI9emX6OFn6eNSXghg=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=dsu+1waYJQ7mqyv3AqpWc1eGn2uJdvbYr5/iNbgdcM0TKiIQTQh8JHHCNijiQjUUf
 EJP+ja4ILdram33pqB4lCLWhSVsECM/8l5SOVdZXTtYrVTlGcWZgCDPjJ2YzG4pYXI
 STyeVXGtNaS8EV2CYHHsTdnVdS2Dol2WMH8fKy1PJoaEhBx8SRB9cfUPxg/9cjK9cK
 kf6s5gY/VIse5I8b7CBhYBQiKFQIuYpFBSPKt+fxSyPlTCLXtg5uUddehOmZFX9Ebo
 LXja9zY84Af/ktvtHgmQeel83G4QfOfL/kBuBfZ/d1ZX5GHIBGhMFETZtVOCJlT2Bd
 qxtZaFFgBfb1A==
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
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org, jglisse@redhat.com,
 bskeggs@redhat.com, jgg@nvidia.com, jhubbard@nvidia.com,
 akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Saturday, 27 February 2021 2:59:09 AM AEDT Christoph Hellwig wrote:
> > -		struct page *page = migration_entry_to_page(entry);
> > +		struct page *page = pfn_to_page(swp_offset(entry));
> 
> I wonder if keeping a single special_entry_to_page() helper would still
> me a useful.  But I'm not entirely sure.  There are also two more open
> coded copies of this in the THP migration code.

I think it might be if only to clearly document where these entries are used. 
Will add it for the next version to see what it looks like.

> > -#define free_swap_and_cache(e) ({(is_migration_entry(e) || 
is_device_private_entry(e));})
> > -#define swapcache_prepare(e) ({(is_migration_entry(e) || 
is_device_private_entry(e));})
> > +#define free_swap_and_cache(e) is_special_entry(e)
> > +#define swapcache_prepare(e) is_special_entry(e)
> 
> Staring at this I'm really, really confused at what this is doing.
> 
> Looking a little closer these are the !CONFIG_SWAP stubs, but it could
> probably use a comment or two.

Will do, thanks.

 - Alistair
 
> >  	} else if (is_migration_entry(entry)) {
> > -		page = migration_entry_to_page(entry);
> > +		page = pfn_to_page(swp_offset(entry));
> >  
> >  		rss[mm_counter(page)]++;
> >  
> > @@ -737,7 +737,7 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct 
mm_struct *src_mm,
> >  			set_pte_at(src_mm, addr, src_pte, pte);
> >  		}
> >  	} else if (is_device_private_entry(entry)) {
> > -		page = device_private_entry_to_page(entry);
> > +		page = pfn_to_page(swp_offset(entry));
> >  
> >  		/*
> >  		 * Update rss count even for unaddressable pages, as
> > @@ -1274,7 +1274,7 @@ static unsigned long zap_pte_range(struct mmu_gather 
*tlb,
> >  
> >  		entry = pte_to_swp_entry(ptent);
> >  		if (is_device_private_entry(entry)) {
> > -			struct page *page = device_private_entry_to_page(entry);
> > +			struct page *page = pfn_to_page(swp_offset(entry));
> >  
> >  			if (unlikely(details && details->check_mapping)) {
> >  				/*
> > @@ -1303,7 +1303,7 @@ static unsigned long zap_pte_range(struct mmu_gather 
*tlb,
> >  		else if (is_migration_entry(entry)) {
> >  			struct page *page;
> >  
> > -			page = migration_entry_to_page(entry);
> > +			page = pfn_to_page(swp_offset(entry));
> >  			rss[mm_counter(page)]--;
> >  		}
> >  		if (unlikely(!free_swap_and_cache(entry)))
> > @@ -3271,7 +3271,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> >  			migration_entry_wait(vma->vm_mm, vmf->pmd,
> >  					     vmf->address);
> >  		} else if (is_device_private_entry(entry)) {
> > -			vmf->page = device_private_entry_to_page(entry);
> > +			vmf->page = pfn_to_page(swp_offset(entry));
> >  			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> >  		} else if (is_hwpoison_entry(entry)) {
> >  			ret = VM_FAULT_HWPOISON;
> > diff --git a/mm/migrate.c b/mm/migrate.c
> > index 20ca887ea769..72adcc3d8f5b 100644
> > --- a/mm/migrate.c
> > +++ b/mm/migrate.c
> > @@ -321,7 +321,7 @@ void __migration_entry_wait(struct mm_struct *mm, 
pte_t *ptep,
> >  	if (!is_migration_entry(entry))
> >  		goto out;
> >  
> > -	page = migration_entry_to_page(entry);
> > +	page = pfn_to_page(swp_offset(entry));
> >  
> >  	/*
> >  	 * Once page cache replacement of page migration started, page_count
> > @@ -361,7 +361,7 @@ void pmd_migration_entry_wait(struct mm_struct *mm, 
pmd_t *pmd)
> >  	ptl = pmd_lock(mm, pmd);
> >  	if (!is_pmd_migration_entry(*pmd))
> >  		goto unlock;
> > -	page = migration_entry_to_page(pmd_to_swp_entry(*pmd));
> > +	page = pfn_to_page(swp_offset(pmd_to_swp_entry(*pmd)));
> >  	if (!get_page_unless_zero(page))
> >  		goto unlock;
> >  	spin_unlock(ptl);
> > @@ -2437,7 +2437,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >  			if (!is_device_private_entry(entry))
> >  				goto next;
> >  
> > -			page = device_private_entry_to_page(entry);
> > +			page = pfn_to_page(swp_offset(entry));
> >  			if (!(migrate->flags &
> >  				MIGRATE_VMA_SELECT_DEVICE_PRIVATE) ||
> >  			    page->pgmap->owner != migrate->pgmap_owner)
> > diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
> > index 86e3a3688d59..34230d08556a 100644
> > --- a/mm/page_vma_mapped.c
> > +++ b/mm/page_vma_mapped.c
> > @@ -96,7 +96,7 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw)
> >  		if (!is_migration_entry(entry))
> >  			return false;
> >  
> > -		pfn = migration_entry_to_pfn(entry);
> > +		pfn = swp_offset(entry);
> >  	} else if (is_swap_pte(*pvmw->pte)) {
> >  		swp_entry_t entry;
> >  
> > @@ -105,7 +105,7 @@ static bool check_pte(struct page_vma_mapped_walk 
*pvmw)
> >  		if (!is_device_private_entry(entry))
> >  			return false;
> >  
> > -		pfn = device_private_entry_to_pfn(entry);
> > +		pfn = swp_offset(entry);
> >  	} else {
> >  		if (!pte_present(*pvmw->pte))
> >  			return false;
> > @@ -200,7 +200,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk 
*pvmw)
> >  				if (is_migration_entry(pmd_to_swp_entry(*pvmw->pmd))) {
> >  					swp_entry_t entry = pmd_to_swp_entry(*pvmw->pmd);
> >  
> > -					if (migration_entry_to_page(entry) != page)
> > +					if (pfn_to_page(swp_offset(entry)) != page)
> >  						return not_found(pvmw);
> >  					return true;
> >  				}
> ---end quoted text---
> 




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
