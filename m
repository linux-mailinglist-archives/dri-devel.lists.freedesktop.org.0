Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 674512A2238
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 23:50:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F3F86E0EB;
	Sun,  1 Nov 2020 22:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95AF6E0E9
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 22:50:51 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id x1so12829935oic.13
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Nov 2020 14:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pdhVdjH4UPXfNm2B9wz97S0y5FEVQjORqgP/hjfyELk=;
 b=N+FiI/TjB17uuMEjHbtlYgfqr67JyvQdfUvENJ6Tu9jgBnhFksgVI1B1bSh4kayrlc
 ut6ADQ25S61GZ7vGAGY+cV2a5rpDcSxW44xIcpssZsKP1W1mHWMm/Pb2C49fCbray3L7
 bv5W7Xj5Yp8/jFpRQKu1Kh5gGZ+2VffeRzJpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pdhVdjH4UPXfNm2B9wz97S0y5FEVQjORqgP/hjfyELk=;
 b=MMb8uFRBha/gKkEoMzWsi8w7PZcK8oaNaQw1/VpV8GPRtOQQu5KQZTD2kjKMzm0hjO
 ckxD/USmLoetJF1wPbnfEfjH2Bu3B8HTo8atgWzxEMilGuUBCo5q83ludW1ktoSDDPZh
 dD7tqOMJfHMkTgujTLs+ShuoiI2W1r8637FBCHJvrrEHd5RFI0OIpumcXSc67wNdVZig
 r0dBZ5ygvBjMK9qKzWm9DUkDvAZ2yNuLkkUY3FQgWtwlRGjwZAulQ5yW4icNmkDNgMns
 SiJuLiqv48e/nj+s/UGABbo0RAlXDoyYFiasaB88PXmuqaH5X8WPsq1WFR5HE+VVSZFS
 AULw==
X-Gm-Message-State: AOAM533gMvl6Z2BHtBPXHxozj2sjX0ctLyzdIQhPWNdMA0Q3GRLRj9C5
 QTVK+xgMVjQ6MT1ODkkAfRbRm1+eKkd9vFYqabHe0w==
X-Google-Smtp-Source: ABdhPJzLb78IT0nCdkmIC7PYQ65zXPZF00BPjYDjAoRd2daX4skiLxKATnZB8c9mfKicLLzXjreG8SL3MgC9cv5xaZU=
X-Received: by 2002:aca:b141:: with SMTP id a62mr7775906oif.101.1604271050682; 
 Sun, 01 Nov 2020 14:50:50 -0800 (PST)
MIME-Version: 1.0
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
 <20201030100815.2269-6-daniel.vetter@ffwll.ch>
 <446b2d5b-a1a1-a408-f884-f17a04b72c18@nvidia.com>
 <CAKMK7uGDW2f0oOvwgryCHxQFHyh3Tsk6ENsMGmtZ-EnH57tMSA@mail.gmail.com>
 <1f7cf690-35e2-c56f-6d3f-94400633edd2@nvidia.com>
 <CAKMK7uFYDSqnNp_xpohzCEidw_iLufNSoX4v55sNZj-nwTckSg@mail.gmail.com>
 <7f29a42a-c408-525d-90b7-ef3c12b5826c@nvidia.com>
In-Reply-To: <7f29a42a-c408-525d-90b7-ef3c12b5826c@nvidia.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Sun, 1 Nov 2020 23:50:39 +0100
Message-ID: <CAKMK7uEw701AWXNJbRNM8Z+FkyUB5FbWegmSzyWPy9cG4W7OLA@mail.gmail.com>
Subject: Re: [PATCH v5 05/15] mm/frame-vector: Use FOLL_LONGTERM
To: John Hubbard <jhubbard@nvidia.com>
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
Cc: =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Pawel Osciak <pawel@osciak.com>, KVM list <kvm@vger.kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Linux MM <linux-mm@kvack.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 1, 2020 at 10:13 PM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 11/1/20 2:30 AM, Daniel Vetter wrote:
> > On Sun, Nov 1, 2020 at 6:22 AM John Hubbard <jhubbard@nvidia.com> wrote:
> >>
> >> On 10/31/20 7:45 AM, Daniel Vetter wrote:
> >>> On Sat, Oct 31, 2020 at 3:55 AM John Hubbard <jhubbard@nvidia.com> wrote:
> >>>> On 10/30/20 3:08 AM, Daniel Vetter wrote:
> >> ...
> >>>> By removing this check from this location, and changing from
> >>>> pin_user_pages_locked() to pin_user_pages_fast(), I *think* we end up
> >>>> losing the check entirely. Is that intended? If so it could use a comment
> >>>> somewhere to explain why.
> >>>
> >>> Yeah this wasn't intentional. I think I needed to drop the _locked
> >>> version to prep for FOLL_LONGTERM, and figured _fast is always better.
> >>> But I didn't realize that _fast doesn't have the vma checks, gup.c got
> >>> me a bit confused.
> >>
> >> Actually, I thought that the change to _fast was a very nice touch, btw.
> >>
> >>>
> >>> I'll remedy this in all the patches where this applies (because a
> >>> VM_IO | VM_PFNMAP can point at struct page backed memory, and that
> >>> exact use-case is what we want to stop with the unsafe_follow_pfn work
> >>> since it wreaks things like cma or security).
> >>>
> >>> Aside: I do wonder whether the lack for that check isn't a problem.
> >>> VM_IO | VM_PFNMAP generally means driver managed, which means the
> >>> driver isn't going to consult the page pin count or anything like that
> >>> (at least not necessarily) when revoking or moving that memory, since
> >>> we're assuming it's totally under driver control. So if pup_fast can
> >>> get into such a mapping, we might have a problem.
> >>> -Daniel
> >>>
> >>
> >> Yes. I don't know why that check is missing from the _fast path.
> >> Probably just an oversight, seeing as how it's in the slow path. Maybe
> >> the appropriate response here is to add a separate patch that adds the
> >> check.
> >>
> >> I wonder if I'm overlooking something, but it certainly seems correct to
> >> do that.
> >
> > You'll need the mmap_sem to get at the vma to be able to do this
> > check. If you add that to _fast, you made it as fast as the slow one.
>
> Arggh, yes of course. Strike that, please. :)
>
> > Plus there's _fast_only due to locking recurion issues in fast-paths
> > (I assume, I didn't check all the callers).
> >
> > I'm just wondering whether we have a bug somewhere with device
> > drivers. For CMA regions we always check in try_grab_page, but for dax
>
> OK, so here you're talking about a different bug than the VM_IO | VM_PFNMAP
> pages, I think. This is about the "FOLL_LONGTERM + CMA + gup/pup _fast"
> combination that is not allowed, right?

Yeah sorry, I got distracted reading code and noticed we might have
another issue.

> For that: try_grab_page() doesn't check anything, but try_grab_compound_head()
> does, but only for pup_fast, not gup_fast. That was added by commit
> df3a0a21b698d ("mm/gup: fix omission of check on FOLL_LONGTERM in gup fast
> path") in April.
>
> I recall that the patch was just plugging a very specific hole, as opposed
> to locking down the API against mistakes or confused callers. And it does
> seem that there are some holes.

Yup that's the one I've found.

> > I'm not seeing where the checks in the _fast fastpaths are, and that
> > all still leaves random device driver mappings behind which aren't
> > backed by CMA but still point to something with a struct page behind
> > it. I'm probably just missing something, but no idea what.
> > -Daniel
> >
>
> Certainly we've established that we can't check VMA flags by that time,
> so I'm not sure that there is much we can check by the time we get to
> gup/pup _fast. Seems like the device drivers have to avoid calling _fast
> with pages that live in VM_IO | VM_PFNMAP, by design, right? Or maybe
> you're talking about CMA checks only?

It's not device drivers, but everyone else. At least my understanding
is that VM_IO | VM_PFNMAP means "even if it happens to be backed by a
struct page, do not treat it like normal memory". And gup/pup_fast
happily break that. I tried to chase the history of that test, didn't
turn up anything I understood much:

commit 1ff8038988adecfde71d82c0597727fc239d4e8c
Author: Linus Torvalds <torvalds@g5.osdl.org>
Date:   Mon Dec 12 16:24:33 2005 -0800

   get_user_pages: don't try to follow PFNMAP pages

   Nick Piggin points out that a few drivers play games with VM_IO (why?
   who knows..) and thus a pfn-remapped area may not have that bit set even
   if remap_pfn_range() set it originally.

   So make it explicit in get_user_pages() that we don't follow VM_PFNMAP
   pages, since pretty much by definition they do not have a "struct page"
   associated with them.

   Signed-off-by: Linus Torvalds <torvalds@osdl.org>

diff --git a/mm/memory.c b/mm/memory.c
index 47c533eaa072..d22f78c8a381 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1009,7 +1009,7 @@ int get_user_pages(struct task_struct *tsk,
struct mm_struct *mm,
                       continue;
               }

-               if (!vma || (vma->vm_flags & VM_IO)
+               if (!vma || (vma->vm_flags & (VM_IO | VM_PFNMAP))
                               || !(vm_flags & vma->vm_flags))
                       return i ? : -EFAULT;


The VM_IO check is kinda lost in pre-history.

tbh I have no idea what the various variants of pup/gup are supposed
to be doing vs. these VMA flags in the various cases. Just smells a
bit like potential trouble due to randomly pinning stuff without the
owner of that memory having an idea what's going on.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
