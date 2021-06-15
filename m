Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3063A8662
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 18:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7DB6E45D;
	Tue, 15 Jun 2021 16:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5656E44D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 16:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623774315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5TJCPjEidVWzxkM0+NmjXZOz7EQ71DB13hrYr+2WF6U=;
 b=g/W9JDLxEuNXopyFXhMo6M+dEocDs0VVwdcVe/fFCKmPfhadPJLJb4W3OTtecgqALwRpRC
 kYWYepJYFSMrhqhGOjc4p2LGuHnWbXC+ZLhii91dbPlKKD3jCiGI+lO9+aQ3SumGSX3Lgv
 4yxYo/U61iFonQDhDFJwdCbF9zqqHEc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-baFDdCvJPnOkIvDcZK2mQA-1; Tue, 15 Jun 2021 12:25:12 -0400
X-MC-Unique: baFDdCvJPnOkIvDcZK2mQA-1
Received: by mail-qv1-f72.google.com with SMTP id
 r8-20020a0562140c88b0290242bf8596feso10518265qvr.8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 09:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5TJCPjEidVWzxkM0+NmjXZOz7EQ71DB13hrYr+2WF6U=;
 b=p/qh76KWd/6Wrtv6JGXMnGq0rKkr0ZoXPTs1VvurWdF8Z+ajFqnKPL/joXYEk7BIkX
 dlAd8zxjPY69V/sjjeBliJgqKplGkW3+FSUGu2Dj3p8260VGzavMk4X2IW+fbbF+Jlb3
 dAhXjFVhoW2DMJoD3hEMGEvI/v5Hlj1eo1W6UZK8j9sQS/JA6y/7Y8CxqBTFfrw/Gz3p
 NmVNl2HPhyVhQ/KXdatWi0raxeB2paNIFC1wSZIivNmFGGRWucqdBmlBitSrEexssNxV
 gxVTyEPMMif9DfISWn0a93yvQpNxpuuAstRG95FV1QBiOrn4Nb8byklwyaTTeaNeYRuE
 clzQ==
X-Gm-Message-State: AOAM533cc4vaw5T+JpFHSyqmRZXZtDSq6IclvqTsDI6KO33nhbMSB6p1
 kv0HT3zGJBRkeBvwDA/Zv+VSkTfqqqMD2i3gFGGLK/L8eoDQijbAUTV2bpkUfsO3Q1JCXlwrquw
 I/AUzd9i3Ohk6iZnqYXYynW9ASJWL
X-Received: by 2002:a37:89c5:: with SMTP id l188mr456257qkd.27.1623774311943; 
 Tue, 15 Jun 2021 09:25:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKREFaGIRhGK50fieBbGZSTbD+JCw3YRoqFGroI7qv0zKzfl/OIsNnSOlBkjagcoRStXPh/Q==
X-Received: by 2002:a37:89c5:: with SMTP id l188mr456219qkd.27.1623774311607; 
 Tue, 15 Jun 2021 09:25:11 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id n9sm6484913qke.8.2021.06.15.09.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 09:25:10 -0700 (PDT)
Date: Tue, 15 Jun 2021 12:25:09 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v10 07/10] mm: Device exclusive memory access
Message-ID: <YMjUZX8Sy0PuPt6j@t490s>
References: <20210607075855.5084-1-apopple@nvidia.com>
 <2683185.ETRjo6vMkr@nvdebian> <YMN61r0wdg88OM8r@t490s>
 <7383392.6iZ9WBDLDo@nvdebian>
MIME-Version: 1.0
In-Reply-To: <7383392.6iZ9WBDLDo@nvdebian>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

On Tue, Jun 15, 2021 at 01:08:11PM +1000, Alistair Popple wrote:
> On Saturday, 12 June 2021 1:01:42 AM AEST Peter Xu wrote:
> > On Fri, Jun 11, 2021 at 01:43:20PM +1000, Alistair Popple wrote:
> > > On Friday, 11 June 2021 11:00:34 AM AEST Peter Xu wrote:
> > > > On Fri, Jun 11, 2021 at 09:17:14AM +1000, Alistair Popple wrote:
> > > > > On Friday, 11 June 2021 9:04:19 AM AEST Peter Xu wrote:
> > > > > > On Fri, Jun 11, 2021 at 12:21:26AM +1000, Alistair Popple wrote:
> > > > > > > > Hmm, the thing is.. to me FOLL_SPLIT_PMD should have similar effect to explicit
> > > > > > > > call split_huge_pmd_address(), afaict.  Since both of them use __split_huge_pmd()
> > > > > > > > internally which will generate that unwanted CLEAR notify.
> > > > > > >
> > > > > > > Agree that gup calls __split_huge_pmd() via split_huge_pmd_address()
> > > > > > > which will always CLEAR. However gup only calls split_huge_pmd_address() if it
> > > > > > > finds a thp pmd. In follow_pmd_mask() we have:
> > > > > > >
> > > > > > >       if (likely(!pmd_trans_huge(pmdval)))
> > > > > > >               return follow_page_pte(vma, address, pmd, flags, &ctx->pgmap);
> > > > > > >
> > > > > > > So I don't think we have a problem here.
> > > > > >
> > > > > > Sorry I didn't follow here..  We do FOLL_SPLIT_PMD after this check, right?  I
> > > > > > mean, if it's a thp for the current mm, afaict pmd_trans_huge() should return
> > > > > > true above, so we'll skip follow_page_pte(); then we'll check FOLL_SPLIT_PMD
> > > > > > and do the split, then the CLEAR notify.  Hmm.. Did I miss something?
> > > > >
> > > > > That seems correct - if the thp is not mapped with a pmd we won't split and we
> > > > > won't CLEAR. If there is a thp pmd we will split and CLEAR, but in that case it
> > > > > is fine - we will retry, but the retry will won't CLEAR because the pmd has
> > > > > already been split.
> > > >
> > > > Aha!
> > > >
> > > > >
> > > > > The issue arises with doing it unconditionally in make device exclusive is that
> > > > > you *always* CLEAR even if there is no thp pmd to split. Or at least that's my
> > > > > understanding, please let me know if it doesn't make sense.
> > > >
> > > > Exactly.  But if you see what I meant here, even if it can work like this, it
> > > > sounds still fragile, isn't it?  I just feel something is slightly off there..
> > > >
> > > > IMHO split_huge_pmd() checked pmd before calling __split_huge_pmd() for
> > > > performance, afaict, because if it's not a thp even without locking, then it
> > > > won't be, so further __split_huge_pmd() is not necessary.
> > > >
> > > > IOW, it's very legal if someday we'd like to let split_huge_pmd() call
> > > > __split_huge_pmd() directly, then AFAIU device exclusive API will be the 1st
> > > > one to be broken with that seems-to-be-irrelevant change I'm afraid..
> > >
> > > Well I would argue the performance of memory notifiers is becoming increasingly
> > > important, and a change that causes them to be called unnecessarily is
> > > therefore not very legal. Likely the correct fix here is to optimise
> > > __split_huge_pmd() to only call the notifier if it's actually going to split a
> > > pmd. As you said though that's a completely different story which I think would
> > > be best done as a separate series.
> > 
> > Right, maybe I can look a bit more into that later; but my whole point was to
> > express that one functionality shouldn't depend on such a trivial detail of
> > implementation of other modules (thp split in this case).
> > 
> > >
> > > > This lets me goes back a step to think about why do we need this notifier at
> > > > all to cover this whole range of make_device_exclusive() procedure..
> > > >
> > > > What I am thinking is, we're afraid some CPU accesses this page so the pte got
> > > > quickly restored when device atomic operation is carrying on.  Then with this
> > > > notifier we'll be able to cancel it.  Makes perfect sense.
> > > >
> > > > However do we really need to register this notifier so early?  The thing is the
> > > > GPU driver still has all the page locks, so even if there's a race to restore
> > > > the ptes, they'll block at taking the page lock until the driver releases it.
> > > >
> > > > IOW, I'm wondering whether the "non-fragile" way to do this is not do
> > > > mmu_interval_notifier_insert() that early: what if we register that notifier
> > > > after make_device_exclusive_range() returns but before page_unlock() somehow?
> > > > So before page_unlock(), race is protected fully by the lock itself; after
> > > > that, it's done by mmu notifier.  Then maybe we don't need to worry about all
> > > > these notifications during marking exclusive (while we shouldn't)?
> > >
> > > The notifier is needed to protect against races with pte changes. Once a page
> > > has been marked for exclusive access the driver will update it's page tables to
> > > allow atomic access to the page. However in the meantime the page could become
> > > unmapped entirely or write protected.
> > >
> > > As I understand things the page lock won't protect against these kind of pte
> > > changes, hence the need for mmu_interval_read_begin/retry which allows the
> > > driver to hold a mutex protecting against invalidations via blocking the
> > > notifier until the device page tables have been updated.
> > 
> > Indeed, I suppose you mean change_pte_range() and zap_pte_range()
> > correspondingly.
> 
> Right.
> 
> > Do you think we can restore pte right before wr-protect or zap?  Then all
> > things serializes with page lock (btw: it's already an insane userspace to
> > either unmap a page or wr-protect a page if it knows the device is using it!).
> > If these are the only two cases, it still sounds a cleaner approach to me than
> > the current approach.
> 
> Perhaps we could but it would make {zap|change}_pte_range() much more complex as
> we can't sleep taking the page lock whilst holding the ptl, so we'd have to
> implement a retry scheme similar to copy_pte_range() in both those functions as
> well.

Yes, but shouldn't be hard to do so, imho. E.g., see when __tlb_remove_page()
returns true in zap_pte_range(), so we already did something like that.  IMHO
it's not uncommon to have such facilities as we do have requirements to sleep
during a spinlock critical section for a lot of places in mm, so we release
them when needed and retake.

> Given mmu_interval_read_begin/retry was IMHO added to solve this type of
> problem (freezing pte's to safely program device pte's) it seems like the
> better option rather than adding more complex code to generic mm paths.
> 
> It's also worth noting i915 seems to use mmu_interval_read_begin/retry() with
> gup to sync mappings so this isn't an entirely new concept. I'm not an expert
> in that driver but I imagine changing gup to generate unconditional mmu notifier
> invalidates would also cause issues there. So I think overall this is the
> cleanest solution as it reduces the amount of code (particularly in generic mm
> paths).

I could be wrong somewhere, but to me depending on mmu notifiers being
"accurate" in general is fragile..

Take an example of change_pte_range(), which will generate PROTECTION_VMA
notifies.  Let's imaging an userspace calls mprotect() e.g. twice or even more
times with the same PROT_* and upon the same region, we know very possibly the
2nd,3rd,... calls will generate those notifies with totally no change to the
pgtable at all as they're all done on the 1st shot.  However we'll generate mmu
notifies anyways for the 2nd,3rd,... calls.  It means mmu notifiers should
really be tolerant of false positives as it does happen, and such thing can be
triggered even from userspace system calls very easily like this.  That's why I
think any kernel facility that depends on mmu notifiers being accurate is
probably not the right approach..

But yeah as you said I think it's working as is with the series (I think the
follow_pmd_mask() checking pmd_trans_huge before calling split_huge_pmd is a
double safety-net for it, so even if the GUP split_huge_pmd got replaced with
__split_huge_pmd it should still work with the one-retry logic), not sure
whether it matters a lot, as it's not common mm path; I think I'll step back so
Andrew could still pick it up as wish, I'm just still not fully convinced it's
the best solution to have for a long term to depend on that..

> 
> > This also reminded me that right now the cpu pgtable recovery is lazy - it
> > happens either from fork() or a cpu page fault.  Even after device finished
> > using it, swap ptes keep there.
> > 
> > What if the device tries to do atomic op on the same page twice?  I am not sure
> > whether it means we may also want to teach both GUP (majorly follow_page_pte()
> > for now before pmd support) and process of page_make_device_exclusive() with
> > understanding the device exclusive entries too?  Another option seems to be
> > restoring pte after device finish using it, as long as the device knows when.
> 
> I don't think we need to complicate follow_page_pte() with knowledge of
> exclusive entries. GUP will just restore the original pte via the normal
> fault path - follow_page_pte() will return NULL for an exclusive entry,
> resulting in handle_mm_path() getting called via faultin_page(). Therefore
> a driver calling make_device_exclusive() twice on the same page won't cause an
> issue. Also the device shouldn't fault on subsequent accesses if the exclusive
> entry is still in place anyway.

Right, looks good then.

> 
> We can't restore the pte when the device is finished with it because there is
> no way of knowing when a device is done using an exclusive entry - device
> pte's work much the same as cpu pte's in that regard.

I see, I feel like I understand how it works slightly better now, thanks.

One last pure question: I see nouveau_atomic_range_fault() will call the other
nvif_object_ioctl() which seems to do the device pgtable mapping, am I right?
Then I see the notifier is quickly removed before nouveau_atomic_range_fault()
returns.  What happens if CPU access happens after mmu notifier removed?  Or is
it not possible to happen?

-- 
Peter Xu

