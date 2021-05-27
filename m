Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DBB392F08
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 15:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775706F389;
	Thu, 27 May 2021 13:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E806F38F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 13:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622120704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4rzzOa6q+9jkHUrjBMT6aDA8TmT+khUNIgkx743Uidw=;
 b=PakWUmYMPbZK2LBR7W48JIMLknTuy4Sz3tzlJyWeCZsrup4/hnug2fTWlnOAfw9Xg+eYvK
 TEWkF7M5D0OJ2xqBYYwrOX8JsPsYXqvPfwInJFJJ1YNVR1neZJl1kNiLrddkbMOS5m8hUd
 ROBaYOWj7N0KfxtnjrjIghGRJJhbhn4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-bnMqx6mVN7aMkfrqTh8y5Q-1; Thu, 27 May 2021 09:05:00 -0400
X-MC-Unique: bnMqx6mVN7aMkfrqTh8y5Q-1
Received: by mail-qk1-f198.google.com with SMTP id
 x12-20020ae9f80c0000b02903a6a80ade45so350572qkh.22
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 06:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4rzzOa6q+9jkHUrjBMT6aDA8TmT+khUNIgkx743Uidw=;
 b=QALwX5AxdYuhYC60HjxbdRZZ60RiK0VyPeQ/0LiXsqExgYzdq+7rBox/lVYejh09rF
 0vdHCKjSiYs0zCITTNT2v9O/fVFajECmVN9Vs4vMQY32XcXNpIoePkknukspaTafhVQF
 wlg5raMlaRNz1YaPNHBUqnKG/S4G4Avfn1wXkijI2yOjuPBdku4xSqCjZqB+QGoNglHE
 gnYVjR3UCvtOSpt6oDNwT02x5UCplDOf08fb5fFmDjDqs8b0l6jE56b+oaJ5XGIam9ZQ
 66vK6Id+vtjggDTkHFu4aU7pOzmfW8KDCG9+0XpYFiOx7navEqql6NwvgFKxYHriXFEX
 1DIQ==
X-Gm-Message-State: AOAM532el4njIFcnBP3KUMRW3V+ezAcYBfzHdO75K5x4hebC554LGMZa
 jhF7Vm+MhMrJRSLG9zXuK45EWatRT7ZVyL0oKtf9KgOIfIK/aYG/7rI9T27gtYIZBkjWwZgirgy
 eJWuuO+IddgT4GnI+GHXPPHc6ifx9
X-Received: by 2002:ac8:5f84:: with SMTP id j4mr2991622qta.240.1622120700036; 
 Thu, 27 May 2021 06:05:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzF9/f/oCcd+BBWrvSHgnJ7MXTSn158rInAQdiALMQLZF3k9Vcpr9xEm1OHlKUAk1TCJw9rGQ==
X-Received: by 2002:ac8:5f84:: with SMTP id j4mr2991568qta.240.1622120699489; 
 Thu, 27 May 2021 06:04:59 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id p63sm1325517qkf.31.2021.05.27.06.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 06:04:58 -0700 (PDT)
Date: Thu, 27 May 2021 09:04:57 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v9 07/10] mm: Device exclusive memory access
Message-ID: <YK+Y+aAZHDv8+w+Q@t490s>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <20210524132725.12697-8-apopple@nvidia.com>
 <YK6hYGEx+XzeZELV@t490s> <37725705.JvxlXkkoz5@nvdebian>
MIME-Version: 1.0
In-Reply-To: <37725705.JvxlXkkoz5@nvdebian>
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
 nouveau@lists.freedesktop.org, bsingharora@gmail.com, hughd@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 jgg@nvidia.com, jhubbard@nvidia.com, akpm@linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 27, 2021 at 01:35:39PM +1000, Alistair Popple wrote:
> > > + *
> > > + * @MMU_NOTIFY_EXCLUSIVE: to signal a device driver that the device will
> > > no + * longer have exclusive access to the page. May ignore the
> > > invalidation that's + * part of make_device_exclusive_range() if the
> > > owner field
> > > + * matches the value passed to make_device_exclusive_range().
> > 
> > Perhaps s/matches/does not match/?
> 
> No, "matches" is correct. The MMU_NOTIFY_EXCLUSIVE notifier is to notify a 
> listener that a range is being invalidated for the purpose of making the range 
> available for some device to have exclusive access to. Which does also mean a 
> device getting the notification no longer has exclusive access if it already 
> did.
> 
> A unique type is needed because when creating the range a driver needs to form 
> a mmu critical section (with mmu_interval_read_begin()/
> mmu_interval_read_end()) to ensure the entry remains valid long enough to 
> program the device pte and hasn't been invalidated.
> 
> However without a way of filtering any invalidations will result in a retry, 
> but make_device_exclusive_range() needs to do an invalidation during 
> installation of the entry. To avoid this causing infinite retries the driver 
> ignores specific invalidation events that it knows don't apply, ie. the 
> invalidations that are a result of that driver asking for device exclusive 
> entries.

OK I think I get it now.. so the driver checks both EXCLUSIVE and owner, if all
match it skips the notify, otherwise it's treated like all the rest.  Thanks.

However then it's still confusing (as I raised it too in previous comment) that
we use CLEAR when re-installing the valid pte.  It's merely against what CLEAR
means.

How about sending EXCLUSIVE for both mark/restore?  Just that when restore we
notify with owner==NULL telling that no one is owning it anymore so driver
needs to drop the ownership.  I assume your driver patch does not need change
too.  Would that be much cleaner than CLEAR?  I bet it also makes commenting
the new notify easier.

What do you think?

[...]

> > > +                                   vma->vm_mm, address, min(vma->vm_end,
> > > +                                   address + page_size(page)),
> > > args->owner); +     mmu_notifier_invalidate_range_start(&range);
> > > +
> > > +     while (page_vma_mapped_walk(&pvmw)) {
> > > +             /* Unexpected PMD-mapped THP? */
> > > +             VM_BUG_ON_PAGE(!pvmw.pte, page);
> > > +
> > > +             if (!pte_present(*pvmw.pte)) {
> > > +                     ret = false;
> > > +                     page_vma_mapped_walk_done(&pvmw);
> > > +                     break;
> > > +             }
> > > +
> > > +             subpage = page - page_to_pfn(page) + pte_pfn(*pvmw.pte);
> > 
> > I see that all pages passed in should be done after FOLL_SPLIT_PMD, so is
> > this needed?  Or say, should subpage==page always be true?
> 
> Not always, in the case of a thp there are small ptes which will get device 
> exclusive entries.

FOLL_SPLIT_PMD will first split the huge thp into smaller pages, then do
follow_page_pte() on them (in follow_pmd_mask):

	if (flags & FOLL_SPLIT_PMD) {
		int ret;
		page = pmd_page(*pmd);
		if (is_huge_zero_page(page)) {
			spin_unlock(ptl);
			ret = 0;
			split_huge_pmd(vma, pmd, address);
			if (pmd_trans_unstable(pmd))
				ret = -EBUSY;
		} else {
			spin_unlock(ptl);
			split_huge_pmd(vma, pmd, address);
			ret = pte_alloc(mm, pmd) ? -ENOMEM : 0;
		}

		return ret ? ERR_PTR(ret) :
			follow_page_pte(vma, address, pmd, flags, &ctx->pgmap);
	}

So I thought all pages are small pages?

-- 
Peter Xu

