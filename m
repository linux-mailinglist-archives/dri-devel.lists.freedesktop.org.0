Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B283286584
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 19:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C874F6E974;
	Wed,  7 Oct 2020 17:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E806E974
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 17:12:36 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id d28so2963071ote.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 10:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ds2b6pt8mpuSnK1WqusZcK5IPcMpzyRXiJsNhW5qyYM=;
 b=XywxnLHwupjUJptE/EVD6sBBvmwp1LZdLWVQN7sGbbfMYl92hBOlZr7ZFS4X+E/amg
 opzvB15wo+wkKlQcyzXYRqNCcc6ZTwDvf0ncSkJzjaY9dJ7cef2oaD3bBKharNZqlUDk
 SK2SYwy12YuTYhWzjRrLHd7+bMmqCT/EcoV/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ds2b6pt8mpuSnK1WqusZcK5IPcMpzyRXiJsNhW5qyYM=;
 b=sTlhf8xq/32i5H66B2DfpfiCcw1l97991v0rsVKM+hiYB9otXLoJJd+Dbd+ftd/1Ru
 tD+n/SDyDUV5VOtWDjEbsfQ2arwbDFUZZGojVcqDrF2tG8gSK8jVIfOkR6kDgt0uAIAm
 x+G6RdN/JpBUhPbXJCSLFZG8xLOvj3hXX7axDPTlz3UNsd9iZ3VvjhVGp2UlP1pkck2w
 9m/H087VTwa0ZUBPPCjJv0g9KyRor1wN2dIMRzgPQNaj256qiiJ90VnsZLjlUaehlqV+
 rOXVgy1WnX83PKwVCJ6PRkykI2AUVDUUlCNIDBIXk7Zid17NTvulI48QVLVBlZH7OYs3
 fw7g==
X-Gm-Message-State: AOAM5305dmSLg7eJhkTYUaeOmi8ELBVpwrh/cOi5krOWeVthG+RX+a6p
 prAdty8W4rH4gG7aHESgCZOgKj4T+5ZG9qsSDZgxrg==
X-Google-Smtp-Source: ABdhPJzTO+z2ObbheXgto8t7rJhDCsKMuOtKVLpylgXo93WqdqDznkfE8ic3+XhZYxCrctCNbkyO32BPlJ+tqH+Wfoo=
X-Received: by 2002:a05:6830:1c3c:: with SMTP id
 f28mr2639345ote.188.1602090755973; 
 Wed, 07 Oct 2020 10:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-6-daniel.vetter@ffwll.ch>
 <20201007165316.GT5177@ziepe.ca>
In-Reply-To: <20201007165316.GT5177@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 7 Oct 2020 19:12:24 +0200
Message-ID: <CAKMK7uGTpZcHwrBNQOXwzDAzyfSgoLSt_Dae_3hMRE2xwGx+GA@mail.gmail.com>
Subject: Re: [PATCH 05/13] mm/frame-vector: Use FOLL_LONGTERM
To: Jason Gunthorpe <jgg@ziepe.ca>
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
 linux-s390@vger.kernel.org,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Pawel Osciak <pawel@osciak.com>, kvm@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
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

On Wed, Oct 7, 2020 at 6:53 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Wed, Oct 07, 2020 at 06:44:18PM +0200, Daniel Vetter wrote:
> >
> > -     /*
> > -      * While get_vaddr_frames() could be used for transient (kernel
> > -      * controlled lifetime) pinning of memory pages all current
> > -      * users establish long term (userspace controlled lifetime)
> > -      * page pinning. Treat get_vaddr_frames() like
> > -      * get_user_pages_longterm() and disallow it for filesystem-dax
> > -      * mappings.
> > -      */
> > -     if (vma_is_fsdax(vma)) {
> > -             ret = -EOPNOTSUPP;
> > -             goto out;
> > -     }
> > -
> > -     if (!(vma->vm_flags & (VM_IO | VM_PFNMAP))) {
> > -             vec->got_ref = true;
> > -             vec->is_pfns = false;
> > -             ret = pin_user_pages_locked(start, nr_frames,
> > -                     gup_flags, (struct page **)(vec->ptrs), &locked);
> > -             goto out;
> > -     }
>
> The vm_flags still need to be checked before going into the while
> loop. If the break is taken then nothing would check vm_flags

Hm right that's a bin inconsistent. follow_pfn also checks for this,
so I think we can just ditch this entirely both here and in the do {}
while () check, simplifying the latter to just while (vma). Well, just
make it a real loop with less confusing control flow probably.

Or prefer I keep this and touch the code less?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
