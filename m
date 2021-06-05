Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D02439C490
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jun 2021 02:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38426E43A;
	Sat,  5 Jun 2021 00:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA366E43A
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jun 2021 00:41:16 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id p20so13746623ljj.8
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 17:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S0RNl1ValKKRLQbUx9zapSSxQl8HE3O+Grx55QC8BB8=;
 b=ojqlPcYN//lzjPCK23tdLtRIIYrgW9m/5kJ/xOjRInCF4R7iFC1/I0ZkVLmxGV8DXR
 MQWb07lHHZMwwI3mGCRqMAesfKm1mWvsT1fKDr2EyaZCEGoXBk5MRscqdZbVrfjd6byB
 UC2OAmXNTjZ1XXqU2QIkZUr+320CRdtEbj7InexW97stnDZxR/A2mRYURCjA4zPGoT8h
 zZKD7TJ6uy/9jzID2bu4rxwrKqn/bYNh5LMyz+lefblMFpIWrDYNy/UqqVnv9iY+GCYm
 zCIocFSTC5JEnil58sWiJDJ+0EtmDGYceal8ew26Jn/vZJQwmrzF2MxxEU2hsojtFjNK
 mK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S0RNl1ValKKRLQbUx9zapSSxQl8HE3O+Grx55QC8BB8=;
 b=Iiu86uRF++AFsfgaRxklMZsPv5tjUAMZ0t/5pbF9eW6lkGKl0l4miuqb2V/5VVBifK
 yrQ+GB3XbOQ9vNO6bVsrXriLm+haLV1HBr6acKNDs88Sn8afvUcQi3NVPYO0+PpAzN6u
 UlBQ0ybNFOK2ga7Nf+kekiwbjXEE4aLQzaESKOT1egQcZt7cOkJ0W+oj4BtMnZT4jwGr
 xLlF3Cu2jPovBPoE5NiagM+GDUgnRkhFH3cvjdTPd2jS6mbGTF3Ht7FGADEkgBV+UPGK
 E2gTqqpSn7WPv9c49IgrqLipCcNxTGGhygt3xagZOO2bZ0SJWJLqjpBQVteNRaK5mSU1
 gvzg==
X-Gm-Message-State: AOAM530UkdYa0P63pRHwu7hTEp6f0i2LQKCQ+hv091h/Ti+Aa8GZeJpO
 fDILrdHvui/tm4NzVQw+cjzfEVnx0x/nrxpoASzaKQ==
X-Google-Smtp-Source: ABdhPJz1RZbFciQV1FijFF60AoPQ2WRU7bGHglkLlwJI2jhHqLCKOZ4khT7GPCOGC1aZRVomGnuidnciWbK1dWihUSA=
X-Received: by 2002:a05:651c:292:: with SMTP id
 b18mr5197181ljo.456.1622853674402; 
 Fri, 04 Jun 2021 17:41:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210524132725.12697-1-apopple@nvidia.com>
 <20210524132725.12697-4-apopple@nvidia.com>
 <20210525183710.fa2m2sbfixnhz7g5@revolver>
 <CALvZod5T1yjOk48Q_efppvP6iQWnSUwdOQL=G9TadrB6nS-s4Q@mail.gmail.com>
 <20210604204934.sbspsmwdqdtmz73d@revolver>
In-Reply-To: <20210604204934.sbspsmwdqdtmz73d@revolver>
From: Shakeel Butt <shakeelb@google.com>
Date: Fri, 4 Jun 2021 17:41:03 -0700
Message-ID: <CALvZod6myLUu0j13=nn2vCbH7kQJ4yXs06=0+pZYie2ZN13Mxw@mail.gmail.com>
Subject: Re: [PATCH v9 03/10] mm/rmap: Split try_to_munlock from try_to_unmap
To: Liam Howlett <liam.howlett@oracle.com>
Content-Type: text/plain; charset="UTF-8"
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
 Alistair Popple <apopple@nvidia.com>, "hughd@google.com" <hughd@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "jhubbard@nvidia.com" <jhubbard@nvidia.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 4, 2021 at 1:49 PM Liam Howlett <liam.howlett@oracle.com> wrote:
>
> * Shakeel Butt <shakeelb@google.com> [210525 19:45]:
> > On Tue, May 25, 2021 at 11:40 AM Liam Howlett <liam.howlett@oracle.com> wrote:
> > >
> > [...]
> > > >
> > > > +/*
> > > > + * Walks the vma's mapping a page and mlocks the page if any locked vma's are
> > > > + * found. Once one is found the page is locked and the scan can be terminated.
> > > > + */
> > >
> > > Can you please add that this requires the mmap_sem() lock to the
> > > comments?
> > >
> >
> > Why does this require mmap_sem() lock? Also mmap_sem() lock of which mm_struct?
>
>
> Doesn't the mlock_vma_page() require the mmap_sem() for reading?  The
> mm_struct in vma->vm_mm;
>

We are traversing all the vmas where this page is mapped of possibly
different mm_structs. I don't think we want to take mmap_sem() of all
those mm_structs. The commit b87537d9e2fe ("mm: rmap use pte lock not
mmap_sem to set PageMlocked") removed exactly that.

>
> From what I can see, at least the following paths have mmap_lock held
> for writing:
>
> munlock_vma_pages_range() from __do_munmap()
> munlokc_vma_pages_range() from remap_file_pages()
>

The following path does not hold mmap_sem:

exit_mmap() -> munlock_vma_pages_all() -> munlock_vma_pages_range().

I would really suggest all to carefully read the commit message of
b87537d9e2fe ("mm: rmap use pte lock not mmap_sem to set
PageMlocked").

Particularly the following paragraph:
...
    Vlastimil Babka points out another race which this patch protects against.
     try_to_unmap_one() might reach its mlock_vma_page() TestSetPageMlocked a
    moment after munlock_vma_pages_all() did its Phase 1 TestClearPageMlocked:
    leaving PageMlocked and unevictable when it should be evictable.  mmap_sem
    is ineffective because exit_mmap() does not hold it; page lock ineffective
    because __munlock_pagevec() only takes it afterwards, in Phase 2; pte lock
    is effective because __munlock_pagevec_fill() takes it to get the page,
    after VM_LOCKED was cleared from vm_flags, so visible to try_to_unmap_one.
...

Alistair, please bring back the VM_LOCKED check with pte lock held and
the comment "Holding pte lock, we do *not* need mmap_lock here".

One positive outcome of this cleanup patch is the removal of
unnecessary invalidation (unmapping for kvm case) of secondary mmus.
