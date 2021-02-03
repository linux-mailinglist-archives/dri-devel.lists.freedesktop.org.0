Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6933F30E4E7
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 22:25:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD546EBFD;
	Wed,  3 Feb 2021 21:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC876EBFD
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 21:25:24 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id i20so1299883otl.7
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 13:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iZMC9aBcPlgaxRBYNOkc0uhviDBibZJkuU/B+Oy0jvs=;
 b=UfW064ti1wei0HSqGSWiNnLG6DFOWhizy1OMtq7YsgHPJUjNLJgQ3sD4Vfdo5jzZo6
 ys04/M39ejGkJ1cVhVSxCIcJ1u6TVVTWmaejIGK/MXCRCkzyKQOpSte/rAMoBCaEAFVM
 6FioN/ovomgPGZLBTDyHkuS4snoyUmUkC8rOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iZMC9aBcPlgaxRBYNOkc0uhviDBibZJkuU/B+Oy0jvs=;
 b=R39+vozJxwD7LiISjyjtkBn4XJx/ID/C9PN1nV7BzL9jaG61gmwk9833MvTVBbozpD
 0E2Ig6xAkXGoHz0OZRB3rNgG2k8g/PYBBvqifdNosoCRG4jX9WhKCNSljdsx+8nPwDCq
 Mlr1w6ONUy81vrW40cfTbzEhj13+YAeQ8nKRJlNrqLjY7nBibhKCWR9H9B4ccHFcENGB
 AH3a5XK4xWiTnjW8xnu3SIHVsdkpQeSo91zvR77sh1mftPBUZQxOoQ3Ml71PmgWrogre
 c7YCiLs65Yi3wICLAqalMSOLMIRrVE0SOGI3XsS2WQBhpjvUCA7+M2lnmL2NWcDS11Os
 Kwpw==
X-Gm-Message-State: AOAM533sP4wImcPNbrDU3LB1BRAQq68L72NgXeQtvM76hmXbbZHsX0ED
 8FUGGHmchMBunCjtJUg+4lOdv/Q+VTLVgk686WJlyg==
X-Google-Smtp-Source: ABdhPJyeyn1ayHYYRh5/JJcIY/+l0YzWXziRkV8RSQ+9BR+8vImNPQYSnTETeFgdBKs6kdQJIsa6PUWdvh/NnD62vdI=
X-Received: by 2002:a9d:b85:: with SMTP id 5mr3433355oth.281.1612387523565;
 Wed, 03 Feb 2021 13:25:23 -0800 (PST)
MIME-Version: 1.0
References: <20210203003134.2422308-1-surenb@google.com>
 <20210203015553.GX308988@casper.infradead.org>
 <CAKMK7uHnNdjOYX5Rhj=uGMz7hSz12JhgkZJCfiqgkpjXnMfL4A@mail.gmail.com>
 <CAJuCfpG4GkVbeW=bB+Qrm5GPrZAwg0_rmyG05iwQmL7GrWAYHw@mail.gmail.com>
 <CAKMK7uHi+mG0z0HUmNt13QCCvutuRVjpcR0NjRL12k-WbWzkRg@mail.gmail.com>
In-Reply-To: <CAKMK7uHi+mG0z0HUmNt13QCCvutuRVjpcR0NjRL12k-WbWzkRg@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 3 Feb 2021 22:25:11 +0100
Message-ID: <CAKMK7uETu_m+=MHyPmqBbEP__qjMF_wmr4c2BiVTPcwE8c+5Mg@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] mm: replace BUG_ON in vm_insert_page
 with a return of an error
To: Suren Baghdasaryan <surenb@google.com>
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
Cc: Christoph Hellwig <hch@infradead.org>, Sandeep Patil <sspatil@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>,
 Robin Murphy <robin.murphy@arm.com>, James Jones <jajones@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Minchan Kim <minchan@kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Android Kernel Team <kernel-team@android.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 3, 2021 at 9:29 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Wed, Feb 3, 2021 at 9:20 PM Suren Baghdasaryan <surenb@google.com> wrote:
> >
> > On Wed, Feb 3, 2021 at 12:52 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > >
> > > On Wed, Feb 3, 2021 at 2:57 AM Matthew Wilcox <willy@infradead.org> wrote:
> > > >
> > > > On Tue, Feb 02, 2021 at 04:31:33PM -0800, Suren Baghdasaryan wrote:
> > > > > Replace BUG_ON(vma->vm_flags & VM_PFNMAP) in vm_insert_page with
> > > > > WARN_ON_ONCE and returning an error. This is to ensure users of the
> > > > > vm_insert_page that set VM_PFNMAP are notified of the wrong flag usage
> > > > > and get an indication of an error without panicing the kernel.
> > > > > This will help identifying drivers that need to clear VM_PFNMAP before
> > > > > using dmabuf system heap which is moving to use vm_insert_page.
> > > >
> > > > NACK.
> > > >
> > > > The system may not _panic_, but it is clearly now _broken_.  The device
> > > > doesn't work, and so the system is useless.  You haven't really improved
> > > > anything here.  Just bloated the kernel with yet another _ONCE variable
> > > > that in a normal system will never ever ever be triggered.
> > >
> > > Also, what the heck are you doing with your drivers? dma-buf mmap must
> > > call dma_buf_mmap(), even for forwarded/redirected mmaps from driver
> > > char nodes. If that doesn't work we have some issues with the calling
> > > contract for that function, not in vm_insert_page.
> >
> > The particular issue I observed (details were posted in
> > https://lore.kernel.org/patchwork/patch/1372409) is that DRM drivers
> > set VM_PFNMAP flag (via a call to drm_gem_mmap_obj) before calling
> > dma_buf_mmap. Some drivers clear that flag but some don't. I could not
> > find the answer to why VM_PFNMAP is required for dmabuf mappings and
> > maybe someone can explain that here?
> > If there is a reason to set this flag other than historical use of
> > carveout memory then we wanted to catch such cases and fix the drivers
> > that moved to using dmabuf heaps. However maybe there are other
> > reasons and if so I would be very grateful if someone could explain
> > them. That would help me to come up with a better solution.
> >
> > > Finally why exactly do we need to make this switch for system heap?
> > > I've recently looked at gup usage by random drivers, and found a lot
> > > of worrying things there. gup on dma-buf is really bad idea in
> > > general.
> >
> > The reason for the switch is to be able to account dmabufs allocated
> > using dmabuf heaps to the processes that map them. The next patch in
> > this series https://lore.kernel.org/patchwork/patch/1374851
> > implementing the switch contains more details and there is an active
> > discussion there. Would you mind joining that discussion to keep it in
> > one place?
>
> How many semi-unrelated buffer accounting schemes does google come up with?
>
> We're at three with this one.
>
> And also we _cannot_ required that all dma-bufs are backed by struct
> page, so requiring struct page to make this work is a no-go.
>
> Second, we do not want to all get_user_pages and friends to work on
> dma-buf, it causes all kinds of pain. Yes on SoC where dma-buf are
> exclusively in system memory you can maybe get away with this, but
> dma-buf is supposed to work in more places than just Android SoCs.

I just realized that vm_inser_page doesn't even work for CMA, it would
upset get_user_pages pretty badly - you're trying to pin a page in
ZONE_MOVEABLE but you can't move it because it's rather special.
VM_SPECIAL is exactly meant to catch this stuff.
-Daniel

> If you want to account dma-bufs, and gpu memory in general, I'd say
> the solid solution is cgroups. There's patches floating around. And
> given that Google Android can't even agree internally on what exactly
> you want I'd say we just need to cut over to that and make it happen.
>
> Cheers, Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
