Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C8D3A4498
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 17:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38CB36EE99;
	Fri, 11 Jun 2021 15:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D9C6EE99
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 15:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623423706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OnHkU06l/k9wqE171qbYza/gsqJMIJabflSWwwk6QCA=;
 b=SgGvlyoRLSReJfIWYY3tG+iIbWCSPizRX8QW7cQV6dovTnwKLEdpo3uqSEvVylCr+hVmA9
 wq6CoOL7hvjt6ThHep+H3I0R/INtlLe4ncl8eAYDRSDAs/JCgUPKvVhC1jxVPsG+2yHQEt
 ms1MjavzcRupviICNbsECG2us+cG+9s=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-s5wfyybDOJqhJU_-6MWrpQ-1; Fri, 11 Jun 2021 11:01:45 -0400
X-MC-Unique: s5wfyybDOJqhJU_-6MWrpQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 i16-20020a0cf4900000b029022023514900so18188230qvm.11
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 08:01:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OnHkU06l/k9wqE171qbYza/gsqJMIJabflSWwwk6QCA=;
 b=qKFjoMECNbPbMM1fdvkQcxZUcegPz1ELRMGRtbv92YVhTznos4VSFKXBHR/r55z8vi
 wdS5IlsmE+hGtIUUnitl2guq/SWrVkRGQDaR8LTl3+XTy/aXQDAESb7qv4/uXtR0qpkE
 k5ic0YEOwxUgEM82ZfJvh1EyASG/p6ZiC04+vuF5xmaVxxfepSRx08q4+Ps2vpW4wAN4
 LwrRuhkeL9nB982Sjm2bRbGZfwdz5ha2zls39UJ2mjcZ4AVb4uBN0X2UU6MSou4hpX5X
 Jw1ws37hyJ3+Y2UlEwzijzciuWVz+hKPNwLfAGlc52oVRIQFHzPh23VfMJPRdKc+K/jn
 cCgA==
X-Gm-Message-State: AOAM532C/veZEAWKs71pO87B3YTnDP3WxtoYat3OmyC+VPC8nYs/hj2g
 3fCNHwmwaDSug0lqTFz8WNa1A7WofEDVsdVz9ZA+F8QCOktgOMeK6/JmskH6JczDqvNlBuYgA32
 gb+LQlKWpT7x5pV6MuGjXVz6LKEri
X-Received: by 2002:a37:8386:: with SMTP id f128mr4219549qkd.444.1623423705005; 
 Fri, 11 Jun 2021 08:01:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3GP6mxnvgz/ji/Vdupp827CjyJe5ajZSxAoIX/qzD3GyPBxndeXi6Wj8jInFNFCm6D45jvw==
X-Received: by 2002:a37:8386:: with SMTP id f128mr4219525qkd.444.1623423704690; 
 Fri, 11 Jun 2021 08:01:44 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-88-174-93-75-200.dsl.bell.ca.
 [174.93.75.200])
 by smtp.gmail.com with ESMTPSA id j65sm4621527qkd.17.2021.06.11.08.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 08:01:44 -0700 (PDT)
Date: Fri, 11 Jun 2021 11:01:42 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v10 07/10] mm: Device exclusive memory access
Message-ID: <YMN61r0wdg88OM8r@t490s>
References: <20210607075855.5084-1-apopple@nvidia.com>
 <4307769.9k6FjFFxS5@nvdebian> <YMK1snSH9q4Wkyq+@t490s>
 <2683185.ETRjo6vMkr@nvdebian>
MIME-Version: 1.0
In-Reply-To: <2683185.ETRjo6vMkr@nvdebian>
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

On Fri, Jun 11, 2021 at 01:43:20PM +1000, Alistair Popple wrote:
> On Friday, 11 June 2021 11:00:34 AM AEST Peter Xu wrote:
> > On Fri, Jun 11, 2021 at 09:17:14AM +1000, Alistair Popple wrote:
> > > On Friday, 11 June 2021 9:04:19 AM AEST Peter Xu wrote:
> > > > On Fri, Jun 11, 2021 at 12:21:26AM +1000, Alistair Popple wrote:
> > > > > > Hmm, the thing is.. to me FOLL_SPLIT_PMD should have similar effect to explicit
> > > > > > call split_huge_pmd_address(), afaict.  Since both of them use __split_huge_pmd()
> > > > > > internally which will generate that unwanted CLEAR notify.
> > > > >
> > > > > Agree that gup calls __split_huge_pmd() via split_huge_pmd_address()
> > > > > which will always CLEAR. However gup only calls split_huge_pmd_address() if it
> > > > > finds a thp pmd. In follow_pmd_mask() we have:
> > > > >
> > > > >       if (likely(!pmd_trans_huge(pmdval)))
> > > > >               return follow_page_pte(vma, address, pmd, flags, &ctx->pgmap);
> > > > >
> > > > > So I don't think we have a problem here.
> > > >
> > > > Sorry I didn't follow here..  We do FOLL_SPLIT_PMD after this check, right?  I
> > > > mean, if it's a thp for the current mm, afaict pmd_trans_huge() should return
> > > > true above, so we'll skip follow_page_pte(); then we'll check FOLL_SPLIT_PMD
> > > > and do the split, then the CLEAR notify.  Hmm.. Did I miss something?
> > >
> > > That seems correct - if the thp is not mapped with a pmd we won't split and we
> > > won't CLEAR. If there is a thp pmd we will split and CLEAR, but in that case it
> > > is fine - we will retry, but the retry will won't CLEAR because the pmd has
> > > already been split.
> > 
> > Aha!
> > 
> > >
> > > The issue arises with doing it unconditionally in make device exclusive is that
> > > you *always* CLEAR even if there is no thp pmd to split. Or at least that's my
> > > understanding, please let me know if it doesn't make sense.
> > 
> > Exactly.  But if you see what I meant here, even if it can work like this, it
> > sounds still fragile, isn't it?  I just feel something is slightly off there..
> > 
> > IMHO split_huge_pmd() checked pmd before calling __split_huge_pmd() for
> > performance, afaict, because if it's not a thp even without locking, then it
> > won't be, so further __split_huge_pmd() is not necessary.
> > 
> > IOW, it's very legal if someday we'd like to let split_huge_pmd() call
> > __split_huge_pmd() directly, then AFAIU device exclusive API will be the 1st
> > one to be broken with that seems-to-be-irrelevant change I'm afraid..
> 
> Well I would argue the performance of memory notifiers is becoming increasingly
> important, and a change that causes them to be called unnecessarily is
> therefore not very legal. Likely the correct fix here is to optimise
> __split_huge_pmd() to only call the notifier if it's actually going to split a
> pmd. As you said though that's a completely different story which I think would
> be best done as a separate series.

Right, maybe I can look a bit more into that later; but my whole point was to
express that one functionality shouldn't depend on such a trivial detail of
implementation of other modules (thp split in this case).

> 
> > This lets me goes back a step to think about why do we need this notifier at
> > all to cover this whole range of make_device_exclusive() procedure..
> > 
> > What I am thinking is, we're afraid some CPU accesses this page so the pte got
> > quickly restored when device atomic operation is carrying on.  Then with this
> > notifier we'll be able to cancel it.  Makes perfect sense.
> > 
> > However do we really need to register this notifier so early?  The thing is the
> > GPU driver still has all the page locks, so even if there's a race to restore
> > the ptes, they'll block at taking the page lock until the driver releases it.
> > 
> > IOW, I'm wondering whether the "non-fragile" way to do this is not do
> > mmu_interval_notifier_insert() that early: what if we register that notifier
> > after make_device_exclusive_range() returns but before page_unlock() somehow?
> > So before page_unlock(), race is protected fully by the lock itself; after
> > that, it's done by mmu notifier.  Then maybe we don't need to worry about all
> > these notifications during marking exclusive (while we shouldn't)?
> 
> The notifier is needed to protect against races with pte changes. Once a page
> has been marked for exclusive access the driver will update it's page tables to
> allow atomic access to the page. However in the meantime the page could become
> unmapped entirely or write protected.
> 
> As I understand things the page lock won't protect against these kind of pte
> changes, hence the need for mmu_interval_read_begin/retry which allows the
> driver to hold a mutex protecting against invalidations via blocking the
> notifier until the device page tables have been updated.

Indeed, I suppose you mean change_pte_range() and zap_pte_range()
correspondingly.

Do you think we can restore pte right before wr-protect or zap?  Then all
things serializes with page lock (btw: it's already an insane userspace to
either unmap a page or wr-protect a page if it knows the device is using it!).
If these are the only two cases, it still sounds a cleaner approach to me than
the current approach.

This also reminded me that right now the cpu pgtable recovery is lazy - it
happens either from fork() or a cpu page fault.  Even after device finished
using it, swap ptes keep there.

What if the device tries to do atomic op on the same page twice?  I am not sure
whether it means we may also want to teach both GUP (majorly follow_page_pte()
for now before pmd support) and process of page_make_device_exclusive() with
understanding the device exclusive entries too?  Another option seems to be
restoring pte after device finish using it, as long as the device knows when.

-- 
Peter Xu

