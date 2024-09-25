Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B41FD98588E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 13:44:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F9510E800;
	Wed, 25 Sep 2024 11:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ZaW41mwc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD6110E800
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 11:44:41 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5c43003a667so9234581a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 04:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1727264680; x=1727869480; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jW5wRAQT/NW2ZEXTAe4H57yFnYDEvXMtsJrvDGoCnp8=;
 b=ZaW41mwcivvPWa/jkEIlEH9xGWW2LQ3TFlbOzKJOVIIXdICkXNiz//ASp11ELbOHX2
 PyUOqU2m511d/QJ3WhmhMJ0si2nAsG8TN0mBhLYsqW35rbixoF0Kr1xkLcHqIugs/Akc
 ovbsDTfZpBERlE2HLt7Lels3OGqzIeUTW0eHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727264680; x=1727869480;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jW5wRAQT/NW2ZEXTAe4H57yFnYDEvXMtsJrvDGoCnp8=;
 b=gXHbbZ4tN184cHWNjT/Da13tGJEQvl2XdD1ZKgrqpWo+TDqDPtbtxF5YlOopzJbMdq
 3DNqjUD8TkBnDFhYgpI2++R4p/ZWa1CLWgplDhTwgrpWrvJakHbNIg81HewZPIw6NrQG
 OryPasj0VgOtpkdhdQcpj6fdGpkCNwyjgmlvBD5bHrDHi3cqt9vp1Mmr/ogauWo68Fxh
 cUrRmDQIq1SXGH6x5UFacmOtaXNtzw3xH/PCA9tENHYv0Lv9wovHGHmqQyRzFp0DG3V+
 tVuH9R5NVBgbQ0eY2n6rgHcSkXBSXDXSHUQovtmZ+u+K7rhV/JFKO1XrvL4XAOo+3hix
 bp2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq04MUSRtLrG3yu7N86CM/jdSLT71t5fpZWpjeCzB86INcCkI5mDMOEemIdBiPSqHuttJUdDp7FoA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5NghOD+DX4ZkBoX8DJSTckJkGezA7On5RRT8K+dHg9tXaXBxv
 Nsa9uqGKFSh7lbSgHJq/cKjSoqRc+PbMdXpltBTI4oXil0ZH265S1l4o3oao4qs=
X-Google-Smtp-Source: AGHT+IHIOa4EFOAn8IjNL5rc8fy+kLCGjgZ8YGFMbVmN6haJU3wmeWL4hRmQsHPilAlf3Yhl96Z3OA==
X-Received: by 2002:a05:6402:27d2:b0:5bf:50:266b with SMTP id
 4fb4d7f45d1cf-5c7206298b7mr1862094a12.19.1727264679937; 
 Wed, 25 Sep 2024 04:44:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf4d7a28sm1751162a12.85.2024.09.25.04.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 04:44:39 -0700 (PDT)
Date: Wed, 25 Sep 2024 13:44:37 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Felix Kuehling <felix.kuehling@amd.com>,
 Alistair Popple <apopple@nvidia.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Philip.Yang@amd.com, akpm@linux-foundation.org, christian.koenig@amd.com
Subject: Re: [PATCH 1/1] mm/migrate: Trylock device page in do_swap_page
Message-ID: <ZvP3pWjVviMdezuy@phenom.ffwll.local>
Mail-Followup-To: Matthew Brost <matthew.brost@intel.com>,
 Felix Kuehling <felix.kuehling@amd.com>,
 Alistair Popple <apopple@nvidia.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Philip.Yang@amd.com, akpm@linux-foundation.org,
 christian.koenig@amd.com
References: <20240911030337.870160-2-matthew.brost@intel.com>
 <87mskehjtc.fsf@nvdebian.thelocal>
 <ZuS/NH/P8Fl+qptx@DUT025-TGLU.fm.intel.com>
 <87msk5our1.fsf@nvdebian.thelocal>
 <ece41917-2ea7-4571-83a5-a50c776c6587@amd.com>
 <Zu3n3MmtdlEDaXnF@DUT025-TGLU.fm.intel.com>
 <9a3e62e0-cb62-4d73-9694-7be8893f7206@amd.com>
 <Zu3wV9FJSTs1E5Vx@DUT025-TGLU.fm.intel.com>
 <ZvKnDT_bdx_PhAcG@phenom.ffwll.local>
 <ZvLr66F3VqpMyLlS@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZvLr66F3VqpMyLlS@DUT025-TGLU.fm.intel.com>
X-Operating-System: Linux phenom 6.10.6-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 24, 2024 at 04:42:19PM +0000, Matthew Brost wrote:
> On Tue, Sep 24, 2024 at 01:48:29PM +0200, Simona Vetter wrote:
> > On Fri, Sep 20, 2024 at 09:59:51PM +0000, Matthew Brost wrote:
> > > On Fri, Sep 20, 2024 at 05:50:10PM -0400, Felix Kuehling wrote:
> > > > 
> > > > On 2024-09-20 17:23, Matthew Brost wrote:
> > > > > On Fri, Sep 20, 2024 at 04:26:50PM -0400, Felix Kuehling wrote:
> > > > > > On 2024-09-18 11:10, Alistair Popple wrote:
> > > > > > > Matthew Brost <matthew.brost@intel.com> writes:
> > > > > > > 
> > > > > > > > On Wed, Sep 11, 2024 at 02:53:31PM +1000, Alistair Popple wrote:
> > > > > > > > > Matthew Brost <matthew.brost@intel.com> writes:
> > > > > > > > > 
> > > > > > > > > I haven't seen the same in the NVIDIA UVM driver (out-of-tree, I know)
> > > > > > > > Still a driver.
> > > > > > > Indeed, and I'm happy to answer any questions about our implementation.
> > > > > > > 
> > > > > > > > > but theoretically it seems like it should be possible. However we
> > > > > > > > > serialize migrations of the same virtual address range to avoid these
> > > > > > > > > kind of issues as they can happen the other way too (ie. multiple
> > > > > > > > > threads trying to migrate to GPU).
> > > > > > > > > 
> > > > > > > > > So I suspect what happens in UVM is that one thread wins and installs
> > > > > > > > > the migration entry while the others fail to get the driver migration
> > > > > > > > > lock and bail out sufficiently early in the fault path to avoid the
> > > > > > > > > live-lock.
> > > > > > > > > 
> > > > > > > > I had to try hard to show this, doubt an actual user could trigger this.
> > > > > > > > 
> > > > > > > > I wrote a test which kicked 8 threads, each thread did a pthread join,
> > > > > > > > and then tried to read the same page. This repeats in loop for like 512
> > > > > > > > pages or something. I needed an exclusive lock in migrate_to_ram vfunc
> > > > > > > > for it to livelock. Without an exclusive lock I think on average I saw
> > > > > > > > about 32k retries (i.e. migrate_to_ram calls on the same page) before a
> > > > > > > > thread won this race.
> > > > > > > > 
> > > > > > > >   From reading UVM, pretty sure if you tried hard enough you could trigger
> > > > > > > > a livelock given it appears you take excluvise locks in migrate_to_ram.
> > > > > > > Yes, I suspect you're correct here and that we just haven't tried hard
> > > > > > > enough to trigger it.
> > > > > > > 
> > > > > > > > > > Cc: Philip Yang <Philip.Yang@amd.com>
> > > > > > > > > > Cc: Felix Kuehling <felix.kuehling@amd.com>
> > > > > > > > > > Cc: Christian König <christian.koenig@amd.com>
> > > > > > > > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > > > > > > > Suggessted-by: Simona Vetter <simona.vetter@ffwll.ch>
> > > > > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > > > ---
> > > > > > > > > >    mm/memory.c         | 13 +++++++---
> > > > > > > > > >    mm/migrate_device.c | 60 +++++++++++++++++++++++++++++++--------------
> > > > > > > > > >    2 files changed, 50 insertions(+), 23 deletions(-)
> > > > > > > > > > 
> > > > > > > > > > diff --git a/mm/memory.c b/mm/memory.c
> > > > > > > > > > index 3c01d68065be..bbd97d16a96a 100644
> > > > > > > > > > --- a/mm/memory.c
> > > > > > > > > > +++ b/mm/memory.c
> > > > > > > > > > @@ -4046,10 +4046,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> > > > > > > > > >    			 * Get a page reference while we know the page can't be
> > > > > > > > > >    			 * freed.
> > > > > > > > > >    			 */
> > > > > > > > > > -			get_page(vmf->page);
> > > > > > > > > > -			pte_unmap_unlock(vmf->pte, vmf->ptl);
> > > > > > > > > > -			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> > > > > > > > > > -			put_page(vmf->page);
> > > > > > > > > > +			if (trylock_page(vmf->page)) {
> > > > > > > > > > +				get_page(vmf->page);
> > > > > > > > > > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> > > > > > > > > This is all beginning to look a lot like migrate_vma_collect_pmd(). So
> > > > > > > > > rather than do this and then have to pass all this context
> > > > > > > > > (ie. fault_page) down to the migrate_vma_* functions could we instead
> > > > > > > > > just do what migrate_vma_collect_pmd() does here? Ie. we already have
> > > > > > > > > the PTL and the page lock so there's no reason we couldn't just setup
> > > > > > > > > the migration entry prior to calling migrate_to_ram().
> > > > > > > > > 
> > > > > > > > > Obviously calling migrate_vma_setup() would show the page as not
> > > > > > > > > migrating, but drivers could easily just fill in the src_pfn info after
> > > > > > > > > calling migrate_vma_setup().
> > > > > > > > > 
> > > > > > > > > This would eliminate the whole fault_page ugliness.
> > > > > > > > > 
> > > > > > > > This seems like it would work and agree it likely be cleaner. Let me
> > > > > > > > play around with this and see what I come up with. Multi-tasking a bit
> > > > > > > > so expect a bit of delay here.
> > > > > > > > 
> > > > > > > > Thanks for the input,
> > > > > > > > Matt
> > > > > > Thanks! Sorry, I'm late catching up after a vacation. Please keep Philip,
> > > > > > Christian and myself in the loop with future patches in this area.
> > > > > > 
> > > > > Will do. Already have another local patch set which helps drivers dma
> > > > > map 2M pages for migrations if SRAM is physically contiguous. Seems
> > > > > helpful for performance on Intel hardware. Probably post that soon for
> > > > > early feedack.
> > > > 
> > > > OK.
> > > > 
> > > > 
> > > > > 
> > > > > Longer term I thinking 2M migration entries, 2M device pages, and being
> > > > > able to install 2M THP on VRAM -> SRAM could be really helpful. I'm
> > > > > finding migrate_vma_* functions take up like 80-90% of the time in the
> > > > > CPU / GPU fault handlers on a fault (or prefetch) which doesn't seem
> > > > > ideal. Seems like 2M entries for everything would really help here. No
> > > > > idea how feasible this is as the core MM stuff gets confusing fast. Any
> > > > > input on this idea?
> > > > 
> > > > I agree with your observations. We found that the migrate_vma_* code was the
> > > > bottle neck for migration performance as well, and not breaking 2M pages
> > > > could reduce that overhead a lot. I don't have any specific ideas. I'm not
> > > > familiar with the details of that code myself. Philip has looked at this
> > > > (and some old NVidia patches from a few years ago) in the past but never had
> > > > enough uninterrupted time to make it past prototyping.
> > > > 
> > > 
> > > Cool good to know this isn't some crazy idea. Doubt it happen anytime
> > > soon as I need to get a working baseline in before anything then start
> > > applying optimizations and help in get other features to get the design
> > > complete. But eventually will probably try to look at this. May ping
> > > Philip and Nvidia when I have time to dig in here.
> > 
> > I think the big step will be moving hmm.c and migrate.c apis over from
> > struct page to folios. That should also give us some nice benefits on the
> > gpu side, since instead of 4k pages to track we could allocate 2m gpu
> > pages.
> > 
> 
> I think was thinking just encode the order in the migration PFN like HMM
> does. Really only Nth order entry in the page array needs to be
> populated then - HMM populates every entry though which doesn't seem
> like that is required. Maybe having a folio API makes more sense?

Both I'd say, as a first attempt at least. An array of folios, but only
populate the ones we need and jump over empty entries. A bit wasteful, but
eh it's just allocations.

> > Once we have folios at the driver/core mm api level doing all the fancy
> > thp stuff should be at least a well-contained problem. But I might be
> > dellusionally optimistic here :-)
> 
> I think it contained in the sense is the DRM SVM layer just allocates a
> THP or large continous device memory and hands it off to migrate layer
> and that layer does the right thing. The 'right thing' here I believe is
> a decent amount of core MM work though.

Yeah that's what I meant, once we have switched the interfaces to be
arrays of folios, where for larger folios we leave the entries in between
NULL and have some appropriate iterators, then the driver side is done
mostly.  The core mm side to actually make use of that will be fairly
gnarly though.
-Sima

> 
> Matt
> 
> > -Sima
> > 
> > > 
> > > Matt
> > > 
> > > > Regards,
> > > >   Felix
> > > > 
> > > > 
> > > > > 
> > > > > Matt
> > > > > 
> > > > > > Regards,
> > > > > >    Felix
> > > > > > 
> > > > > > 
> > > > > > > > > > +				ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> > > > > > > > > > +				put_page(vmf->page);
> > > > > > > > > > +				unlock_page(vmf->page);
> > > > > > > > > > +			} else {
> > > > > > > > > > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> > > > > > > > > > +			}
> > > > > > > > > >    		} else if (is_hwpoison_entry(entry)) {
> > > > > > > > > >    			ret = VM_FAULT_HWPOISON;
> > > > > > > > > >    		} else if (is_pte_marker_entry(entry)) {
> > > > > > > > > > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> > > > > > > > > > index 6d66dc1c6ffa..049893a5a179 100644
> > > > > > > > > > --- a/mm/migrate_device.c
> > > > > > > > > > +++ b/mm/migrate_device.c
> > > > > > > > > > @@ -60,6 +60,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> > > > > > > > > >    				   struct mm_walk *walk)
> > > > > > > > > >    {
> > > > > > > > > >    	struct migrate_vma *migrate = walk->private;
> > > > > > > > > > +	struct folio *fault_folio = migrate->fault_page ?
> > > > > > > > > > +		page_folio(migrate->fault_page) : NULL;
> > > > > > > > > >    	struct vm_area_struct *vma = walk->vma;
> > > > > > > > > >    	struct mm_struct *mm = vma->vm_mm;
> > > > > > > > > >    	unsigned long addr = start, unmapped = 0;
> > > > > > > > > > @@ -88,11 +90,13 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> > > > > > > > > >    			folio_get(folio);
> > > > > > > > > >    			spin_unlock(ptl);
> > > > > > > > > > -			if (unlikely(!folio_trylock(folio)))
> > > > > > > > > > +			if (unlikely(fault_folio != folio &&
> > > > > > > > > > +				     !folio_trylock(folio)))
> > > > > > > > > >    				return migrate_vma_collect_skip(start, end,
> > > > > > > > > >    								walk);
> > > > > > > > > >    			ret = split_folio(folio);
> > > > > > > > > > -			folio_unlock(folio);
> > > > > > > > > > +			if (fault_folio != folio)
> > > > > > > > > > +				folio_unlock(folio);
> > > > > > > > > >    			folio_put(folio);
> > > > > > > > > >    			if (ret)
> > > > > > > > > >    				return migrate_vma_collect_skip(start, end,
> > > > > > > > > > @@ -192,7 +196,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> > > > > > > > > >    		 * optimisation to avoid walking the rmap later with
> > > > > > > > > >    		 * try_to_migrate().
> > > > > > > > > >    		 */
> > > > > > > > > > -		if (folio_trylock(folio)) {
> > > > > > > > > > +		if (fault_folio == folio || folio_trylock(folio)) {
> > > > > > > > > >    			bool anon_exclusive;
> > > > > > > > > >    			pte_t swp_pte;
> > > > > > > > > > @@ -204,7 +208,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> > > > > > > > > >    				if (folio_try_share_anon_rmap_pte(folio, page)) {
> > > > > > > > > >    					set_pte_at(mm, addr, ptep, pte);
> > > > > > > > > > -					folio_unlock(folio);
> > > > > > > > > > +					if (fault_folio != folio)
> > > > > > > > > > +						folio_unlock(folio);
> > > > > > > > > >    					folio_put(folio);
> > > > > > > > > >    					mpfn = 0;
> > > > > > > > > >    					goto next;
> > > > > > > > > > @@ -363,6 +368,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
> > > > > > > > > >    					  unsigned long npages,
> > > > > > > > > >    					  struct page *fault_page)
> > > > > > > > > >    {
> > > > > > > > > > +	struct folio *fault_folio = fault_page ?
> > > > > > > > > > +		page_folio(fault_page) : NULL;
> > > > > > > > > >    	unsigned long i, restore = 0;
> > > > > > > > > >    	bool allow_drain = true;
> > > > > > > > > >    	unsigned long unmapped = 0;
> > > > > > > > > > @@ -427,7 +434,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
> > > > > > > > > >    		remove_migration_ptes(folio, folio, false);
> > > > > > > > > >    		src_pfns[i] = 0;
> > > > > > > > > > -		folio_unlock(folio);
> > > > > > > > > > +		if (fault_folio != folio)
> > > > > > > > > > +			folio_unlock(folio);
> > > > > > > > > >    		folio_put(folio);
> > > > > > > > > >    		restore--;
> > > > > > > > > >    	}
> > > > > > > > > > @@ -536,6 +544,8 @@ int migrate_vma_setup(struct migrate_vma *args)
> > > > > > > > > >    		return -EINVAL;
> > > > > > > > > >    	if (args->fault_page && !is_device_private_page(args->fault_page))
> > > > > > > > > >    		return -EINVAL;
> > > > > > > > > > +	if (args->fault_page && !PageLocked(args->fault_page))
> > > > > > > > > > +		return -EINVAL;
> > > > > > > > > >    	memset(args->src, 0, sizeof(*args->src) * nr_pages);
> > > > > > > > > >    	args->cpages = 0;
> > > > > > > > > > @@ -799,19 +809,13 @@ void migrate_vma_pages(struct migrate_vma *migrate)
> > > > > > > > > >    }
> > > > > > > > > >    EXPORT_SYMBOL(migrate_vma_pages);
> > > > > > > > > > -/*
> > > > > > > > > > - * migrate_device_finalize() - complete page migration
> > > > > > > > > > - * @src_pfns: src_pfns returned from migrate_device_range()
> > > > > > > > > > - * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> > > > > > > > > > - * @npages: number of pages in the range
> > > > > > > > > > - *
> > > > > > > > > > - * Completes migration of the page by removing special migration entries.
> > > > > > > > > > - * Drivers must ensure copying of page data is complete and visible to the CPU
> > > > > > > > > > - * before calling this.
> > > > > > > > > > - */
> > > > > > > > > > -void migrate_device_finalize(unsigned long *src_pfns,
> > > > > > > > > > -			unsigned long *dst_pfns, unsigned long npages)
> > > > > > > > > > +static void __migrate_device_finalize(unsigned long *src_pfns,
> > > > > > > > > > +				      unsigned long *dst_pfns,
> > > > > > > > > > +				      unsigned long npages,
> > > > > > > > > > +				      struct page *fault_page)
> > > > > > > > > >    {
> > > > > > > > > > +	struct folio *fault_folio = fault_page ?
> > > > > > > > > > +		page_folio(fault_page) : NULL;
> > > > > > > > > >    	unsigned long i;
> > > > > > > > > >    	for (i = 0; i < npages; i++) {
> > > > > > > > > > @@ -838,7 +842,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
> > > > > > > > > >    		src = page_folio(page);
> > > > > > > > > >    		dst = page_folio(newpage);
> > > > > > > > > >    		remove_migration_ptes(src, dst, false);
> > > > > > > > > > -		folio_unlock(src);
> > > > > > > > > > +		if (fault_folio != src)
> > > > > > > > > > +			folio_unlock(src);
> > > > > > > > > >    		if (is_zone_device_page(page))
> > > > > > > > > >    			put_page(page);
> > > > > > > > > > @@ -854,6 +859,22 @@ void migrate_device_finalize(unsigned long *src_pfns,
> > > > > > > > > >    		}
> > > > > > > > > >    	}
> > > > > > > > > >    }
> > > > > > > > > > +
> > > > > > > > > > +/*
> > > > > > > > > > + * migrate_device_finalize() - complete page migration
> > > > > > > > > > + * @src_pfns: src_pfns returned from migrate_device_range()
> > > > > > > > > > + * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> > > > > > > > > > + * @npages: number of pages in the range
> > > > > > > > > > + *
> > > > > > > > > > + * Completes migration of the page by removing special migration entries.
> > > > > > > > > > + * Drivers must ensure copying of page data is complete and visible to the CPU
> > > > > > > > > > + * before calling this.
> > > > > > > > > > + */
> > > > > > > > > > +void migrate_device_finalize(unsigned long *src_pfns,
> > > > > > > > > > +			unsigned long *dst_pfns, unsigned long npages)
> > > > > > > > > > +{
> > > > > > > > > > +	return __migrate_device_finalize(src_pfns, dst_pfns, npages, NULL);
> > > > > > > > > > +}
> > > > > > > > > >    EXPORT_SYMBOL(migrate_device_finalize);
> > > > > > > > > >    /**
> > > > > > > > > > @@ -869,7 +890,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
> > > > > > > > > >     */
> > > > > > > > > >    void migrate_vma_finalize(struct migrate_vma *migrate)
> > > > > > > > > >    {
> > > > > > > > > > -	migrate_device_finalize(migrate->src, migrate->dst, migrate->npages);
> > > > > > > > > > +	__migrate_device_finalize(migrate->src, migrate->dst, migrate->npages,
> > > > > > > > > > +				  migrate->fault_page);
> > > > > > > > > >    }
> > > > > > > > > >    EXPORT_SYMBOL(migrate_vma_finalize);
> > 
> > -- 
> > Simona Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
